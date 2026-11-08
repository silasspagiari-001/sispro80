unit untFrmNOTAENTRADA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniMultiItem,
  uniComboBox, uniDateTimePicker, uniEdit, UniButtonEdit, uniScrollBox,
  uniPageControl, uniLabel, uniButton, uniBitBtn, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniDBEdit,
  uniDBDateTimePicker, UniButtonDbEdit, uniMemo, Vcl.Menus, uniMainMenu,
  uniDBMemo, pcnConversaoNFe;

type
TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros, tpCalcular);
  TfrmNOTAENTRADA = class(TfrmBase)
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    btnNewReg: TUniBitBtn;
    btnEditReg: TUniBitBtn;
    btnDeleteReg: TUniBitBtn;
    paGC: TUniContainerPanel;
    btnSaveReg: TUniBitBtn;
    btnCancelReg: TUniBitBtn;
    btnCalcReg: TUniBitBtn;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    paSearchFilter1: TUniContainerPanel;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditpessoas: TUniButtonEdit;
    paSearchOp1: TUniContainerPanel;
    UniButtonEditnumero: TUniButtonEdit;
    UniLabel1: TUniLabel;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel2: TUniLabel;
    cbxSearchCRUDFieldordem: TUniComboBox;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel3: TUniLabel;
    cbxSearchCRUDFieldstatus: TUniComboBox;
    dbgSearchCRUD: TUniDBGrid;
    paBaseRegData1: TUniTabSheet;
    UniScrollBox2: TUniScrollBox;
    dscrud: TDataSource;
    FDQryCad: TFDQuery;
    FDQryFiltro: TFDQuery;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroNUMERO: TIntegerField;
    FDQryFiltroSERIE: TStringField;
    FDQryFiltroCANCELADA: TStringField;
    FDQryFiltroPESSOA: TIntegerField;
    FDQryFiltroCIDADE: TStringField;
    FDQryFiltroESTADO: TStringField;
    FDQryFiltroCODIGOBARRAS: TStringField;
    FDQryFiltroNOME: TStringField;
    FDQryFiltroVLRTOTAL: TFMTBCDField;
    FDQryFiltrostatus: TStringField;
    FDQryFiltroopcoes: TStringField;
    FDQryFiltroEMISSAO: TDateField;
    dsfiltro: TDataSource;
    UniPageControlcadastros: TUniPageControl;
    UniTabSheetCRUD: TUniTabSheet;
    UniScrollBox3: TUniScrollBox;
    UniScrollBox4: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel71: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBDateTimePickeremissaonota: TUniDBDateTimePicker;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniDBEditNUMERONOTA: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniDBEdit22: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniButtonDbEditcodigooperacaomestre: TUniButtonDbEdit;
    UniEditdescricaooperacao: TUniEdit;
    UniButtonDbEditcodigofuncionariomestre: TUniButtonDbEdit;
    UniLabel8: TUniLabel;
    UniEditdescricaocondicao: TUniEdit;
    UniLabel11: TUniLabel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    UniLabel12: TUniLabel;
    UniButtonDbEditPESSOAS: TUniButtonDbEdit;
    UniEditnome: TUniEdit;
    UniLabel15: TUniLabel;
    UniEditcidade: TUniEdit;
    UniLabel13: TUniLabel;
    UniEditestado: TUniEdit;
    UniLabel14: TUniLabel;
    rcBlock140: TUniContainerPanel;
    dbgTITULOS: TUniDBGrid;
    rcBlock150: TUniContainerPanel;
    rcBlock160: TUniContainerPanel;
    rcBlock170: TUniContainerPanel;
    rcBlock180: TUniContainerPanel;
    rcBlock190: TUniContainerPanel;
    rcBlock200: TUniContainerPanel;
    rcBlock210: TUniContainerPanel;
    rcBlock220: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
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
    memprodutosSEMENTENOME: TStringField;
    memprodutosPERCCOFINS: TFloatField;
    memprodutosPERCPIS: TFloatField;
    memprodutosPEDIDOOR: TStringField;
    memprodutosPEDIDOITEMOR: TStringField;
    dsprodutos: TDataSource;
    tbtitulos: TFDMemTable;
    tbtitulosPARCELA: TIntegerField;
    tbtitulosVALOR: TFloatField;
    tbtitulosVENCIMENTO: TDateTimeField;
    dstitulos: TDataSource;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniLabel22: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEditvlrdespesas: TUniDBFormattedNumberEdit;
    UniLabel19: TUniLabel;
    UniLabel20: TUniLabel;
    UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit;
    UniLabel21: TUniLabel;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniLabel23: TUniLabel;
    UniMemolog: TUniMemo;
    rcBlock240: TUniContainerPanel;
    UniDBGridprodutos: TUniDBGrid;
    UniDBEditchaveacesso: TUniDBEdit;
    UniLabel24: TUniLabel;
    UniPopupMenuopcoes: TUniPopupMenu;
    I2: TUniMenuItem;
    N2: TUniMenuItem;
    E1: TUniMenuItem;
    memprodutosVALORST: TFloatField;
    memprodutosBASEST: TFloatField;
    memprodutosCFOPENTRADA: TStringField;
    memprodutosFORNECEDORCODIGO: TStringField;
    FDQryFiltroCHAVEACESSO: TBlobField;
    memprodutosbuscaentrada: TStringField;
    memprodutosPUREZAENTRADA: TFloatField;
    memprodutosVCENTRADA: TFloatField;
    memprodutosGERMINACAOENTRADA: TFloatField;
    memprodutosCODIGOFORNECEDOR: TStringField;
    UniPopupMenudetalhes: TUniPopupMenu;
    UniMenuItem5: TUniMenuItem;
    rcBlock250: TUniContainerPanel;
    UniLabel25: TUniLabel;
    UniDBMemoobservacao: TUniDBMemo;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure memprodutosAfterPost(DataSet: TDataSet);
    procedure memprodutosAfterDelete(DataSet: TDataSet);
    procedure memprodutosBeforeDelete(DataSet: TDataSet);
    procedure memprodutosBeforePost(DataSet: TDataSet);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure UniButtonDbEditcodigooperacaomestreButtonClick(Sender: TObject);
    procedure UniButtonDbEditcodigofuncionariomestreButtonClick(
      Sender: TObject);
    procedure UniButtonDbEditcodigooperacaomestreExit(Sender: TObject);
    procedure UniButtonDbEditcodigofuncionariomestreExit(Sender: TObject);
    procedure UniButtonDbEditPESSOASButtonClick(Sender: TObject);
    procedure UniButtonDbEditPESSOASExit(Sender: TObject);
    procedure memprodutosbuscaprodutoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure memprodutosexcluiGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure memprodutosbuscaloteGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure memprodutosopcoesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniDBGridprodutosCellClick(Column: TUniDBGridColumn);
    procedure btnCalcRegClick(Sender: TObject);
    procedure UniDBFormattedNumberEditvlrdespesasExit(Sender: TObject);
    procedure UniDBFormattedNumberEditdescontosExit(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure I2Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure i1Click(Sender: TObject);
    procedure memprodutosbuscaentradaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDQryFiltroopcoesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
  varC_Documento_MvmestreNFE : Integer;
  procedure  ativabusca();
  procedure  SetBut(Acao:TAcaoCrud);
  procedure  carregafinanceiro(cempresa,cdocumento,cnumero:integer);
  procedure  carregaitens(cempresa,cdocumento,cnumero:integer);
  procedure  carregadados();
  procedure  LimpaVars();
  procedure  Exclui();
  procedure  MemoGravaLog();
  procedure  GravaMovimento();
  procedure  Calcula_Totais();
  procedure  gravamemoria();
  procedure  carregaprodutos(codigo:string);
  procedure  Calcula_Titulos();
  procedure  ValidaInfoProdutoMemoria(foperacao:real; fproduto,fempresa: integer);

  function  Base_Icms(F_ESTADO, F_INSCRICAO :string; F_OPERACAO: Integer):real;
  function  Aliq_Icms(F_ESTADO, F_INSCRICAO :string; F_OPERACAO: Integer):real;
  procedure Calcula_Icms(F_TIPO:String);
  procedure MenuOpcoes(pacao:Boolean);
  procedure carregalote(lote:string;produto:integer);
  procedure gravalotesementeorigem(const pacao:string);
  function  CamposValidados :Boolean;

  end;

var
  frmNOTAENTRADA: TfrmNOTAENTRADA;
  state         : string;

implementation

uses
  System.DateUtils, mkm_funcoes, mkm_func_web , MainModule, System.TypInfo,
  mkm_procedures, untDM_RC, uniGUITypes, untFrmPesquisa,
  untFrmDETALHESITENSNOTA, Vcl.Grids, untFrmTELAGENERICA, Main,
  unReportImpressao;
{$R *.dfm}

function TfrmNOTAENTRADA.Aliq_Icms(F_ESTADO, F_INSCRICAO: string;
  F_OPERACAO: Integer): real;
begin
  TabelaOperacao('SELECT * FROM OPERACOES WHERE CODIGO = ' + IntToStr(F_OPERACAO));
  TabelaEmpresas('SELECT *  FROM EMPRESAS WHERE CODIGO = ' + IntToStr(MM.varI_Code_Company));

  if (dm_rc.FDQryoperacoes.FindField('CALCULA_ICMS').AsString = '0') then
  result := 0
  else
  if UniEditestado.Text = dm_rc.tbempresas.FindField('UF').AsString then
  result := memprodutos.FindField('Icm0').AsFloat
  else
  if StrContains('MT#MS#TO#PA#AM#AC#PB#RN#SE#PE#ES#RO#AP#AL#CE#BA#DF#GO#MA#NO#RS#PI#RR',F_ESTADO) then
  begin
  if StrEmpty(F_INSCRICAO) then
  result := memprodutos.FindField('Icm0').AsFloat
  else
  result := memprodutos.FindField('Icm1').AsFloat;
  end
  else
  if StrEmpty(F_INSCRICAO) then
  result := memprodutos.FindField('Icm0').AsFloat
  else
  result := memprodutos.FindField('Icm2').AsFloat;

  if (dm_rc.FDQryoperacoes.FindField('ENTRADA_SAIDA').AsString = '0') then
  begin
  if (dm_rc.FDQryoperacoes.FindField('ENTRADA_SAIDA').AsInteger = 0) and (StrContains('2',IntToStr(varC_Documento_MvmestreNFE))) then
  begin
  if not StrEmpty(F_INSCRICAO) then
  result := variif(StrContains('MT#MS#TO#PA#AM#PB#AC#RN#SE#PE#ES#RO#AP#AL#CE#BA#DF#GO#MA#NO#RS#PI#RR#PR',F_ESTADO),memprodutos.FindField('Icm2').AsFloat, memprodutos.FindField('Icm0').AsFloat)
  else
  result := memprodutos.FindField('Icm1').AsFloat;
  end
  else
  begin
  if StrEmpty(F_INSCRICAO) then
  result := memprodutos.FindField('Icm1').AsFloat
  else
  if UniEditestado.Text = dm_rc.tbempresas.FindField('UF').AsString then
    result := memprodutos.FindField('Icm0').AsFloat
  else
    result := memprodutos.FindField('Icm2').AsFloat;
  end;
  end;

end;

procedure TfrmNOTAENTRADA.ativabusca;
begin
  if not ( dsfiltro.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;

function TfrmNOTAENTRADA.Base_Icms(F_ESTADO, F_INSCRICAO: string;
  F_OPERACAO: Integer): real;
begin
  TabelaOperacao('SELECT * FROM OPERACOES WHERE CODIGO = ' + IntToStr(F_OPERACAO));
  TabelaEmpresas('SELECT *  FROM EMPRESAS WHERE CODIGO = ' + IntToStr(MM.varI_Code_Company));

  if StrEmpty(F_ESTADO) then
  begin
//    msg('Estado Esta Vazio Verifique');
    abort;
  end;

  if (dm_rc.FDQryoperacoes.FindField('CALCULA_ICMS').AsInteger = 0) then
  result := 0
  else
  if UniEditestado.Text = dm_rc.tbempresas.FindField('UF').AsString then
  result := memprodutos.FindField('Bas0').AsFloat
  else
  if StrContains('MT#MS#TO#PA#AM#AC#PB#RN#SE#PE#ES#RO#AP#AL#CE#BA#DF#GO#MA#NO#RS#PI#RR',F_ESTADO) then
  begin
  if StrEmpty(F_INSCRICAO) then
    result := memprodutos.FindField('Bas0').AsFloat
  else
    result := memprodutos.FindField('Bas1').AsFloat;
  end
  else
  if StrEmpty(F_INSCRICAO) then
  result := memprodutos.FindField('Bas0').AsFloat
  else
  result := memprodutos.FindField('Bas2').AsFloat;
end;

procedure TfrmNOTAENTRADA.btnCalcRegClick(Sender: TObject);
begin
  Calcula_Totais();

  //************************************************************************//
  dm_rc.rc_ShowYesNo( 'POSSO CALCULAR ESSE DOCUMENTO?' );
  if mm.varB_Yes then
    begin
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
      dbgTITULOS.Options                 := dbgTITULOS.Options + [dgEditing];
    end;
end;

procedure TfrmNOTAENTRADA.btnCancelRegClick(Sender: TObject);
begin
  inherited;
  if  sqlSearchMaster.IsEmpty then
      SetBut(tpListaVazia)
  else
      SetBut(tpListacomRegistros);

   sqlMaster.Close ;

   tbtitulos.Close;
   memprodutos.Close;

   LimpaVars;
  MenuOpcoes(False);
end;

procedure TfrmNOTAENTRADA.btnDeleteRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  Exclui();

    Try
       sqlMaster.Close;

      for i := 0 to  sqlMaster.Params.Count - 1 do
      begin
        Cmp :=  sqlMaster.Params[i].Name;
         sqlMaster.Params[i].Value :=  sqlSearchMaster.FieldByName(Cmp).Value ;
      end;
       sqlMaster.Open;
    Except
      abort;
    End;
end;

procedure TfrmNOTAENTRADA.btnEditRegClick(Sender: TObject);
var i : integer; Cmp:String;
  S, R: Integer;
begin
  inherited;

  pgBaseCadControl.ActivePage        := paBaseRegData1;
  UniPageControlcadastros.ActivePage := UniTabSheetCRUD;

  SetBut(tpAlterar);
  MenuOpcoes(True);
  mm.FDTransaction.StartTransaction;

  Try
    sqlMaster.Close;
   for i := 0 to  sqlMaster.Params.Count - 1 do
   begin
      Cmp :=  sqlMaster.Params[i].Name;
      sqlMaster.Params[i].Value :=  sqlSearchMaster.FieldbyName(Cmp).Value;
   end;
    sqlMaster.Open;

    sqlMaster.Edit;

    UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgRowSelect];
    UniDBGridprodutos.Options          := UniDBGridprodutos.Options + [dgEditing];

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

  Except
   Abort ;
  End ;
end;

procedure TfrmNOTAENTRADA.btnNewRegClick(Sender: TObject);
  var i : integer; Cmp:String;
  S, R: Integer;
begin
  inherited;

  labTitleForm.Caption            := 'NOTA DE ENTRADA';

  pgBaseCadControl.ActivePage        := paBaseRegData1;
  UniPageControlcadastros.ActivePage := UniTabSheetCRUD;

  SetBut(tpIncluir);
  MenuOpcoes(True);
  mm.FDTransaction.StartTransaction;

  try
    sqlMaster.Close ;
    for i := 0 to  sqlMaster.Params.Count - 1 do
    begin
      Cmp :=  sqlMaster.Params[i].Name;
       sqlMaster.Params[i].Value :=  sqlSearchMaster.FieldbyName(Cmp).Value;
    end;
     sqlMaster.Open;
  Except
     sqlMaster.Params[0].AsInteger := -1 ;
     sqlMaster.Open;
  End;

  LimpaVars;

  if not( sqlMaster.Active) then
      sqlMaster.Open;

  SqlPesquisa(' select operacao,serie, condicao from documentos where documento = ' + IntToStr(varC_Documento_MvmestreNFE) +
              ' and empresa                                                     = ' + IntToStr(mm.varI_Code_Company));

   sqlMaster.Insert ;
   sqlMaster.FindField('PESSOA').AsInteger               := 0;
   sqlMaster.FindField('EMPRESA').AsInteger              := mm.varI_Code_Company;
   sqlMaster.FindField('DOCUMENTO').AsInteger            := varC_Documento_MvmestreNFE;
   sqlMaster.FindField('FUNCIONARIO').AsInteger          := 0;
   sqlMaster.FindField('SERIE').AsString                 := dm_rc.sqlBuscas.FindField('SERIE').AsString;
   sqlMaster.FindField('EMISSAO').AsDateTime             := Date;
   sqlMaster.FindField('RECEPCAODESPACHO').AsDateTime    := Date;
   sqlMaster.FindField('OPERACAO').AsInteger             := 0;
   sqlMaster.FindField('CONDICAO').AsInteger             := dm_rc.sqlBuscas.FindField('CONDICAO').AsInteger;

   sqlMaster.FindField('VLRDESCONTOS').AsFloat           := 0;
   sqlMaster.FindField('VLRPRODUTOS').AsFloat            := 0;
   sqlMaster.FindField('VLRDESPESAS').AsFloat            := 0;
   sqlMaster.FindField('VLRTOTAL').AsFloat               := 0;
   sqlMaster.FindField('VLRBASEICMS').AsFloat            := 0;
   sqlMaster.FindField('VLRICMS').AsFloat                := 0;



  UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgRowSelect];
  UniDBGridprodutos.Options          := UniDBGridprodutos.Options + [dgEditing];

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

  mm.varTXTXML_ENTRADA     := '';

  UniDBEditNUMERONOTA.SetFocus;
