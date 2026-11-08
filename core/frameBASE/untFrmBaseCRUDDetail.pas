//8.0.0.0
unit untFrmBaseCRUDDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniDateTimePicker, uniDBDateTimePicker,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, uniEdit, uniLabel,
  TypInfo, uniDBLookUpComboBox, uniDBComboBox, uniDBCheckBox, uniDBRadioGroup, uniDBMemo, uniDBImage, uniDBText, uniListBox,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn, uniMemo, uniDBEdit, uniSpeedButton,  str_func, System.StrUtils,
  uniScrollBox, uniPageControl, Vcl.Menus, uniMainMenu, uniTimer, uniCheckBox, uniMultiItem, uniComboBox, uniSweetAlert,
  uniHTMLFrame;

type
  TfrmBaseCRUDDetail = class(TUniForm)
    sqlMaster: TFDQuery;
    dsMaster: TDataSource;
    sqlSearchMaster: TFDQuery;
    dsSearchMaster: TDataSource;
    popMenuOptions: TUniPopupMenu;
    paBaseBackGround: TUniContainerPanel;
    paBaseTop: TUniContainerPanel;
    pgBaseCadControl: TUniPageControl;
    tabRegisterDetail: TUniTabSheet;
    paBaseCrudDetail: TUniContainerPanel;
    paDataDetail: TUniPanel;
    sboxGridBlockTab1: TUniScrollBox;
    paTitleRegDetail: TUniContainerPanel;
    paTotalizerDetail: TUniContainerPanel;
    tabSearchDetail: TUniTabSheet;
    UniScrollBox2: TUniScrollBox;
    dbgSearchCRUD: TUniDBGrid;
    mem_MASTER: TFDMemTable;
    ds_memMASTER: TDataSource;
    uniScrollBox1: TUniScrollBox;
    timerClose: TUniTimer;
    paBaseTopTitle: TUniContainerPanel;
    labTitleFrm: TUniLabel;
    paBaseButtons: TUniContainerPanel;
    labState: TUniLabel;
    ed_OldPKValue: TUniEdit;
    ed_Table_Status_OLD: TUniEdit;
    ed_FieldMasks: TUniEdit;
    ed_PK: TUniEdit;
    ed_CodMaster: TUniEdit;
    ed_Where_Search: TUniEdit;
    ed_Order_Search: TUniEdit;
    ed_Table_Status: TUniEdit;
    ed_FormOrigin_Tab: TUniEdit;
    ed_FormOrigin: TUniEdit;
    ed_Table_ItemSel: TUniEdit;
    ed_AskNewRec_AfterPost: TUniEdit;
    ed_GenNextID_OnNew: TUniEdit;
    dbgExport: TUniDBGrid;
    ExportarDados1: TUniMenuItem;
    Excel1: TUniMenuItem;
    Html1: TUniMenuItem;
    Xml1: TUniMenuItem;
    Xml2: TUniMenuItem;
    labExit: TUniLabel;
    labOptions: TUniLabel;
    labCancel: TUniLabel;
    labSave: TUniLabel;
    labEdit: TUniLabel;
    labDelete: TUniLabel;
    labNew: TUniLabel;
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
    ed_Table_Deleted_Field: TUniEdit;
    hpForActionBtns: TUniHiddenPanel;
    paNotFound_dbgSearchCRUD: TUniContainerPanel;
    imgNoRecords_dbgSearchCRUD: TUniLabel;
    labNotFound_dbgSearchCRUD: TUniLabel;
    ed_NoGenID: TUniEdit;
    ed_PK_ZerosLeft: TUniEdit;
    edQuickSearch: TUniEdit;
    btnQuickSearch: TUniBitBtn;
    htmlFrame: TUniHTMLFrame;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFormDestroy(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure dsMasterStateChange(Sender: TObject);
    procedure btnCloseFormClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure timerCloseTimer(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure dbgSearchCRUDColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure Excel1Click(Sender: TObject);
    procedure Html1Click(Sender: TObject);
    procedure Xml1Click(Sender: TObject);
    procedure Xml2Click(Sender: TObject);
    procedure dsMasterDataChange(Sender: TObject; Field: TField);
    procedure pgBaseCadControlChangeValue(Sender: TObject);
    procedure dsSearchMasterStateChange(Sender: TObject);
    procedure sqlMasterError(ASender, AInitiator: TObject; var AException: Exception);
    procedure sqlSearchMasterError(ASender, AInitiator: TObject; var AException: Exception);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure btnQuickSearchClick(Sender: TObject);

  private
    { Private declarations }
    iFirstShow : integer;

    bNoGenID, // 6.0.0.0
    bSaveMasterPK, // 6.0.0.0
    bActions,
    bModelCrud0, //
    bModelCrud1,
    bModelCrud2,
    bModelCrud3,
    bPaged     : boolean;
    cTemp, cTemp2: String;

    // translate messages
    cBTN_SEARCH_CAPTION,
    cBTN_NEW_CAPTION,
    cBTN_EDIT_CAPTION,
    cBTN_DEL_CAPTION,
    cBTN_SAVE_CAPTION,
    cBTN_CANCEL_CAPTION,
    cBTN_OPTIONS_CAPTION : string;
  public
    { Public declarations }
    procedure rc_UpdateLayout;
    procedure rc_CloseQuerys;
  end;

function frmBaseCRUDDetail: TfrmBaseCRUDDetail;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, Main,
  mkm_func_web,
  uconsts, uconsts_cfg,
  ServerModule, untFrmLookUp_Lite, mkm_gridblock, mkm_layout, mkm_validate,
  mkm_translate, mkm_anim, mkm_dbfuncs, mkm_dbcombobox;

function frmBaseCRUDDetail: TfrmBaseCRUDDetail;
begin
  Result := TfrmBaseCRUDDetail(mm.GetFormInstance(TfrmBaseCRUDDetail));
end;

procedure TfrmBaseCRUDDetail.btnEditRegClick(Sender: TObject);
var
   i : integer;
begin
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  // verifica licenca de uso | check usage license
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' );
       Abort;
  end;
  // verifica restricao do usuário - EDITING | check user restriction - EDITING
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
     pgBaseCadControl.ActivePage := tabRegisterDetail;

     if Self.FindComponent('pgComplementData' ) <> nil then
        if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
           TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

     sqlMaster.Cancel;
     sqlMaster.close;

     // percorrer todos os parametros da query
     for i := 0 to sqlMaster.ParamCount - 1 do
     begin
          if DataTypeIsNumber( dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).DataType ) then
             sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsInteger  := dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).AsInteger
          else
          if DataTypeIsString( dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).DataType ) then
             sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsString   := dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).AsString
          else
          if DataTypeIsDateTime( dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).DataType ) then
             sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsDateTime := rc_RemoveMiliseconds( dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).AsDateTime ); // 6.0.0.0
     end;

     dm_rc.rc_OpenQuery( sqlMaster );

     sqlMaster.Edit;  // feedback JOSAURO
     // 6.0.0.0
     // atualizar todos os LOOKUPs dinamicamente | update all LOOKUPs dynamically
     dm_rc.rc_LookUpUpdateData(  self , nil, false );
  end;
