unit untFrmMANIFESTO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBaseCRUD, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniMultiItem, uniComboBox,
  uniDateTimePicker, uniEdit, UniButtonEdit, uniLabel, uniScrollBox,
  uniBasicGrid, uniDBGrid, uniPageControl, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniDBEdit, UniButtonDbEdit, uniDBDateTimePicker,
  uniDBComboBox, uniMemo, Vcl.Menus, uniMainMenu, uniScreenMask, uniSweetAlert,
  uniCheckBox;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros, tpCalcular);
  TfrmMANIFESTO = class(TfrmBaseCRUD)
    UniPageControlcadastros: TUniPageControl;
    UniTabSheetCRUD: TUniTabSheet;
    UniScrollBox2: TUniScrollBox;
    UniContainerPanel2: TUniContainerPanel;
    UniScrollBox3: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel35: TUniLabel;
    UniButtonDbEditTRANSPORTADORA: TUniButtonDbEdit;
    UniDBEditTRANSPORTADORA: TUniDBEdit;
    UniLabel36: TUniLabel;
    UniLabel4: TUniLabel;
    UniDBEditcpfcnpj: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    edCodigo: TUniDBEdit;
    UniLabel7: TUniLabel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniDBEdit4: TUniDBEdit;
    UniLabel8: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniLabel47: TUniLabel;
    UniComboBoxtrafrete: TUniComboBox;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniComboBoxtipocarga: TUniComboBox;
    UniLabel11: TUniLabel;
    UniComboBoxtipoveiculo: TUniComboBox;
    UniComboBoxtipocarroceria: TUniComboBox;
    UniLabel12: TUniLabel;
    UniComboBoxtipoemitente: TUniComboBox;
    UniLabel13: TUniLabel;
    rcBlock140: TUniContainerPanel;
    UniPageControlmanifesto: TUniPageControl;
    UniTabSheetcarregamentodestino: TUniTabSheet;
    UniContainerPanel4: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    rcBlock160: TUniContainerPanel;
    rcBlock170: TUniContainerPanel;
    UniLabel22: TUniLabel;
    UniButtonDbEditibgecarregamento: TUniButtonDbEdit;
    UniLabel19: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    UniLabel20: TUniLabel;
    UniDBComboBoxestado: TUniDBComboBox;
    rcBlock180: TUniContainerPanel;
    UniDBEdit6: TUniDBEdit;
    UniLabel14: TUniLabel;
    rcBlock190: TUniContainerPanel;
    rcBlock200: TUniContainerPanel;
    UniDBComboBox1: TUniDBComboBox;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniTabSheetnotasconhecimento: TUniTabSheet;
    TB_MANIFESTO: TFDMemTable;
    TB_MANIFESTONUMERO: TStringField;
    TB_MANIFESTOCHAVE: TStringField;
    TB_MANIFESTOIBGE: TIntegerField;
    TB_MANIFESTOCIDADE: TStringField;
    TB_MANIFESTOESTADO: TStringField;
    TB_MANIFESTOPESOLIQUIDO: TFloatField;
    TB_MANIFESTOPESOBRUTO: TFloatField;
    TB_MANIFESTOTIPO: TStringField;
    TB_MANIFESTOSTATUS: TStringField;
    TB_MANIFESTOTOTAL: TFloatField;
    TB_MANIFESTOCONTROLE: TIntegerField;
    TB_MANIFESTObuscanota: TStringField;
    TB_MANIFESTOexcluinota: TStringField;
    TB_MANIFESTObuscaentrega: TStringField;
    DS_MANIFESTO: TDataSource;
    UniTabSheetveiculos: TUniTabSheet;
    UniTabSheetsegurador: TUniTabSheet;
    UniContainerPanel5: TUniContainerPanel;
    rcBlock210: TUniContainerPanel;
    rcBlock220: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
    rcBlock240: TUniContainerPanel;
    rcBlock250: TUniContainerPanel;
    rcBlock260: TUniContainerPanel;
    rcBlock270: TUniContainerPanel;
    rcBlock280: TUniContainerPanel;
    rcBlock290: TUniContainerPanel;
    rcBlock300: TUniContainerPanel;
    rcBlock310: TUniContainerPanel;
    rcBlock320: TUniContainerPanel;
    rcBlock330: TUniContainerPanel;
    rcBlock340: TUniContainerPanel;
    rcBlock350: TUniContainerPanel;
    UniDBEdit7: TUniDBEdit;
    UniDBEdit8: TUniDBEdit;
    UniDBEdit9: TUniDBEdit;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    UniLabel21: TUniLabel;
    UniDBComboBox3: TUniDBComboBox;
    UniDBComboBox4: TUniDBComboBox;
    UniDBComboBox5: TUniDBComboBox;
    UniLabel23: TUniLabel;
    UniLabel24: TUniLabel;
    UniLabel25: TUniLabel;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel26: TUniLabel;
    UniLabel27: TUniLabel;
    UniLabel28: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel29: TUniLabel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniLabel30: TUniLabel;
    UniLabel31: TUniLabel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniLabel32: TUniLabel;
    UniLabel33: TUniLabel;
    UniLabel34: TUniLabel;
    UniContainerPanel6: TUniContainerPanel;
    rcBlock360: TUniContainerPanel;
    UniDBEdit11: TUniDBEdit;
    UniLabel37: TUniLabel;
    rcBlock370: TUniContainerPanel;
    rcBlock380: TUniContainerPanel;
    rcBlock390: TUniContainerPanel;
    UniDBEdit12: TUniDBEdit;
    UniDBEdit13: TUniDBEdit;
    UniDBEdit14: TUniDBEdit;
    UniLabel38: TUniLabel;
    UniLabel39: TUniLabel;
    UniLabel40: TUniLabel;
    UniContainerPanel7: TUniContainerPanel;
    rcBlock400: TUniContainerPanel;
    rcBlock410: TUniContainerPanel;
    rcBlock420: TUniContainerPanel;
    rcBlock430: TUniContainerPanel;
    rcBlock440: TUniContainerPanel;
    rcBlock450: TUniContainerPanel;
    rcBlock460: TUniContainerPanel;
    rcBlock470: TUniContainerPanel;
    UniDBGridmanifestos: TUniDBGrid;
    UniDBEdit15: TUniDBEdit;
    UniDBEdit16: TUniDBEdit;
    UniDBEdit17: TUniDBEdit;
    UniLabel41: TUniLabel;
    UniLabel42: TUniLabel;
    UniLabel43: TUniLabel;
    UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit11: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit12: TUniDBFormattedNumberEdit;
    UniLabel44: TUniLabel;
    UniLabel45: TUniLabel;
    UniLabel46: TUniLabel;
    UniLabel48: TUniLabel;
    rcBlock480: TUniContainerPanel;
    rcBlock490: TUniContainerPanel;
    rcBlock500: TUniContainerPanel;
    UniLabel49: TUniLabel;
    UniButtonDbEdit1: TUniButtonDbEdit;
    UniLabel50: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel51: TUniLabel;
    UniDBComboBox6: TUniDBComboBox;
    UniMemolog: TUniMemo;
    UniPopupMenudetalhes: TUniPopupMenu;
    L1: TUniMenuItem;
    UniPopupMenuopcoes: TUniPopupMenu;
    E1: TUniMenuItem;
    UniScreenMask1: TUniScreenMask;
    E2: TUniMenuItem;
    procedure MasterAfterOpen(DataSet: TDataSet);
    procedure MasterBeforeEdit(DataSet: TDataSet);
    procedure PesquisaAfterOpen(DataSet: TDataSet);
    procedure ItensBeforeEdit(DataSet: TDataSet);
    procedure ItensBeforePost(DataSet: TDataSet);
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure sqlSearchMasterstatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnSearchClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure TB_MANIFESTOexcluinotaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure TB_MANIFESTObuscanotaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure UniDBGridmanifestosCellClick(Column: TUniDBGridColumn);
    procedure TB_MANIFESTOAfterPost(DataSet: TDataSet);
    procedure TB_MANIFESTOAfterDelete(DataSet: TDataSet);
    procedure UniButtonDbEditibgecarregamentoButtonClick(Sender: TObject);
    procedure UniButtonDbEdit1ButtonClick(Sender: TObject);
    procedure UniButtonDbEditTRANSPORTADORAButtonClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure UniButtonDbEditTRANSPORTADORAExit(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure L1Click(Sender: TObject);
    procedure sqlSearchMasteropcoesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnOptionsClick(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure UniDBEditcpfcnpjExit(Sender: TObject);
    procedure E2Click(Sender: TObject);
  private
    { Private declarations }
  FPesquisaProdutoAberta: Boolean;
  posicao_x, posicao_y: Integer;
  FPronto, FCarregando: Boolean;
  FEstadoLog, FOriginal: string;
  function Consulta(const SQL: string): TFDQuery;
  function Assinatura(DataSet: TDataSet): string;
  function ProximoCodigo(const Tabela: string): Integer;
  function ChaveValida(const Chave: string): Boolean;
  procedure ExigirEdicao;
  procedure BloquearOriginal;
  procedure PreencherLinhas;
  procedure Recarregar(Codigo: Integer);
  public
    { Public declarations }
  varC_Documento_MvmestreMFE : Integer;
  procedure  SetBut(Acao:TAcaoCrud);
  procedure  ativabusca();
  procedure  carregadados();
  procedure  LimpaVars;
  procedure  CarregaNota(f_codigo:integer);
  procedure  CalculaPeso();
  procedure  CarregaTransportes(f_codigo:integer);
  procedure  GravaManifesto();
  procedure  MemoGravaLog();
  procedure  Exclui;
  procedure  HabilitaCombobox(status:boolean);
  function   CamposValidados :Boolean;
  procedure  PesquisarProdutoGrid;
  end;

var
  frmMANIFESTO: TfrmMANIFESTO;


implementation

uses
  System.DateUtils, System.StrUtils, mkm_validate, uconsts_cfg, mkm_func_web, MainModule, System.TypInfo, untFrmPesquisa,
  mkm_procedures, untDM_RC, uniGUITypes, mkm_funcoes, Vcl.Grids,
  untFrmTELAGENERICA, untfrmSEFAZMANIFESTO, unReportImpressao,untPesquisaGenerica;

{$R *.dfm}
procedure TfrmMANIFESTO.ativabusca;
begin
  inherited btnSearchClick(btnSearch);
end;

procedure TfrmMANIFESTO.btnCancelRegClick(Sender: TObject);
begin
  FCarregando:=True;
  try TB_MANIFESTO.Cancel; finally FCarregando:=False; end;
  inherited btnCancelRegClick(Sender);
  if sqlMaster.Active then MasterAfterOpen(sqlMaster);
  SetBut(tpListacomRegistros);
end;

procedure TfrmMANIFESTO.btnDeleteRegClick(Sender: TObject);
begin
  if mm.varC_Locked='S' then raise Exception.Create(mm.MSG_APP_LOCKED);
  if not dm_rc.rc_PermissionVerify(ed_FormOrigin_Tab.Text,'mfmestre',PT_DELETE) then Exit;
  if sqlMaster.State in dsEditModes then raise Exception.Create('Cancele a edicao antes de excluir.');
  if sqlSearchMaster.IsEmpty then Exit;
  Recarregar(sqlSearchMaster.FieldByName('CODIGO').AsInteger);
  if not MatchStr(Trim(sqlMaster.FieldByName('CANCELADA').AsString),['','N']) then
    raise Exception.Create('Nao e permitido excluir este manifesto.');
  mm.varS_SenhaExclusaoNota_permitido:='';
  mm.VarC_Atelagenerica:='SENHAEXCLUSAONOTA';
  frmTELAGENERICA.ShowModal;
  if mm.varS_SenhaExclusaoNota_permitido<>'T' then Exit;
  mm.varS_SenhaExclusaoNota_permitido:='';
  Exclui;
end;

procedure TfrmMANIFESTO.btnEditRegClick(Sender: TObject);
begin
  inherited btnEditRegClick(Sender);
  if not (sqlMaster.State in dsEditModes) then Exit;
  PreencherLinhas;
  SetBut(tpAlterar);
end;

procedure TfrmMANIFESTO.btnNewRegClick(Sender: TObject);
var Q: TFDQuery;
begin
  inherited btnNewRegClick(Sender);
  if sqlMaster.State<>dsInsert then Exit;
  LimpaVars;
  Q:=Consulta('SELECT E.ESTADO,E.IBGE,E.CIDADE FROM EMPRESAS E WHERE E.CODIGO=:EMP');
  try
    Q.ParamByName('EMP').AsInteger:=mm.varI_Code_Company; Q.Open;
    if Q.IsEmpty then raise Exception.Create('Empresa nao encontrada.');
    sqlMaster.FieldByName('KEY').AsString:=Gera_Guid;
    sqlMaster.FieldByName('CODIGO').AsInteger:=-1;
    sqlMaster.FieldByName('EMPRESA').AsInteger:=mm.varI_Code_Company;
    sqlMaster.FieldByName('DOCUMENTO').AsInteger:=varC_Documento_MvmestreMFE;
    sqlMaster.FieldByName('NUMERO').AsInteger:=0;
    sqlMaster.FieldByName('SERIE').AsString:='MFE';
    sqlMaster.FieldByName('EMISSAO').AsDateTime:=Date;
    sqlMaster.FieldByName('HORAEMISSAO').AsString:=FormatDateTime('hh:nn:ss',Now);
    sqlMaster.FieldByName('CANCELADA').AsString:='';
    sqlMaster.FieldByName('ESTADOINI').Value:=Q.FieldByName('ESTADO').Value;
    sqlMaster.FieldByName('ESTADOFIN').Value:=Q.FieldByName('ESTADO').Value;
    sqlMaster.FieldByName('IBGECARREGAMENTO').Value:=Q.FieldByName('IBGE').Value;
    sqlMaster.FieldByName('CIDADECARREGAMENTO').Value:=Q.FieldByName('CIDADE').Value;
    sqlMaster.FieldByName('UFCARRREGAMENTO').Value:=Q.FieldByName('ESTADO').Value;
  finally Q.Free; end;
  UniComboBoxtipoemitente.ItemIndex:=1;
  PreencherLinhas;
  SetBut(tpIncluir);
  UniPageControlmanifesto.ActivePage:=UniTabSheetnotasconhecimento;
end;

procedure TfrmMANIFESTO.btnOptionsClick(Sender: TObject);
begin

  UniPopupMenuopcoes.PopupBy( TUniButton( sender ) );
end;

procedure TfrmMANIFESTO.btnSaveRegClick(Sender: TObject);
var Q: TFDQuery; Novo: Boolean; Codigo, CodigoAnterior: Integer;
begin
  try
    if mm.varC_Locked='S' then raise Exception.Create(mm.MSG_APP_LOCKED);
    if not CamposValidados then Exit;
    Novo:=sqlMaster.State=dsInsert;
    CodigoAnterior:=sqlMaster.FieldByName('CODIGO').AsInteger;
    if Novo then FEstadoLog:='dsInsert' else FEstadoLog:='dsEdit';
    sqlMaster.FieldByName('TIPOFRETE').AsInteger:=UniComboBoxtrafrete.ItemIndex;
    sqlMaster.FieldByName('TIPOCARGA').AsInteger:=UniComboBoxtipocarga.ItemIndex;
    sqlMaster.FieldByName('TIPOVEICULO').AsInteger:=UniComboBoxtipoveiculo.ItemIndex;
    sqlMaster.FieldByName('TIPOCARROCERIA').AsInteger:=UniComboBoxtipocarroceria.ItemIndex;
    sqlMaster.FieldByName('TIPOEMITENTE').AsInteger:=UniComboBoxtipoemitente.ItemIndex;
    CalculaPeso;
    if sqlMaster.Connection.InTransaction then raise Exception.Create('Conclua a transacao aberta nesta sessao antes de salvar.');
    sqlMaster.Connection.StartTransaction;
    try
      if Novo then
      begin
        Q:=Consulta('UPDATE DOCUMENTOS SET NUMERO=COALESCE(NUMERO,0)+1 '+
          'WHERE EMPRESA=:EMP AND DOCUMENTO=:DOC RETURNING NUMERO');
        try
          Q.ParamByName('EMP').AsInteger:=mm.varI_Code_Company;
          Q.ParamByName('DOC').AsInteger:=varC_Documento_MvmestreMFE; Q.Open;
          if Q.FieldByName('NUMERO').AsInteger<=0 then raise Exception.Create('Configure o documento 20 para esta empresa.');
          sqlMaster.FieldByName('NUMERO').Value:=Q.FieldByName('NUMERO').Value;
          sqlMaster.FieldByName('CODIGO').AsInteger:=ProximoCodigo('MFMESTRE');
          sqlMaster.FieldByName('LOGINCLUSAO').AsString:=Copy(mm.vUserName,1,40)+' '+FormatDateTime('dd/mm/yyyy hh:nn:ss',Now);
        finally Q.Free; end;
      end else BloquearOriginal;
      sqlMaster.FieldByName('LOGALTERACAO').AsString:=Copy(mm.vUserName,1,20)+' '+Gera_Guid;
      sqlMaster.Post;
      if sqlMaster.ApplyUpdates(0)<>0 then raise Exception.Create('Falha ao gravar o cabecalho do manifesto.');
      GravaManifesto;
      Codigo:=sqlMaster.FieldByName('CODIGO').AsInteger;
      sqlMaster.Connection.Commit;
    except
      sqlMaster.Connection.Rollback;
      sqlMaster.Cancel; sqlMaster.CancelUpdates;
      if not Novo then Recarregar(CodigoAnterior) else sqlMaster.Close;
      raise;
    end;
    sqlMaster.CommitUpdates;
    try
      MemoGravaLog;
      GravaLog(mm.varI_Code_Company,mm.varI_User,Codigo,mm.vUserName,FEstadoLog,'MFMESTRE','',UniMemolog.Text);
    except on E: Exception do dm_rc.rc_ShowMessage('Manifesto salvo, mas o log falhou: '+E.Message); end;
    Recarregar(Codigo);
    SetBut(tpListacomRegistros);
    pgBaseCadControl.ActivePage:=tabSearch;
    dm_rc.rc_ShowToaster('success','Manifesto salvo.',False,'slideLeftRightFade');
  except on E: Exception do dm_rc.rc_ShowMessage(E.Message); end;
end;

procedure TfrmMANIFESTO.btnSearchClick(Sender: TObject);
begin
  inherited btnSearchClick(Sender);
end;

procedure TfrmMANIFESTO.btnSearchCRUDClick(Sender: TObject);
begin
  inherited btnSearchCRUDClick(Sender);
end;

procedure TfrmMANIFESTO.CalculaPeso;
var B: TBookmark; PesoL, PesoB: Double; Total: Currency; N, C: Integer;
begin
  if FCarregando or not (sqlMaster.State in dsEditModes) or not TB_MANIFESTO.Active then Exit;
  PesoL:=0; PesoB:=0; Total:=0; N:=0; C:=0;
  B:=TB_MANIFESTO.GetBookmark;
  TB_MANIFESTO.DisableControls;
  try
    TB_MANIFESTO.First;
    while not TB_MANIFESTO.Eof do
    begin
      if TB_MANIFESTO.FieldByName('CHAVE').AsString<>'' then
      begin
        PesoL:=PesoL+TB_MANIFESTO.FieldByName('PESOLIQUIDO').AsFloat;
        PesoB:=PesoB+TB_MANIFESTO.FieldByName('PESOBRUTO').AsFloat;
        Total:=Total+TB_MANIFESTO.FieldByName('TOTAL').AsCurrency;
        if TB_MANIFESTOTIPO.AsString='NFE' then Inc(N) else Inc(C);
      end;
      TB_MANIFESTO.Next;
    end;
    sqlMaster.FieldByName('PESOLIQUIDO').AsFloat:=PesoL;
    sqlMaster.FieldByName('PESOBRUTO').AsFloat:=PesoB;
    sqlMaster.FieldByName('TOTAL').AsCurrency:=Total;
    sqlMaster.FieldByName('NOTA').AsInteger:=N;
    sqlMaster.FieldByName('CONHECIMENTO').AsInteger:=C;
  finally
    if TB_MANIFESTO.BookmarkValid(B) then TB_MANIFESTO.GotoBookmark(B);
    TB_MANIFESTO.FreeBookmark(B);
    TB_MANIFESTO.EnableControls;
  end;
end;

function TfrmMANIFESTO.CamposValidados: Boolean;
var I: Integer; Lista: TStringList; Chave: string; B: TBookmark;
begin
  Result:=False; ExigirEdicao;
  if not rc_FormValidate(Self) then Exit;
  if (UniComboBoxtipoveiculo.ItemIndex<0) or (UniComboBoxtipocarga.ItemIndex<0) or
    (UniComboBoxtipocarroceria.ItemIndex<0) or (UniComboBoxtipoemitente.ItemIndex<0) then
    raise Exception.Create('Selecione os tipos de veiculo, carga, carroceria e emitente.');
  if TB_MANIFESTO.State in dsEditModes then TB_MANIFESTO.Post;
  Lista:=TStringList.Create; B:=TB_MANIFESTO.GetBookmark;
  TB_MANIFESTO.DisableControls;
  try
    TB_MANIFESTO.First; I:=0;
    while not TB_MANIFESTO.Eof do
    begin
      Chave:=TB_MANIFESTO.FieldByName('CHAVE').AsString;
      if (Chave<>'') or (TB_MANIFESTO.FieldByName('NUMERO').AsString<>'') then
      begin
        if not ChaveValida(Chave) then raise Exception.Create('Existe nota com chave invalida.');
        if Lista.IndexOf(Chave)>=0 then raise Exception.Create('Existe chave repetida no manifesto.');
        Lista.Add(Chave);
        if (TB_MANIFESTO.FieldByName('IBGE').AsInteger<1000000) or
           (TB_MANIFESTO.FieldByName('CIDADE').AsString='') then
          raise Exception.Create('Informe o municipio de descarga de todas as notas.');
        if (TB_MANIFESTO.FieldByName('TOTAL').AsCurrency<0) or
           (TB_MANIFESTO.FieldByName('PESOBRUTO').AsFloat<0) or
           (TB_MANIFESTO.FieldByName('PESOLIQUIDO').AsFloat<0) then
          raise Exception.Create('Pesos e valores nao podem ser negativos.');
        Inc(I);
      end;
      TB_MANIFESTO.Next;
    end;
    if I=0 then raise Exception.Create('Inclua pelo menos uma NF-e ou CT-e.');
    Result:=True;
  finally
    if TB_MANIFESTO.BookmarkValid(B) then TB_MANIFESTO.GotoBookmark(B);
    TB_MANIFESTO.FreeBookmark(B); TB_MANIFESTO.EnableControls; Lista.Free;
  end;
end;

procedure TfrmMANIFESTO.carregadados;
var Q: TFDQuery; Nome: string;
begin
  FCarregando:=True;
  TB_MANIFESTO.DisableControls;
  try
    TB_MANIFESTO.Close; TB_MANIFESTO.Open;
    if sqlMaster.IsEmpty then Exit;
    Q:=Consulta('SELECT * FROM MFITENS WHERE EMPRESA=:EMP AND DOCUMENTO=:DOC AND NUMERO=:NUM ORDER BY SEQUENCIA');
    try
      Q.ParamByName('EMP').AsInteger:=mm.varI_Code_Company;
      Q.ParamByName('DOC').Value:=sqlMaster.FieldByName('DOCUMENTO').Value;
      Q.ParamByName('NUM').Value:=sqlMaster.FieldByName('NUMERO').Value;
      Q.Open;
      while not Q.Eof do
      begin
        TB_MANIFESTO.Append;
        TB_MANIFESTO.FieldByName('NUMERO').Value:=Q.FieldByName('NOTA').Value;
        TB_MANIFESTO.FieldByName('CHAVE').Value:=Q.FieldByName('CODIGOBARRAS').Value;
        for Nome in ['IBGE','CIDADE','ESTADO','TIPO','PESOBRUTO','PESOLIQUIDO','TOTAL'] do
          TB_MANIFESTO.FieldByName(Nome).Value:=Q.FieldByName(Nome).Value;
        TB_MANIFESTO.Post;
        Q.Next;
      end;
    finally Q.Free; end;
    TB_MANIFESTO.First;
    UniComboBoxtrafrete.ItemIndex:=sqlMaster.FieldByName('TIPOFRETE').AsInteger;
    UniComboBoxtipocarga.ItemIndex:=sqlMaster.FieldByName('TIPOCARGA').AsInteger;
    UniComboBoxtipoveiculo.ItemIndex:=sqlMaster.FieldByName('TIPOVEICULO').AsInteger;
    UniComboBoxtipocarroceria.ItemIndex:=sqlMaster.FieldByName('TIPOCARROCERIA').AsInteger;
    UniComboBoxtipoemitente.ItemIndex:=sqlMaster.FieldByName('TIPOEMITENTE').AsInteger;
  finally
    TB_MANIFESTO.EnableControls;
    FCarregando:=False;
  end;
end;

// =====================================================================
// Trecho melhorado de untFrmMANIFESTO (manifesto eletrônico) — 2026-09-20
// Substitui os `raise Exception.Create` por dm_rc.rc_ShowSweetAlert
// (padrão 3 args da 8.0: título, mensagem, tipo), mantendo toda a lógica
// (bookmark, locate, campos, Q.Free). Requer untDM_RC no uses da unit.
// Quando o pas completo do MANIFESTO chegar, este trecho já vai nele.
// =====================================================================
procedure TfrmMANIFESTO.CarregaNota(f_codigo: Integer);
var
  Q     : TFDQuery;
  Chave : string;
  B     : TBookmark;
begin
  ExigirEdicao;

  Q := Consulta('SELECT M.*, P.CODIIBGE AS DEST_IBGE, P.ESTADO AS DEST_UF, P.CIDADE AS DEST_CIDADE ' +
                'FROM MVMESTRE M LEFT JOIN PESSOAS P ON P.CODIGO = M.PESSOA ' +
                'WHERE M.CODIGO = :COD AND M.EMPRESA = :EMP AND M.DOCUMENTO = 1 AND M.CANCELADA = ''A''');
  try
    Q.ParamByName('COD').AsInteger := f_codigo;
    Q.ParamByName('EMP').AsInteger := mm.varI_Code_Company;
    Q.Open;

    if Q.IsEmpty then
    begin
      dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Nenhuma NF-e autorizada foi encontrada para esta empresa.', 'error');
      Exit;
    end;

    Chave := Q.FieldByName('CODIGOBARRAS').AsString;
    if not ChaveValida(Chave) then
    begin
      dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'A nota possui chave de acesso inválida.', 'error');
      Exit;
    end;

    B := TB_MANIFESTO.GetBookmark;
    try
      if TB_MANIFESTO.Locate('CHAVE', Chave, []) then
      begin
        dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Esta nota já foi incluída no manifesto.', 'warning');
        Exit;
      end;
    finally
      if TB_MANIFESTO.BookmarkValid(B) then TB_MANIFESTO.GotoBookmark(B);
      TB_MANIFESTO.FreeBookmark(B);
    end;

    if TB_MANIFESTO.IsEmpty then TB_MANIFESTO.Append else TB_MANIFESTO.Edit;
    TB_MANIFESTO.FieldByName('CONTROLE').AsInteger := f_codigo;
    TB_MANIFESTO.FieldByName('NUMERO').Value       := Q.FieldByName('NUMERO').Value;
    TB_MANIFESTO.FieldByName('CHAVE').AsString     := Chave;
    TB_MANIFESTO.FieldByName('IBGE').Value         := Q.FieldByName('DEST_IBGE').Value;
    TB_MANIFESTO.FieldByName('CIDADE').Value       := Q.FieldByName('DEST_CIDADE').Value;
    TB_MANIFESTO.FieldByName('ESTADO').Value       := Q.FieldByName('DEST_UF').Value;
    TB_MANIFESTO.FieldByName('PESOBRUTO').Value    := Q.FieldByName('TRAPESOBRUTO').Value;
    TB_MANIFESTO.FieldByName('PESOLIQUIDO').Value  := Q.FieldByName('TRAPESOLIQUIDO').Value;
    TB_MANIFESTO.FieldByName('TOTAL').Value        := Q.FieldByName('VLRTOTAL').Value;
    TB_MANIFESTO.FieldByName('TIPO').AsString      := 'NFE';
    TB_MANIFESTO.Post;
  finally
    Q.Free;
  end;
end;

procedure TfrmMANIFESTO.CarregaTransportes(f_codigo:integer);
begin
  if SqlPesquisa('select * from transportes where codigo = ' + IntToStr(f_codigo)) then
    begin
      sqlMaster.FindField('TRANSPORTADORA').AsInteger := f_codigo ;
      sqlMaster.FindField('NOMETRANSPORTADORA').AsString         := dm_rc.sqlBuscas.FindField('NOME').AsString;
      sqlMaster.FindField('CPFCNPJ').AsString         := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
      sqlMaster.FindField('CIOT').AsString            := dm_rc.sqlBuscas.FindField('CIOT').AsString;
      sqlMaster.FindField('RNTC').AsString            := dm_rc.sqlBuscas.FindField('RNTC').AsString;
      sqlMaster.FindField('RENAVAM').AsString         := dm_rc.sqlBuscas.FindField('RENAVAM').AsString;

      sqlMaster.FindField('PLACATRATOR').AsString     := dm_rc.sqlBuscas.FindField('PLACA').AsString;
      sqlMaster.FindField('ESTADOTRATOR').AsString    := dm_rc.sqlBuscas.FindField('PLACAESTADO').AsString;
      sqlMaster.FindField('TRATORTARA').AsFloat       := dm_rc.sqlBuscas.FindField('TRATORTARA').AsFloat;
      sqlMaster.FindField('TRATORKG').AsFloat         := dm_rc.sqlBuscas.FindField('TRATORKG').AsFloat;
      sqlMaster.FindField('TRATORM3').AsFloat         := dm_rc.sqlBuscas.FindField('TRATORM3').AsFloat;

      sqlMaster.FindField('PLACACARRETA').AsString    := dm_rc.sqlBuscas.FindField('PLACACARRETA').AsString;
      sqlMaster.FindField('ESTADOCARRETA').AsString   := dm_rc.sqlBuscas.FindField('ESTADOCARRETA').AsString;
      sqlMaster.FindField('CARRETATARA').AsFloat      := dm_rc.sqlBuscas.FindField('CARRETATARA').AsFloat;
      sqlMaster.FindField('CARRETAKG').AsFloat        := dm_rc.sqlBuscas.FindField('CARRETAKG').AsFloat;
      sqlMaster.FindField('CARRETAM3').AsFloat        := dm_rc.sqlBuscas.FindField('CARRETAM3').AsFloat;

      sqlMaster.FindField('PLACAREBOQUE').AsString    := dm_rc.sqlBuscas.FindField('PLACAREBOQUE').AsString;
      sqlMaster.FindField('ESTADOREBOQUE').AsString   := dm_rc.sqlBuscas.FindField('ESTADOREBOQUE').AsString;
      sqlMaster.FindField('REBOQUETARA').AsFloat      := dm_rc.sqlBuscas.FindField('REBOQUETARA').AsFloat;
      sqlMaster.FindField('REBOQUEKG').AsFloat        := dm_rc.sqlBuscas.FindField('REBOQUEKG').AsFloat;
      sqlMaster.FindField('REBOQUEM3').AsFloat        := dm_rc.sqlBuscas.FindField('REBOQUEM3').AsFloat;
    end;
{
  if ValidadorAcbr(sqlMaster.FindField('CPFCNPJ').AsString,'CPFCNPJ') <> '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', ValidadorAcbr(sqlMaster.FindField('CPFCNPJ').AsString,'CPFCNPJ') , 'error'  );
      UniDBEditcpfcnpj.SetFocus;
    end;
}
end;

