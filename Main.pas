unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, System.TypInfo,
  Controls, dateutils,//6.0.0.1
  // feedback: Mesut from Turkey
  {$ifdef LINUX}
  System.UIConsts,
  {$endif}
  Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniPanel,
  uniGUIFrame, uniGUIJSUtils , StrUtils, IniFiles, uconsts, uconsts_cfg,   str_func,
  uniHTMLFrame, uniTreeView, uniTreeMenu,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.Dialogs, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  IdBaseComponent,  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, uniMultiItem, uniListBox, uniImageList, uniImage, Vcl.Imaging.pngimage,
  uniLabel, uniComboBox, uniEdit, uniPageControl, uniChart, uniScrollBox, UniDBEdit, UniDBComboBox,
  uniDBLookupComboBox, uniDBDateTimePicker,  //8.0.0.0
  uniButton, uniThreadTimer, uniURLFrame, uniBitBtn, uniBasicGrid,
  uniDBGrid, uniCanvas, uniMemo, uniDBMemo, Vcl.Menus, uniMainMenu, uniTimer, uniCheckBox, uniDateTimePicker, uniScreenMask;

type
  TMainForm = class(TUniForm)
    btnFloatingFAB: TUniHTMLFrame;
    htmlFrame: TUniHTMLFrame;
    paCompanies: TUniPanel;
    dbgCompanies: TUniDBGrid;
    paBtns: TUniContainerPanel;
    btnEnter: TUniBitBtn;
    btnExit: TUniBitBtn;
    paTitleSelectCompanyTitle: TUniContainerPanel;
    labSelectCompanyTitle: TUniLabel;
    sboxMain: TUniScrollBox;
    paBackGround: TUniContainerPanel;
    pgGeneral: TUniPageControl;
    tabDashBoard: TUniTabSheet;
    paGeral: TUniContainerPanel;
    sboxGridBlock: TUniScrollBox;
    paLayoutTopo: TUniContainerPanel;
    btnMenu: TUniLabel;
    labbtnExit: TUniLabel;
    btnCfg: TUniLabel;
    btnNotifications: TUniLabel;
    labCompanyName: TUniLabel;
    paBS_Tabs: TUniContainerPanel;
    bsTabs_Main: TUniLabel;
    paLayoutMainMenu: TUniContainerPanel;
    UniTreeMainMenuClone: TUniTreeMenu;
    paLayoutMenuCfgVersion: TUniContainerPanel;
    paLayoutLogo: TUniContainerPanel;
    labAppName: TUniLabel;
    paSearchTop: TUniContainerPanel;
    btnSearch: TUniLabel;
    labAdm: TUniLabel;
    labFullScr: TUniLabel;
    labFullScrExit: TUniLabel;
    labAppVersion: TUniLabel;
    paSearchEdit: TUniContainerPanel;
    SearchEdit: TUniEdit;
    paLayoutBgUser: TUniPanel;
    paImgLoadMask: TUniContainerPanel;
    labUser: TUniLabel;
    UniTreeMainMenu: TUniTreeMenu;
    paLayoutBottom: TUniContainerPanel;
    paRoundImg: TUniContainerPanel;
    imgAppIcon: TUniImage;
    imgUser: TUniLabel;
    paUserIMG: TUniImage;
    paNotifications: TUniPanel;
    paTopBtns: TUniContainerPanel;
    paCal: TUniContainerPanel;
    paCalendar: TUniContainerPanel;
    UniLabel1: TUniLabel;
    labCalendar: TUniLabel;
    paMail: TUniContainerPanel;
    paEmail: TUniContainerPanel;
    UniLabel2: TUniLabel;
    labEmail: TUniLabel;
    paPay: TUniContainerPanel;
    paPayments: TUniContainerPanel;
    UniLabel3: TUniLabel;
    labPayment: TUniLabel;
    paBtmBtns: TUniContainerPanel;
    paMsg: TUniContainerPanel;
    paMessages: TUniContainerPanel;
    UniLabel5: TUniLabel;
    labMessages: TUniLabel;
    paTkt: TUniContainerPanel;
    paTickets: TUniContainerPanel;
    UniLabel6: TUniLabel;
    labTickets: TUniLabel;
    paTsk: TUniContainerPanel;
    paTodo: TUniContainerPanel;
    UniLabel4: TUniLabel;
    labToDo: TUniLabel;
    procedure UniTreeMainMenuClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure TabSheetClose(Sender: TObject; var AllowClose: Boolean);
    procedure labbtnExitClick(Sender: TObject);
    procedure htmlFrameAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure btnMenuClick(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure SearchEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCfgClick(Sender: TObject);
    procedure btnNotificationsClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure SearchEditExit(Sender: TObject);
    procedure pgGeneralChangeValue(Sender: TObject);
    procedure UniFormScreenResize(Sender: TObject; AWidth, AHeight: Integer);
    procedure labFullScrClick(Sender: TObject);
    procedure labAppVersionClick(Sender: TObject);
    procedure paCalendarClick(Sender: TObject);
    procedure paEmailClick(Sender: TObject);
    procedure paPaymentsClick(Sender: TObject);
    procedure paMessagesClick(Sender: TObject);
    procedure paTicketsClick(Sender: TObject);
    procedure paTodoClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure labCompanyNameClick(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    //8.1.0.0 [PT] o controle Autoclose foi desativado e a abertura do MicroMenu transferida para um evento ExtJs
    //        [EN] The Autoclose control has been disabled and the MicroMenu opening has been transferred to an ExtJs event
    // thanks for bugtracker: ALTERDATA
    //procedure paLayoutMainMenuMouseEnter(Sender: TObject);
    //procedure paBackGroundMouseEnter(Sender: TObject);
  private
    { Private declarations }
    cLatitude, cLongitude : string;
    PSString : string;
    cMSG_MOBILE_KB_ANYPLACE,
    cMSG_MENU_TRIGGER_ERROR,
    cMSG_MENU_TRIGGER_ERROR2,
    cMSG_MENU_CREATE_ERROR : string;
  public
    { Public declarations }
    procedure rc_SearchTree(const AText: string);
    // 6.0.0.0
    procedure rc_AddFormFrameInTab( pMenu           : TUniTreeMenu ;
                                    pFormFrameTitle : string = '';
                                    pTableName      : string = '';
                                    pFormFrameName  : string = '';
                                    pIsMenuReport   : Boolean = false;
                                    pIsModal        : Boolean = false;
                                    pCallFormOp     : TRCAddFormParamType = aftNone;
                                    pRecord         : integer = 0 ;
                                    pParent         : TComponent = nil ;
                                    pSync           : Boolean = true ;
                                    pCloseMenu      : Boolean = false ;
                                    pTagString      : string = '' ;  // 6.0.0.0
                                    pGetThisPK      : string = '' ); // 6.0.0.0

    procedure rc_GetGeoPosition;
    procedure rc_GetPublicIP; //rc_GetMyIP; //7.3.0.0
    procedure rc_UpdateFloatButton;
    procedure rc_CloseNotifications( pOffSet : integer = 20 ); //8.0.0.0
    procedure rc_UpdateMainControls;
    procedure rc_MainMenuClick( sender : TObject );
    procedure rc_ShowGoogleMap(pSource, pDest : string; pNameWindow : string = '' );//8.0.0.0 //procedure rc_ShowGoogleMap(pLat, pLong : string );
    procedure rc_UpdateThemeColors;
    // 6.0.0.0
    procedure rc_UpdateMenuModel( pRebuild : boolean = false );
    procedure rc_HideMenuMask( sender : TObject ); // 6.0.0.0 menu mask
    procedure rc_ForceLookUpsToClose;
    //8.0.0.0
    procedure rc_MainMenuOnCreateConfig;
    procedure rc_MainMenuTranslateMessages;
    procedure rc_MainMenuRender;
    procedure rc_MainMenuScripts;
    procedure rc_MainMenuOnScreenResize(Sender: TObject; AWidth, AHeight: Integer);

  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication,
  uMenu_BASICS, uMenu_TOOLS, uMenu_MOVEMENT, uMenu_OTHERS, uMenu_REPORTS,
  mkm_menus, untdm_rc,mkm_procedures,
  ServerModule, uVersion, mkm_func_web,
  untFrmTHEMES, untFrmLookUp_Lite, mkm_graphs,
  mkm_gridblock, mkm_layout, mkm_anim, mkm_translate, mkm_login, untFrmBaseCRUD, mkm_createcomponents, untFrmBaseCRUD_2, untFrmLookUp_Lite_model_2,
  mkm_layout_aux_collapse;//8.0.0.0

function MainForm: TMainForm;
begin
  Result := TMainForm(mm.GetFormInstance(TMainForm));
end;

procedure TMainForm.SearchEditChange(Sender: TObject);
begin
     if Trim( SearchEdit.Text ) = '' then
     begin
          dm_rc.rc_BuildMainMenu( SearchEdit.Text, UniTreeMainMenu );
     end;
end;
//8.0.0.0
procedure TMainForm.btnSearchClick(Sender: TObject);
begin
    paSearchEdit.Left := 4;
    paSearchEdit.tag := btnSearch.Left;

    rc_jQueryAnimate( paSearchEdit, 'width' , MAIN_MENU_ITEM_MAXWIDTH.ToString, '200' );
    rc_Anim( btnSearch, 'left', '-200', '0.8', gsEaseBack, '0.8', gsEaseTypeOut );

    dm_rc.rc_SetFocus( SearchEdit );
end;
// 6.0.0.0
procedure TMainForm.SearchEditExit(Sender: TObject);
begin
     rc_jQueryAnimate( paSearchEdit, 'width' , '', '250' );
     rc_Anim( btnSearch, 'left', inttostr( paSearchEdit.tag ), '0.8', gsEaseBack, '0.8', gsEaseTypeOut );
     //UniTreeMainMenu.SingleExpand := True; // 6.0.0.0
end;
// 6.0.0.0
procedure TMainForm.SearchEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if key = 13 then
     begin
          //[PT]
          // para versoes antigas do uniGUI, comente a linha abaixo
          // caso sua pesquisa esteja duplicando os itens
          //[EN]
          // for older uniGUI versions, comment out the line below
          // in case your search is duplicating items
          //UniTreeMainMenu.SingleExpand := False; //6.0.0.0

          dm_rc.rc_BuildMainMenu( SearchEdit.Text, UniTreeMainMenu );
     end;
end;
// 6.0.0.0
procedure TMainForm.labAppVersionClick(Sender: TObject);
begin
     rc_RemoveCssClass( labAppVersion, 'rc-handshake' );
end;

procedure TMainForm.labbtnExitClick(Sender: TObject);
begin
    Close;
    UniApplication.Restart;
end;

procedure TMainForm.labCompanyNameClick(Sender: TObject);
var
   cMSG : string;
begin
     if pgGeneral.PageCount-1 = 0 then
     begin
        dm_rc.rc_ShowHideObject( labCompanyName,
                                 paCompanies,
                                 paLayoutMainMenu.Width + paLayoutTopo.Left - 120,
                                 9999,
                                 1,
                                 false,
                                 ( paCompanies.Tag = 0 )
                                  );
     end
     else
     begin
        case mm.varLT_Lang of

             ltpt_BR, ltpt_PT : begin
                         cMSG := 'Feche todas as abas para fazer a troca de empresa.' ;
                       end;
             lten_US, lten_GB   : begin
                         cMSG := 'Close all tabs to switch companies.' ;
                       end;
             ltes_ES   : begin
                         cMSG := 'Cierra todas las pestañas para cambiar de empresa.' ;
                       end;
             ltfr_FR   : begin
                          cMSG := 'Close all tabs to switch companies.' ;
                       end;
             ltde_DE   : begin
                         cMSG := 'Close all tabs to switch companies.' ;
                       end;
             ltit_IT   : begin
                         cMSG := 'Close all tabs to switch companies.' ;
                       end;
             lttr_TR    : begin
                         cMSG := 'Close all tabs to switch companies.' ;
                       end;
             ltru_RU    : begin
                          cMSG := 'Close all tabs to switch companies.' ;
                       end;
             ltzn_CH : begin
                         cMSG := 'Close all tabs to switch companies.' ;
                       end;
             ltin_ID : begin
                         cMSG := 'Close all tabs to switch companies.' ;
                       end;
             ltth_TH : begin
                         cMSG := 'Close all tabs to switch companies.' ;
                       end;
             lthi_IN : begin
                         cMSG := 'Close all tabs to switch companies.' ;
                       end;
             ltar_SA : begin
                         cMSG := 'Close all tabs to switch companies.' ;
                       end;
        end;
        dm_rc.rc_ShowSweetAlertSimple( cMSG );
     end;
end;

procedure TMainForm.labFullScrClick(Sender: TObject);
begin
     Self.Tag := varIIF( Self.Tag = 0, 1, 0 );

     if Self.Tag = 1 then
     begin
          labFullScr.Visible := false;
          labFullScrExit.Left := labFullScr.Left;
          labFullScrExit.Visible := true;
     end
     else
     begin
          labFullScrExit.Visible := false;
          labFullScr.Visible := true;
     end;
end;

procedure TMainForm.rc_SearchTree(const AText: string);
var
  S, SString : string;
  I : Integer;
  aExpand : Boolean;
begin
  SString := Trim(AText);
  if SString<>PSString then
  begin
    PSString := LowerCase(SString);
    if (Length(PSString) > 1) or (PSString = '') then
    begin
      aExpand := PSString<>'';
      UniTreeMainMenu.BeginUpdate;
      try
        UniTreeMainMenu.ResetData;

        for I := 0 to UniTreeMainMenu.Items.Count - 1 do
        begin
          S := LowerCase( UniTreeMainMenu.Items[I].Text);

          UniTreeMainMenu.Items[I].Visible := (Length(PSString) = 0) or (Pos(PSString, S)>0);
          UniTreeMainMenu.Items[I].Expanded := aExpand;
        end;
      finally
        UniTreeMainMenu.EndUpdate;
      end;
    end;
  end;
end;

procedure TMainForm.btnEnterClick(Sender: TObject);
begin
    //[PT] as variáveis abaixo serão criticadas no ACESSO as telas/forms, ao CADASTRAR, ALTERAR, EXCLUIR etc
    //[EN] the variables below will be criticized in ACCESS the screens / forms, when REGISTERING, CHANGING, DELETING etc.
    mm.varC_Blocked         := mm.VALUE_NO;  //dm_rc.CUSTOMER_LICENCE.FieldByName( 'bloqueado').AsString;
    mm.varC_Locked          := mm.VALUE_NO;  //dm_rc.CUSTOMER_LICENCE.FieldByName( 'travado').AsString;
    mm.varI_Device_Licences := 3;            //dm_rc.CUSTOMER_LICENCE.FieldByName( 'licencas').AsInteger;
    if ( mm.varC_Locked = mm.VALUE_YES ) then
    begin
         dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' );
         labCompanyNameClick( self );
         Exit;
    end
    else
    begin
        //[PT] permissão de acesso se o usuario for de outra empresa
        //[EN] access permission if the user is from another company
        
        if ( ( dm_rc.memUsers.FieldByName( 'codiemp' ).AsInteger <> mm.varI_Code_Company ) and
           ( dm_rc.memUsers.FieldByName('master').AsString <> '1' ) and //mm.VALUE_YES ) and //6.0.0.0
           ( dm_rc.rc_GetTotRecords( mm.varB_IsNot_API,
                                     'usuarios_empresa',
                                     'codiemp = ' + dm_rc.rc_IntToString( dm_rc.sqlCompanies.FieldByName('codigo').AsInteger ) +
                                     ' and codiuser = ' + dm_rc.rc_IntToString( dm_rc.memUsers.FieldByName('codigo').AsInteger ) ) = 0 ) ) then
        begin
             dm_rc.rc_ShowSweetAlert( mm.MSG_WARNING, mm.MSG_COMPANY_USER_OTHER, 'warning'  );
             labCompanyNameClick( self );
             Exit;
        end
        else
        
        begin
           //[PT] pra atualizar o cod. de func. do cad. de usuario pela empresa q logou SE NAO FOR O MASTER
           //[EN] to update the code. of function. of the cad. username by the company that logged in IF IT IS NOT THE MASTER
           (*<prj-nousersform-master-3>*)if dm_rc.memUsers.FieldByName('master').AsString <> '1' then //mm.VALUE_YES then //7.1.0.0
           begin
               dm_rc.memTemp.Close;
               dm_rc.memTemp.filtered := false;
               dm_rc.memTemp.Data := dm_rc.rc_GetRecord( mm.varB_IsNot_API ,
                                                         True,
                                                         ' select codigo,codiemp,nome,email,senha,master,codifunc,avatar ' +
                                                         ' from ' + dm_rc.rc_DBSchema + 'usuarios ' + //6.1.0.0
                                                         ' where email = ' + QuotedStr( dm_rc.memUsers.FieldByName('email').AsString ) +
                                                         ' and codiemp = ' + dm_rc.sqlCompanies.FieldByName('codigo').AsString +
                                                         ' order by codigo' );
               if mm.varC_LastErrorMsg <> '' then
               begin
                   dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
                   labCompanyNameClick( self );
                   Exit;
               end;

               if not dm_rc.memTemp.IsEmpty then
               begin
                 dm_rc.memUsers.Close;
                 dm_rc.memUsers.filtered := false;
                 dm_rc.memUsers.Data := dm_rc.memTemp.Data;
                 //[PT] abre a tabela USUARIOS_RESTRICOES. Esta tabela contém a lista de permissões definidas para cada usuário
                 //[EN] opens the RESTRICTION table. This table contains the list of permissions defined for each user
                 dm_rc.memUsersPermissions.Close;
                 dm_rc.memUsersPermissions.Data := dm_rc.rc_GetRecord( mm.varB_IsNot_API ,
                                                                       False,
                                                                       ' select * ' +
                                                                       ' from ' + dm_rc.rc_DBSchema + 'usuarios_restricoes ' + //6.1.0.0
                                                                       ' where codiuser = ' + dm_rc.memUsers.FieldByName('codigo').AsString );
                 if mm.varC_LastErrorMsg <> '' then
                 begin
                     dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
                     labCompanyNameClick( self );
                     Exit;
                 end;

               end;
           end;
           // SELECIONAR EMPRESA / SELECT COMPANY
           mm.varI_Code_Company     := dm_rc.sqlCompanies.FieldByName('codigo').AsInteger;
           mm.varC_CompanyName      := dm_rc.sqlCompanies.FieldByName('descricao').AsString;
           mm.varI_Code_CompanyMain := dm_rc.sqlCompanies.FieldByName('Codigo').AsInteger;
           labCompanyName.Caption   := mm.varC_CompanyName;
           //[PT] Aqui capturamos o DOCUMENTO DA EMPRESA selecionada no LOGIN para controle de licença.
           //      No Brasil usamos o CNPJ, você poderá ajustar de acordo com seu controle ou até mesmo remover e fazer seu próprio controle de licença.
           //[EN] Here we capture the COMPANY DOCUMENT selected in the LOGIN for license control.
           //      In Brazil we use the CNPJ, you can adjust according to your control or even remove and make your own license control.
           mm.varC_Doc_Customer := dm_rc.sqlCompanies.FieldByName('cnpj').AsString;
           // 6.0.0.0
           if ( mm.varC_Doc_Customer = '' ) or ( mm.CONFIG_APP_DATA_FOLDER = 'ON' ) then mm.varC_Doc_Customer := 'app_data';
           mm.vUserEmail          := dm_rc.memUsers.FieldByName('email').AsString;
           mm.vUserName           := dm_rc.memUsers.FieldByName('nome').AsString;
           mm.vUserLoginTimeStamp := Now;
           mm.varC_User_Avatar    := dm_rc.memUsers.FieldByName('avatar').AsString;
           mm.varI_User           := dm_rc.memUsers.FieldByName('Codigo').AsInteger;
           mm.varC_NameSalesMan   := mm.vUserName;
           mm.varI_CodeSalesMan   := dm_rc.memUsers.FieldByName('Codifunc').AsInteger;
           UniSession.UserString  := mm.vUserEmail; //to Monitoring user identify
           (*<prj-nousersform-master-4>*)//if ( mm.varC_Doc_Customer = '' ) or ( mm.CONFIG_APP_DATA_FOLDER = 'ON' ) then mm.varC_Doc_Customer := 'app_data';//7.1.0.0
           //[PT] aqui são criadas pastas que serão usadas na aplicação. algumas pastas são específicas para documentos usados no Brasil
           //[EN] Here folders are created that will be used in the application. some folders are specific to documents used in Brazil
           rc_GetDefaultPaths( true, mm.varC_Doc_Customer );

           labCompanyNameClick( self );
        end;
    end;
end;

procedure TMainForm.btnExitClick(Sender: TObject);
begin
    dm_rc.rc_ShowHideObject( labCompanyName,
                             paCompanies,
                             paLayoutMainMenu.Width + paLayoutTopo.Left - 120,
                             9999,
                             1,
                             false,
                             ( paCompanies.Tag = 0 ) );
end;
//8.0.0.0
procedure TMainForm.rc_ShowGoogleMap( pSource, pDest : string; pNameWindow : string );
var
   pLink : String;
begin
     if pNameWindow = '' then
        pNameWindow := '_parent'; //_blank
     //https://maps.google.com/?q=-3.7626815568369025,-38.54677452224053
     if ReturnLetters( pSource ) = '' then
        pLink := 'window.open(''https://maps.google.com/?q=%s,%s'', ' + QuotedStr(pNameWindow) + ');'
     else
     //https://www.google.com/maps/dir/Fortaleza,+CE/Belo+Horizonte,+MG/
        pLink := 'window.open(''https://www.google.com/maps/dir/' + pSource + '/' + pDest + '/'', ' + QuotedStr(pNameWindow) + ');';

     pLink := format( pLink, [ pSource , pDest ] );

     UniSession.AddJS( pLink );
end;

procedure TMainForm.UniFormBeforeShow(Sender: TObject);
begin
     rc_RenderLayout( Self, true, true, true );
end;
//7.3.0.0
procedure TMainForm.UniFormAfterShow(Sender: TObject);
begin
     //sboxGridBlock.ScrollTo(0,0);
     //[PT] chama um frame/form e carrega dentro da "tabDashboard"
     //[EN] call a frame/form loading inside "tabDashboard"
     //7.4.0.0
     //[PT] foi detectado um problema de renderização intermitente que foi resolvido( aparentemente ) transferindo para o eveneto "FormShow"
     //[EN] An intermittent rendering issue was detected which was resolved (apparently) by moving it to the "FormShow" event
     //rc_AddFormFrameInTab( nil, 'DashBoard', '', 'DashboardECOMMERCE_THEMED' , false, false, aftNone, 0, tabDashBoard, false, false );

     sboxGridBlock.SelectFirst;
     sboxGridBlock.ScrollTo(0,0);
end;
//8.0.0.0
procedure TMainForm.UniFormCreate(Sender: TObject);
begin
   rc_MainMenuOnCreateConfig;
end;
//8.0.0.0
procedure TMainForm.UniFormScreenResize(Sender: TObject; AWidth, AHeight: Integer);
begin
   rc_MainMenuOnScreenResize(Sender, AWidth, AHeight );
end;
//8.2.0.0
procedure TMainForm.rc_MainMenuOnScreenResize(Sender: TObject; AWidth, AHeight: Integer);
var
   pMainMenu ,
   oObj : TUniControl;
   oFrameFormInParent : TObject;
   cFrameFormInParent : string;

   oObjTemp, oObjTemp2,
   oObjTemp3, oObjTemp4, oObjTemp5,
   oObjTemp6, oObjTemp7, oObjTemp8 : TUniControl;
   bMobileToDesktop, bOldMobileScreen : boolean; // 6.0.0.0
begin
     oObj := nil;
     try
        rc_ForceLookUpsToClose;
        mm.varI_ScreenWidth  := AWidth;
        mm.varI_ScreenHeight := AHeight;
        //8.2.0.0
        bOldMobileScreen := mm.varB_Mobile_Screen;
        pMainMenu        := TUniControl( dm_rc.rc_ScreenUpdate( true, bMobileToDesktop ) );
        bMobileToDesktop := ( bOldMobileScreen <> mm.varB_Mobile_Screen );
        if bMobileToDesktop then
        begin
           mm.rc_InitLayoutThemes;
           if mm.varB_Mobile_Screen then
              mm.CONFIG_LAYOUT_MENU_TYPE := '1';
        end;
        //7.0.0.0 taboff
        if FindComponent( 'paBS_Tabs' ) <> nil then
        begin
           if FindComponent( 'paBS_Tabs' ) <> nil then
           begin
              TUniControl( FindComponent( 'paBS_Tabs' ) ).Visible := not ( ( mm.CONFIG_LAYOUT_TAB_OFF = 'ON' ) or
                                                                       ( mm.CONFIG_LAYOUT_HIDE_TABS_ON_MOBILE = 'ON' ) and ( mm.varB_Mobile_Screen  ) );
           end;
        end;

        Self.Height := mm.varI_ScreenHeight;
        Self.Width  := mm.varI_ScreenWidth;
        Self.Left   := 0;
        Self.Top    := 0;
        //8.2.0.0
        rc_UpdateMainControls;
        rc_AdjustFormsSize( pMainMenu ) ;
        if mm.oPgGeneral <> nil then
           oObj := rc_FindControl( dm_rc.rc_GetActiveFormFrameNameInMainTab )
        else
           oObj := TUniControl( self );
        dm_rc.rc_ResizeBlocks( oObj );
        {<*RC DB}
        if ( mm.varC_Form_Detail = nil ) and ( mm.varC_Form_Modal = nil ) then
           dm_rc.rc_DBGridUpdateAll( oObj )
        else
        if ( mm.varC_Form_Modal = nil ) then
           dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Detail )
        else
        if rc_FindControl( mm.varC_Form_Modal.Name ) <> nil then
           dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Modal );
        {RC DB*>}

        //[PT] existe form/frame adicionado em um objeto ?
        //[EN] is there a form/frame added to an object?
        rc_UpdateFormsInsideContainers;
        //8.3.0.0 autoclose
        if bMobileToDesktop then
        begin
           if not mm.varB_Mobile_Screen then
           begin
              rc_UpdateMenuModel( true );
              if mm.varI_ScreenWidth > 1024 then
                 btnMenuClick( sender );
           end;
        end;

     except on e:exception do
            begin
                 dm_rc.rc_ShowError( 'ScreenResize ' + sLineBreak + sLineBreak + e.Message );
            end;
     end;
     //[PT] específico para objetos do menu principal, caso não use, pode ser comentado
     //[EN] specific for main menu objects, if not used, it can be commented
     if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
        oObjTemp5 := nil
     else
        oObjTemp5 := TUniContainerPanel( FindComponent( 'paLayoutMainMenu' ) );
     oObjTemp6 := TUniContainerPanel( FindComponent( 'paSearchTop' ) );
     oObjTemp7 := TUniPanel( FindComponent( 'paLayoutBgUser' ) );
     if mm.varI_ScreenHeight <= 500  then
     begin
        if oObjTemp5 <> nil then
           if oObjTemp5.tag = 0 then
           begin
              if oObjTemp7 <> nil then
              begin
                 oObjTemp7.tag     := oObjTemp7.Height;
                 oObjTemp7.Visible := False;
              end;
           end;
     end
     else
     begin
        if oObjTemp5 <> nil then
           if ( oObjTemp5.tag = 0 ) and ( oObjTemp6 <> nil ) and ( oObjTemp7 <> nil ) then
           begin
              oObjTemp6.Visible             := false;
              oObjTemp6.Align               := alNone;
              oObjTemp7.Visible             := True;
              oObjTemp6.Align               := alTop;
              oObjTemp6.Visible             := true;
           end;
     end;