end;
//8.4.0.0
procedure TfrmBaseCRUDDetail.btnCancelRegClick(Sender: TObject);
var
   CompCount,I : integer;
begin

  inherited;
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';
  ed_OldPKValue.Text := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString;//8.4.0.3

  rc_ClearValidation( self ); // 6.0.0.0
  // fechar todas as querys abertas
  try
     CompCount := Self.ComponentCount;
     for i := 0 to CompCount - 1 do
     begin
       if Self.Components[I] is TFDQuery then
       begin
          if TFDQuery( Self.Components[I] ).Name <> 'sqlSearchMaster' then
          begin
             TFDQuery( Self.Components[I] ).Cancel;
          end;
       end
       else
       if Self.Components[I] is TDataSource then
       begin
          if ( TDataSource( Self.Components[I] ).DataSet.Name <> 'sqlSearchMaster' ) and
             ( TDataSource( Self.Components[I] ).DataSet.IsLinkedTo( TDataSource( Self.Components[I] ) ) ) then
          begin
             TDataSource( Self.Components[I] ).DataSet.Cancel;
          end;
       end;

     end;
     except on e:exception do
            begin
               dm_rc.rc_ShowError( mm.MSG_BUGERROR_CLOSE_QUERY );
            end;
  end;

  pgBaseCadControl.ActivePage := tabSearchDetail;
end;

procedure TfrmBaseCRUDDetail.btnDeleteRegClick(Sender: TObject);
begin

  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
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

  ed_Table_Status.Text := '';

  ed_Table_Status_OLD.Text := '';
  ed_OldPKValue.Text := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString;

  mm.varB_OperationProcessed := False;

  if not dsSearchMaster.DataSet.IsEmpty then
  begin
     mm.varB_OperationProcessed := True;

     sqlMaster.close;
     // ajuste para confirmação via SWEETALERT | adjustment for confirmation via SWEETALERT
     mm.varB_Yes := False;

     mm.varB_OperationProcessed := True;
     mm.varB_OperationProcessed := dm_rc.rc_DeleteActiveRecord( ed_Table_ItemSel.Text, sqlMaster, sqlSearchMaster , 1, True, ed_Table_Deleted_Field.Text , Self );
     if mm.varB_OperationProcessed then
        pgBaseCadControl.ActivePage := tabSearchDetail;                                                                                                                 //
  end;
end;

procedure TfrmBaseCRUDDetail.btnCloseFormClick(Sender: TObject);
begin
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  if pgBaseCadControl.ActivePage = tabRegisterDetail then
  begin
     pgBaseCadControl.ActivePage := tabSearchDetail;
  end
  else
  begin
     ed_Table_Status.Text := '';

     ed_Table_Status_OLD.Text := '';

     timerClose.Enabled := true;
     rc_MoveAnimationForm( self,
                           self.left,
                           self.left,
                           self.top,
                           -self.Height,
                           400,
                           0 ) ;
  end;
end;

procedure TfrmBaseCRUDDetail.btnSaveRegClick(Sender: TObject);
var
   CompCount,f,i : integer;
