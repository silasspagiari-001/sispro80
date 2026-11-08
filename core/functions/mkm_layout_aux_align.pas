unit mkm_layout_aux_align; //8.4.0.1

interface

uses
    System.SysUtils,
    System.Classes,
    System.TypInfo,
    Vcl.Controls,
    uniGUIClasses,
    uniGUIForm,
    uniGUIFrame,
    uniPanel,
    uniDBGrid,
    uniLabel
    ;

    procedure renderAttr_ALIGN( var pFrame : TObject; var oObjTemp : TUniControl; var cTemp : string ) ;
    procedure renderAttr_ALIGNMENT( var oObjTemp : TUniControl; var cHint : string ) ;
    procedure renderAttr_ANCHOR( var pFrame : TObject; var oObjTemp : TUniControl; var cTemp,cHint : string ) ;
    function DynamicAlignment_CENTER( pFrame : TObject; pObj : TUniControl; pParam1, pParam2 : string ):boolean;
    // alinhamento do label vertical centralizado + horizontal / vertical label alignment centered + horizontal
    // left-center   center  right-center
    procedure rc_AlignLabel( pLabel : TUniLabel ; pAlign : string = 'left-center' );

implementation

uses untdm_rc, mkm_func_web, MainModule, mkm_layout;

procedure renderAttr_ALIGN( var pFrame : TObject; var oObjTemp : TUniControl; var cTemp : string ) ;
var
   cAlignMobileOff, cAlignMobile,cTemp3, cTemp4 : string;
   oComponent : TComponent;
   oObjTemp2 : TUniControl;
   n, iRight, iLeft, iTop, iBottom : integer;
   bMobile, bMobile_off : boolean;
