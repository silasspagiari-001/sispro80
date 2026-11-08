unit untCadPRODUTOS; // 8.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIApplication, uniGUIClasses, uniGUIFrame, untfrmBaseCRUD, Data.DB, uniBasicGrid, uniDBGrid,
  uniPanel, uniPageControl, uniGUIBaseClasses, uniScrollBox, uniDBEdit,
  uniMultiItem, uniComboBox, uniEdit, uniLabel, uniButton, uniBitBtn,
  uniDateTimePicker, uniDBDateTimePicker, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniCheckBox, uniFieldSet,
  uniDBComboBox, uniDBLookupComboBox, uniSpeedButton, uniDBCheckBox,
  uniMainMenu, uniHTMLFrame, Data.FMTBcd, Data.SqlExpr, uniSpinEdit, uniMemo,
  Vcl.Menus, uniSweetAlert, uniDBNavigator,untFrmCRUDproprio;

type
  TfrmCadPRODUTOS = class(TfrmCRUDproprio)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    tabFiscal: TUniTabSheet;
    tabBeneficios: TUniTabSheet;

    sboxGridBlockTab1: TUniScrollBox;

    // Painel de Busca Customizada
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel53: TUniLabel;
    edSearchCODIGO: TUniEdit;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel54: TUniLabel;
    edSearchDESCRICAO: TUniEdit;
    UniContainerPanel5: TUniContainerPanel;
    UniLabel55: TUniLabel;
    edSearchCULTIVAR: TUniEdit;
    UniContainerPanel6: TUniContainerPanel;
    UniLabel56: TUniLabel;
    edSearchUNIDADE: TUniComboBox;

    // Menu Popup
    UniPopupMenudetalhesproduto: TUniPopupMenu;
    UniMenuItem1: TUniMenuItem;
    rcBlock2: TUniContainerPanel;
    rcBlock3: TUniContainerPanel;
    labRcCollapseGeneral: TUniLabel;
    UniLabel8: TUniLabel;
    rcBlock10: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    rcBlock20: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    rcBlock40: TUniContainerPanel;
    edLkpGRUPOS: TUniDBEdit;
    UniLabel6: TUniLabel;
    rcBlock80: TUniContainerPanel;
    edLkpCULTIVAR: TUniDBEdit;
    UniLabel10: TUniLabel;
    rcBlock60: TUniContainerPanel;
    UniLabel2: TUniLabel;
    edLkpESPECIE: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    UniDBEdit16: TUniDBEdit;
    UniLabel4: TUniLabel;
    rcBlock30: TUniContainerPanel;
    edLkpMEDIDAS: TUniDBEdit;
    UniLabel7: TUniLabel;
    rcBlock562: TUniContainerPanel;
    rcBlock563: TUniContainerPanel;
    UniLabel11: TUniLabel;
    UniLabel40: TUniLabel;
    rcBlock590: TUniContainerPanel;
    UniLabel45: TUniLabel;
    edLkpCBNEF__LC: TUniDBEdit;
    rcBlock595: TUniContainerPanel;
    UniLabel5: TUniLabel;
    edLkpCBNEF__01: TUniDBEdit;
    rcBlock600: TUniContainerPanel;
    UniLabel9: TUniLabel;
    edLkpCBNEF__02: TUniDBEdit;
    rcBlock605: TUniContainerPanel;
    UniLabel12: TUniLabel;
    edLkpCBNEF__90: TUniDBEdit;
    rcBlock610: TUniContainerPanel;
    UniLabel32: TUniLabel;
    edLkpCBNEF__EX: TUniDBEdit;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroDESCRICAO: TStringField;
    FDQryFiltroCULTIVAR: TStringField;
    FDQryFiltroUNIDADE: TStringField;
    rcBlock107: TUniContainerPanel;
    rcBlock108: TUniContainerPanel;
    labRcCollapse01: TUniLabel;
    UniLabel35: TUniLabel;
    rcBlock132: TUniContainerPanel;
    rcBlock133: TUniContainerPanel;
    labCollapseDefaultAddr: TUniLabel;
    UniLabel37: TUniLabel;
    rcBlock110: TUniContainerPanel;
    UniDBEdit4: TUniDBEdit;
    UniLabel13: TUniLabel;
    rcBlock120: TUniContainerPanel;
    UniDBFormattedNumberEditPERCIPI: TUniDBFormattedNumberEdit;
    UniLabel14: TUniLabel;
    rcBlock130: TUniContainerPanel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel15: TUniLabel;
    rcBlock140: TUniContainerPanel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel16: TUniLabel;
    rcBlock160: TUniContainerPanel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel17: TUniLabel;
    rcBlock170: TUniContainerPanel;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel19: TUniLabel;
    rcBlock180: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniDBComboBox3: TUniDBComboBox;
    rcBlock185: TUniContainerPanel;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniLabel24: TUniLabel;
    rcBlock190: TUniContainerPanel;
    UniDBComboBox4: TUniDBComboBox;
    UniLabel21: TUniLabel;
    rcBlock195: TUniContainerPanel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    UniLabel25: TUniLabel;
    rcBlock200: TUniContainerPanel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel22: TUniLabel;
    rcBlock210: TUniContainerPanel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniLabel23: TUniLabel;
    rcBlock220: TUniContainerPanel;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    UniLabel26: TUniLabel;
    rcBlock230: TUniContainerPanel;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniLabel27: TUniLabel;
    rcBlock240: TUniContainerPanel;
    UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit;
    UniLabel28: TUniLabel;
    rcBlock250: TUniContainerPanel;
    UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit;
    UniLabel29: TUniLabel;
    rcBlock300: TUniContainerPanel;
    UniDBEdit5: TUniDBEdit;
    UniLabel30: TUniLabel;
    rcBlock310: TUniContainerPanel;
    UniDBComboBox5: TUniDBComboBox;
    UniLabel31: TUniLabel;
    rcBlock320: TUniContainerPanel;
    UniDBComboBox6: TUniDBComboBox;
    UniLabel33: TUniLabel;

    procedure UniFrameCreate(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnSearchCRUDCustomClick(Sender: TObject);

    procedure UniMenuItem1Click(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure sqlMasterAfterOpen(DataSet: TDataSet);
    procedure edLkpCBNEF__LCExit(Sender: TObject);
    procedure edLkpCBNEF__LCEnter(Sender: TObject);
    procedure edLkpCBNEF__01Enter(Sender: TObject);
    procedure edLkpCBNEF__02Enter(Sender: TObject);
    procedure edLkpCBNEF__90Enter(Sender: TObject);
    procedure edLkpCBNEF__EXEnter(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, Main, //untDM_LOOKUPs,
  untFrmMessage, untCadCLIENTES_REVISOES, untCadCLIENTES_VEICULOS, uconsts, uconsts_cfg,
  mkm_func_web, mkm_layout, mkm_restfuncs, mkm_crudfuncs; //7.3.0.0

procedure TfrmCadPRODUTOS.UniFrameCreate(Sender: TObject);
begin
  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:0(btns-cls:colorful)|'+
                        'grid-paginator:center|' +
                        ']]';

  // Carrega o combo de medidas

  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'DESCRICAO' , 'DESCRICAO' );  //7.3.0.0


  inherited;
end;

procedure TfrmCadPRODUTOS.btnEditRegClick(Sender: TObject);
begin
  inherited;
  FDQryCaddetails.Edit;
end;

procedure TfrmCadPRODUTOS.btnNewRegClick(Sender: TObject);
begin
  inherited;
  // valores default para novo produto
//  sqlMaster.FieldByName('PERCIPI').AsFloat := 0;
  //sqlMaster.FieldByName('UNIDADE').AsString := 'UN';
end;


procedure TfrmCadPRODUTOS.edLkpCBNEF__01Enter(Sender: TObject);
begin
  inherited;
  begin
    FDQryCaddetails.FindField('BENEFICIOLC').AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'CODCBNEF' )  ;
  end;

end;

procedure TfrmCadPRODUTOS.edLkpCBNEF__02Enter(Sender: TObject);
begin
  inherited;
  begin
    FDQryCaddetails.FindField('BENEFICIO02').AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'CODCBNEF' )  ;
  end;