begin
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
  //[PT] se sua PK é INTEGER , STRING ou DATE e/ou AUTOINC ou a PK não deve ser sequencializada
  //[EN] if your PK is INTEGER , STRING or DATE and/or AUTOINC or the PK must not be sequential
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
  end
  else
  begin
        if not AnsiMatchStr( lowercase( ed_Table_ItemSel.Text ) , ARRAY_PK_NO_INC ) then
        begin
           if ( sqlMaster.FieldByName( Self.ed_PK.Text ).AsString = '-1' ) or
              ( Trim( sqlMaster.FieldByName( Self.ed_PK.Text ).AsString ) = '' ) then
              begin

                   dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_INVALID_CONTENT );
                   Abort;

              end;

             if DataTypeIsNumber( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
                sqlMaster.FieldByName( Self.ed_PK.Text ).AsInteger := StrToIntDef( Self.ed_CodMaster.Text , 0 )
             else
             // 6.0.0.0
             //[PT] Aqui vc pode adicionar ZEROS a esquerda...Config. em uConst  mas fora de ARRAY_PK_NO_ZERO( tab. q nao terao ZEROS )
             //[EN] Here you can add ZEROS to the left...Config. in Account but outside of ARRAY_PK_NO_ZERO (table that will not have ZEROS)
             if ed_PK_ZerosLeft.Text = 'true' then
                sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := varIIF( TABLE_PK_WITH_LEFT_ZEROS = 0, Self.ed_CodMaster.Text, Zeros( mm.varC_Code_ID, TABLE_PK_WITH_LEFT_ZEROS ) ) ;
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
    end;
  end;

  rc_UpdateDBComboBox( self, true );

  sqlMaster.Post;
  //6.0.0.0
  //mm.SQLConn.StartTransaction;
  mm.varI_ApplyUpdateErrors := sqlMaster.ApplyUpdates(-1);
  if mm.varI_ApplyUpdateErrors > 0 then
  begin
     dm_rc.rc_ApplyUpdatesError( sqlMaster, mm.varI_ApplyUpdateErrors, mm.MSG_BUGERROR_POST );
     //mm.SQLConn.Rollback;
  end
  else
  begin
     sqlMaster.CommitUpdates;
  end;
  dm_rc.rc_ShowToaster( 'success' , mm.MSG_SUCCESS_POST ,false , 'slideLeftRightFade' );

  dm_rc.rc_OpenQuery( sqlSearchMaster );

  pgBaseCadControl.ActivePage := tabSearchDetail;
end;

procedure TfrmBaseCRUDDetail.btnNewRegClick(Sender: TObject);
var
   i : integer;
begin
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
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

  pgBaseCadControl.ActivePage := tabRegisterDetail;

  if Self.FindComponent('pgComplementData' ) <> nil then
     if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
        TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

  sqlMaster.Cancel;
  sqlMaster.Close;
  rc_ClearValidation( self );
  //[PT] apenas pra dar o select dos campos se sua PK é 'INTEGER' ou STRING
  //[EN] just to select the fields if your PK is 'INTEGER' or STRING
  for i := 0 to sqlMaster.ParamCount - 1 do
  begin
       if DataTypeIsNumber( dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).DataType ) then
          sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsInteger  := -123456789
       else
       if DataTypeIsString( dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).DataType ) then
          sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsString   := '-9'
       else
       if DataTypeIsDateTime( dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).DataType ) then
          sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsDateTime := 1;
  end;

  dm_rc.rc_OpenQuery( sqlMaster );
  // inicializar possíveis "bsRgp" | initialize possible "bsRgp"
  dm_rc.rc_RgpInitialize( self );
  // "append" percorre todos registros ate o ultimo | "append" loops through all records until the last
  sqlMaster.Insert;
  // atualizar todos os LOOKUPs dinamicamente | update all LOOKUPs dynamically
  dm_rc.rc_LookUpUpdateData(  self, nil, true );
  //[PT] se sua PK é INTEGER , STRING ou DATE e/ou AUTOINC ou a PK não deve ser sequencializada
  //[EN] if your PK is INTEGER , STRING or DATE and/or AUTOINC or the PK must not be sequential
  if not AnsiMatchStr( lowercase( ed_Table_ItemSel.Text ) , ARRAY_PK_NO_INC ) then
     if DataTypeIsNumber( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
        sqlMaster.FieldByName( Self.ed_PK.Text ).AsInteger := -1
     else
     if DataTypeIsDateTime( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
        sqlMaster.FieldByName( Self.ed_PK.Text ).AsDateTime := rc_RemoveMiliseconds( now ) // 6.0.0.0
     else
        sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := '-1';

  //[PT] codigo do FORM MESTRE ( ed_CodMaster ) enviado pela função de chamada do FORM DETAIL
  //[EN] FORM MESTRE code (ed_CodMaster) sent by the FORM DETAIL calling function
  if Self.ed_CodMaster.Hint <> '' then
     sqlMaster.FieldByName( Self.ed_CodMaster.Hint ).AsInteger := StrToIntDef( mm.varC_Code_ID , 0 );
  //[PT]
  // colocar no evento btnNewReg do FORM DESTINO, o vinculo ao CODIMESTRE caso a PK seja diferente da FK, ou seja,
  // se a PK em sua tabela for diferente do campo que vincula a tabela MESTRE, caso a PK seja exatamente o campo
  // de vinculo, esta informação é adicionada dinamicamente
  // ( Veja as tabelas de relacionamento: CLIENTES_VEICULOS e CLIENTES_REVISOES )
  //
  // EXEMPLO para contas a pagar:
  //
  // codigo do FORM MESTRE
  //
  // sqlMaster.FieldByName( 'codipagar' ).AsInteger := StrToIntDef( mm.varC_Code_ID , 0 );
end;

procedure TfrmBaseCRUDDetail.btnOptionsClick(Sender: TObject);
begin
     {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
     popMenuOptions.PopupBy( TUniButton( sender ) );
end;
procedure TfrmBaseCRUDDetail.btnQuickSearchClick(Sender: TObject);
begin

end;

// 6.0.0.0
procedure TfrmBaseCRUDDetail.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  dm_rc.rc_DummyDelay; // 6.0.0.1
  dm_rc.rc_ActionBtnCellClick( self, Column.FieldName );
end;

procedure TfrmBaseCRUDDetail.dbgSearchCRUDColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
     dm_rc.rc_GridSortColumn( TUniDBGrid( Column.Grid ), Column.FieldName, Direction );
end;

procedure TfrmBaseCRUDDetail.dbgSearchCRUDDblClick(Sender: TObject);
var
   i : integer;
begin
  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';

  if not dsSearchMaster.DataSet.IsEmpty then
  begin
     pgBaseCadControl.ActivePage := tabRegisterDetail;

     if Self.FindComponent('pgComplementData' ) <> nil then
        if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
           TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

     sqlMaster.Cancel;
     sqlMaster.close;

     //[PT] percorrer todos os parametros da query. o mesmo numero de parametros é o de PK´s
     //[EN] go through all the query parameters. the same number of parameters is the number of PK's
     dm_rc.memPK.Filtered := false;
     dm_rc.memPK.Filter := 'table=' + quotedStr(lowercase(Self.ed_Table_ItemSel.Text ));
     dm_rc.memPK.Filtered := true;
     dm_rc.memPK.First;

     for i := 0 to sqlMaster.ParamCount - 1 do
     begin
          if DataTypeStrIsNumber( dm_rc.memPK.FieldByName( 'type' ).AsString ) then
             sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsInteger  := dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).AsInteger
          else
          if DataTypeStrIsString( dm_rc.memPK.FieldByName( 'type' ).AsString ) then
             sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsString   := dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).AsString
          else
          if DataTypeStrIsDateTime( dm_rc.memPK.FieldByName( 'type' ).AsString ) then
             sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsDateTime := rc_RemoveMiliseconds( dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).AsDateTime ); // 6.0.0.0

          dm_rc.memPK.next;

     end;

     dm_rc.memPK.Filtered := false;

     dm_rc.rc_OpenQuery( sqlMaster );
     // 6.0.0.0
     // atualizar todos os LOOKUPs dinamicamente | update all LOOKUPs dynamically
     dm_rc.rc_LookUpUpdateData(  self , nil, false );
  end;
