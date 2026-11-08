unit untPesquisaGenerica;

interface

type
  // Chamado inclusive ao cancelar: Selecionou=False e Codigo=''.
  TRetornoPesquisa = reference to procedure(const Codigo: string; Selecionou: Boolean);

  TConfiguracaoPesquisa = record
    Titulo: string;
    SQL: string; // SELECT externo com alias tab, sem WHERE/ORDER BY externos.

    // §48: colunas na MESMA ORDEM do SetaGrid - o grid do lookup e POSICIONAL

    // (dataIndex "0","1","2" no cliente; coluna i = campo i do dataset).

    // Ordem do SELECT != ordem do SetaGrid => dados desalinham sob titulos certos.
    CampoChave: string;
    CamposPesquisa: string; // Campos separados por ; e chave por ultimo.
    Ordem: string; // Exemplo: tab.DESCRICAO
    OrdensDisponiveis: string; // Codigo=tab.CODIGO;Descricao=tab.DESCRICAO
    TextoInicial: string;
    Colunas: array of string; // Posicao|CAMPO|Titulo|Largura
    ColunasProporcionais: Boolean; // False: pixels; True: preencher largura do grid.
    procedure SetaGrid(const Definicoes: array of string);
  end;

procedure PesquisarCadastro(const Cadastro: string;               const AoFechar: TRetornoPesquisa); overload;
procedure PesquisarCadastro(const Config: TConfiguracaoPesquisa;  const AoFechar: TRetornoPesquisa); overload;

implementation

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, uniComboBox, uniLabel,
  uniDBGrid, MainModule, untDM_RC, untFrmLookUp;

