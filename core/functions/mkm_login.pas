unit mkm_login;//7.3.0.2

interface

uses
    System.SysUtils, System.Classes , System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils, System.IOUtils, //7.3.0.2
    // feedback: Mesut from Turkey
    {$ifdef MSWINDOWS}
    Winapi.Windows,
    {$endif}
    math, System.Rtti, System.StrUtils, Vcl.Graphics, Data.Db,
    UniGuiClasses, uniGUIApplication;

procedure rc_GetDefaultUserInfo;
procedure rc_GetDefaultBrowserInfo;
procedure rc_GetDefaultPaths( pCreate:boolean; pDoc:string );

implementation

uses uconsts, uconsts_cfg,  untdm_rc, str_func, MainModule, ServerModule, mkm_func_web; // 6.0.0.0

procedure rc_GetDefaultUserInfo;
begin
   mm.vUserEmail            := 'mikromundo@gmail.com';
   mm.vUserName             := 'radcoreadmin';
   //mm.vPass                 := mm.varC_UserPassAdmin; 
   mm.vUserLoginTimeStamp   := Now;
   mm.varC_User_Avatar      := 'C:\inetpub\wwwroot\radcore\files\images\avatars\avatar_4.png'; //6.0.0.0
   mm.varI_User             := 1;
   mm.varC_NameSalesMan     := mm.varC_USer;
   mm.varI_CodeSalesMan     := 0;;
   // default company info
   mm.varI_Code_Company     := 1;
   mm.varI_Code_CompanyMain := 1;
   mm.varC_CompanyName      := SOFTWAREHOUSE_NAME;
   // Aqui capturamos o DOCUMENTO DA EMPRESA selecionada no LOGIN para controle de licença.
   // No Brasil usamos o CNPJ, você poderá ajustar de acordo com seu controle ou até mesmo remover e fazer seu próprio controle de licença.
   //
   // Here we capture the COMPANY DOCUMENT selected in the LOGIN for license control.
   // In Brazil we use the CNPJ, you can adjust according to your control or even remove and make your own license control.
   mm.varC_Doc_Customer := SOFTWAREHOUSE_CNPJ;
   // as variáveis abaixo serão criticadas no ACESSO as telas/forms, ao CADASTRAR, ALTERAR, EXCLUIR etc
   // the variables below will be criticized in ACCESS the screens / forms, when REGISTERING, CHANGING, DELETING etc.
   mm.varC_Blocked         := mm.VALUE_NO;
   mm.varC_Locked          := mm.VALUE_NO;
   mm.varI_Device_Licences := 3;

   mm.varB_Processed := True;
end;

procedure rc_GetDefaultBrowserInfo;
var
  CI : TUniClientInfoRec;
begin
   // get browser info
   CI := UniApplication.ClientInfoRec;
   mm.vUserBrowserType    := CI.BrowserType;
   mm.vUserBrowserVersion := IntToStr( CI.BrowserVersion );
   mm.vUSer_SO            := CI.OSType;
end;
// 6.0.0.0
//[PT] aqui são criadas pastas que serão usadas na aplicação.
//     algumas pastas são específicas para documentos usados no Brasil mas isso não gera conflitos.
//     o objetivo é concentrar e organizar dados diversos na pasta de cada empresa que faz o login.
//[EN] folders are created here that will be used in the application.
//     some folders are specific to documents used in Brazil but this does not generate conflicts.
//     the objective is to concentrate and organize diverse data in the folder of each company that logs in.
procedure rc_GetDefaultPaths( pCreate:boolean; pDoc:string );
var
   i,r : integer;
