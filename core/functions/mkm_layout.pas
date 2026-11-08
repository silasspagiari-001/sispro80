unit mkm_layout; //8.4.0.0

interface

uses
    System.SysUtils,
    System.StrUtils,
    System.Classes,
    System.TypInfo,
    Vcl.Controls,
    Vcl.Graphics,
    Vcl.Menus,
    Vcl.Dialogs,
    // feedback: Mesut from Turkey
    {$ifdef LINUX}
    System.UIConsts,
    System.IOUtils, //feedback: Mesut from Turkey to Linux( 6.0.0.0 )
    {$endif}
    Data.DB,
    IniFiles,
    uniGUIClasses,
    uniGUITypes,
    uniGUIApplication,
    uniGUIForm,
    uniGUIFrame,
    UniGUIJSFORM,
    uconsts,
    uniPanel,
    uniEdit,
    uniDBEdit,
    uniLabel,
    uniHTMLFrame,
    uniURLFrame,
    uniScrollBox,
    uniImage,
    uniPageControl,
    uniDateTimePicker,
    uniDBDateTimePicker,
    uniBitBtn,
    uniButton,
    uniMenuButton,
    uniDBGrid,
    uniDBText,
    uniDBCheckBox,
    uniRadioGroup,
    uniDBRadioGroup,
    uniSpinEdit,
    uniGroupBox,
    uniComboBox,
    uniDBComboBox,
    uniDBLookupComboBox,
    uniListBox,
    uniDBListBox,//tagfield
    uniMemo,
    uniDBMemo,
    uniSpeedButton
    ;

    // adiciona / remove uma classe CSS / add/remove a CSS class
    procedure rc_AddCssClass(pObj: TObject; pCls: string);
    procedure rc_RemoveCssClass(pObj: TObject; pCls: string; pForce:boolean=false );//6.1.0.4
    procedure rc_CreateCssClass( pObj : TObject; pDefStr : string; pExtraID : string = ''; pAddCss : boolean = false ); //8.0.0.3
    procedure rc_ChangeCssProperty( pClasses, pProp, pContent : string );

    function  rc_FindControl( pName: string; pForm : TObject = nil ): TUniControl;
    function  rc_FindAllComponents( pForm : TObject; pCriteria : string ) : TStringList;
    function  rc_FindFormFrameIntoTab( pFormName: string; pObjName : string = ''; pSeq : integer = 0 ): TObject;
    function  rc_FindObject( pName: string; pForm : TObject = nil ): TObject;
    //8.0.0.0
    function  rc_GetHintAttr( pProp, pProps : string; bParam : boolean = false; bFullLength:boolean = false; bUntilNextSpace : boolean = false ) : string; // 6.0.0.0
    function  rc_SetHintAttr( pContent, pProp, pProps : string; pAdd : boolean = false ) : string;
    function  rc_AddHintAttr( pContent, pProps : string; pUpdate : boolean = false ) : string;
    function  rc_NormalizeHintAttr( pContent: string): string;
    function  rc_PosHintAttr( pProp, pContent: string): integer;
    function  rc_NormalizeAllTrim( pContent, pToken : string ) : string;

    procedure rc_CenterObj( pObj : TObject ; pObjParent : TObject = nil ;pV : boolean = true; pH : boolean = true; pV_OffSet : integer = 0; pH_OffSet : integer = 0 );

    procedure rc_AdjustFormsSize( pMainMenu : TObject = nil; pResizeBlocks : boolean = true );
    procedure rc_BootStrapRenderExecute( pForm : TObject = nil; pUpdateDBFields : Boolean  = false; pTabIni : integer = 0; pTabEnd : integer = 0; pMobileScreen : boolean = false; pLandScape : boolean = false; pOnlyThisObj : TObject = nil );
    procedure rc_AdjustEditColorsExecute( pForm : TObject; pAPP_FONT, pEDLKP_COLOR, pEDLKP_FONT_COLOR, pEDIT_COLOR, pEDIT_FONT_COLOR, pEDIT_COLOR_READONLY, pEDIT_FONT_COLOR_READONLY, pEDIT_FOCUS_COLOR : String );
    procedure rc_RenderControlsExecute(pForm: TObject; pMENU_COLOR : string = ''; pOnlyThisObj : TUniControl = nil );

    procedure rc_DynamicAlignment( pFrame: TObject );
    procedure rc_RenderLayout(pForm: TObject; pAdjustFormSize : boolean = false ; pResizeBlocks : boolean = false; pMainMenuExists : boolean = true; pUpdateDBGrids : boolean = true; pAdjustEdits : boolean = true; pDynamicAlignment : boolean = false; pBootstrapRender : boolean = true  ); // 6.0.0.0

    procedure rc_ScreenAdjustMobileKeyboard( pForm : TObject; pOffSetV : Integer = 0; pOffSetH : Integer = 0 );

    // Thanks to JOAS // Renamed from GetRCBlocks(pFrame: TObject);
    //[PT] Gera os arquivos INI de config. dos blocos responsivos do formulário para testes de desenvolvimento
    //[EN] Generates the config INI files. of responsive form blocks for development testing
    procedure rc_GenerateRuntimeDebugBlocksFile(pFrame: TObject);
    procedure rc_GenerateRuntimeComponentsFile(pFrame: TObject); // 6.0.0.0 ( thinking... )

    // 6.0.0.0
    procedure rc_BringToFront( pObject : TObject; pLevel:integer=1); // 0, 1, 2 or 3

    function rc_GetScrollBoxForMobileKeyboard( pObj : TObject ):TObject;
    procedure rc_ScrollBoxAlignReset( pForm : TObject );
    procedure rc_ScrollTop( pFormFrame : TObject );

    procedure rc_UpdateFormsInsideContainers;
    procedure rc_AddFocusBlur( pFormFrame : TObject; pObj : TUniControl; pEDIT_COLOR, pEDIT_FOCUS_COLOR, pEDIT_FONT_COLOR : string );

    procedure rc_ClearValidation( pForm : TObject );

    procedure rc_Badge( pForm : TObject; pControl : TUniControl; pValue : string ; pIco : string; pBadgeType : TRCBadgeType = bdgtWarning; pExtraHintContent : string = '');
    function rc_BadgeGetValue( pForm : TObject; pControl : TUniControl ):string;
    procedure rc_BadgeSetValue( pForm : TObject; pControl : TUniControl; pValue : string );

    //[PT] altera o conteudo do atributo "cls:" de um objeto
    //[EN] alters the contents of the attribute "cls:" of an object
    function  rc_ChangeCls( pForm : TObject; pControl : TUniControl; pOldCls, pNewCls : string; pRender : boolean = true; pForce : boolean = true ) : string; //7.0.0.0
    //8.0.0.0
    //function  rc_AdjustHintForGrids( pClass, pHint : string; pNormalize : boolean = false ) : string;
    function  rc_AdjustHintForGrids( pHint : string; pNormalize : boolean = false ) : string;
    function  rc_GetAttribute( pControl : TUniControl; pGetBrakets : boolean = false; pForm : TObject = nil ) : string;
    // 6.0.0.0
    function rc_ObjIsParentOf( pForm:TObject; pObj : TUniControl; pParentComp : TComponent ) : boolean;

    function rc_MakeListItem( pText : string; pType : TRCListItemType = litDot; pClsColor : string = 'bg-themecrud color-themecrud'; pIcon : string = '' ) : string;

    function rc_AdjustIconsNames( pIcon : string ) : string; //8.2.0.0 rc_AdjustFontAweSomeName

    function rc_SpanText( pCls1, pText1 : string; pCls2 : string = ''; pText2 : string = ''; pCls3 : string = ''; pText3 : string = '' ) : string; //7.0.0.0

    //altera o caption de um botão | changes the caption of a button
    function rc_ChangeButtonCaption( pForm : TObject; pControl : TUniControl; pCaption : string; pRender : boolean = true ) : string;
    //altera o caption de um label | changes the caption of a label
    function rc_ChangeLabelCaption( pForm : TObject; pControl : TUniControl; pCaption : string; pRender : boolean = true ) : string;
    //altera o ícone de um botão | changes the icon of a button
    function rc_ChangeButtonIcon( pForm : TObject; pControl : TUniControl; pIcon : string; pRender : boolean = true ) : string;
    //altera o ícone de um label | changes the icon of a button
    function rc_ChangeLabelIcon( pForm : TObject; pControl : TUniControl; pIcon : string; pRender : boolean = true ) : string;
    function rc_GetLabelWidthOnCanvas( pLabel : TUniLabel ) : integer;
    //7.0.0.0
    function rc_IsBlock(pObj:TUniControl) : boolean;
    function rc_GetLastBlockSeq( pFrame : TObject ) : integer; //8.0.0.0
    function rc_GetLastTabOrder( pFrame : TObject ) : integer; //8.0.0.0

    procedure rc_ObjectEnabled( pFrame: TObject; pObj : TUniControl; pState: Boolean; pForce: boolean = false); overload;
    procedure rc_ObjectVisible( pFrame: TObject; pObj : TUniControl; pState: Boolean; pForce: boolean = false); overload;
    procedure rc_ObjectEnabled( pObj : TUniControl; pState: Boolean; pForce: boolean = false); overload;//8.0.0.0
    procedure rc_ObjectVisible( pObj : TUniControl; pState: Boolean; pForce: boolean = false); overload;//8.0.0.0

    procedure rc_ObjectStatus( pObj : TUniControl; pState: Boolean ); //8.0.0.0

    //7.4.0.0
    procedure rc_FormTransition( pForm : TUniForm );
    function  rc_GetSelectedBarRating( pItem : TUniControl ) : string;
    //8.0.0.0
    function rc_AttrExists( pAttr, pHint : string ) : boolean;
    procedure rc_FocusBlur( pObj : TUniControl );
    function rc_IsMobile_V( pHint : string ) : boolean;
    function rc_IsMobile_H( pHint : string; pAndNotTablet : boolean = true ) : boolean;
    function rc_IsMobile( pHint : string; pAndNotTablet : boolean = true ) : boolean;
    function rc_IsDeskTop( pHint : string ) : boolean;
    //8.3.0.0
    function rc_HasProp( pObj : TObject; pProp : string ) : boolean;
    function rc_IsVisible( pObj : TUniControl ) : boolean;
    function rc_IsEnabled( pObj : TUniControl ) : boolean;
    //8.4.0.0
    procedure rc_FullScreenExit; //thanks for Roberto Nicchi
    //8.5.0.0
    procedure rc_BackgroundThemedColor( pForm : TObject ) ;
    //8.5.0.1
    procedure rc_ChangeToolTipText( pControl : TUniControl; pText : string );

implementation

uses untdm_rc, str_func, mkm_func_web, MainModule, Main, mkm_gridblock, mkm_qrcode{RC DB;}, mkm_paginator, mkm_anim,
  mkm_layout_aux_btns, mkm_layout_aux_tabs, mkm_layout_aux,
  mkm_func_web_localstorage, mkm_layout_aux_pos, mkm_layout_aux_align,
  mkm_layout_aux_scales, mkm_layout_aux_collapse, mkm_layout_aux_pdf,
  mkm_layout_aux_alerts, mkm_layout_aux_img, mkm_layout_aux_tooltip,
  mkm_layout_aux_scrollbar, mkm_layout_aux_bar_rating, mkm_layout_aux_video,
  mkm_layout_aux_qrcode, mkm_layout_aux_lottie, mkm_layout_aux_carousel,
  mkm_layout_aux_labels, mkm_layout_aux_round, mkm_layout_aux_border,
  mkm_layout_aux_inputico, mkm_layout_aux_radiogroup, mkm_layout_aux_bsh,
  mkm_layout_aux_bschk_swt, mkm_layout_aux_bsrgp, mkm_layout_aux_bstabs,
  mkm_layout_aux_bspills, mkm_layout_aux_bscarousel, mkm_layout_aux_bsimg,
  mkm_layout_aux_bsvideo;

//8.5.0.1
procedure rc_ChangeToolTipText( pControl : TUniControl; pText : string );
begin
   UniSession.AddJS( pControl.JSName + '.rc_Tip.setHtml("' + pText + '");');
end;
//8.5.0.0
procedure rc_BackgroundThemedColor( pForm : TObject ) ;
begin
   If Pos( 'bg-themed:off', TUniControl( pForm ).hint ) = 0 then
   begin
      If pForm.ClassName = 'TUniForm' then
         TUniForm( pForm ).Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR )
      else
      If pForm.ClassName = 'TUniFrame' then
         TUniFrame( pForm ).Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR )
      else
      If pForm.ClassName = 'TUniScrollBox' then
         TUniScrollBox( pForm ).Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR )
      else
      If pForm.ClassName = 'TUniContainerPanel' then
         TUniContainerPanel( pForm ).Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR )
      else
      If pForm.ClassName = 'TUniPanel' then
         TUniContainerPanel( pForm ).Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
   end;
end;
//8.4.0.0
procedure rc_FullScreenExit; //thanks for Roberto Nicchi
begin
  UniSession.AddJS(
      'document.addEventListener("fullscreenchange", function() {' +
      '  if (!document.fullscreenElement && !document.webkitFullscreenElement && !document.mozFullScreenElement && !document.msFullscreenElement) {' +
      //'    ajaxRequest('+MainForm.JSInterface.JSName+', "exitFullscreen", []);' +
      '    ajaxRequest( MainForm.htmlFrame, "exitFullScreen", []);' +
      '  }' +
      '});'
    );
end;
//8.3.0.0
function rc_HasProp( pObj : TObject; pProp : string ) : boolean;
begin
   Result := ( pObj <> nil ) and
             ( GetPropInfo( pObj.ClassInfo, pProp ) <> nil ) ;
end;
//8.3.0.0
function rc_IsVisible( pObj : TUniControl ) : boolean;
begin
   Result := ( pObj <> nil ) and
             ( rc_HasProp( pObj, 'Visible') ) and //( GetPropInfo( pObj.ClassInfo, 'Visible') <> nil ) and
             ( pObj.Visible );
end;
//8.3.0.0
function rc_IsEnabled( pObj : TUniControl ) : boolean;
begin
   Result := ( rc_HasProp( pObj, 'Enabled') ) and //( GetPropInfo( pObj.ClassInfo, 'Enabled') <> nil ) and
             ( pObj.Enabled );
end;
//8.0.0.0
function rc_IsMobile_V( pHint : string ) : boolean;
begin
   Result := ( Pos( 'mobile-v', pHint ) > 0 ) and ( mm.varB_Mobile_Screen_Portrait );
end;
//8.0.0.0
function rc_IsMobile_H( pHint : string; pAndNotTablet : boolean ) : boolean;
begin
   if pAndNotTablet then
      Result := ( Pos( 'mobile-h', pHint ) > 0 ) and ( mm.varB_Mobile_Screen_Landscape ) and ( not ( ( mm.varB_Tablet ) and ( mm.varB_Mobile_Screen_Landscape ) ) )
   else
      Result := ( Pos( 'mobile-h', pHint ) > 0 ) and ( mm.varB_Mobile_Screen_Landscape );
end;
//8.0.0.0
function rc_IsMobile( pHint : string; pAndNotTablet : boolean ) : boolean;
begin
   if pAndNotTablet then
      Result := ( ( Pos( 'mobile', pHint ) > 0 ) and (  Pos( 'mobile-', pHint ) = 0 ) ) and ( mm.varB_Mobile_Screen ) and
                  ( not ( ( mm.varB_Tablet ) and ( mm.varB_Mobile_Screen_Landscape ) ) )
   else
      Result := ( Pos( 'mobile', pHint ) > 0 ) and (  Pos( 'mobile-', pHint ) = 0 ) and ( mm.varB_Mobile_Screen );
end;
//8.0.0.0
function rc_IsDesktop( pHint : string ) : boolean;
begin
   Result := ( Pos( 'desktop', pHint ) > 0 ) and ( not mm.varB_Mobile_Screen );
end;
//8.0.0.0
function rc_AttrExists( pAttr, pHint : string ) : boolean;
begin
   Result := rc_PosHintAttr( pAttr , pHint ) > 0 ;
end;
//8.0.0.0
procedure rc_FocusBlur( pObj : TUniControl );
begin
   pObj.ClientEvents.ExtEvents.Values['onfocus'] :=
      'function focus(sender, eOpts) ' +
      '{ ' +
      '  sender.blur();' +
      '} ';
end;
// 8.0.0.0
procedure rc_ObjectStatus(pObj: TUniControl; pState: boolean );
begin
   rc_ObjectEnabled( pObj, pState, true );
   rc_ObjectVisible( pObj, pState, true );
end;
//7.4.0.0
function  rc_GetSelectedBarRating( pItem : TUniControl ) : string;
begin
   Result := rc_GetHintAttr( 'bar-rating-selected:', pItem.Hint );
   if Result = '' then
   begin
      Result := rc_GetHintAttr( 'bar-rating:', pItem.Hint ) + ',';
      Result := ReverseStr( Copy( Result, 1, Pos( '*,', Result ) - 1 ) );
      Result := Copy( Result, 1, Pos( ',', Result ) - 1 );
   end;
end;
//7.4.0.0
procedure rc_FormTransition( pForm : TUniForm );
begin
    if ( mm.CONFIG_LAYOUT_ANIM_EFFECTS = 'ON' ) then
    begin
       if Pos( 'frm-anim:lr', pForm.Hint ) > 0 then
          rc_AddCssClass( pForm, 'slide_in' )
       else
       if Pos( 'frm-anim:rl', pForm.Hint ) > 0 then
          rc_AddCssClass( pForm, 'slide_out' )
       else
       if Pos( 'frm-anim:bt', pForm.Hint ) > 0 then
          rc_AddCssClass( pForm, 'drop_in_bottom' )
       else
          rc_AddCssClass( pForm, 'drop_in' );
    end;
end;
//8.3.0.0
procedure rc_ObjectVisible(pFrame: TObject; pObj: TUniControl; pState: boolean; pForce: boolean );
var
   pObj2: TUniControl;
begin
   If rc_HasProp( pObj, 'Visible' ) then
   begin
     pObj2 := nil;

     if pObj <> nil then
        pObj2 := TUniControl(TComponent(pFrame).FindComponent(pObj.Name));

     if pObj2 <> nil then
     begin
        pObj2.Visible := pState;

        if pObj2.Visible then
        begin
            if pForce then
            begin
              pObj2.Visible := false;
              pObj2.Visible := true;
            end;
            pObj2.Hint := rc_AddHintAttr( '|start-visible:true', pObj2.Hint , true );
        end
        else
        begin
            pObj2.Hint := rc_AddHintAttr( '|start-visible:false', pObj2.Hint , true );
        end;
     end;
   end;
end;
//8.3.0.0
procedure rc_ObjectEnabled(pFrame: TObject; pObj: TUniControl; pState: boolean; pForce: boolean );
var
   pObj2: TUniControl;
begin
   If rc_HasProp( pObj, 'Enabled' ) then
   begin
     pObj2 := nil;

     if pObj <> nil then
        pObj2 := TUniControl(TComponent(pFrame).FindComponent(pObj.Name));

     if pObj2 <> nil then
     begin
        pObj2.Enabled := pState;

        if pObj2.Enabled then
        begin
            if pForce then
            begin
              pObj2.Enabled := false;
              pObj2.Enabled := true;
            end;
            rc_RemoveCssClass( pObj2, 'disabled');
            pObj2.Hint := rc_AddHintAttr( '|start-enabled:true', pObj2.Hint , true );
        end
        else
        begin
            rc_AddCssClass( pObj2, 'disabled');
            pObj2.Hint := rc_AddHintAttr( '|start-enabled:false', pObj2.Hint , true );
        end;
     end;
   end;
end;
//8.3.0.0
procedure rc_ObjectVisible(pObj: TUniControl; pState: boolean; pForce: boolean );
begin
   If rc_HasProp( pObj, 'Visible' ) then
   begin
      pObj.Visible := pState;

      if pObj.Visible then
      begin
          if pForce then
          begin
            pObj.Visible := false;
            pObj.Visible := true;
          end;
          pObj.Hint := rc_AddHintAttr( '|start-visible:true', pObj.Hint , true );
      end
      else
      begin
          pObj.Hint := rc_AddHintAttr( '|start-visible:false', pObj.Hint , true );
      end;
   end;
end;
//8.3.0.0
procedure rc_ObjectEnabled(pObj: TUniControl; pState: boolean; pForce: boolean );
begin
   If rc_HasProp( pObj, 'Enabled') then
   begin
      pObj.Enabled := pState;

      if pObj.Enabled then
      begin
          if pForce then
          begin
            pObj.Enabled := false;
            pObj.Enabled := true;
          end;
          rc_RemoveCssClass( pObj, 'disabled');
          pObj.Hint := rc_AddHintAttr( '|start-enabled:true', pObj.Hint , true );
      end
      else
      begin
          rc_AddCssClass( pObj, 'disabled');
          pObj.Hint := rc_AddHintAttr( '|start-enabled:false', pObj.Hint , true );
      end;
   end;
end;
//8.0.0.0
function rc_GetLastBlockSeq( pFrame : TObject ) : integer;
var
   iTabOrder,iBlockNumber,i,f,l : integer;
   oObj : TUniControl;
   cTemp : string;
begin
     iBlockNumber := 0;
     iTabOrder    := 0;
     if pFrame.InheritsFrom(TUniFrame) then
     begin
       for f := 0 to TUniFrame(pFrame).ComponentCount - 1 do
       begin
         cTemp := lowercase(TUniFrame(pFrame).Components[f].Name);
         if Pos('rcblock', cTemp) > 0 then
         begin
           i := StrToIntDef(StringReplace(cTemp, 'rcblock', '',[rfReplaceAll]), 0);
           if i > iBlockNumber then
           begin
             iBlockNumber := i;
             iTabOrder := TUniControl(TUniFrame(pFrame).Components[f]).TabOrder;
           end;
         end;
       end;
     end
     else if pFrame.InheritsFrom(TUniForm) then
     begin
       for f := 0 to TUniForm(pFrame).ComponentCount - 1 do
       begin
         cTemp := lowercase(TUniForm(pFrame).Components[f].Name);
         if Pos('rcblock', cTemp) > 0 then
         begin
           i := StrToIntDef(StringReplace(cTemp, 'rcblock', '',[rfReplaceAll]), 0);
           if i > iBlockNumber then
           begin
             iBlockNumber := i;
             iTabOrder := TUniControl(TUniForm(pFrame).Components[f]).TabOrder;
           end;
         end;
       end;
     end;
     Result := iBlockNumber;
end;
//8.0.0.0
function rc_GetLastTabOrder( pFrame : TObject ) : integer;
var
   iTabOrder,i,f : integer;
   cTemp : string;
begin
     iTabOrder    := 0;
     if pFrame.InheritsFrom(TUniFrame) then
     begin
       for f := 0 to TUniFrame(pFrame).ComponentCount - 1 do
       begin
         If GetPropInfo( TUniControl(TUniFrame(pFrame).Components[f]).ClassInfo, 'TabOrder') <> nil then
         begin
           i := TUniControl(TUniFrame(pFrame).Components[f]).TabOrder;
           if i > iTabOrder then
           begin
             iTabOrder := i;
           end;
         end;
       end;
     end
     else if pFrame.InheritsFrom(TUniForm) then
     begin
       for f := 0 to TUniForm(pFrame).ComponentCount - 1 do
       begin
         If GetPropInfo( TUniControl(TUniForm(pFrame).Components[f]).ClassInfo, 'TabOrder') <> nil then
         begin
           i := TUniControl(TUniForm(pFrame).Components[f]).TabOrder;
           if i > iTabOrder then
           begin
             iTabOrder := i;
           end;
         end;
       end;
     end;
     Result := iTabOrder;
end;
//7.0.0.1
function rc_IsBlock(pObj:TUniControl) : boolean;
begin
     Result := ( Pos( 'cols:' , pObj.Hint ) > 0 ) and
               ( lowercase( Copy( pObj.Name, 1, 7 ) ) = 'rcblock' ) and
               ( ReturnNumbers( pObj.Name ) <> '' ) ;