end;

procedure TfrmCadPRODUTOS.edLkpCBNEF__90Enter(Sender: TObject);
begin
  inherited;
  begin
    FDQryCaddetails.FindField('BENEFICIO90').AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'CODCBNEF' )  ;
  end;

end;

procedure TfrmCadPRODUTOS.edLkpCBNEF__EXEnter(Sender: TObject);
begin
  inherited;
  begin
    FDQryCaddetails.FindField('BENEFICIOEX').AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'CODCBNEF' )  ;
  end;

end;

procedure TfrmCadPRODUTOS.edLkpCBNEF__LCEnter(Sender: TObject);
begin
  inherited;

  if ( sqlMaster.State in [ dsEdit, dsInsert ] ) then
  begin
    FDQryCaddetails.FindField('BENEFICIO01').AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'CODCBNEF' )  ;
  end;

end;

procedure TfrmCadPRODUTOS.edLkpCBNEF__LCExit(Sender: TObject);
begin

end;

// ============================================================
// LOOKUPS DINÂMICOS (Padrão 8.0 com lkpfilter no Hint)
// ============================================================

procedure TfrmCadPRODUTOS.sqlMasterAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FDQryCaddetails.close;
  FDQryCaddetails.Params[0].AsInteger := sqlMaster.FindField('CODIGO').AsInteger;
  FDQryCaddetails.Params[1].AsInteger := MM.varI_Code_Company;
  dm_rc.rc_OpenQuery( FDQryCaddetails );