end;
//8.0.0.0
procedure TMainForm.rc_MainMenuTranslateMessages;
begin
     case mm.varLT_Lang of

          ltpt_BR, ltpt_PT : begin
                      cMSG_MOBILE_KB_ANYPLACE := 'Click fora do campo de edição para fechar o teclado !';
                      cMSG_MENU_CREATE_ERROR  := 'Falha na criação do menu:';
                      cMSG_MENU_TRIGGER_ERROR  := 'Falha ao acionar uma opção do menu( índice:';
                      cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                                  '<strong>MENSAGEM</strong><br><hr>Classe do formulário não registrada.<br><strong>' ;

                    end;
          lten_US, lten_GB   : begin
                      cMSG_MOBILE_KB_ANYPLACE := 'Click outside the edit field to close the keyboard !';
                      cMSG_MENU_CREATE_ERROR  := 'Failed to create the menu:';
                      cMSG_MENU_TRIGGER_ERROR  := 'Failed to trigger option in menu( index:';
                      cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                                  '<strong>MESSAGE</strong><br><hr>Unregistered form class<br><strong>' ;
                    end;
          ltes_ES   : begin
                      cMSG_MOBILE_KB_ANYPLACE := '¡Haz clic fuera del campo de edición para cerrar el teclado!';
                      cMSG_MENU_CREATE_ERROR  := 'Error al crear el menú:';
                      cMSG_MENU_TRIGGER_ERROR  := 'Error al activar una opción de menú (índice:';
                      cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                                  '<strong>MENSAJE</strong><br><hr>Clase de formulario no registrada<br><strong>' ;
                    end;
          ltfr_FR   : begin
                      cMSG_MOBILE_KB_ANYPLACE := 'Cliquez en dehors du champ d''édition pour fermer le clavier !';
                      cMSG_MENU_CREATE_ERROR  := 'Échec de la création du menu :';
                      cMSG_MENU_TRIGGER_ERROR  := 'Échec de l''activation d''une option de menu (index :';
                      cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                                  '<strong>MESSAGE</strong><br><hr>Classe de formulaire non enregistrée<br><strong>' ;
                    end;
          ltde_DE   : begin
                      cMSG_MOBILE_KB_ANYPLACE := 'Klicken Sie außerhalb des Bearbeitungsfeldes, um die Tastatur zu schließen!';
                      cMSG_MENU_CREATE_ERROR  := 'Das Menü konnte nicht erstellt werden:';
                      cMSG_MENU_TRIGGER_ERROR  := 'Fehler beim Aktivieren einer Menüoption ( index:';
                      cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                                  '<strong>BOTSCHAFT</strong><br><hr>Formularklasse nicht registriert<br><strong>' ;
                    end;
          ltit_IT   : begin
                      cMSG_MOBILE_KB_ANYPLACE := 'Clicca fuori dal campo di modifica per chiudere la tastiera!';
                      cMSG_MENU_CREATE_ERROR  := 'Impossibile creare il menu:';
                      cMSG_MENU_TRIGGER_ERROR  := 'Impossibile attivare un''opzione di menu ( index:';
                      cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                                  '<strong>MESSAGGIO</strong><br><hr>Classe modulo non registrata<br><strong>' ;
                    end;
          lttr_TR    : begin
                      cMSG_MOBILE_KB_ANYPLACE := 'Klavyeyi kapatmak için düzenleme alanının dışına tıklayın!';
                      cMSG_MENU_CREATE_ERROR  := 'Menü oluşturulamadı:';
                      cMSG_MENU_TRIGGER_ERROR  := 'Bir menü seçeneği etkinleştirilemedi ( index:';
                      cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                                  '<strong>İLETİ</strong><br><hr>Form sınıfı kayıtlı değil<br><strong>' ;
                    end;
          ltru_RU    : begin
                      cMSG_MOBILE_KB_ANYPLACE := 'Click outside the edit field to close the keyboard !';
                      cMSG_MENU_CREATE_ERROR  := 'Failed to create the menu:';
                      cMSG_MENU_TRIGGER_ERROR  := 'Failed to trigger option in menu( index:';
                      cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                                  '<strong>MESSAGE</strong><br><hr>Unregistered form class<br><strong>' ;
                    end;
          ltzn_CH : begin
                      cMSG_MOBILE_KB_ANYPLACE := 'Click outside the edit field to close the keyboard !';
                      cMSG_MENU_CREATE_ERROR  := 'Failed to create the menu:';
                      cMSG_MENU_TRIGGER_ERROR  := 'Failed to trigger option in menu( index:';
                      cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                                  '<strong>MESSAGE</strong><br><hr>Unregistered form class<br><strong>' ;
                    end;
          ltin_ID : begin
                      cMSG_MOBILE_KB_ANYPLACE := 'Click outside the edit field to close the keyboard !';
                      cMSG_MENU_CREATE_ERROR  := 'Failed to create the menu:';
                      cMSG_MENU_TRIGGER_ERROR  := 'Failed to trigger option in menu( index:';
                      cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                                  '<strong>MESSAGE</strong><br><hr>Unregistered form class<br><strong>' ;
                    end;
          ltth_TH : begin
                      cMSG_MOBILE_KB_ANYPLACE := 'Click outside the edit field to close the keyboard !';
                      cMSG_MENU_CREATE_ERROR  := 'Failed to create the menu:';
                      cMSG_MENU_TRIGGER_ERROR  := 'Failed to trigger option in menu( index:';
                      cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                                  '<strong>MESSAGE</strong><br><hr>Unregistered form class<br><strong>' ;
                    end;
          lthi_IN : begin
                      cMSG_MOBILE_KB_ANYPLACE := 'Click outside the edit field to close the keyboard !';
                      cMSG_MENU_CREATE_ERROR  := 'Failed to create the menu:';
                      cMSG_MENU_TRIGGER_ERROR  := 'Failed to trigger option in menu( index:';
                      cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                                  '<strong>MESSAGE</strong><br><hr>Unregistered form class<br><strong>' ;
                    end;
          ltar_SA : begin
                      cMSG_MOBILE_KB_ANYPLACE := 'Click outside the edit field to close the keyboard !';
                      cMSG_MENU_CREATE_ERROR  := 'Failed to create the menu:';
                      cMSG_MENU_TRIGGER_ERROR  := 'Failed to trigger option in menu( index:';
                      cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                                  '<strong>MESSAGE</strong><br><hr>Unregistered form class<br><strong>' ;
                    end;
     end;
end;
//8.0.0.0
procedure TMainForm.rc_MainMenuOnCreateConfig;
var
   i : integer;
   s1 : string;
