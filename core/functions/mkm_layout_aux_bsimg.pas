unit mkm_layout_aux_bsimg; //8.0.0.0

interface

uses
    System.SysUtils,
    System.Classes,
    uniGUIClasses,
    uniGUITypes,
    uconsts
    ;

    procedure renderAttr_BSIMG( pForm: TObject; var oObj : TObject; var cHint : string; pMobileScreen, pMobileScreenPortrait, pMobileScreenLandScape : boolean; var varSL_HtmlPage : TStringList; var cBsID : string );

implementation

uses mkm_layout, mkm_layout_aux, mkm_func_web;

procedure renderAttr_BSIMG( pForm : TObject; var oObj : TObject; var cHint : string; pMobileScreen, pMobileScreenPortrait, pMobileScreenLandScape : boolean; var varSL_HtmlPage : TStringList; var cBsID : string );
var
   iH, iW : integer;
   cImgCls,
   cTemp, cTemp2, cTemp3, cTemp4 : string;
begin
   try
     cImgCls := rc_GetHintAttr( 'img-cls:', cHint );
     if cImgCls = '' then
        cImgCls := 'img-responsive';
     cTemp :='<img id="bsimg' + TUniControl( oObj ).name + cBsID + '" ' +
             //'class="img-responsive ' + cImgCls + '" ' + //img-fluid mx-auto d-block
             'class="bsimgresponsive" ' + //v.
             //'class="rc-img-center" ' + //v.
             'src="bsimgfile" ' +
             'alt="bsimg-' + TUniControl( oObj ).name + '">' ;

     cHint := RemoveLineBreaks( cHint );
     cHint := trim( rc_NormalizeHintAttr( cHint )) + ' ';

     iH := TUniControl( TUniControl( oObj ).GetParentComponent ).Height;
     // todo conteudo de bsimg

     cTemp3 := rc_GetHintAttr( 'bsimg:', cHint , true, true ) + ' ';
     cTemp  := StringReplace( cTemp, 'bsimgresponsive', cImgCls , [rfReplaceAll] );

     //apenas o img
     cTemp2 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
     cTemp  := StringReplace( cTemp, 'bsimgfile', cTemp2 , [rfReplaceAll] );
     //8.0.0.0
     if ( cTemp3 <> '' ) and ( Pos( 'h-auto:', TUniControl( oObj ).Parent.Hint ) = 0 ) then
     begin
        cTemp2 := Copy( cTemp3, Pos( 'width-', cTemp3 ), 1000 ) + ' |';
        cTemp4 := Copy( cTemp2, 1, Pos( 'height-', cTemp2 )  );

        if StrToIntDef( cTemp4, 0 ) = 0 then
        begin
             cTemp2 := IntToStr( TUniControl( TUniControl( oObj ).GetParentComponent ).Width );
        end
        else
        if ( pMobileScreenPortrait )  then
        begin
           cTemp2 := rc_GetHintAttr( 'mobile-v-', cTemp4, True );
        end
        else
        if ( pMobileScreenLandScape )  then
           cTemp2 := rc_GetHintAttr( 'mobile-h-', cTemp4, True )
        else
           cTemp2 := rc_GetHintAttr( 'width-', cTemp4, True );

        iw := Trunc( StrToIntDef( cTemp2, 560 ) ) ;

        cTemp2 := Copy( cTemp3, Pos( 'height-', cTemp3 ), 1000 ) + ' |';
        cTemp4 := cTemp2;

        if StrToIntDef( cTemp4, 0 ) = 0 then
        begin
             cTemp2 := IntToStr( TUniControl( TUniControl( oObj ).GetParentComponent ).Height );
             ih     := StrToIntDef( cTemp2, ih );
        end
        else
        if ( pMobileScreenPortrait )  then
        begin
           cTemp2 := rc_GetHintAttr( 'mobile-v-', cTemp4, True );
        end
        else
        if ( pMobileScreenLandScape )  then
           cTemp2 := rc_GetHintAttr( 'mobile-h-', cTemp4, True )
        else
           cTemp2 := rc_GetHintAttr( 'height-', cTemp4, True );

        TUniControl( oObj ).Width  := iW;
        TUniControl( oObj ).Height := TUniControl( oObj ).Parent.Height;
     end;
     //8.0.0.0
     if cTemp3 <> '' then
        varSL_HtmlPage.Text := StringReplace( cTemp, '?', '&amp;', [rfReplaceAll] )
     else
        varSL_HtmlPage.Text := '';
   except on e:exception do
      raise Exception.Create('Error On renderAttr_BSIMG.' + sLineBreak + e.Message);
   end;
end;

end.
