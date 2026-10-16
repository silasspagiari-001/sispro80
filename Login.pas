unit Login;
//8.0.0.0
// paLoginForm e seus componentes receberam vários ajustes | paLoginForm and its components have received several adjustments

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniLabel, uniEdit, uniCheckBox,
  Vcl.Imaging.pngimage, uniImage, uniGUIBaseClasses,
  uniGUIApplication, System.Types, System.StrUtils, inifiles, System.DateUtils,
  mkm_translate, mkm_layout, mkm_anim, uconsts, uconsts_cfg,
  uniButton, uniBitBtn, uniPanel, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox,
  Data.DB, uniScrollBox, uniHTMLFrame, uniPageControl,
  System.UIConsts, //feedback: Mesut from Turkey to Linux( 6.0.0.0 )
  uniProgressBar, uniBasicGrid, uniDBGrid, uniMemo, uniDBMemo, uniSweetAlert;

type

  //TCallbackProcedure = procedure(LoginSuccessful: Boolean) of object;

  TfrmLogin = class(TUniLoginForm)
    rcSweetAlert: TUniSweetAlert;
    paBG_LoginForm: TUniContainerPanel;
    paLogo: TUniContainerPanel;
    htmlFrame: TUniHTMLFrame;
    paImgBG_LoginForm: TUniContainerPanel;
    imgLoginThemed: TUniImage;
    paWelcomeBox: TUniContainerPanel;
    htmlLabel: TUniHTMLFrame;
    labAppName: TUniLabel;
    paWelcomeLabel: TUniContainerPanel;
    labWelcome: TUniLabel;
    paImgBG: TUniContainerPanel;
    paLoginForm: TUniContainerPanel;
    paBackground: TUniContainerPanel;
    paBackgroundLogin: TUniContainerPanel;
    pgLogin: TUniPageControl;
    tabLogin: TUniTabSheet;
    edUserName: TUniEdit;
    edPassword: TUniEdit;
    btnLog_In: TUniBitBtn;
    labRegister: TUniLabel;
    labReset: TUniLabel;
    paSelectLanguage: TUniContainerPanel;
    cbLanguage: TUniComboBox;
    paFlag: TUniContainerPanel;
    labFlag: TUniLabel;
    labLogin: TUniLabel;
    imgLogo: TUniImage;
    paAppVersion: TUniContainerPanel;
    labCopyright: TUniLabel;
    labAppVersion: TUniLabel;
    UniEdit1: TUniEdit;
    UniEdit2: TUniEdit;
    tabCompanies: TUniTabSheet;
    paBtns: TUniContainerPanel;
    btnEnter: TUniBitBtn;
    btnLogin: TUniBitBtn;
    tabRegister: TUniTabSheet;
    paNewRegister: TUniPanel;
    edUserNameReg: TUniEdit;
    edPasswordReg: TUniEdit;
    edNameReg: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    paBtnsNewRegister: TUniContainerPanel;
    btnRegisterUser: TUniBitBtn;
    btnBack: TUniBitBtn;
    btnConfirmEmail: TUniBitBtn;
    paKeyBoard: TUniContainerPanel;
    btnRecPassword1: TUniBitBtn;
    btnRecPassword2: TUniBitBtn;
    btnRecPassword3: TUniBitBtn;
    btnRecPassword5: TUniBitBtn;
    btnRecPassword4: TUniBitBtn;
    btnRecPassword6: TUniBitBtn;
    btnRecPassword7: TUniBitBtn;
    btnRecPassword8: TUniBitBtn;
    btnRecPassword9: TUniBitBtn;
    btnRecPassword0: TUniBitBtn;
    cbRemember: TUniCheckBox;
    rcBlock10: TUniContainerPanel;
    paTitleSelectCompanyTitle: TUniContainerPanel;
    btnSearch: TUniLabel;
    labSelectCompanyTitle: TUniLabel;
    dbgCompanies: TUniDBGrid;
    edSearchCompany: TUniEdit;
    btnSearchCompany: TUniBitBtn;
    procedure btnLog_InClick(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure UniLoginFormScreenResize(Sender: TObject; AWidth,
      AHeight: Integer);
    procedure UniLoginFormCreate(Sender: TObject);
    procedure btnRegisterUserClick(Sender: TObject);
    procedure btnRecPassword1Click(Sender: TObject);
    procedure btnConfirmEmailClick(Sender: TObject);
    procedure labResetClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure dbgCompaniesDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure labRegisterClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure dbgCompaniesDblClick(Sender: TObject);
    procedure dbgCompaniesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UniLoginFormReady(Sender: TObject);
    procedure htmlFrameAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure cbLanguageChange(Sender: TObject);
    procedure imgLogoClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSearchCompanyClick(Sender: TObject);
    procedure edPasswordRegChange(Sender: TObject);
  private
      varI_LoginModel , vEmailCode : integer;
      varB_OutSideLoginForm : boolean;
      procedure rc_SortNumbers;
      procedure rc_SendEmailCode( Sender : TObject; pType, pEmail, pUser, pPassword : string );
      procedure rc_SendProvisionalPassword( pNewRegister : Boolean );
  public
      //8.0.0.0
      const
        LOGIN_PANEL_WIDTH = 346;
        LOGIN_PANEL_HEIGHT = 355;

  end;

function frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, ServerModule,
  mkm_func_web, untdm_rc, uVersion, Main, str_func, mkm_email, mkm_login, mkm_validate,
  mkm_restfuncs;//8.4.0.1

function frmLogin: TfrmLogin;
begin
  Result := TfrmLogin(mm.GetFormInstance(TfrmLogin));
end;
//6.1.0.1
procedure TfrmLogin.btnLog_InClick(Sender: TObject);
var
   f : integer;
begin
  btnLog_In.ModalResult := mrNone;
  if not rc_IsValidEmail( edUserName.Text ) then
  begin
       dm_rc.rc_ShowSweetAlertWarning( 'Email inválido!' );
       edUserName.SetFocus;
       exit;
  end;
  if not rc_AntiSqlInjection( edPassword.Text ) then
  begin
       dm_rc.rc_ShowSweetAlertWarning( 'Senha Inválida( não use os caracteres "' + ANTI_SQLINJECTION + '"!' );
       edPassword.SetFocus;
       exit;
  end;
  varB_OutSideLoginForm := true;

  mm.varB_LoginProcessed := false;
  dm_rc.rc_ProcessLogin( edUserName.Text, edPassword.Text, false );

  if mm.varB_LoginProcessed then
  begin
      //[PT] se tiver acima de uma empresa cadastrada, exibe a seleção de empresas
      //[EN] if you have above a registered company, displays the selection of companies
      if dm_rc.sqlCompanies.RecordCount > 1 then
      begin
         rc_AddCssClass   ( tabCompanies , 'rc-fade-in' );
         pgLogin.ActivePage := tabCompanies;
         dm_rc.rc_SetFocus( btnEnter );
      end
      else
          btnEnterClick( self );
  end;
end;
//6.1.0.1
procedure TfrmLogin.btnRegisterUserClick(Sender: TObject);
begin
     btnRegisterUser.ModalResult := mrNone;
     if not rc_IsValidEmail( edUserNameReg.Text ) then
     begin
          dm_rc.rc_ShowSweetAlertWarning( 'Email inválido!' );
          edUserNameReg.SetFocus;
          exit;
     end;
     if not rc_AntiSqlInjection( edPasswordReg.Text ) then
     begin
          dm_rc.rc_ShowSweetAlertWarning( 'Senha Inválida( não use os caracteres "' + ANTI_SQLINJECTION + '"!' );
          edPasswordReg.SetFocus;
          exit;
     end;
     if not rc_FormValidate( Self ) then
     begin
        edUserNameReg.SetFocus;
     end
     else
     begin
        //[PT] Verificar se o email informado já foi cadastrado.
        //[EN] Check if the email provided has already been registered.
        mm.varB_OperationProcessed := dm_rc.rc_ProcessFirstConnection;
        if mm.varB_OperationProcessed then
        begin
           dm_rc.memUsers.Close;
           dm_rc.memUsers.filtered := false;
           dm_rc.memUsers.Data := dm_rc.rc_GetRecord( mm.varB_IsNot_API ,
                                                      false,
                                                      ' select codigo,codiemp,nome,email,senha,master,codifunc,avatar ' +
                                                      ' from ' + dm_rc.rc_DBSchema + 'usuarios ' + //6.1.0.0
                                                      ' where email = ' + QuotedStr( edUserNameReg.Text ) +
                                                      ' and codiemp = 1' + IntToStr( mm.varI_Code_Company ) + //[PT] verificar a partir da empresa MATRIZ
                                                                           //[EN] check from the HOME company
                                                      ' order by codigo' );
           if mm.varC_LastErrorMsg <> '' then
           begin
               dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
               mm.varB_OperationProcessed := false;
               Exit;
           end;
           if not dm_rc.memUsers.IsEmpty then
           begin
               dm_rc.rc_ShowError( mm.MSG_EMAIL_ALREADY_EXISTS ); // 6.0.0.0
               mm.varB_OperationProcessed := false;
               Exit;
           end;
        end;
        if mm.varB_OperationProcessed then
        begin
           rc_SendEmailCode( TUniBitBtn( sender ) , mm.MSG_REGISTER_NEW , edUserNameReg.Text, edNameReg.Text, edPasswordReg.Text);

           if mm.varB_OperationProcessed then
           begin
              paKeyBoard.Visible := True;
              paKeyBoard.Enabled := True;
              btnRegisterUser.Enabled := False;

              edNameReg.SetFocus;
           end
           else
               btnRegisterUser.Enabled := true;
        end
        else
            edUserNameReg.SetFocus;
     end;
end;

procedure TfrmLogin.btnConfirmEmailClick(Sender: TObject);
begin
     mm.varB_OperationProcessed := dm_rc.rc_ProcessFirstConnection;

     rc_SendEmailCode( TUniBitBtn( sender ) , mm.MSG_PASSWORD_RESET , edUserNameReg.Text, '', '' );
     paKeyBoard.Visible := True;
end;

procedure TfrmLogin.btnRecPassword1Click(Sender: TObject);
var
 oLabel : TUniLabel;
 i,iOffSet : integer;
begin
     oLabel  := TUniLabel( FindComponent( 'rc__lab' + vEmailCode.ToString ) );
     if oLabel = nil then
     begin
        oLabel              := TUniLabel.Create( frmLogin );
        oLabel.Parent       := paNewRegister;
        oLabel.Font.Color   := clBlack;
        oLabel.Font.Size    := 22;
        oLabel.Font.Style   := [fsBold];
     end
     else
         oLabel.Visible     := true;
     oLabel.Caption      := ReturnNumbers( TUniBitBtn( sender ).Caption );
     oLabel.TextConversion:= txtHTML;
     oLabel.Left         := vEmailCode;
     oLabel.Name         := 'rc__lab' + oLabel.Left.ToString;
     oLabel.Top          := paKeyBoard.Top + 5 ;

     rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 40 ) , '350' );

     vEmailCode          := oLabel.Left + ( btnRecPassword1.Width div 2 );

     mm.varC_TempString  := mm.varC_TempString + ReturnNumbers( TUniBitBtn( sender ).Caption );
     mm.varB_OperationProcessed := False;

     btnRecPassword1.ScreenMask.Enabled := ( Length( mm.varC_TempString ) = 5 );

     if ( btnRecPassword1.ScreenMask.Enabled ) and ( btnRecPassword1.tag <= 3 ) then
     begin
          btnRecPassword1.tag := btnRecPassword1.tag + 1;

          mm.varB_OperationProcessed    := ( mm.varC_TempString = mm.varC_Temp1 + mm.varC_Temp2 + mm.varC_Temp3 + mm.varC_Temp4 + mm.varC_Temp5 );

          btnConfirmEmail.Enabled := True;

          if not mm.varB_OperationProcessed then
          begin
               //[PT] resetando senha ou novo cadastro ?
               //[EN] resetting password or new registration?
               if btnConfirmEmail.tag = 1 then
                    btnConfirmEmail.Click
               else
               if btnRegisterUser.tag = 1 then
                   btnRegisterUser.Click;
          end
          else
          begin
               ShowMask('');
               UniSession.Synchronize();
               //[PT] resetando senha ou novo cadastro ?
               //[EN] resetting password or new registration?
               if btnConfirmEmail.tag = 1 then
                   rc_SendProvisionalPassword( False )
               else
               if btnRegisterUser.tag = 1 then
                   rc_SendProvisionalPassword( True );

               vEmailCode := btnRecPassword2.Left + 12;
               for I := 1 to 5 do
               begin
                  oLabel  := TUniLabel( FindComponent( 'rc__lab' + vEmailCode.ToString ) );
                  if oLabel <> nil then
                  begin
                       vEmailCode := oLabel.Left + ( btnRecPassword1.Width div 2 );
                       oLabel.Visible := false;
                       rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top + 40 ) , '5' );
                  end;
               end;
               vEmailCode := btnRecPassword2.Left + 12;

               HideMask;

               if mm.varB_OperationProcessed then
                  if btnConfirmEmail.tag = 1 then
                     dm_rc.rc_ShowSweetAlert( 'Email', mm.MSG_PASSWORD_TEMP_SENT, 'success' )
                  else
                     dm_rc.rc_ShowSweetAlert( 'Email', mm.MSG_NEW_USER_REGISTERED, 'success' ) ;
          end;
     end;
     TUniBitBtn( sender ).ModalResult := mrNone;
