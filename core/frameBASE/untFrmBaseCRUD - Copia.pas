//8.0.0.0
//added "rc-border-right-off" on filter fields
unit untFrmBaseCRUD;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  System.StrUtils, Maskutils, str_func,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, untFrmBase, uniGUIBaseClasses, uniScrollBox,
  uniPanel, uniPageControl, uniBasicGrid, uniDBGrid, uniEdit, uniDBEdit, UniSpeedButton, uniGUIForm,
  uniLabel, Data.DB, uniButton, uniBitBtn, uniMultiItem, uniComboBox,
  TypInfo, uniDBLookUpComboBox, uniDBComboBox, uniDBCheckBox, uniDBRadioGroup, uniDBMemo, uniDBImage, uniDBText,  uniListBox,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniDateTimePicker, uniDBDateTimePicker, uniCheckBox, uniMenuButton, Vcl.Menus, uniMainMenu,
  uniHTMLFrame, uniSweetAlert, DateUtils;//7.5.0.3 grid

type
  TfrmBaseCRUD = class(TfrmBase)
    dsMaster: TDataSource;
    dsSearchMaster: TDataSource;
    sqlSearchMaster: TFDQuery;
    sqlMaster: TFDQuery;
    popMenuOptions: TUniPopupMenu;
    ExportarpraEXCEL1: TUniMenuItem;
    N1: TUniMenuItem;
    paBaseTopTitle: TUniContainerPanel;
    labTitleForm: TUniLabel;
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
    FDSchemaAdapter1: TFDSchemaAdapter;
    labExit: TUniLabel;
    labNew: TUniLabel;
    labCancel: TUniLabel;
    labSave: TUniLabel;
    labState: TUniLabel;
    edQuickSearch: TUniEdit;
    ed_Table_ItemSel: TUniEdit;
    ed_FormOrigin: TUniEdit;
    ed_FormOrigin_Tab: TUniEdit;
    ed_Table_Status: TUniEdit;
    ed_Order_Search: TUniEdit;
    ed_Where_Search: TUniEdit;
    ed_CodMaster: TUniEdit;
    ed_PK: TUniEdit;
    ed_FieldMasks: TUniEdit;
    ed_OldPKValue: TUniEdit;
    ed_Table_Status_OLD: TUniEdit;
    ed_AskNewRec_AfterPost: TUniEdit;
    ed_GenNextID_OnNew: TUniEdit;
    ed_PKS: TUniEdit;
    ed_OLDPKS: TUniEdit;
    ed_Table_Deleted_Field: TUniEdit;
    ed_GroupBy_Search: TUniEdit;
    ed_Having_Search: TUniEdit;
    Excel1: TUniMenuItem;
    Excel2: TUniMenuItem;
    Xml1: TUniMenuItem;
    dbgExport: TUniDBGrid;
    Csv1: TUniMenuItem;
    labOptions: TUniLabel;
    labEdit: TUniLabel;
    labDelete: TUniLabel;
    btnQuickSearch: TUniBitBtn;
    paBaseCadControl: TUniContainerPanel;
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    tabRegister: TUniTabSheet;
    paBaseRegData1: TUniContainerPanel;
    hpForActionBtns: TUniHiddenPanel;
    ed_NoGenID: TUniEdit;
    ed_PK_ZerosLeft: TUniEdit;
    ed_HideMaskOff: TUniEdit;
    paBaseRegSearch: TUniContainerPanel;
    paGridOffset: TUniContainerPanel;
    dbgSearchCRUD: TUniDBGrid;
    paNotFound_dbgSearchCRUD: TUniContainerPanel;
    imgNoRecords_dbgSearchCRUD: TUniLabel;
    labNotFound_dbgSearchCRUD: TUniLabel;
    edSearchFilter: TUniEdit;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    paSearchFilterDate: TUniContainerPanel;
    UniLabelFd1: TUniLabel;
    cbxSearchCRUDFieldDate: TUniComboBox;
    cbxSearchCRUDFieldDate_Fields: TUniComboBox;
    paSearchFilter1: TUniContainerPanel;
    paSearchOp1: TUniContainerPanel;
    UniLabelp1: TUniLabel;
    cbxSearchCRUDOpt1: TUniComboBox;
    paSearchField1: TUniContainerPanel;
    cbxSearchCRUDField1: TUniComboBox;
    cbxSearchCRUDField1_Fields: TUniComboBox;
    UniLabelc1: TUniLabel;
    paSearchContent1: TUniContainerPanel;
    UniLabelv1: TUniLabel;
    edSearchCRUD1: TUniEdit;
    paSearchFilter2: TUniContainerPanel;
    paSearchField2: TUniContainerPanel;
    UniLabelc2: TUniLabel;
    cbxSearchCRUDField2: TUniComboBox;
    cbxSearchCRUDField2_Fields: TUniComboBox;
    paSearchOp2: TUniContainerPanel;
    UniLabelp2: TUniLabel;
    cbxSearchCRUDOpt2: TUniComboBox;
    paSearchContent2: TUniContainerPanel;
    UniLabelv2: TUniLabel;
    edSearchCRUD2: TUniEdit;
    paSearchFilterAndOr: TUniContainerPanel;
    paSearchFilterDescendent: TUniContainerPanel;
    cbxAndOr: TUniCheckBox;
    labTitleSearch: TUniLabel;
    paSearchFilterPeriod: TUniContainerPanel;
    UniLabelPd1: TUniLabel;
    cbxSearchCRUDPeriod: TUniComboBox;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    paSearchFiltersCustom: TUniPanel;
    sboxSearchFiltersCustom: TUniScrollBox;
    labTitleSearchCustom: TUniLabel;
    paSearchBtnCustom: TUniContainerPanel;
    btnSearchCRUDCustom: TUniBitBtn;
    labAndOrSearch: TUniLabel;
    labSwtAndOr: TUniLabel;
    btnSearchCRUDCustomClear: TUniBitBtn;
    hpMaster: TUniHiddenPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
    procedure dsMasterStateChange(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure cbxSearchCRUDField1Change(Sender: TObject);
    procedure cbxSearchCRUDField2Change(Sender: TObject);
    procedure cbxSearchCRUDFieldDateChange(Sender: TObject);
    procedure cbxSearchCRUDPeriodChange(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure btnCloseFormClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure cbxAndOrChange(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure cbxSearchCRUDPagedClick(Sender: TObject);
    procedure sqlMasterBeforeDelete(DataSet: TDataSet);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnSearchMoreFiltersClick(Sender: TObject);
    procedure sqlSearchMasterBeforeDelete(DataSet: TDataSet);
    procedure dbgSearchCRUDColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnSearchClick(Sender: TObject);
    procedure btnQuickSearchClick(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure Excel2Click(Sender: TObject);
    procedure Xml1Click(Sender: TObject);
    procedure Csv1Click(Sender: TObject);
    procedure FDSchemaAdapter1AfterApplyUpdate(Sender: TObject);
    procedure labOptionsClick(Sender: TObject);
    procedure pgBaseCadControlChangeValue(Sender: TObject);
    procedure dsMasterDataChange(Sender: TObject; Field: TField);
    procedure dsSearchMasterStateChange(Sender: TObject);
    procedure sqlMasterError(ASender, AInitiator: TObject; var AException: Exception);
    procedure sqlSearchMasterError(ASender, AInitiator: TObject; var AException: Exception);
    procedure sqlMasterBeforePost(DataSet: TDataSet);
    procedure labSwtAndOrClick(Sender: TObject);
    procedure btnSearchCRUDCustomClick(Sender: TObject);
    procedure btnSearchCRUDCustomClearClick(Sender: TObject);
    procedure dbgSearchCRUDColumnFilter(Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant);

  private
    { Private declarations }
    bmBookMark : TBookmark; // 6.0.0.0
    vt1, vt2 : Cardinal;
    vTime   : Extended;
    mX, mY,
    iFirstShow : integer;
    bNoGenID, // 6.0.0.0
    bSaveMasterPK,
    bActions,
    bModelSearchCustom, //7.3.0.0 search custom
    bModelSearchColumn, //7.5.0.3 search custom
    bModelCrud0, //
    bModelCrud1,
    bModelCrud2,
    bModelCrud3,
    bModelCrud4, // 6.0.0.0 ( basic and advance search )
    bSearchComplete,
    bPaged     : boolean;
    cFilters,
    cTemp, cTemp2: String;
    iCurrentPage,iCurrentRec : integer;

    // translate messages
    cLAB_TitleSearch_CAPTION,
    cLAB_C1_CAPTION,
    cLAB_C2_CAPTION,
    cLAB_P1_CAPTION,
    cLAB_P2_CAPTION,
    cLAB_V1_CAPTION,
    cLAB_V2_CAPTION,
    cBTN_SEARCH_CAPTION,
    cBTN_NEW_CAPTION,
    cBTN_EDIT_CAPTION,
    cBTN_DEL_CAPTION,
    cBTN_SAVE_CAPTION,
    cBTN_CANCEL_CAPTION,
    cBTN_OPTIONS_CAPTION : string;
    //8.4.0.0 Thanks Mr. Fabio Oliveira( PKCOMPOSTA )
    vAllPKs, vPkFields, cOldPK : String;
    aOldPKFields : Array[1..4] of String;
    aOldPKValues : Array[1..4] of Variant;
    aOldPKDataTypes : Array[1..4] of TFieldType;
  public
    { Public declarations }
    procedure rc_CloseQuerys;
    procedure rc_DeleteFKs;
    procedure rc_DefaultTitleForm;
    procedure rc_UpdateLayout;
    procedure btnSearchClose;
    procedure rc_RemoveFirstShowZero; // 6.0.0.0
    //7.3.0.0 search custom
    procedure SearchCRUD( sender : TObject );
    procedure SearchCRUDCustom( sender : TObject );
    //7.5.0.0
    procedure SearchPanelClose;
  end;

implementation

{$R *.dfm}

uses Main, MainModule,

  uconsts, uconsts_cfg,
  mkm_func_web, ServerModule, untdm_rc, untFrmLookUp_Lite,
  mkm_layout, mkm_validate, mkm_translate, mkm_dbfuncs, mkm_dbcombobox, mkm_anim, untModalFrameForm;

//7.5.0.0
procedure TfrmBaseCRUD.SearchPanelClose;
begin
  if ( paSearchFilters.tag = -1 ) then
  begin
     paSearchFilters.tag := 0;
     rc_Anim( paSearchFilters, 'left', '-' + paSearchFilters.Width.ToString, '0.4', gsEaseBack, '0.4', gsEaseTypeOut );
  end;
end;
  // 6.0.0.0
procedure TfrmBaseCRUD.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  dm_rc.rc_DummyDelay; // 6.0.0.1
  btnSearchClose;
  dm_rc.rc_ActionBtnCellClick( self, Column.FieldName );
end;
//8.0.0.0 grid
procedure TfrmBaseCRUD.dbgSearchCRUDColumnFilter(Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant);
begin
  inherited;
  rc_GridColumnFilter( self, Sender, Column, Value ); //8.0.0.0 grid
end;

procedure TfrmBaseCRUD.dbgSearchCRUDColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  inherited;
  dm_rc.rc_GridSortColumn( TUniDBGrid( Column.Grid ), Column.FieldName, Direction );
end;

procedure TfrmBaseCRUD.dbgSearchCRUDDblClick(Sender: TObject);
begin
  inherited;
  SearchPanelClose; //8.0.0.0
  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';

  if not dsSearchMaster.DataSet.IsEmpty then
  begin
     //7.0.0.0
     //[PT] Com ajuda do Sr. Gilberto Loss, encontrei conflitos no uso do bookmark e usando "recno" tudo funcionou como deveria
     //[EN] With the help of Mr. Gilberto Loss, I found conflicts in the use of the bookmark and using "recno" everything worked as it should
     //bmBookMark := dbgSearchCRUD.DataSource.DataSet.GetBookmark;
     iCurrentRec := dbgSearchCRUD.DataSource.DataSet.RecNo;

     pgBaseCadControl.ActivePage := tabRegister;

     if Self.FindComponent('pgComplementData' ) <> nil then
        if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
           TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

     sqlMaster.Cancel;
     sqlMaster.close;
     //8.4.0.0 Thanks Mr. Fabio Oliveira( PKCOMPOSTA )
     if StrTokenCount( vPkFields, ';' ) > 1 then
     begin
        rc_SetPKParams( sqlMaster, sqlSearchMaster, vPkFields );
     end
     else
     begin
        if DataTypeIsNumber( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.ParamByName( 'table_pk' ).AsInteger  := StrToIntDef( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString , 0 )
        else
        if DataTypeIsString( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.ParamByName( 'table_pk' ).AsString   := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString
        else
        if DataTypeIsDateTime( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.ParamByName( 'table_pk' ).AsDateTime := rc_RemoveMiliseconds( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsDateTime ); // 6.0.0.0
     end;
     //vPkFields := dm_rc.rc_GetPrimaryKey( lowercase( Self.ed_Table_ItemSel.Text ), true );
//     if DataTypeIsNumber( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
//        sqlMaster.ParamByName( 'table_pk' ).AsInteger  := StrToIntDef( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString , 0 )
//     else
//     if DataTypeIsString( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
//        sqlMaster.ParamByName( 'table_pk' ).AsString   := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString
//     else
//     if DataTypeIsDateTime( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
//        sqlMaster.ParamByName( 'table_pk' ).AsDateTime := rc_RemoveMiliseconds( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsDateTime ); // 6.0.0.0

     dm_rc.rc_OpenQuery( sqlMaster );
     // 6.0.0.0
     // atualizar todos os LOOKUPs dinamicamente | update all LOOKUPs dynamically
     dm_rc.rc_LookUpUpdateData(  self , nil, false );
  end;
end;

procedure TfrmBaseCRUD.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmBaseCRUD.dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  mX := x;
  mY := y;
end;

procedure TfrmBaseCRUD.dsMasterDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  rc_UpdateDBComboBox( self, true );
end;

procedure TfrmBaseCRUD.dsMasterStateChange(Sender: TObject);
begin
  inherited;
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) );
  //[PT] caso utilize algum 'componente BS_COMPONENTS DBWARE' utilize as instruções abaixo
  //     no evento "dsMasterStateChange" do respectivo DATASOURCE para renderização correta de CRUDS
  //[EN] if you use any 'BS_COMPONENTS DBWARE component' use the instructions below
  //     in the "dsMasterStateChange" event of the respective DATASOURCE for correct rendering of CRUDS
  if ( dsMaster.State <> dsInactive ) then
      dm_rc.rc_BootStrapRender( self, True );

  rc_DefaultTitleForm;

  //[PT] a IDEIA é manter ed_Table_Status / ed_Table_Status_OLD com o ULTIMO ESTADO operacional
  //      pra poder CRITICAR alguma operacao PÓS GRAVAÇÃO no FORM( FRAME ) herdado
  //      como por exemplo, a geracao do plano de contas apos cadastrar uma EMPRESA
  //[PT] the IDEA is to maintain ed_Table_Status / ed_Table_Status_OLD with the LAST operational STATUS
  //      to be able to CRITICIZE some POST RECORDING operation in the inherited FORM(FRAME)
  //      such as, generating the chart of accounts after registering a COMPANY
  if dsMaster.State in [ dsEdit ] then
  begin
     labState.Caption      := mm.LAB_STATE_E;
     ed_Table_Status.Text := 'E';
     //8.4.0.0 Thanks Mr. Fabio Oliveira( PKCOMPOSTA )
//     if ( sqlSearchMaster.Active ) and ( Pos( ' [ID:', labTitleForm.Caption ) = 0 ) and ( Pos( 'caption-id', labTitleForm.Hint ) > 0 ) then
//        if StrToIntDef( sqlSearchMaster.FieldByName( ed_PK.Text ).AsString, -1 ) > 0 then
//           labTitleForm.Caption := labTitleForm.Caption + ' [ID:' + rc_GetPKValues( sqlSearchMaster, vPkFields) + ']';
     if ( sqlSearchMaster.Active ) and ( Pos( ' [ID:', labTitleForm.Caption ) = 0 ) and ( Pos( 'caption-id', labTitleForm.Hint ) > 0 ) then
        if StrToIntDef( sqlSearchMaster.FieldByName( ed_PK.Text ).AsString, -1 ) > 0 then
           labTitleForm.Caption := labTitleForm.Caption + ' [ID:' + sqlSearchMaster.FieldByName( ed_PK.Text ).AsString + ']';
  end
  else
  if dsMaster.State in [ dsInsert ] then
  begin
     labState.Caption      := mm.LAB_STATE_I;
     ed_Table_Status.Text := 'I';
  end
  else
  begin
     if sqlSearchMaster.Active then
     begin
         iCurrentPage := dbgSearchCRUD.DataSource.DataSet.RecNo div dbgSearchCRUD.WebOptions.PageSize + 1;

         labState.Caption      := mm.LAB_STATE_B;
         //8.4.0.0 Thanks Mr. Fabio Oliveira( PKCOMPOSTA )
//         if ( Pos( 'caption-id', labTitleForm.Hint ) > 0 ) and ( Pos( '[ID:', labTitleForm.Caption ) = 0 ) then
//            if StrToIntDef( sqlSearchMaster.FieldByName( ed_PK.Text ).AsString, -1 ) > 0 then
//               labTitleForm.Caption := labTitleForm.Caption + ' [ID:' + rc_GetPKValues( sqlSearchMaster, vPkFields) + ']';
         if ( Pos( 'caption-id', labTitleForm.Hint ) > 0 ) and ( Pos( '[ID:', labTitleForm.Caption ) = 0 ) then
            if StrToIntDef( sqlSearchMaster.FieldByName( ed_PK.Text ).AsString, -1 ) > 0 then
               labTitleForm.Caption := labTitleForm.Caption + ' [ID:' + sqlSearchMaster.FieldByName( ed_PK.Text ).AsString + ']';
     end;
     ed_Table_Status.Text := 'P';
  end;

  if dsMaster.State in [ dsInsert, dsEdit ] then
  begin
     iCurrentPage := dbgSearchCRUD.DataSource.DataSet.RecNo div dbgSearchCRUD.WebOptions.PageSize + 1;

     ed_OldPKValue.Text := '';
     ed_Table_Status_OLD.Text := '';
     ed_OldPKValue.Text := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString;//8.4.0.3
  end;
  //[PT] isso é feito para q os panels q contem os botoes nao troquem de ordem ao ficarem visiveis
  //[EN] this is done so that the panels that contain the buttons do not change order when they become visible
  rc_ObjectEnabled( Self, btnSearch   , not ( dsMaster.State in [ dsEdit, dsInsert ] ) );
  rc_ObjectEnabled( Self, btnNewReg   , btnSearch.Enabled );
  rc_ObjectEnabled( Self, btnEditReg  , btnSearch.Enabled );
  rc_ObjectEnabled( Self, btnDeleteReg, btnSearch.Enabled );
  rc_ObjectEnabled( Self, btnSaveReg  , not btnSearch.Enabled );
  rc_ObjectEnabled( Self, btnCancelReg, not btnSearch.Enabled );
  rc_ObjectEnabled( Self, btnOptions  , ( btnSearch.Enabled ) and ( popMenuOptions.Items.Count > 0 ) );
  //6.0.0.0+
  if bModelCrud3 then
  begin
     btnSearch.Visible    := btnSearch.Enabled;
     btnNewReg.Visible    := btnSearch.Enabled ;
     paNAE.Visible        := false;
     paGC.Visible         := false;
     paNAE.Visible        := btnSearch.Enabled ;
     paGC.Visible         := not btnSearch.Enabled ;
     btnEditReg.Width     := 0;
     btnDeleteReg.width   := 0;
     btnSaveReg.Visible   := not btnSearch.Enabled ;
     btnCancelReg.Visible := not btnSearch.Enabled ;
     btnOptions.Visible   := false ;
  end
  else
  if bModelCrud1 then
  begin
     paP.Visible := false;
     btnSearch.Visible    := false;
  end;
  // 6.0.0.0+
  if not mm.varB_Mobile_Screen then
  begin
     labNew.Visible     := ( btnNewReg.Enabled ) and ( bModelCrud1 );
     labEdit.Visible    := ( labNew.Visible ) and ( bModelCrud1 );
     labDelete.Visible  := ( labNew.Visible ) and ( bModelCrud1 );
     labOptions.Visible := ( labNew.Visible ) and ( bModelCrud1 );
     labCancel.Visible  := ( not bActions ) and ( not labNew.Visible ) and ( not bModelCrud2 ) and ( not bModelCrud3 ) and ( not bModelCrud4 ); // 6.0.0.0
     labSave.Visible    := ( not bActions ) and ( not labNew.Visible ) and ( not bModelCrud2 ) and ( not bModelCrud3 ) and ( not bModelCrud4 ); // 6.0.0.0
  end
  else
  begin
     labNew.Visible     := false;
     labEdit.Visible    := false;
     labDelete.Visible  := false;
     labOptions.Visible := false;
     labCancel.Visible  := false;
     labSave.Visible    := false;
  end;

  edQuickSearch.Enabled := btnSearch.Enabled;
  rc_ObjectEnabled( Self, btnQuickSearch, edQuickSearch.Enabled );

  labExit.Enabled   := not ( dsMaster.State in [ dsEdit, dsInsert ] );
  labExit.font.Color := varIIF( labExit.Enabled, clBlack, clSilver );
  //  info-state:off
  if Pos ('info-state:off', dbgSearchCRUD.Hint ) > 0 then
     labState.Visible := false
  else
     labState.Visible   := not mm.varB_Mobile_Screen_Portrait ;

  if tabSearch.Visible <> btnSearch.Enabled then
     tabSearch.Visible := btnSearch.Enabled;

  //adjust edit masks
  dm_rc.rc_ApplyEditMasks( Self );
end;

procedure TfrmBaseCRUD.dsSearchMasterStateChange(Sender: TObject);
begin
  inherited;
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) );
end;

procedure TfrmBaseCRUD.Excel1Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_DBGridExport( dbgExport, etExcel );
end;

procedure TfrmBaseCRUD.Excel2Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_DBGridExport( dbgExport, etHTML );
end;

procedure TfrmBaseCRUD.FDSchemaAdapter1AfterApplyUpdate(Sender: TObject);
begin
  inherited;

  sqlMaster.CommitUpdates;

end;

procedure TfrmBaseCRUD.labOptionsClick(Sender: TObject);
begin
  inherited;
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  popMenuOptions.PopupBy( TUniButton( sender ) );
end;
//7.3.0.0 search custom
procedure TfrmBaseCRUD.labSwtAndOrClick(Sender: TObject);
begin
  inherited;
  If labSwtAndOr.Tag = 1 then
  begin
     labAndOrSearch.Hint := rc_SetHintAttr( ' AND ', '_swt_txt:', labAndOrSearch.hint );
     labAndOrSearch.Caption := mm.MSG_SEARCH_CONDICIONAL_AND;
  end
  else
  begin
     labAndOrSearch.Hint := rc_SetHintAttr( ' OR ', '_swt_txt:', labAndOrSearch.hint );
     labAndOrSearch.Caption := mm.MSG_SEARCH_CONDICIONAL_OR;
  end;
end;


procedure TfrmBaseCRUD.Xml1Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_DBGridExport( dbgExport, etXML );
end;

procedure TfrmBaseCRUD.Csv1Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_DBGridExport( dbgExport, etCSV );
end;

procedure TfrmBaseCRUD.pgBaseCadControlChangeValue(Sender: TObject);
begin
  inherited;
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
end;
//8.0.0.0
procedure TfrmBaseCRUD.btnCloseFormClick(Sender: TObject);
var
   cCodMaster : string;
begin
  inherited;
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';

  if pgBaseCadControl.ActivePage = tabRegister then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     // EXIBIÇÃO / EDIÇÃO DINÂMICA DE REGISTRO  |   DISPLAY / DYNAMIC REGISTRATION EDITION
     //( Requested by GUS from Italy )
     //
     //[PT] este trecho de código está relacionado com a abertura/edição dinâmica de formulários/frames
     //[EN] this code snippet is related to opening / editing dynamics of forms / frames
     //
     // Ex: MainForm.rc_AddFormFrameInTab( nil, '', 'clientes', '' , false, false, 569, true );
     //
     //[PT] Assumi como padrão que o primeiro campo de pesquisa definido deverá ser o campo usado para efetuar a pesquisa dinâmica, ou seja,
     //      se vamos pesquisar pelo CODIGO DO CLIENTE( por exemplo ) deve existir uma opção de pesquisa pelo CODIGO DO CLIENTE no ON CREATE do CADASTRO DE CLIENTES.
     //
     //[EN] I assumed ( by default ) that the first defined search field should be the field used to perform the dynamic search, that is,
     //      if we are going to search for the CUSTOMER CODE (for example) there must be an option to search for the CUSTOMER CODE in the ON CREATE of the CUSTOMER REGISTRATION.
     //
     //8.0.0.0
     cCodMaster := rc_GetHintAttr( '_codmaster:' , ed_CodMaster.Hint );
     if ( ed_CodMaster.Tag = 0 ) or ( StrToIntDef( cCodMaster, 0 ) > 0 ) then
     begin
           if iCurrentPage <> -1 then
           begin
              if ( mm.oPgGeneral <> nil ) and ( ( ed_CodMaster.Tag > 0 ) or ( StrToIntDef( cCodMaster, 0 ) > 0 ) ) then
                 mm.oPgGeneral.ActivePage.Close;
           end
           else
           begin
              btnSearchCRUDClick( self );
              rc_DefaultTitleForm;
              //7.0.0.0
              //[PT] Com ajuda do Sr. Gilberto Loss, encontrei conflitos no uso do bookmark e usando "recno" tudo funcionou como deveria
              //[EN] With the help of Mr. Gilberto Loss, I found conflicts in the use of the bookmark and using "recno" everything worked as it should
              dbgSearchCRUD.DataSource.DataSet.RecNo := iCurrentRec;
           end;
     end;
     //rc_DefaultTitleForm;
  end
  else
  begin
//     dm_rc.rc_CloseFrame( self, true );
//     Exit;
     if Pos( 'frmModalFrameForm', Self.Owner.Name ) > 0 then
        TUniform( rc_FindControl( Self.Owner.Name ) ).Close
     else
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
  end;
end;

procedure TfrmBaseCRUD.btnDeleteRegClick(Sender: TObject);
begin
  inherited;
  SearchPanelClose; //7.5.0.0
  // verifica licenca de uso | check usage license
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' );
       Abort;
  end;
  // verifica restricao do usuário - EXCLUSAO | check user restriction - DELETION
  If not dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                    Trim( ed_Table_ItemSel.Text ) ,
                                    PT_DELETE ) then
  begin
     Abort;
  end;
  //[PT] cancela a alteracao pra poder EXCLUIR ( aproveitar informacoes q estao na tela pra fazer alguma critica )
  //[EN] cancel the change to be able to DELETE (take advantage of information that is on the screen to make some criticism)
  sqlMaster.Cancel;

  ed_Table_Status_OLD.Text := '';
  ed_Table_Status.Text := '';

  ed_OldPKValue.Text := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString;

  mm.varB_OperationProcessed := False;

  if not dsSearchMaster.DataSet.IsEmpty then
  begin
       mm.varC_LastErrorMsg := dm_rc.rc_HasCodeRegistered( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString );//6.0.0.0

       if mm.varC_LastErrorMsg <> '' then
       begin
         mm.varC_SQLERROR := '';
         dm_rc.rc_ShowMessage( format( mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE, [ ed_Table_ItemSel.Text, dbgSearchCRUD.Tag.ToString, mm.varC_LastErrorMsg ] ) ); //6.0.0.0
         mm.varB_OperationProcessed := False;
         Abort;
       end;
       // ajuste para confirmação via SWEETALERT | adjustment for confirmation via SWEETALERT
       mm.varB_Yes := False;

       mm.varB_OperationProcessed := True;
       mm.varB_OperationProcessed := dm_rc.rc_DeleteActiveRecord( ed_Table_ItemSel.Text, sqlMaster, sqlSearchMaster , 1, True, ed_Table_Deleted_Field.Text , Self );
       if mm.varB_OperationProcessed then
       begin
          pgBaseCadControl.ActivePage := tabSearch;
          // 6.0.0.0
          rc_RemoveFirstShowZero;
          btnSearchCRUDClick( self );
       end;
  end;
  bmBookMark := nil; // 6.0.0.0
end;

procedure TfrmBaseCRUD.btnEditRegClick(Sender: TObject);
begin
  inherited;
  SearchPanelClose; //7.5.0.0
  // verifica licenca de uso | check usage license
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' );
       Abort;
  end;
  // verifica restricao do usuário - ALTERACAO | check user restriction - CHANGE
  If not dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                    Trim( ed_Table_ItemSel.Text ) ,
                                    PT_EDIT ) then
  begin
     Abort;
  end;
  rc_ClearValidation( self );
  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';

  if not dsSearchMaster.DataSet.IsEmpty then
  begin
     if not bSaveMasterPK then
     begin
        pgBaseCadControl.ActivePage := tabRegister;

        if Self.FindComponent('pgComplementData' ) <> nil then
           if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
              TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

        sqlMaster.Cancel;
        sqlMaster.close;
        //8.4.0.0 Thanks Mr. Fabio Oliveira( PKCOMPOSTA )
        //vPkFields := dm_rc.rc_GetPrimaryKey( lowercase( Self.ed_Table_ItemSel.Text ), true );
        if StrTokenCount( vPkFields, ';' ) > 1 then
        begin
           rc_SetPKParams( sqlMaster, sqlSearchMaster, vPkFields );
        end
        else
        begin
          // ajuste pra troca do tag por hint ( pk bigint or string ) 6.0.0.0
          if DataTypeIsNumber( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
             sqlMaster.ParamByName( 'table_pk' ).AsInteger  := StrToIntDef( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString , 0 )
          else
          if DataTypeIsString( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
             sqlMaster.ParamByName( 'table_pk' ).AsString   := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString
          else
          if DataTypeIsDateTime( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
             sqlMaster.ParamByName( 'table_pk' ).AsDateTime := rc_RemoveMiliseconds( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsDateTime ); // 6.0.0.0
        end;
//        // ajuste pra troca do tag por hint ( pk bigint or string ) 6.0.0.0
//        if DataTypeIsNumber( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
//           sqlMaster.ParamByName( 'table_pk' ).AsInteger  := StrToIntDef( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString , 0 )
//        else
//        if DataTypeIsString( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
//           sqlMaster.ParamByName( 'table_pk' ).AsString   := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString
//        else
//        if DataTypeIsDateTime( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
//           sqlMaster.ParamByName( 'table_pk' ).AsDateTime := rc_RemoveMiliseconds( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsDateTime ); // 6.0.0.0

        dm_rc.rc_OpenQuery( sqlMaster );
     end;
     //7.0.0.0
     //[PT] Com ajuda do Sr. Gilberto Loss, encontrei conflitos no uso do bookmark e usando "recno" tudo funcionou como deveria
     //[EN] With the help of Mr. Gilberto Loss, I found conflicts in the use of the bookmark and using "recno" everything worked as it should
     iCurrentRec := dbgSearchCRUD.DataSource.DataSet.RecNo;
     //bmBookMark := dbgSearchCRUD.DataSource.DataSet.GetBookmark; // 6.0.0.0
     sqlMaster.Edit;
     // 6.0.0.0
     // atualizar todos os LOOKUPs dinamicamente | update all LOOKUPs dynamically
     dm_rc.rc_LookUpUpdateData( self, nil, false );
  end;
end;

procedure TfrmBaseCRUD.btnNewRegClick(Sender: TObject);
var
   i : integer;
begin
  inherited;
  SearchPanelClose; //7.5.0.0
  // verifica licenca de uso | check usage license
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' );
       Abort;
  end;
  // verifica restricao do usuário - CADASTRO | // check user restriction - REGISTRATION
  If not dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                    Trim( ed_Table_ItemSel.Text ) ,
                                    PT_INSERT ) then
  begin
     Abort;
  end;
  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';

  pgBaseCadControl.ActivePage := tabRegister;

  if Self.FindComponent('pgComplementData' ) <> nil then
     if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
        TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

  sqlMaster.Cancel;
  sqlMaster.Close;
  bmBookMark := nil; // 6.0.0.0
  //7.0.0.0
  //[PT] Com ajuda do Sr. Gilberto Loss, encontrei conflitos no uso do bookmark e usando "recno" tudo funcionou como deveria
  //[EN] With the help of Mr. Gilberto Loss, I found conflicts in the use of the bookmark and using "recno" everything worked as it should
  iCurrentRec := dbgSearchCRUD.DataSource.DataSet.RecNo;

  rc_ClearValidation( self );
  //[PT] apenas pra dar o select dos campos se sua PK é 'INTEGER' ou STRING
  //[EN] just to select the fields if your PK is 'INTEGER' or STRING
  try
    //8.4.0.0 Thanks Mr. Fabio Oliveira( PKCOMPOSTA )
//    vPkFields := dm_rc.rc_GetPrimaryKey( lowercase( Self.ed_Table_ItemSel.Text ), true );
    if StrTokenCount( vPkFields, ';' ) > 1 then
       rc_SetPKParams( sqlMaster, sqlSearchMaster, vPkFields )
    else
    begin
       if DataTypeIsNumber( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
          sqlMaster.ParamByName( 'table_pk' ).AsInteger  :=-123456789
       else
       if DataTypeIsString( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
       begin
          sqlMaster.ParamByName( 'table_pk' ).AsString   := '-9';
       end
       else
       if DataTypeIsDateTime( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
          sqlMaster.ParamByName( 'table_pk' ).AsDateTime := StrToDateTime('01/01/1900 00:00:00'); // 6.0.0.0

    end;
//     if DataTypeIsNumber( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
//        sqlMaster.ParamByName( 'table_pk' ).AsInteger  :=-123456789
//     else
//     if DataTypeIsString( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
//     begin
//        sqlMaster.ParamByName( 'table_pk' ).AsString   := '-9';
//     end
//     else
//     if DataTypeIsDateTime( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
//        sqlMaster.ParamByName( 'table_pk' ).AsDateTime := StrToDateTime('01/01/1900 00:00:00'); // 6.0.0.0

  except on e:exception do
         begin
              dm_rc.rc_ShowError( 'Fail on sqlMaster.ParamByName( ''table_pk'' )' + '<br><br>' + e.Message + '<br><br>' +
                                  'If your SQL sentence has an ALIAS on [[pk]] it must have [[allpks]] statement.' );
              Abort;
         end;
  end;

  dm_rc.rc_OpenQuery( sqlMaster );

  // inicializar possíveis "bsRgp" | initialize possible "bsRgp"
  dm_rc.rc_RgpInitialize( self );
  // "append" percorre todos registros ate o ultimo | "append" loops through all records until the last
  sqlMaster.Insert;
  // atualizar todos os LOOKUPs dinamicamente | update all LOOKUPs dynamically
  dm_rc.rc_LookUpUpdateData( self, nil, false ); //7.0.0.0
  // controle pra salvar PK( mestre x detalhe ) | control to save O (master and detail)
  bSaveMasterPK := ( ed_GenNextID_OnNew.Text = 'true' );
  // 6.0.0.0
  // controle pra não gerar sequencial ( será controlado pelo dev ) | control to not generate sequential (will be controlled by dev)
  bNoGenID := ( ed_NoGenID.Text = 'true' );
  //[PT] se sua PK é INTEGER , STRING ou DATE e/ou AUTOINC ou a PK não deve ser sequencializada
  //[EN] if your PK is INTEGER , STRING or DATE and/or AUTOINC or the PK must not be sequential
  if ( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType <> ftAutoInc ) and
     ( not AnsiMatchStr( lowercase( ed_Table_ItemSel.Text ) , ARRAY_PK_NO_INC ) ) then
  begin
     if ed_GenNextID_OnNew.Text = 'false' then
     begin
        i := -1;

        //8.0.0.0
        if DataTypeIsDateTime( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.FieldByName( Self.ed_PK.Text ).AsDateTime := rc_RemoveMiliseconds( now ) // 6.0.0.0
        else
        if DataTypeIsNumber( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.FieldByName( Self.ed_PK.Text ).AsInteger := i
        else
        if DataTypeIsString( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := ''
        else
           sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := i.ToString;
     end
     else
     begin
        //8.0.0.0
//        if bNoGenID then
//           i := -1
//        else
           i := dm_rc.rc_GetNextID( mm.varB_IsNot_API , ed_Table_ItemSel.Text , Self.ed_PK.Text , '' );
        //8.0.0.0
        if DataTypeIsDateTime( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.FieldByName( Self.ed_PK.Text ).AsDateTime := rc_RemoveMiliseconds( now ) //now // 6.0.0.0
        else
        if DataTypeIsNumber( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.FieldByName( Self.ed_PK.Text ).AsInteger := i
        else
        if DataTypeIsString( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := ''
        else
           sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := i.ToString;
     end;
  end;

  if ( dsMaster.State in [ dsInsert ] ) then
  begin
       //[PT] as TABELAS do RADCORE podem ser MULTIEMPRESAS, nesse caso,
       //      por padrão utilizo o CAMPO: CODIEMP( que significa CODICOMPANY ) em todas tabelas que deseja
       //      ter controle de filtro por empresa selecionada no Login, mas se não existir, não haverá problema.
       //
       //      se a tabela tem campor CODIEMP, vincula...
       //
       //      O Campo DATA_ALT vai servir pra uma possível SINCRONIZAÇAO DE DADOS COM MOBILE etc...
       //
       //      Já os campos DATA_ACESSO e HORA ACESSO para controle de LOG de usuario por exemplo...
       //
       //      se a tabela tem CODIEMP, DATA_ALT.etc.. vincula...
       //
       //[EN] RADCORE TABLES can be MULTI-COMPANY, in this case,
       //      by default I use the FIELD: CODIEMP (which means CODICOMPANY) in all tables you want
       //      have filter control by company selected at Login, but if it doesn't exist, there will be no problem.
       //
       //      if the table has a CODIEMP field, link...
       //
       //      The DATA_ALT field will be used for possible DATA SYNCHRONIZATION WITH MOBILE etc...
       //
       //      The ACCESS_DATE and ACCESS TIME fields for user LOG control, for example...
       //
       //      if the table has CODIEMP, DATA_ALT.etc.. links...
       //
       if sqlMaster.FieldList.IndexOf (  'codiemp'  ) >= 0 then
          sqlMaster.FieldByName( 'codiemp' ).AsInteger := mm.varI_Code_Company;   // codicompany

       if sqlMaster.FieldList.IndexOf ( 'date_update' ) >= 0 then               // date_change
          sqlMaster.FieldByName('date_update').AsDateTime := rc_RemoveMiliseconds( now ); //now; // 6.0.0.0

       if sqlMaster.FieldList.IndexOf ( 'date_access' ) >= 0 then               // date_access
          sqlMaster.FieldByName('date_access').AsDateTime := date;

       if sqlMaster.FieldList.IndexOf ( 'hour_access' ) >= 0 then               // hour_access
          sqlMaster.FieldByName('hour_access').AsDateTime := time;
  end;
end;

procedure TfrmBaseCRUD.btnOptionsClick(Sender: TObject);
begin
  inherited;
  SearchPanelClose; //7.5.0.0
  popMenuOptions.PopupBy( TUniButton( sender ) );
end;

procedure TfrmBaseCRUD.btnQuickSearchClick(Sender: TObject);
var
   i, f : integer;
   cWhere, cFilter,
   cAlias, cField : string;
begin
  inherited;

  pgBaseCadControl.ActivePage := tabSearch;

  cbxSearchCRUDField1_Fields.ItemIndex    := cbxSearchCRUDField1.ItemIndex;
  cbxSearchCRUDField2_Fields.ItemIndex    := cbxSearchCRUDField2.ItemIndex;
  cbxSearchCRUDFieldDate_Fields.ItemIndex := cbxSearchCRUDFieldDate.ItemIndex;

  cFilters := '';
  cWhere   := '';

  if edQuickSearch.Text <> '' then
  begin
     for f := 0 to cbxSearchCRUDField1.Items.Count-1 do
     begin
        cFilter  := '';
        cField := cbxSearchCRUDField1_Fields.Items[ f ];
        cAlias := dm_rc.rc_ExtractFieldNameFromSearchItem( cField, true );
        cField := dm_rc.rc_ExtractFieldNameFromSearchItem( cField );

        if cField <> '' then
        begin
          i := sqlSearchMaster.FieldByName( cAlias ).Index;

          if cFilters = '' then
             cWhere := ''
          else
             cWhere := ' or ';

          if ( DataTypeIsNumber( sqlSearchMaster.Fields[ i ].DataType ) ) and
             ( strtointdef( edQuickSearch.Text, -999999 ) <> -999999  ) then
             cFilter := cWhere + ' ( ' + cField + '=' + edQuickSearch.Text + ' )'
          else
          if ( DataTypeIsDateTime( sqlSearchMaster.Fields[ i ].DataType ) ) and
             ( StrToDateDef( edQuickSearch.Text, -999999 ) <> -999999  ) then
             cFilter := cWhere + ' ( ' + cField + '=' + QuotedStr( FormatDateTime( mm.APP_SQL_DATE_FORMAT, StrToDateTime( edQuickSearch.Text ) ) ) + ' )'
          else
          //6.1.0.0
          if ( DataTypeIsString( sqlSearchMaster.Fields[ i ].DataType ) ) then
          begin
             if ( mm.CONFIG_DATABASE = 'PGSQL' ) then
                cFilter := cWhere + ' ( full_like(' + cField + ') ilike ' + QuotedStr( '%' + edQuickSearch.Text + '%' ) + ' )'
             else
                cFilter := cWhere + ' ( ' + cField + ' like ' + QuotedStr( '%' + edQuickSearch.Text + '%' ) + ' )';
          end;

          if cFilter <> '' then
             cFilters := cFilters + cFilter;
        end;
     end;
  end;

  edSearchCRUD1.Text := edQuickSearch.Text;
  //7.4.0.0
  if Pos( ' where ((1=1))' , lowerCase( sqlSearchMaster.Sql.Text ) ) > 0 then
     sqlSearchMaster.Sql.Text := Copy( sqlSearchMaster.Sql.Text, 1, Pos( ' where ((1=1))' , lowerCase( sqlSearchMaster.Sql.Text ) ) );

  btnSearchCRUDClick( btnSearchCRUD );

  cFilters := '';
end;
//8.4.0.0
procedure TfrmBaseCRUD.btnSaveRegClick(Sender: TObject);
var
   CompCount,f,i : integer;
   cCodMaster : string;//8.0.0.0
begin
  inherited;

  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  if not rc_FormValidate( Self ) then
     Abort;

  // verifica licenca de uso | check usage license
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' );
       Abort;
  end;
  // 6.0.0.0
  // se sua PK é INTEGER , STRING ou DATE e/ou AUTOINC ou a PK não deve ser sequencializada
  // if your PK is INTEGER , STRING or DATE and/or AUTOINC or the PK must not be sequential
  if ( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType <> ftAutoInc ) and
     ( not bNoGenID ) then
  begin
     if sqlMaster.FieldByName( Self.ed_PK.Text ).AsString = '-1' then
     begin
        //prevent violation of PRIMARY or UNIQUE KEY
        randomize;
        for f := 0 to random( 5000 ) + random( 1000 ) do
            i := f;
        // 6.0.0.0
        //if not bNoGenID then
        begin
           i := dm_rc.rc_GetNextID( mm.varB_IsNot_API , ed_Table_ItemSel.Text , Self.ed_PK.Text , '' );
           if i = 0 then
           begin
                dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_PK_SEQUENCE );
                Abort;
           end;

           mm.varC_Code_ID := i.ToString;

           if DataTypeIsNumber( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
              sqlMaster.FieldByName( Self.ed_PK.Text ).AsInteger := i
           else
           // 6.0.0.0
           //[PT] Aqui vc pode adicionar ZEROS a esquerda...Config. em uConst  mas fora de ARRAY_PK_NO_ZERO( tab. q nao terao ZEROS )
           //[EN] Here you can add ZEROS to the left...Config. in Account but outside of ARRAY_PK_NO_ZERO (table that will not have ZEROS)
           if ed_PK_ZerosLeft.Text = 'true' then
              sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := varIIF( TABLE_PK_WITH_LEFT_ZEROS = 0, I.ToString, Zeros( I.ToString, sqlMaster.FieldByName( Self.ed_PK.Text ).Size ) )
           else
              sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := I.ToString;
        end;
     end;
  end;

  if ( dsMaster.State in [ dsEdit ] ) then
  begin
       if sqlMaster.FieldList.IndexOf ( 'date_update' ) >= 0 then
          sqlMaster.FieldByName('date_update').AsDateTime := rc_RemoveMiliseconds( now ); // 6.0.0.0

       ed_Table_Status_OLD.Text := 'E';
  end
  else
  if ( dsMaster.State in [ dsInsert ] ) then
  begin
       ed_Table_Status_OLD.Text := 'I';

       if sqlMaster.FieldList.IndexOf (  'codiemp'  ) >= 0 then
          sqlMaster.FieldByName( 'codiemp' ).AsInteger := mm.varI_Code_Company;   // codicompany

       if sqlMaster.FieldList.IndexOf ( 'date_update' ) >= 0 then               // date_change
          sqlMaster.FieldByName('date_update').AsDateTime := rc_RemoveMiliseconds( now ); // 6.0.0.0

       if sqlMaster.FieldList.IndexOf ( 'date_access' ) >= 0 then               // date_access
          sqlMaster.FieldByName('date_access').AsDateTime := date;

       if sqlMaster.FieldList.IndexOf ( 'hour_access' ) >= 0 then               // hour_access
          sqlMaster.FieldByName('hour_access').AsDateTime := time;
  end;
  //[PT] REMOVER AS MÁSCARAS APENAS de campos que TEM MÁSCARA DEFINIDA...
  //[EN] REMOVE MASKS ONLY from fields that HAVE A MASK DEFINED...
  CompCount := Self.ComponentCount;
  for i := 0 to CompCount - 1 do
  begin
    if Self.Components[I] is TUniDBEdit then
    begin
         if TUniDBEdit( Self.Components[I] ).DataSource <> nil then
            if ( TUniDBEdit( Self.Components[I] ).tag = 9999 ) and
               ( TUniDBEdit( Self.Components[I] ).DataSource.State in [ dsEdit, dsInsert ] ) then
               if TUniDBEdit( Self.Components[I] ).DataSource.DataSet is TFDMemTable then
                  TFDMemTable( TUniDBEdit( Self.Components[I] ).DataSource.DataSet ).FieldByName( TUniDBEdit( Self.Components[I] ).DataField ).AsString := StrTokenClear( TUniDBEdit( Self.Components[I] ).Text )
               else
                  TFDQuery( TUniDBEdit( Self.Components[I] ).DataSource.DataSet ).FieldByName( TUniDBEdit( Self.Components[I] ).DataField ).AsString := StrTokenClear( TUniDBEdit( Self.Components[I] ).Text );
    end ;
  end;

  sqlMaster.Post;
  mm.varI_ApplyUpdateErrors := sqlMaster.ApplyUpdates(-1);
  if mm.varI_ApplyUpdateErrors > 0 then
  begin
     dm_rc.rc_ApplyUpdatesError( sqlMaster, mm.varI_ApplyUpdateErrors, mm.MSG_BUGERROR_POST );
  end
  else
  begin
     sqlMaster.CommitUpdates;
  end;
  //7.0.0.0
  if not bSaveMasterPK then
  begin
     dm_rc.rc_ShowToaster( 'success' , mm.MSG_SUCCESS_POST ,false , 'slideLeftRightFade' );

     sqlSearchMaster.Close;
     //8.0.0.0
     //[PT] Efetuando o close da página em com um FRAMECRUD em execucao, o código após o "inherited" pode gerar access violation com "sqlmaster"
     //[EN] When closing a page with FRAMECRUD running, the code after "inherited" may generate an access violation with "sqlmaster"
//     cCodMaster := rc_GetHintAttr( '_codmaster:' , ed_CodMaster.Hint );
//     if ( mm.oPgGeneral <> nil ) and ( ( ed_CodMaster.Tag > 0 ) or ( StrToIntDef( cCodMaster, 0 ) > 0 ) ) then
//        mm.oPgGeneral.ActivePage.Close
//     else
     begin
        // 6.0.0.0
        rc_RemoveFirstShowZero;
        // 6.0.0.0
        dm_rc.rc_OpenQuery( sqlSearchMaster );
        //[PT]
        // para manter cadastrando...
        // não tem como fazermos isso aqui, pois, o código do botão SALVAR é herdado no seu formulário para poder
        // executar processos específicos após o usuário clicar em SALVAR( veja o exemplo no "frmCadUsuarios" )
        // então, para conseguir esse recurso, será necessário adicionar um código no final do evento do "btnSaveReg" do
        // seu respectivo form herdado de "frmBaseCRUD"
        //[EN]
        // to keep registering ...
        // there is no way we can do that here, because the SAVE button code is inherited in your form to be able to
        // execute specific processes after the user clicks SAVE (see the example in "frmCadUsuarios")
        // so, to get this feature, you will need to add a code at the end of the "btnSaveReg" event
        // its respective form inherited from "frmBaseCRUD"
        if ed_AskNewRec_AfterPost.Text = 'true' then
        begin
      //    dm_rc.rc_ShowYesNo( mm.MSG_CONTINUE_REGISTERING );
      //    if mm.varB_Yes then
      //       btnNewReg.Click
      //    else
      //       pgBaseCadControl.ActivePage := tabSearch;
        end
        else
        begin
            pgBaseCadControl.ActivePage := tabSearch;

            if Pos( 'add;', ed_Table_ItemSel.Hint ) > 0 then
               btnCloseFormClick( self ) ;
        end;
        //7.0.0.0
        //[PT] Com ajuda do Sr. Gilberto Loss, encontrei conflitos no uso do bookmark e usando "recno" tudo funcionou como deveria
        //[EN] With the help of Mr. Gilberto Loss, I found conflicts in the use of the bookmark and using "recno" everything worked as it should
        //8.0.0.0
        //[PT] Quando o frame é chamado sem ser MODAL( principalmente pelo LOOKUP "+" ), ele é fechado apos SALVAR
        //[EN] When the frame is called without being MODAL (mainly by LOOKUP "+"), it is closed after SAVE
        if FindComponent( 'dbgSearchCRUD' ) <> nil then
           dbgSearchCRUD.DataSource.DataSet.RecNo := iCurrentRec;
     end;
  end;
end;
//7.3.0.0
procedure TfrmBaseCRUD.btnSearchClick(Sender: TObject);
var
   i : integer;
   cCodMaster : string; //8.0.0.0
begin
  inherited;
  if not ( dsMaster.State in [dsEdit, dsInsert ] ) then
  begin
     tabSearch.Visible := ( btnNewReg.Enabled) and ( not bModelCrud1 );
     pgBaseCadControl.ActivePage := tabSearch;
     btnSearchCRUDCustomClearClick(self);//7.5.0.1
     if ( ( not bModelCrud1 ) ) then
     begin
        //7.3.0.0 search custom
        //btnSearchCRUDCustomClearClick(self);//7.5.0.1
        if not bModelSearchCustom then
        begin
           if paSearchFilters.tag = 0 then
           begin
              rc_AddCssClass( paSearchFilters, 'rc-menu-shadow' ); //7.3.0.0
              paSearchFilters.tag := -1;
              edSearchCRUD1.SetFocus; //6.0.0.0
              if not mm.RTL then
              begin
                 rc_Anim( paSearchFilters, 'left', '0', '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
              end
              else
              begin
                 rc_Anim( paSearchFilters, 'right', '0' , '0.4', gsEaseBack, '0.4', gsEaseTypeOut );
              end;
           end
           else
           if paSearchFilters.tag = -1 then
           begin
              rc_RemoveCssClass( paSearchFilters, 'rc-menu-shadow' ); //7.3.0.0
              paSearchFilters.tag := 0;
              if not mm.RTL then
              begin
                 rc_Anim( paSearchFilters, 'left', '-' + paSearchFilters.Width.ToString, '0.4', gsEaseBack, '0.4', gsEaseTypeOut );
              end
              else
              begin
                 rc_Anim( paSearchFilters, 'right', paSearchFilters.Left.ToString, '0.4', gsEaseBack, '0.4', gsEaseTypeOut );
              end;
           end
           else
              paSearchFilters.tag := 0;
        end
        else
        begin
           if paSearchFiltersCustom.tag = 0 then
           begin
              rc_AddCssClass( paSearchFiltersCustom, 'rc-menu-shadow' ); //7.3.0.0
              paSearchFiltersCustom.tag := -1;
              edSearchCRUD1.SetFocus; //6.0.0.0
              if not mm.RTL then
              begin
                 rc_Anim( paSearchFiltersCustom, 'left', '0', '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
              end
              else
              begin
                 rc_Anim( paSearchFiltersCustom, 'right', '0' , '0.4', gsEaseBack, '0.4', gsEaseTypeOut );
              end;
           end
           else
           if paSearchFiltersCustom.tag = -1 then
           begin
              rc_RemoveCssClass( paSearchFiltersCustom, 'rc-menu-shadow' ); //7.3.0.0
              paSearchFiltersCustom.tag := 0;
              if not mm.RTL then
              begin
                 rc_Anim( paSearchFiltersCustom, 'left', '-' + paSearchFiltersCustom.Width.ToString, '0.4', gsEaseBack, '0.4', gsEaseTypeOut );
              end
              else
              begin
                 rc_Anim( paSearchFiltersCustom, 'right', paSearchFiltersCustom.Left.ToString, '0.4', gsEaseBack, '0.4', gsEaseTypeOut );
              end;
           end
           else
              paSearchFiltersCustom.tag := 0;
        end;
     end;
     // just close search options
     if TUniControl( sender ).Name <> 'labExit' then
     begin
        cCodMaster := rc_GetHintAttr( '_codmaster:' , ed_CodMaster.Hint );//8.0.0.0
        if ( StrToIntDef( cCodMaster, 0 ) > 0 ) then //8.0.0.0
        begin
            btnSearchCRUDClick( btnSearchCRUD );
        end;
     end;
  end;
end;
//7.3.0.0 search custom
procedure TfrmBaseCRUD.btnSearchClose;
begin
  //if ( ( not bModelCrud1 ) and ( paSearchFilters.tag <> 0 ) ) then
  if ( ( not bModelCrud1 ) and ( paSearchFilters.tag <> 0 ) ) or
     ( ( bModelSearchCustom ) and ( ( paSearchFiltersCustom.tag <> 0 ) ) ) then
     btnSearchClick( labExit );
end;
//7.3.0.0 search custom
procedure TfrmBaseCRUD.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;
  SearchCRUD( self );
end;
//7.3.0.0 search custom
procedure TfrmBaseCRUD.btnSearchCRUDCustomClick(Sender: TObject);
begin
  inherited;
  SearchCRUDCustom( self );
  dm_rc.rc_GridPaginatorUpdatePages( dbgSearchCRUD );//7.4.0.0
end;
//8.4.0.0 search custom
procedure TfrmBaseCRUD.btnSearchCRUDCustomClearClick(Sender: TObject);
var
   CompCount,f : integer;
   oObj : TUniControl;
   cText : string;
begin
  inherited;
  CompCount := ComponentCount;
  for f := 0 to CompCount - 1 do
  begin
     oObj := TUniControl( Components[f] );
     If ( lowercase( Copy( oObj.Name, 1, 8 ) ) = 'edsearch' ) then
     begin
          TUniEdit(oObj).Text := '';
          if oObj is TUniComboBox then
             TUniComboBox( oObj ).ItemIndex := -1;
     end;
  end;
end;

procedure TfrmBaseCRUD.cbxAndOrChange(Sender: TObject);
begin
  inherited;
  cbxAndOr.Caption := varIIF( cbxAndOr.Checked, mm.MSG_SEARCH_CONDICIONAL_AND, mm.MSG_SEARCH_CONDICIONAL_OR ) + '...';
end;

procedure TfrmBaseCRUD.cbxSearchCRUDField1Change(Sender: TObject);
begin
  inherited;
  cbxSearchCRUDField1_Fields.ItemIndex := cbxSearchCRUDField1.ItemIndex;
end;

procedure TfrmBaseCRUD.cbxSearchCRUDField2Change(Sender: TObject);
begin
  inherited;
  cbxSearchCRUDField2_Fields.ItemIndex := cbxSearchCRUDField2.ItemIndex;
end;

procedure TfrmBaseCRUD.cbxSearchCRUDFieldDateChange(Sender: TObject);
begin
  inherited;
  cbxSearchCRUDFieldDate_Fields.ItemIndex := cbxSearchCRUDFieldDate.ItemIndex;
end;

procedure TfrmBaseCRUD.cbxSearchCRUDPeriodChange(Sender: TObject);
begin
  inherited;
  dm_rc.rc_ReportDateInterval( cbxSearchCRUDPeriod.Text );

  edSearchCRUDDtIni.DateTime := mm.varD_DtIni;
  edSearchCRUDDtEnd.DateTime := mm.varD_DtEnd;
end;

procedure TfrmBaseCRUD.cbxSearchCRUDPagedClick(Sender: TObject);
begin
  inherited;

  // dbgSearchCRUD.WebOptions.Paged := not dbgSearchCRUD.WebOptions.Paged;

//  if not dbgSearchCRUD.WebOptions.Paged then
//     dbgSearchCRUD.WebOptions.PageSize := 1000000
//  else
//     dbgSearchCRUD.WebOptions.PageSize := 25;
//
//  dbgSearchCRUD.Refresh;
end;

procedure TfrmBaseCRUD.btnSearchMoreFiltersClick(Sender: TObject);
begin
  inherited;
   if paSearchFilter2.visible then
   begin
       paSearchFilterPeriodSelect.Visible := ( not paSearchFilterPeriodSelect.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 0 );
       paSearchFilterDate.Visible         := ( not paSearchFilterDate.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 0 );
       paSearchFilterPeriod.Visible       := ( not paSearchFilterPeriod.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 0 );
       paSearchContent2.Visible     := not paSearchContent2.Visible;
       paSearchFilter2.Visible      := not paSearchFilter2.Visible;
       paSearchFilterAndOr.Visible  := not paSearchFilterAndOr.Visible;
   end
   else
   begin
      paSearchFilterAndOr.Visible  := not paSearchFilterAndOr.Visible;
      paSearchFilter2.Visible      := not paSearchFilter2.Visible;
      paSearchContent2.Visible     := not paSearchContent2.Visible;

      paSearchFilterPeriod.Visible       := ( not paSearchFilterPeriod.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 0 );
      paSearchFilterDate.Visible         := ( not paSearchFilterDate.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 0 );
      paSearchFilterPeriodSelect.Visible := ( not paSearchFilterPeriodSelect.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 0 );
   end;

   if paSearchFilterPeriod.Visible then
      paSearchBtn.Top := paSearchFilterPeriodSelect.Top + paSearchFilterPeriodSelect.Height + 12
   else
   if paSearchContent2.Visible then
      paSearchBtn.Top := paSearchContent2.Top + paSearchContent2.Height + 12
   else
      paSearchBtn.Top := paSearchContent1.Top + paSearchContent1.Height + 12;
end;

procedure TfrmBaseCRUD.UniFrameCreate(Sender: TObject);
var
   iPos, iPos2, iWidth, iHeight,
   CompCount,I, F : integer;

   cCodMaster, cPermissionField, //8.0.0.0
   cActions, cCaption,
   cTemp, cTemp3,
   cCls, cIco, cBtn,cBtnCls,
   cTagString, // 6.0.0.0
   cSql : string;

   //AllPKs,//8.4.0.0 pk composta
   cPk : string;
   bBool : boolean;
begin
    //7.4.0.0
    htmlFrame.HTML.Add( '<form autocomplete="off">');
    // from uniGUI forum: http://forums.unigui.com/index.php?/topic/9634-autofill-how-to-turn-off/
    UniSession.AddJS('$("input").attr("autocomplete", "off");');
    //7.0.0.0 crud landscape( thanks bugtracker GILBERTO LOSS )
    if ( ( mm.CONFIG_LAYOUT_TAB_OFF = 'ON' ) or ( mm.CONFIG_LAYOUT_HIDE_TABS_ON_MOBILE = 'ON' ) and ( mm.varB_Mobile_Screen  ) ) then
    begin
       paBaseBackGround.Margins.Top    := 2;
       paBaseBackGround.Margins.Left   := 2;
       paBaseBackGround.Margins.Right  := 2;
       paBaseBackGround.Margins.Bottom := 2;
    end
    else
    begin
       paBaseBackGround.Margins.Top    := mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET.ToInteger;
       paBaseBackGround.Margins.Left   := mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET.ToInteger;
       paBaseBackGround.Margins.Right  := mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET.ToInteger;
       paBaseBackGround.Margins.Bottom := mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET.ToInteger;
    end;
    paBaseBackGround.AlignWithMargins := true;
    paBaseBackGround.Align := alClient;

    rc_AddCssClass( paBaseRegSearch, 'bringtofront-lower'); // 6.0.0.0+
    rc_AddCssClass( paSearchFilters, 'bringtofront-higher'); // 6.0.0.0+
    rc_AddCssClass( paSearchFiltersCustom, 'bringtofront-higher'); //7.3.0.0 search custom

    // inherited;
    rc_UpdateLayout;

    //[PT] sobrepor o hint( tooltip ) padrão
    //[EN] override the default hint( tooltip )
    btnSearch.Hint    := rc_AddHintAttr( '|hint:' + cBTN_SEARCH_CAPTION + ' c:info-light w:200 d:3000', btnSearch.Hint, false );
    btnNewReg.Hint    := rc_AddHintAttr( '|hint:' + cBTN_NEW_CAPTION + ' c:info-light w:200 d:3000', btnNewReg.Hint, false );
    btnEditReg.Hint   := rc_AddHintAttr( '|hint:' + cBTN_EDIT_CAPTION + ' c:info-light w:200 d:3000', btnEditReg.Hint, false );
    btnCancelReg.Hint := rc_AddHintAttr( '|hint:' + cBTN_CANCEL_CAPTION + ' c:info-light w:200 d:3000', btnCancelReg.Hint, false );
    btnSaveReg.Hint   := rc_AddHintAttr( '|hint:' + cBTN_SAVE_CAPTION + ' c:info-light w:200 d:3000', btnSaveReg.Hint, false );
    btnDeleteReg.Hint := rc_AddHintAttr( '|hint:' + cBTN_DEL_CAPTION + ' c:info-light w:200 d:3000', btnDeleteReg.Hint, false );
    btnOptions.Hint   := rc_AddHintAttr( '|hint:' + cBTN_OPTIONS_CAPTION + ' c:info-light w:200 d:3000', btnOptions.Hint, false );

    dm_rc.rc_RenderControls( self, btnSearch );
    dm_rc.rc_RenderControls( self, btnNewReg );
    dm_rc.rc_RenderControls( self, btnEditReg );
    dm_rc.rc_RenderControls( self, btnCancelReg );
    dm_rc.rc_RenderControls( self, btnSaveReg );
    dm_rc.rc_RenderControls( self, btnDeleteReg );
    dm_rc.rc_RenderControls( self, btnOptions );

    if dbgSearchCRUD.DataSource = nil then
       dbgSearchCRUD.DataSource := dsSearchMaster;
    // 6.0.0.0
    dbgExport.Top := -50;
    dbgExport.LoadMask.Enabled := false; // 6.0.0.0
    //dbgSearchCRUD.LoadMask.Enabled := false; // 6.0.0.0 menu mask

    inherited;

    //rc_BringToFront( paSearchFilters ); // 6.0.0.0+

    iCurrentPage := -1;
    // 6.0.0.0
    //dbgExport.Top := -50;
    //dbgExport.LoadMask.Enabled := false; // 6.0.0.0
    //dbgSearchCRUD.LoadMask.Enabled := false; // 6.0.0.0 menu mask
    mm.varC_CustomMsg := '';

    //7.3.0.0 search custom
    if mm.varB_Mobile_Screen_Portrait then
    begin
       paSearchFilters.tag  := -2;
       paSearchFiltersCustom.tag  := -2;
    end
    else
    begin
       paSearchFilters.tag  := 0;
       paSearchFiltersCustom.tag  := 0;
    end;

    rc_ObjectEnabled( Self, btnSearch   , not ( dsMaster.State in [ dsEdit, dsInsert ] ) );
    rc_ObjectEnabled( Self, btnNewReg   , btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnEditReg  , btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnDeleteReg, btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnSaveReg  , not btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnCancelReg, not btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnOptions  , ( btnSearch.Enabled ) and ( popMenuOptions.Items.Count > 0 ) );
    //7.3.0.0 search custom
    paSearchFiltersCustom.Left := -paSearchFiltersCustom.Width;
    paSearchFiltersCustom.Top  := 0;
    //6.0.0.0+
    paSearchFilters.Left := -paSearchFilters.Width;
    paSearchFilters.Top  := 0;
    if bModelCrud3 then
    begin
       btnSearch.Visible    := btnSearch.Enabled;
       btnNewReg.Visible    := btnSearch.Enabled ;
       paNAE.Visible        := false;
       paGC.Visible         := false;
       paNAE.Visible        := btnSearch.Enabled ;
       paGC.Visible         := not btnSearch.Enabled ;
       btnEditReg.Width     := 0;
       btnDeleteReg.width   := 0;
       btnSaveReg.Visible   := not btnSearch.Enabled ;
       btnCancelReg.Visible := not btnSearch.Enabled ;
       btnOptions.Visible   := false ;
    end
    else
    if bModelCrud1 then
    begin
       paP.Visible := false;
       btnSearch.Visible    := false;
    end;
    // 6.0.0.0+
    if not mm.varB_Mobile_Screen then
    begin
       labNew.Visible     := ( btnNewReg.Enabled ) and ( bModelCrud1 );
       labEdit.Visible    := ( labNew.Visible ) and ( bModelCrud1 );
       labDelete.Visible  := ( labNew.Visible ) and ( bModelCrud1 );
       labOptions.Visible := ( labNew.Visible ) and ( bModelCrud1 );
       labCancel.Visible  := ( not bActions ) and ( not labNew.Visible ) and ( not bModelCrud2 ) and ( not bModelCrud3 ) and ( not bModelCrud4 ); // 6.0.0.0
       labSave.Visible    := ( not bActions ) and ( not labNew.Visible ) and ( not bModelCrud2 ) and ( not bModelCrud3 ) and ( not bModelCrud4 ); // 6.0.0.0
    end
    else
    begin
       labNew.Visible     := false;
       labEdit.Visible    := false;
       labDelete.Visible  := false;
       labOptions.Visible := false;
       labCancel.Visible  := false;
       labSave.Visible    := false;
    end;

    edQuickSearch.Enabled := btnSearch.Enabled;
    rc_ObjectEnabled( Self, btnQuickSearch, edQuickSearch.Enabled );

    labState.Caption   := mm.LAB_STATE_B;

    labExit.Enabled    := paOF.Visible;
    labExit.font.Color := varIIF( labExit.Enabled, clBlack, clSilver );
    //  info-state:off
    if Pos ('info-state:off', dbgSearchCRUD.Hint ) > 0 then
       labState.Visible := false
    else
       labState.Visible   := not mm.varB_Mobile_Screen_Portrait ;

    tabSearch.Visible  := btnSearch.Enabled;

    rc_AddCssClass( labTitleForm, 'rc-font-light' );

    labTitleForm.Font.Name  := mm.CONFIG_LAYOUT_APP_FONT;
    labTitleForm.Font.Color := $002a2a2a ;
    labTitleForm.Font.Size  := 16;
    labTitleForm.Font.Style := [];

    // guide tour
    cTemp := rc_GetAttribute( btnQuickSearch );
    //rtl
    labState.Alignment  := varIIF( ( mm.RTL ) and ( labState.Visible ), taLeftJustify, taRightJustify );
    if ( mm.RTL ) and ( labState.Visible ) then
       btnQuickSearch.Hint := '[[cls:ButtonThemeCrud-no-border-right |ico:fas-search |'
    else
       btnQuickSearch.Hint := '[[cls:ButtonThemeCrud-no-border-left |ico:fas-search |';
    btnQuickSearch.Hint := btnQuickSearch.Hint  + cTemp + '|]]';

    // deixar  invisivel pra ganhar mais espaço vertical | Make it invisible to gain more vertical space
    tabRegister.TabVisible         := false;
    tabSearch.TabVisible           := false;
    pgBaseCadControl.TabBarVisible := false;
    pgBaseCadControl.ActivePage    := tabSearch;

    if Self.FindComponent('pgComplementData' ) <> nil then
       if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
          TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

    // para criticar cada coluna no ondrawcell | to criticize each column in ondrawcell
    mm.varC_GridColName := '';
    //[PT] ao entrar na tela setar os EDITs que guardam dados referente ao FORM atual
    //[EN] when entering the screen, set the EDITs that store data relating to the current FORM
    Self.ed_Table_ItemSel.Text  := trim( lowercase( mm.varC_Table_Search ) ) ;
    //[PT] chave primária ta tabela atual capturada na função rc_AddFormFrameInTab
    //[EN] primary key of the current table captured in the rc_AddFormFrameInTab function
    Self.ed_PK.Text             := mm.varC_PK_MasterTable;
    //8.4.0.0 pk composta
    vPkFields := dm_rc.rc_GetPrimaryKey( lowercase( Self.ed_Table_ItemSel.Text ), true );
    // 6.0.0.0
    cTagString                  := dm_rc.rc_GetTagFormAttr( Self, true );
    if cTagString <> '' then Self.Hint := rc_AddHintAttr( '|tag-form:' + cTagString, Self.Hint, false );
    ed_HideMaskOff.Text         := varIIF( mm.varA_FSideMenu[ dm_rc.rc_FindMenuOption( mm.varC_SelectedItem_FSideMenu ) ].HideMaskOff  , 'true', 'false' );
    ed_PK_ZerosLeft.Text        := varIIF( mm.varA_FSideMenu[ dm_rc.rc_FindMenuOption( mm.varC_SelectedItem_FSideMenu ) ].PKZerosLeft  , 'true', 'false' );
    ed_NoGenID.Text             := varIIF( mm.varA_FSideMenu[ dm_rc.rc_FindMenuOption( mm.varC_SelectedItem_FSideMenu ) ].NoGenID      , 'true', 'false' );
    ed_GenNextID_OnNew.Text     := varIIF( mm.varA_FSideMenu[ dm_rc.rc_FindMenuOption( mm.varC_SelectedItem_FSideMenu ) ].GenIDOnInsert, 'true', 'false' ); // 6.0.0.0
    ed_AskNewRec_AfterPost.Text := varIIF( mm.varA_FSideMenu[ dm_rc.rc_FindMenuOption( mm.varC_SelectedItem_FSideMenu ) ].AskNew       , 'true', 'false' );
    Self.ed_FormOrigin.Text     := mm.varC_FormSource_Search ;
    //8.4.0.0 same table...many forms( thanks for bug tracker Mr. Fabio Oliveira )
    if dm_rc.rc_FindMenuOption( mm.varC_SelectedItem_FSideMenu ) > 0 then
       cPermissionField := mm.varA_FSideMenu[ dm_rc.rc_FindMenuOption( mm.varC_SelectedItem_FSideMenu ) ].table
    else
       cPermissionField := '';

    if Pos( '__', cPermissionField ) > 0 then
       cPermissionField := Copy( cPermissionField, Pos( '__', cPermissionField ) + 2 );
    Self.ed_FormOrigin_Tab.Text :=  mm.varC_Selected_FormFrame + '@@@@' + cPermissionField; // mm.varC_Selected_FormFrame ;

    Self.ed_Table_Status.Text   := mm.varC_StatusSearch ;
    Self.ed_Table_Status_OLD.Text := '';
    if ed_Where_Search.Text <> '' then
       ed_Where_Search.Text := '((  ((' + trim( ed_Where_Search.Text ) + ')) )) ';
    if ed_Order_Search.Text <> '' then
       ed_Order_Search.Text := trim( ed_Order_Search.Text ) ;

    // pre-defined grid columns attributes
    //8.4.0.0
    if ( Pos( 'fieldmasks:' , dbgSearchCRUD.Hint ) = 0 ) then
        dbgSearchCRUD.Hint := '[[' +
                              'fieldmasks:' +
                              'grid-resize|' +
                              //'model-crud:0(btns-cls:colorful)|'+{model-crud}//6.1.0.0
                              varIIF( ( mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR = 'ON' ) and
                                      {7.0.0.0}( ( pos( 'no-paged|', dbgSearchCRUD.Hint ) = 0 ) and ( dbgSearchCRUD.WebOptions.Paged ) ) and
                                      ( pos( 'grid-paginator', dbgSearchCRUD.Hint ) = 0 ), 'grid-paginator|', '' ) +
                              ']]';
    //8.2.0.0
    if Pos( '[[pk-show]]' , sqlMaster.Sql.Text ) > 0 then
    begin
       sqlMaster.Sql.Text := StringReplace( sqlMaster.Sql.Text, '[[pk-show]]', '[[pk]]', [rfReplaceAll] );
       dbgSearchCRUD.Hint := rc_AddHintAttr( '|showpk' , dbgSearchCRUD.Hint, false );
    end;

    dbgSearchCRUD.Hint   := rc_AddHintAttr( '|state-visible:empty-false ds:dsSearchMaster', dbgSearchCRUD.Hint, false );
    //8.5.0.0
    dbgSearchCRUD.Align := alClient;

    //8.4.0.0 no-paged ( tip from GILBERTO LOSS )
    if ( not dbgSearchCRUD.WebOptions.Paged ) or
       ( pos( 'no-paged|', dbgSearchCRUD.Hint ) > 0 )  then
    begin
       dbgSearchCRUD.Hint := StringReplace( dbgSearchCRUD.Hint, 'grid-paginator:center|', '', [rfReplaceAll] );
       dbgSearchCRUD.Hint := StringReplace( dbgSearchCRUD.Hint, 'grid-paginator:left|', '', [rfReplaceAll] );
       dbgSearchCRUD.Hint := StringReplace( dbgSearchCRUD.Hint, 'grid-paginator:right|', '', [rfReplaceAll] );
       dbgSearchCRUD.Hint := StringReplace( dbgSearchCRUD.Hint, 'grid-paginator|', '', [rfReplaceAll] );
    end;

    if ( Pos( 'fieldmasks:' , dbgSearchCRUD.Hint ) > 0 ) and ( Pos( 'fieldmasks:table-' , dbgSearchCRUD.Hint ) = 0 ) then
    begin
         iPos := Pos( 'fieldmasks:' , dbgSearchCRUD.Hint ) + 11;
         cTemp := dbgSearchCRUD.Hint;
         Insert( 'table-' + lowercase( ed_Table_ItemSel.Text ) + ';' , cTemp , iPos );
         dbgSearchCRUD.Hint := cTemp;
         dbgSearchCRUD.Hint := rc_AddHintAttr( '|table-pk:' + lowercase( ed_PK.Text ) , dbgSearchCRUD.Hint, false );
    end;

    mm.varC_FieldMasks := '';

    //[PT] Senão tiver sido definido a query no ON CREATE da nova tela herdada...
    //[EN] If the query has not been defined in the ON CREATE of the new inherited screen...
    if ( trim(sqlMaster.Sql.Text) = EmptyStr ) or ( Pos ( '[grid]' , trim(sqlMaster.Sql.Text) ) = 0  ) then
    begin
        sqlMaster.close;
        sqlMaster.SQL.Text := ' SELECT [[fields]]  ' +

                              '   FROM [[table]] tab ' +
                              //8.4.0.0 Thanks Mr. Fabio Oliveira( PKCOMPOSTA )
                              //'  WHERE ' + rc_AddPKWhere( 'tab.', vPkFields ) ;
                              '  WHERE tab.[[pk]] = :table_pk ' ;
    end;
    if Pos ( '[grid]' , trim(sqlMaster.Sql.Text) ) = 0 then
    begin
        sqlMaster.SQL.Text := sqlMaster.SQL.Text +
                              '[grid]' +

                              ' SELECT [[fields]] ' +

                              ' FROM [[table]] tab ';
    end;

    //8.4.0.0 Thanks Mr. Fabio Oliveira( PKCOMPOSTA )
    if strTokenCount( vPkFields, ';' ) > 1 then
       sqlMaster.SQL.Text := StringReplace( sqlMaster.SQL.Text,
                                            'WHERE tab.[[pk]] = :table_pk ',
                                            '  WHERE ' + rc_AddPKWhere( 'tab.', vPkFields ), [rfReplaceAll] ) ;

    //[PT] configurar lookups...mascaras...etc.. preparar query [[fields]]...
    //[EN] adjust the lookup tables according to the query name
    dm_rc.rc_RenderLookUpControls( Self );

    sqlSearchMaster.tag := 1;
    cSql := Trim( sqlMaster.SQL.Text );
    // SQLSERVER TOP...
    if ( Pos( 'firstshow:', dbgSearchCRUD.Hint ) > 0 ) or
       ( Self.Tag = 1 ) then // cadastro dinamico..abrir só um registro pra acelerar...
    begin
         //[PT] primeira execucao: Limitar a lista( você pode alterar ou parametriza isso )
         //[EN] first execution: Limit the list (you can change or parameterize this)
         if ( sqlSearchMaster.tag = 1 ) then
         begin
              cSql := Trim( sqlMaster.SQL.Text );
              if ( lowercase( copy( cSql, 1, 6 ) ) = 'select' ) and ( mm.CONFIG_DATABASE = 'SQLSERVER' ) then
              begin
                   cTemp := Copy( dbgSearchCRUD.Hint, Pos( 'firstshow:', dbgSearchCRUD.Hint ) , 100 );
                   cTemp := Copy( cTemp, 1, Pos( '|', cTemp ) - 1 );

                   iFirstShow := StrToIntDef( ReturnNumbers( cTemp ), -1 );
                   cTemp := '';

                   cSql := 'SELECT TOP ' + iFirstShow.ToString + ' ' + copy( cSql, 7, 5000 );
              end;
         end;
    end;
    sqlMaster.SQL.Text := cSql;

    //[PT] associar a TABELA ATUAL ao SCRIPT do FORM/FRAME atual
    //[EN] associate the CURRENT TABLE with the SCRIPT of the current FORM/FRAME
    if Pos( '[[table]]' , sqlMaster.Sql.Text ) > 0 then
       sqlMaster.Sql.Text := StringReplace( sqlMaster.Sql.Text , '[[table]]' , varIIF( DB_SCHEMA <> '',DB_SCHEMA + '.', '' ) + Self.ed_Table_ItemSel.Text, [rfReplaceAll] );//6.1.0.0
    // tab.[[pk]]
    // associar a PK ATUAL ao SCRIPT do FORM/FRAME atual | associate the CURRENT PK with the SCRIPT of the current FORM/FRAME
    if Pos( '[[pk]]' , sqlMaster.Sql.Text ) > 0 then
    begin
       if ( pos( 'tab.[[pk]] as ', sqlMaster.Sql.Text ) > 0 ) and ( pos( '[[allpks]]', sqlMaster.Sql.Text ) = 0 ) then
          dm_rc.rc_ShowError( 'Your SQL sentence do not have [[allpks]] statement.<br>When [[pk]] has an ALIAS it must have [[allpks]].' );
       sqlMaster.Sql.Text := StringReplace( sqlMaster.Sql.Text , '[[pk]]' , Self.ed_PK.Text, [rfReplaceAll] );
    end;
    // pega o SQL de pesquisa( coringa [grid] ) | Gets the search SQL (wildcard [grid])
    sqlSearchMaster.close;
    sqlSearchMaster.sql.Text := RemoveLineBreaks( Copy( sqlMaster.Sql.Text, Pos( '[grid]' , sqlMaster.Sql.Text ) + 6, 5000 ) );
    // paged...firstshow...[[firstshow:20 no-paged]]
    iFirstShow := 0 ;
    bPaged     := true;

    // agrupamento / grouping
    //dbgSearchCRUD.Grouping.Enabled := true;
    //dbgSearchCRUD.WebOptions.Paged  := bPaged;
    //if dbgSearchCRUD.Grouping.Enabled then
    //   dbgSearchCRUD.Grouping.FieldName := 'uf';

    //8.4.0.0 pk composta
    vAllPKs := Copy( vPkFields, 1, Length( vPkFields ) - 1 );
    vAllPKs := 'tab.' + StringReplace( vAllPKs, ';', ', tab.', [rfReplaceAll] );
    //8.4.0.0 pk composta
//    AllPKs := '';
//    dm_rc.memPK.Filtered := false;
//    dm_rc.memPK.Filter := 'table=' + quotedStr(lowercase(trim(Self.ed_Table_ItemSel.Text )));
//    dm_rc.memPK.Filtered := true;
//    dm_rc.memPK.First;
//    cSql := lowercase( sqlSearchMaster.sql.Text );
//    cSql :=  Copy( cSql, 1, Pos( ' from ' , cSql ) );
//
//    while not dm_rc.memPK.eof do
//    begin
//         dm_rc.memPK.tag := 0;
//
//         cPk := trim(lowercase( dm_rc.memPK.FieldByName( 'pk' ).AsString ));
//         //[PT] se alguma das PK´s ja estiver presente na query do on create do form( preenchida manualmente ) não adicionar...
//         //[EN] if any of the PK's are already present in the form's on create query (completed manually) do not add...
//         AllPKs := AllPKs + 'tab.' + cPk ;
//
//         // Append data
//         dm_rc.memGridPK.Open;
//
//         if not dm_rc.memGridPK.Locate( 'field' , cPk , [] ) then
//            dm_rc.memGridPK.AppendRecord( [ cPk ] );
//
//         dm_rc.memPK.tag := 1;
//
//         dm_rc.memPK.Next;
//
//         if ( not dm_rc.memPK.eof ) and ( AllPKs <> '' ) then
//            AllPKs := AllPKs + ', ';
//    end;
//
//    dm_rc.memPK.Filtered := false;

    // [[allpks]]
    // inserir no grid todas as PK´s da tabela dinamicamente | insert all PK's from the table dynamically into the grid
    dbgSearchCRUD.Tag := 0; // se nao tem ALLPKS...nao critica a exibicao das colunas | if you don't have ALLPKS...don't criticize the display of the columns
    if Pos( '[[allpks]]' , sqlSearchMaster.Sql.Text ) > 0 then
    begin
       sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text , '[[allpks]]' , vAllPKs, [rfReplaceAll] ); //8.4.0.0 pk composta
       dbgSearchCRUD.Tag := 1;
    end;

    // grid-btns -> Actions
    if Pos( '[[grid-btn:edo]]' , sqlSearchMaster.Sql.Text ) > 0 then
    begin
       sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text ,
                                                  '[[grid-btn:edo]]' ,
                                                  '[[grid-btn:edit]] ' +
                                                  '[[grid-btn:delete]] ' +
                                                  '[[grid-btn:options]] ' ,
                                                  [rfReplaceAll] );
    end;
    // 6.0.0.0
    // action buttons
    bActions := dm_rc.rc_ActionBtnsRender( Self, dbgSearchCRUD );

    // 6.0.0.0
    if bModelCrud4 then
       paBaseTop.Height       := 140
    else
       paBaseTop.Height       := varIIF( bActions or bModelCrud1 or bModelCrud2, 90, 46 );
    paBaseButtons.Width    := varIIF( bActions or bModelCrud1, 0, 37 );
    labState.Width         := varIIF( bActions or bModelCrud1, 120, 164 );
    // 6.0.0.0+
    if not mm.varB_Mobile_Screen then
    begin
       labNew.Visible         := bModelCrud1;
       labEdit.Visible        := bModelCrud1;
       labDelete.Visible      := bModelCrud1;
       labOptions.Visible     := bModelCrud1;
       labCancel.Visible      := ( not bActions ) and ( not labNew.Visible ) and ( not bModelCrud2 ) and ( not bModelCrud3 ) and ( not bModelCrud4 ); // 6.0.0.0
       labSave.Visible        := ( not bActions ) and ( not labNew.Visible ) and ( not bModelCrud2 ) and ( not bModelCrud3 ) and ( not bModelCrud4 ); // 6.0.0.0
    end
    else
    begin
       labNew.Visible     := false;
       labEdit.Visible    := false;
       labDelete.Visible  := false;
       labOptions.Visible := false;
       labCancel.Visible  := false;
       labSave.Visible    := false;
    end;

    edQuickSearch.Enabled  := ( ( bModelCrud1 ) or ( bModelCrud3 ) or ( bModelCrud4 ) ) and ( not bSearchComplete ) ;      // 6.0.0.0
    edQuickSearch.Visible  := edQuickSearch.Enabled;
    btnQuickSearch.Visible := edQuickSearch.Visible ;
    rc_ObjectEnabled( Self, btnQuickSearch, btnQuickSearch.Visible );
    btnCloseForm.Visible   := False;

    //8.4.0.0 pk composta
    if trim( ed_Order_Search.Text ) = '' then
    begin
       sqlSearchMaster.sql.Text := sqlSearchMaster.sql.Text +
                                   ' order by   ' + vAllPKs + ' DESC '; //[PT] não remova os espaços acima entre "by" e "tab"
                                                                                    //[EN] do not remove the spaces above between "by" and "tab"
//       sqlSearchMaster.sql.Text := sqlSearchMaster.sql.Text +
//                                   ' order by   tab.' + Self.ed_PK.Text + ' DESC '; //[PT] não remova os espaços acima entre "by" e "tab"
//                                                                                    //[EN] do not remove the spaces above between "by" and "tab"

    end;
    CompCount := ComponentCount;
    for f := 0 to CompCount - 1 do
    begin
         if ( Components[f] is TUniDBGrid ) and ( Components[f].Name <> 'dbgExport' ) then //7.0.0.0 dbgexport
         begin
            if Components[f].Name <> 'dbgSearchCRUD' then
               bActions := dm_rc.rc_ActionBtnsRender( Self, TUniDBGrid( Components[f] ) ); // 6.0.0.0

            TUniDBGrid( Components[f] ).EnableLocking    := ( Pos( 'locked|', TUniDBGrid( Components[f] ).Hint ) > 0 ) ;
            bPaged := ( ( Pos( 'fieldmasks:', TUniDBGrid( Components[f] ).Hint ) > 0 ) and ( Pos( 'no-paged|', TUniDBGrid( Components[f] ).Hint ) = 0 ) )  ;

            if TUniDBGrid( Components[f] ).WebOptions.Paged <> bPaged then
               TUniDBGrid( Components[f] ).WebOptions.Paged := bPaged;

            if ( Pos( 'firstshow:', TUniDBGrid( Components[f] ).Hint ) > 0 ) then
            begin
               cTemp := Copy( TUniDBGrid( Components[f] ).Hint, Pos( 'firstshow:', TUniDBGrid( Components[f] ).Hint ) , 100 );
               cTemp := Copy( cTemp, 1, Pos( '|', cTemp ) - 1 );

               iFirstShow := StrToIntDef( ReturnNumbers( cTemp ), 0 );
            end;

            if ( Pos( 'fieldmasks:' , TUniDBGrid( Components[f] ).Hint ) = 0 ) then
               TUniDBGrid( Components[f] ).Hint := '[[' +
                                                   'fieldmasks:' +
                                                   'grid-resize|' +
                                                   varIIF( ( mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR = 'ON' ) and
                                                           {7.0.0.0}( ( pos( 'no-paged|', TUniDBGrid( Components[f] ).Hint ) = 0 ) and ( TUniDBGrid( Components[f] ).WebOptions.Paged ) ) and
                                                           ( pos( 'grid-paginator', TUniDBGrid( Components[f] ).Hint ) = 0 ), 'grid-paginator|', '' ) +
                                                   ']]' ;
            //8.4.0.0 no-paged ( tip from GILBERTO LOSS )
//            if ( not TUniDBGrid( Components[f] ).WebOptions.Paged ) or
//               ( pos( 'no-paged|', TUniDBGrid( Components[f] ).Hint ) > 0 )  then
//               TUniDBGrid( Components[f] ).Hint := StringReplace( TUniDBGrid( Components[f] ).Hint, 'grid-paginator', '', [rfReplaceAll] );
            if ( not TUniDBGrid( Components[f] ).WebOptions.Paged ) or
               ( pos( 'no-paged|', TUniDBGrid( Components[f] ).Hint ) > 0 )  then
            begin
               TUniDBGrid( Components[f] ).Hint := StringReplace( TUniDBGrid( Components[f] ).Hint, 'grid-paginator:center|', '', [rfReplaceAll] );
               TUniDBGrid( Components[f] ).Hint := StringReplace( TUniDBGrid( Components[f] ).Hint, 'grid-paginator:left|', '', [rfReplaceAll] );
               TUniDBGrid( Components[f] ).Hint := StringReplace( TUniDBGrid( Components[f] ).Hint, 'grid-paginator:right|', '', [rfReplaceAll] );
               TUniDBGrid( Components[f] ).Hint := StringReplace( TUniDBGrid( Components[f] ).Hint, 'grid-paginator|', '', [rfReplaceAll] );
            end;

            //[PT] existem uma série de situações no uso do forcefit no unidbgrid que reagem de maneira diferente
            //     tentei simular diversas situções com vários formulários para manter o resultado de maneira satisfatória.
            //     pode haver alguma situação que gere um efeito inesperado.
            //[EN] there are a number of situations when using forcefit in unidbgrid that react differently
            //     I tried to simulate different situations with various forms to keep the result in a satisfactory way.
            //     there may be some situation that generates an unexpected effect.
            if ( TUniDBGrid( Components[f] ).DataSource <> nil ) and ( TUniDBGrid( Components[f] ).DataSource.DataSet <> nil ) then
            begin
              bBool := TUniDBGrid( Components[f] ).DataSource.DataSet is TFDMemTable;
              if not bBool then
                 bBool := Pos( '_actionCol', TFDQuery( TUniDBGrid( Components[f] ).DataSource.DataSet ).SQL.Text ) > 0 ;
              if ( ( Pos( 'grid-noforcefit', TUniDBGrid( Components[f] ).Hint ) = 0 ) and
                   ( bBool ) ) or
                   ( ( Pos( 'grid-forcefit', TUniDBGrid( Components[f] ).Hint ) = 0 ) ) then
              begin
                   TUniDBGrid( Components[f] ).ForceFit := true;
              end;
            end;
            if ( Pos( 'grid-noforcefit', TUniDBGrid( Components[f] ).Hint ) > 0 ) then
               TUniDBGrid( Components[f] ).ForceFit := false;
         end;
    end;
    //[PT] pega o SQL de select para usar no cadastro( antes do coringa [grid] )
    //[EN] Gets the select SQL to use in the registration (before the wildcard [grid])
    sqlMaster.Close;
    sqlMaster.SQL.Text := Copy( sqlMaster.Sql.Text, 1, Pos( '[grid]' , sqlMaster.Sql.Text ) -1 );

    //8.1.0.0 analisar...ed_Where_Search.Text
//    if ed_Where_Search.Text <> '' then
//       sqlMaster.SQL.Text := sqlMaster.SQL.Text + ' And ' + ed_Where_Search.Text;

    sqlMaster.UpdateOptions.KeyFields := dm_rc.rc_GetPrimaryKey( lowercase( mm.varC_Table_Search ), true );//7.5.0.3 lowercase
    //8.4.0.0 table with many pk´s ?
    if Pos( ';', sqlMaster.UpdateOptions.KeyFields ) > 0 then
    begin

    end;


    //[PT] Carrega definicoes anteriores caso o cliente tenha mexido em alguma coluna...( future )
    //[EN] Loads previous definitions if the client has changed a column...(future)
    //dbgDados.Columns.Clear;
    if FileExists( mm.APP_PATH_CONTROL + 'delete_dbGrid_' + Trim( ed_Table_ItemSel.Text ) + '.cfg' ) then
    begin
       DeleteFile( mm.APP_PATH_CONTROL + 'delete_dbGrid_' + Trim( ed_Table_ItemSel.Text ) + '.cfg' );
       DeleteFile( mm.APP_PATH_CONTROL + 'dbGrid_' + Trim( ed_Table_ItemSel.Text ) + '.cfg' );
    end;

    //8.0.0.0
    cCodMaster := rc_GetHintAttr( '_codmaster:' , ed_CodMaster.Hint );
    i := StrToIntDef( cCodMaster, 0 );
    if i = 0 then
    begin
       //[PT] contar quantos campos tem pra ativar ou nao o FORCEFIT.
       //      FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
       //[EN] count how many fields there are to activate FORCEFIT or not.
       //      FORCEFIT works best with few fields, but doesn't work well when LOCKED is active
       //8.0.0.0 in analisis....
       //dm_rc.rc_DBGridUpdateAll( Self , false, false, false );
    end;
end;

procedure TfrmBaseCRUD.UniFrameDestroy(Sender: TObject);
begin
  inherited;
  dm_rc.rc_CloseQuerys( Self , False, False );
end;

procedure TfrmBaseCRUD.UniFrameReady(Sender: TObject);
var
   i : integer;
   cCodMaster : string; //8.0.0.0
begin
  inherited;
   //7.3.0.0 search custom
   if ( bModelSearchCustom ) then
      paSearchFiltersCustom.Width := varIIF( ( mm.varB_Mobile_Screen_Portrait ) , mm.varI_ScreenWidth -14, 326 );
   paSearchFiltersCustom.Left     := (paSearchFiltersCustom.Width ) * (-1);

   if ( not bModelCrud1 ) then
      paSearchFilters.Width := varIIF( ( mm.varB_Mobile_Screen_Portrait ) , mm.varI_ScreenWidth -14, 326 );

   paSearchFilters.Left               := (paSearchFilters.Width ) * (-1);

   labState.Left                      := labState.Parent.Left + labState.Parent.Width - labState.Width - 10;

   paSearchFilterPeriodSelect.Visible := ( not paSearchFilterPeriodSelect.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 1 );
   paSearchFilterDate.Visible         := ( not paSearchFilterDate.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 1 );
   paSearchFilterPeriod.Visible       := ( not paSearchFilterPeriod.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 1 );
   paSearchContent2.Visible           := not paSearchContent2.Visible;
   paSearchFilter2.Visible            := not paSearchFilter2.Visible;
   paSearchFilterAndOr.Visible        := not paSearchFilterAndOr.Visible;

   labTitleSearch.Top                 := 10;
   paSearchFilter1.Top                := 49;
   paSearchContent1.Top               := paSearchFilter1.Top + paSearchFilter1.Height;// 169;

   paSearchFilterAndOr.Top            := paSearchContent1.Top + paSearchContent1.Height;
   paSearchFilter2.Top                := paSearchFilterAndOr.Top + paSearchFilterAndOr.Height;
   paSearchContent2.Top               := paSearchFilter2.Top + paSearchFilter2.Height;

   paSearchFilterPeriod.Top           := paSearchContent2.Top + paSearchContent2.Height;
   paSearchFilterDate.Top             := paSearchFilterPeriod.Top + paSearchFilterPeriod.Height;
   paSearchFilterPeriodSelect.Top     := paSearchFilterDate.Top + paSearchFilterDate.Height;

   if paSearchFilterPeriod.Visible then
      paSearchBtn.Top := paSearchFilterPeriodSelect.Top + paSearchFilterPeriodSelect.Height + 12
   else
   if paSearchContent2.Visible then
      paSearchBtn.Top := paSearchContent2.Top + paSearchContent2.Height + 12
   else
      paSearchBtn.Top := paBaseRegSearch.Top + paSearchFilters.Top + UniScrollBox1.Top + paSearchContent1.Top + paSearchContent1.Height + 12;

    // in development
    rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );

    dbgSearchCRUD.Grouping.Enabled := False;

    Self.ed_FormOrigin.Text      := mm.varC_FormSource_Search ;

    if ( Self.Tag = 1 ) then
    begin
       btnSearchCRUDClick( self );
       btnNewReg.Click;
    end
    else
    // EXIBIÇÃO / EDIÇÃO DINÂMICA DE REGISTRO  /   DISPLAY / DYNAMIC REGISTRATION EDITION
    //( Requested by GUS from Italy )
    //
    // este trecho de código está relacionado com a abertura/edição dinâmica de formulários/frames
    // this code snippet is related to opening / editing dynamics of forms / frames
    //
    // Ex: MainForm.rc_AddFormFrameInTab( nil, '', 'clientes', '' , false, false, 569, true );
    //
    // Assumi como padrão que o primeiro campo de pesquisa definido deverá ser o campo usado para efetuar a pesquisa dinâmica, ou seja,
    // se vamos pesquisar pelo CODIGO DO CLIENTE( por exemplo ) deve existir uma opção de pesquisa pelo CODIGO DO CLIENTE no ON CREATE do CADASTRO DE CLIENTES.
    //
    // I assumed ( by default ) that the first defined search field should be the field used to perform the dynamic search, that is,
    // if we are going to search for the CUSTOMER CODE (for example) there must be an option to search for the CUSTOMER CODE in the ON CREATE of the CUSTOMER REGISTRATION.
    //
    begin
       //8.0.0.0
       cCodMaster := rc_GetHintAttr( '_codmaster:' , ed_CodMaster.Hint );
       i := StrToIntDef( cCodMaster, 0 );
       if i <> 0 then
       begin
            cbxSearchCRUDField1.ItemIndex := 0;

            edSearchCRUD1.Text := IntToStr( i );
            btnSearchCRUDClick( btnSearchCRUD );
            case ed_CodMaster.Tag of
                 //-1 : dbgSearchCRUDDblClick( dbgSearchCRUD );
                 -2 : btnEditRegClick( btnEditReg );
                 //-3 : btnNewRegClick( btnNewReg );
                 -3 : dbgSearchCRUDDblClick( dbgSearchCRUD );
            end;

            edSearchCRUD1.Text := '';
       end
       else
       begin
          mm.varI_Temp1 := 0;
          btnSearchCRUDClick( btnSearchCRUD );
          //[PT] contar quantos campos tem pra ativar ou nao o FORCEFIT.
          //      FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
          //[EN] count how many fields there are to activate FORCEFIT or not.
          //      FORCEFIT works best with few fields, but doesn't work well when LOCKED is active
          dm_rc.rc_DBGridUpdateAll( Self , false, false, true);
       end;
    end;
end;
//8.4.0.0
procedure TfrmBaseCRUD.btnCancelRegClick(Sender: TObject);
var
   CompCount,iPk, I, F : integer;
   cWhere, cPkFields,cCodMaster,cOldStatus : string;//, cOldPK : string;//8.4.0.0

   bError : boolean;
begin
  inherited;

  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  cOldStatus := ed_Table_Status.Text;
  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';
  ed_OldPKValue.Text := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString;//8.4.0.3
  //8.4.0.0 pk composta
//  if strTokenCount( vPkFields, ';' ) > 1 then
//     cPkFields := vPkFields
//  else
//     cPkFields := Self.ed_PK.Text + ';';
//
//  iPk := 0;
//  while Pos( ';', cPkFields ) > 0  do
//  begin
//     inc(iPk);
//     cTemp := Copy( cPkFields, 1, Pos( ';', cPkFields ) -1 );
//     //aOldPKValues[i] := sqlMaster.FieldByName( Self.ed_PK.Text ).AsVariant;
//     aOldPKFields[iPk]    := cTemp;
//     aOldPKValues[iPk]    := sqlMaster.FieldByName( cTemp ).AsVariant;
//     aOldPKDataTypes[iPk] := sqlMaster.FieldByName( cTemp ).DataType;
//     cPkFields            := StringReplace( cPkFields, cTemp + ';', '', [rfReplaceAll] );
//  end;

  rc_ClearValidation( self ); // 6.0.0.0
  // fechar todas as querys abertas | close all open queries
  try
     CompCount := Self.ComponentCount;
     for i := 0 to CompCount - 1 do
     begin
       f := 0;
       if Self.Components[I] is TFDQuery then
       begin
          if TFDQuery( Self.Components[I] ).Name <> 'sqlSearchMaster' then
          begin
             TFDQuery( Self.Components[I] ).Cancel;
             f := 1;
          end;
       end
       else
       if Self.Components[I] is TDataSource then
       begin
          if ( TDataSource( Self.Components[I] ).DataSet.Name <> 'sqlSearchMaster' ) and
             ( TDataSource( Self.Components[I] ).DataSet.IsLinkedTo( TDataSource( Self.Components[I] ) ) ) then
          begin
             TDataSource( Self.Components[I] ).DataSet.Cancel;
             f := 1;
          end;
       end;

       if ( bSaveMasterPK ) and ( f = 1 ) and ( TDataSource( Self.Components[I] ).DataSet.Name = 'sqlMaster' ) then
       begin
           if ( cOldStatus = 'I' ) then
           begin
              //8.4.0.0 pk composta ( analisar isso em tab. q nao tem DELETE CASCADE definidas no banco )
              //dm_rc.rc_DeleteFKTables( ed_Table_ItemSel.Text, ed_PK.Text, cOldPK );

              //if not dm_rc.rc_DeleteRecord( ed_Table_ItemSel.Text, ' where ' + ed_PK.Text + ' = ' + cOldPK ) then
              cWhere := rc_GetPKWhereStr( vPkFields, sqlMaster );
              bError := not dm_rc.rc_DeleteRecord( ed_Table_ItemSel.Text, cWhere ) ;
              if bError then
              begin
                   dm_rc.rc_ShowError( mm.MSG_CONTACT_SUPPORT + sLineBreak + sLineBreak +
                                       mm.varC_LastErrorMsg );
              end;
//              cWhere := ' where ';
//              While iPk > 0 do
//              begin
//                 //fieldname
//                 cWhere := cWhere + aOldPKFields[iPk] + ' = ';
//                 //datatype
//                 case aOldPKDataTypes[iPk] of
//                   ftInteger, ftSmallint, ftWord, ftLargeint:
//                     cWhere := cWhere + aOldPKValues[iPk];//pDataSetValues.FieldByName(vField).AsInteger;
//
//                   ftFloat, ftCurrency, ftBCD:
//                     cWhere := cWhere + aOldPKValues[iPk];//pDataSetValues.FieldByName(vField).AsFloat;
//
//                   ftString, ftWideString:
//                     cWhere := cWhere + aOldPKValues[iPk];//pDataSetValues.FieldByName(vField).AsString;
//
//                   ftDate, ftDateTime, ftTimeStamp:
//                     cWhere := cWhere + DateTimeToStr( rc_RemoveMiliseconds( VarToDateTime( aOldPKValues[iPk] ) ) )//rc_RemoveMiliseconds(pDataSetValues.FieldByName(vField).AsDateTime);
//
//                   else
//                     raise Exception.Create('Data type not suported for field: ' + aOldPKFields[iPk]);
//
//                 end;
//
//                 Dec( iPk );
//                 if iPk > 0 then
//                    cwhere := cWhere + ',' ;
//              end;

//              bError := not dm_rc.rc_DeleteRecord( ed_Table_ItemSel.Text, cWhere ) ;
//              //if not dm_rc.rc_DeleteRecord( ed_Table_ItemSel.Text, ' where ' + ed_PK.Text + ' = ' + cOldPK ) then
//              if bError then
//              begin
//                   dm_rc.rc_ShowError( mm.MSG_CONTACT_SUPPORT + sLineBreak + sLineBreak +
//                                       mm.varC_LastErrorMsg );
//              end;
           end;
       end;
     end;
     except on e:exception do
            begin
               dm_rc.rc_ShowError( mm.MSG_BUGERROR_CLOSE_QUERY );
            end;
  end;
  //8.0.0.0
  cCodMaster := rc_GetHintAttr( '_codmaster:' , ed_CodMaster.Hint );
  //[PT] Efetuando o cancel da página em com um FRAMECRUD em execucao, o código após o "inherited" pode gerar access violation com "sqlmaster"
  //[EN] When cancel a page with FRAMECRUD running, the code after "inherited" may generate an access violation with "sqlmaster"
  if ( mm.oPgGeneral <> nil ) and ( ( Self.Tag = 1 ) or ( ed_CodMaster.Tag > 0 ) or ( StrToIntDef( cCodMaster, 0 ) > 0 ) ) then
  begin
     if Pos( 'frame-as-modal', Self.Hint ) = 0 then
     begin
         mm.oPgGeneral.ActivePage.Close;
     end;
  end
  else
  begin
     pgBaseCadControl.ActivePage := tabSearch;
     if ( StrToIntDef( cCodMaster, 0 ) > 0 ) then//8.0.0.0
     begin
         if iCurrentPage <> -1 then
         begin
            UniSession.AddJS( dbgSearchCRUD.JSName+'.store.loadPage(' + iCurrentPage.ToString + ');')
         end
         else
            btnSearchCRUDClick( self );
     end
     else
     begin
        rc_DefaultTitleForm;
     end;
  end;
end;
//8.4.0.0
procedure TfrmBaseCRUD.rc_CloseQuerys;
var
   CompCount,I : integer;
begin
     CompCount := Self.ComponentCount;
     for i := 0 to CompCount - 1 do
     begin
       if Self.Components[I] is TFDQuery then
       begin
          if TFDQuery( Self.Components[I] ).Name <> 'sqlSearchMaster' then
          begin
             TFDQuery(Self.Components[I]).Cancel;
             TFDQuery(Self.Components[I]).Close;
          end;
       end
       else
       if Self.Components[I] is TFDMemTable then
       begin
          TFDMemTable(Self.Components[I]).Close;
       end
       else
       if Self.Components[I] is TDataSource then
       begin
          if TDataSource( Self.Components[I] ).DataSet <> nil then
             if TDataSource( Self.Components[I] ).DataSet.Name <> 'sqlSearchMaster' then
             begin
                TDataSource(Self.Components[I]).DataSet.Cancel;
                TDataSource(Self.Components[I]).DataSet.Close;
             end;
       end;
     end;
end;

procedure TfrmBaseCRUD.rc_DefaultTitleForm;
var
   i : integer;
begin
     i := Pos( ' [ID:', labTitleForm.Caption );
     if ( i > 0 ) and ( Pos( 'caption-id', labTitleForm.Hint ) > 0 ) then
     begin
        labTitleForm.Caption := Copy ( labTitleForm.Caption, 1, i-1 );
        labTitleForm.hint := rc_SetHintAttr( '', 'caption-dots-default:', labTitleForm.hint );
        labTitleForm.hint := StringReplace( labTitleForm.hint, 'caption-dots-default:', '', [rfReplaceAll] );
     end;
end;

procedure TfrmBaseCRUD.rc_DeleteFKs;
begin
  dm_rc.sqlDelete.SQL.Text := format( dm_rc.rc_GetSQL( mm.CONFIG_DATABASE , 'fk_tables' ) , [ trim( ed_Table_ItemSel.Text ) ] );

  if dm_rc.sqlDelete.SQL.Text = '' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_WARNING, Format( mm.MSG_BUGERROR_INCOMPATIBLE_SGBD, ['fk_table'] ) , 'warning');
  end
  else
  begin
     dm_rc.rc_OpenQuery( dm_rc.sqlDelete );

     while not dm_rc.sqlDelete.Eof do
     begin
          mm.varC_SQL_GENERIC := ' delete from ' + dm_rc.rc_DBSchema + dm_rc.sqlDelete.FieldByName( 'table_name' ).AsString + ' ' + //6.1.0.0
                                 ' where ' + dm_rc.sqlDelete.FieldByName( 'field_name' ).AsString + ' = ' +
                                             sqlSearchMaster.FieldByName( ed_PK.Text ).AsString;

          mm.varC_LastErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                                                         mm.varC_SQL_GENERIC,
                                                         [] );
          if mm.varC_LastErrorMsg <> '' then
          begin
             dm_rc.rc_ShowError( mm.MSG_CONTACT_SUPPORT + sLineBreak + sLineBreak +
                                 mm.MSG_BUGERROR_FOREIGN_KEY_DELETE + sLineBreak + sLineBreak +
                                 mm.varC_LastErrorMsg );
             dm_rc.sqlDelete.close;
             Abort;

          end;

          dm_rc.sqlDelete.Next;
     end;
  end;
end;
//8.0.0.0
procedure TfrmBaseCRUD.rc_RemoveFirstShowZero;
begin
     //[PT] remover um possível "firstshow:0" para acionar o "state-" adequadamente...
     //[EN] remove a possible "firstshow:0" to trigger "state-" properly...
     if ( mm.CONFIG_DATABASE = 'SQLSERVER' ) then
        sqlSearchMaster.SQL.Text := StringReplace( sqlSearchMaster.SQL.Text, 'SELECT Top 0', 'SELECT ', [rfReplaceAll] )
     else
     if ( mm.CONFIG_DATABASE = 'ORACLE' ) then
        sqlSearchMaster.SQL.Text := StringReplace( sqlSearchMaster.SQL.Text, 'WHERE ((1=0)) and ((', 'WHERE ((', [rfReplaceAll] )
     else
     if ( mm.CONFIG_DATABASE = 'MYSQL' ) or ( mm.CONFIG_DATABASE = 'PGSQL' ) or ( mm.CONFIG_DATABASE = 'SQLITE' ) then
        sqlSearchMaster.SQL.Text := StringReplace( sqlSearchMaster.SQL.Text, ' LIMIT 0 ;', '', [rfReplaceAll] )
     else
     if ( mm.CONFIG_DATABASE = 'FIREBIRD' ) then
        sqlSearchMaster.SQL.Text := StringReplace( sqlSearchMaster.SQL.Text, ' ROWS 0 ;', '', [rfReplaceAll] );
end;

procedure TfrmBaseCRUD.rc_UpdateLayout;
var
   cBtnIco_Search,
   cBtnIco_Insert,
   cBtnIco_Edit,
   cBtnIco_Cancel,
   cBtnIco_Delete,
   cBtnIco_Save,
   cBtnIco_Options,
   cBtnIco_Search_Cls,
   cBtnIco_Insert_Cls,
   cBtnIco_Edit_Cls,
   cBtnIco_Cancel_Cls,
   cBtnIco_Delete_Cls,
   cBtnIco_Save_Cls,
   cBtnIco_Options_Cls,
   cBtnCls, cIcoCls : string;
   x : integer;
begin
   case mm.varLT_Lang of

        ltpt_BR, ltpt_PT : begin
                    labNotFound_dbgSearchCRUD.Caption   := 'Pesquisa Não Encontrada';
                    cBTN_SEARCH_CAPTION                 := 'Pesquisa';
                    cBTN_NEW_CAPTION                    := 'Novo';
                    cBTN_EDIT_CAPTION                   := 'Edita';
                    cBTN_DEL_CAPTION                    := 'Exclui';
                    cBTN_SAVE_CAPTION                   := 'Salva';
                    cBTN_CANCEL_CAPTION                 := 'Cancela';
                    cBTN_OPTIONS_CAPTION                := 'Opções';

                    cLAB_TitleSearch_CAPTION            := 'Pesquisar Registro(s)';
                    cLAB_C1_CAPTION                     := 'Campo de pesquisa';
                    cLAB_C2_CAPTION                     := 'Campo de pesquisa';
                    cLAB_P1_CAPTION                     := 'Operador';
                    cLAB_P2_CAPTION                     := 'Operador';
                    cLAB_V1_CAPTION                     := 'Conteúdo da Pesquisa';
                    cLAB_V2_CAPTION                     := 'Conteúdo da Pesquisa';
                  end;
        lten_US, lten_GB   : begin
                    labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                    cBTN_SEARCH_CAPTION                 := 'Search';
                    cBTN_NEW_CAPTION                    := 'New';
                    cBTN_EDIT_CAPTION                   := 'Edit';
                    cBTN_DEL_CAPTION                    := 'Delete';
                    cBTN_SAVE_CAPTION                   := 'Saves';
                    cBTN_CANCEL_CAPTION                 := 'Cancel';
                    cBTN_OPTIONS_CAPTION                := 'Options';

                    cLAB_TitleSearch_CAPTION            := 'Search Record(s)';
                    cLAB_C1_CAPTION := 'Search Field';
                    cLAB_C2_CAPTION := 'Search Field';
                    cLAB_P1_CAPTION := 'Operator';
                    cLAB_P2_CAPTION := 'Operator';
                    cLAB_V1_CAPTION := 'Search Content';
                    cLAB_V2_CAPTION := 'Search Content';
                  end;
        ltes_ES   : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'Búsqueda no encontrada';;
                     cBTN_SEARCH_CAPTION                 := 'Buscar';
                     cBTN_NEW_CAPTION                    := 'Nuevo';
                     cBTN_EDIT_CAPTION                   := 'Editar';
                     cBTN_DEL_CAPTION                    := 'Elimina';
                     cBTN_SAVE_CAPTION                   := 'Guardar';
                     cBTN_CANCEL_CAPTION                 := 'Cancelar';
                     cBTN_OPTIONS_CAPTION                := 'Opciones';

                     cLAB_TitleSearch_CAPTION            := 'Buscar registro(s)';
                     cLAB_C1_CAPTION                     := 'Campo de búsqueda';
                     cLAB_C2_CAPTION                     := 'Campo de búsqueda';
                     cLAB_P1_CAPTION                     := 'Operador';
                     cLAB_P2_CAPTION                     := 'Operador';
                     cLAB_V1_CAPTION                     := 'Contenido de la encuesta';
                     cLAB_V2_CAPTION                     := 'Contenido de la encuesta';
                  end;
        ltfr_FR   : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';

                     cLAB_TitleSearch_CAPTION            := 'Recherche d''enregistrement(s)';
                     cLAB_C1_CAPTION := 'Champ de recherche';
                     cLAB_C2_CAPTION := 'Champ de recherche';
                     cLAB_P1_CAPTION := 'Opérateur';
                     cLAB_P2_CAPTION := 'Opérateur';
                     cLAB_V1_CAPTION := 'Contenu de l''enquête''';
                     cLAB_V2_CAPTION := 'Contenu de l''enquête''';
                  end;
        ltde_DE   : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';

                     cLAB_TitleSearch_CAPTION            := 'Aufzeichnung(en) suchen';
                     cLAB_C1_CAPTION                     := 'Suchfeld';
                     cLAB_C2_CAPTION                     := 'Suchfeld';
                     cLAB_P1_CAPTION                     := 'Operator';
                     cLAB_P2_CAPTION                     := 'Operator';
                     cLAB_V1_CAPTION                     := 'Umfrageinhalt';
                     cLAB_V2_CAPTION                     := 'Umfrageinhalt';
                  end;
        // 6.0.0.0 ( thanks to ANDREA CAMBARAU )
        ltit_IT   : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'Nessun record trovato';
                     cBTN_SEARCH_CAPTION                 := 'Ricerca';
                     cBTN_NEW_CAPTION                    := 'Nuovo';
                     cBTN_EDIT_CAPTION                   := 'Modifica';
                     cBTN_DEL_CAPTION                    := 'Elimina';
                     cBTN_SAVE_CAPTION                   := 'Salva';
                     cBTN_CANCEL_CAPTION                 := 'Annulla';
                     cBTN_OPTIONS_CAPTION                := 'Opzioni';

                     cLAB_TitleSearch_CAPTION            := 'Ricerca record';
                     cLAB_C1_CAPTION                     := 'Campo di ricerca';
                     cLAB_C2_CAPTION                     := 'Campo di ricerca';
                     cLAB_P1_CAPTION                     := 'Operatore';
                     cLAB_P2_CAPTION                     := 'Operatore';
                     cLAB_V1_CAPTION                     := 'Contenuto del sondaggio';
                     cLAB_V2_CAPTION                     := 'Contenuto del sondaggio';
                  end;
        lttr_TR    : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';

                     cLAB_TitleSearch_CAPTION            := 'Kayıt(lar)ı Ara';
                     cLAB_C1_CAPTION                     := 'Arama Alanı';
                     cLAB_C2_CAPTION                     := 'Arama Alanı';
                     cLAB_P1_CAPTION                     := 'Operatör';
                     cLAB_P2_CAPTION                     := 'Operatör';
                     cLAB_V1_CAPTION                     := 'Anket İçeriği';
                     cLAB_V2_CAPTION                     := 'Anket İçeriği';
                  end;
        ltru_RU    : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';

                     cLAB_TitleSearch_CAPTION            := 'Search Record(s)';
                     cLAB_C1_CAPTION := 'Search Field';
                     cLAB_C2_CAPTION := 'Search Field';
                     cLAB_P1_CAPTION := 'Operator';
                     cLAB_P2_CAPTION := 'Operator';
                     cLAB_V1_CAPTION := 'Search Content';
                     cLAB_V2_CAPTION := 'Search Content';
                  end;
        ltzn_CH : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';

                     cLAB_TitleSearch_CAPTION            := 'Search Record(s)';
                     cLAB_C1_CAPTION := 'Search Field';
                     cLAB_C2_CAPTION := 'Search Field';
                     cLAB_P1_CAPTION := 'Operator';
                     cLAB_P2_CAPTION := 'Operator';
                     cLAB_V1_CAPTION := 'Search Content';
                     cLAB_V2_CAPTION := 'Search Content';
                  end;
        ltin_ID : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';

                     cLAB_TitleSearch_CAPTION            := 'Search Record(s)';
                     cLAB_C1_CAPTION := 'Search Field';
                     cLAB_C2_CAPTION := 'Search Field';
                     cLAB_P1_CAPTION := 'Operator';
                     cLAB_P2_CAPTION := 'Operator';
                     cLAB_V1_CAPTION := 'Search Content';
                     cLAB_V2_CAPTION := 'Search Content';
                  end;
        ltth_TH : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';

                     cLAB_TitleSearch_CAPTION            := 'Search Record(s)';
                     cLAB_C1_CAPTION := 'Search Field';
                     cLAB_C2_CAPTION := 'Search Field';
                     cLAB_P1_CAPTION := 'Operator';
                     cLAB_P2_CAPTION := 'Operator';
                     cLAB_V1_CAPTION := 'Search Content';
                     cLAB_V2_CAPTION := 'Search Content';
                  end;
        lthi_IN : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';

                     cLAB_TitleSearch_CAPTION            := 'Search Record(s)';
                     cLAB_C1_CAPTION := 'Search Field';
                     cLAB_C2_CAPTION := 'Search Field';
                     cLAB_P1_CAPTION := 'Operator';
                     cLAB_P2_CAPTION := 'Operator';
                     cLAB_V1_CAPTION := 'Search Content';
                     cLAB_V2_CAPTION := 'Search Content';
                  end;
        ltar_SA : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'لا توجد سجلات';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';

                     cLAB_TitleSearch_CAPTION            := 'Search Record(s)';
                     cLAB_C1_CAPTION := 'Search Field';
                     cLAB_C2_CAPTION := 'Search Field';
                     cLAB_P1_CAPTION := 'Operator';
                     cLAB_P2_CAPTION := 'Operator';
                     cLAB_V1_CAPTION := 'Search Content';
                     cLAB_V2_CAPTION := 'Search Content';
                  end;
   end;
   labTitleSearch.Caption := cLAB_TitleSearch_CAPTION;
   labTitleSearchCustom.Caption := cLAB_TitleSearch_CAPTION; //7.3.0.0
   UniLabelc1.Caption := cLAB_C1_CAPTION;
   UniLabelc2.Caption := cLAB_C2_CAPTION;
   UniLabelp1.Caption := cLAB_P1_CAPTION;
   UniLabelp2.Caption := cLAB_P2_CAPTION;
   UniLabelv1.Caption := cLAB_V1_CAPTION;
   UniLabelv2.Caption := cLAB_V2_CAPTION;

   cbxSearchCRUDPeriod.Clear;
   cbxSearchCRUDPeriod.Items.Add( '' );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_TODAY );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_YESTERDAY );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_TOMORROW );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_AFTER_TOMORROW );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_WEEK );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_LAST_WEEK );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_NEXT_WEEK );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_MONTH );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_LAST_MONTH );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_NEXT_MONTH );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_BIMESTER );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_QUARTER );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_SEMESTER );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_YEAR );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_LAST_YEAR );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_ALL );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY );

   // translate messages
   cbxSearchCRUDOpt1.Items.Clear;
   case mm.varLT_Lang of

        ltpt_BR, ltpt_PT : begin
                    cbxSearchCRUDOpt1.Items.Add( 'Maior que' );
                    cbxSearchCRUDOpt1.Items.Add( 'Menor que' );
                    cbxSearchCRUDOpt1.Items.Add( 'Maior ou igual a' );
                    cbxSearchCRUDOpt1.Items.Add( 'Menor ou igual a' );
                    cbxSearchCRUDOpt1.Items.Add( 'Começa com' );
                    cbxSearchCRUDOpt1.Items.Add( 'Termina com' );
                    cbxSearchCRUDOpt1.Items.Add( 'Contém' );
                    cbxSearchCRUDOpt1.Items.Add( 'Igual a' );
                  end;
        lten_US, lten_GB   : begin
                    cbxSearchCRUDOpt1.Items.Add( 'Bigger then' );
                    cbxSearchCRUDOpt1.Items.Add( 'Less than' );
                    cbxSearchCRUDOpt1.Items.Add( 'Greater or equal to' );
                    cbxSearchCRUDOpt1.Items.Add( 'less than or equal to' );
                    cbxSearchCRUDOpt1.Items.Add( 'Starts with' );
                    cbxSearchCRUDOpt1.Items.Add( 'ends with' );
                    cbxSearchCRUDOpt1.Items.Add( 'contains' );
                    cbxSearchCRUDOpt1.Items.Add( 'Equal to' );
                  end;
        ltes_ES   : begin
                       cbxSearchCRUDOpt1.Items.Add( 'Más grande que' );
                       cbxSearchCRUDOpt1.Items.Add( 'Menos que' );
                       cbxSearchCRUDOpt1.Items.Add( 'Mayor o igual a' );
                       cbxSearchCRUDOpt1.Items.Add( 'Menos que o igual a' );
                       cbxSearchCRUDOpt1.Items.Add( 'Comienza con' );
                       cbxSearchCRUDOpt1.Items.Add( 'termina con' );
                       cbxSearchCRUDOpt1.Items.Add( 'contiene' );
                       cbxSearchCRUDOpt1.Items.Add( 'Igual a' );
                  end;
        ltfr_FR   : begin
                       cbxSearchCRUDOpt1.Items.Add( 'Plus grand alors' );
                       cbxSearchCRUDOpt1.Items.Add( 'Moins que' );
                       cbxSearchCRUDOpt1.Items.Add( 'Supérieur ou égal à' );
                       cbxSearchCRUDOpt1.Items.Add( 'inférieur ou égal à' );
                       cbxSearchCRUDOpt1.Items.Add( 'Commence avec' );
                       cbxSearchCRUDOpt1.Items.Add( 'se termine par' );
                       cbxSearchCRUDOpt1.Items.Add( 'contient' );
                       cbxSearchCRUDOpt1.Items.Add( 'Égal à' );
                  end;
        ltde_DE   : begin
                       cbxSearchCRUDOpt1.Items.Add( 'Größer dann' );
                       cbxSearchCRUDOpt1.Items.Add( 'Weniger als' );
                       cbxSearchCRUDOpt1.Items.Add( 'Größer oder gleich' );
                       cbxSearchCRUDOpt1.Items.Add( 'weniger als oder gleich' );
                       cbxSearchCRUDOpt1.Items.Add( 'Beginnt mit' );
                       cbxSearchCRUDOpt1.Items.Add( 'endet mit' );
                       cbxSearchCRUDOpt1.Items.Add( 'enthält' );
                       cbxSearchCRUDOpt1.Items.Add( 'Gleicht' );
                    end;
        // 6.0.0.0 ( thanks to ANDREA CAMBARAU )
        ltit_IT   : begin
                       cbxSearchCRUDOpt1.Items.Add( 'Maggiore di' );
                       cbxSearchCRUDOpt1.Items.Add( 'Minore di' );
                       cbxSearchCRUDOpt1.Items.Add( 'Maggiore o uguale a' );
                       cbxSearchCRUDOpt1.Items.Add( 'Minore o uguale a' );
                       cbxSearchCRUDOpt1.Items.Add( 'Inizia con' );
                       cbxSearchCRUDOpt1.Items.Add( 'Finisce con' );
                       cbxSearchCRUDOpt1.Items.Add( 'Contiene' );
                       cbxSearchCRUDOpt1.Items.Add( 'Uguale a' );
                    end;
        lttr_TR    : begin
                      cbxSearchCRUDOpt1.Items.Add( 'O zaman daha büyük' );
                      cbxSearchCRUDOpt1.Items.Add( 'Daha az' );
                      cbxSearchCRUDOpt1.Items.Add( 'Daha büyük veya eşit' );
                      cbxSearchCRUDOpt1.Items.Add( 'küçük veya eşit' );
                      cbxSearchCRUDOpt1.Items.Add( 'İle başlar' );
                      cbxSearchCRUDOpt1.Items.Add( 'ile biter' );
                      cbxSearchCRUDOpt1.Items.Add( 'içerir' );
                      cbxSearchCRUDOpt1.Items.Add( 'Eşittir' );
                  end;
        ltru_RU    : begin
                       cbxSearchCRUDOpt1.Items.Add( 'Тогда больше' );
                       cbxSearchCRUDOpt1.Items.Add( 'Меньше, чем' );
                       cbxSearchCRUDOpt1.Items.Add( 'Больше или равно' );
                       cbxSearchCRUDOpt1.Items.Add( 'меньше или равно' );
                       cbxSearchCRUDOpt1.Items.Add( 'Начинается с' );
                       cbxSearchCRUDOpt1.Items.Add( 'заканчивается' );
                       cbxSearchCRUDOpt1.Items.Add( 'содержит' );
                       cbxSearchCRUDOpt1.Items.Add( 'Равно' );
                    end;
        ltzn_CH : begin
                    cbxSearchCRUDOpt1.Items.Add( 'Bigger then' );
                    cbxSearchCRUDOpt1.Items.Add( 'Less than' );
                    cbxSearchCRUDOpt1.Items.Add( 'Greater or equal to' );
                    cbxSearchCRUDOpt1.Items.Add( 'less than or equal to' );
                    cbxSearchCRUDOpt1.Items.Add( 'Starts with' );
                    cbxSearchCRUDOpt1.Items.Add( 'ends with' );
                    cbxSearchCRUDOpt1.Items.Add( 'contains' );
                    cbxSearchCRUDOpt1.Items.Add( 'Equal to' );
                  end;
        ltin_ID : begin
                    cbxSearchCRUDOpt1.Items.Add( 'Bigger then' );
                    cbxSearchCRUDOpt1.Items.Add( 'Less than' );
                    cbxSearchCRUDOpt1.Items.Add( 'Greater or equal to' );
                    cbxSearchCRUDOpt1.Items.Add( 'less than or equal to' );
                    cbxSearchCRUDOpt1.Items.Add( 'Starts with' );
                    cbxSearchCRUDOpt1.Items.Add( 'ends with' );
                    cbxSearchCRUDOpt1.Items.Add( 'contains' );
                    cbxSearchCRUDOpt1.Items.Add( 'Equal to' );
                  end;
        ltth_TH : begin
                    cbxSearchCRUDOpt1.Items.Add( 'Bigger then' );
                    cbxSearchCRUDOpt1.Items.Add( 'Less than' );
                    cbxSearchCRUDOpt1.Items.Add( 'Greater or equal to' );
                    cbxSearchCRUDOpt1.Items.Add( 'less than or equal to' );
                    cbxSearchCRUDOpt1.Items.Add( 'Starts with' );
                    cbxSearchCRUDOpt1.Items.Add( 'ends with' );
                    cbxSearchCRUDOpt1.Items.Add( 'contains' );
                    cbxSearchCRUDOpt1.Items.Add( 'Equal to' );
                  end;
        lthi_IN : begin
                    cbxSearchCRUDOpt1.Items.Add( 'Bigger then' );
                    cbxSearchCRUDOpt1.Items.Add( 'Less than' );
                    cbxSearchCRUDOpt1.Items.Add( 'Greater or equal to' );
                    cbxSearchCRUDOpt1.Items.Add( 'less than or equal to' );
                    cbxSearchCRUDOpt1.Items.Add( 'Starts with' );
                    cbxSearchCRUDOpt1.Items.Add( 'ends with' );
                    cbxSearchCRUDOpt1.Items.Add( 'contains' );
                    cbxSearchCRUDOpt1.Items.Add( 'Equal to' );
                  end;
        ltar_SA : begin
                    cbxSearchCRUDOpt1.Items.Add( 'Bigger then' );
                    cbxSearchCRUDOpt1.Items.Add( 'Less than' );
                    cbxSearchCRUDOpt1.Items.Add( 'Greater or equal to' );
                    cbxSearchCRUDOpt1.Items.Add( 'less than or equal to' );
                    cbxSearchCRUDOpt1.Items.Add( 'Starts with' );
                    cbxSearchCRUDOpt1.Items.Add( 'ends with' );
                    cbxSearchCRUDOpt1.Items.Add( 'contains' );
                    cbxSearchCRUDOpt1.Items.Add( 'Equal to' );
                  end;
   end;
   cbxSearchCRUDOpt2.Items.Text := cbxSearchCRUDOpt1.Items.Text;
   cbxSearchCRUDOpt2.ItemIndex  := 7;
   cbxAndOr.Caption := varIIF( cbxAndOr.Checked, mm.MSG_SEARCH_CONDICIONAL_AND, mm.MSG_SEARCH_CONDICIONAL_OR ) + '...';
   //7.3.0.0 search custom
   If labSwtAndOr.Tag = 1 then
   begin
      labAndOrSearch.Hint := rc_SetHintAttr( ' AND ', '_swt_txt:', labAndOrSearch.hint );
      labAndOrSearch.Caption := mm.MSG_SEARCH_CONDICIONAL_AND;
   end
   else
   begin
      labAndOrSearch.Hint := rc_SetHintAttr( ' OR ', '_swt_txt:', labAndOrSearch.hint );
      labAndOrSearch.Caption := mm.MSG_SEARCH_CONDICIONAL_OR;
   end;

   //bModelSearchCustom := Pos( 'model-search:custom', dbgSearchCRUD.Hint ) > 0 ; //7.5.0.1 search custom
   bModelCrud0 := Pos( 'model-crud:0', dbgSearchCRUD.Hint ) > 0; //
   bModelCrud1 := Pos( 'model-crud:1', dbgSearchCRUD.Hint ) > 0;
   bModelCrud2 := Pos( 'model-crud:2', dbgSearchCRUD.Hint ) > 0;
   bModelCrud3 := Pos( 'model-crud:3', dbgSearchCRUD.Hint ) > 0;
   bModelCrud4 := Pos( 'model-crud:4', dbgSearchCRUD.Hint ) > 0; // 6.0.0.0
   //7.5.0.1 search custom
   bModelSearchCustom := ( not ( bModelCrud1 or bModelCrud3 or bModelCrud4 ) )  and
                         ( Pos( 'model-search:custom', dbgSearchCRUD.Hint ) > 0 );
   //8.2.0.0
   //[PT] model-search:column está sendo desabilitado, infelizmente, pois
   //     foram encontradas inconsistências que não puderam ser contornadas
   //     de forma prática. Dessa forma quem precisar do recurso deve usar
   //     a forma nativa do UNIGUI.
   //[EN] model-search:column is being disabled, unfortunately, because
   //     inconsistencies were found that could not be worked around
   //     practically. Therefore, anyone who needs this feature should use
   //     the native UNIGUI format.
   bModelSearchColumn := false;//( Pos( 'model-search:column', dbgSearchCRUD.Hint ) > 0 );
