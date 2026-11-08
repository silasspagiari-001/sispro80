unit mkm_layout_aux_border; //8.0.0.0

interface

uses
    System.SysUtils,
    System.TypInfo,
    System.Classes,
    Vcl.Controls,
    uniGUIClasses,
    uconsts
    ;

    procedure renderAttr_BORDER( var oControl : TUniControl; var cHint : string );

implementation

uses mkm_layout;

procedure renderAttr_BORDER( var oControl : TUniControl; var cHint : string );
var
  cClass, cTemp, cTemp2, cTemp3, cTemp4 : string;
begin
   try
      cTemp2 := rc_GetHintAttr( 'border:' , cHint );
      cTemp3 := '';
      cTemp4 := '';
      cTemp  := '';
      If cTemp2 <> '' then
      begin
            if Pos( ' border-round', cTemp2 ) > 0 then
            begin
               cTemp3 := ' clsRoundPanel';
               cTemp2 := StringReplace( cTemp2, ' border-round', '', [rfReplaceAll] ) + ' ';
            end;

            // has css ?
            if trim( Copy( cTemp2, Pos( ' ', cTemp2 ) + 1 ) ) <> ''then
            begin
               cTemp4 := Copy( cTemp2, Pos( ' ', cTemp2 ) + 1 );
               cTemp2 := trim( StringReplace( cTemp2, cTemp4, '', [rfReplaceAll] ) );
               cClass := cTemp4;
            end;

            cTemp := cTemp2;

            if cTemp2 = 'all' then
               cTemp2 := ''
            else
            if cTemp2 = 'tbl' then
               cTemp2 := 'left-tb'
            else
            if cTemp2 = 'tbr' then
               cTemp2 := 'right-tb'
            else
            if cTemp2 = 'tl' then
               cTemp2 := 'topleft'
            else
            if cTemp2 = 'tr' then
               cTemp2 := 'topright'
            else
            if cTemp2 = 'l' then
               cTemp2 := 'left'
            else
            if cTemp2 = 't' then
               cTemp2 := 'top'
            else
            if cTemp2 = 'r' then
               cTemp2 := 'right'
            else
            if cTemp2 = 'bl' then
               cTemp2 := 'bottomleft'
            else
            if cTemp2 = 'br' then
               cTemp2 := 'bottomright'
            else
            if cTemp2 = 'b' then
               cTemp2 := 'bottom';

            if cTemp = 'no' then
               cTemp2 := ''
            else
            if trim(cTemp2) = '' then
               cTemp2 := 'rc-border'
            else
               cTemp2 := 'rc-border-' + cTemp2 ;

            if cTemp3 <> '' then
               cClass := cClass + ' ' + cTemp3;

            if cClass <> '' then
               cClass := ' ' + cClass;
      end;
      if cClass + cTemp2 <> '' then
         rc_AddCssClass( oControl , cTemp2 + cClass  );
   except on e:exception do
      raise Exception.Create('Error On renderAttr_BORDER.' + sLineBreak + e.Message);
   end;
end;

end.