end;

procedure TfrmNOTAENTRADA.btnOptionsClick(Sender: TObject);
begin
  UniPopupMenuopcoes.PopupBy( TUniButton( sender ) );
end;

procedure TfrmNOTAENTRADA.btnSaveRegClick(Sender: TObject);
var
  vdup, vtotal:Real;
  M_MARCAM  : TBookMark;
begin
  inherited;
  M_MARCAM  := sqlMaster.GetBookmark;

  if not (CamposValidados) then
     Abort
  else
    if sqlMaster.State in [dsInsert,dsEdit] then
     Begin
       if sqlMaster.State in [dsInsert] then
         begin
           sqlMaster.FindField('LOGINCLUSAO').AsString  := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
           sqlMaster.FindField('KEY').AsString          := Gera_Guid;
           sqlMaster.FindField('CODIGO').AsInteger      := Ultimo_Codigo('MVMESTRE','CODIGO',False);
         end
       else
         begin
           sqlMaster.FindField('LOGALTERACAO').AsString  := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
         end;

       sqlMaster.FindField('DOCUMENTO').AsInteger        := varC_Documento_MvmestreNFE;
       sqlMaster.FindField('EMPRESA').AsInteger          := MM.varI_Code_Company;

       //grava tabelas principal
       state := Retornastatustable(FDQryCad);
       sqlMaster.Post;


       // grava demais informações
       GravaMovimento();

       try

         MemoGravaLog();
         GravaLog(mm.varI_Code_Company,
                  mm.varI_User,
                  sqlMaster.FindField('CODIGO').AsInteger,
                  mm.vUserName,
                  state,
                  sqlMaster.UpdateOptions.UpdateTableName,
                  '',
                  UniMemolog.Text);

         dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success' , false );

         mm.FDTransaction.CommitRetaining;
         mm.FDTransaction.Commit;
       except
         dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE!' , 'error' , false );
       end;
     End;

  if  sqlSearchMaster.Active then
    begin
      sqlSearchMaster.Refresh;
      sqlSearchMaster.Locate('NUMERO',sqlMaster.FindField('NUMERO').AsInteger,[]);;
    end;

  if  sqlSearchMaster.IsEmpty then
   SetBut(tpListaVazia)
  Else
   SetBut(tpListacomRegistros);

  sqlMaster.GotoBookmark(M_MARCAM);
  sqlMaster.FreeBookmark(M_MARCAM);

  sqlSearchMaster.Refresh;
  sqlMaster.Refresh;

  MenuOpcoes(False);
end;

procedure TfrmNOTAENTRADA.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmNOTAENTRADA.btnSearchCRUDClick(Sender: TObject);
var
  SQL,WHERE,SITUACAO,M_AND,M_ORDEM,M_SITUACAO,CAMPOS : string;