//   If bModelSearchColumn then
//      rc_AddCssClass( dbgSearchCRUD, 'rc-grid-search-column' )
//   else
//      rc_RemoveCssClass( dbgSearchCRUD, 'rc-grid-search-column' );

   bSearchComplete := ( bModelCrud3 ) and ( Pos( '(search:full)', dbgSearchCRUD.Hint ) > 0 );
   bActions    := bModelCrud3;
   //  bug fix
   if Pos ('info-state:off', dbgSearchCRUD.Hint ) > 0 then
      labState.hint := StringReplace( labState.Hint, 'hide:mobile-v', '', [rfReplaceAll] );
   //
   if Pos( 'btns-cls:', dbgSearchCRUD.Hint ) > 0 then
   begin
      cBtnCls := Copy( dbgSearchCRUD.Hint, Pos( 'btns-cls:', dbgSearchCRUD.Hint ) + 9 );
      cBtnCls := Trim( Copy( cBtnCls, 1, Pos( ')', cBtnCls ) -1 ) );
      if Pos( ' ', cBtnCls ) > 0 then
      begin
         cIcoCls := Copy( cBtnCls, Pos( ' ', cBtnCls ) + 1 );
         cBtnCls := Copy( cBtnCls, 1, Pos( ' ', cBtnCls ) -1 );
         if Pos( 'btns-cls-ico:', cIcoCls ) > 0 then
            cIcoCls := Copy( cIcoCls, Pos( 'btns-cls-ico:', cIcoCls ) + 13 )
         else
            cBtnCls := cBtnCls + ' ' + cIcoCls;
      end;
   end
   else
   begin
      cBtnCls := '';
      cIcoCls := '';
   end;
   //
   cBtnIco_Search  := rc_GetHintAttr( 'btns-ico-search:' , dbgSearchCRUD.Hint, true, true );
   cBtnIco_Insert  := rc_GetHintAttr( 'btns-ico-insert:' , dbgSearchCRUD.Hint, true, true );
   cBtnIco_Edit    := rc_GetHintAttr( 'btns-ico-edit:'   , dbgSearchCRUD.Hint, true, true );
   cBtnIco_Cancel  := rc_GetHintAttr( 'btns-ico-cancel:' , dbgSearchCRUD.Hint, true, true );
   cBtnIco_Delete  := rc_GetHintAttr( 'btns-ico-delete:' , dbgSearchCRUD.Hint, true, true );
   cBtnIco_Save    := rc_GetHintAttr( 'btns-ico-save:'   , dbgSearchCRUD.Hint, true, true );
   cBtnIco_Options := rc_GetHintAttr( 'btns-ico-options:', dbgSearchCRUD.Hint, true, true );
   if Pos( ' ', cBtnIco_Search )  > 0 then cBtnIco_Search_Cls  := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Search, true, true );
   if Pos( ' ', cBtnIco_Insert )  > 0 then cBtnIco_Insert_Cls  := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Insert, true, true );
   if Pos( ' ', cBtnIco_Edit )    > 0 then cBtnIco_Edit_Cls    := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Edit, true, true );
   if Pos( ' ', cBtnIco_Cancel )  > 0 then cBtnIco_Cancel_Cls  := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Cancel, true, true );
   if Pos( ' ', cBtnIco_Delete )  > 0 then cBtnIco_Delete_Cls  := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Delete, true, true );
   if Pos( ' ', cBtnIco_Save )    > 0 then cBtnIco_Save_Cls    := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Save, true, true );
   if Pos( ' ', cBtnIco_Options ) > 0 then cBtnIco_Options_Cls := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Options, true, true );
   cBtnIco_Search  := Copy( cBtnIco_Search, 1, Pos( ' ', cBtnIco_Search ) - 1 );
   cBtnIco_Insert  := Copy( cBtnIco_Insert, 1, Pos( ' ', cBtnIco_Insert ) - 1 );
   cBtnIco_Edit    := Copy( cBtnIco_Edit, 1, Pos( ' ', cBtnIco_Edit ) - 1 );
   cBtnIco_Cancel  := Copy( cBtnIco_Cancel, 1, Pos( ' ', cBtnIco_Cancel ) - 1 );
   cBtnIco_Delete  := Copy( cBtnIco_Delete, 1, Pos( ' ', cBtnIco_Delete ) - 1 );
   cBtnIco_Save    := Copy( cBtnIco_Save, 1, Pos( ' ', cBtnIco_Save ) - 1 );
   cBtnIco_Options := Copy( cBtnIco_Options, 1, Pos( ' ', cBtnIco_Options ) - 1 );

   Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
   paBaseTop.Color        := clWhite;
   paBaseButtons.Color    := clWhite;
   paBaseBackGround.Color := clWhite;
   paBaseTop.Align        := alTop;
   paBaseButtons.Align    := alLeft;
   pgBaseCadControl.Align := alClient;
   paBaseRegSearch.Align  := alClient;
   // 6.0.0.0
   If mm.varB_Mobile_Screen_Portrait then
   begin
      edQuickSearch.Width := 265 ;
      btnQuickSearch.Left := 272;
   end
   else
   begin
      edquicksearch.Width := 221;
      btnQuickSearch.Left := 228;
   end;
   paSearchFilters.Anchors       := [ akLeft, akTop ];        //
   paSearchFilters.Hint          := '[[scale:parent h:100%-top off:40]]'; //7.3.0.0
   paSearchFiltersCustom.Anchors := [ akLeft, akTop ];        //7.3.0.0 search custom
   paSearchFiltersCustom.Hint    := '[[scale:parent h:100%-top off:40]]'; //7.3.0.0 search custom
   if ( bModelCrud3 ) and ( mm.varB_Mobile_Screen ) and ( not bActions ) then //
   begin
      paBaseButtons.Align := alTop;

      paP.Height          := 36;
      paP.top             := 0;
      paP.Left            := 0;
      paP.Width           := 36;

      paNAE.Height        := 36;
      paNAE.top           := 0;
      paNAE.Left          := paP.left + paP.Width + 15;
      paNAE.width         := 120;
        btnNewReg.Left    := 2;
        btnNewReg.Top     := 2;
        btnEditReg.Left   := btnNewReg.Left + btnNewReg.Width + 2;
        btnEditReg.Top    := 2;
        btnDeleteReg.Left := btnEditReg.Left + btnEditReg.Width + 2;
        btnDeleteReg.Top  := 2;

      paGC.Height         := 36;
      paGC.top            := 0;
      paGC.Left           := paNAE.left + paNAE.Width + 15;
      paGC.width          := 80;
        btnSaveReg.Left   := 2;
        btnSaveReg.Top    := 2;
        btnCancelReg.Left := btnSaveReg.Left + btnSaveReg.Width + 2;
        btnCancelReg.Top  := 2;

      paOF.Height         := 36;
      paOF.top            := 0;
      paOF.Left           := paGC.left + paGC.Width + 15;
      paOF.width          := 36;
        btnOptions.Left   := 2;
        btnOptions.Top    := 2;
   end
   else
   if ( bModelCrud2 ) or ( bModelCrud4 ) then // 6.0.0.0
   begin
      paBaseButtons.Parent := paBaseTopTitle;
      paBaseButtons.Height := 48; //37; // 6.0.0.0+
      paBaseButtons.Align  := alBottom;
      paBaseButtons.Margins.Left   := 8;
      paBaseButtons.Margins.Bottom := 8;
      paBaseButtons.Top    := edQuickSearch.Top;

      Self.Color           := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
      paBaseTop.Color      := clWhite;
      paBaseButtons.Color  := paBaseTopTitle.Color;
      paBaseButtons.Width  := paBaseTopTitle.Width;
      paP.Height          := 37;
      paP.AlignWithMargins := true;
      paP.Align           := alLeft;
      paP.top             := 0;
      paP.Left            := 0;
      paP.Width           := 105;

      paP.Hint :=
          '[['+
          'width:105 mobile-v-46 mobile-h-46|'+ //7.0.0.0 landscape
          //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o caption como em DESKTOP comente a configuração acima e descomente a inferior
          //[EN] if you want, in MOBILE HORIZONTAL, to display the caption as in DESKTOP comment the configuration above and uncomment the lower one