end;
///8.5.0.0 thanks Flavio Dei from Italy ( Linux Compile )
function rc_GetLabelWidthOnCanvas( pLabel : TUniLabel ) : integer;
{$IFDEF MSWINDOWS}
var
  c: TBitmap;
  f: TFont;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  c := TBitmap.Create;
  f := TFont.Create;
  try
    f.Height := pLabel.Font.Height;
    f.Size := pLabel.Font.Size;
    f.Name := pLabel.Font.Name;
    f.Style := pLabel.Font.Style;
    c.Canvas.Font.Assign(f);
    Result := c.Canvas.TextWidth(pLabel.Caption);
  finally
    c.Free;
    f.Free;
  end;
{$ELSE}
  // Linux senza GUI: approssimazione
  if pLabel.Font.Size > 0 then
    Result := Round(Length(pLabel.Caption) * pLabel.Font.Size * 0.65)
  else
    Result := Length(pLabel.Caption) * 8;
{$ENDIF}
end;
// 6.0.0.0
procedure rc_ChangeCssProperty( pClasses, pProp, pContent : string );
begin
   UniSession.AddJS('$(''' + pClasses + ''').css({ ''' + pProp + ''': ''' + pContent + ''' })' );
end;
// 7.0.0.0
function rc_SpanText( pCls1, pText1, pCls2, pText2 : string; pCls3 : string; pText3 : string ) : string;
begin
     if pText1.StartsWith( ' ' ) then
        pText1 := '&nbsp' + Copy( pText1, 2 );
     if pText2.StartsWith( ' ' ) then
        pText2 := '&nbsp' + Copy( pText2, 2 );
     if pText3.StartsWith( ' ' ) then
        pText3 := '&nbsp' + Copy( pText3, 2 );
     if pText1.EndsWith( ' ' ) then
        pText1 := Copy( pText1, 1, Length( pText1 ) - 1 ) + '&nbsp';
     if pText2.EndsWith( ' ' ) then
        pText2 := Copy( pText2, 1, Length( pText2 ) - 1 ) + '&nbsp';
     if pText3.EndsWith( ' ' ) then
        pText3 := Copy( pText3, 1, Length( pText3 ) - 1 ) + '&nbsp';

     if trim(pCls2) = '' then
        Result := '<span class="' + pCls1 + '">' + pText1 + '</span>'
     else
        Result := '<span class="' + pCls1 + '">' + pText1 + '</span><span class="' + pCls2 + '">' + pText2 + '</span>';

     if trim(pCls3) <> '' then
        Result := Result + '<span class="' + pCls3 + '">' + pText3 + '</span>';
end;
//8.2.0.0
function rc_AdjustIconsNames( pIcon : string ) : string;
var
   cTmp : string;
begin
    Result := '';
    cTmp   := '';
    if Pos( '-' , pIcon ) > 0 then
    begin
       cTmp  := Copy( pIcon , 1, Pos( '-' , pIcon ) - 1 ) ;
       if Copy( cTmp, 1, 2 ) = 'fa' then
          cTmp := cTmp + ' fa-'
       else
       if Copy( cTmp, 1, 2 ) = 'bi' then
          cTmp := 'bi ' + cTmp
       else
       if cTmp <> '' then
          cTmp := cTmp + ' picto-';

       //pIcon := cTmp + Copy( pIcon , Pos( '-' , pIcon ) + 1 ) ;

       if mm.CONFIG_LAYOUT_BSICONS = 'ON' then
       begin
          if Copy( pIcon, 1, 3 ) = 'bi-' then
             Result := 'bi ' + pIcon;
       end;
       if Result = '' then
       begin
          if Copy( pIcon, 1, 3 ) = 'fa-' then
             pIcon := stringReplace( pIcon, 'fa-', 'fas-', [rfReplaceAll] );

          if mm.CONFIG_LAYOUT_FONTAWS = '5' then
          begin
             if Copy( pIcon, 1, 4 ) = 'fas-' then
                Result := 'fas ' + stringReplace( pIcon, 'fas-', 'fa-', [rfReplaceAll] )
             else
             if Copy( pIcon, 1, 4 ) = 'far-' then
                Result := 'far ' + stringReplace( pIcon, 'far-', 'fa-', [rfReplaceAll] )
             else
             if Copy( pIcon, 1, 4 ) = 'fad-' then
                Result := 'fad ' + stringReplace( pIcon, 'fad-', 'fa-', [rfReplaceAll] )
             else
             if Copy( pIcon, 1, 4 ) = 'fab-' then
                Result := 'fab ' + stringReplace( pIcon, 'fab-', 'fa-', [rfReplaceAll] )
             else
             if Copy( pIcon, 1, 4 ) = 'fal-' then
                Result := 'fal ' + stringReplace( pIcon, 'fal-', 'fa-', [rfReplaceAll] )
             else
             if Copy( pIcon, 1, 4 ) = 'fat-' then
                Result := 'fat ' + stringReplace( pIcon, 'fat-', 'fa-', [rfReplaceAll] );
          end
          else
          begin
             if Copy( pIcon, 1, 4 ) = 'fas-' then
                Result := 'fa-solid ' + stringReplace( pIcon, 'fas-', 'fa-', [rfReplaceAll] )
             else
             if Copy( pIcon, 1, 4 ) = 'far-' then
                Result := 'fa-regular ' + stringReplace( pIcon, 'far-', 'fa-', [rfReplaceAll] )
             else
             if Copy( pIcon, 1, 4 ) = 'fad-' then
                Result := 'fa-duotone ' + stringReplace( pIcon, 'fad-', 'fa-', [rfReplaceAll] )
             else
             if Copy( pIcon, 1, 4 ) = 'fab-' then
                Result := 'fa-brands ' + stringReplace( pIcon, 'fab-', 'fa-', [rfReplaceAll] )
             else
             if Copy( pIcon, 1, 4 ) = 'fal-' then
                Result := 'fa-light ' + stringReplace( pIcon, 'fal-', 'fa-', [rfReplaceAll] )
             else
             if Copy( pIcon, 1, 4 ) = 'fat-' then
                Result := 'fa-thin ' + stringReplace( pIcon, 'fat-', 'fa-', [rfReplaceAll] )
             else
             if Copy( pIcon, 1, 5 ) = 'fass-' then
                Result := 'fa-sharp fa-solid ' + stringReplace( pIcon, 'fass-', 'fa-', [rfReplaceAll] )
             else
             if Copy( pIcon, 1, 5 ) = 'fasr-' then
                Result := 'fa-sharp fa-regular ' + stringReplace( pIcon, 'fasr-', 'fa-', [rfReplaceAll] )
             else
             if Copy( pIcon, 1, 5 ) = 'fasl-' then
                Result := 'fa-sharp fa-light ' + stringReplace( pIcon, 'fasl-', 'fa-', [rfReplaceAll] );
          end;
       end;
    end;
end;
// 6.0.0.0
function rc_MakeListItem( pText : string; pType : TRCListItemType; pClsColor : string; pIcon : string ) : string;
const
    cListString = '<span class="<pType> <pClsColor>"></span><pText><br><br>';
    cListIconString = '<i class="rc-list <pIcon> <pClsColor>"></i><span><pText></spam><br><br>';
var
    cEnumStr : string;
begin
     cEnumStr := Copy( GetEnumName( typeInfo( TRCListItemType ), Ord(pType)) , 4 ) ;
     case pType of
        litDot        : cEnumStr := 'rc-dot';
        litSquare     : cEnumStr := 'rc-dot-square';
        litSquareRound: cEnumStr := 'rc-dot-square-round';
        litDiamond    : cEnumStr := 'rc-dot-diamond-round';
     end;
     case pType of
        litDot,
        litSquare,
        litSquareRound,
        litDiamond    : begin
                         Result := StringReplace( cListString, '<pType>'    , cEnumStr , [rfReplaceAll] );
                         Result := StringReplace( Result     , '<pClsColor>', pClsColor, [rfReplaceAll] );
                         Result := StringReplace( Result     , '<pText>'    , pText    , [rfReplaceAll] );
                        end;
        litIconFAWS   : begin
                         cEnumStr := Copy( pIcon, Pos( '-', pIcon ) + 1 );
                         cEnumStr := Copy( pIcon, 1, Pos( '-', pIcon ) - 1 ) + ' fa-' + cEnumStr ;
                         Result   := StringReplace( cListIconString, '<pIcon>'    , cEnumStr , [rfReplaceAll] );
                         Result   := StringReplace( Result         , '<pClsColor>', pClsColor, [rfReplaceAll] );
                         Result   := StringReplace( Result         , '<pText>'    , pText    , [rfReplaceAll] );
                        end;
     end;
end;
// 6.0.0.0
function rc_ObjIsParentOf( pForm:TObject; pObj : TUniControl; pParentComp : TComponent ) : boolean;
var
   oParentComp : TComponent;
begin
   Result := false;
   oParentComp := pObj;
   if oParentComp <> nil then
      if oParentComp.HasParent then
         oParentComp := oParentComp.GetParentComponent
      else
         oParentComp := nil;
   repeat
       if oParentComp <> NIL then
       begin
          oParentComp := TUniControl( oParentComp ).GetParentComponent;
          if ( not Result ) and ( oParentComp <> nil ) then
          begin
             if TUniControl( oParentComp ).Name = pParentComp.Name then
             begin
                  Result := true;
                  oParentComp := nil;
             end;
          end;
       end;
   until ( oParentComp = nil ) or not ( pObj.HasParent );
end;

function rc_GetAttribute( pControl : TUniControl; pGetBrakets : boolean ; pForm : TObject ) : string;
begin
     Result := '';
     if pForm <> nil then
     begin
        pControl := rc_FindControl( pControl.Name, pForm );
        if ( pControl <> nil ) and (  ( Pos( '[[', pControl.Hint ) > 0 ) and ( Pos( ']]', pControl.Hint ) > 0 ) ) then
        begin
           Result := pControl.Hint;
        end;
     end
     else
       Result := pControl.Hint;

     if ( not pGetBrakets ) and (  Result <> '' ) then
     begin
          Result := StringReplace( Result , '[[' , '', [rfReplaceAll] );
          Result := StringReplace( Result , ']]' , '', [rfReplaceAll] );
     end;
end;
//8.0.0.0
//function rc_AdjustHintForGrids( pClass, pHint : string; pNormalize : boolean ) : string;
function rc_AdjustHintForGrids( pHint : string; pNormalize : boolean ) : string;
var
   cTemp, cTemp2, cHint : string;
   bHasBrackets : boolean;
begin
    cHint := pHint;//grid-fm-rs!
    if ( ( Pos( 'fieldmasks:', cHint ) > 0 ) or ( Pos( 'grid-fm-rs!', cHint ) > 0 ) ) then
    begin
       if pNormalize then
          cHint  := rc_NormalizeHintAttr(cHint)
       else
       begin
//            bHasBrackets := copy( cHint, 1, 2 ) = '[[';
//            if not bHasBrackets then
//               bHasBrackets := copy( ReverseStr( cHint ), 1, 2 ) = ']]';
       end;
       if Pos( 'fieldmasks:', cHint ) > 0 then
          cTemp  := Copy( cHint, 1, Pos( 'fieldmasks:', cHint ) - 1 )
       else
          cTemp  := Copy( cHint, 1, Pos( 'grid-fm-rs!', cHint ) - 1 );
       cTemp2 := ReverseStr( cHint );

       if Copy( cTemp2, 1, 2 ) = ']]' then
          cTemp2 := Copy( cTemp2, 3 );

       if ( Copy( trim(cTemp2), 1, 3 ) <> ';]]' ) and ( Pos( ']]', cTemp2 ) > 2 ) then
       begin
          cTemp2 := Copy( cTemp2, 1, Pos( ']]', cTemp2 ) -2  );
       end;
       cHint := '[[' + trim( ReverseStr( cTemp2 ) ) + ']]';
       cTemp := '';
       cTemp2 := '';
    end;
    Result := cHint;
end;
//6.0.0.0
function rc_ChangeButtonIcon( pForm : TObject; pControl : TUniControl; pIcon : string; pRender : boolean ) : string;
var
   cTmp, cFirstChar, cProp, cValue : string;
begin
  cTmp := rc_GetHintAttr( 'ico:', pControl.Hint );
  if cTmp <> '' then
  begin
     pControl.Hint := StringReplace( pControl.Hint, 'ico:' + cTmp, 'ico:' + pIcon, [rfReplaceAll] );
  end
  else
     pControl.Hint := rc_SetHintAttr( pIcon, 'ico:', pControl.Hint, true );
  if pRender then dm_rc.rc_RenderControls( pForm, pControl );
  Result := pControl.Hint;
end;
//6.0.0.0
function rc_ChangeLabelIcon( pForm : TObject; pControl : TUniControl; pIcon : string; pRender : boolean ) : string;
begin
     rc_ChangeButtonIcon( pForm ,pControl, pIcon, pRender );
end;
//8.0.0.0
function rc_ChangeButtonCaption( pForm : TObject; pControl : TUniControl; pCaption : string; pRender : boolean ) : string;
var
   cTmp, cFirstChar, cProp, cValue : string;
begin
  cTmp := rc_GetHintAttr( 'caption:', pControl.Hint );
  if cTmp <> '' then
  begin
     pControl.Hint := StringReplace( pControl.Hint, 'caption:' + cTmp, 'caption:' + pCaption, [rfReplaceAll] );
     if pRender then
     begin
        dm_rc.rc_RenderControls( pForm, pControl );
        dm_rc.rc_BootStrapRender( pForm, false, pControl );
     end;
  end
  else
     pControl.Caption := pCaption;

  Result := pControl.Hint;
end;
//6.0.0.0
function rc_ChangeLabelCaption( pForm : TObject; pControl : TUniControl; pCaption : string; pRender : boolean ) : string;
begin
  rc_ChangeButtonCaption( pForm ,pControl, pCaption, pRender );
end;
// 7.0.0.0
function rc_ChangeCls( pForm : TObject; pControl : TUniControl; pOldCls, pNewCls : string; pRender : boolean; pForce : boolean ) : string; //7.0.0.0 )
var
   cOld, cNew : string;
begin
  pOldCls := pOldCls + ' ';
  pNewCls := pNewCls + ' ';
  cOld := Trim( Copy( pOldCls, 1, Pos( ' ', pOldCls ) ) );
  cNew := Trim( Copy( pNewCls, 1, Pos( ' ', pNewCls ) ) );
  While cOld <> '' do
  begin
     rc_RemoveCssClass( pControl, cOld, pForce );
     pControl.Hint := stringReplace( pControl.Hint, cOld, cNew, [rfReplaceAll] );
     pOldCls := stringReplace( pOldCls, cOld + ' ', '', [rfReplaceAll] );
     pNewCls := stringReplace( pNewCls, cNew + ' ', '', [rfReplaceAll] );
     cOld := Trim( Copy( pOldCls, 1, Pos( ' ', pOldCls ) ) );
     cNew := Trim( Copy( pNewCls, 1, Pos( ' ', pNewCls ) ) );
  end;

  if pRender then dm_rc.rc_RenderControls( pForm, pControl );

  Result := pControl.Hint;
end;

procedure rc_ScrollBoxAlignReset( pForm : TObject );
var
   f : integer;
begin
   //[PT] uniscrollbox com alClient gera anomalias... use "scrollbox:reset-off" se não desejar resetar o alinhamento de um determinado "uniscrollbox"
   //[EN] uniscrollbox with alClient generates anomalies... use "scrollbox:reset-off" if you don't want to reset the alignment of a certain "uniscrollbox"
   for f := 0 to TComponent(pForm).ComponentCount - 1 do
   begin
      If ( TComponent(pForm).Components[f] is TUniScrollBox ) then
      begin
           if ( Pos( 'scrollbox:reset-off' , TUniScrollBox( TComponent(pForm).Components[f] ).Hint ) = 0 ) then
           begin
              if ( TUniScrollBox( TComponent(pForm).Components[f] ).Align = alClient ) then
              begin
                 TUniScrollBox( TComponent(pForm).Components[f] ).Align   := alNone;
                 TUniScrollBox( TComponent(pForm).Components[f] ).Left    := 0;
                 TUniScrollBox( TComponent(pForm).Components[f] ).Top     := 0;
                 TUniScrollBox( TComponent(pForm).Components[f] ).Width   := TUniScrollBox( TComponent(pForm).Components[f] ).Parent.Width;
                 TUniScrollBox( TComponent(pForm).Components[f] ).Height  := TUniScrollBox( TComponent(pForm).Components[f] ).Parent.Height;
                 TUniScrollBox( TComponent(pForm).Components[f] ).Anchors := [akLeft, akTop, akRight, akBottom ];
                 //Break;
              end;
           end;
      end;
   end;
end;
//rc_Badge( self, labCompanyName,'2','fas-envelope',bdgtDanger);
procedure rc_Badge( pForm : TObject; pControl : TUniControl; pValue : string ; pIco : string; pBadgeType : TRCBadgeType; pExtraHintContent : string );
var
   cCls : string;
begin
     cCls := '';
     if Pos( 'cls:', pExtraHintContent ) > 0 then
     begin
        cCls := rc_GetHintAttr( 'cls:', pExtraHintContent );
        pExtraHintContent := StringReplace( pExtraHintContent, 'cls:' + cCls, '', [rfReplaceAll] );
     end;
     if pControl is TUniLabel then
     begin
        pControl.Caption := pValue;
        pControl.Hint := '[[' +
                         varIIF( pIco <> '', 'ico:' + pIco , '' ) + ' | ' +
                         'cls:align-label-left-center ' + cCls + ' | ' + //rc-hover-zoom-1-2
                         'cls-caption:badge bg-' + lowercase( Copy( GetEnumName( typeInfo( TRCBadgeType ), Ord(pBadgeType)), 5 ) ) + '|' +
                         'append ' +
                         varIIF( pExtraHintContent <> '', '|' + pExtraHintContent,'' ) +
                         ']]' ;
     end
     else
     begin
         // 6.0.0.0
         rc_AddHintAttr( '|badge:' + pValue + ' color:' + lowercase( Copy( GetEnumName( typeInfo( TRCBadgeType ), Ord(pBadgeType)), 5 ) ), pControl.Hint, true ) ;
     end;
     dm_rc.rc_RenderControls( pForm, pControl );
end;

function rc_BadgeGetValue( pForm : TObject; pControl : TUniControl ):string;
begin
     if pControl is TUniLabel then
        Result := rc_GetHintAttr( 'caption:', pControl.Hint )
     else // button
        Result := rc_GetHintAttr( 'badge:', pControl.Hint );
end;
// 6.0.0.0
procedure rc_BadgeSetValue( pForm : TObject; pControl : TUniControl; pValue : string );
var
  cBadge : string;
begin
     if ( Pos( 'caption:', pControl.Hint ) > 0 ) and ( pControl is TUniLabel ) then
     begin
        // 6.0.0.0
        pControl.Hint := rc_AddHintAttr( '|caption:' + pValue, pControl.Hint, true );
     end
     else
     begin
        cBadge := rc_GetHintAttr( 'badge:', pControl.Hint );
        cBadge := pValue + Copy( cBadge, Pos( ' ', cBadge ) ) ;
        // 6.0.0.0
        pControl.Hint := rc_AddHintAttr( '|badge:' + cBadge, pControl.Hint, true );
     end;
     dm_rc.rc_RenderControls( pForm, pControl );
end;
// 6.0.0.0
procedure rc_ClearValidation( pForm : TObject );
var
   i : integer;
   oObj,oObjTemp : TUniControl;
begin
     if TComponent( pForm ) <> nil then
     begin
         for I := 0 to TComponent( pForm ).ComponentCount - 1 do
         begin
            oObj := TUniControl( TComponent( pForm ).Components[I] );
            //8.0.0.2
            If rc_CanRender( oObj ) and
//            If ( Pos( 'TAction' , oObj.ClassName ) = 0 ) and
//               ( Pos( 'THelp' , oObj.ClassName ) = 0 ) and
               ( Pos( 'TUniMenuItem' , oObj.ClassName ) = 0 ) then
            begin
               If GetPropInfo( oObj.ClassInfo, 'Hint') <> nil then
               begin
                  if ( pos( 'true imsg:', oObj.hint ) > 0 ) then
                  begin
                     oObjTemp := TUniLabel( TComponent(pForm).FindComponent('rcLabel__inv_lab_' + oObj.Name) );
                     if ( oObjTemp <> nil ) then
                     begin
                        oObjTemp.Visible := False;
                     end;
                  end;
                  if Pos( 'invalidate:', oObj.Hint ) > 0 then
                  begin
                     oObj.JSInterface.JSCall( 'removeCls' , [ 'rc-invalid-date' ]);//7.3.0.0 valid date
                     rc_RemoveCssClass( oObj, 'rc-invalid' );
                     oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:',oObj.Hint ); //para limpar ao cancelar o cadastro | to clear when canceling registration
                  end;
               end;
            end;
         end;
     end;
end;
//8.0.0.0
procedure rc_AddFocusBlur( pFormFrame : TObject; pObj : TUniControl; pEDIT_COLOR, pEDIT_FOCUS_COLOR, pEDIT_FONT_COLOR : string );
var
   bIsDate : boolean;
begin
   bIsDate := ( pObj is TUniDateTimePicker ) or ( pObj is TUniDBDateTimePicker );
   if ( Pos( 'focus-color:off' , TUniEdit( pObj ).Hint ) = 0 ) then
   begin
      pObj.ClientEvents.ExtEvents.Values['onfocus'] :=
         'function focus(sender, eOpts)'+
         '{  document.getElementById(sender.getInputId( )).style.backgroundColor = "' + ColorToHtml( StringToColor( pEDIT_FOCUS_COLOR ) ) + '";' + //    "#ffffff";'+
         '   document.getElementById(sender.getInputId( )).style.color = "' + ColorToHtml( StringToColor( pEDIT_FONT_COLOR ) ) + '";' +

         //'UniSession.AddJS('$("input").attr("autocomplete", "off");');' +

         '   ajaxRequest( ' + mm.varC_JSNAME_HTMLFRAME + '  , "_onFocus", ' +
         '                [ ' +
         '                "pform=" + ' + QuotedStr( TComponent( pFormFrame ).Name ) + ', ' +
         '                "pobj=" + ' + QuotedStr( pObj.Name ) +
         '                ]);' +
         '}';

      pObj.ClientEvents.ExtEvents.Values['onblur'] :=
         'function focusout(sender, eOpts)'+
         '{  document.getElementById(sender.getInputId( )).style.backgroundColor = "' + ColorToHtml( StringToColor( pEDIT_COLOR ) ) + '";'+
         '   document.getElementById(sender.getInputId( )).style.color = "' + ColorToHtml( StringToColor( pEDIT_FONT_COLOR ) ) + '";' +
         '   var vVal = document.getElementById(sender.getInputId( )).value;' +
         '   ajaxRequest( ' + mm.varC_JSNAME_HTMLFRAME + '  , "_onBlur", ' +
         '                [ ' +
         '                "pform=" + ' + QuotedStr( TComponent( pFormFrame ).Name ) + ', ' +
         '                "pvalue=" + vVal,' +
         '                "ptype=" + ' + QuotedStr( varIIF( bIsDate, 'date', 'edit' ) ) + ', ' +
         '                "pobj=" + ' + QuotedStr( pObj.Name ) +
         '                ]);' +
         '}';
   end
   else
   begin
      pObj.ClientEvents.ExtEvents.Values['onfocus'] :=
         'function focus(sender, eOpts)'+
         '{  ajaxRequest( ' + mm.varC_JSNAME_HTMLFRAME + '  , "_onFocus", ' +
         '                [ ' +
         '                "pform=" + ' + QuotedStr( TComponent( pFormFrame ).Name ) + ', ' +
         '                "pobj=" + ' + QuotedStr( pObj.Name ) +
         '                ]);' +
         '}';

      pObj.ClientEvents.ExtEvents.Values['onblur'] :=
         'function focusout(sender, eOpts)'+
         '{  var vVal = document.getElementById(sender.getInputId( )).value;' +
         '   ajaxRequest( ' + mm.varC_JSNAME_HTMLFRAME + '  , "_onBlur", ' +
         '                [ ' +
         '                "pform=" + ' + QuotedStr( TComponent( pFormFrame ).Name ) + ', ' +
         '                "pvalue=" + vVal,' +
         '                "ptype=" + ' + QuotedStr( varIIF( bIsDate, 'date', 'edit' ) ) + ', ' +
         '                "pobj=" + ' + QuotedStr( pObj.Name ) +
         '                ]);' +
         '}';
   end;
end;
//[PT] existe form/frame adicionado em um objeto ?
//[EN] is there a form/frame added to an object?
procedure rc_UpdateFormsInsideContainers;
var
   cOwner, cModal, cFrameForm, cFrameFormInParent : string;
   oObj : TUniControl;
   oFrm : TUniForm;
   oOwner : TObject;
begin
  cFrameFormInParent := mm.varC_FormsInParent;
  while Length( trim(cFrameFormInParent) ) > 0 do
  begin
     cFrameFormInParent := Copy( cFrameFormInParent, Pos( ';' , cFrameFormInParent ) + 1 ) + ' ';
     cFrameForm         := Copy( cFrameFormInParent, 1, Pos( ' ', cFrameFormInParent )-1 );
     cOwner := '';
     oObj := nil ;
     if Pos( '|' , cFrameForm ) > 0 then
     begin
        cOwner := Copy( cFrameForm, 1, Pos( '|', cFrameForm ) - 1 );
        oOwner := rc_FindControl( cOwner );
        cFrameForm := StringReplace( cFrameForm, cOwner + '|', '', [rfReplaceAll] );
        oObj   := rc_FindControl( cFrameForm, oOwner );
     end;
     if oObj = nil then
     begin
       oObj := rc_FindControl( cFrameForm );
     end;
     if oObj <> nil then
     begin
        dm_rc.rc_ResizeBlocks( oObj , true, true, false );
        {RC DB}if ( mm.varC_Form_Detail = nil ) and ( mm.varC_Form_Modal = nil ) then
        {RC DB}   dm_rc.rc_DBGridUpdateAll( oObj)
        {RC DB}else
        {RC DB}if ( mm.varC_Form_Detail <> nil ) then
        {RC DB}   dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Detail)
        {RC DB}else
        {RC DB}if rc_FindControl( mm.varC_Form_Modal.Name ) <> nil then
        {RC DB}   dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Modal ) ;
     end;
     if cOwner = '' then
        cFrameFormInParent := StringReplace( cFrameFormInParent, cFrameForm, '', [rfReplaceAll] )
     else
        cFrameFormInParent := StringReplace( cFrameFormInParent, cOwner + '|' +  cFrameForm, '', [rfReplaceAll] ) ;
  end;
  cFrameFormInParent := mm.varC_FormsInParent;
end;
//8.0.0.0
procedure rc_ScrollTop( pFormFrame : TObject );
var
   i : integer;
begin
  // all itemn set tag = 0
  for I := 0 to TComponent(pFormFrame).ComponentCount - 1 do
  begin
      if TComponent(pFormFrame).Components[i] is TUniScrollBox then
      begin
           try
              TUniScrollBox( TComponent(pFormFrame).Components[i] ).SelectFirst;
              TUniScrollBox( TComponent(pFormFrame).Components[i] ).ScrollTo( 0,0 );
           except
           end;
      end;
  end;
end;

function rc_GetScrollBoxForMobileKeyboard( pObj : TObject ):TObject;
var
   i : integer;
   oSBox : TUniScrollBox;
   oScrollBlock : TObject;
begin
   Result       := nil;
   oScrollBlock := nil;
   i            := 0;
   if pObj <> nil then
   begin
      if TUniControl( pObj ).HasParent then
         Result := TUniControl( pObj ).Parent;
      while ( Result.ClassName <> 'TUniScrollBox' ) and ( i < 3 ) do
      begin
         if TUniControl( Result ).HasParent then
         begin
            Result := TUniControl( Result  ).Parent;
         end;
         if ( Result.ClassName <> 'TUniScrollBox' ) then
            Inc( i );
      end;
      if ( Result.ClassName <> 'TUniScrollBox' ) then
         Result := nil;
   end;
end;
// HOUVE ERRO NA COMPILAÇÃO ?   /   DO YOU HAVE A COMPILE ERROR ?
//
// in unigui old versions, maybe need to comment this lines below
// em versões antigas do unigui, comente as linhas abaixo
// 6.0.0.0
procedure rc_BringToFront( pObject : TObject; pLevel:integer );
var
   cCls : string;
begin
     case pLevel of
          0 : cCls := 'rc-z-index-2';
          1 : cCls := 'bringtofront-lower';
          2 : cCls := 'bringtofront';
          3 : cCls := 'bringtofront-higher';
     end;
     if pObject is TUniForm then
        TUniForm( pObject ).JSInterface.JSCall( 'addCls' , [cCls])
     else
        TUniControl( pObject ).JSInterface.JSCall( 'addCls' , [cCls]);
end;
// 6.0.0.0
procedure rc_RenderLayout( pForm: TObject; pAdjustFormSize : boolean ; pResizeBlocks : boolean ; pMainMenuExists : boolean ; pUpdateDBGrids : boolean; pAdjustEdits : boolean; pDynamicAlignment : boolean; pBootstrapRender : boolean ); // 6.0.0.0
var
   oMainMenu : TObject;
   bModal    : boolean;
   cHint     : string;
begin
    {$IFDEF RELEASE}
    dm_rc.rc_ProtectForm( pForm );
    {$ENDIF}
    UniSession.SuspendLayouts;
    try
        bModal := false;
//        if pForm is TUniForm then
//           TUniForm( pForm ).RTL := mm.RTL
//        else
//           TUniFrame( pForm ).RTL := mm.RTL;
        //[PT] para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no que estiver "abaixo" do MODAL
        //[EN] so when a FORM MODAL is active, do not run "dbGridUpdate" on anything "below" the MODAL
        mm.varC_Form_Modal := nil;
        if pForm is TUniForm then
        begin
           if mm.CONFIG_LAYOUT_ROUND_FORM = 'ON' then
              rc_AddCssClass( pForm, 'form-rounded' )
           else
              rc_AddCssClass( pForm, 'form-noborder' );

           if Pos( 'modal:' , TUniForm( pForm ).Hint ) > 0 then
              mm.varC_Form_Modal := TUniForm( pForm );
        end;



        rc_ScrollBoxAlignReset( pForm );

        oMainMenu := nil;

        cHint     := rc_NormalizeHintAttr( TUniControl( pForm ).Hint );

        if ( pForm is TUniForm ) then
           bModal := Pos( 'modal:' , cHint ) > 0 ;

        if ( lowercase( TUniControl( pForm ).name ) = 'mainform' ) or
           ( lowercase( TUniControl( pForm ).name ) = 'mf' ) or ( bModal ) then
           pMainMenuExists := false;

        oMainMenu := dm_rc.rc_ScreenUpdate( pMainMenuExists );

        //[PT] se for MODAL não precisa dar o 'offset' do mainmenu
        //[PT] if it is MODAL, you do not need to set the mainmenu offset
        if bModal then oMainMenu := nil;

        if ( not bModal ) and ( pForm is TUniForm ) then
        begin
           if Pos( 'width:max', cHint ) > 0 then
           begin
             if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
                TUniControl( pForm ).Width := mm.varI_ScreenWidth
             else
             begin
                if oMainMenu = nil then
                   TUniControl( pForm ).Width := mm.varI_ScreenWidth
                else
                   TUniControl( pForm ).Width := mm.varI_ScreenWidth - TUniControl( oMainMenu ).Width;
             end;
           end;

           if Pos( 'height:max', cHint ) > 0 then
              TUniControl( pForm ).Height  := mm.varI_ScreenHeight;
        end;

        if pAdjustFormSize then
           if bModal then
              rc_AdjustFormsSize( nil, pResizeBlocks )
           else
              rc_AdjustFormsSize( oMainMenu , pResizeBlocks );

        if pAdjustEdits then
           dm_rc.rc_AdjustEditColors ( pForm );

        dm_rc.rc_RenderControls( pForm );
        //8.4.0.0
        if not pResizeBlocks then
        begin
           if pBootstrapRender then
              dm_rc.rc_BootStrapRender( pForm );

           if pDynamicAlignment then
              rc_DynamicAlignment( pForm );
        end
        else
        if ( pMainMenuExists ) and ( TUniControl( pForm ).Name = 'MainForm' ) then
        begin
           dm_rc.rc_ResizeBlocks( pForm, true, true, false );
        end;

        {RC DB}if pUpdateDBGrids then
        {RC DB}   dm_rc.rc_DBGridUpdateAll( pForm, true, true, true );
    finally
        UniSession.ResumeLayouts;
    end;
end;
// 6.0.0.0
function rc_FindFormFrameIntoTab( pFormName: string; pObjName : string; pSeq : integer ): TObject;
var
   i : integer;
   c : string;
begin
     Result := nil;
     c := '';
     if mm.oPgGeneral <> nil then
     begin
        for I := 0 to mm.oPgGeneral.PageCount - 1 do
        begin
            if pSeq = 0 then
            begin
               if Pos( lowercase( pFormName ), lowercase( mm.oPgGeneral.Pages[i].Name ) ) > 0 then
               begin
                  c := Copy( mm.oPgGeneral.Pages[i].Name, 5, 100 );
                  break;
               end;
            end
            else
            begin
               if ( Pos( lowercase( pFormName ), lowercase( mm.oPgGeneral.Pages[i].Name ) ) > 0 ) and
                  ( Pos( '__' + pseq.ToString , mm.oPgGeneral.Pages[i].Name ) > 0 ) then
               begin
                  c := Copy( mm.oPgGeneral.Pages[i].Name, 5, 100 );
                  break;
               end;
            end;
        end;
     end;
     // 6.0.0.0
     if c <> '' then
     begin
        Result := rc_FindControl( c );
        if Result = nil then
        begin
           c := mm.oPgGeneral.Pages[i].Name;
           Result := rc_FindControl( c );
        end;
        if ( Result <> nil ) and ( pObjName <> '' ) then
        begin
              Result := rc_FindControl( pObjName, Result );
         end;
     end;
end;

function rc_FindObject( pName: string; pForm : TObject ): TObject;
begin
     Result := nil;
     if UniApplication.FindComponent('MainForm' ) <> nil then
        if pForm = nil then pForm := MainForm;

     if pForm <> nil then
     begin
        Result := TObject( TComponent( pForm ).FindComponent( pName ) );

        if Result = nil then
           Result := TObject( UniApplication.FindComponent( pName ) );

        if Result = nil then
           if TUniControl( pForm ).Name = 'MainForm' then
              Result := TObject( MainForm.FindComponent( pName ) )
           else
           if pForm is TUniForm then
              Result := TObject( TUniForm ( pForm ).FindComponent( pName ) )
           else
              Result := TObject( TUniFrame ( pForm ).FindComponent( pName ) );
     end;
end;

function rc_FindControl( pName: string; pForm : TObject ): TUniControl;
begin
     Result := nil;
     if UniApplication.FindComponent('MainForm' ) <> nil then
        if pForm = nil then pForm := MainForm;

     if pForm <> nil then
     begin
        Result := TUniControl( TComponent( pForm ).FindComponent( pName ) );

        if Result = nil then
           Result := TUniControl( UniApplication.FindComponent( pName ) );

        if Result = nil then
           if TUniControl( pForm ).Name = 'MainForm' then
              Result := TUniControl( MainForm.FindComponent( pName ) )
           else
           if pForm is TUniForm then
              Result := TUniControl( TUniForm ( pForm ).FindComponent( pName ) )
           else
              Result := TUniControl( TUniFrame ( pForm ).FindComponent( pName ) );
     end;
end;

function rc_FindAllComponents(pForm: TObject; pCriteria: string): TStringList;
var
  i : Integer;
  sl : TStringList;
begin
  sl := TStringList.Create;

  Try
     if pForm is TUniForm then
     begin
        for i := 0 to TUniForm( pForm ).ComponentCount - 1 do
        begin
           if Pos( lowercase( pCriteria ), lowercase( TUniForm( pForm ).Components[ i ].Name ) ) > 0 then
           begin
                sl.Add( TUniForm( pForm ).Components[ i ].Name );
           end;
        end;
     end
     else
     if pForm is TUniFrame then
     begin
        for i := 0 to TUniFrame( pForm ).ComponentCount - 1 do
        begin
           if Pos( lowercase( pCriteria ), lowercase( TUniFrame( pForm ).Components[ i ].Name ) ) > 0 then
           begin
                sl.Add( TUniFrame( pForm ).Components[ i ].Name );
           end;
        end;
     end;
  Finally
        Result := sl;
  End;
end;
// 7.2.0.0
function rc_GetHintAttr(pProp, pProps: string; bParam : boolean; bFullLength:boolean; bUntilNextSpace : boolean ): string;
var
   cTmp : string;
   iPos : integer;
begin
    if pos( pProp, pProps ) = 0 then
       Result := ''
    else
    begin
       cTmp := rc_NormalizeHintAttr( pProps );
       iPos := rc_PosHintAttr( pProp, cTmp );
       if iPos > 0 then
       begin
          cTmp := Trim( Copy( cTmp, iPos , 1000 ) ) + '.$%¨&*.';
          //8.1.0.0
          if ( pProp = 'lkpfilter-gridattr:' ) and ( Pos( 'lkpfilter-gridattr:', cTmp ) > 0 ) then
          begin
             cTmp := Copy( cTmp, 1, Pos( ';]]', cTmp ) + 2 );
          end
          else
          if Pos( '|', cTmp ) > 0 then
             cTmp := Trim( Copy( cTmp, 1, Pos( '|', cTmp ) - 1 ) )
          else
             cTmp := Trim( Copy( cTmp, 1, Pos( '.$%¨&*.', cTmp ) - 1 ) );

          cTmp := Trim( StringReplace( cTmp , pProp, '', [rfReplaceAll] ) );
          //7.0.0.0
          if bParam then
          begin
//             if Pos( ':', cTmp ) = 0 then
//                cTmp := cTmp + ' :';
             if not bFullLength then
             begin
                if Pos( ':', cTmp ) > 0 then
                begin
                   cTmp := ReverseStr( Copy( cTmp, 1, Pos( ':', cTmp ) ) );
                   cTmp := Trim( ReverseStr( Copy( cTmp, Pos( ' ', cTmp ) ) ) );
                end
                else
                if ( Pos( '-', cTmp ) > 0 ) and ( pProp <> 'c:' ) and ( Pos( 'cls', pProp ) = 0  ) then
                begin
                   cTmp := ReverseStr( Copy( cTmp, 1, Pos( '-', cTmp ) ) );
                   cTmp := Trim( ReverseStr( Copy( cTmp, Pos( ' ', cTmp ) ) ) );
                end
                else
                   cTmp := Trim( Copy( cTmp, 1, Pos( ' ' , cTmp + ' ' ) ) );
             end
             else
             begin
                  cTmp := Trim( Copy( cTmp, 1, 1000 ) );
                  if Pos( '|', cTmp ) > 0 then
                     cTmp := Trim( Copy( cTmp, 1, Pos( '|', cTmp )-1 ) );
             end;
          end;
       end
       else
          cTmp := '';
       //[PT]
       // algumas propriedades não precisam de valores, entao, assumem um DEFAULT de acordo com seu contexto
       //
       // Ex: edLKPTABLE_SetDS_FieldName( veja um exemplo no "frmCadCLIENTES" - campo: edLkpCIDADES_SetDS_CodiIbge )
       //
       //       [[saveto:field]] -> salvar conteudo de "FieldName" no campo "field"
       //       [[saveto:]]      -> salvar conteudo de "FieldName" no campo de próprio nome do lookup, ou seja, "FieldName"
       //
       //   quando ocorrer isso, será retornado pela função o conteúdo "_default" para ser tratado no seu código.
       //
       //[EN]
       //
       // some properties don't need values, so they take a DEFAULT according to their context
       //
       // Ex: edLKPTABLE_SetDS_FieldName (see an example in "frmCadCLIENTES" - field: edLkpCIDADES_SetDS_CodiIbge)
       //
       // [[saveto: field]] -> save content from "FieldName" in field "field"
       // [[saveto:]] -> save "FieldName" content in the lookup's own name field, that is, "FieldName"
       //
       // when this occurs, the function will return the content "_default" to be treated in your code.
       //
       if ( iPos > 0 ) then
       begin
          if ( cTmp = '' ) and ( pProp = 'saveto:' ) then
             Result := '_default'
          else
          begin
             Result := cTmp;
             if bUntilNextSpace then
             begin
                Result := Result + ' ';
                Result := Copy( Result, 1, Pos( ' ', Result ) - 1 );
             end;
          end;
       end
       else
          Result := '';
    end;
end;
// 6.0.0.0+
function rc_SetHintAttr( pContent, pProp, pProps: string; pAdd : boolean) : string;
var
   cTmp, cTmp2 : string;
   iPos : integer;
begin
    cTmp2 := rc_NormalizeHintAttr( pProps );
    iPos  := rc_PosHintAttr( pProp, cTmp2 );

    if iPos > 0 then
    begin
       cTmp := Trim( Copy( cTmp2, iPos , 200 ) ) + '.$%¨&*.';
       if Copy( cTmp, 1, 1 ) = '|' then
          cTmp := Copy( cTmp, 2 );
       if Pos( '|', cTmp ) > 0 then
          cTmp := Trim( Copy( cTmp, 1, Pos( '|', cTmp ) - 1 ) )
       else
          cTmp := Trim( Copy( cTmp, 1, Pos( '.$%¨&*.', cTmp ) - 1 ) );

       if pAdd then
       begin
          if Copy( cTmp, Length( cTmp ), 1 ) = ':' then
             cTmp2 := Trim( StringReplace( cTmp2 , cTmp, cTmp + pContent, [rfReplaceAll] ) )
          else
             cTmp2 := Trim( StringReplace( cTmp2 , cTmp, cTmp + ' ' + pContent, [rfReplaceAll] ) );
       end
       else
          cTmp2 := Trim( StringReplace( cTmp2 , cTmp, pProp + pContent, [rfReplaceAll] ) );
    end
    else
    if ( cTmp2 <> '' ) then
        cTmp2 := cTmp2 + '|' + pProp + pContent
    else
       cTmp2 := pProp + pContent ;
    Result := '[[' + cTmp2 + ']]';
end;
// 6.0.0.0+
//[PT] adiciona se nao existir
//[EN] add if not exists
function rc_AddHintAttr( pContent, pProps : string; pUpdate : boolean ) : string;
var
   cAttrToAdd, cValueToAdd,
   cAttrOfObj, cValueOfObj,
   cTmp, cFirstChar, cProp, cValue : string;
begin
    cTmp := rc_NormalizeHintAttr( pProps ); // 6.0.0.0
    Result := '[[' + cTmp;
    cValue := '';
    cProp := Trim( Copy( pContent, 1, Pos( ':', pContent ) ) );
    //...
    cFirstChar := '';
    if ReturnLetters( copy( cProp, 1, 1 ) ) = ''  then
    begin
       cFirstChar := copy( cProp, 1, 1 );
       cProp := copy( cProp, 2 );
    end;
    // separar atributo/valor do conteúdo a ser adicionado
    if cProp <> '' then
    begin
       cAttrToAdd  := cProp;
       cValueToAdd := rc_GetHintAttr( cAttrToAdd, pContent );
    end;
    // separar atributo/valor do conteúdo atual do objeto
    if pProps <> '' then
    begin
       cAttrOfObj  := cProp;
       cValueOfObj := rc_GetHintAttr( cAttrOfObj, pprops ); //default cls-label:default
    end;
    //...
    if pUpdate then
    begin
       if ReturnLetters( copy( cProp, 1, 1 ) ) = ''  then
       begin
          cFirstChar := copy( cProp, 1, 1 );
          cProp := copy( cProp, 2 );
       end;
       if cProp <> '' then
          cValue := rc_GetHintAttr( cProp, pprops );

       if cValue <> '' then
       begin
          if Pos( '[[' + cProp + cValue , Result ) > 0 then
          begin
             if pContent.StartsWith( '|' ) then
                pContent := Copy( pContent, 2 );

             Result := StringReplace( Result, '[[' + cProp + cValue, '[[' + pContent, [rfReplaceAll] );
          end
          else
          if Pos( cFirstChar + cProp + cValue , Result ) > 0 then
             Result := StringReplace( Result, cFirstChar + cProp + cValue, pContent, [rfReplaceAll] )
          else
             Result := StringReplace( Result, cProp + cValue, pContent, [rfReplaceAll] );
       end
       else
       begin
         Result := StringReplace( Result, cProp + cValue, '', [rfReplaceAll] );
         Result := Result + pContent ;
       end;
    end
    else
    begin
       //6.0.0.0+
       Result := StringReplace( Result, pContent, '', [rfReplaceAll] );
       Result := Result + pContent ;
    end;
    Result := Result + ']]';
end;

function rc_NormalizeAllTrim( pContent, pToken : string): string;
begin
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '      ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '      ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '     ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '     ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '    ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '    ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '   ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '   ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '  ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '  ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + ' ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + ' ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '', pToken, [rfReplaceAll] ) );

       pContent := Trim( StringReplace( pContent , ' ' + pToken + '      ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '      ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '     ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '     ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '    ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '    ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '   ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '   ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '  ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '  ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + ' ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + ' ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '', pToken, [rfReplaceAll] ) );

       pContent := Trim( StringReplace( pContent , pToken + '      ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '      ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '     ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '     ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '    ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '    ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '   ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '   ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '  ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '  ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + ' ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + ' ', pToken, [rfReplaceAll] ) );

       Result := pContent;
end;

function rc_NormalizeHintAttr(pContent: string): string;
begin
    pContent  := Trim( rc_RemoveTagContents( pContent, '/*' , '*/') ); // 6.0.0.0

    if Copy( pContent, 1, 2 ) = '[[' then
    begin
       pContent := RemoveLineBreaks( Trim( pContent ) );
       pContent := Trim( StringReplace( pContent , '[[     ', '[[', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '[[    ', '[[', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '[[  ', '[[', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '[[ ', '[[', [rfReplaceAll] ) );

       pContent := Trim( StringReplace( pContent , '     ]]', ']]', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '    ]]', ']]', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '   ]]', ']]', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ]]', ']]', [rfReplaceAll] ) );

       pContent := Copy( pContent, 3, 2000 );
       pContent := Copy( pContent, 1, length( pContent ) - 2 );

       pContent := Trim( StringReplace( pContent , '||', '|', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '|   ', '|', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '   |', '|', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '|  ', '|', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  |', '|', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' | ', '|', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '| ', '|', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' |', '|', [rfReplaceAll] ) );
    end;
    Result := pContent;
end;

function rc_PosHintAttr( pProp, pContent: string): integer;
var
   r,l : integer;
   cTmp, cTmp2 : string;
begin
    r := 0;
    if pContent <> '' then
    begin
       cTmp := pContent;
       cTmp2 := cTmp;

       if copy( pContent, 1, Length( pProp ) ) = pProp then
          r := 1
       else
       begin
          r := Pos( '[[' + pProp, pContent );

          if ( r = 0 ) then
          begin
             r := Pos( '|' + pProp, pContent );

             if r = 0 then
             begin
                r := Pos( ';' + pProp, pContent );

                if r = 0 then
                begin
                   r := Pos( ' ' + pProp, pContent );

                   if r = 0 then
                   begin
                      l := Pos( pProp, pContent );

                      if l > 1 then
                      begin
                         cTmp2 := Copy( pContent, l-1, 100 );

                         if Copy( cTmp2, 1, 1 ) <> Copy( pProp, 1, 1 ) then
                            r := 0
                         else
                            r := Pos( pProp, cTmp2 );
                      end
                      else
                         r := l;
                   end
                   else
                       r := r + 1;
                end
                else
                    r := r + 1;
             end
             else
                 r := r + 1;
          end
          else
              r := r + 2;
       end;
    end;
    result := r;
end;
//8.0.0.3
procedure rc_CreateCssClass( pObj : TObject; pDefStr : string; pExtraID : string;  pAddCss : boolean );
begin
    if Pos( 'rc-classcreated:' + TUniControl( pObj ).JSId + '_' + pExtraID , TUniControl( pObj ).Hint ) = 0 then
    begin
       UniSession.AddJS(
          '$(''<style>'') ' +
          '.prop(''type'', ''text/css'')' +
          '.html(''' +
             '.css-rc-' + TUniControl( pObj ).JSId + '_' + pExtraID +
             pDefStr + ''')' +
          '.appendTo(''head'');' );
       TUniControl( pObj ).Hint := rc_SetHintAttr( TUniControl( pObj ).JSId + '_' + pExtraID , 'rc-classcreated:', TUniControl( pObj ).Hint, true );
    end;
    if pAddCss then rc_AddCssClass( TUniControl( pObj ) , 'css-rc-' + TUniControl( pObj ).JSId + '_' + pExtraID );

//    with TUniControl( pObj ), JSInterface do
//    begin
//      if Pos( 'rc-classcreated:' + JSId , hint) = 0 then
//      begin
//         JSCallGlobal('Ext.util.CSS.createStyleSheet',
//                       //['#' + JSId +'.x-btn .x-btn-inner { color: red !important;}',
//                       [ '#' + JSId + pDefStr , JSName + '_css1' ]);
//         hint := rc_SetHintAttr( JSId , 'rc-classcreated:', hint, true );
//      end;
//    end;
end;
//7.0.0.0
procedure rc_DeleteCssClass( pObj : TObject; pDefStr : string);
begin
     with TUniControl( pObj ), JSInterface do
     begin
       if Pos( 'rc-classcreated:' + JSId , hint) = 0 then
       begin
          JSCallGlobal( 'Ext.util.CSS.removeStyleSheet',[JSName + '_css1']);
          hint := StringReplace( Hint, '|rc-classcreated:' + JSId, '', [] );
          hint := StringReplace( Hint, 'rc-classcreated:' + JSId + '|', '', [] );
       end;
     end;
end;
//7.3.0.0
procedure rc_AddCssClass(pObj: TObject; pCls: string);
var
  cAddedCss : string;
begin
     if pCls <> '' then
     begin
        if pObj is TUniForm then
        begin
           cAddedCss := ' ' + rc_GetHintAttr( 'addedcss:', TUniForm( pObj ).Hint );
           if ( Pos( pCls, cAddedCss ) = 0 ) then
           begin
              TUniForm( pObj ).WebForm.JSInterface.JSCall( 'addCls' , [ pCls ]);
              TUniForm( pObj ).Hint := rc_SetHintAttr( trim(pCls), 'addedcss:', TUniForm( pObj ).Hint, true );
           end;
        end
        else
        begin
           cAddedCss := ' ' + rc_GetHintAttr( 'addedcss:', TUniControl( pObj ).Hint );
           if ( Pos( pCls, cAddedCss ) = 0 ) then
           begin
              //8.0.0.0
              //if not ( pObj is TUniDateTimePicker ) then
              // [PT] Algum tratamento interno do unigui gera a exceção ao aplicar um css em componentes TUniDateTimePicker somente em DEBUG
              // [EN] Some internal handling of unigui generates an exception when applying a css to TUniDateTimePicker components only in DEBUG
              // 'There is no Default JavaScript Object. [edDtIni : TUniDateTimePicker]'
              begin
                 try
                    TUniControl( pObj ).JSInterface.JSCall( 'addCls' , [ pCls ]);
                 except
                 end;
                 TUniControl( pObj ).Hint := rc_SetHintAttr( trim(pCls), 'addedcss:', TUniControl( pObj ).Hint, true );
              end;
           end;
        end;
     end;
end;
// 6.1.0.4 add remove css
procedure rc_RemoveCssClass(pObj: TObject; pCls: string; pForce:boolean );
var
  cOld, cAddedCss : string;
begin
    if pCls <> '' then
    begin
       if pObj is TUniForm then
       begin
          cOld := rc_GetHintAttr( 'addedcss:', TUniForm( pObj ).Hint );
          cAddedCss := ' ' + cOld;
          if ( Pos( ' ' + pCls, cAddedCss ) > 0 ) or ( pForce ) then
          begin
             TUniForm( pObj ).WebForm.JSInterface.JSCall( 'removeCls' , [ pCls ]);
             cAddedCss := StringReplace( cAddedCss, ' ' + pCls, '', [rfReplaceAll] );
             TUniForm( pObj ).Hint := StringReplace( TUniForm( pObj ).Hint, 'addedcss:' + Trim(cOld), 'addedcss:' + Trim(cAddedCss), [rfReplaceAll] );
          end;
       end
       else
       begin
          cOld := rc_GetHintAttr( 'addedcss:', TUniControl( pObj ).Hint );
          cAddedCss := ' ' + cOld;
          if ( Pos( ' ' + pCls, cAddedCss ) > 0 ) or ( pForce ) then
          begin
             //TUniControl( pObj ).JSInterface.JSCall( 'removeCls' , [ pCls ]);
             try
                TUniControl( pObj ).JSInterface.JSCall( 'removeCls' , [ pCls ]);
             except
             end;

             cAddedCss := StringReplace( cAddedCss, ' ' + pCls, '', [rfReplaceAll] );
             TUniControl( pObj ).Hint := StringReplace( TUniControl( pObj ).Hint, 'addedcss:' + Trim(cOld), 'addedcss:' + Trim(cAddedCss), [rfReplaceAll] );
          end;
       end;
    end;
end;

procedure rc_ScreenAdjustMobileKeyboard( pForm : TObject; pOffSetV, pOffSetH : Integer );
begin
     if ( mm.varB_Mobile_Screen_Portrait ) then
        TUniControl( pForm ).Top := TUniControl( pForm ).Top - pOffSetV
     else
     if ( mm.varB_Mobile_Screen_Landscape ) then
        TUniControl( pForm ).Top := TUniControl( pForm ).Top - pOffSetH;
end;

procedure rc_AdjustFormsSize( pMainMenu : TObject ; pResizeBlocks : boolean );
var
   oMainMenu ,
   oObj : TUniControl;
   oFrm : TUniForm;

   bHeightMax, bWidthMax,
   bAlignLeft, bAlignRight, bAlignTop, bAlignBottom : Boolean;

   cHint,
   cTmp, cTmp2, cTmpW, cTmpH : string;

   bModal,
   bFrmAlign,
   bWidthFix,
   bHeightFix :boolean;

   iMaxWidth, iMaxHeight,
   x, y,
   i : integer;
begin
     oMainMenu := TUniControl ( pMainMenu );
     // se houver algum FORM filho aberto ajusta dimensões
     if ( mm.varC_Form_Detail <> nil ) then
     begin
          oFrm       := TUniFORM( mm.varC_Form_Detail );
          bWidthFix  := false;
          bHeightFix := false;
          iMaxWidth  := 0;
          iMaxHeight := 0;

          cTmp  := '';
          cTmp2 := '';
          // 6.0.0.0
          if Pos( '[[', TUniForm(oFrm).Hint ) = 0 then
             cTmp2 := '[['
          else
             TUniForm(oFrm).Hint := '[[' + rc_NormalizeHintAttr( TUniForm(oFrm).Hint ) + ']]';

          //[[height:max]]
          bHeightMax := Pos( 'height:max'  , TUniForm(oFrm).Hint ) > 0 ;
          bWidthMax  := Pos( 'width:max'   , TUniForm(oFrm).Hint ) > 0 ;
          bModal     := Pos( 'modal:'      , TUniForm(oFrm).Hint ) > 0 ;

          //[[frm-align:right]]
          bAlignLeft   := Pos( 'frm-align:left'   , TUniForm(oFrm).Hint ) > 0 ;
          bAlignRight  := Pos( 'frm-align:right'  , TUniForm(oFrm).Hint ) > 0 ;
          bAlignTop    := Pos( 'frm-align:top'    , TUniForm(oFrm).Hint ) > 0 ;
          bAlignBottom := Pos( 'frm-align:bottom' , TUniForm(oFrm).Hint ) > 0 ;

          bFrmAlign    := ( bAlignBottom ) or ( bAlignTop ) or ( bAlignLeft ) or ( bAlignRight ) ;

          if ( Pos( 'width:' , oFrm.Hint ) = 0 )  then
          begin
             if not oFrm.Hint.IsEmpty then
                cTmp := cTmp + '|';
             if oFrm.Align = alClient then
                cTmp := 'width:' + oFrm.Parent.Width.ToString + '|rc_wupd' + cTmp
             else
                 cTmp := 'width:' + oFrm.Width.ToString + '|rc_wupd' + cTmp;

             oFrm.Hint := cTmp + StringReplace( oFrm.Hint, '[[', '', [rfReplaceAll] );
          end;

          if ( Pos( 'height:' , oFrm.Hint ) = 0 )  then
          begin
             if not cTmp.IsEmpty then
                cTmp := cTmp + '|';
             if oFrm.Align = alClient then
                cTmp := 'height:' + oFrm.Parent.height.ToString + '|rc_hupd'
             else
                 cTmp := 'height:' + oFrm.height.ToString + '|rc_hupd';

             oFrm.Hint := StringReplace( oFrm.Hint, '[[', '', [rfReplaceAll] );
             if oFrm.Hint.IsEmpty then
                oFrm.Hint := cTmp + oFrm.Hint
             else
                oFrm.Hint := cTmp + '|' + oFrm.Hint;
          end;

          if Pos( ']]', oFrm.Hint ) = 0 then
             oFrm.Hint  := oFrm.Hint + ']]';

          if Pos( '[[', oFrm.Hint ) = 0 then
             oFrm.Hint := '[[' + oFrm.Hint ;

          cHint := rc_NormalizeHintAttr( oFrm.Hint  );

          cTmp := rc_GetHintAttr( 'width:', cHint );
          if cTmp <> '' then
          begin
             bWidthFix := ( Pos( 'fix' , cTmp ) > 0 );
             iMaxWidth := StrToIntDef( ReturnNumbers( cTmp ), oFrm.Width );
          end;

          cTmp := rc_GetHintAttr( 'height:', cHint );
          if cTmp <> '' then
          begin
             bHeightFix := ( Pos( 'fix' , cTmp ) > 0 );
             iMaxHeight := StrToIntDef( ReturnNumbers( cTmp ), oFrm.Height );
          end;

          x := oFrm.Left;
          y := oFrm.Top;

          if x > 0 then
             oFrm.Width  := mm.varI_ScreenWidth - ( oFrm.Left * 2 )
          else
             oFrm.Width  := mm.varI_ScreenWidth ;

          if y > 0 then
             oFrm.Height := mm.varI_ScreenHeight - ( oFrm.Top * 2 )
          else
             oFrm.Height := mm.varI_ScreenHeight;

          if bHeightMax then
             oFrm.Height := mm.varI_ScreenHeight;

          if bWidthMax then
             oFrm.Width := mm.varI_ScreenWidth;

          oFrm.Left := ( mm.varI_ScreenWidth div 2 ) - (  oFrm.Width div 2 );
          oFrm.Top  := ( mm.varI_ScreenHeight div 2 ) - (  oFrm.Height div 2 );

          if pResizeBlocks then
             dm_rc.rc_ResizeBlocks( TUniControl(oFrm) );
     end
     else   // Form Detail are MODAL by Default
     begin
        if ( oMainMenu = nil ) then
           if ( UniApplication.FindComponent('MainForm' ) <> nil )  then
              oMainMenu := rc_FindControl( 'paLayoutMainMenu' );
     end;

     for I := 0 to UniApplication.ComponentCount - 1 do
     begin
         if ( UniApplication.Components[i] is TUniForm ) then
         begin
             oObj  := TUniControl( UniApplication.Components[i] );
             oFrm  := TUniForm( UniApplication.Components[i] );
             if ( oFrm.Name <> 'MainForm' ) then
             begin
                 // [[width:360 fix | height:353 fix]]
                 // [[width:sm-360 md-420 lg-540 | height:sm-353 md-420 lg-540]]  - thinking....
                 bWidthFix  := false;
                 bHeightFix := false;
                 iMaxWidth  := 0;
                 iMaxHeight := 0;

                 cTmp  := '';
                 cTmp2 := '';

                 if Pos( '[[', oFrm.Hint ) = 0 then
                    cTmp2 := '[['
                 else
                    oFrm.Hint := '[[' + rc_NormalizeHintAttr( oFrm.Hint ) + ']]';

                 //[[height:max]]
                 bHeightMax := Pos( 'height:max'  , TUniForm(oFrm).Hint ) > 0 ;
                 bWidthMax  := Pos( 'width:max'   , TUniForm(oFrm).Hint ) > 0 ;
                 bModal     := Pos( 'modal:'      , TUniForm(oFrm).Hint ) > 0 ;

                 //[[frm-align:right]]
                 bAlignLeft   := Pos( 'frm-align:left'   , TUniForm(oFrm).Hint ) > 0 ;
                 bAlignRight  := Pos( 'frm-align:right'  , TUniForm(oFrm).Hint ) > 0 ;
                 bAlignTop    := Pos( 'frm-align:top'    , TUniForm(oFrm).Hint ) > 0 ;
                 bAlignBottom := Pos( 'frm-align:bottom' , TUniForm(oFrm).Hint ) > 0 ;

                 bFrmAlign    := ( bAlignBottom ) or ( bAlignTop ) or ( bAlignLeft ) or ( bAlignRight ) ;

                 if ( Pos( 'width:' , oFrm.Hint ) = 0 )  then
                 begin
                    if not oFrm.Hint.IsEmpty then
                       cTmp := cTmp + '|';
                    if oFrm.Align = alClient then
                       cTmp := 'width:' + oFrm.Parent.Width.ToString + '|rc_wupd' + cTmp
                    else
                        cTmp := 'width:' + oFrm.Width.ToString + '|rc_wupd' + cTmp;

                    oFrm.Hint := cTmp + StringReplace( oFrm.Hint, '[[', '', [rfReplaceAll] );
                 end;

                 if ( Pos( 'height:' , oFrm.Hint ) = 0 )  then
                 begin
                    if not cTmp.IsEmpty then
                       cTmp := cTmp + '|';
                    if oFrm.Align = alClient then
                       cTmp := 'height:' + oFrm.Parent.height.ToString + '|rc_hupd'
                    else
                        cTmp := 'height:' + oFrm.height.ToString + '|rc_hupd';

                    oFrm.Hint := StringReplace( oFrm.Hint, '[[', '', [rfReplaceAll] );
                    if oFrm.Hint.IsEmpty then
                       oFrm.Hint := cTmp + oFrm.Hint
                    else
                       oFrm.Hint := cTmp + '|' + oFrm.Hint;
                 end;

                 if Pos( ']]', oFrm.Hint ) = 0 then
                    oFrm.Hint  := oFrm.Hint + ']]';

                 if Pos( '[[', oFrm.Hint ) = 0 then
                    oFrm.Hint := '[[' + oFrm.Hint ;

                 cHint := rc_NormalizeHintAttr( oFrm.Hint  );

                 cTmp := rc_GetHintAttr( 'width:', cHint );
                 if cTmp <> '' then
                 begin
                    bWidthFix := ( Pos( 'fix' , cTmp ) > 0 );
                    iMaxWidth := StrToIntDef( ReturnNumbers( cTmp ), oFrm.Width );
                    //8.0.0.0 george
                    if iMaxWidth > mm.varI_ScreenWidth then
                       iMaxWidth := mm.varI_ScreenWidth;
                 end;

                 cTmp := rc_GetHintAttr( 'height:', cHint );
                 if cTmp <> '' then
                 begin
                    bHeightFix := ( Pos( 'fix' , cTmp ) > 0 );
                    iMaxHeight := StrToIntDef( ReturnNumbers( cTmp ), oFrm.Height );
                    //8.2.0.0
                    if ( mm.varB_Mobile_Screen_Landscape ) and ( iMaxHeight > mm.varI_ScreenHeight ) then
                       iMaxHeight := mm.varI_ScreenHeight;
                 end;

                 if ( not bHeightMax ) or ( not bWidthMax ) then
                 begin
                    if ( oFrm.Name <> 'frmMessage' ) then
                    begin
                       //7.3.0.3
                       if ( mm.varB_Mobile_Screen ) and ( mm.varB_Tablet ) and ( not bWidthFix ) then
                       begin
                           oFrm.Width  := iMaxWidth;
                           oFrm.Height := iMaxHeight;
                       end
                       else
                       if mm.varB_Mobile_Screen_Landscape then
                       begin
                          If ( bModal ) or ( bFrmAlign ) then
                          begin
                             if not bWidthFix then
                               oFrm.Width := varIIF( ( iMaxWidth < 500 ), iMaxWidth, 500 )
                             else
                                oFrm.Width := iMaxWidth ;

                             if not bHeightFix then
                                oFrm.Height := mm.varI_ScreenHeight
                             else
                                oFrm.Height := iMaxHeight ;
                          end
                          else
                          begin
                             oFrm.Width  := mm.varI_ScreenWidth;
                             oFrm.Height := iMaxHeight ;
                          end;
                       end
                       else
                       if ( mm.varB_Mobile_Screen ) then
                       begin
                          If ( bModal ) or ( bFrmAlign ) then
                          begin
                             if ( ( not bWidthFix ) and ( not bWidthMax ) ) or ( bWidthMax ) then
                             begin

                               if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
                                  oFrm.Width := mm.varI_ScreenWidth
                               else
                               begin
                                  if oMainMenu = nil then
                                     oFrm.Width := mm.varI_ScreenWidth
                                  else
                                     oFrm.Width := mm.varI_ScreenWidth - TUniControl( oMainMenu ).Width;
                               end;
                             end
                             else
                                oFrm.Width := iMaxWidth ;

                             if ( ( not bHeightFix ) and ( not bHeightMax ) ) or ( bHeightMax ) then
                                oFrm.Height := mm.varI_ScreenHeight
                             else
                                oFrm.Height := iMaxHeight ;
                          end
                          else
                          begin
                             oFrm.Width  := mm.varI_ScreenWidth;
                             oFrm.Height := mm.varI_ScreenHeight;
                          end;
                       end
                       else
                       begin
                          If ( bModal ) or ( bFrmAlign ) then
                          begin
                              if iMaxWidth > 0 then
                                 oFrm.Width  := iMaxWidth ;

                              if iMaxHeight > 0 then
                                 oFrm.Height := iMaxHeight ;
                          end
                          else
                          begin
                             If ( bModal ) then
                             begin

                                if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
                                begin
                                    oFrm.Width  := mm.varI_ScreenWidth;
                                end
                                else
                                if UniApplication.FindComponent('MainForm' ) <> nil then
                                begin
                                     oMainMenu := rc_FindControl( 'paLayoutMainMenu' );
                                     if oMainMenu <> nil then
                                     begin
                                        oFrm.Width  := mm.varI_ScreenWidth - TUniControl( oMainMenu ).Width;
                                     end;
                                end
                                else
                                   oFrm.Width  := mm.varI_ScreenWidth;
                             end

                             else
                             if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
                                oFrm.Width  := mm.varI_ScreenWidth
                             else
                             begin
                                if oMainMenu = nil then
                                   oFrm.Width := mm.varI_ScreenWidth
                                else
                                   oFrm.Width := mm.varI_ScreenWidth - TUniControl( oMainMenu ).Width;
                             end;

                             oFrm.Height := iMaxHeight ;
                          end;
                       end;
                    end
                    else
                    begin
                       //7.3.0.3
                       if ( mm.varB_Mobile_Screen_Landscape ) and ( not mm.varB_Tablet ) then
                       begin
                          oFrm.Height:= mm.varI_ScreenHeight - 10;
                       end
                    end;

                    If ( bModal ) or ( bFrmAlign ) then
                    begin
                       if bAlignLeft then
                       begin
                            oFrm.Left := 0;
                            oFrm.Top  := 0;
                       end
                       else
                       if bAlignRight then
                       begin
                            oFrm.Left := ( mm.varI_ScreenWidth ) - oFrm.Width;
                            oFrm.Top  := 0;
                       end
                       else
                       if bAlignTop then
                       begin
                            oFrm.Left := ( mm.varI_ScreenWidth div 2 ) - (  oFrm.Width div 2 );
                            oFrm.Top  := 0;
                       end
                       else
                       if bAlignBottom then
                       begin
                            oFrm.Left := ( mm.varI_ScreenWidth div 2 ) - (  oFrm.Width div 2 );
                            oFrm.Top  := ( mm.varI_ScreenHeight ) - oFrm.Height;
                       end
                       else
                       begin
                          oFrm.Left := ( mm.varI_ScreenWidth div 2 ) - (  oFrm.Width div 2 );
                          oFrm.Top  := ( mm.varI_ScreenHeight div 2 ) - (  oFrm.Height div 2 );
                       end;

                       if ( bFrmAlign ) then
                       begin
                            cTmpH := rc_GetHintAttr( 'off-top:', oFrm.Hint, true );
                            if cTmpH <> ''  then
                            begin
                                 oFrm.Top := oFrm.Top + StrToIntDef( cTmpH, 0 );
                            end;
                            cTmpH := rc_GetHintAttr( 'off-bottom:', oFrm.Hint, true );
                            if cTmpH <> ''  then
                            begin
                                 oFrm.Top := oFrm.Top - StrToIntDef( cTmpH, 0 );
                            end;
                            cTmpH := rc_GetHintAttr( 'off-left:', oFrm.Hint, true );
                            if cTmpH <> ''  then
                            begin
                                if bAlignBottom then
                                   oFrm.Left := 0;
                                 oFrm.Left := oFrm.Left + StrToIntDef( cTmpH, 0 );
                            end;
                            cTmpH := rc_GetHintAttr( 'off-right:', oFrm.Hint, true );
                            if cTmpH <> ''  then
                            begin
                                if bAlignBottom then
                                   oFrm.Left := ( mm.varI_ScreenWidth ) - oFrm.Width;
                                oFrm.Left := oFrm.Left - StrToIntDef( cTmpH, 0 );
                            end;
                       end;
                    end
                    else
                    begin
                       oFrm.Left := 0;
                       oFrm.Top  := 0;
                    end;
                 end;

                 if bHeightMax then
                    oFrm.Height := mm.varI_ScreenHeight;
                 //8.0.0.0
                 if bWidthMax then
                 begin
                    if ( mm.CONFIG_LAYOUT_MENU_TYPE = '1' ) or ( bModal ) then
                       oFrm.Width := mm.varI_ScreenWidth
                    else
                    begin
                       if ( oMainMenu = nil ) or ( bModal ) then
                          oFrm.Width := mm.varI_ScreenWidth
                       else
                          oFrm.Width := mm.varI_ScreenWidth - TUniControl( oMainMenu ).Width;
                    end;
                 end;

                 if pResizeBlocks then
                   dm_rc.rc_ResizeBlocks( TUniControl(oObj), bModal );
             end;
         end;
     end;
end;
//8.0.0.0
procedure rc_AdjustEditColorsExecute( pForm : TObject; pAPP_FONT, pEDLKP_COLOR, pEDLKP_FONT_COLOR, pEDIT_COLOR, pEDIT_FONT_COLOR, pEDIT_COLOR_READONLY, pEDIT_FONT_COLOR_READONLY, pEDIT_FOCUS_COLOR : String );
var
   I, iT, iL : integer;
   tComp : TComponent;
   oLabel : TUniLabel ;
   oHF    : TUniHTMLFrame;
   cTemp : char;
   cHint, cTmp, cTmp2, cTmp3, cTmp4, cAfterRender : string; // 7.1.0.0
   bReadOnly : boolean;
   oObj, oObj2 : TUniControl;
   bObjStartEnabled, bObjStartVisible : boolean;//7.0.0.0
begin
    tComp := nil;
    try
       for I := 0 to TComponent( pForm ).ComponentCount - 1 do
       begin
          tComp := TComponent( pForm ).Components[I];
          cHint := '';
          // 6.0.0.0
          If ( Pos( 'TAction' , tComp.ClassName ) = 0 ) and
             ( Pos( 'THelp' , tComp.ClassName ) = 0 ) then
          begin
             //7.0.0.0
             bObjStartEnabled := true;
             bObjStartVisible := true;
             If rc_HasProp( tComp, 'Hint' ) then//8.3.0.0  GetPropInfo( tComp.ClassInfo, 'Hint') <> nil then
             begin
                // 7.0.0.0 enabled / visible false
                if ( not tComp.InheritsFrom( TUniJSForm ) ) and
                   ( not tComp.InheritsFrom( TUniForm ) ) and
                   ( not tComp.InheritsFrom( TUniFrame ) ) and
                   ( Pos( 'TUniMenuItem' , tComp.ClassName ) = 0 ) and
                   ( Pos( 'rcblock', lowercase( TUniControl(tComp).Name ) ) > 0 ) then
                begin
                   if ( Pos( 'rc-hided:true', TUniControl(tComp).Hint ) = 0 ) and ( Pos( 'start-visible:false', TUniControl(tComp).Hint ) = 0 ) and ( not TUniControl(tComp).Visible ) then
                   begin
                      TUniControl(tComp).Hint := rc_AddHintAttr( '|start-visible:false', TUniControl(tComp).Hint , true );
                      bObjStartVisible := false;
                   end;
                   if ( Pos( 'rc-hided:true', TUniControl(tComp).Hint ) = 0 ) and ( Pos( 'start-enabled:false', TUniControl(tComp).Hint ) = 0 ) and ( not TUniControl(tComp).Enabled ) then
                   begin
                      TUniControl(tComp).Hint := rc_AddHintAttr( '|start-enabled:false', TUniControl(tComp).Hint , true );
                      bObjStartEnabled := false;
                   end;
                   //8.1.0.1 thanks for tip Mr. Fabio Oliveira
                   if TUniControl( tComp ).Align <> alNone then
                      TUniControl( tComp ).Align := alNone;
                   //8.4.0.1 noborder-all:   sem parametros
                   if rc_GetHintAttr( 'noborder-all:' , TUniControl(tComp).Hint ) = '' then
                      TUniControl(tComp).Hint := StringReplace ( TUniControl(tComp).Hint, 'noborder-all:', 'noborder-all', [rfReplaceAll] );
                   if rc_GetHintAttr( 'noborder-left:' , TUniControl(tComp).Hint ) = '' then
                      TUniControl(tComp).Hint := StringReplace ( TUniControl(tComp).Hint, 'noborder-left:', 'noborder-left', [rfReplaceAll] );
                   if rc_GetHintAttr( 'noborder-right:' , TUniControl(tComp).Hint ) = '' then
                      TUniControl(tComp).Hint := StringReplace ( TUniControl(tComp).Hint, 'noborder-right:', 'noborder-right', [rfReplaceAll] );
                   if rc_GetHintAttr( 'noborder-top:' , TUniControl(tComp).Hint ) = '' then
                      TUniControl(tComp).Hint := StringReplace ( TUniControl(tComp).Hint, 'noborder-top:', 'noborder-top', [rfReplaceAll] );
                   if rc_GetHintAttr( 'noborder-bottom:' , TUniControl(tComp).Hint ) = '' then
                      TUniControl(tComp).Hint := StringReplace ( TUniControl(tComp).Hint, 'noborder-bottom:', 'noborder-bottom', [rfReplaceAll] );
                end;
                // 7.2.0.0
                if ( tComp is TUniControl )  then
                   TUniControl( tComp ).ShowHint := false;
                // 6.0.0.0
                if ( tComp.InheritsFrom(TUniFrame) ) then
                   cHint := '[[' + rc_NormalizeHintAttr( TUniFrame( tComp ).hint ) + ']]'
                else
                if ( tComp.InheritsFrom(TUniForm) ) then
                   cHint := '[[' + rc_NormalizeHintAttr( TUniForm( tComp ).hint ) + ']]'
                else
                if ( Pos( 'TUniMenuItem' , tComp.ClassName ) > 0 ) then
                   cHint := '[[' + rc_NormalizeHintAttr( TMenuItem( tComp ).hint ) + ']]'
                else
                if ( Pos( '[[', TUniControl( tComp ).hint ) > 0 ) then
                   cHint := '[[' + rc_NormalizeHintAttr( TUniControl( tComp ).hint ) + ']]';

                // 7.0.0.0 nofocus
                try
                   mm.varB_Yes := ( ( tComp is TUniBitBtn ) or
                                  ( tComp is TUniButton ) or
                                  ( tComp is TUniSpeedButton ) or
                                  ( tComp is TUniMenuButton ) ) and ( mm.CONFIG_APP_BUTTON_NOFOCUS = 'ON' );
                   If ( ( Pos( 'no-focus:', cHint ) > 0 ) or ( ( mm.varB_Yes ) and ( Pos( 'focus-on:', cHint ) = 0 ) ) ) and
                      ( ( TUniControl(tComp).InheritsFrom(TUniControl) ) and ( GetPropInfo( tComp.ClassInfo, 'Hint') <> nil ) ) then
                   begin
                      //8.0.0.0
                      rc_FocusBlur ( TUniControl(tComp) );
                   end;
                except
                end;

                // 6.0.0.0 rc ranslate off
                if ( mm.CONFIG_RC_TRANSLATE = 'OFF' ) and ( Pos( 'translate' ,  cHint ) > 0 ) then
                begin
                   try
                      cHint := StringReplace(  cHint, '<translate>', '', [rfReplaceAll] );
                      cTmp := rc_GetHintAttr( 'translate:',  cHint );
                      cHint := StringReplace(  cHint, 'translate:' + cTmp, '', [rfReplaceAll] );
                      iT := Pos( ':translate(' ,  cHint );
                      While iT > 0 do
                      begin
                           cTmp := Copy( cHint, iT - 5 );
                           cTmp := Copy( cTmp, 1, Pos( ')' , cTmp ) );
                           cHint := StringReplace(  cHint, cTmp, '', [rfReplaceAll] );
                           iT := Pos( ':translate(' ,  cHint );
                      end;
                   except on e:exception do
                        begin
                             dm_rc.rc_ShowError( 'remove translate: error.( ' + i.ToString + ' )'  );

                        end;

                   end;
                end;
                if ( tComp.InheritsFrom(TUniFrame) ) then
                   TUniFrame( tComp ).hint := cHint
                else
                if ( tComp.InheritsFrom(TUniForm) ) then
                   TUniForm( tComp ).hint := cHint
                else
                if ( Pos( 'TUniMenuItem' , tComp.ClassName ) > 0 ) then
                   TMenuItem( tComp ).hint := cHint
                else
                if ( Pos( '[[', TUniControl( tComp ).hint ) > 0 ) then
                   TUniControl( tComp ).hint := cHint;
             end;
             //8.3.0.0 visible false
//             if Pos( 'excel', lowercase(TUniControl( tComp ).Name) ) > 0 then
//                tComp := tComp;
//             if ( rc_IsVisible( TUniControl( tComp ) ) ) or
//                ( ( tComp.ClassName = 'TUniDBGrid' ) and ( Pos( 'grid-forcerender:', TUniDBGrid( tComp ).hint ) > 0 ) ) then
             //if ( Pos( 'grid-forcerender:', TUniDBGrid( tComp ).hint ) > 0 ) then
             begin
                if ( tComp is TUniDBGrid ) Then
                begin
                      if ( StrToIntDef( mm.CONFIG_LAYOUT_GRID_TITLE_FONT_SIZE , 0 ) > 0 ) and ( Pos( 'theme-color:off', TUniControl( tComp ).Hint ) = 0 ) then
                      begin
                         TUniDBGrid( tComp ).TitleFont.Name := pAPP_FONT;
                         TUniDBGrid( tComp ).TitleFont.Size := StrToIntDef( mm.CONFIG_LAYOUT_GRID_TITLE_FONT_SIZE, TUniDBGrid( tComp ).Font.Size );
                         TUniDBGrid( tComp ).Font.Size      := StrToIntDef( mm.CONFIG_LAYOUT_GRID_FONT_SIZE, TUniDBGrid( tComp ).Font.Size );
                      end;
                end
                else
                if ( tComp is TUniBitBtn ) or ( tComp is TUniButton ) or ( tComp is TUniSpeedButton ) or ( tComp is TUniMenuButton ) Then
                begin
                      if ( mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' ) and ( Pos( 'theme-color:off', TUniControl( tComp ).Hint ) = 0 ) then
                         TUniButton( tComp ).Font.Name  := pAPP_FONT;
                end
                else
                if ( tComp is TUniLabel ) Then
                begin
                      if ( mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' ) and ( Pos( 'theme-color:off', TUniControl( tComp ).Hint ) = 0 ) then
                         TUniLabel( tComp ).Font.Name  := pAPP_FONT;
                end
                else
                if ( tComp is TUniDBText ) Then
                begin
                      if ( mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' ) and ( Pos( 'theme-color:off', TUniControl( tComp ).Hint ) = 0 ) then
                         TUniDBText( tComp ).Font.Name  := pAPP_FONT;
                end
                else
                if ( tComp is TUniDBCheckBox ) Then
                begin
                      if ( mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' ) and ( Pos( 'theme-color:off', TUniControl( tComp ).Hint ) = 0 ) then
                         TUniDBCheckBox( tComp ).Font.Name  := pAPP_FONT;
                end
                //7.3.0.0
                else
                if ( tComp is TUniRadioGroup ) or ( tComp is TUniDBRadioGroup ) then
                begin
                   rc_AddCssClass( tComp , 'rc-rg' );
                   if ( mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' ) and ( Pos( 'theme-color:off', TUniControl( tComp ).Hint ) = 0 ) then
                   begin
                      TUniRadioGroup( tComp ).Font.Name  := pAPP_FONT;
                      TUniRadioGroup( tComp ).Font.Size  := 10;
                   end;
                end
                //8.0.0.0
                else
                if ( tComp is TUniSpinEdit ) then
                begin
                   rc_AddCssClass( tComp , 'rc-spin-align' );
                   if ( mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' ) and ( Pos( 'theme-color:off', TUniControl( tComp ).Hint ) = 0 ) then
                   begin
                      TUniSpinEdit( tComp ).Font.Name  := pAPP_FONT;
                      TUniSpinEdit( tComp ).Font.Size  := 10;
                   end;
                end
                else
                //8.0.0.0
                if ( tComp is TUniGroupBox ) then
                begin
                   if ( mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' ) and ( Pos( 'theme-color:off', TUniControl( tComp ).Hint ) = 0 ) then
                   begin
                      TUniGroupBox( tComp ).Font.Name  := pAPP_FONT;
                      TUniGroupBox( tComp ).Font.Size  := 10;
                   end;
                   //rc_AddCssClass( tComp , 'rc-gb' );
   //                TUniControl(tcomp).ClientEvents.ExtEvents.Values['added'] :=
   //                   'function added(sender, container, pos, eOpts){'+
   //                   '   sender.addCls(''rc-gb'');}' ;

                end
                else
                if ( tComp is TUniListBox ) Then
                begin
                      if ( mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' ) and ( Pos( 'theme-color:off', TUniControl( tComp ).Hint ) = 0 ) then
                      begin
                         TUniListBox( tComp ).Font.Name  := pAPP_FONT;
                         TUniListBox( tComp ).Font.Size  := 10;//8.0.0.0
                      end;
                end
                else
                if ( tComp is TUniEdit ) OR
                   ( tComp is TUniDBEdit ) OR
                   ( tComp is TUniMemo ) OR
                   ( tComp is TUniDBMemo ) OR
                   ( tComp is TUniTagField ) OR   //7.3.0.0 unitagfield
                   ( tComp is TUniDBTagField ) OR //7.3.0.0 unidbtagfield
                   ( tComp is TUniComboBox ) OR
                   ( tComp is TUniDBComboBox ) OR
                   ( tComp is TUniDBLookupComboBox ) OR
                   ( tComp is TUniDateTimePicker ) OR
                   ( tComp is TUniDBDateTimePicker ) OR
                   ( tComp is TUniCustomNumberEdit ) OR
                   ( tComp is TUniCustomDBEdit ) Then
                begin
                   //7.3.0.0 "edit" alBottom alClient inside rcBlock
                   if ( not ( tComp is TUniMemo ) and
                        not ( tComp is TUniDBMemo ) ) and
                      ( Pos( 'rcBlock' , TUniControl( tComp ).Parent.Name ) > 0 ) and
                      ( ( TUniControl( tComp ).Align = alBottom  ) or ( TUniControl( tComp ).Align = alClient  ) ) THEN
                   begin
                      TUniControl( tComp ).Align   := alNone;
                      TUniControl( tComp ).Anchors := [akTop, akLeft, akRight];
                      TUniControl( tComp ).Left    := 0;
                      TUniControl( tComp ).Top     := TUniControl( tComp ).Parent.Height - TUniControl( tComp ).Height ;
                      TUniControl( tComp ).Width   := TUniControl( tComp ).Parent.Width; //7.3.0.2
                   end;
                   // 7.0.0.0
                   if ( tComp is TUniCustomEdit ) or ( tComp is TUniCustomNumberEdit ) then
                   begin
                        //7.0.0.1
                        If Pos( 'input-addon:color', TUniEdit( tComp ).Hint ) > 0 then
                        begin
                           TUniEdit( tComp ).InputType := 'color';
                        end
                        else
                        If Pos( 'input-addon:spin', TUniEdit( tComp ).Hint ) > 0 then
                        begin
                           TUniEdit( tComp ).ClientEvents.ExtEvents.Values['keydown'] := dm_rc.rc_ExtEvtKeyDownOnlyNumbers;
                        end
                        else
                        If ( Pos( 'input-addon:time', TUniEdit( tComp ).Hint ) > 0 ) and
                           ( Pos( 'mask:' , TUniEdit( tComp ).Hint ) = 0 ) then
                        begin
                           TUniEdit( tComp ).Hint := rc_AddHintAttr( '|mask:99:99' , TUniEdit( tComp ).Hint, true );
                           dm_rc.rc_ApplyEditMasks( pForm, TUniEdit( tComp ) );
                        end
                        else
                        If ( Pos( 'input-addon:date', TUniEdit( tComp ).Hint ) > 0 ) and
                           ( Pos( 'mask:' , TUniEdit( tComp ).Hint ) = 0 ) then
                        begin
                           if Pos( ' yearonly' , TUniEdit( tComp ).Hint ) > 0 then
                              TUniEdit( tComp ).Hint := rc_AddHintAttr( '|mask:9999' , TUniEdit( tComp ).Hint, true )
                           else
                           if Pos( ' monthonly' , TUniEdit( tComp ).Hint ) > 0 then
                              TUniEdit( tComp ).Hint := rc_AddHintAttr( '|mask:99' , TUniEdit( tComp ).Hint, true )
                           else
                           if Pos( ' dayonly' , TUniEdit( tComp ).Hint ) > 0 then
                              TUniEdit( tComp ).Hint := rc_AddHintAttr( '|mask:99' , TUniEdit( tComp ).Hint, true )
                           else
                              TUniEdit( tComp ).Hint := rc_AddHintAttr( '|mask:99/99/9999' , TUniEdit( tComp ).Hint, true );
                           dm_rc.rc_ApplyEditMasks( pForm, TUniEdit( tComp ) );
                        end;
                   end;
                   //7.5.0.3 tagfield
                   if ( tComp is TUniTagField ) OR   //7.3.0.0 unitagfield
                      ( tComp is TUniDBTagField ) Then //7.3.0.0 unidbtagfield
                   begin
                       if TUniTagField( tComp ).Height >= 32 then
                          rc_AddCssClass( TUniTagField( tComp ), 'rc-tagfield-height-32' )
                       else
                       if TUniTagField( tComp ).Height >= 28 then
                          rc_AddCssClass( TUniTagField( tComp ), 'rc-tagfield-height-24' );
                   end;
                   // 8.0.0.0
                   if ( tComp is TUniComboBox ) then //or ( tComp is TUniDBComboBox ) then
                   begin
                      if TUniControl( tComp ).HasParent then
                            rc_AddCssClass( TUniControl( tComp ), 'rc-border-right-off' );
                   end
                   else
                   if ( tComp is TUniDateTimePicker ) or ( tComp is TUniDBDateTimePicker ) then
                   begin
                      if ( tComp is TUniDateTimePicker ) then
                         rc_AddCssClass( TUniDateTimePicker( tComp ), 'rc-border-right-off' )
                      else
                          if ( not dm_rc.rc_DataSetDatasourceIsNil( TUniControl( tComp ) ) ) and
                             ( not ( TUniDBDateTimePicker( tComp ).DataSource.State in dsEditModes ) ) then
                            rc_AddCssClass( TUniDBDateTimePicker( tComp ), 'rc-round-borders-edits' )
                          else
                            rc_AddCssClass( TUniDateTimePicker( tComp ), 'rc-border-right-off' ) ;
                   end;
                   //8.0.0.0
                   cAfterRender := '';
                   if ( ( mm.varB_Mobile_Screen ) and (  mm.CONFIG_LAYOUT_KEYBOARD_SCROLL_ON_MOBILE = 'OFF' ) and (  mm.CONFIG_LAYOUT_KEYBOARD_VIRTUAL_ON_MOBILE = 'ON' ) ) or
                      ( ( not mm.varB_Mobile_Screen ) and (  mm.CONFIG_LAYOUT_KEYBOARD_VIRTUAL_ON_DESKTOP = 'ON' ) ) then
                   begin
                      case mm.varLT_Lang of
                           ltpt_BR, ltpt_PT : cTmp := 'pt-br';
                           lten_US : cTmp := 'en';
                           lten_GB : cTmp := 'en-gb';
                           ltes_ES : cTmp := 'es';
                           ltfr_FR : cTmp := 'fr';
                           ltde_DE : cTmp := 'de';
                           ltit_IT : cTmp := 'it';
                           lttr_TR : cTmp := 'tr';
                           ltru_RU : cTmp := 'ru';
                           ltzn_CH : cTmp := 'zh';
                           ltin_ID : cTmp := 'en';
                           ltth_TH : cTmp := 'th';
                           lthi_IN : cTmp := 'en';
                           ltar_SA : cTmp := 'ar';
                      end;
                      cAfterRender :=
                         '   var me=sender.inputEl; me.set({ inputmode: "none" }); ' +
                         '   var cmp = sender;' +
   //                      '   // focus on field' +
   //                      '   //Ext.QuickTips.init();' +
   //                      '   //Ext.defer(function () {' +
   //                      '   //  cmp.inputEl.dom.focus();' +
   //                      '   //  cmp.inputEl.dom.style.width = "70%";' +
   //                      '   //}, 100);' +
   //                      '   // listen virtual keyboard keys' +
                         '   cmp.inputEl.on({' +
                         '     mousedown: function (ev) {' +
                         '     if (ev.target.tagName === ''TD'') {' +
   //                      '       // We trigger change event only on textfield with the focus' +
                         '       if (document.activeElement) {' +
                         '         if (document.activeElement.id === cmp.inputEl.dom.id)' +
                         '            cmp.fireEvent(''change'');' +
                         '       }' +
                         '     }' +
                         '     },' +
                         '     delegate: ''#keyboardInputMaster''' +
                         '   });' +
                         //'   cmp.inputEl.dom.setAttribute("lang", "pt-br");' +
                         '   cmp.inputEl.dom.setAttribute("lang", "' + cTmp + '");' +
                         '   VKI_imageURI = '''';' +
                         '   VKI_showVersion = ''false'';' +
                         '   VKI_langAdapt = ''false'';' +
                         '   VKI_size = 3;' +
                         '   VKI_sizeAdj = false;' +
                         '   VKI_attach(cmp.inputEl.dom);' ;
                   end;

                   if ( tComp is TUniMemo ) or ( tComp is TUniDBMemo ) then
                   begin
                       cAfterRender := cAfterRender +
                          ' sender.bodyEl.dom.addEventListener( ''keydown'', function(e) { if (e.key==''Enter'') {e.stopPropagation()}} ); ' ;
                   end;
                   //lookups( nao alterar a cor do FOCO - vc pode mudar isso... )
                   if ( lowercase( Copy( TUniDBEdit( tComp ).Name , 1, 5 ) ) = 'edlkp' ) and
                      ( ( tComp is TUniDBEdit ) and
                        ( Pos( '_pesqextra' , lowercase( TUniDBEdit( tComp ).Name ) ) = 0 ) and
                        ( Pos( '_codid' , lowercase( TUniDBEdit( tComp ).Name ) ) = 0 ) ) then
                   begin
                      // 6.0.0.0
                      TUniDBEdit( tComp ).ReadOnly   :=
                         ( ( Pos( ' readonly', TUniControl( tComp ).Hint ) > 0 ) ) or
                         ( Pos( 'lkpenabled:', TUniControl( tComp ).Hint ) = 0 ) and
                         ( Pos( '_setds_' , lowercase( TUniDBEdit( tComp ).Name ) ) > 0 ) ;

                      if ( Pos( 'theme-color:off', TUniControl( tComp ).Hint ) = 0 ) then
                      begin
                         TUniDBEdit( tComp ).Color      := StringToColor( pEDLKP_COLOR );
                         TUniDBEdit( tComp ).Font.Color := StringToColor( pEDLKP_FONT_COLOR );
                         if ( mm.CONFIG_LAYOUT_LOOKUP_THEMED = 'ON' ) then
                            rc_AddCssClass( tComp , 'rc-x-form-trigger-wrap-default-lookup' );  //8.0.0.0
                      end;

                      if ( mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' ) and ( Pos( 'theme-color:off', TUniControl( tComp ).Hint ) = 0 ) then
                         TUniDBEdit( tComp ).Font.Name  := pAPP_FONT;
                   end
                   else
                   begin
                      cTemp := #32;
                      if GetPropInfo( TUniEdit( tComp ).ClassInfo, 'PasswordChar' ) <> nil then
                         cTemp := TUniEdit( tComp ).PasswordChar ;

                      if Pos( '[[EDIT_', TUniControl( tComp ).Hint ) > 0 then
                      begin
                         TUniControl( tComp ).Hint := StringReplace( TUniControl( tComp ).Hint, '[[EDIT_COLOR]]'              , mm.CONFIG_LAYOUT_EDIT_COLOR , [rfReplaceAll] );
                         TUniControl( tComp ).Hint := StringReplace( TUniControl( tComp ).Hint, '[[EDIT_FONT_COLOR]]'         , mm.CONFIG_LAYOUT_EDIT_FONT_COLOR, [rfReplaceAll] );
                         TUniControl( tComp ).Hint := StringReplace( TUniControl( tComp ).Hint, '[[EDIT_COLOR_READONLY]]'     , mm.CONFIG_LAYOUT_EDIT_COLOR_READONLY, [rfReplaceAll] );
                         TUniControl( tComp ).Hint := StringReplace( TUniControl( tComp ).Hint, '[[EDIT_FONT_COLOR_READONLY]]', mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY, [rfReplaceAll] );
                      end;

                      if Pos( 'theme-color:off', TUniControl( tComp ).Hint ) = 0 then
                      begin
                         //8.0.0.0
                         if TUniEdit( tComp ).ReadOnly then
                            TUniEdit( tComp ).Font.Color := StringToColor( pEDIT_FONT_COLOR_READONLY )
                         else
                            TUniEdit( tComp ).Font.Color := StringToColor( pEDIT_FONT_COLOR );
                         //8.0.0.0
                         if TUniEdit( tComp ).ReadOnly then
                         begin
                            TUniEdit( tComp ).Color := StringToColor( pEDIT_COLOR_READONLY ); //$00d0d0d0  // adicionar ao controle de temas no futuro
                            rc_AddCssClass( tComp , 'rc-x-form-trigger-wrap-default-readonly' );  //8.0.0.0
                         end
                         else
                             TUniEdit( tComp ).Color  := StringToColor( pEDIT_COLOR );
                      end;

                      if ( mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' ) and ( Pos( 'theme-color:off', TUniControl( tComp ).Hint ) = 0 ) then
                         TUniEdit( tComp ).Font.Name  := pAPP_FONT;

                      if cTemp = '*' then
                      begin
                         TUniEdit( tComp ).PasswordChar := cTemp;
                      end;

                      bReadOnly := TUniEdit( tComp ).ReadOnly;
                      if not bReadOnly then
                      begin
                           rc_AddFocusBlur( pForm, TUniControl( tComp ), pEDIT_COLOR, pEDIT_FOCUS_COLOR, pEDIT_FONT_COLOR );
                      end;

                      cTmp := rc_GetHintAttr( 'keyboard:', TUniEdit( tComp ).Hint ) ;
                      if cTmp <> '' then
                      begin
                         if ( cTmp = 'off' ) then
                         begin
                             cAfterRender := cAfterRender +
                                //'function afterrender(sender, eOpts)'+
                                //'{' +
                                '  var me=sender.inputEl; me.set({ inputmode: "none" }); ' ;
                                //'}';
                         end;
                      end;
                   end;
                   // 6.0.0.0
                   if ( pos( 'valid-required:', TUniControl( tComp ).hint ) > 0 ) and ( TUniControl( tComp ).Visible ) then // 6.0.0.0
                   begin
                      oHF := TUniHTMLFrame( TComponent(pForm).FindComponent('rc__Required' + TUniControl( tComp ).Name) ); //thanks for bug track: Freddys Izquierdo
                      if oHF = nil then
                      begin
                          iT         := 0;
                          iL         := 0;
                          cTmp       := rc_GetHintAttr( 'valid-required:', TUniControl( tComp ).hint );
                          // 6.0.0.0
                          oLabel     := TUniLabel( TComponent(pForm).FindComponent( cTmp ) );
                          // 6.0.0.0
                          if oLabel = nil then
                          begin
                             oHF        := TUniHTMLFrame.Create( TComponent(pForm) );
                             oHF.Parent := TUniControl( tComp ).Parent;
                             oHF.Name   := 'rc__Required' + TUniControl( tComp ).Name;

                             oHF.HTML.add( '<span style="width:10;background-color:transparent;color:red;font-weight: 900" class="bringtofront">*</span>' );
                             oHF.ClientEvents.ExtEvents.Values['added'] :=
                                'function added(sender, container, pos, eOpts){'+
                                '   sender.addBodyCls('+ QuotedStr('trans-panel') + ');}' ;

                             oHF.Width  := 6;
                             oHF.Height := 9;
                          end
                          else
                          begin
                             oLabel.TextConversion := txtHTML;
                             //7.0.0.0
                             if Pos( '<span class="color-red">&nbsp*</span>', oLabel.Caption ) = 0 then
                                oLabel.Caption := rc_SpanText( '', oLabel.Caption, 'color-red', ' *' );
                          end;
                      end;
                      // 6.0.0.0
                      if oLabel = nil then
                      begin
                         if cTmp = '' then
                         begin
                            oHF.Left   := TUniControl( tComp ).Left + TUniControl( tComp ).Width - 6;
                            oHF.Top    := TUniControl( tComp ).Top -4 ;
                         end
                         else
                         begin
                            if Pos( 'top-in', cTmp ) > 0 then
                            begin
                               iT := 7;
                               iL := 8;
                               rc_AddCssClass( oHF, 'rc-mirror-h' );
                            end
                            else
                            if Pos( 'top', cTmp ) > 0 then
                            begin
                               iL := 4;
                               iT := -1;
                            end
                            else
                            if Pos( 'bottom-in', cTmp ) > 0 then
                            begin
                               iT := 2;
                               iL := 8;
                            end
                            else
                            if Pos( 'bottom', cTmp ) > 0 then
                            begin
                               iL := 4;
                               iT := -7;
                               rc_AddCssClass( oHF, 'rc-mirror-h' );
                            end;
                            if Pos( 'top', cTmp ) > 0 then
                            begin
                               oHF.Left   := TUniControl( tComp ).Left + TUniControl( tComp ).Width - iL;
                               oHF.Top    := TUniControl( tComp ).Top - 4 + iT;
                            end
                            else
                            if Pos( 'bottom', cTmp ) > 0 then
                            begin
                               oHF.Left   := TUniControl( tComp ).Left + TUniControl( tComp ).Width - iL;
                               oHF.Top    := TUniControl( tComp ).Top + TUniControl( tComp ).Height - 8 - iT;
                            end;
                            oHF.Anchors := [akTop, akRight]; // 6.0.0.0
                         end;
                      end;
                   end;
                   //7.1.0.0 form-label > float-label
                   if ( pos( 'float-label:', TUniControl( tComp ).hint ) > 0 ) then
                   begin
                      oLabel := TUniLabel( TComponent(pForm).FindComponent('rc__FloatLabel' + TUniControl( tComp ).Name) ); //thanks for bug track: Freddys Izquierdo
                      if oLabel = nil then
                      begin
                          iT            := 0;
                          iL            := 0;
                          cTmp          := rc_GetHintAttr( 'float-label:', TUniControl( tComp ).hint );
                          cTmp          := Trim( Copy( cTmp , Pos( ' ', cTmp ) ) );
                          oLabel        := TUniLabel.Create( TComponent(pForm) );
                          //6.0.0.0
                          oLabel.OnClick := dm_rc.rc_FormLabelClick;
                          oLabel.Hint    := '[[float-label-ctrl:' + TUniControl( tComp ).Name + ' ' + TUniControl( tComp ).ClassName + ']]';

                          oLabel.Caption:= cTmp ;
                          oLabel.Transparent := false;
                          if Pos( 'float-label-bg:' , TUniControl( tComp ).hint ) > 0 then
                             oLabel.Color  := rc_HtmlToColor( rc_GetHintAttr( 'float-label-bg:', TUniControl( tComp ).hint ) );// clWhite;
                          if Pos( 'float-label-color:' , TUniControl( tComp ).hint ) > 0 then
                             oLabel.Font.Color  := rc_HtmlToColor( rc_GetHintAttr( 'float-label-color:', TUniControl( tComp ).hint ) );// clWhite;

                          oLabel.Parent := TUniControl( tComp ).Parent;
                          oLabel.Name   := 'rc__FloatLabel' + TUniControl( tComp ).Name;
                          oLabel.Left   := TUniControl( tComp ).Left + 3;
                          //8.5.0.0 float label
                          cTmp2 := '';
                          if ( TUniControl( tComp ) is TUniMemo ) or ( TUniControl( tComp ) is TUniDBMemo ) then
                          begin
                             cTmp2 := TUniMemo( tComp ).Lines.Text;
                             oLabel.Top    := TUniControl( tComp ).Top + 8;
                             dm_rc.rc_SetFocus( TUniMemo( tComp ) );
                          end
                          else
                          begin
                             cTmp2 := TUniEdit( tComp ).Text;
                             oLabel.Top    := TUniControl( tComp ).Top + ( ( TUniControl( tComp ).Height div 3 ) - 2 ) ;
                             dm_rc.rc_SetFocus( TUniEdit( tComp ) );
                          end;
                          //8.5.0.0  float label
                          //if TUniEdit( tComp ).text <> '' then
                          begin
                             //TUniEdit( tComp ).SetFocus ;
                             if ( pos( 'float-label:top-in', TUniControl( tComp ).hint ) > 0 ) then
                             begin
                                if ( TUniControl( tComp ) is TUniMemo ) or ( TUniControl( tComp ) is TUniDBMemo ) then
                                   rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 18 ) , '350' )
                                else
                                   rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - ( ( TUniControl( tComp ).Height div 2 ) + 3 ) ) , '350' );
                             end
                             else
                             begin
                                if ( pos( 'float-label:top', TUniControl( tComp ).hint ) > 0 ) then
                                begin
                                   if ( TUniControl( tComp ) is TUniMemo ) or ( TUniControl( tComp ) is TUniDBMemo ) then
                                      rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 26 ) , '350' )
                                   else
                                      rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - ( TUniControl( tComp ).Height - 4 ) ) , '350' );
                                end;
                             end;
                          end;
                      end;
                      if cTmp = '' then
                      begin
                         //oLabel.Left   := TUniControl( tComp ).Left;// + TUniControl( tComp ).Width - 6;
                         //oLabel.Top    := TUniControl( tComp ).Top - 12 ;
                      end
                      else
                      begin
                         if Pos( '-in', cTmp ) > 0 then
                         begin
                            iT := 7;
                            iL := 13;
                         end;
                      end;
                      oLabel.Anchors := [akLeft];
                   end;
                   //7.1.0.0
                   cTmp := rc_GetHintAttr( 'label:', TUniControl( tComp ).hint, false, true );
                   if ( cTmp <> '' ) then
                   begin
                       oLabel := TUniLabel( TComponent(pForm).FindComponent('rc__Label' + TUniControl( tComp ).Name) );
                       if oLabel = nil then
                       begin
                            oLabel       := TUniLabel.Create( TComponent(pForm) );
                            oLabel.Tag   := 1;
                       end
                       else
                           oLabel.Tag   := 0;
                      if oLabel <> nil then
                      begin
                          //width
                          cTmp3         := ReturnNumbers( Trim( Copy( trim(cTmp) , 1, Pos( ' ', cTmp ) ) ) );
                          if cTmp3 <> '' then
                          begin
                             iL     := StrToIntDef( cTmp3, 0 );
                             cTmp       := StringReplace( cTmp, cTmp3 + ' ', '', [rfReplaceAll] );
                          end;
                          cTmp3         := '';

                          //centralizacao verfical
                          cTmp4         := varIIF( Pos( ' center', cTmp ) > 0, 'center', '' );
                          cTmp          := StringReplace( cTmp, ' center', '', [rfReplaceAll] );

                          //align
                          cTmp2         := varIIF( Pos( 'align-left', cTmp ) > 0, 'left', '' );
                          if cTmp2 = '' then
                          begin
                             cTmp2      := varIIF( Pos( 'align-right', cTmp ) > 0, 'right', '' );
                             cTmp       := StringReplace( cTmp, 'align-right', '', [rfReplaceAll] );
                          end
                          else
                             cTmp       := StringReplace( cTmp, 'align-left', '', [rfReplaceAll] );

                          //position
                          cTmp3         := Trim( Copy( trim(cTmp) , 1, Pos( ' ', cTmp ) ) );
                          cTmp3         := Trim(cTmp3);
                          //caption
                          cTmp          := Trim( StringReplace( cTmp, cTmp3, '', [rfReplaceAll] ) );

                          //6.0.0.0
                          oLabel.AutoSize := false;
                          oLabel.TextConversion := txtHTML;
                          oLabel.Caption:= cTmp ;
                          if iL > 0 then
                             oLabel.Width    := iL
                          else
                             iL := Trunc( Length( oLabel.Caption ) * 5.8 );
                          oLabel.Transparent := false;
                          if Pos( 'label-size:' , TUniControl( tComp ).hint ) > 0 then
                             oLabel.Font.Size := StrToIntDef( rc_GetHintAttr( 'label-size:', TUniControl( tComp ).hint ), oLabel.Font.Size );
                          if Pos( 'label-attr:' , TUniControl( tComp ).hint ) > 0 then
                          begin
                             oLabel.Hint := Copy( TUniControl( tComp ).hint, Pos( 'label-attr:{' , TUniControl( tComp ).hint ) + 12 );
                             oLabel.Hint := Copy( oLabel.Hint, 1, Pos( '}', oLabel.Hint ) -1 );
                             oLabel.Hint := '[[' + oLabel.Hint + ']]';
                          end;
                          if Pos( 'label-bg:' , TUniControl( tComp ).hint ) > 0 then
                             oLabel.Color  := rc_HtmlToColor( rc_GetHintAttr( 'label-bg:', TUniControl( tComp ).hint ) );// clWhite;
                          if Pos( 'label-color:' , TUniControl( tComp ).hint ) > 0 then
                             oLabel.Font.Color  := rc_HtmlToColor( rc_GetHintAttr( 'label-color:', TUniControl( tComp ).hint ) );// clWhite;
                          oLabel.Parent := TUniControl( tComp ).Parent;
                          oLabel.Name   := 'rc__Label' + TUniControl( tComp ).Name;
                          oLabel.Height := 15;
                          //position
                          oLabel.Anchors := [akLeft];
                          if mm.varB_Mobile_Screen_Portrait then
                          begin
                             if ( cTmp3='left' ) or ( cTmp3='right' )then
                             begin
                                 oLabel.tag := 0;
                                 cTmp3 := 'top';
                                 TUniControl( tComp ).Parent.Height := 60;
                                 TUniControl( tComp ).Width := TUniControl( tComp ).Parent.Width;
                                 oLabel.Anchors := [akLeft];
                                 oLabel.Alignment := taLeftJustify;
                                 cTmp4 := '';
                             end;
                          end;
                          if cTmp3='top' then
                          begin
                             oLabel.Left   := 0;
                             oLabel.Top    := 0;
                             TUniControl( tComp ).Left := 0;
                             TUniControl( tComp ).Top  := 21;
                          end
                          else
                          if cTmp3='bottom' then
                          begin
                             oLabel.Left   := 0;
                             oLabel.Top    := 40;
                             TUniControl( tComp ).Top  := 0;
                             TUniControl( tComp ).Left := 0;
                          end
                          else
                          if cTmp3='left' then
                          begin
                             if oLabel.tag = 1 then
                             begin
                                TUniControl( tComp ).Parent.Height := TUniControl( tComp ).Parent.Height - 21;
                                TUniControl( tComp ).Top    := TUniControl( tComp ).Top - 21;
                                TUniControl( tComp ).Width := TUniControl( tComp ).Width - iL - 4 ;
                                TUniControl( tComp ).Left := iL + 4;
                             end;
                             if ( cTmp2='' ) or ( cTmp2='left' ) then
                                oLabel.Alignment := taLeftJustify
                             else
                                oLabel.Alignment := taRightJustify;
                             oLabel.Left   := 0;
                             oLabel.Top    := 0;
                             if cTmp4='center' then
                                oLabel.Top := ( TUniControl( tComp ).Parent.Height div 2 ) - ( oLabel.Height div 2 ) ;
                          end
                          else
                          if cTmp3='right' then
                          begin
                             if oLabel.tag = 1 then
                             begin
                                TUniControl( tComp ).Parent.Height := TUniControl( tComp ).Parent.Height - 21;
                                TUniControl( tComp ).Top    := TUniControl( tComp ).Top - 21;
                                TUniControl( tComp ).Width := TUniControl( tComp ).Width - iL - 4;
                                TUniControl( tComp ).Left := 0;
                             end;
                             if ( cTmp2='' ) or ( cTmp2='right' ) then
                                oLabel.Alignment := taRightJustify
                             else
                                oLabel.Alignment := taLeftJustify;
                             oLabel.Left   := TUniControl( tComp ).Width + 4 ;
                             oLabel.Top    := 0;
                             if cTmp4='center' then
                                oLabel.Top := ( TUniControl( tComp ).Parent.Height div 2 ) - ( oLabel.Height div 2 ) ;
                             oLabel.Anchors := [akRight];
                          end;
                      end;
                   end;
                   //7.3.0.0 unidbtagfield
                   if ( tComp is TUniTagField ) OR
                      ( tComp is TUniDBTagField ) OR
                      ( tComp is TUniComboBox ) OR
                      ( tComp is TUniDBComboBox ) OR
                      ( tComp is TUniDBLookupComboBox ) OR
                      ( tComp is TUniDateTimePicker ) OR
                      ( tComp is TUniDBDateTimePicker ) then
                   begin
                        //7.2.0.1
                        //8.0.0.0...analisando retirada...
   //                     TUniControl( tComp ).ClientEvents.ExtEvents.Values['added'] :=
   //                        'function added(sender, container, pos, eOpts)' +
   //                        '{' +
   //                        '  sender.addCls(''' + 'rc-form-text-trigger'');' +//7.0.0.0
   //                        '}';

                      // 7.2.0.0 - possivelmente nao sera mais necessario...rc-icon-trigger-top-
                      cTmp3 := '';
                      If GetPropInfo( tComp.ClassInfo, 'Datasource') <> nil then
                      begin
                          if dm_rc.rc_DataSetDatasourceIsNil( TUniControl( tComp ) ) then
                             cTmp3 := 'nil';
                      end;
                   end;

                   TUniControl( tComp ).ClientEvents.ExtEvents.Values['afterrender'] :=
                      'function afterrender(sender, eOpts)'+
                      '{ ' +
                        cAfterRender +
                      '}';
                end;
             end;
          end;
       end;
     except on e:exception do
            begin
                 cTmp := '';
                 if tComp <> nil then
                    cTmp := tcomp.Name;
                 dm_rc.rc_ErrorLog( e,
                                    'rc_AdjustEditColorsExecute' + sLineBreak + sLineBreak +
                                    'Seq(I)=' + i.ToString + sLineBreak + sLineBreak +
                                    'Obj:' + cTmp + sLineBreak,
                                    false ,
                                    true,
                                    true );
//                 ShowMessage( 'rc_AdjustEditColorsExecute' + sLineBreak + sLineBreak +
//                              'I=' + i.ToString + sLineBreak + sLineBreak +
//                              'Obj:' + cTmp + sLineBreak + sLineBreak +
//                              e.Message );
            end;
    end;
end;
// 7.0.0.0
procedure rc_RenderControlsExecute(pForm: TObject; pMENU_COLOR : string; pOnlyThisObj : TUniControl );
var
   I : integer;
   bRTL : boolean;//8.0.0.0
   cHint, cTemp, cTemp2, cLink, cClass : string;
   oControl, oBlock : TUniControl; // 7.0.0.0
begin
     oControl := nil;
     try
        // 6.0.0.0
        if lowercase( TComponent( pForm ).Name ) = 'mainform' then
        begin
           oControl := TUniControl( TComponent( pForm ).FindComponent('UniTreeMainMenu'));
           if ( oControl <> nil ) and ( Pos( 'theme-color:off', oControl.Hint ) = 0 ) then
              oControl.Color := StringToColor( pMENU_COLOR );
           oControl := TUniControl( TComponent( pForm ).FindComponent('paSearchTop'));
           if ( oControl <> nil ) and ( Pos( 'theme-color:off', oControl.Hint ) = 0 ) then
              oControl.Color := StringToColor( pMENU_COLOR );
           oControl := TUniControl( TComponent( pForm ).FindComponent('sboxGridBlock'));
           if ( oControl <> nil ) and ( Pos( 'theme-color:off', oControl.Hint ) = 0 ) then
              oControl.Color := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
           oControl := TUniControl( TComponent( pForm ).FindComponent('paBS_Tabs'));
           if ( oControl <> nil ) and ( Pos( 'theme-color:off', oControl.Hint ) = 0 ) then
              oControl.Color     := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
           //6.0.0.0+menu micro
           oControl := TUniControl( TComponent( pForm ).FindComponent('UniTreeMainMenuClone'));
           if ( oControl <> nil ) and ( Pos( 'theme-color:off', oControl.Hint ) = 0 ) then
              oControl.Color := StringToColor( pMENU_COLOR );
        end;
        // criar componentes.../ create components...
        for I := 0 to TComponent( pForm ).ComponentCount - 1 do
        begin
           cTemp  := '';
           cTemp2 := '';

           if i = 2 then
              cTemp := cTemp;

           try
              if pOnlyThisObj = nil then
                 oControl := TUniControl( TComponent( pForm ).Components[I] )
              else
                 oControl := pOnlyThisObj;
           except on e:exception do
               begin
                   dm_rc.rc_ShowSweetAlertError( 'error: ' + TComponent( pForm ).Name );
               end;
           end;
           //8.0.0.2
           If rc_CanRender( oControl ) and
//           If ( Pos( 'TAction' , oControl.ClassName ) = 0 ) and
//              ( Pos( 'THelp' , oControl.ClassName ) = 0 ) and
              ( not TComponent( pForm ).Components[I].InheritsFrom(TUniFrame) ) and
              ( not TComponent( pForm ).Components[I].InheritsFrom(TUniForm) ) then
           begin
             If ( GetPropInfo( oControl.ClassInfo, 'Hint') <> nil ) then
             begin
                //7.3.0.0 prevent grid error dgDontShowSelected with dgCheckSelect
                If ( Pos( 'TUniDBGrid' , oControl.ClassName ) > 0 ) and ( Pos( 'grid-forceselect:', TUniDBGrid( oControl ).hint ) > 0 ) then
                begin
                    if ( dgCheckSelect in TUniDBGrid( oControl ).Options ) then
                       TUniDBGrid( oControl ).Options := TUniDBGrid( oControl ).Options - [dgDontShowSelected];
                end;
                // 6.0.0.0
                if ( Pos( 'TUniMenuItem' , oControl.ClassName ) > 0 ) then
                   cHint    := rc_NormalizeHintAttr( TMenuItem( oControl ).hint )
                else
                begin
                   cHint    := rc_NormalizeHintAttr( TUniControl( oControl ).hint );
                end;
                rc_RenderPaginator( pForm, oControl, cHint, mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR );

                //8.0.0.0
                renderAttr_TOOLTIP( oControl, cHint );

                cLink         := '';

                //8.0.0.0 scrollbar-color
                renderAttr_SCROLLBAR_COLOR( oControl, cHint );

                if ( oControl is TUniContainerPanel ) or
                   ( oControl is TUniPanel ) or
                   ( oControl is TUniSimplePanel ) then
                begin
                   //[PT] adiciona animacao aos blocos
                   //[EN] adds animation to blocks
                   cTemp2 := rc_GetHintAttr( 'cols:' , cHint );
                   If ( cTemp2 <> '' ) and
                      ( Pos( 'animate:off', cHint ) = 0 ) and
                      ( ( Pos( 'rc-anim-block-resize', cHint ) = 0 ) and ( Pos( ' rc-anim-block-resize', cHint ) = 0 ) ) and // 6.0.0.0
                      ( mm.CONFIG_LAYOUT_GRIDBLOCK_ANIM = 'ON' ) then
                   begin
                       oBlock         := TUniControl( oControl );

                       if Pos( 'rc-anim-block-resize', oBlock.Hint ) > 0 then
                          cTemp2 := cTemp2;

                       if ( Pos( 'fade:off', cHint ) > 0 ) then
                          oBlock.Hint := rc_SetHintAttr( 'rc-anim-block-resize', 'cls:', cHint, True )
                       else
                          oBlock.Hint := rc_SetHintAttr( 'rc-anim-block-resize rc-fade-in', 'cls:', cHint, True );
                   end;

                   cTemp2 := rc_GetHintAttr( 'rctabs:' , cHint );
                   If cTemp2 <> '' then
                      renderControl_RCTABS( pForm, cHint, cTemp2, oControl )
                   else
                   begin
                      cTemp2 := rc_GetHintAttr( 'rctabslide:' , cHint );
                      If cTemp2 <> '' then
                         renderControl_RCTABSLIDE( pForm, cHint, cTemp2, oControl );
                   end;
                   //8.3.0.0
                   //card:
                   cClass := rc_GetHintAttr( 'card:' , oControl.Hint );
                   If ( cClass <> '' ) and ( rc_GetHintAttr( 'cls:' , oControl.Hint ) = '' ) then
                   begin
                        if cClass = 'theme' then
                           cClass := 'themecrud';
                        if ( oBlock.HasParent ) then
                        begin
                           oBlock := TUniControl( oControl.Parent );
                           if Pos ( 'card-info-box-white', oBlock.Hint ) = 0 then
                              oBlock.Hint := rc_SetHintAttr( 'card-info-box-white', 'cls:', oBlock.Hint, true );
                        end;
                        oControl.Hint := StringReplace( oControl.Hint, 'card:' + cClass, 'round:t|cls:card-' + cClass, [rfReplaceAll] );
                        cClass := '';
                   end;

                   //PDF
                   renderAttr_PDF( pForm, oControl, cHint );

                   //bar-rating:1-10 0,1,2,3,4,5,6,7,8,9|
                   renderAttr_BAR_RATING( pForm, oControl, cHint );

                   //VIDEO
                   renderAttr_VIDEO( pForm, oControl, cHint );

                   // QR CODE
                   renderAttr_QRCODE( pForm, oControl, cHint );

                   // IMG
                   renderAttr_IMG( pForm, oControl, cHint );
                   // LOTTIE
                   (*
                       lottie-style:

                       desktop-
                       mobile-v-
                       mobile-h-
                       mobile-

                       lottie-cfg:

                       bounce
                       controls
                       loop
                       autoplay
                       hover
                       intermission-
                       bg-theme
                       bg-
                       forward
                       backward
                   *)
                   renderAttr_LOTTIE( pForm, oControl, cHint );

                   //CAROUSEL
                   renderAttr_CAROUSEL( pForm, oControl, cHint );

                end
                else //8.0.0.0
                if ( oControl is TUniEdit ) or
                   ( oControl is TUniDBEdit ) or
                   ( oControl is TUniCustomNumberEdit ) OR
                   ( oControl is TUniCustomDBEdit ) Then
                begin
                   if rc_AttrExists( 'clipboard:' , cHint ) then
                      renderControl_CLIPBOARD( pForm, cHint, oControl )
                   else
                   if rc_AttrExists( 'link:' , cHint ) then
                      renderControl_LINK( pForm, cHint, oControl )
                   else
                   if rc_AttrExists( 'numpad:' , cHint ) then
                  begin
                      cLink := rc_GetHintAttr( 'numpad:' , cHint );
                      TUniFormattedNumberEdit(oControl).ReadOnly := true;
                      TUniFormattedNumberEdit(oControl).OnClick := dm_rc.DynamicNumPadClick;
                   end
                   else
                   if rc_AttrExists( 'dial:' , cHint ) then
                      renderControl_DIAL( pForm, cHint, oControl )//8.4.0.0
                   else
                   // in development
                   if rc_AttrExists( 'mail:' , cHint ) then//8.0.0.0
                      renderControl_MAIL( pForm, cHint, oControl )
                   else
                   if rc_AttrExists( 'input-addon:' , cHint ) then//8.0.0.0
                      renderControl_INPUTADDON( pForm, cHint, oControl );
                end
                else
                // 6.0.0.0
                if ( oControl is TUniRadioGroup ) or ( oControl is TUniDBRadioGroup ) then
                begin
                   renderAttr_RGCOLS( oControl, cHint , mm.varB_Mobile_Screen );
                end
                else
                if ( oControl is TUniHTMLFrame ) then
                begin
                   // QRCODE - bug fix to solve...
   //                cTemp2 := rc_GetHintAttr( 'qrcode:' , cHint );
   //                If cTemp2 <> '' then
   //                begin
   //                     oHtmlFrm := TUniHTMLFrame( pControl );
   //                     oHtmlFrm.HTML.Text := '<div class="rc-qrcode">' +
   //                                           '  <div class="rc-qrcode" id="' + oHtmlFrm.JSId + '"></div>' +
   //                                           '</div>';
   //                end;
                end;
             end;
           end;

           if pOnlyThisObj <> nil then
              Break;
        end;

        for I := 0 to TComponent( pForm ).ComponentCount - 1 do
        begin
           cTemp  := '';
           cTemp2 := '';
           cLink         := '';

           if pOnlyThisObj = nil then
              oControl := TUniControl( TComponent( pForm ).Components[I] )
           else
              oControl := pOnlyThisObj;
           // 7.0.0.0 render_exclusion
           if oControl.InheritsFrom(TUniControl) then
           begin
             If ( GetPropInfo( oControl.ClassInfo, 'Hint') <> nil ) then
             begin
                //8.3.0.0
                if ( oControl is TUniBitBtn ) or
                   ( oControl is TUniSpeedButton ) or
                   ( oControl is TUniMenuButton ) or
                   ( oControl is TUniButton ) then
                begin
(*
                     cls:ButtonOutline ButtonOutlineOrange ButtonRoundest |              btn:orange outline roundest font-orange

                     cls:ButtonOutline ButtonOutlineRed ButtonRounded |                  btn:red outline rounded
                     cls:ButtonOutline ButtonOutlineOrange ButtonRound btn-font-orange|  btn:orange outline round
                     cls:ButtonOutline ButtonOutlineRed btn-font-red|
                     cls:ButtonThemeCrud ButtonOutlineRed btn-font-red|                  btn:theme
*)
                     //8.3.0.0
                     cClass := rc_GetHintAttr( 'btn:' , oControl.Hint );
                     If ( cClass <> '' ) and ( rc_GetHintAttr( 'cls:' , oControl.Hint ) = '' ) and ( Pos( 'theme-color:off', oControl.Hint ) = 0 ) then
                     begin
                          cTemp := cClass;
                          cTemp2 := rc_CamelCase( Copy( cClass, 1, Pos( ' ', cClass )-1 ) );//color
                          cClass := 'Button';
                          //color
                          if cTemp2 = 'Theme' then
                             cClass := cClass + 'ThemeCrud'
                          else
                          if Pos( ' outline' , cTemp ) > 0 then
                             cClass := cClass + 'Outline ButtonOutline' + cTemp2 + ' '
                          else
                             cClass := cClass + cTemp2 ;
                          //round...
                          if Pos( ' roundest' , cTemp ) > 0 then
                             cClass := cClass + 'ButtonRoundest '
                          else
                          if Pos( ' rounded' , cTemp ) > 0 then
                             cClass := cClass + 'ButtonRounded '
                          else
                          if Pos( ' round' , cTemp ) > 0 then
                             cClass := cClass + 'ButtonRound ';
                          //btn-font
                          if Pos( ' btn-font-' , cTemp ) = 0 then
                             cClass := cClass + ' btn-font-' + lowercase( cTemp2 );
                          oControl.Hint := rc_SetHintAttr( cClass, 'cls:', oControl.Hint, true );

                          cClass := '';
                          cTemp  := '';
                          cTemp2 := '';
                     end;
                     //8.0.0.0
                     If ( rc_GetHintAttr( 'cls:' , oControl.Hint ) = '' ) and ( Pos( 'theme-color:off', oControl.Hint ) = 0 ) then
                     begin
                          oControl.Hint := rc_SetHintAttr( 'ButtonThemeCrud', 'cls:', oControl.Hint, true );
                     end;
                end;

                renderAttr_COLLAPSE( pForm, oControl );

                cHint  := rc_NormalizeHintAttr( TUniControl( oControl ).hint );
             end;

             If ( oControl is TUniScrollBox ) then
             begin
                  If TComponent( pForm ) is TUniForm then
                     If GetPropInfo( TUniScrollBox( oControl ).ClassInfo, 'RetainInitialOffsets') <> nil then
                        TUniScrollBox( oControl ).RetainInitialOffsets := True;

                  renderAttr_SCROLLBAR_NOT_REFRESH( pForm, oControl, cHint );
                  // ---------------------------------------------------------------------------------------------------------------------
                  //[EN] in unigui old versions, maybe need to comment this lines below( ScrollDirection was introduced in .1546 version )
                  //[PT] em versões antigas do unigui, comente as linhas abaixo( ScrollDirection foi introduzida na versão .1546 )
                  // ---------------------------------------------------------------------------------------------------------------------
                  //[PT] Isto resolve um problema que não consegui entender o que causa.
                  //      Principalmente em MOBILE, quando usamos o atributo "noborder" a barra de scroll horizontal é exibida.
                  //[EN] This solves a problem that I couldn't understand what causes.
                  //      Mainly on MOBILE, when we use the "noborder" attribute the horizontal scroll bar is displayed.
                  renderAttr_SCROLLBAR_SHOW_HIDE( oControl, cHint );
             end;
             //8.0.0.0
             If ( oControl is TUniLabel ) then
             begin
                renderAttr_LABELS( pForm, oControl, cHint );
             end;

             cLink         := '';

             if ( oControl is TUniBitBtn ) or
                ( oControl is TUniSpeedButton ) or
                ( oControl is TUniMenuButton ) or
                ( oControl is TUniButton ) then
             begin
                  renderControl_BTNGROUP( pForm, cHint, oControl );

                  renderControl_BUTTONS_ATTR( pForm, cHint, oControl );
             end
             else
             if ( oControl is TUniContainerPanel ) or
                ( oControl is TUniPanel ) or
                ( oControl is TUniSimplePanel ) then
             begin
                if Pos( 'layout' , lowercase( TUniControl( oControl ).Name ) ) > 0 then
                begin
                      //7.2.0.0
                      if lowercase( TUniControl( oControl ).Name ) = 'palayoutlogo' then
                      begin
                         if pos( 'dark', lowercase(mm.CONFIG_LAYOUT_ACTIVE_THEME) ) = 0 then
                            TUniControl( oControl ).Color := StringToColor( mm.CONFIG_LAYOUT_MENU_COLOR )
                         else
                            TUniControl( oControl ).Color := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR )
                      end
                      else
                         TUniControl( oControl ).Color := StringToColor( pMENU_COLOR );
                end;

                //8.0.0.0 ajustar ARREDONDAMENTO de panels...
                //if ( Pos( 'searchedit' , lowercase( oControl.Name ) ) > 0 ) then
