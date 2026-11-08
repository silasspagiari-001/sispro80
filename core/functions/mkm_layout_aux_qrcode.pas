unit mkm_layout_aux_qrcode; //8.0.0.0

interface

uses
    System.SysUtils,
    System.TypInfo,
    System.Classes,
    Vcl.Controls,
    uniGUIClasses,
    uniGUIApplication,
    uniImage,
    uconsts
    ;

    procedure renderAttr_QRCODE( pForm : TObject; var oControl : TUniControl; var cHint : string );

implementation

uses mkm_layout, mkm_qrcode;

procedure renderAttr_QRCODE( pForm : TObject; var oControl : TUniControl; var cHint : string );
var
   cClass,cTemp2 : string;
   oBlock : TUniControl;
   oQrCodeImg : TUniImage;
begin
   try
     cTemp2 := rc_GetHintAttr( 'qrcode:' , cHint );
     If cTemp2 <> '' then
     begin
         oBlock         := TUniControl( oControl );
         oQrCodeImg     := TUniImage( TComponent(pForm).FindComponent( 'rcQrCode_' + oBlock.Name ) );

         if oQrCodeImg = nil then
         begin
            oQrCodeImg        := TUniImage.Create( TComponent(pForm) );
            oQrCodeImg.Parent := oBlock;
            oQrCodeImg.Name   := 'rcQrCode_' + oBlock.Name;
            oQrCodeImg.Hint   := '[[center:parent xy]]';
            oQrCodeImg.Stretch:= true;
            oQrCodeImg.Proportional := true;
         end;

         if oQrCodeImg <> nil then
         begin
            oQrCodeImg.Left   := 0;
            oQrCodeImg.Top    := 0;
            oQrCodeImg.Height := oBlock.Height;
            oQrCodeImg.Width  := oBlock.Width;

            // se estiver dentro de um bloco 'responsivo'...
            //oQrCodeImg.Anchors:= [ akTop, akLeft, akRight, akBottom];
            rc_QRCode( oQrCodeImg, cTemp2 );
         end;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_QRCODE.' + sLineBreak + e.Message);
   end;
end;

end.