end;
// 6.0.0.0
procedure TfrmLogin.rc_SortNumbers;
var
   I, num : integer;
   cNumbers : string;
begin
    cNumbers := '';
    for I := 0 to Self.ComponentCount - 1 do
    begin
      if Self.Components[I] is TUniBitBtn then
      begin
           if lowercase( ReturnLetters( TUniBitBtn( Self.Components[I] ).Name ) ) = 'btnrecpassword' then
           begin
                repeat
                      num := Random( 10 );
                until Pos ( num.ToString , cNumbers ) = 0;

                TUniBitBtn( Self.Components[I] ).Caption := num.ToString;
                TUniBitBtn( Self.Components[I] ).Enabled := ( btnConfirmEmail.Tag = 1) or ( btnRegisterUser.Tag = 1) ;

                cNumbers := cNumbers + num.ToString;
           end;
      end;
    end;
end;
// 6.0.0.0
procedure TfrmLogin.btnEnterClick(Sender: TObject);
begin
     varB_OutSideLoginForm := false;
     //[PT] caso ocorra alguma exceção, evita a SAIDA da aplicação
     //[EN] if any exception occurs, prevents the application from exiting
      //7.1.0.0
     if ( dbgCompanies.DataSource.DataSet.FieldByName( 'FANTASIA' ).AsString = '' ) and ( dm_rc.sqlCompanies.RecordCount > 1 ) then
     begin
          dm_rc.rc_ShowMessage( mm.MSG_COMPANY_SELECT , 'warning' );
          btnEnter.ModalResult := mrNone;
          Exit;
     end
     else
      //7.1.0.0
     begin
          //Selecionar Empresa | Select Company
          mm.varI_Code_Company     := dm_rc.sqlCompanies.FieldByName('codigo').AsInteger;
          mm.varC_CompanyName      := dm_rc.sqlCompanies.FieldByName('fantasia').AsString;
          mm.varI_Code_CompanyMain := dm_rc.sqlCompanies.FieldByName('Codigo').AsInteger; // mm.varI_Code_Company;
          //[PT] verificar o acesso se o usuario for de outra empresa
          //[EN] check access if the user is from another company

          if ( ( dm_rc.memUsers.FieldByName( 'codiemp' ).AsInteger <> mm.varI_Code_Company ) and
             ( dm_rc.memUsers.FieldByName('master').AsString <> mm.VALUE_YES ) and // mm.VALUE_YES ) and //6.0.0.0
             ( dm_rc.rc_GetTotRecords( mm.varB_IsNot_API,
                                       'usuarios_empresa',
                                       'codiemp = ' + dm_rc.rc_IntToString( dm_rc.sqlCompanies.FieldByName('codigo').AsInteger ) +
                                       ' and codiuser = ' + dm_rc.rc_IntToString( dm_rc.memUsers.FieldByName('codigo').AsInteger ) ) = 0 ) ) then
          begin
               dm_rc.rc_ShowSweetAlert( mm.MSG_WARNING, mm.MSG_COMPANY_USER_OTHER, 'warning'  );
               ModalResult := mrNone;
               btnEnter.ModalResult := mrNone;
               Exit;
          end
          else
          
          begin
             //[PT] Aqui capturamos o DOCUMENTO DA EMPRESA, selecionada no LOGIN para controle de licença.
             //     No Brasil usamos o CNPJ, você poderá ajustar de acordo com seu controle ou até mesmo
             //     remover e fazer seu próprio controle de licença.
             //
             //[EN] Here we capture the COMPANY DOCUMENT selected in the LOGIN for license control.
             //     In Brazil we use the CNPJ, you can adjust according to your control or even remove
             //     and make your own license control.
             mm.varC_Doc_Customer := dm_rc.sqlCompanies.FieldByName('cnpj').AsString;
             // 6.0.0.0
             if ( mm.varC_Doc_Customer = '' ) or ( mm.CONFIG_APP_DATA_FOLDER = 'ON' ) then mm.varC_Doc_Customer := 'app_data';
             //[PT] as variáveis abaixo serão criticadas no ACESSO as telas/forms, ao CADASTRAR, ALTERAR, EXCLUIR etc. Ex: Controle de Licenciamento.
             //[EN] the variables below will be criticized in ACCESS the screens / forms, when REGISTERING, CHANGING, DELETING etc. Ex: Licensing Control.             mm.varC_Blocked         := mm.VALUE_NO;
             mm.varC_Locked          := mm.VALUE_NO;
             mm.varI_Device_Licences := 3;
             // 6.0.0.0
             if mm.varC_Locked = mm.VALUE_YES then
             begin
                  dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' );
             end
             else
             begin
                //[PT] aqui são criadas pastas que serão usadas na aplicação.
                //[EN] algumas pastas são específicas para documentos usados no Brasil
                rc_GetDefaultPaths( true, mm.varC_Doc_Customer );
                //[PT] atualizar o codigo de funcionário vinculado no cadastro de usuario pela empresa que logou. SE NAO FOR O MASTER
                //[EN] update the employee code linked in the user registration by the company that logged in. IF IT IS NOT THE MASTER
                if dm_rc.memUsers.FieldByName('master').AsString <> '1' then //mm.VALUE_YES then //6.0.0.0
                begin
                    dm_rc.memTemp.Close;
                    dm_rc.memTemp.filtered := false;
                    dm_rc.memTemp.Data := dm_rc.rc_GetRecord( mm.varB_IsNot_API ,
                                                               True,
                                                               ' select codigo,codiemp,nome,email,senha,master,codifunc,avatar ' +
                                                               ' from ' + dm_rc.rc_DBSchema + 'usuarios ' + //6.1.0.0
                                                               ' where email = ' + QuotedStr( edUserName.Text ) +
                                                               ' and codiemp = ' + IntToStr( mm.varI_Code_Company ) +
                                                               ' order by codigo' );
                    if mm.varC_LastErrorMsg <> '' then
                    begin
                        dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
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
                      dm_rc.memUsersPermissions.Data := dm_rc.rc_GetRecord(
                                                           mm.varB_IsNot_API ,
                                                           False,
                                                           ' select * ' +
                                                           ' from ' + dm_rc.rc_DBSchema + 'usuarios_restricoes ' + //6.1.0.0
                                                           ' where codiuser = ' + dm_rc.memUsers.FieldByName('codigo').AsString );
                      if mm.varC_LastErrorMsg <> '' then
                      begin
                          dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
                          Exit;
                      end;
                      //[PT] variáveis que podem ser usadas para associação de dados de usuário
                      //[EN] variables that can be used to associate user data
                      mm.vUserEmail          := edUserName.Text;
                      mm.vUserName           := dm_rc.memUsers.FieldByName('nome').AsString;
                      mm.vUserLoginTimeStamp := Now;
                      mm.varC_User_Avatar    := dm_rc.memUsers.FieldByName('avatar').AsString;
                      mm.varI_User           := dm_rc.memUsers.FieldByName('Codigo').AsInteger;
                      mm.varC_NameSalesMan   := mm.vUserName;
                      mm.varI_CodeSalesMan   := dm_rc.memUsers.FieldByName('Codifunc').AsInteger;
                      UniSession.UserString  := mm.vUserEmail; // to HyperServer( if use ) user identifyend;
                    end;
                end;
                tag := 1;
                dm_rc.rc_ProcessCompanySearch( '' );
                btnEnter.ModalResult := mrOk;
                ModalResult := mrOK;
                close;
             end;
          end;
     end;
