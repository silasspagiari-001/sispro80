unit mkm_layout_aux_inputico; //8.0.0.0

interface

uses
    System.SysUtils,
    System.TypInfo,
    System.Classes,
    Vcl.Controls,
    uniGUIClasses,
    uniGUITypes,
    uniEdit,
    uniDBEdit,
    uconsts
    ;

    procedure renderAttr_INPUTICO( var oControl : TUniControl; var cHint : string; var bRTL : boolean );

implementation

uses mkm_layout, mkm_func_web;

procedure renderAttr_INPUTICO( var oControl : TUniControl; var cHint : string; var bRTL : boolean );
var
  cIco, cClass, cTemp, cTemp2 : string;
  iFont : integer;
begin
   try
      cIco := rc_GetHintAttr( 'inputico:' , cHint );
      //8.0.0.0
      if ( cIco <> '' ) then
      begin
         // icon type
         cIco := rc_AdjustIconsNames( cIco ); //8.2.0.0
         iFont := ( ( TUniControl( oControl ).Height div 2 ) - ( 16 div 2 ) ) - 1 ; // RC uses F.Aws Icons 16px

         if ( Pos( 'cls:border-bottom-edit', TUniControl( oControl ).Hint ) = 0 ) then
         begin
             rc_AddCssClass( TUniControl( oControl ) , 'inputWithIcon' + varIIF( bRTL, '-rtl', '' ) + ' inputIconBg' + varIIF( bRTL, '-rtl', '' ) );
         end
         else
         begin
            TUniControl( oControl ).JSInterface.JSCall( 'addCls' , ['inputWithIcon-BottomEdit inputIconBg-BottomEdit']);
         end;

         iFont := 0;
         if ( oControl is TUniEdit ) then
         begin
            TUniEdit( oControl ).RTL                 := bRTL ;//8.0.0.0 rtl
            TUniEdit( oControl ).FieldLabel          := varIIF( bRTL, '', '<i class="' + cIco + ' fa-lg fa-fw" aria-hidden="true"></i>' );
            TUniEdit( oControl ).FieldLabelWidth     := 20;
            TUniEdit( oControl ).FieldLabelSeparator := ' ';
            TUniEdit( oControl ).FieldLabelAlign     := varIIF( bRTL, laRight, laLeft );
         end
         else
         if ( oControl is TUniDBEdit ) then
         begin
            TUniDBEdit( oControl ).RTL                 := bRTL ;//8.0.0.0 rtl
            TUniDBEdit( oControl ).FieldLabel          := varIIF( bRTL, '', '<i class="' + cIco + ' fa-lg fa-fw" aria-hidden="true"></i>' );
            TUniDBEdit( oControl ).FieldLabelWidth     := 20;
            TUniDBEdit( oControl ).FieldLabelSeparator := ' ';
            TUniDBEdit( oControl ).FieldLabelAlign     := varIIF( bRTL, laRight, laLeft );
         end
         else
         if ( oControl is TUniNumberEdit ) then
         begin
            TUniNumberEdit( oControl ).RTL                 := bRTL ;//8.0.0.0 rtl
            TUniNumberEdit( oControl ).FieldLabel          := varIIF( bRTL, '', '<i class="' + cIco + ' fa-lg fa-fw" aria-hidden="true"></i>' );
            TUniNumberEdit( oControl ).FieldLabelWidth     := 20;
            TUniNumberEdit( oControl ).FieldLabelSeparator := ' ';
            TUniNumberEdit( oControl ).FieldLabelAlign     := varIIF( bRTL, laRight, laLeft );
         end
         else
         if ( oControl is TUniDBNumberEdit ) then
         begin
            TUniDBNumberEdit( oControl ).RTL                 := bRTL ;//8.0.0.0 rtl
            TUniDBNumberEdit( oControl ).FieldLabel          := varIIF( bRTL, '', '<i class="' + cIco + ' fa-lg fa-fw" aria-hidden="true"></i>' );
            TUniDBNumberEdit( oControl ).FieldLabelWidth     := 20;
            TUniDBNumberEdit( oControl ).FieldLabelSeparator := ' ';
            TUniDBNumberEdit( oControl ).FieldLabelAlign     := varIIF( bRTL, laRight, laLeft );
         end
         else
         if ( oControl is TUniFormattedNumberEdit ) then
         begin
            TUniFormattedNumberEdit( oControl ).RTL                 := bRTL ;//8.0.0.0 rtl
            TUniFormattedNumberEdit( oControl ).FieldLabel          := varIIF( bRTL, '', '<i class="' + cIco + ' fa-lg fa-fw" aria-hidden="true"></i>' );
            TUniFormattedNumberEdit( oControl ).FieldLabelWidth     := 20;
            TUniFormattedNumberEdit( oControl ).FieldLabelSeparator := ' ';
            TUniFormattedNumberEdit( oControl ).FieldLabelAlign     := varIIF( bRTL, laRight, laLeft );
         end
         else
         if ( oControl is TUniDBFormattedNumberEdit ) then
         begin
            TUniDBFormattedNumberEdit( oControl ).RTL                 := bRTL ;//8.0.0.0 rtl
            TUniDBFormattedNumberEdit( oControl ).FieldLabel          := varIIF( bRTL, '', '<i class="' + cIco + ' fa-lg fa-fw" aria-hidden="true"></i>' );
            TUniDBFormattedNumberEdit( oControl ).FieldLabelWidth     := 20;
            TUniDBFormattedNumberEdit( oControl ).FieldLabelSeparator := ' ';
            TUniDBFormattedNumberEdit( oControl ).FieldLabelAlign     := varIIF( bRTL, laRight, laLeft );
         end ;
      end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_INPUTICO.' + sLineBreak + e.Message);
   end;
end;

end.
