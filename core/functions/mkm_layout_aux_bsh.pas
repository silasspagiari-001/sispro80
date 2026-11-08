unit mkm_layout_aux_bsh; //8.0.0.0

interface

uses
    System.SysUtils,
    uniGUIClasses,
    uniGUITypes,
    uniLabel,
    uconsts
    ;

    procedure renderAttr_BSH( pForm: TObject; var oObj : TObject; var cHint : string; var cCaption : string; bRTL : boolean );

implementation

uses mkm_layout, mkm_layout_aux, mkm_func_web, mkm_layout_aux_align;

procedure renderAttr_BSH( pForm : TObject; var oObj : TObject; var cHint : string; var cCaption : string; bRTL : boolean );
var
   f : integer;
   cTemp, cTemp3 : string;
begin
   try
      for f := 1 to 6 do
      begin
          if Pos( 'bsh' + f.ToString + ':', cHint ) > 0 then
          begin
              cHint := StringReplace( cHint, 'bsh' + f.ToString + ':', '', [rfReplaceAll] );
              cHint := rc_SetHintAttr( 'bsh' + f.ToString, 'rc-bsh:' ,  cHint  ) ; //8.0.0.0
              TUniControl( oObj ).Hint := cHint;//'[[' + cHint + ']]'; //8.0.0.0
              //8.0.0.0
              cTemp := rc_GetHintAttr( 'caption:' , cHint );
              if cTemp = '' then
                 cTemp := rc_StripHtmlTags( TUniControl( oObj ).Caption );
              TUniControl( oObj ).Caption := '';
              TUniControl( oObj ).Caption := StringReplace( cCaption, cTemp, '<h' + f.ToString + '>' + cTemp + '</h' + f.ToString + '>', [rfReplaceAll] );

              // 6.0.0.0
              if pos( 'cls:' , cHint ) > 0 then
              begin
                 cHint := rc_GetHintAttr( 'cls:', cHint , True);
              end;
              TUniLabel( oObj ).TextConversion := txtHTML;

              //8.0.0.0
              if ( cHint <> '' ) and ( Pos( 'align-label-', cHint ) = 0 ) then
              begin
                 if bRTL then
                     rc_AddCssClass( TUniLabel( oObj ), 'align-label-right-center' )
                 else
                     rc_AddCssClass( TUniLabel( oObj ), 'align-label-left-center' );
              end;

              // apply "center:" after possible rendered font size
              cTemp3 := rc_GetHintAttr( 'center:', cHint );
              if cTemp3 <> '' then
              begin
                 cTemp := 'center:' + cTemp3;
                 if not DynamicAlignment_CENTER( pForm, TUniLabel( oObj ), cTemp3, cTemp ) then
                    Break;
              end;

              Break;
          end;
      end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_BSH.' + sLineBreak + e.Message);
   end;
end;

end.