end;
//8.0.0.0
procedure TfrmLogin.btnSearchClick(Sender: TObject);
begin
     if btnSearch.Tag = 0 then
     begin
        rc_jQueryAnimate( dbgCompanies , 'top'  , '80' , '350' );
        btnSearch.Tag := 1;
     end
     else
     begin
        rc_jQueryAnimate( dbgCompanies , 'top'  , '41' , '350' );
        btnSearch.Tag := 0;
     end;
end;

procedure TfrmLogin.cbLanguageChange(Sender: TObject);
var
  i : integer;
  IniFile : TIniFile;
begin
     iniFile := nil;
     cbLanguage.Text := dm_rc.rc_StripHtmlTags( cbLanguage.Text );

     i := dm_rc.rc_GetIndexFromArray( cbLanguage.Text, ARRAY_LANGUAGES ) ;
     mm.CONFIG_LANGUAGE := ARRAY_LANGUAGES[ i ];
     UniApplication.Cookies.SetCookie('_language' + APP_NAME + edUserNameReg.Text, mm.CONFIG_LANGUAGE, 0);
     UniApplication.Cookies.SetCookie('_language_login' + APP_NAME, edUserNameReg.Text, 0);

     if i > 0 then
        if ( mm.CONFIG_LANGUAGE <> 'ar' ) then
           sm.ExtLocale  := mm.CONFIG_LANGUAGE;

     try
       IniFile := TiniFile.Create( sm.FilesFolderPath + StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] ) + '_cfg.ini' );
       IniFile.WriteString( 'App', 'language'    , mm.CONFIG_LANGUAGE);
     finally
       IniFile.Free;
     end;
     UniApplication.Restart;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
     rc_RemoveCssClass( tabRegister , 'rc-fade-in' );
     rc_RemoveCssClass( tabLogin    , 'rc-fade-in' );
     pgLogin.ActivePage := tabLogin;
     rc_AddCssClass   ( tabLogin    , 'rc-fade-in' );
end;

procedure TfrmLogin.btnBackClick(Sender: TObject);
begin
     paKeyBoard.Visible := False; //8.0.0.0
     rc_RemoveCssClass( tabRegister , 'rc-fade-in' );
     rc_RemoveCssClass( tabLogin    , 'rc-fade-in' );
     pgLogin.ActivePage := tabLogin;
     rc_AddCssClass   ( tabLogin    , 'rc-fade-in' );

     rc_ClearValidation( self );
     btnRegisterUser.Enabled     := True;
     btnConfirmEmail.Enabled := true;
end;

procedure TfrmLogin.dbgCompaniesDblClick(Sender: TObject);
begin
     btnEnterClick( self );
end;

procedure TfrmLogin.dbgCompaniesDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
   dm_rc.rc_GridDrawCell( dbgCompanies , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmLogin.dbgCompaniesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if key = 13 then
     begin
        Key := 0;
        btnEnterClick( self );
     end;
end;
procedure TfrmLogin.edPasswordRegChange(Sender: TObject);
begin

end;

// 6.0.0.0
procedure TfrmLogin.htmlFrameAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
   pObj : TUniControl;
   oHfRequired : TUniHTMLFrame;
   oLabel : TUniLabel;
   oSBox : TUniScrollBox;
   oScrollBlock : TObject;
   FClassNamec, cTemp, cTemp2, cTemp3 : string;
   x : integer;
   pFrame, pFrame2 : TObject;
   bRTL : boolean; //8.0.0.0
begin
      if (EventName = '_rcDetectPlatform' ) then
      begin
           mm.varC_Platform      := Params.Values['device']; // 6.0.0.0
      end
      else
      if (EventName = '_onFocus') then
      begin
          pFrame := Self;
          begin
             pObj := rc_FindControl( Params.Values[ 'pobj' ], pFrame );
             if pObj <> nil then
             begin
                 //8.0.0.0
                 bRTL := ( mm.RTL ) and ( Pos( 'ltr:', pObj.Hint ) = 0 );
                 If ( Pos( 'inputico:', pObj.Hint ) > 0 ) then
                 begin
                    if Pos( 'cls:border-bottom-edit', pObj.Hint ) = 0 then
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
             end;
          end;
          if pObj <> nil then
          begin
             //6.1.0.5
             if ( pos( 'selectall:', pObj.hint ) > 0 ) then
             begin
                  if ( Pos( pObj.ClassName , 'TUniEdit TUniDBEdit' ) > 0 ) and ( TUniEdit( pObj ).CanFocus ) then
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
                oLabel := TUniLabel( TComponent(pFrame).FindComponent('rc__FormLabel' + pObj.Name) );
                if ( oLabel <> nil ) then
                begin
                     if ( pos( 'float-label:top-in', pObj.hint ) > 0 ) then
                        if ( pObj is TUniMemo ) or ( pObj is TUniDBMemo ) then
                           rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 18 ) , '350' )
                        else
                           rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - ( ( pObj.Height div 2 ) + 3 ) ) , '350' )
                     else
                     if ( pos( 'float-label:top', pObj.hint ) > 0 ) then
                        if ( pObj is TUniMemo ) or ( pObj is TUniDBMemo ) then
                           rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 26 ) , '350' )
                        else
                           rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - ( pObj.Height - 4 ) ) , '350' );
                end;
             end;
          end;
          if ( mm.CONFIG_LAYOUT_KEYBOARD_SCROLL_ON_MOBILE = 'ON' ) then
          begin
             if ( mm.varB_Mobile_Screen ) and ( not mm.varB_iOS ) and ( ( mm.varB_Android ) or ( mm.varB_Tablet ) ) and ( ( pFrame <> nil ) ) then //or ( lowercase( fClassName ) = 'mainform' ) ) then
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
                          oSBox.Height := oSBox.Parent.Height - x;
                          oSBox.Width  := oSBox.Parent.Width;
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
      end
      else
      if (EventName = '_onBlur') then
      begin
          pFrame := Self;
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
          begin
             pObj := rc_FindControl( Params.Values[ 'pobj' ], pFrame );
             if pObj <> nil then
             begin
                 //8.0.0.0
                 bRTL := ( mm.RTL ) and ( Pos( 'ltr:', pObj.Hint ) = 0 );
                 If ( Pos( 'inputico:', pObj.Hint ) > 0 ) then
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
                oLabel := TUniLabel( TComponent(pFrame).FindComponent('rc__FormLabel' + pObj.Name) );
                if ( oLabel <> nil ) and ( TUniEdit(pObj).Text = '' ) then
                begin
                     rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top ) , '350' );
                end;
             end;
          end;
          if (  mm.CONFIG_LAYOUT_KEYBOARD_SCROLL_ON_MOBILE = 'ON' ) then
          begin
             if ( mm.varB_Mobile_Screen ) and ( ( mm.varB_Android ) or ( mm.varB_Tablet ) or ( mm.varB_iOS ) ) and ( ( pFrame <> nil ) ) then //or ( lowercase( fClassName ) = 'mainform' ) ) then
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
end;

procedure TfrmLogin.imgLogoClick(Sender: TObject);
begin
     dm_rc.rc_OpenLink( SOFTWAREHOUSE_SITE );
end;

procedure TfrmLogin.rc_SendEmailCode(Sender: TObject; pType, pEmail, pUser, pPassword: string);
var
   cMessage: Tstrings;
begin
       TUniBitBtn( sender ).Enabled := False;
       TUniBitBtn( sender ).Tag := 1;

       rc_SortNumbers;

       if pEmail = '' then
       begin
            dm_rc.rc_ShowMessage( 'Email:' + mm.MSG_VALIDATE_OR_BLANK_CONTENT );
            Exit;
       end
       else
       begin
           //[PT] email cadastrado ?
           //[EN] registered email ?
           if TUniBitBtn( sender ).Name = 'btnConfirmEmail' then
           begin
               dm_rc.memUsers.Close;
               dm_rc.memUsers.Data := dm_rc.rc_GetRecord( mm.varB_IsNot_API ,
                                                          false,
                                                          ' select codigo,codiemp,nome,email,senha,master,codifunc,avatar ' +
                                                          ' from ' + dm_rc.rc_DBSchema + 'usuarios ' + //6.1.0.0
                                                          ' where email = ' + QuotedStr( edUserNameReg.Text ) );

               if ( mm.varC_LastErrorMsg <> '' ) or ( dm_rc.memUsers.IsEmpty ) then
               begin
                   if ( mm.varC_LastErrorMsg <> '' ) then
                      dm_rc.rc_ShowError( mm.varC_LastErrorMsg )
                   else
                     dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_INVALID_EMAIL, 'warning' );

                   edUserNameReg.SetFocus;
                   Abort;
               end;
           end;
           mm.varC_TempString := '';
           mm.varC_Temp1  := IntToStr( Random( 9 ) );
           mm.varC_Temp2  := IntToStr( Random( 9 ) );
           mm.varC_Temp3  := IntToStr( Random( 9 ) );
           mm.varC_Temp4  := IntToStr( Random( 9 ) );
           mm.varC_Temp5  := IntToStr( Random( 9 ) );

           cMessage := TstringList.Create;
           cMessage.Add( ' ' );
           cMessage.Add( pType + ': ' + APP_NAME );
           cMessage.Add( StringOfChar( '-' , 26 ) );
           cMessage.Add( 'Code: ' + mm.varC_Temp1 + ' ' + mm.varC_Temp2 + ' ' +  mm.varC_Temp3 + ' ' +  mm.varC_Temp4 + ' ' +  mm.varC_Temp5 ) ;
           cMessage.Add( StringOfChar( '-' , 26 ) );
           cMessage.Add( ' ' );
           cMessage.Add( ' ' );
           cMessage.Add( ' ' );
           cMessage.Add( SOFTWAREHOUSE_NAME );
           cMessage.Add( ' ' );
           cMessage.Add( SOFTWAREHOUSE_COMMERCIAL_PHONE );
           cMessage.Add( StringOfChar( '-' , 26 ) );
           cMessage.Add( mm.MSG_EMAIL_DO_NOT_REPLY );
           cMessage.Add( StringOfChar( '-' , 26 ) );

           Sleep(100);

           mm.varB_OperationProcessed := rc_MailSend( mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_USER ,
                                                      mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_PASS ,
                                                      mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_HOST ,
                                                      mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SMTP_PORT,
                                                      SOFTWAREHOUSE_NAME,
                                                      mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER ,
                                                      pEmail,
                                                      '',
                                                      '[' + pType + '] ' + APP_NAME,
                                                      cMessage,
                                                      mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_TLS = '1',
                                                      mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SSL = '1'
                                                      );
           if mm.varB_OperationProcessed then
           begin
              if pType = mm.MSG_PASSWORD_RESET then
              begin
                 dm_rc.rc_ShowSweetAlert( 'Email', mm.MSG_PASSWORD_TEMP_SENT , 'success' );
              end
              else
              begin
                 dm_rc.rc_ShowSweetAlert( 'Email', mm.MSG_CONFIRMATION_CODE, 'success' ) ;
              end;
           end;
           TUniBitBtn( sender ).ModalResult := mrNone;
       end;