//          'width:105 mobile-v-46 mobile-h-105|'+
          ']]';
        btnSearch.Align     := alLeft;
        btnSearch.Caption   := cBTN_SEARCH_CAPTION;
        btnSearch.Width     := 95;
        btnSearch.Height    := 36;
        btnSearch.Font.Size := 10;

        btnSearch.Hint :=
            '[['+
            'cls:' + varIIF( cBtnCls = '', 'ButtonBlue', cBtnCls ) + ' |'+
            varIIF( cIcoCls = '', '', 'cls-ico:' + cIcoCls ) + ' |'+ //
            'ico:' + varIIF( cBtnIco_Search = '', 'fas-search', cBtnIco_Search ) + ' |'+ //   'ico:fas-search |'+
            'caption-hide:mobile|'+
            'width:95 mobile-v-32 mobile-h-32|'+ //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            ']]';
            //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o captio como em DESKTOP comente a configuração acima e descomente a inferior
            //[EN] if you want, in MOBILE HORIZONTAL, to display the captio as in DESKTOP comment the configuration above and uncomment the lower one
//            '[['+
//            'cls:' + varIIF( cBtnCls = '', 'ButtonBlue', cBtnCls ) + ' |'+
//            'ico:fas-search |'+
//            'caption-hide:mobile-v|'+
//            'width:95 mobile-v-32 mobile-h-95|'+
//            'append |' +
//            ']]';

      paNAE.AlignWithMargins := true;
      //paNAE.Margins.Right := 0; //6.0.0.0+
      paNAE.Height        := 36;
      paNAE.Align         := alLeft;
      paNAE.top           := 0;
      paNAE.Left          := paP.left + paP.Width + 10;//21 ;//6.0.0.0+
      paNAE.width         := 266; // 6.0.0.0

      paNAE.Hint :=
          '[['+
          'width:266 mobile-v-115 mobile-h-115|'+ //7.0.0.0 landscape
          //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o captio como em DESKTOP comente a configuração acima e descomente a inferior
          //[EN] if you want, in MOBILE HORIZONTAL, to display the captio as in DESKTOP comment the configuration above and uncomment the lower one