begin
   mm.BACKSLASH             := TPath.DirectorySeparatorChar;// '/'; //7.3.0.0
   mm.APP_PATH_HELP         := lowercase( sm.FilesFolderPath + 'help_files' + mm.BACKSLASH ); // if you want put them here
   mm.APP_PATH_COMPANY      := lowercase( sm.FilesFolderPath + RemoveInvalidChar( pDoc )  + mm.BACKSLASH ); // 6.0.0.0
   mm.APP_PATH_APPS         := lowercase( mm.APP_PATH_COMPANY);
   mm.APP_PATH_SYSTEM       := lowercase( mm.APP_PATH_COMPANY);
   //mm.APP_PATH_HELP         := mm.APP_PATH_COMPANY + 'help' + mm.BACKSLASH ;
   //mm.APP_PATH_DATA         := sm.FilesFolderPath + 'data' + mm.BACKSLASH ;
   mm.APP_PATH_CERTIFICATES := lowercase( mm.APP_PATH_COMPANY + 'certificates' + mm.BACKSLASH );
   mm.APP_PATH_BUGERRORS    := lowercase( mm.APP_PATH_COMPANY + 'errors' + mm.BACKSLASH );
   mm.APP_PATH_UPLOADS      := lowercase( mm.APP_PATH_COMPANY + 'uploads' + mm.BACKSLASH );
   mm.APP_PATH_DOWNLOADS    := lowercase( mm.APP_PATH_COMPANY + 'downloads' + mm.BACKSLASH );
   mm.APP_PATH_CONTROL      := lowercase( mm.APP_PATH_COMPANY + 'cfg' + mm.BACKSLASH );
   mm.APP_PATH_MENUS        := lowercase( mm.APP_PATH_COMPANY + 'menus' + mm.BACKSLASH );
   mm.APP_PATH_IMAGES       := lowercase( mm.APP_PATH_COMPANY + 'images' + mm.BACKSLASH );

   if pCreate then
   begin
      If not DirectoryExists ( sm.FilesFolderPath + 'guide-tour' ) then
         MkDir( sm.FilesFolderPath + 'guide-tour' );
      If not DirectoryExists ( mm.APP_PATH_COMPANY ) then
         MkDir( mm.APP_PATH_COMPANY );
      If not DirectoryExists ( mm.APP_PATH_APPS ) then
         MkDir( mm.APP_PATH_APPS );
      If not DirectoryExists ( mm.APP_PATH_SYSTEM ) then
         MkDir( mm.APP_PATH_SYSTEM );
      If not DirectoryExists ( mm.APP_PATH_HELP ) then
         MkDir( mm.APP_PATH_HELP );
      //If not DirectoryExists ( lowercase( mm.APP_PATH_DATA ) ) then
      //   MkDir( mm.APP_PATH_DATA );
      If not DirectoryExists ( mm.APP_PATH_CERTIFICATES ) then
         MkDir( mm.APP_PATH_CERTIFICATES );
      If not DirectoryExists ( mm.APP_PATH_BUGERRORS ) then
         MkDir( mm.APP_PATH_BUGERRORS );
      If not DirectoryExists ( mm.APP_PATH_UPLOADS ) then
         MkDir( mm.APP_PATH_UPLOADS );
      If not DirectoryExists ( mm.APP_PATH_DOWNLOADS ) then
         MkDir( mm.APP_PATH_DOWNLOADS );
      If not DirectoryExists ( mm.APP_PATH_CONTROL ) then
         MkDir( mm.APP_PATH_CONTROL );
      If not DirectoryExists ( mm.APP_PATH_MENUS ) then
         MkDir( mm.APP_PATH_MENUS );
      If not DirectoryExists ( mm.APP_PATH_IMAGES ) then
         MkDir( mm.APP_PATH_IMAGES );

      I := Length( ARRAY_COMPANY_TYPE );
      for r := 1 to I do
          If not DirectoryExists ( lowercase( mm.APP_PATH_IMAGES + Copy( ARRAY_COMPANY_TYPE[ r ] , 1 , Pos( '-' , ARRAY_COMPANY_TYPE[ r ] ) - 1 ) ) ) then
             MkDir( lowercase(mm.APP_PATH_IMAGES + Copy( ARRAY_COMPANY_TYPE[ r ] , 1 , Pos( '-' , ARRAY_COMPANY_TYPE[ r ] ) - 1 ) ) );

   end;
end;

end.
