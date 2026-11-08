unit mkm_layout_aux_bstabs; //8.0.0.0

interface

uses
    System.SysUtils,
    System.TypInfo,
    System.Classes,
    System.StrUtils,
    Vcl.Controls,
    Vcl.Graphics,
    uniGUIClasses,
    uniGUIApplication,
    uniGUITypes,
    uniLabel,
    uniPageControl,
    uconsts
    ;

    procedure renderAttr_BSTABS( pForm: TObject; var oObj : TObject; var cHint : string; var varSL_HtmlPage : TStringList ; pMobileScreen : boolean; pTabIni : integer; pTabEnd : integer; var cBsID : string; var I : integer );

implementation

uses mkm_layout, mkm_layout_aux, mkm_func_web;

procedure renderAttr_BSTABS( pForm : TObject; var oObj : TObject; var cHint : string; var varSL_HtmlPage : TStringList ; pMobileScreen : boolean; pTabIni : integer; pTabEnd : integer; var cBsID : string; var I : integer );
var
   f,
   iPosIni, iPosEnd,
   iReduc,
   iBsTempVal : integer;
   cBsComponent, cBsTemp, cBsColor, cBsClass, cBsCaption,
   cTemp, cTemp2, cTemp4 : string;
   pPageControl : TUnipagecontrol;
begin
   try
     //bsTabs_light_btn-sm__pgPadrao [[bsTabs:light cls:btn-sm pgc:pgPadrao]]
     varSL_HtmlPage.Clear;
     TUniLabel( oObj ).TextConversion := txtHTML;
     cBsComponent := trim( Copy( cHint, 1, Pos( ':' , cHint ) - 1 ) );
     cHint := cHint + '|';
     cHint := Copy( cHint , 1, Pos( '|', cHint ) - 1 );// 6.0.0.0

     cBsTemp := Copy( cHint, Pos( ':' , cHint ) + 1 , 100 );

     cBsColor := Copy( cBsTemp, 1, Pos ( ' ' , cBsTemp ) - 1 );

     cBsClass := Copy( cBsTemp, Pos( 'cls:' , cBsTemp ) + 4, 100 );
     cBsClass := Copy( cBsClass, 1, Pos ( ' ' , cBsClass ) - 1 );
     // todas as classes usadas ficam antes do nome do PAgeControl associado
     cBsTemp := Copy( cBsTemp, 1, Pos( '__' , cBsTemp ) - 1 );
     iBsTempVal := StrToIntDef( cBsTemp , 0 );

     cBsCaption := Trim(Copy( cHint, Pos( 'pgc:' , cHint ) + 4 , 100 ) ) + ' ';
     cBsCaption := Copy( cBsCaption, 1, Pos( ' ' , cBsCaption ) - 1 );

     cTemp4  := '';
     begin
        pPageControl := TUniPageControl( TComponent( pForm ).FindComponent( cBsCaption ) );
        pPageControl.Hint := pPageControl.Name + ' tb_ini:' + pPageControl.ActivePageIndex.ToString + ' tb_end:1' ;
        iPosIni := Pos( 'tb_ini:', pPageControl.Hint  ) + 7 ;
        iPosEnd := Pos( 'tb_end:', pPageControl.Hint  ) + 7 ;
     end;

     if pPageControl <> nil then
     begin
         TUniPageControl(pPageControl).TabBarVisible := False;

         iReduc := varIIF( pMobileScreen, 1, 6 );
         // controlar o fluxo de abas pra nao estourar os linmites da tela
         pTabEnd := pTabIni + iReduc;

         if pTabEnd >= pPageControl.PageCount - 1 then
         begin
            pTabEnd := pPageControl.PageCount - 1;
            pTabIni := pTabEnd - iReduc;

            if pTabIni < 0 then
               pTabIni := 0;
         end;

         pPageControl.tag  := 0;

         varSL_HtmlPage.Add( '<div class="row">' );
         varSL_HtmlPage.Add( '  <div class="col-md-12">' );
         varSL_HtmlPage.Add( '     <ul class="nav nav-tabs" id="custom-content-below-tab' + pPageControl.Name + cBsID + '" role="tablist">' );

         for F := pTabIni to pTabEnd do
         begin
            if pPageControl.Pages[ f ].TabVisible then
            begin
               cTemp  := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Name );
               cTemp2 := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Caption );

               cBsTemp := IfThen( cTemp = pPageControl.ActivePage.Name , 'active color-gray' , 'color-silver' );

               if ( ( f > 0 ) and ( f = pTabIni ) ) and ( pPageControl.PageCount - 1 > ( iReduc ) ) then // and ( f = 0 ) then
               begin
                  varSL_HtmlPage.Add( '        <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                            QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                            QuotedStr( 'tab=TabLeft' ) + ', ' +
                                            QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                            QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + '_Tab' + f.ToString + cBsID + '" type="button" class="btn ' + cBsClass + ' ' + cBsTemp + '">' + '<i class="fa fa-arrow-left fa-1x"></i>' +
                                            '</button>' );                                                               //       ^
               end;

               varSL_HtmlPage.Add( '<li class="nav-item">' +
                                                 '  <a class="nav-link ' + cBsTemp + '" id="custom-content-below-home-tab' + pPageControl.Name + f.ToString + cBsID + '" data-toggle="pill" href="#custom-content-below-home-tab' + pPageControl.Name + cBsID + '" onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                         QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                         QuotedStr( 'tab=Tab' + f.ToString ) + ', ' +
                                         QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                         QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" role="tab" aria-controls="custom-content-below-home" aria-selected="' + varIIF( Pos( 'active' , cBsTemp ) > 0, 'true', 'false' )  + '">' +
                                         cTemp2 +
                                         '</a></li>' );                                                               //       ^
                                         // btn-xs -> Mini                                                                     |
                                         // btn-sm -> Small  ------------------------------------------------------------------
                                         // btn-lg -> Large
                                         // no class> Default

               if ( pPageControl.PageCount - 1 > ( iReduc ) ) and ( ( f = pTabEnd ) and ( f <> pPageControl.PageCount - 1 ) ) then
               begin
                  varSL_HtmlPage.Add( '        <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                            QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                            QuotedStr( 'tab=TabRight' ) + ', ' +
                                            QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                            QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + f.ToString + cBsID + '_TabRight" type="button" class="btn ' + cBsClass + ' ' + cBsTemp + '">' + '<i class="fa fa-arrow-right fa-1x"></i>' +
                                            '</button>' );                                                               //       ^
               end;
            end;
         end;
         varSL_HtmlPage.Add( '     </ul>' );
         varSL_HtmlPage.Add( '  </div>' );
         varSL_HtmlPage.Add( '</div>' );
         // bstabs
         TUniControl( TComponent( pForm ).Components[ I ] ).Caption := RemoveLineBreaks( varSL_HtmlPage.Text );  //UTF8Encode
     end;

   except on e:exception do
      raise Exception.Create('Error On renderAttr_BSTABS.' + sLineBreak + e.Message);
   end;
end;

end.
