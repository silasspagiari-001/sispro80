unit MainModule;//6.1.0.4( SQLConn.ConnectedStoreUsage > All false )

interface
//8.0.0.0
uses
  uniGUIMainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniGUITypes,
  uniGUIJSUtils,
  uniGUIForm,
  uniGUIFrame,
  uniGUIApplication,//8.0.0.0
  UniGUIVars,       //8.0.0.0
  UniEdit,
  UniDBGrid,
  uniPageControl,
  RTTI,
  Vcl.Graphics,
  System.IOUtils, //7.3.0.0
  System.SysUtils,
  System.Classes,
  System.Types,
  System.StrUtils,
  System.IniFiles,
  uconsts,
  uconsts_cfg,
  //feedback: Mesut from Turkey to Linux( 6.0.0.0 )
  {$ifdef MSWINDOWS}
  Vcl.AppEvnts,
  {$endif }
  uniTimer,

  FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.DApt, FireDAC.Phys.PGDef, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL,
  FireDAC.Phys.PG, FireDAC.Phys.IBBase, FireDAC.Comp.DataSet, FireDAC.VCLUI.Error;

type
    tpPermissions = ( tpAccess, tpRegister, tpEdit, tpDelete );
    TUniPlatforms = set of TUniPlatform;

type
  //[PT] para controle do menu dinâmico
  //[EN] for dynamic menu control
  rgSide_Menu = record
                  Option           : string;
                  Table            : string;
                  Form             : string;//8.0.0.0
                  FormName         : string;//8.5.0.0
                  Image            : string;
                  Icon             : string;
                  Badge            : string; //8.0.0.0
                  BasicCrud        : string; //8.0.0.0
                  Permission       : string;
                  RestrictionField : string;
                  Hidden           : Boolean;
                  AskNew           : Boolean;
                  GenIDOnInsert    : Boolean;
                  NoGenID          : Boolean;
                  Modal            : Boolean;
                  CloseBtn         : Boolean;
                  NotShow          : Boolean;
                  Master           : Boolean;
                  Tag              : string;
                  GetThisPK        : string;
                  PKZerosLeft      : Boolean;
                  HideMaskOff      : Boolean;
                end;
  //[PT] Para uso com rc_ShowInputBoxCustom
  //[EN] For use with rc_ShowInputBoxCustom
  rgInputBoxCustom = record
                  QuestionID       : integer; //8.0.0.0
                  CompType         : TRCIBCComponent;
                  CompTypeAttr     : string;
                  CompLabel        : string;
                  CompLabelAttr    : string;
                  CompDefaultValue : variant;
                  CompValue        : variant;
                  LabelHeight      : integer;//8.0.0.0
                end;
  Tmm = class(TUniGUIMainModule)
    SQLConn: TFDConnection;
    FDTransaction: TFDTransaction;
    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure UniGUIMainModuleBrowserClose(Sender: TObject);
    procedure UniGUIMainModuleSessionTimeout(ASession: TObject; var ExtendTimeOut: Integer);
    procedure SQLConnRecover(ASender, AInitiator: TObject; AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
    procedure UniGUIMainModuleBeforeLogin(Sender: TObject; var Handled: Boolean);
    procedure UniGUIMainModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    // 6.0.0.0
    { Public declarations }
    //[PT] variaveis para gravar informações do usuário ao logar
    //[EN] variables to record user information when logging in
    vUserLoginTimeStamp:TDateTime;
    vUserBrowserType,
    vUserBrowserVersion,
    vUserPublicIP , //7.3.0.0
    vUSer_SO,
    vUserEmail,
    vUserName,vUserMaster:String;
    vLatitude,
    vLongitude : Double;
    uPlat: TUniPlatforms;
    //[PT] a escolha de usar GLOBAIS no controle de configurações gerais se deu por 2 motivos:
    //      1 - Fica compatível para todos( nao dependendo de DBX, FireDac etc( devido as versões do RadCORE BASE e STARTER que não usam Banco de Dados
    //      2 - VELOCIDADE no acesso as informações
    //[EN] the choice to use GLOBALS in controlling general settings was made for 2 reasons:
    //      1 - It is compatible for everyone (not depending on DBX, FireDac etc (due to the versions of RadCORE BASE and STARTER that do not use Database
    //      2 - SPEED when accessing information
    varLT_Lang : TRCLanguagesType;
    FServerExternalData : TServerExternalData; //7.3.0.0
    // rc_Anim TimeLine
    varC_RCAnimTimeLine,
    // email config
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER              ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_HOST         ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SMTP_PORT    ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_USER         ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_PASS         ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_CONFIRMATION ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_THREAD       ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_TLS          ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SSL          ,
    // Theme / Config / Translate Control
    CONFIG_LANGUAGE,         // active language
    // 6.0.0.0
    // DEFAULT APP DATA FILES PATH
    CONFIG_APP_DATA_FOLDER, BACKSLASH,//7.3.0.0
    CONFIG_APP_BUTTON_NOFOCUS, // 7.0.0.0 nofocus
    // rc_TRANSLATE MESSAGES
    //
    // config bschk / bsswt.. ou qualquer situação de retorno
    // config bschk / bsswt .. or any return situation
    //
    //[PT] A função "rc_ConfigTranslateMessages" é usada para fazer a tradução para cada idioma em que a aplicação está sendo executada.
    //      Em vez de usar explicitamente as letras para SIM ou NÃO do seu idioma, você pode usar "VALUE_YES" ou "VALUE_NO"
    //[EN] The "rc_ConfigTranslateMessages" function is used to perform the translation for each language in which the application is running.
    //      Instead of explicitly using the letters for YES or NO from your language, you can use "VALUE_YES" or "VALUE_NO"
    VALUE_YES,  // Y   S
    VALUE_NO,   // N   N
    // internal messages
    LAB_STATE_I,
    LAB_STATE_E,
    LAB_STATE_B,
    MSG_LOADING_DATA,
    MSG_CONTACT_SUPPORT,
    MSG_APP_LOCKED,
    MSG_UPLOAD_FAIL,
    MSG_CONFIRM_DELETE,
    MSG_CONFIRM_DELETE_ALL,
    MSG_CONTINUE_REGISTERING,
    MSG_SUCCESS_POST,
    MSG_SUCCESS_DELETE,
    MSG_USER_DO_NOT_HAVE_ACCESS,
    MSG_USER_SUPERIOR_PERMISSION,
    MSG_USER_MASTER_PERMISSION,
    MSG_USER_RELEASE_PASSWORD,
    MSG_NEW_USER_REGISTERED,
    MSG_RESOURCE_IN_DEVELOPMENT,
    MSG_PASSWORD_RESET,
    MSG_PASSWORD_TEMP,
    MSG_PASSWORD_TEMP_SENT,
    MSG_REGISTER_NEW,
    MSG_CONFIRMATION_CODE,
    MSG_EMAIL_DO_NOT_REPLY,
    MSG_EMAIL_ALREADY_EXISTS, // 6.0.0.0
    // frmBaseCRUD
    ARRAY_BASICS_FLD_ID_NAME              ,
    ARRAY_BASICS_FLD_DESCRIPTION_NAME     ,
    ARRAY_BASICS_FLD_ID_ALIAS             ,
    ARRAY_BASICS_FLD_DESCRIPTION_ALIAS    ,
    ARRAY_BASICS_FLD_ID_LABEL             ,
    ARRAY_BASICS_FLD_DESCRIPTION_LABEL    ,
    MSG_FIELD_NAME_CODE,
    MSG_FIELD_NAME_DESCRIPTION,
    //
    MSG_RECORDS,
    MSG_RECORD_NOT_FOUND,
    MSG_SEARCH_CONDICIONAL_AND,
    MSG_SEARCH_CONDICIONAL_OR,
    // translate menu group names
    MNU_STATE ,
    MNU_BASICS,
    MNU_MOVEMENT,
    MNU_REPORT,
    MNU_TOOLS,
    MNU_TOOLS_USERS   ,
    MNU_TOOLS_SETTINGS,
    MNU_TOOLS_VERSIONS,
    MNU_TOOLS_UPDATE  ,
    // translate menu options //deprecated with new RC TRANSLATE for MENUS //6.0.0.0
    MNU_OTHERS,
    MNU_OTHERS_TRAINNING,
    MNU_OTHERS_SUPPORT,
    MNU_OTHERS_VIDEOS,
    MNU_OTHERS_GENERAL_INFO,
    MNU_OTHERS_OPEN_TICKET,
    // translate error messages
    // translate bsAlert..Message types
    MSG_INFO,
    MSG_WARNING,
    MSG_DANGER,
    MSG_SUCCESS,
    MSG_ERROR,
    MSG_YES,
    MSG_NO,
    MSG_RESTART,
    MSG_OPEN_TICKET,
    MSG_CANCEL,
    MSG_CONTINUE,
    MSG_OK,
    MSG_CONFIRM,
    MSG_INVALID,
    MSG_DATETYPE,
    MSG_WELCOME,
    MSG_DELETE,
    MSG_USER,
    //8.0.0.0 inputbox custom forms
    MSG_SELECT_AN_OPTION                ,

    // date period search option( in frmBaseCRUD and frmBaseReportMenu )
    MSG_DATE_INTERVALS_TODAY            ,
    MSG_DATE_INTERVALS_YESTERDAY        ,
    MSG_DATE_INTERVALS_BEFORE_YESTERDAY ,
    MSG_DATE_INTERVALS_TOMORROW         ,
    MSG_DATE_INTERVALS_AFTER_TOMORROW   ,
    MSG_DATE_INTERVALS_THIS_WEEK        ,
    MSG_DATE_INTERVALS_LAST_WEEK        ,
    MSG_DATE_INTERVALS_NEXT_WEEK        ,
    MSG_DATE_INTERVALS_THIS_FORTNIGHT   ,
    MSG_DATE_INTERVALS_LAST_FORTNIGHT   ,
    MSG_DATE_INTERVALS_NEXT_FORTNIGHT   ,
    MSG_DATE_INTERVALS_THIS_MONTH       ,
    MSG_DATE_INTERVALS_LAST_MONTH       ,
    MSG_DATE_INTERVALS_NEXT_MONTH       ,
    MSG_DATE_INTERVALS_THIS_BIMESTER    ,
    MSG_DATE_INTERVALS_THIS_QUARTER     ,
    MSG_DATE_INTERVALS_THIS_SEMESTER    ,
    MSG_DATE_INTERVALS_THIS_YEAR        ,
    MSG_DATE_INTERVALS_LAST_YEAR        ,
    MSG_DATE_INTERVALS_ALL              ,
    MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  ,
    // mkm_validate messages
    MSG_VALIDATE_INVALID_EXISTS,
    MSG_VALIDATE_INVALID_VALUE,
    MSG_VALIDATE_BLANK_FIELD,
    MSG_VALIDATE_OR_BLANK_CONTENT,
    MSG_VALIDATE_PASSWORD,
    MSG_VALIDATE_LENGTH_MIN,
    MSG_VALIDATE_LENGTH_MAX,
    // error / warning messages
    MSG_SELECT_VALID_RECORD,
    MSG_COMPANY_SELECT,
    MSG_COMPANY_USER_OTHER,
    MSG_BUGERROR_REGISTER_REQUEST,
    MSG_INVALID_LOGIN,
    MSG_INVALID_USER,
    MSG_INVALID_EMAIL,
    MSG_INVALID_PASSWORD,
    MSG_ADMIN_OR_MASTER_PASSWORD, //7.3.0.0
    MSG_TABLE_DO_NOT_EXIST,
    MSG_FIELD_DO_NOT_EXIST, // 6.0.0.0
    MSG_BUGERROR_REGISTER_CAN_NOT_DELETE,
    MSG_BUGERROR_REGISTER_IN_USE,
    MSG_BUGERROR_COM_SERVER_FAIL,
    MSG_BUGERROR_MENU_DO_NOT_EXIST,
    MSG_BUGERROR_MAX_TAB_OPENED,
    MSG_BUGERROR_WITHOUT_PARENT_TO_SHOW,
    MSG_BUGERROR_POST,
    MSG_BUGERROR_INVALID_CONTENT,
    MSG_BUGERROR_PK_SEQUENCE,
    MSG_BUGERROR_OPEN_QUERY,
    MSG_BUGERROR_CLOSE_QUERY,
    MSG_BUGERROR_DEFAULT_SQL_STATMENT,
    MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC,
    MSG_BUGERROR_INVALID_SEARCH_OPERATOR,
    MSG_BUGERROR_INCOMPATIBLE_SGBD,
    MSG_BUGERROR_FOREIGN_KEY_DELETE,
    // permission control
    MSG_ACCESS_TO,
    MSG_ACCESS_INSERT_TO,
    MSG_ACCESS_EDIT_TO,
    MSG_ACCESS_DELETE_TO,
    MSG_ACCESS_SEARCH_TO,
    MSG_ACCESS_MOVE_TO,
    // layout config
    CONFIG_LAYOUT_KEYBOARD_VIRTUAL_ON_MOBILE,
    CONFIG_LAYOUT_KEYBOARD_SCROLL_ON_MOBILE,
    CONFIG_LAYOUT_KEYBOARD_VIRTUAL_ON_DESKTOP, // 6.0.0.0
    CONFIG_LAYOUT_HIDE_TABS_ON_MOBILE,
    CONFIG_LAYOUT_HIDE_TOPPANEL_ON_MOBILE,
    CONFIG_LAYOUT_GRID_TITLE_BOLD,
    CONFIG_LAYOUT_GRID_TITLE_UPPER,
    CONFIG_LAYOUT_GRID_COLUMN_SEPARATOR,
    CONFIG_LAYOUT_GRID_RC_PAGINATOR,
    CONFIG_LAYOUT_GRID_ROW_HEIGHT,
    CONFIG_LAYOUT_GRID_TITLE_HEIGHT,//7.5.0.0
    CONFIG_LAYOUT_GRID_TITLE_BG,
    CONFIG_LAYOUT_GRID_TITLE_COLOR,
    CONFIG_LAYOUT_GRID_TITLE_BG_OVER,
    CONFIG_LAYOUT_GRID_TITLE_COLOR_OVER,
    CONFIG_LAYOUT_GRID_TITLE_COLOR_ICON,
    //8.0.0.0 light theme
    CONFIG_LAYOUT_GRID_TITLE_BG_LIGHT,
    CONFIG_LAYOUT_GRID_TITLE_COLOR_LIGHT,
    CONFIG_LAYOUT_GRID_TITLE_BG_OVER_LIGHT,
    CONFIG_LAYOUT_GRID_TITLE_COLOR_OVER_LIGHT,
    CONFIG_LAYOUT_GRID_TITLE_COLOR_ICON_LIGHT,

    CONFIG_LAYOUT_GRID_TITLE_FONT_SIZE, // 6.0.0.0 //[PT] se for igual a zero, usa o q está no componente / [EN] if it is equal to zero, use what is in the component
    CONFIG_LAYOUT_GRID_FONT_SIZE,       // 6.0.0.0 //[PT] se for igual a zero, usa o q está no componente / [EN] if it is equal to zero, use what is in the component
    CONFIG_LAYOUT_LOADMASK_TYPE,
    CONFIG_LAYOUT_LOADMASK_IMG,
    CONFIG_LAYOUT_SCROLLBAR_SIZE,
    CONFIG_LAYOUT_SCROLLBAR_MOBILE_OFF, // 6.0.0.0
    CONFIG_LAYOUT_ACTIVE_THEME,
    CONFIG_LAYOUT_USER_BG,
    CONFIG_LAYOUT_LINK_COLOR,
    CONFIG_LAYOUT_LINKHOVER_COLOR,
    CONFIG_LAYOUT_BG_COLOR,
    CONFIG_LAYOUT_LABEL_COLOR,
    CONFIG_LAYOUT_LABEL_WRAP,
    CONFIG_LAYOUT_LABEL_WEIGHT,
    CONFIG_LAYOUT_LABEL_FORMS_DEFAULT ,
    CONFIG_LAYOUT_GRIDBLOCK_OFFSET,
    CONFIG_LAYOUT_GRIDBLOCK_ANIM,
    CONFIG_LAYOUT_ANIM_EFFECTS,//7.4.0.0 turn on/off all forms..msgs...animations
    CONFIG_LAYOUT_MENUFONT_SIZE,
    CONFIG_LAYOUT_MENU_WIDTH, //7.5.0.0 menu
    CONFIG_LAYOUT_MENU_TEXT_WIDTH, //7.5.0.0 menu
    CONFIG_LAYOUT_MENU_LINE_HEIGHT, //7.5.0.0 menu
    CONFIG_LAYOUT_MENU_LOGO_BG_COLOR       ,
    CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR       ,
    CONFIG_LAYOUT_MENU_TYPE       ,
    CONFIG_LAYOUT_MENU_TYPE_AUTOCLOSE , //6.0.0.0+menu micro
    CONFIG_LAYOUT_MENU_CALL_ANIM, //7.3.0.0
    CONFIG_LAYOUT_ROUND_FORM,
    CONFIG_LAYOUT_ROUND_EDIT,
    CONFIG_LAYOUT_ROUND_EDIT_FACTOR,
    CONFIG_LAYOUT_ROUND_PANEL_FACTOR,
    CONFIG_LAYOUT_ROUND_BTN_FACTOR,
    CONFIG_LAYOUT_TAB_BACKGROUND_DEFAULT,
    CONFIG_LAYOUT_TAB_COLOR_FOCUS       ,
    CONFIG_LAYOUT_TAB_COLOR_HOVER       ,
    CONFIG_LAYOUT_TAB_MAX_OPENED        ,
    CONFIG_LAYOUT_TAB_OFF               ,
    CONFIG_LAYOUT_TAB_BUTTONS           , // 6.0.0.0
    CONFIG_LAYOUT_TAB_THEME_BORDER      , // 6.0.0.0
    CONFIG_LAYOUT_TAB_BORDER_OFF        , // 6.0.0.0
    CONFIG_LAYOUT_APP_FONT       ,
    CONFIG_LAYOUT_APPLY_FONT_ALL,
    CONFIG_LAYOUT_FONTAWS , //8.2.0.0 CONFIG_LAYOUT_FONTAWS6 , //6.0.0.0+fontaws6
    CONFIG_LAYOUT_BSICONS, //8.2.0.0
    CONFIG_LAYOUT_MENU_COLOR       ,
    CONFIG_LAYOUT_MENUFONT_COLOR   ,
    CONFIG_LAYOUT_MENUFONT_COLOR_GROUP ,
    CONFIG_LAYOUT_LOGIN_COLOR      ,
    CONFIG_LAYOUT_LOGIN_BG_SOLID   , //7.5.0.0 login
    CONFIG_LAYOUT_BUTTON_COLOR,
    CONFIG_LAYOUT_BUTTON_COLOR_CRUD,
    CONFIG_LAYOUT_BUTTON_COLOR_HOVER,
    CONFIG_LAYOUT_BUTTON_COLOR_CRUD_HOVER,
    CONFIG_LAYOUT_GRID_SEL_COLOR ,
    CONFIG_LAYOUT_EDIT_COLOR       ,
    CONFIG_LAYOUT_EDIT_BORDER_COLOR       , //7.0.0.0
    CONFIG_LAYOUT_EDIT_FONT_COLOR  ,
    CONFIG_LAYOUT_EDIT_COLOR_READONLY       ,
    CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY  ,
    CONFIG_LAYOUT_EDIT_COLOR_TRIGGER       ,
    CONFIG_LAYOUT_EDIT_FONT_COLOR_TRIGGER  ,
    CONFIG_LAYOUT_EDIT_FOCUS_COLOR ,
    CONFIG_LAYOUT_EDIT_FOCUS_ACTIVE ,//8.0.0.0
    CONFIG_LAYOUT_LOOKUP_THEMED ,//8.0.0.0
    CONFIG_LAYOUT_EDLKP_COLOR ,
    CONFIG_LAYOUT_EDLKP_FOCUS_COLOR,
    CONFIG_LAYOUT_EDLKP_FONT_COLOR     : string ;
    // arrays
    ARRAY_MONTH_NAMES   : Array [1 .. 12] of String ;
    ARRAY_WEEKEND_NAMES : Array [1 .. 7]  of String ;
    // general config
    CONFIG_RC_GUIDETOUR, // 6.0.0.0
    CONFIG_RC_TRANSLATE : string; // 6.0.0.0
    CONFIG_SESSION_LOG : boolean;
    //[PT] Controle de sessão / [EN]Session Control
    //8.0.0.0
    CONFIG_SESSION_TIMEOUT,
    CONFIG_AJAX_TIMEOUT : Integer;
    // app general config
    CONFIG_APP_TYPE, CONFIG_APP_SUBTYPE: string;
    // currency config
    CONFIG_CURRENCY_SYMBOL,
    CONFIG_CURRENCY_NAME,
    CONFIG_CURRENCY_NAME_PLURAL,
    // database config
    CONFIG_DATABASE_API          , // 6.0.0.0
    CONFIG_DATABASE      ,
    DATABASE_ACTIVE,
    CONFIG_DATABASE_HOST_IP      , // DEFAULT BD SERVER
    CONFIG_DATABASE_PASSWORD     ,
    CONFIG_DATABASE_USERNAME     ,
    CONFIG_DATABASE_HOST_IP_API  , // SERVER RDW/HORSE/DMVC etc 6.0.0.0
    CONFIG_DATABASE_PASSWORD_API , //  6.0.0.0
    CONFIG_DATABASE_USERNAME_API , //  6.0.0.0
    CONFIG_DATABASE_NAME_API     , //  6.0.0.0
    CONFIG_DATABASE_NAME : string;
    CONFIG_DATABASE_PORT,
    CONFIG_DATABASE_PORT_API : Integer ; //  6.0.0.0
    // login config
    CONFIG_LOGIN_MODEL,              // 1, 2, 3, 4
    CONFIG_LOGIN_LANGUAGE,           // Y N
    CONFIG_LOGIN_WELCOMEBOX,         // Y N
    CONFIG_LOGIN_BG_FIXED,           // Y N
    CONFIG_LOGIN_BG_VIDEO,           // Y N
    CONFIG_LOGIN_BG_IMAGE,           // Y N
    CONFIG_LOGIN_BG_IMAGE_EXTRA,     // Y N
    CONFIG_LOGIN_BG_IMAGE_INVERTED: string ; // Y N
    // ------------------------------
    //[PT] calcular tempo / [EN] calculate time
    varDW_LastTick: DWORD;
    //[PT] para o retorno InputBOX / [EN] for the return of InputBOX
    varC_InputBox_Result1,
    varC_InputBox_Result2,
    varC_InputBox_Result3: String;

    varC_GridColName,
    varC_UserPassAdmin : String;

    varC_MenuGroupID,//8.4.0.3
    varC_MenuGroup : string;
    //[PT] armazenamento das opções do menu dinâmico
    //[EN] storage of dynamic menu options
    varA_MenuBasics,
    varA_MenuMovement,
    varA_MenuReport,
    varA_MenuTools,
    varA_MenuOptions : array of String;
    //[PT] armazenamento das opções do menu dinâmico para controle de permissão
    //[EN] storage of dynamic menu options to permission control
    varA_MenuBasicsPermissions,
    varA_MenuMovementPermissions,
    varA_MenuReportPermissions,
    varA_MenuToolsPermissions,
    varA_MenuOptionsPermissions,
    varA_FSideMenuPermissions  : array of String;
    //[PT] armazenamento das opções do menu dinâmico e seus respectivos parâmetros
    //[EN] storage of dynamic menu options and their respective parameters
    varA_FSideMenu   : array of rgSide_Menu;
    //[PT] Para uso com rc_ShowInputBoxCustom
    //[EN] For use with rc_ShowInputBoxCustom
    varA_FInputBoxCustom : array of rgInputBoxCustom; //
    // 6.0.0.0
    varA_BeforeDelete : array of string;
    //8.5.0.0
    //no crud padrão, ao deletar um registro, se a tabela tiver tabela detalhes com FK
    //estas tabelas serão excluidas antes do registro mestre
    varB_DeleteFKs : boolean;

    varI_NumMenu     : integer;
    varI_NumMenuPermissions : integer;
    varC_InvalidDate,
    varC_InvalidDateObj,
    varC_CustomMsg : string ;
    //[PT] pagecontrol principal do MainForm para exibição dos nomes dos forms/frames abertos
    //[EN] MainForm's main pagecontrol to display the names of open forms/frames
    oPgGeneral : TUniPageControl;
    //
    varB_LoginProcessed,
    varB_RCFoldersMissing,
    varB_DefaulPageBar,
    //[PT] informação da plataforma/dispositivo/tela atual que está rodando a aplicação
    //[EN] information about the current platform/device/screen running the application
    varB_iOS,
    varB_Android,
    varB_Desktop,
    varB_Tablet,
    varB_Screen_LandScape,
    varB_Mobile_Screen,
    varB_Mobile_Screen_Portrait,
    varB_Mobile_Screen_Landscape,
    varB_Resizing : Boolean;
    varC_Platform : string; // 6.0.0.0
    varI_BlockWidth,
    varI_ScreenWidth,
    varI_ScreenHeight : Integer;
    //[PT] string lists para uso com sentenças html
    //[EN] string lists for use with html sentences
    varSL_TagParams,
    varSL_HtmlMenu,
    varSL_HtmlPage : TStringList;
    //[PT] Para uso como TRUE / FALSE
    //[EN] For use as TRUE / FALSE
    varB_Yes,
    varB_No,
    //[PT] Indica que acesso aos dados direto ao Banco de Dados ou por API( como RDW, HORSE, DMVC ... )
    //[EN] Indicates that access to data directly from the Database or via API (such as RDW, HORSE, DMVC ... )
    // true : FireDac / UniDac ...
    // false: RestDataWare / Horse...
    varB_IsNot_API : boolean;
    //[PT] para uso em um possível controle de licenças/uso da aplicação
    //[EN] for use in possible control of licenses/use of the application
    varC_Blocked,
    varC_Locked,
    varC_Password : string;
    varB_APP_Locked,
    varB_APP_Blocked,
    varB_APP_Demo     : Boolean;
    varI_Device_Licences : integer;
    varB_RunLogin : boolean; //7.4.0.0 run login
    //[PT] para uso no controle de permissões/muiti empresa
    //[EN] for use in controlling permissions/many companies
    varC_NameSalesMan,
    varC_User,
    varC_User_Avatar,
    varC_CompanyName : string;
    varI_CodeSalesMan : integer;
    varC_Doc_Customer : string;
    varI_Code_Company,
    varI_Code_CompanyMain,
    varI_User : Integer;
    //[PT] sinalizar processos efetuados de gravacao / alteracao / exclusao
    //[EN] signal recording / alteration / deletion processes
    varB_Processed,
    varB_OperationProcessed : Boolean;
    //[PT] para uso em controle de períodos de datas em consultas, relatórios...
    //[EN] for use in controlling date periods in queries, reports...
    varD_DtIni,
    varD_DtEnd : TDateTime;
    varI_Month1,
    varI_Day1,
    varI_Year1,
    varI_Month2,
    varI_Day2,
    varI_Year2: Word;
    varW_Year,
    varW_Month,
    varW_Day: Word;
    varI_Day,
    varI_Month,
    varI_Year : integer;
    //[PT] CURRENCYs/Floats, Integers e Strings para uso genérico em funções/procedures. Não use para controle global a não ser que seja explicitamente indicado.
    //[EN] CURRENCYs/Floats, Integers e Strings for generic use in functions/procedures. Do not use for global control unless explicitly stated.
    varF_TempFloat1,
    varF_TempFloat2,
    varF_TempFloat3,
    varF_TempFloat4,
    varF_TempFloat: Extended;
    varI_Temp1,
    varI_Temp2,
    varI_Temp3,
    varI_Temp4,
    varI_Temp5,
    //[PT] controlar o fluxo de abas pra nao estourar os limites da tela
    //[EN] control the flow of tabs so as not to overflow the screen boundaries
    varI_TabIni,
    varI_TabEnd : Integer ;
    varC_FormsInParent,
    varC_Temp1,
    varC_Temp2,
    varC_Temp3,
    varC_Temp4,
    varC_Temp5,
    varC_TempLink,
    varC_TempString,
    varC_TempFile,

    varC_JSNAME_HTMLFRAME,
    APP_SQL_DATE_FORMAT,

    //[PT] controle de caminhos padrão
    //[EN] default path control
    APP_PATH_FILES_GLOBAL,
    APP_PATH_IMAGES_GLOBAL,
    APP_PATH_CSS_GLOBAL,
    APP_PATH_JS_GLOBAL,
    APP_PATH_COMPANY,
    APP_PATH_APPS,
    APP_PATH_SYSTEM,
    APP_PATH_HELP,
    APP_PATH_DATA,
    APP_PATH_CERTIFICATES,
    APP_PATH_BD,
    APP_PATH_BUGERRORS,
    APP_PATH_UPLOADS,
    APP_PATH_DOWNLOADS,
    APP_PATH_CONTROL,
    APP_PATH_MENUS,
    APP_PATH_IMAGES,
    //[PT] Para uso em mensagens de erro
    //[EN] For use in error messages
    varC_ErrorMsg,
    varC_SQLERROR,
    varC_LastProcFuncError,
    varC_UltSQLErro,
    varC_LastErrorMsg : string;
    varI_ApplyUpdateErrors : Integer;
    //[PT] Para controle de posicionamento dinâmico de componentes
    //[EN] For dynamic component positioning control
    varI_PosX, varI_PosY , varI_PosH, varI_PosW : integer;
    //[PT] para controle permissão de usuarios
    //[EN] to control user permissions
    varC_User_Permissions : string;
    //[PT] para uso em máscaras / to use in masks
    varC_Mask_Date,
    varC_Mask_Time,
    varC_Mask_Phone,
    varC_Mask_Phone8,
    varC_Mask_Phone_ddd10,
    varC_Mask_Phone_ddd11,
    varC_Mask_cnpj,
    varC_Mask_cpf,
    varC_Mask_cep,
    varC_Mask_float,
    varC_Mask_Integer : string;
    // STRINGS
    varC_SourceForm: string;


    //  SISPRO

    //********************************************//
    //NOTA ENTRADA
    //********************************************//
    varS_LOTENOTAENTRADA       : string;
    varS_PUREZANOTAENTRADA,
    varS_VCNOTAENTRADA,
    varS_GERMINACAONOTAENTRADA : Real;

    varI_Code_Lote_Lotesemente    : string;
    varI_Code_Lote_Boletimsemente : string;
    varI_Code_Lote_Termosemente   : string;
    varI_Code_Lote_Produto        : Integer;

    varI_Tabela_Form   : string;

    //********************************************//
    //CAMPO PRODUCAO
    //********************************************//
    varC_COOPERANTE,
    varC_PRODUTO  : Integer;
    varC_CAMPO,
    varC_SAFRACAMPO,
    varC_CULTIVAR :string;

    vari_calculodesonerado : string; //ENXERTO 3.0→8.0: flag ICMS desonerado ('T'/'F') - FrmNOTAELETRONICA

    varE_numero_entrega,
    varE_documento_entrega,
    varE_sequencia_entrega,
    varE_produto_entrega   :Integer;
    varBPI_TIPOBUSCA    : string;
    varCD_PRODUTOENTREGA: Integer;
    varCD_CODIGOENTREGA : Integer;
    varI_Code_Empresa_Configuranota   : integer;

    varI_Code_Pessoa_historico    : Integer;
    //********************************************//
    varI_Code_Documento_pesosaco  : Real;
    varI_Code_codigo_Documento    : integer;
    varI_Code_Numero_Documento    : integer;
    varI_Code_Pessoa_Documento    : integer;
    varI_Code_Documento_Documento : integer;
    varI_Code_Documento_sequencia : integer;
    varI_Code_Documento_Controle  : integer;
    varI_Code_documento_serie     : string;
    varV_Valor_Documento          : Real;
    varI_Code_Codigo_Semente      : integer;
    varI_Code_pessoa_cheque       : integer;
    varI_Code_Documento_statusdup : string;
    //********************************************//
    varS_SenhaExclusaoNota_permitido  : string;
    //********************************************//
    varSR_Dataini,varSR_Datafin,varSR_tipo : string;
    varA_relatorio                         : string;

    varR_Value_BASEICMS,
    varR_Value_VALORICMS,
    varR_Value_VLRPRODUTOS,
    varR_Value_VLRTOTAL     : Real;
    varR_Value_Pessoa       : Integer;

    varR_value_NUMERONOTAENTRADA,
    varR_value_EMISSAONOTAENTRADA,
    varR_value_CHAVEACESSOENTRADA : string;
    //********************************************//
    M_FASTREPORT,
    M_PATHIMPRESSAO,
    M_IMAGEM,
    M_PATHXML,
    M_TIPOPESO : string;
    //********************************************//
    // TRANSPORTADORA - ENTREGA
    //********************************************//
    varT_code_transportadora : integer;
    varT_code_nome_transportadora,
    varT_code_tipo_transportadora,
    varT_code_cep_entrega,
    varT_code_ibge_entrega,
    varT_code_endereco_entrega,
    varT_code_numero_entrega,
    varT_code_bairro_entrega,
    varT_code_cidade_entrega,
    varT_code_estado_entrega : string;
    //********************************************//
    // TIPO FINANCEIRO - PARCELAS
    //********************************************//
    varFP_id_parcela         : string;
    //********************************************//
    // TIPO FINANCEIRO - PARCELAS
    //********************************************//
    varTTLOG_CODIGO           : string;
    varTTLOG_TABELA           : string;
    //********************************************//
    varTTIPO_SUP_SENHA        : string;
    AllowTerminate            : Boolean;
    //********************************************//
    varPermissao_codigo       : integer;
    varPermissao_Nome         : string;
    //********************************************//
    varTXTXML_ENTRADA         : string;
    varCONFIRMATXTXMLENTRADA  : boolean;
    varcI_protocolo : integer;

    varB_BENEPRODUTO,
    varB_BENELOTE,
    varB_BENEBOLETIM : string;
    varB_BENEPUREZA,
    varB_BENEGERMINACAO,
    varB_BENEVC :Real;
    //********************************************//
    //********************************************//
    //CONSULTA CNPJ
    //********************************************//
    varCNPJ_SN:string;
    varCNPJ_NOME,varCNPJ_FANTASIA,varCNPJ_CEP,varCNPJ_ENDERECO,varCNPJ_NUMERO,
    varCNPJ_BAIRRO,varCNPJ_COMPLEMENTO,varCNPJ_CIDADE,varCNPJ_IBGE,varCNPJ_UF,varCNPJ_CNPJ,
    varCNPJ_EMAIL : string;
    //********************************************//
    //CONSULTA ENTREGAS
    //********************************************//
    var_ENTREGA_NUMERO        :Integer;
    var_ENTREGA_EMISSAO       :TDateTime;
    var_ENTREGA_NOMEFORNECEDOR:string;
    var_ENTREGA_VALORTOTAL    :Real;

    //********************************************//
    //CHEQUES
    //********************************************//
    varC_cheques_codigo:integer;
    //********************************************//
    //TRANSFERE NOTAS P/ROMANEIO
    //********************************************//
    varT_notasromaneio:TStringList;

    vari_User_RT:integer;
    vari_user_RTR:string;

    //********************************************//
    //TERMO DE COLETA
    //********************************************//
    vars_TERMO_CERTIFICADOR,
    vars_TERMO_PRODUTOR,
    vars_TERMO_REEMBALADOR,
    vars_TERMO_PUREZA,
    vars_TERMO_GERMINACAO,
    vars_TERMO_VIABILIDADE,
    vars_TERMO_PERCRETPENEIRA,
    vars_TERMO_PMS,
    vars_TERMO_GERENVPRECOCE,
    vars_TERMO_NOCIVAS    :string;
    vars_TERMO_NUMEROTERMO:string;
    vars_TERMO_SEQTERMO   :integer;
    //********************************************//
    //********************************************//
    //PRODUCAO LOTE
    //********************************************//
    varV_totalkg,
    varV_custokg,
    varV_totalponto,
    varV_custoponto :Real;
    //********************************************//
    //PRODUCAO INTERNA
    //********************************************//
    varM_CODIGOMESTRE   : Integer;
    //ENTREGA FUTURA NOTA
    //********************************************//
    varI_Code_CODVEF    : integer;
    //********************************************//
    //TITULOS ANEXO
    //********************************************//
    varI_Code_TITULOSANEXOS_ID    : integer;
    varcI_code_planosub           : string;
    varC_idanexotitulosfinanceiro : string;

    //********************************************//
    //VENDEDORES NOTA E DEMAIS
    //********************************************//
    varC_vendedorstatus           : string;

    // FINAL



    varC_SelectedItem_FSideMenu : string ;
    // esses campos sao atualizados na funcao ATUALIZA_DetailS dos forms MESTRE/DETALHE
    varC_Table_Detail,
    varC_LinkedFormFrame : string;
    //[PT] para uso nos CRUDs
    //[EN] for use in CRUDs
    varC_Where,
    varC_WhereExtra,
    varC_Order,
    varC_FieldMasks,
    //FORM( frame padrao/PAI )
    varC_SearchWhere,
    varC_SearchOrder,
    varC_FormSource_Search,
    varC_Selected_FormFrame,
    varC_StatusSearch,
    // FORM( DETAIL )
    varC_SearchWhere_Detail,
    varC_SearchOrder_Detail,
    varC_FormSource_Search_Detail,
    varC_Selected_FormFrame_Detail,
    varC_StatusSearch_Detail,
    //[PT] controle captura chave primária dinamica
    //[EN] control captures dynamic primary key
    varC_PK_MasterTable ,
    varC_PK_DetailTable,
    varC_Field_PK,
    varC_Table_Search,
    varC_Search_Fields : String;
    varC_Code_ID_Field : string ;
    varC_Form_Master   : TUniForm;

    varC_Frame_ReportMenu ,
    varC_Frame_Master  : TUniFrame;
    varC_Form_Modal,
    varC_Form_Detail   : TUniForm;

    varI_Form_Detail_Left,
    varI_Form_Detail_Top : integer;

    varC_SQL_GENERIC,
    varC_ContentField,
    varC_FieldName,
    varC_FieldType : String;
    //[PT] para uso do lookup dinâmico
    //[EN] to use dynamic lookup
    varI_FrmLookUpTag : integer; // 6.0.0.0
    varC_SelectedItem_LookUp,
    varC_Lookup_Code,
    varC_Code_ID : string;
    varC_SQL_Default_LookUps : string;
    Active_Component : TComponent;

    //********************************************//
    //********************************************//
    //CONSULTA CNPJ
    //********************************************//

    // para as buscas do FORM DA PESQUISA
    varC_codigo_busca       : string;
    varC_codigo_busca_lote  : string;
    varC_referencia_busca   : string;
    varC_referencia_produto : string;


    //[PT] para uso do "guide tour"
    //[EN]to use with "guide tour"
    varI_GuideTourSeq : Integer;
    varC_caminhopdf    : string;
    VarC_Atelagenerica : string;
    procedure Seta_Busca(Const F_TABELA:string);

    public

      procedure rc_InitLayoutThemes; // 6.0.0.0
      procedure rc_CreateCadBasicsData; // 6.0.0.0
  end;

function mm: Tmm;

const
     //8.0.0.0
     BS_COMPONENTS = 'bschk bsswt bsrgp bstabs bspills bsh1 bsh2 bsh3 bsh4 bsh5 bsh6 bsqrcode bscarousel bsvideo bsimg ' +
                     'bsalert bsalert-r oldbsalert oldbsalertcaption rcalert rcalert-r oldrcalert oldrcalertcaption rcfeature rcfeature-r oldrcfeature oldrcfeaturecaption ';
     ANTI_SQLINJECTION = '? ; --';

implementation

{$R *.dfm}

//8.0.0.0
uses
  ServerModule, mkm_func_web, str_func, untdm_rc, Main, mkm_restfuncs, Login;

function mm: Tmm;
begin
  Result := Tmm(UniApplication.UniMainModule)
end;
// 6.0.0.0
procedure Tmm.rc_CreateCadBasicsData;
var
   inifile : Tinifile;
begin
     try
        IniFile := TiniFile.Create( sm.FilesFolderPath + StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] ) + '_frmCadBASICS_cfg.ini' );
        //MSG STRINGS
        IniFile.WriteString( 'config_BR' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
        IniFile.WriteString( 'config_BR' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
        // aliases / grid columns
        IniFile.WriteString( 'config_BR' , 'FLD_ID_ALIAS'             , 'CÓDIGO' );
        IniFile.WriteString( 'config_BR' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIÇÃO' );
        IniFile.WriteString( 'config_BR' , 'FLD_ID_LABEL'             , 'CÓDIGO' );
        IniFile.WriteString( 'config_BR' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIÇÃO' );
        IniFile.WriteString( 'config_BR' , 'FLD_ID_LABEL'             , 'Código' );
        IniFile.WriteString( 'config_BR' , 'FLD_ID_DESCRIPTION_LABEL' , 'Descrição' );

        IniFile.WriteString( 'config_EN' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
        IniFile.WriteString( 'config_EN' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
        // aliases / grid columns
        IniFile.WriteString( 'config_EN' , 'FLD_ID_ALIAS'             , 'ID' );
        IniFile.WriteString( 'config_EN' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIPTION' );
        IniFile.WriteString( 'config_EN' , 'FLD_ID_LABEL'             , 'ID' );
        IniFile.WriteString( 'config_EN' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIPTION' );
        IniFile.WriteString( 'config_EN' , 'FLD_ID_LABEL'             , 'Id' );
        IniFile.WriteString( 'config_EN' , 'FLD_ID_DESCRIPTION_LABEL' , 'Description' );

        IniFile.WriteString( 'config_ES' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
        IniFile.WriteString( 'config_ES' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
        // aliases / grid columns
        IniFile.WriteString( 'config_ES' , 'FLD_ID_ALIAS'             , 'CÓDIGO' );
        IniFile.WriteString( 'config_ES' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIÇÃO' );
        IniFile.WriteString( 'config_ES' , 'FLD_ID_LABEL'             , 'CÓDIGO' );
        IniFile.WriteString( 'config_ES' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIÇÃO' );
        IniFile.WriteString( 'config_ES' , 'FLD_ID_LABEL'             , 'Código' );
        IniFile.WriteString( 'config_ES' , 'FLD_ID_DESCRIPTION_LABEL' , 'Descrição' );

        IniFile.WriteString( 'config_FR' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
        IniFile.WriteString( 'config_FR' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
        // aliases / grid columns
        IniFile.WriteString( 'config_FR' , 'FLD_ID_ALIAS'             , 'CÓDIGO' );
        IniFile.WriteString( 'config_FR' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIPCIÓN' );
        IniFile.WriteString( 'config_FR' , 'FLD_ID_LABEL'             , 'CÓDIGO' );
        IniFile.WriteString( 'config_FR' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIPCIÓN' );
        IniFile.WriteString( 'config_FR' , 'FLD_ID_LABEL'             , 'Código' );
        IniFile.WriteString( 'config_FR' , 'FLD_ID_DESCRIPTION_LABEL' , 'Descripción' );

        IniFile.WriteString( 'config_DE' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
        IniFile.WriteString( 'config_DE' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
        // aliases / grid columns
        IniFile.WriteString( 'config_DE' , 'FLD_ID_ALIAS'             , 'CODE' );
        IniFile.WriteString( 'config_DE' , 'FLD_ID_DESCRIPTION_ALIAS' , 'BESCHREIBUNG' );
        IniFile.WriteString( 'config_DE' , 'FLD_ID_LABEL'             , 'CODE' );
        IniFile.WriteString( 'config_DE' , 'FLD_ID_DESCRIPTION_LABEL' , 'BESCHREIBUNG' );
        IniFile.WriteString( 'config_DE' , 'FLD_ID_LABEL'             , 'Code' );
        IniFile.WriteString( 'config_DE' , 'FLD_ID_DESCRIPTION_LABEL' , 'Beschreibung' );

        IniFile.WriteString( 'config_IT' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
        IniFile.WriteString( 'config_IT' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
        // aliases / grid columns
        IniFile.WriteString( 'config_IT' , 'FLD_ID_ALIAS'             , 'CODICE' );
        IniFile.WriteString( 'config_IT' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIZIONE' );
        IniFile.WriteString( 'config_IT' , 'FLD_ID_LABEL'             , 'CODICE' );
        IniFile.WriteString( 'config_IT' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIZIONE' );
        IniFile.WriteString( 'config_IT' , 'FLD_ID_LABEL'             , 'Codice' );
        IniFile.WriteString( 'config_IT' , 'FLD_ID_DESCRIPTION_LABEL' , 'Descrizione' );

        IniFile.WriteString( 'config_TR' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
        IniFile.WriteString( 'config_TR' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
        // aliases / grid columns
        IniFile.WriteString( 'config_TR' , 'FLD_ID_ALIAS'             , 'KOD' );
        IniFile.WriteString( 'config_TR' , 'FLD_ID_DESCRIPTION_ALIAS' , 'TANIM' );
        IniFile.WriteString( 'config_TR' , 'FLD_ID_LABEL'             , 'KOD' );
        IniFile.WriteString( 'config_TR' , 'FLD_ID_DESCRIPTION_LABEL' , 'TANIM' );
        IniFile.WriteString( 'config_TR' , 'FLD_ID_LABEL'             , 'Kod' );
        IniFile.WriteString( 'config_TR' , 'FLD_ID_DESCRIPTION_LABEL' , 'Tanim' );

        IniFile.WriteString( 'config_RU' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
        IniFile.WriteString( 'config_RU' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
        // aliases / grid columns
        IniFile.WriteString( 'config_RU' , 'FLD_ID_ALIAS'             , 'КОД' );
        IniFile.WriteString( 'config_RU' , 'FLD_ID_DESCRIPTION_ALIAS' , 'ОПИСАНИЕ' );
        IniFile.WriteString( 'config_RU' , 'FLD_ID_LABEL'             , 'КОД' );
        IniFile.WriteString( 'config_RU' , 'FLD_ID_DESCRIPTION_LABEL' , 'ОПИСАНИЕ' );
        IniFile.WriteString( 'config_RU' , 'FLD_ID_LABEL'             , 'Код' );
        IniFile.WriteString( 'config_RU' , 'FLD_ID_DESCRIPTION_LABEL' , 'Описание' );

        IniFile.WriteString( 'config_CH' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
        IniFile.WriteString( 'config_CH' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
        // aliases / grid columns
        IniFile.WriteString( 'config_CH' , 'FLD_ID_ALIAS'             , 'ID' );
        IniFile.WriteString( 'config_CH' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIPTION' );
        IniFile.WriteString( 'config_CH' , 'FLD_ID_LABEL'             , 'ID' );
        IniFile.WriteString( 'config_CH' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIPTION' );
        IniFile.WriteString( 'config_CH' , 'FLD_ID_LABEL'             , 'Id' );
        IniFile.WriteString( 'config_CH' , 'FLD_ID_DESCRIPTION_LABEL' , 'Description' );

        IniFile.WriteString( 'config_ID' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
        IniFile.WriteString( 'config_ID' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
        // aliases / grid columns
        IniFile.WriteString( 'config_ID' , 'FLD_ID_ALIAS'             , 'ID' );
        IniFile.WriteString( 'config_ID' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIPTION' );
        IniFile.WriteString( 'config_ID' , 'FLD_ID_LABEL'             , 'ID' );
        IniFile.WriteString( 'config_ID' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIPTION' );
        IniFile.WriteString( 'config_ID' , 'FLD_ID_LABEL'             , 'Id' );
        IniFile.WriteString( 'config_ID' , 'FLD_ID_DESCRIPTION_LABEL' , 'Description' );

        IniFile.WriteString( 'config_TH' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
        IniFile.WriteString( 'config_TH' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
        // aliases / grid columns
        IniFile.WriteString( 'config_TH' , 'FLD_ID_ALIAS'             , 'ID' );
        IniFile.WriteString( 'config_TH' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIPTION' );
        IniFile.WriteString( 'config_TH' , 'FLD_ID_LABEL'             , 'ID' );
        IniFile.WriteString( 'config_TH' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIPTION' );
        IniFile.WriteString( 'config_TH' , 'FLD_ID_LABEL'             , 'Id' );
        IniFile.WriteString( 'config_TH' , 'FLD_ID_DESCRIPTION_LABEL' , 'Description' );

        IniFile.WriteString( 'config_IN' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
        IniFile.WriteString( 'config_IN' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
        // aliases / grid columns
        IniFile.WriteString( 'config_IN' , 'FLD_ID_ALIAS'             , 'ID' );
        IniFile.WriteString( 'config_IN' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIPTION' );
        IniFile.WriteString( 'config_IN' , 'FLD_ID_LABEL'             , 'ID' );
        IniFile.WriteString( 'config_IN' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIPTION' );
        IniFile.WriteString( 'config_IN' , 'FLD_ID_LABEL'             , 'Id' );
        IniFile.WriteString( 'config_IN' , 'FLD_ID_DESCRIPTION_LABEL' , 'Description' );

        IniFile.WriteString( 'config_SA' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
        IniFile.WriteString( 'config_SA' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
        // aliases / grid columns
        IniFile.WriteString( 'config_SA' , 'FLD_ID_ALIAS'             , 'ID' );
        IniFile.WriteString( 'config_SA' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIPTION' );
        IniFile.WriteString( 'config_SA' , 'FLD_ID_LABEL'             , 'ID' );
        IniFile.WriteString( 'config_SA' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIPTION' );
        IniFile.WriteString( 'config_SA' , 'FLD_ID_LABEL'             , 'Id' );
        IniFile.WriteString( 'config_SA' , 'FLD_ID_DESCRIPTION_LABEL' , 'Description' );

     finally
       IniFile.Free;
     end;
end;
//7.5.0.3 lowercase
procedure Tmm.rc_InitLayoutThemes;
Var
   pNum         : Integer;
   pImgBgLogin : string;
   Inifile : TIniFile;
begin
     pNum := dm_rc.rc_LoadConfig;

     dm_rc.rc_LoadTheme( mm.CONFIG_LAYOUT_ACTIVE_THEME );

     if mm.CONFIG_LOGIN_BG_FIXED = 'ON' then pNum := 1;

     pImgBgLogin := APP_PATH_IMAGES_GLOBAL + lowercase( CONFIG_APP_TYPE ) + mm.BACKSLASH + pNum.ToString + '.jpg';

     if CONFIG_APP_SUBTYPE <> '' then
        pImgBgLogin := APP_PATH_IMAGES_GLOBAL + lowercase( CONFIG_APP_TYPE ) + mm.BACKSLASH + lowercase( CONFIG_APP_SUBTYPE ) + mm.BACKSLASH + pNum.ToString + '.jpg';

     if not FileExists(pImgBgLogin) then
     begin
       pNum := 1;
       pImgBgLogin := APP_PATH_IMAGES_GLOBAL + lowercase( CONFIG_APP_TYPE ) + mm.BACKSLASH + pNum.ToString + '.jpg';

       if CONFIG_APP_SUBTYPE <> '' then
          pImgBgLogin := APP_PATH_IMAGES_GLOBAL + lowercase( CONFIG_APP_TYPE ) + mm.BACKSLASH + lowercase( CONFIG_APP_SUBTYPE ) + mm.BACKSLASH + pNum.ToString + '.jpg';
     end;
     pImgBgLogin := StringReplace( pImgBgLogin, '\', '/', [rfReplaceAll] );
     if ( FileExists( pImgBgLogin ) ) and ( ( Pos( '.png', pImgBgLogin ) > 0 ) or ( Pos( '.jpg', pImgBgLogin ) > 0 ) )then
     begin
        mm.varC_Temp1 := pImgBgLogin;
     end;
     //[PT] Ult. Seq. de Imagem de background no LOGIN
     //[EN] Last Seq. of Background image in LOGIN
     try
       IniFile := TiniFile.Create( sm.FilesFolderPath + StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] ) + '_cfg.ini' );
       IniFile.WriteString( 'App', 'loginBg', pNum.ToString);
     finally
       IniFile.Free;
     end;
     //[PT] criar o arq. de config. para o frmCadBASICS
     //[EN] create the frmCadBASICS config file
     if not FileExists( sm.FilesFolderPath + StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] ) + '_frmCadBASICS_cfg.ini' ) then
     begin
        rc_CreateCadBasicsData;
     end;
end;

procedure Tmm.SQLConnRecover(ASender, AInitiator: TObject;
  AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
begin
     // cancelar conexões
     //
     // AAction := faOfflineAbort;
end;
//7.4.0.0 run login
procedure Tmm.UniGUIMainModuleBeforeLogin(Sender: TObject;
  var Handled: Boolean);
begin
   if not varB_RunLogin then
   begin
      Handled := true;

      dm_rc.rc_ProcessFirstConnection;

      //default vars...
      mm.varC_Blocked         := mm.VALUE_NO;  //dm_rc.CUSTOMER_LICENCE.FieldByName( 'bloqueado').AsString;
      mm.varC_Locked          := mm.VALUE_NO;  //dm_rc.CUSTOMER_LICENCE.FieldByName( 'travado').AsString;
      mm.varI_Device_Licences := 1;            //dm_rc.CUSTOMER_LICENCE.FieldByName( 'licencas').AsInteger;
      // SELECIONAR EMPRESA / SELECT COMPANY
      mm.varI_Code_Company     := 1;//dm_rc.sqlCompanies.FieldByName('codigo').AsInteger;
      mm.varC_CompanyName      := '';//dm_rc.sqlCompanies.FieldByName('descricao').AsString;
      mm.varI_Code_CompanyMain := mm.varI_Code_Company;//dm_rc.sqlCompanies.FieldByName('Codigo').AsInteger;
      mm.varC_Doc_Customer     := 'app_data';//dm_rc.sqlCompanies.FieldByName('cnpj').AsString;
      mm.vUserEmail          := '';//dm_rc.memUsers.FieldByName('email').AsString;
      mm.vUserName           := '';//dm_rc.memUsers.FieldByName('nome').AsString;
      mm.vUserLoginTimeStamp := Now;
      mm.varC_User_Avatar    := '';//dm_rc.memUsers.FieldByName('avatar').AsString;
      mm.varI_User           := 0;//dm_rc.memUsers.FieldByName('Codigo').AsInteger;
      mm.varC_NameSalesMan   := mm.vUserName;
      mm.varI_CodeSalesMan   := 0;//dm_rc.memUsers.FieldByName('Codifunc').AsInteger;
      UniSession.UserString  := mm.vUserEmail; //to Monitoring user identify
   end;
end;

procedure Tmm.UniGUIMainModuleBrowserClose(Sender: TObject);
begin
     UniSession.Log( '>>> mm.UniGUIMainModuleBrowserClose' );

     dm_rc.rc_CloseQuerys( dm_rc, True, False );
     dm_rc.rc_CloseQuerys( Self, True, True );
end;
// 6.0.0.0
procedure Tmm.UniGUIMainModuleCreate(Sender: TObject);
Var
   pNum         : Integer;
   cUserId, ImgBgLogin : string; //8.0.0.0
   Inifile : TIniFile;
begin
     //8.0.0.0 incompatibilidade ao criar projeto com DELPHI 11> e acessar o projeto em DELPHI anterior( thanks for Mr VAGNER )
     //OldCreateOrder := True;
     //8.0.0.0
     //UrlParams?
     //http://localhost:8075/?userId=01
     //http://localhost:8075/?module=pos
     cUserId := UniSession.UniApplication.Parameters.Values['userId'];
     varB_RunLogin := cUserId = '';
     //8.4.0.1 change to UniLogin FormCreate
     //Try
     //   FServerExternalData := rc_GetExternalData( ); //7.3.0.0 from http://forums.unigui.com/index.php?/topic/10748-remote-informations/&do=findComment&comment=162451
     //Except
     //End;
     mm.BACKSLASH        := TPath.DirectorySeparatorChar;

     Theme := 'triton.modified'; // default radcore theme compatibility // 'uni_carbon_triton'; // maybe future implementation DARK MODE
     //Master User Pass( check uconst.pas )
     mm.varC_UserPassAdmin := USER_ADMIN_PASS;

     mm.Active_Component := nil;
     Inifile := nil;

     APP_PATH_FILES_GLOBAL   := sm.FilesFolderPath;
     APP_PATH_IMAGES_GLOBAL  := APP_PATH_FILES_GLOBAL + 'images' + mm.BACKSLASH;
     APP_PATH_CSS_GLOBAL     := APP_PATH_FILES_GLOBAL + 'css' + mm.BACKSLASH;
     APP_PATH_JS_GLOBAL      := APP_PATH_FILES_GLOBAL + 'js' + mm.BACKSLASH;

     varB_RCFoldersMissing   := false;

     SQLConn.Connected := False;

     //[PT] faz a aplicacao se comportar "como uma VCL"
     //[EN] makes the application behave "like a VCL"
     EnableSynchronousOperations  := True;

     //8.0.0.0
     //[PT] para melhorar 'responsividade' com mobile
     //[EN] to improve 'responsiveness' with mobile
     DesktopViewport.UserScalable := False;// ZOOM disabled
     DesktopViewport.MaximumScale := 1;    // ZOOM disabled
     DesktopViewport.InitialScale := 1;

     //[PT] Desabilitar F5 pra impedir REFRESH do usuario
     //[EN] Disable F5 to prevent user REFRESH
     // MainModule.mm.DocumentKeyOptions := [dkDisableF5];

     //[PT] Desabilitar Button direito do mouse para impedir a visualizacao do 'fonte'
     //[EN] Disable right mouse button to prevent 'source' from being viewed
     {$IFDEF RELEASE}
     // in DESIGNTIME, just...
     BrowserOptions := [boDisableMouseRightClick, boDisableChromeRefresh];
     // in RUNTIME without compiler directives( $IFDEF RELEASE )...
         //if mm.BrowserOptions = [] then
//         begin
//           mm.BrowserOptions := [boDisableMouseRightClick, boDisableChromeRefresh];
//           UniSession.AddJS('document.oncontextmenu = document.body.oncontextmenu = function () { return false; }');
////         end
////         else
////         begin
////           mm.BrowserOptions := [];
////           UniSession.AddJS('document.oncontextmenu = document.body.oncontextmenu = function () { return true; }');
//         end;
     dm_rc.rc_ProtectForm( Self );
     {$ENDIF}
     //[PT] datamodules serao criados apenas quando ACIONADOS ?
     //[EN] datamodules will only be created when ACTIVATED?
     ApplicationDataModuleOptions.CreateOnDemand := False;

     varI_GuideTourSeq := 0;

     varC_Mask_Date               := '!99/99/9999;1; ';
     varC_Mask_Time               := '!99:99;1; ';
     varC_Mask_Phone              := '99999\-9999;0; ';
     varC_Mask_Phone8             := '9999\-9999;0; ';
     varC_Mask_Phone_ddd10        := '\(99\)9999\-9999;0; ';
     varC_Mask_Phone_ddd11        := '\(99\)99999\-9999;0; ';
     varC_Mask_cnpj               := '99\.999\.999\/9999\-99;0; ';
     varC_Mask_cpf                := '999\.999\.999\-99;0; ';
     varC_Mask_cep                := '99\.999\-999;0; ';
     //varC_Mask_float              := '999.999.999,9999;0; ';  // check dm_rc.rc_LoadTheme
     varC_Mask_Integer            := '99999999999 ';//'99999999999;0; ';

     //[PT] tipo de aplicação. a principio, as telas de login mudam de acordo com o tipo e você pode criar regras internas para
     //     exibir/ocultar conteúdos de acordo com o tipo da aplicação
     //[EN] type of application. In principle, login screens change according to type and you can create internal rules to
     //
     // default  - DEFAULT
     // ofc      - CENTRO AUTOMOTIVO | AUTOMOTIVE CENTER
     // otc      - ÓTICAS | OPTICS
     // confec   - CONFECÇÕES | CLOTHES STORE
     // pet      - PET SHOP
     // distrib  - DISTRIBUIDORAS | DISTRIBUTORS
     // glp      - REVENDAS DE GLP/ÁGUA  | LPG/WATER RESALE
     // body     - CLÍNICA DE ESTÉTICA | AESTHETIC CLINIC
     // food     - BAR E RESTAURANTE | BAR AND RESTAURANT
     // info     - INFORMÁTICA / ASSIST. TÉCNICA  | COMPUTER TECHNOLOGY / SERVICES
     // hair     - SALÃO DE BELEZA | BEAUTY SALON
     // educa    - EDUCAÇÃO | EDUCATION
     // hospital - HOSPITAL | HOSPITAL
     CONFIG_APP_TYPE           := 'default';
     CONFIG_APP_SUBTYPE        := '';
     // 6.0.0.0
     //pNum := dm_rc.rc_LoadConfig;
     dm_rc.rc_GetDeviceType;
     rc_InitLayoutThemes;
     (*<prj-nologin>*)//mm.varB_OperationProcessed := dm_rc.rc_ProcessFirstConnection;
end;

procedure Tmm.UniGUIMainModuleDestroy(Sender: TObject);
begin
     UniSession.Log( '>>> mm.UniGUIMainModuleDestroy:' + DateTimeToStr( now ) );
end;

procedure Tmm.UniGUIMainModuleSessionTimeout(ASession: TObject;
  var ExtendTimeOut: Integer);
begin
     UniSession.Log( '>>> mm.UniGUIMainModuleSessionTimeout' + DateTimeToStr( now ) );
     ExtendTimeOut := mm.CONFIG_SESSION_TIMEOUT;//1800000;// 600000; // 6.0.0.0
end;

procedure Tmm.Seta_Busca(Const F_TABELA:string);
var
Buscar : TUniform ;
begin
  varC_referencia_busca := F_TABELA;
end;

initialization
  RegisterMainModuleClass(Tmm);

end.
