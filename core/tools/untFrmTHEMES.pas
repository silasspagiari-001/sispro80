unit untFrmTHEMES; //8.2.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,

  // feedback: Mesut from Turkey
  {$ifdef LINUX}
  System.UIConsts,
  {$endif}
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, uniEdit, uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn, uniMemo, IniFiles,
  uniHTMLFrame, uniImage, uniColorButton, uniColorPalette, Vcl.Imaging.jpeg,
  uniScrollBox, uniMultiItem, uniComboBox, uniCheckBox, uniSpinEdit, uniPageControl, uniImageList, Vcl.Menus, uniMainMenu;

type
  TfrmThemes = class(TUniForm)
    UniContainerPanel16: TUniContainerPanel;
    pgConfig: TUniPageControl;
    tabLayout: TUniTabSheet;
    tabConfig: TUniTabSheet;
    sboxLayout: TUniScrollBox;
    rcBlock100: TUniContainerPanel;
    UniContainerPanel22: TUniContainerPanel;
    UniLabel32: TUniLabel;
    cbxFonts: TUniComboBox;
    chkAllFont: TUniCheckBox;
    rcBlock120: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel1: TUniLabel;
    chkTabColor: TUniCheckBox;
    rcBlock130: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel2: TUniLabel;
    chkBorderRounded: TUniCheckBox;
    rcBlock135: TUniContainerPanel;
    UniContainerPanel7: TUniContainerPanel;
    UniLabel5: TUniLabel;
    chkLabelWrap: TUniCheckBox;
    chkLabelsFormsDefault: TUniCheckBox;
    rcBlock110: TUniContainerPanel;
    UniContainerPanel9: TUniContainerPanel;
    UniLabel6: TUniLabel;
    edOffSet: TUniSpinEdit;
    UniLabel7: TUniLabel;
    UniContainerPanel10: TUniContainerPanel;
    paTitulo: TUniContainerPanel;
    paCmdButtons: TUniContainerPanel;
    btnExit: TUniBitBtn;
    btnDefault: TUniBitBtn;
    btnOk: TUniBitBtn;
    paSearchContent1: TUniContainerPanel;
    labTitleFrm: TUniLabel;
    labSelectedColor: TUniLabel;
    sboxConfig: TUniScrollBox;
    UniContainerPanel49: TUniContainerPanel;
    rcBlock200: TUniContainerPanel;
    UniContainerPanel18: TUniContainerPanel;
    UniLabel13: TUniLabel;
    cbLanguage: TUniComboBox;
    UniBitBtn1: TUniBitBtn;
    UniContainerPanel20: TUniContainerPanel;
    rcBlock195: TUniContainerPanel;
    rcBlock210: TUniContainerPanel;
    UniContainerPanel24: TUniContainerPanel;
    UniLabel14: TUniLabel;
    cbDatabase: TUniComboBox;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    edIP: TUniEdit;
    edPort: TUniEdit;
    UniLabel17: TUniLabel;
    edUser: TUniEdit;
    UniLabel18: TUniLabel;
    edPass: TUniEdit;
    UniLabel19: TUniLabel;
    btnTestConnect: TUniBitBtn;
    edDatabaseName: TUniEdit;
    UniLabel20: TUniLabel;
    rcBlock220: TUniContainerPanel;
    UniContainerPanel26: TUniContainerPanel;
    UniLabel21: TUniLabel;
    UniLabel23: TUniLabel;
    edEmailPass: TUniEdit;
    UniLabel26: TUniLabel;
    btnMailTest: TUniBitBtn;
    edEmailHost: TUniEdit;
    UniLabel27: TUniLabel;
    edEmail: TUniEdit;
    UniLabel22: TUniLabel;
    edEmailUSer: TUniEdit;
    edEmailSmtpPort: TUniEdit;
    UniLabel24: TUniLabel;
    UniLabel28: TUniLabel;
    UniLabel29: TUniLabel;
    UniLabel30: TUniLabel;
    swtEmailTLS: TUniLabel;
    swtEmailSSL: TUniLabel;
    swtEmailHtml: TUniLabel;
    tabColors: TUniTabSheet;
    sBoxColors: TUniScrollBox;
    paColors: TUniContainerPanel;
    UniContainerPanel6: TUniContainerPanel;
    UniLabel3: TUniLabel;
    pa001Login: TUniContainerPanel;
    labOptLOGIN: TUniLabel;
    paBorderLogin: TUniPanel;
    btnSelColor_Login: TUniContainerPanel;
    pa002Buttons: TUniContainerPanel;
    labOptBUTTONS: TUniLabel;
    paBorderButton_Color: TUniPanel;
    btnSelColor_Button_Color: TUniContainerPanel;
    btnSelColor_Button_Color_Hover: TUniPanel;
    pa003Cruds: TUniContainerPanel;
    labOptBUTTONS_CRUD: TUniLabel;
    paBorderButton_Color_Crud: TUniPanel;
    btnSelColor_Button_Color_Crud: TUniContainerPanel;
    btnSelColor_Button_Color_Crud_Hover: TUniPanel;
    pa004MainMenu: TUniContainerPanel;
    labOptMENU: TUniLabel;
    paBorderMenu: TUniPanel;
    btnSelColor_Menu: TUniContainerPanel;
    pa005MainMenuFont: TUniContainerPanel;
    labOptMENUFONT: TUniLabel;
    paBorderMenuFont: TUniPanel;
    btnSelColor_MenuFont: TUniContainerPanel;
    pa007LookUp: TUniContainerPanel;
    labOptLOOKUP: TUniLabel;
    paBorderLookup: TUniPanel;
    btnSelColor_LookUp: TUniContainerPanel;
    pa008LookUpFont: TUniContainerPanel;
    labOptLOOKUPFONT: TUniLabel;
    paBorderLookupEditFont: TUniPanel;
    btnSelColor_LookUpEditFont: TUniContainerPanel;
    pa009BgColor: TUniContainerPanel;
    labOptBG_COLOR: TUniLabel;
    paBorderBg: TUniPanel;
    btnSelColor_Bg: TUniContainerPanel;
    pa010Edits: TUniContainerPanel;
    labOptEDITFOCO: TUniLabel;
    paBorderEditFoco: TUniPanel;
    btnSelColor_EditFoco: TUniContainerPanel;
    pa006LookUpFontColor: TUniContainerPanel;
    UniLabel4: TUniLabel;
    paBorderLookupFont: TUniPanel;
    btnSelColor_LookUpFont: TUniContainerPanel;
    UniContainerPanel11: TUniContainerPanel;
    UniLabel8: TUniLabel;
    paBorderMenuLogoBG: TUniPanel;
    btnSelColor_MenuLogoBG: TUniContainerPanel;
    UniContainerPanel12: TUniContainerPanel;
    UniLabel9: TUniLabel;
    paBorderMenuLogoFont: TUniPanel;
    btnSelColor_MenuLogoFont: TUniContainerPanel;
    paLinkColor: TUniContainerPanel;
    labOptCOLOR_LINK: TUniLabel;
    paBorderLink: TUniPanel;
    btnSelCOLOR_LINK: TUniContainerPanel;
    UniContainerPanel15: TUniContainerPanel;
    UniLabel12: TUniLabel;
    paBorderLinkHover: TUniPanel;
    btnSelCOLOR_LINKHOVER: TUniContainerPanel;
    UniContainerPanel19: TUniContainerPanel;
    labOptFORM: TUniLabel;
    paBorderFormLabel: TUniPanel;
    btnSelColor_FormLabel: TUniContainerPanel;
    UniContainerPanel27: TUniContainerPanel;
    rcBlock205: TUniContainerPanel;
    UniContainerPanel29: TUniContainerPanel;
    UniLabel31: TUniLabel;
    chkSessionLog: TUniCheckBox;
    UniLabel33: TUniLabel;
    edPanelFactor: TUniSpinEdit;
    edEditFactor: TUniSpinEdit;
    UniLabel34: TUniLabel;
    UniLabel35: TUniLabel;
    edBtnFactor: TUniSpinEdit;
    chkFormRounded: TUniCheckBox;
    paGridSel: TUniContainerPanel;
    labOptGRIDSELECT: TUniLabel;
    paBorderGridSelect: TUniPanel;
    btnSelColor_GridSelect: TUniContainerPanel;
    UniLabel36: TUniLabel;
    edMaxOpenTabs: TUniSpinEdit;
    paFlag: TUniContainerPanel;
    labFlag: TUniLabel;
    chkTabsOff: TUniCheckBox;
    edCurrencyNamePlural: TUniEdit;
    UniLabel37: TUniLabel;
    edCurrencySymbol: TUniEdit;
    edCurrencyName: TUniEdit;
    rcBlock190: TUniContainerPanel;
    UniContainerPanel31: TUniContainerPanel;
    UniLabel38: TUniLabel;
    UniLabel39: TUniLabel;
    cbxLoadMaskFile: TUniComboBox;
    paImgLoadMask: TUniContainerPanel;
    imgLoadMask: TUniLabel;
    UniContainerPanel36: TUniContainerPanel;
    labOptGRIDCOLUMNBG: TUniLabel;
    paBorderGridTitleBG: TUniPanel;
    btnSelColor_GridTitleBG: TUniContainerPanel;
    UniContainerPanel37: TUniContainerPanel;
    labOptGRIDCOLUMCOLOR: TUniLabel;
    paBorderGridTitleColor: TUniPanel;
    btnSelColor_GridTitleColor: TUniContainerPanel;
    UniContainerPanel38: TUniContainerPanel;
    UniLabel43: TUniLabel;
    paBorderGridTitleColorBGOver: TUniPanel;
    btnSelColor_GridTitleColorBGOver: TUniContainerPanel;
    UniContainerPanel39: TUniContainerPanel;
    UniLabel44: TUniLabel;
    paBorderGridTitleColorOver: TUniPanel;
    btnSelColor_GridTitleColorOver: TUniContainerPanel;
    UniContainerPanel40: TUniContainerPanel;
    UniLabel45: TUniLabel;
    paBorderGridTitleColorIcon: TUniPanel;
    btnSelColor_GridTitleColorIcon: TUniContainerPanel;
    cbxLabelsFontWeight: TUniComboBox;
    UniLabel47: TUniLabel;
    pa008LookUpFontClone: TUniContainerPanel;
    labOptLOOKUPFONTClone: TUniLabel;
    paBorderEditColor: TUniPanel;
    btnSelColor_EditColor: TUniContainerPanel;
    UniContainerPanel41: TUniContainerPanel;
    UniLabel48: TUniLabel;
    paBorderEditColorFont: TUniPanel;
    btnSelColor_EditColorFont: TUniContainerPanel;
    UniContainerPanel42: TUniContainerPanel;
    UniLabel49: TUniLabel;
    paBorderEditColorReadOnly: TUniPanel;
    btnSelColor_EditColorReadOnly: TUniContainerPanel;
    UniContainerPanel43: TUniContainerPanel;
    UniLabel50: TUniLabel;
    paBorderEditColorFontReadOnly: TUniPanel;
    btnSelColor_EditColorFontReadOnly: TUniContainerPanel;
    UniContainerPanel42Clone: TUniContainerPanel;
    UniLabel49Clone: TUniLabel;
    paBorderEditColorTrigger: TUniPanel;
    btnSelColor_EditColorTrigger: TUniContainerPanel;
    UniContainerPanel43Clone: TUniContainerPanel;
    UniLabel50Clone: TUniLabel;
    paBorderEditColorFontTrigger: TUniPanel;
    btnSelColor_EditColorFontTrigger: TUniContainerPanel;
    popMenuOptions: TUniPopupMenu;
    optCopy: TUniMenuItem;
    optPaste: TUniMenuItem;
    N1: TUniMenuItem;
    optUndo: TUniMenuItem;
    chkMenuTopPanelOffMobile: TUniCheckBox;
    chkTabsOffMobile: TUniCheckBox;
    UniLabel51: TUniLabel;
    UniLabel52: TUniLabel;
    rcBlock170: TUniContainerPanel;
    UniContainerPanel45: TUniContainerPanel;
    UniLabel53: TUniLabel;
    chkVirtualKeyboard: TUniCheckBox;
    chkScrollKeyboardOffset: TUniCheckBox;
    btnDarkMode: TUniPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel58: TUniLabel;
    pa012DefaultPattern: TUniContainerPanel;
    UniLabel56: TUniLabel;
    paColorSelect: TUniContainerPanel;
    htmlFrame: TUniHTMLFrame;
    UniLabel57: TUniLabel;
    labCloseColorSelect: TUniLabel;
    UniContainerPanel8: TUniContainerPanel;
    UniLabel59: TUniLabel;
    paBorderMenuFontGroup: TUniPanel;
    btnSelColor_MenuFontGroup: TUniContainerPanel;
    btnBlue: TUniContainerPanel;
    btnGray: TUniContainerPanel;
    btnRed: TUniContainerPanel;
    btnOrange: TUniContainerPanel;
    btnGreen: TUniContainerPanel;
    btnIndigo: TUniContainerPanel;
    btnLight: TUniContainerPanel;
    btnDark: TUniContainerPanel;
    btnPurple: TUniContainerPanel;
    btnChocolate: TUniContainerPanel;
    btnDarkGray: TUniContainerPanel;
    btnBlueLight: TUniContainerPanel;
    btnLightBlue: TUniContainerPanel;
    btnLightRed: TUniContainerPanel;
    btnLightGreen: TUniContainerPanel;
    btnLightOrange: TUniContainerPanel;
    btnLightPurple: TUniContainerPanel;
    btnLightIndigo: TUniContainerPanel;
    btnSalmon: TUniContainerPanel;
    chkVirtualKeyboardDesktop: TUniCheckBox;
    paColorPicker: TUniContainerPanel;
    htmlFrameColorPicker: TUniHTMLFrame;
    UniLabel60: TUniLabel;
    labCloseColorPicker: TUniLabel;
    edColorText: TUniEdit;
    edColor: TUniEdit;
    chkRCTranslate: TUniCheckBox;
    chkTabsBtn: TUniCheckBox;
    chkTabColorThemeBorder: TUniCheckBox;
    chkLoadMaskBG: TUniCheckBox;
    chkTabBorderBottom: TUniCheckBox;
    UniLabel63: TUniLabel;
    edSessionTimeOut: TUniEdit;
    chkBSIcons: TUniCheckBox;
    chkAppDataFolder: TUniCheckBox;
    btnAppDataHelp: TUniBitBtn;
    chkRCGuideTour: TUniCheckBox;
    UniContainerPanel13: TUniContainerPanel;
    UniLabel64: TUniLabel;
    paBorderEditColorBorder: TUniPanel;
    btnSelColor_EditColorBorder: TUniContainerPanel;
    UniLabel25: TUniLabel;
    swtEmailThreaded: TUniLabel;
    rcBlock115: TUniContainerPanel;
    paAnimEffTitle: TUniContainerPanel;
    UniLabel66: TUniLabel;
    chkAnimEffects: TUniCheckBox;
    chkGridBlockAnim: TUniCheckBox;
    chkMenuCallAnim: TUniCheckBox;
    rcBlock140: TUniContainerPanel;
    UniContainerPanel14: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    edMenuFontSize: TUniSpinEdit;
    chkUserBG: TUniCheckBox;
    chkMenu: TUniCheckBox;
    chkMicroMenu: TUniCheckBox;
    chkMicroMenuAutoClose: TUniCheckBox;
    edMenuWidth: TUniSpinEdit;
    UniLabel67: TUniLabel;
    UniLabel68: TUniLabel;
    edMenuLineHeight: TUniSpinEdit;
    UniLabel69: TUniLabel;
    edMenuTextWidth: TUniSpinEdit;
    rcBlock150: TUniContainerPanel;
    UniContainerPanel17: TUniContainerPanel;
    UniLabel41: TUniLabel;
    chkScrollBarThin: TUniCheckBox;
    chkScrollBarHideMobile: TUniCheckBox;
    UniLabel42: TUniLabel;
    edScrollBarSize: TUniSpinEdit;
    rcBlock160: TUniContainerPanel;
    UniContainerPanel21: TUniContainerPanel;
    UniLabel40: TUniLabel;
    chkGridUpperCase: TUniCheckBox;
    chkGridBold: TUniCheckBox;
    edGridRowHeight: TUniSpinEdit;
    UniLabel46: TUniLabel;
    chkGridColumnSeparator: TUniCheckBox;
    chkGridPaginator: TUniCheckBox;
    edGridTitleFontSize: TUniSpinEdit;
    UniLabel61: TUniLabel;
    edGridFontSize: TUniSpinEdit;
    UniLabel62: TUniLabel;
    UniLabel65: TUniLabel;
    edGridTitleHeight: TUniSpinEdit;
    rcBlock180: TUniContainerPanel;
    UniContainerPanel23: TUniContainerPanel;
    UniLabel54: TUniLabel;
    UniLabel55: TUniLabel;
    chkLoginWithImgBG: TUniCheckBox;
    cbxLoginModel: TUniComboBox;
    chkLoginDisable: TUniCheckBox;
    chkLoginWelcomeBox: TUniCheckBox;
    chkLoginLanguage: TUniCheckBox;
    chkLoginInvertImg: TUniCheckBox;
    chkLoginWithExtraImg: TUniCheckBox;
    chkLoginWithVideoBG: TUniCheckBox;
    chkLoginBgFixed: TUniCheckBox;
    chkLoginBgSolid: TUniCheckBox;
    paActiveTheme: TUniContainerPanel;
    labActiveTheme: TUniLabel;
    rcBlock137: TUniContainerPanel;
    paEditsAndButtonsTitle: TUniContainerPanel;
    UniLabel70: TUniLabel;
    chkButtonNoFocus: TUniCheckBox;
    chkBgThemeColorFocusActive: TUniCheckBox;
    chkBgThemedLookUp: TUniCheckBox;
    UniLabel71: TUniLabel;
    edAjaxTimeOut: TUniEdit;
    labPort: TUniLabel;
    edAppPort: TUniEdit;
    chkClearData: TUniCheckBox;
    chkDropSecTables: TUniCheckBox;
    chkDropSecTablesUser: TUniCheckBox;
    cbxFontAwsVersion: TUniComboBox;
    procedure btnOkClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFormCreate(Sender: TObject);
    procedure btnSelColor_LoginClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnDefaultClick(Sender: TObject);
    procedure UniImage1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure htmlFrameAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure btnBlueClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnTestConnectClick(Sender: TObject);
    procedure btnMailTestClick(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure chkTabsOffClick(Sender: TObject);
    procedure cbxLoadMaskFileChange(Sender: TObject);
    procedure cbxLabelsFontWeightChange(Sender: TObject);
    procedure btnSelColor_LoginMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure optCopyClick(Sender: TObject);
    procedure optPasteClick(Sender: TObject);
    procedure optUndoClick(Sender: TObject);
    procedure chkVirtualKeyboardClick(Sender: TObject);
    procedure cbxLoginModelChange(Sender: TObject);
    procedure chkLoginWithExtraImgChange(Sender: TObject);
    procedure chkLoginInvertImgChange(Sender: TObject);
    procedure labCloseColorSelectClick(Sender: TObject);
    procedure sBoxColorsScrollChange(Sender: TComponent; const X, Y: Integer);
    procedure cbxFontsSelect(Sender: TObject);
    procedure cbLanguageSelect(Sender: TObject);
    procedure edColorTextChange(Sender: TObject);
    procedure chkMicroMenuClick(Sender: TObject);
    procedure chkMenuClick(Sender: TObject);
    procedure btnAppDataHelpClick(Sender: TObject);
    procedure chkLoginBgSolidChange(Sender: TObject);
    procedure chkLoginWithImgBGChange(Sender: TObject);
  private
    { Private declarations }
    oSelectedColorPanel, oSelectedColorPanelLast : TUniContainerPanel;
    oSelectedColor, oSelectedColorCopy, oSelectedColorCopyLast : TColor;
    varI_ScrollPosition : integer;
  public
    { Public declarations }
    procedure rc_UpdateBorders( pPanel : TUniContainerPanel );
    procedure rc_UpdateColorButtons;
    procedure rc_PreviewSelectedColor;
    procedure rc_ChangeColor( pParam : string ); // 6.0.0.0
    procedure rc_AdjustDatabase( var cMsg : string ); //8.1.0.0
  end;

function frmThemes: TfrmThemes;

implementation

{$R *.dfm}

uses
  uniGUIApplication, ServerModule, MainModule, uconsts, uconsts_cfg,
  Main, mkm_func_web, untdm_rc, mkm_layout, mkm_anim, untFrmTRANSLATE,
  mkm_translate, mkm_email, mkm_layout_aux_callout;//8.0.0.0

function frmThemes: TfrmThemes;
begin
  Result := TfrmThemes(mm.GetFormInstance(TfrmThemes));
end;
//v.
procedure TfrmThemes.btnOkClick(Sender: TObject);
var
   inifile : Tinifile;
begin
     IniFile := nil;
     mm.CONFIG_SESSION_LOG                := chkSessionLog.Checked;
     mm.CONFIG_SESSION_TIMEOUT            := StrToIntDeF( edSessionTimeOut.Text, 1800000 ) ; // 6.0.0.0
     mm.CONFIG_APP_DATA_FOLDER            := varIIF( chkAppDataFolder.Checked  , 'ON', 'OFF' ); // 6.0.0.0
     mm.CONFIG_RC_TRANSLATE               := varIIF( chkRCTranslate.Checked    , 'ON', 'OFF' ); // 6.0.0.0
     mm.CONFIG_RC_GUIDETOUR               := varIIF( chkRCGuideTour.Checked    , 'ON', 'OFF' ); // 6.0.0.0
     mm.CONFIG_LAYOUT_APPLY_FONT_ALL      := varIIF( chkAllFont.Checked       , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_FONTAWS             := ReturnNumbers( cbxFontAwsVersion.Text ); //8.2.0.0
     mm.CONFIG_LAYOUT_BSICONS             := varIIF( chkBSIcons.Checked      , 'ON', 'OFF' ); //8.2.0.0
     mm.CONFIG_APP_BUTTON_NOFOCUS         := varIIF( chkButtonNoFocus.Checked  , 'ON', 'OFF' ); // 7.0.0.0 nofocus

     mm.CONFIG_LAYOUT_EDIT_FOCUS_ACTIVE   := varIIF( chkBgThemeColorFocusActive.Checked  , 'ON', 'OFF' );//8.0.0.0 focus active
     mm.CONFIG_LAYOUT_LOOKUP_THEMED       := varIIF( chkBgThemedLookUp.Checked  , 'ON', 'OFF' );//8.0.0.0

     mm.CONFIG_LAYOUT_ROUND_FORM          := varIIF( chkFormRounded.Checked   , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_ROUND_EDIT          := varIIF( chkBorderRounded.Checked , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR   := edEditFactor.Text;
     mm.CONFIG_LAYOUT_ROUND_PANEL_FACTOR  := edPanelFactor.Text;
     mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR    := edBtnFactor.Text;
     mm.CONFIG_LAYOUT_LABEL_WRAP          := varIIF( chkLabelWrap.Checked     , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_USER_BG             := varIIF( chkUserBG.Checked        , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_LABEL_FORMS_DEFAULT := varIIF( chkLabelsFormsDefault.Checked   , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET    := edOffSet.Text;
     mm.CONFIG_LAYOUT_GRIDBLOCK_ANIM      := varIIF( chkGridBlockAnim.Checked   , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_ANIM_EFFECTS        := varIIF( chkAnimEffects.Checked   , 'ON', 'OFF' );//7.4.0.0
     mm.CONFIG_LAYOUT_MENUFONT_SIZE       := edMenuFontSize.Text;
     mm.CONFIG_LAYOUT_MENU_TEXT_WIDTH     := edMenuTextWidth.Text; //7.5.0.0 menu
     mm.CONFIG_LAYOUT_MENU_WIDTH          := edMenuWidth.Text;     //7.5.0.0 menu
     mm.CONFIG_LAYOUT_MENU_LINE_HEIGHT    := edMenuLineHeight.Text;//7.5.0.0 menu
     mm.CONFIG_LAYOUT_TAB_MAX_OPENED      := edMaxOpenTabs.Text;
     mm.CONFIG_LAYOUT_TAB_OFF             := varIIF( chkTabsOff.Checked     , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_TAB_BUTTONS         := varIIF( chkTabsBtn.Checked     , 'ON', 'OFF' ); // 6.0.0.0
     mm.CONFIG_LAYOUT_TAB_THEME_BORDER    := varIIF( chkTabColorThemeBorder.Checked     , 'ON', 'OFF' ); // 6.0.0.0
     mm.CONFIG_LAYOUT_TAB_COLOR_FOCUS     := varIIF( chkTabColor.Checked    , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_TAB_BORDER_OFF      := varIIF( chkTabBorderBottom.Checked    , 'ON', 'OFF' );
     // 6.0.0.0_menu micro
     if chkMenu.Checked then
        mm.CONFIG_LAYOUT_MENU_TYPE        := '1' //varIIF( chkMenu.Checked        , '1', '3' );
     else
     if chkMicroMenu.Checked then
        mm.CONFIG_LAYOUT_MENU_TYPE        := '2'
     else
        mm.CONFIG_LAYOUT_MENU_TYPE        := '3';
     mm.CONFIG_LAYOUT_MENU_TYPE_AUTOCLOSE := varIIF( chkMicroMenuAutoClose.Checked    , 'ON', 'OFF' );

     mm.CONFIG_LAYOUT_MENU_CALL_ANIM      := varIIF( chkMenuCallAnim.Checked          , 'ON', 'OFF' ); //7.3.0.0

     mm.CONFIG_LAYOUT_HIDE_TABS_ON_MOBILE     := varIIF( chkTabsOffMobile.Checked         , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_HIDE_TOPPANEL_ON_MOBILE := varIIF( chkMenuTopPanelOffMobile.Checked , 'ON', 'OFF' );

     mm.CONFIG_LAYOUT_KEYBOARD_SCROLL_ON_MOBILE   := 'OFF';//varIIF( chkScrollKeyboardOffset.Checked   , 'ON', 'OFF' );//8.0.0.0
     mm.CONFIG_LAYOUT_KEYBOARD_VIRTUAL_ON_MOBILE  := varIIF( chkVirtualKeyboard.Checked , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_KEYBOARD_VIRTUAL_ON_DESKTOP := varIIF( chkVirtualKeyboardDesktop.Checked , 'ON', 'OFF' ); // 6.0.0.0

     mm.CONFIG_LAYOUT_LOADMASK_IMG        := cbxLoadMaskFile.ItemIndex.ToString + '|' + cbxLoadMaskFile.Text;
     mm.CONFIG_LAYOUT_LOADMASK_TYPE       := varIIF( chkLoadMaskBG.Checked, 'BG', '' );
     mm.CONFIG_LAYOUT_GRID_TITLE_BOLD     := varIIF( chkGridBold.Checked      , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_GRID_TITLE_UPPER    := varIIF( chkGridUpperCase.Checked , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_GRID_TITLE_FONT_SIZE:= edGridTitleFontSize.Text; // 6.0.0.0
     mm.CONFIG_LAYOUT_GRID_FONT_SIZE      := edGridFontSize.Text; // 6.0.0.0
     //7.2.0.0
     mm.CONFIG_LAYOUT_SCROLLBAR_SIZE      := varIIF( chkScrollBarThin.Checked, 1, 0 );//edScrollBarSize.Text;
     mm.CONFIG_LAYOUT_SCROLLBAR_MOBILE_OFF:= varIIF( chkScrollBarHideMobile.Checked , 'ON', 'OFF' );; // 6.0.0.0
     mm.CONFIG_LAYOUT_GRID_COLUMN_SEPARATOR := varIIF( chkGridColumnSeparator.Checked , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR   := varIIF( chkGridPaginator.Checked , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_GRID_ROW_HEIGHT     := edGridRowHeight.Text; // 6.0.0.0
     mm.CONFIG_LAYOUT_GRID_TITLE_HEIGHT   := edGridTitleHeight.Text; //7.5.0.0

     mm.CONFIG_LOGIN_MODEL                := cbxLoginModel.ItemIndex.ToString;
     mm.CONFIG_LOGIN_BG_FIXED             := varIIF( chkLoginBgFixed.Checked , 'ON', 'OFF' );
     mm.CONFIG_LAYOUT_LOGIN_BG_SOLID      := varIIF( chkLoginBgSolid.Checked , 'ON', 'OFF' ); //7.5.0.0 login
     mm.CONFIG_LOGIN_BG_IMAGE             := varIIF( chkLoginWithImgBG.Checked , 'ON', 'OFF' );
     mm.CONFIG_LOGIN_BG_VIDEO             := varIIF( chkLoginWithVideoBG.Checked , 'ON', 'OFF' );
     mm.CONFIG_LOGIN_BG_IMAGE_EXTRA       := varIIF( chkLoginWithExtraImg.Checked , 'ON', 'OFF' );
     mm.CONFIG_LOGIN_BG_IMAGE_INVERTED    := varIIF( chkLoginInvertImg.Checked , 'ON', 'OFF' );
     mm.CONFIG_LOGIN_LANGUAGE             := varIIF( chkLoginLanguage.Checked , 'ON', 'OFF' );
     mm.CONFIG_LOGIN_WELCOMEBOX           := varIIF( chkLoginWelcomeBox.Checked   , 'ON', 'OFF' );

     mm.CONFIG_CURRENCY_SYMBOL            := edCurrencySymbol.Text ;
     mm.CONFIG_CURRENCY_NAME              := edCurrencyName.Text;
     mm.CONFIG_CURRENCY_NAME_PLURAL       := edCurrencyNamePlural.Text;

     mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER              := edEmail.Text;
     mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_HOST         := edEmailHost.Text;
     mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SMTP_PORT    := edEmailSmtpPort.Text;
     mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_USER         := edEmailUSer.Text;
     mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_PASS         := edEmailPass.Text;
     mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_CONFIRMATION := '0';// IntToStr( swtEmailConfirm.Tag  );//7.3.0.0
     mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_THREAD       := IntToStr( swtEmailThreaded.Tag  );   //7.3.0.0
     mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_TLS          := IntToStr( swtEmailTLS.Tag  );
     mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SSL          := IntToStr( swtEmailSSL.Tag  );
     {<*RC DB}
     mm.CONFIG_DATABASE     := cbDatabase.Text;
     mm.CONFIG_DATABASE_HOST_IP     := edIP.Text;
     mm.CONFIG_DATABASE_PORT        := StrToIntDef( edPort.Text, 0 );
     mm.CONFIG_DATABASE_USERNAME    := edUser.Text;
     mm.CONFIG_DATABASE_PASSWORD    := edPass.Text;
     mm.CONFIG_DATABASE_NAME        := edDatabaseName.Text;
     {RC DB*>}
     try
       IniFile := TiniFile.Create( sm.FilesFolderPath + StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] ) + '_cfg.ini' );
       // App
       IniFile.WriteString( 'App', 'translate'   , mm.CONFIG_RC_TRANSLATE); // 6.0.0.0
       IniFile.WriteString( 'App', 'guidetour'   , mm.CONFIG_RC_GUIDETOUR); // 6.0.0.0
       IniFile.WriteString( 'App', 'type'        , mm.CONFIG_APP_TYPE );
       IniFile.WriteString( 'App', 'language'    , mm.CONFIG_LANGUAGE);
       IniFile.WriteString( 'App', 'session_log' , varIIF( mm.CONFIG_SESSION_LOG , '1', '0' ) );
       IniFile.WriteInteger('App', 'session_timeout' , mm.CONFIG_SESSION_TIMEOUT ) ; // 6.0.0.0
       IniFile.WriteInteger('App', 'ajax_timeout' , StrToIntDef( edAjaxTimeOut.Text, 60000 ) ) ; //8.0.0.0
       IniFile.WriteInteger('App', 'app_port'        , StrToIntDef( edAppPort.Text, StrToInt(APP_PORT) ) ) ; //8.0.0.0
       IniFile.WriteString( 'App', 'app_data_folder' , mm.CONFIG_APP_DATA_FOLDER); //
       IniFile.WriteString( 'App', 'app_button_nofocus' , mm.CONFIG_APP_BUTTON_NOFOCUS); //7.0.0.0 nofocus
       // App - Login
       IniFile.WriteString( 'App', 'login_model'    , mm.CONFIG_LOGIN_MODEL );
       IniFile.WriteString( 'App', 'login_bg_video' , mm.CONFIG_LOGIN_BG_VIDEO );
       IniFile.WriteString( 'App', 'login_bg'       , mm.CONFIG_LOGIN_BG_IMAGE );
       IniFile.WriteString( 'App', 'login_bg_fixed' , mm.CONFIG_LOGIN_BG_FIXED );
       IniFile.WriteString( 'App', 'login_bg_solid' , mm.CONFIG_LAYOUT_LOGIN_BG_SOLID ); //7.5.0.0 login
       IniFile.WriteString( 'App', 'login_bg_extra' , mm.CONFIG_LOGIN_BG_IMAGE_EXTRA );
       IniFile.WriteString( 'App', 'login_bg_inverted' , mm.CONFIG_LOGIN_BG_IMAGE_INVERTED );
       IniFile.WriteString( 'App', 'login_language' , mm.CONFIG_LOGIN_LANGUAGE );
       IniFile.WriteString( 'App', 'login_welcome'  , mm.CONFIG_LOGIN_WELCOMEBOX );

       //Currency
       IniFile.WriteString( 'App', 'currency_symbol', mm.CONFIG_CURRENCY_SYMBOL);
       IniFile.WriteString( 'App', 'currency_name', mm.CONFIG_CURRENCY_NAME);
       IniFile.WriteString( 'App', 'currency_name_plural', mm.CONFIG_CURRENCY_NAME_PLURAL);
       // Database
       {<*RC DB}
       IniFile.WriteString ( 'DataBase', 'dbms'    , mm.CONFIG_DATABASE);
       IniFile.WriteString ( 'DataBase', 'ip'      , mm.CONFIG_DATABASE_HOST_IP);
       IniFile.WriteInteger( 'DataBase', 'port'    , mm.CONFIG_DATABASE_PORT);
       IniFile.WriteString ( 'DataBase', 'user'    , mm.CONFIG_DATABASE_USERNAME);
       IniFile.WriteString ( 'DataBase', 'password', mm.CONFIG_DATABASE_PASSWORD);
       IniFile.WriteString ( 'DataBase', 'dbname'  , mm.CONFIG_DATABASE_NAME);
       mm.DATABASE_ACTIVE := '';
       {RC DB*>}
       // Email
       IniFile.WriteString ( 'Email', 'email'    , mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER);
       IniFile.WriteString ( 'Email', 'host'     , mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_HOST);
       IniFile.WriteString ( 'Email', 'smtpport' , mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SMTP_PORT);
       IniFile.WriteString ( 'Email', 'user'     , mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_USER);
       IniFile.WriteString ( 'Email', 'password' , mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_PASS);
       IniFile.WriteString ( 'Email', 'confirm'  , mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_CONFIRMATION);
       IniFile.WriteString ( 'Email', 'thread'   , mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_THREAD);
       IniFile.WriteString ( 'Email', 'tls'      , mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_TLS);
       IniFile.WriteString ( 'Email', 'ssl'      , mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SSL);
       // Layout
       IniFile.WriteString( 'Layout', 'active', mm.CONFIG_LAYOUT_ACTIVE_THEME);
       IniFile.WriteString( 'Layout', 'bg_focus_active' , mm.CONFIG_LAYOUT_EDIT_FOCUS_ACTIVE); //8.0.0.0 focus active
       IniFile.WriteString( 'Layout', 'bg_themed_lookup' , mm.CONFIG_LAYOUT_LOOKUP_THEMED); //8.0.0.0
     finally
       IniFile.Free;
     end;

     dm_rc.rc_SaveTheme( 'active' );
     dm_rc.rc_SaveTheme( mm.CONFIG_LAYOUT_ACTIVE_THEME );
     dm_rc.rc_LoadTheme( 'active' );

     mm.varB_Yes := True;
     mm.varB_No := False;
     Self.ModalResult := mrOk;

     Close;
end;

procedure TfrmThemes.btnSelColor_LoginClick(Sender: TObject);
begin
     oSelectedColorPanel := TUniContainerPanel(sender);
     oSelectedColorCopyLast := oSelectedColorPanel.Color;
     oSelectedColorPanelLast := oSelectedColorPanel;
     rc_UpdateBorders( TUniContainerPanel(sender) );
     // 6.0.0.0
     edColor.Color     := oSelectedColorPanel.Color;
     edColorText.Text  := GetWebColor( ColorToString( oSelectedColorPanel.Color ) );

//     paColorPicker.Parent  := frmThemes;
//     paColorPicker.Top     := 190 + oSelectedColorPanel.Parent.Top - varI_ScrollPosition ;
//     paColorPicker.Left    := 232 - paColorPicker.Width;//paColorSelect.Left - paColorSelect.Width ;//oSelectedColorPanel.Parent.Left + oSelectedColorPanel.Parent.Left - paColorSelect.Width;
//     paColorPicker.Visible := true;

//     UniSession.AddJS(
//       //'$(''#color-picker'').spectrum({' +
//       '$(''#' + TUniControl(sender).JSId + ''').spectrum({' +
//       '  type: "text"' +
//       '});'
//      );

     paColorSelect.Parent  := Self;//frmThemes;//8.5.0.1
     paColorSelect.Top     := 190 + oSelectedColorPanel.Parent.Top - varI_ScrollPosition - 35;
     paColorSelect.Left    := 232 - paColorSelect.Width;
     paColorSelect.Visible := true;
end;

procedure TfrmThemes.btnSelColor_LoginMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   cNameComp : string;
begin
     cNameComp := TUniPanel( sender ).Name;
     if Button = TMouseButton.mbRight then
     begin
         if TUniPanel( Self.FindComponent( 'paBorder' + Copy( cNameComp , Pos( '_' , cNameComp ) + 1 , 100 ) ) ).Tag = 1 then
         begin
            {$IFDEF DEBUG}
            mm.BrowserOptions := [boDisableMouseRightClick, boDisableChromeRefresh];
            UniSession.AddJS('document.oncontextmenu = document.body.oncontextmenu = function () { return false; }');
            {$ENDIF}
            popMenuOptions.PopupBy( TUniButton( sender ) );
         end;

     end;
end;

procedure TfrmThemes.optCopyClick(Sender: TObject);
begin
    oSelectedColorPanel.Tag := 1;
    oSelectedColorCopy := oSelectedColorPanel.Color;
    optPaste.Enabled   := true;
    {$IFDEF DEBUG}
    mm.BrowserOptions := [boDisableMouseRightClick, boDisableChromeRefresh];
    UniSession.AddJS('document.oncontextmenu = document.body.oncontextmenu = function () { return true; }');
    {$ENDIF}
end;

procedure TfrmThemes.optPasteClick(Sender: TObject);
begin
    oSelectedColorPanel.Color := oSelectedColorCopy;
    {$IFDEF DEBUG}
    mm.BrowserOptions := [boDisableChromeRefresh];
    UniSession.AddJS('document.oncontextmenu = document.body.oncontextmenu = function () { return true; }');
    {$ENDIF}
    oSelectedColorPanel.Tag := 0;
    optUndo.Enabled := true;
    optPaste.Enabled := false;
    rc_PreviewSelectedColor;
end;

procedure TfrmThemes.optUndoClick(Sender: TObject);
begin
    optUndo.Enabled := false;
    oSelectedColorPanel := oSelectedColorPanelLast;
    oSelectedColorCopy  := oSelectedColorCopyLast;
    oSelectedColorPanel.Tag := 0;
    oSelectedColorPanel.Color := oSelectedColorCopy;
    {$IFDEF DEBUG}
    mm.BrowserOptions := [boDisableMouseRightClick, boDisableChromeRefresh];
    UniSession.AddJS('document.oncontextmenu = document.body.oncontextmenu = function () { return true; }');
    {$ENDIF}
    rc_PreviewSelectedColor;
end;
//8.1.0.0
procedure TfrmThemes.btnTestConnectClick(Sender: TObject);
var
   cMsg, cQry,
   tCONFIG_DATABASE,
   tCONFIG_DATABASE_HOST_IP    : string;
   tCONFIG_DATABASE_PORT  : integer;
   tCONFIG_DATABASE_USERNAME  ,
   tCONFIG_DATABASE_PASSWORD ,
   tDATABASE_ACTIVE,
   tCONFIG_DATABASE_NAME         : string;
begin
{<*RC DB}
   tCONFIG_DATABASE               := mm.CONFIG_DATABASE ;
   tCONFIG_DATABASE_HOST_IP       := mm.CONFIG_DATABASE_HOST_IP;
   tCONFIG_DATABASE_PORT          := mm.CONFIG_DATABASE_PORT;
   tCONFIG_DATABASE_USERNAME      := mm.CONFIG_DATABASE_USERNAME;
   tCONFIG_DATABASE_PASSWORD      := mm.CONFIG_DATABASE_PASSWORD;
   tCONFIG_DATABASE_NAME          := mm.CONFIG_DATABASE_NAME;
   tDATABASE_ACTIVE               := mm.DATABASE_ACTIVE;

   mm.CONFIG_DATABASE             := cbDatabase.Text;
   mm.CONFIG_DATABASE_HOST_IP     := edIP.Text;
   mm.CONFIG_DATABASE_PORT        := StrToIntDef( edPort.Text, 0 );
   mm.CONFIG_DATABASE_USERNAME    := edUser.Text;
   mm.CONFIG_DATABASE_PASSWORD    := edPass.Text;
   mm.CONFIG_DATABASE_NAME        := edDatabaseName.Text;
   mm.DATABASE_ACTIVE             := '';

   try
      mm.varB_OperationProcessed := dm_rc.rc_ConnectDB( mm.CONFIG_DATABASE , mm.SQLConn );
      //8.1.0.0
      if mm.varB_OperationProcessed then
      begin
         cMSg := '';
         rc_AdjustDatabase( cMsg );

         mm.varC_LastErrorMsg := cMsg;
         if mm.varC_LastErrorMsg <> '' then
         begin
            dm_rc.rc_ShowError( mm.MSG_CONTACT_SUPPORT + sLineBreak + sLineBreak +
                                mm.varC_LastErrorMsg );
            Abort;
         end;

         cMsg := 'Connected !';
         if chkClearData.Checked then
            cMsg := cMsg + ' All sample data deleted!';
         dm_rc.rc_ShowSweetAlert( 'Config', cMsg, 'success' )
      end
      else
         dm_rc.rc_ShowSweetAlert( 'Config', 'Connection Failed !', 'error' );
   finally
      mm.CONFIG_DATABASE               := tCONFIG_DATABASE;
      mm.CONFIG_DATABASE_HOST_IP       := tCONFIG_DATABASE_HOST_IP;
      mm.CONFIG_DATABASE_PORT          := tCONFIG_DATABASE_PORT;
      mm.CONFIG_DATABASE_USERNAME      := tCONFIG_DATABASE_USERNAME;
      mm.CONFIG_DATABASE_PASSWORD      := tCONFIG_DATABASE_PASSWORD;
      mm.CONFIG_DATABASE_NAME          := tCONFIG_DATABASE_NAME;
      mm.DATABASE_ACTIVE               := tDATABASE_ACTIVE;
   end;
{RC DB*>}
end;

procedure TfrmThemes.cbLanguageSelect(Sender: TObject);
var
i : integer;
begin
     cbLanguage.Text := dm_rc.rc_StripHtmlTags( cbLanguage.Text );

     i := dm_rc.rc_GetIndexFromArray( cbLanguage.Text, ARRAY_LANGUAGES ) ;
     mm.CONFIG_LANGUAGE := ARRAY_LANGUAGES[ i ];

     if i > 0 then
        if ( mm.CONFIG_LANGUAGE <> 'ar' ) then
           sm.ExtLocale  := mm.CONFIG_LANGUAGE;

     dm_rc.rc_SaveTheme( 'active' );
     dm_rc.rc_SaveTheme( mm.CONFIG_LAYOUT_ACTIVE_THEME );
     btnOkClick( self );

     UniApplication.Cookies.SetCookie('_language' + APP_NAME + mm.vUserEmail, mm.CONFIG_LANGUAGE, 0);
     UniApplication.Cookies.SetCookie('_language_login' + APP_NAME, mm.vUserEmail, 0);

     UniApplication.Restart;
end;

procedure TfrmThemes.cbxFontsSelect(Sender: TObject);
begin
     mm.CONFIG_LAYOUT_APP_FONT := rc_StripHtmlTags( cbxFonts.Text );
     dm_rc.rc_SaveTheme( 'active' );
     dm_rc.rc_SaveTheme( mm.CONFIG_LAYOUT_ACTIVE_THEME );
     btnOkClick( self );
     UniApplication.Restart;
end;

procedure TfrmThemes.cbxLabelsFontWeightChange(Sender: TObject);
begin
     mm.CONFIG_LAYOUT_LABEL_WEIGHT := cbxLabelsFontWeight.Text;
end;

procedure TfrmThemes.cbxLoadMaskFileChange(Sender: TObject);
begin
     imgLoadMask.Caption :=
       '<img id="maskimg" src="files/images/loaders/' + cbxLoadMaskFile.Text + '" alt="Mask Img">';
end;
//7.5.0.0 login
procedure TfrmThemes.cbxLoginModelChange(Sender: TObject);
begin
     chkLoginWithExtraImg.Enabled := Pos( cbxLoginModel.ItemIndex.ToString , '2 3' ) > 0;
     chkLoginWelcomeBox.Checked := ( cbxLoginModel.ItemIndex = 5 ) or ( cbxLoginModel.ItemIndex = 6 );

     chkLoginWelcomeBox.Enabled := ( cbxLoginModel.ItemIndex <> 4 ) and
                                   ( cbxLoginModel.ItemIndex <> 5 ) and
                                   ( cbxLoginModel.ItemIndex <> 6 ) ;

     if chkLoginWelcomeBox.Checked then
     begin
        if ( cbxLoginModel.ItemIndex <> 5 ) and ( cbxLoginModel.ItemIndex <> 6 ) then
           chkLoginWelcomeBox.Checked := chkLoginWelcomeBox.Enabled;
     end;
end;
//7.5.0.0
procedure TfrmThemes.chkLoginBgSolidChange(Sender: TObject);
begin
     //chkLoginWithExtraImg.Checked := false;
     chkLoginWithImgBG.Checked := false;
end;

procedure TfrmThemes.chkLoginInvertImgChange(Sender: TObject);
begin
     if ( chkLoginInvertImg.Checked ) then
     begin
        chkLoginWithExtraImg.Checked := false;
        chkLoginWelcomeBox.Checked := true;
     end;
end;

procedure TfrmThemes.chkLoginWithExtraImgChange(Sender: TObject);
begin
     if ( chkLoginWelcomeBox.Checked ) and ( chkLoginWithExtraImg.Checked ) then
     begin
        chkLoginWelcomeBox.Checked := false;
     end
     else
     if not chkLoginInvertImg.Checked then
        chkLoginWelcomeBox.Checked := true;
end;
//7.5.0.0
procedure TfrmThemes.chkLoginWithImgBGChange(Sender: TObject);
begin
     chkLoginBgSolid.Checked := false;
end;

procedure TfrmThemes.chkMenuClick(Sender: TObject);
begin
     chkMicroMenu.Checked := false;
     chkMicroMenuAutoClose.Checked := true;//false;//8.0.0.0
     chkMicroMenuAutoClose.enabled := false;
end;

procedure TfrmThemes.chkMicroMenuClick(Sender: TObject);
begin
     chkMenu.Checked := false;
     chkMicroMenuAutoClose.Checked := false;
     chkMicroMenuAutoClose.enabled := true;
end;

procedure TfrmThemes.chkTabsOffClick(Sender: TObject);
begin
     if mm.oPgGeneral.PageCount > 1 then
     begin
        dm_rc.rc_ShowMessage( 'Close All Tabs Before Disable Tabs.' );
        chkTabsOff.Checked := false;
     end
     else
     begin
        if UniApplication.FindComponent('MainForm' ) <> nil then
           if MainForm.FindComponent( 'paBS_Tabs' ) <> nil then
              TUniControl( MainForm.FindComponent( 'paBS_Tabs' ) ).Visible := not chkTabsOff.Checked;
     end;
end;

procedure TfrmThemes.chkVirtualKeyboardClick(Sender: TObject);
begin
     if chkVirtualKeyboard.Checked then
        chkScrollKeyboardOffset.Checked := false;
end;

procedure TfrmThemes.edColorTextChange(Sender: TObject);
begin
   rc_ChangeColor( edColorText.Text ); // 6.0.0.0
end;

procedure TfrmThemes.btnExitClick(Sender: TObject);
begin
     imgLoadMask.Caption := '';
     mm.varB_Yes := False;
     mm.varB_No := True;
     Self.ModalResult := mrNone;

     rc_jQueryAnimate( Self, 'left' ,
                             varIIF( mm.RTL , IntTostr( Self.Width*(-1) ), IntTostr( UniSession.UniApplication.ScreenWidth ) ),
                             '200', '', '', '', '', '',
                             'ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_CloseForm", ["form=" + ' + QuotedStr( Self.Name ) + '] );' );
end;

procedure TfrmThemes.btnDefaultClick(Sender: TObject);
begin
     dm_rc.rc_LoadTheme( 'default' );
     dm_rc.rc_SaveTheme( 'active' );
     mm.CONFIG_LAYOUT_ACTIVE_THEME := 'default';
     dm_rc.rc_SaveTheme( mm.CONFIG_LAYOUT_ACTIVE_THEME );

     rc_UpdateColorButtons;
end;

procedure TfrmThemes.UniBitBtn1Click(Sender: TObject);
begin
     //exit;
     frmTranslate.WebForm.JSInterface.JSCall( 'addCls' , ['form-noborder']);

     frmTranslate.Show( procedure(Sender: TComponent; Result:Integer)
                            begin
                              //callback....nesse caso, não é necessário tratar o retorno
                            end
                          );
end;

procedure TfrmThemes.btnMailTestClick(Sender: TObject);
var
   cMessage: Tstrings;
begin
       if edEmailUSer.Text = '' then
       begin
            dm_rc.rc_ShowMessage( 'Email:' + mm.MSG_VALIDATE_OR_BLANK_CONTENT );
            Exit;
       end
       else
       begin
           dm_rc.rc_ShowInputBox( 'Email Test' , 'Email to:' , '', '', '', false );

           if mm.varC_InputBox_Result1 = '' then
           begin
             dm_rc.rc_ShowMessage( 'Email:' + mm.MSG_VALIDATE_OR_BLANK_CONTENT );
             Exit;
           end;

           if swtEmailHtml.Tag = 0 then
           begin
             cMessage := TstringList.Create;

             cMessage.Add( ' ' );
             cMessage.Add( APP_NAME + ': Email Test' );
             cMessage.Add( ' ' );
             cMessage.Add( SOFTWAREHOUSE_NAME );
             cMessage.Add( ' ' );
             cMessage.Add( 'Phone: ' + SOFTWAREHOUSE_COMMERCIAL_PHONE );
             cMessage.Add( StringOfChar( '-' , 35 ) );
             cMessage.Add( mm.MSG_EMAIL_DO_NOT_REPLY );
             cMessage.Add( StringOfChar( '-' , 35 ) );
  //           CC := TstringList.Create;
  //           CC.Add( mm.varC_TempString ) ;
           end
           else
           begin
             cMessage := TstringList.Create;

             cMessage.Add( '<html>' );
             cMessage.Add( '<body>' );
             cMessage.Add( '<h1><font color=''red''>' + APP_NAME + ': Email Test </font></h1>' );
             cMessage.Add( '<p><strong>' + SOFTWAREHOUSE_NAME + '</strong></p>' );
             cMessage.Add( '<strong>Phone:</strong>' + SOFTWAREHOUSE_COMMERCIAL_PHONE + '<br>' );
             cMessage.Add( '<hr>' );
             cMessage.Add( mm.MSG_EMAIL_DO_NOT_REPLY + '<br>' );
             cMessage.Add( '<hr>' );
             cMessage.Add( '</body>' );
             cMessage.Add( '</html>' );
           end;

           Sleep(100);

           //7.3.0.0
           if swtEmailThreaded.tag = 1 then
           begin
              mm.varB_OperationProcessed := true;
              SendMailThreaded( edEmail.Text ,
                                edEmailPass.Text ,
                                edEmailHost.Text ,
                                edEmailSmtpPort.Text,
                                SOFTWAREHOUSE_NAME,
                                edEmail.Text ,
                                mm.varC_InputBox_Result1,
                                '',
                                '[' + APP_NAME + '] Email Test',
                                cMessage,
                                mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_TLS = '1',
                                mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SSL = '1',
                                true,
                                ''
                               )
           end
           else
           begin
              if swtEmailHtml.Tag = 0 then
                 mm.varB_OperationProcessed := rc_MailSend( edEmail.Text ,
                                                            edEmailPass.Text ,
                                                            edEmailHost.Text ,
                                                            edEmailSmtpPort.Text,
                                                            SOFTWAREHOUSE_NAME,
                                                            edEmail.Text ,
                                                            mm.varC_InputBox_Result1,
                                                            '',
                                                            '[' + APP_NAME + '] Email Test',
                                                            cMessage,
                                                            ( swtEmailTLS.Tag = 1 ),
                                                            false,
                                                            ( swtEmailHtml.Tag = 1 ),
                                                            //'files' + mm.BACKSLASH + 'css' + mm.BACKSLASH + 'servermodule_custom.css'
                                                            'D:\MIGRACOES PARA RADCORE\RCNewAppBRASIL_7303_FB5\files\pdf\Bem_Vindo_ao_Trunk1.pdf;'+
                                                            'D:\MIGRACOES PARA RADCORE\RCNewAppBRASIL_7303_FB5\files\pdf\Bem_Vindo_ao_Trunk2.pdf'
                                                          )
              else
                 mm.varB_OperationProcessed := rc_SendHtmlMail( edEmail.Text ,
                                                                edEmailPass.Text ,
                                                                edEmailHost.Text ,
                                                                edEmailSmtpPort.Text,
                                                                SOFTWAREHOUSE_NAME,
                                                                edEmail.Text ,
                                                                mm.varC_InputBox_Result1,
                                                                '',
                                                                '[' + APP_NAME + '] Email Test',
                                                                cMessage,
                                                                mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_TLS = '1',
                                                                mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SSL = '1',
                                                                true,
                                                                ''
                                                               );
           end;

           if mm.varB_OperationProcessed then
              dm_rc.rc_ShowSweetAlert( 'Email', 'Sent !', 'success' ) ;
       end;
end;

procedure TfrmThemes.UniFormCreate(Sender: TObject);
var
   cFontList : TStringList;
   cTemp, cFontName : string;
   I, F : integer;
   IniFile : TIniFile;//8.0.0.0
begin
     //7.5.0.0
     labActiveTheme.Caption := mm.CONFIG_LAYOUT_ACTIVE_THEME;
     If FindComponent( 'btn' + mm.CONFIG_LAYOUT_ACTIVE_THEME ) <> nil then
     begin
          paActiveTheme.Color := TUniContainerPanel( FindComponent( 'btn' + mm.CONFIG_LAYOUT_ACTIVE_THEME ) ).Color;
     end;

     optUndo.Enabled    := false;
     optCopy.Enabled  := true;
     optPaste.Enabled := false;

     rc_AddCssClass( Self, 'form-noborder' );

     f := 0;
     pgConfig.ActivePage := tabColors;
     //
     cbxFonts.Items.Clear;
     cFontList := TStringList.Create;
     cfontList.LoadFromFile( sm.FilesFolderPath + 'themes' + mm.BACKSLASH + 'rc-fonts.txt' );
     for I := 0 to cFontList.Count - 1 do
     begin
        cFontName := cFontList.Strings[I];
        if Pos( ':', cFontName ) > 0 then
        begin
           cTemp := Trim( Copy( cFontName, 1, Pos( ':', cFontName ) - 1 ) );
           cFontName := cTemp + '<div><style display="none">' + Trim( Copy( cFontName, Pos( ':', cFontName ) ) ) + '</style></div>';
        end;
        cbxFonts.Items.Add( cFontName );
     end;
     cFontList.Free;

     rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );

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

     btnBlue.Color   := COLOR_BLUE;
     btnRed.Color    := COLOR_RED;
     btnOrange.Color := COLOR_ORANGE;
     btnGreen.Color  := COLOR_GREEN;
     btnGray.Color   := COLOR_GRAY;

     htmlFrame.html.Text :=
     '<canvas id="colorCanvas" class="color-canvas" width="195" height="195"></canvas>' +
     '<script>' +
     '    var canvasEl = document.getElementById(''colorCanvas'');' +
     '    var canvasContext = canvasEl.getContext(''2d'');' +
     '' +
     '    var image = new Image(195, 195);' +
     '    image.onload = () => canvasContext.drawImage(image, 0, 0, image.width, image.height); ' +
     '    image.src = "files/images/colortable.jpg";' +
     '' +
     'var rgbToHex = function (rgb) { ' +
     '  var hex = Number(rgb).toString(16);' +
     '  if (hex.length < 2) {' +
     '       hex = "0" + hex;' +
     '  }' +
     '  return hex;' +
     '};    ' +
     'var fullColorHex = function(r,g,b) {   ' +
     '  var red = rgbToHex(r);' +
     '  var green = rgbToHex(g);' +
     '  var blue = rgbToHex(b);' +
     '  return red+green+blue;' +
     '};' +

     '    canvasEl.onclick = function(mouseEvent) ' +
     '    {' +
     '      var imgData = canvasContext.getImageData(mouseEvent.offsetX, mouseEvent.offsetY, 1, 1);' +
     '      var rgba = imgData.data;' +
     '      ajaxRequest( ' + Self.htmlFrame.JSName + '  , "colorpixel", ["color_hex=" + fullColorHex(rgba[0], rgba[1], rgba[2])]);' +// + "," + "color_r=" + rgba[0] + ", " + "color_g=" + rgba[1] + ", " + "color_b=" + rgba[2] ]);' +
//     '      alert("rgba(" + rgba[0] + ", " + rgba[1] + ", " + rgba[2] + ", " + rgba[3] + ")");' +
     '    }' +
     '</script>' ;

     oSelectedColorPanel := btnSelColor_Login;
     labSelectedColor.Font.Color := btnSelColor_Login.Color;
     rc_UpdateBorders( btnSelColor_Login );

    // controle de cores
    btnSelColor_Menu.Color                    := StringToColor( mm.CONFIG_LAYOUT_MENU_COLOR );// '$00373737';
    btnSelColor_MenuFont.Color                := StringToColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR );// '$00373737';
    btnSelColor_MenuFontGroup.Color           := StringToColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR_GROUP );// '$00373737';
    btnSelColor_MenuLogoBG.Color              := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR );// '$00373737';
    btnSelColor_MenuLogoFont.Color            := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR );// '$00373737';
    btnSelColor_Login.Color                   := StringToColor( mm.CONFIG_LAYOUT_LOGIN_COLOR );
    btnSelColor_FormLabel.Color               := StringToColor( mm.CONFIG_LAYOUT_LABEL_COLOR );
    btnSelColor_Button_Color.Color            := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR );
    btnSelColor_Button_Color_Crud.Color       := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD );
    btnSelColor_Button_Color_hover.Color      := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_HOVER );
    btnSelColor_Button_Color_Crud_hover.Color := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD_HOVER );
    btnSelColor_GridSelect.Color              := StringToColor( mm.CONFIG_LAYOUT_GRID_SEL_COLOR );
    btnSelColor_GridTitleBG.Color             := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_BG );
    btnSelColor_GridTitleCOLOR.Color          := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR );
    btnSelColor_GridTitleColorBGOver.Color    := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_BG_OVER );
    btnSelColor_GridTitleColorOver.Color      := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_OVER );
    btnSelColor_GridTitleColorIcon.Color      := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_ICON );

    btnSelColor_EditFoco.Color                := StringToColor( mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR );
    btnSelColor_EditColor.Color               := StringToColor( mm.CONFIG_LAYOUT_EDIT_COLOR );
    btnSelColor_EditColorBorder.Color         := StringToColor( mm.CONFIG_LAYOUT_EDIT_BORDER_COLOR );//7.0.0.0//
    btnSelColor_EditColorFont.Color           := StringToColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR );
    btnSelColor_EditColorReadOnly.Color       := StringToColor( mm.CONFIG_LAYOUT_EDIT_COLOR_READONLY );
    btnSelColor_EditColorFontReadOnly.Color   := StringToColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY );
    btnSelColor_EditColorTrigger.Color        := StringToColor( mm.CONFIG_LAYOUT_EDIT_COLOR_TRIGGER );
    btnSelColor_EditColorFontTrigger.Color    := StringToColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_TRIGGER );

    btnSelColor_LookUp.Color                  := StringToColor( mm.CONFIG_LAYOUT_EDLKP_COLOR );
    btnSelColor_LookUpFont.Color              := StringToColor( mm.CONFIG_LAYOUT_EDLKP_FONT_COLOR );

    chkTabColor.Checked                       := mm.CONFIG_LAYOUT_TAB_COLOR_FOCUS = 'ON' ;

    chkBgThemeColorFocusActive.Checked        := mm.CONFIG_LAYOUT_EDIT_FOCUS_ACTIVE = 'ON' ;//8.0.0.0 focus active
    chkBgThemedLookUp.Checked                 := mm.CONFIG_LAYOUT_LOOKUP_THEMED = 'ON' ;//8.0.0.0

    cTemp := mm.CONFIG_LAYOUT_APP_FONT;
    if Pos( ':', mm.CONFIG_LAYOUT_APP_FONT ) > 0 then
    begin
         cTemp := mm.CONFIG_LAYOUT_APP_FONT;
         cFontName := Copy( cTemp, 1, Pos( ':', cTemp ) - 1 );
         cFontName := cFontName + '<div><style display="none">' + Trim( Copy( cTemp, Pos( ':', cTemp ) ) ) + '</style></div>';
         cTemp     := cFontName;
    end;
    cbxFonts.ItemIndex                        := cbxFonts.Items.IndexOf( cTemp );

     try
       IniFile := TiniFile.Create( sm.FilesFolderPath + StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] ) + '_cfg.ini' );
       // App
       edAjaxTimeOut.Text := IntToStr( IniFile.ReadInteger('App', 'ajax_timeout' , 60000 ) ) ; //8.0.0.0
       edAppPort.Text     := IntToStr( IniFile.ReadInteger('App', 'app_port' , StrToInt(APP_PORT) ) ) ; //8.0.0.0
     finally
       IniFile.Free;
     end;

    chkSessionLog.Checked                     := mm.CONFIG_SESSION_LOG;
    edSessionTimeOut.Text                     := mm.CONFIG_SESSION_TIMEOUT.ToString; // 6.0.0.0
    chkAllFont.Checked                        := mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' ;
    cbxFontAwsVersion.ItemIndex               := StrToIntDef( mm.CONFIG_LAYOUT_FONTAWS, 5 ) - 5;
