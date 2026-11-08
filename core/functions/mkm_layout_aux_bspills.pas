unit mkm_layout_aux_bspills; //8.0.0.0

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
    uniPanel,
    uconsts
    ;

    procedure renderAttr_BSPILLS( pForm: TObject; var oObj : TObject; var cHint : string; var varSL_HtmlPage : TStringList ; pMobileScreen, pMobileScreenPortrait, pRTL : boolean; pTabIni : integer; pTabEnd : integer; var cBsID : string; var I : integer );

implementation

uses mkm_layout, mkm_layout_aux, mkm_func_web;

procedure renderAttr_BSPILLS( pForm : TObject; var oObj : TObject; var cHint : string; var varSL_HtmlPage : TStringList ; pMobileScreen, pMobileScreenPortrait, pRTL : boolean; pTabIni : integer; pTabEnd : integer; var cBsID : string; var I : integer );
var
   f,
   iPosIni, iPosEnd,
   iReduc,
   iBsTempVal : integer;
   cBsComponent, cBsTemp, cBsColor, cBsClass, cBsCaption, cBsDisabled,
   cCloseBtn,
   cTemp, cTemp2, cTemp3, cTemp4 : string;
   pPageControl : TUnipagecontrol;
   oObjTemp : TUniControl;
begin
   try
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

         TUniLabel( oObj ).Align := alNone;
         oObjTemp := TUniControl( TUniLabel( oObj ).GetParentComponent );
         iReduc := 6;

         if pMobileScreen then
         begin
              iReduc := varIIF( pMobileScreenPortrait, 1, 6 );
         end;

         if GetPropInfo( oObjTemp.ClassInfo, 'AutoScroll' ) <> nil then
            TUniContainerPanel( oObjTemp ).AutoScroll := False ;

         TUniLabel( oObj ).Left  := 8;
         TUniLabel( oObj ).width := oObjTemp.Width - 8;
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

         varSL_HtmlPage.Add( '<div class="row" >' );
         varSL_HtmlPage.Add( '  <div class="col-md-12">' );

         if pRTL then
            varSL_HtmlPage.Add( '     <div class="rc-btn-group-rtl btn-group-justified">' )
         else
            varSL_HtmlPage.Add( '     <div class="btn-group btn-group-justified">' );

         for F := pTabIni to pTabEnd do
         begin
            if pPageControl.Pages[ f ].TabVisible then
            begin
               cTemp  := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Name );
               cTemp2 := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Caption );
               //8.4.0.3
               cCloseBtn := 'tab=_closeTab';
               If ( Pos( 'closebtn:false' , TUniTabSheet( pPageControl.Pages[ f ] ).Hint ) > 0 ) or
                  ( Pos( 'closebtns:false' , cHint ) > 0 ) then
                  cCloseBtn := '';

               if Pos( '<span>', cTemp2 ) = 0 then
                  cTemp2 := '<i class=""></i><span> ' + cTemp2 + '</span>';

               cTemp3 := '';
               if ( TUniTabSheet( pPageControl.Pages[ f ] ).Name = pPageControl.ActivePage.Name ) and ( cCloseBtn <> '' ) then
               begin
                  cTemp3 := '<i class="fas fa-times"></i>';
               end;

               if ( ( f > 0 ) and ( f = pTabIni ) ) and ( pPageControl.PageCount - 1 > ( iReduc ) ) then // and ( f = 0 ) then
               begin
                  cBsTemp := 'ButtonThemeTab';

                  varSL_HtmlPage.Add( '        <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                            QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                            QuotedStr( 'tab=TabLeft' ) + ', ' +
                                            QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                            QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + '_Tab' + f.ToString + cBsID + '" type="button" class="btn ' + cBsClass + ' ' + cBsTemp + '">' + '<i class="fa fa-arrow-left fa-1x"></i>' +
                                            '</button>' );                                                               //       ^
               end;

               //cls-active:ButtonTabPurple
               //cls-tab1-active: ...
               cTemp4 := '';
               If Pos( 'cls-active:' , cHint ) > 0 then
               begin
                  cTemp4 := Copy( cHint, Pos( 'cls-active:' , cHint ) + 11 ) + ' ' ;
                  cTemp4 := Copy( cTemp4, 1, pos( ' ', cTemp4 ) - 1 );
               end;
               If Pos( 'cls-tab' + (f+1).ToString + '-active:' , cHint ) > 0 then
               begin
                  cTemp4 := Copy( cHint, Pos( 'cls-tab' + (f+1).ToString + '-active:' , cHint ) + 16 ) + ' ' ;
                  cTemp4 := Copy( cTemp4, 1, pos( ' ', cTemp4 ) - 1 );
               end;
               if cTemp4 = '' then
                  cTemp4 := 'ButtonThemeTab';
               cBsTemp := IfThen( cTemp = pPageControl.ActivePage.Name , cTemp4 , 'ButtonThemeInactive' );

               cBsDisabled := varIIF( not TUniTabSheet( pPageControl.Pages[ f ] ).Enabled, 'disabled = "disable"', '' );

               varSL_HtmlPage.Add( '    <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                            QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                            QuotedStr( 'tab=Tab' + f.ToString ) + ', ' +
                                            QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                            QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + f.ToString + cBsID + '_TabLeft" type="button" ' + cBsDisabled + ' class="btn ' + cBsClass + ' ' + cBsTemp + '">' + cTemp2 +

                                            IfThen( ( cTemp3 <> '' ) and ( pPageControl.ActivePageIndex > 0 ) , '<a onclick="ajaxRequest( MainForm.htmlFrame , ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                   QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                   QuotedStr( cCloseBtn ) + ', ' +
                                                                   QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                   QuotedStr( 'pgcontrol=' + pPageControl.Name ) +

                                                                   ']);"><span> ' + cTemp3 + '</span></a>', '' ) +
                                         '</button>' );                                                               //       ^
                // close all
                if ( f = pTabEnd ) and ( pTabEnd > 1 ) and ( Pos( 'closeall:off', TUniLabel( oObj ).Hint ) = 0 ) then
                begin
                    cBsTemp := 'ButtonThemeTab';//'ButtonThemeCloseAllTab';

                    varSL_HtmlPage.Add( '        <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                              QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                              QuotedStr( 'tab=_closeAllTabs' ) + ', ' +
                                              QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                              QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + f.ToString + cBsID + '_closeAllTabs" type="button" class="btn ' + cBsClass + ' ' + cBsTemp + '">' + '<i class="fas fa-window-close"></i>' +
                                              '</button>' );                                                               //       ^
                end;

                if ( pPageControl.PageCount - 1 > ( iReduc ) ) and ( ( f = pTabEnd ) and ( f <> pPageControl.PageCount - 1 ) ) then
                begin
                   cBsTemp := 'ButtonThemeTab';
                   varSL_HtmlPage.Add( '        <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                             QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                             QuotedStr( 'tab=TabRight' ) + ', ' +
                                             QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                             QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + f.ToString + cBsID + '_TabRight" type="button" class="btn ' + cBsClass + ' ' + cBsTemp + '">' + '<i class="fa fa-arrow-right fa-1x"></i>' +
                                             '</button>' );                                                               //       ^
                end;
            end;
         end;
         varSL_HtmlPage.Add( '     </div>' );
         varSL_HtmlPage.Add( '  </div>' );
         varSL_HtmlPage.Add( '</div>' );
         //pills
         TUniControl( TComponent( pForm ).Components[ I ] ).Caption := RemoveLineBreaks( varSL_HtmlPage.Text );  //UTF8Encode
     end;

   except on e:exception do
      raise Exception.Create('Error On renderAttr_BSPILLS.' + sLineBreak + e.Message);
   end;
end;

end.
