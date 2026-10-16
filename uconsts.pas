unit uconsts;


interface

uses

  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

Type

  TRCRGPParamType  = ( rptSEQ, rptVALUE, rptFIELD );
  TRCValidateTypes = ( vtNotBlank, vtNumbers, vtLetters, vtEmail, vtIP, vtDATE, vtTIME, vtPASS, vtCNPJ, vtCPF, vtPIS, vtCEP, vtSQLI ); //7.1.0.0
  TRCMaskType      = ( mt_UNMASK, mt_CNPJ, mt_CPF, mt_PHONE, mt_PHONEDDD, mt_DATE, mt_CEP, mt_CARPLATE, mt_CARPLATE_BR ); //7.4.0.0
  TRCGraphType     = ( gtPIE, gtDOUGHNUT);
  TRCGraphColor    = ( gcRainbow, gcInferno, gcMagma, gcPurples, gcGreens, gcReds, gcRandom );
  TRCIBCComponent  = ( ibcEdit, ibcPass, ibcDate, ibcNumber, ibcFNumber, ibcMemo, ibcSpin, ibcCheckBox, ibcRadio, ibcComboBox ); //
                     //soon
                     //( ibcDBEdit, ibcDBPass, ibcDBDate, ibcDBNumber, ibcDBFNumber, ibcDBMemo, ibcDBCheckBox, ibcDBRadio, ibcDBComboBox ); //

  TRCGSAPEase      = ( gsEaseNone, gsEasePower1, gsEasePower2, gsEasePower3, gsEasePower4, gsEaseBack,
                       gsEaseElastic, gsEaseBounce, gsEaseRough, gsEaseSlow, gsEaseSteps, gsEaseCirc, gsEaseExpo, gsEaseSine );
  TRCGSAPEaseType  = ( gsEaseTypeIn, gsEaseTypeOut, gsEaseTypeInOut );

  // I'm trying to make rc_translate accessible to everyone. I cannot guarantee that the translations are perfect.
  // I appreciate your help in possible corrections of the text and / or additional translations.
  TRCLanguagesType = ( ltUNDEF,  // Can be used for another translate tool/component associated with an indexed string, for example: MNU[0] like tsLang...
                       ltpt_BR,  // Portuguese( Brazil )
                       ltpt_PT,  // Português Portugal
                       lten_US,  // English US
                       lten_GB,  // English BRITISH
                       ltes_ES,  // Spanish
                       ltfr_FR,  // French
                       ltde_DE,  // German
                       ltit_IT,  // Italian
                       lttr_TR,  // Turkish
                       ltru_RU,  // Russian
                       ltzn_CH,  // Chinese
                       ltin_ID,  // Indonesian
                       ltth_TH,  // Thailand
                       lthi_IN,  // Indian
                       ltar_SA      // Arabic
                       );

  TRCExportType    = ( etExcel, etHTML, etXML, etCSV );

  TRCAddFormParamType  = ( aftNone, aftShow, aftEdit, aftInsert, aftShowReg );

  TRCCalloutTheme  = (ctDefault, ctCartoon, ctFancyBlue, ctGray, ctYellow, ctDanger, ctWarning, ctSuccess, ctInfo);
  TRCCalloutArrow  = (carTop, carBottom, carRight, carRight_Top, carRight_Bottom, carLeft, carLeft_Top, carLeft_Bottom, carBottom_Right, carBottom_Left, carTop_Right, carTop_Left);
  TRCCalloutRelPos = (crpC_C, crpT_B, crpB_T, crpL_R, crpR_L, crpT_T, crpB_B, crpL_L, crpR_R, crpTR_BL, crpTL_BR, crpBL_TR, crpBR_TL);
  TRCBadgeType     = (bdgtDanger, bdgtWarning, bdgtSuccess, bdgtInfo);
  TRCSwtAlertType = ( swtSuccess, swtInfo, swtWarning, swtError, swtQuestion ) ; // 6.0.0.0
  // 6.0.0.0.
  TRCToastyTransition = ( ttrFade, ttrSlideLeftFade, ttrSlideLeftRightFade, ttrSlideRightFade, ttrSlideRightLeftFade, ttrSlideUpFade, ttrSlideUpDownFade, ttrSlideDownFade, ttrSlideDownUpFade, ttrPinItUp, ttrPinItDow );
  TRCToastyType = ( ttySuccess, ttyInfo, ttyWarning, ttyError, ttyQuestion ) ;
  TRCLookupTagType = ( lktString, lktInteger, lktInt64, lktDateTime, lktDate ) ;
  TRCListItemType = ( litDot, litSquare, litSquareRound, litDiamond, litIconFAWS, litBLANK ) ; //7.0.0.0
  //8.4.0.0
  TServerExternalData = record
                          ExternalIP      : String; {77.137.79.118}
