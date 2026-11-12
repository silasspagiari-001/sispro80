unit untFrmMOVIMENTOMESTRE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniMultiItem,
  uniComboBox, uniDateTimePicker, uniEdit, UniButtonEdit, uniLabel,
  uniScrollBox, uniPageControl, uniButton, uniBitBtn, uniDBDateTimePicker,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, uniDBEdit, UniButtonDbEdit, uniGUImJSForm, unimScrollBox,
  Vcl.Menus, uniMainMenu, uniMemo, uniDBMemo, uniDBComboBox, uniSweetAlert, untfrmBaseCRUD,
  uniCheckBox, uniScreenMask;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros, tpCalcular);
  TfrmMOVIMENTOMESTRE = class(TfrmBaseCRUD)
    pnlFiltroTipoDocumento: TUniContainerPanel;
    lblFiltroTipoDocumento: TUniLabel;
    cbFiltroTipoDocumento: TUniComboBox;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroNUMERO: TIntegerField;
    FDQryFiltroEMISSAO: TDateField;
    FDQryFiltroSERIE: TStringField;
    FDQryFiltroCANCELADA: TStringField;
    FDQryFiltroPESSOA: TIntegerField;
    FDQryFiltroCIDADE: TStringField;
    FDQryFiltroESTADO: TStringField;
    FDQryFiltroNOME: TStringField;
    FDQryFiltroVLRTOTAL: TFMTBCDField;
    FDQryFiltrostatus: TStringField;
    FDQryFiltroopcoes: TStringField;
    FDQryFiltroDOCUMENTO: TIntegerField;
    FDQryFiltroFECHAMENTO_STATUS: TStringField;
    sqlSearchMasterKEY: TStringField;
    sqlSearchMasterEMPRESA: TIntegerField;
    dstitulos: TDataSource;
    tbtitulos: TFDMemTable;
    tbtitulosPARCELA: TIntegerField;
    tbtitulosVALOR: TFloatField;
    tbtitulosVENCIMENTO: TDateTimeField;
    tbtitulosexclui: TStringField;
    tbtitulosSTATUS: TStringField;
    memprodutos: TFDMemTable;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    memprodutosPRECO: TFloatField;
    memprodutosTOTAL: TFloatField;
    memprodutosQUANTIDADE: TFloatField;
    memprodutosBASEICMS: TFloatField;
    memprodutosVALORICMS: TFloatField;
    memprodutosPERCICMS: TFloatField;
    memprodutosCST: TStringField;
    memprodutosUNIDADE: TStringField;
    memprodutosPIS: TStringField;
    memprodutosCOFINS: TStringField;
    memprodutosICM0: TFloatField;
    memprodutosICM1: TFloatField;
    memprodutosICM2: TFloatField;
    memprodutosBAS0: TFloatField;
    memprodutosBAS1: TFloatField;
    memprodutosBAS2: TFloatField;
    memprodutosSITUACAOLOCAL: TStringField;
    memprodutosSITUACAOOUTRAS: TStringField;
    memprodutosDESCONTO: TFloatField;
    memprodutosDESPESAS: TFloatField;
    memprodutosNUMERONCM: TStringField;
    memprodutosSERIE: TStringField;
    memprodutosSAFRA: TIntegerField;
    memprodutosNUMERO: TIntegerField;
    memprodutosEMPRESA: TIntegerField;
    memprodutosSEQUENCIA: TIntegerField;
    memprodutosUF: TStringField;
    memprodutosPESSOA: TIntegerField;
    memprodutosMARGEM: TFloatField;
    memprodutosCOMPRA: TFloatField;
    memprodutosNCM: TStringField;
    memprodutosGRUPO: TIntegerField;
    memprodutosPERCIPI: TFloatField;
    memprodutosLIQUIDO: TFloatField;
    memprodutosVALORIPI: TFloatField;
    memprodutosOPERACAO: TIntegerField;
    memprodutosPUREZA: TFloatField;
    memprodutosSALDOPONTO: TFloatField;
    memprodutosTERMOSEMENTE: TStringField;
    memprodutosBOLETIMSEMENTE: TStringField;
    memprodutosVALORCULTURAL: TFloatField;
    memprodutosLOTESEMENTE: TStringField;
    memprodutosLOTEORIGEM: TStringField;
    memprodutosSAFRACAMPO: TStringField;
    memprodutosCAMPO: TStringField;
    memprodutosCOOPERANTE: TIntegerField;
    memprodutosGERMINACAO: TFloatField;
    memprodutosSAFRAVALIDA: TStringField;
    memprodutosLOTEENTRADA: TStringField;
    memprodutosCATEGORIA: TStringField;
    memprodutosCUSTOPONTO: TFloatField;
    memprodutosTOTALPONTO: TFloatField;
    memprodutosPERCREDUCAO: TFloatField;
    memprodutosexclui: TStringField;
    memprodutosbuscaproduto: TStringField;
    memprodutosbuscalote: TStringField;
    memprodutosDESCRICAO_NOTA: TStringField;
    memprodutosCULTIVAR: TStringField;
    memprodutosCANCELADA: TStringField;
    memprodutosESTADO: TStringField;
    memprodutosCONTRATO: TIntegerField;
    memprodutosDOCUMENTO: TIntegerField;
    memprodutosFRETE: TFloatField;
    memprodutosPESOLIQUIDO: TFloatField;
    memprodutosPESOBRUTO: TFloatField;
    memprodutosEMISSAO: TStringField;
    memprodutosCUSTO: TFloatField;
    memprodutosPESOSACO: TFloatField;
    memprodutosVALIDADE: TStringField;
    memprodutosTOTALPIS: TFloatField;
    memprodutosTOTALCOFINS: TFloatField;
    memprodutosVLRPIS: TFloatField;
    memprodutosVLRCOFINS: TFloatField;
    memprodutosPERCCOMISSAO: TFloatField;
    memprodutosSEGURO: TFloatField;
    memprodutosDESPESA: TFloatField;
    memprodutoserro: TStringField;
    memprodutosopcoes: TStringField;
    memprodutosENTREGUE: TFloatField;
    memprodutosPEDIDOOR: TStringField;
    memprodutosPEDIDOITEMOR: TStringField;
    memprodutosSEMENTENOME: TStringField;
    memprodutosTETRAZOLIO: TFloatField;
    memprodutosTIPOLOTE: TStringField;
    dsprodutos: TDataSource;
    UniScrollBox2: TUniScrollBox;
    rcBlock510: TUniContainerPanel;
    UniEditcidade: TUniEdit;
    UniLabel7: TUniLabel;
    rcBlock520: TUniContainerPanel;
    UniEditestado: TUniEdit;
    UniLabel9: TUniLabel;
    rcBlock540: TUniContainerPanel;
    UniLabel11: TUniLabel;
    rcBlock570: TUniContainerPanel;
    UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEditvlrdespesas: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniLabel16: TUniLabel;
    rcBlock580: TUniContainerPanel;
    rcBlock610: TUniContainerPanel;
    UniLabel19: TUniLabel;
    rcBlock620: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniDBFormattedNumberEditperccomissao: TUniDBFormattedNumberEdit;
    rcBlock670: TUniContainerPanel;
    UniDBMemo1: TUniDBMemo;
    UniLabel26: TUniLabel;
    rcBlock590: TUniContainerPanel;
    UniDBGridprodutos: TUniDBGrid;
    rcBlock630: TUniContainerPanel;
    UniDBFormattedNumberEditquantidade: TUniDBFormattedNumberEdit;
    UniLabel22: TUniLabel;
    rcBlock640: TUniContainerPanel;
    UniLabel23: TUniLabel;
    UniDBFormattedNumberEditPESOBRUTO: TUniDBFormattedNumberEdit;
    rcBlock650: TUniContainerPanel;
    UniDBEditinscricao: TUniDBEdit;
    UniLabel24: TUniLabel;
    rcBlock660: TUniContainerPanel;
    UniDBComboBoxMARCA: TUniDBComboBox;
    UniLabel25: TUniLabel;
    rcBlock680: TUniContainerPanel;
    UniLabel18: TUniLabel;
    UniDBEditNUMEROPEDIDO: TUniDBEdit;
    UniPopupMenudetalhes: TUniPopupMenu;
    UniPopupMenuopcoes: TUniPopupMenu;
    I4: TUniMenuItem;
    N5: TUniMenuItem;
    I1: TUniMenuItem;
    i2: TUniMenuItem;
    UniScreenMask: TUniScreenMask;
    UniPopupMenulote: TUniPopupMenu;
    L1: TUniMenuItem;
    N6: TUniMenuItem;
    L2: TUniMenuItem;
    UniButtonDbEditcodigopessoas: TUniEdit;
    rcBlock550: TUniContainerPanel;
    UniDBMemoobservacao: TUniDBMemo;
    rcBlock450: TUniContainerPanel;
    rcBlock465: TUniContainerPanel;
    UniLabelTipoDocumento: TUniLabel;
    UniComboTipoDocumento: TUniComboBox;
    rcBlock475: TUniContainerPanel;
    UniLabel5: TUniLabel;
    edLkpPESSOAS: TUniDBEdit;
    rcBlock480: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBDateTimePickeremissao: TUniDBDateTimePicker;
    rcBlock485: TUniContainerPanel;
    UniLabel8: TUniLabel;
    edCodigo: TUniDBEdit;
    edLkpCONDICOES: TUniDBEdit;
    edLkpFUNCIONARIOS: TUniDBEdit;
    procedure btnCalcRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btntranspClick(Sender: TObject);
    procedure btnvendedorClick(Sender: TObject);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FDQryFiltroopcoesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDQryFiltrostatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure I1Click(Sender: TObject);
    procedure I4Click(Sender: TObject);
    procedure i2Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure L2Click(Sender: TObject);
    procedure memprodutosAfterDelete(DataSet: TDataSet);
    procedure memprodutosAfterPost(DataSet: TDataSet);
    procedure memprodutosBeforeDelete(DataSet: TDataSet);
    procedure memprodutosBeforePost(DataSet: TDataSet);
    procedure memprodutosbuscaloteGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure memprodutosbuscaprodutoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure memprodutosexcluiGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure sqlMasterAfterOpen(DataSet: TDataSet);
    procedure tbtitulosSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniButtonDbEditcodigopessoasButtonClick(Sender: TObject);
    procedure UniButtonDbEditcodigopessoasExit(Sender: TObject);
    procedure UniDBFormattedNumberEditdescontosExit(Sender: TObject);
    procedure UniDBFormattedNumberEditvlrdespesasExit(Sender: TObject);
    procedure UniDBGridprodutosCellClick(Column: TUniDBGridColumn);
    procedure UniDBGridprodutosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniComboTipoDocumentoChange(Sender: TObject);
    procedure cbFiltroTipoDocumentoChange(Sender: TObject);
    procedure edLkpPESSOASClick(Sender: TObject);
    procedure edLkpPESSOASExit(Sender: TObject);
    procedure edLkpCONDICOESClick(Sender: TObject);
    procedure UniDBDateTimePickeremissaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edLkpFUNCIONARIOSClick(Sender: TObject);
    procedure edLkpCONDICOESKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FCarregando          : Boolean;
    posicao_x, posicao_y : Integer;
    FAvancarCondicao: Boolean;
    FExitCodigoCondicoes: TNotifyEvent;
    FExitCodigoPessoa: TNotifyEvent;
    FAlertaCodigoPessoa: Boolean;
    FEnterCodigoPessoa: TNotifyEvent;
    procedure CodigoCondicoesExit(Sender: TObject);
    function ReservarNumeroDocumento(const Empresa, Documento: Integer): Integer;
    procedure SalvarParcelasPrevistas;
    procedure CarregarParcelasPrevistas;
    procedure CodigoPessoaExit(Sender: TObject);
    procedure CodigoPessoaEnter(Sender: TObject);
  public
    { Public declarations }
  DocumentoUnificado              : Boolean;
  iCurrentPage                    : integer;
  varC_Documento_Mvmestre         : Integer;
  varC_verificarecalculofinanceiro: string;

  procedure  carregadados();
  procedure  MostrarTipoDocumento(const Documento: Integer);
  procedure  carregaprodutos(codigo:string);
  procedure  SetBut(Acao:TAcaoCrud);
  procedure  LimpaVars();
  procedure  gravamemoria();
  function   CamposValidados :Boolean;
  procedure  Calcula_Totais();
  procedure  GravaMovimento();
  procedure  Calcula_Titulos();
  procedure  Calcula_Documento();
  procedure  ReCalcula_Titulos();
  procedure  Exclui();
  procedure  CarregaMarca();
  procedure  VerificaEdicao();
  function   VerificaSetemFinanceiro():Boolean;
  procedure  FechaTabelas();

  procedure  carregaitens     (cempresa,cdocumento,cnumero:integer);
  procedure  carregafinanceiro(cempresa,cdocumento,cnumero:integer);
  procedure  CarregaImportacao(const controle:integer);
  procedure  ReleituraProdutoscfop();
  procedure  carregalote(lote:string;produto:integer);
  procedure  carregaloteProducao(codigo:integer);
  procedure  VerificaFinanceiroAtual();
  procedure  carregaMovimento_comissao(const pnumero,pdocumento,pempresa:integer);
  end;

var
  frmMOVIMENTOMESTRE: TfrmMOVIMENTOMESTRE;

implementation

{$R *.dfm}

uses mkm_validate, mkm_funcoes, mkm_func_web, Vcl.Clipbrd, System.DateUtils,
  MainModule, untDM_RC, untFrmLookUp_Lite, Vcl.Grids, mkm_procedures,
  System.TypInfo, uniGUITypes, mkm_impressao, unReportImpressao,
  untFrmTransfereImportacao, untFrmTELAGENERICA, untFrmTRANSPORTADORAMOVIMENTO,
  untFrmBLOQUEIOPESSOA, untFrmPesquisaItensestoque, untFrmPesquisaloteinterno,
  untFrmMOVIMENTOVENDEDOR, untFrmPesquisa,untFrmFINANCEIRONOTA;

procedure TfrmMOVIMENTOMESTRE.cbFiltroTipoDocumentoChange(Sender: TObject);
var Filtro: string;
begin
  case cbFiltroTipoDocumento.ItemIndex of
    1: Filtro := 'tab.DOCUMENTO = 3';
    2: Filtro := 'tab.DOCUMENTO = 4';
    3: Filtro := 'tab.DOCUMENTO = 10';
  else
    Filtro := 'tab.DOCUMENTO in (3,4,10)';
  end;
  ed_Where_Search.Text := 'tab.EMPRESA = ' + IntToStr(mm.varI_Code_Company) +
    ' AND ' + Filtro;
end;

procedure TfrmMOVIMENTOMESTRE.SalvarParcelasPrevistas;
var Q: TFDQuery;
begin
  if not mm.FDTransaction.Active then
    raise Exception.Create('Transacao inativa ao gravar parcelas previstas.');
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := mm.SQLConn;
    Q.Transaction := mm.FDTransaction;
    Q.UpdateTransaction := mm.FDTransaction;
    Q.SQL.Text := 'delete from PARCELAS_PREVISTAS where MESTRE_ID = :MESTRE';
    Q.ParamByName('MESTRE').AsInteger := sqlMaster.FieldByName('CODIGO').AsInteger;
    Q.ExecSQL;
    Q.SQL.Text := 'insert into PARCELAS_PREVISTAS (CODIGO, MESTRE_ID, SEQUENCIA, VENCIMENTO, VALOR) ' +
      'values (gen_id(GEN_PARCELAS_PREVISTAS_ID, 1), :MESTRE, :SEQ, :VENC, :VALOR)';
    tbtitulos.DisableControls;
    try
      tbtitulos.First;
      while not tbtitulos.Eof do
      begin
        if tbtitulos.FieldByName('VENCIMENTO').IsNull or
           (tbtitulos.FieldByName('PARCELA').AsInteger <= 0) or
           (tbtitulos.FieldByName('VALOR').AsCurrency < 0) then
          raise Exception.Create('Parcela prevista invalida.');
        Q.ParamByName('MESTRE').AsInteger := sqlMaster.FieldByName('CODIGO').AsInteger;
        Q.ParamByName('SEQ').AsInteger := tbtitulos.FieldByName('PARCELA').AsInteger;
        Q.ParamByName('VENC').AsDate := tbtitulos.FieldByName('VENCIMENTO').AsDateTime;
        Q.ParamByName('VALOR').AsCurrency := tbtitulos.FieldByName('VALOR').AsCurrency;
        Q.ExecSQL;
        tbtitulos.Next;
      end;
      tbtitulos.First;
    finally
      tbtitulos.EnableControls;
    end;
  finally
    Q.Free;
  end;
end;