procedure TfrmMANIFESTO.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
begin
  inherited dbgSearchCRUDCellClick(Column);
  if SameText(Column.FieldName,'opcoes') then
    UniPopupMenudetalhes.Popup(posicao_x,posicao_y,dbgSearchCRUD);
end;

procedure TfrmMANIFESTO.dbgSearchCRUDDblClick(Sender: TObject);
begin
  inherited dbgSearchCRUDDblClick(Sender);
  SetBut(tpListacomRegistros);
end;

procedure TfrmMANIFESTO.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmMANIFESTO.E1Click(Sender: TObject);
var Codigo: Integer;
begin
  if sqlMaster.State in dsEditModes then raise Exception.Create('Salve ou cancele antes de abrir a SEFAZ.');
  if pgBaseCadControl.ActivePage=tabSearch then
  begin
    if sqlSearchMaster.IsEmpty then Exit;
    Recarregar(sqlSearchMaster.FieldByName('CODIGO').AsInteger);
  end;
  if not sqlMaster.Active or sqlMaster.IsEmpty then Exit;
  Codigo:=sqlMaster.FieldByName('CODIGO').AsInteger;
  mm.varI_Code_Documento_Controle:=Codigo;
  frmSEFAZMANIFESTO.ShowModal(
    procedure(Sender: TComponent; AResult: Integer)
    begin Recarregar(Codigo); end);