//    case StrToIntDef( mm.CONFIG_LAYOUT_FONTAWS, 0 ) of
//
//       5 : cbxFontAwsVersion.ItemIndex := 0;
//       6 : cbxFontAwsVersion.ItemIndex := 1;
//       7 : cbxFontAwsVersion.ItemIndex := 2;
//
//    end;
    chkBSIcons.Checked                        := mm.CONFIG_LAYOUT_BSICONS = 'ON' ; //8.2.0.0
    chkFormRounded.Checked                    := mm.CONFIG_LAYOUT_ROUND_FORM = 'ON' ;
    chkBorderRounded.Checked                  := mm.CONFIG_LAYOUT_ROUND_EDIT = 'ON' ;
    edEditFactor.Text                         := mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR ;
    edPanelFactor.Text                        := mm.CONFIG_LAYOUT_ROUND_PANEL_FACTOR ;
    edBtnFactor.Text                          := mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR ;
    chkLabelWrap.Checked                      := mm.CONFIG_LAYOUT_LABEL_WRAP = 'ON' ;
    cbxLabelsFontWeight.ItemIndex             := cbxLabelsFontWeight.Items.IndexOf( mm.CONFIG_LAYOUT_LABEL_WEIGHT );
    chkUserBG.Checked                         := mm.CONFIG_LAYOUT_USER_BG = 'ON' ;
    chkLabelsFormsDefault.Checked             := mm.CONFIG_LAYOUT_LABEL_FORMS_DEFAULT = 'ON';
    btnSelColor_Bg.Color                      := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
    edOffSet.Text                             := mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET ;
    edMaxOpenTabs.Text                        := mm.CONFIG_LAYOUT_TAB_MAX_OPENED;
    chkTabsOff.Checked                        := mm.CONFIG_LAYOUT_TAB_OFF = 'ON' ;
    chkTabsBtn.Checked                        := mm.CONFIG_LAYOUT_TAB_BUTTONS = 'ON' ; // 6.0.0.0
    chkTabColorThemeBorder.Checked            := mm.CONFIG_LAYOUT_TAB_THEME_BORDER = 'ON' ; // 6.0.0.0
    chkTabBorderBottom.Checked                := mm.CONFIG_LAYOUT_TAB_BORDER_OFF = 'ON' ; // 6.0.0.0

    chkTabsOffMobile.Checked                  := mm.CONFIG_LAYOUT_HIDE_TABS_ON_MOBILE = 'ON' ;
    chkMenuTopPanelOffMobile.Checked          := mm.CONFIG_LAYOUT_HIDE_TOPPANEL_ON_MOBILE = 'ON' ;

    chkScrollKeyboardOffset.Checked           := False;//mm.CONFIG_LAYOUT_KEYBOARD_SCROLL_ON_MOBILE = 'ON' ;//8.0.0.0
    chkVirtualKeyboard.Checked                := mm.CONFIG_LAYOUT_KEYBOARD_VIRTUAL_ON_MOBILE = 'ON' ;
    chkVirtualKeyboardDesktop.Checked         := mm.CONFIG_LAYOUT_KEYBOARD_VIRTUAL_ON_DESKTOP = 'ON' ; // 6.0.0.0

    chkGridBlockAnim.Checked                  := mm.CONFIG_LAYOUT_GRIDBLOCK_ANIM = 'ON' ;
    chkAnimEffects.Checked                    := mm.CONFIG_LAYOUT_ANIM_EFFECTS = 'ON' ;//7.4.0.0
    edMenuFontSize.Text                       := mm.CONFIG_LAYOUT_MENUFONT_SIZE ;
    edMenuTextWidth.Text                      := mm.CONFIG_LAYOUT_MENU_TEXT_WIDTH; //7.5.0.0 menu
    edMenuWidth.Text                          := mm.CONFIG_LAYOUT_MENU_WIDTH;      //7.5.0.0 menu
    edMenuLineHeight.Text                     := mm.CONFIG_LAYOUT_MENU_LINE_HEIGHT;//7.5.0.0 menu
    chkMenu.Checked                           := mm.CONFIG_LAYOUT_MENU_TYPE = '1';
    chkMicroMenu.Checked                      := mm.CONFIG_LAYOUT_MENU_TYPE = '2'; // 6.0.0.0
    chkMicroMenuAutoClose.Checked             := mm.CONFIG_LAYOUT_MENU_TYPE_AUTOCLOSE = 'ON'; // 6.0.0.0+menu micro
    chkMenuCallAnim.Checked                   := mm.CONFIG_LAYOUT_MENU_CALL_ANIM = 'ON';//7.3.0.0
    chkRCTranslate.Checked                    := mm.CONFIG_RC_TRANSLATE = 'ON' ; // 6.0.0.0
    chkRCGuideTour.Checked                    := mm.CONFIG_RC_GUIDETOUR = 'ON' ; // 6.0.0.0
    chkAppDataFolder.Checked                  := mm.CONFIG_APP_DATA_FOLDER = 'ON' ; // 6.0.0.0
    chkButtonNoFocus.Checked                  := mm.CONFIG_APP_BUTTON_NOFOCUS = 'ON' ; // 7.0.0.0 nofocus

    edCurrencySymbol.Text                     := mm.CONFIG_CURRENCY_SYMBOL;
    edCurrencyName.Text                       := mm.CONFIG_CURRENCY_NAME;
    edCurrencyNamePlural.Text                 := mm.CONFIG_CURRENCY_NAME_PLURAL;

    cbxLoginModel.ItemIndex                   := mm.CONFIG_LOGIN_MODEL.ToInteger;
    cbxLoginModelChange( self );
    chkLoginWithVideoBG.Checked               := mm.CONFIG_LOGIN_BG_VIDEO = 'ON';
    chkLoginWithImgBG.Checked                 := mm.CONFIG_LOGIN_BG_IMAGE = 'ON';
    chkLoginBgFixed.Checked                   := mm.CONFIG_LOGIN_BG_FIXED = 'ON';
    chkLoginBgSolid.Checked                   := mm.CONFIG_LAYOUT_LOGIN_BG_SOLID = 'ON'; //7.5.0.0 login
    chkLoginWithExtraImg.Checked              := mm.CONFIG_LOGIN_BG_IMAGE_EXTRA = 'ON';
    chkLoginInvertImg.Checked                 := mm.CONFIG_LOGIN_BG_IMAGE_INVERTED = 'ON';
    chkLoginLanguage.Checked                  := mm.CONFIG_LOGIN_LANGUAGE = 'ON';
    chkLoginWelcomeBox.Checked                := mm.CONFIG_LOGIN_WELCOMEBOX = 'ON';
    // para formulários, deve-se efetuar o ResizeBlocks | For forms, resizeblocks should be made
    rc_RenderLayout( Self, true, true, true );
    // ammar feedback
    Self.Left := mm.varI_ScreenWidth + 600;
    if mm.RTL then
       Self.Left := 0
    else
       Self.Left := mm.varI_ScreenWidth + 600;