procedure TfrmMOVIMENTOMESTRE.CarregarParcelasPrevistas;
var Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := mm.SQLConn;
    Q.SQL.Text := 'select SEQUENCIA, VENCIMENTO, VALOR from PARCELAS_PREVISTAS ' +
      'where MESTRE_ID = :MESTRE order by SEQUENCIA';
    Q.ParamByName('MESTRE').AsInteger := sqlMaster.FieldByName('CODIGO').AsInteger;
    Q.Open;
    while not Q.Eof do
    begin
      tbtitulos.Append;
      tbtitulos.FieldByName('PARCELA').AsInteger := Q.FieldByName('SEQUENCIA').AsInteger;
      tbtitulos.FieldByName('VENCIMENTO').AsDateTime := Q.FieldByName('VENCIMENTO').AsDateTime;
      tbtitulos.FieldByName('VALOR').AsCurrency := Q.FieldByName('VALOR').AsCurrency;
      tbtitulos.FieldByName('STATUS').AsString := 'Previsto';
      tbtitulos.Post;
      Q.Next;
    end;
    tbtitulos.First;
  finally
    Q.Free;
  end;
end;

procedure TfrmMOVIMENTOMESTRE.MostrarTipoDocumento(const Documento: Integer);
begin
  case Documento of
    3: UniComboTipoDocumento.ItemIndex := 0;
    4: UniComboTipoDocumento.ItemIndex := 1;
    10: UniComboTipoDocumento.ItemIndex := 2;
  else
    UniComboTipoDocumento.ItemIndex := -1;
  end;
end;

procedure TfrmMOVIMENTOMESTRE.UniComboTipoDocumentoChange(Sender: TObject);
var
  Documento: Integer;
  Q: TFDQuery;
begin
  if not DocumentoUnificado or FCarregando or
     (sqlMaster.State <> dsInsert) then Exit;
  case UniComboTipoDocumento.ItemIndex of
    0: Documento := 3;
    1: Documento := 4;
    2: Documento := 10;
  else
    Documento := 0;
  end;
  sqlMaster.FindField('DOCUMENTO').AsInteger := 0;
  sqlMaster.FindField('SERIE').Clear;
  sqlMaster.FindField('OPERACAO').Clear;
  sqlMaster.FindField('CONDICAO').Clear;
  if Documento = 0 then Exit;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := mm.SQLConn;
    Q.SQL.Text := 'select SERIE, OPERACAO, CONDICAO from DOCUMENTOS ' +
      'where EMPRESA = :EMPRESA and DOCUMENTO = :DOCUMENTO';
    Q.ParamByName('EMPRESA').AsInteger := mm.varI_Code_Company;
    Q.ParamByName('DOCUMENTO').AsInteger := Documento;
    Q.Open;
    if Q.IsEmpty then
    begin
      dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Configure o tipo de documento ' +
        IntToStr(Documento) + ' para esta empresa na tabela DOCUMENTOS.', 'warning');
      Exit;
    end;
    sqlMaster.FindField('DOCUMENTO').AsInteger := Documento;
    sqlMaster.FindField('SERIE').Value := Q.FieldByName('SERIE').Value;
    sqlMaster.FindField('OPERACAO').Value := Q.FieldByName('OPERACAO').Value;
    sqlMaster.FindField('CONDICAO').Value := Q.FieldByName('CONDICAO').Value;
    varC_Documento_Mvmestre := Documento;

  finally
    Q.Free;
  end;
end;

procedure TfrmMOVIMENTOMESTRE.btnCalcRegClick(Sender: TObject);
begin
  inherited;

  dm_rc.rc_ShowYesNo( 'POSSO CALCULAR ESSE DOCUMENTO?' );
  if mm.varB_Yes then
    begin
      gravamemoria();
      Calcula_Totais();
      if (VerificaSetemFinanceiro = True) and
         (varC_Documento_Mvmestre = 4)    and
         (dsMaster.State in [dsEdit]) then
        begin
          mm.varI_Code_Numero_Documento :=  sqlMaster.FindField('NUMERO').AsInteger;
          mm.varI_Code_documento_serie  :=  sqlMaster.FindField('SERIE').AsString;

          mm.VarC_Atelagenerica         :=  'PEDIDOFINANCEIRO';
          frmTELAGENERICA.ShowModal();
          ReCalcula_Titulos();
        end
      else
        if sqlMaster.FindField('CONDICAO').AsInteger = 9999 then
          begin
            mm.varV_Valor_Documento          := UniDBFormattedNumberEditvlrtotal.value;

            dm_rc.tbtitulos.Close;
            dm_rc.tbtitulos.CopyDataSet(tbtitulos);

            mm.VarC_Atelagenerica            := 'PARCELAPGTOMOVIMENTO';
            frmTELAGENERICA.ShowModal();

            tbtitulos.Close;
            tbtitulos.Open;

            tbtitulos.CopyDataSet(dm_rc.tbtitulos);
            dm_rc.tbtitulos.Close;
          end
        else
          Calcula_Titulos();
    end;

  Calcula_Documento();

  SetBut(tpCalcular);

  I4.Enabled          := False;
  i2.Enabled          := False;

end;

procedure TfrmMOVIMENTOMESTRE.btnCancelRegClick(Sender: TObject);
begin
  sqlMaster.Cancel;
  sqlMaster.CancelUpdates;

  mm.varC_vendedorstatus := '';

  SetBut(tpListaVazia);

  tbtitulos  .Close;
  memprodutos.Close;

  LimpaVars;
  // The base may close a modal frame; do not access Self after inherited.
  inherited;
end;

procedure TfrmMOVIMENTOMESTRE.btnDeleteRegClick(Sender: TObject);
begin
  if sqlSearchMaster.IsEmpty then Exit;

  dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
  if mm.varB_Yes then
    begin
      dbgSearchCRUDDblClick(Sender);
      Exclui();
    end
  else
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Operação cancelada pelo USUÁRIO!' , 'warning' );
      Abort
    end;
end;

procedure TfrmMOVIMENTOMESTRE.btnEditRegClick(Sender: TObject);
var
  S, R: Integer;
begin
  if sqlSearchMaster.IsEmpty then Exit;

  inherited;
  if not (sqlMaster.State in [dsEdit, dsInsert]) then Exit;

  mm.varC_vendedorstatus := '';
  CarregaMarca();
  pgBaseCadControl.ActivePage := tabRegister;

  SetBut(tpAlterar);

  Try
    UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgRowSelect];
    UniDBGridprodutos.Options          := UniDBGridprodutos.Options + [dgEditing];

//    dbgTITULOS.Options                 := dbgTITULOS.Options + [dgEditing];

    if sqlMaster.State in [dsInsert] then
    begin
      S := 1;
      tbtitulos.Close;
      tbtitulos.Open;

      memprodutos.Close;
      memprodutos.Open;
    end
    else
      S := memprodutos.RecordCount + 30;

    memprodutos.DisableControls;
    memprodutos.AfterDelete  := nil;
    memprodutos.AfterPost    := nil;
    memprodutos.BeforePost   := nil;
    memprodutos.BeforeDelete := nil;

    for R := S to S + 30 do
    begin
      memprodutos.Append;
      memprodutos.Post;
    end;

    memprodutos.First;
    memprodutos.AfterDelete  := memprodutosAfterDelete;
    memprodutos.AfterPost    := memprodutosAfterPost;
    memprodutos.BeforeDelete := memprodutosBeforeDelete;
    memprodutos.BeforePost   := memprodutosBeforePost;
    memprodutos.EnableControls;
    memprodutos.First;

  Except
   Abort ;
  End ;

  I1.Enabled := False;
  i2.Enabled := False;


end;

procedure TfrmMOVIMENTOMESTRE.btnNewRegClick(Sender: TObject);
var
  S, R: Integer;
  CampoCodigo: TComponent;
begin
  inherited;
  if sqlMaster.State <> dsInsert then Exit;

  if DocumentoUnificado then
  begin
    FCarregando := True;
    try UniComboTipoDocumento.ItemIndex := -1; finally FCarregando := False; end;
    UniComboTipoDocumento.Enabled := True;
    varC_Documento_Mvmestre := 0;
  end;
  mm.varC_vendedorstatus := '';

  CarregaMarca();
  pgBaseCadControl.ActivePage := tabRegister;

  SetBut(tpIncluir);

  LimpaVars;

  if not DocumentoUnificado then
    SqlPesquisa('select operacao,serie, condicao from documentos where documento = ' + IntToStr(varC_Documento_Mvmestre) +
                ' and empresa = ' + IntToStr(mm.varI_Code_Company));

   sqlMaster.FindField('PESSOA').AsInteger               := 0;
   sqlMaster.FindField('EMPRESA').AsInteger              := mm.varI_Code_Company;
   sqlMaster.FindField('DOCUMENTO').AsInteger            := varC_Documento_Mvmestre;
   sqlMaster.FindField('NUMERO').AsInteger               := 0;
   sqlMaster.FindField('TRAFRETE').AsInteger             := 0;
   if not DocumentoUnificado then
     sqlMaster.FindField('SERIE').AsString := dm_rc.sqlBuscas.FindField('SERIE').AsString;
   sqlMaster.FindField('EMISSAO').AsDateTime             := Date;
   sqlMaster.FindField('RECEPCAODESPACHO').AsDateTime    := Date;
   if not DocumentoUnificado then
   begin
     sqlMaster.FindField('OPERACAO').AsString := dm_rc.sqlBuscas.FindField('OPERACAO').AsString;
     sqlMaster.FindField('CONDICAO').AsString := dm_rc.sqlBuscas.FindField('CONDICAO').AsString;
   end;
   sqlMaster.FindField('FUNCIONARIO').AsInteger          := mm.varI_User;

   sqlMaster.FindField('VLRDESCONTOS').AsFloat           := 0;
   sqlMaster.FindField('VLRPRODUTOS').AsFloat            := 0;
   sqlMaster.FindField('VLRDESPESAS').AsFloat            := 0;
   sqlMaster.FindField('VLRTOTAL').AsFloat               := 0;

   UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgRowSelect];
   UniDBGridprodutos.Options          := UniDBGridprodutos.Options + [dgEditing];
//   dbgTITULOS.Options                 := dbgTITULOS.Options + [dgEditing];

  if sqlMaster.State in [dsInsert] then
  begin
    S := 1;
    tbtitulos.Close;
    tbtitulos.Open;

    memprodutos.Close;
    memprodutos.Open;
  end
  else
    S := memprodutos.RecordCount + 10;

  memprodutos.DisableControls;
  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.BeforeDelete := nil;

  for R := S to S + 25 do
  begin
    memprodutos.Append;
    memprodutos.Post;
  end;

  memprodutos.First;
  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;
  memprodutos.EnableControls;
  memprodutos.First;

  dm_rc.tb_movimentovendedor.Close;
  dm_rc.tb_movimentovendedor.Open;


  I4.Enabled := True;
  i2.Enabled := False;

  CampoCodigo := FindComponent(LowerCase(edLkpPESSOAS.Name) + '_CodID');
  dm_rc.rc_SetFocus(CampoCodigo);

end;

procedure TfrmMOVIMENTOMESTRE.btnOptionsClick(Sender: TObject);
begin
  inherited;
  UniPopupMenuopcoes.PopupBy( TUniButton( sender ) );
end;

// Reservar na mesma transacao do cabecalho e dos itens. O UPDATE trava
// a linha de DOCUMENTOS e RETURNING devolve o valor efetivamente reservado.
function TfrmMOVIMENTOMESTRE.ReservarNumeroDocumento(
  const Empresa, Documento: Integer): Integer;
var
  Q: TFDQuery;
begin
  if not mm.FDTransaction.Active then
    raise Exception.Create('A transacao do movimento nao esta ativa.');
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := mm.SQLConn;
    Q.Transaction := mm.FDTransaction;
    Q.UpdateTransaction := mm.FDTransaction;
    Q.SQL.Text := 'update DOCUMENTOS set NUMERO = coalesce(NUMERO, 0) + 1 ' +
      'where EMPRESA = :EMPRESA and DOCUMENTO = :DOCUMENTO returning NUMERO';
    Q.ParamByName('EMPRESA').AsInteger := Empresa;
    Q.ParamByName('DOCUMENTO').AsInteger := Documento;
    Q.Open;
    if Q.IsEmpty then
      raise Exception.CreateFmt('Tipo de documento %d nao configurado para a empresa %d.',
        [Documento, Empresa]);
    Result := Q.FieldByName('NUMERO').AsInteger;
    if Result <= 0 then
      raise Exception.Create('A numeracao do documento e invalida.');
  finally
    Q.Free;
  end;
end;

procedure TfrmMOVIMENTOMESTRE.btnSaveRegClick(Sender: TObject);
var
  I         : Integer;
  FoiInclusao: Boolean;
  ValoresAntes: array of Variant;
  vdup      : real;
begin
  // Validation must precede Post/ApplyUpdates on the inherited dataset.
  if not (sqlMaster.State in [dsInsert, dsEdit]) then Exit;
  if DocumentoUnificado and not (sqlMaster.FindField('DOCUMENTO').AsInteger in [3, 4, 10]) then
  begin
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Selecione um tipo de documento configurado para a empresa.', 'warning');
    Exit;
  end;
  if not rc_FormValidate(Self) then Exit;
  if mm.varC_Locked = 'S' then
  begin
    dm_rc.rc_ShowSweetAlert(mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning');
    Exit;
  end;

  if verificastatuspessoa(StrToInt(UniButtonDbEditcodigopessoas.Text)) = True then
    begin
      frmBLOQUEIOPESSOA.ShowModal();
      UniButtonDbEditcodigopessoas.Text := '0';
    end;

  vdup:=0;
  tbtitulos.First;
  tbtitulos.DisableControls;
  while not tbtitulos.Eof do
    begin
      vdup := vdup + tbtitulosVALOR.AsFloat;
      tbtitulos.Next;
    end;
  tbtitulos.First;
  tbtitulos.EnableControls;

  if UniButtonDbEditcodigopessoas.Text = '0' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'INFORME A PESSOA' , 'error' );
      UniButtonDbEditcodigopessoas.SetFocus;
      abort
    end;


  if not (CamposValidados) then
     Abort
  else
    if sqlMaster.State in [dsInsert,dsEdit] then
     Begin
       FoiInclusao := sqlMaster.State = dsInsert;
       SetLength(ValoresAntes, sqlMaster.FieldCount);
       for I := 0 to sqlMaster.FieldCount - 1 do
         ValoresAntes[I] := sqlMaster.Fields[I].Value;

       if not mm.FDTransaction.Active then
         mm.FDTransaction.StartTransaction;
       try
         if sqlMaster.State in [dsInsert] then
           begin
             sqlMaster.FindField('KEY').AsString     := Gera_Guid;
             sqlMaster.FindField('CODIGO').AsInteger := Ultimo_Codigo('MVMESTRE','CODIGO',True);
             sqlMaster.FindField('NUMERO').AsInteger := ReservarNumeroDocumento(mm.varI_Code_Company, sqlMaster.FindField('DOCUMENTO').AsInteger);

             //TABELA DE MEMORIA DE COMISSAO
             dm_rc.tb_movimentovendedor.Append;
             dm_rc.tb_movimentovendedor.FindField('FUNCIONARIO').AsInteger := StrToInt(sqlMaster.FindField('FUNCIONARIO').AsString);
//             dm_rc.tb_movimentovendedor.FindField('NOME').AsString         := Acha_Item('FUNCIONARIOS',UniButtonDbEditvendedor.Text);
             dm_rc.tb_movimentovendedor.FindField('COMISSAO').AsFloat      := UniDBFormattedNumberEditperccomissao.Value;
             dm_rc.tb_movimentovendedor.post;
           end
         else
           begin
             if sqlMaster.FindField('FECHAMENTO_STATUS').AsString = 'Finalizado' then
               begin
                 sqlMaster.FindField('FECHAMENTO_DATA').Clear;
                 sqlMaster.FindField('FECHAMENTO_OBS').AsString    := '';
                 sqlMaster.FindField('FECHAMENTO_STATUS').AsString := 'Sem Ação';
               end;
           end;

         if mm.varT_code_tipo_transportadora = '' then
           sqlMaster.FindField('TRAFRETE').AsInteger         := 0;

         sqlMaster.Post;

         mm.varI_ApplyUpdateErrors := sqlMaster.ApplyUpdates(-1);
         if mm.varI_ApplyUpdateErrors > 0 then
           raise Exception.Create('Falha ao gravar o cabeçalho do movimento.');

         GravaMovimento();

         if mm.FDTransaction.Active then mm.FDTransaction.Commit;
         sqlMaster.CommitUpdates;

         FechaTabelas();

         varC_verificarecalculofinanceiro := '';
         dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success' );
       except
         if mm.FDTransaction.Active then mm.FDTransaction.Rollback;
         sqlMaster.Cancel;
         sqlMaster.CancelUpdates;
         if FoiInclusao then sqlMaster.Insert else sqlMaster.Edit;
         for I := 0 to sqlMaster.FieldCount - 1 do
           if (sqlMaster.Fields[I].FieldKind = fkData) and
              not sqlMaster.Fields[I].ReadOnly then
             sqlMaster.Fields[I].Value := ValoresAntes[I];
         dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE!' , 'error' );
         Exit;
       end;
     End;

  if sqlSearchMaster.Active then
    begin
      sqlSearchMaster.Refresh;
      sqlSearchMaster.Locate('CODIGO',sqlMaster.FindField('CODIGO').AsInteger,[]);
    end;

  if sqlSearchMaster.IsEmpty then
   SetBut(tpListaVazia)
  Else
   SetBut(tpListacomRegistros);

  pgBaseCadControl.ActivePage := tabSearch;

  I1.Enabled := False;
  i2.Enabled := True;
  mm.varC_vendedorstatus := '';
