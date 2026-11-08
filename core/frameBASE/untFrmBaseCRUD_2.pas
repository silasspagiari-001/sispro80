//8.0.0.2
unit untFrmBaseCRUD_2;

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
  TfrmBaseCRUD_2 = class(TUniFrame)
    rcSweetAlert: TUniSweetAlert;
    popMenuOptions: TUniPopupMenu;
    ExportarpraEXCEL1: TUniMenuItem;
    Excel1: TUniMenuItem;
    Excel2: TUniMenuItem;
    Xml1: TUniMenuItem;
    Csv1: TUniMenuItem;
    N1: TUniMenuItem;
    sqlMaster: TFDQuery;
    dsMaster: TDataSource;
    sqlSearchMaster: TFDQuery;
    dsSearchMaster: TDataSource;
    FDSchemaAdapter1: TFDSchemaAdapter;
    hpForActionBtns: TUniHiddenPanel;
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
    ed_GenNextID_OnNew: TUniEdit;
    ed_AskNewRec_AfterPost: TUniEdit;
    dbgExport: TUniDBGrid;
    ed_PKS: TUniEdit;
    ed_OLDPKS: TUniEdit;
    ed_Table_Deleted_Field: TUniEdit;
    ed_GroupBy_Search: TUniEdit;
    ed_Having_Search: TUniEdit;
    btnDeleteReg: TUniBitBtn;
    btnEditReg: TUniBitBtn;
    btnNewReg: TUniBitBtn;
    btnSaveReg: TUniBitBtn;
    btnCancelReg: TUniBitBtn;
    btnOptions: TUniBitBtn;
    btnCloseForm: TUniBitBtn;
    btnSearchCRUD: TUniBitBtn;
    btnSearch: TUniBitBtn;
    sqlIsEmpty: TFDQuery;
    dsIsEmpty: TDataSource;
    ed_NoGenID: TUniEdit;
    ed_PK_ZerosLeft: TUniEdit;
    ed_HideMaskOff: TUniEdit;
    paBaseBackGround: TUniContainerPanel;
    paBaseTop: TUniContainerPanel;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    sboxPg: TUniScrollBox;
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    sboxTabSearch: TUniScrollBox;
    rcBlock5: TUniContainerPanel;
    btnAddRec: TUniBitBtn;
    rcBlock20: TUniContainerPanel;
    btnMenuOptions: TUniMenuButton;
    rcBlock30: TUniContainerPanel;
    edQuickSearch: TUniEdit;
    btnQuickSearch: TUniBitBtn;
    btnAdvanceSearch: TUniBitBtn;
    rcBlock300: TUniContainerPanel;
    rcBlock301: TUniContainerPanel;
    labCrudIcon: TUniLabel;
    rcBlock310: TUniContainerPanel;
    rcBlock320: TUniContainerPanel;
    labCrudTitleDetails: TUniLabel;
    rcBlock330: TUniContainerPanel;
    labCrudAlertDetails: TUniLabel;
    rcBlock340: TUniContainerPanel;
    labCrudTitleAddingDetails: TUniLabel;
    rcBlock350: TUniContainerPanel;
    labCrudAddingListDetails: TUniLabel;
    rcBlock360: TUniContainerPanel;
    btnCrudTutorial: TUniBitBtn;
    rcBlock370: TUniContainerPanel;
    btnCrudAddFirst: TUniBitBtn;
    rcBlock380: TUniContainerPanel;
    btnCrudImport: TUniBitBtn;
    rcBlock390: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock294: TUniContainerPanel;
    rcBlock296: TUniContainerPanel;
    rcBlock297: TUniContainerPanel;
    rcBlock420: TUniContainerPanel;
    dbgSearchCRUD: TUniDBGrid;
    rcBlock10: TUniContainerPanel;
    btnEditRec: TUniBitBtn;
    rcBlock15: TUniContainerPanel;
    btnDelRec: TUniBitBtn;
    tabRegister: TUniTabSheet;
    sboxTabReg: TUniScrollBox;
    paBaseSaveCancel: TUniContainerPanel;
    rcBlock430: TUniContainerPanel;
    btnSaveRec: TUniBitBtn;
    rcBlock440: TUniContainerPanel;
    btnCancelRec: TUniBitBtn;
    edSearchFilter: TUniEdit;
    rcBlock298: TUniContainerPanel;
    btnSearchAdv: TUniBitBtn;
    btnClearSearchAdv: TUniBitBtn;
    labSwtAndOr: TUniLabel;
    labAndOrSearch: TUniLabel;
    htmlFrame: TUniHTMLFrame;
    procedure UniFrameBeforeReady(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure btnAdvanceSearchClick(Sender: TObject);
    procedure sqlMasterBeforeDelete(DataSet: TDataSet);
    procedure sqlMasterBeforePost(DataSet: TDataSet);
    procedure sqlMasterError(ASender, AInitiator: TObject; var AException: Exception);
    procedure dsMasterDataChange(Sender: TObject; Field: TField);
    procedure dsMasterStateChange(Sender: TObject);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dsSearchMasterStateChange(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure Excel2Click(Sender: TObject);
    procedure FDSchemaAdapter1AfterApplyUpdate(Sender: TObject);
    procedure btnMenuOptionsClick(Sender: TObject);
    procedure Xml1Click(Sender: TObject);
    procedure Csv1Click(Sender: TObject);
    procedure pgBaseCadControlChangeValue(Sender: TObject);
    procedure labExitClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnQuickSearchClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnSearchAdvClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnAddRecClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnClearSearchAdvClick(Sender: TObject);
    procedure labSwtAndOrClick(Sender: TObject);
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
    cED_QuickSearch_EMPTY_TEXT          , // := 'Pesquisar por...';
    cBTN_AddRec_CAPTION                 , // := 'Novo';
    cBTN_EditRec_CAPTION                , // := 'Editar';
    cBTN_DelRec_CAPTION                 , // := 'Excluir';
    cBTN_MenuOptions_CAPTION            , // := 'Opções';
    cBTN_SaveRec_CAPTION                , // := 'Salvar';
    cBTN_CancelRec_CAPTION              , // := 'Cancelar';
    cBTN_SearchAdv_CAPTION              , // := 'Pesquisar';
    cBTN_ClearSearchAdv_CAPTION         , // := 'Limpar';
    cBTN_CrudImport_CAPTION             , // := 'Importar';
    cBTN_CrudTutorial_CAPTION           , // := 'Tutorial';
    cBTN_CrudAddFirst_CAPTION           , // := 'Cad. o primeiro';

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

  public
    { Public declarations }
    procedure rc_CloseQuerys;
    procedure rc_DeleteFKs;
    procedure rc_DefaultTitleForm;
    procedure rc_UpdateLayout;
    procedure btnSearchClose;
    procedure rc_BuildSearchFilters( pSearchAll : boolean = false; pContent : String = '' );
    procedure rc_RemoveFirstShowZero; // 6.0.0.0
  end;

implementation

{$R *.dfm}

uses untDM_RC, mkm_layout, MainModule, mkm_dbcombobox, mkm_func_web, uconsts, uconsts_cfg, untFrmLookUp_Lite, untFrmLookUp_Lite_model_2,
     mkm_validate, mkm_dbfuncs, mkm_translate ,mkm_layout_aux;//8.0.0.2
//8.4.0.0
procedure TfrmBaseCRUD_2.btnCancelRegClick(Sender: TObject);
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

procedure TfrmBaseCRUD_2.btnDeleteRegClick(Sender: TObject);
begin
  // verifica licenca de uso
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' );
       Abort;
  end;
  // verifica restricao do usuário - EXCLUSAO
  If not dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                    Trim( ed_Table_ItemSel.Text ) ,
                                    PT_DELETE ) then
  begin
     Abort;
  end;

  // cancela a alteracao pra poder EXCLUIR
  // ( aproveitar informacoes q estao na tela pra fazer alguma critica )
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
         dm_rc.rc_ShowMessage( format( mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE, [ ed_Table_ItemSel.Text, dbgSearchCRUD.Tag.ToString, mm.varC_LastErrorMsg ] ) );//6.0.0.0
         mm.varB_OperationProcessed := False;
         Abort;
       end;

       // ajuste para confirmação via SWEETALERT
       mm.varB_Yes := False;

       mm.varB_OperationProcessed := True;
       mm.varB_OperationProcessed := dm_rc.rc_DeleteActiveRecord( ed_Table_ItemSel.Text, sqlMaster, sqlSearchMaster , 1, True, ed_Table_Deleted_Field.Text , Self );
       if mm.varB_OperationProcessed then
       begin
          pgBaseCadControl.ActivePage := tabSearch;
          // 6.0.0.0
          rc_RemoveFirstShowZero;
          dm_rc.rc_OpenQuery( sqlIsEmpty );
          btnSearchCRUDClick( self );
       end;
  end;
  bmBookMark := nil; // 6.0.0.0
end;

procedure TfrmBaseCRUD_2.btnEditRegClick(Sender: TObject);
begin
  // verifica licenca de uso
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' );
       Abort;
  end;
  // verifica restricao do usuário - ALTERACAO
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
        // ajuste pra troca do tag por hint ( pk bigint or string ) 6.0.0.0
        //8.4.0.0 Thanks Mr. Fabio Oliveira( PKCOMPOSTA )
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

procedure TfrmBaseCRUD_2.btnAddRecClick(Sender: TObject);
begin
     btnNewRegClick( self );
end;

procedure TfrmBaseCRUD_2.btnNewRegClick(Sender: TObject);
var
   i : integer;
begin
  inherited;
  // verifica licenca de uso
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' );
       Abort;
  end;
  // verifica restricao do usuário - CADASTRO
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
  //8.0.0.0
  //[PT] Com ajuda do Sr. Gilberto Loss, encontrei conflitos no uso do bookmark e usando "recno" tudo funcionou como deveria
  //[EN] With the help of Mr. Gilberto Loss, I found conflicts in the use of the bookmark and using "recno" everything worked as it should
  iCurrentRec := dbgSearchCRUD.DataSource.DataSet.RecNo;

  rc_ClearValidation( self );
  //[PT] apenas pra dar o select dos campos se sua PK é 'INTEGER' ou STRING
  //[EN] just to select the fields if your PK is 'INTEGER' or STRING
  try
    //8.4.0.0 Thanks Mr. Fabio Oliveira( PKCOMPOSTA )
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
  //8.0.0.0
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
       // as TABELAS do RADCORE podem ser MULTIEMPRESAS, nesse caso,
       // por padrão utilizo o CAMPO: CODIEMP( CODICOMPANY ) em todas que precisam
       //
       // se a tabela tem CODIEMP, vincula...
       //
       // O Campo DATA_ALT vai servir pra uma possível SINCRONIZAÇAO DE DADOS COM MOBILE...
       //
       // Já os campos DATA_ACESSO e HORA ACESSO para controle de LOG de usuario por exemplo...
       //
       // se a tabela tem CODIEMP, DATA_ALT.etc.. vincula...
       //
       if sqlMaster.FieldList.IndexOf (  'codiemp'  ) >= 0 then
          sqlMaster.FieldByName( 'codiemp' ).AsInteger := mm.varI_Code_Company;   // codicompany

       if sqlMaster.FieldList.IndexOf ( 'date_update' ) >= 0 then               // date_change
          sqlMaster.FieldByName('date_update').AsDateTime := rc_RemoveMiliseconds( now ); // 6.0.0.0

       if sqlMaster.FieldList.IndexOf ( 'date_access' ) >= 0 then               // date_access
          sqlMaster.FieldByName('date_access').AsDateTime := date;

       if sqlMaster.FieldList.IndexOf ( 'hour_access' ) >= 0 then               // hour_access
          sqlMaster.FieldByName('hour_access').AsDateTime := time;
  end;
end;
//7.0.0.0 frmBaseCRUD_2
procedure TfrmBaseCRUD_2.btnQuickSearchClick(Sender: TObject);
var
   CompCount,i, f : integer;
   cHint,
   cWhere, cFilter,
   cAlias, cField : string;
   oObj : TUniControl;
begin
  inherited;

  pgBaseCadControl.ActivePage := tabSearch;

  cFilters := '';
  cWhere   := '';
  if edQuickSearch.Text <> '' then
  begin
     CompCount := ComponentCount;
     for f := 0 to CompCount - 1 do
     begin
        cFilter:= '';
        //8.0.0.2
        If rc_CanRender( TUniControl( Components[f] ) ) then
//        If ( Pos( 'TAction' , Components[f].ClassName ) = 0 ) and
//           ( Pos( 'THelp' , Components[f].ClassName ) = 0 ) then
        begin
           If GetPropInfo( Components[f].ClassInfo, 'Hint') <> nil then
           begin
              oObj   := TUniControl( Components[f] );
              if ( Pos( 'TUniMenuItem' , Components[f].ClassName ) > 0 ) then
                 cHint := TMenuItem(oObj).Hint
              else
                 cHint := oObj.Hint;
              cField := rc_GetHintAttr( 'search-field:', cHint );
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
     end;
  end;

  rc_BuildSearchFilters( true, edQuickSearch.Text );

  btnSearchCRUDClick( btnSearchCRUD );
  cFilters := '';
end;
//8.4.0.0
procedure TfrmBaseCRUD_2.btnSaveRegClick(Sender: TObject);
var
   CompCount,f,i : integer;
   cRemoveFirstShow : string;
begin
  inherited;

  if not rc_FormValidate( Self ) then
     Abort;

  // verifica licenca de uso
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' );
       Abort;
  end;

  // se sua PK é INTEGER , STRING ou DATE e/ou AUTOINC ou a PK não deve ser sequencializada
  // if your PK is INTEGER , STRING or DATE and/or AUTOINC or the PK must not be sequential
  if ( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType <> ftAutoInc ) and
     //( not AnsiMatchStr( lowercase( ed_Table_ItemSel.Text ) , ARRAY_PK_NO_INC ) ) then
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
           // Aqui vc pode adicionar ZEROS a esquerda...Config. em uConst  mas fora de ARRAY_PK_NO_ZERO( tab. q nao terao ZEROS )
           //if not AnsiMatchStr( ed_Table_ItemSel.Text , ARRAY_PK_NO_ZERO ) then
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

       // as TABELAS do RADCORE podem ser MULTIEMPRESAS, nesse caso,
       // por padrão utilizo o CAMPO: CODIEMP( CODICOMPANY ) em todas que precisam
       //
       // se a tabela tem CODIEMP, vincula...
       //
       // O Campo DATA_ALT vai servir pra uma possível SINCRONIZAÇAO DE DADOS COM MOBILE...
       //
       // Já os campos DATA_ACESSO e HORA ACESSO para controle de LOG de usuario por exemplo...
       //
       // se a tabela tem CODIEMP, DATA_ALT.etc.. vincula...
       //
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
  //---------------------------
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

  if not bSaveMasterPK then
  begin
     dm_rc.rc_ShowToaster( 'success' , mm.MSG_SUCCESS_POST ,false , 'slideLeftRightFade' );

     sqlSearchMaster.Close;
     // 6.0.0.0
     rc_RemoveFirstShowZero;
     dm_rc.rc_OpenQuery( sqlIsEmpty );
     // 6.0.0.0
     // para checar se está vazia e não conflitar com pesquisa q retornou vazio
     dm_rc.rc_OpenQuery( sqlSearchMaster );
     if ( bmBookMark <> nil ) then
     begin
        //6.0.0.1
        try
           dbgSearchCRUD.DataSource.DataSet.GotoBookmark( bmBookMark );
        except
        end;
        bmBookMark := nil;
     end;

     // para manter cadastrando...
     // não tem como fazermos isso aqui, pois, o código do botão SALVAR é herdado no seu formulário para poder
     // executar processos específicos após o usuário clicar em SALVAR( veja o exemplo no "frmCadUsuarios" )
     // então, para conseguir esse recurso, será necessário adicionar um código no final do evento do "btnSaveReg" do
     // seu respectivo form herdado de "frmBaseCRUD"
     //
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
            labExitClick( self ) ;
     end;
     //( future feature )
     //dbgSearchCRUD.DataSource.DataSet.RecNo := iCurrentRec;
     //8.0.0.0
     //[PT] Quando o frame é chamado sem ser MODAL( principalmente pelo LOOKUP "+" ), ele é fechado apos SALVAR
     //[EN] When the frame is called without being MODAL (mainly by LOOKUP "+"), it is closed after SAVE
     if FindComponent( 'dbgSearchCRUD' ) <> nil then
        dbgSearchCRUD.DataSource.DataSet.RecNo := iCurrentRec;
  end;
end;


procedure TfrmBaseCRUD_2.btnSearchClick(Sender: TObject);
var
   i : integer;
   cCodMaster : string;
begin
  inherited;
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  if not ( dsMaster.State in [dsEdit, dsInsert ] ) then
  begin
     // just close search options
     if TUniControl( sender ).Name <> 'labExit' then
     begin
        //8.0.0.0
        cCodMaster := rc_GetHintAttr( '_codmaster:' , ed_CodMaster.Hint );
        if ( StrToIntDef( cCodMaster, 0 ) > 0 ) then
        begin
            btnSearchCRUDClick( btnSearchCRUD );
        end
        else
            btnQuickSearchClick( self );
     end;
  end;
end;

procedure TfrmBaseCRUD_2.btnSearchClose;
begin
//  if ( ( not bModelCrud1 ) and ( paSearchFilters.tag <> 0 ) ) then
//     btnSearchClick( labExit );
end;
//8.0.0.0
procedure TfrmBaseCRUD_2.btnSearchCRUDClick(Sender: TObject);
var
  cFieldStr,
  cFieldToSearch, cAliasToSearch,
  cFieldToSearch2,cAliasToSearch2,
  cQueryToSearch, cSql, cSqlTemp, cAndOr, cWhereAnd: String;
  iPosition: integer;
  iCurrPage: integer;
begin
  inherited;

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
  //7.3.0.0
  if Trim( cQueryToSearch + ed_Where_Search.Text ) = '' then
     cWhereAnd := ' WHERE ((1=1)) '
  else
     cWhereAnd := ' WHERE ((1=1)) AND ';

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

  cFilters := '';

  rc_BuildSearchFilters( true, edQuickSearch.Text ); //7.3.0.0 search custom

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
     //8.4.0.0 pk composta
     //cSql := cSql + ' order by   tab.' + ed_PK.Text  ;
     cSql := cSql + ' order by   ' + vAllPKs  ;

     if ( strTokenCount( ed_Order_Search.Text, ',' ) = 0 ) then
        cSql := cSql + ' DESC ';
  end;

  sqlSearchMaster.close;

  if ( Pos( 'firstshow:', dbgSearchCRUD.Hint ) > 0 ) or
     ( Self.Tag <> 0 ) then // cadastro dinamico..abrir só um registro pra acelerar...
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
  //8.0.0.0
  if TUniControl( sender ).Name = 'btnSearchCRUD' then
     if ( Pos( 'firstshow:', dbgSearchCRUD.Hint ) = 0 ) then
        if sqlSearchMaster.IsEmpty then
           dm_rc.rc_ShowSweetAlertWarning( mm.MSG_RECORD_NOT_FOUND );
end;

procedure TfrmBaseCRUD_2.Csv1Click(Sender: TObject);
begin
   dm_rc.rc_DBGridExport( dbgExport, etCSV );
end;

procedure TfrmBaseCRUD_2.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
begin
  dm_rc.rc_DummyDelay; // 6.0.0.1
  btnSearchClose;
  dm_rc.rc_ActionBtnCellClick( self, Column.FieldName );
end;

procedure TfrmBaseCRUD_2.dbgSearchCRUDColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  dm_rc.rc_GridSortColumn( TUniDBGrid( Column.Grid ), Column.FieldName, Direction );
end;

procedure TfrmBaseCRUD_2.dbgSearchCRUDDblClick(Sender: TObject);
begin
  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';

  if not dsSearchMaster.DataSet.IsEmpty then
  begin
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

procedure TfrmBaseCRUD_2.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmBaseCRUD_2.dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mX := x;
  mY := y;
end;

procedure TfrmBaseCRUD_2.dsMasterDataChange(Sender: TObject; Field: TField);
begin
     rc_UpdateDBComboBox( self, true );
end;

procedure TfrmBaseCRUD_2.dsMasterStateChange(Sender: TObject);
begin
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) );
  // caso utilize algum 'componente BS_COMPONENTS DBWARE' utilize as instruções abaixo
  // no evento "dsMasterStateChange" do respectivo DATASOURCE para renderização correta de CRUDS
  if ( dsMaster.State <> dsInactive ) then
      dm_rc.rc_BootStrapRender( self, True );

  rc_DefaultTitleForm;

  // a IDEIA é manter ed_Table_Status / ed_Table_Status_OLD com o ULTIMO ESTADO operacional
  // pra poder CRITICAR alguma operacao PÓS GRAVAÇÃO no FORM( FRAME ) herdado
  // como por exemplo, a geracao do plano de contas apos cadastrar uma EMPRESA
  if dsMaster.State in [ dsEdit ] then
  begin
     //labState.Caption      := mm.LAB_STATE_E;
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
     //labState.Caption      := mm.LAB_STATE_I;
     ed_Table_Status.Text := 'I';
  end
  else
  begin
     if sqlSearchMaster.Active then
     begin
         iCurrentPage := dbgSearchCRUD.DataSource.DataSet.RecNo div dbgSearchCRUD.WebOptions.PageSize + 1;

         //labState.Caption      := mm.LAB_STATE_B;

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
  // isso é feito para q os panels q contem os botoes nao troquem de ordem
  // ao ficarem visiveis

  rc_ObjectEnabled( Self, btnSearch   , not ( dsMaster.State in [ dsEdit, dsInsert ] ) );
  rc_ObjectEnabled( Self, btnNewReg   , btnSearch.Enabled );
  rc_ObjectEnabled( Self, btnEditReg  , btnSearch.Enabled );
  rc_ObjectEnabled( Self, btnEditRec  , btnSearch.Enabled ); //7.0.0.0
  rc_ObjectEnabled( Self, btnDelRec, btnSearch.Enabled ); //7.0.0.0
  rc_ObjectEnabled( Self, btnDeleteReg, btnSearch.Enabled );
  rc_ObjectEnabled( Self, btnSaveReg  , not btnSearch.Enabled );
  rc_ObjectEnabled( Self, btnCancelReg, not btnSearch.Enabled );
  rc_ObjectEnabled( Self, btnOptions  , ( btnSearch.Enabled ) and ( popMenuOptions.Items.Count > 0 ) );

  labExit.Enabled   := not ( dsMaster.State in [ dsEdit, dsInsert ] );//( paOF.Visible ) or ( bModelCrud3 );
  labExit.font.Color := varIIF( labExit.Enabled, clBlack, clSilver );

  // para manter em cadastro
  if tabSearch.Visible <> btnSearch.Enabled then// paP.Visible then
     tabSearch.Visible := btnSearch.Enabled;//paP.Visible;

  //adjust edit masks
  dm_rc.rc_ApplyEditMasks( Self );