begin
   try
      cTemp3 := rc_GetHintAttr( 'align:', cTemp ) ;
      if ( cTemp3 <> '' ) and ( Pos( 'fieldmasks:', oObjTemp.Hint ) = 0 ) and ( Pos( 'grid-fm-rs!', oObjTemp.Hint ) = 0 ) then // 7.0.0.0 "align:"
      begin
         cTemp           := StringReplace( cTemp3, 'default-offset', mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET , [rfReplaceAll] ); // 7.0.0.0 "align:"
         cTemp3          := cTemp; // 7.0.0.0 "align:"
         cAlignMobileOff := cTemp3;
         cAlignMobile    := cTemp3;
         bMobile_off     := ( Pos( 'mobile-off', cTemp3 ) > 0 ) and ( mm.varB_Mobile_Screen );

         if ( not bMobile_off ) or ( bMobile ) then
         begin
            cTemp3 := Copy( cTemp3, 1, Pos( ' ' , cTemp3 ) - 1 );

            if cTemp3 = 'parent' then
            begin
               // on linux have problems without .HasParent
               if oObjTemp.HasParent then
                 oComponent := oObjTemp.GetParentComponent
               else
                 oComponent := nil;

               oObjTemp2   := TUniControl( oComponent );
            end
            else
               oObjTemp2 := rc_FindControl( cTemp3, pFrame );

            if oObjTemp2 <> nil then
            begin
                if Pos( 'r:', cTemp ) > 0 then
                begin
                   cTemp3 := Copy( cTemp, Pos( 'r:', cTemp ) + 2, 300 ) + ' ';

                   if Pos( 'w', cTemp3 ) > 0 then
                   begin
                       cTemp4 := Copy( cTemp3, Pos( 'w', cTemp3 ) + 1, 10 );
                       cTemp4 := Trim( Copy( cTemp4, 1, Pos( ' ', cTemp4 ) - 1 ) );
                       n := StrToIntDef( cTemp4, 0 );

                       cTemp3 := StringReplace( cTemp3, cTemp4, '', [rfReplaceAll] );
                       iRight := oObjTemp.Width * varIIF( Pos( '-w', cTemp3 ) > 0, (-1) , 1 ) + n;
                   end
                   else
                      iRight := StrToIntDef( Copy( cTemp3, 1, Pos( ' ' , cTemp3 ) - 1 ), 0 );

                   //8.4.0.1
                   if ( TComponent(oObjTemp2) is TUniForm ) or ( TComponent(oObjTemp2) is TUniFrame ) then
                      oObjTemp.Left := oObjTemp2.Width + iRight
                   else
                      oObjTemp.Left := oObjTemp2.Left + oObjTemp2.Width + iRight;
                end;

                if Pos( 'l:', cTemp ) > 0 then
                begin
                   cTemp3 := Copy( cTemp, Pos( 'l:', cTemp ) + 2, 300 ) + ' ';

                   if Pos( 'w', cTemp3 ) > 0 then
                   begin
                       cTemp4 := Copy( cTemp3, Pos( 'w', cTemp3 ) + 1, 10 );
                       cTemp4 := Trim( Copy( cTemp4, 1, Pos( ' ', cTemp4 ) - 1 ) );
                       n := StrToIntDef( cTemp4, 0 );

                       cTemp3 := StringReplace( cTemp3, cTemp4, '', [rfReplaceAll] );
                       iLeft := oObjTemp.Width * varIIF( Pos( '-w', cTemp3 ) > 0, (-1) , 1 ) + n;
                   end
                   else
                      iLeft := StrToIntDef( Copy( cTemp3, 1, Pos( ' ' , cTemp3 ) - 1 ), 0 );
                   //8.4.0.1
                   if ( TComponent(oObjTemp2) is TUniForm ) or ( TComponent(oObjTemp2) is TUniFrame ) then
                      oObjTemp.Left := iLeft
                   else
                      oObjTemp.Left := oObjTemp2.Left + iLeft;
                end;

                if Pos( 't:', cTemp ) > 0 then
                begin
                   cTemp3 := Copy( cTemp, Pos( 't:', cTemp ) + 2, 300 ) + ' ';

                   if Pos( 'h', cTemp3 ) > 0 then
                   begin
                       cTemp4 := Copy( cTemp3, Pos( 'h', cTemp3 ) + 1, 10 );
                       cTemp4 := Trim( Copy( cTemp4, 1, Pos( ' ', cTemp4 ) - 1 ) );
                       n := StrToIntDef( cTemp4, 0 );

                       cTemp3 := StringReplace( cTemp3, cTemp4, '', [rfReplaceAll] );
                       iTop := oObjTemp.Height * varIIF( Pos( '-h', cTemp3 ) > 0, (-1) , 1 ) + n;
                   end
                   else
                      iTop := StrToIntDef( Copy( cTemp3, 1, Pos( ' ' , cTemp3 ) - 1 ), 0 );

                   //8.4.0.1
                   if ( TComponent(oObjTemp2) is TUniForm ) or ( TComponent(oObjTemp2) is TUniFrame ) then
                      oObjTemp.Top := iTop
                   else
                      oObjTemp.Top := oObjTemp2.Top + iTop;
                end;

                if Pos( 'b:', cTemp ) > 0 then
                begin
                   cTemp3 := Copy( cTemp, Pos( 'b:', cTemp ) + 2, 300 ) + ' ';

                   if Pos( 'h', cTemp3 ) > 0 then
                   begin
                       cTemp4 := Copy( cTemp3, Pos( 'h', cTemp3 ) + 1, 10 );
                       cTemp4 := Trim( Copy( cTemp4, 1, Pos( ' ', cTemp4 ) - 1 ) );
                       n := StrToIntDef( cTemp4, 0 );

                       cTemp3 := StringReplace( cTemp3, cTemp4, '', [rfReplaceAll] );
                       iBottom := oObjTemp.Height * varIIF( Pos( '-h', cTemp3 ) > 0, (-1) , 1 ) + n;
                   end
                   else
                       iBottom := StrToIntDef( Copy( cTemp3, 1, Pos( ' ' , cTemp3 ) - 1 ), 0 );

                   //8.4.0.1
                   if ( TComponent(oObjTemp2) is TUniForm ) or ( TComponent(oObjTemp2) is TUniFrame ) then
                      oObjTemp.Top := oObjTemp2.Height + iBottom
                   else
                      oObjTemp.Top := oObjTemp2.Top + oObjTemp2.Height + iBottom;
                end;
            end
            else
            begin
                 dm_rc.rc_ShowSweetAlert( 'Error' , 'ALIGN Obj:' + cTemp3 + ' not found.' , 'error' );
            end;
         end;
      end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_ALIGN.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_ALIGNMENT( var oObjTemp : TUniControl; var cHint : string ) ;