end;

procedure TfrmMOVIMENTOMESTRE.btntranspClick(Sender: TObject);
begin
  inherited;

  mm.varT_code_transportadora      := sqlMaster.FindField('TRANSPORTADORA').AsInteger;
  mm.varT_code_nome_transportadora := sqlMaster.FindField('TRANOME').AsString;
  mm.varT_code_tipo_transportadora := sqlMaster.FindField('TRAFRETE').AsString;
  mm.varT_code_cep_entrega         := sqlMaster.FindField('ENTREGA_CEP').AsString;
  mm.varT_code_ibge_entrega        := sqlMaster.FindField('ENTREGA_IBGE').AsString;
  mm.varT_code_endereco_entrega    := sqlMaster.FindField('ENTREGA_ENDERECO').AsString;
  mm.varT_code_numero_entrega      := sqlMaster.FindField('ENTREGA_NUMERO').AsString;
  mm.varT_code_bairro_entrega      := sqlMaster.FindField('ENTREGA_BAIRRO').AsString;
  mm.varT_code_cidade_entrega      := sqlMaster.FindField('ENTREGA_CIDADE').AsString;
  mm.varT_code_estado_entrega      := sqlMaster.FindField('ENTREGA_ESTADO').AsString;

  frmTRANPORTADORAMOVIMENTO.ShowModal();

  if sqlMaster.State in [dsInsert,dsEdit] then
    begin
      sqlMaster.FindField('TRANSPORTADORA').AsInteger  := mm.varT_code_transportadora;
      sqlMaster.FindField('TRANOME').AsString          := mm.varT_code_nome_transportadora;
      sqlMaster.FindField('TRAFRETE').AsInteger        := StrToInt(mm.varT_code_tipo_transportadora);
      sqlMaster.FindField('ENTREGA_CEP').AsString      := mm.varT_code_cep_entrega;
      sqlMaster.FindField('ENTREGA_IBGE').AsString     := mm.varT_code_ibge_entrega;
      sqlMaster.FindField('ENTREGA_ENDERECO').AsString := mm.varT_code_endereco_entrega;
      sqlMaster.FindField('ENTREGA_NUMERO').AsString   := mm.varT_code_numero_entrega;
      sqlMaster.FindField('ENTREGA_BAIRRO').AsString   := mm.varT_code_bairro_entrega;
      sqlMaster.FindField('ENTREGA_CIDADE').AsString   := mm.varT_code_cidade_entrega;
      sqlMaster.FindField('ENTREGA_ESTADO').AsString   := mm.varT_code_estado_entrega;

      if mm.varT_code_ibge_entrega = '0' then
        begin
          dm_rc.rc_ShowSweetAlert( 'Ok', 'IBGE DA ENTREGA NÃO INFORMADO CORRETAMENTE - CONFIRA - 1º CORRIJA NO CLIENTE, 2º CORRIJA NA ENTREGA' , 'error' );
        end;

      if mm.varT_code_ibge_entrega <> '0' then
        begin
          if mm.varT_code_bairro_entrega = '' then
            begin
              dm_rc.rc_ShowSweetAlert( 'Ok', 'ESTA FALTANDO O BAIRRO DA ENTREGA POR FAVOR CONFIRA' , 'error' );
            end;

          if mm.varT_code_cidade_entrega = '' then
            begin
              dm_rc.rc_ShowSweetAlert( 'Ok', 'ESTA FALTANDO  A CIDADE DA ENTREGA POR FAVOR CONFIRA' , 'error' );
            end;

          if mm.varT_code_numero_entrega = '' then
            begin
              dm_rc.rc_ShowSweetAlert( 'Ok', 'ESTA FALTANDO  O NUMERO DA ENTREGA POR FAVOR CONFIRA' , 'error' );
            end;
        end;

      if mm.varT_code_ibge_entrega = '1058' then
        begin
          dm_rc.rc_ShowSweetAlert( 'Ok', 'IBGE DA ENTREGA NÃO PODE SER 1058 - 1º CORRIJA NO CADASTRO DE PESSOAS' , 'error' );
        end;
    end;

end;

procedure TfrmMOVIMENTOMESTRE.btnvendedorClick(Sender: TObject);
begin
  inherited;
  if (sqlMaster.FindField('FECHAMENTO_STATUS').AsString = 'Finalizado') and (btnNewReg.Visible = True) then
    begin
      carregaMovimento_comissao(sqlMaster.FindField('NUMERO').AsInteger,
                                sqlMaster.FindField('DOCUMENTO').AsInteger,
                                mm.varI_Code_Company);

      mm.varC_vendedorstatus := 'S';

      FrmMOVIMENTOVENDEDOR.ShowModal();

      if DM_RC.tb_movimentovendedor.RecordCount > 0 then
        begin
          executasql('delete from movimento_comissao where numero  = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)    +
                     '                               and documento = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger) +
                     '                               and empresa   = ' + IntToStr(mm.varI_Code_Company));

          TabelaMovimentoComissao('SELECT * FROM MOVIMENTO_COMISSAO WHERE CODIGO = 0');
          DM_RC.tb_movimentovendedor.First;
          while not DM_RC.tb_movimentovendedor.Eof do
            begin
              dm_rc.fdqrymovcomissao.Append;
              dm_rc.fdqrymovcomissao.FindField('KEY').AsString             := Gera_Guid();
              dm_rc.fdqrymovcomissao.FindField('CODIGO').AsInteger         := Ultimo_Codigo('MOVIMENTO_COMISSAO','CODIGO',True);
              dm_rc.fdqrymovcomissao.FindField('SEQUENCIA').AsInteger      := DM_RC.tb_movimentovendedor.RecNo;
              dm_rc.fdqrymovcomissao.FindField('EMPRESA').AsInteger        := mm.varI_Code_Company;
              dm_rc.fdqrymovcomissao.FindField('DOCUMENTO').AsInteger      := sqlMaster.FindField('DOCUMENTO').AsInteger;
              dm_rc.fdqrymovcomissao.FindField('NUMERO').AsInteger         := sqlMaster.FindField('NUMERO').AsInteger;
              dm_rc.fdqrymovcomissao.FindField('FUNCIONARIO').AsInteger    := dm_rc.tb_movimentovendedor.FindField('FUNCIONARIO').AsInteger;
              dm_rc.fdqrymovcomissao.FindField('NOME').AsString            := dm_rc.tb_movimentovendedor.FindField('NOME').AsString;
              dm_rc.fdqrymovcomissao.FindField('COMISSAO').AsFloat         := dm_rc.tb_movimentovendedor.FindField('COMISSAO').AsFloat;
              dm_rc.fdqrymovcomissao.Post;

              dm_rc.tb_movimentovendedor.Next;
            end;
        end;
    end
  else
    begin
      if sqlMaster.Active then
        begin
          if sqlMaster.State in [dsInsert,dsEdit] then
            mm.varC_vendedorstatus := 'S'
          else
            begin
              carregaMovimento_comissao(sqlMaster.FindField('NUMERO').AsInteger,
                                        sqlMaster.FindField('DOCUMENTO').AsInteger,
                                        mm.varI_Code_Company);
              mm.varC_vendedorstatus := '';
            end;
          FrmMOVIMENTOVENDEDOR.ShowModal();
        end;
    end;
end;

procedure TfrmMOVIMENTOMESTRE.Calcula_Titulos;
var
  M_PARCELAS : TStringList;
  R          : Integer;
  M_RESTO    : Real;
  ORDEM,
  M_ITENS    : Integer;
begin
  tbtitulos.Close;
  tbtitulos.Open;

  if SqlPesquisa('SELECT * FROM CONDICOES WHERE CODIGO = ' + QuotedStr(sqlMaster.FieldByName('CONDICAO').AsString)) then

  ORDEM      := 0;
  M_PARCELAS := Explode(TRIM(dm_rc.sqlBuscas.FindField('OBSERVACOES').AsString),',');
  M_RESTO    := UniDBFormattedNumberEditvlrtotal.Value;
  M_ITENS    := variif(dm_rc.sqlBuscas.FindField('PARCELAS').AsInteger=0,1,dm_rc.sqlBuscas.FindField('PARCELAS').AsInteger);

  if M_PARCELAS.Count <  M_ITENS then
    begin
      for R := M_PARCELAS.Count to M_ITENS -1 do
        begin
          M_PARCELAS.Add(IntToStr(R * 30));
        end;
    end;

  for R := 0 to M_PARCELAS.Count - 1 do
    begin
      inc(ORDEM);
      tbtitulos.Append;
      tbtitulos.FindField('VENCIMENTO').AsDateTime := UniDBDateTimePickeremissao.DateTime + Valor(M_PARCELAS[R]);
      tbtitulos.FindField('VALOR').AsFloat         := MRound(UniDBFormattedNumberEditvlrtotal.Value / M_ITENS,2);
      tbtitulos.FindField('PARCELA').AsInteger     := ORDEM;
      tbtitulos.FindField('STATUS').AsString       := 'Aberto';
      tbtitulos.Post;
      M_RESTO := M_RESTO - tbtitulos.FindField('VALOR').AsFloat;
    end;

  if M_RESTO > 0 then
    begin
      tbtitulos.Last;
      tbtitulos.Edit;
      tbtitulos.FindField('VALOR').AsFloat := tbtitulos.FindField('VALOR').AsFloat + Abs(M_RESTO);
      tbtitulos.Post;
    end
  else
    if M_RESTO < 0 then
      begin
        tbtitulos.First;
        tbtitulos.Edit;
        tbtitulos.FindField('VALOR').AsFloat := tbtitulos.FindField('VALOR').AsFloat - Abs(M_RESTO);
        tbtitulos.Post;
      end;

  tbtitulos.First;

end;


procedure TfrmMOVIMENTOMESTRE.Calcula_Documento;
var
  Financeiro: TfrmFINANCEIRONOTA;
  CodigoNota: Integer;
begin
  if not (sqlMaster.State in [dsInsert, dsEdit]) then
  begin
    dm_rc.rc_ShowMessage('Clique em Novo ou Edita para alterar as parcelas.');
    Exit;
  end;
  if not tbtitulos.Active then tbtitulos.Open;
  if tbtitulos.State in dsEditModes then tbtitulos.Post;
  CodigoNota:=sqlMaster.FieldByName('CODIGO').AsInteger;
  Financeiro:=frmFINANCEIRONOTA;
  Financeiro.Preparar(tbtitulos,
    UniDBFormattedNumberEditvlrtotal.Value,
    'Nota '+sqlMaster.FieldByName('NUMERO').AsString);
  Financeiro.ShowModal(
    procedure(Sender: TComponent; AResult: Integer)
    var Backup: TFDMemTable;
    begin
      if AResult<>mrOK then Exit;
      if not (sqlMaster.State in [dsInsert, dsEdit]) or
         (sqlMaster.FieldByName('CODIGO').AsInteger<>CodigoNota) then
      begin
        dm_rc.rc_ShowMessage('A nota mudou durante a edicao. Abra o financeiro novamente.');
        Exit;
      end;
      Backup:=TFDMemTable.Create(nil);
      try
        Backup.CopyDataSet(tbtitulos,[coStructure,coRestart,coAppend]);
        tbtitulos.DisableControls;
        try
          try
            tbtitulos.Close;
            tbtitulos.Open;
            tbtitulos.CopyDataSet(Financeiro.memParcelas);
          except
            tbtitulos.Cancel;
            tbtitulos.EmptyDataSet;
            tbtitulos.CopyDataSet(Backup,[coRestart,coAppend]);
            raise;
          end;
        finally tbtitulos.EnableControls; end;
      finally Backup.Free; end;
    end);
end;



procedure TfrmMOVIMENTOMESTRE.Calcula_Totais;
var
  M_VLRPRODUTOS, M_VLRDESCONTO, M_VLRLIQUIDO, M_VLRDESPESA, M_VLRTOTAL, M_VLRSERVICOS, M_VLRRESTO, M_FRETE, M_QUANTIDADE: Real;
  M_MARCA: TBookMark;
  M_PESO: Real;
  M_BRUTO: Real;
  M_BASE: Real;
  M_VICM: Real;
  M_BASU: Real;
  M_VSUB: Real;
  M_VIPI: Real;
  M_SACOS: Real;
  M_SEGURO: Real;
  M_VLRIMPOSTO: Real;
  M_TOTIPI: Real;
  M_VALORCICMSF: Real;
  R: Pointer;