end;

procedure TfrmBaseCRUDDetail.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
     dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmBaseCRUDDetail.dsMasterDataChange(Sender: TObject; Field: TField);
begin
  rc_UpdateDBComboBox( self, true );
end;

procedure TfrmBaseCRUDDetail.dsMasterStateChange(Sender: TObject);
begin
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) );
  //[PT] caso utilize algum 'componente BS_COMPONENTS DBWARE' utilize as instruções abaixo
  //     no evento "dsMasterStateChange" do respectivo DATASOURCE para renderização correta de CRUDS
  //[EN] if you use any 'BS_COMPONENTS DBWARE component' use the instructions below
  //     in the "dsMasterStateChange" event of the respective DATASOURCE for correct rendering of CRUDS
  if dsMaster.State <> dsInactive then
     dm_rc.rc_BootStrapRender( self, True );

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
        labState.Caption      := mm.LAB_STATE_B;

     ed_Table_Status.Text := 'P';
  end;

  if dsMaster.State in [ dsInsert, dsEdit ] then
  begin
     ed_OldPKValue.Text := '';
     ed_Table_Status_OLD.Text := '';
     ed_OldPKValue.Text := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString;//8.4.0.3
  end;

  //[PT] isso é feito para q os panels q contem os botoes nao troquem de ordem ao ficarem visiveis
  //[EN] this is done so that the panels that contain the buttons do not change order when they become visible
  rc_ObjectEnabled( Self, btnSearch   , false );//not ( dsMaster.State in [ dsEdit, dsInsert ] ) );
  rc_ObjectEnabled( Self, btnNewReg   , not ( dsMaster.State in [ dsEdit, dsInsert ] ) );
  rc_ObjectEnabled( Self, btnEditReg  , btnNewReg.Enabled );
  rc_ObjectEnabled( Self, btnDeleteReg, btnNewReg.Enabled );
  rc_ObjectEnabled( Self, btnSaveReg  , not btnNewReg.Enabled );
  rc_ObjectEnabled( Self, btnCancelReg, not btnNewReg.Enabled );
  rc_ObjectEnabled( Self, btnOptions  , ( btnNewReg.Enabled ) and ( popMenuOptions.Items.Count > 0 ) );
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
     labCancel.Visible  := ( not bActions ) and ( not labNew.Visible ) and ( not bModelCrud2 ) and ( not bModelCrud3 );// and ( not bModelCrud4 ); // 6.0.0.0
     labSave.Visible    := ( not bActions ) and ( not labNew.Visible ) and ( not bModelCrud2 ) and ( not bModelCrud3 );// and ( not bModelCrud4 ); // 6.0.0.0
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

  edQuickSearch.Enabled := btnNewReg.Enabled;
  rc_ObjectEnabled( Self, btnQuickSearch, edQuickSearch.Enabled );

  labExit.Enabled   := not ( dsMaster.State in [ dsEdit, dsInsert ] );
  labExit.font.Color := varIIF( labExit.Enabled, clBlack, clSilver );
  labState.Visible   := not mm.varB_Mobile_Screen_Portrait ;
  //ajustar mascaras de data
  dm_rc.rc_ApplyEditMasks( Self );
end;

procedure TfrmBaseCRUDDetail.dsSearchMasterStateChange(Sender: TObject);
begin
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) );
end;

procedure TfrmBaseCRUDDetail.Excel1Click(Sender: TObject);
begin
     dm_rc.rc_DBGridExport( dbgExport, etExcel );
end;

procedure TfrmBaseCRUDDetail.Html1Click(Sender: TObject);
begin
     dm_rc.rc_DBGridExport( dbgExport, etHTML );
end;