type
  TSeletorOrdem = class(TComponent)
  private
    FForm: TfrmLookUp;
    FCombo: TUniComboBox;
    FOrdens: TStringList;
    FLargura: Integer;
    FEspacoReservado: Boolean;
    FBackupGrid: TUniDBGrid;
    FBuscaOriginal: TNotifyEvent;
    FTeclaOriginal: TKeyEvent;
    FProporcionais: Boolean;
    FColunas: array of string;
    procedure Alterar(Sender: TObject);
    procedure Buscar(Sender: TObject);
    procedure Tecla(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AplicarLarguras;
    procedure ConfigurarGrid(const Config: TConfiguracaoPesquisa);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Configurar(Form: TfrmLookUp; const Config: TConfiguracaoPesquisa);
  end;

  TEstadoPesquisa = record
    Tag: Integer;
    PK, Campos, Codigo, Selecionado, Link, Filtro, Extra, Ordem, SQL: string;
    procedure Capturar;
    procedure Restaurar;
  end;

procedure TConfiguracaoPesquisa.SetaGrid(const Definicoes: array of string);
var I: Integer;
begin
  SetLength(Colunas,Length(Definicoes));
  for I:=0 to High(Definicoes) do Colunas[I]:=Definicoes[I];
end;

constructor TSeletorOrdem.Create(AOwner: TComponent);
begin
  inherited;
  FOrdens:=TStringList.Create;
end;

destructor TSeletorOrdem.Destroy;
begin
  if Assigned(FForm) and FEspacoReservado then
    FForm.edSearchCRUD1.Width:=FForm.edSearchCRUD1.Width+150;
  if Assigned(FForm) and Assigned(FBackupGrid) then
  begin
    FForm.btnLkpSearch.OnClick:=FBuscaOriginal;
    FForm.edSearchCRUD1.OnKeyDown:=FTeclaOriginal;
    FForm.dbgSearchCRUDLookUp.Columns.Assign(FBackupGrid.Columns);
    FForm.dbgSearchCRUDLookUp.ForceFit:=FBackupGrid.ForceFit;
  end;
  if Assigned(FForm) then FForm.RemoveFreeNotification(Self);
  FreeAndNil(FCombo);
  FreeAndNil(FBackupGrid);
  FOrdens.Free;
  inherited;
end;

procedure TSeletorOrdem.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if Operation=opRemove then
  begin
    if AComponent=FForm then FForm:=nil;
    if AComponent=FCombo then FCombo:=nil;
    if AComponent=FBackupGrid then FBackupGrid:=nil;
  end;
end;

procedure TSeletorOrdem.Configurar(Form: TfrmLookUp;
  const Config: TConfiguracaoPesquisa);
var Lista: TStringList; I, Padrao: Integer; Rotulo, Expressao: string;
begin
  FForm:=Form;
  FForm.FreeNotification(Self);
  ConfigurarGrid(Config);
  if Trim(Config.OrdensDisponiveis)='' then Exit;
  Lista:=TStringList.Create;
  try
    Lista.StrictDelimiter:=True;
    Lista.Delimiter:=';';
    Lista.DelimitedText:=Config.OrdensDisponiveis;
    Padrao:=0;
    FCombo:=TUniComboBox.Create(Form);
    FCombo.FreeNotification(Self);
    for I:=0 to Lista.Count-1 do
    begin
      Rotulo:=Trim(Lista.Names[I]);
      Expressao:=Trim(Lista.ValueFromIndex[I]);
      if (Rotulo='') or (Expressao='') then
        raise Exception.Create('Use Rotulo=tab.CAMPO nas opcoes de ordenacao.');
      FCombo.Items.Add(Rotulo);
      FOrdens.Add(Expressao);
      if SameText(Expressao,Trim(Config.Ordem)) then Padrao:=I;
    end;
    if FOrdens.Count=0 then Exit;
    FForm:=Form;
    FLargura:=Form.edSearchCRUD1.Width;
    FCombo.Parent:=Form.rcBlock10;
    FCombo.SetBounds(Form.edSearchCRUD1.Left+FLargura-140,
      Form.edSearchCRUD1.Top,140,Form.edSearchCRUD1.Height);
    FCombo.Anchors:=[akRight,akBottom];
    FCombo.Style:=csDropDownList;
    FCombo.Hint:='Ordenar por';
    FCombo.ShowHint:=True;
    FCombo.ItemIndex:=Padrao;
    Form.edSearchCRUD1.Width:=FLargura-150;
    FEspacoReservado:=True;
    FCombo.OnChange:=Alterar;
    mm.varC_Order:=' ORDER BY '+FOrdens[Padrao];
  finally Lista.Free; end;
end;

procedure TSeletorOrdem.ConfigurarGrid(const Config: TConfiguracaoPesquisa);
var P: TStringList; I, Posicao, Largura: Integer;
    Usados: array of Boolean;
begin
  if Length(Config.Colunas)=0 then Exit;
  SetLength(FColunas,Length(Config.Colunas));
  SetLength(Usados,Length(Config.Colunas));
  P:=TStringList.Create;
  try
    P.StrictDelimiter:=True; P.Delimiter:='|';
    // Validar tudo antes de alterar o grid compartilhado.
    for I:=0 to High(Config.Colunas) do
    begin
      P.DelimitedText:=Config.Colunas[I];
      if P.Count<>4 then
        raise Exception.Create('Coluna invalida. Use Posicao|CAMPO|Titulo|Largura.');
      if not TryStrToInt(P[0],Posicao) then
        raise Exception.Create('A posicao da coluna deve ser numerica.');
      if (Posicao<0) or (Posicao>=Length(Config.Colunas)) then
        raise Exception.Create('As posicoes devem iniciar em zero e ser consecutivas.');
      if Usados[Posicao] then raise Exception.Create('Posicao de coluna repetida.');
      if Trim(P[1])='' then raise Exception.Create('Informe o campo da coluna.');
      if not TryStrToInt(P[3],Largura) then
        raise Exception.Create('A largura da coluna deve ser numerica.');
      if Largura<=0 then raise Exception.Create('A largura deve ser maior que zero.');
      Usados[Posicao]:=True;
      FColunas[Posicao]:=Config.Colunas[I];
    end;
    FBackupGrid:=TUniDBGrid.Create(FForm);
    FBackupGrid.FreeNotification(Self);
    FBackupGrid.Columns.Assign(FForm.dbgSearchCRUDLookUp.Columns);
    FBackupGrid.ForceFit:=FForm.dbgSearchCRUDLookUp.ForceFit;
    FBuscaOriginal:=FForm.btnLkpSearch.OnClick;
    FTeclaOriginal:=FForm.edSearchCRUD1.OnKeyDown;
    FProporcionais:=Config.ColunasProporcionais;
    FForm.dbgSearchCRUDLookUp.Columns.BeginUpdate;
    try
      FForm.dbgSearchCRUDLookUp.Columns.Clear;
      for I:=0 to High(FColunas) do
      begin
        P.DelimitedText:=FColunas[I];
        FForm.dbgSearchCRUDLookUp.Columns.Add;
        with FForm.dbgSearchCRUDLookUp.Columns[I] do
        begin
          FieldName:=Trim(P[1]);
          Title.Caption:=P[2];
          Width:=StrToInt(P[3]);
        end;
      end;
    finally FForm.dbgSearchCRUDLookUp.Columns.EndUpdate; end;
    FForm.btnLkpSearch.OnClick:=Buscar;
    FForm.edSearchCRUD1.OnKeyDown:=Tecla;
  finally P.Free; end;
end;

procedure TSeletorOrdem.AplicarLarguras;
var I: Integer; P: TStringList;
begin
  // O lookup muda ForceFit ao final de cada pesquisa. Aplicar depois dele.
  FForm.dbgSearchCRUDLookUp.ForceFit:=FProporcionais;
  P:=TStringList.Create;
  try
    P.StrictDelimiter:=True; P.Delimiter:='|';
    for I:=0 to High(FColunas) do
    begin
      P.DelimitedText:=FColunas[I];
      if dm_rc.sqlLookUpSearch.Active and
         (dm_rc.sqlLookUpSearch.FindField(Trim(P[1]))=nil) then
        raise Exception.Create('Campo da coluna nao encontrado no SELECT: '+P[1]);
      FForm.dbgSearchCRUDLookUp.Columns[I].Title.Caption:=P[2];
      FForm.dbgSearchCRUDLookUp.Columns[I].Width:=StrToInt(P[3]);
    end;
  finally P.Free; end;
end;

procedure TSeletorOrdem.Buscar(Sender: TObject);
begin
  if Assigned(FBuscaOriginal) then FBuscaOriginal(Sender);
  AplicarLarguras;
end;

procedure TSeletorOrdem.Tecla(Sender: TObject; var Key: Word; Shift: TShiftState);
var Enter: Boolean;
begin
  Enter:=Key=13;
  if Assigned(FTeclaOriginal) then FTeclaOriginal(Sender,Key,Shift);
  if Enter then AplicarLarguras;
end;

procedure TSeletorOrdem.Alterar(Sender: TObject);
begin
  if (FCombo.ItemIndex<0) or (FCombo.ItemIndex>=FOrdens.Count) then Exit;
  mm.varC_Order:=' ORDER BY '+FOrdens[FCombo.ItemIndex];
  FForm.btnLkpSearch.Click;
end;

procedure TEstadoPesquisa.Capturar;
begin
  Tag:=mm.varI_FrmLookUpTag;
  PK:=mm.varC_Field_PK;
  Campos:=mm.varC_Search_Fields;
  Codigo:=mm.varC_Lookup_Code;
  Selecionado:=mm.varC_SelectedItem_LookUp;
  Link:=mm.varC_TempLink;
  Filtro:=mm.varC_Where;
  Extra:=mm.varC_WhereExtra;
  Ordem:=mm.varC_Order;
  SQL:=mm.varC_SQL_Default_LookUps;
end;

procedure TEstadoPesquisa.Restaurar;
begin
  mm.varI_FrmLookUpTag:=Tag;
  mm.varC_Field_PK:=PK;
  mm.varC_Search_Fields:=Campos;
  mm.varC_Lookup_Code:=Codigo;
  mm.varC_SelectedItem_LookUp:=Selecionado;
  mm.varC_TempLink:=Link;
  mm.varC_Where:=Filtro;
  mm.varC_WhereExtra:=Extra;
  mm.varC_Order:=Ordem;
  mm.varC_SQL_Default_LookUps:=SQL;
end;

procedure PesquisarCadastro(const Cadastro: string; const AoFechar: TRetornoPesquisa);
var C: TConfiguracaoPesquisa; Nome, Schema: string;
begin
  C:=Default(TConfiguracaoPesquisa);
  Nome:=UpperCase(Trim(Cadastro));
  Schema:=dm_rc.rc_DBSchema;
  C.CampoChave:='CODIGO';
  if Nome='PRODUTOS' then
  begin
    C.Titulo:='Pesquisa de Produtos';
    C.SetaGrid(['0|CODIGO|Código|80','1|DESCRICAO|Descrição|350','2|VENDA|Preço de venda|120']);
    C.ColunasProporcionais:=True;
    C.CamposPesquisa:='DESCRICAO;CODIGO';
    C.Ordem:='tab.DESCRICAO';
    C.OrdensDisponiveis:='Codigo=tab.CODIGO;Descricao=tab.DESCRICAO';
    C.SQL:='SELECT tab.CODIGO,tab.DESCRICAO,tab.VENDA FROM ('+
      'SELECT P.CODIGO,P.DESCRICAO,S.VENDA FROM '+Schema+'PRODUTOS P '+
      'INNER JOIN '+Schema+'SALDOS S ON S.PRODUTO=P.CODIGO '+
      'WHERE S.EMPRESA='+IntToStr(mm.varI_Code_Company)+') tab';
  end
  else if Nome='FUNCIONARIOS' then
  begin
    C.Titulo:='Pesquisa de Funcionários';
    C.SetaGrid(['0|CODIGO|Código|80','1|NOME|Nome|350']);
    C.ColunasProporcionais:=True;
    C.CamposPesquisa:='NOME;CODIGO';
    C.Ordem:='tab.NOME';
    C.OrdensDisponiveis:='Codigo=tab.CODIGO;Nome=tab.NOME';
    C.SQL:='SELECT tab.CODIGO,tab.NOME FROM '+Schema+'FUNCIONARIOS tab';
  end

  else if Nome='PESSOAS' then
  begin
    C.Titulo:='Pesquisa de Pessoas';
    C.SetaGrid(['0|CODIGO|Código|80','1|NOME|Nome|350','2|CPFCNPJ|CPF/CNPJ|150','3|CIDADE|Cidade|150','4|ESTADO|UF|60']);
    C.ColunasProporcionais:=True;
    C.CamposPesquisa:='NOME;CODIGO';
    C.Ordem:='tab.NOME';
    C.OrdensDisponiveis:='Codigo=tab.CODIGO;Nome=tab.NOME';
    // §48: ordem do SELECT = ordem do SetaGrid. ATIVO=T herdado da busca 3.0.
    C.SQL:='SELECT tab.CODIGO,tab.NOME,tab.CPFCNPJ,tab.CIDADE,tab.ESTADO FROM '+
      Schema+'PESSOAS tab WHERE tab.ATIVO='+QuotedStr('T');
  end

  else if Nome='TRANSPORTES' then
  begin
    C.Titulo:='Pesquisa de Transportadores';
    C.SetaGrid(['0|CODIGO|Código|80','1|NOME|Nome|350','2|CPFCNPJ|CPF/CNPJ|150']);
    C.ColunasProporcionais:=True;
    C.CamposPesquisa:='NOME;CODIGO';
    C.Ordem:='tab.NOME';
    C.OrdensDisponiveis:='Codigo=tab.CODIGO;Nome=tab.NOME';
    C.SQL:='SELECT tab.CODIGO,tab.NOME,tab.CPFCNPJ FROM '+Schema+'TRANSPORTES tab';
  end
  else if Nome='CIDADES' then
  begin
    C.Titulo:='Pesquisa de Cidades';
    C.SetaGrid(['0|CODIIBGE|Código IBGE|100','1|DESCRICAO|Cidade|350','2|UF|UF|60']);
    C.ColunasProporcionais:=True;
    C.CampoChave:='CODIIBGE';
    C.CamposPesquisa:='DESCRICAO;CODIIBGE';
    C.Ordem:='tab.DESCRICAO';
    C.OrdensDisponiveis:='Codigo IBGE=tab.CODIIBGE;Descricao=tab.DESCRICAO;UF=tab.UF';
    C.SQL:='SELECT tab.CODIIBGE,tab.DESCRICAO,tab.UF FROM '+Schema+'CIDADES tab';
  end
  else if Nome='NOTAELETRONICA' then
  begin
    C.Titulo:='Pesquisa de Nfe';
    C.SetaGrid([
      '0|CODIGO|Código|50',
      '1|NUMERO|Número|100',
      '2|EMPRESA|Empresa|50',
      '3|NOME|Nome|300',
      '4|ESTADO|UF|50',
      '5|VLRTOTAL|Total|150'
    ]);


    C.ColunasProporcionais:=True;
    C.CampoChave:='CODIGO';
    C.CamposPesquisa := 'NUMERO;NOME;CODIGO';

    C.Ordem := 'tab.NUMERO DESC';

    C.OrdensDisponiveis :=
    'Código=tab.CODIGO DESC;' +
    'Número=tab.NUMERO DESC;' +
    'Nome=tab.NOME';

    C.SQL:='SELECT tab.CODIGO,tab.NUMERO,tab.EMPRESA, ' +
           'tab.NOME,tab.ESTADO, tab.VLRTOTAL FROM ( ' +
           ' SELECT P.CODIGO, P.NUMERO, P.EMPRESA, ' +
           ' PES.NOME, PES.ESTADO, P.VLRTOTAL ' +
           ' FROM ' +Schema+'MVMESTRE P ' +
           ' INNER JOIN '+Schema+'PESSOAS PES ' +
           ' ON P.PESSOA = PES.CODIGO '  +
           ' WHERE P.EMPRESA = ' + IntToStr(mm.varI_Code_Company) +
           '    AND P.CANCELADA = ' + QuotedStr('A') +
           ') tab';
  end
  else
    raise Exception.Create('Pesquisa nao configurada: '+Cadastro+
      '. Cadastre sua consulta em untPesquisaGenerica ou informe TConfiguracaoPesquisa.');
  PesquisarCadastro(C,AoFechar);
end;

procedure PesquisarCadastro(const Config: TConfiguracaoPesquisa;  const AoFechar: TRetornoPesquisa);
const NomeTrava='PesquisaGenericaEmAndamento';
var
  Pesquisa: TfrmLookUp;
  Trava: TSeletorOrdem;
  Anterior: TEstadoPesquisa;
  Concluida: Boolean;
begin
  if not Assigned(AoFechar) then
    raise Exception.Create('Informe a rotina de retorno da pesquisa.');
  if (Trim(Config.SQL)='') or (Trim(Config.CampoChave)='') or
     (Trim(Config.CamposPesquisa)='') then
    raise Exception.Create('Informe SQL, campo chave e campos de pesquisa.');
  if mm.FindComponent(NomeTrava)<>nil then
    raise Exception.Create('Ja existe uma pesquisa aberta nesta sessao.');
  Pesquisa:=frmLookUp;
  if Pesquisa.Visible then
    raise Exception.Create('Conclua a pesquisa atual antes de abrir outra.');
  Anterior.Capturar;
  Trava:=TSeletorOrdem.Create(mm); // Uma trava por sessao, nunca global ao servidor.
  Concluida:=False;
  try
    Trava.Name:=NomeTrava;
    Pesquisa.Caption:=Config.Titulo;
    Pesquisa.ed_Lkp.Hint:='[[ searchall ]]';
    Pesquisa.btnLkpSearch.Tag:=0;
    Pesquisa.dbgSearchCRUDLookUp.Tag:=0;
    Pesquisa.dbgSearchCRUDLookUp.Hint:=
      '[[fieldmasks:grid-resize|grid-paginator:center|]]';
    mm.varI_FrmLookUpTag:=0;
    mm.varC_Field_PK:=Config.CampoChave;
    mm.varC_Search_Fields:=Config.CamposPesquisa;
    mm.varC_Lookup_Code:='_ESC_';
    mm.varC_SelectedItem_LookUp:='';
    mm.varC_TempLink:=Config.TextoInicial;
    mm.varC_Where:='';
    mm.varC_WhereExtra:='';
    mm.varC_Order:='';
    if Trim(Config.Ordem)<>'' then mm.varC_Order:=' ORDER BY '+Config.Ordem;
    mm.varC_SQL_Default_LookUps:=Config.SQL;
    Trava.Configurar(Pesquisa,Config);
    Pesquisa.ShowModal(
      procedure(Sender: System.Classes.TComponent; AResult: Integer)
      var Codigo: string; Selecionou: Boolean;
      begin
        if Concluida then Exit;
        Concluida:=True;
        Codigo:=mm.varC_Lookup_Code;
        Selecionou:=(Codigo<>'') and (Codigo<>'_ESC_');
        if not Selecionou then Codigo:='';
        // Restaurar antes do retorno permite abrir outra pesquisa no callback.
        Anterior.Restaurar;
        Trava.Free;
        AoFechar(Codigo,Selecionou);
      end);
  except
    if not Concluida then
    begin
      Concluida:=True;
      Anterior.Restaurar;
      Trava.Free;
    end;
    raise;
  end;
end;

end.