end;

procedure TfrmMANIFESTO.E2Click(Sender: TObject);
begin

  mm.VarC_Atelagenerica := 'ENCERRAMANIFESTO';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmMANIFESTO.Exclui;
var Q: TFDQuery; Codigo: Integer;
begin
  MemoGravaLog;
  Codigo:=sqlMaster.FieldByName('CODIGO').AsInteger;
  if sqlMaster.Connection.InTransaction then raise Exception.Create('Existe outra transacao aberta.');
  sqlMaster.Connection.StartTransaction;
  try
    BloquearOriginal;
    Q:=Consulta('UPDATE MFITENS SET EMPRESA=0 WHERE EMPRESA=:EMP AND DOCUMENTO=:DOC AND NUMERO=:NUM');
    try
      Q.ParamByName('EMP').AsInteger:=mm.varI_Code_Company;
      Q.ParamByName('DOC').Value:=sqlMaster.FieldByName('DOCUMENTO').Value;
      Q.ParamByName('NUM').Value:=sqlMaster.FieldByName('NUMERO').Value; Q.ExecSQL;
      Q.SQL.Text:='UPDATE MFMESTRE SET EMPRESA=0 WHERE CODIGO=:COD AND EMPRESA=:EMP';
      Q.ParamByName('COD').AsInteger:=Codigo;
      Q.ParamByName('EMP').AsInteger:=mm.varI_Code_Company; Q.ExecSQL;
    finally Q.Free; end;
    sqlMaster.Connection.Commit;
  except sqlMaster.Connection.Rollback; raise; end;
  try
    GravaLog(mm.varI_Code_Company,mm.varI_User,Codigo,mm.vUserName,'dsDelete','MFMESTRE','',UniMemolog.Text);
  except on E: Exception do dm_rc.rc_ShowMessage('Manifesto excluido, mas o log falhou: '+E.Message); end;
  sqlMaster.Close; TB_MANIFESTO.Close;
  sqlSearchMaster.Close; sqlSearchMaster.Open;
  SetBut(tpListacomRegistros);
  pgBaseCadControl.ActivePage:=tabSearch;