//                if ( lowercase( oControl.Parent.Name ) = 'pasearchedit' )  then
//                begin
//                   rc_AddCssClass( TUniControl( oControl ), 'clsRoundPanel' );
//                   //TUniControl( oControl ).JSInterface.JSCall( 'addCls' , ['clsRoundPanel']);
//                end;

                //ROUND,ROUNDER,ROUNDEST
                renderAttr_ROUND( oControl, cHint );

                //BORDER
                renderAttr_BORDER( oControl, cHint );
             end
             else
             if ( oControl is TUniControl ) then
             begin
                //8.0.0.3
                if ( Pos( 'theme-color:off' , TUniControl( oControl ).Hint ) > 0 ) then
                begin
                   if ( oControl is TUniDateTimePicker ) or ( oControl is TUniDBDateTimePicker ) then
                   begin
                      rc_CreateCssClass( oControl, ' .x-form-field, .x-form-text, .x-form-date-trigger { background-color:' + ColorToWeb( TUniControl( oControl ).Color ) + ' !important;}' , 'themeoff', false );
                      rc_AddCssClass( TUniDateTimePicker( oControl ) , 'css-rc-' + TUniControl( oControl ).JSId + '_' + 'themeoff');
                   end
                   else
                   begin
                      if Pos ( 'css-rc-' + TUniControl( oControl ).JSId, TUniControl( oControl ).Hint ) = 0 then
                      begin
                         rc_CreateCssClass( oControl, ' .x-form-trigger-wrap-default { background-color:' + ColorToWeb( TUniControl( oControl ).Color ) + ' !important;}' , 'themeoff', true );
                         //rc_AddCssClass( oControl , 'css-rc-' + TUniControl( oControl ).JSId );
                      end;
                   end;
                end;
                // 8.0.0.0 cls:
                // Componentes DateTimePicker não aceitam adicionar classe css( error in DEBUG MODE )
                //---------------------------
                //'There is no Default JavaScript Object. [edSearchDTCADASTROFIM : TUniDateTimePicker]'.
                cClass := rc_GetHintAttr( 'cls:' , cHint );
                if cClass <> '' then
                   rc_AddCssClass( TUniControl( oControl ), cClass );
                cClass := '';

                //8.0.0.0 rtl
                If ( GetPropInfo( oControl.ClassInfo, 'RTL') <> nil ) then
                begin
                   bRTL := ( mm.RTL ) and ( Pos( 'ltr:', oControl.Hint ) = 0 );
                   TUniControl( oControl ).RTL := bRTL ;
                end;

                //8.0.0.0
                renderAttr_INPUTICO( oControl, cHint, bRTL );

             end;
           end;

           if pOnlyThisObj <> nil then
              Break;
        end;
     except on e:exception do
            begin
                 cTemp := '';
                 if oControl <> nil then
                    cTemp := oControl.Name;

                 ShowMessage( 'rc_RenderControlsExecute' + sLineBreak + sLineBreak +
                              'I=' + i.ToString + sLineBreak + sLineBreak +
                              'Obj:' + cTemp + sLineBreak + sLineBreak +
                              e.Message );
            end;
     end;
