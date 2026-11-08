unit mkm_layout_aux_labels; //8.2.0.0

interface

uses
    System.SysUtils,
    System.TypInfo,
    System.Classes,
    Vcl.Controls,
    Vcl.Graphics,
    uniGUIClasses,
    uniGUIApplication,
    uniGUITypes,
    uniLabel,
    uniHTMLFrame,
    uconsts
    ;

    procedure renderAttr_LABELS( pForm : TObject; var oControl : TUniControl; var cHint : string );

implementation

uses mkm_layout, mkm_layout_aux, untDM_RC, MainModule, mkm_func_web, str_func;

procedure renderAttr_LABELS( pForm : TObject; var oControl : TUniControl; var cHint : string );
var

   cCmd, cTmp, cLink, cCaption,
   cField,FieldValue1,
   cBadge,cBadgeColor,cBadgeModel,cBadgePos,cBadgeImg,//8.2.0.0
   cParam1,
   cClass,cClassCaption,cClassIco,cIco,
   cTemp,cTemp2,cTemp3,cTemp4 : string;
   oBlock : TUniControl;
   oHtmlFrm  : TUniHTMLFrame;
   bAppend : boolean;
   iPos, iPos2,iZoom,f : integer;
begin
   try
     TUniLabel( oControl ).TextConversion := txtHTML;

     if rc_AttrExists( 'marquee:', TUniControl( oControl ).Hint ) then //8.0.0.0
     begin
          if Not Assigned( TUniLabel( oControl ).OnClick ) then
          begin
             TUniLabel( oControl ).OnClick := dm_rc.rc_MarqueeToggle;
             if TUniLabel( oControl ).Cursor <> crHandPoint then
                TUniLabel( oControl ).Cursor  := crHandPoint;
          end;
     end;

     cTemp2 := '';
     cTemp3 := '';
     if Trim( cHint ) <> '' then
        cTemp2 := cHint + '|';

     cCmd    := cTemp2;
     bAppend := false;
     //8.0.0.0
     iPos2 := Pos( '|' , cTemp2 );
     if ( iPos2 = 1 ) then
     begin
         cTemp2 := cTemp2.Substring( 1 );
         iPos2 := Pos( '|' , cTemp2 );
         cCmd  := cTemp2;
     end;
     if cTemp2 <> '' then
     begin
        cTemp  := Trim( Copy( cCmd, 1 , iPos2 ) );
        cTemp2 := Trim( StringReplace( cCmd, cTemp, '', [rfReplaceAll] ) );
        cCmd   := cTemp2;
        cTemp  := StringReplace( cTemp, '|', '', [rfReplaceAll] ) + ' ';
        cTemp  := cHint;
        //8.0.0.0
        if rc_AttrExists( 'label-wrap:', cTemp ) then
           rc_AddCssClass( oControl, 'rc-label-wrap' );

        if ( rc_AttrExists( 'ico:', cTemp ) ) and ( rc_AttrExists( 'cls-ico:', cTemp ) ) then//8.0.0.0
        begin
             cClass := '';
             cClassCaption := '';
             cClassIco := '';
             cIco := rc_GetHintAttr( 'ico:' , cTemp );
        end;

        if rc_AttrExists( 'cls:', cTemp ) then //8.0.0.0
        begin
             cClass := rc_GetHintAttr( 'cls:' , cTemp );
             cClassCaption := cClass;
        end;

        if rc_AttrExists( 'cls-ico:', cTemp ) then //8.0.0.0
        begin
             cClass := rc_GetHintAttr( 'cls-ico:' , cTemp );
        end;
        //8.2.0.0
        if Pos( 'badge:', cTemp ) > 0 then
        begin
           cBadgeColor := rc_GetHintAttr( 'badge:' , cTemp);
           cBadge      := Copy( cBadgeColor, 1, pos( ' ', cBadgeColor ) - 1 );
           cBadgeColor := Copy( cBadgeColor, pos( 'color:', cBadgeColor ) + 6 ) + ' ';
           cBadgePos   := trim( Copy( cBadgeColor, Pos ( ' ', cBadgeColor ) + 1 ) );
           cBadgeColor := stringReplace( cBadgeColor, cBadgePos, '', [rfReplaceAll] );
           if ( cBadgePos <> '' ) and ( (  cBadgePos = 'top' ) or ( cBadgePos = 'bottom' ) ) then
           begin
             cBadgePos := 'badge-' + cBadgePos;
           end;
           cBadgeColor := trim( cBadgeColor );
           cBadgeModel := '';
           cBadgeImg   := '';
           if pos( '-', cBadgeColor ) > 0 then
              cBadgeModel := Copy( cBadgeColor, pos( '-', cBadgeColor ) );

           if cBadgeModel <> '' then
           begin
              cBadgeModel := cBadgeModel + ' ';
              cBadgeModel := Trim( Copy( cBadgeModel , 1, Pos( ' ', cBadgeModel ) ) );
           end;

           if cBadgeModel <> '' then
              cBadgeColor := stringReplace( cBadgeColor, cBadgeModel, '', [rfReplaceAll] );

           If Pos( 'img:', cTemp ) > 0 then
           begin
              cBadgeModel := cBadgeModel + '-img';
              cBadgeImg   := Copy( cTemp, pos( ' img:', cTemp ) + 5 );
              cBadgeColor := stringReplace( cBadgeColor, ' img:' + cBadgeImg, '', [rfReplaceAll] );
           end;

           //cBadge      := '<span class="align-btn-caption badge bg-' + cBadgeColor + '">' + cBadge + '</span>'; //7.3.0.0
           //cBadge      := '<span class="align-btn-caption rc-badge bg-' + cBadgeColor + '">' + cBadge + '</span>'; //7.3.0.0
