unit mkm_layout_aux_btns; //8.4.0.0

interface

uses
    System.SysUtils,
    System.Classes,
    Vcl.Controls,
    Data.DB,
    uniGUIClasses,
    uconsts,
    uniPanel,
    uniEdit,
    uniDBEdit,
    uniLabel,
    uniHTMLFrame,
    UniSpeedButton,
    uniBitBtn,
    uniButton
    ;

    procedure renderControl_HtmlRequired( pForm : TObject; var oEdit : TUniControl );
    procedure renderControl_EditAndBtn( var oEdit : TUniControl; var oBtn : TUniSpeedButton; iEditOffSet : integer );
    function renderControl_BtnType( var oEdit : TUniControl; var oBtn : TUniSpeedButton; pDefaultIcon : string ) : integer;
    function renderControl_BtnType_InputAddOn( var oEdit : TUniControl; var oBtn : TUniSpeedButton; pDefaultIcon : string ) : integer;
    procedure renderControl_LINK( pForm : TObject; var cHint : string; oControl : TUniControl );
    procedure renderControl_CLIPBOARD( pForm : TObject; var cHint : string; oControl : TUniControl );
    procedure renderControl_DIAL( pForm : TObject; var cHint : string; oControl : TUniControl );
    procedure renderControl_MAIL( pForm : TObject; var cHint : string; oControl : TUniControl );
    procedure renderControl_INPUTADDON( pForm : TObject; var cHint : string; oControl : TUniControl );
    procedure renderControl_BTNGROUP( pForm : TObject; var cHint : string; oControl : TUniControl );
    procedure renderControl_BUTTONS_ATTR( pForm : TObject; var cHint : string; oControl : TUniControl );

implementation

uses untdm_rc, mkm_func_web, MainModule, mkm_layout, str_func;

function renderControl_BtnType( var oEdit : TUniControl; var oBtn : TUniSpeedButton; pDefaultIcon : string ) : integer;
var
   BtnType,BtnTypeCls, BtnTypeClsIco,BtnTypeIco:string;
   iBtnTypeOffSet : integer;
begin
   try
      iBtnTypeOffSet     := 0;
      BtnType            := rc_GetHintAttr( 'btntype:', TUniControl( oEdit ).Hint );
      BtnTypeIco         := rc_GetHintAttr( 'btntypeico:', TUniControl( oEdit ).Hint );
      BtnTypeCls         := rc_GetHintAttr( 'btntypecls:', TUniControl( oEdit ).Hint );
      BtnTypeClsIco      := rc_GetHintAttr( 'btntypeclsico:', TUniControl( oEdit ).Hint );
      If BtnTypeCls = '' then
         BtnTypeCls := 'ButtonThemeCrud';
      If BtnType <> '' then
      begin
         iBtnTypeOffSet := 2;
         if ( Pos( 'outline', BtnType ) > 0 ) then //or
            //( Pos( 'trigger', BtnType ) > 0 ) then //theme outline
         begin
            BtnTypeClsIco := 'color-themecrud';
            iBtnTypeOffSet := 3;
         end
         else
         //If ( BtnType <> 'theme' ) or ( Pos( 'trigger', BtnType ) > 0 ) then
         If ( BtnType <> 'theme' ) then
            BtnTypeClsIco := 'color-gray-light'
         else
            BtnTypeClsIco := 'color-white';
      end;
      If BtnTypeClsIco <> '' then
         BtnTypeClsIco := '|cls-ico:' + BtnTypeClsIco;
      If BtnTypeIco = '' then
         BtnTypeIco := 'ico:' + pDefaultIcon;

      if BtnType <> '' then
      begin
         if Pos( 'theme', BtnType ) > 0 then
         begin
            if Pos( 'outline', BtnType ) = 0 then
               BtnTypeCls := 'ButtonCrudNoHover button-no-border-left'
            else
               BtnTypeCls := 'ButtonCrudOutlineNoHover button-no-border-radius-left';// btn-no-border-left';
         end
         else
         if Pos( 'gray', BtnType ) > 0 then
            BtnTypeCls := 'ButtonGrayLightNoHover button-no-border-left'
         else
//         if Pos( 'trigger', BtnType ) > 0 then
//            BtnTypeCls := 'ButtonTrigger button-no-border-radius-left' // border-edit-right-trigger
//         else
         if BtnType = 'white' then
            BtnTypeCls := 'ButtonWhiteLightNoHover button-no-border-left';
//         if Pos( 'trigger', BtnType ) > 0 then
//         begin
//            TUniControl( oEdit ).Hint := rc_AddHintAttr( '|focus-color:border|', TUniControl( oEdit ).Hint, false );
//            rc_AddCssClass( TUniControl( oEdit ), 'border-edit-right-trigger' );
//         end
//         else
            rc_AddCssClass( TUniControl( oEdit ), 'border-edit-right' );
      end;
      oBtn.Hint := '[[cls:' + BtnTypeCls + '|' + BtnTypeIco + BtnTypeClsIco;
      Result := iBtnTypeOffSet;
   except on e:exception do
      raise Exception.Create('Error On renderControl_BtnType.' + sLineBreak + e.Message);
   end;
end;

function renderControl_BtnType_InputAddOn( var oEdit : TUniControl; var oBtn : TUniSpeedButton; pDefaultIcon : string ) : integer;
var
   BtnType,BtnTypeCls, BtnTypeClsIco,BtnTypeIco:string;
   iBtnTypeOffSet : integer;
begin
   try
      iBtnTypeOffSet     := 0;
      BtnType            := rc_GetHintAttr( 'btntype:', TUniControl( oEdit ).Hint );
      BtnTypeIco         := rc_GetHintAttr( 'btntypeico:', TUniControl( oEdit ).Hint );
      BtnTypeCls         := rc_GetHintAttr( 'btntypecls:', TUniControl( oEdit ).Hint );
      BtnTypeClsIco      := rc_GetHintAttr( 'btntypeclsico:', TUniControl( oEdit ).Hint );
      If BtnTypeCls = '' then
         BtnTypeCls := 'ButtonThemeCrud';
      If BtnType <> '' then
      begin
         iBtnTypeOffSet := 2;
         if Pos( 'outline', BtnType ) > 0 then //theme outline
         begin
            BtnTypeClsIco := 'color-themecrud';
            iBtnTypeOffSet := 3;
         end
         else
         If ( BtnType <> 'theme' ) then //or ( BtnType = 'trigger' ) then
            BtnTypeClsIco := 'color-gray-light'  //cls-bg:ButtonThemeCrud cls-label:color-white
         else
            BtnTypeClsIco := 'color-white';
      end;
      If BtnTypeClsIco <> '' then
         BtnTypeClsIco := '|cls-ico:' + BtnTypeClsIco;
      If BtnTypeIco = '' then
         BtnTypeIco := 'ico:' + pDefaultIcon;

      if BtnType <> '' then
      begin
         if Pos( 'theme', BtnType ) > 0 then
         begin
            if Pos( 'outline', BtnType ) = 0 then
               BtnTypeCls := 'ButtonCrudNoHover button-no-border-left'
            else
               BtnTypeCls := 'ButtonCrudOutlineNoHover button-no-border-radius-left';// btn-no-border-left';
         end
         else
         if Pos( 'gray', BtnType ) > 0 then
         begin
            BtnTypeCls := 'ButtonGrayLightNoHover button-no-border-left';
         end
         else
         if BtnType = 'white' then
            BtnTypeCls := 'ButtonWhiteLightNoHover button-no-border-left';
//         else
//         if BtnType = 'trigger' then
//            BtnTypeCls := 'ButtonTrigger button-no-border-left';

         rc_AddCssClass( TUniControl( oEdit ), 'border-edit-right' );
      end;
      oBtn.Hint := '[[cls:' + BtnTypeCls + '|' + BtnTypeIco + BtnTypeClsIco;
      Result := iBtnTypeOffSet;
   except on e:exception do
      raise Exception.Create('Error On renderControl_BtnType_InputAddOn.' + sLineBreak + e.Message);
   end;
end;

