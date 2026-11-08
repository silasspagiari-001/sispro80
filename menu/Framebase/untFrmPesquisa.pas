unit untFrmPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniTimer, uniButton, uniBitBtn,
  uniBasicGrid, uniDBGrid, uniLabel, uniEdit, uniPanel, uniMultiItem,
  uniComboBox, Data.DB,mkm_funcoes;

type
  TfrmPesquisa = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    edSearchCRUDconteudo: TUniEdit;
    UniLabelv1: TUniLabel;
    rcBlock40: TUniContainerPanel;
    dbgSearchCRUD: TUniDBGrid;
    paTotreg: TUniContainerPanel;
    labTotReg: TUniLabel;
    rcBlock20: TUniContainerPanel;
    btnLkpSearch: TUniBitBtn;
    rcBlock30: TUniContainerPanel;
    btnLkpClear: TUniBitBtn;
    cbxSearchCRUDFieldordem: TUniComboBox;
    timerClose: TUniTimer;
    procedure UniFormCreate(Sender: TObject);
    procedure btnLkpSearchClick(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnLkpClearClick(Sender: TObject);
    procedure timerCloseTimer(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    M_STR: TStringList;
    { Private declarations }
  public
    { Public declarations }
    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;
    cFormModal         : TUniForm;

    procedure Seta_Grid(F_DATASOURCE:TDataSource;F_CAMPOS:array of String);

  end;

function UniFfrmPesquisa:TfrmPesquisa;
implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uconsts, mkm_layout, mkm_func_web, untDM_RC,
  Vcl.Clipbrd, mkm_anim;


function UniFfrmPesquisa:TfrmPesquisa;
begin
  Result := TfrmPesquisa(mm.GetFormInstance(TfrmPesquisa));
end;

procedure TfrmPesquisa.btnLkpClearClick(Sender: TObject);
begin
  if not dm_rc.sqlpesquisa.Active or dm_rc.sqlpesquisa.IsEmpty then
    Exit;
  if StrContains('CBNEF',MM.varC_referencia_busca) then
    mm.varC_codigo_busca := dm_rc.sqlpesquisa.FindField('CODCBNEF').AsString;

  if StrContains('PORTADORES#FUNCIONARIOS#PESSOAS#HISTORICO#CONDICOES#PRODUTOS#TRANSPORTES#ESPECIE#CULTIVAR#RESPONSAVEL#OPERACOES#CENTROCUSTO#'+
                 'ESCRITAS#EMPRESAS#LABORATORIO#NOTAELETRONICA#USUARIOS#GRUPOS#CUSTOLOTEINTERNO#PRODUCAOINTERNA#BARRACAO#CENTROCUSTO#CARTEIRA',MM.varC_referencia_busca) then
     mm.varC_codigo_busca := IntToStr(dm_rc.sqlpesquisa.FindField('CODIGO').AsInteger);

  if StrContains('PLANOCONTAS',MM.varC_referencia_busca) then
     mm.varC_codigo_busca := dm_rc.sqlpesquisa.FindField('PLANO').AsString;

  if StrContains('CIDADES',MM.varC_referencia_busca) then
     mm.varC_codigo_busca := dm_rc.sqlpesquisa.FindField('CODIIBGE').AsString;
  if StrContains('CEP',MM.varC_referencia_busca) then
     mm.varC_codigo_busca := dm_rc.sqlpesquisa.FindField('CEP').AsString;
  if StrContains('CBNEF',MM.varC_referencia_busca) then
     mm.varC_codigo_busca := dm_rc.sqlpesquisa.FindField('CODCBNEF').AsString;
  if StrContains('SEMENTES',MM.varC_referencia_busca) then
    begin
      mm.varC_codigo_busca             := dm_rc.sqlpesquisa.FindField('LOTE').AsString;
      mm.varI_Code_Lote_Lotesemente    := dm_rc.sqlpesquisa.FindField('LOTE').AsString;
      mm.varI_Code_Lote_Boletimsemente := dm_rc.sqlpesquisa.FindField('BOLETIM').AsString;
      mm.varI_Code_Lote_Produto        := dm_rc.sqlpesquisa.FindField('PRODUTO').AsInteger;
    end;
  if StrContains('BUSCALOTE',MM.varC_referencia_busca) then
     mm.varC_codigo_busca_lote := dm_rc.sqlpesquisa.FindField('LOTE').AsString;

  if StrContains('CAMPO',MM.varC_referencia_busca) then
    begin
      mm.varC_PRODUTO    :=  dm_rc.sqlpesquisa.FindField('PRODUTO').AsInteger;
      mm.varC_COOPERANTE :=  dm_rc.sqlpesquisa.FindField('COOPERANTE').AsInteger;
      mm.varC_CAMPO      :=  dm_rc.sqlpesquisa.FindField('CAMPO').AsString;
      mm.varC_SAFRACAMPO :=  dm_rc.sqlpesquisa.FindField('SAFRACAMPO').AsString;
      mm.varC_CULTIVAR   :=  dm_rc.sqlpesquisa.FindField('CULTIVAR').AsString;
    end;

  ModalResult := mrOK;

  dm_rc.sqlpesquisa.Close;
  timerClose.Enabled := true;
  rc_MoveAnimationForm( self,
                       self.left,
                       self.left,
                       self.top,
                       -self.Height,
                       400,
                       0 ) ;
end;

procedure TfrmPesquisa.btnLkpSearchClick(Sender: TObject);
var
  M_SQL : string;
begin

  if StrContains('CBNEF',mm.varC_referencia_busca) then
    begin
      FreeAndNil(M_STR);      M_STR :=Explode('CODIGO;CBNEF;DESCRICAO',';');
    end;

  if StrContains('CUSTOLOTEINTERNO#BARRACAO',mm.varC_referencia_busca) then
    begin
      FreeAndNil(M_STR);      M_STR :=Explode('DESCRICAO',';');
    end;

  if StrContains('PRODUCAOINTERNA',mm.varC_referencia_busca) then
    begin
      FreeAndNil(M_STR);      M_STR :=Explode('NUMERO;LOTE;PADRAO;DESCRICAO',';');
    end;

  if StrContains('CAMPO',mm.varC_referencia_busca) then
    begin
      FreeAndNil(M_STR);      M_STR :=Explode('COOPERANTE;NOME;CAMPO;PRODUTO;CULTIVAR',';');
    end;

  if StrContains('NOTAELETRONICA',mm.varC_referencia_busca) then
    begin
      FreeAndNil(M_STR);      M_STR :=Explode('NUMERO;PESSOA',';');
    end;

  if StrContains('SEMENTES#BUSCALOTE',mm.varC_referencia_busca) then
    begin
      FreeAndNil(M_STR);      M_STR :=Explode('CODIGO;LOTE;BOLETIM;TERMO;PRODUTO',';');
    end;

  if StrContains('CIDADES#CEP',mm.varC_referencia_busca) then
    begin
      FreeAndNil(M_STR);      M_STR :=Explode('DESCRICAO;UF',';');
    end;

  if StrContains('ESPECIE',mm.varC_referencia_busca) then
    begin
      FreeAndNil(M_STR);      M_STR :=Explode('CODIGO;SEMENTENOME;POPULAR',';');
    end;

  if StrContains('CULTIVAR',mm.varC_referencia_busca) then
    begin
      FreeAndNil(M_STR);      M_STR :=Explode('CODIGO;CULTIVAR',';');
    end;


  if StrContains('FUNCIONARIOS#PESSOAS#TRANSPORTES#RESPONSAVEL#EMPRESAS#LABORATORIO#USUARIOS',mm.varC_referencia_busca) then
    begin
      FreeAndNil(M_STR);      M_STR :=Explode('CODIGO;NOME',';');
    end;

  if StrContains('PORTADORES#HISTORICO#CONDICOES#OPERACOES#CENTROCUSTO#ESCRITAS#GRUPOS#CARTEIRA',mm.varC_referencia_busca) then
    begin
      FreeAndNil(M_STR);      M_STR :=Explode('CODIGO;DESCRICAO',';');
    end;

  if StrContains('PLANOCONTAS',mm.varC_referencia_busca) then
    begin
      FreeAndNil(M_STR);      M_STR :=Explode('PLANO;DESCRICAO',';');
    end;

  if StrContains('PRODUTOS',mm.varC_referencia_busca) then
    begin
      FreeAndNil(M_STR);      M_STR :=Explode('CODIGO;DESCRICAO',';');
    end;

  if MM.varC_referencia_busca = 'NOTAELETRONICA' then
    begin
      M_SQL:=' SELECT P.CODIGO, P.NUMERO, P.EMPRESA, PESSOAS.NOME, PESSOAS.ESTADO, P.VLRTOTAL FROM MVMESTRE P '                             +
             ' INNER JOIN PESSOAS ON (P.PESSOA = PESSOAS.CODIGO)        '                                                   +
             ' WHERE                                                  P.' + M_STR[cbxSearchCRUDFieldordem.ItemIndex]        +
             ' LIKE                                                     ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')    +
             ' AND P.EMPRESA   >  0                                     ' +
             ' AND P.CANCELADA =                                        ' + QuotedStr('A') +
             ' ORDER BY                                               P.' + M_STR[cbxSearchCRUDFieldordem.ItemIndex]        + ' DESC' ;
    end
  else
  if MM.varC_referencia_busca = 'PRODUTOS' then
    begin
      M_SQL:=' SELECT P.CODIGO,P.DESCRICAO,S.VENDA,S.EMPRESA FROM PRODUTOS P '                             +
             ' INNER JOIN SALDOS S ON (P.CODIGO = S.PRODUTO)         '                             +
             ' WHERE                               P.' + M_STR[cbxSearchCRUDFieldordem.ItemIndex]     +
             ' LIKE                                  ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%') +
             ' AND S.EMPRESA                       = ' + IntToStr(MM.varI_Code_Company)               +
             ' ORDER BY                            P.' + M_STR[cbxSearchCRUDFieldordem.ItemIndex];
    end
  else
  if StrContains('CIDADES#CEP',MM.varC_referencia_busca) then
    begin
      M_SQL:=' SELECT * FROM                       ' + 'CIDADES'                                +
             ' WHERE                               ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex] +
             ' like                                ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')     +
             ' ORDER BY                            ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex];
    end
  else
  if StrContains('GRPPESP',MM.varC_referencia_busca) then
    begin
      M_SQL:=' SELECT * FROM                       ' + 'GRUPOSESPECIE'                            +
             ' WHERE                               ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex]   +
             ' starting with                       ' + QuotedStr(edSearchCRUDconteudo.Text)       +
             ' ORDER BY                            ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex];
    end
  else
  if StrContains('BUSCALOTE',MM.varC_referencia_busca) then
    begin
      M_SQL:=' SELECT * FROM                       ' + 'SEMENTES'                               +
             ' WHERE                               ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex] +
             ' LIKE                                ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')     +
             ' ORDER BY                            ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex];
    end
  else
  if StrContains('CBNEF',MM.varC_referencia_busca) then
    begin
      M_SQL:=' SELECT * FROM                       ' + mm.varC_referencia_busca                        +
             ' WHERE                         upper(' + M_STR[cbxSearchCRUDFieldordem.ItemIndex]        + ')'+
             ' LIKE                          upper(' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')    + ')'+
             ' AND ATIVO                         = ' + QuotedStr('T')                                  +
             ' ORDER BY                            ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex];
    end
  else
  if StrContains('CULTIVAR#ESPECIE',MM.varC_referencia_busca) then
    begin
      M_SQL:=' SELECT * FROM                       ' + mm.varC_referencia_busca                        +
             ' WHERE                         upper(' + M_STR[cbxSearchCRUDFieldordem.ItemIndex]        + ')'+
             ' LIKE                          upper(' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')    + ')'+
             ' AND ATIVO                         = ' + QuotedStr('T')                                  +
             ' ORDER BY                            ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex];
    end
  else
  if StrContains('CAMPO',MM.varC_referencia_busca) then
    begin
      M_SQL:=
       ' select                                                         ' +
       '     ci.produto,                                                ' +
       '     ci.cultivar,                                               ' +
       '     ci.cooperante,                                             ' +
       '     c.nome,                                                    ' +
       '     ci.campo,                                                  ' +
       '     ci.area,                                                   ' +
       '     ci.producao,                                               ' +
       '     ci.safracampo                                              ' +
       '   from                                                         ' +
       '   campo c inner join campoitens ci on(ci.numero = c.codigo)    ' +
       '   where                                                  upper(' + M_STR[cbxSearchCRUDFieldordem.ItemIndex]        + ')'+
       '   LIKE                                                   upper(' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')    + ')'+
       ' ORDER BY                                                       ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex];

    end
  else
  if StrContains('CUSTOLOTEINTERNO',mm.varC_referencia_busca) then
    begin
      M_SQL:=' SELECT * FROM                       ' + 'CUSTO_LOTEINTERNO'                              +
             ' WHERE                               ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex]        +
             ' LIKE                                ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')    +
             ' AND ATIVO                         = ' + QuotedStr('T')                                  +
             ' ORDER BY                            ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex];
    end
  else
    begin
      M_SQL:=' SELECT * FROM                       ' + mm.varC_referencia_busca                        +
             ' WHERE                               ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex]        +
             ' LIKE                                ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')    +
             ' AND ATIVO                         = ' + QuotedStr('T')                                  +
             ' ORDER BY                            ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex];
    end;

  dm_rc.sqlPesquisa.Close;
  dm_rc.sqlPesquisa.SQL.Clear;
  dm_rc.sqlPesquisa.sql.add(M_SQL);
  dm_rc.sqlPesquisa.Open;

  labTotReg.Caption := IntToStr(dm_rc.sqlpesquisa.RecordCount) + ' Registro(s) Encontrado(s).'

