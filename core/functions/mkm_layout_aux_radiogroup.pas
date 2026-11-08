unit mkm_layout_aux_radiogroup; //8.0.0.0

interface

uses
    System.SysUtils,
    System.TypInfo,
    System.Classes,
    Vcl.Controls,
    uniGUIClasses,
    uniRadioGroup,
    uniDBRadioGroup,
    uconsts
    ;

    procedure renderAttr_RGCOLS( var oControl : TUniControl; var cHint : string; bMobileScreen : boolean );

implementation

uses mkm_layout;

procedure renderAttr_RGCOLS( var oControl : TUniControl; var cHint : string; bMobileScreen : boolean );
var
  cTemp2, cTemp4 : string;
begin
   try
      cTemp4 := rc_GetHintAttr( 'rgcols:' , cHint ) + ' ';
      if trim(cTemp4) = '' then
         cTemp2 := TUniDBRadioGroup( oControl ).Columns.ToString // '1'
      else
      if rc_IsMobile_V( cTemp4 ) then //8.0.0.0
         cTemp2 := rc_GetHintAttr( 'mobile-v-', cTemp4, True )
      else
      if rc_IsMobile_H( cTemp4 ) then //8.0.0.0
         cTemp2 := rc_GetHintAttr( 'mobile-h-', cTemp4, True )
      else
      if rc_IsMobile( cTemp4 ) then //8.0.0.0
        cTemp2 := rc_GetHintAttr( 'mobile-', cTemp4, True )
      else
      if ( not bMobileScreen )  then
         cTemp2 := trim( Copy( cTemp4, 1, Pos( ' ' , cTemp4 ) ) );

      TUniDBRadioGroup( oControl ).Columns := StrToIntDef( cTemp2, 1 );   except on e:exception do
      raise Exception.Create('Error On renderAttr_RGCOLS.' + sLineBreak + e.Message);
   end;
end;

end.