procedure renderControl_EditAndBtn( var oEdit : TUniControl; var oBtn : TUniSpeedButton; iEditOffSet : integer );
begin
   try
      if TUniControl( oEdit ).Height <= 34 then
      begin
         TUniControl( oEdit ).Width := TUniControl( oEdit ).Width - 27 + iEditOffSet;
         oBtn.Width  := 25;
      end
      else
      begin
         TUniControl( oEdit ).Width := TUniControl( oEdit ).Width - 35 + iEditOffSet;
         oBtn.Width  := 33;
      end;

      oBtn.TabStop:= false;
      oBtn.Left   := TUniControl( oEdit ).Left + TUniControl( oEdit ).Width + 2 - iEditOffSet;
      oBtn.Top    := TUniControl( oEdit ).Top ;
      oBtn.Height := TUniControl( oEdit ).Height;

      //oBtn.Font.Name := DEFAULT_FONT_NAME;
      //oBtn.Font.Size := DEAFULT_BTN_EDT_FONT_SIZE;
      oBtn.Font.Size := TUniEdit( oEdit ).Font.Size ;
      oBtn.Alignment := taCenter;

      if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
         oBtn.Font.Name    := TUniEdit( oEdit ).Font.Name;
   except on e:exception do
      raise Exception.Create('Error On renderControl_EditAndButton.' + sLineBreak + e.Message);
   end;
end;

procedure renderControl_HtmlRequired( pForm : TObject; var oEdit : TUniControl );
var
   oHtmlFrm : TUniHtmlFrame;
begin
   try
      oHtmlFrm := TUniHTMLFrame( TComponent(pForm).FindComponent('rc__Required' + TUniControl( oEdit ).Name) );
      if oHtmlFrm <> nil then
      begin
         if TUniControl( oEdit ).Height <= 34 then
            oHtmlFrm.Left := oHtmlFrm.Left - 25
         else
            oHtmlFrm.Left := oHtmlFrm.Left - 33;
      end;
      oHtmlFrm := nil;
   except on e:exception do
      raise Exception.Create('Error On renderControl_HtmlRequired.' + sLineBreak + e.Message);
   end;
end;

procedure renderControl_LINK( pForm : TObject; var cHint : string; oControl : TUniControl );
var
   cAttr : string;
   oEdit : TUniControl;
   iBtnTypeOffSet : integer;
   oBtn : TUniSpeedButton;
begin
   try
      cAttr := rc_GetHintAttr( 'link:' , cHint );
      If Pos( 'btntype:trigger', cHint ) > 0 then
      begin
           TUniEdit( oControl ).Triggers.Clear;
           TUniEdit( oControl ).Triggers.Add;
           TUniEdit( oControl ).Triggers.Items[0].IconCls := 'fas fa-link';
           TUniEdit( oControl ).Triggers.Items[0].HandleClicks := true;
           TUniEdit( oControl ).OnTriggerEvent := dm_rc.DynamicOnTriggerEvent;
           rc_AddCssClass( oControl, 'rc-form-trigger-faws' );
      end
      else
      begin
         oBtn  := TUniSpeedButton( TComponent(pForm).FindComponent( 'rcBtnLink_' + oControl.Name ) );
         if oBtn = nil then
         begin
            oBtn              := TUniSpeedButton.Create( TComponent(pForm) );
            oBtn.Parent       := oControl.Parent;
            oBtn.Name         := 'rcBtnLink_' + oControl.Name;
            // se estiver dentro de um bloco 'responsivo'...
            if Pos( 'rcblock', lowercase( oBtn.Parent.Name ) ) > 0 then
               oBtn.Anchors   := [akTop,akRight];
            //define o layout do botão
            iBtnTypeOffSet := renderControl_BtnType( oControl, oBtn, 'fas-link' );
            //completa o novo "hint" do botão
            oBtn.Hint := oBtn.Hint + ' | link:' + cAttr + ']]';
            //desativa o "foco" do botão
            rc_FocusBlur ( oBtn );
            //ajusta as dimensões do "edit" e botão
            renderControl_EditAndBtn( oControl, oBtn, iBtnTypeOffSet );
            //renderiza o "*" do "required" se houver
            renderControl_HtmlRequired( pForm, oControl );
         end;
      end;
   except on e:exception do
      raise Exception.Create('Error On renderControl_LINK.' + sLineBreak + e.Message);
   end;
end;

procedure renderControl_CLIPBOARD( pForm : TObject; var cHint : string; oControl : TUniControl );
var
   cAttr : string;
   iBtnTypeOffSet : integer;
   oBtn : TUniSpeedButton;
begin
   try
      cAttr := rc_GetHintAttr( 'clipboard:' , cHint );
      If Pos( 'btntype:trigger', cHint ) > 0 then
      begin
           TUniEdit( oControl ).Triggers.Clear;
           TUniEdit( oControl ).Triggers.Add;
           TUniEdit( oControl ).Triggers.Items[0].IconCls := 'fas fa-copy';
           TUniEdit( oControl ).Triggers.Items[0].HandleClicks := true;
           TUniEdit( oControl ).OnTriggerEvent := dm_rc.DynamicOnTriggerEvent;
           rc_AddCssClass( oControl, 'rc-form-trigger-faws' );
      end
      else
      begin
         oBtn  := TUniSpeedButton( TComponent(pForm).FindComponent( 'rcBtnClipboard_' + TUniControl( oControl ).Name ) );
         if oBtn = nil then
         begin
            oBtn              := TUniSpeedButton.Create( TComponent(pForm) );
            oBtn.Parent       := oControl.Parent;
            oBtn.Name         := 'rcBtnClipboard_' + oControl.Name;
            // se estiver dentro de um bloco 'responsivo'...
            if Pos( 'rcblock', lowercase( oBtn.Parent.Name ) ) > 0 then
               oBtn.Anchors   := [akTop,akRight];
            //define o layout do botão
            iBtnTypeOffSet := renderControl_BtnType( oControl, oBtn, 'fas-copy' );
            //completa o novo "hint" do botão
            oBtn.Hint := oBtn.Hint + ' | clipboard: ]]';
            //
            // novo clipboard.js
            //UniSession.AddJS( 'document.getElementById(' + oBtn.JSId + ').setAttribute( ''data-clipboard-text'' , ' + TUniEdit( oEdit ).Text + ' );' );
            //rc_AddCssClass( oBtn, 'rc_BtnClipBrd' );// '_btnClipBrd' + oEdit.Name  );
            //UniSession.AddJS( 'new ClipboardJS(''.rc_BtnClipBrd'');' ); // ' + QuotedStr('._btnClipBrd' + oEdit.Name ) + ');' );
            //class="btn" data-clipboard-target="#foo"
            //UniSession.AddJS( 'document.getElementById(' + oBtn.JSId + ').setAttribute( ''data-clipboard-target'' , ' + TUniEdit( oEdit ).JSId + ' );' );
            //
            //desativa o "foco" do botão
            rc_FocusBlur ( oBtn );
            //ajusta as dimensões do "edit" e botão
            renderControl_EditAndBtn( oControl, oBtn, iBtnTypeOffSet );
            //renderiza o "*" do "required" se houver
            renderControl_HtmlRequired( pForm, oControl );
         end;
      end;
   except on e:exception do
      raise Exception.Create('Error On renderControl_CLIPBOARD.' + sLineBreak + e.Message);
   end;
end;

procedure renderControl_DIAL( pForm : TObject; var cHint : string; oControl : TUniControl );
var
   cAttr : string;
   iBtnTypeOffSet : integer;
   oBtn : TUniSpeedButton;