begin
  inherited;
  case cbxSearchCRUDFieldordem.ItemIndex of
    0: M_ORDEM := ' ORDER BY M.EMISSAO';
    1: M_ORDEM := ' ORDER BY M.NUMERO';
    2: M_ORDEM := ' ORDER BY M.PESSOA';
  end;

  CAMPOS  := ' M.CODIGO, M.NUMERO,M.EMISSAO,M.SERIE,M.CANCELADA,M.PESSOA,P.CIDADE,P.ESTADO,P.NOME,M.CODIGOBARRAS,M.CHAVEACESSO,M.VLRTOTAL ';
  M_AND   := ' AND M.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
             ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));;

  SQL :=    ' SELECT          ' + CAMPOS +
            ' FROM   MVMESTRE ' +
            ' M INNER JOIN PESSOAS P ON (M.PESSOA = P.CODIGO)        ' +
            variif(UniButtonEditpessoas.Text              = '0'    ,'','AND M.PESSOA      = '  + QuotedStr(UniButtonEditpessoas.Text))      +
            variif(UniButtonEditnumero.Text               = '0'    ,'','AND M.NUMERO      = '  + QuotedStr(UniButtonEditnumero.Text))       +
            ' AND M.EMPRESA                               = ' + IntToStr(mm.varI_Code_Company) +
            ' AND M.DOCUMENTO                             = ' + IntToStr(varC_Documento_MvmestreNFE);

  if (UniButtonEditpessoas.Text = '0') and (UniButtonEditnumero.Text = '0') then
    SQL := SQL + M_AND + M_SITUACAO + M_ORDEM
  else
    SQL := SQL + M_SITUACAO + M_ORDEM ;


  sqlSearchMaster.Close;
  sqlSearchMaster.SQL.Clear;
  sqlSearchMaster.SQL.Text  := SQL;
  sqlSearchMaster.Open();

  if sqlSearchMaster.RecordCount > 0 then
    begin
      SetBut(tpListacomRegistros);
      sqlSearchMaster.Last;
    end
  else
    SetBut(tpListaVazia);

end;

procedure TfrmNOTAENTRADA.Calcula_Icms(F_TIPO: String);
var
  M_MARCA  : TBookMark;
  M_SAIVLP : Real;
  M_SAIVLN : Real;
  M_SAIBIC : Real;
  M_SAIVIC : Real;
  M_SAITOT : Real;
  M_SAIVIP : Real;
  M_RESTOV : Real;
  M_SAIVFI : Real;

begin
  TabelaOperacao('SELECT * FROM OPERACOES WHERE CODIGO = ' + QuotedStr(UniButtonDbEditcodigooperacaomestre.Text));
  M_MARCA  := memprodutos.GetBookmark;
  M_SAITOT := 0;

  memprodutos.DisableControls;
  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforeDelete := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.First;

  M_SAIVLP := 0;
  M_SAIVIP := 0;
  M_SAIBIC := 0;
  M_SAIVIC := 0;
  M_SAIVLN := 0;

  while not memprodutos.eof do
    begin
      if memprodutos.FindField('Produto').AsInteger > 0 then  // Zera os campos da tabela para recáculo
        begin
          memprodutos.Edit;
          memprodutos.FindField('ValorIpi').AsFloat  :=0;
          memprodutos.FindField('Despesa').AsFloat   :=0;
          memprodutos.FindField('BaseIcms').AsFloat  :=0;
          memprodutos.FindField('PercIcms').AsFloat  :=0;
          memprodutos.FindField('ValorIcms').AsFloat :=0;
          memprodutos.FindField('ValorIpi').AsFloat  :=0;
//          memprodutos.FindField('Desconto').AsFloat  :=0;
          memprodutos.Post;
        end;
      memprodutos.next;
    end;

  M_SAITOT := 0;
    memprodutos.First;
    while not memprodutos.eof do
      begin
        if memprodutos.FindField('Produto').AsInteger > 0 then
          begin
             M_SAITOT := M_SAITOT + memprodutos.FindField('Total').AsFloat;
//             memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('Total').AsFloat - memprodutos.FindField('DESCONTO').AsFloat
          end;
        memprodutos.next;
        Application.ProcessMessages;
      end;

    if (dm_rc.FDQryoperacoes.FindField('CALCULA_IPI').AsString = '1')  then
      begin
        memprodutos.First;
        while not memprodutos.eof do
          begin
            if memprodutos.FindField('Produto').AsInteger > 0 then
              begin
                if memprodutos.FindField('PercIpi').Value > 0 then
                  begin
                    memprodutos.Edit;
                    memprodutos.FindField('ValorIpi').AsFloat:= MRound(((memprodutos.FindField('TOTAL').Value * 0.01) * memprodutos.FindField('PercIpi').Value), 2);
                    memprodutos.Post;
                  end;
              end;
            memprodutos.next;
            Application.ProcessMessages;
          end;
      end;

  // calcula rateio de despesas

    if (sqlMaster.findfield('VLRDSPTRIBUTADA').asfloat + sqlMaster.findfield('VLRDSPNTRIBUTADA').asfloat + sqlMaster.findfield('VLRDESPESAS').asfloat) > 0 then
      begin
        memprodutos.First;
        M_SAITOT := 0;
        while not memprodutos.eof do
          begin
            if memprodutos.FindField('Produto').AsInteger > 0 then
              M_SAITOT := M_SAITOT + memprodutos.FindField('TOTAL').Value;
            memprodutos.next;
          end;
        memprodutos.First;
        while not memprodutos.eof do
          begin
            if memprodutos.FindField('Produto').AsInteger > 0 then
              begin
                memprodutos.Edit;
                memprodutos.FindField('Despesa').AsFloat := MRound(((sqlMaster.findfield('VLRDSPTRIBUTADA').asfloat + sqlMaster.findfield('VLRDSPNTRIBUTADA').asfloat + sqlMaster.findfield('VLRDESPESAS').asfloat) / M_SAITOT) * memprodutos.FindField('TOTAL').Value,2);
                memprodutos.Post;
              end;
            memprodutos.next;
          end;
      end;

//verifica rateio de despesa

  if MRound((sqlMaster.findfield('VLRDSPTRIBUTADA').asfloat + sqlMaster.findfield('VLRDSPNTRIBUTADA').asfloat + sqlMaster.findfield('VLRDESPESAS').asfloat) , 2) > 0 then
    begin
      M_SAITOT := 0;
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('Produto').AsInteger > 0 then
            begin
               M_SAITOT := M_SAITOT + MRound(memprodutos.FindField('Despesa').Value, 2);
            end;
          memprodutos.Next;
          Application.ProcessMessages;
        end;
        M_RESTOV := MRound(sqlMaster.findfield('VLRDSPTRIBUTADA').asfloat + sqlMaster.findfield('VLRDSPNTRIBUTADA').asfloat + sqlMaster.findfield('VLRDESPESAS').asfloat, 2) - MRound(M_SAITOT, 2);
        if M_RESTOV <> 0 then
          begin
            memprodutos.First;
            memprodutos.Edit;
            if M_RESTOV > 0 then
              memprodutos.FindField('Despesa').AsFloat :=  memprodutos.FindField('Despesa').AsFloat + M_RESTOV
            else
              memprodutos.FindField('Despesa').AsFloat :=  memprodutos.FindField('Despesa').AsFloat - Abs(M_RESTOV);
            memprodutos.Post;
           end;
    end;

// calcula valor do Icms
  if (dm_rc.FDQryoperacoes.FindField('CALCULA_ICMS').AsString = '1') then
    begin
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('Produto').AsInteger > 0 then
            begin
              memprodutos.Edit;
              memprodutos.FindField('PercIcms').AsFloat:=Aliq_Icms(UniEditestado.text,dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString,strtoint(UniButtonDbEditcodigooperacaomestre.text));
              if (dm_rc.FDQryoperacoes.FindField('CALCULA_ICMS_SOBRE_NOTA').AsString = '1') then
                begin
                  memprodutos.FindField('percreducao').AsFloat := MRound(Base_Icms(UniEditestado.text,dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString,strtoint(UniButtonDbEditcodigooperacaomestre.text)),2);

                  if dm_rc.FDQryoperacoes.FindField('ENTRADA_SAIDA').AsInteger = 1 then
                    memprodutos.FindField('BaseIcms').AsFloat    := (memprodutos.FindField('Total').Value + memprodutos.FindField('Despesa').Value - memprodutos.FindField('Desconto').Value) // soma ipi + dsp na base icms
                  else
                    memprodutos.FindField('BaseIcms').AsFloat    := (memprodutos.FindField('Total').Value + memprodutos.FindField('ValorIpi').Value + memprodutos.FindField('Despesa').Value); // soma ipi + dsp na base icms

                  memprodutos.FindField('BaseIcms').AsFloat    := MRound((memprodutos.FindField('BaseIcms').Value / 100) * variif(Base_Icms(UniEditestado.text,dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString,strtoint(UniButtonDbEditcodigooperacaomestre.text)) = 0, 100, Base_Icms(UniEditestado.text,dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString,strtoint(UniButtonDbEditcodigooperacaomestre.text))), 2);
                  memprodutos.FindField('ValorIcms').AsFloat   := MRound((memprodutos.FindField('BaseIcms').Value / 100) * Aliq_Icms(UniEditestado.text,dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString,strtoint(UniButtonDbEditcodigooperacaomestre.text)), 2);
                end
              else
                begin
                  memprodutos.FindField('percreducao').AsFloat := MRound(Base_Icms(UniEditestado.text,dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString,strtoint(UniButtonDbEditcodigooperacaomestre.text)),2);
                  memprodutos.FindField('BaseIcms').AsFloat    := (memprodutos.FindField('Total').Value + memprodutos.FindField('ValorIpi').Value + memprodutos.FindField('Despesa').Value - memprodutos.FindField('Desconto').Value); // soma ipi + dsp na base icms
                  memprodutos.FindField('BaseIcms').AsFloat    := MRound((memprodutos.FindField('BaseIcms').Value / 100) * variif(Base_Icms(UniEditestado.text,dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString,strtoint(UniButtonDbEditcodigooperacaomestre.text)) = 0, 100, Base_Icms(UniEditestado.text,dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString,strtoint(UniButtonDbEditcodigooperacaomestre.text))), 2);
                  memprodutos.FindField('ValorIcms').AsFloat   := MRound((memprodutos.FindField('BaseIcms').Value / 100) * Aliq_Icms(UniEditestado.text,dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString,strtoint(UniButtonDbEditcodigooperacaomestre.text)), 2);
                end;

              if memprodutos.FindField('ValorIcms').AsFloat = 0 then memprodutos.FindField('BaseIcms').AsFloat := 0;
              memprodutos.Post;
            end;
          memprodutos.next;
        end;

      // calcula totais da nota
        memprodutos.First;
        while not memprodutos.eof do
          begin
            if memprodutos.FindField('Produto').AsInteger > 0 then
              begin
                M_SAIVLP := M_SAIVLP + memprodutos.FindField('Total').AsFloat;
                M_SAIVIP := M_SAIVIP + memprodutos.FindField('ValorIpi').AsFloat;
                M_SAIBIC := M_SAIBIC + memprodutos.FindField('BaseIcms').AsFloat;
                M_SAIVIC := M_SAIVIC + memprodutos.FindField('ValorIcms').AsFloat;
                M_SAIVLN := M_SAIVLN + (memprodutos.FindField('Total').AsFloat + memprodutos.FindField('ValorIpi').AsFloat + memprodutos.FindField('Despesa').AsFloat);
              end;
            memprodutos.next;
            Application.ProcessMessages;
          end;
    end;

  sqlMaster.edit;
  sqlMaster.findfield('VLRBASEICMS').asfloat := M_SAIBIC;
  sqlMaster.findfield('VLRICMS').asfloat     := M_SAIVIC;
  sqlMaster.findfield('VLRIPI').asfloat      := M_SAIVIP;

  memprodutos.AfterDelete        := memprodutosAfterDelete;
  memprodutos.AfterPost          := memprodutosAfterPost;
  memprodutos.BeforeDelete       := memprodutosBeforeDelete;
  memprodutos.BeforePost         := memprodutosBeforePost;

  memprodutos.EnableControls;
  memprodutos.GotoBookmark(M_MARCA);
  memprodutos.FreeBookmark(M_MARCA);
  memprodutos.Refresh;