begin

  M_MARCA := memprodutos.GetBookmark;
  memprodutos.DisableControls;

  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.BeforeDelete := nil;
  memprodutos.First;

  M_VLRPRODUTOS := 0;
  M_VLRTOTAL    := 0;
  M_VLRSERVICOS := 0;
  M_VLRDESCONTO := 0;
  M_QUANTIDADE  := 0;
  M_FRETE       := 0;
  M_BASE        := 0;
  M_VICM        := 0;
  M_BASU        := 0;
  M_VSUB        := 0;
  M_VIPI        := 0;
  M_VLRIMPOSTO  := 0;
  M_PESO        := 0;
  M_BRUTO       := 0;
  M_TOTIPI      := 0;
  M_VALORCICMSF := 0;
  M_SACOS       := 0;
  M_SEGURO      := 0;
  M_BRUTO       := 0;

  if UniDBFormattedNumberEditdescontos.Value > 0 then
    begin
      M_VLRPRODUTOS := 0;
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('PRODUTO').AsInteger > 0 then
            M_VLRPRODUTOS := M_VLRPRODUTOS + memprodutos.FindField('TOTAL').AsFloat;
          memprodutos.next;
          Application.ProcessMessages;
        end;
      M_VLRRESTO   := UniDBFormattedNumberEditdescontos.Value ;
      M_VLRLIQUIDO := (M_VLRPRODUTOS - UniDBFormattedNumberEditdescontos.Value);
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('PRODUTO').AsInteger > 0 then
            begin
              memprodutos.Edit;
              memprodutos.FindField('LIQUIDO').AsFloat  := Mround(memprodutos.FindField('TOTAL').AsFloat - MRound(((UniDBFormattedNumberEditdescontos.Value / M_VLRPRODUTOS) * memprodutos.FindField('TOTAL').AsFloat),2),2);
              memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('TOTAL').AsFloat - memprodutos.FindField('LIQUIDO').AsFloat;
              memprodutos.Post;
              M_VLRRESTO   := M_VLRRESTO   - memprodutos.FindField('DESCONTO').AsFloat;
              M_VLRLIQUIDO := M_VLRLIQUIDO - memprodutos.FindField('LIQUIDO').AsFloat;
            end;
          memprodutos.next;
          Application.ProcessMessages;
        end;
      memprodutos.First;
      memprodutos.Edit;
      if M_VLRRESTO > 0 then
        memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('DESCONTO').AsFloat + Abs(M_VLRRESTO)
      else
        if M_VLRRESTO < 0 then
          memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('DESCONTO').AsFloat - Abs(M_VLRRESTO);
      if M_VLRLIQUIDO > 0 then
        memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('LIQUIDO').AsFloat + Abs(M_VLRLIQUIDO)
      else
        if M_VLRLIQUIDO < 0 then
          memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('LIQUIDO').AsFloat - Abs(M_VLRLIQUIDO);
      memprodutos.Post;
    end
  else
    begin
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('PRODUTO').AsInteger > 0 then
            begin
              memprodutos.Edit;
              memprodutos.FindField('LIQUIDO').AsFloat  := memprodutos.FindField('TOTAL').AsFloat;
              memprodutos.FindField('DESCONTO').AsFloat := 0;
              memprodutos.Post;
            end;
          memprodutos.next;
          Application.ProcessMessages;
        end;
    end;

  memprodutos.First;
  while not memprodutos.eof do
  begin
    if memprodutos.FindField('PRODUTO').AsInteger > 0 then
    begin
      memprodutos.Edit;
      memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('TOTAL').AsFloat;
      memprodutos.Post;
    end;
    memprodutos.next;
    Application.ProcessMessages;
  end;


  //**********************************************************************//
  // CALCULA DESCONTO UNITARIO
  //**********************************************************************//
  if UniDBFormattedNumberEditdescontos.Value > 0 then
  begin
    M_VLRPRODUTOS := 0;
    memprodutos.First;
    while not memprodutos.eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        M_VLRPRODUTOS := M_VLRPRODUTOS + memprodutos.FindField('TOTAL').AsFloat;
      memprodutos.next;
      Application.ProcessMessages;
    end;
    M_VLRRESTO := UniDBFormattedNumberEditdescontos.Value;
    M_VLRLIQUIDO := (M_VLRPRODUTOS - UniDBFormattedNumberEditdescontos.Value);
    memprodutos.First;
    while not memprodutos.eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
      begin
        memprodutos.Edit;
        memprodutos.FindField('LIQUIDO').AsFloat  := Mround(memprodutos.FindField('TOTAL').AsFloat - MRound(((UniDBFormattedNumberEditdescontos.Value / M_VLRPRODUTOS) * memprodutos.FindField('TOTAL').AsFloat), 2), 2);
        memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('TOTAL').AsFloat - memprodutos.FindField('LIQUIDO').AsFloat;
        memprodutos.Post;
        M_VLRRESTO   := M_VLRRESTO   - memprodutos.FindField('DESCONTO').AsFloat;
        M_VLRLIQUIDO := M_VLRLIQUIDO - memprodutos.FindField('LIQUIDO').AsFloat;
      end;
      memprodutos.next;
      Application.ProcessMessages;
    end;
    memprodutos.First;
    memprodutos.Edit;
    if M_VLRRESTO > 0 then
      memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('DESCONTO').AsFloat + Abs(M_VLRRESTO)
    else if M_VLRRESTO < 0 then
      memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('DESCONTO').AsFloat - Abs(M_VLRRESTO);
    if M_VLRLIQUIDO > 0 then
      memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('LIQUIDO').AsFloat + Abs(M_VLRLIQUIDO)
    else if M_VLRLIQUIDO < 0 then
      memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('LIQUIDO').AsFloat - Abs(M_VLRLIQUIDO);
    memprodutos.Post;
  end
  else
  begin
    memprodutos.First;
    while not memprodutos.eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
      begin
        memprodutos.Edit;
        memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('TOTAL').AsFloat;
        memprodutos.FindField('DESCONTO').AsFloat := 0;
        memprodutos.Post;
      end;
      memprodutos.next;
      Application.ProcessMessages;
    end;
  end;

  M_VLRDESPESA := (UniDBFormattedNumberEditvlrdespesas.Value);

  if M_VLRDESPESA >= 0 then
  begin
    memprodutos.First;
    M_VLRLIQUIDO := 0;
    while not memprodutos.eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        M_VLRLIQUIDO := M_VLRLIQUIDO + memprodutos.FindField('LIQUIDO').Value;
      memprodutos.next;
    end;
    M_VLRRESTO := M_VLRDESPESA;
    memprodutos.First;
    while not memprodutos.eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
      begin
        memprodutos.Edit;
        memprodutos.FindField('DESPESA').AsFloat := MRound(((M_VLRDESPESA) / M_VLRLIQUIDO) * memprodutos.FindField('LIQUIDO').Value, 2);
        memprodutos.Post;
        M_VLRRESTO := M_VLRRESTO - memprodutos.FindField('DESPESA').AsFloat;
      end;
      memprodutos.next;
    end;
    memprodutos.First;
    memprodutos.Edit;
    if M_VLRRESTO > 0 then
      memprodutos.FindField('DESPESA').AsFloat := memprodutos.FindField('DESPESA').AsFloat + Abs(M_VLRRESTO)
    else if M_VLRRESTO < 0 then
      memprodutos.FindField('DESPESA').AsFloat := memprodutos.FindField('DESPESA').AsFloat - Abs(M_VLRRESTO);
    memprodutos.Post;
  end;

  M_VLRPRODUTOS := 0;
  M_VLRTOTAL    := 0;

  memprodutos.First;
  while not memprodutos.eof do
  begin
    if memprodutos.FindField('PRODUTO').AsInteger > 0 then
    begin
      //*****************************************************************//
      // PESO LIQUIDO/BRUTO
      //*****************************************************************//
      memprodutos.Edit;
      memprodutos.FindField('PESOLIQUIDO').AsFloat := memprodutos.FindField('QUANTIDADE').AsFloat;
      memprodutos.FindField('PESOBRUTO').AsFloat   := memprodutos.FindField('QUANTIDADE').AsFloat;
      memprodutos.Post;
      //*****************************************************************//

      //*****************************************************************//
      // VALORES
      //*****************************************************************//
      M_BRUTO       := M_BRUTO       + memprodutos.FindField('PESOBRUTO').AsFloat;
      if memprodutos.FindField('PESOSACO').AsFloat > 0 then
        M_QUANTIDADE  := M_QUANTIDADE  + memprodutos.FindField('QUANTIDADE').AsFloat / memprodutos.FindField('PESOSACO').AsFloat
      else
        M_QUANTIDADE  := M_QUANTIDADE  + memprodutos.FindField('QUANTIDADE').AsFloat;

      M_VLRPRODUTOS := M_VLRPRODUTOS + memprodutos.FindField('TOTAL').AsFloat;
      M_VLRDESCONTO := M_VLRDESCONTO + memprodutos.FindField('DESCONTO').AsFloat;
      M_FRETE       := M_FRETE       + memprodutos.FindField('FRETE').AsFloat;
      M_SEGURO      := M_SEGURO      + memprodutos.FindField('SEGURO').AsFloat;
      M_BASE        := M_BASE        + memprodutos.FindField('BASEICMS').AsFloat;
      M_VICM        := M_VICM        + memprodutos.FindField('VALORICMS').AsFloat;
      M_VLRTOTAL    := M_VLRTOTAL    + memprodutos.FindField('LIQUIDO').AsFloat + memprodutos.FindField('FRETE').AsFloat    +
                                                                                  memprodutos.FindField('VALORIPI').AsFloat +
                                                                                  memprodutos.FindField('DESPESA').AsFloat  +
                                                                                  memprodutos.FindField('SEGURO').AsFloat;

      //*****************************************************************//
    end;
    memprodutos.next;
  end;

  UniDBFormattedNumberEditvlrprodutos.Value     := MRound(M_VLRPRODUTOS,2);
  UniDBFormattedNumberEditvlrtotal.Value        := MRound(M_VLRTOTAL,2);
  UniDBFormattedNumberEditquantidade.Value      := MRound(M_QUANTIDADE,2);
  UniDBFormattedNumberEditPESOBRUTO.Value       := MRound(M_BRUTO,2);

  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;

  memprodutos.GotoBookmark(M_MARCA);
  memprodutos.FreeBookmark(M_MARCA);
  memprodutos.Refresh;
  memprodutos.EnableControls;

end;

function TfrmMOVIMENTOMESTRE.CamposValidados: Boolean;
var
  i,e :Integer;
  Campos :TStrings;
begin
  Try
    Campos := TStringList.Create;
    Campos.Clear ;
    e := 0 ;
    for I:= 0 to ComponentCount -1 do
       begin
         if ( Components[I] is TUniDBEdit )  then
            begin

               If ( TUniDBEdit(Components[i]).Tag = 1 ) then
                 Begin
                   if TUniDBEdit(Components[i]).Text = '' then
                      begin
                        Campos.Add('-' + TUniDBEdit(Components[i]).Field.DisplayName ) ;
                        inc(e) ;
                      end;
                 End;
            end;
       end;

     if e = 0  then
        result := true ;

     If e > 0 then
        Begin
           Campos.Insert(0,'Preencha os campos obrigatórios:');
           dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', Campos.Text, 'warning' );
           sqlMaster.Fields[e].FocusControl ;
           result := false ;
        end
     Else
       result := true;

  finally
    Campos.Free;
  end;
end;

procedure TfrmMOVIMENTOMESTRE.carregadados;
begin
  if DocumentoUnificado then
  begin
    varC_Documento_Mvmestre := sqlMaster.FindField('DOCUMENTO').AsInteger;
    MostrarTipoDocumento(varC_Documento_Mvmestre);
    UniComboTipoDocumento.Enabled := False;
  end;
  CarregaMarca();

  tbtitulos.Close;
  tbtitulos.Open;

  memprodutos.Close;
  memprodutos.Open;

  if SqlPesquisa('SELECT CODIGO, NOME, CIDADE, ESTADO FROM PESSOAS WHERE CODIGO = ' + IntToStr(sqlMaster.FindField('PESSOA').AsInteger)) then
    begin
//      UniEditnomepessoa.Text := dm_rc.sqlBuscas.FindField('NOME').AsString;
      UniEditcidade.Text     := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
      UniEditestado.Text     := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
    end;

  if sqlMaster.FieldByName('DOCUMENTO').AsInteger = 10 then
    CarregarParcelasPrevistas
  else if sqlMaster.FieldByName('DOCUMENTO').AsInteger = 4 then
  begin
  SqlPesquisa   ('SELECT FINANCEIRO FROM OPERACOES WHERE CODIGO   = ' + IntToStr(sqlMaster.FindField('OPERACAO').AsInteger));
  if SqlPesquisa(' SELECT SEQUENCIA, VENCIMENTO, SITUACAO, VALORORIGINAL FROM ' + variif(dm_rc.sqlBuscas.FindField('FINANCEIRO').AsInteger = 1,' RECEBER ', ' PAGAR ')+' WHERE NUMERO = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)   +
                 ' AND DOCUMENTO                                                         = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger)+
                 ' AND EMPRESA                                                           = ' + IntToStr(mm.varI_Code_Company)                     +
                 ' ORDER BY SEQUENCIA') then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          tbtitulos.Append;
          tbtitulos.FindField('PARCELA').AsInteger     := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsInteger;
          tbtitulos.FindField('VENCIMENTO').AsDateTime := dm_rc.sqlBuscas.FindField('VENCIMENTO').AsDateTime;
          tbtitulos.FindField('VALOR').AsFloat         := dm_rc.sqlBuscas.FindField('VALORORIGINAL').AsFloat;
          tbtitulos.FindField('STATUS').AsString       := dm_rc.sqlBuscas.FindField('SITUACAO').AsString;
          tbtitulos.Post;

          dm_rc.sqlBuscas.Next;
        end;

      tbtitulos.First;
    end;

  end;

  if SqlPesquisa(' SELECT * FROM MVITENS WHERE NUMERO   = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)   +
                 ' AND DOCUMENTO                        = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger)+
                 ' AND EMPRESA                          = ' + IntToStr(mm.varI_Code_Company)                     +
                 ' ORDER BY SEQUENCIA') then
  begin
    memprodutos.DisableControls;
    memprodutos.AfterDelete  := nil;
    memprodutos.AfterPost    := nil;
    memprodutos.BeforePost   := nil;
    memprodutos.BeforeDelete := nil;

    dm_rc.sqlBuscas.First;
    while not dm_rc.sqlBuscas.Eof do
      begin
        memprodutos.Append;
        memprodutos.FindField('PRODUTO').AsInteger       :=  dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
        memprodutos.FindField('DESCRICAO').AsString      :=  dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
        memprodutos.FindField('UNIDADE').AsString        :=  dm_rc.sqlBuscas.FindField('UNIDADE').AsString;
        memprodutos.FindField('OPERACAO').AsString       :=  dm_rc.sqlBuscas.FindField('OPERACAO').AsString;
        memprodutos.FindField('CST').AsString            :=  dm_rc.sqlBuscas.FindField('CST').AsString;
        memprodutos.FindField('PRECO').AsFloat           :=  dm_rc.sqlBuscas.FindField('PRECO').AsFloat;
        memprodutos.FindField('DESCONTO').AsFloat        :=  dm_rc.sqlBuscas.FindField('DESCONTO').AsFloat;
        memprodutos.FindField('QUANTIDADE').AsFloat      :=  dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
        memprodutos.FindField('TOTAL').AsFloat           :=  dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
        memprodutos.FindField('PERCICMS').AsFloat        :=  dm_rc.sqlBuscas.FindField('PERCICMS').AsFloat;
        memprodutos.FindField('VALORICMS').AsFloat       :=  dm_rc.sqlBuscas.FindField('VALORICMS').AsFloat;
        memprodutos.FindField('BASEICMS').AsFloat        :=  dm_rc.sqlBuscas.FindField('BASEICMS').AsFloat;
        memprodutos.FindField('PEDIDOOR').AsString       :=  dm_rc.sqlBuscas.FindField('PEDIDOOR').AsString;
        memprodutos.FindField('PESOSACO').AsString       :=  dm_rc.sqlBuscas.FindField('PESOSACO').AsString;
        memprodutos.FindField('NUMERONCM').AsString      :=  dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;
        memprodutos.FindField('PEDIDOITEMOR').AsString   :=  dm_rc.sqlBuscas.FindField('PEDIDOITEMOR').AsString;

        if dm_rc.sqlBuscas.FindField('LOTESEMENTE').AsString <> '' then
          begin
            memprodutos.FindField('DESCRICAO_NOTA').AsString := dm_rc.sqlBuscas.Findfield('DESCRICAO_NOTA').AsString;
            memprodutos.FindField('LOTESEMENTE').AsString    := dm_rc.sqlBuscas.Findfield('LOTESEMENTE').AsString;
            memprodutos.FindField('BOLETIMSEMENTE').AsString := dm_rc.sqlBuscas.Findfield('BOLETIMSEMENTE').AsString;
            memprodutos.FindField('TERMOSEMENTE').AsString   := dm_rc.sqlBuscas.Findfield('TERMOSEMENTE').AsString;
            memprodutos.FindField('VALIDADE').AsString       := dm_rc.sqlBuscas.Findfield('VALIDADE').AsString;
            memprodutos.FindField('CATEGORIA').AsString      := dm_rc.sqlBuscas.Findfield('CATEGORIA').AsString;
            memprodutos.FindField('SAFRAVALIDA').AsString    := dm_rc.sqlBuscas.Findfield('SAFRAVALIDA').AsString;
            memprodutos.FindField('VALORCULTURAL').AsFloat   := dm_rc.sqlBuscas.Findfield('VALORCULTURAL').AsFloat;
            memprodutos.FindField('GERMINACAO').AsFloat      := dm_rc.sqlBuscas.Findfield('GERMINACAO').AsFloat;
            memprodutos.FindField('PUREZA').AsFloat          := dm_rc.sqlBuscas.Findfield('PUREZA').AsFloat;
            memprodutos.FindField('TOTALPONTO').AsFloat      := dm_rc.sqlBuscas.Findfield('TOTALPONTO').AsFloat;
            memprodutos.FindField('PESOSACO').AsFloat        := dm_rc.sqlBuscas.Findfield('PESOSACO').AsFloat;
            memprodutos.FindField('TIPOLOTE').AsString       := dm_rc.sqlBuscas.Findfield('TIPOLOTE').AsString;
          end;

        memprodutos.Post;

        dm_rc.sqlBuscas.Next;
      end;

    memprodutos.AfterDelete  := memprodutosAfterDelete;
    memprodutos.AfterPost    := memprodutosAfterPost;
    memprodutos.BeforeDelete := memprodutosBeforeDelete;
    memprodutos.BeforePost   := memprodutosBeforePost;
    memprodutos.EnableControls;
    memprodutos.first;
  end;

  carregaMovimento_comissao(sqlMaster.FindField('NUMERO').AsInteger,
                            sqlMaster.FindField('DOCUMENTO').AsInteger,
                            mm.varI_Code_Company);


  I4.Enabled := False;
  i2.Enabled := True;

  mm.varC_vendedorstatus          := '';
end;

procedure TfrmMOVIMENTOMESTRE.carregafinanceiro(cempresa, cdocumento,
  cnumero: integer);
begin
  TabelaOperacao('select financeiro from operacoes where codigo = ' + QuotedStr(sqlMaster.FindField('OPERACAO').AsString));

  if SqlPesquisa(' SELECT SEQUENCIA, VENCIMENTO, VALORORIGINAL, SITUACAO FROM '+variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR') +
                 ' WHERE NUMERO                                                          = ' + IntToStr(cnumero)   +
                 ' AND DOCUMENTO                                                         = ' + IntToStr(cdocumento)+
                 ' AND EMPRESA                                                           = ' + IntToStr(cempresa)                     +
                 ' ORDER BY SEQUENCIA') then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          tbtitulos.Append;
          tbtitulos.FindField('PARCELA').AsInteger     := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsInteger;
          tbtitulos.FindField('VENCIMENTO').AsDateTime := dm_rc.sqlBuscas.FindField('VENCIMENTO').AsDateTime;
          tbtitulos.FindField('VALOR').AsFloat         := dm_rc.sqlBuscas.FindField('VALORORIGINAL').AsFloat;
          tbtitulos.FindField('STATUS').AsString       := dm_rc.sqlBuscas.FindField('SITUACAO').AsString;
          tbtitulos.Post;

          dm_rc.sqlBuscas.Next;
        end;

      tbtitulos.First;
    end;
end;

procedure TfrmMOVIMENTOMESTRE.CarregaImportacao(const controle: integer);
var i                : integer; Cmp:String;
    R,S              : Integer;
    tabelafinanceiro : string;