begin
   try
      cAttr := rc_GetHintAttr( 'dial:' , cHint );
      If Pos( 'btntype:trigger', cHint ) > 0 then
      begin
           TUniEdit( oControl ).Triggers.Clear;
           TUniEdit( oControl ).Triggers.Add;
           TUniEdit( oControl ).Triggers.Items[0].IconCls := 'fas fa-phone';
           TUniEdit( oControl ).Triggers.Items[0].HandleClicks := true;
           TUniEdit( oControl ).OnTriggerEvent := dm_rc.DynamicOnTriggerEvent;
           rc_AddCssClass( oControl, 'rc-form-trigger-faws' );
      end
      else
      begin
         oBtn  := TUniSpeedButton( TComponent(pForm).FindComponent( 'rcBtnPhone_' + oControl.Name ) );
         if oBtn = nil then
         begin
            oBtn              := TUniSpeedButton.Create( TComponent(pForm) );
            oBtn.Parent       := oControl.Parent;
            oBtn.Name         := 'rcBtnPhone_' + oControl.Name;
            // se estiver dentro de um bloco 'responsivo'...
            if Pos( 'rcblock', lowercase( oBtn.Parent.Name ) ) > 0 then
               oBtn.Anchors   := [akTop,akRight];
            //define o layout do botão
            iBtnTypeOffSet := renderControl_BtnType( oControl, oBtn, 'fas-phone' );
            //completa o novo "hint" do botão
            oBtn.Hint := oBtn.Hint + ' | dial:' + cAttr + ']]';
            //desativa o "foco" do botão
            rc_FocusBlur ( oBtn );
            //ajusta as dimensões do "edit" e botão
            renderControl_EditAndBtn( oControl, oBtn, iBtnTypeOffSet );
            //renderiza o "*" do "required" se houver
            renderControl_HtmlRequired( pForm, oControl );
         end;
      end;
   except on e:exception do
      raise Exception.Create('Error On renderControl_DIAL.' + sLineBreak + e.Message);
   end;
end;

procedure renderControl_MAIL( pForm : TObject; var cHint : string; oControl : TUniControl );
var
   cAttr : string;
   iBtnTypeOffSet : integer;
   oBtn : TUniSpeedButton;
begin
   try
      cAttr := rc_GetHintAttr( 'mail:' , cHint );
      If Pos( 'btntype:trigger', cHint ) > 0 then
      begin
           TUniEdit( oControl ).Triggers.Clear;
           TUniEdit( oControl ).Triggers.Add;
           TUniEdit( oControl ).Triggers.Items[0].IconCls := 'fas fa-envelope';
           TUniEdit( oControl ).Triggers.Items[0].HandleClicks := true;
           TUniEdit( oControl ).OnTriggerEvent := dm_rc.DynamicOnTriggerEvent;
           rc_AddCssClass( oControl, 'rc-form-trigger-faws' );
      end
      else
      begin
         oBtn  := TUniSpeedButton( TComponent(pForm).FindComponent( 'rcBtnEmail_' + oControl.Name ) );
         if oBtn = nil then
         begin
            oBtn              := TUniSpeedButton.Create( TComponent(pForm) );
            oBtn.Parent       := oControl.Parent;
            oBtn.Name         := 'rcBtnEmail_' + oControl.Name;
            // se estiver dentro de um bloco 'responsivo'...
            if Pos( 'rcblock', lowercase( oBtn.Parent.Name ) ) > 0 then
               oBtn.Anchors   := [akTop,akRight];
            //define o layout do botão
            iBtnTypeOffSet := renderControl_BtnType( oControl, oBtn, 'fas-envelope' );
            //completa o novo "hint" do botão
            oBtn.Hint := oBtn.Hint + ' | mail:' + cAttr + ']]';
            //desativa o "foco" do botão
            rc_FocusBlur ( oBtn );
            //ajusta as dimensões do "edit" e botão
            renderControl_EditAndBtn( oControl, oBtn, iBtnTypeOffSet );
            //renderiza o "*" do "required" se houver
            renderControl_HtmlRequired( pForm, oControl );
         end;
      end;
   except on e:exception do
      raise Exception.Create('Error On renderControl_MAIL.' + sLineBreak + e.Message);
   end;
end;

procedure renderControl_INPUTADDON( pForm : TObject; var cHint : string; oControl : TUniControl );
var
   cLink : string;
   cTemp3, cTemp4,
   cParam1, cParam2, cParam3, cParam4, cParam5, cParam6, cParam7, cTmp : string;
   oEdit, oControlParent, oBlock, oBlock2 : TUniControl;
   oLabel : TUniLabel;
   BtnType,BtnTypeCls, BtnTypeClsIco,BtnTypeIco:string;
   iBtnTypeOffSet : integer;