end;

procedure TfrmBaseCRUD_2.dsSearchMasterStateChange(Sender: TObject);
begin
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) );
end;

procedure TfrmBaseCRUD_2.Excel1Click(Sender: TObject);
begin
  dm_rc.rc_DBGridExport( dbgExport, etExcel );
end;

procedure TfrmBaseCRUD_2.Excel2Click(Sender: TObject);
begin
  dm_rc.rc_DBGridExport( dbgExport, etHTML );
end;

procedure TfrmBaseCRUD_2.FDSchemaAdapter1AfterApplyUpdate(Sender: TObject);
begin
   sqlMaster.CommitUpdates;
end;

procedure TfrmBaseCRUD_2.labExitClick(Sender: TObject);
var
   cCodMaster : string;//8.0.0.0
begin
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
     //
     //8.0.0.0
     cCodMaster := rc_GetHintAttr( '_codmaster:' , ed_CodMaster.Hint );
     if ( ed_CodMaster.Tag = 0 ) or ( StrToIntDef( cCodMaster, 0 ) > 0 ) then
     begin
         //btnSearchCRUDClick( self );
         if iCurrentPage <> -1 then
            UniSession.AddJS( dbgSearchCRUD.JSName+'.store.loadPage(' + iCurrentPage.ToString + ');')
         else
            btnSearchCRUDClick( self );
     end;
     rc_DefaultTitleForm;
  end
  else
  begin
     //v.
     if Pos( 'frmModalFrameForm', Self.Owner.Name ) > 0 then
        TUniform( rc_FindControl( Self.Owner.Name ) ).Close
     else
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
  end;