end;
// 6.0.0.0
procedure TfrmLogin.rc_SendProvisionalPassword( pNewRegister : Boolean );
var
   cMens,
   cFields, cParams, cPermissions,
   cNewPass : string;
   cMessage: Tstrings;
   f, i, t : integer;
   aArrayPermissions : array of Variant;
begin
  edNameReg.Text := AnsiUpperCase( edNameReg.Text );

  if not pNewRegister then
  begin
     cMens    := mm.MSG_PASSWORD_RESET;
     cNewPass := GetRandomPassword( 8, 2 ) ;
     //[PT] email cadastrado ?
     //[EN] registered email ?
     dm_rc.memUsers.Close;
     dm_rc.memUsers.Data := dm_rc.rc_GetRecord( mm.varB_IsNot_API ,
                                                false,
                                                ' select codigo,codiemp,nome,email,senha,master,codifunc,avatar ' +
                                                ' from ' + dm_rc.rc_DBSchema + 'usuarios ' + //6.1.0.0
                                                ' where email = ' + QuotedStr( edUserNameReg.Text ) );

     if mm.varC_LastErrorMsg <> '' then
     begin
         dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
         Exit;
     end;
  end
  else
  begin
       cMens := mm.MSG_REGISTER_NEW;
  end;

  mm.varC_TempString := '';
  mm.varC_Temp1  := IntToStr( Random( 9 ) );
  mm.varC_Temp2  := IntToStr( Random( 9 ) );
  mm.varC_Temp3  := IntToStr( Random( 9 ) );
  mm.varC_Temp4  := IntToStr( Random( 9 ) );
  mm.varC_Temp5  := IntToStr( Random( 9 ) );

  cMessage := TstringList.Create;
  cMessage.Add( ' ' );
  cMessage.Add( cMens + ' : ' + APP_NAME );

  if not pNewRegister then
  begin
     cMessage.Add( StringOfChar( '-' , 45 ) );
     cMessage.Add( mm.MSG_PASSWORD_TEMP + cNewPass ) ;
     cMessage.Add( StringOfChar( '-' , 45 ) );
     cMessage.Add( ' ' );
  end;

  cMessage.Add( ' ' );
  cMessage.Add( SOFTWAREHOUSE_NAME );
  cMessage.Add( ' ' );
  cMessage.Add( SOFTWAREHOUSE_COMMERCIAL_PHONE );
  cMessage.Add( StringOfChar( '-' , 45 ) );
  cMessage.Add( mm.MSG_EMAIL_DO_NOT_REPLY );
  cMessage.Add( StringOfChar( '-' , 45 ) );

  Sleep(100);

  rc_MailSend( mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_USER ,
               mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_PASS ,
               mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_HOST ,
               mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SMTP_PORT,
               SOFTWAREHOUSE_NAME,
               mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER ,
               edUserNameReg.Text ,
               '',
               '[' + APP_NAME + '] ' + cMens,
               cMessage,
               mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_TLS = '1',
               mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SSL = '1'
               );
  //[PT] após gerar senha provisória, os dados do usuário serão atualizados...
  //[EN] after generating temporary password, user data will be updated...
  dm_rc.sqlGeneric.Close;

  if not pNewRegister then
  begin
     cNewPass := dm_rc.rc_GetMD5( dm_rc.memUsers.FieldByName('nome').AsString + cNewPass ) ;

     mm.varC_SQL_GENERIC := ' Update ' + dm_rc.rc_DBSchema + 'usuarios ' + //6.1.0.0
                            ' Set senha = ' + QuotedStr( cNewPass ) +
                            ' Where codigo = ' + dm_rc.memUsers.FieldByName( 'codigo' ).AsString;

     mm.varC_ErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API, mm.varC_SQL_GENERIC , [] );
  end
  else
  begin
     mm.varB_OperationProcessed := dm_rc.rc_ProcessFirstConnection;

     if mm.varB_OperationProcessed then
     begin
        i := dm_rc.rc_GetNextID( mm.varB_IsNot_API , 'usuarios' , 'codigo' , '' );

        mm.varC_SQL_GENERIC := ' Insert into ' + dm_rc.rc_DBSchema + 'usuarios ( codigo, codiemp, nome, senha , email , dtcadastro, avatar )' + //6.1.0.0
                               ' Values ( :table_pk , :codiemp, :nome, :senha, :email , :dtcadastro, :avatar )' ;

        mm.varC_ErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                                          mm.varC_SQL_GENERIC,
                                          [ i,
                                            1,
                                            AnsiUpperCase( edNameReg.Text ),
                                            dm_rc.rc_GetMD5( AnsiUpperCase( edNameReg.Text ) + edPasswordReg.Text ),
                                            AnsiLowerCase( edUserNameReg.Text ),
                                            now,
                                            'avatar_4.png'
                                          ] );
     end;
  end;

  if mm.varC_ErrorMsg <> '' then
  begin
      mm.varC_SQLERROR := '';
      mm.varC_LastProcFuncError := 'Error saving temporary password' ;
      dm_rc.rc_ShowError( mm.varC_LastProcFuncError );
      Abort;
  end;

  dm_rc.sqlGeneric.Close;

  if not pNewRegister then
     dm_rc.rc_ShowSweetAlert( cMens , mm.MSG_PASSWORD_TEMP_SENT , 'success' )
  else
  begin
     cFields := '';
     cParams := '';
     cPermissions := '';
     t := 0;
     dm_rc.memUsersPermissions.Close;
     dm_rc.memUsersPermissions.Data := dm_rc.rc_GetRecord(
                                          mm.varB_IsNot_API ,
                                          False,
                                          ' select * ' +
                                          ' from ' + dm_rc.rc_DBSchema + 'usuarios_restricoes ' + //6.1.0.0
                                          ' where 1 <> 1' );
     SetLength( aArrayPermissions, dm_rc.memUsersPermissions.FieldList.Count - 1 );
     aArrayPermissions[t] := i;
     for f := 0 to dm_rc.memUsersPermissions.FieldList.Count - 1 do
     begin
        if DataTypeIsString( dm_rc.memUsersPermissions.FieldList.Fields[f].DataType ) then
        begin
            Inc(t);
            cFields := cFields + dm_rc.memUsersPermissions.FieldList.Fields[f].FieldName ;
            if f < dm_rc.memUsersPermissions.FieldList.Count - 1 then
               cFields := cFields + ',';
            cParams := cParams + ':' + dm_rc.memUsersPermissions.FieldList.Fields[f].FieldName ;
            if f < dm_rc.memUsersPermissions.FieldList.Count - 1 then
               cParams := cParams + ',';

            aArrayPermissions[t] := Crypta( StringOfChar( '0', 50 ) , i.ToString + dm_rc.memUsersPermissions.FieldList.Fields[f].FieldName );
        end;
     end;
     mm.varC_SQL_GENERIC := ' Insert into ' + dm_rc.rc_DBSchema + 'usuarios_restricoes ( codiuser, ' + cFields ; //6.1.0.0
     mm.varC_SQL_GENERIC := mm.varC_SQL_GENERIC + ')';
     mm.varC_SQL_GENERIC := mm.varC_SQL_GENERIC  + ' Values ( :codiuser, ' + cParams ;
     mm.varC_SQL_GENERIC := mm.varC_SQL_GENERIC + ')';
     mm.varC_ErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                                                mm.varC_SQL_GENERIC,
                                                aArrayPermissions
                                                );
     if mm.varC_ErrorMsg <> '' then
     begin
         mm.varC_SQLERROR := '';
         mm.varC_LastProcFuncError := 'Error saving access restrictions' ;
         dm_rc.rc_ShowError( mm.varC_LastProcFuncError );
         Abort;
     end;
     // insert user access to default company
     mm.varC_SQL_GENERIC := ' Insert into ' + dm_rc.rc_DBSchema + 'usuarios_empresa ( codiuser, codiemp )' + //6.1.0.0
                            ' Values( :codiuser, :codiemp )' ;

     mm.varC_ErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                                                mm.varC_SQL_GENERIC,
                                                [
                                                  i,
                                                  1
                                                ] );
     if mm.varC_ErrorMsg <> '' then
     begin
         mm.varC_SQLERROR := '';
         mm.varC_LastProcFuncError := 'Error saving access company' ;
         dm_rc.rc_ShowError( mm.varC_LastProcFuncError );
         Abort;
     end;
  end;
  btnBackClick( self );
end;