//          'width:220 mobile-v-115 mobile-h-220|'+
          ']]';
        btnNewReg.Margins.Bottom := 2;
        btnNewReg.Margins.Left   := 2;
        btnNewReg.Margins.Top    := 2;
        btnNewReg.Margins.Right  := 2;
        btnNewReg.Align     := alLeft;
        btnNewReg.Left      := 2;
        btnNewReg.Top       := 2;
        btnNewReg.Caption   := cBTN_NEW_CAPTION;
        btnNewReg.Width     := 85; // 6.0.0.0
        btnNewReg.Font.Size := 10;

        btnNewReg.Hint :=
            '[['+
            'cls:' + varIIF( cBtnCls = '', 'ButtonGreen', cBtnCls ) + ' |'+ //
            varIIF( cIcoCls = '', '', 'cls-ico:' + cIcoCls ) + ' |'+ //
            'ico:' + varIIF( cBtnIco_Insert = '', 'fas-plus', cBtnIco_Insert ) + ' |'+ //  'ico:fas-plus |'+
            'caption-hide:mobile|'+
            'width:85 mobile-v-32 mobile-h-32|'+ //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            ']]';
             //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o captio como em DESKTOP comente a configuração acima e descomente a inferior
             //[EN] if you want, in MOBILE HORIZONTAL, to display the captio as in DESKTOP comment the configuration above and uncomment the lower one