end;
//7.3.0.0
procedure TfrmBaseCRUD_2.labSwtAndOrClick(Sender: TObject);
begin
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

procedure TfrmBaseCRUD_2.pgBaseCadControlChangeValue(Sender: TObject);
begin
   {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
end;
//8.4.0.0 frmBaseCRUD_2
procedure TfrmBaseCRUD_2.rc_BuildSearchFilters( pSearchAll : boolean ; pContent : String );
var
   CompCount,i, f : integer;
   cHint,
   cWhere, cFilter,
   cAlias, cField : string;
   oObj : TUniControl;
begin
  inherited;

  pContent := edQuickSearch.Text;

  pgBaseCadControl.ActivePage := tabSearch;

  cFilters := '';
  cWhere   := '';
  if ( pContent <> '' ) then //or ( not pSearchAll ) then
  begin
     CompCount := ComponentCount;
     for f := 0 to CompCount - 1 do
     begin
        cFilter:= '';
        If ( Pos( 'TAction' , Components[f].ClassName ) = 0 ) and
           ( Pos( 'THelp' , Components[f].ClassName ) = 0 ) then
        begin
           If GetPropInfo( Components[f].ClassInfo, 'Hint') <> nil then
           begin
              oObj   := TUniControl( Components[f] );
              if ( Pos( 'TUniMenuItem' , Components[f].ClassName ) > 0 ) then
                 cHint := TMenuItem(oObj).Hint
              else
                 cHint := oObj.Hint;
              cField := rc_getHintAttr( 'search-field:', cHint );
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
                if ( DataTypeIsString( sqlSearchMaster.Fields[ i ].DataType ) ) then
                   cFilter := cWhere + ' ( ' + cField + ' like ' + QuotedStr( '%' + edQuickSearch.Text + '%' ) + ' )';

                if cFilter <> '' then
                   cFilters := cFilters + cFilter;
              end;
           end;
        end;
     end;
  end;
end;
//8.4.0.0
procedure TfrmBaseCRUD_2.rc_CloseQuerys;
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

procedure TfrmBaseCRUD_2.rc_DefaultTitleForm;
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

procedure TfrmBaseCRUD_2.rc_DeleteFKs;
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
procedure TfrmBaseCRUD_2.rc_RemoveFirstShowZero;
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

procedure TfrmBaseCRUD_2.rc_UpdateLayout;
var
   cBtnIco_Tutorial,
   cBtnIco_Import,
   cBtnIco_Search,
   cBtnIco_ClearSearch,
   cBtnIco_Insert,
   cBtnIco_Edit,
   cBtnIco_Cancel,
   cBtnIco_Delete,
   cBtnIco_Save,
   cBtnIco_Options,
   cBtnIco_Tutorial_Cls,
   cBtnIco_Import_Cls,
   cBtnIco_Search_Cls,
   cBtnIco_ClearSearch_Cls,
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
                    //labNotFound_dbgSearchCRUD.Caption   := 'Pesquisa Não Encontrada';
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
                    //
                    cED_QuickSearch_EMPTY_TEXT          := 'Pesquisar por...';
                    cBTN_AddRec_CAPTION                 := cBTN_NEW_CAPTION;
                    cBTN_EditRec_CAPTION                := cBTN_EDIT_CAPTION;
                    cBTN_DelRec_CAPTION                 := cBTN_DEL_CAPTION;
                    cBTN_MenuOptions_CAPTION            := cBTN_OPTIONS_CAPTION;
                    cBTN_SaveRec_CAPTION                := cBTN_SAVE_CAPTION;
                    cBTN_CancelRec_CAPTION              := cBTN_CANCEL_CAPTION;
                    cBTN_SearchAdv_CAPTION              := cBTN_SEARCH_CAPTION;
                    cBTN_ClearSearchAdv_CAPTION         := 'Limpar';
                    cBTN_CrudImport_CAPTION             := 'Importar';
                    cBTN_CrudTutorial_CAPTION           := 'Tutorial';
                    cBTN_CrudAddFirst_CAPTION           := 'Cad. o primeiro';
                  end;
        lten_US, lten_GB   : begin
                    //labNotFound_dbgSearchCRUD.Caption   := 'No records found';
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
                    //
                    cED_QuickSearch_EMPTY_TEXT          := 'Search for...';
                    cBTN_AddRec_CAPTION                 := cBTN_NEW_CAPTION;
                    cBTN_EditRec_CAPTION                := cBTN_EDIT_CAPTION;
                    cBTN_DelRec_CAPTION                 := cBTN_DEL_CAPTION;
                    cBTN_MenuOptions_CAPTION            := cBTN_OPTIONS_CAPTION;
                    cBTN_SaveRec_CAPTION                := cBTN_SAVE_CAPTION;
                    cBTN_CancelRec_CAPTION              := cBTN_CANCEL_CAPTION;
                    cBTN_SearchAdv_CAPTION              := cBTN_SEARCH_CAPTION;
                    cBTN_ClearSearchAdv_CAPTION         := 'Clear';
                    cBTN_CrudImport_CAPTION             := 'Import';
                    cBTN_CrudTutorial_CAPTION           := 'Tutorial';
                    cBTN_CrudAddFirst_CAPTION           := 'Add First';
                  end;
        ltes_ES   : begin
                     //labNotFound_dbgSearchCRUD.Caption   := 'Búsqueda no encontrada';;
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
                     //
                     cED_QuickSearch_EMPTY_TEXT          := 'Buscar...';
                     cBTN_AddRec_CAPTION                 := cBTN_NEW_CAPTION;
                     cBTN_EditRec_CAPTION                := cBTN_EDIT_CAPTION;
                     cBTN_DelRec_CAPTION                 := cBTN_DEL_CAPTION;
                     cBTN_MenuOptions_CAPTION            := cBTN_OPTIONS_CAPTION;
                     cBTN_SaveRec_CAPTION                := cBTN_SAVE_CAPTION;
                     cBTN_CancelRec_CAPTION              := cBTN_CANCEL_CAPTION;
                     cBTN_SearchAdv_CAPTION              := cBTN_SEARCH_CAPTION;
                     cBTN_ClearSearchAdv_CAPTION         := 'Borrar';
                     cBTN_CrudImport_CAPTION             := 'Importar';
                     cBTN_CrudTutorial_CAPTION           := 'Tutorial';
                     cBTN_CrudAddFirst_CAPTION           := 'Incluir primeiro';
                  end;
        ltfr_FR   : begin
                     //labNotFound_dbgSearchCRUD.Caption   := 'No records found';
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
                    //
                    cED_QuickSearch_EMPTY_TEXT          := 'Search for...';
                    cBTN_AddRec_CAPTION                 := cBTN_NEW_CAPTION;
                    cBTN_EditRec_CAPTION                := cBTN_EDIT_CAPTION;
                    cBTN_DelRec_CAPTION                 := cBTN_DEL_CAPTION;
                    cBTN_MenuOptions_CAPTION            := cBTN_OPTIONS_CAPTION;
                    cBTN_SaveRec_CAPTION                := cBTN_SAVE_CAPTION;
                    cBTN_CancelRec_CAPTION              := cBTN_CANCEL_CAPTION;
                    cBTN_SearchAdv_CAPTION              := cBTN_SEARCH_CAPTION;
                    cBTN_ClearSearchAdv_CAPTION         := 'Clear';
                    cBTN_CrudImport_CAPTION             := 'Import';
                    cBTN_CrudTutorial_CAPTION           := 'Tutorial';
                    cBTN_CrudAddFirst_CAPTION           := 'Add First';
                  end;
        ltde_DE   : begin
                     //labNotFound_dbgSearchCRUD.Caption   := 'No records found';
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
                    //
                    cED_QuickSearch_EMPTY_TEXT          := 'Search for...';
                    cBTN_AddRec_CAPTION                 := cBTN_NEW_CAPTION;
                    cBTN_EditRec_CAPTION                := cBTN_EDIT_CAPTION;
                    cBTN_DelRec_CAPTION                 := cBTN_DEL_CAPTION;
                    cBTN_MenuOptions_CAPTION            := cBTN_OPTIONS_CAPTION;
                    cBTN_SaveRec_CAPTION                := cBTN_SAVE_CAPTION;
                    cBTN_CancelRec_CAPTION              := cBTN_CANCEL_CAPTION;
                    cBTN_SearchAdv_CAPTION              := cBTN_SEARCH_CAPTION;
                    cBTN_ClearSearchAdv_CAPTION         := 'Clear';
                    cBTN_CrudImport_CAPTION             := 'Import';
                    cBTN_CrudTutorial_CAPTION           := 'Tutorial';
                    cBTN_CrudAddFirst_CAPTION           := 'Add First';
                  end;
        // 6.0.0.0 ( thanks to ANDREA CAMBARAU )
        ltit_IT   : begin
                     //labNotFound_dbgSearchCRUD.Caption   := 'Nessun record trovato';
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
                    //
                    cED_QuickSearch_EMPTY_TEXT          := 'Search for...';
                    cBTN_AddRec_CAPTION                 := cBTN_NEW_CAPTION;
                    cBTN_EditRec_CAPTION                := cBTN_EDIT_CAPTION;
                    cBTN_DelRec_CAPTION                 := cBTN_DEL_CAPTION;
                    cBTN_MenuOptions_CAPTION            := cBTN_OPTIONS_CAPTION;
                    cBTN_SaveRec_CAPTION                := cBTN_SAVE_CAPTION;
                    cBTN_CancelRec_CAPTION              := cBTN_CANCEL_CAPTION;
                    cBTN_SearchAdv_CAPTION              := cBTN_SEARCH_CAPTION;
                    cBTN_ClearSearchAdv_CAPTION         := 'Clear';
                    cBTN_CrudImport_CAPTION             := 'Import';
                    cBTN_CrudTutorial_CAPTION           := 'Tutorial';
                    cBTN_CrudAddFirst_CAPTION           := 'Add First';
                  end;
        lttr_TR    : begin
                     //labNotFound_dbgSearchCRUD.Caption   := 'No records found';
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
                    //
                    cED_QuickSearch_EMPTY_TEXT          := 'Search for...';
                    cBTN_AddRec_CAPTION                 := cBTN_NEW_CAPTION;
                    cBTN_EditRec_CAPTION                := cBTN_EDIT_CAPTION;
                    cBTN_DelRec_CAPTION                 := cBTN_DEL_CAPTION;
                    cBTN_MenuOptions_CAPTION            := cBTN_OPTIONS_CAPTION;
                    cBTN_SaveRec_CAPTION                := cBTN_SAVE_CAPTION;
                    cBTN_CancelRec_CAPTION              := cBTN_CANCEL_CAPTION;
                    cBTN_SearchAdv_CAPTION              := cBTN_SEARCH_CAPTION;
                    cBTN_ClearSearchAdv_CAPTION         := 'Clear';
                    cBTN_CrudImport_CAPTION             := 'Import';
                    cBTN_CrudTutorial_CAPTION           := 'Tutorial';
                    cBTN_CrudAddFirst_CAPTION           := 'Add First';
                  end;
        ltru_RU    : begin
                     //labNotFound_dbgSearchCRUD.Caption   := 'No records found';
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
                    //
                    cED_QuickSearch_EMPTY_TEXT          := 'Search for...';
                    cBTN_AddRec_CAPTION                 := cBTN_NEW_CAPTION;
                    cBTN_EditRec_CAPTION                := cBTN_EDIT_CAPTION;
                    cBTN_DelRec_CAPTION                 := cBTN_DEL_CAPTION;
                    cBTN_MenuOptions_CAPTION            := cBTN_OPTIONS_CAPTION;
                    cBTN_SaveRec_CAPTION                := cBTN_SAVE_CAPTION;
                    cBTN_CancelRec_CAPTION              := cBTN_CANCEL_CAPTION;
                    cBTN_SearchAdv_CAPTION              := cBTN_SEARCH_CAPTION;
                    cBTN_ClearSearchAdv_CAPTION         := 'Clear';
                    cBTN_CrudImport_CAPTION             := 'Import';
                    cBTN_CrudTutorial_CAPTION           := 'Tutorial';
                    cBTN_CrudAddFirst_CAPTION           := 'Add First';
                  end;
        ltzn_CH : begin
                     //labNotFound_dbgSearchCRUD.Caption   := 'No records found';
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
                    //
                    cED_QuickSearch_EMPTY_TEXT          := 'Search for...';
                    cBTN_AddRec_CAPTION                 := cBTN_NEW_CAPTION;
                    cBTN_EditRec_CAPTION                := cBTN_EDIT_CAPTION;
                    cBTN_DelRec_CAPTION                 := cBTN_DEL_CAPTION;
                    cBTN_MenuOptions_CAPTION            := cBTN_OPTIONS_CAPTION;
                    cBTN_SaveRec_CAPTION                := cBTN_SAVE_CAPTION;
                    cBTN_CancelRec_CAPTION              := cBTN_CANCEL_CAPTION;
                    cBTN_SearchAdv_CAPTION              := cBTN_SEARCH_CAPTION;
                    cBTN_ClearSearchAdv_CAPTION         := 'Clear';
                    cBTN_CrudImport_CAPTION             := 'Import';
                    cBTN_CrudTutorial_CAPTION           := 'Tutorial';
                    cBTN_CrudAddFirst_CAPTION           := 'Add First';
                  end;
        ltin_ID : begin
                     //labNotFound_dbgSearchCRUD.Caption   := 'No records found';
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
                    //
                    cED_QuickSearch_EMPTY_TEXT          := 'Search for...';
                    cBTN_AddRec_CAPTION                 := cBTN_NEW_CAPTION;
                    cBTN_EditRec_CAPTION                := cBTN_EDIT_CAPTION;
                    cBTN_DelRec_CAPTION                 := cBTN_DEL_CAPTION;
                    cBTN_MenuOptions_CAPTION            := cBTN_OPTIONS_CAPTION;
                    cBTN_SaveRec_CAPTION                := cBTN_SAVE_CAPTION;
                    cBTN_CancelRec_CAPTION              := cBTN_CANCEL_CAPTION;
                    cBTN_SearchAdv_CAPTION              := cBTN_SEARCH_CAPTION;
                    cBTN_ClearSearchAdv_CAPTION         := 'Clear';
                    cBTN_CrudImport_CAPTION             := 'Import';
                    cBTN_CrudTutorial_CAPTION           := 'Tutorial';
                    cBTN_CrudAddFirst_CAPTION           := 'Add First';
                  end;
        ltth_TH : begin
                     //labNotFound_dbgSearchCRUD.Caption   := 'No records found';
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
                    //
                    cED_QuickSearch_EMPTY_TEXT          := 'Search for...';
                    cBTN_AddRec_CAPTION                 := cBTN_NEW_CAPTION;
                    cBTN_EditRec_CAPTION                := cBTN_EDIT_CAPTION;
                    cBTN_DelRec_CAPTION                 := cBTN_DEL_CAPTION;
                    cBTN_MenuOptions_CAPTION            := cBTN_OPTIONS_CAPTION;
                    cBTN_SaveRec_CAPTION                := cBTN_SAVE_CAPTION;
                    cBTN_CancelRec_CAPTION              := cBTN_CANCEL_CAPTION;
                    cBTN_SearchAdv_CAPTION              := cBTN_SEARCH_CAPTION;
                    cBTN_ClearSearchAdv_CAPTION         := 'Clear';
                    cBTN_CrudImport_CAPTION             := 'Import';
                    cBTN_CrudTutorial_CAPTION           := 'Tutorial';
                    cBTN_CrudAddFirst_CAPTION           := 'Add First';
                  end;
        lthi_IN : begin
                     //labNotFound_dbgSearchCRUD.Caption   := 'No records found';
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
                    //
                    cED_QuickSearch_EMPTY_TEXT          := 'Search for...';
                    cBTN_AddRec_CAPTION                 := cBTN_NEW_CAPTION;
                    cBTN_EditRec_CAPTION                := cBTN_EDIT_CAPTION;
                    cBTN_DelRec_CAPTION                 := cBTN_DEL_CAPTION;
                    cBTN_MenuOptions_CAPTION            := cBTN_OPTIONS_CAPTION;
                    cBTN_SaveRec_CAPTION                := cBTN_SAVE_CAPTION;
                    cBTN_CancelRec_CAPTION              := cBTN_CANCEL_CAPTION;
                    cBTN_SearchAdv_CAPTION              := cBTN_SEARCH_CAPTION;
                    cBTN_ClearSearchAdv_CAPTION         := 'Clear';
                    cBTN_CrudImport_CAPTION             := 'Import';
                    cBTN_CrudTutorial_CAPTION           := 'Tutorial';
                    cBTN_CrudAddFirst_CAPTION           := 'Add First';
                  end;
        ltar_SA : begin
                     //labNotFound_dbgSearchCRUD.Caption   := 'لا توجد سجلات';
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
                    //
                    cED_QuickSearch_EMPTY_TEXT          := 'Search for...';
                    cBTN_AddRec_CAPTION                 := cBTN_NEW_CAPTION;
                    cBTN_EditRec_CAPTION                := cBTN_EDIT_CAPTION;
                    cBTN_DelRec_CAPTION                 := cBTN_DEL_CAPTION;
                    cBTN_MenuOptions_CAPTION            := cBTN_OPTIONS_CAPTION;
                    cBTN_SaveRec_CAPTION                := cBTN_SAVE_CAPTION;
                    cBTN_CancelRec_CAPTION              := cBTN_CANCEL_CAPTION;
                    cBTN_SearchAdv_CAPTION              := cBTN_SEARCH_CAPTION;
                    cBTN_ClearSearchAdv_CAPTION         := 'Clear';
                    cBTN_CrudImport_CAPTION             := 'Import';
                    cBTN_CrudTutorial_CAPTION           := 'Tutorial';
                    cBTN_CrudAddFirst_CAPTION           := 'Add First';
                  end;
   end;

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

   //8.0.0.0
   if Pos( 'model-crud:extra-info-off', dbgSearchCRUD.Hint ) > 0 then
   begin
     dbgSearchCRUD.Hint := StringReplace( dbgSearchCRUD.Hint, 'model-crud:extra-info-off' , 'model-crud:', [rfReplaceAll] );
     rcBlock300.Hint := '[[cols:12]]';
     rcBlock310.Hint := '[[cols:12]]';
     rc_ObjectStatus( rcBlock300, false );
     rc_ObjectStatus( rcBlock310, false );
     rcBlock420.Hint := rc_SetHintAttr( '', 'state-visible:', rcBlock420.Hint, false );
   end;

   bModelCrud0 := Pos( 'model-crud:0', dbgSearchCRUD.Hint ) > 0; //
   bModelCrud1 := Pos( 'model-crud:1', dbgSearchCRUD.Hint ) > 0;
   bModelCrud2 := Pos( 'model-crud:2', dbgSearchCRUD.Hint ) > 0;
   bModelCrud3 := Pos( 'model-crud:3', dbgSearchCRUD.Hint ) > 0;
   bModelCrud4 := Pos( 'model-crud:4', dbgSearchCRUD.Hint ) > 0; // 6.0.0.0
   //bSearchComplete := ( bModelCrud3 ) and ( Pos( '(search:full)', dbgSearchCRUD.Hint ) > 0 );
   bActions    := bModelCrud3;

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
   cBtnIco_ClearSearch := rc_GetHintAttr( 'btns-ico-clear-search:' , dbgSearchCRUD.Hint, true, true );
   cBtnIco_Insert  := rc_GetHintAttr( 'btns-ico-insert:' , dbgSearchCRUD.Hint, true, true );
   cBtnIco_Edit    := rc_GetHintAttr( 'btns-ico-edit:'   , dbgSearchCRUD.Hint, true, true );
   cBtnIco_Cancel  := rc_GetHintAttr( 'btns-ico-cancel:' , dbgSearchCRUD.Hint, true, true );
   cBtnIco_Delete  := rc_GetHintAttr( 'btns-ico-delete:' , dbgSearchCRUD.Hint, true, true );
   cBtnIco_Save    := rc_GetHintAttr( 'btns-ico-save:'   , dbgSearchCRUD.Hint, true, true );
   cBtnIco_Options := rc_GetHintAttr( 'btns-ico-options:', dbgSearchCRUD.Hint, true, true );
   cBtnIco_Tutorial := rc_GetHintAttr( 'btns-ico-tutorial:', dbgSearchCRUD.Hint, true, true );
   cBtnIco_Import := rc_GetHintAttr( 'btns-ico-import:', dbgSearchCRUD.Hint, true, true );
   if Pos( ' ', cBtnIco_Search )  > 0 then cBtnIco_Search_Cls  := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Search, true, true );
   if Pos( ' ', cBtnIco_ClearSearch )  > 0 then cBtnIco_ClearSearch_Cls  := rc_GetHintAttr( 'cls-ico:' , cBtnIco_ClearSearch, true, true );
   if Pos( ' ', cBtnIco_Insert )  > 0 then cBtnIco_Insert_Cls  := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Insert, true, true );
   if Pos( ' ', cBtnIco_Edit )    > 0 then cBtnIco_Edit_Cls    := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Edit, true, true );
   if Pos( ' ', cBtnIco_Cancel )  > 0 then cBtnIco_Cancel_Cls  := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Cancel, true, true );
   if Pos( ' ', cBtnIco_Delete )  > 0 then cBtnIco_Delete_Cls  := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Delete, true, true );
   if Pos( ' ', cBtnIco_Save )    > 0 then cBtnIco_Save_Cls    := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Save, true, true );
   if Pos( ' ', cBtnIco_Options ) > 0 then cBtnIco_Options_Cls := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Options, true, true );
   if Pos( ' ', cBtnIco_Tutorial ) > 0 then cBtnIco_Tutorial_Cls := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Tutorial, true, true );
   if Pos( ' ', cBtnIco_Import ) > 0 then cBtnIco_Import := rc_GetHintAttr( 'cls-ico:' , cBtnIco_Import, true, true );
   cBtnIco_Search  := Copy( cBtnIco_Search, 1, Pos( ' ', cBtnIco_Search ) - 1 );
   cBtnIco_ClearSearch  := Copy( cBtnIco_ClearSearch, 1, Pos( ' ', cBtnIco_ClearSearch ) - 1 );
   cBtnIco_Insert  := Copy( cBtnIco_Insert, 1, Pos( ' ', cBtnIco_Insert ) - 1 );
   cBtnIco_Edit    := Copy( cBtnIco_Edit, 1, Pos( ' ', cBtnIco_Edit ) - 1 );
   cBtnIco_Cancel  := Copy( cBtnIco_Cancel, 1, Pos( ' ', cBtnIco_Cancel ) - 1 );
   cBtnIco_Delete  := Copy( cBtnIco_Delete, 1, Pos( ' ', cBtnIco_Delete ) - 1 );
   cBtnIco_Save    := Copy( cBtnIco_Save, 1, Pos( ' ', cBtnIco_Save ) - 1 );
   cBtnIco_Options := Copy( cBtnIco_Options, 1, Pos( ' ', cBtnIco_Options ) - 1 );
   cBtnIco_Tutorial := Copy( cBtnIco_Tutorial, 1, Pos( ' ', cBtnIco_Tutorial ) - 1 );
   cBtnIco_Import := Copy( cBtnIco_Import, 1, Pos( ' ', cBtnIco_Import ) - 1 );

   Self.Color              := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
   paBaseTop.Color         := clWhite;

   // Apply cls to color buttons
   //
   btnAddRec.Hint         := rc_SetHintAttr( varIIF( cBtnCls = '', 'ButtonGreen', cBtnCls ), 'cls:', btnAddRec.Hint ) ;
   btnAddRec.Hint         := rc_SetHintAttr( varIIF( cBtnIco_Insert = '', 'fas-plus-circle', cBtnIco_Insert ), 'ico:', btnAddRec.Hint ) ;
   btnAddRec.Hint         := rc_SetHintAttr( varIIF( cIcoCls = '', '', cIcoCls ), 'cls-ico:', btnAddRec.Hint ) ;

   btnCrudAddFirst.Hint   := rc_SetHintAttr( varIIF( cBtnCls = '', 'ButtonGreen', cBtnCls ), 'cls:', btnCrudAddFirst.Hint ) ;
   btnCrudAddFirst.Hint   := rc_SetHintAttr( varIIF( cBtnIco_Insert = '', 'fas-plus-circle', cBtnIco_Insert ), 'ico:', btnCrudAddFirst.Hint ) ;
   btnCrudAddFirst.Hint   := rc_SetHintAttr( varIIF( cIcoCls = '', '', cIcoCls ), 'cls-ico:', btnCrudAddFirst.Hint ) ;

   btnEditRec.Hint        := rc_SetHintAttr( varIIF( cBtnCls = '', 'ButtonOrange', cBtnCls ), 'cls:', btnEditRec.Hint ) ;
   btnEditRec.Hint        := rc_SetHintAttr( varIIF( cBtnIco_Edit = '', 'fas-edit', cBtnIco_Edit ), 'ico:', btnEditRec.Hint ) ;
   btnEditRec.Hint        := rc_SetHintAttr( varIIF( cIcoCls = '', '', cIcoCls ), 'cls-ico:', btnEditRec.Hint ) ;

   btnDelRec.Hint         := rc_SetHintAttr( varIIF( cBtnCls = '', 'ButtonRed', cBtnCls ), 'cls:', btnDelRec.Hint ) ;
   btnDelRec.Hint         := rc_SetHintAttr( varIIF( cBtnIco_Insert = '', 'fas-minus-circle', cBtnIco_Cancel ), 'ico:', btnDelRec.Hint ) ;
   btnDelRec.Hint         := rc_SetHintAttr( varIIF( cIcoCls = '', '', cIcoCls ), 'cls-ico:', btnDelRec.Hint ) ;

   btnMenuOptions.Hint    := rc_SetHintAttr( varIIF( cBtnCls = '', 'ButtonGreen', cBtnCls ) + ' rc-btn-menu-border-off rc-btn-menu-no-padding rc-btn-menu-border-focus-off', 'cls:', btnMenuOptions.Hint ) ;
   btnMenuOptions.Hint    := rc_SetHintAttr( varIIF( cBtnIco_Options = '', 'fas-cogs', cBtnIco_Options ), 'ico:', btnMenuOptions.Hint ) ;
   btnMenuOptions.Hint    := rc_SetHintAttr( varIIF( cIcoCls = '', '', cIcoCls ), 'cls-ico:', btnMenuOptions.Hint ) ;

   btnSearchAdv.Hint      := rc_SetHintAttr( varIIF( cBtnCls = '', 'ButtonBlue', cBtnCls ), 'cls:', btnSearchAdv.Hint ) ;
   btnSearchAdv.Hint      := rc_SetHintAttr( varIIF( cBtnIco_Search = '', 'fas-search', cBtnIco_Search ), 'ico:', btnSearchAdv.Hint ) ;
   btnSearchAdv.Hint      := rc_SetHintAttr( varIIF( cIcoCls = '', '', cIcoCls ), 'cls-ico:', btnSearchAdv.Hint ) ;

   btnClearSearchAdv.Hint := rc_SetHintAttr( varIIF( cBtnCls = '', 'ButtonOrange', cBtnCls ), 'cls:', btnClearSearchAdv.Hint ) ;
   btnClearSearchAdv.Hint := rc_SetHintAttr( varIIF( cBtnIco_ClearSearch = '', 'fas-times', cBtnIco_ClearSearch ), 'ico:', btnClearSearchAdv.Hint ) ;
   btnClearSearchAdv.Hint := rc_SetHintAttr( varIIF( cIcoCls = '', '', cIcoCls ), 'cls-ico:', btnClearSearchAdv.Hint ) ;

   btnSaveRec.Hint        := rc_SetHintAttr( varIIF( cBtnCls = '', 'ButtonGreen', cBtnCls ), 'cls:', btnSaveRec.Hint ) ;
   btnSaveRec.Hint        := rc_SetHintAttr( varIIF( cBtnIco_Insert = '', 'fas-check', cBtnIco_Save ), 'ico:', btnSaveRec.Hint ) ;
   btnSaveRec.Hint        := rc_SetHintAttr( varIIF( cIcoCls = '', '', cIcoCls ), 'cls-ico:', btnSaveRec.Hint ) ;

   btnCancelRec.Hint      := rc_SetHintAttr( varIIF( cBtnCls = '', 'ButtonRed', cBtnCls ), 'cls:', btnCancelRec.Hint ) ;
   btnCancelRec.Hint      := rc_SetHintAttr( varIIF( cBtnIco_Insert = '', 'fas-times', cBtnIco_Cancel ), 'ico:', btnCancelRec.Hint ) ;
   btnCancelRec.Hint      := rc_SetHintAttr( varIIF( cIcoCls = '', '', cIcoCls ), 'cls-ico:', btnCancelRec.Hint ) ;

   btnCrudTutorial.Hint   := rc_SetHintAttr( varIIF( cBtnCls = '', 'ButtonPurple', cBtnCls ), 'cls:', btnCrudTutorial.Hint ) ;
   btnCrudTutorial.Hint   := rc_SetHintAttr( varIIF( cBtnIco_Tutorial = '', 'fas-play-circle', cBtnIco_Tutorial ), 'ico:', btnCrudTutorial.Hint ) ;
   btnCrudTutorial.Hint   := rc_SetHintAttr( varIIF( cIcoCls = '', '', cIcoCls ), 'cls-ico:', btnCrudTutorial.Hint ) ;

   btnCrudImport.Hint     := rc_SetHintAttr( varIIF( cBtnCls = '', 'ButtonPurple', cBtnCls ), 'cls:', btnCrudImport.Hint ) ;
   btnCrudImport.Hint     := rc_SetHintAttr( varIIF( cBtnIco_Import = '', 'fas-cloud-upload-alt', cBtnIco_Import ), 'ico:', btnCrudImport.Hint ) ;
   btnCrudImport.Hint     := rc_SetHintAttr( varIIF( cIcoCls = '', '', cIcoCls ), 'cls-ico:', btnCrudImport.Hint ) ;