end;

procedure TfrmPesquisa.dbgSearchCRUDDblClick(Sender: TObject);
begin
  if dm_rc.sqlPesquisa.RecordCount > 0 then
    btnLkpClear.OnClick(Self);
end;

procedure TfrmPesquisa.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if mm.varC_referencia_busca = 'PESSOAS' then
    begin
      if dm_rc.sqlPesquisa.FindField('STATUS').AsString = 'Block' then
        attribs.Font.Color:= clRed;
    end;
end;

procedure TfrmPesquisa.Seta_Grid(F_DATASOURCE: TDataSource;F_CAMPOS: array of String);
var
  M_PARAMS:TStringList;
  R       :Integer;
begin
  try
    dbgSearchCRUD.DataSource := F_DATASOURCE;
    for R:=0 to High(F_CAMPOS) do
      begin
        M_PARAMS := Explode(F_CAMPOS[R],'|');
        dbgSearchCRUD.Columns.Add;
        dbgSearchCRUD.Columns[StrToInt(M_PARAMS[0])].Visible         := True;
        dbgSearchCRUD.Columns[StrToInt(M_PARAMS[0])].FieldName       := M_PARAMS[1];
        dbgSearchCRUD.Columns[StrToInt(M_PARAMS[0])].Title.Caption   := M_PARAMS[2];
        dbgSearchCRUD.Columns[StrToInt(M_PARAMS[0])].Width           := StrToInt(M_PARAMS[3]);

        FreeAndNil(M_PARAMS);
      end;
  finally
    FreeAndNil(M_PARAMS);
  end;
