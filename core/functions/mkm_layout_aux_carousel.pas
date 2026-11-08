unit mkm_layout_aux_carousel; //8.0.0.0

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

    procedure renderAttr_CAROUSEL( pForm : TObject; var oControl : TUniControl; var cHint : string );

implementation

uses mkm_layout, mkm_layout_aux, untDM_RC, MainModule;

procedure renderAttr_CAROUSEL( pForm : TObject; var oControl : TUniControl; var cHint : string );
var
   cTmp,cTemp,cTemp2,cTemp3,cTemp4 : string;
   r : integer;
   oBlock : TUniControl;
   oHtmlFrm  : TUniHTMLFrame;
   vSR: TSearchRec;
begin
   try
     cTemp2 := rc_GetHintAttr( 'carousel:' , cHint );
     If cTemp2 <> '' then
     begin
         cTemp2 := cTemp2 + ' ';
         oBlock         := TUniControl( oControl );
         //8.0.0.0
         renderControl_HtmlFrame( pForm, oBlock, oHtmlFrm, 'rcCarouselViewer_' );
         cTmp := '';
         if oHtmlFrm <> nil then
         begin
            // imagens
            cTmp := trim( Copy( cTemp2, Pos( ' ', cTemp2 ) + 1 ) );
            cTemp2 := Copy( cTemp2, 1, Pos( ' ', cTemp2 ) - 1 );
            cTemp  := cHint;
            cTemp3 := '';
            repeat
                  cTemp3 := cTemp3 + 'bscarousel:' + cTemp2 + '|';

                  cTemp := StringReplace( cTemp, 'carousel:' + cTemp2, '', [rfReplaceAll] ) + ' ';

                  cTemp2 := rc_GetHintAttr( 'carousel:' , cTemp );
            until cTemp2 = '' ;

            cTemp4 := StringReplace( cTemp3, 'bscarousel:', '', [rfReplaceAll] );
            cTemp4 := StringReplace( cTemp4, '|', '', [rfReplaceAll] );
            // Informou uma pasta ou arquivos( .png, .jpg ... ) ?
            if Pos( '.', cTemp4 ) = 0 then
            begin
               cTemp3 := '';
               R := FindFirst( cTemp4 + mm.BACKSLASH + '*.*' , faAnyFile, vSR );
               while R = 0 do
               begin
                 if ( Pos( '.jpg', vSR.Name ) > 0 ) or
                    ( Pos( '.png', vSR.Name ) > 0 ) or
                    ( Pos( '.bmp', vSR.Name ) > 0 ) then
                    cTemp3 := cTemp3 + 'bscarousel:' + cTemp4 + '/' + vSR.Name + '|';

                 R := FindNext( vSR );
               end;
               FindClose(vSR);
            end;
            oHtmlFrm.Hint   := '[[' + cTemp3 + 'center:parent xy|' + cTmp + ']]';
            oHtmlFrm.Left   := 0;
            oHtmlFrm.Top    := 0;
            oHtmlFrm.Height := oBlock.Height;
            oHtmlFrm.Width  := oBlock.Width;
            // se estiver dentro de um bloco 'responsivo'...
            oHtmlFrm.Anchors:= [ akTop, akLeft, akRight, akBottom];
         end;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_CAROUSEL.' + sLineBreak + e.Message);
   end;
end;

end.
