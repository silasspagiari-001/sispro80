unit untFrmPROPRIEDADE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniPageControl, uniBasicGrid, uniDBGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniMultiItem, uniComboBox,
  uniDBComboBox, uniLabel, uniEdit, uniDBEdit, UniButtonDbEdit;

type
  TfrmPROPRIEDADE = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    btnLkpClear: TUniBitBtn;
    btninclui: TUniBitBtn;
    btngrava: TUniBitBtn;
    btnexclui: TUniBitBtn;
    UniPageControl: TUniPageControl;
    UniTabSheetpesquisa: TUniTabSheet;
    UniTabSheetcadastro: TUniTabSheet;
    dbgSearchCRUD: TUniDBGrid;
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    dscrud: TDataSource;
    FDQryCad: TFDQuery;
    btnaltera: TUniBitBtn;
    UniContainerPanel1: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    UniButtonDbEditCEPP: TUniButtonDbEdit;
    UniLabel15: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UDBEditENDERECO: TUniDBEdit;
    rcBlock120: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock130: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UDBEditBAIRRO: TUniDBEdit;
    rcBlock220: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UDBEditCIDADE: TUniDBEdit;
    rcBlock230: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UDBComboESTADO: TUniDBComboBox;
    FDQryFiltroSEQUENCIA: TIntegerField;
    FDQryFiltroCEP: TStringField;
    FDQryFiltroCIDADE: TStringField;
    FDQryFiltroBAIRRO: TStringField;
    FDQryFiltroESTADO: TStringField;
    FDQryFiltroNUMERO: TStringField;
    FDQryFiltroCODIGO: TIntegerField;
    rcBlock330: TUniContainerPanel;
    UButDbEditIBGE: TUniButtonDbEdit;
    UniLabel22: TUniLabel;
    rcBlock310: TUniContainerPanel;
    UniDBEdit2: TUniDBEdit;
    UniLabel8: TUniLabel;
    rcBlock320: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    procedure UniFormDestroy(Sender: TObject);
    procedure btnLkpClearClick(Sender: TObject);
    procedure UniButtonDbEditCEPPButtonClick(Sender: TObject);
    procedure UniButtonDbEditCEPPExit(Sender: TObject);
    procedure btnincluiClick(Sender: TObject);
    procedure btnalteraClick(Sender: TObject);
    procedure btnexcluiClick(Sender: TObject);
    procedure btngravaClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure botoes(acao:string);
  procedure busca (ppessoa:integer);
  procedure carregadados(const f_mestre: integer);
  end;

function frmPROPRIEDADE: TfrmPROPRIEDADE;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untFrmPesquisa, untDM_RC, mkm_procedures,
  mkm_func_web, mkm_funcoes;

function frmPROPRIEDADE: TfrmPROPRIEDADE;
begin
  Result := TfrmPROPRIEDADE(mm.GetFormInstance(TfrmPROPRIEDADE));
end;

procedure TfrmPROPRIEDADE.botoes(acao: string);
begin
  if StrContains('inclui#altera',acao) then
    begin
      btninclui.Enabled      := False;
      btnaltera.Enabled      := False;
      btnexclui.Enabled      := False;
      btngrava.Enabled       := True;
    end;

  if StrContains('grava#cdados',acao) then
    begin
      btninclui.Enabled      := True;
      btnaltera.Enabled      := True;
      btnexclui.Enabled      := False;
      btngrava.Enabled       := False;
    end;

  if StrContains('sdados',acao) then
    begin
      btninclui.Enabled      := True;
      btnaltera.Enabled      := False;
      btnexclui.Enabled      := False;
      btngrava.Enabled       := False;
    end;

end;

procedure TfrmPROPRIEDADE.btnalteraClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  botoes('altera');

  UniPageControl.ActivePage := UniTabSheetcadastro;

  Try
    FDQryCad.Close;
   for i := 0 to  FDQryCad.Params.Count - 1 do
   begin
      Cmp :=  FDQryCad.Params[i].Name;
      FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
   end;
    FDQryCad.Open;

    FDQryCad.Edit;
  Except
   Abort ;
  End ;
end;

procedure TfrmPROPRIEDADE.btnexcluiClick(Sender: TObject);
begin
  try
    FDQryCad.Delete;
    if FDQryFiltro.Active then
      FDQryFiltro.Refresh;

    dm_rc.rc_ShowToaster('success', 'Dados Excluidos com Sucesso', True,'pinItUp')
  except
    dm_rc.rc_ShowToaster('error', 'NÃO CONSEGUI EXCLUIR, CHAME O SUPORTE ', True,'pinItUp')
  end;

end;