//                          City            : String; {Tel Aviv}
//                          Region          : String; {Tel Aviv}
//                          Country         : String; {IL}
//                          Location        : String; {32.0809,34.7806}
//                          InternetCompany : String; {AS12849 Hot-Net internet services Ltd}
//                          TimeZone        : String; {Asia\/Jerusalem}
                          //new version
                          asn             : String; //"AS15169",
                          as_name         : String; //"Google LLC",
                          as_domain       : String; //"google.com",
                          country_code    : String; //"US",
                          country         : String; //"United States",
                          continent_code  : String; //"NA",
                          continent       : String; //"North America"


                        end;
//resourcestring


const

  ONLY_UPPERCASE                      = ['A' .. 'Z'];
  ONLY_LOWERCASE                      = ['a' .. 'z'];
  ONLY_NUMBERS                        = ['0' .. '9'];

  // 7.0.0.0 gridsystem
  GRID_COLS = 12; //16
  GRID_COLS_QUARTER = 3; //4
  //GRID_SYSTEM = 'BS';
  GRID_SYSTEM = 'RC';
  GRID_MAX_BLOCKS = 5000;
  GRID_BS_XS = 576;   // Extra small (xs)		      <  576
  GRID_BS_SM	=	768;   // Small (sm)			           >= 576 and < 768
  GRID_BS_MD	= 992;   // Medium (md)			          >= 768 and < 992
  GRID_BS_LG = 1200;  // Large (lg)			           >= 992 and < 1200
  GRID_BS_XL = 1400;  // Extra large (xl)		      >= 1200 and < 1400
  GRID_BS_XXL= 3840;  // Extra extra large (xxl)	>= 1400 and < 3840
  GRID_BS_4K	= 7680;  // 4k				                  >= 3840 and < 7680
  GRID_BS_8K = 7680;  // 8k                      >= 7680

  // REG EX
  RegEx_EMAIL = '\b^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$\b';
  RegEx_IP4   = '\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b';
  RegEx_IP6   = '\b((^|:)([0-9a-fA-F]{0,4})){1,8}$\b';
  RegEx_CEP   = '\b[0-9]{5}[\-]?[0-9]{3}\b';
  RegEx_PASS  = '\b(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$\b'; // min 8, upper e lower case, symbols and alphanum
  RegEx_GEO   = '\b-?\d{1,3}\.\d+\b';
  RegEx_ISBN  = '\b(?:(?=.{17}$)97[89][ -](?:[0-9]+[ -]){2}[0-9]+[ -][0-9]|97[89][0-9]{10}|(?=.{13}$)(?:[0-9]+[ -]){2}[0-9]+[ -][0-9Xx]|[0-9]{9}[0-9Xx])\b';
  RegEx_NUMBR = '\b[-+]?[0-9]*[.,]?[0-9]+\b';
  RegEX_ALPHA = '\b[a-zA-Z0-9]+\bg';

  // Controle windows/linux
  //{$IfDEF MSWINDOWS}
  //mm.BACKSLASH   = '\';
  //{$Else}
  //BACKSLASH   = '/'; //7.3.0.0
  //{$IfEnd}

  // cores padrão TCOLOR | TCOLOR standard colors
  DASHBOARD_BLK_COLOR1                = $004E9254; //green
  DASHBOARD_BLK_ICON_COLOR1           = $00407B4A;
  DASHBOARD_BLK_COLOR2                = $009C550E; //blue
  DASHBOARD_BLK_ICON_COLOR2           = $0081460C;
  DASHBOARD_BLK_COLOR3                = $004995E0; //orange
  DASHBOARD_BLK_ICON_COLOR3           = $002C73C0;
  DASHBOARD_BLK_COLOR4                = $001717A8; //red
  DASHBOARD_BLK_ICON_COLOR4           = $00111182;
  // radcore css colors
  COLOR_RED                           = $004545D6; //DANGER
  COLOR_BORDER_RED                    = $004545D6;
  COLOR_HOVER_RED                     = $006464DD;
  COLOR_GREEN                         = $00808040; //SUCCESS
  COLOR_BORDER_GREEN                  = $00808040;
  COLOR_HOVER_GREEN                   = $00B7B717;// $009A9A4E;
  COLOR_BLUE                          = $00C78E18; //INFO
  COLOR_BORDER_BLUE                   = $00C78E18;
  COLOR_HOVER_BLUE                    = $00E7AE3A;
  COLOR_BLUEDARK                      = $008B2F14;
  COLOR_BORDER_BLUEDARK               = $008B2F14;
  COLOR_HOVER_BLUEDARK                = $00C4421C;
  COLOR_ORANGE                        = $00378DE3; //WARNING
  COLOR_BORDER_ORANGE                 = $00378DE3;
  COLOR_HOVER_ORANGE                  = $0066A8EA;
  COLOR_ORANGEDARK                    = $000B68d8 ;//#d8680b;
  COLOR_BORDER_ORANGEDARK             = $00378DE3;
  COLOR_HOVER_ORANGEDARK              = $0066A8EA;
  COLOR_SILVER                        = $00BBBBBB;
  COLOR_BORDER_SILVER                 = $00BBBBBB;
  COLOR_HOVER_SILVER                  = $00D4D4D4;
  COLOR_GRAY                          = $00837074;
  COLOR_BORDER_GRAY                   = $00837074;
  COLOR_HOVER_GRAY                    = $0098878A;
  COLOR_DARK                          = $00292929;
  COLOR_BORDER_DARK                   = $00292929;
  COLOR_HOVER_DARK                    = $00484848;
  COLOR_PURPLE                        = $004f133f;//$00BA1B7E;//8.0.0.0
  COLOR_BORDER_PURPLE                 = $00EF87C0;
  COLOR_HOVER_PURPLE                  = $00EF87C0;

  COLOR_GRAY_DARK                     = $00343a40;
  COLOR_GRAY_100                      = $00f8f9fa;
  COLOR_GRAY_200                      = $00e9ecef;
  COLOR_GRAY_300                      = $00dee2e6;
  COLOR_GRAY_400                      = $00ced4da;
  COLOR_GRAY_500                      = $00adb5bd;
  COLOR_GRAY_600                      = $006c757d;
  COLOR_GRAY_700                      = $00495057;
  COLOR_GRAY_800                      = $00343a40;
  COLOR_GRAY_900                      = $00212529;
  COLOR_BLUE_INDIGO                   = $00ff0080;//$006610f2;//8.0.0.0
  COLOR_BLUE_CYAN                     = $000dcaf0;
  COLOR_PINK                          = $00d63384;
  COLOR_TEAL                          = $0020c997;
  COLOR_WHITE                         = $00ffffff;
  COLOR_BLACK                         = $00000000;
  COLOR_LIGHT                         = $00EFEFEF;
  // 6.0.0.0
  COLOR_GREEN_100                     = $00f8f9fa;
  COLOR_GREEN_200                     = $00e9ecef;
  COLOR_GREEN_300                     = $00dee2e6;
  COLOR_GREEN_400                     = $00ced4da;
  COLOR_GREEN_500                     = $00adb5bd;
  COLOR_RED_100                       = $00f8f9fa;
  COLOR_RED_200                       = $00e9ecef;
  COLOR_RED_300                       = $00dee2e6;
  COLOR_RED_400                       = $00ced4da;
  COLOR_RED_500                       = $00adb5bd;
  COLOR_BLUE_100                      = $00f8f9fa;
  COLOR_BLUE_200                      = $00e9ecef;
  COLOR_BLUE_300                      = $00dee2e6;
  COLOR_BLUE_400                      = $00ced4da;
  COLOR_BLUE_500                      = $00adb5bd;
  COLOR_PURPLE_100                    = $00f8f9fa;
  COLOR_PURPLE_200                    = $00e9ecef;
  COLOR_PURPLE_300                    = $00dee2e6;
  COLOR_PURPLE_400                    = $00ced4da;
  COLOR_PURPLE_500                    = $00adb5bd;
  COLOR_ORANGE_100                    = $00f8f9fa;
  COLOR_ORANGE_200                    = $00e9ecef;
  COLOR_ORANGE_300                    = $00dee2e6;
  COLOR_ORANGE_400                    = $00ced4da;
  COLOR_ORANGE_500                    = $00adb5bd;
  // 6.0.0.0
  // cores padrão web | web default colors
  color_bs_blue      =  '#0d6efd';
  color_bs_indigo    =  '#6610f2';
  color_bs_purple    =  '#6f42c1';
  color_bs_pink      =  '#d63384';
  color_bs_red       =  '#dc3545';
  color_bs_orange    =  '#fd7e14';
  color_bs_yellow    =  '#ffc107';
  color_bs_green     =  '#198754';
  color_bs_teal      =  '#20c997';
  color_bs_cyan      =  '#0dcaf0';
  color_bs_black     =  '#000';
  color_bs_white     =  '#fff';
  color_bs_gray      =  '#6c757d';
  color_bs_gray_dark =  '#343a40';
  color_bs_gray_100  =  '#f8f9fa';
  color_bs_gray_200  =  '#e9ecef';
  color_bs_gray_300  =  '#dee2e6';
  color_bs_gray_400  =  '#ced4da';
  color_bs_gray_500  =  '#adb5bd';
  color_bs_gray_600  =  '#6c757d';
  color_bs_gray_700  =  '#495057';
  color_bs_gray_800  =  '#343a40';
  color_bs_gray_900  =  '#212529';
  color_bs_primary   =  '#0d6efd';
  color_bs_secondary =  '#6c757d';
  color_bs_success   =  '#198754';
  color_bs_info      =  '#0dcaf0';
  color_bs_warning   =  '#ffc107';
  color_bs_danger    =  '#dc3545';
  color_bs_light     =  '#f8f9fa';
  color_bs_dark      =  '#212529';
  //tyne colors
  color_tyne_aliceblue            =  '#f0f8ff';
  color_tyne_antiquewhite         =  '#faebd7';
  color_tyne_aqua                 =  '#0ff';
  color_tyne_aquamarine           =  '#7fffd4';
  color_tyne_azure                =  '#f0ffff';
  color_tyne_beige                =  '#f5f5dc';
  color_tyne_bisque               =  '#ffe4c4';
  color_tyne_black                =  '#000';
  color_tyne_blanchedalmond       =  '#ffebcd';
  color_tyne_blue                 =  '#00f';
  color_tyne_blueviolet           =  '#8a2be2';
  color_tyne_brown                =  '#a52a2a';
  color_tyne_burlywood            =  '#deb887';
  color_tyne_burntsienna          =  '#ea7e5d';
  color_tyne_cadetblue            =  '#5f9ea0';
  color_tyne_chartreuse           =  '#7fff00';
  color_tyne_chocolate            =  '#d2691e';
  color_tyne_coral                =  '#ff7f50';
  color_tyne_cornflowerblue       =  '#6495ed';
  color_tyne_cornsilk             =  '#fff8dc';
  color_tyne_crimson              =  '#dc143c';
  color_tyne_cyan                 =  '#0ff';
  color_tyne_darkblue             =  '#00008b';
  color_tyne_darkcyan             =  '#008b8b';
  color_tyne_darkgoldenrod        =  '#b8860b';
  color_tyne_darkgray             =  '#a9a9a9';
  color_tyne_darkgreen            =  '#006400';
  color_tyne_darkgrey             =  '#a9a9a9';
  color_tyne_darkkhaki            =  '#bdb76b';
  color_tyne_darkmagenta          =  '#8b008b';
  color_tyne_darkolivegreen       =  '#556b2f';
  color_tyne_darkorange           =  '#ff8c00';
  color_tyne_darkorchid           =  '#9932cc';
  color_tyne_darkred              =  '#8b0000';
  color_tyne_darksalmon           =  '#e9967a';
  color_tyne_darkseagreen         =  '#8fbc8f';
  color_tyne_darkslateblue        =  '#483d8b';
  color_tyne_darkslategray        =  '#2f4f4f';
  color_tyne_darkslategrey        =  '#2f4f4f';
  color_tyne_darkturquoise        =  '#00ced1';
  color_tyne_darkviolet           =  '#9400d3';
  color_tyne_deeppink             =  '#ff1493';
  color_tyne_deepskyblue          =  '#00bfff';
  color_tyne_dimgray              =  '#696969';
  color_tyne_dimgrey              =  '#696969';
  color_tyne_dodgerblue           =  '#1e90ff';
  color_tyne_firebrick            =  '#b22222';
  color_tyne_floralwhite          =  '#fffaf0';
  color_tyne_forestgreen          =  '#228b22';
  color_tyne_fuchsia              =  '#f0f';
  color_tyne_gainsboro            =  '#dcdcdc';
  color_tyne_ghostwhite           =  '#f8f8ff';
  color_tyne_gold                 =  '#ffd700';
  color_tyne_goldenrod            =  '#daa520';
  color_tyne_gray                 =  '#808080';
  color_tyne_green                =  '#008000';
  color_tyne_greenyellow          =  '#adff2f';
  color_tyne_grey                 =  '#808080';
  color_tyne_honeydew             =  '#f0fff0';
  color_tyne_hotpink              =  '#ff69b4';
  color_tyne_indianred            =  '#cd5c5c';
  color_tyne_indigo               =  '#4b0082';
  color_tyne_ivory                =  '#fffff0';
  color_tyne_khaki                =  '#f0e68c';
  color_tyne_lavender             =  '#e6e6fa';
  color_tyne_lavenderblush        =  '#fff0f5';
  color_tyne_lawngreen            =  '#7cfc00';
  color_tyne_lemonchiffon         =  '#fffacd';
  color_tyne_lightblue            =  '#add8e6';
  color_tyne_lightcoral           =  '#f08080';
  color_tyne_lightcyan            =  '#e0ffff';
  color_tyne_lightgoldenrodyellow =  '#fafad2';
  color_tyne_lightgray            =  '#d3d3d3';
  color_tyne_lightgreen           =  '#90ee90';
  color_tyne_lightgrey            =  '#d3d3d3';
  color_tyne_lightpink            =  '#ffb6c1';
  color_tyne_lightsalmon          =  '#ffa07a';
  color_tyne_lightseagreen        =  '#20b2aa';
  color_tyne_lightskyblue         =  '#87cefa';
  color_tyne_lightslategray       =  '#789';
  color_tyne_lightslategrey       =  '#789';
  color_tyne_lightsteelblue       =  '#b0c4de';
  color_tyne_lightyellow          =  '#ffffe0';
  color_tyne_lime                 =  '#0f0';
  color_tyne_limegreen            =  '#32cd32';
  color_tyne_linen                =  '#faf0e6';
  color_tyne_magenta              =  '#f0f';
  color_tyne_maroon               =  '#800000';
  color_tyne_mediumaquamarine     =  '#66cdaa';
  color_tyne_mediumblue           =  '#0000cd';
  color_tyne_mediumorchid         =  '#ba55d3';
  color_tyne_mediumpurple         =  '#9370db';
  color_tyne_mediumseagreen       =  '#3cb371';
  color_tyne_mediumslateblue      =  '#7b68ee';
  color_tyne_mediumspringgreen    =  '#00fa9a';
  color_tyne_mediumturquoise      =  '#48d1cc';
  color_tyne_mediumvioletred      =  '#c71585';
  color_tyne_midnightblue         =  '#191970';
  color_tyne_mintcream            =  '#f5fffa';
  color_tyne_mistyrose            =  '#ffe4e1';
  color_tyne_moccasin             =  '#ffe4b5';
  color_tyne_navajowhite          =  '#ffdead';
  color_tyne_navy                 =  '#000080';
  color_tyne_oldlace              =  '#fdf5e6';
  color_tyne_olive                =  '#808000';
  color_tyne_olivedrab            =  '#6b8e23';
  color_tyne_orange               =  '#ffa500';
  color_tyne_orangered            =  '#ff4500';
  color_tyne_orchid               =  '#da70d6';
  color_tyne_palegoldenrod        =  '#eee8aa';
  color_tyne_palegreen            =  '#98fb98';
  color_tyne_paleturquoise        =  '#afeeee';
  color_tyne_palevioletred        =  '#db7093';
  color_tyne_papayawhip           =  '#ffefd5';
  color_tyne_peachpuff            =  '#ffdab9';
  color_tyne_peru                 =  '#cd853f';
  color_tyne_pink                 =  '#ffc0cb';
  color_tyne_plum                 =  '#dda0dd';
  color_tyne_powderblue           =  '#b0e0e6';
  color_tyne_purple               =  '#800080';
  color_tyne_rebeccapurple        =  '#663399';
  color_tyne_red                  =  '#f00';
  color_tyne_rosybrown            =  '#bc8f8f';
  color_tyne_royalblue            =  '#4169e1';
  color_tyne_saddlebrown          =  '#8b4513';
  color_tyne_salmon               =  '#fa8072';
  color_tyne_sandybrown           =  '#f4a460';
  color_tyne_seagreen             =  '#2e8b57';
  color_tyne_seashell             =  '#fff5ee';
  color_tyne_sienna               =  '#a0522d';
  color_tyne_silver               =  '#c0c0c0';
  color_tyne_skyblue              =  '#87ceeb';
  color_tyne_slateblue            =  '#6a5acd';
  color_tyne_slategray            =  '#708090';
  color_tyne_slategrey            =  '#708090';
  color_tyne_snow                 =  '#fffafa';
  color_tyne_springgreen          =  '#00ff7f';
  color_tyne_steelblue            =  '#4682b4';
  color_tyne_tan                  =  '#d2b48c';
  color_tyne_teal                 =  '#008080';
  color_tyne_thistle              =  '#d8bfd8';
  color_tyne_tomato               =  '#ff6347';
  color_tyne_turquoise            =  '#40e0d0';
  color_tyne_violet               =  '#ee82ee';
  color_tyne_wheat                =  '#f5deb3';
  color_tyne_white                =  '#fff';
  color_tyne_whitesmoke           =  '#f5f5f5';
  color_tyne_yellow               =  '#ff0';
  color_tyne_yellowgreen          =  '#9acd3';

  // languages
  ARRAY_LANGUAGES       : array [1..15] of string = ( 'pt_BR',  // Portuguese( Brazil )
                                                      'pt_PT',  // Português Portugal
                                                      'en_US',  // English
                                                      'en_GB',  // English British
                                                      'es_ES',  // Spanish
                                                      'fr_FR',  // French
                                                      'de_DE',  // German
                                                      'it_IT',  // Italian
                                                      'tr_TR',  // Turkish
                                                      'ru_RU',  // Russian
                                                      'zn_CH',  // Chinese
                                                      'in_ID',  // Indonesian
                                                      'th_TH',  // Thailand
                                                      'hi_IN',  // Indian
                                                      'ar'      // Arabic
                                                     );
  ARRAY_LANGUAGES_FLAGS : array [1..15] of string = ( 'br'    ,
                                                      'pt'    ,
                                                      'us'    ,
                                                      'gb'    ,
                                                      'es'    ,
                                                      'fr'    ,
                                                      'de'    ,
                                                      'it'    ,
                                                      'tr'    ,
                                                      'ru'    ,
                                                      'cn'    ,
                                                      'id'    ,
                                                      'th'    ,
                                                      'in'    ,
                                                      'sa'
                                                     );

  //até 12 series
  // Rainbow
  ARRAY_COLORS1 : array [1..12] of string = ( '#6e40aa', '#b23cb2', '#ee4395', '#ff5e63', '#ff8c38', '#d9c231', '#aff05b', '#60f760', '#28ea8d', '#1ac7c2', '#2f96e0', '#5465d6' );
  // Inferno
  ARRAY_COLORS2 : array [1..12] of string = ( '#000004', '#110a30', '#320a5e', '#57106e', '#781c6d', '#9a2865', '#bc3754', '#d84c3e', '#ed6925', '#f98e09', '#fbb61a', '#f4df53' );
  // Magma
  ARRAY_COLORS3 : array [1..12] of string = ( '#000004', '#100b2d', '#2c115f', '#51127c', '#721f81', '#932b80', '#b73779', '#d8456c', '#f1605d', '#fc8961', '#feb078', '#fed799' );
  // greens
  ARRAY_COLORS4 : array [1..12] of string = ( '#f7fcfd', '#ebf7fa', '#dcf2f2', '#c8eae4', '#aadfd2', '#88d1bc', '#68c2a3', '#4eb485', '#37a266', '#228c49', '#0d7635', '#025f27' );
  // purples
  ARRAY_COLORS5 : array [1..12] of string = ( '#f7fcfd', '#e7f1f7', '#d5e3ef', '#bfd3e6', '#aac3de', '#99afd3', '#8f95c6', '#8c79b8', '#8a5daa', '#88409b', '#812186', '#6d0c6b' );
  //reds
  ARRAY_COLORS6 : array [1..12] of string = ( '#fff7ec', '#feedd4', '#fee1ba', '#fdd3a1', '#fdc28c', '#fdab75', '#fa8e5d', '#f3724d', '#e65339', '#d53121', '#be120c', '#a10202'  );                                                                                                    //TN.3|=<qc{=m[*{>=a<-s{=

implementation


end.

