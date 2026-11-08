unit mkm_layout_aux_bar_rating; //8.0.0.0

interface

uses
    System.SysUtils,
    System.TypInfo,
    System.Classes,
    Vcl.Controls,
    uniGUIClasses,
    uniGUIApplication,
    uniURLFrame,
    uniHTMLFrame,
    uconsts
    ;

    procedure renderAttr_BAR_RATING( pForm : TObject; var oControl : TUniControl; var cHint : string );

implementation

uses mkm_layout, mkm_layout_aux, mkm_func_web;

procedure renderAttr_BAR_RATING( pForm : TObject; var oControl : TUniControl; var cHint : string );
var
   cCaption,cTemp,cTemp2,cTemp3,cTemp4 : string;
   oBlock : TUniControl;
   oHtmlFrm  : TUniHTMLFrame;
begin
   try
      cTemp2 := rc_GetHintAttr( 'bar-rating:' , cHint );
      If cTemp2 <> '' then
      begin
          cTemp2 := cTemp2 + ',';
          oBlock         := TUniControl( oControl );
          //8.0.0.0
          renderControl_HtmlFrame( pForm, oBlock, oHtmlFrm, 'rcBarRating_' );

          if oHtmlFrm <> nil then
          begin
             oHtmlFrm.Align  := alClient;
             cTemp3 := Trim( Copy( cTemp2, Pos( ' ', cTemp2 ) + 1 ) );
             cTemp2 := Trim( StringReplace( cTemp2, cTemp3, '', [rfReplaceAll] ) );
             cCaption := cTemp2;
             cTemp  := '';
             cTemp4 := '';
             While Pos(',', cTemp3) > 0 do
             begin
                cTemp4 := '';
                cTemp2 := Copy( cTemp3, 1,Pos( ',', cTemp3 ) - 1 );
                If Pos( '*', cTemp2 ) > 0 then
                begin
                    cTemp4 := '*';//'selected="selected"';
                    cTemp2 := StringReplace( cTemp2, '*', '', [rfReplaceAll] );
                end;
                cTemp3 := StringReplace( cTemp3, cTemp2 + cTemp4 + ',', '', [rfReplaceAll] );
                cTemp := cTemp + '    <option value="' + cTemp2 + '" ' + varIIF( cTemp4 = '*', 'selected="selected"', '' ) + '>' + cTemp2 + '</option>';
             end;
             oHtmlFrm.HTML.Clear;
             oHtmlFrm.HTML.Add(
               '<div class="box-body">' +
               '  <select id="' + oHtmlFrm.Name + '" name="rating' + oHtmlFrm.Name + '" autocomplete="off">' +
               cTemp +
               '  </select>' +
               '</div>'
             );

             oHtmlFrm.HTML.Add(
               '<script>              ' +
               '  $(''#' + oHtmlFrm.Name + ''').barrating(''show'', {'
               );

             if cCaption = '1to10' then
             begin
               oHtmlFrm.HTML.Add(
                 '      theme: ''bars-' + cCaption + ''','
                 );
             end
             else
             if cCaption = 'movie' then
             begin
               oHtmlFrm.HTML.Add(
                 '      theme: ''bars-' + cCaption + ''','
                 );
             end
             else
             if cCaption = 'square' then
             begin
               oHtmlFrm.HTML.Add(
                 '      theme: ''bars-' + cCaption + ''',' +
                 '      showValues: true,' +
                 '      showSelectedRating: false,'
                 );
             end
             else
             if cCaption = 'pill' then
             begin
               oHtmlFrm.HTML.Add(
                 '      theme: ''bars-' + cCaption + ''',' +
                 '      initialRating: ''A'',' +
                 '      showValues: true,' +
                 '      showSelectedRating: false,' +
                 '      allowEmpty: true,' +
                 '      emptyValue: ''-- no rating selected --'','
                 );
             end
             else
             if cCaption = 'reversed' then
             begin
               oHtmlFrm.HTML.Add(
                 '      theme: ''bars-' + cCaption + ''',' +
                 '      showSelectedRating: false,' +
                 '      reverse: true,'
                 );
             end
             else
             if cCaption = 'horizontal' then
             begin
               oHtmlFrm.HTML.Add(
                 '      theme: ''bars-' + cCaption + ''',' +
                 '      hoverState: false,' +
                 '      reverse: true,'
                 );
             end
             else
             if cCaption = 'faws-stars' then
             begin
               oHtmlFrm.HTML.Add(
                 '      theme: ''fontawesome-stars'',' +
                 '      showSelectedRating: false,'
                 );
             end
             else
             if cCaption = 'css-stars' then
             begin
               oHtmlFrm.HTML.Add(
                 '      theme: ''css-stars'',' +
                 '      showSelectedRating: false,'
                 );
             end
             else
             if cCaption = 'bs-stars' then
             begin
               oHtmlFrm.HTML.Add(
                 '      theme: ''bootstrap-stars'',' +
                 '      showSelectedRating: false,'
                 );
             end;
             oHtmlFrm.HTML.Add(
               '            onSelect: function(value, text) {' +
//                            '                alert(''Selected rating: '' + value);' +
               '                ajaxRequest( MainForm.htmlFrame, "_barRating" ,     ' +
               '                  ["pform=" + ' + QuotedStr( TUniControl( pForm ).Name ) + ', ' +
               '                   "pobj=" + ' + QuotedStr( oHtmlFrm.Parent.Name ) + ', ' +
               '                   "pvalue=" + value ]); ' +
               '            }' +
               '  });' +
               '</script>'
               );
             oHtmlFrm.HTML.Text := RemoveLineBreaks( oHtmlFrm.HTML.Text );

             cTemp := '';
             cTemp2 := '';
             cTemp3 := '';
             cCaption := '';
          end;
      end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_BAR_RATING.' + sLineBreak + e.Message);
   end;
end;

end.