End;

procedure TfrmThemes.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 27 then
     begin
          mm.varB_Yes := False;
          mm.varB_No := True;
          Self.ModalResult := mrNone;
          Close;
     end;
end;

procedure TfrmThemes.UniFormReady(Sender: TObject);
begin
     dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure TfrmThemes.UniFormShow(Sender: TObject);
begin
  inherited;
    // database
    {<*RC DB}
    cbDatabase.ItemIndex := cbDatabase.Items.IndexOf( mm.CONFIG_DATABASE );
    edDatabaseName.Text  := mm.CONFIG_DATABASE_NAME;
    edIp.Text            := mm.CONFIG_DATABASE_HOST_IP;
    edPort.Text          := mm.CONFIG_DATABASE_PORT.ToString;
    edUser.Text          := mm.CONFIG_DATABASE_USERNAME;
    edPass.Text          := mm.CONFIG_DATABASE_PASSWORD;
    {RC DB*>}
    // email
    edEmail.Text         := mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER;
    edEmailHost.Text     := mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_HOST;
    edEmailSmtpPort.Text := mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SMTP_PORT;
    edEmailUSer.Text     := mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_USER;
    edEmailPass.Text     := mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_PASS;
    //swtEmailConfirm.Tag  := varIIF( mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_CONFIRMATION = mm.VALUE_YES, 1, 0 ); //7.3.0.0
    swtEmailThreaded.Tag := StrToIntDef( mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_THREAD, 0 ) ; //7.3.0.0
    swtEmailHtml.Tag     := 0;//varIIF( mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_THREAD = 'S', 1, 0 );
    swtEmailTLS.Tag      := StrToIntDef( mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_TLS , 0 );
    swtEmailSSL.Tag      := StrToIntDef( mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SSL , 0 );
    //7.3.0.0
    //dm_rc.rc_SwtCheck( self, 'swtEmailConfirm' , ( swtEmailConfirm.Tag = 1 ), true );
    dm_rc.rc_SwtCheck( self, 'swtEmailThreaded' , ( swtEmailThreaded.Tag = 1 ), true );
    dm_rc.rc_SwtCheck( self, 'swtEmailTLS'      , ( swtEmailTLS.Tag = 1 ), true );
    dm_rc.rc_SwtCheck( self, 'swtEmailSSL'      , ( swtEmailSSL.Tag = 1 ), true );

    Self.Height := mm.varI_ScreenHeight;
    Self.Top    := 0;

    rc_jQueryAnimate( Self, 'right' , IntTostr( Self.Left + self.Width ), '200' );

    edScrollBarSize.Text           := mm.CONFIG_LAYOUT_SCROLLBAR_SIZE;
    //7.2.0.0
    chkScrollBarThin.Checked       := edScrollBarSize.Text = '1';

    chkScrollBarHideMobile.Checked := mm.CONFIG_LAYOUT_SCROLLBAR_MOBILE_OFF = 'ON'; // 6.0.0.0
    chkGridBold.Checked            := mm.CONFIG_LAYOUT_GRID_TITLE_BOLD = 'ON';
    chkGridUpperCase.Checked       := mm.CONFIG_LAYOUT_GRID_TITLE_UPPER = 'ON';
    edGridRowHeight.Text           := mm.CONFIG_LAYOUT_GRID_ROW_HEIGHT;
    edGridTitleHeight.Text         := mm.CONFIG_LAYOUT_GRID_TITLE_HEIGHT;//7.5.0.0
    edGridFontSize.Text            := mm.CONFIG_LAYOUT_GRID_FONT_SIZE; // 6.0.0.0
    edGridTitleFontSize.Text       := mm.CONFIG_LAYOUT_GRID_TITLE_FONT_SIZE; // 6.0.0.0
    chkGridPaginator.Checked       := mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR = 'ON';
    chkGridColumnSeparator.Checked := mm.CONFIG_LAYOUT_GRID_COLUMN_SEPARATOR = 'ON';
    chkLoadMaskBG.Checked          := mm.CONFIG_LAYOUT_LOADMASK_TYPE = 'BG';
    //6.0.0.1
    //rc_ComboBoxGetFiles( cbxLoadMaskFile, 'files/images/loaders','*.gif;*.svg;' );
    rc_ComboBoxGetFiles( cbxLoadMaskFile, dm_rc.rc_GetFilesPath + 'images/loaders/','*.gif;*.svg;' );
    if mm.CONFIG_LAYOUT_LOADMASK_IMG <> '' then
    begin
       cbxLoadMaskFile.ItemIndex := StrToIntDef( Copy( mm.CONFIG_LAYOUT_LOADMASK_IMG, 1, Pos( '|', mm.CONFIG_LAYOUT_LOADMASK_IMG ) - 1 ), 1 );
       imgLoadMask.Caption := '<img id="maskimg" src="files/images/loaders/' + cbxLoadMaskFile.Text + '" alt="Mask Img">';
    end;

    btnOk.SetFocus;