begin
   try
      // input-addon:R$ side:left cls:default
      oBlock  := nil;
      oBlock2 := nil;
      cTemp3 := rc_GetHintAttr( 'input-addon:' , cHint );
      if cTemp3 <> '' then
      begin
         //8.3.0.0
         cTemp3 := StringReplace( cTemp3, 'type:theme', 'cls-bg:ButtonThemeCrud cls-label:color-white', [rfReplaceAll]  );
         cTemp3 := StringReplace( cTemp3, 'type:outline', 'cls-bg:ButtonThemeCrudOutline cls-label:color-themecrud', [rfReplaceAll]  );
         cTemp3 := StringReplace( cTemp3, 'type:white', 'cls-bg:color-silver bg-white cls-label:color-gray-light', [rfReplaceAll]  );

         cTemp4  := Copy( cTemp3 + ' ', 1, Pos( ' ', cTemp3 + ' ' ) - 1 );
         cParam1 := rc_GetHintAttr( 'side:' , cTemp3, true );
         cParam2 := rc_GetHintAttr( 'cls-bg:' , cTemp3, true );
         cParam6 := rc_GetHintAttr( 'cls-label:' , cTemp3, true );
         cParam7 := rc_GetHintAttr( 'color:' , cTemp3, true );
         if cTemp4 = 'spin' then
         begin
           cParam3 := rc_GetHintAttr( 'step:' , cTemp3, true );
           cParam4 := rc_GetHintAttr( 'min:' , cTemp3, true );
           cParam5 := rc_GetHintAttr( 'max:' , cTemp3, true );
           cTemp3  := StringReplace( cTemp3, 'step:' + cParam3, '', [rfReplaceAll] );
           cTemp3  := StringReplace( cTemp3, 'min:' + cParam4, '', [rfReplaceAll] );
           cTemp3  := Trim( StringReplace( cTemp3, 'max:' + cParam5, '', [rfReplaceAll] ) );
         end;
         cTemp3  := StringReplace( cTemp3, 'side:' + cParam1, '', [rfReplaceAll] );
         cTemp3  := Trim( StringReplace( cTemp3, 'cls-bg:' + cParam2, '', [rfReplaceAll] ) );
         cTemp3  := Trim( StringReplace( cTemp3, 'cls-label:' + cParam6, '', [rfReplaceAll] ) );
         cTemp3  := Trim( StringReplace( cTemp3, 'color:' + cParam7, '', [rfReplaceAll] ) );

         oEdit   := oControl;
         oControlParent := TUniControl(oControl.Parent);

         oBlock  := TUniContainerPanel( TComponent(pForm).FindComponent( 'rcPaInputAddon_' + cParam1 + oEdit.Name ) );
         if oBlock = nil then
         begin
            oBlock        := TUniContainerPanel.Create( TComponent(pForm) );
            oBlock.Parent := oControlParent;
            oBlock.Name   := 'rcPaInputAddon_' + cParam1 + oEdit.Name;
            oBlock.Height := oEdit.Height;
            oBlock.Top    := oEdit.Top;
            if oEdit.Height <= 34 then
               oBlock.Width := 25
            else
               oBlock.Width := 33;

            //if oEdit.Height <= 34 then
            oEdit.Width := oEdit.Width - oBlock.Width;
            //else
            //   oEdit.Width := oEdit.Width - 33;
            oBlock.ClientEvents.ExtEvents.Values['click'] :=
               'function click(sender, eOpts) ' +
               '{ ' +
               //'  console.log("clicked...");' +
               '  ajaxRequest( MainForm.htmlFrame, "_getXYLookup" , ' + // 6.0.0.0
               '    ["x=" + ' + oEdit.JSName + '.getEl().getLeft(), ' +
               '     "y=" + ' + oEdit.JSName + '.getEl().getTop() ,' +
               '     "h=" + ' + oEdit.JSName + '.getEl().getHeight() ,' +
               '     "w=" + ' + oEdit.JSName + '.getEl().getWidth() ]);' +
               '} ';
         end;
         if oBlock <> nil then
         begin
            //tratar novo "btntype:"...

            oBlock.Hint := '[[rc-tpicker:' + oEdit.Owner.Name + ' ' + oEdit.Name;
            if ( cParam2='default' ) or ( cParam2='' )then
            begin
               cParam2      := 'color-silver';//GetWebColor( mm.CONFIG_LAYOUT_EDIT_BORDER_COLOR );// 'color-silver-light';
               oBlock.Color := rc_HtmlToColor( color_bs_gray_200 );// clWebLightgrey;
            end;
            If ( cParam1 = 'left' ) or ( cTemp4 = 'spin' ) then
            begin
               if ( cTemp4 = 'spin' ) then
               begin
                  If ( oControl is TUniCustomDBEdit ) or ( oControl is TUniCustomNumberEdit ) then
                     rc_AddCssClass( oEdit, 'border-edit-left-right' )
                  else
                     oEdit.Hint := rc_AddHintAttr( '|cls:border-edit-left-right', oEdit.Hint, false );
                  oEdit.Alignment := taCenter;
               end
               else
               if ( cTemp4 = 'color' ) then
               begin
                  If ( oControl is TUniCustomDBEdit ) or ( oControl is TUniCustomNumberEdit ) then
                     rc_AddCssClass( oEdit, 'border-edit-left rc-edit-inputtype-color' )
                  else
                     oEdit.Hint := rc_AddHintAttr( '|cls:border-edit-left rc-edit-inputtype-color', oEdit.Hint, false );
                  if cParam7 <> '' then
                  begin
                     if ( oEdit is TUniEdit ) then
                        TUniEdit(oEdit).Text := cParam7
                     else
                     if ( oEdit is TUniDBEdit ) then
                     begin
                          if ( TUniDBEdit(oEdit).DataSource <> nil ) and
                             ( TUniDBEdit(oEdit).DataSource.DataSet <> nil ) and
                             ( TUniDBEdit(oEdit).DataSource.DataSet.State in [dsEdit, dsInsert] ) then
                             TDataSet( TUniDBEdit(oEdit).DataSource.DataSet ).FieldByName( TUniDBEdit(oEdit).DataField ).AsString := cParam7;
                     end;
                     //8.5.0.0 Thanks Flavio Dei from Italy( Linux Compile )
                     {$IFDEF MSWINDOWS}
                      oEdit.Update;
                     {$ENDIF}
                  end;
               end
               else
               begin
                  If ( oControl is TUniCustomDBEdit ) or ( oControl is TUniCustomNumberEdit ) then
                     rc_AddCssClass( oEdit, 'border-edit-left' )
                  else
                     oEdit.Hint := rc_AddHintAttr( '|cls:border-edit-left', oEdit.Hint, false )
               end;

               if Pos( 'Outline', oEdit.Hint ) = 0 then
                  oBlock.Hint := oBlock.Hint + '|round:l|border:tbl ' + cParam2
               else
                  oBlock.Hint := oBlock.Hint + '|round:l|border:tbl ' + cParam2 + '|cls:rc-border-right ' + cParam2;

               if not rc_IsBlock( TUniControl( oEdit.Parent ) ) then
               begin
                  oBlock.Left := TUniControl(oEdit).Left;
                  oEdit.Left  := oEdit.Left + oBlock.Width;
               end
               else
               begin
                  oBlock.Left := 0;
                  if Pos( 'Outline', oEdit.Hint ) = 0 then
                     oEdit.Left := oBlock.Width
                  else
                  begin
                     oEdit.Left := oBlock.Width - 1 ;
                     oEdit.Width := oEdit.Width + 1;
                  end;
               end;
               oBlock.Hint := oBlock.Hint + ']]';
            end
            else
            begin
               if ( cTemp4 = 'color' ) then
               begin
                  If ( oControl is TUniCustomDBEdit ) or ( oControl is TUniCustomNumberEdit ) then
                     rc_AddCssClass( oEdit, 'border-edit-right rc-edit-inputtype-color' )
                  else
                     oEdit.Hint := rc_AddHintAttr( '|cls:border-edit-right rc-edit-inputtype-color', oEdit.Hint, false );
               end
               else
               begin
                  If ( oControl is TUniCustomDBEdit ) or ( oControl is TUniCustomNumberEdit ) then
                     rc_AddCssClass( oEdit, 'border-edit-right' )
                  else
                     oEdit.Hint := rc_AddHintAttr( '|cls:border-edit-right', oEdit.Hint, false )
               end;

               if Pos( 'Outline', oEdit.Hint ) = 0 then
                  oBlock.Hint := oBlock.Hint + '|round:r|border:tbr ' + cParam2 + ']]'
               else
                  oBlock.Hint := oBlock.Hint + '|round:r|border:tbr ' + cParam2 + '|cls:rc-border-left ' + cParam2 + ']]';

               oBlock.Left               := oEdit.Width ;
               if Pos( 'Outline', oEdit.Hint ) > 0 then
                  oEdit.Width  := oEdit.Width + 1;

               oBlock.Anchors            := [akRight];
            end;

            oLabel  := TUniLabel( TComponent(pForm).FindComponent( 'rcLabInputAddon_' + cParam1 + oEdit.Name ) );
            if oLabel = nil then
            begin
               oLabel              := TUniLabel.Create( TComponent(pForm) );
               oLabel.Parent       := oBlock;
               oLabel.Name         := 'rcLabInputAddon_' + cParam1 + oEdit.Name;
            end;
            oLabel.AutoSize        := false;
            oLabel.Alignment       := taCenter;
            if oEdit.Height <= 34 then
               oLabel.Width := 25
            else
               oLabel.Width := 33;

            oLabel.Height          := 20;

            oLabel.Hint := '[[center:parent y:2|';

            if ( cParam6 = 'default' ) or ( cParam6 = '' ) then
            begin
               oLabel.Font.Color      := COLOR_GRAY;  //to update font. Why?... I don´t know yet
               oLabel.Hint := oLabel.Hint + 'cls:color-gray-light|' //COLOR_GRAY
            end
            else
            begin
               oLabel.Font.Color      := COLOR_WHITE; //to update font. Why?... I don´t know yet
               oLabel.Hint := oLabel.Hint + 'cls:' + cParam6 + '|'; //clWhite;
            end;

            if cTemp4 = 'color' then
            begin
               cTemp3 := 'fas-palette';
            end
            else
            if cTemp4 = 'spin' then
            begin
               oLabel.Cursor          := crHandPoint;
               cTemp3 := 'fas-minus';
               TUniContainerPanel( oBlock ).OnClick := dm_rc.DynamicInputAddOnSpin;
            end
            else
            if cTemp4 = 'date' then
            begin
               oLabel.Cursor          := crHandPoint;
               cTemp3 := 'fas-calendar-days';
               TUniContainerPanel( oBlock ).OnClick := dm_rc.DynamicInputAddOnShowDatePicker;
            end
            else
            if cTemp4 = 'time' then
            begin
               oLabel.Cursor          := crHandPoint;
               cTemp3 := 'far-clock';
               TUniContainerPanel( oBlock ).OnClick := dm_rc.DynamicInputAddOnShowTimePicker;
            end;

            If Pos( Copy( cTemp3, 1, 4 ), 'fas- far- fad- fab- fat- fass fasr fasl' ) > 0 then
            begin
               oLabel.Hint := oLabel.Hint + 'ico:' + cTemp3 ;
            end
            else
               oLabel.Caption := cTemp3;

            oLabel.Hint := oLabel.Hint + ']]';
         end;
         //spin
         if cTemp4 = 'spin' then
         begin
            oBlock2  := TUniContainerPanel( TComponent(pForm).FindComponent( 'rcPaInputAddonPlus_' + cParam1 + oEdit.Name ) );
            if oBlock2 = nil then
            begin
               oBlock2              := TUniContainerPanel.Create( TComponent(pForm) );
               oBlock2.Parent       := oControlParent;
               oBlock2.Name         := 'rcPaInputAddonPlus_' + cParam1 + oEdit.Name;
               oBlock2.Height := oEdit.Height;
               oBlock2.Top    := oEdit.Top;
               if oEdit.Height <= 34 then
                  oBlock2.Width := 25
               else
                  oBlock2.Width := 33;

               oEdit.Width := oEdit.Width - oBlock2.Width;
               if not rc_IsBlock( TUniControl( oEdit.Parent ) ) then
               begin
                  oBlock2.Left := oEdit.Left + oEdit.Width ;
               end
               else
                  oBlock2.Left               := oEdit.Width + oBlock2.Width;// 33;

   //            if Pos( 'Outline', oEdit.Hint ) > 0 then
   //            begin
   //               oEdit.Left := oEdit.Left - 1;
   //               oEdit.Width := oEdit.Width + 2;
   //               //oBlock2.Left := oBlock2.Left - 1;
   //            end;

               oBlock2.ClientEvents.ExtEvents.Values['click'] :=
                  'function click(sender, eOpts) ' +
                  '{ ' +
                  //'  console.log("clicked...");' +
                  '  ajaxRequest( MainForm.htmlFrame, "_getXYLookup" , ' + // 6.0.0.0
                  '    ["x=" + ' + oEdit.JSName + '.getEl().getLeft(), ' +
                  '     "y=" + ' + oEdit.JSName + '.getEl().getTop() ,' +
                  '     "h=" + ' + oEdit.JSName + '.getEl().getHeight() ,' +
                  '     "w=" + ' + oEdit.JSName + '.getEl().getWidth() ]);' +
                  '} ';
            end;
         end;
         if oBlock2 <> nil then
         begin
            oBlock2.Hint := '[[rc-tpicker:' + oEdit.Owner.Name + ' ' + oEdit.Name;
            if ( cParam2='default' ) or ( cParam2='' ) or ( cParam2='color-silver' )then
            begin
               cParam2      := 'color-silver';
               oBlock2.Color := rc_HtmlToColor( color_bs_gray_200 );
            end;
            //oBlock2.Hint               := oBlock2.Hint + '|round:r|border:tbr ' + cParam2 + ']]';
            if Pos( 'Outline', oEdit.Hint ) = 0 then
               oBlock2.Hint := oBlock2.Hint + '|round:r|border:tbr ' + cParam2 + ']]'
            else
               oBlock2.Hint := oBlock2.Hint + '|round:r|border:tbr ' + cParam2 + '|cls:rc-border-left ' + cParam2 + ']]';

            oBlock2.Anchors            := [akTop,akRight];
            oEdit.Left  := oBlock.Left + oBlock.Width;

            if Pos( 'Outline', oEdit.Hint ) > 0 then
            begin
               oEdit.Left := oEdit.Left - 1;
               oEdit.Width := oEdit.Width + 2;
               //oBlock2.Left := oBlock2.Left - 1;
            end;

            oLabel  := TUniLabel( TComponent(pForm).FindComponent( 'rcLabInputAddonPlus_' + cParam1 + oEdit.Name ) );
            if oLabel = nil then
            begin
               oLabel              := TUniLabel.Create( TComponent(pForm) );
               oLabel.Parent       := oBlock2;
               oLabel.Name         := 'rcLabInputAddonPlus_' + cParam1 + oEdit.Name;
            end;
            oLabel.AutoSize        := false;
            oLabel.Alignment       := taCenter;
            if oEdit.Height <= 34 then
               oLabel.Width := 25
            else
               oLabel.Width := 33;

            oLabel.Height          := 20;

            oLabel.Hint := '[[center:parent y:2|';

            if ( cParam6 = 'default' ) or ( cParam6 = '' ) then
            begin
               oLabel.Font.Color      := COLOR_GRAY;  //to update font. Why?... I don´t know yet
               oLabel.Hint := oLabel.Hint + 'cls:color-gray-light|' //COLOR_GRAY
            end
            else
            begin
               oLabel.Font.Color      := COLOR_WHITE; //to update font. Why?... I don´t know yet
               oLabel.Hint := oLabel.Hint + 'cls:' + cParam6 + '|'; //clWhite;
            end;
            oLabel.Cursor          := crHandPoint;

            cTemp3 := 'fas-plus';
            TUniContainerPanel( oBlock2 ).OnClick := dm_rc.DynamicInputAddOnSpin;

            If Pos( Copy( cTemp3, 1, 4 ), 'fas- far- fad- fab- fat- fass fasr fasl' ) > 0 then
            begin
               oLabel.Hint := oLabel.Hint + 'ico:' + cTemp3 ;
            end
            else
               oLabel.Caption := cTemp3;

            oLabel.Hint := oLabel.Hint + ']]';
         end;
         cParam1 := '';
         cParam2 := '';
         cParam3 := '';
         cParam4 := '';
         cParam5 := '';
         cParam6 := '';
         cParam7 := '';
         cTemp3 := '';
         cTemp4 := '';
         oBlock := nil;
         oBlock2 := nil;
         oLabel := nil;
      end;
   except on e:exception do
      raise Exception.Create('Error On renderControl_INPUTADDON.' + sLineBreak + e.Message);
   end;