//           cBadgePos := varIIF( Pos( ' top', cTemp ) > 0, 'badge-top', '' );
//           If cBadgePos = '' then
//              cBadgePos := varIIF( Pos( ' bottom', cTemp ) > 0, 'badge-bottom', '' );
           if Pos( '-lite' , cBadgeModel ) = 0 then
              cBadge := '<span class="align-btn-caption ' +  cBadgePos + ' badge text-bg-' + cBadgeColor + ' rounded-pill">' + cBadge + '</span>'
           else
           if Pos( '-border' , cBadgeModel ) > 0 then
              cBadge := '<span class="align-btn-caption ' +  cBadgePos + ' badge bg-' + cBadgeColor + '-subtle border border-' + cBadgeColor + '-subtle text-' + cBadgeColor + '-emphasis rounded-pill">' + cBadge + '</span>'
           else
           if Pos( '-img' , cBadgeModel ) > 0 then
           begin
              TUniLabel( oControl ).Caption := '';
              cBadge := '<span class="badge d-flex align-items-center p-1 pe-2 text-' + cBadgeColor + '-emphasis bg-' + cBadgeColor + '-subtle border border-' + cBadgeColor + '-subtle rounded-pill"><img class="rounded-circle me-1" width="24" height="24" src="' + cBadgeImg + '" alt="">' + cBadge + '</span>';
           end
           else
           if Pos( '-lite' , cBadgeModel ) > 0 then
              cBadge := '<span class="align-btn-caption ' +  cBadgePos + ' badge bg-' + cBadgeColor + '-subtle text-' + cBadgeColor + '-emphasis rounded-pill">' + cBadge + '</span>';
        end;
        // 6.0.0.0
        cIco := rc_GetHintAttr( 'ico:' , cTemp );
        // 6.0.0.0
        if cIco <> '' then
        begin
             if ( Pos( 'rtl:', cIco ) > 0 ) then
             begin
                  cParam1 := rc_GetHintAttr( 'rtl:' , cIco );
                  if ( mm.rtl ) then
                  begin
                     if cParam1 <> '' then
                     begin
                        rc_AddCssClass( TUniLabel( oControl ), cParam1 );
                     end;
                  end;
                  cIco := trim( StringReplace( cIco, 'rtl:' + cParam1, '', [rfReplaceAll] ) );
             end;
        end;

        if rc_AttrExists( 'field-ico:', cTemp ) then //8.0.0.0
        begin
             cTmp := rc_GetHintAttr( 'field-ico:' , cTemp );

             if Pos( ' ds:', cTmp ) > 0 then
                cTmp := Copy( cTmp, 1, Pos( ' ds:', cTmp ) - 1 );

             cField     := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
             //FieldValue := pDS.DataSet.FieldByName( cField ).Value;
             cTmp       := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );

             FieldValue1 := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
             cTmp        := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );
             FieldValue1 := Copy( FieldValue1, 7, 2000 );
             cParam1     := Trim( Copy( FieldValue1, Pos( ':', FieldValue1 ) +1, 2000 ) );
             FieldValue1 := Copy( FieldValue1, 1, Pos( ':', FieldValue1 ) -1 );
             cIco        := cParam1;
        end;

        if rc_AttrExists( 'cls-caption:', cTemp ) then //8.0.0.0
        begin
             cClassCaption := cClass + ' ' + rc_GetHintAttr( 'cls-caption:' , cTemp );
        end;

        if ( rc_AttrExists( 'label-link:', cTemp ) ) or ( rc_AttrExists( 'link:', cTemp ) ) then //8.0.0.0
        begin
             cLink := rc_GetHintAttr( 'label-link:' , cTemp );
             if cLink = '' then
                cLink := rc_GetHintAttr( 'link:' , cTemp );

             TUniLabel( oControl ).Font.Color := StringToColor( mm.CONFIG_LAYOUT_LINK_COLOR );
             TUniLabel( oControl ).TextConversion := txtHTML;
             // 6.0.0.0
             TUniLabel( oControl ).Caption :=
               '<a class="rc-link-theme-underline" href="' + cLink + '" target="_blank" >' + TUniLabel( oControl ).Caption + '</a>';
        end;
        iPos2 := Pos( '|' , cCmd );
     end;

     //8.0.0.0
     if not bAppend then
        bAppend := rc_AttrExists( 'append', cHint ) ;
     iPos := rc_PosHintAttr( 'caption:' , cHint );
     if ( bAppend ) and ( iPos = 0 ) then
     begin
        cCaption := TUniControl( oControl ).Caption;
        cHint := rc_SetHintAttr( cCaption, 'caption:' ,  cHint  ) ;
     end
     else
     if iPos > 0 then
     begin
        cCaption := rc_GetHintAttr( 'caption:' ,  cHint  );
     end;
     cTemp3 := rc_GetHintAttr( 'rc-bsh:' ,  cHint  );
     If cTemp3 <> '' then
     begin
          cHint := cTemp3 + ':|' + cHint;
     end;

     cHint := rc_NormalizeHintAttr( cHint );
     if Pos( '[[', cHint ) = 0 then
        cHint := '[[' + cHint + ']]';
     TUniControl( oControl ).Hint := cHint;
     cTemp3 := '';


     cTemp3 := rc_GetHintAttr( 'ico-stack:' , cHint );
     if cTemp3 <> '' then
     begin
        cTemp := 'circle';
        if Pos( 'type:', cTemp3 ) > 0 then
        begin
           cTemp := Copy( cTemp3, Pos( 'type:', cTemp3 ) + 5 ) + ' ';
           cTemp := Copy( cTemp , 1, pos( ' ', cTemp )-1 );
        end;
        // 6.0.0.0
        cTemp3 := rc_AdjustIconsNames( cTemp3 );

        cTemp2 := rc_GetHintAttr( 'cls:' , cHint, true );
        if cTemp2 = '' then
           cTemp2 := 'text-primary';

        cTemp4 := rc_GetHintAttr( 'size:' , cHint, true );
        if cTemp4 <> '' then
           cTemp4 := 'fa-' + cTemp4;

        TUniControl( oControl ).Caption :=
            '<span class="fa-stack ' + cTemp4 + '">' +
            '  <i class="fas fa-' + cTemp + ' fa-stack-2x ' + cTemp2 + '"></i>' +
            '  <i class="' + cTemp3 + ' fa-stack-1x fa-inverse"></i>' +
            '</span>' ;
     end
     else
     //8.0.0.0
     if ( Trim( cIco ) <> '' ) or ( cCaption <> '' ) then
     begin
        (*6.0.0.0+fontaws6
        <i class="fa-light fa-copy"></i>
        <i class="fa-regular fa-copy"></i>
        <i class="fa-solid fa-copy"></i>
        <i class="fa-thin fa-copy"></i>
        <i class="fa-duotone fa-copy"></i>
        <i class="fa-sharp fa-copy"></i>
        <i class="fa-sharp fa-light fa-copy"></i>
        *)
        // icon type
        cTemp3  := Copy( cIco , 1, Pos( '-' , cIco ) - 1 ) ;
        //8.2.0.0
        cTemp3 := rc_AdjustIconsNames( cIco );