procedure TfrmLogin.labResetClick(Sender: TObject);
begin
     rc_AddCssClass   ( tabRegister , 'rc-fade-in' );
     pgLogin.ActivePage := tabRegister;

     varB_OutSideLoginForm := true;
     btnRecPassword1.tag      := 0;
     btnConfirmEmail.Tag      := 0;
     paKeyBoard.Visible       := False;

     rc_SortNumbers;

     paNewRegister.Height     := paBackground.Height ;
     paNewRegister.Width      := LOGIN_PANEL_WIDTH; //8.0.0.0
     paNewRegister.Visible    := True;
     edNameReg.Visible        := False;
     edPasswordReg.Visible    := False;
     btnConfirmEmail.Visible  := True;
     btnRegisterUser.Visible  := False;

     edUserNameReg.SetFocus;
end;

procedure TfrmLogin.labRegisterClick(Sender: TObject);
var
   iTag : integer;
begin
     rc_AddCssClass   ( tabRegister , 'rc-fade-in' );
     pgLogin.ActivePage := tabRegister;

     iTag := paBackground.left;
     varB_OutSideLoginForm     := true;
     btnRecPassword1.tag       := 0;
     btnRegisterUser.Tag       := 0;
     paKeyBoard.Visible        := False;
     btnConfirmEmail.Visible   := False;
     btnRegisterUser.Visible   := True;
     edUserNameReg.Visible     := True;
     edNameReg.Visible         := True;
     edPasswordReg.Visible     := True;
     paNewRegister.Height      := paBackground.Height ;
     paNewRegister.Width       := LOGIN_PANEL_WIDTH; //8.0.0.0
     paNewRegister.Visible     := True;
end;
//8.0.0.0
procedure TfrmLogin.UniLoginFormScreenResize(Sender: TObject; AWidth,  AHeight: Integer);
var
 pX : integer;
 pTop : integer;
 bOldMobileScreen : boolean; // 6.0.0.0

