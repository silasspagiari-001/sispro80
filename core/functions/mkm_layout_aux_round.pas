unit mkm_layout_aux_round; //8.0.0.0

interface

uses
    System.SysUtils,
    System.TypInfo,
    System.Classes,
    Vcl.Controls,
    uniGUIClasses,
    uconsts
    ;

    procedure renderAttr_ROUND( var oControl : TUniControl; var cHint : string );

implementation

uses mkm_layout;

procedure renderAttr_ROUND( var oControl : TUniControl; var cHint : string );
var
  cClass, cTemp, cTemp2 : string;
begin
   try
      cClass := rc_GetHintAttr( 'cls:' , cHint );
      cTemp2 := rc_GetHintAttr( 'round:' , cHint );
      If cTemp2 = '' then
         cTemp2 := rc_GetHintAttr( 'rounder:' , cHint );
      If cTemp2 = '' then
         cTemp2 := rc_GetHintAttr( 'roundest:' , cHint );
      If cTemp2 <> '' then
      begin
         cTemp := cTemp2;

         if cTemp2 = 'all' then
            cTemp2 := ''
         else
         if cTemp2 = 't l' then
            cTemp2 := 'topleft'
         else
         if cTemp2 = 't r' then
            cTemp2 := 'topright'
         else
         if cTemp2 = 'l' then
            cTemp2 := 'topbottomleft'
         else
         if cTemp2 = 't' then
            cTemp2 := 'topleftright'
         else
         if cTemp2 = 'r' then
            cTemp2 := 'topbottomright'
         else
         if cTemp2 = 'b l' then
            cTemp2 := 'bottomleft'
         else
         if cTemp2 = 'b r' then
            cTemp2 := 'bottomright'
         else
         if cTemp2 = 'b' then
            cTemp2 := 'bottomleftright';

         if cTemp = 'no' then
            cTemp2 := ''
         else
         if Pos( 'round:', cHint ) > 0 then
            cTemp2 := 'clsRoundPanel' + cTemp2
         else
         if Pos( 'rounder:', cHint ) > 0 then
            cTemp2 := 'clsRounderPanel' + cTemp2
         else
         if Pos( 'roundest:', cHint ) > 0 then
            cTemp2 := 'clsRoundestPanel' + cTemp2;

         if cClass <> '' then
            cClass := ' ' + cClass;
      end;
      if cClass + cTemp2 <> '' then
         rc_AddCssClass( oControl , cTemp2 + cClass );
   except on e:exception do
      raise Exception.Create('Error On renderAttr_ROUND.' + sLineBreak + e.Message);
   end;
end;

end.