end;

procedure TfrmNOTAENTRADA.Calcula_Titulos;
var
  M_PARCELAS : TStringList;
  R          : Integer;
  M_RESTO    : Real;
  ORDEM,
  M_ITENS    : Integer;
begin
  tbtitulos.Close;
  tbtitulos.Open;

  if SqlPesquisa('SELECT * FROM CONDICOES WHERE CODIGO = ' + QuotedStr(UniButtonDbEditcodigofuncionariomestre.Text)) then

  ORDEM      := 0;
  M_PARCELAS := Explode(Trim(dm_rc.sqlBuscas.FindField('OBSERVACOES').AsString),',');
  M_RESTO    := UniDBFormattedNumberEditvlrtotal.Value;
  M_ITENS    := variif(dm_rc.sqlBuscas.FindField('PARCELAS').AsInteger=0,1,Valor(dm_rc.sqlBuscas.FindField('PARCELAS').AsString));

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
      tbtitulos.FindField('VENCIMENTO').AsDateTime := date + Valor(M_PARCELAS[R]);
      tbtitulos.FindField('VALOR').AsFloat         := MRound(UniDBFormattedNumberEditvlrtotal.Value / M_ITENS,2);
      tbtitulos.FindField('PARCELA').AsInteger     := ORDEM;
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

procedure TfrmNOTAENTRADA.Calcula_Totais;
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
      if mm.M_TIPOPESO = 'Saco' then
        begin
          if memprodutos.FindField('PESOSACO').AsFloat > 0 then
            begin
              memprodutos.Edit;
              memprodutos.FindField('PESOLIQUIDO').AsFloat := (memprodutos.FindField('QUANTIDADE').AsFloat / memprodutos.FindField('PESOSACO').AsFloat) * memprodutos.FindField('PESOSACO').AsFloat;
              memprodutos.FindField('PESOBRUTO').AsFloat   := (memprodutos.FindField('QUANTIDADE').AsFloat / memprodutos.FindField('PESOSACO').AsFloat) * memprodutos.FindField('PESOSACO').AsFloat;
              memprodutos.Post;

              M_PESO        := M_PESO        + memprodutos.FindField('PESOLIQUIDO').AsFloat;
              M_BRUTO       := M_BRUTO       + memprodutos.FindField('PESOBRUTO').AsFloat;
              M_QUANTIDADE  := M_QUANTIDADE  + (memprodutos.FindField('QUANTIDADE').AsFloat / memprodutos.FindField('PESOSACO').AsFloat);

            end
          else
            begin
              M_PESO        := M_PESO        + memprodutos.FindField('QUANTIDADE').AsFloat;
              M_BRUTO       := M_BRUTO       + memprodutos.FindField('QUANTIDADE').AsFloat;
              M_QUANTIDADE  := M_QUANTIDADE  + memprodutos.FindField('QUANTIDADE').AsFloat;

              memprodutos.Edit;
              memprodutos.FindField('PESOLIQUIDO').AsFloat := memprodutos.FindField('QUANTIDADE').AsFloat;
              memprodutos.FindField('PESOBRUTO').AsFloat   := memprodutos.FindField('QUANTIDADE').AsFloat;
              memprodutos.Post;
            end;
        end
      else
        begin
          memprodutos.Edit;
          memprodutos.FindField('PESOLIQUIDO').AsFloat := memprodutos.FindField('QUANTIDADE').AsFloat;
          memprodutos.FindField('PESOBRUTO').AsFloat   := memprodutos.FindField('QUANTIDADE').AsFloat;
          memprodutos.Post;
        end;

      //*****************************************************************//

      //*****************************************************************//
      // VALORES
      //*****************************************************************//
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

  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;

  memprodutos.GotoBookmark(M_MARCA);
  memprodutos.FreeBookmark(M_MARCA);
  memprodutos.EnableControls;

end;

function TfrmNOTAENTRADA.CamposValidados: Boolean;
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
           dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', Campos.Text, 'warning' , false );
           sqlMaster.Fields[e].FocusControl ;
           result := false ;
        end
     Else
       result := true;

  finally
    Campos.Free;
  end;
end;

procedure TfrmNOTAENTRADA.carregadados;
begin

  LimpaVars();
  tbtitulos.Close;
  tbtitulos.Open;

  memprodutos.Close;
  memprodutos.Open;

  TabelaOperacao('select * from operacoes where codigo = ' + IntToStr(sqlMaster.FindField('OPERACAO').AsInteger));
  UniEditdescricaooperacao.Text := Acha_Item('OPERACOES' ,IntToStr(sqlMaster.FindField('OPERACAO').AsInteger));
  UniEditdescricaocondicao.Text := Acha_Item('CONDICOES' ,IntToStr(sqlMaster.FindField('CONDICAO').AsInteger));

  if SqlPesquisa('SELECT CODIGO, NOME, CIDADE, ESTADO FROM PESSOAS WHERE CODIGO = ' + IntToStr(sqlMaster.FindField('PESSOA').AsInteger)) then
    begin
      UniEditnome.Text        := dm_rc.sqlBuscas.FindField('NOME').AsString;
      UniEditcidade.Text      := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
      UniEditestado.Text      := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
    end;

  carregafinanceiro(mm.varI_Code_Company,sqlMaster.FindField('DOCUMENTO').AsInteger,sqlMaster.FindField('NUMERO').AsInteger);
  carregaitens     (mm.varI_Code_Company,sqlMaster.FindField('DOCUMENTO').AsInteger,sqlMaster.FindField('NUMERO').AsInteger);

  labTitleForm.Caption := 'NOTA DE ENTRADA';
end;

procedure TfrmNOTAENTRADA.carregafinanceiro(cempresa, cdocumento,
  cnumero: integer);
