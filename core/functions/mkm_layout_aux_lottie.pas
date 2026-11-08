unit mkm_layout_aux_lottie; //8.0.0.0

interface

uses
    System.SysUtils,
    System.TypInfo,
    System.Classes,
    Vcl.Controls,
    uniGUIClasses,
    uniGUIApplication,
    uniURLFrame,
    uniHTMLFrame,
    uconsts
    ;

    procedure renderAttr_LOTTIE( pForm : TObject; var oControl : TUniControl; var cHint : string );

implementation

uses mkm_layout, mkm_layout_aux, untDM_RC;

procedure renderAttr_LOTTIE( pForm : TObject; var oControl : TUniControl; var cHint : string );
var
   cTemp2,cTemp3,cTemp4 : string;
   oBlock : TUniControl;
   oHtmlFrm  : TUniHTMLFrame;
begin
   try
     cTemp2 := rc_GetHintAttr( 'lottie:' , cHint );
     If cTemp2 <> '' then
     begin
         cTemp3 := '';
         oBlock         := TUniControl( oControl );
         //8.0.0.0
         if renderControl_HtmlFrame( pForm, oBlock, oHtmlFrm, 'rcLottieAnim_' ) then
         begin
            oHtmlFrm.HTML.Add(' <lottie-player' );
            oHtmlFrm.HTML.Add('   src="' + Trim( Copy( cTemp2, 1, pos( ' ', cTemp2 ) ) ) + '"' );
            cTemp4 := oBlock.Width.ToString;
            if Pos ( ' controls', cHint ) > 0 then
            begin
               cTemp3 := cTemp3 + ' controls';
               cTemp4 := ( oBlock.Width-50 ).ToString;
            end;
            if Pos ( ' hover', cHint ) > 0 then
               cTemp3 := cTemp3 + ' hover';
            if Pos ( ' forward', cHint ) > 0 then
               cTemp3 := cTemp3 + ' direction:1';
            if Pos ( ' backrward', cHint ) > 0 then
               cTemp3 := cTemp3 + ' direction:-1';
            if Pos ( ' autoplay', cHint ) > 0 then
               cTemp3 := cTemp3 + ' autoplay';
            if Pos ( ' loop', cHint ) > 0 then
               cTemp3 := cTemp3 + ' loop';
            if cTemp3 <> '' then
               oHtmlFrm.HTML.Add( cTemp3 );
            //8.0.0.0
            //oHtmlFrm.HTML.Add('   style="width: ' + cTemp4 + 'px;"' );
            oHtmlFrm.HTML.Add('   style="width: ' + ( StrToIntDef(cTemp4,0) / 16 ).ToString + 'rem;"' );
            oHtmlFrm.HTML.Add(' ></lottie-player>' );
         end;

         if oHtmlFrm <> nil then
         begin
            oHtmlFrm.Hint   := '[[center:parent xy]]';
            oHtmlFrm.Left   := 0;
            oHtmlFrm.Top    := 0;
            oHtmlFrm.Height := oBlock.Height;
            oHtmlFrm.Width  := oBlock.Width;
            // se estiver dentro de um bloco 'responsivo'...
            oHtmlFrm.Anchors:= [ akTop, akLeft, akRight, akBottom];
         end;
         cTemp2 := '';
         cTemp3 := '';
         cTemp4 := '';
         dm_rc.rc_RenderControls( pForm, oHtmlFrm );
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_LOTTIE.' + sLineBreak + e.Message);
   end;
end;

end.