end;

// ============================================================
// BUSCA CUSTOMIZADA (Padrão 8.0)
// ============================================================

procedure TfrmCadPRODUTOS.btnSearchCRUDCustomClick(Sender: TObject);
var
  cAndOr, cFilters : string;
begin
  cFilters := '';
  cAndOr   := rc_GetHintAttr( '_swt_txt:' , labAndOrSearch.Hint );

  // codigo (int)
  if StrToIntDef( trim( edSearchCODIGO.Text ), 0 ) > 0 then
     cFilters := cFilters + varIIF( cFilters <> '', cAndOr, '' ) +
                 ' ( tab.codigo = ' + edSearchCODIGO.Text + ' )';

  // descricao (str)
  if trim( edSearchDESCRICAO.Text ) <> '' then
     cFilters := cFilters + varIIF( cFilters <> '', cAndOr, '' ) +
                 ' ( tab.descricao like ' + QuotedStr( '%' + edSearchDESCRICAO.Text + '%' ) + ' )';

  // cultivar (str)
  if trim( edSearchCULTIVAR.Text ) <> '' then
     cFilters := cFilters + varIIF( cFilters <> '', cAndOr, '' ) +
                 ' ( tab.cultivar like ' + QuotedStr( '%' + edSearchCULTIVAR.Text + '%' ) + ' )';

  // unidade (combobox)
  if trim( edSearchUNIDADE.Text ) <> '' then
     cFilters := cFilters + varIIF( cFilters <> '', cAndOr, '' ) +
                 ' ( tab.unidade = ' + QuotedStr( edSearchUNIDADE.Text ) + ' )';

  rc_SearchFilterExecute( self, cFilters );
  inherited;
end;

procedure TfrmCadPRODUTOS.UniMenuItem1Click(Sender: TObject);
begin
  inherited;
  mm.varC_referencia_produto := sqlSearchMaster.FieldByName('CODIGO').AsString;
  mm.VarC_Atelagenerica      := 'KARDEXPRODUTO';
//  frmTELAGENERICA.ShowModal();
end;

initialization
  RegisterClass(TfrmCadPRODUTOS);
end.