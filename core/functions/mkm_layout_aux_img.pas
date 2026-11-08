unit mkm_layout_aux_img; //8.0.0.0

interface

uses
    System.SysUtils,
    System.TypInfo,
    System.Classes,
    Vcl.Controls,
    uniGUIClasses,
    uniGUIApplication,
    uniHTMLFrame,
    uconsts
    ;

    procedure rc_ClearIMG( pForm : TObject; pIMGBlock : TUniControl );
    procedure renderAttr_IMG( pForm : TObject; var oControl : TUniControl; var cHint : string );

implementation

uses mkm_layout, mkm_layout_aux;

//8.0.0.0
procedure rc_ClearIMG( pForm : TObject; pIMGBlock : TUniControl );
var
   cHint : string;
begin
  try
     cHint := rc_GetHintAttr( 'img:' , pIMGBlock.Hint );
     pIMGBlock.Hint := StringReplace( pIMGBlock.Hint, cHint, '', [rfReplaceAll] );
     rc_RenderControlsExecute( pForm, '', pIMGBlock );
  except on e:exception do
      raise Exception.Create('Error On rc_ClearIMG.' + sLineBreak + e.Message);
  end;
end;

procedure renderAttr_IMG( pForm : TObject; var oControl : TUniControl; var cHint : string );
var
   cImgCls,cTemp2 : string;
   x, y : integer;
   oBlock : TUniControl;
   oHtmlFrm  : TUniHTMLFrame;
begin
   try
     cTemp2 := rc_GetHintAttr( 'img:' , cHint );
     if Pos( 'img:' , cHint ) > 0 then
     begin
         cTemp2 := StringReplace( cTemp2, '\', '/', [rfReplaceAll] );//8.0.0.0
         oBlock         := TUniControl( oControl );
         //8.0.0.0
         if renderControl_HtmlFrame( pForm, oBlock, oHtmlFrm, 'rcImgViewer_' ) then
         begin
            cImgCls := rc_GetHintAttr( 'img-bg:', cHint );
            if cImgCls = '' then
               cImgCls := 'trans-panel';
            TUniHTMLFrame( oHtmlFrm ).ClientEvents.ExtEvents.Values['added'] :=
               'function added(sender, container, pos, eOpts){'+
               '   sender.addBodyCls('+ QuotedStr(cImgCls) + ');}' ;

            if ( Pos( 'h-auto:', oBlock.Hint ) > 0 ) then
            begin
               if oBlock.ClientEvents.ExtEvents.Values['resize'] = '' then
               begin
                 oBlock.ClientEvents.ExtEvents.Values['resize'] :=
                   'function resize(sender, width, height, oldWidth, oldHeight, eOpts) ' +
                   '{   ' +
                   //'  console.log( "1.resize..." );' +
                   '  var oImg = ' + QuotedStr( 'bsimg' + oHtmlFrm.Name ) + ';' +
                   '  var oImg = document.getElementById( oImg );' +
                  // '  console.log( "2.resize..." ); ' +
                   '  iH = height;' +
                   //'  console.log( "3.resize(iH antes ):" + iH );  ' +
                   '  if(oImg){' +
//                                 '      var iH = Math.trunc( $(oImg).height() );' +
                   '      var iH = Math.trunc( oImg.offsetHeight );' +
                   '  }' +
//                                 '  console.log( "extjs imgOldH:" + Math.trunc( oldHeight ) );  ' +
//                                 '  console.log( "extjs imgOldW:" + Math.trunc( oldWidth ) );  ' +
//                                 '  console.log( "extjs width..:" + Math.trunc( width ) );  ' +
//                                 '  console.log( "extjs imgH...:" + iH );  ' +
//                                 '  console.log( "-----------------------");  ' +
                   '  ajaxRequest( MainForm.htmlFrame, "_resizeBlock" ,     ' +
                   '   ["pform=" + ' + QuotedStr( TUniControl( pForm ).Name ) + ', ' +
                   '    "pobj=" + ' + QuotedStr( oBlock.Name ) + ', ' +
                   '    "pImgObj=" + ' + QuotedStr( oHtmlFrm.Name ) + ', ' +
                   '    "pOldH=" + Math.trunc(oldHeight),      ' +
                   '    "pOldW=" + Math.trunc(oldWidth),      ' +
                   '    "pHeight=" + Math.trunc(height),      ' +
                   '    "pWidth=" + Math.trunc(width),      ' +
                   '    "imgH=" + iH,      ' +
                   '    "imgW=" + Math.trunc(width) ]); ' +
                   '}';
               end;
            end;
         end;

         if ( oHtmlFrm <> nil ) and ( cTemp2 <> '' ) then
         begin
            cImgCls := rc_GetHintAttr( 'img-cls:', cHint );
            if not cImgCls.IsEmpty then
               cImgCls := '|img-cls:' + cImgCls;

               if ( Pos( 'h-auto:', oBlock.Hint ) = 0 ) then
                  oHtmlFrm.Hint   := '[[bsimg:' + cTemp2 + '|center:parent xy' + cImgCls + ']]'
               else
                  oHtmlFrm.Hint   := '[[bsimg:' + cTemp2 + '|' + cImgCls + ']]';

               oHtmlFrm.Left   := 0;
               oHtmlFrm.Top    := 0;
               oHtmlFrm.Height := oBlock.Height;
               oHtmlFrm.Width  := oBlock.Width;
               // se estiver dentro de um bloco 'responsivo'...
               oHtmlFrm.Anchors:= [ akTop, akLeft, akRight, akBottom];
         end
         else
         begin
              oHtmlFrm.HTML.Text := '';
              oHtmlFrm.Hint      := '';//bsimg: clear...
         end;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_IMG.' + sLineBreak + e.Message);
   end;
end;

end.