end;

procedure renderControl_BTNGROUP( pForm : TObject; var cHint : string; oControl : TUniControl );
var
   BtnType,BtnTypeCls, BtnTypeClsIco,BtnTypeIco:string;
   r, iOccurs : integer;
   iOccursPercent, iOccursPercentTotal: Double;
   cTemp2, cTemp3,
   cParam1,cParam2,cParam3,cParam4,cParam5,cParam6 : string;
   oblock,oControlParent : TUniControl;
begin
   try
     //button-group or btn-group
     // button-group:3 cls:ButtonGreen ico:fas-envelope no-focus|
     // button-group:fas-envelope cls:ButtonGreen no-focus|
     iOccurs := Occurs( 'button-group:', cHint );
     if iOccurs = 0 then
        iOccurs := Occurs( 'btn-group:', cHint );
     if iOccurs > 0 then
     begin
        oControlParent := TUniContainerPanel(oControl.Parent);
        oControl.Left := 0;
        oControl.Top  := 0;
        oControl.Anchors := [akLeft,akTop,akRight];
        oControl.Width := oControlParent.Width;
        for r := 0 to Pred(iOccurs) do
        begin
           cTemp3 := rc_GetHintAttr( 'button-group:' , cHint );
           if cTemp3 = '' then
              cTemp3 := rc_GetHintAttr( 'btn-group:' , cHint );
           if cTemp3 <> '' then
           begin
              cParam1 := '';
              cParam4 := '';
              cParam5 := '';
              cTemp2  := cTemp3;

              cParam6 := rc_GetHintAttr( 'caption:' , cTemp3 , true );
              cTemp3  := Trim( StringReplace( cTemp3, 'caption:' + cParam6, '', [rfReplaceAll] ) );

              if Pos( 'focus:off', cTemp3 ) > 0 then
              begin
                 cParam4 := 'no-focus';
                 cTemp3  := StringReplace( cTemp3, ' focus:off', '', [rfReplaceAll] );
              end;
              //7.4.0.0
              if Pos( 'dir:down', cTemp3 ) > 0 then
              begin
                 cParam5 := 'down';
                 cTemp3  := StringReplace( cTemp3, ' dir:down', '', [rfReplaceAll] );
              end;
              if r > 0 then
                 cParam1 := r.ToString;
              cParam2 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 ); //icon
              cParam3 := rc_GetHintAttr( 'cls:' , cTemp3, true );
              cTemp3  := Trim( StringReplace( cTemp3, 'cls:' + cParam3, '', [rfReplaceAll] ) );
              //for r := 1 to StrToIntDef( cParam1, 0 ) do
              begin
                 //oEdit   := oControl;
                 //oControlParent := TUniContainerPanel(oControl.Parent);
                 oBlock  := TUniBitBtn( TComponent(pForm).FindComponent( oControl.Name + cParam1 ) );
                 if oBlock = nil then
                 begin
                    oBlock        := TUniBitBtn.Create( TComponent(pForm) );
                    oBlock.Parent := oControlParent;
                    oBlock.Name   := oControl.Name + cParam1;
                 end;

                 if oBlock <> nil then
                 begin
                    TUniBitBtn(oBlock).OnClick := TUniBitBtn(oControl).OnClick;
                    oBlock.Height := oControl.Height;
                    oBlock.Top    := oControl.Top;
                    oBlock.Left   := 0;
                    TUniBitBtn(oBlock).Font := TUniBitBtn(oControl).Font;
                    oBlock.Hint := '[[ico:' + cParam2 + '|cls:' + cParam3;// oControl.Hint;
                    if cParam4 = 'no-focus' then
                    begin
                       oBlock.ClientEvents.ExtEvents.Values['click'] :=
                          'function click(sender, eOpts) ' +
                          '{ ' +
                          '  sender.blur();' +
                          '} ';
                    end;
                    if cParam5 <> 'down' then
                    begin
                       if r = 0 then
                          oBlock.Hint := oBlock.Hint + ' button-no-border-right'
                       else
                       if r = iOccurs - 1 then
                          oBlock.Hint := oBlock.Hint + ' button-no-border-left'
                       else
                          oBlock.Hint := oBlock.Hint + ' button-no-border-left-right';
                       if r = iOccurs then
                       begin
                          oBlock.Align            := alClient;
                          oBlock.Margins.Left     := 1;
                          oBlock.Margins.Right    := 0;
                          oBlock.Margins.Top      := 0;
                          oBlock.Margins.Bottom   := 0;
                       end
                       else
                       begin
                          oBlock.Align  := alLeft;
                          oBlock.Margins.Left     := 0;
                          oBlock.Margins.Right    := 1;
                          oBlock.Margins.Top      := 0;
                          oBlock.Margins.Bottom   := 0;
                       end;
                       oBlock.AlignWithMargins := True;

                       iOccursPercent := ( 100 / iOccurs );
                       iOccursPercentTotal := StrToFloat_Universal( Copy( iOccursPercent.ToString, 1, 5 ) ) * iOccurs;
                       iOccursPercent      := StrToFloat_Universal( Copy( iOccursPercent.ToString, 1, 5 ) );
                       iOccursPercentTotal := ( 100-iOccursPercentTotal ) + iOccursPercent;
                       if r = iOccurs then
                          oBlock.Hint := oBlock.Hint + '|scale:parent w:' + StringReplace(( iOccursPercentTotal.ToString ), ',','.',[rfReplaceAll]) + '%'
                       else
                          oBlock.Hint := oBlock.Hint + '|scale:parent w:' + StringReplace(( iOccursPercent.ToString ), ',','.',[rfReplaceAll]) + '%';
                    end
                    else
                    begin
                       if r = 0 then
                       begin
                          oBlock.Hint := oBlock.Hint + ' button-no-border-bottom';
                       end
                       else
                       begin
                          if r = iOccurs - 1 then
                          begin
                             oBlock.Hint := oBlock.Hint + ' button-no-border-top';
                          end
                          else
                          begin
                             oBlock.Hint := oBlock.Hint + ' button-no-border-top-bottom';
                          end;
                          oControlParent.Height := oControlParent.Height + oBlock.Height;
                          oBlock.top := oControlParent.Height - oBlock.Height - 1;
                          if r > 1 then
                             oBlock.top := oBlock.Top + 1;
                          oBlock.Anchors := [akLeft,akTop,akRight];
                          oBlock.Width := oControlParent.Width;
                       end;
                    end;
                    if cParam6 <> '' then
                    begin
                       oBlock.Caption := cParam6;
                       oBlock.Hint := oBlock.Hint + '|append';
                    end;
                    oBlock.Hint := oBlock.Hint + ']]';
                    dm_rc.rc_RenderControls( pform, oBlock );
                 end;
              end;
              cHint := StringReplace( cHint, 'button-group:' + cTemp2, '', [rfReplaceAll] );
              cHint := StringReplace( cHint, 'btn-group:' + cTemp2, '', [rfReplaceAll] );
              cTemp3 := rc_GetHintAttr( 'button-group:' , cHint );
              if cTemp3 = '' then
                 cTemp3 := rc_GetHintAttr( 'btn-group:' , cHint );
           end
           else
           begin
             Break;
           end;
        end;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderControl_BTNGROUP.' + sLineBreak + e.Message);
   end;