begin
  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(controle));

  if SqlPesquisa('SELECT * FROM OPERACOES WHERE CODIGO = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('OPERACAO').AsInteger)) then
    begin
      if dm_rc.sqlBuscas.FindField('FINANCEIRO').AsInteger = 1 then
        tabelafinanceiro := 'RECEBER'
      else
        tabelafinanceiro := 'PAGAR';
    end;


  sqlMaster.FindField('PESSOA').AsInteger            := DM_RC.FDQryMvmestre.FindField('PESSOA').AsInteger;
  sqlMaster.FindField('CONDICAO').AsInteger          := DM_RC.FDQryMvmestre.FindField('CONDICAO').AsInteger;
  sqlMaster.FindField('FUNCIONARIO').AsInteger       := DM_RC.FDQryMvmestre.FindField('FUNCIONARIO').AsInteger;

  sqlMaster.FindField('COMISSAOFUNCIONARIO').AsFloat := DM_RC.FDQryMvmestre.FindField('COMISSAOFUNCIONARIO').AsFloat;
  sqlMaster.FindField('EMISSAO').AsDateTime          := Date;
  sqlMaster.FindField('RECEPCAODESPACHO').AsDateTime := Date;

  sqlMaster.FindField('VLRDSPNTRIBUTADA').AsFloat    := DM_RC.FDQryMvmestre.FindField('VLRDSPNTRIBUTADA').AsFloat;
  sqlMaster.FindField('VLRDSPTRIBUTADA').AsFloat     := DM_RC.FDQryMvmestre.FindField('VLRDSPTRIBUTADA').AsFloat;
  sqlMaster.FindField('VLRBASEICMS').AsFloat         := DM_RC.FDQryMvmestre.FindField('VLRBASEICMS').AsFloat;
  sqlMaster.FindField('VLRICMS').AsFloat             := DM_RC.FDQryMvmestre.FindField('VLRICMS').AsFloat;
  sqlMaster.FindField('VLRDESCONTOS').AsFloat        := DM_RC.FDQryMvmestre.FindField('VLRDESCONTOS').AsFloat;
  sqlMaster.FindField('VLRDESPESAS').AsFloat         := DM_RC.FDQryMvmestre.FindField('VLRDESPESAS').AsFloat;
  sqlMaster.FindField('VLRPRODUTOS').AsFloat         := DM_RC.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat;
  sqlMaster.FindField('VLRTOTAL').AsFloat            := DM_RC.FDQryMvmestre.FindField('VLRTOTAL').AsFloat;
  sqlMaster.FindField('OBSERVACOES').AsString        := DM_RC.FDQryMvmestre.FindField('OBSERVACOES').AsString;

  sqlMaster.FindField('PEDIDO').AsString             := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;
  sqlMaster.FindField('PEDIDO_SERIE').AsString       := dm_rc.FDQryMvmestre.FindField('SERIE').AsString;
  sqlMaster.FindField('PEDIDO_DOCUMENTO').AsInteger  := dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger;
  sqlMaster.FindField('NUMERO').AsInteger            := 0;

  sqlMaster.FindField('TRANSPORTADORA').AsInteger    :=  dm_rc.FDQryMvmestre.FindField('TRANSPORTADORA').AsInteger;
  sqlMaster.FindField('TRANOME').AsString            :=  dm_rc.FDQryMvmestre.FindField('TRANOME').AsString;

  if dm_rc.FDQryMvmestre.FindField('ENTREGA_IBGE').AsString <> '' then
    begin
      sqlMaster.FindField('TRAFRETE').AsString         := dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsString;
      sqlMaster.FindField('ENTREGA_CEP').AsString      := dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString;
      sqlMaster.FindField('ENTREGA_IBGE').AsString     := dm_rc.FDQryMvmestre.FindField('ENTREGA_IBGE').AsString;
      sqlMaster.FindField('ENTREGA_ENDERECO').AsString := dm_rc.FDQryMvmestre.FindField('ENTREGA_ENDERECO').AsString;
      sqlMaster.FindField('ENTREGA_NUMERO').AsString   := dm_rc.FDQryMvmestre.FindField('ENTREGA_NUMERO').AsString;
      sqlMaster.FindField('ENTREGA_BAIRRO').AsString   := dm_rc.FDQryMvmestre.FindField('ENTREGA_BAIRRO').AsString;
      sqlMaster.FindField('ENTREGA_CIDADE').AsString   := dm_rc.FDQryMvmestre.FindField('ENTREGA_CIDADE').AsString;
      sqlMaster.FindField('ENTREGA_ESTADO').AsString   := dm_rc.FDQryMvmestre.FindField('ENTREGA_ESTADO').AsString;
    end;

  varC_Documento_Mvmestre       := sqlMaster.FindField('DOCUMENTO').AsInteger;

  memprodutos.Close;
  memprodutos.Open;

  carregaitens     (mm.varI_Code_Company,dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger,dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger);

  if SqlPesquisa(' SELECT *                                    FROM       ' + tabelafinanceiro +
                 ' WHERE NUMERO                                         = ' + IntToStr(DM_RC.FDQryMvmestre.FindField('numero').AsInteger)   +
                 ' AND DOCUMENTO                                        = ' + IntToStr(DM_RC.FDQryMvmestre.FindField('documento').AsInteger)+
                 ' AND EMPRESA                                          = ' + IntToStr(DM_RC.FDQryMvmestre.FindField('empresa').AsInteger)  +
                 ' ORDER BY SEQUENCIA') then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          tbtitulos.Append;
          tbtitulos.FindField('PARCELA').AsInteger     := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsInteger;
          tbtitulos.FindField('VENCIMENTO').AsDateTime := dm_rc.sqlBuscas.FindField('VENCIMENTO').AsDateTime;
          tbtitulos.FindField('VALOR').AsFloat         := dm_rc.sqlBuscas.FindField('VALORORIGINAL').AsFloat;
          tbtitulos.Post;

          dm_rc.sqlBuscas.Next;
        end;

      tbtitulos.First;
    end;

  //************************************************************************//
  // VERIFICA OS ITENS
  //************************************************************************//
  ReleituraProdutoscfop();
  //************************************************************************//
  dm_rc.FDQryMvmestre.Close;
end;

procedure TfrmMOVIMENTOMESTRE.carregaitens(cempresa, cdocumento,
  cnumero: integer);
var
  M_MARCA: TBookMark;
begin
  M_MARCA := memprodutos.GetBookmark;
  memprodutos.First;
  memprodutos.DisableControls;
  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.BeforeDelete := nil;
  memprodutos.First;

  if SqlPesquisa(' SELECT * FROM MVITENS WHERE NUMERO   = ' + IntToStr(cnumero)    +
                 ' AND DOCUMENTO                        = ' + IntToStr(cdocumento) +
                 ' AND EMPRESA                          = ' + IntToStr(cempresa)   +
                 ' ORDER BY SEQUENCIA') then
  begin
    memprodutos.First;
    dm_rc.sqlBuscas.First;
    while not dm_rc.sqlBuscas.Eof do
      begin
        memprodutos.Append;
        memprodutos.FindField('PRODUTO').AsInteger       :=  dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
        memprodutos.FindField('DESCRICAO').AsString      :=  dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
        memprodutos.FindField('NUMERONCM').AsString      :=  dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;

        memprodutos.FindField('UNIDADE').AsString        :=  dm_rc.sqlBuscas.FindField('UNIDADE').AsString;
        memprodutos.FindField('OPERACAO').AsString       :=  dm_rc.sqlBuscas.FindField('OPERACAO').AsString;
        memprodutos.FindField('CST').AsString            :=  dm_rc.sqlBuscas.FindField('CST').AsString;
        memprodutos.FindField('PRECO').AsFloat           :=  dm_rc.sqlBuscas.FindField('PRECO').AsFloat;
        memprodutos.FindField('DESCONTO').AsFloat        :=  dm_rc.sqlBuscas.FindField('DESCONTO').AsFloat;
        memprodutos.FindField('QUANTIDADE').AsFloat      :=  dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
        memprodutos.FindField('TOTAL').AsFloat           :=  dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
        memprodutos.FindField('PESOBRUTO').AsFloat       :=  dm_rc.sqlBuscas.FindField('PESOBRUTO').AsFloat;
        memprodutos.FindField('PESOLIQUIDO').AsFloat     :=  dm_rc.sqlBuscas.FindField('PESOLIQUIDO').AsFloat;
        memprodutos.FindField('FRETE').AsFloat           :=  dm_rc.sqlBuscas.FindField('FRETE').AsFloat;

        //********************************************************************//
        // IMPOSTOS
        //********************************************************************//
        memprodutos.FindField('PERCICMS').AsFloat        :=  dm_rc.sqlBuscas.FindField('PERCICMS').AsFloat;
        memprodutos.FindField('VALORICMS').AsFloat       :=  dm_rc.sqlBuscas.FindField('VALORICMS').AsFloat;
        memprodutos.FindField('BASEICMS').AsFloat        :=  dm_rc.sqlBuscas.FindField('BASEICMS').AsFloat;

        memprodutos.FindField('PIS').AsString             :=  dm_rc.sqlBuscas.FindField('PIS').AsString;
        memprodutos.FindField('COFINS').AsString          :=  dm_rc.sqlBuscas.FindField('COFINS').AsString;
        memprodutos.FindField('VLRPIS').AsString          :=  dm_rc.sqlBuscas.FindField('VLRPIS').AsString;
        memprodutos.FindField('VLRCOFINS').AsString       :=  dm_rc.sqlBuscas.FindField('VLRCOFINS').AsString;
        memprodutos.FindField('TOTALPIS').AsString        :=  dm_rc.sqlBuscas.FindField('TOTALPIS').AsString;
        memprodutos.FindField('TOTALCOFINS').AsString     :=  dm_rc.sqlBuscas.FindField('TOTALCOFINS').AsString;
        //********************************************************************//

        //********************************************************************//
        // BASE DOS IMPOSTOS
        //********************************************************************//
        if SqlProdutos  ('SELECT PRODUTOS.*,SALDOS.* FROM PRODUTOS JOIN SALDOS ON SALDOS.EMPRESA = ' + IntToStr(cempresa) +
                         'AND SALDOS.PRODUTO = PRODUTOS.CODIGO WHERE PRODUTOS.CODIGO             = ' + IntToStr(memprodutos.FindField('PRODUTO').AsInteger)) then
          begin
            memprodutos.FindField('ICM0').AsFloat       := dm_rc.tbprodutos.Findfield('ICMS0').AsFloat;
            memprodutos.FindField('ICM1').AsFloat       := dm_rc.tbprodutos.Findfield('ICMS1').AsFloat;
            memprodutos.FindField('ICM2').AsFloat       := dm_rc.tbprodutos.Findfield('ICMS2').AsFloat;
            memprodutos.FindField('BAS0').AsFloat       := dm_rc.tbprodutos.Findfield('BASE0').AsFloat;
            memprodutos.FindField('BAS1').AsFloat       := dm_rc.tbprodutos.Findfield('BASE1').AsFloat;
            memprodutos.FindField('BAS2').AsFloat       := dm_rc.tbprodutos.Findfield('BASE2').AsFloat;

            memprodutos.FindField('SEMENTENOME').AsString   := dm_rc.tbprodutos.FindField('SEMENTENOME').AsString;
            memprodutos.FindField('CULTIVAR').AsString      := dm_rc.tbprodutos.Findfield('CULTIVAR').AsString;

          end;
        //********************************************************************//

        memprodutos.FindField('PEDIDOOR').AsString       :=  dm_rc.sqlBuscas.FindField('PEDIDOOR').AsString;
        memprodutos.FindField('PEDIDOITEMOR').AsString   :=  dm_rc.sqlBuscas.FindField('PEDIDOITEMOR').AsString;

          if dm_rc.sqlBuscas.FindField('LOTESEMENTE').AsString <> '' then
            begin
              memprodutos.FindField('DESCRICAO_NOTA').AsString := dm_rc.sqlBuscas.Findfield('DESCRICAO_NOTA').AsString;
              memprodutos.FindField('LOTESEMENTE').AsString    := dm_rc.sqlBuscas.Findfield('LOTESEMENTE').AsString;
              memprodutos.FindField('BOLETIMSEMENTE').AsString := dm_rc.sqlBuscas.Findfield('BOLETIMSEMENTE').AsString;
              memprodutos.FindField('TERMOSEMENTE').AsString   := dm_rc.sqlBuscas.Findfield('TERMOSEMENTE').AsString;
              memprodutos.FindField('VALIDADE').AsString       := dm_rc.sqlBuscas.Findfield('VALIDADE').AsString;
              memprodutos.FindField('CATEGORIA').AsString      := dm_rc.sqlBuscas.Findfield('CATEGORIA').AsString;
              memprodutos.FindField('SAFRAVALIDA').AsString    := dm_rc.sqlBuscas.Findfield('SAFRAVALIDA').AsString;
              memprodutos.FindField('VALORCULTURAL').AsFloat   := dm_rc.sqlBuscas.Findfield('VALORCULTURAL').AsFloat;
              memprodutos.FindField('GERMINACAO').AsFloat      := dm_rc.sqlBuscas.Findfield('GERMINACAO').AsFloat;
              memprodutos.FindField('PUREZA').AsFloat          := dm_rc.sqlBuscas.Findfield('PUREZA').AsFloat;
              memprodutos.FindField('TOTALPONTO').AsFloat      := dm_rc.sqlBuscas.Findfield('TOTALPONTO').AsFloat;
              memprodutos.FindField('PESOSACO').AsFloat        := dm_rc.sqlBuscas.Findfield('PESOSACO').AsFloat;
            end;

        memprodutos.Post;

        dm_rc.sqlBuscas.Next;
      end;
  end;

  memprodutos.First;
  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;
  memprodutos.EnableControls;
  memprodutos.first;

  memprodutos.GotoBookmark(M_MARCA);
  memprodutos.FreeBookmark(M_MARCA);
end;

procedure TfrmMOVIMENTOMESTRE.carregalote(lote: string; produto: integer);
var
  sql:string;
begin
  if lote <> '' then
    begin
      if SqlPesquisa(' select * from sementes where produto = ' + IntToStr(produto) +
                     ' and lote                             = ' + QuotedStr(lote)) then
      begin
        memprodutosLOTESEMENTE.AsString    := lote;
        memprodutosTERMOSEMENTE.AsString   := dm_rc.sqlBuscas.FindField('TERMO').AsString;
        memprodutosCATEGORIA.AsString      := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
        memprodutosBOLETIMSEMENTE.AsString := dm_rc.sqlBuscas.FindField('BOLETIM').AsString;
        memprodutosVALORCULTURAL.AsString  := dm_rc.sqlBuscas.FindField('VALORCULTURAL').AsString;
        memprodutosVALIDADE.AsString       := dm_rc.sqlBuscas.FindField('VALIDADE').AsString;
        memprodutosCULTIVAR.AsString       := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;
        memprodutosCATEGORIA.AsString      := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
        memprodutosSAFRAVALIDA.AsString    := dm_rc.sqlBuscas.FindField('SAFRAVALIDA').AsString;
        memprodutosPESOSACO.AsFloat        := dm_rc.sqlBuscas.FindField('PESOEMBALAGEM').AsFloat;
        memprodutosTETRAZOLIO.AsFloat      := dm_rc.sqlBuscas.FindField('TETRAZOLIO').AsFloat;
        memprodutosTIPOLOTE.AsString       := 'N';
      end;

      sql := ' select *                                         ' +
             ' from produtos P                                  ' +
             ' inner join saldos on (p.codigo = saldos.produto) ' +
             ' where P.codigo                                =  ' + IntToStr(produto) +
             ' and saldos.empresa                            =  ' + IntToStr(mm.varI_Code_Company);

      if SqlPesquisa(sql) then
      begin
        memprodutosSEMENTENOME.AsString   := dm_rc.sqlBuscas.FindField('SEMENTENOME').AsString;
      end;

      memprodutos.FindField('DESCRICAO_NOTA').AsString := DescricaoNotaEletronicaItens(RemoverEspeciais((mm.varC_Doc_Customer)),lote,produto);
    end;
end;

procedure TfrmMOVIMENTOMESTRE.carregaloteProducao(codigo: integer);
begin
  if sqlMaster.State in [dsInsert,dsEdit] then
    begin
      SqlPesquisa('select * from LOTEINTERNO where codigo = ' + IntToStr(codigo));

      memprodutos.Edit;
      memprodutosLOTESEMENTE.AsString    := dm_rc.sqlBuscas.FindField('LOTE').AsString;
      memprodutosPUREZA.AsFloat          := dm_rc.sqlBuscas.FindField('PUREZA').AsFloat;
      memprodutosTIPOLOTE.AsString       := 'P';
    end;
end;

procedure TfrmMOVIMENTOMESTRE.CarregaMarca;
begin
  UniDBComboBoxMARCA.Clear;
  if SqlPesquisa('SELECT DESCRICAO FROM MARCA ORDER BY CODIGO') then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          UniDBComboBoxMARCA.Items.Add(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString);

          dm_rc.sqlBuscas.Next;
        end;
    end;
end;

procedure TfrmMOVIMENTOMESTRE.carregaMovimento_comissao(const pnumero,pdocumento, pempresa: integer);
begin
  dm_rc.tb_movimentovendedor.Close;
  dm_rc.tb_movimentovendedor.Open;

  if SqlPesquisa(' SELECT * FROM MOVIMENTO_COMISSAO WHERE NUMERO   = ' + IntToStr(pnumero)   +
                 ' AND DOCUMENTO                                   = ' + IntToStr(pdocumento)+
                 ' AND EMPRESA                                     = ' + IntToStr(pempresa)  +
                 ' ORDER BY SEQUENCIA') then
  begin
    dm_rc.sqlBuscas.first;
    while not dm_rc.sqlBuscas.Eof do
      begin
       dm_rc.tb_movimentovendedor.Append;
       dm_rc.tb_movimentovendedor.FindField('FUNCIONARIO').AsInteger := dm_rc.sqlBuscas.FindField('FUNCIONARIO').AsInteger;
       dm_rc.tb_movimentovendedor.FindField('NOME').AsString         := dm_rc.sqlBuscas.FindField('NOME').AsString;
       dm_rc.tb_movimentovendedor.FindField('COMISSAO').AsFloat      := dm_rc.sqlBuscas.FindField('COMISSAO').AsFloat;
       dm_rc.tb_movimentovendedor.Post;

       dm_rc.sqlBuscas.Next;
      end;
  end;
end;

procedure TfrmMOVIMENTOMESTRE.carregaprodutos(codigo: string);
var
  sql:string;
begin
  sql := ' select *                                         ' +
         ' from produtos P                                  ' +
         ' inner join saldos on (p.codigo = saldos.produto) ' +
         ' where P.codigo                                =  ' + QuotedStr(codigo) +
         ' and saldos.empresa                            =  ' + IntToStr(mm.varI_Code_Company);

  if not SqlPesquisa(sql) then
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não encontrei esse Produto' , 'warning' )
  else
    begin
      memprodutos.Edit;
      memprodutos.FindField('PRODUTO').AsInteger        := StrToInt(codigo);
      memprodutos.FindField('DESCRICAO').AsString       := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
      memprodutos.FindField('PRECO').AsFloat            := dm_rc.sqlBuscas.FindField('VENDA').AsFloat;
      memprodutos.FindField('UNIDADE').AsString         := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;

      memprodutos.FindField('NUMERONCM').AsString       := dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;
      memprodutos.FindField('UNIDADE').AsString         := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;
      memprodutos.FindField('ICM0').AsFloat             := dm_rc.sqlBuscas.FindField('ICMS0').AsFloat;
      memprodutos.FindField('ICM1').AsFloat             := dm_rc.sqlBuscas.FindField('ICMS1').AsFloat;
      memprodutos.FindField('ICM2').AsFloat             := dm_rc.sqlBuscas.FindField('ICMS2').AsFloat;

      memprodutos.FindField('BAS0').AsFloat             := dm_rc.sqlBuscas.FindField('BASE0').AsFloat;
      memprodutos.FindField('BAS1').AsFloat             := dm_rc.sqlBuscas.FindField('BASE1').AsFloat;
      memprodutos.FindField('BAS2').AsFloat             := dm_rc.sqlBuscas.FindField('BASE2').AsFloat;

      memprodutos.FindField('PIS').AsString             := dm_rc.sqlBuscas.FindField('PIS').AsString;
      memprodutos.FindField('COFINS').AsString          := dm_rc.sqlBuscas.FindField('COFINS').AsString;

      memprodutos.FindField('SITUACAOLOCAL').AsString   := dm_rc.sqlBuscas.FindField('SITUACAOLOCAL').AsString;
      memprodutos.FindField('SITUACAOOUTRAS').AsString  := dm_rc.sqlBuscas.FindField('SITUACAOOUTRAS').AsString;
    end;
end;

procedure TfrmMOVIMENTOMESTRE.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
  inherited;
   Linha  := TStringGrid(dbgSearchCRUD).Row;
   Coluna := dbgSearchCRUD.CurrCol;

  if Column.FieldName = 'opcoes' then
    begin
      if DocumentoUnificado and (FDQryFiltroDOCUMENTO.AsInteger <> 4) then
      begin
        dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'As opções específicas de pedido não estão disponíveis para este tipo de documento.', 'warning');
        Exit;
      end;
      UniPopupMenudetalhes.Popup(posicao_x-25,posicao_y, dbgSearchCRUD);
    end;