end;
//8.4.0.0 pk composta ( analisar isso em tab. q nao tem DELETE CASCADE definidas no banco )
procedure TfrmBaseCRUD_2.sqlMasterBeforeDelete(DataSet: TDataSet);
begin
//  dm_rc.rc_DeleteFKTables( ed_Table_ItemSel.Text, ed_PK.Text, sqlSearchMaster.FieldByName( ed_PK.Text ).AsString );
end;

procedure TfrmBaseCRUD_2.sqlMasterBeforePost(DataSet: TDataSet);
begin
  rc_UpdateDBComboBox( self, false );
end;

procedure TfrmBaseCRUD_2.sqlMasterError(ASender, AInitiator: TObject; var AException: Exception);
begin
  dm_rc.rc_ShowError( AException.Message );
end;
//7.0.0.0
procedure TfrmBaseCRUD_2.btnAdvanceSearchClick(Sender: TObject);
begin
   //[PT] Este é um exemplo de quando um objeto precisa iniciar DESABILITADO e INVISÍVEL
   //     Para em RUNTIME ser apresentado de forma correta
   //[EN] This is an example of when an object needs to start DISABLED and INVISIBLE
   //     For RUNTIME to be displayed correctly
   rc_ObjectEnabled( self, rcBlock40, not rcBlock40.Enabled, true );
   rc_ObjectVisible( self, rcBlock40, not rcBlock40.Visible, true );
   //rcBlock40.Visible := rcBlock40.Enabled;
   btnClearSearchAdvClick( self );//7.3.0.0
   dm_rc.rc_ResizeBlocks( self );