end;

procedure renderControl_BUTTONS_ATTR( pForm : TObject; var cHint : string; oControl : TUniControl );
var
   cHintDefault,pTypeButton,BtnType,BtnTypeCls, BtnTypeClsIco,BtnTypeIco:string;
   r, iOccurs,iPos2,iZoom,iPOs : integer;
   iOccursPercent, iOccursPercentTotal: Double;
   cCmd,cTmp,cTemp,cTemp2, cTemp3,cTemp4,
   cCaption,
   cField,FieldValue1,
   cClass,cClassCaption,cIco,cClassIco,cBadge,cBadgeColor,cIcoPOsition,cIcoImg,
   cParam1,cParam2,cParam3,cParam4,cParam5,cParam6 : string;
   oblock,oControlParent : TUniControl;
   bAppend : boolean;
begin
   try
     cHintDefault := cHint;

     if Trim( cHint ) <> '' then
        cTemp2 := cHint + '|';
     cCmd := cTemp2;
     iPos2 := Pos( '|' , cTemp2 );
     if ( iPos2 > 0 ) then
     begin
        cTemp  := Trim( Copy( cCmd, 1 , iPos2 ) );
        cTemp2 := Trim( StringReplace( cCmd, cTemp, '', [rfReplaceAll] ) );
        cCmd   := cTemp2;
        cTemp  := StringReplace( cTemp, '|', '', [rfReplaceAll] ) + ' ';
        cTemp  := cHint;

        // append caption if exists
        if not bAppend then
           bAppend := rc_AttrExists( 'append', cCmd ); //8.0.0.0

        if Pos( ' up' , cTemp ) >0 then
           cTemp := cTemp;
        if ( rc_AttrExists( 'ico:', cTemp ) ) and ( rc_AttrExists( 'cls-ico:', cTemp ) ) then //8.0.0.0
        begin
             cClass := '';
             cClassCaption := '';
             cIco := rc_GetHintAttr( 'ico:' , cTemp );
        end;

        if rc_AttrExists( 'cls:' , cTemp ) then //8.0.0.0
        begin
             cClass := rc_GetHintAttr( 'cls:' , cTemp );
             cClassCaption := cClass;
        end;

        if rc_AttrExists( 'cls-ico:' , cTemp ) then //8.0.0.0
        begin
             cClassIco := rc_GetHintAttr( 'cls-ico:' , cTemp );
        end;

        if Pos( 'badge:', cTemp ) > 0 then
        begin
           cBadgeColor := rc_GetHintAttr( 'badge:' , cTemp);
           cBadge      := Copy( cBadgeColor, 1, pos( ' ', cBadgeColor ) - 1 );
           cBadgeColor := Copy( cBadgeColor, pos( 'color:', cBadgeColor ) + 6 );
           cBadge      := '<span class="align-btn-caption badge bg-' + cBadgeColor + '">' + cBadge + '</span>'; //7.3.0.0
        end;

        cIcoPosition := '';
        if ( Pos( 'ico:' , cTemp ) > 0 ) then
        begin
             if ( Pos( 'ico-pos:' , cTemp ) > 0 ) then
             begin
                  cIcoPosition := rc_GetHintAttr( 'ico-pos:' , cTemp );
                  rc_AddCssClass( TUniButton( oControl ), 'rc-ico-pos' );
             end;
             cIco := rc_GetHintAttr( 'ico:' , cTemp ) + ' ';
             cIco := Trim( cIco );
             if ( Pos( 'rtl:', cIco ) > 0 ) then
             begin
                  cParam1 := rc_GetHintAttr( 'rtl:' , cIco );
                  if ( mm.rtl ) then
                  begin
                     if cParam1 <> '' then
                     begin
                        rc_AddCssClass( TUniButton( oControl ), cParam1 );
                     end;
                  end;
                  cIco := trim( StringReplace( cIco, 'rtl:' + cParam1, '', [rfReplaceAll] ) );
             end;
        end;
        // 6.0.0.0+
        cIcoImg := '';
        if ( Pos( 'ico-img:' , cTemp ) > 0 ) then
        begin
             if ( Pos( 'ico-pos:' , cTemp ) > 0 ) then
             begin
                  cIcoPosition := rc_GetHintAttr( 'ico-pos:' , cTemp );
                  rc_AddCssClass( TUniButton( oControl ), 'rc-ico-pos' );
             end;
             cIcoImg := rc_GetHintAttr( 'ico-img:' , cTemp ) + ' ';
             cIcoImg := Trim( cIcoImg );
             if ( Pos( 'rtl:', cIcoImg ) > 0 ) then
             begin
                  cParam1 := rc_GetHintAttr( 'rtl:' , cIcoImg );
                  if ( mm.rtl ) then
                  begin
                     if cParam1 <> '' then
                     begin
                        rc_AddCssClass( TUniButton( oControl ), cParam1 );
                     end;
                  end;
                  cIcoImg := trim( StringReplace( cIcoImg, 'rtl:' + cParam1, '', [rfReplaceAll] ) );
             end;
        end;

        cParam1 := '';
        if rc_AttrExists( 'field-ico:', cTemp ) then
        begin
             cTmp := rc_GetHintAttr( 'field-ico:' , cTemp );

             if Pos( ' ds:', cTmp ) > 0 then
                cTmp := Copy( cTmp, 1, Pos( ' ds:', cTmp ) - 1 );

             cField     := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
             //FieldValue := pDS.DataSet.FieldByName( cField ).Value;
             cTmp       := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );

             FieldValue1 := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
             cTmp        := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );
             FieldValue1 := Copy( FieldValue1, 7, 2000 );
             cParam1     := Trim( Copy( FieldValue1, Pos( ':', FieldValue1 ) +1, 2000 ) );
             FieldValue1 := Copy( FieldValue1, 1, Pos( ':', FieldValue1 ) -1 );
             cIco        := cParam1;
        end;

        if ( Pos( 'cls-caption:' , cTemp ) > 0 ) then
        begin
             cClassCaption := cClass + ' ' + rc_GetHintAttr( 'cls-caption:' , cTemp );
        end
        else
            cClassCaption := '';
        //8.0.0.0
        if rc_AttrExists( 'clipboard:', cTemp ) then
           TUniButton( oControl ).OnClick := dm_rc.DynamicOnClickClipBoard
        else
        if rc_AttrExists( 'link:', cTemp ) then
           TUniButton( oControl ).OnClick := dm_rc.DynamicOnClickLink
        else
        if rc_AttrExists( 'dial:', cTemp ) then
           TUniButton( oControl ).OnClick := dm_rc.DynamicOnClickDial
        else
        if rc_AttrExists( 'mail:', cTemp ) then
           TUniButton( oControl ).OnClick := dm_rc.DynamicOnClickMail;

        iPos2 := Pos( '|' , cCmd );
     end;
     // 6.0.0.0
     if trim(cIco) <> '' then
     begin
          cTemp2 := Copy( cIco, Pos( ' ' , cIco ) + 1 , 100 ) ;
          // has a zoom ?
          iZoom := StrToIntDef( ReturnNumbers( cTemp2 ), 0 );
          if iZoom > 0 then
          begin
             cIco := StringReplace( cIco, ' ' + iZoom.ToString + 'x', '', [rfReplaceAll] );
          end;
          if Pos( 'fad-' , cIco )>0 then
             cIco := cIco;
          // icon type
          // 6.0.0.0+fontaws6
          cTemp2   := TUniControl( oControl ).Caption;
          TUniControl( oControl ).Caption := '<i class="' ;
          cIco := rc_AdjustIconsNames( cIco ); //8.2.0.0

          iPos := rc_PosHintAttr( 'caption:' , cHint );
          //8.4.0.0 analisando...
          cCaption := rc_GetHintAttr( 'caption-translate:' , cHint  );

          if ( bAppend ) and ( iPos = 0 ) then
          begin
             cCaption := cTemp2;
             TUniControl( oControl ).Hint := rc_SetHintAttr( cCaption, 'caption:' ,  cHint  ) ;
             cHint := rc_NormalizeHintAttr( TUniControl( oControl ).Hint );
          end
          else
          if iPos > 0 then
          begin
             //8.4.0.0
             if cCaption = '' then
                cCaption := rc_GetHintAttr( 'caption:' ,  cHint  );
             //cCaption := rc_GetHintAttr( 'caption:' ,  cHint  );
          end;
          // append caption if exists
          if bAppend then
          begin
             // 6.0.0.0+fontaws6
             TUniControl( oControl ).Caption := TUniControl( oControl ).Caption +
                   cIco + ' ' + varIIF( iZoom > 0 , 'fa-' + iZoom.ToString + 'x ' , 'fa-lg ' ) + cClassIco + '"></i>';
             // caption-hide                                                      //fa-1x
             //
             // mobile-v  : in MOBILE PORTRAIT MODE
             // mobile-h  : in MOBILE LANDSCAPE MODE
             // mobile    : in MOBILE MODE
             // 6.0.0.0
             cTemp3 := ( rc_GetHintAttr( 'caption-hide:', cHint ) );
             if cTemp3 <> '' then
             begin
                if rc_IsMobile_V( cTemp3 ) then //8.0.0.0
                   cCaption := ''
                else
                if rc_IsMobile_H( cTemp3 ) then //8.0.0.0
                   cCaption := ''
                else
                if rc_IsMobile( cTemp3 ) then //8.0.0.0
                   cCaption := ''
                else
                if rc_IsDesktop( cTemp3 ) then //8.0.0.0
                   cCaption := '';
             end;
             //8.4.0.0 thanks for bugtracker Mr. Marco Antonio
             if cCaption <> '' then
             begin
                //enable "translate:"
                cTemp4 := rc_GetHintAttr( '_translate_:', TUniControl(oControl).Hint );
                TUniControl(oControl).Hint := StringReplace( TUniControl(oControl).Hint, '_translate_:' + cTemp4, 'translate:' + cTemp4, [rfReplaceAll] );

                cTemp4 := 'align-btn-caption';
             end
             else
             begin
                //disable "translate:"
                cTemp4 := rc_GetHintAttr( 'translate:', TUniControl(oControl).Hint );
                TUniControl(oControl).Hint := StringReplace( TUniControl(oControl).Hint, 'translate:' + cTemp4, '_translate_:' + cTemp4, [rfReplaceAll] );

                cTemp4 := 'align-btn-caption-remove';
             end;
             if cClassCaption = '' then
             begin
                if cIcoPosition = 'up' then
                   TUniControl( oControl ).Caption :=
                       TUniControl( oControl ).Caption +
                       '<br>' + '<span class="' + cTemp4 + '">'+ cCaption + cBadge + '</span>'
                else
                if cIcoPosition = 'down' then
                   TUniControl( oControl ).Caption :=
                       '<span class="' + cTemp4 + '">'+ cCaption + cBadge +  '</span>' + '<br>' +
                       TUniControl( oControl ).Caption
                else
                if cIcoPosition = 'right' then
                   TUniControl( oControl ).Caption :=
                       '<span class="' + cTemp4 + '">'+ cCaption + cBadge +  '</span>' + '  ' +
                       TUniControl( oControl ).Caption
                else
                   TUniControl( oControl ).Caption :=
                       TUniControl( oControl ).Caption +
                       '<span class="' + cTemp4 + '">'+ cCaption + cBadge +  '</span>';
             end
             else
             begin
                if cIcoPosition = 'up' then
                   TUniControl( oControl ).Caption :=
                       TUniControl( oControl ).Caption +
                       '<br>' + '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + cBadge +  '</span>'
                else
                if cIcoPosition = 'down' then
                   TUniControl( oControl ).Caption :=
                       '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + cBadge +  '</span>' + '<br>' +
                       TUniControl( oControl ).Caption
                else
                if cIcoPosition = 'right' then
                   TUniControl( oControl ).Caption :=
                       '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + cBadge +  '</span>' + '  ' +
                       TUniControl( oControl ).Caption
                else
                   TUniControl( oControl ).Caption :=
                       TUniControl( oControl ).Caption +
                       '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + cBadge +  '</span>'
             end;
             cBadge := '';
          end
          else
          begin
             // 6.0.0.0+fontaws6
             TUniControl( oControl ).Caption := TUniControl( oControl ).Caption +
                   cIco + ' ' + varIIF( iZoom > 0 , 'fa-' + iZoom.ToString + 'x ' , 'fa-lg ' ) + cClassIco + '"></i>' + cBadge ;
          end;                                                                   //  fa-1x
     end
     else
     if trim(cIcoImg) <> '' then
     begin
          cTemp2 := Copy( cIcoImg, Pos( ' ' , cIcoImg ) + 1 , 100 ) ;
          cTemp2   := TUniControl( oControl ).Caption;

          iPos := rc_PosHintAttr( 'caption:' , cHint );
          if ( bAppend ) and ( iPos = 0 ) then
          begin
             cCaption := cTemp2;
             TUniControl( oControl ).Hint := rc_SetHintAttr( cCaption, 'caption:' ,  cHint  ) ;
             cHint := rc_NormalizeHintAttr( TUniControl( oControl ).Hint );
          end
          else
          if iPos > 0 then
          begin
             cCaption := rc_GetHintAttr( 'caption:' ,  cHint  );
          end;
          // append caption if exists
          if bAppend then
          begin
             //8.0.0.0
             TUniControl( oControl ).Caption :=
                   //'<img id="img-' + TUniControl( oControl ).Name + '" class="" style="height:42px;width:42px;" src="' + cIcoImg + '" alt="' + TUniControl( oControl ).Name + ' Img"><br><span class="">' + cCaption + '</span>';
                   '<img id="img-' + TUniControl( oControl ).Name + '" class="" style="height:2.625rem;width:2.625rem;" src="' + cIcoImg + '" alt="' + TUniControl( oControl ).Name + ' Img"><br><span class="">' + cCaption + '</span>';
                   //( StrToIntDef(cTemp4,0) / 16 ).ToString
             // caption-hide
             //
             // mobile-v  : in MOBILE PORTRAIT MODE
             // mobile-h  : in MOBILE LANDSCAPE MODE
             // mobile    : in MOBILE MODE
             // 6.0.0.0
             cTemp3 := ( rc_GetHintAttr( 'caption-hide:', cHint ) );
             if cTemp3 <> '' then
             begin
                if rc_IsMobile_V( cTemp3 ) then //8.0.0.0
                   cCaption := ''
                else
                if rc_IsMobile_H( cTemp3 ) then //8.0.0.0
                   cCaption := ''
                else
                if rc_IsMobile( cTemp3 ) then //8.0.0.0
                   cCaption := ''
                else
                if rc_IsDesktop( cTemp3 ) then //8.0.0.0
                   cCaption := '';
             end;

             if cCaption <> '' then
                cTemp4 := 'align-btn-caption'
             else
                cTemp4 := 'align-btn-caption-remove';
             if cClassCaption = '' then
             begin
                if cIcoPosition = 'up' then
                   TUniControl( oControl ).Caption :=
                       TUniControl( oControl ).Caption +
                       '<br>' + '<span class="' + cTemp4 + '">'+ cCaption + cBadge + '</span>'
                else
                if cIcoPosition = 'down' then
                   TUniControl( oControl ).Caption :=
                       '<span class="' + cTemp4 + '">'+ cCaption + cBadge +  '</span>' + '<br>' +
                       TUniControl( oControl ).Caption
                else
                if cIcoPosition = 'right' then
                   TUniControl( oControl ).Caption :=
                       '<span class="' + cTemp4 + '">'+ cCaption + cBadge +  '</span>' + '  ' +
                       TUniControl( oControl ).Caption
                else
                   TUniControl( oControl ).Caption :=
                       TUniControl( oControl ).Caption +
                       '<span class="' + cTemp4 + '">'+ cCaption + cBadge +  '</span>';
             end
             else
             begin
                if cIcoPosition = 'up' then
                   TUniControl( oControl ).Caption :=
                       TUniControl( oControl ).Caption +
                       '<br>' + '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + cBadge +  '</span>'
                else
                if cIcoPosition = 'down' then
                   TUniControl( oControl ).Caption :=
                       '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + cBadge +  '</span>' + '<br>' +
                       TUniControl( oControl ).Caption
                else
                if cIcoPosition = 'right' then
                   TUniControl( oControl ).Caption :=
                       '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + cBadge +  '</span>' + '  ' +
                       TUniControl( oControl ).Caption
                else
                   TUniControl( oControl ).Caption :=
                       TUniControl( oControl ).Caption +
                       '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + cBadge +  '</span>'
             end;
             cBadge := '';
          end
          else
          begin
             //8.0.0.0
             //TUniControl( oControl ).Caption := '<img id="img-' + TUniControl( oControl ).Name + '" class="" style="height:42px;width:42px;" src="' + cIcoImg + '" alt="' + TUniControl( oControl ).Name + ' Img">';
             TUniControl( oControl ).Caption := '<img id="img-' + TUniControl( oControl ).Name + '" class="" style="height:2.625rem;width:2.625rem;" src="' + cIcoImg + '" alt="' + TUniControl( oControl ).Name + ' Img">';
             //( StrToIntDef(cTemp4,0) / 16 ).ToString
          end;
     end // 6.0.0.0 end;
     else
     if cClassCaption <> '' then
     begin
        cCaption := rc_GetHintAttr( 'caption:' ,  cHint  );
        if cIcoPosition = 'up' then
           TUniControl( oControl ).Caption :=
               TUniControl( oControl ).Caption +
               '<br>' + '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + cBadge +  '</span>'
        else
        if cIcoPosition = 'down' then
           TUniControl( oControl ).Caption :=
               '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + cBadge +  '</span>' + '<br>' +
               TUniControl( oControl ).Caption
        else
        if cIcoPosition = 'right' then
           TUniControl( oControl ).Caption :=
               '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + cBadge +  '</span>' + '  ' +
               TUniControl( oControl ).Caption
        else
           TUniControl( oControl ).Caption :=
               '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + cBadge +  '</span>'
     end;
     // 6.0.0.0
     if trim(cIcoImg) = '' then
     begin
        pTypeButton := '';

        if Pos( 'rcbtn_' , cHint ) > 0 then
           pTypeButton := cHint
        else
        if ( Pos( '__' , TUniControl( oControl ).Caption ) > 0 ) then
          pTypeButton := TUniControl( oControl ).Caption
        else
        if ( Pos( 'cls:' , cHint ) > 0 ) then
        begin
          pTypeButton := cHintDefault + '|';
        end;

        if pTypeButton <> '' then
        begin
             if Pos( 'rcbtn_' , cHint ) > 0 then
                pTypeButton := Copy( cHintDefault, 7, 100 );

             if ( Pos( '__' , pTypeButton ) > 0 ) then
             begin
                TUniControl( oControl ).Caption := Copy( pTypeButton , 1, Pos( '__' , pTypeButton ) - 1 );
                pTypeButton := Copy( pTypeButton , Pos( '__' , pTypeButton ) + 2, 50 );
             end
             else
             if ( Pos( 'cls:' , pTypeButton ) > 0 ) then
             begin
                cTemp := Copy( pTypeButton , Pos( 'cls:' , pTypeButton ) + 4, 100 );
                pTypeButton := Trim( Copy( cTemp , 1, Pos( '|' , cTemp ) -1 ) );
             end;

             if cBadge <> '' then
                TUniControl( oControl ).Caption := '<span>' + TUniControl( oControl ).Caption + cBadge + '</span>';

             TUniControl( oControl ).JSInterface.JSCall( 'removeCls' , [ 'disabled' ]);
             TUniControl( oControl ).JSInterface.JSCall( 'addCls' , [ pTypeButton ]);
             if not TUniControl( oControl ).Enabled then
             begin
                  TUniControl( oControl ).JSInterface.JSCall( 'addCls' , [ 'disabled' ]);
             end;
        end;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderControl_BUTTONS_ATTR.' + sLineBreak + e.Message);
   end;
end;

end.