begin
  TabelaOperacao('select financeiro from operacoes where codigo = ' + QuotedStr(sqlMaster.FindField('OPERACAO').AsString));

  if SqlPesquisa(' SELECT SEQUENCIA, VENCIMENTO, VALORORIGINAL FROM '+variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR') +
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
          tbtitulos.Post;

          dm_rc.sqlBuscas.Next;
        end;

      tbtitulos.First;
    end;

end;

procedure TfrmNOTAENTRADA.carregaitens(cempresa, cdocumento, cnumero: integer);
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
        memprodutos.FindField('QUANTIDADE').AsFloat      :=  dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
        memprodutos.FindField('TOTAL').AsFloat           :=  dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
        memprodutos.FindField('PESOBRUTO').AsFloat       :=  dm_rc.sqlBuscas.FindField('PESOBRUTO').AsFloat;
        memprodutos.FindField('PESOLIQUIDO').AsFloat     :=  dm_rc.sqlBuscas.FindField('PESOLIQUIDO').AsFloat;

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

        if TabelaFonecedor('SELECT * FROM FORNECEDOR_PRODUTO WHERE PESSOA = ' + QuotedStr(UniButtonDbEditPESSOAS.Text) +
                           'AND CODIGOSISTEMA                             = ' + IntToStr(memprodutos.FindField('PRODUTO').AsInteger)) then

        begin
          memprodutos.FindField('CODIGOFORNECEDOR').AsString     :=  dm_rc.fdqryfornecedorproduto.FindField('CODIGOFORNECEDOR').AsString
        end;


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

          if dm_rc.sqlBuscas.FindField('CAMPO').AsString <> '' then
            begin
              memprodutos.FindField('CAMPO').AsString       := dm_rc.sqlBuscas.Findfield('CAMPO').AsString;
              memprodutos.FindField('SAFRACAMPO').AsString  := dm_rc.sqlBuscas.Findfield('SAFRACAMPO').AsString;
              memprodutos.FindField('COOPERANTE').AsInteger := dm_rc.sqlBuscas.Findfield('COOPERANTE').AsInteger;
            end;

        memprodutos.FindField('LOTEENTRADA').AsString          := dm_rc.sqlBuscas.FindField('LOTEENTRADA').AsString;
        memprodutos.FindField('VCENTRADA').AsFloat             := dm_rc.sqlBuscas.FindField('VCENTRADA').AsFloat;
        memprodutos.FindField('GERMINACAOENTRADA').AsFloat     := dm_rc.sqlBuscas.FindField('GERMINACAOENTRADA').AsFloat;
        memprodutos.FindField('PUREZAENTRADA').AsFloat         := dm_rc.sqlBuscas.FindField('PUREZAENTRADA').AsFloat;

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

procedure TfrmNOTAENTRADA.carregalote(lote: string; produto: integer);
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
      end;
    end;
end;

procedure TfrmNOTAENTRADA.carregaprodutos(codigo: string);
var
  sql:string;
begin
  sql := ' select *                                         ' +
         ' from produtos P                                  ' +
         ' inner join saldos on (p.codigo = saldos.produto) ' +
         ' where P.codigo                                =  ' + QuotedStr(codigo) +
         ' and saldos.empresa                            =  ' + IntToStr(mm.varI_Code_Company);

  if not SqlPesquisa(sql) then
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não encontrei esse Produto' , 'warning' , false )
  else
    begin
      memprodutos.Edit;
      memprodutos.FindField('PRODUTO').AsInteger        := StrToInt(codigo);
      memprodutos.FindField('DESCRICAO').AsString       := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
      memprodutos.FindField('PRECO').AsFloat            := dm_rc.sqlBuscas.FindField('VENDA').AsFloat;
      memprodutos.FindField('UNIDADE').AsString         := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;

      memprodutos.FindField('SEMENTENOME').AsString     := dm_rc.sqlBuscas.FindField('SEMENTENOME').AsString;
      memprodutos.FindField('CULTIVAR').AsString        := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;

      memprodutos.FindField('NCM').AsString             := dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;
      memprodutos.FindField('NUMERONCM').AsString       := dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;
      memprodutos.FindField('UNIDADE').AsString         := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;

      memprodutos.FindField('ICM0').AsFloat             := dm_rc.sqlBuscas.FindField('ICMS0').AsFloat;
      memprodutos.FindField('ICM1').AsFloat             := dm_rc.sqlBuscas.FindField('ICMS1').AsFloat;
      memprodutos.FindField('ICM2').AsFloat             := dm_rc.sqlBuscas.FindField('ICMS2').AsFloat;

      memprodutos.FindField('BAS0').AsFloat             := dm_rc.sqlBuscas.FindField('BASE0').AsFloat;
      memprodutos.FindField('BAS1').AsFloat             := dm_rc.sqlBuscas.FindField('BASE1').AsFloat;
      memprodutos.FindField('BAS2').AsFloat             := dm_rc.sqlBuscas.FindField('BASE2').AsFloat;

      memprodutos.FindField('SITUACAOLOCAL').AsString   := dm_rc.sqlBuscas.FindField('SITUACAOLOCAL').AsString;
      memprodutos.FindField('SITUACAOOUTRAS').AsString  := dm_rc.sqlBuscas.FindField('SITUACAOOUTRAS').AsString;

      memprodutos.FindField('PIS').AsString             := dm_rc.sqlBuscas.FindField('PIS').AsString;
      memprodutos.FindField('COFINS').AsString          := dm_rc.sqlBuscas.FindField('COFINS').AsString;
      memprodutos.FindField('VLRPIS').AsFloat           := dm_rc.sqlBuscas.FindField('VLRPIS').AsFloat;
      memprodutos.FindField('VLRCOFINS').AsFloat        := dm_rc.sqlBuscas.FindField('VLRCOFINS').AsFloat;
    end;

end;

procedure TfrmNOTAENTRADA.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
  inherited;
   Linha  := TStringGrid(dbgSearchCRUD).Row;
   Coluna := dbgSearchCRUD.CurrCol;

  if Column.FieldName = 'opcoes' then
    begin
      UniPopupMenudetalhes.Popup(posicao_x-20,posicao_y, dbgSearchCRUD);
    end;
end;

procedure TfrmNOTAENTRADA.dbgSearchCRUDDblClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  inherited;
  pgBaseCadControl.ActivePage        := paBaseRegData1;
  UniPageControlcadastros.ActivePage := UniTabSheetCRUD;

  try
    sqlMaster.Close ;
    for i := 0 to  sqlMaster.Params.Count - 1 do
    begin
      Cmp                       :=  sqlMaster.Params[i].Name;
       sqlMaster.Params[i].Value :=  sqlSearchMaster.FieldbyName(Cmp).Value;
    end;
     sqlMaster.Open;

    carregadados();
  Except
     sqlMaster.Params[0].AsInteger := -1 ;
     sqlMaster.Open;
  End;
end;

procedure TfrmNOTAENTRADA.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmNOTAENTRADA.E1Click(Sender: TObject);
begin
  if (UniButtonDbEditcodigooperacaomestre.Text = '0') or (UniButtonDbEditcodigooperacaomestre.Text = '') then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'INFORMAR PRIMEIRO UMA OPERAÇÃO (CFOP)' , 'error' , false );
      UniButtonDbEditcodigooperacaomestre.SetFocus;
      Abort
    end;

  mm.varR_Value_BASEICMS          := 0;
  mm.varR_Value_VALORICMS         := 0;
  mm.varR_Value_VLRTOTAL          := 0;
  mm.varR_Value_VLRPRODUTOS       := 0;
  mm.varR_Value_Pessoa            := 0;
  mm.varR_value_NUMERONOTAENTRADA := '';
  mm.varR_value_EMISSAONOTAENTRADA:= '';
  mm.varR_value_CHAVEACESSOENTRADA:= '';
  MM.varTXTXML_ENTRADA            := sqlMaster.FindField('CHAVEACESSO').AsString;


  mm.VarC_Atelagenerica            := 'ENTRADAXML';
  frmTELAGENERICA.ShowModal();

  if mm.varCONFIRMATXTXMLENTRADA = True then
    begin
      memprodutos.DisableControls;
      memprodutos.AfterDelete  := nil;
      memprodutos.AfterPost    := nil;
      memprodutos.BeforePost   := nil;
      memprodutos.BeforeDelete := nil;
      memprodutos.Close;
      memprodutos.Open;

      dm_rc.memprodutos.First;
      while not dm_rc.memprodutos.eof do
        begin
          if dm_rc.memprodutos.FindField('PRODUTO').AsInteger > 0 then
            begin
              memprodutos.Append;
              memprodutos.CopyRecord(dm_rc.memprodutos);
              memprodutos.Post;
            end;
          dm_rc.memprodutos.Next;
        end;

      dm_rc.tbtitulos.First;
      while not dm_rc.tbtitulos.eof do
        begin

          tbtitulos.Append;
          tbtitulos.CopyRecord(dm_rc.tbtitulos);
          tbtitulos.Post;

          dm_rc.tbtitulos.Next;
        end;


      dm_rc.memprodutos.Close;
      dm_rc.tbtitulos.Close;

      sqlMaster.FindField('VLRBASEICMS').AsFloat   := mm.varR_Value_BASEICMS;
      sqlMaster.FindField('VLRICMS').AsFloat       := mm.varR_Value_VALORICMS;
      sqlMaster.FindField('VLRTOTAL').AsFloat      := mm.varR_Value_VLRTOTAL;
      sqlMaster.FindField('VLRPRODUTOS').AsFloat   := mm.varR_Value_VLRPRODUTOS;
      sqlMaster.FindField('PESSOA').AsInteger      := mm.varR_Value_Pessoa;
      sqlMaster.FindField('CONDICAO').AsInteger    := 9999;
      sqlMaster.FindField('CODIGOBARRAS').AsString := mm.varR_value_CHAVEACESSOENTRADA;
      sqlMaster.FindField('CHAVEACESSO').AsString  := MM.varTXTXML_ENTRADA;

      UniDBEditNUMERONOTA.Text                    := mm.varR_value_NUMERONOTAENTRADA;
      sqlMaster.FindField('EMISSAO').AsDateTime    := StrToDate(mm.varR_value_EMISSAONOTAENTRADA);
      UniDBEditchaveacesso.Text                   := mm.varR_value_CHAVEACESSOENTRADA;

      memprodutos.First;
      memprodutos.AfterDelete  := memprodutosAfterDelete;
      memprodutos.AfterPost    := memprodutosAfterPost;
      memprodutos.BeforeDelete := memprodutosBeforeDelete;
      memprodutos.BeforePost   := memprodutosBeforePost;
      memprodutos.EnableControls;
      memprodutos.First;

      UniButtonDbEditPESSOAS.OnExit(self);
      UniButtonDbEditcodigofuncionariomestre.OnExit(Self);
    end;
end;

procedure TfrmNOTAENTRADA.Exclui;
var
  codigotable : integer;
begin
  MemoGravaLog();
  codigotable := sqlMaster.FindField('CODIGO').AsInteger;

  TabelaOperacao('select financeiro from operacoes where codigo =  ' + IntToStr(sqlMaster.FindField('OPERACAO').AsInteger));
  executasql    ('delete  from mvmestre where codigo            =  ' + IntToStr(codigotable));

  Exclui_Movimento('MVITENS',sqlMaster.FindField('SERIE').AsString,MM.varI_Code_Company,varC_Documento_MvmestreNFE,sqlMaster.FindField('NUMERO').AsInteger);
  Exclui_Movimento('PONTOS' ,sqlMaster.FindField('SERIE').AsString,MM.varI_Code_Company,varC_Documento_MvmestreNFE,sqlMaster.FindField('NUMERO').AsInteger);
  Exclui_Movimento(variif(dm_rc.FDQryoperacoes.FindField('financeiro').AsInteger = 1,'RECEBER','PAGAR'),sqlMaster.FindField('SERIE').AsString,MM.varI_Code_Company,varC_Documento_MvmestreNFE,sqlMaster.FindField('NUMERO').AsInteger);


  try
    if  sqlSearchMaster.Active then
      sqlSearchMaster.Refresh;

   GravaLog(mm.varI_Code_Company,
            mm.varI_User,
            codigotable,
            mm.vUserName,
            'dsDelete',
            sqlMaster.UpdateOptions.UpdateTableName,
            '',
            UniMemolog.Text);

    LimpaVars;
    tbtitulos.Close;
    memprodutos.Close;
    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Excluido com SUCESSO!' , 'success' , false );
    pgBaseCadControl.ActivePage := tabSearch;
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui DELETAR, chame o SUPORTE!' , 'error' , false );
  end;
end;

procedure TfrmNOTAENTRADA.FDQryFiltroopcoesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmNOTAENTRADA.gravalotesementeorigem(const pacao:string);
begin
  if pacao = 'grava' then
    begin
      if (memprodutos.FindField('LOTESEMENTE').AsString <> '') and (memprodutos.FindField('LOTEENTRADA').AsString <> '') then
        begin
          if TabelaSementes(' select * from sementes where produto = ' + IntToStr(memprodutos.FindField('PRODUTO').AsInteger)   +
                            ' and lote                             = ' + QuotedStr(memprodutos.FindField('LOTESEMENTE').AsString)) then
          begin
            dm_rc.fdqrysementes.Edit;
            dm_rc.fdqrysementes.FindField('LOTEORIGEM').AsString       :=  memprodutos.FindField('LOTEENTRADA').AsString;
            dm_rc.fdqrysementes.FindField('PUREZAENTRADA').AsFloat     :=  memprodutos.FindField('PUREZAENTRADA').AsFloat;
            dm_rc.fdqrysementes.FindField('VCENTRADA').AsFloat         :=  memprodutos.FindField('VCENTRADA').AsFloat;
            dm_rc.fdqrysementes.FindField('GERMINACAOENTRADA').AsFloat :=  memprodutos.FindField('GERMINACAOENTRADA').AsFloat;

            dm_rc.fdqrysementes.FindField('NOTA').AsString             :=  sqlMaster.FindField('NUMERO').AsString;
            dm_rc.fdqrysementes.FindField('SERIE').AsString            :=  sqlMaster.FindField('SERIE').AsString;
            dm_rc.fdqrysementes.FindField('PESSOA').AsInteger          :=  sqlMaster.FindField('PESSOA').AsInteger;

            dm_rc.fdqrysementes.FindField('COOPERANTE').AsInteger      :=  sqlMaster.FindField('COOPERANTE').AsInteger;
            dm_rc.fdqrysementes.FindField('SAFRACAMPO').AsString       :=  sqlMaster.FindField('SAFRACAMPO').AsString;
            dm_rc.fdqrysementes.FindField('CAMPO').AsString            :=  sqlMaster.FindField('CAMPO').AsString;

            dm_rc.fdqrysementes.Post;
          end;
        end;
    end;

  if pacao = 'exclui' then
    begin
      if (memprodutos.FindField('LOTESEMENTE').AsString <> '') and (memprodutos.FindField('LOTEENTRADA').AsString <> '') then
        begin
          if TabelaSementes(' select * from sementes where produto = ' + IntToStr(memprodutos.FindField('PRODUTO').AsInteger)   +
                            ' and lote                             = ' + QuotedStr(memprodutos.FindField('LOTESEMENTE').AsString)) then
          begin
            dm_rc.fdqrysementes.Edit;
            dm_rc.fdqrysementes.FindField('LOTEORIGEM').AsString       :=  '';
            dm_rc.fdqrysementes.FindField('PUREZAENTRADA').AsFloat     :=  0;
            dm_rc.fdqrysementes.FindField('VCENTRADA').AsFloat         :=  0;
            dm_rc.fdqrysementes.FindField('GERMINACAOENTRADA').AsFloat :=  0;

            dm_rc.fdqrysementes.FindField('NOTA').AsString             :=  '';
            dm_rc.fdqrysementes.FindField('SERIE').AsString            :=  '';
            dm_rc.fdqrysementes.FindField('PESSOA').AsInteger          :=  0;
            dm_rc.fdqrysementes.Post;
          end;
        end;
    end;
