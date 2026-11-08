unit mkm_layout_aux_alerts; //8.0.0.0

interface

uses
    System.SysUtils,
    System.Classes,
    vcl.Controls,
    uniGUIClasses,
    uniGUITypes,
    uniLabel
    ;

    procedure renderAttr_RCALERT( var oObj : TObject; var cCaption, cHint : string ) ;
    procedure renderAttr_RCFEATURE( var oObj : TObject; var cCaption, cHint : string ) ;
    procedure renderAttr_BSALERT( var oObj : TObject; var cCaption, cHint : string ) ;

    procedure renderAttr_RCALERT_R( var pFrame : TObject; var oObj : TObject; var cCaption, cHint : string ) ;
    procedure renderAttr_RCFEATURE_R( var pFrame : TObject; var oObj : TObject; var cCaption, cHint : string ) ;
    procedure renderAttr_BSALERT_R( var pFrame : TObject; var oObj : TObject; var cCaption, cHint : string ) ;

implementation

uses untdm_rc, str_func, MainModule, mkm_layout;

procedure renderAttr_RCALERT( var oObj : TObject; var cCaption, cHint : string ) ;
var
   cAlertIco, cCaptionAlert,
   cTemp,cTemp2, cTemp3, cTemp4, cTemp5 : string;
   iW, iH : integer;