//            '[['+
//            'cls:' + varIIF( cBtnCls = '', 'ButtonBlue', cBtnCls ) + ' |'+
//            'ico:fas-plus |'+
//            'caption-hide:mobile-v|'+
//            'width:70 mobile-v-32 mobile-h-70|'+
//            'append |' +
//            ']]';

        btnEditReg.Align     := alLeft;
        btnEditReg.Left      := btnNewReg.Left + btnNewReg.Width + 2 ;
        btnEditReg.Top       := 2;
        btnEditReg.Caption   := cBTN_EDIT_CAPTION;
        btnEditReg.Width     := 85; // 6.0.0.0
        btnEditReg.Font.Size := 10;

        btnEditReg.Hint :=
            '[['+
            'cls:' + varIIF( cBtnCls = '', 'ButtonOrange', cBtnCls ) + ' |'+
            varIIF( cIcoCls = '', '', 'cls-ico:' + cIcoCls ) + ' |'+ //
            'ico:' + varIIF( cBtnIco_Edit = '', 'fas-pencil-alt', cBtnIco_Edit ) + ' |'+ //  ico:fas-pencil-alt|'+
            'caption-hide:mobile|'+
            'width:85 mobile-v-32 mobile-h-32|'+ //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            ']]';
             //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o captio como em DESKTOP comente a configuração acima e descomente a inferior
             //[EN] if you want, in MOBILE HORIZONTAL, to display the captio as in DESKTOP comment the configuration above and uncomment the lower one
