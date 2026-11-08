unit mkm_layout_aux_bscarousel; //8.0.0.0

interface

uses
    System.SysUtils,
    System.Classes,
    uniGUIClasses,
    uniGUITypes,
    uniLabel,
    uconsts
    ;

    procedure renderAttr_BSCAROUSEL( pForm: TObject; var oObj : TObject; var cHint : string; var cHintDefault : string; var varSL_HtmlPage : TStringList; var cBsID : string );

implementation

uses mkm_layout, mkm_layout_aux, mkm_func_web, str_func;

procedure renderAttr_BSCAROUSEL( pForm : TObject; var oObj : TObject; var cHint : string; var cHintDefault : string; var varSL_HtmlPage : TStringList; var cBsID : string );
var
   f,iPos : integer;
   cTemp, cTemp2, cTemp3 : string;
begin
   try
     if Pos( '|transition-fade' , cHint ) > 0 then
     begin
        varSL_HtmlPage.Add( '<div id="carouselIndicators' + cBsID + '" class="carousel carousel-fade" data-bs-ride="carousel">' );
        cHint := StringReplace( cHint, '|transition-fade', '', [rfReplaceAll] );
     end
     else
        varSL_HtmlPage.Add( '<div id="carouselIndicators' + cBsID + '" class="carousel slide" data-bs-ride="carousel">' );

     varSL_HtmlPage.Add( '    <div class="carousel-indicators">' );

     cTemp := rc_NormalizeHintAttr( cHint );
     cTemp := RemoveLineBreaks( cTemp );
     iPos := Occurs( 'bscarousel:', cTemp );
     for f := 0 to iPos - 1 do
         varSL_HtmlPage.Add( '   <button type="button" data-bs-target="#carouselIndicators' + cBsID + '" data-bs-slide-to="' + f.ToString + '" class="' + varIIF( f = 0 , 'active', '' ) + '" aria-current="true" aria-label="Slide ' + f.ToString + '"></button>' );

     varSL_HtmlPage.Add( '    </div>' );
     varSL_HtmlPage.Add( '    <div class="carousel-inner">' );

     //bsCarousel_https://placehold.it/900x500/39CCCC/ffffff?text=RadCORE+WEB[Slide 1#Demonstrando BS_Carousel]@https://www.radcore.pro.br@Powered by RadCORE

     cHint := RemoveLineBreaks( cHintDefault );
     cTemp2 := cHint;
     iPos := 0;
     While ( Pos( 'bscarousel:' , lowercase( cTemp2 ) ) > 0 ) do //7.5.0.3 lowercase
     begin
          cTemp3 := rc_GetHintAttr( 'bscarousel:', cTemp2 );

          // no cache
          //cTemp3 := cTemp3 + '?' + FormatDateTime('ddmmyyyyhhmmss', Now);
          varSL_HtmlPage.Add( '    <div class="carousel-item' + varIIF( iPos = 0 , ' active', '' ) + '">' );
          varSL_HtmlPage.Add( '      <img class="d-block w-100" src="' + cTemp3 + '" alt="slide' + iPos.ToString + '">' );
          varSL_HtmlPage.Add( '    </div>' );

          Inc( iPos );

          cTemp2 := Trim( StringReplace( cTemp2 , 'bscarousel:' + cTemp3 + '|' , '', [rfReplaceAll] ));
     end;

     varSL_HtmlPage.Add( '    <button class="carousel-control-prev" type="button" data-bs-target="#carouselIndicators' + cBsID + '" data-bs-slide="prev">' ) ;
     varSL_HtmlPage.Add( '      <span class="carousel-control-prev-icon" aria-hidden="true"></span>' ) ;
     varSL_HtmlPage.Add( '      <span class="visually-hidden">Previous</span>' ) ;
     varSL_HtmlPage.Add( '    </button>' ) ;
     varSL_HtmlPage.Add( '    <button class="carousel-control-next" type="button" data-bs-target="#carouselIndicators' + cBsID + '" data-bs-slide="next">' ) ;
     varSL_HtmlPage.Add( '      <span class="carousel-control-next-icon" aria-hidden="true"></span>' ) ;
     varSL_HtmlPage.Add( '      <span class="visually-hidden">Next</span>' ) ;
     varSL_HtmlPage.Add( '    </button>' ) ;
     varSL_HtmlPage.Add( '</div>' );

     varSL_HtmlPage.Text := RemoveLineBreaks( varSL_HtmlPage.Text );
     varSL_HtmlPage.Text := StringReplace( varSL_HtmlPage.Text, '?', '&amp;', [rfReplaceAll] );


   except on e:exception do
      raise Exception.Create('Error On renderAttr_BSCAROUSEL.' + sLineBreak + e.Message);
   end;
end;

end.