end;

procedure TfrmMOVIMENTOMESTRE.dbgSearchCRUDDblClick(Sender: TObject);
begin
  VerificaEdicao();

  if sqlSearchMaster.IsEmpty then Exit;

  inherited;

  if sqlMaster.Active and (sqlMaster.RecordCount > 0) then
    SetBut(tpListacomRegistros);

  pgBaseCadControl.ActivePage := tabRegister;
end;

procedure TfrmMOVIMENTOMESTRE.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;


procedure TfrmMOVIMENTOMESTRE.edLkpCONDICOESClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_LookUpSearchFilter( Sender, '', '', 'DESCRICAO;PARCELAS;FORMAPGTO' );
end;

procedure TfrmMOVIMENTOMESTRE.edLkpCONDICOESKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = []) and
     (dsMaster.State in [dsEdit, dsInsert]) then
  begin
    Key := 0;
    if Sender = FindComponent(LowerCase(edLkpCONDICOES.Name) + '_CodID') then
    begin
      FAvancarCondicao := True;
      // A saida do codigo executa a validacao original do RadCore.
      edLkpCONDICOES.SetFocus;
    end;
  end;
end;

procedure TfrmMOVIMENTOMESTRE.CodigoCondicoesExit(Sender: TObject);
var
  Avancar: Boolean;
  CampoCodigo: TComponent;
begin
  Avancar := FAvancarCondicao;
  FAvancarCondicao := False;
  if Assigned(FExitCodigoCondicoes) then
    FExitCodigoCondicoes(Sender);
  // Agenda depois da validacao, que tambem pode solicitar foco no lookup.
  if Avancar and (Trim(edLkpCONDICOES.Text) <> '') and
     (dsMaster.State in [dsEdit, dsInsert]) then
  begin
    CampoCodigo := FindComponent(LowerCase(edLkpFUNCIONARIOS.Name) + '_CodID');
    if CampoCodigo is TUniDBEdit then
      if TUniDBEdit(CampoCodigo).Visible and TUniDBEdit(CampoCodigo).Enabled then
        begin
          dm_rc.rc_SetFocus(CampoCodigo);
        end;
    end;
end;

procedure TfrmMOVIMENTOMESTRE.edLkpFUNCIONARIOSClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_LookUpSearchFilter( Sender, '', '', 'NOME' );
end;

procedure TfrmMOVIMENTOMESTRE.edLkpPESSOASClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_LookUpSearchFilter( Sender, '', '', 'CPFCNPJ;CIDADE;ESTADO' );
end;

procedure TfrmMOVIMENTOMESTRE.edLkpPESSOASExit(Sender: TObject);
begin
  inherited;

if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
      if (sqlMaster.FindField('PESSOA').AsString <> '') then
        begin
          if SqlPesquisa('SELECT * FROM PESSOAS WHERE CODIGO = ' + QuotedStr(sqlMaster.FindField('PESSOA').AsString)) then
            begin
              UniEditcidade.Text       := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
              UniButtonDbEditcodigopessoas.Text := dm_rc.sqlBuscas.FindField('CODIGO').AsString;
              UniEditestado.Text      := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
            end;
        end
        else
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque uma Pessoa!' , 'warning');
          end;
    end;

end;

procedure TfrmMOVIMENTOMESTRE.Exclui;
begin
  TabelaEntregaLote('select * from entrega_lote where numero = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)   +
                    'and documento                           = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger)+
                    'and empresa                             = ' + IntToStr(mm.varI_Code_Company));

  executasql('delete from mvitens where numero      = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)   +
             'and documento                         = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger)+
             'and empresa                           = ' + IntToStr(mm.varI_Code_Company));
  executasql('delete from receber where numero      = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)   +
             'and documento                         = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger)+
             'and empresa                           = ' + IntToStr(mm.varI_Code_Company));
  executasql('delete from entrega_lote where numero = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)   +
             'and documento                         = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger)+
             'and empresa                           = ' + IntToStr(mm.varI_Code_Company));

  executasql('delete from movimento_comissao where numero = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)   +
             'and documento                               = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger)+
             'and empresa                                 = ' + IntToStr(mm.varI_Code_Company));


  sqlMaster.Delete;
  if sqlMaster.ApplyUpdates(-1) > 0 then
    raise Exception.Create('Falha ao excluir o movimento.');
  sqlMaster.CommitUpdates;

  try

    dm_rc.fdqryentregalote.First;
    while not dm_rc.fdqryentregalote.Eof do
      begin

        CalculaLoteInterno (mm.varI_Code_Company,
                            dm_rc.fdqryentregalote.FindField('PRODUTO').AsInteger,
                            dm_rc.fdqryentregalote.FindField('LOTE').AsString);

        dm_rc.fdqryentregalote.Next;
      end;

    if  sqlSearchMaster.Active then
      sqlSearchMaster.Refresh;

    LimpaVars;
    tbtitulos.Close;
    memprodutos.Close;
    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Excluido com SUCESSO!' , 'success' );
    pgBaseCadControl.ActivePage := tabSearch;
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui DELETAR, chame o SUPORTE!' , 'error' );
  end;
end;

procedure TfrmMOVIMENTOMESTRE.FDQryFiltroopcoesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmMOVIMENTOMESTRE.FDQryFiltrostatusGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if StrContains('Finalizado',FDQryFiltroFECHAMENTO_STATUS.AsString) then
        Text := '<span class="badge badge-success">'+FDQryFiltroFECHAMENTO_STATUS.AsString+'</span>'
      else
      if StrContains('Não Concluida',FDQryFiltroFECHAMENTO_STATUS.AsString) then
        Text := '<span class="badge badge-danger">'+FDQryFiltroFECHAMENTO_STATUS.AsString+'</span>'
      else
      if StrContains('Aguardando',FDQryFiltroFECHAMENTO_STATUS.AsString) then
        Text := '<span class="badge badge-warning">'+FDQryFiltroFECHAMENTO_STATUS.AsString+'</span>'
      else
      if StrContains('Andamento',FDQryFiltroFECHAMENTO_STATUS.AsString) then
        Text := '<span class="badge badge-primary">'+FDQryFiltroFECHAMENTO_STATUS.AsString+'</span>'
      else
        Text := '<span class="badge badge-dark">Sem Ação</span>';
    end;
end;

procedure TfrmMOVIMENTOMESTRE.FechaTabelas;
begin
  dm_rc.fdqrytitulos  .Close;
  dm_rc.FDQryMvmestre .Close;
  dm_rc.fdqrypontos   .Close;
  dm_rc.FDQryoperacoes.Close;
  dm_rc.sqlBuscas     .Close;
  dm_rc.tbtitulos     .Close;
  dm_rc.memprodutos   .Close;
end;

procedure TfrmMOVIMENTOMESTRE.gravamemoria;
begin
  if memprodutos.FindField('PRODUTO').AsInteger > 0 then
    begin
      memprodutos.Edit;

      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        if memprodutos.FindField('QUANTIDADE').AsFloat = 0 then
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque a QUANTIDADE!' , 'warning' );
            memprodutos.FindField('QUANTIDADE').FocusControl;
            Abort;
          end;

      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        if memprodutos.FindField('PRECO').AsFloat = 0 then
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque o PREÇO!' , 'warning' );
            memprodutos.FindField('PRECO').FocusControl;
            Abort;
          end;

      memprodutos.FindField('TOTAL').AsFloat  := memprodutos.FindField('PRECO').AsFloat *
                                                 memprodutos.FindField('QUANTIDADE').AsFloat;
    end;