//            '[['+
//            'cls:' + varIIF( cBtnCls = '', 'ButtonOrange', cBtnCls ) + ' |'+
//            'ico:fas-pencil-alt|'+
//            'caption-hide:mobile-v|'+
//            'width:70 mobile-v-32 mobile-h-70|'+ //...
//            'append |' +
//            ']]';

        btnDeleteReg.Align     := alLeft;
        btnDeleteReg.Left      := btnEditReg.Left + btnEditReg.Width + 2 ;
        btnDeleteReg.Top       := 2;
        btnDeleteReg.Caption   := cBTN_DEL_CAPTION;
        btnDeleteReg.Width     := 85; // 6.0.0.0
        btnDeleteReg.Font.Size := 10;

        btnDeleteReg.Hint :=
            '[['+
            'cls:' + varIIF( cBtnCls = '', 'ButtonRed', cBtnCls ) + ' |'+
            varIIF( cIcoCls = '', '', 'cls-ico:' + cIcoCls ) + ' |'+ //
            'ico:' + varIIF( cBtnIco_Delete = '', 'fas-trash-alt', cBtnIco_Delete ) + ' |'+ //  ico:fas-trash-alt |'+
            'caption-hide:mobile|'+
            'width:85 mobile-v-32 mobile-h-32|'+ //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            ']]';
            //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o captio como em DESKTOP comente a configuração acima e descomente a inferior
            //[EN] if you want, in MOBILE HORIZONTAL, to display the captio as in DESKTOP comment the configuration above and uncomment the lower one
//            '[['+
//            'cls:' + varIIF( cBtnCls = '', 'ButtonRed', cBtnCls ) + ' |'+
//            'ico:fas-trash-alt |'+
//            'caption-hide:mobile-v|'+
//            'width:70 mobile-v-32 mobile-h-70|'+ //...
//            'append |' +
//            ']]';

      paGC.AlignWithMargins := true;
      if mm.varB_Mobile_Screen then paGC.Margins.Left := 10; // 6.0.0.0+
      paGC.Height           := 36;
      paGC.Align            := alLeft;
      paGC.top              := 0;
      paGC.Left             := paNAE.left + paNAE.Width + 10;//21 ;//6.0.0.0+
      paGC.width            := 160;

      paGC.Hint :=
          '[['+
          'width:160 mobile-v-82 mobile-h-82|'+ //7.0.0.0 landscape
          //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o captio como em DESKTOP comente a configuração acima e descomente a inferior
          //[EN] if you want, in MOBILE HORIZONTAL, to display the captio as in DESKTOP comment the configuration above and uncomment the lower one
//          'width:160 mobile-v-82 mobile-h-160|'+
          ']]';
        btnSaveReg.Align  := alLeft;
        btnSaveReg.Left   := 2;
        btnSaveReg.Top    := 2;
        btnSaveReg.Caption   := cBTN_SAVE_CAPTION;
        if mm.varB_Mobile_Screen then
           btnSaveReg.Width     := 32//varIIF( mm.varB_Mobile_Screen_Portrait, 32, 75 );
        else
           btnSaveReg.Width     := 75;//7.0.0.0 landscape //varIIF( mm.varB_Mobile_Screen_Portrait, 32, 75 );
        btnSaveReg.Font.Size := 10;

        btnSaveReg.Hint :=
            '[['+
            'cls:' + varIIF( cBtnCls = '', 'ButtonGreen', cBtnCls ) + ' |'+
            varIIF( cIcoCls = '', '', 'cls-ico:' + cIcoCls ) + ' |'+ //
            'ico:' + varIIF( cBtnIco_Save = '', 'fas-check', cBtnIco_Save ) + ' |'+ //  ico:fas-check |'+
            'caption-hide:mobile|'+
            'width:75 mobile-v-32 mobile-h-32|'+ //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            ']]';
            //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o captio como em DESKTOP comente a configuração acima e descomente a inferior
            //[EN] if you want, in MOBILE HORIZONTAL, to display the captio as in DESKTOP comment the configuration above and uncomment the lower one
//            '[['+
//            'cls:' + varIIF( cBtnCls = '', 'ButtonGreen', cBtnCls ) + ' |'+
//            'ico:fas-check |'+
//            'caption-hide:mobile-v|'+
//            'width:75 mobile-v-32 mobile-h-75|'+
//            'append |' +
//            ']]';
        btnCancelReg.Align     := alLeft;
        btnCancelReg.Left      := btnSaveReg.Left + btnSaveReg.Width + 2;
        btnCancelReg.Top       := 2;
        btnCancelReg.Caption   := cBTN_CANCEL_CAPTION;
        if mm.varB_Mobile_Screen then
           btnCancelReg.Width     := 32 //7.0.0.0 landscape//varIIF( mm.varB_Mobile_Screen_Portrait, 32, 75 );
        else
           btnCancelReg.Width     := 75;//7.0.0.0 landscape//varIIF( mm.varB_Mobile_Screen_Portrait, 32, 75 );
        btnCancelReg.Font.Size := 10;

        btnCancelReg.Hint :=
            '[['+
            'cls:' + varIIF( cBtnCls = '', 'ButtonRed', cBtnCls ) + ' |'+
            varIIF( cIcoCls = '', '', 'cls-ico:' + cIcoCls ) + ' |'+ //
            'ico:' + varIIF( cBtnIco_Cancel = '', 'fas-times', cBtnIco_Cancel ) + ' |'+ //  ico:fas-times |'+
            'caption-hide:mobile|'+
            'width:75 mobile-v-32 mobile-h-32|'+ //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            ']]';
            //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o captio como em DESKTOP comente a configuração acima e descomente a inferior
            //[EN] if you want, in MOBILE HORIZONTAL, to display the captio as in DESKTOP comment the configuration above and uncomment the lower one
//            '[['+
//            'cls:' + varIIF( cBtnCls = '', 'ButtonRed', cBtnCls ) + ' |'+
//            'ico:fas-times |'+
//            'caption-hide:mobile-v|'+
//            'width:75 mobile-v-32 mobile-h-75|'+
//            'append |' +
//            ']]';
      paOF.AlignWithMargins := true;
      if mm.varB_Mobile_Screen then paOF.Margins.Left := 6; // 6.0.0.0+
      paOF.Height           := 36;
      paOF.Align            := alLeft;
      paOF.top              := 0;
      paOF.Left             := paGC.left + paGC.Width + 10;//21;//6.0.0.0+
      paOF.width            := 80;

      paOF.Hint :=
          '[['+
          'width:80 mobile-v-36 mobile-h-36|'+ //7.0.0.0 landscape
          //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o captio como em DESKTOP comente a configuração acima e descomente a inferior
          //[EN] if you want, in MOBILE HORIZONTAL, to display the captio as in DESKTOP comment the configuration above and uncomment the lower one
//          'width:80 mobile-v-36 mobile-h-80|'+
          ']]';
        btnOptions.Align  := alLeft;
        btnOptions.Left   := 2;
        btnOptions.Top    := 2;
        btnOptions.Caption   := cBTN_OPTIONS_CAPTION;
        btnOptions.Width     := 75;
        btnOptions.Font.Size := 10;
        //
        btnOptions.Hint :=
            '[['+
            'cls:' + varIIF( cBtnCls = '', 'ButtonGray', cBtnCls ) + ' |'+
            varIIF( cIcoCls = '', '', 'cls-ico:' + cIcoCls ) + ' |'+ //
            'ico:' + varIIF( cBtnIco_Options = '', 'fas-bars', cBtnIco_Options ) + ' |'+ //  ico:fas-bars |'+
            'caption-hide:mobile|'+
            'width:75 mobile-v-32 mobile-h-32|'+ //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            ']]';
            //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o captio como em DESKTOP comente a configuração acima e descomente a inferior
            //[EN] if you want, in MOBILE HORIZONTAL, to display the captio as in DESKTOP comment the configuration above and uncomment the lower one