end;

procedure TfrmThemes.htmlFrameAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
begin
     if EventName = 'colorpixel' then
     begin
          rc_ChangeColor( Params.Values['color_hex'] );
     end;
end;

procedure TfrmThemes.labCloseColorSelectClick(Sender: TObject);
begin
     paColorSelect.Visible := false;
end;

procedure TfrmThemes.UniImage1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
myColor:TColor;
Pxl:TBitmap;
begin
   // feedback: Mesut from Turkey
   Pxl:=TBitmap.Create;
   Pxl.Width  := 1;
   Pxl.Height := 1;
   {$ifdef MSWINDOWS}
   BitBlt( Pxl.Canvas.Handle , 0 , 0 , 1 , 1 , GetDC(0) , x , y , SRCCOPY);
   {$endif}
   {$ifdef LINUX}
   //mesut
   {$endif}
   myColor := Pxl.Canvas.Pixels[0,0];

  // Retornar a cor
  labTitleFrm.Caption := ColorToString( myColor );
  // Retornar o número da cor
  labTitleFrm.Caption := labTitleFrm.Caption+' - '+IntToStr(  ColorToRGB( myColor ) );

  labTitleFrm.Font.color := StringToColor( ( ColorToString( ColorToRGB(myColor)) ));
end;

procedure TfrmThemes.btnAppDataHelpClick(Sender: TObject);
var
  cMsg : string;