//        if Copy( cTemp3, 1, 2 ) = 'fa' then
//           cTemp3 := cTemp3 + ' fa-'
//        else
//        if cTemp3 <> '' then
//           cTemp3 := cTemp3 + ' picto-';
        // icon name
        cTemp2 := Copy( cIco , Pos( '-' , cIco ) + 1, 100 ) ;
        // has a zoom ?( font awesome 2x...)
        iZoom := 0; //6.0.0.0
        for f := 1 to 4 do
        begin
        if ( Pos( ' ' + f.ToString + 'x' , cHint ) > 0 ) then
           iZoom := StrToIntDef( ReturnNumbers( Copy( cHint, Pos( ' ' + f.ToString + 'x' , cHint ) , 3 ) ), 0 );
        end;
        //8.2.0.0
        if iZoom > 0 then
        begin
           //cTemp2 := StringReplace( cTemp2, iZoom.ToString + 'x' , '', [rfReplaceAll] );
           cTemp3 := StringReplace( cTemp3, ' ' + iZoom.ToString + 'x' , '', [rfReplaceAll] );
        end;
        //8.2.0.0
        if ( Trim( cIco ) <> '' ) then
           TUniControl( oControl ).Caption := '<i class="' + cClass + ' ' + cTemp3 + //cTemp2 +
                        varIIF( iZoom > 0 , ' fa-' + iZoom.ToString + 'x' , ' fa-lg' ) + '"></i>';
        // append caption if exists
        if bAppend then
        begin
           iPos := Pos( '|append' , cHint );
           if iPos = 0 then
              iPos := Pos( '| append' , cHint );
           // hidden-caption
           //
           // mobile-v  : in MOBILE PORTRAIT MODE
           // mobile-h  : in MOBILE LANDSCAPE MODE
           // mobile    : in MOBILE MODE
           // 6.0.0.0
           if Pos( 'caption-hide:', cHint ) > 0 then
           begin
              cTemp3 := ( rc_GetHintAttr( 'caption-hide:', cHint ) );
              if rc_IsMobile_V( cTemp3 ) then //8.0.0.0
                 cCaption := ''
              else
              if rc_IsMobile_H( cTemp3 ) then //8.0.0.0
                 cCaption := ''
              else
              if rc_IsMobile( cTemp3 ) then //8.0.0.0
                 cCaption := ''
              else
              if rc_IsDesktop( cTemp3 ) then //8.0.0.0
                 cCaption := '';
           end;

           //7.0.0.0
           if cCaption = '' then
              rc_RemoveCssClass( TUniControl( oControl ), 'align-btn-caption' )
           else
           if cIco <> '' then
           begin
                cCaption := '&nbsp' + cCaption;
           end;
           //8.0.0.0
           if ( Trim( cIco ) <> '' ) then
           begin
              TUniControl( oControl ).Caption :=
                  TUniControl( oControl ).Caption +
                  '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>' + cCaption + cBadge + '</span>' ;
           end
           else
           begin
              TUniControl( oControl ).Caption := cCaption;
           end;
        end;

     end
     else
     if cClass <> '' then
     begin
          rc_AddCssClass( oControl, cClass );
     end;

     if ( cBadge <> '' ) and ( Pos( 'badge', TUniControl( oControl ).Caption ) = 0 ) then
     begin
        TUniControl( oControl ).Caption :=
            '<span>' + TUniControl( oControl ).Caption + cBadge + '</span>' ;
        cBadge := '';
     end;

     // bsswt / bschk - Initial ON
     cTemp := ReturnNumbers( Copy( cHint, Pos( 'bsswt' , lowercase( cHint ) ) , 7 ) );  //7.5.0.3 lowercase
     iPos  := Pos( 'bsswt' , lowercase( cHint ) ); //7.5.0.3 lowercase

     if ( iPos = 0 ) then
     begin
        cTemp := ReturnNumbers( Copy( cHint, Pos( 'bschk' , lowercase( cHint ) ) , 7 ) );  //7.5.0.3 lowercase
        iPos  := Pos( 'bschk' , lowercase( cHint ) ); //7.5.0.3 lowercase
     end;

     if ( iPos > 0 ) and ( cTemp = '1' ) then
     begin
            TUniControl( oControl ).Tag := 1;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_LABELS.' + sLineBreak + e.Message);
   end;
end;

end.