procedure TfrmBaseCRUDDetail.pgBaseCadControlChangeValue(Sender: TObject);
begin
     {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
end;

procedure TfrmBaseCRUDDetail.rc_CloseQuerys;
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

procedure TfrmBaseCRUDDetail.sqlMasterError(ASender, AInitiator: TObject; var AException: Exception);
begin
     dm_rc.rc_ShowError( AException.Message );
end;

procedure TfrmBaseCRUDDetail.sqlSearchMasterError(ASender, AInitiator: TObject; var AException: Exception);
begin
     dm_rc.rc_ShowError( AException.Message );
end;

procedure TfrmBaseCRUDDetail.timerCloseTimer(Sender: TObject);
begin
     timerClose.Enabled := false;
     close;
end;

procedure TfrmBaseCRUDDetail.UniFormBeforeShow(Sender: TObject);
begin
   labState.Left      := labState.Parent.Left + labState.Parent.Width - labState.Width - 10;
   rc_RenderLayout( Self, true, true, true );
end;
//8.4.0.0
procedure TfrmBaseCRUDDetail.UniFormCreate(Sender: TObject);
var
   iPos, iPos2, iWidth, iHeight,
   CompCount,I, F : integer;

   cActions, cCaption,
   cTemp, cTemp3,
   cCls, cIco, cBtn,cBtnCls,
   WhereAnd, sql: string;
   cCodMaster, //8.0.0.0
   AllPKs, cSql,
   cPk,
   cAllParams: string;
   bBool : boolean;
begin
  //7.4.0.0
  htmlFrame.HTML.Add( '<form autocomplete="off">');
  if dbgSearchCRUD.DataSource = nil then
     dbgSearchCRUD.DataSource := dsSearchMaster;

  // 6.0.0.0
  dbgExport.Top := -50;
  dbgExport.LoadMask.Enabled := false; // 6.0.0.0

  rc_UpdateLayout;

  inherited;
    case mm.varLT_Lang of

         ltpt_BR, ltpt_PT : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'Pesquisa Não Encontrada';
                   end;
         lten_US, lten_GB   : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltes_ES   : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltfr_FR   : begin
                      labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltde_DE   : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltit_IT   : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         lttr_TR    : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltru_RU    : begin
                      labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltzn_CH : begin
                      labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltin_ID : begin
                      labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltth_TH : begin
                      labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         lthi_IN : begin
                      labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltar_SA : begin
                      labNotFound_dbgSearchCRUD.Caption               := 'لا توجد سجلات';
                   end;
    end;

    if mm.CONFIG_LAYOUT_ROUND_FORM = 'ON' then
       rc_AddCssClass( Self, 'form-rounded' )
    else
       rc_AddCssClass( Self, 'form-noborder' );

    mm.varC_Form_Detail := Self;
    //8.0.0.0
    //dm_rc.rc_DBGridHidePaginationBar( dbgSearchCRUD );

    // sort
    dbgSearchCRUD.ClientEvents.UniEvents.Add(
         'store.afterCreate=function store.afterCreate(sender)' +
         '{ sender.setRemoteSort(false);﻿ }'
    );

    // from uniGUI forum: http://forums.unigui.com/index.php?/topic/9634-autofill-how-to-turn-off/
    UniSession.AddJS('$("input").attr("autocomplete", "off");');

    rc_AddCssClass( labTitleFrm, 'rc-font-light' );

    labTitleFrm.Font.Name  := mm.CONFIG_LAYOUT_APP_FONT;
    labTitleFrm.Font.Color := $002a2a2a ;
    labTitleFrm.Font.Size  := 16;
    labTitleFrm.Font.Style := [];

    //rtl
    labState.Alignment  := varIIF( ( mm.RTL ) and ( labState.Visible ), taLeftJustify, taRightJustify );

    if ( mm.varB_Mobile_Screen ) and ( mm.varB_Screen_LandScape ) then
    begin
         TUniFORM( mm.varC_Form_Detail ).Align := alNone;
         TUniFORM( mm.varC_Form_Detail ).Height := 740;
    end;

    Self.Left := ( UniSession.UniApplication.ScreenWidth div 2 ) - (  Self.Width div 2 );
    Self.Top  := 0;
    //8.5.0.0
//    rc_MoveAnimationForm( self,
//                          self.left,
//                          self.left,
//                          self.top,
//                          ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  ),
//                          400,
//                          1 ) ;

    // para criticar cada coluna no ondrawcell | to criticize each column in ondrawcell
    mm.varC_GridColName           := '';

    pgBaseCadControl.ActivePage   := tabSearchDetail;

    Self.ed_Table_ItemSel.Text    := Trim( mm.varC_Table_Detail ) ;
    Self.ed_FormOrigin.Text       := Self.Name;
    Self.ed_CodMaster.Text        := mm.varC_Code_ID;
    Self.ed_CodMaster.Hint        := Trim( lowercase( mm.varC_Code_ID_Field ) );

    Self.ed_FormOrigin_Tab.Text   := mm.varC_Selected_FormFrame_Detail ;
    Self.ed_Table_Status.Text     := mm.varC_StatusSearch_Detail ;
    Self.ed_Table_Status_OLD.Text := '';

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

    if Pos( '[[pk-show]]' , sqlMaster.Sql.Text ) > 0 then
    begin
       sqlMaster.Sql.Text := StringReplace( sqlMaster.Sql.Text, '[[pk-show]]', '[[pk]]', [rfReplaceAll] );
       dbgSearchCRUD.Hint := rc_AddHintAttr( '|showpk', dbgSearchCRUD.Hint, false );
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
                              '   FROM [[table]] tab ';
    end;
    if Pos ( '[grid]' , trim(sqlMaster.Sql.Text) ) = 0 then
    begin
        sqlMaster.SQL.Text := sqlMaster.SQL.Text +
                              '[grid]' +

                              ' SELECT [[fields]] ' +

                              ' FROM [[table]] tab ';
    end;

    mm.varC_PK_DetailTable     := dm_rc.rc_GetPrimaryKey( lowercase(Self.ed_Table_ItemSel.Text ) );

    Self.ed_PK.Text              := mm.varC_PK_DetailTable;
    Self.tag                     := StrToIntDef( mm.varC_Code_ID, 0 );

    Self.labTitleFrm.Caption     := Self.ed_FormOrigin_Tab.Text;
    Self.Caption                 := Self.ed_FormOrigin_Tab.Text;

    //[PT] configurar lookups...mascaras...etc.. preparar query [[fields]]...
    //[EN] adjust the lookup tables according to the query name
    dm_rc.rc_RenderLookUpControls( Self );
    //[PT] adionar filtro do frmBaseCRUDDetail ao frmBaseCRUD que o chamou
    //[EN] add frmBaseCRUDDetail filter to the frmBaseCRUD that called it
    if Self.ed_CodMaster.Hint <> '' then
    begin
       if ( Self.ed_Where_Search.Text <> '' ) and ( lowercase( Copy( Self.ed_Where_Search.Text , 1, 6 ) ) <> ' WHERE ' ) then
          Self.ed_Where_Search.Text := ' WHERE ' + Self.ed_Where_Search.Text;

          Self.ed_Where_Search.Text := Self.ed_Where_Search.Text +
                                       varIIF( Self.ed_Where_Search.Text = '', ' WHERE ', ' AND ' ) +  'tab.' + Self.ed_CodMaster.Hint + ' = ' + Self.ed_CodMaster.Text ;
    end;
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
    //[PT] pega o SQL de select para usar no cadastro( antes do coringa [grid] )
    //[EN] Gets the select SQL to use in the registration (before the wildcard [grid])
    sqlMaster.Close;
    sqlMaster.SQL.Text := Copy( sqlMaster.Sql.Text, 1, Pos( '[grid]' , sqlMaster.Sql.Text ) -1 );
    sqlMaster.SQL.Text := RemoveLineBreaks( sqlMaster.SQL.Text );
    //[PT] montar query com possiveis chaves compostas
    //[EN] assemble query with possible composite keys
    mm.varC_PK_DetailTable := dm_rc.rc_GetPrimaryKey( lowercase(Self.ed_Table_ItemSel.Text ) );

    dm_rc.memPK.tag := 0;

    sqlMaster.SQL.Text := sqlMaster.SQL.Text + ' WHERE 1 = 1 ';

    AllPKs := '';
    cAllParams := '';

    dm_rc.memPK.Filtered := false;
    dm_rc.memPK.Filter   := 'table=' + quotedStr(lowercase(trim(Self.ed_Table_ItemSel.Text )));
    dm_rc.memPK.Filtered := true;
    dm_rc.memPK.First;

    cSql := lowercase( sqlSearchMaster.sql.Text );
    cSql :=  Copy( cSql, 1, Pos( ' from ' , cSql ) );

    while not dm_rc.memPK.eof do
    begin
         cPk := trim(lowercase( dm_rc.memPK.FieldByName( 'pk' ).AsString ));

         AllPKs     := AllPKs + 'tab.' + cPk ;
         cAllParams := cAllParams + ' and tab.' + cPK + ' = :' + cPk;

         // Append data
         dm_rc.memGridPK.Open;

         if not dm_rc.memGridPK.Locate( 'field' , cPk , [] ) then
            dm_rc.memGridPK.AppendRecord( [ cPk ] );

         dm_rc.memPK.tag := 1;

         dm_rc.memPK.Next;

         if ( not dm_rc.memPK.eof ) and ( AllPKs <> '' ) then
            AllPKs := AllPKs + ', ';
    end;

    dm_rc.memPK.Filtered := false;
    // [[allpks]]
    // inserir no grid todas as PK´s da tabela dinamicamente | insert all PK's from the table dynamically into the grid
    dbgSearchCRUD.Tag := 0; // se nao tem ALLPKS...nao critica a exibicao das colunas | if you don't have ALLPKS...don't criticize the display of the columns
    if Pos( '[[allpks]]' , sqlSearchMaster.Sql.Text ) > 0 then
    begin
       sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text , '[[allpks]]' , AllPKs, [rfReplaceAll] );
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
    rc_ObjectEnabled( Self, btnSearch   , false );
    rc_ObjectEnabled( Self, btnNewReg   , btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnEditReg  , btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnDeleteReg, btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnSaveReg  , not btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnCancelReg, not btnSearch.Enabled );
    rc_ObjectEnabled( Self, btnOptions  , ( btnSearch.Enabled ) and ( popMenuOptions.Items.Count > 0 ) );
    if bModelCrud3 then
    begin
       btnSearch.Visible    := false;
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
    end;

    paBaseTop.Height       := varIIF( bActions or bModelCrud1 or bModelCrud2, 90, 46 );
    paBaseButtons.Width    := varIIF( bActions or bModelCrud1, 0, 37 );
    labState.Width         := varIIF( bActions or bModelCrud1, 120, 164 );
    labNew.Visible         := ( btnNewReg.Enabled ) and ( bModelCrud1 );// 6.0.0.0
    labEdit.Visible        := ( labNew.Visible ) and ( bModelCrud1 );
    labDelete.Visible      := ( labNew.Visible ) and ( bModelCrud1 );
    labOptions.Visible     := ( labNew.Visible ) and ( bModelCrud1 );
    labCancel.Visible      := ( not bActions ) and ( not labNew.Visible ) and ( not bModelCrud2 ) and ( not bModelCrud3 ); // 6.0.0.0
    labSave.Visible        := ( not bActions ) and ( not labNew.Visible ) and ( not bModelCrud2 ) and ( not bModelCrud3 ); // 6.0.0.0
    edQuickSearch.Enabled  := ( bModelCrud1 ) or ( bModelCrud3 ) ;
    //[PT] no detail, pelo menos por enquanto, não haverá opção de pesquisa
    //[EN] in the detail, at least for now, there will be no search option
    edQuickSearch.Visible  := false;
    btnQuickSearch.Visible := false;
    rc_ObjectEnabled( Self, btnQuickSearch, btnQuickSearch.Visible );
    btnCloseForm.Visible   := False;
    //[PT] Senão tiver sido definido a query no ON CREATE da nova tela herdada...
    //[EN] If the query has not been defined in the ON CREATE of the new inherited screen...
    if trim(sqlMaster.Sql.Text) = EmptyStr  then
    begin
        dm_rc.rc_ShowError( Format( mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT, [ 'sqlMaster' ] ) );
        Abort;
    end;

    if trim(sqlSearchMaster.Sql.Text) = EmptyStr  then
    begin
        dm_rc.rc_ShowError( Format( mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT, [ 'sqlSearchMaster' ] ) );
        Abort;
    end;

    sqlMaster.Sql.Text := sqlMaster.Sql.Text + cAllParams;

    Sql := trim ( sqlSearchMaster.Sql.Text );

    //[PT] form FILHO diferente do PAI, vem com um WHERE PADRAO, ref. ao vinculo PADRAO com o PAI
    //[EN] form SON different from FATHER, comes with a DEFAULT WHERE, ref. to the STANDARD bond with the FATHER
    if Pos( 'where ' , lowercasE( trim( ed_Where_Search.Text ) ) ) > 0 then
       WhereAnd := ''
    else
    if ed_Where_Search.Text <> '' then
       WhereAnd := ' AND ';

    sql := RemoveLineBreaks( sql );
    // tem um WHERE no FORM que chamou ? | is there a WHERE in the FORM that called ?
    if ed_Where_Search.Text <> '' then
       Sql := Sql + WhereAnd + ed_Where_Search.Text ;

    if ed_Order_Search.Text <> '' then
       Sql := Sql + ' ORDER BY ' + trim( ed_Order_Search.Text )
    else
    begin
       Sql := Sql + ' ORDER BY tab.' + Self.ed_PK.Text + ' ' ;
       Sql := Sql + ' DESC ';
    end;

    Sql := RemoveLineBreaks( Sql );

    sqlSearchMaster.close;
    sqlSearchMaster.Sql.Text := Sql;

    if not dm_rc.rc_OpenQuery( sqlSearchMaster ) then
    begin
       sqlSearchMaster.close;
       Abort;
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
            if TUniDBGrid( Components[f] ).DataSource <> nil then
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

    labState.Caption      := mm.LAB_STATE_B;
    //[PT] Carrega definicoes anteriores caso o cliente tenha mexido em alguma coluna...( future )
    //[EN] Loads previous definitions if the client has changed a column...(future)
    //dbgDados.Columns.Clear;
    if FileExists( mm.APP_PATH_CONTROL + 'delete_dbGridDetail_' + Trim( ed_Table_ItemSel.Text ) + '.cfg' ) then
    begin
       DeleteFile( mm.APP_PATH_CONTROL + 'delete_dbGridDetail_' + Trim( ed_Table_ItemSel.Text ) + '.cfg' );
       DeleteFile( mm.APP_PATH_CONTROL + 'dbGridDetail_' + Trim( ed_Table_ItemSel.Text ) + '.cfg' );
    end;

    //[PT] transf. pra memPAI( FDMEMTABLE ) o registro ATUAL( MESTRE / DETALHE )
    //[EN] transfer. for memPAI( FDMEMTABLE ) the CURRENT record( MASTER / DETAIL )
    Self.mem_MASTER.close;
    Self.mem_MASTER.Data := TFDQuery( mm.varC_Frame_Master.FindComponent( 'sqlMaster' ) ).Data;
    // 6.0.0.0 test action button
    //[PT] contar quantos campos tem pra ativar ou nao o FORCEFIT.
    //      FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
    //[EN] count how many fields there are to activate FORCEFIT or not.
    //      FORCEFIT works best with few fields, but doesn't work well when LOCKED is active
    dm_rc.rc_DBGridUpdateAll( Self , false, false, false );