end;

procedure TfrmPesquisa.timerCloseTimer(Sender: TObject);
begin
     mm.varC_Form_Modal := cFormModal ;
     timerClose.Enabled := false;
     close;
end;

procedure TfrmPesquisa.UniFormCreate(Sender: TObject);
var
   i : integer;
begin
  // sort
  dbgSearchCRUD.ClientEvents.UniEvents.Add(
       'store.afterCreate=function store.afterCreate(sender)' +
       '{ sender.setRemoteSort(false);﻿ }'
  );
  // translate messages
  case mm.varLT_Lang of

       ltpt_BR : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Falha na seleção do registro( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := ' registro(s) localizado(s)';
                 end;
       lten_US   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                 end;
       ltes_ES   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION :='Falló la selección del registro de búsqueda (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' registro(s) encontrado ';
                 end;
       ltfr_FR   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'La sélection de l''enregistrement a échoué ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'enregistrement(s) trouvé(s)';
                 end;
       ltde_DE   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Datensatzauswahl fehlgeschlagen ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'Datensatz(e) gefunden';
                 end;
       ltit_IT   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Selezione record fallita ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'record(s) trovati';
                 end;
       lttr_TR    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Kayıt seçimi başarısız( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'kayıt(lar) bulundu';
                 end;
       ltru_RU    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Ошибка выбора записи поиска (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := 'найдены записи';
                 end;
       ltzn_CH : begin

                 end;
       ltin_ID : begin

                 end;
       ltth_TH : begin

                 end;
       lthi_IN : begin

                 end;
       ltar_SA    : begin

                 end;
  end;

  cFormModal := mm.varC_Form_Modal;
  dbgSearchCRUD.Columns.Clear;

  if StrContains('CBNEF',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Codigo');
    cbxSearchCRUDFieldordem.Items.Add('CBNEF');
    cbxSearchCRUDFieldordem.Items.Add('Descrição');
    cbxSearchCRUDFieldordem.ItemIndex := 2;
  end;

  if StrContains('CBNEF',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|Código|50','1|CODCBNEF|CBNEF|100','2|DESCRICAO|Descrição|300']);
  end;

  if StrContains('CAMPO',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Cooperante');
    cbxSearchCRUDFieldordem.Items.Add('Nome');
    cbxSearchCRUDFieldordem.Items.Add('Campo');
    cbxSearchCRUDFieldordem.Items.Add('Produto');
    cbxSearchCRUDFieldordem.Items.Add('Cultivar');
    cbxSearchCRUDFieldordem.ItemIndex := 1;

    Seta_Grid(dm_rc.dsSqlPesquisa,['0|COOPERANTE|COOP.|50','1|NOME|NOME|100','2|PRODUTO|PROD.|50','3|CULTIVAR|CULTIVAR|100','4|CAMPO|CAMPO|80','5|SAFRACAMPO|SAFRA CAMPO|80','6|AREA|AREA|80','7|PRODUCAO|ESTIMATIVA|80']);

  end;

  if StrContains('CEP',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Descrição');
    cbxSearchCRUDFieldordem.Items.Add('Estado');
    cbxSearchCRUDFieldordem.ItemIndex := 0;
  end;

  if StrContains('BARRACAO',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Descrição');
    cbxSearchCRUDFieldordem.ItemIndex := 0;
  end;

  if StrContains('CUSTOLOTEINTERNO',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Descrição');
    cbxSearchCRUDFieldordem.ItemIndex := 0;
  end;


  if StrContains('SEMENTES#BUSCALOTE',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Codigo');
    cbxSearchCRUDFieldordem.Items.Add('Lote');
    cbxSearchCRUDFieldordem.Items.Add('Boletim');
    cbxSearchCRUDFieldordem.Items.Add('Termo');
    cbxSearchCRUDFieldordem.Items.Add('Produto');
    cbxSearchCRUDFieldordem.ItemIndex := 1;

    if MM.varC_referencia_busca = 'BUSCALOTE' then
      begin
        cbxSearchCRUDFieldordem.ItemIndex := 4;
        edSearchCRUDconteudo.Text         := MM.varC_referencia_produto;
      end;

  end;


  if StrContains('CIDADES',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Descrição');
    cbxSearchCRUDFieldordem.Items.Add('Estado');
    cbxSearchCRUDFieldordem.ItemIndex := 0;
  end;


  if StrContains('CULTIVAR',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Codigo');
    cbxSearchCRUDFieldordem.Items.Add('Cultivar');
    cbxSearchCRUDFieldordem.ItemIndex := 1;
  end;

  if StrContains('ESPECIE',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Codigo');
    cbxSearchCRUDFieldordem.Items.Add('Semente Nome');
    cbxSearchCRUDFieldordem.Items.Add('Nome Popular');
    cbxSearchCRUDFieldordem.ItemIndex := 1;
  end;

  if StrContains('PRODUCAOINTERNA',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Numero');
    cbxSearchCRUDFieldordem.Items.Add('Lote');
    cbxSearchCRUDFieldordem.Items.Add('Codigo Popular');
    cbxSearchCRUDFieldordem.Items.Add('Descrição Produto');
    cbxSearchCRUDFieldordem.ItemIndex := 0;
  end;

  if StrContains('NOTAELETRONICA',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Numero');
    cbxSearchCRUDFieldordem.Items.Add('Pessoa');
    cbxSearchCRUDFieldordem.ItemIndex := 0;
  end;


  if StrContains('FUNCIONARIOS#PESSOAS#TRANSPORTES#RESPONSAVEL#EMPRESAS#LABORATORIO#USUARIOS',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Codigo');
    cbxSearchCRUDFieldordem.Items.Add('Nome');
    cbxSearchCRUDFieldordem.ItemIndex := 1;
  end;


  if StrContains('PORTADORES#HISTORICO#CONDICOES#PRODUTOS#OPERACOES#CENTROCUSTO#ESCRITAS#GRUPOS#CARTEIRA',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Codigo');
    cbxSearchCRUDFieldordem.Items.Add('Descrição');
    cbxSearchCRUDFieldordem.ItemIndex := 1;
  end;

  if StrContains('PLANOCONTAS',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Plano');
    cbxSearchCRUDFieldordem.Items.Add('Descrição');
    cbxSearchCRUDFieldordem.ItemIndex := 1;
  end;

  if StrContains('NOTAELETRONICA',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|Código|50','1|NUMERO|NUMERO|100','2|EMPRESA|EMP|50','3|NOME|NOME|300','4|ESTADO|UF|50','5|VLRTOTAL|TOTAL|150']);
  end;

  if StrContains('PRODUCAOINTERNA',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|NUMERO|NUMERO|120','1|EMISSAO|EMISSÃO|140','2|LOTE|LOTE|250','3|PADRAO|CODIGO P|250','4|DESCRICAO|DESCRIÇÃO|450']);
  end;

  if StrContains('ESPECIE',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|Código|50','1|SEMENTENOME|DESCRICAO|300','2|POPULAR|POPULAR|150']);
  end;

  if StrContains('CULTIVAR',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|Código|50','1|CULTIVAR|DESCRICAO|300']);
  end;

  if StrContains('GRUPOS',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|Código|50','1|DESCRICAO|DESCRICAO|300']);
  end;


  if StrContains('SEMENTES#BUSCALOTE',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|PRODUTO|PRD|120','1|NOME|DESCRICAO|400','2|LOTE|LOTE|350','3|BOLETIM|BOLETIM|150','4|TERMO|TERMO|150','5|DISPONIVEL|SALDO|150']);
  end;


  if StrContains('FUNCIONARIOS#USUARIOS',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|Código|50','1|NOME|NOME|200']);
  end;

  if StrContains('RESPONSAVEL',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|Código|50','1|NOME|NOME|200','2|CREA|CREA|100','3|CIDADE|CIDADE|100','4|ESTADO|UF|50']);
  end;

  if StrContains('PESSOAS#EMPRESAS#LABORATORIO',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|Código|50','1|NOME|NOME|200','2|CPFCNPJ|CPF/CNPJ|100','3|CIDADE|CIDADE|100','4|ESTADO|ESTADO|50']);
  end;

  if StrContains('TRANSPORTES',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|Código|50','1|NOME|NOME|200','2|CPFCNPJ|CPF/CNPJ|100','3|PLACA|PLACA|100','4|PLACAESTADO|UF|50','5|PLACACARRETA|CARRETA|100','6|ESTADOCARRETA|UF|50']);
  end;

  if StrContains('PORTADORES#HISTORICO#CONDICOES#OPERACOES#CENTROCUSTO#CARTEIRA',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|Código|50','1|DESCRICAO|DESCRICAO|200']);
  end;

  if StrContains('ESCRITAS',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|Código|50','1|DESCRICAO|DESCRICAO|200','2|TIPO|TIPO|80']);
  end;

  if StrContains('PLANOCONTAS',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|PLANO|PLANO|50','1|DESCRICAO|DESCRICAO|200']);
  end;

  if StrContains('PRODUTOS',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|CODIGO|50','1|DESCRICAO|DESCRICAO|200','2|VENDA|VENDA|100']);
  end;

  if StrContains('CIDADES',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|DESCRICAO|DESCRICAO|300','1|UF|ESTADO|50','2|CODIIBGE|IBGE|100']);
  end;

  if StrContains('CEP',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CEP|Cep|100','1|DESCRICAO|DESCRICAO|300','2|UF|ESTADO|50']);
  end;

  if StrContains('GRPPESP',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|CODIGO|100','1|DESCRICAO|DESCRICAO|300','2|TIPO|TIPO|100']);
  end;

  if StrContains('CUSTOLOTEINTERNO',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|Código|50','1|DESCRICAO|DESCRICAO|300','2|TIPO|TIPO|100']);
  end;

  if StrContains('BARRACAO',mm.varC_referencia_busca) then
  begin
    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|Código|50','1|DESCRICAO|DESCRICAO|400']);
  end;

  if StrContains('BUSCALOTE',mm.varC_referencia_busca) then
    btnLkpSearch.OnClick(self);

// para formulários, deve-se efetuar o ResizeBlocks
  dm_rc.rc_RenderControls(Self);
end;

procedure TfrmPesquisa.UniFormDestroy(Sender: TObject);
begin
  FreeAndNil(M_STR);
  dm_rc.sqlPesquisa.Close;
    mm.varC_Form_Modal := nil;
end;

procedure TfrmPesquisa.UniFormReady(Sender: TObject);
begin
     Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
     dm_rc.rc_ResizeBlocks(Self);
end;

procedure TfrmPesquisa.UniFormShow(Sender: TObject);
begin
  if Self.Tag = 0 then
  begin
      Self.Visible := True;
      Self.Top  := 0;

      rc_MoveAnimationForm( self,
                            self.left,
                            self.left,
                            self.top,
                            ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  ),
                            400,
                            1 ) ;
  end
  else
  begin
    Self.Visible := False;
    Self.Top  := -1000;
  end;
  Self.Visible := True;

  edSearchCRUDconteudo.SetFocus;
end;

end.