var
   cTemp3 : string;
begin
    cTemp3 := rc_GetHintAttr( 'alignment:', cHint ) ;
    if ( cTemp3 <> '' ) and ( GetPropInfo( oObjTemp.ClassInfo, 'Alignment') <> nil ) then
    begin
       cTemp3 := cTemp3 + '.';
       cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );
       //8.0.0.0
       if rc_IsMobile_V( cTemp3 ) then //8.0.0.0
          cTemp3 := rc_GetHintAttr( 'mobile-v-', cTemp3, true )
       else
       if rc_IsMobile_H( cTemp3 ) then //8.0.0.0
          cTemp3 := rc_GetHintAttr( 'mobile-h-', cTemp3, true )
       else
       if rc_IsMobile( cTemp3 ) then //8.0.0.0
          cTemp3 := rc_GetHintAttr( 'mobile-', cTemp3, true )
       else
       //desktop
       if ( not mm.varB_Mobile_Screen ) then
       begin
          cTemp3 := cTemp3 + ' ';
          cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
       end;

       if ( cTemp3 = 'right' ) then
          oObjTemp.Alignment := taRightJustify
       else
       if ( cTemp3 = 'left' ) then
          oObjTemp.Alignment := taLeftJustify
       else
       if ( cTemp3 = 'center' ) then
          oObjTemp.Alignment := taCenter;
    end;

end;

procedure renderAttr_ANCHOR( var pFrame : TObject; var oObjTemp : TUniControl; var cTemp,cHint : string ) ;
var
   oComponent : TComponent;
   oObjTemp2 : TUniControl;
   cTemp2, cTemp3 : string;
   iTop,
   iLeft,
   iRight,
   iBottom,
   x, y : integer;
begin
   cTemp3 := rc_GetHintAttr( 'anchor:', cHint ) ;
   if ( Pos( 'anchor:', cTemp ) > 0 ) and ( GetPropInfo( oObjTemp.ClassInfo, 'Anchors') <> nil ) then
   begin
      x       := 0;
      iTop    := 0;
      iLeft   := 0;
      iRight  := 0;
      iBottom := 0;

      cTemp2 := rc_GetHintAttr( 'off-', cTemp3, true ) ;
      //7.2.0.0
      if cTemp2 = 'default-' then
         cTemp2 := mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET;

      if cTemp2 <> '' then
      begin
         x := StrToIntDef( ReturnNumbers( cTemp2 ) , 0 );
         iTop    := x;
         iLeft   := x;
         iRight  := x;
         iBottom := x;
      end;
      if x = 0 then
      begin
         cTemp2 := rc_GetHintAttr( 'off-t-', cTemp3, true ) ;
         if cTemp2 <> '' then
         begin
              iTop := StrToIntDef( ReturnNumbers( cTemp2 ) , 0 );
         end;
         cTemp2 := rc_GetHintAttr( 'off-r-', cTemp3, true ) ;
         if cTemp2 <> '' then
         begin
              iRight := StrToIntDef( ReturnNumbers( cTemp2 ) , 0 );
         end;
         cTemp2 := rc_GetHintAttr( 'off-l-', cTemp3, true ) ;
         if cTemp2 <> '' then
         begin
              iLeft := StrToIntDef( ReturnNumbers( cTemp2 ) , 0 );
         end;
         cTemp2 := rc_GetHintAttr( 'off-b-', cTemp3, true ) ;
         if cTemp2 <> '' then
         begin
              iBottom := StrToIntDef( ReturnNumbers( cTemp2 ) , 0 );
         end;
      end;

      if oObjTemp.HasParent then
        oComponent := oObjTemp.GetParentComponent
      else
        oComponent := nil;

      oObjTemp2   := TUniControl( oComponent );

      iRight  := oObjTemp2.Width - iRight - iLeft;//( iRight * 2 );
      iBottom := oObjTemp2.Height - iBottom - iTop;//( iBottom * 2 );
      if ( iTop = iBottom ) then
      begin
           iBottom := oObjTemp2.Height - ( iBottom * 2 );
      end;
      if ( iRight = iLeft ) then
      begin
           iRight  := oObjTemp2.Width - ( iRight * 2 );
      end;

      cTemp3 := cTemp3 + '.';
      cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );
      //8.0.0.0
      if rc_IsMobile_V( cTemp3 ) then //8.0.0.0
         cTemp3 := rc_GetHintAttr( 'mobile-v-', cTemp3, true )
      else
      if rc_IsMobile_H( cTemp3 ) then //8.0.0.0
         cTemp3 := rc_GetHintAttr( 'mobile-h-', cTemp3, true )
      else
      if rc_IsMobile( cTemp3 ) then //8.0.0.0
         cTemp3 := rc_GetHintAttr( 'mobile-', cTemp3, true )
      else
      //desktop
      if ( not mm.varB_Mobile_Screen ) then
      begin
         cTemp3 := cTemp3 + ' ';
         cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
      end;
      // 7.0.0.0
      oObjTemp.Align   := alNone;