begin
   try
     //if Pos( 'rcalert:' , cHint ) > 0 then
     begin
         cTemp4 := rc_GetHintAttr( 'oldrcalertcaption:', TUniControl( oObj ).Hint );
         if cCaption <> cTemp4 then
         begin
            cTemp4 := rc_GetHintAttr( 'oldrcalert:', TUniControl( oObj ).Hint );
            if cTemp4 = '' then
               cTemp4 := rc_GetHintAttr( 'rcalert:', cHint, false )
            else
            begin
               TUniControl( oObj ).Hint := StringReplace( TUniControl( oObj ).Hint, 'oldrcalert:' + cTemp4, '', [rfReplaceAll] );
            end;
            cTemp2 := cTemp4;
            TUniLabel( oObj ).TextConversion := txtHTML;

            cTemp4 := StringReplace( cTemp4, 'icon-off', '', [rfReplaceAll] );
            if TUniLabel( oObj ).Align = alClient then
            begin
                 iW := TUniLabel( oObj ).Width;
                 iH := TUniLabel( oObj ).Height;
                 TUniLabel( oObj ).Align := alNone;
                 TUniLabel( oObj ).Anchors := [];
                 TUniLabel( oObj ).AutoSize := false;
                 TUniLabel( oObj ).Left := 1;
                 TUniLabel( oObj ).Top  := 1;
                 TUniLabel( oObj ).Width := iW - 2;
                 TUniLabel( oObj ).Height := iH - 2;
                 TUniLabel( oObj ).Anchors := [akLeft,akTop,akRight,akBottom];
                 iW := 0;
                 iH := 0;
            end;
            cTemp4 := cTemp4 + ' ';
            cCaption := rc_GetHintAttr( 'title:', cTemp4, true, true ) + ' ';
            cCaption := Copy( cCaption , 1, Pos( ' ', cCaption ) - 1 );
            cTemp4   := Copy( cTemp4, 1, Pos( ' ', cTemp4 ) - 1 );

            cAlertIco:= rc_GetHintAttr( 'alert-ico:', cHint, true, true ) + ' ';
            cAlertIco:= Trim( Copy( cAlertIco, 1, Pos( ' ', cAlertIco ) ) );

            cTemp := cTemp4;
            cTemp4 := cCaption;
            cCaption := cTemp;
            cTemp3   := mm.MSG_INFO;

            if cTemp = 'danger' then
            begin
               cCaption := 'ban';
               cTemp3   := mm.MSG_DANGER;
            end
            else
            if cTemp = 'warning' then
            begin
               cCaption := 'fa-exclamation-triangle';
               cTemp3   := mm.MSG_WARNING;
            end
            else
            if cTemp = 'success' then
            begin
               cCaption := 'check';
               cTemp3   := mm.MSG_SUCCESS;
            end;

            if Pos( '-',cCaption )=0 then
               cCaption := 'fa-' + cCaption
            else
               cTemp := 'themed';

            if cAlertIco <> '' then
            begin
               cCaption  := Copy( cAlertIco, 1, Pos( '-', cAlertIco ) - 1 );
               cAlertIco := Copy( cAlertIco, Pos( '-', cAlertIco ) + 1 );
               cAlertIco := 'fa-' + cAlertIco ;
               cCaption  := cAlertIco;
            end;

            TUniControl( oObj ).Hint    := StringReplace( TUniControl( oObj ).Hint, 'rcalert:' + cTemp2, '', [rfReplaceAll] );
            TUniControl( oObj ).Hint    := rc_AddHintAttr( '|oldrcalert:' + cTemp2, TUniControl( oObj ).Hint, true );
            cTemp2 :=
               '<div class="rc-' + cTemp + '-alert rc-label-wrap">' +
               varIIF( Pos( ' icon-off', cHint ) = 0, '   <i class="fas ' + cCaption + '"></i>', '' ) + //v.
               '   <div class="rc-' + cTemp + '-alert-content">' +
               '     <div class="rc-' + cTemp + '-alert-title">' + cTemp4 + '</div>' +
               '     <div>' + TUniLabel( oObj ).Caption + '</div>' +
               '   </div>' +
               ' </div>';
            TUniControl( oObj ).Caption := trim( cTemp2 ) ;
            TUniControl( oObj ).Hint    := rc_AddHintAttr( '|oldrcalertcaption:' + cTemp2, TUniControl( oObj ).Hint, true );
         end;
     end;

   except on e:exception do
      raise Exception.Create('Error On renderAttr_RCALERT.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_RCFEATURE( var oObj : TObject; var cCaption, cHint : string ) ;
var
   cAlertIco, cCaptionAlert,
   cTemp,cTemp2, cTemp3, cTemp4, cTemp5 : string;
   iW, iH : integer;
begin
   try
     //if Pos( 'rcfeature:' , cHint ) > 0 then
     begin
        cTemp4 := rc_GetHintAttr( 'oldrcfeaturecaption:', TUniControl( oObj ).Hint );
        if cCaption <> cTemp4 then
        begin
           cTemp4 := rc_GetHintAttr( 'oldrcfeature:', TUniControl( oObj ).Hint );
           if cTemp4 = '' then
              cTemp4 := rc_GetHintAttr( 'rcfeature:', cHint, false )
           else
           begin
              TUniControl( oObj ).Hint := StringReplace( TUniControl( oObj ).Hint, 'oldrcfeature:' + cTemp4, '', [rfReplaceAll] );
           end;
           cTemp2 := cTemp4;
           cTemp4 := StringReplace( cTemp4, 'hover-off', '', [rfReplaceAll] );

           TUniLabel( oObj ).TextConversion := txtHTML;

           if TUniLabel( oObj ).Align = alClient then
           begin
                iW := TUniLabel( oObj ).Width;
                iH := TUniLabel( oObj ).Height;
                TUniLabel( oObj ).Align := alNone;
                TUniLabel( oObj ).Anchors := [];
                TUniLabel( oObj ).AutoSize := false;
                TUniLabel( oObj ).Left := 1;
                TUniLabel( oObj ).Top  := 1;
                TUniLabel( oObj ).Width := iW - 2;
                TUniLabel( oObj ).Height := iH - 2;
                TUniLabel( oObj ).Anchors := [akLeft,akTop,akRight,akBottom];
                iW := 0;
                iH := 0;
           end;
           cTemp4 := cTemp4 + ' ';
           cCaption := rc_GetHintAttr( 'title:', cTemp4, true, true );
           cTemp4   := Copy( cTemp4, 1, Pos( ' ', cTemp4 ) - 1 );

           cTemp := cTemp4;
           cTemp4 := cCaption;
           cCaption := cTemp;

           cTemp3 := '';
           If Length( Copy( cCaption, 1, pos( '-', cCaption ) - 1 ) ) > 2 then
           begin
               cCaption := Copy( cCaption, 1, pos( '-', cCaption ) - 1 ) + ' fa-' + Copy( cCaption, pos( '-', cCaption ) + 1 );
           end
           else
               cCaption := 'fas ' + cCaption;

           TUniControl( oObj ).Hint    := StringReplace( TUniControl( oObj ).Hint, 'rcfeature:' + cTemp2, '', [rfReplaceAll] );
           TUniControl( oObj ).Hint    := rc_AddHintAttr( cTemp2, 'oldrcfeature:', true );
           cTemp2 :=
              '<div class="feature-tiles' + varIIF( Pos( ' hover-off', cHint ) > 0, '-no-hover', '' ) + '">' +
              '  <div class="feature' + varIIF( Pos( ' hover-off', cHint ) > 0, '-no-hover', '' ) + '">' +
              '    <div class="icon' + varIIF( Pos( ' hover-off', cHint ) > 0, '-no-hover', '' ) + '">' +
              '      <i class="' + cCaption + '"></i>' +
              '    </div>' +
              '    <div class="description' + varIIF( Pos( ' hover-off', cHint ) > 0, '-no-hover', '' ) + '">' +
              '      <h3>' + cTemp4 + '</h3>' +
              '      <p>' + TUniLabel( oObj ).Caption + '</p>' +
              '    </div>' +
              '  </div>' +
              '</div>' ;
           TUniControl( oObj ).Caption := cTemp2 ;
           TUniControl( oObj ).Hint    := rc_AddHintAttr( '|oldrcfeaturecaption:' + cTemp2, TUniControl( oObj ).Hint, true );
        end;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_RCFEATURE.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_BSALERT( var oObj : TObject; var cCaption, cHint : string ) ;
var
   cAlertIco, cCaptionAlert,
   cTemp,cTemp2, cTemp3, cTemp4, cTemp5 : string;
   iW, iH : integer;
begin
   try
     //if Pos( 'bsalert:' , cHint ) > 0 then
     begin
         cTemp4 := rc_GetHintAttr( 'oldbsalertcaption:', TUniControl( oObj ).Hint );
         cCaptionAlert := cTemp4;

         if ( cCaptionAlert = '' ) or ( cCaptionAlert = Trim( TUniLabel( oObj ).Caption ) ) or ( Pos( cCaptionAlert, TUniLabel( oObj ).Caption ) = 0 ) then //  ( TUniLabel( oObj ).Caption <> cCaptionAlert ) then
         begin

            if TUniLabel( oObj ).Align = alClient then
            begin
                 iW := TUniLabel( oObj ).Width;
                 iH := TUniLabel( oObj ).Height;
                 TUniLabel( oObj ).Align := alNone;
                 TUniLabel( oObj ).Anchors := [];
                 TUniLabel( oObj ).AutoSize := false;
                 TUniLabel( oObj ).Left := 1;
                 TUniLabel( oObj ).Top  := 1;
                 TUniLabel( oObj ).Width := iW - 2;
                 TUniLabel( oObj ).Height := iH - 2;
                 TUniLabel( oObj ).Anchors := [akLeft,akTop,akRight,akBottom];
                 iW := 0;
                 iH := 0;
            end;
            TUniLabel( oObj ).TextConversion := txtHTML;

            if ( TUniLabel( oObj ).Caption <> cCaptionAlert ) then
               cCaptionAlert := TUniLabel( oObj ).Caption;

            cTemp4   := rc_GetHintAttr( 'bsalert:', cHint, false );
            cAlertIco:= rc_GetHintAttr( 'alert-ico:', cHint, true, true ) + ' ';
            cAlertIco:= Trim( Copy( cAlertIco, 1, Pos( ' ', cAlertIco ) ) );
            cTemp4   := cTemp4 + ' ';
            cTemp    := Copy( cTemp4, 1, pos( ' ', cTemp4 ) - 1 ) + ' ';
            cTemp4   := trim(Copy( cTemp, pos( ' ', cTemp ) + 1 ));
            cTemp    := Copy( cTemp, 1, pos( ' ', cTemp ) - 1 );
            cCaption := 'fas fa-' + cTemp;
            cTemp3   := mm.MSG_INFO;
            if cTemp = 'danger' then
            begin
               cCaption := 'fas fa-ban';
               cTemp3   := mm.MSG_DANGER;
            end
            else
            if cTemp = 'warning' then
            begin
               cCaption := 'fas fa-exclamation-triangle';
               cTemp3   := mm.MSG_WARNING;
            end
            else
            if cTemp = 'success' then
            begin
               cCaption := 'fas fa-check';
               cTemp3   := mm.MSG_SUCCESS;
            end;

            if cAlertIco <> '' then
            begin
               cCaption  := Copy( cAlertIco, 1, Pos( '-', cAlertIco ) - 1 );
               cAlertIco := Copy( cAlertIco, Pos( '-', cAlertIco ) + 1 );
               cAlertIco := cCaption + ' fa-' + cAlertIco ;
               cCaption  := cAlertIco;
            end;

            cTemp2 := '<div class="alert alert-' + cTemp + ' rc-label-wrap">';
            if ( Pos('title-off', cHint ) = 0 )  and ( Pos('icon-off', cHint ) = 0 ) then
               cTemp2 := cTemp2 + '<h5><i class="icon ' + cCaption + '"></i> '+ cTemp3 + '</h5>'
            else
            if ( Pos('title-off', cHint ) > 0 ) then
               cTemp2 := cTemp2 + '<h5><i class="icon ' + cCaption + '"></i></h5>'
            else
            if ( Pos('icon-off', cHint ) > 0 ) then
               cTemp2 := cTemp2 + '<h5>'+ cTemp3 + '</h5>';

            cTemp2 := cTemp2 +
                      cCaptionAlert +
                      '</div>';
            TUniControl( oObj ).Caption := cTemp2 ;
            TUniControl( oObj ).Hint    := rc_AddHintAttr( '|oldbsalertcaption:' + cCaptionAlert, TUniControl( oObj ).Hint, true );
         end;
     end;

   except on e:exception do
      raise Exception.Create('Error On renderAttr_BSALERT.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_RCALERT_R( var pFrame : TObject; var oObj : TObject; var cCaption, cHint : string ) ;
var
   cAlertIco, cCaptionAlert,
   cTemp,cTemp2, cTemp3, cTemp4, cTemp5 : string;
   iW, iH : integer;
begin
   try
     //if Pos( 'rcalert-r:' , cHint ) > 0 then
     begin
         cTemp4 := rc_GetHintAttr( 'oldrcalertcaption:', TUniControl( oObj ).Hint );
         if cCaption <> cTemp4 then
         begin
            cTemp4 := rc_GetHintAttr( 'oldrcalert:', TUniControl( oObj ).Hint );
            if cTemp4 = '' then
               cTemp4 := rc_GetHintAttr( 'rcalert-r:', cHint, false )
            else
            begin
               TUniControl( oObj ).Hint := StringReplace( TUniControl( oObj ).Hint, 'oldrcalert:' + cTemp4, '', [rfReplaceAll] );
            end;
            cTemp2 := cTemp4;
            TUniLabel( oObj ).TextConversion := txtHTML;

            cTemp4 := StringReplace( cTemp4, 'icon-off', '', [rfReplaceAll] );
            //8.0.0.0
            TUniLabel( oObj ).Font.Name := mm.CONFIG_LAYOUT_APP_FONT;
            TUniLabel( oObj ).Font.Size := 8;
            if ( TUniLabel( oObj ).HasParent ) then
            begin
               iW := TUniLabel( oObj ).Parent.Width;
               iH := TUniLabel( oObj ).Parent.Height;
               if Pos( 'height:', TUniLabel( oObj ).Parent.Hint ) = 0 then
                  TUniLabel( oObj ).Parent.Hint := rc_AddHintAttr( '|height:' + TUniLabel( oObj ).Name, TUniLabel( oObj ).Parent.Hint, true )
               else
                  TUniLabel( oObj ).Parent.Hint := rc_AddHintAttr( '|hr:' + TUniLabel( oObj ).Name, TUniLabel( oObj ).Parent.Hint, true );
//               if Pos( 'h-auto:', TUniLabel( oObj ).Parent.Hint ) = 0 then
//                  TUniLabel( oObj ).Parent.Hint := rc_AddHintAttr( '|h-auto:' , TUniLabel( oObj ).Parent.Hint, true );
            end
            else
               dm_rc.rc_ShowToaster( 'danger', 'rcalert-r: in UniLabel ' + TUniLabel( oObj ).name + ' must have a rcBlock parent.', false, 'pinItUp' );

            TUniLabel( oObj ).Align    := alNone;
            TUniLabel( oObj ).Anchors  := [];
            TUniLabel( oObj ).AutoSize := false;
            TUniLabel( oObj ).Left     := 0;
            TUniLabel( oObj ).Top      := 0;
            TUniLabel( oObj ).Width    := iW - 1;
            TUniLabel( oObj ).Height   := iH - 1;
            TUniLabel( oObj ).Anchors  := [akLeft,akTop,akRight];
            iW := 0;
            iH := 0;

            cTemp4 := cTemp4 + ' ';
            cCaption := rc_GetHintAttr( 'title:', cTemp4, true, true ) + ' ';
            cCaption := Copy( cCaption , 1, Pos( ' ', cCaption ) - 1 );
            cTemp4   := Copy( cTemp4, 1, Pos( ' ', cTemp4 ) - 1 );

            cAlertIco:= rc_GetHintAttr( 'alert-ico:', cHint, true, true ) + ' ';
            cAlertIco:= Trim( Copy( cAlertIco, 1, Pos( ' ', cAlertIco ) ) );

            cTemp := cTemp4;
            cTemp4 := cCaption;
            cCaption := cTemp;
            cTemp3   := mm.MSG_INFO;

            if cTemp = 'danger' then
            begin
               cCaption := 'ban';
               cTemp3   := mm.MSG_DANGER;
            end
            else
            if cTemp = 'warning' then
            begin
               cCaption := 'fa-exclamation-triangle';
               cTemp3   := mm.MSG_WARNING;
            end
            else
            if cTemp = 'success' then
            begin
               cCaption := 'check';
               cTemp3   := mm.MSG_SUCCESS;
            end;

            if Pos( '-',cCaption )=0 then
               cCaption := 'fa-' + cCaption
            else
               cTemp := 'themed';

            if cAlertIco <> '' then
            begin
               cCaption  := Copy( cAlertIco, 1, Pos( '-', cAlertIco ) - 1 );
               cAlertIco := Copy( cAlertIco, Pos( '-', cAlertIco ) + 1 );
               cAlertIco := 'fa-' + cAlertIco ;
               cCaption  := cAlertIco;
            end;

            TUniControl( oObj ).Hint    := StringReplace( TUniControl( oObj ).Hint, 'rcalert-r:' + cTemp2, '', [rfReplaceAll] );
            TUniControl( oObj ).Hint    := rc_AddHintAttr( '|oldrcalert:' + cTemp2, TUniControl( oObj ).Hint, true );
            cTemp2 :=
               '<div class="rc-' + cTemp + '-alert rc-label-wrap">' +
               varIIF( Pos( ' icon-off', cHint ) = 0, '   <i class="fas ' + cCaption + '"></i>', '' ) + //v.
               '   <div class="rc-' + cTemp + '-alert-content">' +
               '     <div class="rc-' + cTemp + '-alert-title">' + cTemp4 + '</div>' +
               '     <div>' + TUniLabel( oObj ).Caption + '</div>' +
               '   </div>' +
               ' </div>';
            TUniControl( oObj ).Caption := trim( cTemp2 ) ;
            TUniControl( oObj ).Hint    := rc_AddHintAttr( '|oldrcalertcaption:' + cTemp2, TUniControl( oObj ).Hint, true );
            //8.0.0.0
            if Pos( ' icon-off', cHint ) > 0 then
               TUniControl( oObj ).Hint    := rc_AddHintAttr( '|_rcalerticonoff:', TUniControl( oObj ).Hint, true );

            //8.0.0.0 h-auto testing... do not use .. maybe will be removed
            if ( Pos( 'h-auto:', TUniLabel( oObj ).Parent.Hint ) > 0 ) then
            begin
               if TUniControl(TUniLabel( oObj ).Parent).ClientEvents.ExtEvents.Values['resize'] = '' then
               begin
                 dm_rc.rc_ConsoleLog( 'criou evento resize...', true );
                 TUniControl(TUniLabel( oObj ).Parent).ClientEvents.ExtEvents.Values['resize'] :=
                   'function resize(sender, width, height, oldWidth, oldHeight, eOpts) ' +
                   '{   ' +
                   '  console.log( "1.resize..." );' +
                   '  var oImg = ' + QuotedStr( TUniLabel( oObj ).JSId ) + ';' +
                   '  var oImg = document.getElementById( oImg );' +
                   '  iH = height;' +
//                   '  console.log( "3.resize(iH antes ):" + iH );  ' +
                   '  if(oImg){' +
//                                 '      var iH = Math.trunc( $(oImg).height() );' +
                   '      var iH = Math.trunc( oImg.offsetHeight );' +
                   '  }' +
//                                 '  console.log( "extjs imgOldH:" + Math.trunc( oldHeight ) );  ' +
//                                 '  console.log( "extjs imgOldW:" + Math.trunc( oldWidth ) );  ' +
//                                 '  console.log( "extjs width..:" + Math.trunc( width ) );  ' +
//                                 '  console.log( "extjs imgH...:" + iH );  ' +
//                                 '  console.log( "-----------------------");  ' +
                   '  ajaxRequest( MainForm.htmlFrame, "_resizeAlerts" ,     ' +
                   '   ["pform=" + ' + QuotedStr( TUniControl( pFrame ).Name ) + ', ' +
//                   '    "pobj=" + ' + QuotedStr( TUniLabel( oObj ).Parent.Name ) + ', ' +
                   '    "pobj=" + ' + QuotedStr( TUniLabel( oObj ).Name ) + ', ' +
                   '    "pParentObj=" + ' + QuotedStr( TUniLabel( oObj ).Parent.Name ) + ', ' +
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
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_RCALERT_R.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_RCFEATURE_R( var pFrame : TObject; var oObj : TObject; var cCaption, cHint : string ) ;
var
   cAlertIco, cCaptionAlert,
   cTemp,cTemp2, cTemp3, cTemp4, cTemp5 : string;
   iW, iH : integer;
begin
   try
     //if Pos( 'rcfeature-r:' , cHint ) > 0 then
     begin
        cTemp4 := rc_GetHintAttr( 'oldrcfeaturecaption:', TUniControl( oObj ).Hint );
        if cCaption <> cTemp4 then
        begin
           cTemp4 := rc_GetHintAttr( 'oldrcfeature:', TUniControl( oObj ).Hint );
           if cTemp4 = '' then
              cTemp4 := rc_GetHintAttr( 'rcfeature-r:', cHint, false )
           else
           begin
              TUniControl( oObj ).Hint := StringReplace( TUniControl( oObj ).Hint, 'oldrcfeature:' + cTemp4, '', [rfReplaceAll] );
           end;
           cTemp2 := cTemp4;
           cTemp4 := StringReplace( cTemp4, 'hover-off', '', [rfReplaceAll] );

           TUniLabel( oObj ).TextConversion := txtHTML;
           //8.0.0.0
           TUniLabel( oObj ).Font.Name := mm.CONFIG_LAYOUT_APP_FONT;
           TUniLabel( oObj ).Font.Size := 8;
           if ( TUniLabel( oObj ).HasParent ) then
           begin
              iW := TUniLabel( oObj ).Parent.Width;
              iH := TUniLabel( oObj ).Parent.Height;
              if Pos( 'height:', TUniLabel( oObj ).Parent.Hint ) = 0 then
                 TUniLabel( oObj ).Parent.Hint := rc_AddHintAttr( '|height:' + TUniLabel( oObj ).Name, TUniLabel( oObj ).Parent.Hint, true )
              else
                 TUniLabel( oObj ).Parent.Hint := rc_AddHintAttr( '|hr:' + TUniLabel( oObj ).Name, TUniLabel( oObj ).Parent.Hint, true );
           end
           else
              dm_rc.rc_ShowToaster( 'danger', 'rcfeature-r: in UniLabel ' + TUniLabel( oObj ).name + ' must have a rcBlock parent.', false, 'pinItUp' );
           TUniLabel( oObj ).Align    := alNone;
           TUniLabel( oObj ).Anchors  := [];
           TUniLabel( oObj ).AutoSize := false;
           TUniLabel( oObj ).Left     := 0;
           TUniLabel( oObj ).Top      := 0;
           TUniLabel( oObj ).Width    := iW - 1;
           TUniLabel( oObj ).Height   := iH - 1;
           TUniLabel( oObj ).Anchors  := [akLeft,akTop,akRight];
           iW := 0;
           iH := 0;

           cTemp4 := cTemp4 + ' ';
           cCaption := rc_GetHintAttr( 'title:', cTemp4, true, true );
           cTemp4   := Copy( cTemp4, 1, Pos( ' ', cTemp4 ) - 1 );

           cTemp := cTemp4;
           cTemp4 := cCaption;
           cCaption := cTemp;

           cTemp3 := '';
           If Length( Copy( cCaption, 1, pos( '-', cCaption ) - 1 ) ) > 2 then
           begin
               cCaption := Copy( cCaption, 1, pos( '-', cCaption ) - 1 ) + ' fa-' + Copy( cCaption, pos( '-', cCaption ) + 1 );
           end
           else
               cCaption := 'fas ' + cCaption;

           TUniControl( oObj ).Hint    := StringReplace( TUniControl( oObj ).Hint, 'rcfeature-r:' + cTemp2, '', [rfReplaceAll] );
           TUniControl( oObj ).Hint    := rc_AddHintAttr( cTemp2, 'oldrcfeature:', true );
           //8.0.0.0
           cTemp2 :=
              '<div id="' + TUniControl( oObj ).Name + '" class="feature-tiles' + varIIF( Pos( ' hover-off', cHint ) > 0, '-no-hover', '' ) + '">' +
              '  <div class="feature' + varIIF( Pos( ' hover-off', cHint ) > 0, '-no-hover', '' ) + '">' +
              '    <div class="icon' + varIIF( Pos( ' hover-off', cHint ) > 0, '-no-hover', '' ) + '">' +
              '      <i class="' + cCaption + '"></i>' +
              '    </div>' +
              '    <div class="description' + varIIF( Pos( ' hover-off', cHint ) > 0, '-no-hover', '' ) + '">' +
              '      <h3>' + cTemp4 + '</h3>' +
              '      <p>' + TUniLabel( oObj ).Caption + '</p>' +
              '    </div>' +
              '  </div>' +
              '</div>' ;
           TUniControl( oObj ).Caption := cTemp2 ;
           TUniControl( oObj ).Hint    := rc_AddHintAttr( '|oldrcfeaturecaption:' + cTemp2, TUniControl( oObj ).Hint, true );
//                                    //8.0.0.0
//                                    UniSession.JSCode(
//                                       '$(document).ready(function(){' +
//                                       //'    var varI_divHeight = $(' + QuotedStr( '#' + TUniControl( oObj ).JSID ) + ').height();' +
//                                       '    var varI_divHeight = $(' + QuotedStr( '#' + TUniControl( oObj ).JSID  + ' .feature-tiles' ) + ').height();' +
////                                       '    console.log("The div is: " + $(' + QuotedStr( '#' + TUniControl( oObj ).JSID ) + ') );'  +
//                                       '    console.log("The height of the div is: " + varI_divHeight + "px");' +
//                                       '    ajaxRequest( MainForm.htmlFrame, "_ObjHeight" , ' + // 6.0.0.0
//                                       '      [' +
//                                       '       "pForm=" + ' + QuotedStr( TUniControl(pForm).Name ) + ' ,' +
//                                       '       "pObj=" + ' + QuotedStr( TUniLabel( oObj ).Name ) + ' ,' +
//                                       '       "pHeight=" + varI_divHeight ]);' +
//                                       '});'
//                                       );
//                                    UniSession.JSCode(
//                                       '$(document).ready(function(){' +
//                                       '    var varI_divHeight = $(' + QuotedStr( '#' + TUniControl( oObj ).Name ) + ').height();' +
//                                       //'    console.log("The height of the div is: " + divHeight + "px");' +
//                                       '    ajaxRequest( MainForm.htmlFrame, "_ObjHeight" , ' + // 6.0.0.0
//                                       '      ["h=" + varI_divHeight ]);' +
//                                       '});'
//                                       );  //mm.varC_TempAjaxEventString
           //rc_LocalStorageSet( 'divHeight', 'parseStr(varI_divHeight)' );
           //dm_rc.rc_AjaxRequest( '', '_ObjHeight', '"height="+varI_divHeight"' );
        end;
     end;

   except on e:exception do
      raise Exception.Create('Error On renderAttr_RCFEATURE_R.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_BSALERT_R( var pFrame : TObject; var oObj : TObject; var cCaption, cHint : string ) ;
var
   cAlertIco, cCaptionAlert,
   cTemp,cTemp2, cTemp3, cTemp4, cTemp5 : string;
   iW, iH : integer;
begin
   try
     //if Pos( 'bsalert-r:' , cHint ) > 0 then
     begin
         cTemp4 := rc_GetHintAttr( 'oldbsalertcaption:', TUniControl( oObj ).Hint );
         cCaptionAlert := cTemp4;

         if ( cCaptionAlert = '' ) or ( cCaptionAlert = Trim( TUniLabel( oObj ).Caption ) ) or ( Pos( cCaptionAlert, TUniLabel( oObj ).Caption ) = 0 ) then //  ( TUniLabel( oObj ).Caption <> cCaptionAlert ) then
         begin
              //8.0.0.0
              TUniLabel( oObj ).TextConversion := txtHTML;
              TUniLabel( oObj ).Font.Name := mm.CONFIG_LAYOUT_APP_FONT;
              TUniLabel( oObj ).Font.Size := 8;
              if ( TUniLabel( oObj ).HasParent ) then
              begin
                 iW := TUniLabel( oObj ).Parent.Width;
                 iH := TUniLabel( oObj ).Parent.Height;
                 if Pos( 'height:', TUniLabel( oObj ).Parent.Hint ) = 0 then
                    TUniLabel( oObj ).Parent.Hint := rc_AddHintAttr( '|height:' + TUniLabel( oObj ).Name, TUniLabel( oObj ).Parent.Hint, true )
                 else
                    TUniLabel( oObj ).Parent.Hint := rc_AddHintAttr( '|hr:' + TUniLabel( oObj ).Name, TUniLabel( oObj ).Parent.Hint, true );
              end
              else
                 dm_rc.rc_ShowToaster( 'danger', 'bsalert-r: in UniLabel ' + TUniLabel( oObj ).name + ' must have a rcBlock parent.', false, 'pinItUp' );
              TUniLabel( oObj ).Align    := alNone;
              TUniLabel( oObj ).Anchors  := [];
              TUniLabel( oObj ).AutoSize := false;
              TUniLabel( oObj ).Left     := 0;
              TUniLabel( oObj ).Top      := 0;
              TUniLabel( oObj ).Width    := iW - 1;
              TUniLabel( oObj ).Height   := iH - 1;
              TUniLabel( oObj ).Anchors  := [akLeft,akTop,akRight];
              iW := 0;
              iH := 0;
//                                     if TUniLabel( oObj ).Align = alClient then
//                                     begin
//                                          iW := TUniLabel( oObj ).Width;
//                                          iH := TUniLabel( oObj ).Height;
//                                          TUniLabel( oObj ).Align := alNone;
//                                          TUniLabel( oObj ).Anchors := [];
//                                          TUniLabel( oObj ).AutoSize := false;
//                                          TUniLabel( oObj ).Left := 1;
//                                          TUniLabel( oObj ).Top  := 1;
//                                          TUniLabel( oObj ).Width := iW - 2;
//                                          TUniLabel( oObj ).Height := iH - 2;
//                                          TUniLabel( oObj ).Anchors := [akLeft,akTop,akRight,akBottom];
//                                          iW := 0;
//                                          iH := 0;
//                                     end;
//                                     TUniLabel( oObj ).TextConversion := txtHTML;

            if ( TUniLabel( oObj ).Caption <> cCaptionAlert ) then
               cCaptionAlert := TUniLabel( oObj ).Caption;

            cTemp4   := rc_GetHintAttr( 'bsalert-r:', cHint, false );
            cAlertIco:= rc_GetHintAttr( 'alert-ico:', cHint, true, true ) + ' ';
            cAlertIco:= Trim( Copy( cAlertIco, 1, Pos( ' ', cAlertIco ) ) );
            cTemp4   := cTemp4 + ' ';
            cTemp    := Copy( cTemp4, 1, pos( ' ', cTemp4 ) - 1 ) + ' ';
            cTemp4   := trim(Copy( cTemp, pos( ' ', cTemp ) + 1 ));
            cTemp    := Copy( cTemp, 1, pos( ' ', cTemp ) - 1 );
            cCaption := 'fas fa-' + cTemp;
            cTemp3   := mm.MSG_INFO;
            if cTemp = 'danger' then
            begin
               cCaption := 'fas fa-ban';
               cTemp3   := mm.MSG_DANGER;
            end
            else
            if cTemp = 'warning' then
            begin
               cCaption := 'fas fa-exclamation-triangle';
               cTemp3   := mm.MSG_WARNING;
            end
            else
            if cTemp = 'success' then
            begin
               cCaption := 'fas fa-check';
               cTemp3   := mm.MSG_SUCCESS;
            end;

            if cAlertIco <> '' then
            begin
               cCaption  := Copy( cAlertIco, 1, Pos( '-', cAlertIco ) - 1 );
               cAlertIco := Copy( cAlertIco, Pos( '-', cAlertIco ) + 1 );
               cAlertIco := cCaption + ' fa-' + cAlertIco ;
               cCaption  := cAlertIco;
            end;

            cTemp2 := '<div class="alert alert-' + cTemp + ' rc-label-wrap">';
            if ( Pos('title-off', cHint ) = 0 )  and ( Pos('icon-off', cHint ) = 0 ) then
               cTemp2 := cTemp2 + '<h5><i class="icon ' + cCaption + '"></i> '+ cTemp3 + '</h5>'
            else
            if ( Pos('title-off', cHint ) > 0 ) then
               cTemp2 := cTemp2 + '<h5><i class="icon ' + cCaption + '"></i></h5>'
            else
            if ( Pos('icon-off', cHint ) > 0 ) then
               cTemp2 := cTemp2 + '<h5>'+ cTemp3 + '</h5>';

            cTemp2 := cTemp2 + cCaptionAlert +
                      '</div>';

            TUniControl( oObj ).Caption := cTemp2 ;
            TUniControl( oObj ).Hint    := rc_AddHintAttr( '|oldbsalertcaption:' + cCaptionAlert, TUniControl( oObj ).Hint, true );
         end;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_BSALERT_R.' + sLineBreak + e.Message);
   end;
end;

end.