end;
procedure TfrmMOVIMENTOMESTRE.GravaMovimento;
begin

  TabelaMvitens               ('select * from mvitens where codigo                = 999999');
  TabelaPontos                ('select * from pontos  where codigo                = 999999');
  TabelaOperacao              ('select * from operacoes where codigo              =   ' + QuotedStr(sqlMaster.FindField('OPERACAO').AsString));
  TabelaTitulos               ('select * from                                         ' + variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR') + ' where codigo = 0');
  TabelaManutencaoLoteProducao('select * from MANUTENCAOLOTE_INTERNO where codigo  = 0');

  Exclui_Movimento('PRODUCAOITENS' ,sqlMaster.FindField('SERIE').AsString,MM.varI_Code_Company,varC_Documento_Mvmestre,sqlMaster.FindField('NUMERO').AsInteger);
  Exclui_Movimento('MVITENS'       ,sqlMaster.FindField('SERIE').AsString,MM.varI_Code_Company,varC_Documento_Mvmestre,sqlMaster.FindField('NUMERO').AsInteger);
  Exclui_Movimento('PONTOS'        ,sqlMaster.FindField('SERIE').AsString,MM.varI_Code_Company,varC_Documento_Mvmestre,sqlMaster.FindField('NUMERO').AsInteger);

  if sqlMaster.FieldByName('DOCUMENTO').AsInteger = 4 then
  begin
  if varC_verificarecalculofinanceiro = 'S' then
    begin
      executasql(' delete from receber where numero = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger) +
                 ' and serie                        = ' + QuotedStr(sqlMaster.FindField('SERIE').AsString)  +
                 ' and empresa = ' + IntToStr(mm.varI_Code_Company) +
                 ' and documento = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger) +
                 ' and situacao                     = ' + QuotedStr('Aberto'));
    end
  else
    Exclui_Movimento(variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR'),sqlMaster.FindField('SERIE').AsString,MM.varI_Code_Company,varC_Documento_Mvmestre,sqlMaster.FindField('NUMERO').AsInteger);

  end;

  memprodutos.DisableControls;
  memprodutos.First;
  while not memprodutos.Eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        begin
          dm_rc.tbmvitens.Append;
          dm_rc.tbmvitens.FindField('SEQUENCIA').AsInteger      := memprodutos.RecNo;
          dm_rc.tbmvitens.FindField('EMPRESA').AsInteger        := mm.varI_Code_Company;
          dm_rc.tbmvitens.FindField('DOCUMENTO').AsInteger      := sqlMaster.FindField('DOCUMENTO').AsInteger;
          dm_rc.tbmvitens.FindField('NUMERO').AsInteger         := sqlMaster.FindField('NUMERO').AsInteger;
          dm_rc.tbmvitens.FindField('SERIE').AsString           := sqlMaster.FindField('SERIE').AsString;
          dm_rc.tbmvitens.FindField('UF').AsString              := UniEditestado.Text;
          dm_rc.tbmvitens.FindField('PESSOA').AsInteger         := sqlMaster.FindField('PESSOA').AsInteger;
          dm_rc.tbmvitens.FindField('EMISSAO').AsDateTime       := sqlMaster.FindField('EMISSAO').AsDateTime;

          dm_rc.tbmvitens.FindField('OPERACAO').AsFloat         := sqlMaster.FindField('OPERACAO').AsFloat;
          dm_rc.tbmvitens.FindField('PRODUTO').AsInteger        := memprodutos.FindField('PRODUTO').AsInteger;
          dm_rc.tbmvitens.FindField('DESCRICAO').AsString       := memprodutos.FindField('DESCRICAO').AsString;
          dm_rc.tbmvitens.FindField('UNIDADE').AsString         := memprodutos.FindField('UNIDADE').AsString;
          dm_rc.tbmvitens.FindField('PRECO').AsFloat            := memprodutos.FindField('PRECO').AsFloat;
          dm_rc.tbmvitens.FindField('DESCONTO').AsFloat         := memprodutos.FindField('DESCONTO').AsFloat;
          dm_rc.tbmvitens.FindField('DESPESAS').AsFloat         := memprodutos.FindField('DESPESA').AsFloat;
          dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat       := memprodutos.FindField('QUANTIDADE').AsFloat;
          dm_rc.tbmvitens.FindField('TOTAL').AsFloat            := memprodutos.FindField('TOTAL').AsFloat;
          dm_rc.tbmvitens.FindField('CST').AsString             := memprodutos.FindField('CST').AsString;
          dm_rc.tbmvitens.FindField('PERCICMS').AsFloat         := memprodutos.FindField('PERCICMS').AsFloat;
          dm_rc.tbmvitens.FindField('VALORICMS').AsFloat        := memprodutos.FindField('VALORICMS').AsFloat;
          dm_rc.tbmvitens.FindField('BASEICMS').AsFloat         := memprodutos.FindField('BASEICMS').AsFloat;
          dm_rc.tbmvitens.FindField('GRUPO').AsInteger          := memprodutos.FindField('GRUPO').AsInteger;
          dm_rc.tbmvitens.Findfield('CUSTO').AsFloat            := memprodutos.FindField('CUSTO').AsFloat;
          dm_rc.tbmvitens.Findfield('COMPRA').AsFloat           := memprodutos.FindField('COMPRA').AsFloat;
          dm_rc.tbmvitens.FindField('NUMERONCM').AsString       := memprodutos.FindField('NUMERONCM').AsString;
          dm_rc.tbmvitens.FindField('FRETE').AsFloat            := memprodutos.FindField('FRETE').AsFloat;
          dm_rc.tbmvitens.Findfield('SEGURO').AsFloat           := memprodutos.FindField('SEGURO').AsFloat;
          dm_rc.tbmvitens.Findfield('FRETE').AsFloat            := memprodutos.FindField('FRETE').AsFloat;
          dm_rc.tbmvitens.Findfield('PESOSACO').AsString        := memprodutos.FindField('PESOSACO').AsString;

          dm_rc.tbmvitens.FindField('PRODUTO').AsInteger        := memprodutos.FindField('PRODUTO').AsInteger;
          dm_rc.tbmvitens.FindField('DESCRICAO').AsString       := memprodutos.FindField('DESCRICAO').AsString;

          dm_rc.tbmvitens.FindField('PIS').AsString             := memprodutos.FindField('PIS').AsString;
          dm_rc.tbmvitens.FindField('COFINS').AsString          := memprodutos.FindField('COFINS').AsString;

          dm_rc.tbmvitens.FindField('PEDIDOOR').AsString        := memprodutos.FindField('PEDIDOOR').AsString;
          dm_rc.tbmvitens.FindField('PEDIDOITEMOR').AsString    := memprodutos.FindField('PEDIDOITEMOR').AsString;

          if memprodutos.FindField('LOTESEMENTE').AsString <> '' then
            begin
              dm_rc.tbmvitens.Findfield('DESCRICAO_NOTA').AsString  := memprodutos.FindField('DESCRICAO_NOTA').AsString;
              dm_rc.tbmvitens.Findfield('LOTESEMENTE').AsString     := memprodutos.FindField('LOTESEMENTE').AsString;
              dm_rc.tbmvitens.Findfield('BOLETIMSEMENTE').AsString  := memprodutos.FindField('BOLETIMSEMENTE').AsString;
              dm_rc.tbmvitens.Findfield('TERMOSEMENTE').AsString    := memprodutos.FindField('TERMOSEMENTE').AsString;
              dm_rc.tbmvitens.Findfield('VALIDADE').AsString        := memprodutos.FindField('VALIDADE').AsString;
              dm_rc.tbmvitens.Findfield('CATEGORIA').AsString       := memprodutos.FindField('CATEGORIA').AsString;
              dm_rc.tbmvitens.Findfield('SAFRAVALIDA').AsString     := memprodutos.FindField('SAFRAVALIDA').AsString;
              dm_rc.tbmvitens.Findfield('VALORCULTURAL').AsFloat    := memprodutos.FindField('VALORCULTURAL').AsFloat;
              dm_rc.tbmvitens.Findfield('GERMINACAO').AsFloat       := memprodutos.FindField('GERMINACAO').AsFloat;
              dm_rc.tbmvitens.Findfield('PUREZA').AsFloat           := memprodutos.FindField('PUREZA').AsFloat;
              dm_rc.tbmvitens.Findfield('TOTALPONTO').AsFloat       := memprodutos.FindField('QUANTIDADE').AsFloat * memprodutos.FindField('PUREZA').AsFloat;
              dm_rc.tbmvitens.Findfield('PESOSACO').AsFloat         := memprodutos.FindField('PESOSACO').AsFloat;
              dm_rc.tbmvitens.Findfield('TIPOLOTE').AsString        := memprodutos.FindField('TIPOLOTE').AsString;

              if (sqlMaster.FieldByName('DOCUMENTO').AsInteger = 4) and
                 (memprodutos.FindField('TIPOLOTE').AsString = 'P') then
                begin
                  dm_rc.FDQuerymanutencaolote_interno.Append;
                  dm_rc.FDQuerymanutencaolote_interno.Findfield('EMISSAO').AsDateTime        := sqlMaster.FindField('EMISSAO').AsDateTime;
                  dm_rc.FDQuerymanutencaolote_interno.Findfield('DOCUMENTO').AsInteger       := sqlMaster.FindField('DOCUMENTO').AsInteger;
                  dm_rc.FDQuerymanutencaolote_interno.Findfield('NUMERO').AsInteger          := sqlMaster.FindField('NUMERO').AsInteger;

                  dm_rc.FDQuerymanutencaolote_interno.Findfield('PESOSACO').AsFloat          := memprodutos.FindField('PESOSACO').AsFloat;
                  dm_rc.FDQuerymanutencaolote_interno.Findfield('PRODUTO').AsInteger         := memprodutos.FindField('PRODUTO').AsInteger;
                  dm_rc.FDQuerymanutencaolote_interno.Findfield('DESCRICAO').AsString        := memprodutos.FindField('DESCRICAO').AsString;
                  dm_rc.FDQuerymanutencaolote_interno.Findfield('QUANTIDADE').AsFloat        := memprodutos.FindField('QUANTIDADE').AsFloat;
                  dm_rc.FDQuerymanutencaolote_interno.Findfield('PUREZA').AsFloat            := memprodutos.FindField('PUREZA').AsFloat;
                  dm_rc.FDQuerymanutencaolote_interno.Findfield('TOTALPONTOS').AsFloat       := memprodutos.FindField('QUANTIDADE').AsFloat * memprodutos.FindField('PUREZA').AsFloat;
                  dm_rc.FDQuerymanutencaolote_interno.FindField('LOTE').AsString             := memprodutos.Findfield('LOTESEMENTE').AsString;

                  dm_rc.FDQuerymanutencaolote_interno.Findfield('MESTRE_PRODUCAO').AsInteger := 0;
                  dm_rc.FDQuerymanutencaolote_interno.Findfield('ATIVO').AsString            := 'T';
                  dm_rc.FDQuerymanutencaolote_interno.Findfield('EMPRESA').AsInteger         := MM.varI_Code_Company;
                  dm_rc.FDQuerymanutencaolote_interno.Findfield('SEQUENCIA').AsInteger       := memprodutos.RecNo;
                  dm_rc.FDQuerymanutencaolote_interno.Findfield('TIPO').AsString             := 'SAIDA';

                  dm_rc.FDQuerymanutencaolote_interno.Findfield('CODIGO').AsInteger          := Ultimo_Codigo('MANUTENCAOLOTE_INTERNO','CODIGO',False);
                  dm_rc.FDQuerymanutencaolote_interno.Findfield('KEY').AsString              := Gera_Guid();
                  dm_rc.FDQuerymanutencaolote_interno.Post;


                  CalculaLoteInterno (mm.varI_Code_Company,
                                      memprodutos.FindField('PRODUTO').AsInteger,
                                      memprodutos.Findfield('LOTESEMENTE').AsString);

                end;
            end;

          dm_rc.tbmvitens.FindField('KEY').AsString             := Gera_Guid();
          dm_rc.tbmvitens.FindField('CODIGO').AsInteger         := Ultimo_Codigo('MVITENS','CODIGO',False);

          dm_rc.tbmvitens.Post;
        end;
      memprodutos.Next;
    end;
  memprodutos.First;
  memprodutos.EnableControls;

  if sqlMaster.FieldByName('DOCUMENTO').AsInteger = 10 then
    SalvarParcelasPrevistas;
  if sqlMaster.FieldByName('DOCUMENTO').AsInteger = 4 then
  begin
  tbtitulos.DisableControls;
  tbtitulos.First;
  while not tbtitulos.Eof do
    begin
      dm_rc.fdqrytitulos.UpdateOptions.UpdateTableName := variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR');

      dm_rc.fdqrytitulos.Append;
      dm_rc.fdqrytitulos.FindField('NUMERO').AsInteger       := sqlMaster.FindField('NUMERO').AsInteger;
      dm_rc.fdqrytitulos.FindField('DOCUMENTO').AsInteger    := sqlMaster.FindField('DOCUMENTO').AsInteger;
      dm_rc.fdqrytitulos.FindField('SERIE').AsString         := sqlMaster.FindField('SERIE').AsString;
      dm_rc.fdqrytitulos.FindField('PESSOA').AsInteger       := sqlMaster.FindField('PESSOA').AsInteger;
      dm_rc.fdqrytitulos.FindField('EMISSAO').AsDateTime     := sqlMaster.FindField('EMISSAO').AsDateTime;

      dm_rc.fdqrytitulos.FindField('SEQUENCIA').AsInteger    := tbtitulos.FindField('PARCELA').AsInteger;
      dm_rc.fdqrytitulos.FindField('VENCIMENTO').AsDateTime  := tbtitulos.FindField('VENCIMENTO').AsDateTime;
      dm_rc.fdqrytitulos.FindField('VALORATUAL').AsFloat     := tbtitulos.FindField('VALOR').AsFloat;
      dm_rc.fdqrytitulos.FindField('VALORORIGINAL').AsFloat  := tbtitulos.FindField('VALOR').AsFloat;
      dm_rc.fdqrytitulos.FindField('CONFIRMABOLETO').AsString:= 'F';
      dm_rc.fdqrytitulos.FindField('SITUACAO').AsString      := 'Aberto';

      dm_rc.fdqrytitulos.FindField('FINANCEIRO').AsInteger   := dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger;
      dm_rc.fdqrytitulos.FindField('FUNCIONARIO').AsInteger  := sqlMaster.FindField('FUNCIONARIO').AsInteger;
      dm_rc.fdqrytitulos.FindField('EMPRESA').AsInteger      := mm.varI_Code_Company;

      dm_rc.fdqrytitulos.FindField('APLICACAO').AsInteger    := 0;
      dm_rc.fdqrytitulos.FindField('PLANOCONTAS').AsInteger  := 0;
      dm_rc.fdqrytitulos.FindField('CARTEIRA').AsInteger     := 00001;
      dm_rc.fdqrytitulos.FindField('PORTADOR').AsInteger     := 9999;


      if dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1 then
        begin
          dm_rc.fdqrytitulos.FindField('NUMEROPEDIDO').AsString  := sqlMaster.FindField('NUMEROPEDIDO').AsString;
          dm_rc.fdqrytitulos.FindField('PEDIDO').AsString        := sqlMaster.FindField('PEDIDO').AsString;
          dm_rc.fdqrytitulos.FindField('PERCCOMISSAO').AsFloat   := sqlMaster.FindField('COMISSAOFUNCIONARIO').AsFloat;
        end;

      dm_rc.fdqrytitulos.FindField('VALORDESCONTOS').AsFloat := 0;
      dm_rc.fdqrytitulos.FindField('VALORJUROS').AsFloat     := 0;
      dm_rc.fdqrytitulos.FindField('VALORTAXAS').AsFloat     := 0;
      dm_rc.fdqrytitulos.FindField('VALORPAGO').AsFloat      := 0;
      dm_rc.fdqrytitulos.FindField('VALORDIVERSOS').AsFloat  := 0;

      dm_rc.fdqrytitulos.FindField('KEY').AsString           := Gera_Guid();
      dm_rc.fdqrytitulos.FindField('CODIGO').AsInteger       := Ultimo_Codigo(variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR'),'CODIGO',False);
      dm_rc.fdqrytitulos.Post;

      tbtitulos.Next;
    end;

  tbtitulos.First;
  tbtitulos.EnableControls;
  end;

  if DM_RC.tb_movimentovendedor.RecordCount > 0 then
    begin
      executasql('delete from movimento_comissao where numero  = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)    +
                 '                               and documento = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger) +
                 '                               and empresa   = ' + IntToStr(mm.varI_Code_Company));


      TabelaMovimentoComissao('SELECT * FROM MOVIMENTO_COMISSAO WHERE CODIGO = 0');
      DM_RC.tb_movimentovendedor.First;
      while not DM_RC.tb_movimentovendedor.Eof do
        begin
          dm_rc.fdqrymovcomissao.Append;
          dm_rc.fdqrymovcomissao.FindField('KEY').AsString             := Gera_Guid();
          dm_rc.fdqrymovcomissao.FindField('CODIGO').AsInteger         := Ultimo_Codigo('MOVIMENTO_COMISSAO','CODIGO',True);
          dm_rc.fdqrymovcomissao.FindField('SEQUENCIA').AsInteger      := DM_RC.tb_movimentovendedor.RecNo;
          dm_rc.fdqrymovcomissao.FindField('EMPRESA').AsInteger        := mm.varI_Code_Company;
          dm_rc.fdqrymovcomissao.FindField('DOCUMENTO').AsInteger      := sqlMaster.FindField('DOCUMENTO').AsInteger;
          dm_rc.fdqrymovcomissao.FindField('NUMERO').AsInteger         := sqlMaster.FindField('NUMERO').AsInteger;
          dm_rc.fdqrymovcomissao.FindField('FUNCIONARIO').AsInteger    := dm_rc.tb_movimentovendedor.FindField('FUNCIONARIO').AsInteger;
          dm_rc.fdqrymovcomissao.FindField('NOME').AsString            := dm_rc.tb_movimentovendedor.FindField('NOME').AsString;
          dm_rc.fdqrymovcomissao.FindField('COMISSAO').AsFloat         := dm_rc.tb_movimentovendedor.FindField('COMISSAO').AsFloat;
          dm_rc.fdqrymovcomissao.Post;

          dm_rc.tb_movimentovendedor.Next;
        end;
      dm_rc.fdqrymovcomissao.Close;
    end;
  //**************************************************************************//

  UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgEditing];
//  dbgTITULOS.Options                 := dbgTITULOS.Options        - [dgEditing];

end;

procedure TfrmMOVIMENTOMESTRE.I1Click(Sender: TObject);
begin
  frmTransfereImportacao.ShowModal();
end;

procedure TfrmMOVIMENTOMESTRE.i2Click(Sender: TObject);
begin
  inherited;

  mm.varC_caminhopdf :=  PEDIDOORCAMENTO_impressao(mm.varI_Code_Company,
                         sqlMaster.FindField('NUMERO').AsInteger,
                         sqlMaster.FindField('DOCUMENTO').AsInteger);

  unfImpressao.ShowModal();

end;

procedure TfrmMOVIMENTOMESTRE.I4Click(Sender: TObject);
begin
  frmTransfereImportacao.ShowModal();
  if mm.varI_Code_Documento_Controle <> 0 then
    CarregaImportacao(mm.varI_Code_Documento_Controle);
end;

procedure TfrmMOVIMENTOMESTRE.L1Click(Sender: TObject);
begin
  inherited;

  MM.varC_referencia_produto := IntToStr(memprodutos.FindField('PRODUTO').AsInteger);
  mm.varC_codigo_busca_lote  := memprodutos.FindField('LOTESEMENTE').AsString;
  mm.VarC_Atelagenerica      := 'CONTROLEPONTOS';
  frmTELAGENERICA.ShowModal();

  memprodutos.Edit;
  carregalote(MM.varC_codigo_busca_lote,memprodutos.FindField('PRODUTO').AsInteger);
  MM.varC_referencia_produto := '';

end;

procedure TfrmMOVIMENTOMESTRE.L2Click(Sender: TObject);
begin
  inherited;
  FrmPesquisaloteinterno.showmodal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
        carregaloteProducao(StrToInt(mm.varC_codigo_busca_lote));
     end;
   end);
end;

procedure TfrmMOVIMENTOMESTRE.LimpaVars;
begin
//  UniEditnomepessoa.Text           := '';
  UniEditcidade.Text               := '';
  UniEditestado.Text               := '';
  varC_verificarecalculofinanceiro := '';
  memprodutos.Close;
  tbtitulos.Close;
end;

procedure TfrmMOVIMENTOMESTRE.memprodutosAfterDelete(DataSet: TDataSet);
begin
  inherited;
  Calcula_Totais();
end;

procedure TfrmMOVIMENTOMESTRE.memprodutosAfterPost(DataSet: TDataSet);
begin
  inherited;
  if DocumentoUnificado and (sqlMaster.State = dsInsert) and
     (DataSet.FindField('PRODUTO').AsInteger > 0) then
    UniComboTipoDocumento.Enabled := False;
  Calcula_Totais();
end;

procedure TfrmMOVIMENTOMESTRE.memprodutosBeforeDelete(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmMOVIMENTOMESTRE.memprodutosBeforePost(DataSet: TDataSet);
begin
  inherited;
  if DocumentoUnificado and (sqlMaster.State = dsInsert) and
     (DataSet.FindField('PRODUTO').AsInteger > 0) and
     not (sqlMaster.FindField('DOCUMENTO').AsInteger in [3, 4, 10]) then
  begin
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Selecione o tipo de documento antes de adicionar itens.', 'warning');
    Abort;
  end;
  gravamemoria();
end;

procedure TfrmMOVIMENTOMESTRE.memprodutosbuscaloteGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Lote" class="fa fa-lg fas fa-boxes fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmMOVIMENTOMESTRE.memprodutosbuscaprodutoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Produtos" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmMOVIMENTOMESTRE.memprodutosexcluiGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';
end;

procedure TfrmMOVIMENTOMESTRE.ReCalcula_Titulos;
var
  M_PARCELAS : TStringList;
  R          : Integer;
  M_RESTO    : Real;
  ORDEM,
  M_ITENS    : Integer;
  sqlreceber : string;
  vlratual   : Real;
begin
  tbtitulos.Close;
  tbtitulos.Open;

  vlratual := 0;


  sqlreceber := ' select sum(VALORATUAL) as vlr from receber where numero = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger) +
                ' and serie                                               = ' + QuotedStr(sqlMaster.FindField('SERIE').AsString)  +
                ' and empresa                                             = ' + IntToStr(mm.varI_Code_Company)                   +
                ' and situacao                                            = ' + QuotedStr('Pago');

  SqlPesquisa  ('SELECT * FROM CONDICOES WHERE CODIGO = ' + QuotedStr(sqlMaster.FieldByName('CONDICAO').AsString));
  TabelaReceber(sqlreceber); vlratual :=  dm_rc.tbreceber.FindField('VLR').AsFloat;

  ORDEM      := 0;
  M_PARCELAS := Explode(TRIM(dm_rc.sqlBuscas.FindField('OBSERVACOES').AsString),',');
  M_RESTO    := UniDBFormattedNumberEditvlrtotal.Value - vlratual;
  M_ITENS    := variif(dm_rc.sqlBuscas.FindField('PARCELAS').AsInteger=0,1,dm_rc.sqlBuscas.FindField('PARCELAS').AsInteger);

  if M_PARCELAS.Count <  M_ITENS then
    begin
      for R := M_PARCELAS.Count to M_ITENS -1 do
        begin
          M_PARCELAS.Add(IntToStr(R * 30));
        end;
    end;

  for R := 0 to M_PARCELAS.Count - 1 do
    begin
      inc(ORDEM);
      tbtitulos.Append;
      tbtitulos.FindField('VENCIMENTO').AsDateTime := UniDBDateTimePickeremissao.DateTime + Valor(M_PARCELAS[R]);
      tbtitulos.FindField('VALOR').AsFloat         := MRound((UniDBFormattedNumberEditvlrtotal.Value - vlratual) / M_ITENS,2);
      tbtitulos.FindField('PARCELA').AsInteger     := ORDEM;
      tbtitulos.FindField('STATUS').AsString       := 'Aberto';
      tbtitulos.Post;
      M_RESTO := M_RESTO - tbtitulos.FindField('VALOR').AsFloat;
    end;

  if M_RESTO > 0 then
    begin
      tbtitulos.Last;
      tbtitulos.Edit;
      tbtitulos.FindField('VALOR').AsFloat := tbtitulos.FindField('VALOR').AsFloat + Abs(M_RESTO);
      tbtitulos.Post;
    end
  else
    if M_RESTO < 0 then
      begin
        tbtitulos.First;
        tbtitulos.Edit;
        tbtitulos.FindField('VALOR').AsFloat := tbtitulos.FindField('VALOR').AsFloat - Abs(M_RESTO);
        tbtitulos.Post;
      end;

  varC_verificarecalculofinanceiro := 'S';
  tbtitulos.First;
end;

procedure TfrmMOVIMENTOMESTRE.ReleituraProdutoscfop;
begin

end;

procedure TfrmMOVIMENTOMESTRE.SetBut(Acao: TAcaoCrud);
var
  Editando, TemRegistro: Boolean;
begin
  // The base datasource controls the standard CRUD buttons.
  Editando    := sqlMaster.State in [dsInsert, dsEdit];
  TemRegistro := sqlMaster.Active and not sqlMaster.IsEmpty;

  btnCalcReg.Visible := Editando;
  btnCalcReg.Enabled := Editando;

  btnOptions.Enabled := TemRegistro;


end;

procedure TfrmMOVIMENTOMESTRE.sqlMasterAfterOpen(DataSet: TDataSet);
begin
  if FCarregando or DataSet.IsEmpty then Exit;
  FCarregando := True;
  try
    carregadados();
  finally
    FCarregando := False;
  end;
end;

procedure TfrmMOVIMENTOMESTRE.tbtitulosSTATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if tbtitulosSTATUS.AsString = 'Aberto' then
    Text := '<span class="badge badge-danger">Aberto</span>'
  else
    Text := '<span class="badge badge-info">Pago</span>';
end;

procedure TfrmMOVIMENTOMESTRE.UniButtonDbEditcodigopessoasButtonClick(
  Sender: TObject);
begin
  inherited;
  UniButtonDbEditcodigopessoas.SetFocus;
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('PESSOA').AsInteger := StrToInt(MM.varC_codigo_busca);
       UniButtonDbEditcodigopessoas.SetFocus;
     end;
   end);
end;

procedure TfrmMOVIMENTOMESTRE.UniButtonDbEditcodigopessoasExit(Sender: TObject);
begin
  inherited;
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditcodigopessoas.Text <> '') and (UniButtonDbEditcodigopessoas.Text <> '0') then
        begin
          if verificastatuspessoa(StrToInt(UniButtonDbEditcodigopessoas.Text)) = True then
            begin
              frmBLOQUEIOPESSOA.ShowModal();
              UniButtonDbEditcodigopessoas.Text := '0';
              Abort;
            end;

          if SqlPesquisa('SELECT * FROM PESSOAS WHERE CODIGO = ' + QuotedStr(UniButtonDbEditcodigopessoas.Text)) then
            begin