//                               oObjTemp.Anchors := [akLeft, akTop];
      if oObjTemp2 <> nil then
      begin
           oObjTemp.Left   := iLeft;
           oObjTemp.Top    := iTop;
           oObjTemp.Width  := iRight;// oObjTemp2.Width;
           oObjTemp.Height := iBottom;// oObjTemp2.Height;
           // 6.0.0.0 grid
           oObjTemp2 := TUniContainerPanel( TComponent(pFrame).FindComponent( 'paPageBar_' + oObjTemp.Name ) );
           if ( oObjTemp is TUniDBGrid ) and ( oObjTemp2 <> nil ) then
              oObjTemp.Height := oObjTemp.Height - oObjTemp2.Height;
      end;
      // 6.0.0.0 grid
      oObjTemp.Anchors := [akLeft, akTop, akRight, akBottom ];
      cTemp2 := '';
   end;
end;

function DynamicAlignment_CENTER( pFrame: TObject; pObj : TUniControl ; pParam1, pParam2 : string ):boolean;
var
   oComponent : TComponent;
   oObjTemp, oObjTemp2 : TUniControl;

   cCaption,
   cCmd, cTemp, cTemp2, cTemp3, cTemp4, cHint : string;

   iOffSet,
   iii,
   i,n,x,y,w,h, iLeft, iTop, iRight, iBottom, iWidth, iHeight,
   iPos, iPos2, iTemp : integer;
   bMobile_off,
   bDots : boolean;