end;
//7.3.0.0
procedure TfrmBaseCRUD_2.btnClearSearchAdvClick(Sender: TObject);
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
     //7.3.0.0
     If ( lowercase( Copy( oObj.Name, 1, 8 ) ) = 'edsearch' ) then
     begin
          TUniEdit(oObj).Text := '';
          if oObj is TUniComboBox then
             TUniComboBox( oObj ).ItemIndex := -1;
     end;
  end;
end;
//7.0.0.0 frmBaseCRUD_2
procedure TfrmBaseCRUD_2.btnSearchAdvClick(Sender: TObject);
begin
  inherited;
  btnSearchCRUDClick( self );
  dm_rc.rc_GridPaginatorUpdatePages( dbgSearchCRUD );//7.4.0.0
  edSearchFilter.Text := '';
end;

procedure TfrmBaseCRUD_2.UniFrameBeforeReady(Sender: TObject);
begin
   // dm_rc.rc_ResizeBlocks( Self, false, false );
end;
// RC_CORE
// Doc Link [PT] https://radcore.pro.br/web/help/pt/RenderizandooLayout.html
//          [EN] https://radcore.pro.br/web/help/en/LayoutRender.html
//8.4.0.0
procedure TfrmBaseCRUD_2.UniFrameCreate(Sender: TObject);
var
   iPos, iPos2, iWidth, iHeight,
   CompCount,I, F : integer;
   cPermissionField,//8.4.0.0
   cActions, cCaption,
   cTemp, cTemp3,
   cCls, cIco, cBtn,cBtnCls,
   cTagString, // 6.0.0.0
   cSql : string;

   cCodMaster,//8.0.0.0
   //AllPKs,//8.4.0.0 pk composta
   cPk : string;
   bBool : boolean;