begin
      case mm.varLT_Lang of
           ltpt_BR,
           ltpt_PT : begin
                       cMsg := 'Por padrão, o RadCORE cria uma pasta para cada empresa selecionada durante o LOGIN.<br>' +
                               'Se sua aplicação é multiempresa ou você deseja criar apenas uma pasta global( que se chamará \"app_data\" ), então marque essa opção.';

                     end;
           lten_US: begin
                      cMsg := 'By default, RadCORE creates a folder for each company selected during LOGIN.<br>' +
                              'If your application is multi-company or you want to create just one global folder (which will be called \"app_data\"), then check this option.';
                    end;
             lten_GB: begin
                      cMsg := 'By default, RadCORE creates a folder for each company selected during LOGIN.<br>' +
                              'If your application is multi-company or you want to create just one global folder (which will be called \"app_data\"), then check this option.';
                    end;
             ltes_ES: begin
                      cMsg := 'By default, RadCORE creates a folder for each company selected during LOGIN.<br>' +
                              'If your application is multi-company or you want to create just one global folder (which will be called \"app_data\"), then check this option.';
                    end;
             ltfr_FR: begin
                      cMsg := 'By default, RadCORE creates a folder for each company selected during LOGIN.<br>' +
                              'If your application is multi-company or you want to create just one global folder (which will be called \"app_data\"), then check this option.';
                    end;
             ltde_DE: begin
                      cMsg := 'By default, RadCORE creates a folder for each company selected during LOGIN.<br>' +
                              'If your application is multi-company or you want to create just one global folder (which will be called \"app_data\"), then check this option.';
                    end;
             ltit_IT: begin
                      cMsg := 'By default, RadCORE creates a folder for each company selected during LOGIN.<br>' +
                              'If your application is multi-company or you want to create just one global folder (which will be called \"app_data\"), then check this option.';
                    end;
             lttr_TR : begin
                      cMsg := 'By default, RadCORE creates a folder for each company selected during LOGIN.<br>' +
                              'If your application is multi-company or you want to create just one global folder (which will be called \"app_data\"), then check this option.';
                    end;
             ltru_RU : begin
                      cMsg := 'By default, RadCORE creates a folder for each company selected during LOGIN.<br>' +
                              'If your application is multi-company or you want to create just one global folder (which will be called \"app_data\"), then check this option.';
                    end;
            ltzn_CH : begin
                      cMsg := 'By default, RadCORE creates a folder for each company selected during LOGIN.<br>' +
                              'If your application is multi-company or you want to create just one global folder (which will be called \"app_data\"), then check this option.';
                    end;
            ltin_ID : begin
                      cMsg := 'By default, RadCORE creates a folder for each company selected during LOGIN.<br>' +
                              'If your application is multi-company or you want to create just one global folder (which will be called \"app_data\"), then check this option.';
                    end;
            ltth_TH : begin
                      cMsg := 'By default, RadCORE creates a folder for each company selected during LOGIN.<br>' +
                              'If your application is multi-company or you want to create just one global folder (which will be called \"app_data\"), then check this option.';
                    end;
            lthi_IN : begin
                      cMsg := 'By default, RadCORE creates a folder for each company selected during LOGIN.<br>' +
                              'If your application is multi-company or you want to create just one global folder (which will be called \"app_data\"), then check this option.';
                    end;
            ltar_SA : begin
                      cMsg := 'By default, RadCORE creates a folder for each company selected during LOGIN.<br>' +
                              'If your application is multi-company or you want to create just one global folder (which will be called \"app_data\"), then check this option.';
                    end;
      end;

   rc_CallOut( cMsg, chkAppDataFolder, ctInfo, carBottom,'0,0',crpB_T );