begin
   bMobile_off := Pos( 'mobile-off', pParam2 ) > 0;
   if bMobile_off then
   begin
        pParam2 := StringReplace( pParam2, 'mobile-off', '', [rfReplaceAll] );
   end;
   cTemp3   := pParam1 + ' ';//6.0.0.0
   cTemp    := pParam2;
   oObjTemp := pObj;
   if cTemp3 <> '' then
   begin
      x := 0;
      y := 0;

      cTemp3 := Copy( cTemp3, 1, Pos( ' ' , cTemp3 ) - 1 );

      oObjTemp2 := nil;

      Result := true;

      if cTemp3 = 'parent' then
      begin
         // on linux have problems without .HasParent
         if oObjTemp.HasParent then
           oComponent := oObjTemp.GetParentComponent
         else
           //oComponent := nil;
           oComponent := oObjTemp.Owner;

         oObjTemp2   := TUniControl( oComponent );
      end
      else
         oObjTemp2 := rc_FindControl( cTemp3, pFrame );

      cTemp3 := Trim (StringReplace( cTemp, 'center:' + cTemp3, '', [rfReplaceAll] ) );

      if ( cTemp3 = 'x' ) or ( cTemp3 = 'y' ) or ( cTemp3 = 'xy' ) then
      begin
         if ( bMobile_off ) then
         begin
            if ( not mm.varB_Mobile_Screen ) then
               rc_CenterObj( oObjTemp, oObjTemp2 , ( cTemp3 = 'y' ) or ( cTemp3 = 'xy' ), ( cTemp3 = 'x' ) or ( cTemp3 = 'xy' ) , y, x );
         end
         else
            rc_CenterObj( oObjTemp, oObjTemp2 , ( cTemp3 = 'y' ) or ( cTemp3 = 'xy' ), ( cTemp3 = 'x' ) or ( cTemp3 = 'xy' ) , y, x );
      end
      //7.0.0.0
      else
      if ( cTemp3 = 'x-mobile-xy' ) then
      begin
         cTemp3 := Copy( cTemp3, 1, 1 );
         if ( not mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , false, true , y, x )
         else
         if ( mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , true, true , y, x );
      end
      else
      if ( cTemp3 = 'y-mobile-xy' )then
      begin
         cTemp3 := Copy( cTemp3, 1, 1 );
         if ( not mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , true, false , y, x )
         else
         if ( mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , true, true , y, x );
      end

      else
      if ( cTemp3 = 'x-mobile-y' ) then
      begin
         cTemp3 := Copy( cTemp3, 1, 1 );
         if ( not mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , false, true , y, x )
         else
         if ( mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , true, false , y, x );
      end
      else
      if ( cTemp3 = 'y-mobile-x' )then
      begin
         cTemp3 := Copy( cTemp3, 1, 1 );
         if ( not mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , true, false , y, x )
         else
         if ( mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , false, true , y, x );
      end
      else
      if ( cTemp3 = 'mobile-xy' ) then
      begin
         if ( mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , true, true , y, x );
      end
      else
      if ( cTemp3 = 'mobile-x' ) then
      begin
         if ( mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , false, true , y, x );
      end
      else
      if ( cTemp3 = 'mobile-y' ) then
      begin
         if ( mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , true, false , y, x );
      end
      else
      if oObjTemp2 <> nil then
      begin
         if ( Pos( 'x:', cTemp ) = 0 ) and ( Pos( 'y:', cTemp ) = 0 ) then
         begin
            cTemp3 := StringReplace( cTemp , 'center:' , '', [rfReplaceAll] );
            cTemp3 := Trim( StringReplace( cTemp3, oObjTemp2.Name , '', [rfReplaceAll] ) );

            x := 0;
            y := 0;
         end
         else
         begin
              cTemp3 := '';

              if ( Pos( 'x:', cTemp ) > 0 ) then
              begin
                   cTemp2 := Copy( cTemp, Pos( 'x:' , cTemp ) + 2 , 300 ) + ' ';
                   cTemp2 := Trim( Copy( cTemp2, 1, Pos( ' ' , cTemp2 ) ) );

                   n := StrToIntDef( ReturnNumbers( cTemp2 ), 0 );
                   w := oObjTemp2.Width;

                   if Pos( '%', cTemp2 ) > 0 then
                      x := Trunc(( n / 100 ) * ( w ) )
                   else
                      x := StrToIntDef( cTemp2 , 0 );

                   cTemp3 := 'x';
              end;

              if ( Pos( 'y:', cTemp ) > 0 ) then
              begin
                   cTemp4 := Copy( cTemp, Pos( 'y:' , cTemp ) + 2, 300 ) + ' ';
                   cTemp4 := Trim( Copy( cTemp4, 1, Pos( ' ' , cTemp4 ) ) );

                   n := StrToIntDef( ReturnNumbers( cTemp4 ), 0 );
                   h := oObjTemp2.Height;

                   if Pos( '%', cTemp4 ) > 0 then
                      y := Trunc(( n / 100 ) * ( h ) )
                   else
                      y := StrToIntDef( cTemp4 , 0 );

                   cTemp3 := cTemp3 + 'y';
              end;
         end;
         rc_CenterObj( oObjTemp, oObjTemp2 , ( cTemp3 = 'y' ) or ( cTemp3 = 'xy' ), ( cTemp3 = 'x' ) or ( cTemp3 = 'xy' ) , y, x );
      end
      else
      begin
           dm_rc.rc_ShowError( 'CENTER Obj:' + cTemp3 + ' not found.' );
           Result := false;
      end;
   end;
end;

procedure rc_AlignLabel(pLabel: TUniLabel; pAlign: string);
begin
     rc_AddCssClass( pLabel, 'align-label-' + pAlign );
end;

end.