//              UniEditnomepessoa.Text                          := dm_rc.sqlBuscas.FindField('NOME').AsString;
              UniEditcidade.Text                              := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
              UniEditestado.Text                              := dm_rc.sqlBuscas.FindField('ESTADO').AsString;

              sqlMaster.FindField('ENTREGA_CEP').AsString      := dm_rc.sqlBuscas.FindField('CEPENTREGA').AsString;
              sqlMaster.FindField('ENTREGA_IBGE').AsString     := dm_rc.sqlBuscas.FindField('IBGEENTREGA').AsString;
              sqlMaster.FindField('ENTREGA_ENDERECO').AsString := dm_rc.sqlBuscas.FindField('ENDERECOENTREGA').AsString;
              sqlMaster.FindField('ENTREGA_NUMERO').AsString   := dm_rc.sqlBuscas.FindField('NUMEROENTREGA').AsString;
              sqlMaster.FindField('ENTREGA_BAIRRO').AsString   := dm_rc.sqlBuscas.FindField('BAIRROENTREGA').AsString;
              sqlMaster.FindField('ENTREGA_CIDADE').AsString   := dm_rc.sqlBuscas.FindField('CIDADEENTREGA').AsString;
              sqlMaster.FindField('ENTREGA_ESTADO').AsString   := dm_rc.sqlBuscas.FindField('ESTADOENTREGA').AsString;


              if Pos('-',dm_rc.sqlBuscas.FindField('CEP').AsString) <> 0 then
                begin
                  dm_rc.rc_ShowSweetAlert( 'ALERTA', 'CEP NÃO SERÁ VALIDO - AJUSTAR 1º NO CADASTRO' , 'error' );
                  Abort;
                end;


              if dm_rc.sqlBuscas.FindField('SITUACAO').AsString = '' then
                begin
                  dm_rc.rc_ShowSweetAlert( 'ALERTA', 'INFORMAR NO CADASTRO SE O CLIENTE É - ISENTO - NÃO CONTRUINTE - CONSUMIDOR' , 'error' );
                  Abort;
                end;

              if dm_rc.sqlBuscas.FindField('ESTADO').AsString = '' then
                begin
                  dm_rc.rc_ShowSweetAlert( 'ALERTA', 'INFORMAR NO CADASTRO SE O CLIENTE A UF' , 'error' );
                  Abort;
                end;

            end
          else
            begin
              dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'CLIENTE NÃO ENCONTRADO, BUSQUE NOVAMENTE' , 'error' );
              Abort
            end;
        end;
    end;
end;

procedure TfrmMOVIMENTOMESTRE.UniDBDateTimePickeremissaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  CampoCodigo: TComponent;
begin
  if (Key = VK_RETURN) and (Shift = []) and
     (dsMaster.State in [dsEdit, dsInsert]) then
  begin
    Key := 0;
    // O RadCore cria o campo de codigo como <nome do lookup>_CodID.
    CampoCodigo := FindComponent(LowerCase(edLkpCONDICOES.Name) + '_CodID');
    if CampoCodigo is TUniDBEdit then
      if TUniDBEdit(CampoCodigo).Visible and TUniDBEdit(CampoCodigo).Enabled then
      begin
        TUniDBEdit(CampoCodigo).SelectOnFocus := true;
        dm_rc.rc_SetFocus(CampoCodigo);
        Exit;
      end;
    dm_rc.rc_SetFocus(edLkpCONDICOES);
  end;
end;

procedure TfrmMOVIMENTOMESTRE.UniDBFormattedNumberEditdescontosExit(
  Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsInsert,dsEdit] then
    Calcula_Totais;
end;

procedure TfrmMOVIMENTOMESTRE.UniDBFormattedNumberEditvlrdespesasExit(
  Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsInsert,dsEdit] then
    Calcula_Totais;
end;

procedure TfrmMOVIMENTOMESTRE.UniDBGridprodutosCellClick(
  Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
   Linha  := TStringGrid(UniDBGridprodutos).Row;
   Coluna := UniDBGridprodutos.CurrCol;

  if sqlMaster.State in [dsInsert,dsEdit] then
    begin

      if Column.FieldName = 'exclui' then
        begin
          dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
          if mm.varB_Yes then
            begin
              memprodutos.Delete;
            end
        end;

      if Column.FieldName = 'buscaproduto' then
        begin
          MM.Seta_Busca('PRODUTOS');
          UniFfrmPesquisa.showmodal(
          procedure(Sender: TComponent; AResult: Integer)
           begin
             if AResult = mrOK then
             begin
               memprodutos.Edit;
               carregaprodutos(MM.varC_codigo_busca);
             end;
           end);
        end;

      if Column.FieldName = 'buscalote' then
        begin
          UniPopupMenulote.Popup(posicao_x-20,posicao_y, UniDBGridprodutos);
        end;

    end;
end;

procedure TfrmMOVIMENTOMESTRE.UniDBGridprodutosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmMOVIMENTOMESTRE.UniFrameCreate(Sender: TObject);
var
  DocumentoFiltro: string;
  CampoCodigoCondicoes: TComponent;
  CampoCodigoPessoa: TComponent;
begin

  DocumentoUnificado := true;

  if DocumentoUnificado then
    DocumentoFiltro := 'tab.DOCUMENTO in (3,4,10)'
  else
    DocumentoFiltro := 'tab.DOCUMENTO = ' + IntToStr(varC_Documento_Mvmestre);
  FCarregando := False;
  rcBlock465.Visible := DocumentoUnificado;
  UniComboTipoDocumento.Enabled := False;

  mm.varC_Table_Search     := 'mvmestre';
  mm.varC_PK_MasterTable   := 'CODIGO';
  sqlMaster.Close;

  sqlMaster.SQL.Text :=
    ' SELECT tab.* FROM MVMESTRE tab ' +
    ' WHERE tab.[[pk]] = :table_pk ' +
    ' AND tab.EMPRESA = ' + IntToStr(mm.varI_Code_Company) +
    ' AND ' + DocumentoFiltro +
    ' [grid] SELECT ' +
    ' tab."KEY", tab.EMPRESA, tab.DOCUMENTO, tab.CODIGO, ' +
    ' tab.NUMERO, tab.EMISSAO, tab.SERIE, tab.CANCELADA, tab.PESSOA, ' +
    ' p.CIDADE, p.ESTADO, p.NOME, tab.FECHAMENTO_STATUS, tab.VLRTOTAL ' +
    ' FROM MVMESTRE tab LEFT JOIN PESSOAS p ON p.CODIGO = tab.PESSOA ';

  ed_Where_Search.Text := 'tab.EMPRESA = ' + IntToStr(mm.varI_Code_Company) + ' AND ' + DocumentoFiltro;
  ed_Order_Search.Text := 'tab.NUMERO';

  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'model-crud:2|'+
                        'info-state:off|' +
                        'grid-paginator:center|' +
                        'numero[[titlealign:c|align:c]];' +
                        ']]';

  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDFieldDate.Name, 'tab.EMISSAO', 'EMISSAO');
  inherited;

  CampoCodigoPessoa := FindComponent(LowerCase(edLkpPESSOAS.Name) + '_CodID');

  if CampoCodigoPessoa is TUniDBEdit then
  begin
    FExitCodigoPessoa := TUniDBEdit(CampoCodigoPessoa).OnExit;
    TUniDBEdit(CampoCodigoPessoa).OnExit := CodigoPessoaExit;

    FEnterCodigoPessoa := TUniDBEdit(CampoCodigoPessoa).OnEnter;
    TUniDBEdit(CampoCodigoPessoa).OnEnter := CodigoPessoaEnter;
  end;

  // O inherited cria os campos de codigo dos lookups pelo RadCore.
  // Vincula apenas o teclado; preserva o OnExit de validacao do RadCore.
  CampoCodigoCondicoes := FindComponent(LowerCase(edLkpCONDICOES.Name) + '_CodID');
  if CampoCodigoCondicoes is TUniDBEdit then
  begin
    FExitCodigoCondicoes := TUniDBEdit(CampoCodigoCondicoes).OnExit;
    TUniDBEdit(CampoCodigoCondicoes).OnExit := CodigoCondicoesExit;
    TUniDBEdit(CampoCodigoCondicoes).OnKeyDown := edLkpCONDICOESKeyDown;
  end;
  ed_NoGenID.Text          := 'true';
  ed_GenNextID_OnNew.Text  := 'false';

//  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField0.Name,'tab.DOCUMENTO', 'ORCAMENTO');
//  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField0.Name,'tab.DOCUMENTO', 'PEDIDO');
//  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField0.Name,'tab.DOCUMENTO', 'NOTA');

  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name,'tab.NUMERO', 'NUMERO');
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name,'p.NOME', 'PESSOA');
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name,'tab.PESSOA', 'CODIGO DA PESSOA');
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name,'tab.SERIE', 'SERIE');
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name,'tab.CANCELADA', 'SITUACAO (A/C)');
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name,'tab.FECHAMENTO_STATUS', 'FECHAMENTO');

  if DocumentoUnificado then
    labTitleForm.Caption := 'ORÇAMENTO / PEDIDO / REQUISIÇÃO'
  else
    labTitleForm.Caption := 'MOVIMENTO MESTRE';

  btnSearchCRUDClick(Self);

  UniDBGridprodutos.Options := (UniDBGridprodutos.Options + [dgEditing]) - [dgRowSelect];
  UniDBGridprodutos.ClicksToEdit   := 1;
  UniDBGridprodutos.TabKeyBehavior := tkNextColumn;

  btnCalcReg.Visible := false;


  SetBut(tpListacomRegistros);
end;

procedure TfrmMOVIMENTOMESTRE.VerificaEdicao;
begin
  if  sqlMaster.State in [dsEdit,dsInsert] then
     begin
       dm_rc.rc_ShowSweetAlert('ATENÇÃO',labTitleForm.Caption + ' - REGISTRO AINDA ESTA EM ABERTO - CANCELE OU SALVE', 'error' );
       pgBaseCadControl.ActivePage := tabRegister;
       abort ;
     end;
end;

procedure TfrmMOVIMENTOMESTRE.VerificaFinanceiroAtual;
begin

end;

function TfrmMOVIMENTOMESTRE.VerificaSetemFinanceiro: Boolean;
var
  sql : string;
begin
  sql := ' select * from receber where numero = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger) +
         ' and serie                          = ' + QuotedStr(sqlMaster.FindField('SERIE').AsString)  +
         ' and empresa                        = ' + IntToStr(mm.varI_Code_Company)                   +
         ' and situacao                       = ' + QuotedStr('Pago');

  SqlPesquisa(sql);
  if dm_rc.sqlBuscas.RecordCount > 0 then
    Result := True
  else
    Result := False;

end;

procedure TfrmMOVIMENTOMESTRE.CodigoPessoaEnter(Sender: TObject);
begin
  FAlertaCodigoPessoa := False;

  if Assigned(FEnterCodigoPessoa) then
    FEnterCodigoPessoa(Sender);
end;

procedure TfrmMOVIMENTOMESTRE.CodigoPessoaExit(Sender: TObject);
var
  Codigo: Integer;
  TextoCodigo: string;
begin
  if not (Sender is TUniDBEdit) then
    Exit;

  if not (dsMaster.State in [dsEdit, dsInsert]) then
  begin
    if Assigned(FExitCodigoPessoa) then
      FExitCodigoPessoa(Sender);
    Exit;
  end;

  TextoCodigo := Trim(TUniDBEdit(Sender).Text);

  if not TryStrToInt(TextoCodigo, Codigo) or (Codigo <= 0) then
  begin
    UniLabel5.Caption := 'Pessoa - informe um código válido';
    UniLabel5.Font.Color := clRed;
    dm_rc.rc_SetFocus(Sender);
    Exit;
  end;

  if not SqlPesquisa(
    'SELECT CODIGO FROM PESSOAS WHERE CODIGO = ' + IntToStr(Codigo)
  ) then
  begin
    UniLabel5.Caption := 'Pessoa - código não encontrado';
    UniLabel5.Font.Color := clRed;
    dm_rc.rc_SetFocus(Sender);
    Exit;
  end;

  UniLabel5.Caption := 'Pessoa';
  UniLabel5.Font.Color := clBlack;

  if Assigned(FExitCodigoPessoa) then
    FExitCodigoPessoa(Sender);
end;


end.