end;
// 6.0.0.0
procedure rc_BootStrapRenderExecute( pForm : TObject ; pUpdateDBFields : Boolean ; pTabIni, pTabEnd : integer; pMobileScreen, pLandScape : boolean ; pOnlyThisObj : TObject );
var
  oObj : TObject;
  oObjTemp : TUniControl;

  cHint, cHintDefault,
  cCaption,
  cTemp,
  cTemp2,
  cBsID : string;

  I, F : Integer;

  varSL_HtmlPage : TStringList;
begin
     oObj       := nil;
     oObjTemp   := nil;
     varSL_HtmlPage := TStringList.Create;

     if TComponent( pForm ) <> nil then
     begin
         for I := 0 to TComponent( pForm ).ComponentCount - 1 do
         begin
             Try
                 if pOnlyThisObj = nil then
                    oObj := TComponent( pForm ).Components[I]
                 else
                    oObj := pOnlyThisObj;

                 cHint    := '';
                 // 7.0.0.0 render_exclusion
                 if oObj.InheritsFrom(TUniControl) then
                 begin
                    // Ext.ToolTip
                    If GetPropInfo( oObj.ClassInfo, 'Hint') <> nil then
                    begin

                       if ( pos( 'true imsg:', TUniControl( oObj ).hint ) > 0 ) then
                       begin
                          oObjTemp := TUniLabel( TComponent(pForm).FindComponent('rcLabel__inv_lab_' + TUniControl( oObj ).Name) );
                          if ( oObjTemp <> nil ) then
                          begin
                             oObjTemp.Visible := False;
                          end;
                       end;
                       // 6.0.0.0
                       // refazer Hint do bsAlert ( feedback by daniel rodrigues )
                       if ( oObj is TUniLabel ) then
                       begin
                          cCaption := '';
                       end;

                       cHint    := TUniControl( oObj ).Hint;

                       if Pos( '[[', cHint ) = 0 then
                          cHint := ''
                       else
                       begin
                          cHint := StringReplace( cHint , '[[' , '', [rfReplaceAll] );
                          cHint := StringReplace( cHint , ']]' , '', [rfReplaceAll] ) + ' ';
                       end;

                       if ( Pos( '[[', cHint ) > 0 ) and ( Pos( #$D , cHint ) > 0 )then
                       begin
                          TUniControl( oObj ).hint := StringReplace( TUniControl( oObj ).hint, #$D, '', [rfreplaceall] );
                          cHint    := TUniControl( oObj ).Hint;
                       end;
                    end;
                    while copy( cHint,1, 1 ) = '|' do
                       cHint := Copy( cHint, 2 );
                    cHintDefault := cHint;
                    cHintDefault := trim( rc_NormalizeHintAttr( cHintDefault )) + ' ';
                    cHint        := trim( rc_NormalizeHintAttr( cHint )) + ' ';

                    // if not HINT 'attribute' defined( [[ )....
                    if ( cHint <> '' ) or ( Pos( 'bsrgp' , lowercase( TUniControl( oObj ).Name ) ) > 0 ) then
                    begin
                        //8.0.0.0 bsToolTip
//                        if Pos( ' hint:' , cHint ) > 0 then
//                        begin
//                           //( feedback by JOAS )
//                           cTemp    := Trim(Copy( cHintDefault, Pos( 'hint:' , cHintDefault ) + 5 , 200 ))  ;
//                           if Pos( '|', cTemp ) > 0 then
//                              cTemp    := Trim(Copy( cTemp, 1, Pos( '|' , cTemp ) -1 ))
//                           else
//                           if Pos( ']]', cTemp ) > 0 then
//                              cTemp    := Trim(Copy( cTemp, 1, Pos( ']]' , cTemp ) -1 )) ;
//
//                           TUniControl( oObj ).ClientEvents.ExtEvents.Values['afterrender'] :=
//                              'function afterrender(sender, eOpts){'+
//                                 'Ext.create(''Ext.tip.ToolTip'','+
//                                 '{  target: sender.getEl(), ' +
//                                 '   trackMouse: true,'+
//                                 '   html: "' + cTemp + '"})}' ;
//                        end;
                        // 6.0.0.0
                        if ( oObj is TUniLabel ) then
                        begin
                           cCaption := TUniControl( oObj ).Caption;

                           cTemp    := trim( Copy( cHint, Pos( 'bsh' , lowercase(cHint) ) , 100 ) );
                           cTemp    := Copy( cTemp, 1, Pos( ':' , cTemp ) - 1 );

                           cTemp2   := lowercase( TUniControl( oObj ).Name );
                           cTemp2   := Copy( cTemp2, 1, 5 );

                           if ( Pos( cTemp, BS_COMPONENTS ) > 0 ) or ( Pos( cTemp2, BS_COMPONENTS ) > 0 ) then
                           begin
                              //[PT] para evitar que o "ID" do componente em HTML se repita se os nomes forem iguais
                              //[EN] to prevent the HTML component "ID" from being repeated if the names are the same
                              cBsID := ( Random( 900 ) + 1 ).ToString;
                              // remover o SUBLINHADO
                              if ( oObj is TUniLabel ) then
                              begin
                                TUniLabel( oObj ).Font.Style := [];
                              end;

                              //8.0.0.0
                              renderAttr_BSH( pForm, oObj, cHint , cCaption, mm.RTL );

                              //8.0.0.0
                              if Pos( 'rcalert:' , cHint ) > 0 then
                                 renderAttr_RCALERT( oObj, cCaption, cHint )
                              else
                              if Pos( 'rcfeature:' , cHint ) > 0 then
                                 renderAttr_RCFEATURE( oObj, cCaption, cHint )
                              else
                              if Pos( 'bsalert:' , cHint ) > 0 then
                                 renderAttr_BSALERT( oObj, cCaption, cHint )
                              else
                              if Pos( 'rcalert-r:' , cHint ) > 0 then
                                 renderAttr_RCALERT_R( pForm, oObj, cCaption, cHint )
                              else
                              if Pos( 'rcfeature-r:' , cHint ) > 0 then
                                 renderAttr_RCFEATURE_R( pForm, oObj, cCaption, cHint )
                              else
                              if Pos( 'bsalert-r:' , cHint ) > 0 then
                                 renderAttr_BSALERT_R( pForm, oObj, cCaption, cHint )
                              else
                              if ( Pos( 'bschk:' , cHint ) > 0 ) or ( Pos( 'bsswt:' , cHint ) > 0 ) then
                                  renderAttr_BSCHK_SWT(  pForm, oObj, cHint, pUpdateDBFields, cBsID )
                              else
                              if ( Pos( 'bsrgp' , lowercase( TUniControl( oObj ).Name ) ) > 0 ) then
                                 renderAttr_BSRGP(  pForm, oObj, cHint, pUpdateDBFields, cBsID )
                              else
                              if Pos( 'bstabs:' , cHint ) > 0 then
                                 renderAttr_BSTABS( pForm, oObj, cHint, varSL_HtmlPage, pMobileScreen, pTabIni, pTabEnd, cBsID, I )
                              else
                              if Pos( 'bspills:' , cHint ) > 0 then
                                 renderAttr_BSPILLS( pForm, oObj, cHint, varSL_HtmlPage, pMobileScreen, mm.varB_Mobile_Screen_Portrait, mm.RTL, pTabIni, pTabEnd, cBsID, I );
                           end;
                        end
                        else
                        if ( oObj is TUniHTMLFrame ) then
                        begin
                            cTemp := rc_NormalizeHintAttr( cHint );
                            cTemp := RemoveLineBreaks( cTemp );
                            cTemp := Copy( cTemp, 1, Pos( ':' , cTemp ) - 1 );

                            if ( Pos( cTemp, BS_COMPONENTS ) > 0 ) and ( cHint <> '' ) then
                            begin
                               varSL_HtmlPage.Clear;

                               if Pos( 'bscarousel:' , cHint ) > 0 then
                                  renderAttr_BSCAROUSEL( pForm, oObj, cHint, cHintDefault, varSL_HtmlPage, cBsID )
                               else
                               if Pos( 'bsimg:' , cHint ) > 0 then
                                  renderAttr_BSIMG( pForm, oObj, cHint, mm.varB_Mobile_Screen, mm.varB_Mobile_Screen_Portrait, mm.varB_Mobile_Screen_Landscape, varSL_HtmlPage, cBsID )
                               else
                               // bsvideo
                               //[PT] não use alClient no htmlframe, use Anchors
                               //[EN] don't use alClient in htmlframe, use Anchors
                               if Pos( 'bsvideo:' , cHint ) > 0 then
                                  renderAttr_BSVIDEO( pForm, oObj, cHint, cHintDefault, mm.varB_Mobile_Screen, mm.varB_Mobile_Screen_Portrait, mm.varB_Mobile_Screen_Landscape, varSL_HtmlPage, cBsID );

                               TUniHTMLFrame( oObj ).HTML.Text :=  varSL_HtmlPage.Text;
                            end;
                        end
                        else

                        if ( oObj is TUniPanel ) or
                           ( oObj is TUniSimplePanel ) or
                           ( oObj is TUniContainerPanel ) then
                        begin
                           cTemp := Copy( cHint, 1, Pos( '_' , cHint ) - 1 );

                           if Pos( cTemp, BS_COMPONENTS ) > 0 then
                           begin
                           end;

                        end;
                    end;

                    if pOnlyThisObj <> nil then
                       Break;
                 end;
             except on e:exception do
                    begin
                         dm_rc.rc_ShowError( 'rc_BootStrapRenderExecute ( ' + i.ToString + ' | obj: ' + TUniControl( oObj ).name + ') : ' + e.Message  );
                    end;
             End;
         end;
     end;
     varSL_HtmlPage.Free;
end;

// 7.1.0.0
procedure rc_DynamicAlignment( pFrame: TObject );
var
   oComponent : TComponent;
   oObjTemp, oObjTemp2 : TUniControl;
   oLabel : TUniLabel; //7.1.0.0
   cTemp5,
   cCaption,
   cAlignMobileOff, cAlignMobile,
   cCmd, cTemp, cTemp2, cTemp3, cTemp4, cTemp6, cHint : string;

   iOffSet,
   iii,
   i,n,x,y,w,h, iLeft, iTop, iRight, iBottom, iWidth, iHeight,
   iPos, iPos2, iTemp : integer;

   fValue,fPlus,fMinus : Double;

   bHided,bMobile, bMobile_off,bScaleOff, bDots : boolean;//7.0.0.0 hide
begin
   // align components
   //
   // [[cls:btngreen | align:btncancel r:-10]]
   // [[cls:btnred | align:memo l:0 b:4]]
   // [[center:parent xy]]

   x := 0;
   oObjTemp := nil;
    iii := 0;
   //UniSession.SuspendLayouts();
   try
      for I := 1 to TComponent(pFrame).ComponentCount - 1 do
      begin
         if TComponent(pFrame).Components[ I ].Name = 'ExportarpraEXCEL1' then
            iii := iii;
         oObjTemp  := TUniControl( TComponent(pFrame).Components[ I ] );
         //[PT] Conflito com novo col-attr: ( uniDbGrid só recebe col-attr como atributos )
         //[EN] Conflict with new col-attr: (uniDbGrid only accepts col-attr as attributes)
         //8.5.0.0 nao processar componentes quickreport | does not process quickreport components
         cTemp := TComponent( pFrame ).Components[I].ClassName;
         If ( Copy( cTemp, 1, 3 ) <> 'TRL') and // TRLReport, TRLBand...
            ( cTemp <> 'TQuickRep' ) and (Copy( cTemp, 1, 3) <> 'TQR') and
            ( Pos( 'TAction' , cTemp ) = 0 ) and
            ( Pos( 'THelp' , cTemp ) = 0 ) and
            ( Pos( 'TUniMenuItem' , cTemp ) = 0 ) and
            ( not TComponent( pFrame ).Components[I].InheritsFrom(TUniFrame) ) and
            ( not TComponent( pFrame ).Components[I].InheritsFrom(TUniForm) ) then
         begin
            cTemp := '';
            if GetPropInfo( oObjTemp.ClassInfo, 'Hint' ) <> nil then
            begin
                cHint :=  oObjTemp.Hint;
                cHint := '[[' + rc_NormalizeHintAttr( cHint  ) + ']]'; // 6.0.0.0
                //8.0.0.0
                if ( Pos( 'TUniDBGrid' , oObjTemp.ClassName ) > 0 ) then
                    //cHint := rc_AdjustHintForGrids( TComponent( pFrame ).Components[I].ClassName, cHint, true );
                    cHint := rc_AdjustHintForGrids( cHint, true );

                if Pos( '[[' , cHint ) > 0 then
                begin
                   cTemp3  := cHint;

                   if ( oObjTemp is TUniLabel ) then
                   begin
                      // FONT responsive
                      // font-size:50 mobile-v-24 mobile-h-32 |
                      cTemp := rc_GetHintAttr( 'fontsize-r:', cTemp3 );

                      if cTemp <> '' then
                      begin
                         iPos := StrToIntDef( Copy( cTemp, 1, Pos( ' ', cTemp ) - 1 ), TUnilabel( oObjTemp ).Font.Size );

                         if mm.varB_Mobile_Screen_Portrait then
                         begin
                            iPos  := Pos( 'mobile-v-' , cTemp ) + 9;
                            cTemp := Copy( cTemp, iPos, 100 );
                            cTemp := Copy( cTemp, 1, Pos( ' ', cTemp ) - 1 );
                            iPos  := StrToIntDef( cTemp, TUnilabel( oObjTemp ).Font.Size );
                         end
                         else
                         if mm.varB_Mobile_Screen_Landscape then
                         begin
                            iPos  := Pos( 'mobile-h-' , cTemp ) + 9;
                            cTemp := Copy( cTemp, iPos, 100 ) + ' ';
                            cTemp := Copy( cTemp, 1, Pos( ' ', cTemp ) - 1 );
                            iPos  := StrToIntDef( cTemp, TUnilabel( oObjTemp ).Font.Size );
                         end;

                         TUnilabel( oObjTemp ).Font.Size := iPos;
                      end;
                      // 6.0.0.0
                      // caption-dots
                      //
                      // mobile-v  : in MOBILE PORTRAIT MODE
                      // mobile-h  : in MOBILE LANDSCAPE MODE
                      // mobile    : in MOBILE MODE
                      cTemp3 := rc_GetHintAttr( 'caption-dots:', cHint );
                      if cTemp3 <> '' then
                      begin
                         if ReturnLetters( cTemp3 ) = '' then
                            cTemp3 := 'desktop-' + cTemp3;
                         cTemp4 := rc_GetHintAttr( 'caption-dots-default:', cHint );

                         bDots  := ( ( Pos( 'mobile-v-', cTemp3 ) > 0 ) and ( mm.varB_Mobile_Screen_Portrait ) ) or
                                   ( ( Pos( 'mobile-h-', cTemp3 ) > 0 ) and ( mm.varB_Mobile_Screen_Landscape ) ) or
                                   ( ( Pos( 'mobile-', cTemp3 ) > 0 )   and ( mm.varB_Mobile_Screen_Portrait ) ) ;
                         if not ( bDots ) then
                         begin
                            bDots  := ( ( Pos( 'desktop-', cTemp3 ) > 0 )  and ( not mm.varB_Mobile_Screen ) );
                            cTemp3  := Copy( cTemp3, Pos( 'desktop-', cTemp3 ) + 8 ) + ' ';
                            cTemp3  := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                         end
                         else
                         begin
                            cTemp3  := Copy( cTemp3, Pos( 'mobile-', cTemp3 ) + 7 ) + ' ';
                            cTemp3  := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                         end;
                         iTemp  := StrToIntDef( ReturnNumbers( cTemp3 ), 0 );

                         if ( bDots ) and ( Length( oObjTemp.Caption ) >= iTemp ) then
                         begin
                             if ( Pos(  '...', oObjTemp.Caption ) = 0 ) then
                             begin
                                oObjTemp.Hint := rc_SetHintAttr( oObjTemp.Caption, 'caption-dots-default:', oObjTemp.Hint );
                                //8.0.0.0
                                if ( Pos( 'TUniDBGrid' , oObjTemp.ClassName ) > 0 ) then
                                   //cHint := rc_AdjustHintForGrids( TComponent( pFrame ).Components[I].ClassName, oObjTemp.Hint );
                                   cHint := rc_AdjustHintForGrids( oObjTemp.Hint );
                             end;

                             oObjTemp.Caption := Copy( oObjTemp.Caption, 1, iTemp ) + '...';
                         end
                         else
                         if ( cTemp4 <> '' ) then
                            oObjTemp.Caption := cTemp4;
                      end;

                      if ( Pos( 'center:parent y', cHint ) > 0  ) then
                         cTemp3 := cTemp3 ;
                      cTemp3 := rc_GetHintAttr( 'center:', cHint );
                      if cTemp3 <> '' then
                      begin
                         cTemp := 'center:' + cTemp3;
                         if not DynamicAlignment_CENTER( pFrame, oObjTemp, cTemp3, cTemp ) then
                            Break;
                      end;
                   end
                   else
                   // 6.0.0.0
                   if ( oObjTemp is TUniBitBtn ) or
                      ( oObjTemp is TUniButton ) or
                      ( oObjTemp is TUniSpeedButton ) or
                      ( oObjTemp is TUniMenuButton ) then
                   begin
                      // caption-hide
                      //
                      // mobile-v  : in MOBILE PORTRAIT MODE
                      // mobile-h  : in MOBILE LANDSCAPE MODE
                      // mobile    : in MOBILE MODE
                      // 8.4.0.0 caption-hide
                      if Pos( 'caption-hide:', cHint ) > 0 then
                      begin
                           renderControl_BUTTONS_ATTR( pFrame, cHint, oObjTemp );
//                         cTemp3 := ( rc_GetHintAttr( 'caption-hide:', cHint ) );
//                         //8.4.0.0 em teste...
//                         cTemp4   := rc_GetHintAttr( 'caption:', cHint );
//                         //if Pos( '</span>', oObjTemp.Caption ) > 0 then
//                         begin
//                           cCaption := Copy( oObjTemp.Caption, 1, Pos( '</span>', oObjTemp.Caption ) - 1 );
//                           cCaption := ReverseStr( cCaption );
//                           cCaption := ReverseStr( Copy( cCaption, 1, Pos( '>', cCaption )-1 ) );
//                         end;
//                         //cTemp4   := rc_GetHintAttr( 'caption:', cHint );
//
//                         TUniControl( oObjTemp ).Caption := StringReplace( oObjTemp.Caption, cCaption, '[-]', [rfReplaceAll] );
//
//                         if rc_IsMobile_V( cTemp3 ) then //8.0.0.0
//                            cTemp4 := ''
//                         else
//                         if rc_IsMobile_H( cTemp3 ) then //8.0.0.0
//                            cTemp4 := ''
//                         else
//                         if rc_IsMobile( cTemp3 ) then //8.0.0.0
//                           cTemp4 := ''
//                         else
//                         if rc_IsDesktop( cTemp3 ) then //8.0.0.0
//                           cTemp4 := '';
//                         //7.0.0.0 caption-hide
//                         if cCaption <> '' then
//                         begin
//                            TUniControl( oObjTemp ).Caption := StringReplace( oObjTemp.Caption, '[-]' ,cTemp4 , [rfReplaceAll] );
//                         end
//                         else
//                         begin
//                              if Pos( 'ico-pos:right', TUniControl( oObjTemp ).Hint ) = 0 then
//                              begin
//                                 cCaption := Copy( oObjTemp.Caption, 1, Pos( '></span>', oObjTemp.Caption ) );
//                                 cCaption := cCaption + cTemp4 + '</span>';
//                                 TUniControl( oObjTemp ).Caption := cCaption;
//                              end
//                              else
//                              begin
//                                 cCaption := oObjTemp.Caption;
//                                 cCaption := StringReplace( cCaption, '></span>', '>' + cTemp4 + '</span>', [rfReplaceAll] );
//                                 TUniControl( oObjTemp ).Caption := cCaption;
//                              end;
//                         end;
                      end;
                   end;

                   cTemp2 := rc_NormalizeHintAttr( cHint );
                   cTemp2 := cTemp2 + '|';
                   cCmd   := cTemp2;
                   iPos2  := Pos( '|' , cTemp2 );

                   While ( iPos2 > 0 ) do
                   begin
                        cTemp  := Trim( Copy( cCmd, 1 , iPos2 ) );
                        cTemp2 := Trim( StringReplace( cCmd, cTemp, '', [rfReplaceAll] ) );

                        cCmd := cTemp2;

                        cTemp  := StringReplace( cTemp, '|', '', [rfReplaceAll] ) + ' ';
                        // 6.0.0.0
                        // hide:mobile
                        // hide:mobile-v
                        // hide:mobile-h
                        // hide:desktop
                        // hide:desktop mobile-h
                        // mobile-v  : in MOBILE PORTRAIT MODE
                        // mobile-h  : in MOBILE LANDSCAPE MODE
                        // mobile    : in MOBILE MODE
                        // desktop   : in DESKTOP MODE
                        cTemp3 := ( rc_GetHintAttr( 'hide:', cTemp ) );
                        //7.0.0.0
                        bHided := false;
                        if ( cTemp3 <> '' ) then
                        begin
                           if Pos( 'rc-state-visible:', oObjTemp.Hint ) > 0 then
                           begin
                              //if oObjTemp.Name = 'rcBlock20' then
                              //   bHided := bHided;
                              if rc_GetHintAttr( 'rc-state-visible:', oObjTemp.Hint ) = 'true' then
                                 rc_ObjectVisible( pFrame, oObjTemp, true, true )
                              else
                              begin
                                 rc_ObjectVisible( pFrame, oObjTemp, false, true );
                                 bHided := true;
                              end;

                              if rc_IsMobile_V( cTemp3 ) then //8.0.0.0
                              begin
                                 rc_ObjectVisible( pFrame, oObjTemp, false, true );
                                 bHided := true;
                              end
                              else
                              if rc_IsMobile_H( cTemp3 ) then //8.0.0.0//if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and ( mm.varB_Mobile_Screen_Landscape ) then
                              begin
                                 rc_ObjectVisible( pFrame, oObjTemp, false, true );
                                 bHided := true;
                              end
                              else
                              if rc_IsMobile( cTemp3 ) then //8.0.0.0
                              begin
                                 rc_ObjectVisible( pFrame, oObjTemp, false, true );
                                 bHided := true;
                              end
                              else
                              if rc_IsDeskTop( cTemp3 ) then //8.0.0.0
                              begin
                                rc_ObjectVisible( pFrame, oObjTemp, false, true );
                                bHided := true;
                              end
                              //7.0.0.1
                              else
                              if not bHided then
                              begin
                                 rc_ObjectVisible( pFrame, oObjTemp, true, true );
                                 bHided := true;
                              end;
                           end
                           else
                           begin
                              bHided := false;
                              if rc_IsMobile_V( cTemp3 ) then //8.0.0.0
                              begin
                                 rc_ObjectVisible( pFrame, oObjTemp, false, true );
                                 bHided := true;
                              end
                              else
                              if rc_IsMobile_H( cTemp3 ) then //8.0.0.0
                              begin
                                 rc_ObjectVisible( pFrame, oObjTemp, false, true );
                                 bHided := true;
                              end
                              else
                              if rc_IsMobile( cTemp3 ) then //8.0.0.0
                              begin
                                rc_ObjectVisible( pFrame, oObjTemp, false, true );
                                bHided := true;
                              end
                              else
                              if rc_IsDesktop( cTemp3 ) then //8.0.0.0
                              begin
                                rc_ObjectVisible( pFrame, oObjTemp, false, true );
                                bHided := true;
                              end
                              //7.0.0.1
                              else
                              if not bHided then
                              begin
                                 //8.0.0.0 eremin
                                 rc_ObjectStatus( oObjTemp, true );
                                 bHided := true;
                              end;
                           end;
                           //7.0.0.0
                           if bHided then
                           begin
                              //if oObjTemp.Name = 'rcBlock300' then
                              //   bHided := bHided;
                              if ( Pos( ' disable', cTemp3 ) > 0 ) and ( not oObjTemp.Visible ) and ( Pos( 'rcblock', lowercase(oObjTemp.Name) ) > 0 ) and ( Pos( 'cols:', cHint ) > 0 ) then
                                 rc_ObjectEnabled( pFrame, oObjTemp, false, true )
                              else
                              if ( Pos( ' disable', cTemp3 ) > 0 ) and ( oObjTemp.Visible ) and ( Pos( 'rcblock', lowercase(oObjTemp.Name) ) > 0 ) and ( Pos( 'cols:', cHint ) > 0 ) then
                                 rc_ObjectEnabled( pFrame, oObjTemp, true, true )
                           end;
                        end;
                        cTemp2 := '';

                        if ( ( oObjTemp.Visible ) and ( oObjTemp.Enabled ) ) or ( Pos( 'force-render', oObjTemp.Hint ) > 0 ) then // 6.0.0.0
                        begin
                            //7.1.0.0 ctemp > ctemp6
                            cTemp6 := rc_GetHintAttr( 'label:', TUniControl( oObjTemp ).hint, false, true );
                            if cTemp6 <> '' then
                            begin
                               oLabel := TUniLabel( TComponent(pFrame).FindComponent('rc__Label' + TUniControl( oObjTemp ).Name) );
                               if oLabel <> nil then
                               begin
                                   if oLabel.Tag <> 2 then
                                      oLabel.Tag   := 0;

                                   //width
                                   cTemp3         := ReturnNumbers( Trim( Copy( trim(cTemp6) , 1, Pos( ' ', cTemp6 ) ) ) );
                                   if cTemp3 <> '' then
                                   begin
                                      iWidth     := StrToIntDef( cTemp3, 0 );
                                      cTemp6      := StringReplace( cTemp6, cTemp3 + ' ', '', [rfReplaceAll] );
                                   end;
                                   cTemp3         := '';

                                   //centralizacao verfical
                                   cTemp4         := varIIF( Pos( ' center', cTemp6 ) > 0, 'center', '' );
                                   cTemp6          := StringReplace( cTemp6, ' center', '', [rfReplaceAll] );

                                   //align
                                   cTemp2         := varIIF( Pos( 'align-left', cTemp6 ) > 0, 'left', '' );
                                   if cTemp2 = '' then
                                   begin
                                      cTemp2      := varIIF( Pos( 'align-right', cTemp6 ) > 0, 'right', '' );
                                      cTemp6       := StringReplace( cTemp6, 'align-right', '', [rfReplaceAll] );
                                   end
                                   else
                                      cTemp6       := StringReplace( cTemp6, 'align-left', '', [rfReplaceAll] );

                                   //position
                                   cTemp3         := Trim( Copy( trim(cTemp6) , 1, Pos( ' ', cTemp6 ) ) );
                                   cTemp3         := Trim(cTemp3);
                                   //caption
                                   cTemp6          := Trim( StringReplace( cTemp6, cTemp3, '', [rfReplaceAll] ) );

                                   oLabel.AutoSize := false;
                                   if iWidth > 0 then
                                      oLabel.Width    := iWidth
                                   else
                                      iWidth := Trunc( Length( oLabel.Caption ) * 5.8 );
                                   oLabel.Height := 15;
                                   //position
                                   oLabel.Anchors := [akLeft];
                                   if mm.varB_Mobile_Screen_Portrait then
                                   begin
                                      if ( cTemp3='left' ) or ( cTemp3='right' )then
                                      begin
                                          cTemp3 := 'top';
                                          TUniControl( oObjTemp ).Parent.Height := 60;
                                          TUniControl( oObjTemp ).Width := TUniControl( oObjTemp ).Parent.Width;
                                          oLabel.Anchors := [akLeft];
                                          oLabel.Alignment := taLeftJustify;
                                          cTemp4 := '';
                                          oLabel.Tag := 2;
                                      end;
                                   end
                                   else
                                   if oLabel.Tag = 2 then
                                      oLabel.Tag := 1;
                                   if cTemp3='top' then
                                   begin
                                      oLabel.Left   := 0;
                                      oLabel.Top    := 0;
                                      TUniControl( oObjTemp ).Left := 0;
                                      TUniControl( oObjTemp ).Top  := 21;
                                   end
                                   else
                                   if cTemp3='bottom' then
                                   begin
                                      oLabel.Left   := 0;
                                      oLabel.Top    := 40;
                                      TUniControl( oObjTemp ).Top  := 0;
                                      TUniControl( oObjTemp ).Left := 0;
                                   end
                                   else
                                   if cTemp3='left' then
                                   begin
                                      if oLabel.tag = 1 then
                                      begin
                                         TUniControl( oObjTemp ).Parent.Height := TUniControl( oObjTemp ).Parent.Height - 21;
                                         TUniControl( oObjTemp ).Top    := TUniControl( oObjTemp ).Top - 21;
                                         TUniControl( oObjTemp ).Width := TUniControl( oObjTemp ).Width - iWidth - 4 ;
                                         TUniControl( oObjTemp ).Left := iWidth + 4;
                                         oLabel.Tag := 0;
                                      end;
                                      if ( cTemp2='' ) or ( cTemp2='left' ) then
                                         oLabel.Alignment := taLeftJustify
                                      else
                                         oLabel.Alignment := taRightJustify;
                                      oLabel.Left   := 0;
                                      oLabel.Top    := 0;
                                      if cTemp4='center' then
                                         oLabel.Top := ( TUniControl( oObjTemp ).Parent.Height div 2 ) - ( oLabel.Height div 2 ) ;
                                   end
                                   else
                                   if cTemp3='right' then
                                   begin
                                      if oLabel.tag = 1 then
                                      begin
                                         TUniControl( oObjTemp ).Parent.Height := TUniControl( oObjTemp ).Parent.Height - 21;
                                         TUniControl( oObjTemp ).Top    := TUniControl( oObjTemp ).Top - 21;
                                         TUniControl( oObjTemp ).Width := TUniControl( oObjTemp ).Width - iWidth - 4;
                                         TUniControl( oObjTemp ).Left := 0;
                                         oLabel.Tag := 0;
                                      end;
                                      if ( cTemp2='' ) or ( cTemp2='right' ) then
                                         oLabel.Alignment := taRightJustify
                                      else
                                         oLabel.Alignment := taLeftJustify;
                                      oLabel.Left   := TUniControl( oObjTemp ).Width + 4 ;
                                      oLabel.Top    := 0;
                                      if cTemp4='center' then
                                         oLabel.Top := ( TUniControl( oObjTemp ).Parent.Height div 2 ) - ( oLabel.Height div 2 ) ;
                                      oLabel.Anchors := [akRight];
                                   end;
                               end;
                            end;

                            //8.0.0.0
                            renderAttr_Pos( oObjTemp, cTemp );

                            // scale  scale:rcBlock34 w:45% pad:0 5 0 5
                            // w:screenwidth-10
                            renderAttr_SCALE( pFrame, oObjTemp, cTemp, cHint );

                            renderAttr_HEIGHT( oObjTemp, cHint );

                            renderAttr_MINHEIGHT( oObjTemp, cHint );

                            renderAttr_MAXHEIGHT( oObjTemp, cHint );

                            renderAttr_WIDTH( oObjTemp, cHint );

                            renderAttr_MINWIDTH( oObjTemp, cHint );

                            renderAttr_MAXWIDTH( oObjTemp, cHint );

                            renderAttr_ALIGNMENT( oObjTemp, cHint );

                            renderAttr_ANCHOR( pFrame, oObjTemp, cTemp, cHint );

                            //8.0.0.0 "align:"
                            renderAttr_ALIGN( pFrame, oObjTemp, cTemp );

                            //8.0.0.0 reload html
                            renderAttr_HTMLRELOAD( oObjTemp );

                            cTemp3 := rc_GetHintAttr( 'center:', cTemp );
                            if cTemp3 <> '' then
                               if not DynamicAlignment_CENTER( pFrame, oObjTemp, cTemp3, cTemp ) then
                                  Break;
                        end;
                        iPos2 := Pos( '|' , cCmd );
                   end;
                end;
            end;
         end;
      end;
   except on e:exception do
          begin
               dm_rc.rc_ShowSweetAlert( 'Error' , 'rc_DynamicAlignment error(' + varIIF( oObjTemp <> nil, oObjTemp.Name, '' ) + '): ' + e.Message , 'error' );
          end;
   end;
end;

procedure rc_CenterObj(pObj: TObject; pObjParent : TObject; pV : boolean; pH : boolean; pV_OffSet : integer; pH_OffSet : integer );
var
   pWidthParent,
   pHeightParent : integer;
begin
     if pObjParent = nil then
     begin
          pWidthParent  := mm.varI_ScreenWidth ;
          pHeightParent := mm.varI_ScreenHeight;
     end
     else
     begin
          pWidthParent  := TUniControl( pObjParent ).Width;
          pHeightParent := TUniControl( pObjParent ).Height;
     end;

     pWidthParent  := pWidthParent  + pH_OffSet;
     pHeightParent := pHeightParent + pV_OffSet;

     if pH then
     begin
        TUniControl( pObj ).Left := ( pWidthParent div 2 ) - ( TUniControl( pObj ).Width div 2 );
        if TUniControl( pObj ).Left < 0 then
           TUniControl( pObj ).Left := 0;
     end;

     if pV then
     begin
        TUniControl( pObj ).Top  := ( pHeightParent div 2 ) - ( TUniControl ( pObj ).Height div 2 );
        if TUniControl( pObj ).Top < 0 then
           TUniControl( pObj ).Top := 0;
     end;
end;
// 6.0.0.0
procedure rc_GenerateRuntimeDebugBlocksFile(pFrame: TObject);
var
  i: Integer;
  IniFile   : TIniFile;
  sCompName : string;
  oObj      : TUniContainerPanel;
begin
  IniFile := TiniFile.Create( dm_rc.rc_GetFilesPath +'rc-forms\' + TComponent(pFrame).Name + '.ini' );
  for i := 0 to TComponent(pFrame).ComponentCount - 1 do
  begin
       if (TComponent(pFrame).Components[I] is TUniContainerPanel) then
       begin
            oObj      := TUniContainerPanel( TComponent(pFrame).Components[I] );
            sCompName := oObj.Name;

            if (Pos('rcblock', lowercase(sCompName) ) > 0) then
            begin
                 IniFile.WriteString( sCompName , 'cmd' , RemoveLineBreaks( oObj.hint ) ) ;
            end;
       end;
  end;
  IniFile.Free;
end;
// 6.0.0.0
procedure rc_GenerateRuntimeComponentsFile(pFrame: TObject);
var
  i: Integer;
  IniFile   : TIniFile;
  sHint,sCompName : string;
  oObj      : TUniControl;// TUniContainerPanel;
begin
  IniFile := TiniFile.Create( dm_rc.rc_GetFilesPath +'rc-forms\' + TComponent(pFrame).Name + '.ini' );
  for i := 0 to TComponent(pFrame).ComponentCount - 1 do
  begin
       if (TComponent(pFrame).Components[I] is TUniControl) then
       begin
            oObj      := TUniControl( TComponent(pFrame).Components[I] );
            sCompName := oObj.Name;

            if (Pos('[[', lowercase(oObj.hint) ) > 0) and (Pos(']]', lowercase(oObj.hint) ) > 0)then
            begin
                 sHint := '[[' + rc_NormalizeHintAttr( RemoveLineBreaks( oObj.hint ) + ']]' );
                 IniFile.WriteString( sCompName , 'cmd' , RemoveLineBreaks( oObj.hint ) ) ;
            end;
       end;
  end;
  IniFile.Free;
end;

end.