end;

procedure TfrmThemes.btnBlueClick(Sender: TObject);
var
   cTheme : string;
begin
     paColorSelect.Visible := false;

     if lowercase( Copy( TUniPanel(Sender).Name ,4, 20 ) ) = 'darkmode' then
        dm_rc.rc_ShowSweetAlertInfo('In development');
     mm.CONFIG_LAYOUT_ACTIVE_THEME := lowercase( Copy( TUniPanel(Sender).Name ,4, 20 ) );

     cTheme := mm.CONFIG_LAYOUT_ACTIVE_THEME;

     dm_rc.rc_LoadTheme( mm.CONFIG_LAYOUT_ACTIVE_THEME );

     mm.CONFIG_LAYOUT_ACTIVE_THEME := cTheme;

     dm_rc.rc_SaveTheme( 'active' );
     dm_rc.rc_SaveTheme( cTheme );

     mm.CONFIG_LAYOUT_ACTIVE_THEME := cTheme;

     //7.5.0.0
     labActiveTheme.Caption := mm.CONFIG_LAYOUT_ACTIVE_THEME;
     paActiveTheme.Color := TUniPanel(Sender).Color;

     TUniPanel(Sender).tag := 1;

     rc_UpdateColorButtons;
     MainForm.rc_UpdateThemeColors;
