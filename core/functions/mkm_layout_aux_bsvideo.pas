unit mkm_layout_aux_bsvideo; //8.0.0.0

interface

uses
    System.SysUtils,
    System.Classes,
    uniGUIClasses,
    uniGUITypes,
    uconsts
    ;

    procedure renderAttr_BSVIDEO( pForm: TObject; var oObj : TObject; var cHint : string; var cHintDefault : string; pMobileScreen, pMobileScreenPortrait, pMobileScreenLandScape : boolean; var varSL_HtmlPage : TStringList; var cBsID : string );

implementation

uses mkm_layout, mkm_layout_aux, mkm_func_web;

procedure renderAttr_BSVIDEO( pForm : TObject; var oObj : TObject; var cHint : string; var cHintDefault : string; pMobileScreen, pMobileScreenPortrait, pMobileScreenLandScape : boolean; var varSL_HtmlPage : TStringList; var cBsID : string );
var
   iPos,iH, iW : integer;
   cTemp, cTemp2, cTemp3, cTemp4 : string;
begin
   try
     if Pos( 'youtube.com', cHint ) = 0 then
     begin
        if ( Pos ( ' w:', cHint ) = 0 ) then
           cTemp := '<div class="video-file-responsive"><video width="100%" heigth="100%"'
        else
        begin
           cTemp2 := rc_GetHintAttr( 'w:', cHint, True );
           cTemp3 := rc_GetHintAttr( 'h:', cHint, True );
           cTemp  := '<div><video width="' + cTemp2 + '" heigth="' + cTemp3 + '"' ;
           cHint  := StringReplace( cHint , 'w:' + cTemp2 , '' , [rfReplaceAll] );
           cHint  := StringReplace( cHint , 'h:' + cTemp3 , '' , [rfReplaceAll] );
           cTemp2 := '';
           cTemp3 := '';
        end;

        if Pos ( ' controls', cHint ) > 0 then
           cTemp := cTemp + ' controls';
        if Pos ( ' muted', cHint ) > 0 then
           cTemp := cTemp + ' muted';
        if Pos ( ' poster', cHint ) > 0 then
           cTemp := cTemp + ' poster';
        if Pos ( ' autoplay', cHint ) > 0 then
           cTemp := cTemp + ' autoplay muted'; //8.3.0.0 Fixed: video do not autoplay in some browsers
        if Pos ( ' loop', cHint ) > 0 then
           cTemp := cTemp + ' loop';

        cTemp2 := StringReplace( cHintDefault  , ' controls'  , '' , [rfReplaceAll] );
        cTemp2 := StringReplace( cTemp2        , ' muted'     , '' , [rfReplaceAll] );
        cTemp2 := StringReplace( cTemp2        , ' poster'    , '' , [rfReplaceAll] );
        cTemp2 := StringReplace( cTemp2        , ' autoplay'  , '' , [rfReplaceAll] );
        cTemp2 := StringReplace( cTemp2        , ' loop'      , '' , [rfReplaceAll] );
        cTemp2 := StringReplace( cTemp2        , '|'          , '' , [rfReplaceAll] );

        varSL_HtmlPage.Add( cTemp + '>' );

        iPos := 0;
        While ( Pos( 'bsvideo:' , lowercase( cTemp2 ) ) > 0 ) do //7.5.0.3 lowercase
        begin
             cTemp2 := rc_GetHintAttr( 'bsvideo:', cHint, true );
             if Pos( 'bsvideo:' , lowercase( cTemp2 ) ) > 0 then //7.5.0.3 lowercase
                cTemp := Copy( cTemp2 , 1, Pos( 'bsvideo:' , lowercase( cTemp2 ) ) - 1 ) //7.5.0.3 lowercase
             else
             if cTemp2 <> '' then
                cTemp := cTemp2
             else
                cTemp := cTemp2;

             cTemp := Trim( RemoveLineBreaks( cTemp ) );

             varSL_HtmlPage.Add( '   <source src="' + cTemp + '" type="video/' + Copy( ExtractFileExt( cTemp ), 2, 10 ) + '">' );

             Inc( iPos );

             cTemp2 := Trim( StringReplace( cTemp2 , cTemp, '', [rfReplaceAll] ));
        end;

        varSL_HtmlPage.Add( '  </video>' );

        varSL_HtmlPage.Text := RemoveLineBreaks( varSL_HtmlPage.Text );
        varSL_HtmlPage.Text := StringReplace( varSL_HtmlPage.Text, '?', '&amp;', [rfReplaceAll] ) + '</div';
     end
     else
     begin
         cTemp := '<div class="video-tube-responsive">' +
                    '<iframe width="ytw" height="yth" ' +
                    'src="ytsrc" ' +
                    'title="YouTube video player" frameborder="0" ' +
                    'allow="accelerometer; autoplay; clipboard-write; ' +
                    'encrypted-media; gyroscope; picture-in-picture" allowfullscreen>' +
                    '</iframe>' +
                  '</div>' ;

         cHint := RemoveLineBreaks( cHint );
         cHint := trim( rc_NormalizeHintAttr( cHint )) + ' ';

         iH := TUniControl( TUniControl( oObj ).GetParentComponent ).Height;
         // todo conteudo de bsvideo
         cTemp3 := rc_GetHintAttr( 'bsvideo:', cHint );

         //apenas o video
         cTemp2 := rc_GetHintAttr( 'bsvideo:', cHint );//, true );
         cTemp2 := Copy( cTemp2, 1, Pos( ' ', cTemp2 ) - 1 );
         cTemp := StringReplace( cTemp, 'ytsrc', cTemp2 , [rfReplaceAll] );

         cTemp2 := Copy( cTemp3, Pos( 'width-', cTemp3 ), 1000 ) + ' |';
         cTemp4 := Copy( cTemp2, 1, Pos( 'height-', cTemp2 ) - 1  );

         if ( pMobileScreenPortrait )  then
         begin
            cTemp2 := rc_GetHintAttr( 'mobile-v-', cTemp4, True );
         end
         else
         if ( pMobileScreenLandScape )  then
            cTemp2 := rc_GetHintAttr( 'mobile-h-', cTemp4, True )
         else
            cTemp2 := rc_GetHintAttr( 'width-', cTemp4, True );

         cTemp := StringReplace( cTemp, '"ytw"', '"' + cTemp2 + '"' , [rfReplaceAll] );

         TUniControl( oObj ).Height := iH;

         iw := Trunc( StrToIntDef( cTemp2, 560 ) ) ;
         ih := Trunc( StrToIntDef( cTemp2, iw ) * ( 60.71 / 100 ) ) ;

         cTemp2 := Copy( cTemp3, Pos( 'height-', cTemp3 ), 1000 ) + ' |';
         cTemp4 := cTemp2;

         if ( pMobileScreenPortrait )  then
         begin
            cTemp2 := rc_GetHintAttr( 'mobile-v-', cTemp4, True );
         end
         else
         if ( pMobileScreenLandScape )  then
            cTemp2 := rc_GetHintAttr( 'mobile-h-', cTemp4, True )
         else
            cTemp2 := rc_GetHintAttr( 'height-', cTemp4, True );

         cTemp2 := IntToStr( ih );

         cTemp := StringReplace( cTemp, '"yth"', '"' + cTemp2 + '"' , [rfReplaceAll] );

         TUniControl( oObj ).Parent.Height := iH;

         TUniControl( oObj ).Width  := iW;
         TUniControl( oObj ).Height := iH;

         varSL_HtmlPage.Text := cTemp;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_BSVIDEO.' + sLineBreak + e.Message);
   end;
end;

end.