end;

procedure TfrmMANIFESTO.sqlSearchMasteropcoesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text:=''; if not DisplayText then Exit;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmMANIFESTO.sqlSearchMasterstatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
var Cor, Legenda, Status: string;
begin
  Text:=''; if not DisplayText then Exit;
  Status:=sqlSearchMaster.FieldByName('CANCELADA').AsString;
  Cor:='#b45309'; Legenda:='Aguarde';
  if Status='A' then begin Cor:='#15803d'; Legenda:='Autorizado'; end
  else if Status='C' then begin Cor:='#b91c1c'; Legenda:='Cancelado'; end
  else if Status='E' then begin Cor:='#0369a1'; Legenda:='Encerrado'; end;
  Text:='<span style="padding:3px 8px;border-radius:8px;color:white;background:'+Cor+'">'+Legenda+'</span>';
end;

procedure TfrmMANIFESTO.GravaManifesto;
var Q: TFDQuery; Nome: string; Seq: Integer;
begin
  Q:=Consulta('DELETE FROM MFITENS WHERE EMPRESA=:EMP AND DOCUMENTO=:DOC AND NUMERO=:NUM');
  TB_MANIFESTO.DisableControls;
  try
    Q.ParamByName('EMP').AsInteger:=mm.varI_Code_Company;
    Q.ParamByName('DOC').Value:=sqlMaster.FieldByName('DOCUMENTO').Value;
    Q.ParamByName('NUM').Value:=sqlMaster.FieldByName('NUMERO').Value; Q.ExecSQL;
    Q.SQL.Text:='INSERT INTO MFITENS ("KEY",CODIGO,EMPRESA,DOCUMENTO,NUMERO,SEQUENCIA,TIPO,NOTA,'+
      'CODIGOBARRAS,IBGE,CIDADE,ESTADO,PESOBRUTO,PESOLIQUIDO,TOTAL,SERIE,SERIENOTA) '+
      'VALUES (:CHAVE,:COD,:EMP,:DOC,:NUM,:SEQ,:TIPO,:NOTA,:BARRAS,:IBGE,:CIDADE,:ESTADO,:PESOBRUTO,:PESOLIQUIDO,:TOTAL,:SERIE,:SERIENOTA)';
    TB_MANIFESTO.First; Seq:=0;
    while not TB_MANIFESTO.Eof do
    begin
      if TB_MANIFESTO.FieldByName('CHAVE').AsString<>'' then
      begin
        Inc(Seq);
        Q.ParamByName('CHAVE').AsString:=Gera_Guid;
        Q.ParamByName('COD').AsInteger:=ProximoCodigo('MFITENS');
        Q.ParamByName('EMP').AsInteger:=mm.varI_Code_Company;
        Q.ParamByName('DOC').Value:=sqlMaster.FieldByName('DOCUMENTO').Value;
        Q.ParamByName('NUM').Value:=sqlMaster.FieldByName('NUMERO').Value;
        Q.ParamByName('SERIE').Value:=sqlMaster.FieldByName('SERIE').Value;
        Q.ParamByName('SERIENOTA').AsString:=Copy(TB_MANIFESTO.FieldByName('CHAVE').AsString,23,3);
        Q.ParamByName('SEQ').AsInteger:=Seq;
        Q.ParamByName('NOTA').Value:=TB_MANIFESTO.FieldByName('NUMERO').Value;
        Q.ParamByName('BARRAS').Value:=TB_MANIFESTO.FieldByName('CHAVE').Value;
        for Nome in ['TIPO','IBGE','CIDADE','ESTADO','PESOBRUTO','PESOLIQUIDO','TOTAL'] do
          Q.ParamByName(Nome).Value:=TB_MANIFESTO.FieldByName(Nome).Value;
        Q.ExecSQL;
      end;
      TB_MANIFESTO.Next;
    end;
  finally TB_MANIFESTO.EnableControls; Q.Free; end;