//            '[['+
//            'cls:' + varIIF( cBtnCls = '', 'ButtonGray', cBtnCls ) + ' |'+
//            'ico:fas-bars |'+
//            'caption-hide:mobile-v|'+
//            'width:75 mobile-v-32 mobile-h-75|'+
//            'append |' +
//            ']]';
   end
   else
   if ( bModelCrud3 ) then //and ( not mm.varB_Mobile_Screen ) then
   begin
      if not bSearchComplete then
      begin
         rc_BringToFront( edQuickSearch );
         rc_BringToFront( btnQuickSearch );
      end;
      paBaseButtons.Parent := paBaseTopTitle;
      paBaseButtons.Height := 48; //37// 6.0.0.0+
      paBaseButtons.Align  := alBottom;
      paBaseButtons.Margins.Left   := 8;
      paBaseButtons.Margins.Bottom := 8;
      paBaseButtons.Top    := edQuickSearch.Top;
      Self.Color           := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
      paBaseTop.Color      := clWhite;
      paBaseButtons.Color  := paBaseTopTitle.Color;
      paBaseButtons.Width  := paBaseTopTitle.Width;

      if bSearchComplete then
      begin
         rc_BringToFront( paP );
         rc_BringToFront( paP );
      end;
      paP.Visible         := ( bSearchComplete ) ;
      paP.Height          := 37;
      paP.AlignWithMargins := true;
      paP.Align           := alLeft;
      paP.top             := 0;
      paP.Left            := 0;
      paP.Width           := varIIF( paP.Visible, 105, 0 );
      paP.Hint :=
          varIIF( not pap.Visible,
            '[[' +
            'width:0 mobile-v-0|' +
            ']]' ,
            '[[' +
            'width:105 mobile-v-46 mobile-h-46|' +  //7.0.0.0 landscape
            ']]' );
        btnSearch.Align     := alLeft;
        btnSearch.Caption   := cBTN_SEARCH_CAPTION;
        btnSearch.Width     := 95;
        btnSearch.Height    := 36;
        btnSearch.Font.Size := 10;
        btnSearch.Hint :=
            '[['+
            'cls:' + varIIF( cBtnCls = '', 'ButtonThemeCrud', cBtnCls ) + ' |'+
            varIIF( cIcoCls = '', '', 'cls-ico:' + cIcoCls ) + ' |'+ //
            'ico:' + varIIF( cBtnIco_Search = '', 'fas-search', cBtnIco_Search ) + ' |'+ //  ico:fas-search |'+
            'caption-hide:mobile-v|'+
            'width:95 mobile-v-32 mobile-h-32|' +  //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';

      paNAE.AlignWithMargins := true;
      paNAE.Margins.Right    := 8;
      paNAE.Height        := 36;
      paNAE.Align         := alRight;
      paNAE.top           := 0;
      paNAE.Left          := paP.left + paP.Width + 21 ;
      paNAE.width         := 74;
      paNAE.Hint :=
          '[['+
          'width:74 mobile-v-34 mobile-h-34|' +  //7.0.0.0 landscape
          ']]';
        btnNewReg.Margins.Bottom := 2;
        btnNewReg.Margins.Left   := 3;
        btnNewReg.Margins.Top   := 5;
        btnNewReg.Margins.Right := 3;
        btnNewReg.Align     := alRight;
        btnNewReg.Left      := 2;
        btnNewReg.Top       := 2;
        btnNewReg.Caption   := cBTN_NEW_CAPTION;
        btnNewReg.Width     := 85; // 6.0.0.0
        btnNewReg.Font.Size := 10;
        btnNewReg.Hint :=
            '[['+
            'cls:' + varIIF( cBtnCls = '', 'ButtonThemeCrud', cBtnCls ) + ' |'+
            varIIF( cIcoCls = '', '', 'cls-ico:' + cIcoCls ) + ' |'+ //
            'ico:' + varIIF( cBtnIco_Insert = '', 'fas-plus', cBtnIco_Insert ) + ' |'+ //  ico:fas-plus |'+
            'caption-hide:mobile-v|'+
            'width:70 mobile-v-32 mobile-h-32|' +  //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
        btnEditReg.Align     := alLeft;
        btnEditReg.Left      := btnNewReg.Left + btnNewReg.Width + 2 ;
        btnEditReg.Top       := 2;
        btnEditReg.Caption   := cBTN_EDIT_CAPTION;
        btnEditReg.Width     := 85; // 6.0.0.0
        btnEditReg.Font.Size := 10;

        btnDeleteReg.Align     := alLeft;
        btnDeleteReg.Left      := btnEditReg.Left + btnEditReg.Width + 2 ;
        btnDeleteReg.Top       := 2;
        btnDeleteReg.Caption   := cBTN_DEL_CAPTION;
        btnDeleteReg.Width     := 85; // 6.0.0.0
        btnDeleteReg.Font.Size := 10;

      paGC.AlignWithMargins := true;
      paGC.Height         := 36;
      paGC.Align          := alRight;
      paGC.top            := 0;
      paGC.width          := varIIF( mm.varB_Mobile_Screen_Portrait, 75, 160 );
      paGC.Hint :=
          '[['+
          'width:160 mobile-v-75 mobile-h-75|' +  //7.0.0.0 landscape
          ']]';
        btnSaveReg.Visible   := true;
        btnSaveReg.Align  := alLeft;
        btnSaveReg.Left   := 2;
        btnSaveReg.Top    := 2;
        btnSaveReg.Caption   := cBTN_SAVE_CAPTION;
        btnSaveReg.Width     := varIIF( mm.varB_Mobile_Screen_Portrait, 32, 75 );
        btnSaveReg.Font.Size := 10;
        btnSaveReg.Hint :=
            '[['+
            'cls:' + varIIF( cBtnCls = '', 'ButtonGreen', cBtnCls ) + ' |'+
            varIIF( cIcoCls = '', '', 'cls-ico:' + cIcoCls ) + ' |'+ //
            'ico:' + varIIF( cBtnIco_Save = '', 'fas-check', cBtnIco_Save ) + ' |'+ //  ico:fas-check |'+
            'caption-hide:mobile-v|'+
            'width:75 mobile-v-32 mobile-h-32|' +  //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
        btnCancelReg.Visible   := true;
        btnCancelReg.Align     := alLeft;
        btnCancelReg.Left      := btnSaveReg.Left + btnSaveReg.Width + 2;
        btnCancelReg.Top       := 2;
        btnCancelReg.Caption   := cBTN_CANCEL_CAPTION;
        btnCancelReg.Width     := varIIF( mm.varB_Mobile_Screen_Portrait, 32, 75 );
        btnCancelReg.Font.Size := 10;
        btnCancelReg.Hint :=
            '[['+
            'cls:' + varIIF( cBtnCls = '', 'ButtonRed', cBtnCls ) + ' |'+
            varIIF( cIcoCls = '', '', 'cls-ico:' + cIcoCls ) + ' |'+ //
            'ico:' + varIIF( cBtnIco_Cancel = '', 'fas-times', cBtnIco_Cancel ) + ' |'+ //  ico:fas-times |'+
            'caption-hide:mobile-v|'+
            'width:75 mobile-v-32 mobile-h-32|' +  //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
      paOF.AlignWithMargins := true;
      paOF.Height           := 36;
      paOF.Align            := alRight;
      paOF.top              := 0;
      paOF.width            := 0;
        btnOptions.Align  := alLeft;
        btnOptions.Left   := 2;
        btnOptions.Top    := 2;
        btnOptions.Caption   := cBTN_OPTIONS_CAPTION;
        btnOptions.Width     := 75;
        btnOptions.Font.Size := 10;
        btnOptions.Hint :=
            '[['+
            'cls:' + varIIF( cBtnCls = '', 'ButtonGray', cBtnCls ) + ' |'+
            varIIF( cIcoCls = '', '', 'cls-ico:' + cIcoCls ) + ' |'+ //
            'ico:' + varIIF( cBtnIco_Options = '', 'fas-bars', cBtnIco_Options ) + ' |'+ //  ico:fas-bars |'+
            'caption-hide:mobile-v|'+
            'width:75 mobile-v-32 mobile-h-32|' +  //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
   end
   else
   begin
      if ( mm.varB_Mobile_Screen ) and ( not bActions ) then
      begin
         paBaseButtons.Align := alTop;
         paBaseButtons.Height := 48; // 6.0.0.0+

         paP.Height          := 36;
         paP.top             := 0;
         paP.Left            := 0;
         paP.Width           := 36;

         paNAE.Height        := 36;
         paNAE.top           := 0;
         paNAE.Left          := paP.left + paP.Width + 15;
         paNAE.width         := 120;
           btnNewReg.Left    := 2;
           btnNewReg.Top     := 2;
           btnEditReg.Left   := btnNewReg.Left + btnNewReg.Width + 2;
           btnEditReg.Top    := 2;
           btnDeleteReg.Left := btnEditReg.Left + btnEditReg.Width + 2;
           btnDeleteReg.Top  := 2;

         paGC.Height         := 36;
         paGC.top            := 0;
         paGC.Left           := paNAE.left + paNAE.Width + 10; //15// 6.0.0.0+
         paGC.width          := 80;
           btnSaveReg.Left   := 2;
           btnSaveReg.Top    := 2;
           btnCancelReg.Left := btnSaveReg.Left + btnSaveReg.Width + 2;
           btnCancelReg.Top  := 2;

         paOF.Height         := 36;
         paOF.top            := 0;
         paOF.Left           := paGC.left + paGC.Width + 10; //15// 6.0.0.0+
         paOF.width          := 36;
           btnOptions.Left   := 2;
           btnOptions.Top    := 2;
      end
      else
      begin
         paBaseButtons.Align := alLeft;
         paP.Align           := alTop;
         paP.Margins.Left    := 0;
         paP.AlignWithMargins:= true;
         paNAE.Align         := alTop;
         paNAE.Margins.Left    := 0;
         paNAE.Margins.Top    := 6;
         paNAE.AlignWithMargins:= true;
         paGC.Align          := alTop;
         paGC.Margins.Left    := 0;
         paGC.Margins.Top    := 6;
         paGC.AlignWithMargins:= true;
         paOF.Margins.Left    := 0;
         paOF.Margins.Top    := 6;
         paOF.Align          := alTop;
         paOF.AlignWithMargins:= true;
         //
         paBaseButtons.Parent              := paBaseBackGround;
         paBaseButtons.Margins.Left        := 4;
         paBaseButtons.Margins.Bottom      := 3;
         if bModelCrud1 then
         begin
              paBaseButtons.Align := alNone;
              paBaseButtons.Width := 0;
         end;

         paP.Width              := 37;
         paP.Height             := 40;
           btnSearch.Caption      := '';
           btnSearch.Width        := 33;
           btnSearch.Height       := 36;
           btnSearch.Font.Size    := 14;
         paNAE.Width         := 37;
         paNAE.Height        := 120;
           btnNewReg.Margins.Bottom := 2;
           btnNewReg.Margins.Left   := 2;
           btnNewReg.Margins.Top    := 2;
           btnNewReg.Margins.Right  := 2;
           btnNewReg.Align     := alTop; // alNone;
           btnNewReg.Caption   := '';
           btnNewReg.Width     := 33;
           btnNewReg.Height    := btnSearch.Height;
           btnNewReg.Font.Size := 14;

           btnEditReg.Align     := alTop; // alNone;
           btnEditReg.Caption   := '';
           btnEditReg.Width     := 33;
           btnEditReg.Font.Size := 14;
           btnEditReg.Height    := btnSearch.Height;

           btnDeleteReg.Align     := alTop; // alNone;
           btnDeleteReg.Caption   := '';
           btnDeleteReg.Width     := 33;
           btnDeleteReg.Height    := btnSearch.Height;
           btnDeleteReg.Font.Size := 14;
         paGC.Width           := 37;
         paGC.Height          := 77;
           btnSaveReg.Align     := alNone;
           btnSaveReg.Caption   := '';
           btnSaveReg.Width     := 33;
           btnSaveReg.Height    := 32;//btnSearch.Height;
           btnSaveReg.Font.Size := 14;

           btnCancelReg.Align     := alNone;
           btnCancelReg.Caption   := '';
           btnCancelReg.Width     := 33;
           btnCancelReg.Height    := 32;//btnSearch.Height;
           btnCancelReg.Font.Size := 14;
         paOF.Width           := 37;
         paOf.Height          := 40;
           btnOptions.Caption   := '';
           btnOptions.Width     := 33;
           btnOptions.Height    := btnSearch.Height;
           btnOptions.Font.Size := 14;
      end;
      //
      if cBtnCls = 'colorful' then
      begin
         btnSearch.Hint :=
             '[['+
             'cls:ButtonBlue |'+
             'ico:' + varIIF( cBtnIco_Search = '', 'fas-search', cBtnIco_Search ) + ' |'+ //                ico:fas-search |'+
             //'cls-ico:font-black |'+
             //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
             ']]';
      end
      else
      begin
         if cBtnIco_Search_Cls <> '' then cIcoCls := cBtnIco_Search_Cls;
         btnSearch.Hint :=
             '[['+
             'cls:' + varIIF( cBtnCls = '', 'ButtonWhite', cBtnCls ) + ' |'+
             'ico:' + varIIF( cBtnIco_Search = '', 'fas-search', cBtnIco_Search ) + ' |'+ //                ico:fas-search |'+
             'cls-ico:' + varIIF( cIcoCls = '', 'font-black', cIcoCls ) + ' |'+ //  //'cls-ico:font-black |'+
             //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
             ']]';
      end;
      //
      if cBtnCls = 'colorful' then
      begin
         btnNewReg.Hint :=
             '[['+
             'cls:ButtonGreen |'+
             'ico:' + varIIF( cBtnIco_Insert = '', 'fas-plus', cBtnIco_Insert ) + ' |'+ //  ico:fas-plus |'+
             //'cls-ico:font-black |'+
             //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
             ']]';
      end
      else
      begin
         if cBtnIco_Insert_Cls <> '' then cIcoCls := cBtnIco_Insert_Cls;
         btnNewReg.Hint :=
             '[['+
             'cls:' + varIIF( cBtnCls = '', 'ButtonWhite', cBtnCls ) + ' |'+
             'ico:' + varIIF( cBtnIco_Insert = '', 'fas-plus', cBtnIco_Insert ) + ' |'+ //  ico:fas-plus |'+
             'cls-ico:' + varIIF( cIcoCls = '', 'font-black', cIcoCls ) + ' |'+ //  //'cls-ico:font-black |'+
             //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
             ']]';
      end;
      //
      if cBtnCls = 'colorful' then
      begin
         btnEditReg.Hint :=
             '[['+
             'cls:ButtonOrange |'+
             'ico:' + varIIF( cBtnIco_Edit = '', 'fas-pencil-alt', cBtnIco_Edit ) + ' |'+ //  ico:fas-pencil-alt |'+
             //'cls-ico:font-black |'+
             //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
             ']]';
      end
      else
      begin
         if cBtnIco_Edit_Cls <> '' then cIcoCls := cBtnIco_Edit_Cls;
         btnEditReg.Hint :=
             '[['+
             'cls:' + varIIF( cBtnCls = '', 'ButtonWhite', cBtnCls ) + ' |'+
             'ico:' + varIIF( cBtnIco_Edit = '', 'fas-pencil-alt', cBtnIco_Edit ) + ' |'+ //  ico:fas-pencil-alt |'+
             'cls-ico:' + varIIF( cIcoCls = '', 'font-black', cIcoCls ) + ' |'+ //  //'cls-ico:font-black |'+
             //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
             ']]';
      end;
      //
      if cBtnCls = 'colorful' then
      begin
         btnDeleteReg.Hint :=
             '[['+
             'cls:ButtonRed |'+
             'ico:' + varIIF( cBtnIco_Delete = '', 'fas-trash-alt', cBtnIco_Delete ) + ' |'+ //  ico:fas-trash-alt |'+
             //'cls-ico:font-black |'+
             //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
             ']]';
      end
      else
      begin
         if cBtnIco_Delete_Cls <> '' then cIcoCls := cBtnIco_Delete_Cls;
         btnDeleteReg.Hint :=
             '[['+
             'cls:' + varIIF( cBtnCls = '', 'ButtonWhite', cBtnCls ) + ' |'+
             'ico:' + varIIF( cBtnIco_Delete = '', 'fas-trash-alt', cBtnIco_Delete ) + ' |'+ //  ico:fas-trash-alt |'+
             'cls-ico:' + varIIF( cIcoCls = '', 'font-black', cIcoCls ) + ' |'+ //  //'cls-ico:font-black |'+
             //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
             ']]';
      end;
      //
      if cBtnCls = 'colorful' then
      begin
         btnSaveReg.Hint :=
             '[['+
             'cls:ButtonGreen |'+
             'ico:' + varIIF( cBtnIco_Save = '', 'fas-check', cBtnIco_Save ) + ' |'+ //  ico:fas-check |'+
             //'cls-ico:font-black |'+
             //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
             ']]';
      end
      else
      begin
         if cBtnIco_Save_Cls <> '' then cIcoCls := cBtnIco_Save_Cls;
         btnSaveReg.Hint :=
             '[['+
             'cls:' + varIIF( cBtnCls = '', 'ButtonWhite', cBtnCls ) + ' |'+
             'ico:' + varIIF( cBtnIco_Save = '', 'fas-check', cBtnIco_Save ) + ' |'+ //  ico:fas-check |'+
             'cls-ico:' + varIIF( cIcoCls = '', 'font-black', cIcoCls ) + ' |'+ //  //'cls-ico:font-black |'+
             //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
             ']]';
      end;
      //
      if cBtnCls = 'colorful' then
      begin
         btnCancelReg.Hint :=
             '[['+
             'cls:ButtonRed |'+
             'ico:' + varIIF( cBtnIco_Cancel = '', 'fas-times', cBtnIco_Cancel ) + ' |'+ //  ico:fas-times |'+
             //'cls-ico:font-black |'+
             //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
             ']]';
      end
      else
      begin
         if cBtnIco_Cancel_Cls <> '' then cIcoCls := cBtnIco_Cancel_Cls;
         btnCancelReg.Hint :=
             '[['+
             'cls:' + varIIF( cBtnCls = '', 'ButtonWhite', cBtnCls ) + ' |'+
             'ico:' + varIIF( cBtnIco_Cancel = '', 'fas-times', cBtnIco_Cancel ) + ' |'+ //  ico:fas-times |'+
             'cls-ico:' + varIIF( cIcoCls = '', 'font-black', cIcoCls ) + ' |'+ //  //'cls-ico:font-black |'+
             //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
             ']]';
      end;
      //
      if cBtnCls = 'colorful' then
      begin
         btnOptions.Hint :=
             '[['+
             'cls:ButtonGray |'+
             'ico:' + varIIF( cBtnIco_Options = '', 'fas-bars', cBtnIco_Options ) + ' |'+ //  ico:fas-bars |'+
             //'cls-ico:font-black |'+
             //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
             ']]';
      end
      else
      begin
         if cBtnIco_Options_Cls <> '' then cIcoCls := cBtnIco_Options_Cls;
         btnOptions.Hint :=
             '[['+
             'cls:' + varIIF( cBtnCls = '', 'ButtonWhite', cBtnCls ) + ' |'+
             'ico:' + varIIF( cBtnIco_Options = '', 'fas-bars', cBtnIco_Options ) + ' |'+ //  ico:fas-bars |'+
             'cls-ico:' + varIIF( cIcoCls = '', 'font-black', cIcoCls ) + ' |'+ //  //'cls-ico:font-black |'+
             //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
             ']]';
      end;
   end;
   //8.0.0.0
   if bModelSearchColumn then rc_ObjectVisible( paP, false, true );

   paNotFound_dbgSearchCRUD.Hint :=
      '[['+
      'center:paBaseRegSearch xy |'+
      'state-visible:empty-true ds:dsSearchMaster|'+
      ']]' ;
end;
//8.0.0.0 search custom
procedure TfrmBaseCRUD.SearchCRUD;
var
  cCodMaster, //8.0.0.0
  cFieldStr,
  cFieldToSearch, cAliasToSearch,
  cFieldToSearch2,cAliasToSearch2,
  cQueryToSearch, cSql, cSqlTemp, cAndOr, cWhereAnd: String;
//  iCurrPage, i,
  iPosition: integer;
  iCurrPage: integer;
  //7.5.0.3
  oEdtFilter : TUniEdit;
  i : integer;