procedure TfrmPROPRIEDADE.btngravaClick(Sender: TObject);
begin
  try
    if FDQryCad.State in [dsInsert] then
      begin
        FDQryCad.FindField('KEY').AsString        := Gera_Guid;
        FDQryCad.FindField('ATIVO').AsString      := 'T';
        FDQryCad.FindField('SEQUENCIA').AsInteger := Sequencia_Propriedade(mm.varI_Code_Pessoa_historico);
      end;

    FDQryCad.Post;

  if  FDQryFiltro.Active then
    FDQryFiltro.Refresh;

    busca(mm.varI_Code_Pessoa_historico);
    carregadados(FDQryCad.FindField('CODIGO').AsInteger);
    dm_rc.rc_ShowToaster('success', 'Dados Gravados com Sucesso', True,'pinItUp')
  except
    dm_rc.rc_ShowToaster('error', 'NÃO CONSEGUI GRAVAR, CHAME O SUPORTE ', True,'pinItUp')
  end;
end;

procedure TfrmPROPRIEDADE.btnincluiClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  botoes('inclui');

  UniPageControl.ActivePage := UniTabSheetcadastro;

  try
    FDQryCad.Close ;
    for i := 0 to  FDQryCad.Params.Count - 1 do
    begin
      Cmp :=  FDQryCad.Params[i].Name;
       FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
    end;
     FDQryCad.Open;
  Except
     FDQryCad.Params[0].AsInteger := -1 ;
     FDQryCad.Open;
  End;

  if not( FDQryCad.Active) then
      FDQryCad.Open;

  FDQryCad.Append;
  FDQryCad.FindField('CODIGO').AsInteger := Ultimo_Codigo('PROPRIEDADES','CODIGO',True);
  FDQryCad.FindField('PESSOA').AsInteger := mm.varI_Code_Pessoa_historico;

  UniButtonDbEditCEPP.SetFocus;

end;

procedure TfrmPROPRIEDADE.btnLkpClearClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;


procedure TfrmPROPRIEDADE.busca(ppessoa: integer);
var
  M_SQL : string;
begin

  M_SQL := ' select * from propriedades where pessoa = ' + IntToStr(ppessoa) + ' order by sequencia';

  FDQryFiltro.Close;
  FDQryFiltro.sql.Clear;
  FDQryFiltro.SQL.Text := M_SQL;
  FDQryFiltro.Open;

  if FDQryFiltro.RecordCount > 0 then
    begin
      FDQryFiltro.First;
      botoes('cdados');
    end
  else
      botoes('sdados');
end;

procedure TfrmPROPRIEDADE.carregadados(const f_mestre: integer);
var
  i   : integer;
  Cmp : string;
begin
  FDQryCad.Close;
  for i := 0 to  FDQryCad.Params.Count - 1 do
  begin
    Cmp :=  FDQryCad.Params[i].Name;
    FDQryCad.Params[i].Value :=  f_mestre;
  end;
  FDQryCad.Open;
end;

procedure TfrmPROPRIEDADE.dbgSearchCRUDDblClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  UniPageControl.ActivePage := UniTabSheetcadastro;
  try
    FDQryCad.Close ;
    for i := 0 to  FDQryCad.Params.Count - 1 do
    begin
      Cmp                       :=  FDQryCad.Params[i].Name;
       FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
    end;
     FDQryCad.Open;
  Except
     FDQryCad.Params[0].AsInteger := -1 ;
     FDQryCad.Open;
  End;
end;

procedure TfrmPROPRIEDADE.UniButtonDbEditCEPPButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('CEP');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('CEP').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmPROPRIEDADE.UniButtonDbEditCEPPExit(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then

    dm_rc.rc_SearchPostalCodeCEP(
      FDQryCad.FindField('CEP').AsString,'',
      Self.Name,FDQryCad,
      UDBComboESTADO,
      UDBEditCIDADE,
      UDBEditBAIRRO,
      UDBEditENDERECO,
      UButDbEditIBGE
    );


    begin
      if (UniButtonDbEditCEPP.Text <> '') and (UniButtonDbEditCEPP.Text <> '0') then
        begin
          SqlPesquisa('select * from cidades where cep = ' + QuotedStr(FDQryCad.FindField('CEP').AsString));
            FDQryCad.FindField('CIDADE').AsString     := dm_rc.sqlBuscas.Findfield('DESCRICAO').asstring;
            FDQryCad.FindField('ESTADO').AsString     := dm_rc.sqlBuscas.Findfield('UF').asstring;
        end;
    end;
end;

procedure TfrmPROPRIEDADE.UniFormCreate(Sender: TObject);
begin
   NavigateKeys.Enabled := True;
   NavigateKeys.HandleTabs := True;

   // ENTER = próximo campo
   NavigateKeys.Next.Key := 13;
   NavigateKeys.Next.ShiftState := [];

   // SHIFT + ENTER = campo anterior
   NavigateKeys.Prior.Key := 13;
   NavigateKeys.Prior.ShiftState := [ussShift];

   // Não voltar para o primeiro ao chegar no último
   NavigateKeys.Cycle := False;

   // Não selecionar automaticamente o conteúdo
   NavigateKeys.SelectText := False;
end;

procedure TfrmPROPRIEDADE.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmPROPRIEDADE.UniFormShow(Sender: TObject);
begin
  UniPageControl.ActivePage := UniTabSheetpesquisa;
  busca(mm.varI_Code_Pessoa_historico);
end;

end.
