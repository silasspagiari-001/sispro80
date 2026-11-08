// 7.0.0.0
unit untFrmBaseCRUD_NoDB;


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
  uniHTMLFrame, uniSweetAlert;

type
  TfrmBaseCRUD_NoDB = class(TfrmBase)
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
    paBaseRegSearch: TUniContainerPanel;
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
    tabRegister: TUniTabSheet;
    paBaseRegData1: TUniContainerPanel;
    hpForActionBtns: TUniHiddenPanel;
    ed_NoGenID: TUniEdit;
    ed_PK_ZerosLeft: TUniEdit;
    paGridOffset: TUniContainerPanel;
    dbgSearchCRUD: TUniDBGrid;
    paNotFound_dbgSearchCRUD: TUniContainerPanel;
    imgNoRecords_dbgSearchCRUD: TUniLabel;
    labNotFound_dbgSearchCRUD: TUniLabel;
    ed_HideMaskOff: TUniEdit;
    edSearchFilter: TUniEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure cbxSearchCRUDField1Change(Sender: TObject);
    procedure cbxSearchCRUDField2Change(Sender: TObject);
    procedure cbxSearchCRUDFieldDateChange(Sender: TObject);
    procedure cbxSearchCRUDPeriodChange(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnCloseFormClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure cbxAndOrChange(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnSearchMoreFiltersClick(Sender: TObject);
    procedure dbgSearchCRUDColumnSort(Column: TUniDBGridColumn;Direction: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnSearchClick(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure Excel2Click(Sender: TObject);
    procedure Xml1Click(Sender: TObject);
    procedure Csv1Click(Sender: TObject);
    procedure labOptionsClick(Sender: TObject);
    procedure pgBaseCadControlChangeValue(Sender: TObject);

  private
    { Private declarations }
    vt1, vt2 : Cardinal;
    vTime   : Extended;
    mX, mY,
    iFirstShow : integer;
    bNoGenID, // 6.0.0.0
    bSaveMasterPK,
    bActions,
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
  public
    { Public declarations }
    procedure rc_DefaultTitleForm;
    procedure rc_UpdateLayout;
    procedure btnSearchClose;
    procedure UpdateButtons( pDef : String); //
    //7.5.0.0
    procedure SearchPanelClose;
  end;

implementation

{$R *.dfm}

uses Main, MainModule,

  uconsts, uconsts_cfg,
  mkm_func_web, ServerModule, untdm_rc, untFrmLookUp_Lite, //UExportExcel,
  mkm_layout, mkm_validate, mkm_translate, mkm_dbfuncs, mkm_dbcombobox, mkm_anim, untModalFrameForm;

//7.5.0.0
procedure TfrmBaseCRUD_NoDB.SearchPanelClose;
begin
  if ( paSearchFilters.tag = -1 ) then
  begin
     paSearchFilters.tag := 0;
     rc_Anim( paSearchFilters, 'left', '-' + paSearchFilters.Width.ToString, '0.4', gsEaseBack, '0.4', gsEaseTypeOut );
  end;
end;
// 6.0.0.0
procedure TfrmBaseCRUD_NoDB.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  dm_rc.rc_DummyDelay; // 6.0.0.1
  btnSearchClose;
  dm_rc.rc_ActionBtnCellClick( self, Column.FieldName );
end;

procedure TfrmBaseCRUD_NoDB.dbgSearchCRUDColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  inherited;
  dm_rc.rc_GridSortColumn( TUniDBGrid( Column.Grid ), Column.FieldName, Direction );
end;
//
procedure TfrmBaseCRUD_NoDB.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmBaseCRUD_NoDB.dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  mX := x;
  mY := y;
end;

procedure TfrmBaseCRUD_NoDB.Excel1Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_DBGridExport( dbgExport, etExcel );
end;

procedure TfrmBaseCRUD_NoDB.Excel2Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_DBGridExport( dbgExport, etHTML );
end;

procedure TfrmBaseCRUD_NoDB.labOptionsClick(Sender: TObject);
begin
  inherited;
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
  popMenuOptions.PopupBy( TUniButton( sender ) );
end;

procedure TfrmBaseCRUD_NoDB.Xml1Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_DBGridExport( dbgExport, etXML );
end;

procedure TfrmBaseCRUD_NoDB.Csv1Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_DBGridExport( dbgExport, etCSV );
end;

procedure TfrmBaseCRUD_NoDB.pgBaseCadControlChangeValue(Sender: TObject);
begin
  inherited;
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
end;

procedure TfrmBaseCRUD_NoDB.btnCloseFormClick(Sender: TObject);
begin
  inherited;
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';
  if pgBaseCadControl.ActivePage = tabRegister then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

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
     if ( ed_CodMaster.Tag = 0 ) or ( StrToIntDef( ed_CodMaster.Hint, 0 ) > 0 ) then
     begin
           if iCurrentPage <> -1 then
              UniSession.AddJS( dbgSearchCRUD.JSName+'.store.loadPage(' + iCurrentPage.ToString + ');');
     end;
     rc_DefaultTitleForm;
  end
  else
  begin
     if Pos( 'frmModalFrameForm', Self.Owner.Name ) > 0 then
        TUniform( rc_FindControl( Self.Owner.Name ) ).Close
     else
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
  end;
end;

procedure TfrmBaseCRUD_NoDB.btnDeleteRegClick(Sender: TObject);
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
  ed_Table_Status_OLD.Text := '';
  ed_Table_Status.Text := '';

  mm.varB_OperationProcessed := True;
  if mm.varB_OperationProcessed then
  begin
     pgBaseCadControl.ActivePage := tabSearch;
  end;
end;

procedure TfrmBaseCRUD_NoDB.btnEditRegClick(Sender: TObject);
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
  // verifica restricao do usuário - CADASTRO
  If not dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                    Trim( ed_Table_ItemSel.Text ) ,
                                    PT_EDIT ) then
  begin
     Abort;
  end;
  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';

  pgBaseCadControl.ActivePage := tabRegister;

  rc_RemoveCssClass(tabSearch, 'slide_in');
  rc_AddCssClass(tabRegister, 'slide_in');

  if Self.FindComponent('pgComplementData' ) <> nil then
     if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
        TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

  UpdateButtons('1');

  dm_rc.rc_ApplyEditMasks( self );
  rc_ClearValidation( self );
  // inicializar possíveis "bsRgp" | initialize possible "bsRgp"
  dm_rc.rc_RgpInitialize( self );
  // atualizar todos os LOOKUPs dinamicamente | update all LOOKUPs dynamically
  dm_rc.rc_LookUpUpdateData( self, nil, true );
end;

procedure TfrmBaseCRUD_NoDB.btnNewRegClick(Sender: TObject);
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

  rc_RemoveCssClass(tabSearch, 'slide_in');
  rc_AddCssClass(tabRegister, 'slide_in');

  if Self.FindComponent('pgComplementData' ) <> nil then
     if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
        TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

  UpdateButtons('1');

  dm_rc.rc_ApplyEditMasks( self );
  rc_ClearValidation( self );
  // inicializar possíveis "bsRgp" | initialize possible "bsRgp"
  dm_rc.rc_RgpInitialize( self );
  // atualizar todos os LOOKUPs dinamicamente | update all LOOKUPs dynamically
  dm_rc.rc_LookUpUpdateData(  self, nil, true );
end;

procedure TfrmBaseCRUD_NoDB.btnOptionsClick(Sender: TObject);
begin
  inherited;
  SearchPanelClose; //7.5.0.0
  popMenuOptions.PopupBy( TUniButton( sender ) );
end;

procedure TfrmBaseCRUD_NoDB.btnSaveRegClick(Sender: TObject);
var
   f,i : integer;
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
  pgBaseCadControl.ActivePage := tabSearch;
end;

procedure TfrmBaseCRUD_NoDB.btnSearchClick(Sender: TObject);
var
   i : integer;
begin
  inherited;
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
  //if not ( dsMaster.State in [dsEdit, dsInsert ] ) then
  begin
     tabSearch.Visible := ( btnNewReg.Enabled) and ( not bModelCrud1 );
     pgBaseCadControl.ActivePage := tabSearch;

     if ( ( not bModelCrud1 ) ) then
     begin
        if paSearchFilters.tag = 0 then
        begin
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
           //edSearchCRUD1.SetFocus; //6.0.0.0
        end
        else
        if paSearchFilters.tag = -1 then
        begin
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
     end;
  end;
end;

procedure TfrmBaseCRUD_NoDB.btnSearchClose;
begin
  if ( ( not bModelCrud1 ) and ( paSearchFilters.tag <> 0 ) ) then
     btnSearchClick( labExit );
end;

procedure TfrmBaseCRUD_NoDB.cbxAndOrChange(Sender: TObject);
begin
  inherited;
  cbxAndOr.Caption := varIIF( cbxAndOr.Checked, mm.MSG_SEARCH_CONDICIONAL_AND, mm.MSG_SEARCH_CONDICIONAL_OR ) + '...';
end;

procedure TfrmBaseCRUD_NoDB.cbxSearchCRUDField1Change(Sender: TObject);
begin
  inherited;
  cbxSearchCRUDField1_Fields.ItemIndex := cbxSearchCRUDField1.ItemIndex;
end;

procedure TfrmBaseCRUD_NoDB.cbxSearchCRUDField2Change(Sender: TObject);
begin
  inherited;
  cbxSearchCRUDField2_Fields.ItemIndex := cbxSearchCRUDField2.ItemIndex;
end;

procedure TfrmBaseCRUD_NoDB.cbxSearchCRUDFieldDateChange(Sender: TObject);
begin
  inherited;
  cbxSearchCRUDFieldDate_Fields.ItemIndex := cbxSearchCRUDFieldDate.ItemIndex;
end;

procedure TfrmBaseCRUD_NoDB.cbxSearchCRUDPeriodChange(Sender: TObject);
begin
  inherited;
  dm_rc.rc_ReportDateInterval( cbxSearchCRUDPeriod.Text );

  edSearchCRUDDtIni.DateTime := mm.varD_DtIni;
  edSearchCRUDDtEnd.DateTime := mm.varD_DtEnd;
end;

procedure TfrmBaseCRUD_NoDB.btnSearchMoreFiltersClick(Sender: TObject);
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

procedure TfrmBaseCRUD_NoDB.UniFrameCreate(Sender: TObject);
var
   iPos, iPos2, iWidth, iHeight,
   I, F : integer;

   cActions, cCaption,
   cTemp, cTemp3,
   cCls, cIco, cBtn,cBtnCls,
   cTagString, // 6.0.0.0
   cSql : string;

   AllPKs,
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

    // 6.0.0.0
    dbgExport.Top := -50;
    dbgExport.LoadMask.Enabled := false; // 6.0.0.0

    inherited;

    //rc_BringToFront( paSearchFilters ); //6.0.0.0+

    iCurrentPage := -1;
    // 6.0.0.0
    //dbgExport.Top := -50;
    //dbgExport.LoadMask.Enabled := false; // 6.0.0.0
    mm.varC_CustomMsg := '';

    //rc_BringToFront( paSearchFilters ); // 6.0.0.0+
    if mm.varB_Mobile_Screen_Portrait then
       paSearchFilters.tag  := -2
    else
       paSearchFilters.tag  := 0;
    //6.0.0.0+
    paSearchFilters.Left := -paSearchFilters.Width;
    paSearchFilters.Top  := 0;
//    rc_ObjectEnabled( Self, btnSearch   , not ( dsMaster.State in [ dsEdit, dsInsert ] ) );
//    rc_ObjectEnabled( Self, btnNewReg   , btnSearch.Enabled );
//    rc_ObjectEnabled( Self, btnEditReg  , btnSearch.Enabled );
//    rc_ObjectEnabled( Self, btnDeleteReg, btnSearch.Enabled );
//    rc_ObjectEnabled( Self, btnSaveReg  , not btnSearch.Enabled );
//    rc_ObjectEnabled( Self, btnCancelReg, not btnSearch.Enabled );
//    rc_ObjectEnabled( Self, btnOptions  , ( btnSearch.Enabled ) and ( popMenuOptions.Items.Count > 0 ) );
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
    // 6.0.0.0
    cTagString := dm_rc.rc_GetTagFormAttr( Self, true );
    if cTagString <> '' then Self.Hint := rc_AddHintAttr( '|tag-form:' + cTagString, Self.Hint, false );
    ed_HideMaskOff.Text         := varIIF( mm.varA_FSideMenu[ dm_rc.rc_FindMenuOption( mm.varC_SelectedItem_FSideMenu ) ].HideMaskOff  , 'true', 'false' );
    ed_PK_ZerosLeft.Text        := varIIF( mm.varA_FSideMenu[ dm_rc.rc_FindMenuOption( mm.varC_SelectedItem_FSideMenu ) ].PKZerosLeft  , 'true', 'false' );
    ed_NoGenID.Text             := varIIF( mm.varA_FSideMenu[ dm_rc.rc_FindMenuOption( mm.varC_SelectedItem_FSideMenu ) ].NoGenID      , 'true', 'false' );
    ed_GenNextID_OnNew.Text     := varIIF( mm.varA_FSideMenu[ dm_rc.rc_FindMenuOption( mm.varC_SelectedItem_FSideMenu ) ].GenIDOnInsert, 'true', 'false' ); // 6.0.0.0
    ed_AskNewRec_AfterPost.Text := varIIF( mm.varA_FSideMenu[ dm_rc.rc_FindMenuOption( mm.varC_SelectedItem_FSideMenu ) ].AskNew       , 'true', 'false' );
    Self.ed_FormOrigin.Text     := mm.varC_FormSource_Search ;
    Self.ed_FormOrigin_Tab.Text := mm.varC_Selected_FormFrame ;
    Self.ed_Table_Status.Text   := mm.varC_StatusSearch ;
    Self.ed_Table_Status_OLD.Text := '';
    if ed_Where_Search.Text <> '' then
       ed_Where_Search.Text          := '((  ((' + trim( ed_Where_Search.Text ) + ')) )) ';
    if ed_Order_Search.Text <> '' then
       ed_Order_Search.Text          := trim( ed_Order_Search.Text ) ;

    // pre-defined grid columns attributes

    if ( Pos( 'fieldmasks:' , dbgSearchCRUD.Hint ) = 0 ) then
        dbgSearchCRUD.Hint := '[[' +
                              'fieldmasks:' +
                              'grid-resize|' +
                              //'model-crud:0(btns-cls:colorful)|'+{model-crud}//6.1.0.0
                              varIIF( ( mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR = 'ON' ) and
                                      {7.0.0.0}( ( pos( 'no-paged|', dbgSearchCRUD.Hint ) = 0 ) and ( dbgSearchCRUD.WebOptions.Paged ) ) and
                                      ( pos( 'grid-paginator', dbgSearchCRUD.Hint ) = 0 ), 'grid-paginator|', '' ) +
                              ']]';
    dbgSearchCRUD.Hint   := rc_AddHintAttr( '|state-visible:empty-false ds:dsSearchMaster', dbgSearchCRUD.Hint, false );
    //7.0.0.0 no-paged ( tip from GILBERTO LOSS )
    if ( not dbgSearchCRUD.WebOptions.Paged ) or
       ( pos( 'no-paged|', dbgSearchCRUD.Hint ) > 0 )  then
       dbgSearchCRUD.Hint := StringReplace( dbgSearchCRUD.Hint, 'grid-paginator', '', [rfReplaceAll] );

    if ( Pos( 'fieldmasks:' , dbgSearchCRUD.Hint ) > 0 ) and ( Pos( 'fieldmasks:table-' , dbgSearchCRUD.Hint ) = 0 ) then
    begin
         iPos := Pos( 'fieldmasks:' , dbgSearchCRUD.Hint ) + 11;
         cTemp := dbgSearchCRUD.Hint;
         Insert( 'table-' + lowercase( ed_Table_ItemSel.Text ) + ';' , cTemp , iPos );
         dbgSearchCRUD.Hint := cTemp;
         dbgSearchCRUD.Hint := rc_AddHintAttr( '|table-pk:' + lowercase( ed_PK.Text ) , dbgSearchCRUD.Hint, false );
    end;

    mm.varC_FieldMasks := '';
    //[PT] configurar lookups...mascaras...etc.. preparar query [[fields]]...
    //[EN] adjust the lookup tables according to the query name
    dm_rc.rc_RenderLookUpControls( Self );
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

    edQuickSearch.Enabled  := ( ( bModelCrud1 ) or ( bModelCrud3 ) ) and ( not bSearchComplete ) ;
    edQuickSearch.Visible  := edQuickSearch.Enabled;
    btnQuickSearch.Visible := edQuickSearch.Visible ;
    rc_ObjectEnabled( Self, btnQuickSearch, btnQuickSearch.Visible );
    btnCloseForm.Visible   := False;

    for f := 0 to ComponentCount - 1 do
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
            //7.0.0.0 no-paged ( tip from GILBERTO LOSS )
            if ( not TUniDBGrid( Components[f] ).WebOptions.Paged ) or
               ( pos( 'no-paged|', TUniDBGrid( Components[f] ).Hint ) > 0 )  then
               TUniDBGrid( Components[f] ).Hint := StringReplace( TUniDBGrid( Components[f] ).Hint, 'grid-paginator', '', [rfReplaceAll] );

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

    i := StrToIntDef( ed_CodMaster.Hint, 0 );
    if i = 0 then
    begin
       //[PT] contar quantos campos tem pra ativar ou nao o FORCEFIT.
       //      FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
       //[EN] count how many fields there are to activate FORCEFIT or not.
       //      FORCEFIT works best with few fields, but doesn't work well when LOCKED is active
       dm_rc.rc_DBGridUpdateAll( Self , false, false, false );
    end;
end;

procedure TfrmBaseCRUD_NoDB.UniFrameDestroy(Sender: TObject);
begin
   {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
end;

procedure TfrmBaseCRUD_NoDB.UniFrameReady(Sender: TObject);
var
   i : integer;
begin
  inherited;

   if ( not bModelCrud1 ) then
      paSearchFilters.Width := varIIF( ( mm.varB_Mobile_Screen_Portrait ) , mm.varI_ScreenWidth -14, 326 );

   paSearchFilters.Left := (paSearchFilters.Width ) * (-1);//  -326;

   labState.Left      := labState.Parent.Left + labState.Parent.Width - labState.Width - 10;

   paSearchFilterPeriodSelect.Visible := ( not paSearchFilterPeriodSelect.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 1 );
   paSearchFilterDate.Visible         := ( not paSearchFilterDate.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 1 );
   paSearchFilterPeriod.Visible       := ( not paSearchFilterPeriod.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 1 );
   paSearchContent2.Visible     := not paSearchContent2.Visible;
   paSearchFilter2.Visible      := not paSearchFilter2.Visible;
   paSearchFilterAndOr.Visible  := not paSearchFilterAndOr.Visible;

   labTitleSearch.Top             := 10;
   paSearchFilter1.Top            := 49;
   paSearchContent1.Top           := paSearchFilter1.Top + paSearchFilter1.Height;// 169;

   paSearchFilterAndOr.Top        := paSearchContent1.Top + paSearchContent1.Height;
   paSearchFilter2.Top            := paSearchFilterAndOr.Top + paSearchFilterAndOr.Height;
   paSearchContent2.Top           := paSearchFilter2.Top + paSearchFilter2.Height;

   paSearchFilterPeriod.Top       := paSearchContent2.Top + paSearchContent2.Height;
   paSearchFilterDate.Top         := paSearchFilterPeriod.Top + paSearchFilterPeriod.Height;
   paSearchFilterPeriodSelect.Top := paSearchFilterDate.Top + paSearchFilterDate.Height;

   if paSearchFilterPeriod.Visible then
      paSearchBtn.Top := paSearchFilterPeriodSelect.Top + paSearchFilterPeriodSelect.Height + 12
   else
   if paSearchContent2.Visible then
      paSearchBtn.Top := paSearchContent2.Top + paSearchContent2.Height + 12
   else
      paSearchBtn.Top := paBaseRegSearch.Top + paSearchFilters.Top + UniScrollBox1.Top + paSearchContent1.Top + paSearchContent1.Height + 12;

    // in development
    rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );

    Self.ed_FormOrigin.Text      := mm.varC_FormSource_Search ;

    if ( Self.Tag = 1 ) then
    begin
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
       i := StrToIntDef( ed_CodMaster.Hint, 0 );
       if i <> 0 then
       begin
            cbxSearchCRUDField1.ItemIndex := 0;
            edSearchCRUD1.Text := IntToStr( i );
            case ed_CodMaster.Tag of
                 //-1 : dbgSearchCRUDDblClick( dbgSearchCRUD );
                 -2 : btnEditRegClick( btnEditReg );
//                 -3 : dbgSearchCRUDDblClick( dbgSearchCRUD );
            end;

            edSearchCRUD1.Text := '';
       end
       else
       begin
          mm.varI_Temp1 := 0;
          //[PT] contar quantos campos tem pra ativar ou nao o FORCEFIT.
          //      FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
          //[EN] count how many fields there are to activate FORCEFIT or not.
          //      FORCEFIT works best with few fields, but doesn't work well when LOCKED is active
          dm_rc.rc_DBGridUpdateAll( Self , false, false, true);
       end;
    end;
end;

procedure TfrmBaseCRUD_NoDB.UpdateButtons(pDef: String);
begin
   if pDef = '1' then // Opção para salvar
   begin
      rc_ObjectEnabled(Self, btnSearch, false);
      rc_ObjectEnabled(Self, btnNewReg, false);
      rc_ObjectEnabled(Self, btnEditReg, false);
      rc_ObjectEnabled(Self, btnDeleteReg, false);
      rc_ObjectEnabled(Self, btnSaveReg, true);
      rc_ObjectEnabled(Self, btnCancelReg, true);
      rc_ObjectEnabled(Self, btnOptions, false);
   end
   else
   if pDef = '2' then // Opção para não salvar
   begin
      rc_ObjectEnabled(Self, btnSearch, true);
      rc_ObjectEnabled(Self, btnNewReg, true);
      rc_ObjectEnabled(Self, btnEditReg, true);
      rc_ObjectEnabled(Self, btnDeleteReg, true);
      rc_ObjectEnabled(Self, btnSaveReg, false);
      rc_ObjectEnabled(Self, btnCancelReg, false);
      rc_ObjectEnabled(Self, btnOptions, true);
   end;
end;

procedure TfrmBaseCRUD_NoDB.btnCancelRegClick(Sender: TObject);
var
   I, F : integer;
   cOldStatus, cOldPK : string;
begin
  inherited;
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
  cOldStatus := ed_Table_Status.Text;
  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';

  rc_ClearValidation( self ); // 6.0.0.0

  pgBaseCadControl.ActivePage := tabSearch;

  if ( StrToIntDef( ed_CodMaster.Hint, 0 ) > 0 ) then
  begin

      if iCurrentPage <> -1 then
         UniSession.AddJS( dbgSearchCRUD.JSName+'.store.loadPage(' + iCurrentPage.ToString + ');');
  end
  else
  begin
     rc_DefaultTitleForm;
  end;

  UpdateButtons('2');

  pgBaseCadControl.ActivePage := tabSearch;

  rc_RemoveCssClass(tabRegister, 'slide_in');
  rc_AddCssClass(tabSearch, 'slide_in');
end;

procedure TfrmBaseCRUD_NoDB.rc_DefaultTitleForm;
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

procedure TfrmBaseCRUD_NoDB.rc_UpdateLayout;
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

   bModelCrud0 := Pos( 'model-crud:0', dbgSearchCRUD.Hint ) > 0; //
   bModelCrud1 := Pos( 'model-crud:1', dbgSearchCRUD.Hint ) > 0;
   bModelCrud2 := Pos( 'model-crud:2', dbgSearchCRUD.Hint ) > 0;
   bModelCrud3 := Pos( 'model-crud:3', dbgSearchCRUD.Hint ) > 0;
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
   edquicksearch.Width    := edquicksearch.Parent.Width - 10;// 221;
   btnQuickSearch.Left    := 228;
   paSearchFilters.Anchors := [ akLeft, akTop ];        //
   paSearchFilters.Hint   := '[[scale:parent h:100%-top off:40]]'; //
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
   if ( bModelCrud3 ) then
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
      //
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
           btnSaveReg.Height    := 32;
           btnSaveReg.Font.Size := 14;

           btnCancelReg.Align     := alNone;
           btnCancelReg.Caption   := '';
           btnCancelReg.Width     := 33;
           btnCancelReg.Height    := 32;
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

   paNotFound_dbgSearchCRUD.Hint :=
      '[['+
      'center:paBaseRegSearch xy |'+
      'state-visible:empty-true ds:dsSearchMaster|'+
      ']]' ;

   UpdateButtons('2');
end;
end.