begin
   mm.varI_ScreenWidth := UniApplication.ScreenWidth;
   mm.varI_ScreenHeight := UniApplication.ScreenHeight;
   mm.varI_ScreenWidth  := AWidth;
   mm.varI_ScreenHeight := AHeight;
   bOldMobileScreen     := mm.varB_Mobile_Screen; // 6.0.0.0
   dm_rc.rc_ScreenUpdate( false );//7.0.0.0 menumicro
   //6.0.0.0
   if ( bOldMobileScreen <> mm.varB_Mobile_Screen ) then
      mm.rc_InitLayoutThemes;
   //[PT] Só RECENTRALIZA se houver uma mudança significativa na dimensão da tela. No MOBILE, o ACELEROMETRO, fica variando...
   //[EN] RECENTRALIZES only if there is a significant change in the screen size. In MOBILE, the ACCELEROMETER varies...
   pX := mm.varI_ScreenWidth - Self.Tag;

   if Px < 0 then
      pX := pX *(-1);

   Top    := 0;
   Left   := 0;
   Width  := mm.varI_ScreenWidth;
   Height := mm.varI_ScreenHeight;
   pTop   := ( mm.varI_ScreenHeight div 2 ) - ( self.Height div 2  );
   //8.0.0.0
   paBackground.Width := LOGIN_PANEL_WIDTH;
   paBackground.Left  := 0;

   if ( not mm.varB_RCFoldersMissing )  then
   begin
      case varI_LoginModel of
         // full screen RIGHT SIDE
         1 : begin
               paLogo.Visible     := false;
               //8.0.0.0
               if ( mm.varB_Mobile_Screen_Portrait ) and ( not mm.varB_Tablet ) then
               begin
                  paLoginForm.Left   := 0;
                  paLoginForm.Width  := mm.varI_ScreenWidth;
               end
               else
               begin
                  paLoginForm.Width  := LOGIN_PANEL_WIDTH; //8.0.0.0
                  paLoginForm.Left   := mm.varI_ScreenWidth - paLoginForm.Width ;
               end;
               paLoginForm.Height := mm.varI_ScreenHeight;
               paLoginForm.Top    := 0;
               paLogo.Left        := 0;
               paLogo.Top         := 0;
               paLogo.Width       := mm.varI_ScreenWidth;
               paLogo.Height      := mm.varI_ScreenHeight;

               if ( not varB_OutSideLoginForm ) or ( px > 10 ) then
               begin
                  //8.0.0.0
                  if ( mm.varB_Mobile_Screen_Landscape ) and ( not mm.varB_Tablet ) then
                     paBackground.Left := 0
                  else
                     paBackground.Left := ( paLoginForm.Width div 2 ) - ( paBackground.Width div 2  );
               end;
               paBackground.Top  := ( mm.varI_ScreenHeight div 2 ) - ( paBackground.Height div 2  );
               //center
               paWelcomeBox.Parent      := paImgBG_LoginForm;
               paWelcomeBox.Left        := ( paLogo.Width div 2 ) - ( paWelcomeBox.Width ) ;
               paWelcomeBox.Top         := ( paWelcomeBox.Parent.Height div 2 ) - ( paWelcomeBox.Height div 2  );
               labCopyright.Font.Color  := clBlack;
               labAppVersion.Font.Color := clBlack;
               // new image slider
               paImgBG.Visible := true;
             end;
         // full screen LEFT SIDE
         2 : begin
               paLogo.Visible     := false;
               //8.0.0.0
               if ( mm.varB_Mobile_Screen_Portrait ) and ( not mm.varB_Tablet ) then
               begin
                  paLoginForm.Left   := 0;
                  paLoginForm.Width  := mm.varI_ScreenWidth;
               end
               else
               begin
                  paLoginForm.Width  := LOGIN_PANEL_WIDTH; //8.0.0.0
                  paLoginForm.Left   := 0;
               end;
               paLoginForm.Height := mm.varI_ScreenHeight;
               paLoginForm.Top    := 0;

               paLogo.Top         := 0;
               paLogo.Left        := paLoginForm.Left + paLoginForm.Width;
               paLogo.Width       := mm.varI_ScreenWidth;
               paLogo.Height      := mm.varI_ScreenHeight;
               // inside paLoginForm
               //8.0.0.0
               //if mm.varB_Mobile_Screen_Landscape then
               if ( mm.varB_Mobile_Screen_Landscape ) and ( not mm.varB_Tablet ) then
                  paBackground.Left := 0
               else
                  paBackground.Left := ( paLoginForm.Width div 2 ) - ( paBackground.Width div 2  );

               paBackground.Top  := ( mm.varI_ScreenHeight div 2 ) - ( paBackground.Height div 2  );
               //center
               paWelcomeBox.Parent      := paImgBG_LoginForm;
               paWelcomeBox.Left        := ( paLogo.Width div 2 );
               paWelcomeBox.Top         := ( paWelcomeBox.Parent.Height div 2 ) - ( paWelcomeBox.Height div 2  );
               labCopyright.Font.Color  := clBlack;
               labAppVersion.Font.Color := clBlack;
               // new image slider
               paImgBG.Visible := true;
             end;
         // form LEFT SIDE

         3 : begin
               paLogo.Visible     := ( mm.varB_Tablet ) or ( ( not mm.varB_Tablet ) and ( not mm.varB_Mobile_Screen_Portrait ) );//8.0.0.0
               paLogo.Width       := LOGIN_PANEL_WIDTH; //8.0.0.0
               paLogo.Height      := LOGIN_PANEL_HEIGHT; //8.0.0.0
               paLoginForm.Height := LOGIN_PANEL_HEIGHT; //8.0.0.0
               paLoginForm.Width  := LOGIN_PANEL_WIDTH; //8.0.0.0
               // login form ( RIGHT SIDE )
               if paLogo.Visible then
                  paLoginForm.Left := ( mm.varI_ScreenWidth div 2 ) - ( ( paLoginForm.Width + paLogo.Width ) div 2 )
               else
                  paLoginForm.Left := ( mm.varI_ScreenWidth div 2 ) - ( paLoginForm.Width div 2 );
               paLoginForm.Top  := ( mm.varI_ScreenHeight div 2 ) - ( paLoginForm.Height div 2  );
               // login bg ( LEFT SIDE )
               paLogo.Left      := paLoginForm.Left + paLoginForm.Width;
               paLogo.Top       := paLoginForm.Top ;
               // inside paLoginForm
               if not varB_OutSideLoginForm then
               begin
                  //8.0.0.0
                  //if mm.varB_Mobile_Screen_Landscape then
                  if ( mm.varB_Mobile_Screen_Landscape ) and ( not mm.varB_Tablet ) then
                     paBackground.Left := 0
                  else
                     paBackground.Left := ( paLoginForm.Width div 2 ) - ( paBackground.Width div 2  );
               end;
               paBackground.Top  := 0;
               //center
               paWelcomeBox.Left        := ( paLogo.Width div 2 ) - ( paWelcomeBox.Width div 2 );
               paWelcomeBox.Top         := ( paLogo.Height div 2 ) - ( paWelcomeBox.Height div 2  );
               labCopyright.Font.Color  := clBlack;
               labAppVersion.Font.Color := clBlack;
               // new image slider
               paImgBG.Visible := true;
             end;
         // form RIGHT SIDE
         4 : begin
               paLogo.Visible     := ( mm.varB_Tablet ) or ( ( not mm.varB_Tablet ) and ( not mm.varB_Mobile_Screen_Portrait ) );//8.0.0.0
               paLogo.Width       := LOGIN_PANEL_WIDTH; //8.0.0.0
               paLogo.Height      := LOGIN_PANEL_HEIGHT; //8.0.0.0
               paLoginForm.Height := LOGIN_PANEL_HEIGHT; //8.0.0.0
               paLoginForm.Width  := LOGIN_PANEL_WIDTH; //8.0.0.0
               // login form ( RIGHT SIDE )
               if paLogo.Visible then
                  paLogo.Left := ( mm.varI_ScreenWidth div 2 ) - ( ( paLoginForm.Width + paLogo.Width ) div 2 )
               else
                  paLogo.Left := ( mm.varI_ScreenWidth div 2 ) - ( ( paLoginForm.Width ) div 2 );
               paLogo.Top  := ( mm.varI_ScreenHeight div 2 ) - ( paLoginForm.Height div 2  );
               // login bg ( LEFT SIDE )
               //7.3.0.0
               if paLogo.Visible then
                  paLoginForm.Left   := ( mm.varI_ScreenWidth div 2 ) - ( ( paLoginForm.Width - paLogo.Width ) div 2 )
               else
                  paLoginForm.Left   := ( mm.varI_ScreenWidth div 2 ) - ( paLoginForm.Width div 2 );
               paLoginForm.Top    := paLogo.Top ;
               // inside paLoginForm
               if not varB_OutSideLoginForm then
               begin
                  //8.0.0.0
                  //if mm.varB_Mobile_Screen_Landscape then
                  if ( mm.varB_Mobile_Screen_Landscape ) and ( not mm.varB_Tablet ) then
                     paBackground.Left := 0
                  else
                     paBackground.Left := ( paLoginForm.Width div 2 ) - ( paBackground.Width div 2  );
               end;
               paBackground.Top  := 0;
               //center
               paWelcomeBox.Left        := ( paLogo.Width div 2 ) - ( paWelcomeBox.Width div 2 );
               paWelcomeBox.Top         := ( paLogo.Height div 2 ) - ( paWelcomeBox.Height div 2  );
               labCopyright.Font.Color  := clBlack;
               labAppVersion.Font.Color := clBlack;
               // new image slider
               paImgBG.Visible := true;
             end;
         // transparent
         5 : begin
               paLogo.Width       := LOGIN_PANEL_WIDTH; //8.0.0.0
               paLogo.Height      := LOGIN_PANEL_HEIGHT; //8.0.0.0
               paLoginForm.Height := LOGIN_PANEL_HEIGHT; //8.0.0.0
               paLoginForm.Width  := LOGIN_PANEL_WIDTH; //8.0.0.0
               paLoginForm.Left   := ( mm.varI_ScreenWidth div 2 ) - ( ( paLoginForm.Width ) div 2 );
               paLoginForm.Top    := ( mm.varI_ScreenHeight div 2 ) - ( paLoginForm.Height div 2  );
               // inside paLoginForm
               if not varB_OutSideLoginForm then
               begin
                  //8.0.0.0
                  //if mm.varB_Mobile_Screen_Landscape then
                  if ( mm.varB_Mobile_Screen_Landscape ) and ( not mm.varB_Tablet ) then
                     paBackground.Left := 0
                  else
                     paBackground.Left := ( paLoginForm.Width div 2 ) - ( paBackground.Width div 2  );
               end;
               paBackground.Top  := 0;
               //center
               paWelcomeBox.Left        := ( paLogo.Width div 2 ) - ( paWelcomeBox.Width div 2 );
               paWelcomeBox.Top         := ( paLogo.Height div 2 ) - ( paWelcomeBox.Height div 2  );
               labCopyright.Font.Color  := clWhite;
               labAppVersion.Font.Color := clWhite;
               rc_AddCssClass( labCopyright, 'shadow-text' );
               rc_AddCssClass( labAppVersion, 'shadow-text' );
               // new image slider
               paImgBG.Visible := true;
               rc_AddCssClass( labReset, 'shadow-text' );
               rc_AddCssClass( labRegister, 'shadow-text' );
               labReset.Font.Color  := clWhite;
               labRegister.Font.Color := clWhite;
             end;
         //7.5.0.0 login
         // themed RIGHT SIDE
         6 : begin
               paLogo.Visible     := false;
               //8.0.0.0
               //if mm.varB_Mobile_Screen_Portrait then
               if ( mm.varB_Mobile_Screen_Portrait ) and ( not mm.varB_Tablet ) then
               begin
                  paLoginForm.Left   := 0;
                  paLoginForm.Width  := mm.varI_ScreenWidth;
               end
               else
               begin
                  paLoginForm.Width  := LOGIN_PANEL_WIDTH; //8.0.0.0
                  //if ( mm.varB_Tablet ) or ( mm.varB_Desktop ) then
                  paLoginForm.Left   := mm.varI_ScreenWidth - paLoginForm.Width - ( StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ) * varIIF( mm.varB_Desktop, 12, 4 ) ) ;
               end;
               paLoginForm.Height := LOGIN_PANEL_HEIGHT; //8.0.0.0
               paLoginForm.Top    := ( mm.varI_ScreenHeight div 2 ) - ( paLoginForm.Height div 2 );
               paLogo.Left        := 0;
               paLogo.Top         := 0;
               paLogo.Width       := mm.varI_ScreenWidth;
               paLogo.Height      := mm.varI_ScreenHeight;

               if ( not varB_OutSideLoginForm ) or ( px > 10 ) then
               begin
                  //8.0.0.0
                  //if mm.varB_Mobile_Screen_Landscape then
                  if ( mm.varB_Mobile_Screen_Landscape ) and ( not mm.varB_Tablet ) then
                     paBackground.Left := 0
                  else
                     paBackground.Left := ( paLoginForm.Width div 2 ) - ( paBackground.Width div 2  );
               end;
               paBackground.Top  := 0;//( mm.varI_ScreenHeight div 2 ) - ( paBackground.Height div 2  );
               //center
               paWelcomeBox.Parent      := paImgBG_LoginForm;
               labCopyright.Font.Color  := clBlack;
               labAppVersion.Font.Color := clBlack;
               // new image slider
               paImgBG.Visible := true;
             end;
         //7.5.0.0 login
         // themed LEFT SIDE
         7 : begin
               paLogo.Visible     := false;
               //8.0.0.0
               //if mm.varB_Mobile_Screen_Portrait then
               if ( mm.varB_Mobile_Screen_Portrait ) and ( not mm.varB_Tablet ) then
               begin
                  paLoginForm.Left   := 0;
                  paLoginForm.Width  := mm.varI_ScreenWidth;
               end
               else
               begin
                  paLoginForm.Width  := LOGIN_PANEL_WIDTH; //8.0.0.0
                  paLoginForm.Left   := ( StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ) * varIIF( mm.varB_Desktop, 12, 4 ) );
               end;
               paLoginForm.Height := LOGIN_PANEL_HEIGHT; //8.0.0.0
               paLoginForm.Top    := ( mm.varI_ScreenHeight div 2 ) - ( paLoginForm.Height div 2 );
               paLogo.Left        := 0;
               paLogo.Top         := 0;
               paLogo.Width       := mm.varI_ScreenWidth;
               paLogo.Height      := mm.varI_ScreenHeight;

               if ( not varB_OutSideLoginForm ) or ( px > 10 ) then
               begin
                  //8.0.0.0
                  //if mm.varB_Mobile_Screen_Landscape then
                  if ( mm.varB_Mobile_Screen_Landscape ) and ( not mm.varB_Tablet ) then
                     paBackground.Left := 0
                  else
                     paBackground.Left := ( paLoginForm.Width div 2 ) - ( paBackground.Width div 2  );
               end;
               paBackground.Top  := 0;//( mm.varI_ScreenHeight div 2 ) - ( paBackground.Height div 2  );
               //center
               paWelcomeBox.Parent      := paImgBG_LoginForm;
               labCopyright.Font.Color  := clBlack;
               labAppVersion.Font.Color := clBlack;
               // new image slider
               paImgBG.Visible := true;
             end;
      end;
      paSelectLanguage.left := ( paBackground.Width div 2 ) - ( paSelectLanguage.Width div 2 ) ;
      if ( not varB_OutSideLoginForm ) and ( px > 10 ) then
      begin
         //7.4.0.0 anim
         if mm.CONFIG_LAYOUT_ANIM_EFFECTS = 'ON' then
            UniSession.AddJS( 'gsapAnimFormShow( ' + Self.Name + '.' + paBackground.Name + '.id' + ' );' );
         //[PT] quando arrasta o browser pra mobile e volta p desktop...
         //[EN] when you drag the browser to mobile and return to desktop...
         varB_OutSideLoginForm := true;
      end;
      Self.Tag := mm.varI_ScreenWidth;
      if mm.varB_Mobile_Screen_Portrait then
      begin
         labLogin.Caption := '<img id="userimg" class="avatar img-thumbnail" src="files/images/logo_loginM.png" alt="Logo Img">';
         labLogin.hint    := '';
      end
      else
      begin
         labLogin.Caption := '';
         labLogin.hint    := '[[' +
                             'ico:fas-user-circle 3x|'+
                             ']]';
         rc_RenderControlsExecute( Self , '');
      end;
   end;
   dm_rc.rc_ResizeBlocks( self );//7.0.0.0
end;

procedure TfrmLogin.btnSearchCompanyClick(Sender: TObject);
begin
     dm_rc.rc_ProcessCompanySearch( edSearchCompany.Text );
end;
// 6.0.0.1
procedure TfrmLogin.UniLoginFormCreate(Sender: TObject);
var
   f,i : integer;
   sStringSeparada: TStringDynArray;
   sTemp, sTemp2,sString,
   sShadow, //6.0.0.1
   sRoundAll, sRoundL, sRoundR : String; // 6.0.0.0
   IniFile : TIniFile;//8.0.0.0
