unit mkm_layout_aux_mainmenu; //8.0.0.0

interface

uses
    System.SysUtils,
    System.Classes,
    Vcl.Graphics,
    uniGUIClasses,
    uniGUIApplication,
    uniHTMLFrame,
    uniTreeMenu,
    uniPageControl
    ;

    procedure rc_MainMenuOnCreateConfig( var cMSG_MOBILE_KB_ANYPLACE: string; var cMSG_MENU_TRIGGER_ERROR: string; var cMSG_MENU_TRIGGER_ERROR2: string; var cMSG_MENU_CREATE_ERROR: string );
    procedure rc_MainMenuTranslateMessages( var cMSG_MOBILE_KB_ANYPLACE: string; var cMSG_MENU_TRIGGER_ERROR: string; var cMSG_MENU_TRIGGER_ERROR2: string; var cMSG_MENU_CREATE_ERROR: string );
    procedure rc_MainMenuRender( var cMSG_MENU_CREATE_ERROR: string );
    procedure rc_MainMenuScripts;

implementation

uses mkm_layout, Main, uconsts_cfg, uconsts_emojis, mkm_func_web, mkm_translate,
  MainModule, uconsts, untDM_RC, str_func;

procedure rc_MainMenuTranslateMessages( var cMSG_MOBILE_KB_ANYPLACE: string; var cMSG_MENU_TRIGGER_ERROR: string; var cMSG_MENU_TRIGGER_ERROR2: string; var cMSG_MENU_CREATE_ERROR: string );
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

procedure rc_MainMenuOnCreateConfig( var cMSG_MOBILE_KB_ANYPLACE: string; var cMSG_MENU_TRIGGER_ERROR: string; var cMSG_MENU_TRIGGER_ERROR2: string; var cMSG_MENU_CREATE_ERROR: string );
var
   i : integer;
   s1 : string;
begin
   try
     //8.0.0.0
     paSearchEdit.Hint := '[[cls:clsRoundPanel]]';
     SearchEdit.Width := MAIN_MENU_ITEM_MAXWIDTH;
     labEmoji.Caption := EMOJI_GRINNING_FACE;

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
     rc_MainMenuTranslateMessages( cMSG_MOBILE_KB_ANYPLACE, cMSG_MENU_TRIGGER_ERROR, cMSG_MENU_TRIGGER_ERROR2, cMSG_MENU_CREATE_ERROR );

     //menu mask
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
     if mm.varI_ScreenWidth = 0 then mm.varI_ScreenWidth := Width;
     if mm.varI_ScreenHeight = 0 then mm.varI_ScreenHeight := Height;
     dm_rc.rc_GetDeviceType;

     // theme "light"
     rc_UpdateThemeColors;

     paLayoutMainMenu.Width := StrToIntDef( mm.CONFIG_LAYOUT_MENU_WIDTH, MAIN_MENU_EXPANDED );//7.5.0.0 menu
     Hint := rc_AddHintAttr( '|rcmenuwidth:' + paLayoutMainMenu.Width.ToString, Hint, true );
     Hint := rc_AddHintAttr( '|rcmenumodel:' + mm.CONFIG_LAYOUT_MENU_TYPE, Hint , true );

     rc_UpdateMenuModel;

     labAppName.Caption     := APP_NAME;
     labAppVersion.Caption  := 'v.' + APP_NAME_VERSION + ' [ ' + mm.CONFIG_APP_TYPE + ' ]';

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

     //mainform js scripts
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
       paLayoutBgUser.Background.Url := ''; //6.0.0.1
       paLayoutBgUser.Margins.Top := 20;
     end;

     if mm.RTL then
        bsTabs_Main.JSInterface.JSCall('addCls', ['align-label-right-center'])
     else
        bsTabs_Main.JSInterface.JSCall('addCls', ['align-label-left-center']);

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

     rc_Translate( MainForm, nil , '' , mm.CONFIG_LANGUAGE );
     rc_ConfigTranslateMessages;

     rc_MainMenuRender( cMSG_MENU_CREATE_ERROR ); //8.0.0.0
     dm_rc.rc_ShowToaster( 'info', mm.MSG_WELCOME + mm.vUserName + ' !', false, 'pinItUp' );

     if ( Pos( 'theme-color:off', Hint ) = 0 ) then
        Color := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

     rc_UpdateFloatButton;

     dm_rc.rc_ShowTour( MainForm, True );

   except on e:exception do
      raise Exception.Create('Error On renderControl_HtmlFrame.' + sLineBreak + e.Message);
   end;
end;

procedure rc_MainMenuScripts;
begin
     Script.Text :=
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
         '    ajaxRequest( htmlFrame, "_rcDetectPlatform" ,' +
         '      ["device=" + res ]);' +
         '}' ;

        ClientEvents.ExtEvents.Values['form.resize'] :=
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

procedure rc_MainMenuRender( var cMSG_MENU_CREATE_ERROR: string );
begin
     //[PT] ajuste esse valor de acordo com o no. de forms do projeto que serão exibidos no menu dinâmico
     //[EN] adjust this value according to no. of project forms that will be displayed in the dynamic menu
     SetLength( mm.varA_FSideMenu , 200 );
     mm.varA_FSideMenu[ 0 ].option       := '';
     mm.varA_FSideMenu[ 0 ].table        := '';
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
end.