begin
     //8.1.0.0
     UniTreeMainMenuClone.ClientEvents.ExtEvents.Values['mouseover'] :=
        'function mouseover(sender, eOpts) ' +
        '{ ' +
        '  ajaxRequest( MainForm.htmlFrame, "_menuMicroMouseOver" , ' +
        '    []);' +
        '} ';

     paSearchEdit.Hint   := '[[cls:clsRoundPanel]]';
     SearchEdit.Width    := MAIN_MENU_ITEM_MAXWIDTH;
     //labEmoji.Caption    := EMOJI_GRINNING_FACE;
     paLayoutTopo.Height := 44;

     //[PT] msg show mask padrão ao clicar em um item do menu. remova se deseja definir sua própria msg diretamente no componente.
     //[EN] msg show default mask when clicking on a menu item. remove if you want to define your own msg directly in the component.
     UniTreeMainMenu.Hint := '[[translate:]]';
     With UniTreeMainMenu.ScreenMask do
     begin
          Enabled     := false;
          ShowMessage := true;
          Message     := 'aguarde...';
          Target      := sboxMain;
          //Enabled     := true; //7.4.0.0...Unigui .1592 crash this when search menu items
          WaitData    := false;
          //Hint        := '[[translate:]]';
     end;
     btnFloatingFAB.Tag := varIIF( btnFloatingFAB.Visible, 1, 0 );
     AutoScroll := false;

     // translate messages
     rc_MainMenuTranslateMessages;

     rc_AddCssClass( paLayoutMainMenu, 'bringtofront-lower');
     rc_AddCssClass( btnMenu, 'bringtofront-lower');

     //[PT] Descomente as linhas abaixo para gerar o arquivo de informações dos blocos do formulário/frame informado( self )
     //[EN] Uncomment the lines below to generate the block information file of the informed form/frame ( self )
     //{$IFDEF DEBUG}rc_GenerateRuntimeDebugBlocksFile( Self );{$ENDIF}

     RTL:= mm.RTL;
     {$IFDEF RELEASE}
     dm_rc.rc_ProtectForm( Self );
     {$ENDIF}
     // pgGeneral controls Frames/Forms Opened in Tabs
     mm.oPgGeneral := TUnipagecontrol( FindComponent( 'pgGeneral' ) );

     If mm.oPgGeneral <> nil then
        tabDashBoard.OnClose := TabSheetClose;

     if FindComponent( 'paBS_Tabs' ) <> nil then
     begin
        TUniControl( FindComponent( 'paBS_Tabs' ) ).Visible := not ( ( mm.CONFIG_LAYOUT_TAB_OFF = 'ON' ) or
                                                                     ( mm.CONFIG_LAYOUT_HIDE_TABS_ON_MOBILE = 'ON' ) and ( mm.varB_Mobile_Screen  ) );

     end;
     // Controls the border focus/blur ( login / mainmenu )
     mm.varC_JSNAME_HTMLFRAME := htmlFrame.JSName;

     //[PT] screenwidth está disponivel apenas no screenresize mas precismos tratar mm.varB_MobileScreen no dm_rc.rc_GetDeviceType( STARTER / MINIMAL )...
     //[EN] screenwidth is only available in screenresize but we need to handle mm.varB_MobileScreen in dm_rc.rc_GetDeviceType( STARTER / MINIMAL )...
     mm.varI_ScreenWidth  := UniApplication.ScreenWidth;
     mm.varI_ScreenHeight := UniApplication.ScreenHeight;
     if mm.varI_ScreenWidth = 0 then mm.varI_ScreenWidth := Self.Width;
     if mm.varI_ScreenHeight = 0 then mm.varI_ScreenHeight := Self.Height;
     dm_rc.rc_GetDeviceType;

     // theme "light"
     rc_UpdateThemeColors;

     paLayoutMainMenu.Width := StrToIntDef( mm.CONFIG_LAYOUT_MENU_WIDTH, MAIN_MENU_EXPANDED );//7.5.0.0 menu
     Self.Hint := rc_AddHintAttr( '|rcmenuwidth:' + paLayoutMainMenu.Width.ToString, Self.Hint, true );
     Self.Hint := rc_AddHintAttr( '|rcmenumodel:' + mm.CONFIG_LAYOUT_MENU_TYPE, Self.Hint , true );

     rc_UpdateMenuModel;

     labAppName.Caption     := APP_NAME;
     labAppVersion.Caption  := 'v.' + APP_NAME_VERSION ; //  + ' [ ' + mm.CONFIG_APP_TYPE + ' ]';

     labUser.Caption        := mm.vUserName ;
     labAdm.Visible := ( mm.varB_RunLogin ) and ( dm_rc.memUsers.FieldByName('master').AsString = '1' );

     labCompanyName.Height  := 22; //8.0.0.0
     labCompanyName.Caption := mm.varC_CompanyName;
     if mm.RTL then
     begin
        rc_AddCssClass( labCompanyName   , 'align-label-right-center' );
     end
     else
     begin
        rc_AddCssClass( labCompanyName   , 'align-label-left-center' );
     end;

     if Copy( lowercase(mm.CONFIG_LAYOUT_ACTIVE_THEME), 1, 5 ) <> 'light'  then
        rc_AddCssClass( labAppVersion    , 'rc-handshake' );

     rc_MainMenuScripts;

     //[PT] controlar o fluxo de abas pra nao estourar os linmites da tela
     //[EN] [EN] control the flow of tabs so as not to overflow the screen limits
     mm.varI_TabIni := 0;
     mm.varI_TabEnd := 1;

     paNotifications.Visible := False;
     paCompanies.Visible     := False;

     if mm.CONFIG_LAYOUT_USER_BG = 'ON' then
     begin
       paLayoutBgUser.Margins.Top := 0;
       // NOTE: mm.varC_Temp1 comes from MainModule On Create
       if FileExists( mm.varC_Temp1 ) and ( ( Pos( '.png', mm.varC_Temp1 ) > 0 ) or ( Pos( '.jpg', mm.varC_Temp1 ) > 0 ) )then
       begin
          mm.varC_Temp1 := ReverseStr( StringReplace( mm.varC_Temp1, '\', '/', [rfReplaceAll] ) );
          mm.varC_Temp1 := ReverseStr( Copy( mm.varC_Temp1 , 1, Pos( '/', mm.varC_Temp1 ) - 1 ) );
          mm.varC_Temp1 := 'files/images/menu/' + mm.varC_Temp1;

          paLayoutBgUser.Background.Url := mm.varC_Temp1;
       end;
     end
     else
     begin
       paLayoutBgUser.Background.Picture.Bitmap := nil;
       paLayoutBgUser.Background.Url := '';
       paLayoutBgUser.Margins.Top := 20;
     end;


     if mm.RTL then
        bsTabs_Main.JSInterface.JSCall('addCls', ['align-label-right-center'])
     else
        bsTabs_Main.JSInterface.JSCall('addCls', ['align-label-left-center']);

     //[PT] descomente a linha pra capturar posicao gps
     //[EN] uncomment the line to capture gps position
     try
        // rc_GetGeoPosition;
     except
     end;

     //[PT] o componente img padrao não consegui deixa-lo arredondado( algum conflito com CSS, talvez )
     //     então usei uma forma alternativa com html
     //[EN] the default img component couldn't make it rounded (some conflict with CSS, maybe)
     //     then I used an alternative form with html
     try
        if Copy( lowercase(mm.CONFIG_LAYOUT_ACTIVE_THEME), 1, 5 ) <> 'light'  then
           rc_UrlImgNoCache( imgAppIcon, 'files/images' + mm.BACKSLASH + 'icon_mainmenu.png' )
        else
           rc_UrlImgNoCache( imgAppIcon, 'files/images' + mm.BACKSLASH + 'icon_mainmenu_light.png' );

        mm.varC_Temp1 := dm_rc.rc_GetFromFilesFolder( mm.varC_User_Avatar, true );
        if not FileExists( mm.varC_User_Avatar ) then
           mm.varC_Temp1 := 'files/images/avatars/user.png';
        //[PT] problema com unigui/IIS para carregar imagens usadas com Label HTML
        //[EN] problem with unigui/IIS to load images used with Label HTML
        imgUSer.Caption := '<img id="userimg_avatar" class="avatar img-thumbnail" src="' + mm.varC_Temp1 + '" alt="User_Img">';
     except

     end;
     //8.0.0.0
     if Copy( lowercase(mm.CONFIG_LAYOUT_ACTIVE_THEME), 1, 5 ) = 'light'  then
     begin
        rc_AddCssClass( labUser   , 'shadow-text unselectable' );
        rc_AddCssClass( labAppName, 'shadow-text unselectable' );
     end;
     rc_AddCssClass( labAppName, 'rc-font-light' );

     rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
     rc_ConfigTranslateMessages;

     rc_MainMenuRender; //8.0.0.0

     dm_rc.rc_ShowToaster( 'info', mm.MSG_WELCOME + mm.vUserName + ' !', false, 'pinItUp' );

     if ( Pos( 'theme-color:off', Self.Hint ) = 0 ) then
        Color := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

     rc_UpdateFloatButton;

     dm_rc.rc_ShowTour( Self, True );
end;
//8.0.0.0
procedure TMainForm.rc_MainMenuScripts;
begin
  //8.4.0.0 fullscreen monitor ( thanks to Roberto Nicchi from Italy )
  //rc_FullScreenExit;

  Script.Text := Script.Text +
      'Ext.QuickTips.init();' +
      'function launchIntoFullscreen(element) {' +
      '    if (element.requestFullscreen) {' +
      '        element.requestFullscreen();' +
      '    } else if (element.mozRequestFullScreen) {' +
      '        element.mozRequestFullScreen();' +
      '    } else if (element.webkitRequestFullscreen) {' +
      '        element.webkitRequestFullscreen();' +
      '    } else if (element.msRequestFullscreen) {' +
      '        element.msRequestFullscreen();' +
      '    }' +
      (*<prj-orientation*)'    var myScreenOrientation = window.screen.orientation;' +
      (*<prj-orientation*)'    myScreenOrientation.lock("portrait");' +
      (*<prj-orientation*)'    screen.orientation.lock("portrait");' +
      //'myScreenOrientation.unlock();' +
      '}' +
      'function exitFullscreen() {' +
      '    if (document.exitFullscreen) {' +
      '        document.exitFullscreen();' +
      '    } else if (document.mozCancelFullScreen) {' +
      '        document.mozCancelFullScreen();' +
      '    } else if (document.webkitExitFullscreen) {' +
      '        document.webkitExitFullscreen();' +
      '    }' +
      '}' +

      //tawk.to
      //[PT] Descomente o codigo abaixo para usar o tawk.to
      //[EN] Uncommon the code below to use tawk.to
//      'function rc_startTawkTo() {' +
//      '  var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();' +
//      '  (function(){' +
//      '    var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];' +
//      '    s1.async=true;' +
//      '    s1.src=''https://embed.tawk.to/put_here_your_access_to_tawk'';' +
//      '    s1.charset=''UTF-8'';' +
//      '    s1.setAttribute(''crossorigin'',''*'');' +
//      '    s0.parentNode.insertBefore(s1,s0);' +
//      '  })();' +
//      '}' +
      // end tawk.to

      'function rc_detectPlatform() {'+
      //'   var res = "Device is not Android Phone"; ' +
      '   var res = ""; ' +
      '   var userAgent = navigator.userAgent.toLowerCase(); ' +
      '   var Android = userAgent.indexOf("android") > -1; ' +
      '   var Windows = userAgent.indexOf("windows") > -1; ' +
      '   var Linux = userAgent.indexOf("linux") > -1; ' +
      '   var iOS = ' +
      '       /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream; ' +
      '   var Mac = ( userAgent.indexOf("mac") > -1 ) && ( !iOS ); ' +
      '   if(Android) { ' +
      '     res = "Android"; ' +
      '   } ' +
      '   else ' +
      '   if(Linux) { ' +
      '     res = "Linux" ; ' +
      '   } ' +
      '   else ' +
      '   if(Windows) { ' +
      '     res = "Windows" ; ' +
      '   } ' +
      '   else ' +
      '      if(Mac) { ' +
      '        res = "MacOs" ; ' +
      '      } ' +
//      '   else ' +
//      '   if(!iOS) { ' +
//      '      if(Mac) { ' +
//      '        res = "MacOs" ; ' +
//      '      } ' +
//      '   } ' +
      '   else ' +
      '   if(iOS) { ' +
      '     res = "iOS/iPad"; ' +
      '   } ' +
      // to check on console
      //'   console.log( "Plataform:" + res + " " + navigator.userAgent );' +
      '    ajaxRequest( MainForm.htmlFrame, "_rcDetectPlatform" ,' +
      '      ["device=" + res ]);' +
      '}' ;

     Self.ClientEvents.ExtEvents.Values['form.resize'] :=
        'function(sender, width, height, oldWidth, oldHeight, eOpts)'+
        '{  rc_detectPlatform(); }'; //alert( "resize" );

     //tawk.to
     //[PT] Descomente o codigo abaixo para usar o tawk.to
     //[EN] Uncommon the code below to use tawk.to
//     sboxGridBlock.ClientEvents.ExtEvents.Values['afterrender'] :=
//        'function (sender, eOpts)'+
//        '{'+
//        //'  console.log("tawk.to...");' +
//        '  rc_startTawkTo();'+
//        '} ';

end;
//8.0.0.0
procedure TMainForm.rc_MainMenuRender;
begin
     //[PT] ajuste esse valor de acordo com o no. de forms do projeto que serão exibidos no menu dinâmico
     //[EN] adjust this value according to no. of project forms that will be displayed in the dynamic menu
     SetLength( mm.varA_FSideMenu , 200 );
     mm.varA_FSideMenu[ 0 ].option       := '';
     mm.varA_FSideMenu[ 0 ].table        := '';
     mm.varA_FSideMenu[ 0 ].Form         := '';
     mm.varA_FSideMenu[ 0 ].image        := '';
     mm.varA_FSideMenu[ 0 ].permission   := '';
     mm.varA_FSideMenu[ 0 ].Hidden       := false;
     mm.varA_FSideMenu[ 0 ].AskNew       := false;
     mm.varA_FSideMenu[ 0 ].GenIDOnInsert:= false;
     mm.varA_FSideMenu[ 0 ].NoGenID      := false;
     mm.varA_FSideMenu[ 0 ].NotShow      := false;
     mm.varA_FSideMenu[ 0 ].Master       := false;
     mm.varA_FSideMenu[ 0 ].Tag          := '';
     mm.varA_FSideMenu[ 0 ].GetThisPK    := '';

     mm.varI_NumMenu    := 1;

     //menu micro
     try
        dm_rc.rc_BuildMainMenu( '', UniTreeMainMenu );
        dm_rc.rc_BuildMainMenu( '', UniTreeMainMenuClone );
     except on e:exception do
            begin
              dm_rc.rc_ShowError( cMSG_MENU_CREATE_ERROR + e.Message );
            end;
     end;
end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
     mm.varDW_LastTick := GetTickCount;

     mm.varI_GuideTourSeq := 0;

    TabelaEmpresas    ('select * from empresas where codigo = ' + IntToStr(mm.varI_Code_Company));
    mm.M_FASTREPORT    :=  dm_rc.tbempresas.FindField('CAMINHO_FASTREPORT').AsString;
    mm.M_PATHIMPRESSAO :=  dm_rc.tbempresas.FindField('CAMINHO_IMPRESSAO').AsString;
    mm.M_IMAGEM        :=  dm_rc.tbempresas.FindField('CAMINHO_LOGO').AsString;
    mm.M_TIPOPESO      :=  dm_rc.tbempresas.FindField('TRABALHOKGSC').AsString;
    mm.M_PATHXML       :=  'C:\Arquivos\xml\';

     //7.4.0.0
     //[PT] chama um frame/form e carrega dentro da "tabDashboard"
     //[EN] call a frame/form loading inside "tabDashboard"
     //8.0.0.0
     //http://localhost:8075?run=pos
     if UniSession.UniApplication.Parameters.Values['run'] = 'pos' then
        rc_AddFormFrameInTab( nil, 'PDV', '', 'DEMO_PDV_MODAL' , false, true, aftNone, 0, tabDashBoard, false, false )
     else
        rc_AddFormFrameInTab( nil, 'DashBoard', '', 'DashboardECOMMERCE_THEMED' , false, false, aftNone, 0, tabDashBoard, false, false );


end;
//8.0.0.0
procedure TMainForm.btnNotificationsClick(Sender: TObject);
begin
     dm_rc.rc_ShowHideObject( btnNotifications,
                              paNotifications,
                              btnNotifications.Left - paNotifications.width + 40,
                              0, //9999,
                              1,
                              false,
                              ( paNotifications.Tag = 0 ),
                              False,
                              True,
                              True,
                              true, //slide
                              '0.4' );

     //clear Badge( such as readed )
     rc_BadgeSetValue( self, btnNotifications, '0' );
end;

procedure TMainForm.btnCfgClick(Sender: TObject);
begin
     //[PT] se o usuário for MASTER, não solicita senha para o frmTHEME
     //[EN] if the user is MASTER, does not request a password for frmTHEME
     (*<prj-nousersform>*)mm.varB_Yes := ( mm.varB_RunLogin ) and ( dm_rc.memUsers.FieldByName('master').AsString = '1' );//7.4.0.0 run login
     if not mm.varB_Yes then
     begin
        // with PERMISSION CONTROL( Check Menu Tools )
   //     if dm_rc.rc_PermissionVerify( 'System Configuration' ,
   //                                   Trim( 'system_config' ) ,
   //                                   PT_ACCESS ) then
   //     begin
   //       rc_AddCssClass( frmThemes, 'form-noborder' );
   //       frmThemes.Show( procedure(Sender: TComponent; Result:Integer)
   //                              begin
   //                                //callback....nesse caso, não é necessário tratar o retorno
   //                              end
   //                            );
   //     end;
        dm_rc.rc_ShowInputBox( 'Admin Access', 'Admin Password', '', '', '', true );
        mm.varB_Yes := dm_rc.rc_GetMD5( mm.varC_InputBox_Result1 ) = USER_ADMIN_PASS;
        if not mm.varB_Yes then
           dm_rc.rc_ShowWarning( mm.MSG_INVALID_PASSWORD );
     end;
     if mm.varB_Yes then
     begin
        frmThemes.Show( procedure(Sender: TComponent; Result:Integer)
                               begin
                                 //callback....nesse caso, não é necessário tratar o retorno
                               end
                             );
     end
     else
     begin
         dm_rc.rc_ShowWarning( mm.MSG_INVALID_PASSWORD );
     end;
end;
// 6.0.0.0
procedure TMainForm.btnMenuClick(Sender: TObject);
begin
     rc_MainMenuClick( btnMenu );
end;
//8.0.0.0
procedure TMainForm.htmlFrameAjaxEvent(Sender: TComponent; EventName: string;  Params: TUniStrings);
var
   pGrid : TUniDBGrid;
   pQryMaster : TFDQuery;
   pDsMaster  : TDataSource;

   pFrame, pFrame2 : TObject;
   oUniDBEdit : TUniDBEdit; //7.3.0.0
   oUniEdit : TUniEdit; //7.3.0.0
   oUniComboBox : TUniComboBox; //7.3.0.0
   oUniDBComboBox : TUniDBComboBox; //7.3.0.0
   pLabel : TUniLabel; //7.3.0.0
   cFrameFormInParent, //7.3.0.0
   pEditUF, pEditCidade, pEditBairro, pEditEndereco, pEditIBGE,   //7.3.0.0

   pVariacaoCep, cTemp, cTemp2, cTemp3, cDataSource, cQuery,
   FClassName: string;
   oHfRequired : TUniHTMLFrame;
   oLabel      : TUniLabel;
   pObj, pBlock : TUniControl;
   oSBox : TUniScrollBox;
   oScrollBlock : TObject;

   bRTL, //8.0.0.0
   bAbort       : boolean;
   pPageControl : TUniPageControl;

   iPercent : double;
   iImgH, iOldW, iOldH, iW, iH : integer;

   iStep, i, x, y : integer;
   pt : tPoint;

   oTemp_Active_Component : TComponent;
begin
   if EventName <> '' then
   begin
      oTemp_Active_Component := nil;
      pQryMaster  := nil;
      pDsMaster   := nil;
      cDataSource := '';
      cQuery      := '';
      //8.4.0.0
      if eventname='exitFullScreen' then
      begin
         //showmessage('Full Screen exit');
      end
      else

      if EventName='ClientIPAddr' then
      begin
           mm.vUserPublicIP := Params.Values['ip'];
      end
      else

      if (EventName = '_rcDetectPlatform' ) then
      begin
           //uniGetPlatforms ( on uniGUIServer )
           mm.varI_ScreenWidth  := UniApplication.ScreenWidth;
           mm.varI_ScreenHeight := UniApplication.ScreenHeight;
           mm.varC_Platform      := Params.Values['device']; // 6.0.0.0
      end
      else
      //8.1.0.0 mouse enter ..show menu
      // thanks for bugtracker: ALTERDATA
      if (EventName = '_menuMicroMouseOver') then
      begin
           if ( mm.CONFIG_LAYOUT_MENU_TYPE = '2' ) and ( Pos( 'opened' , Self.Hint ) = 0 ) then
           begin
              UniTreeMainMenu.Tag := 1;
              rc_MainMenuClick( btnMenu );//rc_MainMenuClick( paLayoutMainMenu );//8.0.0.0
           end
           else
           if ( mm.CONFIG_LAYOUT_MENU_TYPE = '2' ) and ( Pos( 'opened' , Self.Hint ) > 0 ) then
           begin
              UniTreeMainMenu.Hint := rc_AddHintAttr( '|treemenu:runit' , UniTreeMainMenu.Hint, true  );
           end;
      end
      else

      // thanks for bugtracker: Sr. MARLOS
      if (EventName = '_actionCol') then
      begin
          FClassName := Params.Values['form'];
          cTemp      := Params.Values['btn'];
          pFrame := rc_FindControl( FClassName );

          if pFrame = nil then
          begin
               if mm.oPgGeneral <> nil then
               begin
                 fClassName := dm_rc.rc_GetActiveFormFrameNameInMainTab;
                 pFrame     := rc_FindControl( FClassName );
               end;
          end;

          if pFrame <> nil then
          begin
              pObj := TUniControl( TComponent( pFrame ).FindComponent( cTemp ) );
              if pObj <> nil then
              begin
                 mm.varC_Temp1 := '';
                 if ( pObj is TUniBitBtn ) then
                 begin
                      mm.varC_Temp1 := pObj.Name; // this will be executed on "frmBaseCRUD -> dbgSearchGrid -> OnCellClick
                 end
                 else
                 begin
                    //feedback: Mesut from Turkey to Linux( 6.0.0.0 )
                    {$ifdef MSWINDOWS}
                    pt := Mouse.CursorPos;
                    {$endif}
                    if mm.varB_Mobile_Screen then
                       TUniPopupMenu( pObj ).Popup( pt.x , pt.y - 190, nil )
                    else
                    if mm.varC_Form_Detail <> nil then
                       TUniPopupMenu( pObj ).Popup( pt.x , pt.y - 170, nil )
                    else
                       TUniPopupMenu( pObj ).Popup( pt.x , pt.y - 120, nil );
                 end;
              end;
          end;
      end
      // 6.0.0.0 ( future implementarion )
      else
      if (EventName = '_labelResize') then
      begin


          cTemp      := Params.Values['pobj'];
          cTemp2     := Params.Values['pparent'];
          FClassName := Params.Values['pform'];
          pFrame     := rc_FindControl( FClassName );
          if pFrame = nil then
             pFrame := rc_FindFormFrameIntoTab( FClassName );
          if pFrame <> nil then
          begin
             //label and block
             if lowercase( FClassName ) = 'mainform' then
             begin
                oLabel := TUniLabel( FindComponent( cTemp ) );
                pObj   := TUniContainerPanel( FindComponent( cTemp2 ) )
             end
             else
             begin
                oLabel := TUniLabel( TComponent(pFrame).FindComponent( cTemp ) );
                pObj   := TUniContainerPanel( TComponent(pFrame).FindComponent( cTemp2 ) );
             end;

             if pObj <> nil then
             begin
                iW := StrToIntDef( Params.Values['pW'], pObj.Width );
                iH := StrToIntDef( Params.Values['pH'], pObj.Height );

                pObj.Height := iH + 6;
                dm_rc.rc_ResizeBlocks( pFrame, true, true, false );
             end;
          end;
      end
      else
      //8.0.0.0
      if (EventName='_LocalStorageGet') then
      begin
         mm.varC_InputBox_Result1 := Params.Values['item'];
      end
      else
      //8.0.0.0 em analise...
      if (EventName='_ObjHeight') then
      begin
//          mm.varC_TempAjaxEventString := Params.Values['pHeight'];
//          iH := StrToIntDef( mm.varC_TempAjaxEventString, -1 );
//         // dm_rc.rc_ConsoleLog( 'ajax height:' + mm.varC_TempAjaxEventString, true );
//          cTemp      := Params.Values['pObj'];
//          FClassName := Params.Values['pForm'];
//          pFrame     := rc_FindControl( FClassName );
//          if pFrame = nil then
//             pFrame := rc_FindFormFrameIntoTab( FClassName );
//          if pFrame <> nil then
//          begin
//             if lowercase( FClassName ) = 'mainform' then
//                oLabel := TUniLabel( FindComponent( cTemp ) )
//             else
//                oLabel := TUniLabel( TComponent(pFrame).FindComponent( cTemp ) );
//
//             if oLabel <> nil then
//             begin
//                pObj   := TUniControl( oLabel.Parent );
//                if iH <> -1 then
//                begin
//                   oLabel.Height := iH;
//                   pObj.Height   := oLabel.Height;
//                   //pObj.Hint     := rc_AddHintAttr( '|_objheight:', pObj.Hint, true );//nao chamar novamente esse ajax
//                   //rc_BootStrapRenderExecute( pFrame, false, 0, 0, mm.varB_Mobile_Screen, mm.varB_Mobile_Screen_Landscape, oLabel );
//                   //dm_rc.rc_ResizeBlocks( pFrame, False, False, False );
//                end;
//
//             end;
//
////             if pObj <> nil then
////             begin
////               oLabel.Height := StrToIntDef( mm.varC_TempAjaxEventString, TUniControl( pObj ).Height );
////               pObj.Height   := oLabel.Height;
////             end;
//          end;
      end

      else
      //8.1.0.1 Thanks for Testing on iOS Fabio Oliveira
      if (EventName = '_CopyToClipBoard') then
      begin
          cTemp  := Params.Values['content'];
          cTemp2 := Params.Values['elemID'] + '-inputEl'; //O635_id-inputEl
          randomize;
          htmlFrame.HTML.Clear;
          htmlFrame.HTML.Add('<script>');
          htmlFrame.HTML.Add('');
          htmlFrame.HTML.Add('function copyToClipBoard() {');
          htmlFrame.HTML.Add('  var el = document.createElement("textarea");');
          htmlFrame.HTML.Add('  el.value = "' + cTemp + '";');
          htmlFrame.HTML.Add('  el.setAttribute("readonly", "");');
          htmlFrame.HTML.Add('  el.style = {position: "absolute", left: "-9999px"};');
          htmlFrame.HTML.Add('  document.body.appendChild(el);');
          htmlFrame.HTML.Add('  el.select();');

          htmlFrame.HTML.Add('  document.execCommand("copy");');
          htmlFrame.HTML.Add('  document.body.removeChild(el);');
          htmlFrame.HTML.Add('}');
          htmlFrame.HTML.Add('copyToClipBoard();');
          htmlFrame.HTML.Add('</script>');

          dm_rc.rc_ShowToaster( 'info', 'Copied to clipboard !' , false, 'pinItUp' );
      end
      // 6.0.0.0
      else
      if (EventName = '_onFocus') then
      begin
          try
              //{search fail on focus } iStep := 1;
              FClassName := Params.Values['pform'];
              if FClassName <> 'frmLookUp_Lite' then
              begin
                 pFrame := rc_FindControl( FClassName );
                 if pFrame = nil then
                 begin
                      if mm.oPgGeneral <> nil then
                      begin
                        fClassName := dm_rc.rc_GetActiveFormFrameNameInMainTab;
                        pFrame     := rc_FindControl( FClassName );// tabDashboard is not a "form/frame"
                      end;
                 end;
                 // 6.0.0.0
                 pObj := nil;
                 if ( pFrame <> nil ) then
                 begin
                    pObj := rc_FindControl( Params.Values[ 'pobj' ], pFrame );
                    if pObj <> nil then
                    begin
                        pBlock := dm_rc.rc_BlockParentIsCollapsed( pFrame, pObj );
                        if pBlock <> nil then
                        begin
                             cTemp := rc_GetHintAttr( 'objcollapse:', pBlock.Hint );
                             rc_Collapse( rc_FindControl( cTemp , pFrame ), pFrame, rc_FindControl( cTemp , pFrame ) , false, true );
                        end;
                        //8.0.0.0
                        bRTL := ( mm.RTL ) and ( Pos( 'ltr:', pObj.Hint ) = 0 );
                        If ( Pos( 'inputico:', pObj.Hint ) > 0 ) then //8.0.0.0
                        begin
                           if ( Pos( 'cls:border-bottom-edit', pObj.Hint ) = 0 ) then
                           begin
                              rc_RemoveCssClass( pObj , 'inputWithIcon' + varIIF( bRTL, '-rtl', '' ) + ' inputIconBg' + varIIF( bRTL, '-rtl', '' ) );
                              rc_AddCssClass( pObj , 'inputWithIconFocus' + varIIF( bRTL, '-rtl', '' ) + ' inputIconBg' + varIIF( bRTL, '-rtl', '' ) );
                           end
                           else
                           begin
                              rc_RemoveCssClass( pObj , 'inputWithIcon-BottomEdit' + varIIF( bRTL, '-rtl', '' ) + ' inputIconBg-BottomEdit' + varIIF( bRTL, '-rtl', '' ) );
                              rc_AddCssClass( pObj , 'inputWithIconFocus-BottomEdit' + varIIF( bRTL, '-rtl', '' ) + ' inputIconBg-BottomEdit' + varIIF( bRTL, '-rtl', '' ) );
                           end;
                        end;
                        if ( Pos( 'focus-color:off', pObj.Hint ) = 0 ) and
                           ( Pos( 'theme-color:off' , pObj.Hint ) = 0 ) and
                           ( mm.CONFIG_LAYOUT_EDIT_FOCUS_ACTIVE = 'ON' ) then
                        begin
                           If ( pObj is TUniDateTimePicker ) or ( pObj is TUniDBDateTimePicker ) then
                              rc_AddCssClass( TUniDateTimePicker(pObj) , 'rc-x-form-trigger-wrap-default-focus' )
                           else
                              rc_AddCssClass( pObj , 'rc-x-form-trigger-wrap-default-focus' );
                        end;
                    end;
                 end;

                 if pObj <> nil then
                 begin
                    //8.0.0.0
                    if ( pos( 'selectall:', pObj.hint ) > 0 ) then
                    begin
                         if ( Pos( pObj.ClassName , 'TUniEdit TUniDBEdit TUniNumberEdit TUniDBNumberEdit' ) > 0 ) and ( TUniEdit( pObj ).CanFocus ) then
                            TUniEdit( pObj ).SelectAll;
                    end;

                    if ( pos( 'true imsg:', pObj.hint ) > 0 ) then
                    begin
                       oLabel := TUniLabel( TComponent(pFrame).FindComponent('rcLabel__inv_lab_' + pObj.Name) );
                       if ( oLabel <> nil ) then
                       begin
                          oLabel.Visible := False;
                          pObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', pObj.Hint );
                       end;
                    end;
                    if ( pos( 'valid-required:', pObj.hint ) > 0 ) then
                    begin
                       oHfRequired := TUniHTMLFrame( TComponent(pFrame).FindComponent('rc__Required' + pObj.Name) );
                       if oHfRequired <> nil then
                       begin
                            oHfRequired.Visible := False;
                       end;
                    end;

                    if ( pos( 'float-label:', pObj.hint ) > 0 ) then
                    begin
                       oLabel := TUniLabel( rc_FindControl( 'rc__FloatLabel' + pObj.Name, pFrame ) );//7.2.0.0
                       if ( oLabel <> nil ) then
                       begin
                            if ( pos( 'float-label:top-in', pObj.hint ) > 0 ) then
                            begin
                               if ( pObj is TUniMemo ) or ( pObj is TUniDBMemo ) then
                                  rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 18 ) , '350' )
                               else
                                  rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - ( ( pObj.Height div 2 ) + 3 ) ) , '350' );
                            end
                            else
                            begin
                               if ( pos( 'float-label:top', pObj.hint ) > 0 ) then
                               begin
                                  if ( pObj is TUniMemo ) or ( pObj is TUniDBMemo ) then
                                     rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 26 ) , '350' )
                                  else
                                     rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - ( pObj.Height - 4 ) ) , '350' );
                               end;
                            end;
                       end;
                    end;
                 end;

                 if ( mm.CONFIG_LAYOUT_KEYBOARD_SCROLL_ON_MOBILE = 'ON' ) and ( pObj <> nil  ) then //  thanks for bug track JOSE HERCULANO
                 begin
                    if ( mm.varB_Mobile_Screen ) and ( not mm.varB_iOS ) and ( ( mm.varB_Android ) or ( mm.varB_Tablet ) ) and ( ( pFrame <> nil ) or ( lowercase( fClassName ) = 'mainform' ) ) then
                    begin
                        cTemp3 := ( rc_GetHintAttr( 'keyboard:', pObj.Hint ) );
                        if cTemp3 = '' then
                        begin
                           oScrollBlock := rc_GetScrollBoxForMobileKeyboard( pObj );
                           if oScrollBlock <> nil then
                           begin
                              oSBox := TUniScrollBox( oScrollBlock );
                              if oSBox <> nil then
                              begin
                                 if mm.varB_Mobile_Screen_Portrait then
                                    x := 310
                                 else
                                    x := 190;
                                 oSBox.Align := alNone;
                                 oSBox.Top   := 0;
                                 oSBox.Left  := 0;
                                 // 6.0.0.0
                                 if oSBox.HasParent then
                                 begin
                                    oSBox.Height := oSBox.Parent.Height - x;//260;
                                    oSBox.Width  := oSBox.Parent.Width;
                                 end;
                                 //oSBox.Tag    := -99999;

                                 //[PT] Ainda não consegui descobrir por quê o UNIGUI não detecta quando o teclado mobile é fechado,
                                 //      dessa forma, abaixo, eu exibo uma msg para lembrar ao usuário, que deve ser clicado fora do "edit"
                                 //      com o foco para o correto ajuste da tela.
                                 //[EN] I still couldn't figure out why UNIGUI doesn't detect when the mobile keyboard is closed,
                                 //      this way, below, I display a msg to remind the user, that it must be clicked outside the "edit"
                                 //      with the focus for the correct screen fit.
                                 // dm_rc.rc_ShowToaster( 'warning', cMSG_MOBILE_KB_ANYPLACE, false, 'pinItUp' );
                              end;
                           end;
                        end;
                    end;
                 end;
              end;
          except on e:exception do
                 // 6.0.0.0
                 begin
                     UniSession.Log( '[' + Params.Values['pform'] + ']' +' Step ' + iStep.tostring + ' | Msg: ' + e.Message);
                     //8.0.0.0
                     {$IFDEF DEBUG}
                     if pObj <> nil then
                     begin
                        dm_rc.rc_ShowToaster( 'warning', '_onFocus fail( ' + istep.tostring + '...' + pObj.Name, false, 'pinItUp' );
                     end
                     else
                     begin
                        dm_rc.rc_ShowToaster( 'warning', '_onFocus fail( ' + istep.tostring, false, 'pinItUp' );
                     end;
                     {$ENDIF}
                 end;
          end;
      end
      else
      if (EventName = '_onBlur') then
      begin
          try
             FClassName := Params.Values['pform'];
             if FClassName <> 'frmLookUp_Lite' then
             begin
                cTemp := Params.Values['ptype'];
                cTemp2 := Params.Values['pvalue'];
                if cTemp = 'date' then
                begin
                   if ( cTemp2 <> '' ) and ( StrToDateDef( cTemp2, -1 ) = -1 ) then
                   begin
                       mm.varC_InvalidDate := cTemp2;
                       mm.varC_InvalidDateObj := Params.Values['pobj'];
                   end;
                end;

                pFrame := rc_FindControl( FClassName );

                if pFrame = nil then
                begin
                     if mm.oPgGeneral <> nil then
                     begin
                       fClassName := dm_rc.rc_GetActiveFormFrameNameInMainTab; //Copy( mm.oPgGeneral.ActivePage.Name, 5, 100 );
                       pFrame     := rc_FindControl( FClassName );
                     end;
                end;
                // 6.0.0.0
                //if pFrame <> nil then
                pObj := nil;
                if ( pFrame <> nil ) then //and ( ( pFrame.InheritsFrom( TUniForm ) ) or ( pFrame.InheritsFrom( TUniFrame ) ) ) then//7.1.0.0
                begin
                   pObj := rc_FindControl( Params.Values[ 'pobj' ], pFrame ); // TUniControl( TComponent(pFrame).FindComponent( Params.Values[ 'pobj' ] ) );
                   if pObj <> nil then
                   begin
                      //8.0.0.0
                      bRTL := ( mm.RTL ) and ( Pos( 'ltr:', pObj.Hint ) = 0 );
                      //If ( Pos( 'inputico:', pObj.Hint ) > 0 ) and ( not mm.RTL ) then //8.0.0.0
                      If ( Pos( 'inputico:', pObj.Hint ) > 0 ) then //8.0.0.0
                      begin
                         if Pos( 'cls:border-bottom-edit', pObj.Hint ) = 0 then
                         begin
                            rc_RemoveCssClass( pObj , 'inputWithIconFocus' + varIIF( bRTL, '-rtl', '' ) + ' inputIconBg' + varIIF( bRTL, '-rtl', '' ) );
                            rc_AddCssClass( pObj , 'inputWithIcon' + varIIF( bRTL, '-rtl', '' ) + ' inputIconBg' + varIIF( bRTL, '-rtl', '' ) );
                         end
                         else
                         begin
                            rc_RemoveCssClass( pObj , 'inputWithIconFocus-BottomEdit' + varIIF( bRTL, '-rtl', '' ) + ' inputIconBg-BottomEdit' + varIIF( bRTL, '-rtl', '' ) );
                            rc_AddCssClass( pObj , 'inputWithIcon-BottomEdit' + varIIF( bRTL, '-rtl', '' ) + ' inputIconBg-BottomEdit' + varIIF( bRTL, '-rtl', '' ) );
                         end;
                      end;
                      //8.0.0.0
                      rc_RemoveCssClass( pObj , 'rc-x-form-trigger-wrap-default-focus' );
                   end;
                end;

                if pObj <> nil then
                begin
                   if ( pos( 'valid-required:', pObj.hint ) > 0 ) then
                   begin
                      oHfRequired := TUniHTMLFrame( TComponent(pFrame).FindComponent('rc__Required' + pObj.Name) );
                      if ( oHfRequired <> nil ) then
                      begin
                           oHfRequired.Visible := TUniEdit(pObj).Text = '' ;
                      end;
                   end;

                   if ( pos( 'float-label:', pObj.hint ) > 0 ) then
                   begin
                      oLabel := TUniLabel( rc_FindControl( 'rc__FloatLabel' + pObj.Name, pFrame ) ); //7.2.0.0
                      if ( oLabel <> nil ) and ( TUniEdit(pObj).Text = '' ) then
                      begin
                           rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top ) , '350' );
                      end;
                   end;
                   //7.3.0.0 clear invalidate
                   rc_RemoveCssClass( pObj , 'rc-invalid' );
                   pObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', pObj.Hint );
                end;

                if (  mm.CONFIG_LAYOUT_KEYBOARD_SCROLL_ON_MOBILE = 'ON' ) and ( pObj <> nil  ) then //  thanks for bug track JOSE HERCULANO
                begin
                   if ( mm.varB_Mobile_Screen ) and ( ( mm.varB_Android ) or ( mm.varB_Tablet ) or ( mm.varB_iOS ) ) and ( ( pFrame <> nil ) or ( lowercase( fClassName ) = 'mainform' ) ) then
                   begin
                       cTemp3 := ( rc_GetHintAttr( 'keyboard:', pObj.Hint ) );
                       if cTemp3 = '' then
                       begin
                          oScrollBlock := rc_GetScrollBoxForMobileKeyboard( pObj );
                          if oScrollBlock <> nil then
                          begin
                             oSBox := TUniScrollBox( oScrollBlock );
                             if oSBox <> nil then
                             begin
                                oSBox.Align := alClient;
                             end;
                          end;
                       end;
                   end;
                end;
             end;
          except on e:exception do
                 begin
                     //8.0.0.0
                     {$IFDEF DEBUG}
                     if pObj <> nil then
                        dm_rc.rc_ShowToaster( 'warning', '_onBlur fail( ' + istep.tostring + '...' + pObj.Name, false, 'pinItUp' )
                     else
                        dm_rc.rc_ShowToaster( 'warning', '_onFocus fail( ' + istep.tostring, false, 'pinItUp' );
                     {$ENDIF}
                 end;
          end;
      end
      else
      if EventName = '_dashboard' then
      begin
           //if Params.Values['obj'] = 'produto 1' then
              dm_rc.rc_ShowMessage( Params.Values['item'] );
      end
      else
      if EventName = '_notifications' then
      begin
           //if Params.Values['obj'] = 'produto 1' then
              dm_rc.rc_ShowMessage( Params.Values['tipo'] );
      end
      else
      if EventName = '_mainFloatButton' then
      begin
           if Params.Values['tipo'] = 'off' then
              close
           else
              dm_rc.rc_ShowMessage( Params.Values['tipo'] );
      end
      else
      if EventName = '_CloseForm' then
      begin
           if Params.Values['form'] <> '' then
           begin
                FClassName := Params.Values['form'];

                pFrame := rc_FindControl( FClassName );

                if pFrame <> nil then
                begin
                     TUniForm( pFrame ).Close;
                end;
           end;
      end
      else
      if EventName = '_getXYLookup' then
      begin
           mm.varI_PosX := StrToIntDef( Params.Values['x'] , 0 );
           mm.varI_PosY := StrToIntDef( Params.Values['y'] , 0 );
           mm.varI_PosH := StrToIntDef( Params.Values['h'] , 0 );
           mm.varI_PosW := StrToIntDef( Params.Values['w'] , 0 );
           //8.0.0.0