begin
   //7.4.0.0
   htmlFrame.HTML.Add( '<form autocomplete="off">');
   // from uniGUI forum: http://forums.unigui.com/index.php?/topic/9634-autofill-how-to-turn-off/
   UniSession.AddJS('$("input").attr("autocomplete", "off");');
   paBaseBackGround.Margins.Left   := mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET.ToInteger;
   paBaseBackGround.Margins.Right  := mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET.ToInteger;
   paBaseBackGround.Margins.Top    := 5;//mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET.ToInteger;
   paBaseBackGround.Margins.Bottom := mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET.ToInteger;
   paBaseBackGround.AlignWithMargins := true;
   paBaseBackGround.Align := alClient;

//   rc_BringToFront( paSearchFilters );

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

   rc_RenderLayout( Self, false, false, true, false );

//   rc_BringToFront( paSearchFilters );


   iCurrentPage := -1;

   dbgExport.Top := -50;
   dbgExport.LoadMask.Enabled := false; // 6.0.0.0
   mm.varC_CustomMsg := '';

    rc_ObjectEnabled( Self, btnSearch   , not ( dsMaster.State in [ dsEdit, dsInsert ] ) );
    rc_ObjectEnabled( Self, btnNewReg   , btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnEditReg  , btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnEditRec  , btnSearch.Enabled ); //7.0.0.0
    rc_ObjectEnabled( Self, btnDelRec, btnSearch.Enabled ); //7.0.0.0
    rc_ObjectEnabled( Self, btnDeleteReg, btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnSaveReg  , not btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnCancelReg, not btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnOptions  , ( btnSearch.Enabled ) and ( popMenuOptions.Items.Count > 0 ) );

    labExit.font.Color := varIIF( labExit.Enabled, clBlack, clSilver );

    tabSearch.Visible  := btnSearch.Enabled;// paP.Visible;

    rc_AddCssClass( labTitleForm, 'rc-font-light' );

    labTitleForm.Font.Name  := mm.CONFIG_LAYOUT_APP_FONT;
    labTitleForm.Font.Color := $002a2a2a ;//clBlack;
    labTitleForm.Font.Size  := 16;
    labTitleForm.Font.Style := [];

    // guide tour
    cTemp := rc_GetAttribute( btnQuickSearch );
    //rtl
    if ( mm.RTL ) then //and ( labState.Visible ) then
       btnQuickSearch.Hint := '[[cls:ButtonThemeCrud-no-border-right |ico:fas-search |'
    else
       btnQuickSearch.Hint := '[[cls:ButtonThemeCrud-no-border-left |ico:fas-search |';
    btnQuickSearch.Hint := btnQuickSearch.Hint  + cTemp + '|]]';

    // deixar  invisivel pra ganhar mais espaço vertical
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
    //    Self.ed_FormOrigin_Tab.Text := mm.varC_Selected_FormFrame ;

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
    //8.4.0.0 no-paged ( tip from MARCO AURÉLIO )
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
       //8.4.0.0
       sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text ,
                                                  '[[grid-btn:edo]]' ,
                                                  '[[grid-btn:edit]] ' +
                                                  '[[grid-btn:delete]] ',
                                                  //'[[grid-btn:options]] ' ,
                                                  [rfReplaceAll] );
    end;
    // 6.0.0.0
    // action buttons
    bActions := dm_rc.rc_ActionBtnsRender( Self, dbgSearchCRUD );
    if bActions then
    begin
       rcBlock10.Visible := false;
       rcBlock10.Enabled := false;
       rcBlock15.Visible := false;
       rcBlock15.Enabled := false;
       //8.3.0.0
       rcBlock5.Hint     := rc_SetHintAttr( 'xs-5 sm-5 md-2', 'cols:' , rcBlock5.Hint );
       rcBlock20.Hint    := rc_SetHintAttr( 'xs-7 sm-7 md-2', 'cols:' , rcBlock20.Hint );
       rcBlock30.Hint    := rc_SetHintAttr( 'xs-12 sm-12 md-8', 'cols:' , rcBlock30.Hint );
    end;

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
       dm_rc.rc_DBGridUpdateAll( Self , false, false, false );
    end;
    // 6.0.0.0
    //[PT] para checar se está vazia e não conflitar com pesquisa q retornou vazio
    //[EN] to check if it is empty and not conflict with a search that returned empty
    sqlIsEmpty.SQL.Text := ' Select ' + Self.ed_PK.Text +
                           ' From ' + Trim( Self.ed_Table_ItemSel.Text ) +
                           ' Where 1=1 ' +
                           ' Order by ' + Self.ed_PK.Text ;
    if ( mm.CONFIG_DATABASE = 'SQLSERVER' ) or ( mm.CONFIG_DATABASE = 'ORACLE' ) then
       sqlIsEmpty.SQL.Text := sqlIsEmpty.SQL.Text + ' ' + ' OFFSET  1 ROWS FETCH NEXT 1 ROWS ONLY ;'
    else
    if ( mm.CONFIG_DATABASE = 'MYSQL' ) or ( mm.CONFIG_DATABASE = 'PGSQL' ) or ( mm.CONFIG_DATABASE = 'SQLITE' ) then
       sqlIsEmpty.SQL.Text := sqlIsEmpty.SQL.Text + ' LIMIT 1 ;'
    else
    if ( mm.CONFIG_DATABASE = 'FIREBIRD' ) then
       sqlIsEmpty.SQL.Text := sqlIsEmpty.SQL.Text + ' ROWS 1 ;';
    dm_rc.rc_OpenQuery( sqlIsEmpty );