end;
//8.1.0.0
procedure TfrmThemes.rc_AdjustDatabase( var cMsg : string );
var
   cTable : string;
begin
    //if Pos ( APP_MODEL, 'STARTER BASE BRASIL GLOBAL RADFOOD RADTICKET RADKANBAN' ) = 0 then
    if Pos( 'BASE DB', APP_MODEL ) > 0 then
    begin
       //clear data
       if chkClearData.Checked then
       begin
          //usuarios
          cTable := 'usuarios_restricoes';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                            'delete from ' + cTable + ' where codiuser > 1',[] );
          cTable := 'usuarios_empresa';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                            'delete from ' + cTable + ' where codiuser > 1',[] );
          //funcioanrios
          cTable := 'funcionarios';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable + ' f where f.codigo <> ( select u.codifunc from usuarios u ) ',[] );
          //empresas
          cTable := 'empresas';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable + ' e where e.codigo <> ( select u.codiemp from usuarios u ) ',[] );
          //recibos
          cTable := 'recibos';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable,[] );
          //clientes
          cTable := 'clientes_veiculos';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable ,[] );
          cTable := 'clientes_revisoes';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable ,[] );
          cTable := 'clientes';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable ,[] );
          //carros
          cTable := 'carros';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable,[] );

          //compras
          cTable := 'compras_produtos';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable ,[] );
          cTable := 'compras';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable,[] );
          //fornecedores
          cTable := 'fornecedores';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable ,[] );
          //produtos
          cTable := 'produtos';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable ,[] );
          //grupos
          cTable := 'grupos';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable ,[] );
          //marcas
          cTable := 'marcas';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable ,[] );
          //movcaixa
          cTable := 'movcaixa';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable ,[] );
          //feriados
          cTable := 'feriados';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'delete from ' + cTable ,[] );
       end;

       //remove secondary tables
       if ( chkDropSecTables.Checked ) or ( chkDropSecTablesUser.Checked ) or ( Pos( 'BASE DB', APP_MODEL ) > 0 ) then
       begin
          //tb_test
          cTable := 'tb_test';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          //t040001
          cTable := 't040001';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable,[] );
          //tb_bigint
          cTable := 'tb_bigint';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable,[] );
          //tb_compoundpk
          cTable := 'tb_compoundpk';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          //tb_graphs
          cTable := 'tb_graphs';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          //tb_reports
          //If APP_FORTES = 'N' then
          begin
             cTable := 'tb_reports';
             if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
                cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                            'drop table ' + cTable ,[] );
          end;
       end;

       //remove secondary tables
       if ( chkDropSecTablesUser.Checked ) or ( Pos( 'BASE DB', APP_MODEL ) > 0 ) then
       begin
          //recibos
          cTable := 'recibos';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          //clientes
          cTable := 'clientes_veiculos';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          cTable := 'clientes_revisoes';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          cTable := 'clientes';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          //carros
          cTable := 'carros';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );

          //compras
          cTable := 'compras_produtos';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          cTable := 'compras';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          //fornecedores
          cTable := 'fornecedores';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          //produtos
          cTable := 'produtos';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          //grupos
          cTable := 'grupos';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          //marcas
          cTable := 'marcas';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          //movcaixa
          cTable := 'movcaixa';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          //feriados
          cTable := 'feriados';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          //ufs
          cTable := 'ufs';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );
          //cidades
          cTable := 'cidades';
          if dm_rc.rc_TableExists( mm.varB_IsNot_API, cTable ) then
             cMSg := cMSg + dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                         'drop table ' + cTable ,[] );

       end;
    end;
end;

procedure TfrmThemes.rc_ChangeColor( pParam : string );
begin
     pParam := StringReplace( pParam, '#', '', [rfReplaceAll] );
     if length( pParam ) = 6 then
     begin
        pParam := '#' + pParam ;
        oSelectedColorCopy := oSelectedColorPanel.Color;
        optUndo.Enabled   := true;

        oSelectedColor      := rc_HtmlToColor( pParam );
        // 6.0.0.0
        labSelectedColor.Font.color := oSelectedColor;
        TUniPanel( FindComponent( labSelectedColor.caption ) ).Color := oSelectedColor;
        edColor.Color     := oSelectedColor;
        edColorText.Text  := pParam;
        //preview selected color
        rc_PreviewSelectedColor;
     end;
end;

procedure TfrmThemes.rc_PreviewSelectedColor;
begin
     // controle de cores
     mm.CONFIG_LAYOUT_MENU_COLOR              := ColorToString( btnSelColor_Menu.Color );
     mm.CONFIG_LAYOUT_MENUFONT_COLOR          := ColorToString( btnSelColor_MenuFont.Color );
     mm.CONFIG_LAYOUT_MENUFONT_COLOR_GROUP    := ColorToString( btnSelColor_MenuFontGroup.Color );
     mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR      := ColorToString( btnSelColor_MenuLogoBG.Color );
     mm.CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR    := ColorToString( btnSelColor_MenuLogoFont.Color );
     mm.CONFIG_LAYOUT_LOGIN_COLOR             := ColorToString( btnSelColor_Login.Color );
     mm.CONFIG_LAYOUT_LABEL_COLOR             := ColorToString( btnSelColor_FormLabel.Color );
     mm.CONFIG_LAYOUT_BUTTON_COLOR            := ColorToString( btnSelColor_Button_Color.Color );
     mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD       := ColorToString( btnSelColor_Button_Color_Crud.Color );
     mm.CONFIG_LAYOUT_BUTTON_COLOR_HOVER      := ColorToString( btnSelColor_Button_Color_hover.Color );
     mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD_HOVER := ColorToString( btnSelColor_Button_Color_Crud_hover.Color );
     mm.CONFIG_LAYOUT_GRID_SEL_COLOR          := ColorToString( btnSelColor_GridSelect.Color );
     mm.CONFIG_LAYOUT_GRID_TITLE_BG           := ColorToString( btnSelColor_GridTitleBG.Color );
     mm.CONFIG_LAYOUT_GRID_TITLE_COLOR        := ColorToString( btnSelColor_GridTitleColor.Color );
     mm.CONFIG_LAYOUT_GRID_TITLE_BG_OVER      := ColorToString( btnSelColor_GridTitleColorBGOver.Color );
     mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_OVER   := ColorToString( btnSelColor_GridTitleColorOver.Color );
     mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_ICON   := ColorToString( btnSelColor_GridTitleColorIcon.Color );

     mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR        := ColorToString( btnSelColor_EditFoco.Color );
     mm.CONFIG_LAYOUT_EDIT_COLOR              := ColorToString( btnSelColor_EditColor.Color );
     mm.CONFIG_LAYOUT_EDIT_BORDER_COLOR       := ColorToString( btnSelColor_EditColorBorder.Color ); //7.0.0.0
     mm.CONFIG_LAYOUT_EDIT_FONT_COLOR         := ColorToString( btnSelColor_EditColorFont.Color );
     mm.CONFIG_LAYOUT_EDIT_COLOR_READONLY     := ColorToString( btnSelColor_EditColorReadOnly.Color );
     mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY:= ColorToString( btnSelColor_EditColorFontReadOnly.Color );
     mm.CONFIG_LAYOUT_EDIT_COLOR_TRIGGER      := ColorToString( btnSelColor_EditColorTrigger.Color );
     mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_TRIGGER := ColorToString( btnSelColor_EditColorFontTrigger.Color );
     mm.CONFIG_LAYOUT_EDLKP_COLOR             := ColorToString( btnSelColor_LookUp.Color );
     mm.CONFIG_LAYOUT_EDLKP_FONT_COLOR        := ColorToString( btnSelColor_LookUpFont.Color );
     mm.CONFIG_LAYOUT_BG_COLOR                := ColorToString( btnSelColor_Bg.Color );
     mm.CONFIG_LAYOUT_LINK_COLOR              := ColorToString( btnSelCOLOR_LINK.Color );
     mm.CONFIG_LAYOUT_LINKHOVER_COLOR         := ColorToString( btnSelCOLOR_LINKHOVER.Color );

     dm_rc.rc_RenderControls( MainForm );
     //7.2.0.0
     if MainForm.FindComponent( 'paLayoutLogo' ) <> nil then
     begin
        //TUniContainerPanel( MainForm.FindComponent( 'paLayoutLogo' ) ).Color := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR );
        if pos( 'dark', lowercase(mm.CONFIG_LAYOUT_ACTIVE_THEME) ) = 0 then
           TUniContainerPanel( MainForm.FindComponent( 'paLayoutLogo' ) ).Color := StringToColor( mm.CONFIG_LAYOUT_MENU_COLOR )
        else
           TUniContainerPanel( MainForm.FindComponent( 'paLayoutLogo' ) ).Color := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR );
     end;
     //7.2.0.0
     //if MainForm.FindComponent( 'labAppName' ) <> nil then
     //   TUniLabel( MainForm.FindComponent( 'labAppName' ) ).font.Color       := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR );

     //menu tree
     UniSession.AddJS('$(''.x-treelist-nav .x-treelist-item-text'').css({ ''color'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR ) ) ) + ''' })' );
     //grid
     UniSession.AddJS('$(''.x-column-header'').css({ ''color'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR ) ) ) + ''' })' );
     UniSession.AddJS('$(''.x-column-header'').css({ ''background'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_BG ) ) ) + ''' })' );
     //botoes
     UniSession.AddJS('$(''.ButtonTheme'').css({ ''background'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR ) ) ) + ''' })' );

     if MainForm.FindComponent( 'paLayoutLogo' ) <> nil then
        TUniContainerPanel( MainForm.FindComponent( 'paLayoutLogo' ) ).Color := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR );
     if MainForm.FindComponent( 'labAppName' ) <> nil then
        TUniLabel( MainForm.FindComponent( 'labAppName' ) ).font.Color       := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR );


     // selecao de itens no combobox