//           if UniApplication.FindComponent('MainForm' ) <> nil then
//           begin
//              pObj := TUniContainerPanel( Mainform.FindComponent( 'paLayoutMainMenu' ) );
//              if ( pObj <> nil ) and ( mm.CONFIG_LAYOUT_MENU_TYPE <> '1' ) then
//              begin
//                  if mm.varC_Form_Detail = nil then
//                     mm.varI_PosX := mm.varI_PosX - pObj.Width;
//              end;
//           end;
      end
      else
      //7.4.0.0 bar rating
      if EventName = '_barRating' then
      begin
           if Params.Values['pform'] <> '' then
           begin
                FClassName := Params.Values['pform'];
                pFrame     := rc_FindControl( FClassName );
                if pFrame = nil then
                   pFrame := rc_FindFormFrameIntoTab( FClassName );
                if pFrame <> nil then
                begin
                     cTemp  := Params.Values['pobj'];
                     cTemp2 := Params.Values['pvalue'];
                     pObj   := TUniControl( TComponent(pFrame).FindComponent( cTemp ) );
                     if ( pObj <> nil ) then
                     begin
                          pObj.Hint := rc_AddHintAttr( '|bar-rating-selected:' + cTemp2 , pObj.Hint , true );
                     end;
                end;
           end;
      end
      else
      //8.0.0.0 rcalert-r ( do not use .. maybe will be removed )
      if EventName = '_resizeAlerts' then
      begin
           if Params.Values['pform'] <> '' then
           begin
                FClassName := Params.Values['pform'];
                pFrame := rc_FindControl( FClassName );
                if pFrame = nil then
                   pFrame := rc_FindFormFrameIntoTab( FClassName );
                if pFrame <> nil then
                begin
                     pObj := rc_FindControl( Params.Values['pobj'] , pFrame );
                     if pObj <> nil then
                     begin
                          iOldH := StrToIntDef( Params.Values['pOldH'], pObj.Height );
                          iOldW := StrToIntDef( Params.Values['pOldW'], pObj.Width );
                          iW := StrToIntDef( Params.Values['pWidth'], pObj.Width );
                          iH := StrToIntDef( Params.Values['pHeight'], pObj.Height );
                          iImgH := StrToIntDef( Params.Values['imgH'], pObj.Height );
                          if ( iW > iOldW ) then
                          begin
                             iPercent := 100 - ( iOldW / iW * 100 );
                             pObj.Height := pObj.Height + Trunc ( ( iPercent / 100 ) * pObj.Height )
                          end
                          else
                          if ( iW < iOldW ) then
                          begin
                             iPercent := 100 - ( iW / iOldW * 100 );
                             pObj.Height := pObj.Height - Trunc ( ( iPercent / 100 ) * pObj.Height )
                          end
                          else
                              pObj.Height := StrToIntDef( Params.Values['imgH'], pObj.Height );

                          dm_rc.rc_ResizeBlocks( pFrame, false, false, false );
                     end;
                end;
           end;
      end
      else
      //8.1.0.0( testing... )
      if EventName = '_resizeBlock' then
      begin
           if Params.Values['pform'] <> '' then
           begin
                FClassName := Params.Values['pform'];
                pFrame := rc_FindControl( FClassName );
                if pFrame = nil then
                   pFrame := rc_FindFormFrameIntoTab( FClassName );
                if pFrame <> nil then
                begin
                     pObj := rc_FindControl( Params.Values['pobj'] , pFrame );
                     if pObj <> nil then
                     begin
                          iOldH := StrToIntDef( Params.Values['pOldH'], pObj.Height );
                          iOldW := StrToIntDef( Params.Values['pOldW'], pObj.Width );
                          iW    := StrToIntDef( Params.Values['pWidth'], pObj.Width );
                          iH    := StrToIntDef( Params.Values['pHeight'], pObj.Height );
                          iImgH := StrToIntDef( Params.Values['imgH'], pObj.Height );
                          if ( iW > iOldW ) then
                          begin
                             iPercent := 100 - ( iOldW / iW * 100 );
                             pObj.Height := pObj.Height + Trunc ( ( iPercent / 100 ) * pObj.Height )
                          end
                          else
                          if ( iW < iOldW ) then
                          begin
                             iPercent := 100 - ( iW / iOldW * 100 );
                             pObj.Height := pObj.Height - Trunc ( ( iPercent / 100 ) * pObj.Height )
                          end
                          else
                              pObj.Height := StrToIntDef( Params.Values['imgH'], pObj.Height );

                          dm_rc.rc_ResizeBlocks( pFrame, false, false, false );
                     end;
                end;
           end;
      end
      else
      //8.1.0.0( testing... )
      if EventName = '_resizeBlock' then
      begin
           if Params.Values['pform'] <> '' then
           begin
                FClassName := Params.Values['pform'];
                pFrame := rc_FindControl( FClassName );
                if pFrame = nil then
                   pFrame := rc_FindFormFrameIntoTab( FClassName );
                if pFrame <> nil then
                begin
                     pObj := rc_FindControl( Params.Values['pobj'] , pFrame );
                     if pObj <> nil then
                     begin
                          iOldH := StrToIntDef( Params.Values['pOldH'], pObj.Height );
                          iOldW := StrToIntDef( Params.Values['pOldW'], pObj.Width );
                          iW := StrToIntDef( Params.Values['pWidth'], pObj.Width );
                          iH := StrToIntDef( Params.Values['pHeight'], pObj.Height );
                          iImgH := StrToIntDef( Params.Values['imgH'], pObj.Height );
                          if ( iW > iOldW ) then
                          begin
                             iPercent := 100 - ( iOldW / iW * 100 );
                             pObj.Height := pObj.Height + Trunc ( ( iPercent / 100 ) * pObj.Height )
                          end
                          else
                          if ( iW < iOldW ) then
                          begin
                             iPercent := 100 - ( iW / iOldW * 100 );
                             pObj.Height := pObj.Height - Trunc ( ( iPercent / 100 ) * pObj.Height )
                          end
                          else
                              pObj.Height := StrToIntDef( Params.Values['imgH'], pObj.Height );

                          dm_rc.rc_ResizeBlocks( pFrame, false, false, false );
                     end;
                end;
           end;
      end
      else

      if EventName = '_SetFormLeft' then
      begin
           if Params.Values['form'] <> '' then
           begin
                FClassName := Params.Values['form'];

                pFrame := rc_FindControl( FClassName );

                if pFrame <> nil then
                begin
                     TUniForm( pFrame ).Left := StrToIntDef( Params.Values['value'], TUniForm( pFrame ).Left );
                end;
           end;
      end
      else
      // EVENTOS rc_BootStrapRender
      //
      // bsPill MAINMENU hint -> [[bsPills:light cls:btn-sm pgc:pgGeneral]]
      //8.0.0.0
      if ( lowercase( EventName ) = 'bstabs' ) or ( lowercase( EventName ) = 'bspills' ) then //7.5.0.3 lowercase
      begin
          bAbort := false;
          FClassName := Params.Values['form'];
          pFrame := rc_FindControl( FClassName );

          if pFrame <> nil then
          begin
              if lowercase( TComponent(pFrame).Name ) = 'mainform' then
              begin
                 pObj := TUniPageControl( FindComponent( Params.Values['pgcontrol'] ) );

                 if ( Params.Values['tab'] <> '_closeTab' ) and ( Params.Values['tab'] <> '_closeAllTabs' ) then
                 begin
                    TUniPageControl( pObj ).ActivePage := TuniTabSheet( FindComponent( Params.Values[lowercase(EventName)] ) );
                    fClassName := TUniPageControl( pObj ).ActivePage.Name;
                    TUniPageControl( pObj ).Hint := TUniPageControl( pObj ).Name + ' tb_ini:' + TUniPageControl( pObj ).ActivePageIndex.ToString + ' tb_end:1';
                 end
                 else
                 begin
                    if ( Params.Values['tab'] = '_closeTab' ) then
                       dm_rc.rc_CloseTab( MainForm, Params.Values['pgcontrol'], Params.Values[lowercase(EventName)] )
                    else
                    if ( Params.Values['tab'] = '_closeAllTabs' ) then
                    begin
                         pPageControl := TUniPageControl( FindComponent( Params.Values['pgcontrol'] ) );

                         i := pPageControl.PageCount-1;
                         // 6.0.0.0
                         if TUniPageControl( pObj ).ActivePage.Name = 'tabDashBoard' then
                            TUniPageControl( pObj ).ActivePageIndex := TUniPageControl( pObj ).ActivePageIndex + 1;

                         while ( i > 0 ) do
                         begin
                              if pPageControl.Pages[ i ] <> nil then
                                 if pPageControl.Pages[ i ].TabVisible then
                                 begin
                                      cTemp := trim( TUniTabSheet( pPageControl.Pages[ i ] ).Name );
                                      if ( cTemp <> 'tabDashBoard' ) then
                                      begin
                                         bAbort := dm_rc.rc_CloseTab( MainForm, Params.Values['pgcontrol'], cTemp );
                                      end;
                                 end;
                              Dec( i );
                         end;
                    end;
                 end;
              end
              else
              begin
                 pObj := TUniPageControl( TComponent(pFrame).FindComponent( Params.Values['pgcontrol'] ) );

                 if Params.Values['tab'] <> '_closeTab' then
                 begin
                    TUniPageControl( pObj ).ActivePage := TuniTabSheet( TComponent(pFrame).FindComponent( Params.Values[lowercase(EventName)] ) );
                    fClassName := TUniPageControl( pObj ).ActivePage.Name;
                    TUniPageControl( pObj ).Hint := TUniPageControl( pObj ).Name + ' tb_ini:' + TUniPageControl( pObj ).ActivePageIndex.ToString + ' tb_end:1';
                 end
                 else
                 begin
                    if ( Params.Values['tab'] = '_closeTab' ) then
                       dm_rc.rc_CloseTab( pFrame, Params.Values['pgcontrol'], Params.Values[lowercase(EventName)] )
                    else
                    if ( Params.Values['tab'] = '_closeAllTabs' ) then
                    begin
                         pPageControl := TUniPageControl( FindComponent( Params.Values['pgcontrol'] ) );

                         i := pPageControl.PageCount-1;
                         // 6.0.0.0
                         if TUniPageControl( pObj ).ActivePage.Name = 'tabDashBoard' then
                            TUniPageControl( pObj ).ActivePageIndex := TUniPageControl( pObj ).ActivePageIndex + 1;

                         while i > 0 do
                         begin
                              if pPageControl.Pages[ i ] <> nil then
                                 if pPageControl.Pages[ i ].TabVisible then
                                 begin
                                      cTemp := trim( TUniTabSheet( pPageControl.Pages[ i ] ).Name );
                                      // 6.0.0.0
                                      if ( cTemp <> 'tabDashBoard' ) then
                                      begin
                                         bAbort := dm_rc.rc_CloseTab( pFrame, Params.Values['pgcontrol'], cTemp );
                                      end;
                                 end;
                              Dec( i );
                         end;
                    end;
                 end;
              end;

              TUniPageControl( pObj ).tag  := 0;
              oTemp_Active_Component := mm.Active_Component;
              if ( Params.Values['tab'] = 'TabLeft' ) or ( Params.Values['tab'] = 'TabRight' ) then
              begin
                  x := mm.varI_TabIni;
                  y := mm.varI_TabEnd;

                  mm.Active_Component := TUniPageControl( pObj );
                  mm.varI_TabIni := mm.varI_TabIni + varIIF( Params.Values['tab'] = 'TabRight', varIIF( mm.varB_Mobile_Screen, 1, 6 ), varIIF( mm.varB_Mobile_Screen, -1, -6 ) );

                  if Params.Values['tab'] = 'TabRight' then
                  begin
                     if ( mm.varI_TabEnd - mm.varI_TabIni > varIIF( mm.varB_Mobile_Screen, 1, 6 ) ) then
                        mm.varI_TabIni := mm.varI_TabEnd - varIIF( mm.varB_Mobile_Screen, 1, 6 );
                  end;

                  if mm.varI_TabIni < 0 then
                     mm.varI_TabIni := 0;

                  TUniPageControl( pObj ).Hint := TUniPageControl( pObj ).Name + ' tb_ini:' + mm.varI_TabIni.ToString + ' tb_end:1' ;
                  TUniPageControl( pObj ).tag  := -999;
              end;
              // 6.0.0.0
              if UniApplication.FindComponent('MainForm' ) <> nil then
              begin
                 if mm.oPgGeneral <> nil then
                    if mm.oPgGeneral.ActivePageIndex = 0 then
                    begin
                       dm_rc.rc_ResizeBlocks( MainForm, true, true, false );
                       rc_UpdateFormsInsideContainers;
                    end
                    else
                    begin
                      rc_BootStrapRenderExecute( MainForm );
                    end;
              end;

              pFrame2 := rc_FindControl( Copy( FClassName, 5, 100 ) );

              if pFrame2 <> nil then
              begin
                 dm_rc.rc_ResizeBlocks( pFrame2, true, true, false );
              end
              else // bsPill dentro de outros forms/frames
              begin
                   FClassName := Params.Values['form'];
                   pFrame2 := rc_FindControl( FClassName );
                   if FClassName <> 'MainForm' then
                   begin
                      pFrame2 := rc_FindControl( FClassName );
                      if pFrame2 <> nil then
                         dm_rc.rc_ResizeBlocks( pFrame2, true, true, false );
                   end;
              end;
              mm.Active_Component := oTemp_Active_Component;
          end;
      end
      else
      if ( EventName = 'bsswt' ) or ( EventName = 'bschk' ) then
      begin
          EventName := Copy( EventName, 3, 3 );
          FClassName := Params.Values['form'];
          pFrame := rc_FindControl( FClassName );

          if ( pFrame <> nil ) then
          begin
              if lowercase( TComponent(pFrame).Name ) = 'mainform' then
              begin
                 pObj := TUniLabel( FindComponent( Params.Values[ EventName ] ) );
                 pObj.tag := varIIF( pObj.tag = 0, 1, 0 );

                 cTemp := pObj.Hint;
                 cTemp := rc_GetHintAttr( 'field:', cTemp );
              end
              else
              begin
                 pObj := TUniLabel( TComponent(pFrame).FindComponent( Params.Values[ EventName ] ) );
                 pObj.tag := varIIF( pObj.tag = 0, 1, 0 );

                 cTemp := pObj.Hint;
                 cTemp := rc_GetHintAttr( 'field:', cTemp , True );

                 if cTemp <> '' then
                 begin
                    cQuery     := Params.Values[ lowercase( 'query' ) ];
                    pQryMaster := TFDQuery( TComponent( pFrame ).FindComponent( cQuery ) );

                    if pQryMaster <> nil then
                       if ( pQryMaster.State in [dsInsert, dsEdit ] ) and ( Params.Values[ 'field' ] <> '' ) then
                       begin
                            try
                               if DataTypeIsNumber( pQryMaster.FieldByName( Params.Values[ 'field' ] ).DataType ) then
                                  pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := pObj.tag
                               else
                                  if pObj.tag = 0 then
                                     pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := mm.VALUE_NO
                                  else
                                     pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := mm.VALUE_YES;
                            except on e:exception do
                                   begin
                                        dm_rc.rc_ShowError( 'Field: ' + Params.Values[ 'field' ] + ' ' + e.Message )
                                   end;
                            end;
                       end;
                 end;
              end;
              // 6.0.0.0
              if ( EventName = 'chk' ) then
              begin
                 if ( pObj.Tag = 0 ) and ( Pos( 'bschk:1', pObj.Hint ) > 0 ) then
                    pObj.Hint := StringReplace( pObj.Hint, 'bschk:1', 'bschk:0' , [rfReplaceAll] )
                 else
                 if ( pObj.Tag = 1 ) and ( Pos( 'bschk:0', pObj.Hint ) > 0 ) then
                    pObj.Hint := StringReplace( pObj.Hint, 'bschk:0', 'bschk:1' , [rfReplaceAll] );
              end
              else
              begin
                 if ( pObj.Tag = 0 ) and ( Pos( 'bsswt:1', pObj.Hint ) > 0 ) then
                    pObj.Hint := StringReplace( pObj.Hint, 'bsswt:1', 'bsswt:0' , [rfReplaceAll] )
                 else
                 if ( pObj.Tag = 1 ) and ( Pos( 'bsswt:0', pObj.Hint ) > 0 ) then
                    pObj.Hint := StringReplace( pObj.Hint, 'bsswt:0', 'bsswt:1' , [rfReplaceAll] );
              end;

              if lowercase( TComponent(pFrame).Name ) = 'mainform' then
                 dm_rc.rc_BootStrapRender( MainForm, ( cTemp <> '' ) , pObj )
              else
                 dm_rc.rc_BootStrapRender( pFrame , ( cTemp <> '' ) , pObj ) ;

              if lowercase( pObj.name ) = 'swtcamera' then
                 UniSession.AddJS( varIIF( pObj.tag = 1 , 'rc_cameraOn();' , 'rc_cameraOff();' )  );
          end;
      end
      else
      if ( EventName = 'bsrgp' ) then
      begin
          FClassName := Params.Values['form'];

          pFrame := rc_FindControl( FClassName );

          if pFrame <> nil then
          begin
              pLabel := TUniLabel( TComponent(pFrame).FindComponent( Params.Values[ EventName ] ) );
              cTemp3 := lowercase( dm_rc.rc_GetParamFromRGP( pLabel.Name, rptFIELD ) );

              // all itemn set tag = 0
              for I := 0 to TComponent(pFrame).ComponentCount - 1 do
              begin
                  if TComponent(pFrame).Components[i] is TUniLabel then
                  begin
                      cTemp  := lowercase( TComponent(pFrame).Components[i].Name ); // bsrgp1_M_Tipo

                      if ( Copy( cTemp, 1, 5 ) = 'bsrgp' ) then
                      begin
                         cTemp2 := lowercase( dm_rc.rc_GetParamFromRGP( cTemp, rptFIELD ) );

                         if cTemp2 = cTemp3 then
                         begin
                            TUniLabel( TComponent(pFrame).Components[i] ).Tag := 0;

                            if lowercase( TComponent(pFrame).Name ) = 'mainform' then
                               dm_rc.rc_BootStrapRender( MainForm , ( pQryMaster <> nil ), TUniLabel( TComponent(pFrame).Components[i] ) )
                            else
                               dm_rc.rc_BootStrapRender( pFrame , ( pQryMaster <> nil ) , TUniLabel( TComponent(pFrame).Components[i] ) );
                         end;
                      end;
                  end;
              end;

              pLabel := TUniLabel( TComponent(pFrame).FindComponent( Params.Values[ EventName ] ) );

              // set tag = 1 to Item Selected
              pLabel.Tag := 1;

              cQuery     := Params.Values[ lowercase( 'query' ) ];
              pQryMaster := TFDQuery( TComponent( pFrame ).FindComponent( cQuery ) );

              if pQryMaster <> nil then
                 if ( pQryMaster.State in [dsInsert, dsEdit ] ) and ( Params.Values[ 'field' ] <> '' ) then
                 begin
                      try
                         if DataTypeIsNumber( pQryMaster.FieldByName( Params.Values[ 'field' ] ).DataType ) then
                         begin
                            pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := Params.Values[ 'value' ].ToInteger;
                         end
                         else
                         begin
                            if pLabel.tag = 0 then
                               pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := ''
                            else
                               pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := Params.Values[ 'value' ];
                         end;
                      except on e:exception do
                             begin
                                  dm_rc.rc_ShowError( 'Field: ' + Params.Values[ 'field' ] + ' ' + e.Message )
                             end;
                      end;
                 end;

              if lowercase( TComponent(pFrame).Name ) = 'mainform' then
                 dm_rc.rc_BootStrapRender( MainForm , ( pQryMaster <> nil ), pLabel )
              else
                 dm_rc.rc_BootStrapRender( pFrame , ( pQryMaster <> nil ) , pLabel );
          end;
      end
      else
      if SameText( EventName, '_GeoLocation' ) then
      begin
         if (Params.Values['lat'] <> '') then
         begin
           cLatitude  := Params.Values['lat'];
           cLongitude := Params.Values['lng'];
         end;
      end
      else
      //7.5.0.0
      if EventName = '_fillCbxFromJS' then
      begin
           FClassName := Params.Values['formName'];
           pFrame     := rc_FindControl( FClassName );
           if pFrame = nil then
              pFrame := rc_FindFormFrameIntoTab( FClassName );
           if pFrame <> nil then
           begin
               oUniComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( Params.Values['cbxName'] ) );
               If oUniComboBox <> nil then
               begin
                  oUniComboBox.Items.Clear;
                  cTemp := Params.Values['cbxItems'];
                  repeat
                        cTemp2 := Copy( cTemp, 1, Pos( '</option>', cTemp ) - 1 );
                        cTemp2 := Copy( cTemp2, Pos( '<option>', cTemp2 ) +8 );
                        cTemp  := StringReplace( cTemp, '<option>' + cTemp2 + '</option>', '', [rfReplaceAll] );
                        oUniComboBox.Items.Add( cTemp2 );
                  until Pos( '</option>', cTemp ) = 0;
                  ouniComboBox.ItemIndex := 0;
               end;
           end;
      end
      else
      //7.3.0.0
      if EventName = '_DadosCep' then   // específico para Brasil
      begin
           // pegar a referencia do FRAME ATUAL
           FClassName := Params.Values['form'];
           pVariacaoCep := Params.Values['tipocep'];
           pFrame := rc_FindControl( FClassName );

           if pFrame <> nil then
           begin
               pQryMaster := TFDQuery( TComponent( pFrame ).FindComponent( Params.Values['qry'] ) );
               if Params.Values['oUF'] <> '' then
               begin
                    pEditUF       := Params.Values['oUF'];
                    pEditCIDADE   := Params.Values['oCIDADE'];
                    pEditBAIRRO   := Params.Values['oBAIRRO'];
                    pEditENDERECO := Params.Values['oENDERECO'];
                    pEditIBGE     := Params.Values['oIBGE'];
                    if pQryMaster <> nil then
                    begin
                       if pQryMaster.State in [dsInsert, dsEdit ] then
                       begin
                         pObj := TUniControl( TComponent( pFrame ).FindComponent( pEditUF ) );
                         if ( pObj = nil ) or ( pObj.ClassType = TUniDBCombobox )  then
                            oUniDBComboBox := TUniDBComboBox( TComponent( pFrame ).FindComponent( pEditUF ) );
                         if ( pObj <> nil ) and ( oUniDBComboBox = nil ) then
                         begin
                            oUniDBEdit := TUniDBEdit( pObj );
                            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := AnsiUpperCase( Params.Values['uf'] );
                         end
                         else
                            TDataSet( oUniDBComboBox.DataSource.DataSet ).FieldByName( oUniDBComboBox.DataField ).AsString := AnsiUpperCase( Params.Values['uf'] );

                         oUniDBEdit := TUniDBEdit( TComponent( pFrame ).FindComponent( pEditCIDADE ) );
                         if oUniDBEdit <> nil then
                            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := AnsiUpperCase( Params.Values['cidade'] );

                         oUniDBEdit := TUniDBEdit( TComponent( pFrame ).FindComponent( pEditBAIRRO ) );
                         if oUniDBEdit <> nil then
                            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := AnsiUpperCase( Params.Values['bairro'] );

                         oUniDBEdit := TUniDBEdit( TComponent( pFrame ).FindComponent( pEditENDERECO ) );
                         if oUniDBEdit <> nil then
                            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := AnsiUpperCase( Params.Values['rua'] );

                         oUniDBEdit := TUniDBEdit( TComponent( pFrame ).FindComponent( pEditIBGE ) );
                         if oUniDBEdit <> nil then
                            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := Params.Values['ibge'];
                       end;
                    end
                    else
                    begin
                       pObj := TUniControl( TComponent( pFrame ).FindComponent( pEditUF ) );
                       if ( pObj = nil ) or ( pObj.ClassType = TUniCombobox )  then
                          oUniComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( pEditUF ) );
                       if ( pObj <> nil ) and ( oUniComboBox = nil ) then
                       begin
                          oUniEdit      := TUniEdit( pObj );
                          oUniEdit.Text := AnsiUpperCase( Params.Values['uf'] );
                       end
                       else
                          TUniComboBox( TComponent( pFrame ).FindComponent( pEditCidade ) ).Text   := AnsiUpperCase( Params.Values['uf'] );

                       oUniEdit := TUniEdit( TComponent( pFrame ).FindComponent( pEditCidade ) );
                       if oUniEdit <> nil then
                          oUniEdit.Text   := AnsiUpperCase( Params.Values['cidade'] );

                       oUniEdit := TUniEdit( TComponent( pFrame ).FindComponent( pEditBairro ) );
                       if oUniEdit <> nil then
                          oUniEdit.Text   := AnsiUpperCase( Params.Values['bairro'] );

                       oUniEdit := TUniEdit( TComponent( pFrame ).FindComponent( pEditEndereco ) );
                       if oUniEdit <> nil then
                          oUniEdit.Text := AnsiUpperCase( Params.Values['rua'] );

                       oUniEdit := TUniEdit( TComponent( pFrame ).FindComponent( pEditIbge ) );
                       if oUniEdit <> nil then
                          oUniEdit.Text := AnsiUpperCase( Params.Values['ibge'] );
                    end;
                    dm_rc.rc_LookUpUpdateData( pFrame );
               end
               else
               begin
                  if pQryMaster <> nil then
                     if pQryMaster.State in [dsInsert, dsEdit ] then
                     begin
                          if pQryMaster.FieldList.IndexOf ( 'endereco' + pVariacaoCep ) >= 0 then
                             pQryMaster.FieldByName( 'endereco' + pVariacaoCep ).AsString  := AnsiUpperCase( Params.Values['rua'] );

                          if pQryMaster.FieldList.IndexOf ( 'bairro' + pVariacaoCep ) >= 0 then
                             pQryMaster.FieldByName( 'bairro' + pVariacaoCep ).AsString    := AnsiUpperCase( Params.Values['bairro'] );

                          // no cad. que tem CEP...UF e CIDADE sao vinculadas a um CODIGO e nao a DESCRICAO LIVRE
                          if pQryMaster.FieldList.IndexOf ( 'codiuf' + pVariacaoCep ) >= 0 then
                          begin
                             dm_rc.memTemp.Close;
                             dm_rc.memTemp.Data := dm_rc.rc_GetRecord( mm.varB_IsNot_API ,
                                                                        false,
                                                                        ' select codigo, descricao ' +
                                                                        ' from ' + dm_rc.rc_DBSchema + 'ufs ' + //6.1.0.0
                                                                        ' where descricao = ' + QuotedStr( Params.Values['uf'] ) );
                             if mm.varC_LastErrorMsg <> '' then
                             begin
                                 dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
                                 Exit;
                             end
                             else
                                 pQryMaster.FieldByName( 'codiuf' + pVariacaoCep ).AsString    := dm_rc.memTemp.FieldByName('codigo').AsString;
                          end
                          else
                             pQryMaster.FieldByName( 'uf' + pVariacaoCep ).AsString    := AnsiUpperCase( Params.Values['uf'] );

                          if pQryMaster.FieldList.IndexOf ( 'codicidade' + pVariacaoCep ) >= 0 then
                          begin
                             dm_rc.memTemp.Close;
                             dm_rc.memTemp.Data := dm_rc.rc_GetRecord( mm.varB_IsNot_API ,
                                                                       false,
                                                                       ' select cid.codigo, cid.descricao, ufs.descricao as uf ' +
                                                                       ' from ' + dm_rc.rc_DBSchema + 'cidades cid ' + //6.1.0.0
                                                                       ' left join ' + dm_rc.rc_DBSchema + 'ufs ' + //6.1.0.0
                                                                       ' on ufs.codigo = cid.codiuf ' +
                                                                       ' where cid.descricao = ' + QuotedStr( ansiuppercase( Params.Values['cidade']  ) ) +
                                                                       ' and   uf = ' + QuotedStr( ansiuppercase( Params.Values['uf'] ) ) ) ;
                             if mm.varC_LastErrorMsg <> '' then
                             begin
                                 dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
                                 Exit;
                             end
                             else
                                 pQryMaster.FieldByName( 'codicidade' + pVariacaoCep ).AsString    := dm_rc.memTemp.FieldByName('codigo').AsString;
                          end
                          else
                             pQryMaster.FieldByName( 'cidade' + pVariacaoCep ).AsString := AnsiUpperCase( Params.Values['cidade'] );

                          // codiibge nao vai existir em todas telas q tem pesquisa de cep
                          if pQryMaster.FieldList.IndexOf ( 'codiibge' + pVariacaoCep ) >= 0 then
                             pQryMaster.FieldByName( 'codiibge' + pVariacaoCep ).AsInteger := StrToIntDef( Params.Values['ibge'], 0 );

                          dm_rc.rc_LookUpUpdateData( pFrame );
                     end;
               end;
           end;
      end
      else
      if EventName = '_DadosCepErro'  then
      begin
          dm_rc.rc_ShowMessage( 'Falha na consulta do CEP ou CEP Inválido' );
      end
      else
      if EventName = '_PositionXY'  then
      begin
          //dm_rc.rc_ShowMessage( 'obj tour:' + Params.Values['PosX'] + ' - ' + Params.Values['PosY'] );

    //      ed_X.Text := Params.Values['PosX'];
    //      ed_Y.Text := Params.Values['PosY'];

    //      pForm     := TUniForm( Params.Values['Form'] );
    //
    //      paObjTour := TUniControl( pForm.FindComponent( Params.Values['ObjetoAtual'] ));
    //
    //      paObj2 := TUniContainerPanel( MainForm.FindComponent( 'paObjFeatured' ) );
    //      paObj2.Top    := StrToIntDef( MainForm.ed_Y.Text, 0 );
    //      paObj2.Left   := StrToIntDef( MainForm.ed_X.Text, 0 );
    //      paObj2.Width  := TUniControl( paObjTour ).Width;
    //      paObj2.Height := TUniControl( paObjTour ).Height;
    //
    //      paObj3 := TUniContainerPanel( pForm.FindComponent( 'paMessage' ) );
    //
    //      paObj3.Top  := StrToIntDef( MainForm.ed_Y.Text, 0 );
    //      paObj3.Left := StrToIntDef( MainForm.ed_X.Text, 0 );
      end;
   end;
