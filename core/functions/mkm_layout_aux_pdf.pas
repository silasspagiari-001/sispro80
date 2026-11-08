unit mkm_layout_aux_pdf; //8.0.0.0

interface

uses
    System.SysUtils,
    System.TypInfo,
    System.Classes,
    Vcl.Controls,
    uniGUIClasses,
    uniGUIApplication,
    uniURLFrame,
    uconsts
    ;

    procedure rc_ClearPDF( pForm : TObject; pPDFBlock : TUniControl );
    procedure renderAttr_PDF( pForm : TObject; var oControl : TUniControl; var cHint : string );

implementation

uses mkm_layout;

//8.0.0.0
procedure rc_ClearPDF( pForm : TObject; pPDFBlock : TUniControl );
var
   cHint : string;
begin
  try
     cHint := rc_GetHintAttr( 'pdf:' , pPDFBlock.Hint );
     pPDFBlock.Hint := StringReplace( pPDFBlock.Hint, cHint, '', [rfReplaceAll] );
     rc_RenderControlsExecute( pForm, '', pPDFBlock );
  except on e:exception do
      raise Exception.Create('Error On rc_ClearPDF.' + sLineBreak + e.Message);
  end;
end;

procedure renderAttr_PDF( pForm : TObject; var oControl : TUniControl; var cHint : string );
var
   cTemp2 : string;
   x, y : integer;
   oBlock : TUniControl;
   oPDFFrame  : TUniPDFFrame;
begin
   try
     // PDF 8.0.0.0
     cTemp2 := rc_GetHintAttr( 'pdf:' , cHint );
     If Pos( 'pdf:' , cHint ) > 0 then
     begin
         oBlock         := TUniControl( oControl );
         oPDFFrame := TUniPDFFrame( TComponent(pForm).FindComponent( 'rcPdfViewer_' + oBlock.Name ) );
         if ( oPDFFrame = nil ) and ( cTemp2 <> '' ) then
         begin
            oPDFFrame        := TUniPDFFrame.Create( TComponent(pForm) );
            oPDFFrame.Parent := oBlock;
            oPDFFrame.Name   := 'rcPdfViewer_' + oBlock.Name;
         end;
         if oPDFFrame <> nil then
         begin
            oPDFFrame.Left   := 0;
            oPDFFrame.Top    := 0;
            oPDFFrame.Height := oBlock.Height;
            oPDFFrame.Width  := oBlock.Width;
            // se estiver dentro de um bloco 'responsivo'...
            oPDFFrame.Anchors:= [ akTop, akLeft, akRight, akBottom];
            if cTemp2 <> '' then
               oPDFFrame.PdfURL := cTemp2
            else
            begin
               oPDFFrame.PdfURL := '';
               oPDFFrame.Clear;
            end;
         end;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_PDF.' + sLineBreak + e.Message);
   end;
end;

end.