end;

procedure TfrmNOTAENTRADA.gravamemoria;
begin
  if memprodutos.FindField('PRODUTO').AsInteger > 0 then
    begin
      memprodutos.Edit;

      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        if memprodutos.FindField('QUANTIDADE').AsFloat = 0 then
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque a QUANTIDADE!' , 'warning' , false );
            memprodutos.FindField('QUANTIDADE').FocusControl;
            Abort;
          end;

      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        if memprodutos.FindField('PRECO').AsFloat = 0 then
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque o PREÇO!' , 'warning' , false );
            memprodutos.FindField('PRECO').FocusControl;
            Abort;
          end;

      memprodutos.FindField('TOTAL').AsFloat  := memprodutos.FindField('PRECO').AsFloat *
                                                 memprodutos.FindField('QUANTIDADE').AsFloat;

      if memprodutos.FindField('LOTESEMENTE').AsString <> '' then
        begin
          memprodutos.FindField('TOTALPONTO').AsFloat := memprodutos.FindField('QUANTIDADE').AsFloat *
                                                         memprodutos.FindField('PUREZA').AsFloat;

        end;

      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        begin
          ValidaInfoProdutoMemoria(StrToInt(UniButtonDbEditcodigooperacaomestre.Text),
                                            memprodutos.FindField('PRODUTO').AsInteger,
                                            mm.varI_Code_Company);
        end;
    end;
end;

procedure TfrmNOTAENTRADA.GravaMovimento;
begin
  TabelaMvitens ('select * from mvitens where codigo            = 0');
  TabelaPontos  ('select * from pontos  where codigo            = 0');
  TabelaOperacao('select *          from operacoes where codigo =  ' + QuotedStr(sqlMaster.FindField('OPERACAO').AsString));
  TabelaTitulos ('select * from                                    ' + variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = varC_Documento_MvmestreNFE,'RECEBER','PAGAR') + ' where codigo = 0');

  Exclui_Movimento('MVITENS',sqlMaster.FindField('SERIE').AsString,MM.varI_Code_Company,varC_Documento_MvmestreNFE,sqlMaster.FindField('NUMERO').AsInteger);
  Exclui_Movimento('PONTOS' ,sqlMaster.FindField('SERIE').AsString,MM.varI_Code_Company,varC_Documento_MvmestreNFE,sqlMaster.FindField('NUMERO').AsInteger);
  Exclui_Movimento(variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR'),sqlMaster.FindField('SERIE').AsString,MM.varI_Code_Company,varC_Documento_MvmestreNFE,sqlMaster.FindField('NUMERO').AsInteger);


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
          dm_rc.tbmvitens.FindField('NUMERONCM').AsString       := memprodutos.FindField('NUMERONCM').AsString;
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
          dm_rc.tbmvitens.FindField('NUMERONCM').AsString       := memprodutos.FindField('NCM').AsString;
          dm_rc.tbmvitens.FindField('FRETE').AsFloat            := memprodutos.FindField('FRETE').AsFloat;
          dm_rc.tbmvitens.Findfield('SEGURO').AsFloat           := memprodutos.FindField('SEGURO').AsFloat;
          dm_rc.tbmvitens.Findfield('FRETE').AsFloat            := memprodutos.FindField('FRETE').AsFloat;

          dm_rc.tbmvitens.Findfield('PIS').AsString             := memprodutos.FindField('PIS').AsString;
          dm_rc.tbmvitens.Findfield('COFINS').AsString          := memprodutos.FindField('COFINS').AsString;
          dm_rc.tbmvitens.Findfield('VLRPIS').AsString          := memprodutos.FindField('VLRPIS').AsString;
          dm_rc.tbmvitens.Findfield('VLRCOFINS').AsString       := memprodutos.FindField('VLRCOFINS').AsString;
          dm_rc.tbmvitens.Findfield('TOTALPIS').AsString        := memprodutos.FindField('TOTALPIS').AsString;
          dm_rc.tbmvitens.Findfield('TOTALCOFINS').AsString     := memprodutos.FindField('TOTALCOFINS').AsString;

          dm_rc.tbmvitens.Findfield('PERCREDUCAO').AsFloat      := memprodutos.FindField('PERCREDUCAO').AsFloat;
          dm_rc.tbmvitens.Findfield('PESOBRUTO').AsFloat        := memprodutos.FindField('PESOBRUTO').AsFloat;
          dm_rc.tbmvitens.Findfield('PESOLIQUIDO').AsFloat      := memprodutos.FindField('PESOLIQUIDO').AsFloat;
          dm_rc.tbmvitens.FindField('PRODUTO').AsInteger        := memprodutos.FindField('PRODUTO').AsInteger;
          dm_rc.tbmvitens.FindField('DESCRICAO').AsString       := memprodutos.FindField('DESCRICAO').AsString;

          dm_rc.tbmvitens.FindField('PEDIDOOR').AsString        := memprodutos.FindField('PEDIDOOR').AsString;
          dm_rc.tbmvitens.FindField('PEDIDOITEMOR').AsString    := memprodutos.FindField('PEDIDOITEMOR').AsString;

          if memprodutos.FindField('FORNECEDORCODIGO').AsString <> '' then
            begin
              executasql('DELETE FROM FORNECEDOR_PRODUTO WHERE CODIGOSISTEMA =  ' + IntToStr(memprodutos.FindField('PRODUTO').AsInteger) +
                         'AND PESSOA                                         =  ' + QuotedStr(UniButtonDbEditPESSOAS.Text)               +
                         'AND CODIGOFORNECEDOR                               =  ' + QuotedStr(memprodutos.FindField('FORNECEDORCODIGO').AsString));

              TabelaFonecedor('SELECT * FROM FORNECEDOR_PRODUTO WHERE CODIGO = 0');

              dm_rc.fdqryfornecedorproduto.Append;
              dm_rc.fdqryfornecedorproduto.FindField('CODIGO').AsInteger           := Ultimo_Codigo('FORNECEDOR_PRODUTO','CODIGO',True);
              dm_rc.fdqryfornecedorproduto.FindField('KEY').AsString               := Gera_Guid;
              dm_rc.fdqryfornecedorproduto.FindField('PESSOA').AsInteger           := StrToInt(UniButtonDbEditPESSOAS.Text);
              dm_rc.fdqryfornecedorproduto.FindField('CODIGOSISTEMA').AsInteger    := memprodutos.FindField('PRODUTO').AsInteger;
              dm_rc.fdqryfornecedorproduto.FindField('CODIGOFORNECEDOR').asstring  := memprodutos.FindField('FORNECEDORCODIGO').AsString;
              dm_rc.fdqryfornecedorproduto.Post;
            end;



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
            end;

          if memprodutos.FindField('CAMPO').AsString <> '' then
            begin
              dm_rc.tbmvitens.Findfield('CAMPO').AsString        := memprodutos.FindField('CAMPO').AsString;
              dm_rc.tbmvitens.Findfield('SAFRACAMPO').AsString   := memprodutos.FindField('SAFRACAMPO').AsString;
              dm_rc.tbmvitens.Findfield('COOPERANTE').AsInteger  := memprodutos.FindField('COOPERANTE').AsInteger;
            end;

          dm_rc.tbmvitens.FindField('LOTEENTRADA').AsString        := memprodutos.FindField('LOTEENTRADA').AsString;
          dm_rc.tbmvitens.FindField('VCENTRADA').AsFloat           := memprodutos.FindField('VCENTRADA').AsFloat;
          dm_rc.tbmvitens.FindField('GERMINACAOENTRADA').AsFloat   := memprodutos.FindField('GERMINACAOENTRADA').AsFloat;
          dm_rc.tbmvitens.FindField('PUREZAENTRADA').AsFloat       := memprodutos.FindField('PUREZAENTRADA').AsFloat;

          dm_rc.tbmvitens.FindField('CANCELADA').AsString          := sqlMaster.FindField('CANCELADA').AsString;
          dm_rc.tbmvitens.FindField('KEY').AsString                := Gera_Guid();
          dm_rc.tbmvitens.FindField('CODIGO').AsInteger            := Ultimo_Codigo('MVITENS','CODIGO',False);

          dm_rc.tbmvitens.Post;

          //**********************************************************************//
          // GRAVA TABELA SEMENTES - LOTE ENTRADA
          //**********************************************************************//
          gravalotesementeorigem('grava');

          //**********************************************************************//
          // PONTOS
          //**********************************************************************//
          TabelaOperacao('select * from operacoes where codigo = ' + IntToStr(memprodutos.FindField('OPERACAO').AsInteger));

          DM_RC.fdqrypontos.Append;
          DM_RC.fdqrypontos.FindField('EMPRESA').AsInteger           := MM.varI_Code_Company;
          DM_RC.fdqrypontos.FindField('DOCUMENTO').AsInteger         := sqlMaster.FindField('DOCUMENTO').AsInteger;
          DM_RC.fdqrypontos.FindField('SAFRA').AsInteger             := 0;
          DM_RC.fdqrypontos.FindField('SEQUENCIA').AsInteger         := memprodutos.RecNo;
          DM_RC.fdqrypontos.FindField('NUMERO').AsInteger            := sqlMaster.FindField('NUMERO').AsInteger;
          DM_RC.fdqrypontos.FindField('SERIE').AsString              := sqlMaster.FindField('SERIE').AsString;
          DM_RC.fdqrypontos.FindField('UF').AsString                 := UniEditestado.Text;
          DM_RC.fdqrypontos.FindField('PESSOA').AsInteger            := sqlMaster.FindField('PESSOA').AsInteger;
          DM_RC.fdqrypontos.FindField('DATA').AsDateTime             := sqlMaster.FindField('EMISSAO').AsDateTime;

          DM_RC.fdqrypontos.FindField('OPERACAO').AsInteger          := memprodutos.FindField('OPERACAO').AsInteger;
          DM_RC.fdqrypontos.FindField('PRODUTO').AsInteger           := memprodutos.FindField('PRODUTO').AsInteger;
          DM_RC.fdqrypontos.FindField('DESCRICAO').AsString          := memprodutos.FindField('DESCRICAO').AsString;
          DM_RC.fdqrypontos.FindField('CANCELADA').AsString          := memprodutos.FindField('CANCELADA').AsString;

          DM_RC.fdqrypontos.FindField('CATEGORIA').AsString          := memprodutos.FindField('CATEGORIA').AsString;
          DM_RC.fdqrypontos.FindField('CAMPO').AsString              := memprodutos.FindField('CAMPO').AsString;
          DM_RC.fdqrypontos.FindField('SAFRACAMPO').AsString         := memprodutos.FindField('SAFRACAMPO').AsString;
          DM_RC.fdqrypontos.FindField('BOLETIM').AsString            := memprodutos.FindField('BOLETIMSEMENTE').AsString;
          DM_RC.fdqrypontos.FindField('TERMO').AsString              := memprodutos.FindField('TERMOSEMENTE').AsString;
          DM_RC.fdqrypontos.FindField('COOPERANTE').AsInteger        := memprodutos.FindField('COOPERANTE').AsInteger;
          DM_RC.fdqrypontos.FindField('GERMINACAO').AsFloat          := memprodutos.FindField('GERMINACAO').AsFloat;

          dm_rc.fdqrypontos.FindField('LOTEENTRADA').AsString        := memprodutos.FindField('LOTEENTRADA').AsString;
          dm_rc.fdqrypontos.FindField('VCENTRADA').AsFloat           := memprodutos.FindField('VCENTRADA').AsFloat;
          dm_rc.fdqrypontos.FindField('GERMINACAOENTRADA').AsFloat   := memprodutos.FindField('GERMINACAOENTRADA').AsFloat;
          dm_rc.fdqrypontos.FindField('PUREZAENTRADA').AsFloat       := memprodutos.FindField('PUREZAENTRADA').AsFloat;

          DM_RC.fdqrypontos.FindField('PESOSACO').AsFloat            := memprodutos.FindField('PESOSACO').AsFloat;
          DM_RC.fdqrypontos.FindField('VALORCULTURAL').AsFloat       := memprodutos.FindField('VALORCULTURAL').AsFloat;

          DM_RC.fdqrypontos.FindField('QUANTIDADE').AsFloat          := memprodutos.FindField('QUANTIDADE').AsFloat;
          DM_RC.fdqrypontos.FindField('PUREZA').AsFloat              := memprodutos.FindField('PUREZA').AsFloat;
          DM_RC.fdqrypontos.FindField('PONTOS').AsFloat              := memprodutos.FindField('QUANTIDADE').AsFloat * memprodutos.FindField('PUREZA').AsFloat;
          DM_RC.fdqrypontos.FindField('TIPO').AsString               := variif(dm_rc.FDQryoperacoes.FindField('ESTOQUE').AsString = '2', 'NULO', variif(dm_rc.FDQryoperacoes.FindField('ESTOQUE').AsString = '1', 'SAIDA', 'ENTRADA'));
          DM_RC.fdqrypontos.FindField('SAFRAVALIDA').AsString        := memprodutos.FindField('SAFRAVALIDA').AsString;
          DM_RC.fdqrypontos.Findfield('QTEPESO').AsFloat             := memprodutos.FindField('QUANTIDADE').AsFloat * memprodutos.FindField('PESOSACO').AsFloat;

          DM_RC.fdqrypontos.FindField('LOTESEMENTE').AsString        := memprodutos.FindField('LOTESEMENTE').AsString;
          DM_RC.fdqrypontos.FindField('CODIGO').AsInteger            := Ultimo_Codigo('PONTOS','CODIGO',False);
          DM_RC.fdqrypontos.FindField('KEY').AsString                := Gera_Guid();
          DM_RC.fdqrypontos.Post;
          //**********************************************************************//
          if memprodutos.FindField('LOTESEMENTE').AsString <> '' then
            begin
              Calcula_Lote(mm.varI_Code_Company,
                           memprodutos.FindField('PRODUTO').AsInteger,
                           memprodutos.FindField('LOTESEMENTE').AsString,
                           memprodutos.FindField('BOLETIMSEMENTE').AsString,
                           memprodutos.FindField('TERMOSEMENTE').AsString,
                           '');
            end;

          Saldo_Beneficiamento('GRAVA',sqlMaster.FindField('SERIE').AsString,
                                        sqlMaster.FindField('NUMERO').AsInteger,
                               DM_RC.fdqrypontos.FindField('PRODUTO').AsInteger,
                               DM_RC.fdqrypontos.FindField('SEQUENCIA').AsInteger,
                               mm.varI_Code_Company);
          //**********************************************************************//

        end;
      memprodutos.Next;
    end;
  memprodutos.First;
  memprodutos.EnableControls;

  TabelaOperacao('select * from operacoes where codigo =  ' + QuotedStr(sqlMaster.FindField('OPERACAO').AsString));
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

      dm_rc.fdqrytitulos.FindField('LOGINCLUSAO').AsString   := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
      dm_rc.fdqrytitulos.FindField('FINANCEIRO').AsInteger   := dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger;
      dm_rc.fdqrytitulos.FindField('FUNCIONARIO').AsInteger  := sqlMaster.FindField('FUNCIONARIO').AsInteger;
      dm_rc.fdqrytitulos.FindField('EMPRESA').AsInteger      := mm.varI_Code_Company;

      dm_rc.fdqrytitulos.FindField('APLICACAO').AsInteger    := 0;
      dm_rc.fdqrytitulos.FindField('PLANOCONTAS').AsInteger  := 0;
      dm_rc.fdqrytitulos.FindField('CARTEIRA').AsInteger     := 00001;
      dm_rc.fdqrytitulos.FindField('PORTADOR').AsInteger     := 9999;


      if dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1 then
        begin
          dm_rc.fdqrytitulos.FindField('PEDIDO').AsString      := sqlMaster.FindField('PEDIDO').AsString;
          dm_rc.fdqrytitulos.FindField('PERCCOMISSAO').AsFloat := sqlMaster.FindField('COMISSAOFUNCIONARIO').AsFloat;
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

  UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgEditing];