begin
  SearchPanelClose; //7.5.0.0

  rc_DefaultTitleForm;

  cbxSearchCRUDField1_Fields.ItemIndex    := cbxSearchCRUDField1.ItemIndex;
  cbxSearchCRUDField2_Fields.ItemIndex    := cbxSearchCRUDField2.ItemIndex;
  cbxSearchCRUDFieldDate_Fields.ItemIndex := cbxSearchCRUDFieldDate.ItemIndex;
  //7.4.0.0
  //btnSearchCRUDCustomClearClick(self);//7.5.0.1
  //[PT] SABER O TIPO DO CAMPO para criticar o tipo da OPERACAO pode ser um ALIAS, entao tem que pegar a tabela equivalente
  //      mas se for o alias padrão( TAB. ) pega a tabela ATUAL
  //[EN] KNOWING THE TYPE OF THE FIELD to criticize the type of the OPERATION can be an ALIAS, so you have to get the equivalent table
  //      but if it is the default alias (TAB. ) it takes the CURRENT table
  cFieldToSearch := AnsiLowerCase(cbxSearchCRUDField1_Fields.Text);

  if ( cFieldToSearch <> '' ) and ( trim(edSearchCRUD1.Text) <> '' ) then
  begin
     cAliasToSearch := dm_rc.rc_ExtractFieldNameFromSearchItem( cFieldToSearch, true );
     cFieldToSearch := dm_rc.rc_ExtractFieldNameFromSearchItem( cFieldToSearch );

     mm.varC_FieldType := '';

     // a query tem q ter sido carregada ao entrar na tela | the query must have been loaded when entering the screen
     if not sqlSearchMaster.active then
     begin
        //7.0.0.0 dynamic show/edit ( thanks for tip Mr. Javier from SPAIN )
        cSql := '';
        //8.0.0.0
        cCodMaster := rc_GetHintAttr( '_codmaster:' , ed_CodMaster.Hint );
        iPosition := StrToIntDef( cCodMaster, 0 );
        if iPosition <> 0 then
        begin
             cSql := sqlSearchMaster.SQL.Text;
             //8.0.0.0 flavio 17.07.25
             sqlSearchMaster.SQL.Text := ' select ' + cFieldToSearch +
                                         ' from ' + ed_Table_ItemSel.Text + ' tab' +
                                         ' where ' + cFieldToSearch + '=' + cCodMaster +//8.1.0.1 thanks Josauro ed_CodMaster.Hint +
                                         ' order by ' + cFieldToSearch ;
        end;
        if not dm_rc.rc_OpenQuery( sqlSearchMaster ) then
        begin
           sqlSearchMaster.close;
           Abort;
        end;
     end;
     //8.1.0.0 thanks for bugtracker Mr. Josauro
     if sqlSearchMaster.FindField( cAliasToSearch ) <> nil then
        iPosition := sqlSearchMaster.FieldByName( cAliasToSearch ).Index
     else
        iPosition := sqlSearchMaster.FieldByName( dm_rc.rc_ExtractFieldNameFromSearchItem( cFieldToSearch, true ) ).Index;

     if ( DataTypeIsNumber( sqlSearchMaster.Fields[ iPosition ].DataType ) ) or
        ( DataTypeIsDateTime( sqlSearchMaster.Fields[ iPosition ].DataType ) ) then
     begin
          if ( cbxSearchCRUDOpt1.ItemIndex >= 4 ) and ( cbxSearchCRUDOpt1.ItemIndex <= 6 ) and
             ( StrToIntDef( ReturnNumbers( edSearchCRUD1.Text ), 0 ) > 0  ) then
          begin
               cbxSearchCRUDOpt1.ItemIndex := 7; //IGUAL a
          end
          else
          if StrToIntDef( ReturnNumbers( edSearchCRUD1.Text ), 0 ) = 0 then
          begin
               dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC );
               Exit;
          end;
     end
     else
     if DataTypeIsString( sqlSearchMaster.Fields[ iPosition ].DataType ) then
     begin
          if cbxSearchCRUDOpt1.ItemIndex <= 3 then
          begin
               dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR );
               Exit;
          end;
     end
     else
     begin
          cbxSearchCRUDOpt1.ItemIndex := 7;
     end;
  end;

  cFieldToSearch2 := LowerCase(cbxSearchCRUDField2_Fields.Text);

  if ( cFieldToSearch2 <> '' ) and ( trim(edSearchCRUD2.Text) <> '' ) then
  begin
     cAliasToSearch2 := dm_rc.rc_ExtractFieldNameFromSearchItem( cFieldToSearch2, true );
     cFieldToSearch2 := dm_rc.rc_ExtractFieldNameFromSearchItem( cFieldToSearch2 );

     mm.varC_FieldType := '';

     iPosition := sqlSearchMaster.FieldByName( cAliasToSearch2 ).Index;

     if ( DataTypeIsNumber( sqlSearchMaster.Fields[ iPosition ].DataType ) ) or
        ( DataTypeIsDateTime( sqlSearchMaster.Fields[ iPosition ].DataType ) ) then
     begin
          if ( cbxSearchCRUDOpt2.ItemIndex >= 4 ) and ( cbxSearchCRUDOpt2.ItemIndex <= 6 ) and
             ( StrToIntDef( ReturnNumbers( edSearchCRUD2.Text ), 0 ) > 0  ) then
          begin
               cbxSearchCRUDOpt2.ItemIndex := 7; //IGUAL a
          end
          else
          if StrToIntDef( ReturnNumbers( edSearchCRUD2.Text ), 0 ) = 0 then
          begin
               dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC );
               Exit;
          end;
     end
     else
     if DataTypeIsString( sqlSearchMaster.Fields[ iPosition ].DataType ) then
     begin
          if cbxSearchCRUDOpt2.ItemIndex <= 3 then
          begin
               dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR );
               Exit;
          end;
     end
     else
     begin
          cbxSearchCRUDOpt2.ItemIndex := 7;
     end;
  end;

  cWhereAnd := '';

  if not cbxAndOr.Checked then
     cAndOr := ' OR '
  else
     cAndOr := ' AND ';
  //6.1.0.4
  if edSearchCRUD1.Text <> '' then
  begin
    cFieldStr := edSearchCRUD1.Text;
    if ( DataTypeIsDateTime( sqlSearchMaster.Fields[ iPosition ].DataType ) ) then
       cFieldStr := ( FormatDateTime( mm.APP_SQL_DATE_FORMAT, StrToDateDef( edSearchCRUD1.Text, 0 ) ) )
    else
    if ( cbxSearchCRUDOpt1.ItemIndex >=4 ) and ( cbxSearchCRUDOpt1.ItemIndex <=6 ) then
    begin
       if ( mm.CONFIG_DATABASE = 'PGSQL' ) then
          cFieldToSearch := 'full_like(' + cFieldToSearch + ')' + ' iLIKE '
       else
          cFieldToSearch := cFieldToSearch + ' LIKE ';
    end;
    case cbxSearchCRUDOpt1.ItemIndex of
      00 : cQueryToSearch := '((  ((' + cFieldToSearch + ' > ' + QuotedStr(cFieldStr) + ')) )) ';
      01 : cQueryToSearch := '((  ((' + cFieldToSearch + ' < ' + QuotedStr(cFieldStr) + ')) )) ';
      02 : cQueryToSearch := '((  ((' + cFieldToSearch + ' >= ' + QuotedStr(cFieldStr) + ')) )) ';
      03 : cQueryToSearch := '((  ((' + cFieldToSearch + ' <= ' + QuotedStr(cFieldStr) + ')) )) ';
      04 : cQueryToSearch := '((  ((' + cFieldToSearch + QuotedStr(cFieldStr + '%') + ')) )) ';
      05 : cQueryToSearch := '((  ((' + cFieldToSearch + QuotedStr('%' + cFieldStr) + ')) )) ';
      06 : cQueryToSearch := '((  ((' + cFieldToSearch + QuotedStr('%' + cFieldStr + '%') + ')) )) ';
      07 : cQueryToSearch := '((  ((' + cFieldToSearch + ' = ' + QuotedStr(cFieldStr) + ')) )) ';
    end;
    if edSearchCRUD2.Text <> '' then
    begin
      cFieldStr := edSearchCRUD2.Text;
      if ( DataTypeIsDateTime( sqlSearchMaster.Fields[ iPosition ].DataType ) ) then
         cFieldStr := ( FormatDateTime( mm.APP_SQL_DATE_FORMAT, StrToDateDef( edSearchCRUD2.Text, 0 ) ) )
      else
      if ( cbxSearchCRUDOpt2.ItemIndex >=4 ) and ( cbxSearchCRUDOpt2.ItemIndex <=6 ) then
      begin
         if ( mm.CONFIG_DATABASE = 'PGSQL' ) then
            cFieldToSearch2 := 'full_like(' + cFieldToSearch2 + ')' + ' iLIKE '
         else
            cFieldToSearch2 := cFieldToSearch2 + ' LIKE ';
      end;
      case cbxSearchCRUDOpt2.ItemIndex of
        00 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + '> ' + QuotedStr(cFieldStr) + ')';
        01 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + ' < ' + QuotedStr(cFieldStr) + ')';
        02 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + ' >= ' + QuotedStr(cFieldStr) + ')';
        03 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + ' <= ' + QuotedStr(cFieldStr) + ')';
        04 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + QuotedStr(cFieldStr + '%') + ')';
        05 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + QuotedStr('%' + cFieldStr) + ')';
        06 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + QuotedStr('%' + cFieldStr + '%') + ')';
        07 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + ' = ' + QuotedStr(cFieldStr) + ')';
      end;
    end;
  end;

  if cbxSearchCRUDFieldDate.Text <> '' then
  begin
       if cQueryToSearch <> '' then
          cQueryToSearch := cQueryToSearch +  ' AND ';

       cQueryToSearch := cQueryToSearch +
                         '( (' + cbxSearchCRUDFieldDate_Fields.Text + ' >= ' + QuotedStr( FormatDateTime( mm.APP_SQL_DATE_FORMAT, edSearchCRUDDtIni.DateTime ) ) + ')' +
                         '  AND (' + cbxSearchCRUDFieldDate_Fields.Text + ' <= ' + QuotedStr( FormatDateTime( mm.APP_SQL_DATE_FORMAT, edSearchCRUDDtEnd.DateTime ) ) + ') )';
  end;
  //7.0.0.0 dynamic show/edit
  if cSql <> '' then
     sqlSearchMaster.SQL.Text := cSql;
  cSql := sqlSearchMaster.Sql.Text;

  iPosition := 0;
  iPosition   := Pos( ' where ' + '((  ((', lowerCase( cSql ) );
  if iPosition > 0 then
     cSql := Copy( cSql, 0, iPosition)
  else
  begin
     iPosition := 0;
     iPosition := Pos( ' group by   ' , lowerCase( cSql ) );

     if iPosition > 0 then
        cSql := Trim( Copy( cSql, 0, iPosition ) )
     else
     begin
        iPosition := 0;
        iPosition := Pos( ' having   ' , lowerCase( cSql ) );

        if iPosition > 0 then
           cSql := Trim( Copy( cSql, 0, iPosition ) )
        else
        begin
           iPosition := 0;
           iPosition := Pos( ' order by   ' , lowerCase( cSql ) );

           if iPosition > 0 then
              cSql := Trim( Copy( cSql, 0, iPosition ) );
        end;
     end;
  end;
  //ed_GroupByHaving_Search.Text
  cWhereAnd := ' WHERE ';

  // tem um WHERE no FORM que chamou ? | is there a WHERE in the FORM that called ?
  if ed_Where_Search.Text <> '' then
  begin
     cSql := cSql + cWhereAnd + Trim( ed_Where_Search.Text ) ;
     cWhereAnd := ' AND ';
  end;

  if cQueryToSearch <> '' then
  begin
     cSql := cSql + cWhereAnd + cQueryToSearch;
     cWhereAnd := ' AND ';
  end;

  cSql := RemoveLineBreaks( cSql );
  if ed_GroupBy_Search.Text <> '' then
  begin
     cSql := cSql + ' group by   ' + trim( ed_GroupBy_Search.Text );
     cSql := RemoveLineBreaks( cSql );
  end;

  if ed_Having_Search.Text <> '' then
  begin
     cSql := cSql + ' having   ' + trim( ed_Having_Search.Text );
     cSql := RemoveLineBreaks( cSql );
  end;

  if ed_Order_Search.Text <> '' then
     cSql := cSql + ' order by   ' + trim( ed_Order_Search.Text )
  else
  begin
     //8.4.0.0 pk composta
     //cSql := cSql + ' order by   tab.' + ed_PK.Text  ;
     cSql := cSql + ' order by   ' + vAllPKs  ;

     if ( strTokenCount( ed_Order_Search.Text, ',' ) = 0 ) then
        cSql := cSql + ' DESC ';
  end;

  cSql := RemoveLineBreaks( cSql );
  //7.0.0.0 frmBaseCRUD_2
  If edSearchFilter.Text <> '' then
     cFilters := edSearchFilter.Text;

  if cFilters <> '' then
  begin
     iPosition   := Pos( ' where ' + '((  ((', lowerCase( cSql ) );

     if iPosition > 0 then
     begin
        cSql := Copy( cSql, 0, iPosition);
     end;

     cSql := cSql + ' where ' + '((  ((' + cFilters + ')) )) ';
  end;

  sqlSearchMaster.close;
  //[PT] cadastro dinamico..abrir só um registro pra acelerar...
  //[EN] dynamic registration..open just one record to speed up...
  if ( Pos( 'firstshow:', dbgSearchCRUD.Hint ) > 0 ) or
     ( Self.Tag <> 0 ) then
  begin
       // 6.0.0.0
       // primeira execucao: Limitar a lista( você pode alterar ou parametriza isso )
       if ( sqlSearchMaster.tag = 1 ) then
       begin
          if ed_CodMaster.Tag <> 0 then // edit or show
          begin
             if ( mm.CONFIG_DATABASE = 'SQLSERVER' ) or ( mm.CONFIG_DATABASE = 'ORACLE' ) then
                cSql := cSql + ' ' + ' OFFSET  1 ROWS FETCH NEXT 1 ROWS ONLY '
             else
             if ( mm.CONFIG_DATABASE = 'MYSQL' ) or ( mm.CONFIG_DATABASE = 'PGSQL' ) or ( mm.CONFIG_DATABASE = 'SQLITE' ) then
                cSql := cSql + ' LIMIT 1 '
             else
             if ( mm.CONFIG_DATABASE = 'FIREBIRD' ) then
                cSql := cSql + ' ROWS 1 ';
          end
          else //8.0.0.0
          if ( mm.CONFIG_DATABASE = 'SQLSERVER' ) then
          begin
             cSqlTemp := cSql;
             if lowercase(cSql).StartsWith('select ') then //8.5.0.0
             begin
                cSqlTemp := Copy( cSql, 8 );
                cSql     := 'SELECT Top ' + iFirstShow.ToString + ' ' + cSqlTemp;
             end;
          end
          else //8.0.0.0
          if ( mm.CONFIG_DATABASE = 'ORACLE' ) then
          begin
             cSql := StringReplace( cSql, 'WHERE ((', 'WHERE ((1=0)) and ((', [rfReplaceAll] );
          end
          else
          if ( mm.CONFIG_DATABASE = 'MYSQL' ) or ( mm.CONFIG_DATABASE = 'PGSQL' ) or ( mm.CONFIG_DATABASE = 'SQLITE' ) then
             cSql := cSql + ' LIMIT ' + iFirstShow.ToString + ' '
          else
          if ( mm.CONFIG_DATABASE = 'FIREBIRD' ) then
             cSql := cSql + ' ROWS ' + iFirstShow.ToString + ' ';

          sqlSearchMaster.tag := 0;
       end;
  end;
  sqlSearchMaster.DisableControls;
  sqlSearchMaster.FetchOptions.RecordCountMode := cmVisible;
  sqlSearchMaster.Sql.Text := cSql;

  mm.varDW_LastTick := GetTickCount;

  if not dm_rc.rc_OpenQuery( sqlSearchMaster ) then
  begin
     sqlSearchMaster.close;
     sqlSearchMaster.EnableControls;
     Abort;
  end
  else
  begin
     if ( ( iFirstShow < 0 ) and ( Pos( 'firstshow:0', dbgSearchCRUD.Hint ) = 0 ) ) or ( iFirstShow < 0 ) then
        labState.Caption      := '[ ' + FloatToStrF( sqlSearchMaster.RowsAffected , ffNumber, 10, 0 ) + ' ' + mm.MSG_RECORDS + ' ]';

     if ( mm.varB_Mobile_Screen_Portrait ) and ( not bActions ) and ( not bModelCrud1 ) then
     begin
        paSearchFilters.tag := -2;
        btnSearchClick( self );
     end;
     sqlSearchMaster.EnableControls;
  end;
  iFirstShow := -1;

  //8.0.0.0 grid ( thanks SAMET from TURKEY )
  rc_GridColumnSearchRender( Self, dbgSearchCRUD, hpMaster );
end;
//8.0.0.0 search custom
procedure TfrmBaseCRUD.SearchCRUDCustom;
var
  cFieldStr,
  cFieldToSearch, cAliasToSearch,
  cFieldToSearch2,cAliasToSearch2,
  cQueryToSearch, cSql, cSqlTemp, cAndOr, cWhereAnd: String;
//  iCurrPage, i,
  iPosition: integer;
  iCurrPage: integer;
begin
  if ( paSearchFiltersCustom.tag = -1 ) then
  begin
     paSearchFiltersCustom.tag := 0;
     rc_Anim( paSearchFiltersCustom, 'left', '-' + paSearchFiltersCustom.Width.ToString, '0.4', gsEaseBack, '0.4', gsEaseTypeOut );
  end;

  rc_DefaultTitleForm;

  // SABER O TIPO DO CAMPO para criticar o tipo da OPERACAO
  // pode ser um ALIAS, entao tem que pegar a tabela equivalente
  // mas se for o alias padrão( TAB. ) pega a tabela ATUAL
  cFieldToSearch := rc_getHintAttr( 'search-field:', edQuickSearch.Hint ) ;
  if ( cFieldToSearch <> '' ) and ( trim(edQuickSearch.Text) <> '' ) then
  begin
     cAliasToSearch := dm_rc.rc_ExtractFieldNameFromSearchItem( cFieldToSearch, true );
     cFieldToSearch := dm_rc.rc_ExtractFieldNameFromSearchItem( cFieldToSearch );

     mm.varC_FieldType := '';

     // a query tem q ter sido carregada ao entrar na tela

     if not sqlSearchMaster.active then
     begin
        if not dm_rc.rc_OpenQuery( sqlSearchMaster ) then
        begin
           sqlSearchMaster.close;
           Abort;
        end;
     end;
     //8.1.0.0 thanks for bugtracker Mr. Josauro
     if sqlSearchMaster.FindField( cAliasToSearch ) <> nil then
        iPosition := sqlSearchMaster.FieldByName( cAliasToSearch ).Index
     else
        iPosition := sqlSearchMaster.FieldByName( dm_rc.rc_ExtractFieldNameFromSearchItem( cFieldToSearch, true ) ).Index;
  end;

  cWhereAnd := '';
  //6.1.0.0
  if edQuickSearch.Text <> '' then
  begin
    cFieldStr := edQuickSearch.Text;
    if ( DataTypeIsDateTime( sqlSearchMaster.Fields[ iPosition ].DataType ) ) then
       cFieldStr := ( FormatDateTime( mm.APP_SQL_DATE_FORMAT, StrToDateDef( edQuickSearch.Text, 0 ) ) );

    if ( DataTypeIsNumber( sqlSearchMaster.Fields[ iPosition ].DataType ) ) and
       ( strtointdef( edQuickSearch.Text, -999999 ) <> -999999  ) then
       cQueryToSearch := '((  ((' + cFieldToSearch + ' LIKE ' + QuotedStr('%' + cFieldStr + '%') + ')) )) '
    else
    if ( DataTypeIsDateTime( sqlSearchMaster.Fields[ iPosition ].DataType ) ) and
       ( StrToDateDef( edQuickSearch.Text, -999999 ) <> -999999  ) then
       cQueryToSearch := '((  ((' + cFieldToSearch + ' = ' + QuotedStr( FormatDateTime( mm.APP_SQL_DATE_FORMAT, StrToDateTime( edQuickSearch.Text ) ) ) + ')) )) '
    else
    if ( DataTypeIsString( sqlSearchMaster.Fields[ iPosition ].DataType ) ) then
       //6.1.0.0
       if ( mm.CONFIG_DATABASE = 'PGSQL' ) then
          cQueryToSearch := '((  ((full_like(' + cFieldToSearch + ') iLIKE ' + QuotedStr('%' + cFieldStr + '%') + ')) )) '
       else
          cQueryToSearch := '((  ((' + cFieldToSearch + ' LIKE ' + QuotedStr('%' + cFieldStr + '%') + ')) )) ';
  end;

  cSql := sqlSearchMaster.Sql.Text;

  iPosition := 0;
  //7.3.0.0
  //iPosition   := Pos( ' where ' + '((  ((', lowerCase( cSql ) );
  iPosition   := Pos( ' where ((1=1))' , lowerCase( cSql ) );
  if iPosition > 0 then
     cSql := Copy( cSql, 0, iPosition)
  else
  begin
     iPosition := 0;
     iPosition := Pos( ' group by   ' , lowerCase( cSql ) );

     if iPosition > 0 then
        cSql := Trim( Copy( cSql, 0, iPosition ) )
     else
     begin
        iPosition := 0;
        iPosition := Pos( ' having   ' , lowerCase( cSql ) );

        if iPosition > 0 then
           cSql := Trim( Copy( cSql, 0, iPosition ) )
        else
        begin
           iPosition := 0;
           iPosition := Pos( ' order by   ' , lowerCase( cSql ) );

           if iPosition > 0 then
              cSql := Trim( Copy( cSql, 0, iPosition ) );
        end;
     end;
  end;
  //ed_GroupByHaving_Search.Text
  //7.3.0.0
  if Trim( cQueryToSearch + ed_Where_Search.Text ) = '' then
     cWhereAnd := ' WHERE ((1=1)) '
  else
     cWhereAnd := ' WHERE ((1=1)) AND ';
  //cWhereAnd := ' WHERE ';

  // tem um WHERE no FORM que chamou ? | is there a WHERE in the FORM that called ?
  if ed_Where_Search.Text <> '' then
  begin
     cSql := cSql + cWhereAnd + Trim( ed_Where_Search.Text ) ;
     cWhereAnd := ' AND ';
  end;

  if cQueryToSearch <> '' then
  begin
     cSql := cSql + cWhereAnd + cQueryToSearch;
     cWhereAnd := ' AND ';
  end;

  cSql := RemoveLineBreaks( cSql );
  //7.3.0.0
//  if ed_GroupBy_Search.Text <> '' then
//  begin
//     cSql := cSql + ' group by   ' + trim( ed_GroupBy_Search.Text );
//     cSql := RemoveLineBreaks( cSql );
//  end;
//
//  if ed_Having_Search.Text <> '' then
//  begin
//     cSql := cSql + ' having   ' + trim( ed_Having_Search.Text );
//     cSql := RemoveLineBreaks( cSql );
//  end;
//
//  if ed_Order_Search.Text <> '' then
//     cSql := cSql + ' order by   ' + trim( ed_Order_Search.Text )
//  else
//  begin
//     cSql := cSql + ' order by   tab.' + ed_PK.Text  ;
//
//     if ( strTokenCount( ed_Order_Search.Text, ',' ) = 0 ) then
//        cSql := cSql + ' DESC ';
//  end;
  cFilters := '';

  cSql := RemoveLineBreaks( cSql );
  //7.0.0.0 frmBaseCRUD_2
  If edSearchFilter.Text <> '' then
     cFilters := edSearchFilter.Text;
  //7.3.0.0
  if ( cFilters <> '' ) then
  begin
     iPosition   := Pos( ' where ' + '((  ((', lowerCase( cSql ) );
     if iPosition = 0 then
        iPosition   := Pos( ' where ((1=1))' , lowerCase( cSql ) );
     if iPosition > 0 then
     begin
        cSql := Copy( cSql, 0, iPosition);
     end;
     //cSql := cSql + ' where ' + '((  ((' + cFilters + ')) )) ';
     cSql := cSql + ' where ((1=1)) AND ' + '((  ((' + cFilters + ')) )) ';
  end;
  //7.3.0.0
  if ed_GroupBy_Search.Text <> '' then
  begin
     cSql := cSql + ' group by   ' + trim( ed_GroupBy_Search.Text );
     cSql := RemoveLineBreaks( cSql );
  end;
  if ed_Having_Search.Text <> '' then
  begin
     cSql := cSql + ' having   ' + trim( ed_Having_Search.Text );
     cSql := RemoveLineBreaks( cSql );
  end;
  if ed_Order_Search.Text <> '' then
     cSql := cSql + ' order by   ' + trim( ed_Order_Search.Text )
  else
  begin
     cSql := cSql + ' order by   tab.' + ed_PK.Text  ;

     if ( strTokenCount( ed_Order_Search.Text, ',' ) = 0 ) then
        cSql := cSql + ' DESC ';
  end;

  sqlSearchMaster.close;

  if ( Pos( 'firstshow:', dbgSearchCRUD.Hint ) > 0 ) or
     ( Self.Tag <> 0 ) then // cadastro dinamico..abrir só um registro pra acelerar...
     //( Self.Tag = 1 ) then // cadastro dinamico..abrir só um registro pra acelerar...
  begin
       // 6.0.0.0
       // primeira execucao: Limitar a lista( você pode alterar ou parametriza isso )
       if ( sqlSearchMaster.tag = 1 ) then
       begin
          if ed_CodMaster.Tag <> 0 then // edit or show
          begin
             if ( mm.CONFIG_DATABASE = 'SQLSERVER' ) or ( mm.CONFIG_DATABASE = 'ORACLE' ) then
                cSql := cSql + ' ' + ' OFFSET  1 ROWS FETCH NEXT 1 ROWS ONLY ;'
             else
             if ( mm.CONFIG_DATABASE = 'MYSQL' ) or ( mm.CONFIG_DATABASE = 'PGSQL' ) or ( mm.CONFIG_DATABASE = 'SQLITE' ) then
                cSql := cSql + ' LIMIT 1 ;'
             else
             if ( mm.CONFIG_DATABASE = 'FIREBIRD' ) then
                cSql := cSql + ' ROWS 1 ;';
          end
          else //8.0.0.0
          if ( mm.CONFIG_DATABASE = 'SQLSERVER' ) then
          begin
             cSqlTemp := cSql;
             if lowercase(cSql).StartsWith('select ') then //8.5.0.0
             begin
                cSqlTemp := Copy( cSql, 8 );
                cSql     := 'SELECT Top ' + iFirstShow.ToString + ' ' + cSqlTemp;
             end;
          end
          else //8.0.0.0
          if ( mm.CONFIG_DATABASE = 'ORACLE' ) then
          begin
             cSql := StringReplace( cSql, 'WHERE ((', 'WHERE ((1=0)) and ((', [rfReplaceAll] );
          end
          else
          if ( mm.CONFIG_DATABASE = 'MYSQL' ) or ( mm.CONFIG_DATABASE = 'PGSQL' ) or ( mm.CONFIG_DATABASE = 'SQLITE' ) then
             cSql := cSql + ' LIMIT ' + iFirstShow.ToString + ' ;'
          else
          if ( mm.CONFIG_DATABASE = 'FIREBIRD' ) then
             cSql := cSql + ' ROWS ' + iFirstShow.ToString + ' ;';

          sqlSearchMaster.tag := 0;
       end;
  end;
  sqlSearchMaster.DisableControls;
  sqlSearchMaster.FetchOptions.RecordCountMode := cmVisible;
  sqlSearchMaster.Sql.Text := cSql;

  mm.varDW_LastTick := GetTickCount;

  if not dm_rc.rc_OpenQuery( sqlSearchMaster ) then
  begin
     sqlSearchMaster.close;
     sqlSearchMaster.EnableControls;
     Abort;
  end
  else
  begin
     if ( mm.varB_Mobile_Screen_Portrait ) and ( not bActions ) and ( not bModelCrud1 ) then
     begin
        //paSearchFilters.tag := -2;
        //btnSearchClick( self );
     end;
     sqlSearchMaster.EnableControls;
  end;
  //ShowMessage(  'Tempo( sem RDW ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
  //ShowMessageN(  'Tempo: ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
  iFirstShow := -1;
  // 6.0.0.0
  if TUniControl( sender ).Name = 'btnSearchCRUD' then
     if sqlSearchMaster.IsEmpty then
        dm_rc.rc_ShowSweetAlertWarning( mm.MSG_RECORD_NOT_FOUND );
end;
//[PT] Devido a um problema com firedac( ou talvez por não permitir em runtime ) ao deletar um registro
//      com relacionamente( ... DELETE CASCADE ) apenas o MASTER está sendo removido. Com esse código todas
//      as tabelas relacionadas com chave estrangeira vinculadas a tabela que está sendo deletada serão
//      removidas antes para evitar violação de chave estrangeira. Por enquanto apenas funcionando para FIREBIRD
//
//[EN] Due to a problem with firedac (or perhaps not allowing it at runtime) when deleting a record
//      with relative (and DELETE CASCADE) only MASTER is being removed. With this code all tables related
//      to foreign keys linked to the table being deleted will be removed beforehand to avoid foreign key violations.
//      For now only working for FIREBIRD
procedure TfrmBaseCRUD.sqlMasterBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  //dm_rc.rc_DeleteFKTables( ed_Table_ItemSel.Text, ed_PK.Text, sqlSearchMaster.FieldByName( ed_PK.Text ).AsString ); //6.0.0.1
  //rc_DeleteFKs;
end;
//7.0.0.0
// thanks JEFFERSON for bugtracker
// [PT] evitar qd tem vários cruds inseridos no mesmo container
// [EN] Avoid when there are several croods inserted in the same container
procedure TfrmBaseCRUD.sqlMasterBeforePost(DataSet: TDataSet);
begin
  rc_UpdateDBComboBox( self, false );
  //rc_UpdateDBComboBox( self, false, dsMaster ); // you can send other "datasource"
  inherited;
end;

procedure TfrmBaseCRUD.sqlMasterError(ASender, AInitiator: TObject; var AException: Exception);
begin
  inherited;
  dm_rc.rc_ShowError( AException.Message );
end;
//8.4.0.0 pk composta ( analisar isso em tab. q nao tem DELETE CASCADE definidas no banco )
procedure TfrmBaseCRUD.sqlSearchMasterBeforeDelete(DataSet: TDataSet);
begin
  inherited;
//  dm_rc.rc_DeleteFKTables( ed_Table_ItemSel.Text, ed_PK.Text, sqlSearchMaster.FieldByName( ed_PK.Text ).AsString );
end;

procedure TfrmBaseCRUD.sqlSearchMasterError(ASender, AInitiator: TObject; var AException: Exception);
begin
  inherited;
  dm_rc.rc_ShowError( AException.Message );
end;
(*
CREATE OR REPLACE FUNCTION full_like(p_texto text)
  RETURNS text AS
 $BODY$
 Select lower(translate($1,
 'áàâãäåaaaÁÂÃÄÅAAAÀéèêëeeeeeEEEÉEEÈìíîïìiiiÌÍÎÏÌIIIóôõöoooòÒÓÔÕÖOOOùúûüuuuuÙÚÛÜUUUUçÇñÑýÝ',
 'aaaaaaaaaAAAAAAAAAeeeeeeeeeEEEEEEEiiiiiiiiIIIIIIIIooooooooOOOOOOOOuuuuuuuuUUUUUUUUcCnNyY'
  ));
 $BODY$
 LANGUAGE sql VOLATILE
 COST 100;
*)
end.