end;

procedure TfrmBaseCRUD_2.UniFrameDestroy(Sender: TObject);
begin
  dm_rc.rc_CloseQuerys( Self , False, False );
end;

procedure TfrmBaseCRUD_2.UniFrameReady(Sender: TObject);
var
   i : integer;
   cCodMaster : string;//8.0.0.0
begin
    dm_rc.rc_ResizeBlocks( Self, true, true );

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
            edQuickSearch.Text := IntToStr( i );
            btnSearchCRUDClick( btnSearchCRUD );
            case ed_CodMaster.Tag of
                 //-1 : dbgSearchCRUDDblClick( dbgSearchCRUD );
                 -2 : btnEditRegClick( btnEditReg );
                 //-3 : btnNewRegClick( btnNewReg );
                 -3 : dbgSearchCRUDDblClick( dbgSearchCRUD );
            end;

            edQuickSearch.Text := '';
       end
       else
       begin

          mm.varI_Temp1 := 0;
          //8.0.0.0
          btnQuickSearchClick( self );//btnSearchCRUDClick( self );
          //[PT] contar quantos campos tem pra ativar ou nao o FORCEFIT.
          //      FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
          //[EN] count how many fields there are to activate FORCEFIT or not.
          //      FORCEFIT works best with few fields, but doesn't work well when LOCKED is active
          dm_rc.rc_DBGridUpdateAll( Self , false, false, true);
       end;
    end;

end;
procedure TfrmBaseCRUD_2.btnMenuOptionsClick(Sender: TObject);
begin
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
  popMenuOptions.PopupBy( TUniControl( sender ) );
end;

procedure TfrmBaseCRUD_2.Xml1Click(Sender: TObject);
begin
   dm_rc.rc_DBGridExport( dbgExport, etXML );
end;

initialization
   RegisterClass( TfrmBaseCRUD_2 );

end.