end;

procedure TfrmBaseCRUDDetail.UniFormDestroy(Sender: TObject);
begin
  //[PT] para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no que estiver "abaixo" do MODAL
  //[EN] for when a MODAL FORM is active, do not run "dbGridUpdate" on that is "below" the MODAL
  mm.varC_Form_Modal  := nil;
  mm.varC_Form_Detail := nil;
  dm_rc.rc_CloseQuerys( Self , False, False );
end;

procedure TfrmBaseCRUDDetail.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 27 then
     begin
          if not ( dsMaster.State in [ dsEdit, dsInsert ] ) then
          begin
             mm.varB_Yes := False;
             mm.varB_No := True;
             Self.ModalResult := mrNone;

             timerClose.Enabled := true;
             rc_MoveAnimationForm( self,
                                   self.left,
                                   self.left,
                                   self.top,
                                   -self.Height,
                                   120,
                                   1 ) ;
          end
          else
             dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_REGISTER_IN_USE );
     end;
end;

procedure TfrmBaseCRUDDetail.UniFormReady(Sender: TObject);
begin
    Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );

    rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
    Self.ed_FormOrigin.Text      := mm.varC_FormSource_Search ;
end;

procedure TfrmBaseCRUDDetail.UniFormShow(Sender: TObject);
begin
  inherited;
  Self.Top  := 0;
  rc_MoveAnimationForm( self,
                        self.left,
                        self.left,
                        self.top,
                        ( mm.varI_ScreenHeight  div 2 ) - ( self.Height div 2  ),
                        120,
                        1 ) ;