end;

procedure TfrmMANIFESTO.HabilitaCombobox(status: Boolean);
var I: Integer;
begin
  for I:=0 to ComponentCount-1 do
    if Components[I] is TUniDBComboBox then
      TUniDBComboBox(Components[I]).ReadOnly:=status;
  UniComboBoxtrafrete.Enabled:=not status;
  UniComboBoxtipocarga.Enabled:=not status;
  UniComboBoxtipoveiculo.Enabled:=not status;
  UniComboBoxtipocarroceria.Enabled:=not status;
  UniComboBoxtipoemitente.Enabled:=not status;
end;

procedure TfrmMANIFESTO.L1Click(Sender: TObject);
begin
  mm.varI_Code_Documento_Controle := sqlSearchMaster.FindField('CODIGO').AsInteger;
  mm.VarC_Atelagenerica           := 'LOGMANIFESTO';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmMANIFESTO.LimpaVars;
begin
  UniComboBoxtrafrete.ItemIndex       := 0;
  UniComboBoxtipocarga.ItemIndex      := 0;
  UniComboBoxtipoveiculo.ItemIndex    := 2;
  UniComboBoxtipocarroceria.ItemIndex := 2;
  UniComboBoxtipoemitente.ItemIndex   := 0;
end;

procedure TfrmMANIFESTO.MemoGravaLog;
begin
  UniMemolog.Clear;
  SqlPesquisa('select * from mfmestre, transportes where mfmestre.codigo = ' + IntToStr(sqlMaster.FindField('CODIGO').AsInteger) +
              ' and mfmestre.transportadora = transportes.codigo');

  UniMemolog.Lines.Add(DataSetToJsonTXT(dm_rc.sqlBuscas));

  SqlPesquisa('select * from mfitens where mfitens.numero = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)   +
              ' and mfitens.documento                     = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger)+
              ' and mfitens.empresa                       = ' + IntToStr(mm.varI_Code_Company)                     +
              ' order by mfitens.sequencia');

  UniMemolog.Lines.Add(DataSetToJsonTXT(dm_rc.sqlBuscas));