end;
//7.3.0.0
procedure TMainForm.rc_GetPublicIP;//rc_GetMyIP
Begin
  //Reference: https://www.ipify.org/
  UniSession.AddJS(
    '$(function() {'+
    '  $.getJSON("https://api.ipify.org?format=jsonp&callback=?",'+
    '    function(json) {'+
//    '      ajaxRequest(' + self.WebForm.JSName + ', "ClientIPAddr", ["ip="+json.ip]);'+ //frames
    '      ajaxRequest( MainForm.htmlFrame, "ClientIPAddr", ["ip="+json.ip]);'+
    '    }'+
    '  );'+
    '});'
    );
End;
// 6.0.0.0 menu mask
procedure TMainForm.rc_HideMenuMask( sender : TObject );
begin
     rc_RemoveCssClass( paLayoutMainMenu, 'bringtofront-lower');
     mainform.HideMask;
end;
// 6.0.0.0+menu
procedure TMainForm.rc_MainMenuClick( sender : TObject );
var
   i, iMenuW : integer;
   oObj : TUniControl;
   oMenuTransp : TUniPanel;
   oFrameFormInParent : TObject;
   cFrameFormInParent : string;
begin
(*
mm.CONFIG_LAYOUT_MENU_TYPE:
  1 botão menu apenas / menu button only
  2 botão menu e os ícones principais( MICRO MENU ) / menu button and main icons (MICRO MENU)
  3 modelo acoplado / coupled model
  4 modelo horizontal ( thinking... ) / horizontal model (thinking...)
*)
     // 6.0.0.0
     oMenuTransp := nil;
     iMenuW := StrToIntDef( rc_GetHintAttr( 'rcmenuwidth:', Self.Hint ), paLayoutMainMenu.Width );

     if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
     begin
           if paLayoutMainMenu.tag = 0 then
           begin
              oMenuTransp         := rc_CreatePanel( self, sboxMain, 'paMenuTransp' ,mm.varI_ScreenWidth , mm.varI_ScreenHeight, 0, 0, '', true, true );
              oMenuTransp.Color   := clBlack;
              oMenuTransp.Anchors := [akLeft,akRight, akTop, akBottom];
              oMenuTransp.OnClick := btnMenuClick;
              rc_AddCssClass( oMenuTransp, 'trans-obj-2 bringtofront-lower');//8.0.0.0
              rc_AddCssClass( paLayoutMainMenu, 'bringtofront-higher');
              paLayoutMainMenu.tag := -1;
              if not mm.RTL then
              begin
                 rc_Anim( paLayoutMainMenu, 'left', '0', '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
                 rc_Anim( btnMenu, 'left', ( paLayoutMainMenu.Width ).ToString, '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
              end
              else
              begin
                 rc_Anim( paLayoutMainMenu, 'right', ( 0 ).ToString , '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
                 rc_Anim( btnMenu, 'right', ( paLayoutMainMenu.Width ).ToString , '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
              end;
              labCompanyName.Visible := false;
           end
           else
           if paLayoutMainMenu.tag = -1 then
           begin
              paLayoutMainMenu.tag := 0;

              //8.1.0.0
              oMenuTransp := TUniPanel( FindComponent( 'paMenuTransp') );//if FindComponent( 'paMenuTransp') <> nil then
              if oMenuTransp <> nil then
              begin
                 oMenuTransp.Visible := false;
                 oMenuTransp.Free;
                 rc_RemoveCssClass( paLayoutMainMenu, 'bringtofront-higher'); // 6.0.0.0 menu mask
              end;

              if not mm.RTL then
              begin
                 rc_Anim( paLayoutMainMenu, 'left', '-' + paLayoutMainMenu.Width.ToString, '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
                 rc_Anim( btnMenu, 'left', '4' , '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
              end
              else
              begin
                 rc_Anim( paLayoutMainMenu, 'right', ( paLayoutMainMenu.left ).ToString , '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
                 rc_Anim( btnMenu, 'right', ( btnMenu.left ).ToString , '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
              end;
              labCompanyName.Visible := true;
           end;
     end
     else
     if mm.CONFIG_LAYOUT_MENU_TYPE = '2' then
     begin
           if paLayoutMainMenu.tag = 0 then
           begin
              rc_RemoveCssClass( paLayoutMainMenu, 'bringtofront-lower'); // 6.0.0.0 menu mask
              rc_AddCssClass( paLayoutMainMenu, 'bringtofront-higher');
              paLayoutMainMenu.tag := -1;
              Self.Hint := rc_AddHintAttr( '|rcmenumicro:opened', Self.Hint , true );
              if paLayoutMainMenu.Width <> iMenuW then
              begin
                 paLayoutMainMenu.Width := iMenuW;
                 if not mm.RTL then
                    btnMenu.Left := 4
                 else
                    btnMenu.Left := 4;
                 //rebuild menu
                 // 6.0.0.0+menu micro
                 //rc_ChangeCssProperty( '.x-treelist-nav .x-treelist-item-expander', 'color', GetWebColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR ) );
                 UniTreeMainMenuClone.Visible := false;
                 UniTreeMainMenu.Visible      := true;
              end;
           end
           else
           if paLayoutMainMenu.tag = -1 then
           begin
              //if TUniControl( sender ).Name = 'btnMenu' then //7.0.0.0 menumicro
              begin
                 paLayoutMainMenu.tag := 0;
                 if not mm.RTL then
                    btnMenu.Left := 4
                 else
                    btnMenu.Left := 4;
                 btnMenu.Visible := true;
                 labCompanyName.Visible := true;
                 rc_RemoveCssClass( paLayoutMainMenu, 'bringtofront-lower'); // 6.0.0.0 menu mask
                 rc_RemoveCssClass( paLayoutMainMenu, 'bringtofront-higher'); // 6.0.0.0 menu mask
                 rc_AddCssClass( paLayoutMainMenu, 'bringtofront-lower'); // 6.0.0.0 menu mask
                 Self.Hint := rc_AddHintAttr( '|rcmenumicro:closed', Self.Hint, true );
                 if paLayoutMainMenu.Width <> MAIN_MENU_MICRO then
                 begin
                    paLayoutMainMenu.Width := MAIN_MENU_MICRO;
                    //rebuild menu
                    // se for pra fechar o menu apos clicar / if you want to close the menu after clicking
                    try
                       // 6.0.0.0+menu micro
                       //dm_rc.rc_BuildMainMenu( '', UniTreeMainMenu );
                       //rc_ChangeCssProperty( '.x-treelist-nav .x-treelist-item-expander', 'color', 'transparent' );
                       UniTreeMainMenu.Visible      := false;
                       UniTreeMainMenuClone.Visible := true;
                    except on e:exception do
                           begin
                             dm_rc.rc_ShowError( cMSG_MENU_CREATE_ERROR + e.Message );
                           end;
                    end;
                 end;
              end;
           end;
           btnSearch.Visible := paLayoutMainMenu.tag <> 0;
           //clicou no MENU
           rc_UpdateMainControls;
           rc_AdjustFormsSize( paLayoutMainMenu );
           sboxMain.DoAlignControls; // Feedback from Farshad

           if mm.oPgGeneral <> nil then
              dm_rc.rc_ResizeBlocks( rc_FindControl( dm_rc.rc_GetActiveFormFrameNameInMainTab ) );
           //[PT] existe form/frame adicionado em um objeto ?
           //[EN] is there a form/frame added to an object?
           rc_UpdateFormsInsideContainers;
     end
     else
     if mm.CONFIG_LAYOUT_MENU_TYPE = '3' then
     begin

        if TUniControl( sender ).Name = 'btnMenu' then
        begin
           if paLayoutMainMenu.Width > 0 then
              paLayoutMainMenu.Width := 0
           else
              paLayoutMainMenu.Width := StrToIntDef( mm.CONFIG_LAYOUT_MENU_WIDTH, MAIN_MENU_EXPANDED );//7.5.0.0 menu
        end;
        // clicou no MENU / clicked on menu
        paLayoutMainMenu.tag := 1;
        rc_UpdateMainControls;
        rc_AdjustFormsSize( paLayoutMainMenu );
        sboxMain.DoAlignControls; // Feedback from Farshad

        if mm.oPgGeneral <> nil then
           dm_rc.rc_ResizeBlocks( rc_FindControl( dm_rc.rc_GetActiveFormFrameNameInMainTab ) );
        //[PT] existe form/frame adicionado em um objeto ?
        //[EN] is there a form/frame added to an object?
        rc_UpdateFormsInsideContainers;
     end;
     mm.MNU_STATE  := paLayoutMainMenu.tag.ToString;
     //7.3.0.0
     labUser.Visible := paLayoutMainMenu.Width > MAIN_MENU_MICRO ;
end;

procedure TMainForm.rc_GetGeoPosition;
begin
   UniSession.AddJS(
                 'navigator.geolocation.getCurrentPosition'+
                 '( '+
                   'function(position)'+
                   '{ '+
                   '    ajaxRequest( MainForm.htmlFrame, "_GeoLocation" ,' +
                   '      ["lat=" + position.coords.latitude, ' +
                   '       "lng=" + position.coords.longitude, ' +
                   '       "acc=" + position.coords.accuracy, ' +
                   '       "alt=" + position.coords.altitude, ' +
                   '       "altacc=" + position.coords.altitudeAccuracy, ' +
                   '       "head=" + position.coords.heading, ' +
                   '       "ts=" + position.coords.timestamp ' +
                   '      ]);' +
                   '} '+
                   ', '+

                   'function(error)'+
                   '{ '+
                  '  switch(error.code) '+
                  '  { '+
                '    case 0: '+ // UnKnown
                    '      alert(error.message); '+
                '      break; '+
                '    case 1: '+ // Denied
                    '      alert(error.message); '+
                    '      break; '+
                '    case 2: '+ // UnAvailable
                    '      alert(error.message); '+
                    '      break; '+
                '    case 3: '+ // TimeOut
                    '      alert(error.message); '+
                    '      break; '+
                    '  } '+
                    '} '+
                 ') '
                );
end;

procedure TMainForm.paCalendarClick(Sender: TObject);
begin
     btnNotificationsClick( self ); rc_CloseNotifications;
end;

procedure TMainForm.paEmailClick(Sender: TObject);
begin
     btnNotificationsClick( self ); rc_CloseNotifications;
end;

procedure TMainForm.paMessagesClick(Sender: TObject);
begin
     btnNotificationsClick( self ); rc_CloseNotifications;
end;

procedure TMainForm.paPaymentsClick(Sender: TObject);
begin
     btnNotificationsClick( self ); rc_CloseNotifications;
end;

procedure TMainForm.paTicketsClick(Sender: TObject);
begin
     btnNotificationsClick( self ); rc_CloseNotifications;
end;

procedure TMainForm.paTodoClick(Sender: TObject);
begin
     btnNotificationsClick( self ); rc_CloseNotifications;
end;
//8.2.0.0
procedure TMainForm.pgGeneralChangeValue(Sender: TObject);
var
  Ts : TUniTabSheet;
  Nd : TUniTreeNode;
begin
  try
     Ts := mm.oPgGeneral.ActivePage;

     if Ts.Tag > 0 then
     begin
        if ( mm.CONFIG_LAYOUT_MENU_TYPE <> '2' ) or ( rc_GetHintAttr( 'rcmenumicro:', Self.Hint ) = 'opened' ) then
        begin
           Nd := Pointer(Ts.Tag);
           //8.2.0.0
           if UniTreeMainMenu.Selected <> nil then
              UniTreeMainMenu.Selected := Nd;
        end;
     end;

     if ( Pos( 'theme-color:off', paBackGround.Hint ) = 0 ) then
        paBackGround.Color := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR ) ;

     btnFloatingFAB.Visible := varIIF( btnFloatingFAB.Tag = 1, ( ts.Name = 'tabDashBoard' ) , false ) ;

     if ( mm.varB_Mobile_Screen ) and ( ts.Name = 'tabDashBoard' ) then
     begin
          paLayoutTopo.Visible := true;
     end
     else
     if ( mm.varB_Mobile_Screen ) then
     begin
          paBS_Tabs.Visible    := not ( mm.CONFIG_LAYOUT_HIDE_TABS_ON_MOBILE = 'ON' );
          paLayoutTopo.Visible := not ( mm.CONFIG_LAYOUT_HIDE_TOPPANEL_ON_MOBILE = 'ON' );
     end;
  except on e:exception do
      dm_rc.rc_ShowToaster( 'info', 'pgGeneralChangeValue<br><br>' + e.message, false, 'pinItUp' );
  end;
end;
//8.2.0.0
procedure TMainForm.TabSheetClose(Sender: TObject; var AllowClose: Boolean);
var
  Ts : TUniTabSheet;
  Nd : TUniTreeNode;
begin
  try
     Ts := Sender as TUniTabSheet;
     AllowClose := ( ts.Name <> 'tabDashBoard' );
     if AllowClose then
     begin
        Nd := Pointer(Ts.Tag);
        if Assigned(Nd) then
        begin
          if Ts.Tag > 0 then
             Nd.Data := nil;
          //[PT] para o rc_BootStrapRender não exibir( podia usar o .Data, mas o VISIBLE´já usado pras ABAS que são específicas a determinadas atuações...
          //[EN] for rc_BootStrapRender not to display (you could use .Data, but VISIBLE' is already used for TABS that are specific to certain actions...
          Ts.TabVisible := false;

          if UniTreeMainMenu.Selected = Nd then
             UniTreeMainMenu.Selected := nil;
        end;
        dm_rc.rc_ResizeBlocks( Self, true, true, false );
        rc_UpdateFormsInsideContainers;
     end;
  except on e:exception do
         begin
            {$IFDEF DEBUG}
            dm_rc.rc_ShowToaster( 'info', 'TabSheetClose<br><br>' + e.message, false, 'pinItUp' );
            {$ENDIF}
         end;
  end;
end;
//8.1.0.0
procedure TMainForm.UniTreeMainMenuClick(Sender: TObject);
var
   i : integer;
   s : string;
begin
    paBackGround.OnMouseEnter := nil; //8.1.0.0 // thanks for bugtracker: ALTERDATA
    if SearchEdit.Text <> '' then
    begin
       rc_jQueryAnimate( paSearchEdit, 'width' , '', '250' );
       rc_Anim( btnSearch, 'left', inttostr( paSearchEdit.tag ), '0.8', gsEaseBack, '0.8', gsEaseTypeOut );
    end;

    if mm.CONFIG_LAYOUT_MENU_TYPE <> '1' then
    begin
       rc_RemoveCssClass( paLayoutMainMenu, 'bringtofront-lower'); // 6.0.0.0 menu mask
       rc_RemoveCssClass( paLayoutMainMenu, 'bringtofront-higher'); // 6.0.0.0 menu mask
       rc_AddCssClass( paLayoutMainMenu, 'bringtofront-lower'); // 6.0.0.0 menu mask
    end;
    // 6.0.0.0 // to work with "expand:"
    s := rc_GetHintAttr( 'treemenu:', UniTreeMainMenu.Hint, true  );
    if s = 'firstinit' then
    begin
       UniTreeMainMenu.Hint := rc_AddHintAttr( '|treemenu:runit' , UniTreeMainMenu.Hint, true  );
    end;
    UniTreeMainMenu.SingleExpand := true;
    UniTreeMainMenuClone.SingleExpand := true; //6.0.0.0+menu micro
    rc_AddFormFrameInTab( UniTreeMainMenu, '', '', '', false, false, aftNone, 0, nil, true, true );
    //paBackGround.OnMouseEnter := paBackGroundMouseEnter;//8.1.0.0 desativado até conseguir um meio que não gere tanta lentidão
end;
//8.2.0.0
procedure TMainForm.rc_AddFormFrameInTab(
             pMenu : TUniTreeMenu ;
             pFormFrameTitle, pTableName, pFormFrameName : string ;
             pIsMenuReport, pIsModal : Boolean ;
             pCallFormOp : TRCAddFormParamType ;
             pRecord     : integer;
             pParent     : TComponent ;
             pSync       : Boolean  ;
             pCloseMenu  : Boolean ;
             pTagString  : string ;
             pGetThisPK  : string ); // 6.0.0.0
var
   oLabel : TUniLabel; // 6.0.0.0
   oObj : TUniControl;
   oLayoutMainMenu : TUniControl; //7.5.0.0
   nodeMenu : TUniTreeNode;
   nodeMenuItem : string;
   nodeMenuItemParent, nodeMenuItemText : string;//8.0.0.0

   pNewIndex, iMenuItemIndex,
   f, i, t :  integer;

   Nd  : TUniTreeNode;
   Ts  : TUniTabSheet;

   FrC : TUniFrameClass;
   Fr  : TUniFrame;

   fClass : TClass;

   FrmC : TUniFormClass;
   Frm  : TUniForm;

   cTabSheetName, //8.2.0.0
   cTmp1, cTmp2, cTmp3, cFormName, cNameFormAttrib, // 6.0.0.0
   FClassName, Path: string;

   sAccessControl : string;

   bHideMaskOff, // 6.0.0.0 menu mask
   bFormDoNotExists,
   bFormWithoutCRUD,
   bAddBtn,
   bModal : Boolean;
   // 6.0.0.0
   procedure rc_SetOptionParams( pOption, pTable, pRestrictionField, pGetThisPK : string ); overload;
   begin
        bModal                                    := false;
        bFormWithoutCRUD                          := false;
        mm.varC_Table_Search           := ' ' + pTable + ' ';
        mm.varC_SelectedItem_FSideMenu := pOption;
        //[PT] montar NOME DO FORM baseado no nome da TABELA contida no item do menu SELECIONADO
        //[EN] mount FORM NAME based on the TABLE name contained in the SELECTED menu item
        FClassName := '';
        path := pFormFrameTitle;

        if trim( pTable ) <> '' then
        begin
           // Ex. opcao do Menu: Imagens | cli_imagens__imagens
           // Ex. Menu Option..: Imagens | cli_imagens__imagens
           if Pos( '__' , mm.varC_Table_Search ) = 0 then
           begin
              mm.varC_LinkedFormFrame := Trim(mm.varC_Table_Search);

              FClassName              := FRM_CLASS_CRUD_PREFIX + mm.varC_LinkedFormFrame;
              sAccessControl          := mm.varC_LinkedFormFrame;
           end
           else
           // it´s a report ?
           if Pos( '__report' , mm.varC_Table_Search ) > 0 then
           begin
              // it´s a report ?
              bFormWithoutCRUD        := ( Pos( '__report' , Trim( mm.varC_Table_Search ) ) > 0 );

              mm.varC_LinkedFormFrame := Trim(Copy( mm.varC_Table_Search, Pos( '__' , mm.varC_Table_Search ) + 2, 100 ));

              FClassName              := FRM_CLASS_PREFIX + mm.varC_LinkedFormFrame;
              sAccessControl          := mm.varC_LinkedFormFrame;
           end
           else
           //[PT] FORM name <> table name or
           //[EN] FORM without CRUD ( inherited of frmBaseCRUD )
           begin
              bModal                  := ( Pos( '__modal_' , mm.varC_Table_Search ) > 0 );
              // 6.0.0.0
              if Pos( '__' , mm.varC_Table_Search ) > 0 then
              begin
                mm.varC_LinkedFormFrame := Trim(Copy( mm.varC_Table_Search, Pos( '__' , mm.varC_Table_Search ) + 2, 100 ));
                mm.varC_Table_Search    := Trim(Copy( mm.varC_Table_Search, 1, Pos( '__' , mm.varC_Table_Search ) - 1 ));
              end
              else
              begin
                mm.varC_LinkedFormFrame := Trim(Copy( mm.varC_Table_Search, Pos( '__' , mm.varC_Table_Search ) + 2, 100 ));
                mm.varC_Table_Search    := Trim(Copy( mm.varC_Table_Search, 1, Pos( '__' , mm.varC_Table_Search ) - 1 ));
                mm.varC_Temp1           := mm.varC_LinkedFormFrame;
                mm.varC_Table_Search    := Trim(Copy( pTable, 1, Pos( '__' , pTable ) - 1 ));
                mm.varC_LinkedFormFrame := StringReplace( pTable, mm.varC_Table_Search, '', [rfReplaceAll] );
                mm.varC_Temp1           := mm.varC_LinkedFormFrame;
                mm.varC_LinkedFormFrame := StringReplace( mm.varC_LinkedFormFrame, '__modal_' , '' , [rfReplaceAll] );
                if Copy( mm.varC_LinkedFormFrame, 1, 2 ) = '__' then
                   mm.varC_LinkedFormFrame := StringReplace( mm.varC_LinkedFormFrame, '__' , '' , [rfReplaceAll] );
              end;
              // FORM name <> table name
              if mm.varC_Table_Search <> '' then
              begin
                   FClassName        := FRM_CLASS_CRUD_PREFIX + mm.varC_LinkedFormFrame;
                   sAccessControl    := mm.varC_LinkedFormFrame;
              end
              else
              // FORM without CRUD ( inherited of frmBaseCRUD )
              begin
                 if bModal then
                    mm.varC_LinkedFormFrame := StringReplace( pTable, '__modal_' , '' , [rfReplaceAll] );

                 bFormWithoutCRUD  := True;

                 FClassName        := FRM_CLASS_PREFIX + mm.varC_LinkedFormFrame;
                 sAccessControl    := mm.varC_LinkedFormFrame;
              end;
           end;

           if pRestrictionField <> '' then
              sAccessControl    := pRestrictionField;
           //[PT]
           // captura chave dinamica( PK )
           // o duplo '__' indica q a opcao não tem vinculo com Banco de Dados, ou seja,
           // só capturar PK se for opção vinculada a Banco de Dados
           //[EN]
           // dynamic key capture (PK)
           // the double '__' indicates that the option is not linked to a database, that is,
           // only capture PK if option linked to Database
           // 6.0.0.0
           if ( mm.varC_Table_Search <> '' ) and ( Pos( '__' , mm.varC_Table_Search ) = 0 ) then
           begin
              {<*RC DB}
              if pGetThisPK = '' then
                 mm.varC_PK_MasterTable := dm_rc.rc_GetPrimaryKey( lowercase( mm.varC_Table_Search ) ) //7.5.0.3 lowercase
              else
                 mm.varC_PK_MasterTable := lowercase( pGetThisPk ); //7.5.0.3 lowercase
              {RC DB*>}
           end;
        end;
   end;

   procedure rc_SetOptionParams; overload;
   var
      cT, nodeMenuItemGeneric,
      cMenuOpt : string;
   begin
        bModal                                    := pIsModal;
        bFormWithoutCRUD                          := false;
        cMenuOpt := mm.varC_SelectedItem_FSideMenu;

        if trim( pTableName ) <> '' then
           mm.varC_Table_Search           := ' ' + pTableName + ' ';

        if ( trim( pTableName ) <> '' ) and ( pFormFrameTitle = '' ) then
        begin
           mm.varC_SelectedItem_FSideMenu := rc_StrCaptalize( pTableName );

           mm.varC_LinkedFormFrame        := ansilowercase( mm.varC_SelectedItem_FSideMenu );
        end
        else
           mm.varC_SelectedItem_FSideMenu := pFormFrameTitle;

        //[PT] montar NOME DO FORM baseado no nome da TABELA contida no item do menu SELECIONADO
        //[EN] mount FORM NAME based on the TABLE name contained in the SELECTED menu item
        FClassName := '';
        if pFormFrameName = '' then
        begin
           mm.varC_LinkedFormFrame := Trim( mm.varC_Table_Search );
           FClassName              := FRM_CLASS_CRUD_PREFIX + mm.varC_LinkedFormFrame;
           sAccessControl          := mm.varC_LinkedFormFrame;
        end
        else
        // it´s a report ?
        if pIsMenuReport then
        begin
           bFormWithoutCRUD        := false;
           mm.varC_LinkedFormFrame := Trim( Copy( mm.varC_Table_Search, Pos( '__' , mm.varC_Table_Search ) + 2, 100 ));

           FClassName              := FRM_CLASS_PREFIX + mm.varC_LinkedFormFrame;
           sAccessControl          := mm.varC_LinkedFormFrame;
        end
        else
        // FORM name <> table name or
        // FORM without CRUD ( inherited of frmBaseCRUD )
        begin
           cT := mm.varC_Table_Search;
           mm.varC_LinkedFormFrame := Trim(Copy( mm.varC_Table_Search, Pos( '__' , mm.varC_Table_Search ) + 2, 100 ));
           mm.varC_Table_Search    := Trim(Copy( mm.varC_Table_Search, 1, Pos( '__' , mm.varC_Table_Search ) - 1 ));
           // FORM name <> table name
           if pFormFrameName = '' then
           begin
                FClassName        := FRM_CLASS_CRUD_PREFIX + mm.varC_LinkedFormFrame;
                sAccessControl    := mm.varC_LinkedFormFrame;
           end
           else
           // FORM without CRUD ( inherited of frmBaseCRUD )
           begin
              cT := pTableName;

              if ( bModal ) then
              begin
                 mm.varC_LinkedFormFrame := pFormFrameName;
                 FClassName        := FRM_CLASS_PREFIX + mm.varC_LinkedFormFrame;
              end
              else
              if ( pFormFrameName <> '' ) then
              begin
                 mm.varC_LinkedFormFrame := pFormFrameName;

                 FClassName        := FRM_CLASS_CRUD_PREFIX + mm.varC_LinkedFormFrame;
                 fClass            := FindAnyClass( FClassName );

                 if fClass = nil then
                 begin
                    FClassName     := FRM_CLASS_PREFIX + mm.varC_LinkedFormFrame;

                    fClass := FindAnyClass( FClassName );
                    if fClass = nil then
                    begin
                       FClassName     := FRM_CLASS_PREFIX + mm.varC_LinkedFormFrame;

                       if fClass = nil then
                       begin
                            fClass     := FindAnyClass( FClassName );
                       end;
                    end;
                 end;

                 mm.varC_Table_Search := cT;
                 mm.varC_SelectedItem_FSideMenu := cMenuOpt;
              end;

              bFormWithoutCRUD      := True;

              sAccessControl := mm.varC_LinkedFormFrame;

              nodeMenuItem      := pFormFrameTitle;
              nodeMenuItemGeneric := nodeMenuItem;
              cTmp1             := pFormFrameTitle;
           end;
        end;
        //[PT]
        // captura chave dinamica( PK )
        // o duplo '__' indica q a opcao não tem vinculo com Banco de Dados, ou seja,
        // só capturar PK se for opção vinculada a Banco de Dados
        //[EN]
        // dynamic key capture (PK)
        // the double '__' indicates that the option is not linked to a database, that is,
        // only capture PK if option linked to Database
        // 6.0.0.0
        if ( mm.varC_Table_Search <> '' ) and ( Pos( '__' , mm.varC_Table_Search ) = 0 ) then
        begin
            {<*RC DB}
            if pGetThisPK = '' then
               mm.varC_PK_MasterTable := dm_rc.rc_GetPrimaryKey( lowercase( mm.varC_Table_Search ) ) //7.5.0.3 lowercase
            else
               mm.varC_PK_MasterTable := lowercase( pGetThisPk ) //7.5.0.3 lowercase
            {RC DB*>}
        end;
   end;
begin
    //7.5.0.0
    oLayoutMainMenu := TUniControl( rc_FindControl( 'paLayoutMainMenu' ) );
    if oLayoutMainMenu <> nil then
       rc_AddCssClass( oLayoutMainMenu, 'bringtofront-lower');
    rc_ForceLookUpsToClose;
    try
       Fr       := nil;
       FrC      := nil;
       FrmC     := nil;
       nodeMenu := nil;
       Ts       := nil; // Linux Issue ( feedback by mesut )
       f        := 0;   // Linux Issue ( feedback by mesut )

       mm.varC_FieldMasks             := '';
       mm.varC_SelectedItem_FSideMenu := '';
       mm.varC_PK_MasterTable         := '';
       mm.varC_LinkedFormFrame        := '';
       cTmp1                                     := '';

       iMenuItemIndex := -1;
       //[PT] chamada externa, não veio do uniTreeMenu
       //[EN] external call, not from uniTreeMenu
       bAddBtn := Pos( '_ADD' , pTableName ) > 0;
       //7.3.0.0
       if ( bAddBtn ) or ( pRecord > 0 ) or ( ( pParent = nil ) and ( pCallFormOp = aftNone ) ) then
       begin
            pTableName := StringReplace( pTableName , '_ADD' , '' , [rfReplaceAll] );

            //[PT] Veio de um LookUp com Apelido adicional
            //[EN] Came from a LookUp with additional Nickname
            if Pos( '__' , pTableName ) > 0 then
            begin
               pTableName := Copy( pTableName , 1, Pos( '__' , pTableName ) -1 );
               cTmp1 := pTableName;
            end;

            cTmp1 := pTableName;

            cFormName := '';
            if Pos( '-' , pTableName ) > 0 then
            begin
               cFormName  := Copy( pTableName , Pos( '-' , pTableName ) +1, 100 );
               pTableName := Copy( pTableName , 1, Pos( '-' , pTableName ) -1 );
               // chamada dinâmica / dynamic call
               if cFormName <> '' then
                  cTmp1      := pTableName + '__' + cFormName
               else
                  cTmp1 := StringReplace( cTmp1, '-', '', [rfReplaceAll] );
            end;
            mm.varI_NumMenu      := Length( mm.varA_FSideMenu );
            mm.varC_Table_Search := pTableName;
            //[PT] procurar se foi definido uma opção na(s) unit(s) de formação de MENU DINAMICO( uMenu_BASICS, uMenu_MOVEMENT... )
            //[EN] search if an option has been defined in the DYNAMIC MENU training unit (s) (uMenu_BASICS, uMenu_MOVEMENT ...)
            mm.varB_Processed := False;
            //8.0.0.0 treemenu
            if pMenu <> nil then
            begin
               nodeMenu     := pMenu.Selected;
               nodeMenuItem := Trim( nodeMenu.Text );
               //8.0.0.0
               nodeMenuItemParent := '';
               try
                  if Assigned(nodeMenu.Parent) then
                     nodeMenuItemParent := nodeMenu.Parent.Text;
               except
               end;
               if Pos( '<span>', nodeMenuItemParent ) > 0 then
               begin
                  nodeMenuItemParent := trim( ( rc_GetHtmlTagContent( nodeMenuItemParent, '<span>', '</span>' ) ) ) ;
               end;
               nodeMenuItemText := trim( ( rc_GetHtmlTagContent( nodeMenuItem, '<span>', '</span>' ) ) );
            end;
            //8.0.0.0 treemenu
            if ( Trim( cTmp1 ) <> '' ) and ( mm.varA_FSideMenu[ f ].Table <> '' ) then
            begin
               for f  := 1 to mm.varI_NumMenu - 1 do
               begin
                    if ( ( ansilowercase( mm.varA_FSideMenu[ f ].Table ) = Trim( cTmp1 ) ) and ( Trim( cTmp1 ) <> '' ) ) or
                       ( ( ansilowercase( mm.varA_FSideMenu[ f ].Table ) = '__' + ansilowercase( pFormFrameName ) ) and ( Trim( pFormFrameName ) <> '' ) ) then
                    begin
                         mm.varC_SelectedItem_FSideMenu := mm.varA_FSideMenu[ f ].option;
                         mm.varB_Processed := True;
                         iMenuItemIndex := f;
                         Break;
                    end;
               end;
            end;
       end;
       try
          if pMenu <> nil then
          begin
             nodeMenu     := pMenu.Selected;
             nodeMenuItem := Trim( nodeMenu.Text );
             //8.0.0.0
             nodeMenuItemParent := '';
             try
                if Assigned(nodeMenu.Parent) then
                   nodeMenuItemParent := nodeMenu.Parent.Text;
             except
             end;
             if Pos( '<span>', nodeMenuItemParent ) > 0 then
             begin
                nodeMenuItemParent := trim( ( rc_GetHtmlTagContent( nodeMenuItemParent, '<span>', '</span>' ) ) ) ;
             end;
             nodeMenuItemText := trim( ( rc_GetHtmlTagContent( nodeMenuItem, '<span>', '</span>' ) ) );

             if Pos( '<span>', nodeMenuItem ) > 0 then
             begin
                cTmp1 := Copy( nodeMenuItem, Pos( '<span>', nodeMenuItem ) + 6 );
                cTmp1 := Trim( Copy( cTmp1, 1, Pos( '<', cTmp1 ) -1 ) );
             end;
             //[PT] O Nome da maioria dos FORMs coincide com o nome da TABELA, criticar apenas os que não coincidem
             //[EN] The name of most FORMs matches the TABLE name, criticize only those that do not match
             mm.varI_NumMenu      := Length( mm.varA_FSideMenu );
             mm.varC_Table_Search := '';
             //[PT] procurar se foi definido uma opção na(s) unit(s) de formação de MENU DINAMICO( uMenu_BASICS, uMenu_MOVEMENT... )
             //[EN] search if an option has been defined in the DYNAMIC MENU training unit (s) (uMenu_BASICS, uMenu_MOVEMENT ...)
             mm.varB_Processed := False;
             for f  := 1 to mm.varI_NumMenu - 1 do
             begin
                  try
                     //8.0.0.0 treemenu
                     if ( ansilowercase( mm.varA_FSideMenu[ f ].option ) = Ansilowercase( Trim( nodeMenuItem ) ) ) and
                        ( ansilowercase( mm.varA_FSideMenu[ f ].Form ) = Ansilowercase( Trim( nodeMenuItemParent ) ) ) then //7.3.0.0
                     begin
                          if pTagString = '' then pTagString := mm.varA_FSideMenu[ f ].tag; // 6.0.0.0
                          rc_SetOptionParams( mm.varA_FSideMenu[ f ].option, mm.varA_FSideMenu[ f ].table, mm.varA_FSideMenu[ f ].RestrictionField, mm.varA_FSideMenu[ f ].GetThisPK ); // 6.0.0.0
                          iMenuItemIndex := f;
                          mm.varB_Processed := True;
                          Break;
                     end;
                  except on e:exception do
                         begin
                              rc_HideMenuMask( self ); // 6.0.0.0 menu mask warning on open
                              mm.varC_LastErrorMsg := mm.varC_LastErrorMsg + ' ' + mm.MSG_ERROR + ': ' + e.Message;
                              dm_rc.rc_ShowError( '<h2 style="color: gray;text-align: center;">' + cMSG_MENU_TRIGGER_ERROR + f.ToString + ') !</h2><br>' +
                                                  mm.varC_LastErrorMsg + '<br><br>' +
                                                  mm.MSG_CONTACT_SUPPORT);
                              Abort;
                         end;
                  end;
             end;
             Ts := nodeMenu.Data;
          end
          else
          //[PT] se não encontrou uma opção definida na(s) unit(s) de formação de MENU DINAMICO..então é um FORM ISOLADO
          //[EN] if you did not find an option defined in the DYNAMIC MENU training unit (s) ... then it is an ISOLATED FORM
          begin
              cTmp1 := '';
              //7.0.0.0 menu report
              mm.varC_Table_Search := '';
              if pIsMenuReport then
              begin
                 If copy( pFormFrameName, 1, 2 ) <> '__' then
                    pFormFrameName := '__' + pFormFrameName;
                 mm.varC_Table_Search := pFormFrameName;
              end;
              if mm.varB_Processed  then
                 cTmp1 := mm.varC_SelectedItem_FSideMenu;
              //  nil, pFormFrameTitle, pTableName, pFormFrameName, pIsMenuReport, pIsModal
              rc_SetOptionParams;

              nodeMenuItem := Trim( mm.varC_SelectedItem_FSideMenu );
              // issue feedback by JOSAURO
              if ( cTmp1 <> '' ) and ( ( mm.varC_SelectedItem_FSideMenu = '' ) or ( mm.varB_Processed ) )then
              begin
                 mm.varC_SelectedItem_FSideMenu := cTmp1;
                 nodeMenuItem := cTmp1;
              end
              else
                 cTmp1 := mm.varC_SelectedItem_FSideMenu;
          end;
          //[PT] se nao tem uma CLASSE de FORM/FRAME associada, clicou num submenu, então não tem o q processar
          //[EN] if you don't have an FORM / FRAME CLASS associated, clicked on a submenu, then you don't have to process it
          if FClassName <> '' then
          begin
              // 6.0.0.0 menu mask
              bHideMaskOff := ( iMenuItemIndex >= 0 ) and ( mm.varA_FSideMenu[ iMenuItemIndex ].HideMaskOff );
              if UniApplication.FindComponent('MainForm' ) <> nil then
              begin
                 MainForm.ShowMask;
                 // 6.0.0.0 menu mask
                 //[PT] se o usuário clicar diversas vezes no menu durante a abertura de outras opções que contenham algum processamento, o unigui gera um erro sobre um "tabconfig".
                 //      existem alguns posts no fórum oficial de outros usuarios( que não usam RADCORE ) que também passaram por isso. Acredito que seja algo relacionao do Synchronize
                 //[EN] if the user clicks on the menu several times while opening other options that contain some processing, unigui generates an error about a "tabconfig".
                 //      there are some posts on the official forum from other users (who don't use RADCORE) who also went through this. I believe it is something related to Synchronize
                 //if pSync then
                 //   UniSession.Synchronize();
              end;

              mm.varC_FormSource_Search     := FClassName;
              //6.0.0.0
              //[PT] definir a chave primária com base na tabela vinculada a opção selecionada no menu( tbl: ou getpk: )
              //[EN] define la clave principal según la tabla vinculada a la opción seleccionada en el menú (tbl: o getpk:)
              if ( iMenuItemIndex >= 0 ) then
              begin
                 if ( mm.varA_FSideMenu[ iMenuItemIndex ].Table <> '' ) and ( Pos( '__' , mm.varA_FSideMenu[ iMenuItemIndex ].Table ) = 0 ) then
                    if mm.varA_FSideMenu[ iMenuItemIndex ].GetThisPK = '' then
                       mm.varC_PK_MasterTable := dm_rc.rc_GetPrimaryKey( lowercase( mm.varC_Table_Search ) ) //7.5.0.3 lowercase
                    else
                       mm.varC_PK_MasterTable := lowercase( mm.varA_FSideMenu[ iMenuItemIndex ].GetThisPK ) ;//7.5.0.3 lowercase
              end;
              //7.5.0.0
              if ( pMenu <> nil ) and ( pMenu.Name = 'uniTreeMainMenu' ) then
                 pMenu.tag := 0;

              //8.0.0.3
              if ( pMenu <> nil ) and ( mm.CONFIG_LAYOUT_MENU_TYPE_AUTOCLOSE = 'ON' ) then //8.0.0.1
                 rc_MainMenuClick( Self );

              // 6.0.0.0
              cNameFormAttrib := '';
              //[PT] FORMs que sao BASICOS( apenas campos CODIGO e DESCRICAO ) - herdados de "frmCadBASICS"
              //[EN] FORMs that are BASIC (only CODE and DESCRIPTION fields) - inherited from "frmCadBASICS"
              //8.0.0.0
              if ( ( iMenuItemIndex >= 0 ) and ( mm.varA_FSideMenu[ iMenuItemIndex ].BasicCrud = 'S' ) ) then
                 FClassName := 'TfrmCadBasics';
              //[PT] Verifica se o form/frame já está aberto em alguma aba
              //[EN] Checks if the form/frame is already open in any tab
              if mm.oPgGeneral <> nil then
              begin
                 for I := 0 to mm.oPgGeneral.PageCount - 1 do
                 begin
                     with mm.oPgGeneral do
                     begin

                         if Pos( '<span>', cTmp1 ) > 0 then
                         begin
                            cTmp1 := Copy( cTmp1, Pos( '<span>', cTmp1 ) + 6 );
                            cTmp1 := Trim( Copy( cTmp1, 1, Pos( '<', cTmp1 ) -1 ) );
                         end;

                         cTmp2 := Trim( mm.oPgGeneral.Pages[I].Caption );
                         cNameFormAttrib := ansilowercase( rc_GetHintAttr( 'name-form:', mm.oPgGeneral.Pages[I].Hint ) );  // 6.0.0.0

                         if Pos( '<span>', Pages[I].Caption ) > 0 then
                         begin
                            cTmp2 := Copy( Pages[I].Caption, Pos( '<span>', Pages[I].Caption ) + 6 );
                            cTmp2 := Trim( Copy( cTmp2, 1, Pos( '<', cTmp2 ) -1 ) );
                         end;
                         //[PT] já está aberto em uma aba ?
                         //[EN] is already open in a tab?
                         //8.0.0.0 treemenu
                         if ( ansilowercase(cTmp1) = ansilowercase(cTmp2) ) and
                            ( Pos( Copy( cNameFormAttrib, 1, Pos( '__', cNameFormAttrib ) - 1 ), ansilowercase( FClassName ) ) > 0 ) then //[PT] chamada isolada da rc_FormFrameInTab com o mesmo form já aberto
                                                                                                                                          //[EN] isolated call of rc_FormFrameInTab with the same form already open
                         begin
                           rc_HideMenuMask( self );
                           if mm.oPgGeneral <> nil then //7.5.0.0
                              mm.oPgGeneral.ActivePageIndex := I;
                           // 6.0.0.0
                           {<*RC STARTER}
                           //7.5.0.0
                           if ( pMenu <> nil ) and ( pMenu.Name = 'uniTreeMainMenu' ) and ( pMenu.tag = 0 ) then
                              dm_rc.rc_BootStrapRender( self ) ; // feedback by CENK VAROL( Turkey )

                           if ( mm.CONFIG_LAYOUT_MENU_TYPE = '2' ) or ( mm.CONFIG_LAYOUT_MENU_TYPE = '3' ) then
                           begin
                              //7.5.0.0 clicou no MENU / clicked on MENU
                              if oLayoutMainMenu <> nil then
                              begin
                                 oLayoutMainMenu.tag := 0;
                                 rc_UpdateMainControls;
                                 //8.2.0.0 performance AdjustFormsSize//rc_AdjustFormsSize( oLayoutMainMenu );
                              end;
                              //sboxMain.DoAlignControls; // Feedback from Farshad
                              //8.2.0.0 performance
                              //if mm.oPgGeneral <> nil then
                              //   dm_rc.rc_ResizeBlocks( rc_FindControl( dm_rc.rc_GetActiveFormFrameNameInMainTab ) );
                              //[PT] existe form/frame adicionado em um objeto ?
                              //[EN] is there a form/frame added to an object?
                              rc_UpdateFormsInsideContainers;
                           end;
                           {RC STARTER*>}

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
                           // 6.0.0.0
                           if pCallFormOp <> aftNone then
                           begin
                              // 6.0.0.0
                              FClassName := trim( dm_rc.rc_GetActiveFormFrameNameInMainTab( mm.oPgGeneral.Pages[ i ] ) ) ;
                              Fr := TUniFrame( rc_FindControl( FClassName ) );
                              if Fr = nil then
                              begin
                                 FClassName := mm.oPgGeneral.Pages[ i ].Name ;
                                 Fr := TUniFrame( rc_FindControl( FClassName ) );
                              end;
                              if Fr <> nil then
                              begin
                                 oObj := TUniControl( Fr.FindComponent('ed_codmaster') );
                                 if oObj <> nil then
                                 begin
                                      //8.0.0.0
                                      oObj.Hint := rc_SetHintAttr( intToStr( pRecord ) , '_codmaster:', oObj.Hint, True );

                                      case pCallFormOp of
                                        aftNone    : oObj.Tag  := 0;
                                        aftShow    : oObj.Tag  := -1;
                                        aftShowReg : oObj.Tag  := -3;
                                        aftEdit    : oObj.Tag  := -2;
                                        aftInsert  : Fr.Tag    := 1;
                                      end;
                                      t := StrToIntDef( oObj.Hint, 0 );
                                      if t <> 0 then
                                      begin
                                           if TUniComboBox( Fr.FindComponent('cbxSearchCRUDField1') ) <> nil then
                                              TUniComboBox( Fr.FindComponent('cbxSearchCRUDField1') ).ItemIndex := 0;
                                           if Pos( 'model-crud:1', TUniDBGrid( Fr.FindComponent('dbgSearchCRUD') ).Hint ) > 0 then
                                           begin
                                              if TUniEdit( Fr.FindComponent('edQuickSearch') ) <> nil then
                                                 TUniEdit( Fr.FindComponent('edQuickSearch') ).Text := IntToStr( t );

                                              TUniBitBtn( Fr.FindComponent('btnQuickSearch') ).Click;
                                           end
                                           else
                                           begin
                                              if TUniEdit( Fr.FindComponent('edSearchCRUD1') ) <> nil then
                                                 TUniEdit( Fr.FindComponent('edSearchCRUD1') ).Text := IntToStr( t );

                                              TUniBitBtn( Fr.FindComponent('btnSearchCRUD') ).Click;
                                           end;

                                           if TUniEdit( Fr.FindComponent('edSearchCRUD1') ) <> nil then
                                              TUniEdit( Fr.FindComponent('edSearchCRUD1') ).Text := '';
                                      end
                                      else
                                      begin
                                           if TUniBitBtn( Fr.FindComponent('btnSearchCRUD') ) <> nil then
                                              TUniBitBtn( Fr.FindComponent('btnSearchCRUD') ).Click;
                                      end;
                                 end;
                              end;
                           end;

                           if ( not bHideMaskOff ) and ( UniApplication.FindComponent('MainForm' ) <> nil ) then MainForm.HideMask; // 6.0.0.0 menu mask
                           // 6.0.0.0
                           //[PT] Quando é chamado novamente um FORM/FRAME que já está aberto em uma aba, o RC vai pesquisar
                           //      a existência de um botão chamado "btnClickOnRecall' e disparar seu evento Click, se não existir,
                           //      vai disparar o evento OnReady novamente, pois ele não recria o formulário/frame.
                           //      Por exemplo, você pode criar um "atributo privado" no "hint" do seu form e testar se ele existe
                           //      ou não para executar alguma ação caso esse atributo exista.
                           //[EN] When a FORM/FRAME that is already open in a tab is called again, RC will search
                           //      the existence of a button called "btnClickOnRecall' and triggering its Click event, if it does not exist,
                           //      will fire the OnReady event again, as it does not recreate the form/frame.
                           //      For example, you can create a "private attribute" in the "hint" of your form and test if it exists
                           //      or not to perform any action if this attribute exists.
                           if fClass = nil then
                              fClass := FindAnyClass( FClassName );
                           if fClass <> nil then
                           begin
                               if fClass.InheritsFrom(TUniFrame) then
                               begin
                                  Fr := TUniFrame( rc_FindControl( cNameFormAttrib ) );
                                  if Fr <> nil then
                                  begin
                                     //7.3.0.0
                                     if pTagString <> '' then TUniFrame( Fr ).Hint := rc_AddHintAttr( '|tag-form:' + pTagString, TUniFrame( Fr ).Hint, true );//false

                                     if TUniButton( Fr.FindComponent('btnClickOnRecall') ) <> nil then
                                        TUniButton( Fr.FindComponent('btnClickOnRecall') ).Click
                                     else
                                        TUniFrame( Fr ).OnReady( self );
                                  end;
                               end
                               else
                               begin
                                  FrmC := TUniFormClass( FindAnyClass( cNameFormAttrib ) );
                                  if FrmC <> nil then
                                  begin
                                     //7.3.0.0
                                     if pTagString <> '' then TUniForm( FrmC ).Hint := rc_AddHintAttr( '|tag-form:' + pTagString, TUniForm( FrmC ).Hint, true );//false

                                     if TUniButton( Fr.FindComponent('btnClickOnRecall') ) <> nil then
                                        TUniButton( Fr.FindComponent('btnClickOnRecall') ).Click
                                     else
                                        TUniForm( FrmC ).OnReady( self );
                                  end;
                               end;
                           end;
                           Exit;
                         end;
                     end;
                 end;
              end;

              if not Assigned(Ts) then
              begin
                 pNewIndex := 0;
                 if mm.oPgGeneral <> nil then
                    pNewIndex  := mm.oPgGeneral.PageCount;

                 mm.varC_SearchWhere        := '';
                 mm.varC_SearchOrder        := '';
                 mm.varC_Selected_FormFrame := nodeMenuItem;
                 mm.varC_StatusSearch       := '';
                 mm.varC_FieldMasks         := '';

                 bFormDoNotExists                        := True;
                 if ( mm.CONFIG_LAYOUT_TAB_OFF = 'ON' ) then
                 begin
                    if mm.oPgGeneral <> nil then
                       if mm.oPgGeneral.ActivePage.PageIndex > 0 then
                          mm.oPgGeneral.ActivePage.Close;
                 end;
                 //[PT] obrigatorio Senha MASTER( USER_ADMIN_PASS )
                 //[EN] mandatory MASTER Password( USER_ADMIN_PASS )
                 (*<prj-masterpass-1*)//8.1.0.0
                 if ( f > 0 ) and ( mm.varA_FSideMenu[ f ].Master ) then
                 begin
                    //7.4.0.0 run login
                    if ( mm.varB_RunLogin ) then
                    begin
                       dm_rc.rc_ShowInputBox( rc_GetSubstr( mm.MSG_ADMIN_OR_MASTER_PASSWORD, '@' ),
                                              rc_GetSubstr( mm.MSG_ADMIN_OR_MASTER_PASSWORD, '@', true ), '', '', '', true );
                       if not (
                          ( dm_rc.rc_GetMD5( mm.varC_InputBox_Result1 ) = USER_ADMIN_PASS ) or
                          ( ( dm_rc.memUsers.FieldByName('master').AsString = '1' ) and
                            ( dm_rc.rc_GetMD5( dm_rc.memUsers.FieldByName('nome').AsString + mm.varC_InputBox_Result1 ) =
                              uppercase( dm_rc.memUsers.FieldByName('senha').AsString ) ) ) ) then
                       begin
                          dm_rc.rc_ShowWarning( mm.MSG_INVALID_PASSWORD );
                          rc_HideMenuMask( self ); // 6.0.0.0 menu mask warning on open
                          Abort;
                       end;
                    end
                    else
                    begin
                       dm_rc.rc_ShowWarning( mm.MSG_INVALID_PASSWORD );
                       rc_HideMenuMask( self ); // 6.0.0.0 menu mask warning on open
                       Abort;
                    end;
                 end;
                 (*<prj-masterpass-2*)//8.1.0.0
                 //[PT] verifica restricao do usuário - ACESSO
                 //[EN] checks user restriction - ACCESS
                 {<*RC DB}
                 If not dm_rc.rc_PermissionVerify( mm.varC_Selected_FormFrame ,
                                                   Trim( sAccessControl ) ,
                                                   PT_ACCESS ) then{RC DB*>}
                 begin
                    FrC := nil;
                    rc_HideMenuMask( self ); // 6.0.0.0 menu mask warning on open
                    Abort;
                 end
                 else
                 if pNewIndex > StrToIntDef( mm.CONFIG_LAYOUT_TAB_MAX_OPENED, 5 ) then
                 begin
                    FrC := nil;
                    rc_HideMenuMask( self ); // 6.0.0.0 menu mask warning on open
                    dm_rc.rc_ShowSweetAlertSimple( format( mm.MSG_BUGERROR_MAX_TAB_OPENED, [ mm.CONFIG_LAYOUT_TAB_MAX_OPENED ] ) );
                    Abort;
                 end
                 else
                 begin
                      mm.varC_LastErrorMsg := mm.MSG_BUGERROR_MENU_DO_NOT_EXIST;
                      try
                        //[PT] evitar mensagem ANTES da EXCEPTION ( block showmodal ... )
                        //[EN] avoid message BEFORE EXCEPTION ( block showmodal ... )
                        fClass := FindAnyClass( FClassName );
                        bFormDoNotExists := False;
                        if fClass <> nil then
                        begin
                              FrC  := TUniFrameClass( FindAnyClass( FClassName ) );
                              FrmC := TUniFormClass( FindAnyClass( FClassName ) );
                        end
                        else  // link:
                        begin
                             If Pos( 'link:' , FClassName ) > 0 then
                             begin
                                  bFormDoNotExists := False;
                                  cTmp1 := trim( Copy( FClassName, Pos( 'link:' , FClassName ) + 5 , 200 ) );
                                  dm_rc.rc_OpenLink( cTmp1 );
                                  mm.varC_LastErrorMsg := '';
                             end
                             else
                             begin
                                bFormDoNotExists := True;
                             end;
                        end;

                        if FrC <> nil then
                        begin
                           bFormDoNotExists     := False;
                           if not bModal then
                           begin
                              if ( pParent = nil ) and ( mm.oPgGeneral <> nil ) then
                              begin
                                 Ts := TUniTabSheet.Create(Self);

                                 if mm.oPgGeneral <> nil then
                                    Ts.PageControl   := mm.oPgGeneral;

                                 Ts.Closable      := True;
                                 //7.1.0.0  thanks Alexandre Storti
                                 if mm.oPgGeneral <> nil then //7.5.0.0
                                    ts.ClientEvents.UniEvents.Values['beforeInit'] :=
                                       'function beforeInit( sender, config )' +
                                       ' { '+
                                       '   config.bodyStyle = ''background-color: ' + uniColor2Web( mm.oPgGeneral.Color ) + ';''' +
                                       ' }';
                                 //7.3.0.0 closebtn
                                 if ( iMenuItemIndex >= 0 ) and
                                    ( ( not mm.varA_FSideMenu[ iMenuItemIndex ].CloseBtn ) or
                                      ( not pCloseMenu and( pParent = nil ) and ( pCallFormOp = aftNone ) )  ) then
                                    Ts.Hint := '[[closebtn:false]]';

                                 Ts.OnClose       := TabSheetClose;

                                 if pMenu <> nil then
                                    Ts.Tag        := NativeInt( nodeMenu )
                                 else
                                    Ts.Tag        := (-1) * ( ( Random( 100 ) + 1 ) + ( Random( 200 ) + 1 ) );

                                 //8.2.0.0 remove badge info
                                 if Pos( '<span class="badge', nodeMenuItem ) > 0 then
                                 begin
                                    nodeMenuItem := Copy( nodeMenuItem, Pos( '<span class="badge', nodeMenuItem ) );
                                    nodeMenuItem := Copy( nodeMenuItem, 1, Pos( '</span>', nodeMenuItem ) + 6 );
                                    nodeMenuItem := stringReplace( mm.varC_Selected_FormFrame, nodeMenuItem, '', [rfReplaceAll] );
                                 end;

                                 Ts.Caption := dm_rc.rc_StripHtmlTags( nodeMenuItem );
                                 //8.2.0.0 check if the same name and index exists( thanks for bug tracker Roberto Nicchi from Italy )
                                 cTabSheetName := 'tab' + mm.varC_FormSource_Search + '__' + pNewIndex.ToString;
                                 if rc_FindControl( cTabSheetName ) <> nil then
                                 begin
                                    repeat
                                       Inc( pNewIndex );
                                       cTabSheetName := 'tab' + mm.varC_FormSource_Search + '__' + pNewIndex.ToString;
                                    until rc_FindControl( cTabSheetName ) = nil;
                                 end;
                                 Ts.Name    := 'tab' + mm.varC_FormSource_Search + '__' + pNewIndex.ToString;

                                 if mm.oPgGeneral <> nil then
                                    mm.oPgGeneral.ActivePage := Ts;
                                 //7.4.0.0 anim
                                 if ( mm.CONFIG_LAYOUT_MENU_CALL_ANIM = 'ON' ) and ( mm.CONFIG_LAYOUT_ANIM_EFFECTS = 'ON' ) then
                                    rc_AddCssClass( ts, 'slide_in' );
                              end
                              else
                              if ( pParent = nil ) and ( mm.oPgGeneral = nil ) then
                              begin
                                rc_HideMenuMask( self ); // 6.0.0.0 menu mask warning on open
                                mm.varC_LastErrorMsg := mm.MSG_BUGERROR_WITHOUT_PARENT_TO_SHOW;
                                dm_rc.rc_ShowSweetAlertSimple( mm.varC_LastErrorMsg );
                                Exit;
                              end;
                           end;
                           dm_rc.rc_ScreenUpdate;

                           if fClass.InheritsFrom(TUniFrame) then
                           begin
                              if pParent <> nil then
                              begin
                                 Fr := TUniFrame( rc_FindControl( Copy( FClassName, 2 ), TUniControl( pParent ) ) );
                              end;

                              if Fr = nil then
                              begin
                                 try
                                    if pParent = nil then
                                       Fr := FrC.Create( self )
                                    else
                                       Fr := FrC.Create( pParent.Owner );
                                 except on e:exception do
                                        begin
                                           if Pos( 'Unregistered', e.Message ) > 0 then
                                              mm.varC_LastErrorMsg := mm.MSG_BUGERROR_MENU_DO_NOT_EXIST + ' ' + mm.MSG_ERROR + ': ' + e.Message
                                           else
                                              mm.varC_LastErrorMsg := mm.MSG_ERROR + ': ' + e.Message;
                                        end;
                                 end;
                              end;

                              if lowercase( fClassName ) = 'tfrmcadbasics' then //7.5.0.3 lowercase
                                 Fr.Name  := 'frmCad' + mm.varC_LinkedFormFrame
                              else
                                 Fr.Name  := Fr.Name ;

                              Fr.Align    := alClient;

                              if pParent = nil then
                              begin
                                 Fr.Name   := Fr.Name + '__' + pNewIndex.ToString;
                                 Fr.Parent := Ts;
                                 //7.3.0.0
                                 If Ts <> nil then
                                    Ts.Hint := rc_AddHintAttr( '|name-form:' + Fr.Name, Ts.Hint, true );
                              end
                              else
                              begin
                                 Fr.Name   := Fr.Name;
                                 // 6.0.0.0
                                 TUniControl(pParent).Hint := rc_AddHintAttr( '|name-form:' + Fr.Name, TUniControl(pParent).Hint, true );
                                 Fr.Parent := TUniControl( pParent );
                                 Fr.Width  := Fr.Parent.Width;
                                 Fr.Height := Fr.Parent.Height;
                                 if Pos( 'ModalFrameForm', Fr.Owner.Name ) > 0  then
                                 begin
                                    if Pos( Fr.Owner.Name, mm.varC_FormsInParent ) = 0  then
                                       mm.varC_FormsInParent := mm.varC_FormsInParent + ';' + Fr.Owner.Name + '|' + Fr.Name + ' ';
                                    //7.2.0.0
                                    Fr.Hint := rc_AddHintAttr( '|tag-form:frame-as-modal', Fr.Hint, true );
                                 end
                                 else
                                 if Pos( Fr.Name, mm.varC_FormsInParent ) = 0  then
                                    mm.varC_FormsInParent := mm.varC_FormsInParent + ';' + Fr.Owner.Name + '|' + Fr.Name + ' ';
                              end;
                              Fr.Tag := varIIF( bAddBtn , 1, 0 );
                              // 7.0.0.0
                              if pTagString <> '' then Fr.Hint := rc_AddHintAttr( '|tag-form:' + pTagString, Fr.Hint, true );//false

                              mm.varC_FormSource_Search := fr.Name;

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
                              if pCallFormOp <> aftNone then
                              begin
                                 oObj := TUniControl( Fr.FindComponent('ed_codmaster') );
                                 if oObj <> nil then
                                 begin
                                      //8.0.0.0
                                      //oObj.Hint := intToStr( pRecord );
                                      oObj.Hint := rc_SetHintAttr( intToStr( pRecord ) , '_codmaster:', oObj.Hint, True );
                                      case pCallFormOp of
                                        aftNone  : oObj.Tag  := 0;
                                        aftShow  : oObj.Tag  := -1;
                                        aftEdit  : oObj.Tag  := -2;
                                        aftShowReg : oObj.Tag  := -3;
                                        aftInsert: Fr.Tag := 1;
                                      end;
                                 end;
                              end;
                              if ( bAddBtn ) and ( Fr.FindComponent('ed_Table_ItemSel') <> nil ) then
                              begin
                                   TUniEdit( Fr.FindComponent('ed_Table_ItemSel') ).Hint := 'add;';
                              end;
                           end
                           else
                           if not bModal then
                           begin
                              Frm                 := FrmC.Create( uniSession.uniapplication );
                              Frm.Name            := Frm.Name + '__' + pNewIndex.ToString;
                              Frm.Hint := StringReplace( Frm.Hint, 'modal:', '', [rfReplaceAll]);

                              if pTagString <> '' then Frm.Hint := rc_AddHintAttr( '|tag-form:' + pTagString, Frm.Hint, false ); // 6.0.0.0

                              if pParent = nil then
                                 Frm.Parent := Ts
                              else
                              if pParent.Owner is TUniForm  then
                                 Frm.Parent  := TUniControl( TUniForm( pParent.Owner ).FindComponent( PParent.Name ) )
                              else
                                  Frm.Parent := TUniControl(pParent);
                              Frm.Align      := alClient;
                              mm.varC_FormSource_Search := frm.Name;
                           end
                           else
                           begin
                                //[PT] para usar MODAL centralizado, adicione o atributo [[modal:]] no seu formulário.
                                //      o evento OnCreate é chamado antes de atribuir dinamicamente( usando bModal )
                                //[EN] to use centralized MODAL, add the [[modal:]] attribute to your form.
                                //      the OnCreate event is called before dynamically assigning (using bModal)
                                Frm                 := FrmC.Create( uniSession.uniapplication );
                                Frm.Name            := Frm.Name ;
                                mm.varC_FormSource_Search := frm.Name;

                                if rc_GetHintAttr( 'modal:', Frm.Hint ) = '' then
                                   Frm.Hint := rc_SetHintAttr( '' , 'modal:', Frm.Hint, True );
                                // 6.0.0.0
                                if pTagString <> '' then Frm.Hint := rc_AddHintAttr( '|tag-form:' + pTagString, Frm.Hint, false );

                                Frm.ShowModal( procedure(Sender: TComponent; Result:Integer)
                                               begin

                                                  {<*RC STARTER}
                                                  if mm.CONFIG_LAYOUT_MENU_TYPE = '3' then
                                                  begin
                                                     //clicou no MENU
                                                     oLayoutMainMenu.tag := 0;//7.5.0.0
                                                     rc_UpdateMainControls;
                                                     rc_AdjustFormsSize( oLayoutMainMenu ); //7.5.0.0

                                                     sboxMain.DoAlignControls; // Feedback from Farshad
                                                     //8.2.0.0 performance
                                                     //if mm.oPgGeneral <> nil then
                                                     //   dm_rc.rc_ResizeBlocks( rc_FindControl( dm_rc.rc_GetActiveFormFrameNameInMainTab ) );
                                                     //[PT] existe form/frame adicionado em um objeto ?
                                                     //[EN] is there a form/frame added to an object?
                                                     rc_UpdateFormsInsideContainers;
                                                  end;
                                                  {RC STARTER*>}
                                                  //[PT] para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no que estiver "abaixo" do MODAL
                                                  //[EN] so when a FORM MODAL is active, do not run "dbGridUpdate" on anything "below" the MODAL
                                                  mm.varC_Form_Modal := nil;
                                               end
                                             );
                           end;
                           //[PT] para exibir a ultima aba adicionada
                           //[EN] to display the last added tab
                           if mm.oPgGeneral <> nil then
                              mm.varI_TabIni := ( mm.oPgGeneral.PageCount - 1 ) - varIIF( mm.varB_Mobile_Screen, 1, 6 )
                           else
                              mm.varI_TabIni := -1;

                           if mm.varI_TabIni < 0 then
                              mm.varI_TabIni := 0;
                           // 6.0.0.0
                           if Fr <> nil then
                           begin
                              oLabel := TUniLabel( Fr.FindComponent( 'labTitleForm' ) );
                              if oLabel <> nil then
                                 oLabel.Caption   := dm_rc.rc_StripHtmlTags( mm.varC_SelectedItem_FSideMenu );
                              oLabel := TUniLabel( Fr.FindComponent( 'labCrudIcon' ) );
                              if oLabel <> nil then
                              begin
                                 cTmp1 := rc_GetHintAttr( 'ico:', oLabel.Hint, true, true ) + ' ';
                                 cTmp1 := Copy( cTmp1, 1, Pos( ' ', cTmp1 ) - 1 );
                                 //8.0.0.0
                                 if ( Trim( cTmp1 ) <> '' ) and ( iMenuItemIndex >= 0 ) then
                                    oLabel.Hint := StringReplace( oLabel.Hint, 'ico:' + Trim( cTmp1 ), 'ico:' +  mm.varA_FSideMenu[ iMenuItemIndex ].Icon, [rfReplaceAll] )
                                 else
                                 begin
                                    cTmp1 := rc_GetHintAttr( 'ico-stack:', oLabel.Hint, true, true ) + ' ';
                                    cTmp1 := Copy( cTmp1, 1, Pos( ' ', cTmp1 ) - 1 );
                                    //8.0.0.0
                                    if ( Trim( cTmp1 ) <> '' ) and ( iMenuItemIndex >= 0 ) then
                                       oLabel.Hint := StringReplace( oLabel.Hint, 'ico-stack:' + Trim( cTmp1 ), 'ico-stack:' +  mm.varA_FSideMenu[ iMenuItemIndex ].Icon, [rfReplaceAll] )
                                 end;
                                 dm_rc.rc_RenderControls( fr, oLabel );
                              end;
                           end
                           else
                           if Frm <> nil then
                           begin
                              oLabel := TUniLabel( Frm.FindComponent( 'labTitleForm' ) );
                              if oLabel <> nil then
                                 oLabel.Caption   := dm_rc.rc_StripHtmlTags( mm.varC_SelectedItem_FSideMenu );
                              oLabel := TUniLabel( Frm.FindComponent( 'labCrudTitleDetails' ) ); // CRUD 2
                              if oLabel <> nil then
                                 oLabel.Caption   := dm_rc.rc_StripHtmlTags( mm.varC_SelectedItem_FSideMenu );
                              oLabel := TUniLabel( Frm.FindComponent( 'labCrudIcon' ) );         // CRUD 2
                              if oLabel <> nil then
                              begin
                                 cTmp1 := rc_GetHintAttr( 'ico:', oLabel.Hint, true, true ) + ' ';
                                 cTmp1 := Copy( cTmp1, 1, Pos( ' ', cTmp1 ) - 1 );
                                 //8.0.0.0
                                 if ( Trim( cTmp1 ) <> '' ) and ( iMenuItemIndex >= 0 ) then
                                    oLabel.Hint := StringReplace( oLabel.Hint, 'ico:' + Trim( cTmp1 ), 'ico:' +  mm.varA_FSideMenu[ iMenuItemIndex ].Icon, [rfReplaceAll] )
                                 else
                                 begin
                                    cTmp1 := rc_GetHintAttr( 'ico-stack:', oLabel.Hint, true, true ) + ' ';
                                    cTmp1 := Copy( cTmp1, 1, Pos( ' ', cTmp1 ) - 1 );
                                    //8.0.0.0
                                    if ( Trim( cTmp1 ) <> '' ) and ( iMenuItemIndex >= 0 ) then
                                       oLabel.Hint := StringReplace( oLabel.Hint, 'ico-stack:' + Trim( cTmp1 ), 'ico-stack:' +  mm.varA_FSideMenu[ iMenuItemIndex ].Icon, [rfReplaceAll] )
                                 end;
                                 dm_rc.rc_RenderControls( frm, oLabel );
                              end;
                           end;
                           // 6.0.0.0
                           if ( pMenu <> nil ) and ( pParent = nil ) then
                              nodeMenu.Data := Ts;
                           if pCloseMenu then
                           begin
                              if oLayoutMainMenu <> nil then
                              begin
                                 rc_UpdateMainControls;
                              end;
                           end;
                           mm.varC_LastErrorMsg := '';
                        end;
                      except on e:exception do
                             begin
                                  mm.varC_LastErrorMsg := mm.varC_LastErrorMsg + ' ' + mm.MSG_ERROR + ': ' + e.Message;
                             end;
                      end;
                      rc_HideMenuMask( self ); // 6.0.0.0 menu mask warning on open
                 end;
                 if mm.varC_LastErrorMsg <> '' then
                 begin
                      rc_HideMenuMask( self ); // 6.0.0.0 menu mask warning on open
                      if ( bFormDoNotExists ) then
                         mm.varC_LastErrorMsg := cMSG_MENU_TRIGGER_ERROR2 + FClassName + '</strong><br><br>' + mm.varC_LastErrorMsg; ;

                      dm_rc.rc_ShowError( mm.varC_LastErrorMsg + '<br><br>' + mm.MSG_CONTACT_SUPPORT)
                 end;
              end;
          end
          else
          begin
               if Pos( '<span>', nodeMenuItem ) > 0 then
               begin
                  nodeMenuItem := Copy( nodeMenuItem, Pos( '<span>', nodeMenuItem ) + 6 );
                  nodeMenuItem := Trim( Copy( nodeMenuItem, 1, Pos( '<', nodeMenuItem ) -1 ) );
                  nodeMenuItem := nodeMenuItem;
               end;
               //[PT] verificar se é uma opção que não está vinculada a um form e executá-la...
               //      esta opção foi adicionada no novo parâmetro "link:" mas foi mantida aqui a título de demonstração
               //[EN] check if it is an option that is not linked to a form and execute it...
               //      this option was added in the new "link:" parameter but was kept here for demonstration purposes
               if nodeMenuItem = ansilowercase( mm.MNU_OTHERS_OPEN_TICKET ) then
               begin
                    dm_rc.rc_OpenLink( 'https://app.radticket.com.br' );
               end;
          end;
       except
             rc_HideMenuMask( self ); // 6.0.0.0 menu mask warning on open
       end;
    finally
      // 7.5.0.0 menu mask
      if ( not bHideMaskOff ) then
      begin
         if oLayoutMainMenu <> nil then
         begin
            oLayoutMainMenu.Hint := StringReplace( oLayoutMainMenu.Hint, 'rcmenu:working', '', [rfReplaceAll] );
            rc_RemoveCssClass( oLayoutMainMenu, 'bringtofront-lower');
         end;
      end;
      if UniApplication.FindComponent('MainForm' ) <> nil then
         MainForm.HideMask;
    end;
end;
//8.0.0.0
procedure TMainForm.rc_CloseNotifications( pOffSet : integer  );
begin
    UniSession.AddJS( paNotifications.JSName +
                    '.animate({ duration: ' + inttostr( 400 ) +
                    ', to: { y:' + inttostr( btnNotifications.Top + pOffSet ) + ' } } );');
end;
// 6.0.0.0
procedure TMainForm.rc_ForceLookUpsToClose;
begin
     {<*RC DB}if  dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.btnCloseFormClick( self );{RC DB*>}
     {<*RC DB}if  dm_rc.rc_ObjectExists('frmLookUp_Lite_model_2') then frmLookUp_Lite_model_2.btnCloseFormClick( self );{RC DB*>}
end;

procedure TMainForm.rc_UpdateFloatButton;
begin
    //[PT] voce pode carregar o arq. html ... deixei dentro do fonte mas não é regra ou ainda pôr direto no HTMLFRAME
    //[EN] you can load the file. html... I left it in the source but it's not a rule or even put it directly in the HTMLFRAME
    btnFloatingFAB.Width := 0;
    btnFloatingFAB.HTML.Text :=
    '<div id="btnmain" class="rc-float-button rc-hover-zoom-1-2">' + //8.0.0.0
    '  <button class="main">' +
    '  </button>' +
    '  <ul>' +
    '    <li>' +
    '      <button onclick="ajaxRequest( MainForm.htmlFrame , ''_mainFloatButton'', [''tipo=pedido'' ]);" id="opcao1"><span class="fa fa-plus rc-hover-zoom-1-2"></span>' +//8.0.0.0
    '      </button>' +
    '    </li>' +
    '    <li>' +
    '      <button onclick="ajaxRequest( MainForm.htmlFrame , ''_mainFloatButton'', [''tipo=email'' ]);" id="opcao2"><span class="fa fa-envelope rc-hover-zoom-1-2"></span>' +//8.0.0.0
    '      </button>' +
    '    </li>' +
    '    <li>' +
    '      <button onclick="ajaxRequest( MainForm.htmlFrame , ''_mainFloatButton'', [''tipo=off'' ]);" id="opcao3"><span class="fa fa-power-off rc-hover-zoom-1-2"></span>' +//8.0.0.0
    '      </button>' +
    '    </li>' +
    '  </ul>' +
    '</div>' +

    '<script>' +

    'function toggleFAB(fab){' +
    '	if(document.querySelector(fab).classList.contains(''show'')){' +
    '  	document.querySelector(fab).classList.remove(''show'');' +
    '  }else{' +
    '  	document.querySelector(fab).classList.add(''show'');' +
    '  }' +
    '}' +

    'document.querySelector(''.rc-float-button .main'').addEventListener(''click'', function(){' +
    '	toggleFAB(''.rc-float-button'');' +
    '});' +

    'document.querySelectorAll(''.rc-float-button ul li button'').forEach((item)=>{' +
    '	item.addEventListener(''click'', function(){' +
    '		toggleFAB(''.rc-float-button'');' +
    '	});' +
    '});' +
    '</script>' ;
end;
// 6.0.0.0
//[PT] resolver o conflito com "DELPHI align" e "UNIGUI alignClient"
//[EN] to solve a conflict with "DELPHI align" and "UNIGUI alignClient"
procedure TMainForm.rc_UpdateMainControls;
var
   oObj1, oObj2 : TObject;
begin
    oObj1 := rc_FindControl( 'paLayoutMainMenu' );
    if oObj1 <> nil then
    begin
       TUnicontrol( oObj1 ).Height:= Self.Height;
       oObj2 := rc_FindControl( 'paBackGround' );
       if oObj2 <> nil then
       begin
          (*
           mm.CONFIG_LAYOUT_MENU_TYPE:
             1 botão menu apenas / menu button only
             2 botão menu e os ícones principais( MICRO MENU ) / menu button and main icons (MICRO MENU)
             3 modelo acoplado / coupled model
             4 modelo horizontal ( thinking... ) / horizontal model (thinking...)
          *)
          // 6.0.0.0
          TUnicontrol( oObj2 ).Top       := 0;
          if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
          begin
             TUnicontrol( oObj2 ).Left      := 0;
             TUnicontrol( oObj2 ).Height    := Self.Height;
             TUnicontrol( oObj2 ).Width     := Self.Width;
          end
          else
          if mm.CONFIG_LAYOUT_MENU_TYPE = '2' then
          begin
             TUnicontrol( oObj2 ).Left      := TUnicontrol( oObj1 ).Width; // 6.0.0.0
             TUnicontrol( oObj2 ).Height    := Self.Height;
             TUnicontrol( oObj2 ).Width     := Self.Width - TUnicontrol( oObj1 ).Width; // 6.0.0.0
          end
          else
          if mm.CONFIG_LAYOUT_MENU_TYPE = '3' then
          begin
             TUnicontrol( oObj2 ).Left      := TUnicontrol( oObj1 ).Width;
             TUnicontrol( oObj2 ).Height    := Self.Height;
             TUnicontrol( oObj2 ).Width     := Self.Width - TUnicontrol( oObj1 ).Width;
          end;
       end;
    end
    else
    begin
       oObj1 := rc_FindControl( 'paBackGround' );
       if oObj1 <> nil then
       begin
          TUnicontrol( oObj1 ).Left      := 0;
          TUnicontrol( oObj1 ).Top       := 0;
          TUnicontrol( oObj1 ).Height    := Self.Height;
          TUnicontrol( oObj1 ).Width     := Self.Width;
       end;
    end;
end;
//8.2.0.0
procedure TMainForm.rc_UpdateMenuModel( pRebuild : boolean );
begin
   if mm.varB_Mobile_Screen then
      mm.CONFIG_LAYOUT_MENU_TYPE := '1'
   else
   begin
      mm.CONFIG_LAYOUT_MENU_TYPE := rc_GetHintAttr( 'rcmenumodel:', Self.Hint );
   end;
   if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
   begin
      btnMenu.Hint :=
         '[[' +
         'ico:fas-bars 1x |' +
         'cls:rc-hover-zoom-1-2|' +
         'align:paLayoutMainMenu r:w-26 |' +
         'center:parent y|' +
         'guide-tour:MENU PRINCIPAL<translate>|' +
         'guide-tour-seq:0|' +
         'guide-tour-theme:defined|' +
         'guide-tour-offset-x:0|' +
         'guide-tour-offset-y:0|' +
         'guide-tour-text:Clique para exibir/ocultar o menu<translate>|' +
         'guide-tour-arrow:up|' +
         ']]';
      //[PT] Iniciar menu fechado
      //[EN] Start menu closed
      paLayoutMainMenu.Align := alNone;
      paLayoutMainMenu.Left := -paLayoutMainMenu.Width;
      paLayoutMainMenu.Top  := 0;
      paLayoutMainMenu.tag  := 0;
      //[PT] Iniciar menu aberto
      //[EN] Start menu opened
      //paLayoutMainMenu.Left := 0;
      //paLayoutMainMenu.tag  := -1;
   end
   else
   if mm.CONFIG_LAYOUT_MENU_TYPE = '2' then
   begin
      btnMenu.Hint :=
         '[[' +
         'ico:fas-bars 1x |' +
         'cls:rc-hover-zoom-1-2|' +
         //'align:parent r:4 |' +
         'center:parent y|' +
         'guide-tour:MENU PRINCIPAL<translate>|' +
         'guide-tour-seq:0|' +
         'guide-tour-theme:defined|' +
         'guide-tour-offset-x:0|' +
         'guide-tour-offset-y:0|' +
         'guide-tour-text:Clique para exibir/ocultar o menu<translate>|' +
         'guide-tour-arrow:up|' +
         ']]';

      //[PT] Iniciar menu fechado
      //[EN] Start menu closed
      paLayoutMainMenu.Left  := 0;
      paLayoutMainMenu.Top   := 0;
      if rc_GetHintAttr( 'rcmenumicro:', Self.Hint ) = 'opened' then
      begin
         Self.Hint := rc_AddHintAttr( '|rcmenumicro:closed', Self.Hint, true );
         paLayoutMainMenu.Width := MAIN_MENU_MICRO;
         paLayoutMainMenu.tag   := 0;
         btnSearch.Visible      := false;
      end
      else
      begin
         Self.Hint := rc_AddHintAttr( '|rcmenumicro:opened', Self.Hint, true );
         paLayoutMainMenu.Width := StrToIntDef( mm.CONFIG_LAYOUT_MENU_WIDTH, MAIN_MENU_EXPANDED );//7.5.0.0 menu
         paLayoutMainMenu.tag   := -1;
         btnSearch.Visible      := true;
      end;
      btnMenu.Left           := 4;
      //[PT] Iniciar menu aberto
      //[EN] Start menu opened
      //paLayoutMainMenu.Left := 0;
      //paLayoutMainMenu.tag  := -1;
   end
   else
   if mm.CONFIG_LAYOUT_MENU_TYPE = '3' then
   begin
      btnMenu.Hint :=
         '[[' +
         'ico:fas-bars 1x |' +
         'cls:rc-hover-zoom-1-2|' +
         'center:parent y|' +
         'guide-tour:MENU PRINCIPAL<translate>|' +
         'guide-tour-seq:0|' +
         'guide-tour-theme:defined|' +
         'guide-tour-offset-x:0|' +
         'guide-tour-offset-y:0|' +
         'guide-tour-text:Clique para exibir/ocultar o menu<translate>|' +
         'guide-tour-arrow:up|' +
         ']]';
      //[PT] Iniciar menu fechado
      //[EN] Start menu closed
      paLayoutMainMenu.Left  := 0;//-paLayoutMainMenu.Width;
      paLayoutMainMenu.Top   := 0;
      paLayoutMainMenu.tag   := 0;
      //[PT] Iniciar menu aberto
      //[EN] Start menu opened
      //paLayoutMainMenu.Left := 0;
      //paLayoutMainMenu.tag  := -1;
   end;
   mm.MNU_STATE  := paLayoutMainMenu.tag.ToString;
   if pRebuild then
   begin
       try
          dm_rc.rc_BuildMainMenu( '', UniTreeMainMenu );
       except on e:exception do
              begin
                dm_rc.rc_ShowError( cMSG_MENU_CREATE_ERROR + e.Message );
              end;
       end;
   end;
end;
// 8.0.0.0
//[PT] se houver ícones em sua tela, e você usar o controle de temas, atribua-os abaixo
//[EN] if there are icons on your screen, and you use the theme control, assign them below
procedure TMainForm.rc_UpdateThemeColors;
var
   COLOR_DEFAULT : Integer;
begin
  COLOR_DEFAULT := varIIF( Copy( lowercase(mm.CONFIG_LAYOUT_ACTIVE_THEME), 1, 5 ) = 'light', COLOR_DARK, COLOR_LIGHT );
  labAdm.Font.Color           := COLOR_DEFAULT;
  btnSearch.Font.Color        := COLOR_DEFAULT;
  btnMenu.Font.Color          := COLOR_DEFAULT;
  labCompanyName.Font.Color   := COLOR_DEFAULT;
  labAppName.Font.Color       := COLOR_DEFAULT;
  labAppVersion.Font.Color    := COLOR_DEFAULT;
  labUser.Font.Color          := COLOR_DEFAULT;
  btnNotifications.Font.Color := COLOR_DEFAULT;
  btnCfg.Font.Color           := COLOR_DEFAULT;
  labbtnExit.Font.Color       := COLOR_DEFAULT;
  labFullScr.Font.Color       := COLOR_DEFAULT;
  labFullScrExit.Font.Color   := COLOR_DEFAULT;
end;

initialization

  RegisterAppFormClass(TMainForm);

  //[PT] as bibliotecas abaixo, em sua maioria, são opcionais.
  //     Comente / Descomente as que você deseja usar.
  //[EN] the libraries below, for the most part, are optional.
  //     Comment / Uncomment the ones you want to use.

  //virtual keyboard
  //( optional )
  //[PT] descomente se for usar essas libs
  //[EN] uncomment if you will use this libs
  UniAddJSLibrary( 'js/virtual-keyboard/keyboard.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddCSSLibrary( 'js/virtual-keyboard/keyboard.css', False, [upoFolderFiles, upoPlatformBoth]);

  //flag-icons
  //( optional )
  UniAddCSSLibrary( 'css/flags/flags.css', False, [upoFolderFiles, upoPlatformBoth]);

  // toasty
  UniAddCSSLibrary( 'js/toasty/dist/toasty.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddJSLibrary( 'js/toasty/dist/toasty.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  //8.2.0.0
  // bootstrap
  UniAddJSLibrary( 'js/popper/popper.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
//  UniAddCSSLibrary( 'bootstrap-5.2.2/dist/css/bootstrap.min.css', False, [upoFolderFiles, upoPlatformBoth]);
//  UniAddJSLibrary( 'bootstrap-5.2.2/dist/js/bootstrap.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
//  //UniAddJSLibrary( 'bootstrap-5.2.2/dist/js/bootstrap.bundle.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddCSSLibrary( 'bootstrap-5.3.8/dist/css/bootstrap.min.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddJSLibrary( 'bootstrap-5.3.8/dist/js/bootstrap.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'bootstrap-5.3.8/js/color-modes.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'bootstrap-5.3.8/dist/js/bootstrap.bundle.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  //8.0.0.0 to fix Mask issue on MOBILE
  // Load updated version jQuery LIB
  // If you wish use UNIGUI newer jQuery, uncomment the lines below
  // and uncomment "sm.Options := [soDontLoadJQueryLib];" line on ServerModule
  UniAddJSLibrary( 'js/jquery-3.7.1/jquery-3.7.1.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddCSSLibrary( 'js/jquery-ui-1.13.2/jquery-ui.min.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddJSLibrary( 'js/jquery-ui-1.13.2/jquery-ui.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/jquery-inputmask/jquery.inputmask.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/jquery-inputmask/jquery.mask.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/autoNumeric/autoNumeric-1.9.35.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  //7.4.0.0
  //( optional )
  //[PT] descomente se for usar essas libs
  //[EN] uncomment if you will use this libs
  UniAddJSLibrary( 'js/signature-pad/signature_pad.umd.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  //7.4.0.0
  //jquery rating
  //( optional )
  //[PT] descomente se for usar essas libs
  //[EN] uncomment if you will use this libs
  UniAddJSLibrary( 'js/jquery-rating/dist/jquery.barrating.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddCSSLibrary( 'js/jquery-rating/dist/themes/bars-1to10.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'js/jquery-rating/dist/themes/bars-movie.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'js/jquery-rating/dist/themes/bars-pill.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'js/jquery-rating/dist/themes/bars-square.css', False, [upoFolderFiles, upoPlatformBoth]);

  // iGrowl
  //( optional )
  //[PT] descomente se for usar essas libs
  //[EN] uncomment if you will use this libs
  UniAddCSSLibrary( 'js/iGrowl/css/igrowl.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'js/iGrowl/css/animate.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'js/iGrowl/css/fonts/vicons.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'js/iGrowl/css/fonts/feather.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'js/iGrowl/css/fonts/steadysets.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'js/iGrowl/css/fonts/linecons.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddJSLibrary( 'js/iGrowl/js/igrowl.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  // gauges and graphs
  //( optional )
  //[PT] descomente se for usar essas libs
  //[EN] uncomment if you will use this libs
  UniAddJSLibrary( 'js/tarefas/raphael-2.1.4.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/tarefas/justgage.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  // chart Chart.JS
  //( optional )
  //[PT] descomente se for usar essas libs
  //[EN] uncomment if you will use this libs
  UniAddJSLibrary( 'js/chart-js-3-9-1/dist/chart.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  // chart APEX
  //( optional )
  //[PT] descomente se for usar essas libs
  //[EN] uncomment if you will use this libs
  UniAddCSSLibrary( 'js/chart-apex/dist/apexcharts.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddJSLibrary( 'js/chart-apex/dist/apexcharts.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/chart-apex/samples/assets/stock-prices.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  // google chart( loader )
  //( optional )
  //[PT] descomente se for usar essas libs
  //[EN] uncomment if you will use this libs
  UniAddJSLibrary( 'js/google-chart/loader.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  //GSAP
  UniAddJSLibrary( 'js/gsap/gsap.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/CSSRulePlugin.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/CSSRulePlugin.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/Draggable.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/EaselPlugin.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/EasePack.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/MotionPathPlugin.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/PixiPlugin.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/ScrollToPlugin.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/ScrollTrigger.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/TextPlugin.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  // callout
  UniAddJSLibrary( 'js/callout/callout.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddCSSLibrary( 'css/callout/theme/cartoon.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/default.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/fancy-info.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/gray.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/yellow.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/danger.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/warning.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/info.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/success.css', False, [upoFolderFiles, upoPlatformBoth]);

  //qrcode reader
  //( optional )
  //[PT] descomente se for usar essas libs
  //[EN] uncomment if you will use this libs
  UniAddJSLibrary( 'js/rc_webcam/beep.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/rc_webcam/jsQR.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  //lottie player
  //( optional )
  //[PT] descomente se for usar essas libs
  //[EN] uncomment if you will use this libs
  UniAddJSLibrary( 'js/lottie/lottie-player.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  //owl carousel
  //( optional )
  //[PT] descomente se for usar essas libs
  //[EN] uncomment if you will use this libs
  UniAddJSLibrary( 'js/owl/dist/owl.carousel.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddCSSLibrary( 'js/owl/dist/assets/owl.carousel.min.css', False, [upoFolderFiles, upoPlatformBoth]);

  //7.2.0.0 //barcode reader
  //( optional )
  //[PT] descomente se for usar essas libs
  //[EN] uncomment if you will use this libs
  UniAddJSLibrary( 'js/barcode/rc-barcode.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  //7.2.0.0 //printThis
  //( optional )
  //[PT] descomente se for usar essas libs
  //[EN] uncomment if you will use this libs
  UniAddJSLibrary( 'js/printThis/printThis.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  //datatable //7.4.0.0 newgrid
  //( optional )
  // descomente se for usar essas libs | uncomment if you will use this libs
  UniAddJSLibrary( 'js/datatables/datatables.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddCSSLibrary( 'js/datatables/datatables.min.css', False, [upoFolderFiles, upoPlatformBoth]);
  //UniAddCSSLibrary( 'js/datatables/dataTables.bootstrap5.css', False, [upoFolderFiles, upoPlatformBoth]);

  //tabulator //7.4.0.0 newgrid
  //( optional )
  // descomente se for usar essas libs | uncomment if you will use this libs
  UniAddJSLibrary( 'js/tabulator/dist/js/tabulator.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddCSSLibrary( 'js/tabulator/dist/css/tabulator.min.css', False, [upoFolderFiles, upoPlatformBoth]);

  //responsive voice //7.5.0.0
  //( optional )
  // descomente se for usar essas libs | uncomment if you will use this libs
  UniAddJSLibrary( 'js/responsive-voice/voice.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
end.