end;

procedure TfrmBaseCRUDDetail.Xml1Click(Sender: TObject);
begin
     dm_rc.rc_DBGridExport( dbgExport, etXML );
end;

procedure TfrmBaseCRUDDetail.Xml2Click(Sender: TObject);
begin
     dm_rc.rc_DBGridExport( dbgExport, etCSV );
end;

procedure TfrmBaseCRUDDetail.rc_UpdateLayout;
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
                  end;
   end;

   bModelCrud0 := Pos( 'model-crud:0', dbgSearchCRUD.Hint ) > 0; //
   bModelCrud1 := Pos( 'model-crud:1', dbgSearchCRUD.Hint ) > 0;
   bModelCrud2 := Pos( 'model-crud:2', dbgSearchCRUD.Hint ) > 0;
   bModelCrud3 := Pos( 'model-crud:3', dbgSearchCRUD.Hint ) > 0;
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
   if ( bModelCrud2 ) then
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
          'width:105 mobile-v-46 |'+
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
            'width:95 mobile-v-32|' +
            'append |' +
            ']]';
            //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o caption como em DESKTOP comente a configuração acima e descomente a inferior
            //[EN] if you want, in MOBILE HORIZONTAL, to display the caption as in DESKTOP comment the configuration above and uncomment the lower one
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
          'width:266 mobile-v-115|'+ // 6.0.0.0
          //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o caption como em DESKTOP comente a configuração acima e descomente a inferior
          //[EN] if you want, in MOBILE HORIZONTAL, to display the caption as in DESKTOP comment the configuration above and uncomment the lower one
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
            'width:85 mobile-v-32|'+
            'append |' +
            ']]';
            //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o caption como em DESKTOP comente a configuração acima e descomente a inferior
            //[EN] if you want, in MOBILE HORIZONTAL, to display the caption as in DESKTOP comment the configuration above and uncomment the lower one
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
            'width:85 mobile-v-32|'+ //...
            'append |' +
            ']]';
             //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o caption como em DESKTOP comente a configuração acima e descomente a inferior
             //[EN] if you want, in MOBILE HORIZONTAL, to display the caption as in DESKTOP comment the configuration above and uncomment the lower one
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
            'width:85 mobile-v-32|'+ //...
            'append |' +
            ']]';
            //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o caption como em DESKTOP comente a configuração acima e descomente a inferior
            //[EN] if you want, in MOBILE HORIZONTAL, to display the caption as in DESKTOP comment the configuration above and uncomment the lower one
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
          'width:160 mobile-v-82|'+
          //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o caption como em DESKTOP comente a configuração acima e descomente a inferior
          //[EN] if you want, in MOBILE HORIZONTAL, to display the caption as in DESKTOP comment the configuration above and uncomment the lower one