end;

procedure TfrmMANIFESTO.SetBut(Acao: TAcaoCrud);
begin
  // O estado dos botoes e controlado pelo TfrmBaseCRUD.
  HabilitaCombobox(not (sqlMaster.State in dsEditModes));
  UniDBGridmanifestos.ReadOnly:=not (sqlMaster.State in dsEditModes);
end;

procedure TfrmMANIFESTO.TB_MANIFESTOAfterDelete(DataSet: TDataSet);
begin

  CalculaPeso();
end;

procedure TfrmMANIFESTO.TB_MANIFESTOAfterPost(DataSet: TDataSet);
begin

  CalculaPeso();
end;

procedure TfrmMANIFESTO.TB_MANIFESTObuscanotaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text:=''; if not DisplayText then Exit;

    Text :=
    '<i title="Pesquisar nota" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';

end;

procedure TfrmMANIFESTO.TB_MANIFESTOexcluinotaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text:=''; if not DisplayText then Exit;

    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';

end;

procedure TfrmMANIFESTO.UniButtonDbEdit1ButtonClick(Sender: TObject);
begin
  ExigirEdicao;

  mm.Seta_Busca('CIDADES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       ExigirEdicao;
       sqlMaster.FindField('IBGEDESCARREGAMENTO').AsString := MM.varC_codigo_busca;
       
       if SqlPesquisa('SELECT * FROM CIDADES WHERE CODIIBGE = ' + QuotedStr(MM.varC_codigo_busca)) then
         begin
           sqlMaster.FindField('CIDADEDESCARREGAMENTO').AsString := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
           sqlMaster.FindField('UFDESCARREGAMENTO').AsString     := dm_rc.sqlBuscas.FindField('UF').AsString;
         end;
     end;
   end);

end;

procedure TfrmMANIFESTO.UniButtonDbEditibgecarregamentoButtonClick(
  Sender: TObject);
begin
  ExigirEdicao;

  mm.Seta_Busca('CIDADES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       ExigirEdicao;
       sqlMaster.FindField('IBGECARREGAMENTO').AsString := MM.varC_codigo_busca;
       
       if SqlPesquisa('SELECT * FROM CIDADES WHERE CODIIBGE = ' + QuotedStr(MM.varC_codigo_busca)) then
         begin
           sqlMaster.FindField('CIDADECARREGAMENTO').AsString := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
           sqlMaster.FindField('UFCARRREGAMENTO').AsString    := dm_rc.sqlBuscas.FindField('UF').AsString;
         end;
     end;
   end);
end;

procedure TfrmMANIFESTO.UniButtonDbEditTRANSPORTADORAButtonClick(
  Sender: TObject);
begin
  ExigirEdicao;

  mm.Seta_Busca('TRANSPORTES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       ExigirEdicao;
       CarregaTransportes(StrToInt(MM.varC_codigo_busca));
     end;
   end);
end;

procedure TfrmMANIFESTO.UniButtonDbEditTRANSPORTADORAExit(Sender: TObject);
begin

  if sqlMaster.State in [dsInsert,dsEdit] then  
    CarregaTransportes(sqlMaster.FindField('TRANSPORTADORA').AsInteger);
