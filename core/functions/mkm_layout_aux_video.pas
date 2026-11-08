unit mkm_layout_aux_video; //8.0.0.0

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

    procedure renderAttr_VIDEO( pForm : TObject; var oControl : TUniControl; var cHint : string );

implementation

uses mkm_layout, mkm_layout_aux;

procedure renderAttr_VIDEO( pForm : TObject; var oControl : TUniControl; var cHint : string );
var
   cCaption,cTemp2,cTemp3 : string;
   oBlock : TUniControl;
   oHtmlFrm  : TUniHTMLFrame;
begin
   try
      cTemp2 := rc_GetHintAttr( 'video:' , cHint );
      If cTemp2 <> '' then
      begin
          oBlock         := TUniControl( oControl );
          renderControl_HtmlFrame( pForm, oBlock, oHtmlFrm, 'rcVideoViewer_' );

          if oHtmlFrm <> nil then
          begin
             oHtmlFrm.Hint   := '[[bsvideo:' + cTemp2 + '|center:parent x]]';
             // se estiver dentro de um bloco 'responsivo'...
             oHtmlFrm.Anchors:= [ akTop, akLeft];
             oHtmlFrm.Left   := 0;
             oHtmlFrm.Top    := 0;
             cTemp2 := rc_GetHintAttr( 'w:', cHint, True );
             cTemp3 := rc_GetHintAttr( 'h:', cHint, True );
             if cTemp2 <> '' then
                oHtmlFrm.Width := StrToIntDef( cTemp2, oHtmlFrm.Parent.Width ) ;
             if cTemp3 <> '' then
                oHtmlFrm.Height := StrToIntDef( cTemp3, oHtmlFrm.Parent.Height ) ;
             cTemp2 := '';
             cTemp3 := '';
          end;
      end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_VIDEO.' + sLineBreak + e.Message);
   end;
end;

end.