//          UniSession.AddJS('$(''.x-boundlist-item-over'').css({ ''background'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR ) ) ) + ''' })' );
//          UniSession.AddJS('$(''.x-boundlist-item-over'').css({ ''color'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR ) ) ) + ''' })' );
//          UniSession.AddJS('$(''.x-boundlist-selected'').css({ ''color'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR ) ) ) + ''' })' );
     //

     // ajustar cores dos edits
     dm_rc.rc_AdjustEditColors( MainForm );
end;

procedure TfrmThemes.rc_UpdateBorders( pPanel : TUniContainerPanel );
var
   cNameComp : string;
begin
     // LIGAR/DESLIGAR a borda doo panel de cor selecionado
     //desligar o anterior
     if TUniPanel( Self.FindComponent( labSelectedColor.Caption ) ) <> nil then
     begin
          cNameComp := StringReplace( lowercase( labSelectedColor.Caption ), '_hover' , '', [rfReplaceAll] );

          TUniPanel( Self.FindComponent( 'paBorder' + Copy( cNameComp , Pos( '_' , cNameComp ) + 1 , 100 ) ) ).Tag   := 0;
          TUniPanel( Self.FindComponent( 'paBorder' + Copy( cNameComp , Pos( '_' , cNameComp ) + 1 , 100 ) ) ).Color := clBlack;
     end;

     labSelectedColor.Caption := pPanel.Name;

     cNameComp := StringReplace( lowercase( labSelectedColor.Caption ), '_hover' , '', [rfReplaceAll] );

     //ligar o atual
     TUniPanel( Self.FindComponent( 'paBorder' + Copy( cNameComp , Pos( '_' , cNameComp ) + 1 , 100 ) ) ).Tag := 1;
     TUniPanel( Self.FindComponent( 'paBorder' + Copy( cNameComp , Pos( '_' , cNameComp ) + 1 , 100 ) ) ).Color := clLime;

     // ajusta novos cores
     btnSelColor_Menu.Color                    := StringToColor( mm.CONFIG_LAYOUT_MENU_COLOR );
     btnSelColor_MenuFont.Color                := StringToColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR );
     btnSelColor_MenuFontGroup.Color           := StringToColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR_GROUP );
     btnSelColor_MenuLogoBG.Color              := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR );
     btnSelColor_MenuLogoFont.Color            := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR );
     btnSelColor_Login.Color                   := StringToColor( mm.CONFIG_LAYOUT_LOGIN_COLOR );
     btnSelColor_FormLabel.Color               := StringToColor( mm.CONFIG_LAYOUT_LABEL_COLOR );
     btnSelColor_Button_Color.Color            := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR );
     btnSelColor_Button_Color_Crud.Color       := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD );
     btnSelColor_Button_Color_hover.Color      := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_HOVER );
     btnSelColor_Button_Color_Crud_hover.Color := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD_HOVER );
     btnSelColor_Bg.Color                      := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
     btnSelColor_Link.Color                    := StringToColor( mm.CONFIG_LAYOUT_LINK_COLOR );
     btnSelCOLOR_LINKHOVER.Color               := StringToColor( mm.CONFIG_LAYOUT_LINKHOVER_COLOR );
     btnSelColor_GridSelect.Color              := StringToColor( mm.CONFIG_LAYOUT_GRID_SEL_COLOR );
     btnSelColor_GridTitleBG.Color             := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_BG );
     btnSelColor_GridTitleColor.Color          := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR );
     btnSelColor_GridTitleColorBGOver.Color    := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_BG_OVER );
     btnSelColor_GridTitleColorOver.Color      := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_OVER );
     btnSelColor_GridTitleColorIcon.Color      := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_ICON );

     btnSelColor_EditFoco.Color                := StringToColor( mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR );
     btnSelColor_EditColor.Color               := StringToColor( mm.CONFIG_LAYOUT_EDIT_COLOR );
     btnSelColor_EditColorBorder.Color         := StringToColor( mm.CONFIG_LAYOUT_EDIT_BORDER_COLOR );//7.0.0.0//
     btnSelColor_EditColorFont.Color           := StringToColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR );
     btnSelColor_EditColorReadOnly.Color       := StringToColor( mm.CONFIG_LAYOUT_EDIT_COLOR_READONLY );
     btnSelColor_EditColorFontReadOnly.Color   := StringToColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY );
     btnSelColor_EditColorTrigger.Color        := StringToColor( mm.CONFIG_LAYOUT_EDIT_COLOR_TRIGGER );
     btnSelColor_EditColorFontTrigger.Color    := StringToColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_TRIGGER );
     btnSelColor_LookUp.Color                  := StringToColor( mm.CONFIG_LAYOUT_EDLKP_COLOR );
     btnSelColor_LookUpFont.Color              := StringToColor( mm.CONFIG_LAYOUT_EDLKP_FONT_COLOR );

     dm_rc.rc_RenderControls( MainForm );

     //menu tree
     UniSession.AddJS('$(''.x-treelist-nav .x-treelist-item-text'').css({ ''color'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR ) ) ) + ''' })' );

     //8.0.0.0
     if pos( 'light', lowercase(labActiveTheme.Caption) ) = 0 then
     begin
        if MainForm.FindComponent( 'paLayoutLogo' ) <> nil then
           TUniContainerPanel( MainForm.FindComponent( 'paLayoutLogo' ) ).Color := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR );
        if MainForm.FindComponent( 'labAppName' ) <> nil then
           TUniLabel( MainForm.FindComponent( 'labAppName' ) ).font.Color       := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR );
     end;

     //botoes
     UniSession.AddJS('$(''.ButtonThemeCrud'').css({ ''background'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD ) ) ) + ''' })' );
     UniSession.AddJS('$(''.ButtonThemeCrud'').css({ ''border-color'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD ) ) ) + ''' })' );
     UniSession.AddJS('$(''.ButtonTheme'').css({ ''background'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR ) ) ) + ''' })' );
     UniSession.AddJS('$(''.ButtonTheme'').css({ ''border-color'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR ) ) ) + ''' })' );

     // ajustar cores dos edits
     dm_rc.rc_AdjustEditColors( MainForm );
end;

procedure TfrmThemes.rc_UpdateColorButtons;
begin
     btnSelColor_Menu.Color                    := StringToColor( mm.CONFIG_LAYOUT_MENU_COLOR );
     btnSelColor_MenuFont.Color                := StringToColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR );
     btnSelColor_MenuFontGroup.Color           := StringToColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR_GROUP );
     btnSelColor_MenuLogoBG.Color              := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR );
     btnSelColor_MenuLogoFont.Color            := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR );
     btnSelColor_Login.Color                   := StringToColor( mm.CONFIG_LAYOUT_LOGIN_COLOR );
     btnSelColor_FormLabel.Color               := StringToColor( mm.CONFIG_LAYOUT_LABEL_COLOR );
     btnSelColor_Button_Color.Color            := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR );
     btnSelColor_Button_Color_Crud.Color       := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD );
     btnSelColor_Button_Color_hover.Color      := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_HOVER );
     btnSelColor_Button_Color_Crud_hover.Color := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD_HOVER );
     btnSelColor_Bg.Color                      := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
     btnSelColor_Link.Color                    := StringToColor( mm.CONFIG_LAYOUT_LINK_COLOR );
     btnSelCOLOR_LINKHOVER.Color               := StringToColor( mm.CONFIG_LAYOUT_LINKHOVER_COLOR );
     btnSelColor_GridSelect.Color              := StringToColor( mm.CONFIG_LAYOUT_GRID_SEL_COLOR );
     btnSelColor_GridTitleBG.Color             := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_BG );
     btnSelColor_GridTitleColor.Color          := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR );
     btnSelColor_GridTitleColorBGOver.Color    := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_BG_OVER );
     btnSelColor_GridTitleColorOver.Color      := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_OVER );
     btnSelColor_GridTitleColorIcon.Color      := StringToColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_ICON );

     btnSelColor_EditFoco.Color                := StringToColor( mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR );
     btnSelColor_EditColor.Color               := StringToColor( mm.CONFIG_LAYOUT_EDIT_COLOR );
     btnSelColor_EditColorBorder.Color         := StringToColor( mm.CONFIG_LAYOUT_EDIT_BORDER_COLOR );//7.0.0.0//
     btnSelColor_EditColorFont.Color           := StringToColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR );
     btnSelColor_EditColorReadOnly.Color       := StringToColor( mm.CONFIG_LAYOUT_EDIT_COLOR_READONLY );
     btnSelColor_EditColorFontReadOnly.Color   := StringToColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY );
     btnSelColor_EditColorTrigger.Color        := StringToColor( mm.CONFIG_LAYOUT_EDIT_COLOR_TRIGGER );
     btnSelColor_EditColorFontTrigger.Color    := StringToColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_TRIGGER );
     btnSelColor_LookUp.Color                  := StringToColor( mm.CONFIG_LAYOUT_EDLKP_COLOR );
     btnSelColor_LookUpFont.Color              := StringToColor( mm.CONFIG_LAYOUT_EDLKP_FONT_COLOR );

     dm_rc.rc_RenderControls( MainForm );

     //8.0.0.0
     if pos( 'light', lowercase(labActiveTheme.Caption) ) = 0 then
     begin
        if MainForm.FindComponent( 'paLayoutLogo' ) <> nil then
           TUniContainerPanel( MainForm.FindComponent( 'paLayoutLogo' ) ).Color := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR );
        if MainForm.FindComponent( 'labAppName' ) <> nil then
           TUniLabel( MainForm.FindComponent( 'labAppName' ) ).font.Color       := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR );
     end;

     //menu tree
     UniSession.AddJS('$(''.x-treelist-nav .x-treelist-item-text'').css({ ''color'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR ) ) ) + ''' })' );
     //botoes
//     UniSession.AddJS('$(''.ButtonTheme'').css({ ''background'': ''' + ( ColorToHtml( StringToColor( BUTTON_COLOR ) ) ) + ''' })' );
     //botoes
     UniSession.AddJS('$(''.ButtonTheme'').css({ ''background'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR ) ) ) + ''' })' );
     UniSession.AddJS('$(''.ButtonThemeCrud'').css({ ''background'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR ) ) ) + ''' })' );
     //UniSession.AddJS('$(''.ButtonThemeCrud'').css({ ''background'': ''' + ( ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR ) ) ) + ''' })' );

     // ajustar cores dos edits
     dm_rc.rc_AdjustEditColors( MainForm );
end;
procedure TfrmThemes.sBoxColorsScrollChange(Sender: TComponent; const X, Y: Integer);
begin
     varI_ScrollPosition := y;
     paColorSelect.Visible := false;
end;

end.