end;

procedure TfrmMANIFESTO.UniDBEditcpfcnpjExit(Sender: TObject);
begin


  if  Length(sqlMaster.FindField('CPFCNPJ').AsString) > 11 then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'COLOQUE APENAS CPF DO MOTORISTA' , 'error'  );
      ABORT;
    end ;
    {
  else
    begin
      if ValidadorAcbr(sqlMaster.FindField('CPFCNPJ').AsString,'CPFCNPJ') <> '' then
        begin
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', ValidadorAcbr(sqlMaster.FindField('CPFCNPJ').AsString,'CPFCNPJ') , 'error'  );
          ABORT;
        end;
    end;
    }
end;

procedure TfrmMANIFESTO.UniDBGridmanifestosCellClick(Column: TUniDBGridColumn);
begin
  if not (sqlMaster.State in dsEditModes) then Exit;

  if SameText(Column.FieldName,'excluinota') and not TB_MANIFESTO.IsEmpty then
  begin
    mm.varB_Yes:=False;
    dm_rc.rc_ShowYesNo('Retirar este documento do manifesto?');
    if mm.varB_Yes then TB_MANIFESTO.Delete;
  end ;

  if Column.FieldName = 'buscanota' then
    PesquisarProdutoGrid;

end;

procedure TfrmMANIFESTO.PesquisarProdutoGrid;
var
  RegistroItem, LinhaGrid: Integer;
begin
  if FPesquisaProdutoAberta or
     not (sqlMaster.State in [dsInsert, dsEdit]) or
     not TB_MANIFESTO.Active or TB_MANIFESTO.IsEmpty then Exit;

  RegistroItem := TB_MANIFESTO.RecNo;
  LinhaGrid := UniDBGridmanifestos.CurrRow;
  FPesquisaProdutoAberta := True;
  try
    PesquisarCadastro('NOTAELETRONICA',
      procedure(const Codigo: string; Selecionou: Boolean)
      var I: Integer;
      begin
        FPesquisaProdutoAberta := False;
        if not Selecionou then Exit;
        if not (sqlMaster.State in [dsInsert, dsEdit]) or
           not TB_MANIFESTO.Active or TB_MANIFESTO.IsEmpty then Exit;
        if TB_MANIFESTO.RecNo <> RegistroItem then
        begin
          dm_rc.rc_ShowSweetAlert('ATENCAO',
            'O item mudou durante a pesquisa. Selecione o produto novamente.', 'warning');
          Exit;
        end;

        CarregaNota(StrToInt(Codigo));
        UniDBGridmanifestos.SetFocus;
{        for I := 0 to UniDBGridprodutos.Columns.Count - 1 do
          if SameText(UniDBGridprodutos.Columns[I].FieldName, 'LOTESEMENTE') then
          begin
            UniDBGridprodutos.CurrRow := LinhaGrid;
            UniDBGridprodutos.CurrCol := I;
            TNotaGridAccess(UniDBGridprodutos).StartEditor(LinhaGrid, I);
            Break;
          end;}
      end);
  except
    FPesquisaProdutoAberta := False;
    raise;
  end;
end;


procedure TfrmMANIFESTO.UniFrameCreate(Sender: TObject);
begin
  FPronto:=False; FCarregando:=False;
  varC_Documento_MvmestreMFE:=20;
  mm.varC_Table_Search:='mfmestre';
  mm.varC_PK_MasterTable:='CODIGO';
  sqlMaster.SQL.Text:=
    'SELECT tab.* FROM MFMESTRE tab WHERE tab.[[pk]]=:table_pk '+
    'AND tab.EMPRESA='+IntToStr(mm.varI_Code_Company)+' AND tab.DOCUMENTO=20 '+
    '[grid] SELECT tab.CODIGO,tab.NUMERO,tab.EMISSAO,tab.SERIE,tab.CANCELADA, '+
    'tab.TRANSPORTADORA,tab.EMPRESA,tab.DOCUMENTO,tab."KEY",p.CIDADE,p.ESTADO, '+
    'tab.NOMETRANSPORTADORA AS NOME,tab.CPFCNPJ, '+
    'CAST('''' AS VARCHAR(1)) AS STATUS,CAST('''' AS VARCHAR(1)) AS OPCOES '+
    'FROM MFMESTRE tab LEFT JOIN TRANSPORTES p ON p.CODIGO=tab.TRANSPORTADORA';
  ed_Where_Search.Text:='tab.EMPRESA='+IntToStr(mm.varI_Code_Company)+' AND tab.DOCUMENTO=20';
  ed_Order_Search.Text:='tab.NUMERO DESC';
  dbgSearchCRUD.Hint:='[[fieldmasks:model-crud:2|info-state:off|grid-paginator:center|]]';
  inherited UniFrameCreate(Sender);
  sqlMaster.CachedUpdates:=True;
  // Mantem o SchemaAdapter herdado do TfrmBaseCRUD.
  sqlMaster.UpdateOptions.UpdateTableName:='MFMESTRE';
  sqlMaster.UpdateOptions.KeyFields:='KEY';
  dsMaster.AutoEdit:=False;
  ed_NoGenID.Text:='true'; ed_GenNextID_OnNew.Text:='false';
  btnNewReg.OnClick:=btnNewRegClick;
  btnEditReg.OnClick:=btnEditRegClick;
  btnSaveReg.OnClick:=btnSaveRegClick;
  btnCancelReg.OnClick:=btnCancelRegClick;
  btnDeleteReg.OnClick:=btnDeleteRegClick;
  btnOptions.OnClick:=btnOptionsClick;
  dbgSearchCRUD.OnCellClick:=dbgSearchCRUDCellClick;
  dbgSearchCRUD.OnMouseDown:=dbgSearchCRUDMouseDown;
  dm_rc.rc_FillSearchFieldsCRUD(Self,cbxSearchCRUDField1.Name,'tab.NUMERO','NUMERO');
  dm_rc.rc_FillSearchFieldsCRUD(Self,cbxSearchCRUDField1.Name,'tab.NOMETRANSPORTADORA','TRANSPORTADOR');
  dm_rc.rc_FillSearchFieldsCRUD(Self,cbxSearchCRUDField1.Name,'tab.TRANSPORTADORA','CODIGO TRANSPORTADOR');
  dm_rc.rc_FillSearchFieldsCRUD(Self,cbxSearchCRUDField1.Name,'tab.CANCELADA','SITUACAO (A/C/E)');
  dm_rc.rc_FillSearchFieldsCRUD(Self,cbxSearchCRUDFieldDate.Name,'tab.EMISSAO','EMISSAO');
  labTitleForm.Caption:='Manifesto Eletronico';
  UniDBGridmanifestos.ClicksToEdit:=1;
  UniDBGridmanifestos.TabKeyBehavior:=tkNextColumn;
  FPronto:=True;
  SetBut(tpListacomRegistros);
  inherited btnSearchCRUDClick(Self);
end;

procedure TfrmMANIFESTO.UniFrameDestroy(Sender: TObject);
begin
  FPronto:=False;
  inherited UniFrameDestroy(Sender);
end;

function TfrmMANIFESTO.Consulta(const SQL: string): TFDQuery;
begin
  Result:=TFDQuery.Create(nil);
  Result.Connection:=sqlMaster.Connection;
  Result.SQL.Text:=SQL;
end;