//          'width:160 mobile-v-82 mobile-h-160|'+
          ']]';
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
            'caption-hide:mobile|'+
            'width:75 mobile-v-32|'+
            'append |' +
            ']]';
            //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o caption como em DESKTOP comente a configuração acima e descomente a inferior
            //[EN] if you want, in MOBILE HORIZONTAL, to display the caption as in DESKTOP comment the configuration above and uncomment the lower one
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
        btnCancelReg.Width     := varIIF( mm.varB_Mobile_Screen_Portrait, 32, 75 );
        btnCancelReg.Font.Size := 10;

        btnCancelReg.Hint :=
            '[['+
            'cls:' + varIIF( cBtnCls = '', 'ButtonRed', cBtnCls ) + ' |'+
            varIIF( cIcoCls = '', '', 'cls-ico:' + cIcoCls ) + ' |'+ //
            'ico:' + varIIF( cBtnIco_Cancel = '', 'fas-times', cBtnIco_Cancel ) + ' |'+ //  ico:fas-times |'+
            'caption-hide:mobile|'+
            'width:75 mobile-v-32|'+
            'append |' +
            ']]';
            //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o caption como em DESKTOP comente a configuração acima e descomente a inferior
            //[EN] if you want, in MOBILE HORIZONTAL, to display the caption as in DESKTOP comment the configuration above and uncomment the lower one
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
          'width:80 mobile-v-36|'+
          //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o caption como em DESKTOP comente a configuração acima e descomente a inferior
          //[EN] if you want, in MOBILE HORIZONTAL, to display the caption as in DESKTOP comment the configuration above and uncomment the lower one
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
            'width:75 mobile-v-32|'+
            'append |' +
            ']]';
            //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o caption como em DESKTOP comente a configuração acima e descomente a inferior
            //[EN] if you want, in MOBILE HORIZONTAL, to display the caption as in DESKTOP comment the configuration above and uncomment the lower one
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
            'width:105 mobile-v-46|' +
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
            'width:95 mobile-v-32|'+
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
          'width:74 mobile-v-34|'+
          ']]';
        btnNewReg.Margins.Bottom := 2;
        btnNewReg.Margins.Left   := 3;
        btnNewReg.Margins.Top   := 5;
        btnNewReg.Margins.Right := 3;
        btnNewReg.Align     := alRight;
        btnNewReg.Left      := 2;
        btnNewReg.Top       := 2;
        btnNewReg.Caption   := cBTN_NEW_CAPTION;
        btnNewReg.Width     := 70;
        btnNewReg.Font.Size := 10;
        btnNewReg.Hint :=
            '[['+
            'cls:' + varIIF( cBtnCls = '', 'ButtonThemeCrud', cBtnCls ) + ' |'+
            varIIF( cIcoCls = '', '', 'cls-ico:' + cIcoCls ) + ' |'+ //
            'ico:' + varIIF( cBtnIco_Insert = '', 'fas-plus', cBtnIco_Insert ) + ' |'+ //  ico:fas-plus |'+
            'caption-hide:mobile-v|'+
            'width:70 mobile-v-32|'+ //...
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
        btnEditReg.Align     := alLeft;
        btnEditReg.Left      := btnNewReg.Left + btnNewReg.Width + 2 ;
        btnEditReg.Top       := 2;
        btnEditReg.Caption   := cBTN_EDIT_CAPTION;
        btnEditReg.Width     := 70;
        btnEditReg.Font.Size := 10;

        btnDeleteReg.Align     := alLeft;
        btnDeleteReg.Left      := btnEditReg.Left + btnEditReg.Width + 2 ;
        btnDeleteReg.Top       := 2;
        btnDeleteReg.Caption   := cBTN_DEL_CAPTION;
        btnDeleteReg.Width     := 70;
        btnDeleteReg.Font.Size := 10;

      paGC.AlignWithMargins := true;
      paGC.Height         := 36;
      paGC.Align          := alRight;
      paGC.top            := 0;
      paGC.width          := varIIF( mm.varB_Mobile_Screen_Portrait, 75, 160 );
      paGC.Hint :=
          '[['+
          'width:160 mobile-v-75|'+
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
            'width:75 mobile-v-32|'+
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
            'width:75 mobile-v-32|'+
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
            'width:75 mobile-v-32|'+
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
end;

end.