begin
  //8.4.0.4
  dbgCompanies.Anchors := [akLeft,akTop,akRight,akBottom];
  rcBlock10.Hint := '[[' +
                    'cols:12|' +
                    'noborder-all|' +
                    'hr:parent-top off:60 off-mobile-v-60 off-mobile-h-60 |' +//
                    //'scale:parent h:100%-top off:0|' +
                    ']]';
   //7.3.0.0 from http://forums.unigui.com/index.php?/topic/10748-remote-informations/&do=findComment&comment=162451
   //8.4.0.1 check "mkm_restfuncs" ipinfo was updated( uncomment to use )
   Try
      //mm.FServerExternalData := rc_GetExternalData( mm.RemoteAddress );
   Except
   End;
  //8.1.0.1  thanks for iOS test Fabio Oliveira
  rc_AddCssClass( rcBlock10, 'bringtofront-higher-3' );
  //7.4.0.0
  htmlFrame.HTML.Add( '<form autocomplete="off">');
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
//      '   else ' +
//      '      if(Mac) { ' +
//      '        res = "MacOs" ; ' +
//      '      } ' +
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
      //'   console.log( "Plataforma:" + res + " " + navigator.userAgent );' +
      '    ajaxRequest( frmLogin.htmlFrame, "_rcDetectPlatform" ,' +
      '      ["device=" + res ]);' +
      '}';

     Self.ClientEvents.ExtEvents.Values['form.resize'] :=
        'function(sender, width, height, oldWidth, oldHeight, eOpts)'+
        '{  rc_detectPlatform(); }'; //alert( "resize" );

     if mm.CONFIG_LAYOUT_ROUND_FORM = 'ON' then
     begin
          sRoundAll := 'all';
          //6.0.0.1
          if not mm.RTL then
          begin
             sRoundL   := 'l';
             sRoundR   := 'r';
          end
          else
          begin
             sRoundL   := 'r';
             sRoundR   := 'l';
          end;
     end
     else
     begin
          sRoundAll := 'no';
          sRoundL   := 'no';
          sRoundR   := 'no';
     end;
     pgLogin.ActivePageIndex := 0;

     varB_OutSideLoginForm := false;

     dm_rc.rc_ScreenUpdate( false );

     sString := mm.varC_Temp1;
     sString := Copy( sString, Pos( 'files/', sString ) );

     mm.varC_Temp2 := sString;
     paSelectLanguage.Visible := ( mm.CONFIG_LOGIN_LANGUAGE = 'ON' );
     paWelcomeBox.Visible     := ( mm.CONFIG_LOGIN_WELCOMEBOX = 'ON' );
     varI_LoginModel          := StrToIntDef( mm.CONFIG_LOGIN_MODEL , 0 ) + 1;
     paBtns.Hint              :='';
     paBtnsNewRegister.Hint   :='';
     paImgBG_LoginForm.Hint   := '';
     paWelcomeBox.Parent      := paLogo;
     labAppName.Caption       := APP_NAME; //7.5.0.0 login
     labAppName.Alignment     := taCenter; //7.5.0.0 login
     labWelcome.Caption       := 'Bem-Vindo'; //7.5.0.0 login
     labWelcome.Hint          := '[[translate:]]'; //7.5.0.0 login
     labAppName.Hint          := '[[cls:shadow-text unselectable rc-font-light]]' ; //7.5.0.0 login

     case varI_LoginModel of
          1,2 : begin
                paLogo.Hint := '';
                paLoginForm.Hint := '';
                paAppVersion.Parent      := paBackgroundLogin;
              end;
          3 : begin
                //6.0.0.1
                if not mm.RTL then
                   sShadow := '-right'
                else
                   sShadow := '-left';

                paLogo.Hint := '[[cls:shadow-obj' + sShadow + ' |round:' + sRoundR + ']]';
                if ( mm.CONFIG_LOGIN_BG_IMAGE_EXTRA = 'ON' ) then
                begin
                   //8.0.0.0
                   if ( ( mm.varB_Tablet ) or ( ( not mm.varB_Tablet ) and ( not mm.varB_Mobile_Screen_Portrait ) ) ) then
                      paLoginForm.Hint := 'cls:shadow-obj' + sShadow + ' |round:' + sRoundL + ' | cls:card-info-box-white' + sShadow + ']]'
                   else
                      paLoginForm.Hint := 'cls:shadow-obj' + sShadow + ' |round:' + sRoundAll + ' | cls:card-info-box-white' + sShadow + ']]';
                end
                else
                if mm.varB_Mobile_Screen_Portrait then
                   paLoginForm.Hint := '[[cls:shadow-obj' + sShadow + ' |round:no | cls:card-info-box-white]]'
                else
                   // 6.0.0.0
                   paLoginForm.Hint := '[[cls:shadow-obj' + sShadow + ' |round:' + sRoundL + ' | cls:card-info-box-white]]';

                paAppVersion.Parent      := paBackgroundLogin;
              end;
          4 : begin
                //6.0.0.1
                if not mm.RTL then
                   sShadow := '-left'
                else
                   sShadow := '-right';

                paLogo.Hint := '[[cls:shadow-obj' + sShadow + ' |round:l]]';
                if ( mm.CONFIG_LOGIN_BG_IMAGE_EXTRA = 'ON' ) then
                begin
                   //8.0.0.0
                   if ( ( mm.varB_Tablet ) or ( ( not mm.varB_Tablet ) and ( not mm.varB_Mobile_Screen_Portrait ) ) ) then
                      paLoginForm.Hint := 'cls:shadow-obj' + sShadow + ' |round:' + sRoundR + ' | cls:card-info-box-white' + sShadow + ']]'
                   else
                      paLoginForm.Hint := 'cls:shadow-obj' + sShadow + ' |round:' + sRoundAll + ' | cls:card-info-box-white' + sShadow + ']]';
                end
                else
                if mm.varB_Mobile_Screen_Portrait then
                   paLoginForm.Hint := '[[cls:shadow-obj' + sShadow + ' |round:no | cls:card-info-box-white]]'
                else
                   paLoginForm.Hint := '[[cls:shadow-obj' + sShadow + ' |round:' + sRoundR + ' | cls:card-info-box-white]]';

                paAppVersion.Parent      := paBackgroundLogin;
              end;
          5 : begin
                paLogo.Visible := false;
                paLogo.Hint := '[[round:' + sRoundL + ']]';
                paLoginForm.Hint := '[[round:no | cls:transparent-form-bg]]';
                paAppVersion.Parent := paBackgroundLogin;
              end;
         //7.5.0.0 login

         // themed RIGHT SIDE
         6 : begin
                paLoginForm.Hint := '[[round:all | cls:rc-form-shadow]]';
                paImgBG_LoginForm.Hint := '[[cls:bg-themecrud]]';
                paLogo.Hint := '[[cls:bg-themecrud]]';
                paImgBG.Hint := '[[anchor:|cls:bg-themecrud]]';
                paWelcomeBox.Align       := alLeft;
                paWelcomeBox.Hint        := '';
                paWelcomeBox.Width       := 450;
                paWelcomeLabel.Visible   := false;
                labAppName.Alignment     := taLeftJustify;
                labAppName.Caption := '<div style="margin-left:30px;">';
                labAppName.Caption := labAppName.Caption + '<img src="files/images' + mm.BACKSLASH + 'logo_login_white.png">';
                labAppName.Caption := labAppName.Caption + '</div>';
                labAppName.Caption := labAppName.Caption + '<br>' +
                                      '<p class="rc-label-wrap" style="font-size:32px;margin-left:30px;">' +
                                      'Com o RadCORE, criar aplicações responsivas sem uso de html é muito simples e rápido...' +
                                      '</p>';
                labAppName.Hint    := '[[hide:mobile]]' ;
                htmlLabel.Visible  := false;
                imgLoginThemed.Hint:= '[[hide:mobile|align:paWelcomeBox b:-h l:+w-100]]';
                rc_UrlImgNoCache( imgLoginThemed, 'files' + mm.BACKSLASH + 'images' + mm.BACKSLASH + 'webp' + mm.BACKSLASH + 'girl-1729057_640.webp' );
             end;
         //7.5.0.0 login
         // themed LEFT SIDE
         7 : begin
                paLoginForm.Hint := '[[round:all | cls:rc-form-shadow]]';
                paImgBG_LoginForm.Hint := '[[cls:bg-themecrud]]';
                paLogo.Hint := '[[cls:bg-themecrud]]';
                paImgBG.Hint := '[[anchor:|cls:bg-themecrud]]';
                paWelcomeBox.Align       := alRight;
                paWelcomeBox.Hint        := '';
                paWelcomeBox.Width       := 450;
                paWelcomeLabel.Visible   := false;
                labAppName.Alignment     := taLeftJustify;
                labAppName.Caption := '<div style="margin-left:30px;">';
                labAppName.Caption := labAppName.Caption + '<img src="files/images' + mm.BACKSLASH + 'logo_login_white.png">';
                labAppName.Caption := labAppName.Caption + '</div>';
                labAppName.Caption := labAppName.Caption + '<br>' +
                                      '<p class="rc-label-wrap" style="font-size:32px;margin-left:30px;">' +
                                      'Com o RadCORE, criar aplicações responsivas sem uso de html é muito simples e rápido...' +
                                      '</p>';
                labAppName.Hint    := '[[hide:mobile]]' ; //7.5.0.0 login
                imgLoginThemed.Hint:= '[[hide:mobile|align:paWelcomeBox b:-h l:-w+100]]';
                htmlLabel.Visible  := false;
                rc_UrlImgNoCache( imgLoginThemed, 'files' + mm.BACKSLASH + 'images' + mm.BACKSLASH + 'webp' + mm.BACKSLASH + 'girl-1729057_640.webp' );
             end;
     end;
     //video
     if ( mm.CONFIG_LOGIN_BG_VIDEO = 'ON' ) then
     begin
        sString := mm.varC_Temp2;
        sTemp := ReverseStr( sString );
        sTemp := ReverseStr( Copy ( sTemp, 1, pos( '/', sTemp ) - 1 ) );
        sTemp2 := StringReplace( sString, sTemp, '', [rfReplaceAll] );
        sTemp := Copy ( sTemp, 1, pos( '.', sTemp ) - 1 ) + '_video.mp4';
        mm.varC_Temp2 := sString;
        sString := sTemp2 + sTemp;
        paImgBG_LoginForm.Hint := '[[round:' + sRoundAll + ' |anchor: | ' +
                                  'video:' + sString + ' loop autoplay w:1920 h:1080 ' +
                                  ']]';
     end;
     //labAppName.Caption := APP_NAME; //7.5.0.0 login
     //rc_AddCssClass( labAppName, 'shadow-text unselectable' ); //7.5.0.0 login
     //rc_AddCssClass( labAppName, 'rc-font-light' );            //7.5.0.0 login
     htmlLabel.HTML.Text    := StringReplace( htmlLabel.HTML.Text, '[[msg1]]', 'Do More...', [rfReplaceAll] );
     htmlLabel.HTML.Text    := StringReplace( htmlLabel.HTML.Text, '[[msg2]]', 'Quick...', [rfReplaceAll] );
     htmlLabel.HTML.Text    := StringReplace( htmlLabel.HTML.Text, '[[msg3]]', 'And Easy!', [rfReplaceAll] );
     paImgBG.Align := alClient;
     //7.5.0.0 login
     if ( FileExists( mm.varC_Temp1 ) ) and ( ( Pos( '.png', mm.varC_Temp1 ) > 0 ) or ( Pos( '.jpg', mm.varC_Temp1 ) > 0 ) )then
     begin
        if ( mm.CONFIG_LOGIN_BG_IMAGE_INVERTED = 'ON' ) then
        begin
           if mm.CONFIG_LAYOUT_LOGIN_BG_SOLID = 'OFF' then
              paImgBG.Hint := '[[img:' + sString + ' | img-cls:img-responsive-nocover]]';
           paImgBG_LoginForm.Hint := '[[round:' + sRoundAll + ' |anchor:]]';
        end
        else
        begin
           if mm.CONFIG_LAYOUT_LOGIN_BG_SOLID = 'OFF' then
              paImgBG.Hint := '';
           if ( mm.CONFIG_LOGIN_BG_IMAGE = 'ON' ) and ( mm.CONFIG_LOGIN_BG_VIDEO = 'OFF' ) then
              paImgBG_LoginForm.Hint := '[[round:' + sRoundAll + ' |anchor: | img:' + sString + ' | img-cls:img-responsive]]'
           else
           if ( mm.CONFIG_LOGIN_BG_IMAGE = 'OFF' ) and ( mm.CONFIG_LOGIN_BG_VIDEO = 'OFF' ) then
              paImgBG_LoginForm.Hint := '[[round:' + sRoundAll + ' |anchor:]]';

           if ( ( varI_LoginModel = 3 ) or ( varI_LoginModel = 4 ) ) and ( mm.CONFIG_LOGIN_BG_IMAGE_EXTRA = 'ON' ) then
           Begin
                sString := mm.varC_Temp2;
                sTemp := ReverseStr( sString );
                sTemp := ReverseStr( Copy ( sTemp, 1, pos( '/', sTemp ) - 1 ) );
                sTemp2 := StringReplace( sString, sTemp, '', [rfReplaceAll] );
                sTemp := Copy ( sTemp, 1, pos( '.', sTemp ) - 1 ) + '_login.jpg';
                //8.0.0.0

                sTemp := '1_login.jpg';  // vamos deixar somente o 1

                if not FileExists( sTemp2 + sTemp ) then
                begin
                   sTemp := '1_login.jpg';
                   try
                     IniFile := TiniFile.Create( sm.FilesFolderPath + StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] ) + '_cfg.ini' );
                     IniFile.WriteString( 'App', 'loginBg', '1');
                   finally
                     IniFile.Free;
                   end;
                end;
                sString := sTemp2 + sTemp;

                paImgBG.Hint := '[[anchor: | img:' + sString + ' ]]';
           End;
        end;
     end;
     // to make "UniHTMLFRAME" transparent
     TUniHTMLFrame( htmlLabel ).ClientEvents.ExtEvents.Values['added'] :=
        'function added(sender, container, pos, eOpts){'+
        '   sender.addBodyCls('+ QuotedStr('trans-panel') + ');}' ;
     rc_BringToFront( paBackground );

     btnLog_In.Enabled   := not mm.varB_RCFoldersMissing;
     labRegister.Enabled := btnLog_In.Enabled;
     labReset.Enabled    := btnLog_In.Enabled;
     cbLanguage.Enabled  := btnLog_In.Enabled;
     if not mm.varB_RCFoldersMissing then
     begin
         vEmailCode := btnRecPassword2.Left + 12;
         f := 0;
         if UniApplication.Cookies.Count > 0 then
         begin
               for I := 0 to UniApplication.Cookies.Count - 1 do
               begin
                    sString := UniApplication.Cookies[I];
                    sStringSeparada := SplitString(sString, '=');

                    if sStringSeparada[0] = '_login' + APP_NAME then   // FeedBack from FOLVEIRA
                    begin
                       edUserName.Text := sStringSeparada[1];
                       edUserNameReg.Text := edUserName.Text;
                    end;

                    if sStringSeparada[0] = '_language' + APP_NAME + edUserName.Text then
                    begin
                       mm.CONFIG_LANGUAGE := sStringSeparada[1] ;
                    end;

                    if UniApplication.Cookies[I] = '_remember' + APP_NAME + '=' + mm.VALUE_YES then
                       cbRemember.Checked := true;
               end;
         end;
         //[PT] possível problema com cookies
         //[EN] possible problem with cookies
         if not paSelectLanguage.Visible then
            mm.CONFIG_LANGUAGE := '[Auto]';
         begin
            if ( mm.CONFIG_LANGUAGE = '' ) or ( mm.CONFIG_LANGUAGE = '[Auto]' ) or
               ( not AnsiMatchStr( mm.CONFIG_LANGUAGE , ARRAY_LANGUAGES ) ) then
            begin
               mm.CONFIG_LANGUAGE := sm.ExtLocale;
               if mm.CONFIG_LANGUAGE = '[Auto]' then
               begin
                  mm.CONFIG_LANGUAGE := UniSession.Language;

                  if mm.CONFIG_LANGUAGE = '' then
                     mm.CONFIG_LANGUAGE := 'pt_BR';
               end;
            end;
         end;
        if not mm.varB_Mobile_Screen then
           dm_rc.rc_SetFocus( edUserName );
        rc_LoadGSAPAnimFunctions( Self );
        //( feedback mohamed ammar )
        RTL := mm.RTL;
        {$IFDEF RELEASE}
        dm_rc.rc_ProtectForm( Self );
        {$ENDIF}
        //7.5.0.0 login
        if mm.CONFIG_LAYOUT_ROUND_FORM = 'ON' then
        begin
           rc_AddCssClass( Self        , 'form-rounded' );
           if ( ( varI_LoginModel <> 6 ) and ( varI_LoginModel <> 7 ) ) then
              rc_AddCssClass( paWelcomeBox, 'form-rounded' );
        end
        else
        begin
           rc_AddCssClass( Self        , 'form-noborder' );
           if ( ( varI_LoginModel <> 6 ) and ( varI_LoginModel <> 7 ) ) then
              rc_AddCssClass( paWelcomeBox, 'form-noborder' );
        end;
        mm.varC_JSNAME_HTMLFRAME := htmlFrame.JSName;
        mm.varB_DefaulPageBar    := True;

        Self.Tag := UniApplication.ScreenWidth;

        if paSelectLanguage.Visible then
        begin
           // copy paFlag and cbLanguage to your project
           cbLanguage.Items.Clear;
           for I := 1 to High( ARRAY_LANGUAGES ) do
           begin
                cbLanguage.Items.Add( '<a><span class="flag-icon flag-icon-' + ARRAY_LANGUAGES_FLAGS[i] + '"></span>' + ' ' + ARRAY_LANGUAGES[i] + '</a>' );

                if ( ARRAY_LANGUAGES[i] = mm.CONFIG_LANGUAGE ) then
                   f := i;
           end;
           cbLanguage.ItemIndex := f-1;
           cbLanguage.Text := dm_rc.rc_StripHtmlTags( cbLanguage.Text );
           labFlag.Hint     := '[[cls:flag-icon flag-icon-' + ARRAY_LANGUAGES_FLAGS[f] + ']]';
        end;
        paFlag.Hint := '[[' + varIIF( mm.RTL, 'round:r', 'round:l' ) + ']]';//6.0.0.1
        //rc_RenderLayout( Self, true, false, false, true, true, true );//7.5.0.0 login
        // adjust colors
        //7.5.0.0 login
        paLogo.Color   := StringToColor( mm.CONFIG_LAYOUT_LOGIN_COLOR );
        if ( ( varI_LoginModel = 3 ) or ( varI_LoginModel = 4 ) ) and ( mm.CONFIG_LOGIN_BG_IMAGE_EXTRA = 'ON' ) then
           paLogo.Color   := clWhite
        else
        if ( ( varI_LoginModel = 6 ) or ( varI_LoginModel = 7 ) ) and ( mm.CONFIG_LAYOUT_LOGIN_BG_SOLID = 'OFF' ) then
        begin
           rc_AddCssClass( paLogo, 'rc-gradient-dark-to-color-crud' );
           rc_AddCssClass( paImgBG_LoginForm, 'rc-gradient-dark-to-color-crud' );
        end
        else
        if ( ( varI_LoginModel = 6 ) or ( varI_LoginModel = 7 ) ) then
        begin
           paImgBG_LoginForm.Hint := StringReplace( paImgBG_LoginForm.Hint, ']]', '', [rfReplaceAll] );
           paImgBG_LoginForm.Hint := paImgBG_LoginForm.Hint + '|cls:bg-white]]';
           rc_AddCssClass( paWelcomeBox, 'bg-themecrud' );
        end;
        rc_RenderLayout( Self, true, false, false, true, true, true );//7.5.0.0 login
        //6.1.0.2
        //labAppVersion.Caption := 'v.' + FileVersion + ' [ ' + mm.CONFIG_APP_TYPE + ' ]';
        labAppVersion.Caption := 'v.' + APP_NAME_VERSION + ' [ ' + mm.CONFIG_APP_TYPE + ' ]';

        labCopyright.Caption  := '(C) 2019-' +  YearOf( date ).ToString + ' by ' + SOFTWAREHOUSE_NAME;
        if ( FileExists( sm.FilesFolderPath + 'images' + mm.BACKSLASH + 'logo_login.png' ) ) then
        begin
           //6.0.0.1
           //imgLogo.Picture.LoadFromFile( sm.FilesFolderPath +  'images' + mm.BACKSLASH + 'logo_login.png' );
           //[PT] se vc quiser evitar o cache do browser pode usar dessa forma:
           //[EN] If you want to avoid the browser cache you can use this way:
           rc_UrlImgNoCache( imgLogo, 'files/images' + mm.BACKSLASH + 'logo_login.png' );
        end;
     end;
     edUserName.SetFocus;//8.0.0.0
end;

procedure TfrmLogin.UniLoginFormReady(Sender: TObject);
begin
     rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
     rc_ConfigTranslateMessages;
end;

initialization
  RegisterAppFormClass(TfrmLogin);

end.