end;

procedure TfrmNOTAENTRADA.i1Click(Sender: TObject);
var
  M_ARQUIVOPDF:string;
begin
  if sqlSearchMaster.FindField('CHAVEACESSO').AsString <> '' then
    begin
      dm_rc.rc_ShowYesNo( 'POSSO FAZER A IMPRESSÃO DA NOTA DE ACORDO COM O XML FORNECIDO?' );
      if mm.varB_Yes then
        begin
          dm_rc.ACBrNFeDANFeRL.NomeDocumento    :=  M_ARQUIVOPDF;
          dm_rc.ACBrNFeDANFeRL.PathPDF          :=  mm.M_PATHIMPRESSAO;


          dm_rc.ACBrNFe.NotasFiscais.Clear;
          dm_rc.ACBrNFe.NotasFiscais.LoadFromString(sqlSearchMaster.FindField('CHAVEACESSO').AsString);
          M_ARQUIVOPDF                          := Copy(dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID,4,44)+'-nfe.pdf';
          dm_rc.ACBrNFe.NotasFiscais.ImprimirPDF;

          mm.varC_caminhopdf :=  M_ARQUIVOPDF;

          unfImpressao.ShowModal();
        end;
    end;
end;

procedure TfrmNOTAENTRADA.I2Click(Sender: TObject);
begin
  MainForm.HideMask;
  dm_rc.memprodutos.Close;
  dm_rc.memprodutos.CopyDataSet(memprodutos);

  mm.VarC_Atelagenerica            := 'CALCULAICMS';
  frmTELAGENERICA.ShowModal();

  memprodutos.DisableControls;
  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.BeforeDelete := nil;
  memprodutos.Close;
  memprodutos.Open;

  dm_rc.memprodutos.First;
  while not dm_rc.memprodutos.eof do
    begin
      if dm_rc.memprodutos.FindField('PRODUTO').AsInteger > 0 then
        begin
          memprodutos.Append;
          memprodutos.CopyRecord(dm_rc.memprodutos);
          memprodutos.Post;
        end;
      dm_rc.memprodutos.Next;
    end;

  dm_rc.memprodutos.Close;

  UniDBFormattedNumberEdit2.Value := mm.varR_Value_BASEICMS;
  UniDBFormattedNumberEdit3.Value := mm.varR_Value_VALORICMS;

  memprodutos.First;
  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;
  memprodutos.EnableControls;
  memprodutos.First;
end;

procedure TfrmNOTAENTRADA.LimpaVars;
begin
  UniEditdescricaooperacao.Text := '';
  UniEditdescricaocondicao.Text := '';
  UniEditnome.Text              := '';
  UniEditcidade.Text            := '';
  UniEditestado.Text            := '';
end;

procedure TfrmNOTAENTRADA.MemoGravaLog;
var
  i         : integer;
begin
  UniMemolog.Clear;
  SqlPesquisa('select * from mvmestre, pessoas where mvmestre.codigo = ' + IntToStr(sqlMaster.FindField('CODIGO').AsInteger) +
              ' and mvmestre.pessoa = pessoas.codigo');

  UniMemolog.Lines.Add(DataSetToJsonTXT(dm_rc.sqlBuscas));

  SqlPesquisa('select * from mvitens where mvitens.numero = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)   +
              ' and mvitens.documento                     = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger)+
              ' and mvitens.empresa                       = ' + IntToStr(mm.varI_Code_Company)                     +
              ' order by mvitens.sequencia');

  UniMemolog.Lines.Add(DataSetToJsonTXT(dm_rc.sqlBuscas));
end;

procedure TfrmNOTAENTRADA.memprodutosAfterDelete(DataSet: TDataSet);
begin
  Calcula_Totais();
end;

procedure TfrmNOTAENTRADA.memprodutosAfterPost(DataSet: TDataSet);
begin
  Calcula_Totais();
end;