function TfrmMANIFESTO.Assinatura(DataSet: TDataSet): string;
var F: TField; S: string;
begin
  Result:='';
  for F in DataSet.Fields do
  begin
    if F.IsNull then S:='<NULL>' else S:=F.AsString;
    Result:=Result+F.FieldName+':'+IntToStr(Length(S))+':'+S+';';
  end;
end;

procedure TfrmMANIFESTO.MasterAfterOpen(DataSet: TDataSet);
begin
  if not FPronto or FCarregando then Exit;
  if not DataSet.IsEmpty then FOriginal:=Assinatura(DataSet);
  carregadados;
  SetBut(tpListacomRegistros);
end;

procedure TfrmMANIFESTO.PesquisaAfterOpen(DataSet: TDataSet);
begin
  if DataSet.FindField('STATUS')<>nil then DataSet.FieldByName('STATUS').OnGetText:=sqlSearchMasterstatusGetText;
  if DataSet.FindField('OPCOES')<>nil then DataSet.FieldByName('OPCOES').OnGetText:=sqlSearchMasteropcoesGetText;
end;

procedure TfrmMANIFESTO.MasterBeforeEdit(DataSet: TDataSet);
begin
  if not FPronto then
    Exit;

  if not dm_rc.rc_PermissionVerify(
    ed_FormOrigin_Tab.Text, 'mfmestre', PT_EDIT) then
    Abort;

  if not MatchStr(
    Trim(DataSet.FieldByName('CANCELADA').AsString), ['', 'N']) then
  begin
    dm_rc.rc_ShowMessage(
      'Este manifesto não pode ser alterado porque já foi ' +
      'autorizado, cancelado ou encerrado.');
    Abort;
  end;

  if DataSet.FieldByName('EMPRESA').AsInteger <>
     mm.varI_Code_Company then
  begin
    dm_rc.rc_ShowMessage(
      'Este manifesto pertence a outra empresa. ' +
      'Acesse a empresa correspondente para continuar.');
    Abort;
  end;
end;


procedure TfrmMANIFESTO.ExigirEdicao;
begin
  if not (sqlMaster.State in dsEditModes) then
    raise Exception.Create('Clique em Novo ou Edita para alterar o manifesto.');
end;

procedure TfrmMANIFESTO.ItensBeforeEdit(DataSet: TDataSet);
begin
  if not FCarregando then ExigirEdicao;
end;

function TfrmMANIFESTO.ChaveValida(const Chave: string): Boolean;
var I, Peso, Soma, Digito: Integer;
begin
  Result:=False;
  if Length(Chave)<>44 then Exit;
  for I:=1 to 44 do if not CharInSet(Chave[I],['0'..'9']) then Exit;
  if not MatchStr(Copy(Chave,21,2),['55','57']) then Exit;
  Peso:=2; Soma:=0;
  for I:=43 downto 1 do
  begin
    Inc(Soma,(Ord(Chave[I])-Ord('0'))*Peso);
    Inc(Peso); if Peso>9 then Peso:=2;
  end;
  Digito:=11-(Soma mod 11); if Digito>=10 then Digito:=0;
  Result:=Digito=Ord(Chave[44])-Ord('0');
end;

procedure TfrmMANIFESTO.ItensBeforePost(DataSet: TDataSet);
var Chave: string;
begin
  if FCarregando then Exit;
  ExigirEdicao;
  Chave:=Trim(DataSet.FieldByName('CHAVE').AsString);
  if Chave='' then Exit;
  if not ChaveValida(Chave) then raise Exception.Create('Chave NF-e/CT-e invalida.');
  DataSet.FieldByName('CHAVE').AsString:=Chave;
  DataSet.FieldByName('NUMERO').AsString:=IntToStr(StrToInt(Copy(Chave,26,9)));
  if Copy(Chave,21,2)='55' then DataSet.FieldByName('TIPO').AsString:='NFE'
  else DataSet.FieldByName('TIPO').AsString:='CTE';
end;

procedure TfrmMANIFESTO.PreencherLinhas;
var I: Integer;
begin
  FCarregando:=True;
  TB_MANIFESTO.DisableControls;
  try
    if not TB_MANIFESTO.Active then TB_MANIFESTO.Open;
    for I:=1 to 25 do begin TB_MANIFESTO.Append; TB_MANIFESTO.Post; end;
    TB_MANIFESTO.First;
  finally TB_MANIFESTO.EnableControls; FCarregando:=False; end;
end;

procedure TfrmMANIFESTO.BloquearOriginal;
var Q: TFDQuery;
begin
  Q:=Consulta('SELECT * FROM MFMESTRE WHERE "KEY"=:CHAVE AND EMPRESA=:EMP WITH LOCK');
  try
    Q.ParamByName('CHAVE').Value:=sqlMaster.FieldByName('KEY').Value;
    Q.ParamByName('EMP').AsInteger:=mm.varI_Code_Company; Q.Open;
    if Q.IsEmpty or (Assinatura(Q)<>FOriginal) then
      raise Exception.Create('O manifesto mudou em outra sessao. Cancele e reabra o cadastro.');
    if (Q.FieldByName('NUMERO').AsInteger<>sqlMaster.FieldByName('NUMERO').AsInteger) or
       (Q.FieldByName('DOCUMENTO').AsInteger<>sqlMaster.FieldByName('DOCUMENTO').AsInteger) or
       (Q.FieldByName('SERIE').AsString<>sqlMaster.FieldByName('SERIE').AsString) or
       (Q.FieldByName('CODIGO').AsInteger<>sqlMaster.FieldByName('CODIGO').AsInteger) then
      raise Exception.Create('A identificacao do manifesto nao pode ser alterada.');
    if not MatchStr(Trim(Q.FieldByName('CANCELADA').AsString),['','N']) then
      raise Exception.Create('Este manifesto ja foi processado pela SEFAZ.');
  finally Q.Free; end;
end;

function TfrmMANIFESTO.ProximoCodigo(const Tabela: string): Integer;
var Q: TFDQuery; Atual, Maior: Int64;
begin
  if not MatchStr(Tabela,['MFMESTRE','MFITENS']) then raise Exception.Create('Tabela invalida.');
  Q:=Consulta('SELECT GEN_ID(GEN_'+Tabela+'_ID,0) AS ATUAL, '+
    '(SELECT COALESCE(MAX(CODIGO),0) FROM '+Tabela+') AS MAIOR FROM RDB$DATABASE');
  try
    Q.Open; Atual:=Q.FieldByName('ATUAL').AsLargeInt; Maior:=Q.FieldByName('MAIOR').AsLargeInt;
    Q.Close;
    if Maior>Atual then
    begin
      Q.SQL.Text:='SELECT GEN_ID(GEN_'+Tabela+'_ID,'+IntToStr(Maior-Atual)+') FROM RDB$DATABASE';
      Q.Open; Q.Close;
    end;
    Q.SQL.Text:='SELECT GEN_ID(GEN_'+Tabela+'_ID,1) AS ID FROM RDB$DATABASE'; Q.Open;
    Result:=Q.FieldByName('ID').AsInteger;
    if Result<=0 then raise Exception.Create('Sequencia de identificadores invalida.');
  finally Q.Free; end;
end;

procedure TfrmMANIFESTO.Recarregar(Codigo: Integer);
begin
  sqlMaster.Close;
  sqlMaster.ParamByName('table_pk').AsInteger:=Codigo; sqlMaster.Open;
  sqlSearchMaster.Close; sqlSearchMaster.Open;
  sqlSearchMaster.Locate('CODIGO',Codigo,[]);
end;

initialization
  RegisterClass(TfrmMANIFESTO);
end.