procedure TfrmNOTAENTRADA.memprodutosBeforeDelete(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmNOTAENTRADA.memprodutosBeforePost(DataSet: TDataSet);
begin
  inherited;
  gravamemoria();
end;

procedure TfrmNOTAENTRADA.memprodutosbuscaentradaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    Text :=
    '<i title="Entrada de Lote" class="fa fa-lg fas fa-folder-open fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmNOTAENTRADA.memprodutosbuscaloteGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    Text :=
    '<i title="entrada" class="fa fa-lg fas fa-box-open fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmNOTAENTRADA.memprodutosbuscaprodutoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    Text :=
    '<i title="Lote de Saida" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmNOTAENTRADA.memprodutosexcluiGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';
end;

procedure TfrmNOTAENTRADA.memprodutosopcoesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text :=
  '<i title="Produtos" class="fas fa-asterisk" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmNOTAENTRADA.MenuOpcoes(pacao: Boolean);
begin
  I2.Enabled := pacao;
  E1.Enabled := pacao;
end;

procedure TfrmNOTAENTRADA.SetBut(Acao: TAcaoCrud);
var s:string ;
begin
  s := GetEnumName(TypeInfo(TAcaoCrud),integer(Acao));

  // Controle dos botoes
  if acao in [tpIncluir,tpAlterar,tpExcluir] then
     begin
       btnNewReg.Visible     := false;
       btnEditReg.Visible    := false;
       btnDeleteReg.Visible  := false;
       btnCalcReg.Visible    := True;
       btnCancelReg.Visible  := true;
       btnSaveReg.Visible    := True;
       btnOptions.Visible    := True;
     end
   else if acao in [tpListaVazia] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCalcReg.Visible    := False;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
        btnOptions.Visible    := False;
      end
   else if acao in [tpCalcular] then
     begin
        btnNewReg.Visible     := false;
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCalcReg.Visible    := True;
        btnCancelReg.Visible  := True;
        btnSaveReg.Visible    := True;
        btnOptions.Visible    := True;
     end
    else if acao in [tpListacomRegistros] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := true;
        btnDeleteReg.Visible  := true;
        btnCalcReg.Visible    := False;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
        btnOptions.Visible    := True;
       end;
end;

procedure TfrmNOTAENTRADA.UniButtonDbEditcodigofuncionariomestreButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('CONDICOES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('CONDICAO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmNOTAENTRADA.UniButtonDbEditcodigofuncionariomestreExit(
  Sender: TObject);
begin
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    UniEditdescricaocondicao.Text := Acha_Item('CONDICOES' ,IntToStr(sqlMaster.FindField('CONDICAO').AsInteger));
end;

procedure TfrmNOTAENTRADA.UniButtonDbEditcodigooperacaomestreButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('OPERACOES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('OPERACAO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmNOTAENTRADA.UniButtonDbEditcodigooperacaomestreExit(
  Sender: TObject);
begin
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
      TabelaOperacao('select * from operacoes where codigo = ' + IntToStr(sqlMaster.FindField('OPERACAO').AsInteger));
        UniEditdescricaooperacao.Text := dm_rc.FDQryoperacoes.FindField('DESCRICAO').AsString;
    end;
end;

procedure TfrmNOTAENTRADA.UniButtonDbEditPESSOASButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('PESSOA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmNOTAENTRADA.UniButtonDbEditPESSOASExit(Sender: TObject);
begin
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
      if SqlPesquisa('SELECT CODIGO, NOME, CIDADE, ESTADO FROM PESSOAS WHERE CODIGO = ' + IntToStr(sqlMaster.FindField('PESSOA').AsInteger)) then
        begin
          UniEditnome.Text        := dm_rc.sqlBuscas.FindField('NOME').AsString;
          UniEditcidade.Text      := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
          UniEditestado.Text      := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
        end;
    end;
end;

procedure TfrmNOTAENTRADA.UniDBFormattedNumberEditdescontosExit(
  Sender: TObject);
begin
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    Calcula_Totais;
end;

procedure TfrmNOTAENTRADA.UniDBFormattedNumberEditvlrdespesasExit(
  Sender: TObject);
begin
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    Calcula_Totais;
end;

procedure TfrmNOTAENTRADA.UniDBGridprodutosCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
   Linha  := TStringGrid(UniDBGridprodutos).Row;
   Coluna := UniDBGridprodutos.CurrCol;

  if sqlMaster.State in [dsInsert,dsEdit] then
    begin
      if Column.FieldName = 'opcoes' then
        begin
          dm_rc.memprodutos.Close;
          dm_rc.memprodutos.open;
          //********************************************//
          dm_rc.memprodutos.Append;
          dm_rc.memprodutos.CopyRecord(memprodutos);
          dm_rc.memprodutos.Post;
          //********************************************//
          frmDETALHESITENSNOTA.ShowModal();
          //********************************************//
          dm_rc.memprodutos.Edit;
          dm_rc.memprodutos.CopyRecord(memprodutos);
          dm_rc.memprodutos.Post;
          //********************************************//
        end;

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
          MM.varC_referencia_produto := IntToStr(memprodutos.FindField('PRODUTO').AsInteger);
          mm.varC_codigo_busca_lote  := memprodutos.FindField('LOTESEMENTE').AsString;
          mm.VarC_Atelagenerica      := 'CONTROLEPONTOS';
          frmTELAGENERICA.ShowModal();

          memprodutos.Edit;
          carregalote(MM.varC_codigo_busca_lote,memprodutos.FindField('PRODUTO').AsInteger);
          MM.varC_referencia_produto := '';
        end;

      if Column.FieldName = 'buscaentrada' then
        begin
          MM.varS_LOTENOTAENTRADA        := memprodutos.FindField('LOTEENTRADA').AsString;
          MM.varS_VCNOTAENTRADA          := memprodutos.FindField('VCENTRADA').AsFloat;
          MM.varS_GERMINACAONOTAENTRADA  := memprodutos.FindField('GERMINACAOENTRADA').AsFloat;
          MM.varS_PUREZANOTAENTRADA      := memprodutos.FindField('PUREZAENTRADA').AsFloat;

          mm.varC_COOPERANTE             := memprodutos.FindField('COOPERANTE').AsInteger;
          mm.varC_CAMPO                  := memprodutos.FindField('CAMPO').AsString;
          mm.varC_SAFRACAMPO             := memprodutos.FindField('SAFRACAMPO').AsString;

          mm.VarC_Atelagenerica      := 'LOTENOTAENTRADA';
          frmTELAGENERICA.ShowModal();

          memprodutos.Edit;
          memprodutos.FindField('LOTEENTRADA').AsString      := mm.varS_LOTENOTAENTRADA;
          memprodutos.FindField('VCENTRADA').AsFloat         := mm.varS_VCNOTAENTRADA;
          memprodutos.FindField('GERMINACAOENTRADA').AsFloat := mm.varS_GERMINACAONOTAENTRADA;
          memprodutos.FindField('PUREZAENTRADA').AsFloat     := mm.varS_PUREZANOTAENTRADA;
          memprodutos.FindField('COOPERANTE').AsInteger      := mm.varC_COOPERANTE;
          memprodutos.FindField('CAMPO').AsString            := mm.varC_CAMPO;
          memprodutos.FindField('SAFRACAMPO').AsString       := mm.varC_SAFRACAMPO;

          MM.varS_LOTENOTAENTRADA        := '';
          MM.varS_VCNOTAENTRADA          := 0;
          MM.varS_GERMINACAONOTAENTRADA  := 0;
          MM.varS_PUREZANOTAENTRADA      := 0;

          mm.varC_COOPERANTE             := 0;
          mm.varC_CAMPO                  := '';
          mm.varC_SAFRACAMPO             := '';
        end;
    end;
end;

procedure TfrmNOTAENTRADA.UniFrameCreate(Sender: TObject);
begin
  inherited;
  labTitleForm.Caption               := 'NOTA DE ENTRADA';
  varC_Documento_MvmestreNFE         := 2;
  edSearchCRUDDtIni.Text             := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text             := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
  cbxSearchCRUDFieldordem.ItemIndex  := 1;
  cbxSearchCRUDFieldstatus.ItemIndex := 2;
  ativabusca();
  MenuOpcoes(False);
  btnSearchCRUD.OnClick(Self);
end;
procedure TfrmNOTAENTRADA.ValidaInfoProdutoMemoria(foperacao: real; fproduto,
  fempresa: integer);
begin
  TabelaOperacao('SELECT SUBSTITUICAO,CODIGO,UNICA FROM OPERACOES WHERE CODIGO  = ' + QuotedStr(FloatToStr(foperacao)));
  TabelaEmpresas('SELECT * FROM EMPRESAS WHERE CODIGO                          = ' + IntToStr(fempresa));
  SqlProdutos   ('SELECT SITUACAOLOCAL,SITUACAOOUTRAS FROM SALDOS WHERE PRODUTO = ' + IntToStr(fproduto)+
                'AND EMPRESA                                                    = ' + IntToStr(fempresa));

  if UniEditestado.Text = dm_rc.tbempresas.FindField('UF').AsString then
   begin
     memprodutos.FindField('CST').AsString := dm_rc.tbprodutos.findfield('SITUACAOLOCAL').AsString;
     if memprodutos.FindField('CST').AsString = '060' then
       begin
         if  dm_rc.FDQryoperacoes.FindField('UNICA').AsFloat = 0 then
           begin
             if dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsInteger > 0 THEN
               memprodutos.FindField('OPERACAO').AsFloat  := dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsFloat
             else
               memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
           end
         else
           memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
       end
     else
       memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
   end
  else
   begin
     memprodutos.FindField('CST').AsString := dm_rc.tbprodutos.findfield('SITUACAOOUTRAS').AsString;
     if memprodutos.FindField('CST').AsString = '060' then
       begin
         if  dm_rc.FDQryoperacoes.FindField('UNICA').AsInteger = 0 then
           begin
             if dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsInteger > 0 THEN
               memprodutos.FindField('OPERACAO').AsFloat  := dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsFloat
             else
               memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
           end
         else
           memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
       end
     else
       memprodutos.FindField('OPERACAO').AsFloat  := foperacao;

     if UniButtonDbEditcodigooperacaomestre.Text = '7102' then
       begin
         memprodutos.FindField('CST').AsString := '041';
         if  dm_rc.FDQryoperacoes.FindField('UNICA').AsInteger = 0 then
           begin
             if dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsInteger > 0 THEN
               memprodutos.FindField('OPERACAO').AsFloat  := dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsFloat
             else
               memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
           end
         else
           memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
       end;
   end;
end;

initialization
  RegisterClass(TfrmNOTAENTRADA);
end.
