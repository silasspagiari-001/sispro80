unit mkm_layout_aux_scales; //8.0.0.0

interface

uses
    System.SysUtils,
    System.Classes,
    uniGUIClasses
    ;

    procedure renderAttr_SCALE( var pFrame : TObject; var oObjTemp : TUniControl; var cTemp, cHint : string ) ;
    procedure renderAttr_MAXHEIGHT( var oObjTemp : TUniControl; var cHint : string ) ;
    procedure renderAttr_MINHEIGHT( var oObjTemp : TUniControl; var cHint : string ) ;
    procedure renderAttr_HEIGHT( var oObjTemp : TUniControl; var cHint : string ) ;
    procedure renderAttr_MAXWIDTH( var oObjTemp : TUniControl; var cHint : string ) ;
    procedure renderAttr_MINWIDTH( var oObjTemp : TUniControl; var cHint : string ) ;
    procedure renderAttr_WIDTH( var oObjTemp : TUniControl; var cHint : string ) ;


implementation

uses untdm_rc, str_func, mkm_func_web, MainModule, mkm_layout;

procedure renderAttr_SCALE( var pFrame : TObject; var oObjTemp : TUniControl; var cTemp, cHint : string ) ;
var
   cTemp2, cTemp3, cTemp4, cTemp5 : string;
   oObjTemp2 : TUniControl;
   fValue,fPlus,fMinus : Double;
   iOffSet,iWidth, iHeight,n, x, y : integer;
   bHided,bMobile, bMobile_off,bScaleOff, bDots : boolean;
begin
   try
      // scale  scale:rcBlock34 w:45% pad:0 5 0 5
      // w:screenwidth-10
      cTemp3 := rc_GetHintAttr( 'scale:', cTemp );

      if cTemp3 <> '' then
      begin

         if ( oObjTemp.Visible = false ) and ( oObjTemp.Enabled = false ) then
            cTemp3 := cTemp3;

         bScaleOff := False;
         bScaleOff := ( ( Pos( ' mobile-off', cTemp3 ) > 0 ) and ( mm.varB_Mobile_Screen ) ) ;
         if not bScaleOff then
            bScaleOff :=  ( ( Pos( ' mobile-v-off', cTemp3 ) > 0 ) and ( mm.varB_Mobile_Screen_Portrait ) ) ;
         if not bScaleOff then
            bScaleOff :=  ( ( Pos( ' mobile-h-off', cTemp3 ) > 0 ) and ( mm.varB_Mobile_Screen_Landscape ) ) ;
         if not bScaleOff then
            bScaleOff :=  ( ( Pos( ' desktop-off', cTemp3 ) > 0 ) and ( not mm.varB_Mobile_Screen ) ) ;


         if bScaleOff then
         begin
             cTemp := rc_GetHintAttr( 'prior-scale:', cHint ) ;
             if cTemp <> '' then
                oObjTemp.Height := StrToIntDef( cTemp, oObjTemp.Height );
             cTemp := '';
         end;

         if not bScaleOff then
         begin
            //7.0.0.0
            oObjTemp.Hint := rc_AddHintAttr( '|prior-scale:' + oObjTemp.Height.ToString , oObjTemp.Hint , true) ;
            //8.0.0.0
            if ( Pos( 'TUniDBGrid' , oObjTemp.ClassName ) > 0 ) then
               cHint := rc_AdjustHintForGrids( oObjTemp.Hint );

            cTemp  := StringReplace( cTemp , ' mobile-off', '', [rfReplaceAll] );
            cTemp3 := StringReplace( cTemp3, ' mobile-off', '', [rfReplaceAll] );

            cTemp  := StringReplace( cTemp , ' mobile-v-off', '', [rfReplaceAll] );
            cTemp3 := StringReplace( cTemp3, ' mobile-v-off', '', [rfReplaceAll] );
            cTemp  := StringReplace( cTemp , ' mobile-h-off', '', [rfReplaceAll] );
            cTemp3 := StringReplace( cTemp3, ' mobile-h-off', '', [rfReplaceAll] );
            cTemp  := StringReplace( cTemp , ' desktop-off', '', [rfReplaceAll] );
            cTemp3 := StringReplace( cTemp3, ' desktop-off', '', [rfReplaceAll] );
            cTemp3 := Copy( cTemp3, 1, Pos( ' ' , cTemp3 ) - 1 );

            oObjTemp2 := nil;

            if cTemp3 = 'parent' then
            begin
               if oObjTemp.HasParent then
                 oObjTemp2 := TUniControl( oObjTemp.GetParentComponent )
               else
                 oObjTemp2 := nil;
            end
            else
               oObjTemp2 := rc_FindControl( cTemp3, pFrame );

            x := 0;
            y := 0;

            if oObjTemp2 <> nil then
            begin
               if ( Pos( 'w:', cTemp ) = 0 ) and ( Pos( 'h:', cTemp ) = 0 ) then
               begin
                  cTemp3 := StringReplace( cTemp , 'scale:' , '', [rfReplaceAll] );
                  cTemp3 := Trim( StringReplace( cTemp3, oObjTemp2.Name , '', [rfReplaceAll] ) );
               end
               else
               begin
                    cTemp3 := '';

                    if ( Pos( 'w:', cTemp ) > 0 ) then
                    begin
                         cTemp2 := Copy( cTemp, Pos( 'w:' , cTemp ) + 2 , 300 ) + ' ';
                         cTemp2 := Trim( Copy( cTemp2, 1, Pos( ' ' , cTemp2 ) ) );
                         cTemp5  := rc_GetHintAttr( 'w:', cTemp, false ) ;
                         //8.0.0.0
                         if rc_IsMobile_V( cTemp5 ) then //8.0.0.0
                            cTemp5 := rc_GetHintAttr( 'mobile-v-', cTemp, true )
                         else
                         if rc_IsMobile_H( cTemp5 ) then //8.0.0.0
                            cTemp5  := rc_GetHintAttr( 'mobile-h-', cTemp, true )
                         else
                         if rc_IsMobile( cTemp5 ) then //8.0.0.0
                            cTemp5  := rc_GetHintAttr( 'mobile-', cTemp, true )
                         else
                         if ( not mm.varB_Mobile_Screen ) and ( Pos( ' off:default' , cTemp ) = 0 ) then
                            cTemp5  := rc_GetHintAttr( 'desktop-', cTemp, true )
                         else
                            cTemp5 := '';
                         if cTemp5 <> '' then
                         begin
                            cTemp2 := cTemp5;
                            cTemp5 := '';
                         end;

                         if Pos( 'screenwidth' , cTemp2 ) > 0 then
                         begin
                            cTemp2 := Trim( Copy( cTemp2, Pos( 'screenwidth-' , cTemp2 )+11 , 300 ) + ' ' );
                            if Copy( cTemp2, 1, 1 ) = '-' then
                               cTemp2 := IntToStr( mm.varI_ScreenWidth - StrToIntDef( ReturnNumbers( cTemp2 ), 0 ) )
                            else
                               cTemp2 := IntToStr( mm.varI_ScreenWidth );
                         end;

                         // separa % de + e -....
                         //n := StrToIntDef( ReturnNumbers( cTemp2 ), 0 );
                         fPlus := 0;
                         if Pos( '+',cTemp2 ) > 0 then
                         begin
                            cTemp5 := Copy( cTemp2, Pos( '+', cTemp2 ) + 1 ) + ' ';
                            cTemp5 := Copy( cTemp5, 1, Pos( ' ', cTemp5 ) - 1 );
                            fPlus  := StrToFloat_Universal( ReturnNumbers( cTemp5 ) );
                            cTemp5 := '';
                            cTemp2 := Copy( cTemp2, 1, Pos( '+', cTemp2 ) - 1 );
                         end;
                         fMinus := 0;
                         if Pos( '-',cTemp2 ) > 0 then
                         begin
                            cTemp5 := Copy( cTemp2, Pos( '-', cTemp2 ) + 1 ) + ' ';
                            cTemp5 := Copy( cTemp5, 1, Pos( ' ', cTemp5 ) - 1 );
                            fMinus  := StrToFloat_Universal( ReturnNumbers( cTemp5 ) );
                            cTemp5 := '';
                            cTemp2 := Copy( cTemp2, 1, Pos( '-', cTemp2 ) - 1 );
                         end;

                         if Pos( '%',cTemp2 ) > 0 then
                         begin
                            cTemp5 := Copy( cTemp2, 1, Length(cTemp2)-1 );
                            fValue := StrToFloat_Universal( ( cTemp5 ) );
                            cTemp5 := '';
                         end
                         else
                            fValue := StrToFloatDef( cTemp2, 0 );


                         iOffSet := 0;//default-offset
                         if Pos( ' off:' , cTemp ) > 0 then
                         begin
                            if Pos( ' off:default-offset' , cTemp ) > 0 then
                               iOffSet := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ) // 6.0.0.0
                            else
                               iOffSet := StrToIntDef( ReturnNumbers( Copy( cTemp, Pos( ' off:' , cTemp ) , Pos( ' ' , cTemp ) ) ), 0 );
                         end;

                         cTemp5  := rc_GetHintAttr( 'off:', cTemp, true ) ;
                         if rc_IsMobile_V( cTemp5 ) then //8.0.0.0
                         begin
                              cTemp5  := rc_GetHintAttr( 'mobile-v-', cTemp, true ) ;
                              if cTemp = 'default-offset' then
                                 iOffSet := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ) // 6.0.0.0
                              else
                              if cTemp5 <> '' then // 6.0.0.0
                                 iOffSet := StrToIntDef( cTemp5, 0 );
                              cTemp5  := '';
                         end
                         else
                         if rc_IsMobile_H( cTemp5 ) then //8.0.0.0
                         begin
                              cTemp5  := rc_GetHintAttr( 'mobile-h-', cTemp, true ) ;
                              if cTemp = 'default-offset' then
                                 iOffSet := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ) // 6.0.0.0
                              else
                              if cTemp5 <> '' then // 6.0.0.0
                                 iOffSet := StrToIntDef( cTemp5, 0 );
                              cTemp5  := '';
                         end
                         else
                         if rc_IsMobile( cTemp5 ) then //8.0.0.0
                         begin
                              cTemp5  := rc_GetHintAttr( 'mobile-', cTemp, true ) ;
                              if cTemp = 'default-offset' then
                                 iOffSet := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ) // 6.0.0.0
                              else
                              if cTemp5 <> '' then // 6.0.0.0
                                 iOffSet := StrToIntDef( cTemp5, 0 );
                              cTemp5  := '';
                         end
                         else
                         //desktop
                         if ( not mm.varB_Mobile_Screen ) and ( Pos( ' off:default' , cTemp ) = 0 ) then
                         begin
                              cTemp5  := rc_GetHintAttr( 'desktop-', cTemp, true ) ;
                              if cTemp = 'default-offset' then
                                 iOffSet := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ) // 6.0.0.0
                              else
                              if cTemp5 <> '' then // 6.0.0.0
                                 iOffSet := StrToIntDef( cTemp5, 0 );
                              cTemp5  := '';
                         end;
                         iWidth := oObjTemp2.Width ;

                         if Pos( '%', cTemp2 ) > 0 then
                         begin
                            x := Trunc(( fValue / 100 ) * ( iWidth ));
                            x := x + Trunc(fPlus);
                            x := x - Trunc(fMinus);
                         end
                         else
                            x := StrToIntDef( cTemp2 , 0 );

                         x := x - iOffSet;

                         if Pos( '-left' , cTemp ) > 0 then
                         begin
                             x := x - oObjTemp.Left;
                         end;
                    end;

                    if ( Pos( 'h:', cTemp ) > 0 ) then
                    begin
                         cTemp4 := Copy( cTemp, Pos( 'h:' , cTemp ) + 2, 300 ) + ' ';
                         cTemp4 := Trim( Copy( cTemp4, 1, Pos( ' ' , cTemp4 ) ) );

                         if Pos( 'screenheight' , cTemp4 ) > 0 then
                         begin
                            cTemp4 := Trim( Copy( cTemp4, Pos( 'screenheight-' , cTemp4 )+11 , 300 ) + ' ' );
                            if Copy( cTemp4, 1, 1 ) = '-' then
                               cTemp4 := IntToStr( mm.varI_ScreenHeight - StrToIntDef( ReturnNumbers( cTemp4 ), 0 ) )
                            else
                               cTemp4 := IntToStr( mm.varI_ScreenHeight );
                         end;

                         n := StrToIntDef( ReturnNumbers( cTemp4 ), 0 );

                         iHeight := oObjTemp2.Height ;

                         iOffSet := 0;//default-offset
                         if Pos( ' off:' , cTemp ) > 0 then
                         begin
                            if Pos( ' off:default-offset' , cTemp ) > 0 then
                               iOffSet := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ) // 6.0.0.0
                            else
                               iOffSet := StrToIntDef( ReturnNumbers( Copy( cTemp, Pos( ' off:' , cTemp ) , Pos( ' ' , cTemp ) ) ), 0 );
                         end;

                         if Pos( ' off:' , cTemp ) > 0 then
                         begin
                            if Pos( ' off:default-offset' , cTemp ) > 0 then
                               iOffSet := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ) // 6.0.0.0
                            else
                            begin
                               cTemp3 := Copy( cTemp, Pos( ' off:' , cTemp ) + 5 ) + '+' ;
                               cTemp3 := Copy( cTemp3, 1, Pos( '+', cTemp3 )-1 );
                               if ReturnLetters( cTemp3 ) <> '' then
                               begin
                                  oObjTemp2 := nil;
                                  oObjTemp2 := rc_FindControl( cTemp3, pFrame );
                                  if oObjTemp2 <> nil then
                                  begin
                                     iOffSet := oObjTemp2.Height;
                                     if Pos( '+', cTemp ) > 0 then
                                     begin
                                        cTemp3 := Copy( cTemp, Pos( '+', cTemp ) + 1 ) + ' ';
                                        cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 ) ;
                                        iOffSet := iOffSet + StrToIntDef( cTemp3, 0 );
                                     end;
                                  end;
                               end
                               else //
                                 iOffSet := StrToIntDef( ReturnNumbers( Copy( cTemp, Pos( ' off:' , cTemp ) , Pos( ' ' , cTemp ) ) ), 0 );
                            end;

                            cTemp5  := rc_GetHintAttr( 'off:', cTemp, false ) ;
                            if rc_IsMobile_V( cTemp5 ) then //8.0.0.0
                            begin
                                 cTemp5  := rc_GetHintAttr( 'mobile-v-', cTemp, true ) ;
                                 if cTemp = 'default-offset' then
                                    iOffSet := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ) // 6.0.0.0
                                 else
                                    iOffSet := StrToIntDef( cTemp5, 0 );
                                 cTemp5  := '';
                            end
                            else
                            if rc_IsMobile_H( cTemp5 ) then //8.0.0.0
                            begin
                                 cTemp5  := rc_GetHintAttr( 'mobile-h-', cTemp, true ) ;
                                 if cTemp = 'default-offset' then
                                    iOffSet := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ) // 6.0.0.0
                                 else
                                    iOffSet := StrToIntDef( cTemp5, 0 );
                                 cTemp5  := '';
                            end
                            else
                            if rc_IsMobile( cTemp5 ) then //8.0.0.0
                            begin
                                 cTemp5  := rc_GetHintAttr( 'mobile-', cTemp, true ) ;
                                 if cTemp = 'default-offset' then
                                    iOffSet := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ) // 6.0.0.0
                                 else
                                    iOffSet := StrToIntDef( cTemp5, 0 );
                                 cTemp5  := '';
                            end
                            else
                            //desktop
                            if ( not mm.varB_Mobile_Screen ) and ( Pos( ' off:default' , cTemp ) = 0 ) then
                            begin
                                 cTemp5  := rc_GetHintAttr( 'desktop-', cTemp, true ) ;
                                 if cTemp = 'default-offset' then
                                    iOffSet := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ) // 6.0.0.0
                                 else
                                 if cTemp5 <> '' then
                                    iOffSet := StrToIntDef( cTemp5, 0 );
                                 cTemp5  := '';
                            end;

                         end;

                         if Pos( '%', cTemp4 ) > 0 then
                            y := Trunc(( n / 100 ) * ( iHeight ) )
                         else
                            y := StrToIntDef( cTemp4 , 0 );

                         y := y - iOffSet;

                         if Pos( '-top' , cTemp ) > 0 then
                         begin
                            y := y - oObjTemp.Top;
                         end;
                    end;
               end;
            end
            else
            begin
                 dm_rc.rc_ShowError( 'SCALE Obj:' + cTemp3 + ' not found.' );
                 Abort;
            end;

            if x > 0 then
               oObjTemp.Width := x ;
            if y > 0 then
               oObjTemp.Height := y ;

         end;
      end; // scale
   except on e:exception do
      raise Exception.Create('Error On renderAttr_SCALE ' + varIIF( oObjTemp <> nil, oObjTemp.Name, '' )  + '.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_MAXHEIGHT( var oObjTemp : TUniControl; var cHint : string ) ;
var
   cTemp3 : string;
   x, y : integer;
begin
   try
     cTemp3 := rc_GetHintAttr( 'max-height:', cHint ) ;
     if cTemp3 <> '' then
     begin
        cTemp3 := cTemp3 + '.';
        cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

        if rc_IsMobile_V( cTemp3 ) then //8.0.0.0
        begin
             cTemp3          := rc_GetHintAttr( 'mobile-v-', cTemp3, true ) ;
             x := StrToIntDef( cTemp3, oObjTemp.Height );
             if oObjTemp.Height > x then
                oObjTemp.Height := x;
        end
        else
        if rc_IsMobile_H( cTemp3 ) then //8.0.0.0
        begin
             cTemp3          := rc_GetHintAttr( 'mobile-h-', cTemp3, true ) ;
             x := StrToIntDef( cTemp3, oObjTemp.Height );
             if oObjTemp.Height > x then
                oObjTemp.Height := x;
        end
        else
        if rc_IsMobile( cTemp3 ) then //8.0.0.0
        begin
             cTemp3          := rc_GetHintAttr( 'mobile-', cTemp3, true ) ;
             x := StrToIntDef( cTemp3, oObjTemp.Height );
             if oObjTemp.Height > x then
                oObjTemp.Height := x;
        end
        else
        //desktop
        if ( not mm.varB_Mobile_Screen ) then
        begin
           cTemp3 := cTemp3 + ' ';
           cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
           if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
           begin
              x  := StrToIntDef( cTemp3, oObjTemp.Height );
              if oObjTemp.Height > x then
                 oObjTemp.Height := x;
           end;
        end;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_MAXHEIGHT ' + varIIF( oObjTemp <> nil, oObjTemp.Name, '' )  + '.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_MINHEIGHT( var oObjTemp : TUniControl; var cHint : string ) ;
var
   cTemp3 : string;
   x, y : integer;
begin
   try
     cTemp3 := rc_GetHintAttr( 'min-height:', cHint ) ;
     if cTemp3 <> '' then
     begin
        cTemp3 := cTemp3 + '.';
        cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

        if rc_IsMobile_V( cTemp3 ) then //8.0.0.0
        begin
             cTemp3          := rc_GetHintAttr( 'mobile-v-', cTemp3, true ) ;
             x := StrToIntDef( cTemp3, oObjTemp.Height );
             if oObjTemp.Height < x then
                oObjTemp.Height := x;
        end
        else
        if rc_IsMobile_H( cTemp3 ) then //8.0.0.0
        begin
             cTemp3          := rc_GetHintAttr( 'mobile-h-', cTemp3, true ) ;
             x := StrToIntDef( cTemp3, oObjTemp.Height );
             if oObjTemp.Height < x then
                oObjTemp.Height := x;
        end
        else
        if rc_IsMobile( cTemp3 ) then //8.0.0.0
        begin
             cTemp3          := rc_GetHintAttr( 'mobile-', cTemp3, true ) ;
             x   := StrToIntDef( cTemp3, oObjTemp.Height );
             if oObjTemp.Height < x then
                oObjTemp.Height := x;
        end
        else
        //desktop
        if ( not mm.varB_Mobile_Screen ) then
        begin
           cTemp3 := cTemp3 + ' ';
           cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
           if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
           begin
              x  := StrToIntDef( cTemp3, oObjTemp.Height );
              if oObjTemp.Height < x then
                 oObjTemp.Height := x;
           end;
        end;
     end;

   except on e:exception do
      raise Exception.Create('Error On renderAttr_MINHEIGHT ' + varIIF( oObjTemp <> nil, oObjTemp.Name, '' )  + '.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_HEIGHT( var oObjTemp : TUniControl; var cHint : string ) ;
var
   cTemp3 : string;
   x, y : integer;
begin
   try
     cTemp3 := rc_GetHintAttr( 'height:', cHint ) ;
     if cTemp3 <> '' then
     begin
        cTemp3 := cTemp3 + '.';
        cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

        if rc_IsMobile_V( cTemp3 ) then //8.0.0.0
        begin
             cTemp3          := rc_GetHintAttr( 'mobile-v-', cTemp3, true ) ;
             x := StrToIntDef( cTemp3, oObjTemp.Height );
             oObjTemp.Height := x;
        end
        else
        if rc_IsMobile_H( cTemp3 ) then //8.0.0.0
        begin
             cTemp3          := rc_GetHintAttr( 'mobile-h-', cTemp3, true ) ;
             x := StrToIntDef( cTemp3, oObjTemp.Height );
             oObjTemp.Height := x;
        end
        else
        if rc_IsMobile( cTemp3 ) then //8.0.0.0
        begin
             cTemp3          := rc_GetHintAttr( 'mobile-', cTemp3, true ) ;
             x   := StrToIntDef( cTemp3, oObjTemp.Height );
             oObjTemp.Height := x;
        end
        else
        //desktop
        if ( not mm.varB_Mobile_Screen ) then
        begin
           cTemp3 := cTemp3 + ' ';
           cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
           if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
           begin
              x  := StrToIntDef( cTemp3, oObjTemp.Height );
              oObjTemp.Height := x;
           end;
        end;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_HEIGHT ' + varIIF( oObjTemp <> nil, oObjTemp.Name, '' )  + '.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_MAXWIDTH( var oObjTemp : TUniControl; var cHint : string ) ;
var
   cTemp3 : string;
   x, y : integer;
begin
   try
     //8.0.0.0 george
     cTemp3 := rc_GetHintAttr( 'max-width:', cHint ) ;
     if cTemp3 <> '' then
     begin
        cTemp3 := cTemp3 + '.';
        cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );
        x := StrToIntDef( cTemp3, -1 );
        //8.0.0.0
        if rc_IsMobile_V( cTemp3 ) then //8.0.0.0
        begin
             cTemp3          := rc_GetHintAttr( 'mobile-v-', cTemp3, true ) ;
             x := StrToIntDef( cTemp3, oObjTemp.Width );
        end
        else
        if rc_IsMobile_H( cTemp3 ) then //8.0.0.0
        begin
             cTemp3          := rc_GetHintAttr( 'mobile-h-', cTemp3, true ) ;
             x := StrToIntDef( cTemp3, oObjTemp.Width );
        end
        else
        if ( rc_IsMobile( cTemp3 ) ) or
           ( ( x >= 0 ) and ( mm.varB_Mobile_Screen ) ) then
        begin
             if ( Pos( 'mobile-', cTemp3 ) > 0 ) and ( mm.varB_Mobile_Screen ) then
                cTemp3 := rc_GetHintAttr( 'mobile-', cTemp3, true );
             x := StrToIntDef( cTemp3, oObjTemp.Width );
        end
        else
        //desktop
        if ( not mm.varB_Mobile_Screen ) then
        begin
           cTemp3 := cTemp3 + ' ';
           cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
           if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
           begin
              x  := StrToIntDef( cTemp3, oObjTemp.Width );
           end;
        end;
        If x >= 0 then
        begin
           try
              if oObjTemp.HasParent then
              begin
                 If x > oObjTemp.Parent.Width then
                    x := oObjTemp.Parent.Width;
              end;
           except
           end;

           If x > mm.varI_ScreenWidth then
              x := mm.varI_ScreenWidth;

           if oObjTemp.Width > x then
              oObjTemp.Width := x;
        end;
     end;  //fim george

   except on e:exception do
      raise Exception.Create('Error On renderAttr_MAXWIDTH ' + varIIF( oObjTemp <> nil, oObjTemp.Name, '' )  + '.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_MINWIDTH( var oObjTemp : TUniControl; var cHint : string ) ;
var
   cTemp3 : string;
   x, y : integer;
begin
   try
     cTemp3 := rc_GetHintAttr( 'min-width:', cHint ) ;
     if cTemp3 <> '' then
     begin
        cTemp3 := cTemp3 + '.';
        cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

        if rc_IsMobile_V( cTemp3 ) then //8.0.0.0
        begin
             cTemp3          := rc_GetHintAttr( 'mobile-v-', cTemp3, true ) ;
             x := StrToIntDef( cTemp3, oObjTemp.Width );
             if oObjTemp.Width < x then
                oObjTemp.Width := x;
        end
        else
        if rc_IsMobile_H( cTemp3 ) then //8.0.0.0
        begin
             cTemp3          := rc_GetHintAttr( 'mobile-h-', cTemp3, true ) ;
             x := StrToIntDef( cTemp3, oObjTemp.Width );
             if oObjTemp.Width < x then
                oObjTemp.Width := x;
        end
        else
        if rc_IsMobile( cTemp3 ) then //8.0.0.0
        begin
             cTemp3          := rc_GetHintAttr( 'mobile-', cTemp3, true ) ;
             x   := StrToIntDef( cTemp3, oObjTemp.Width );
             if oObjTemp.Width < x then
                oObjTemp.Width := x;
        end
        else
        //desktop
        if ( not mm.varB_Mobile_Screen ) then
        begin
           cTemp3 := cTemp3 + ' ';
           cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
           if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
           begin
              x  := StrToIntDef( cTemp3, oObjTemp.Width );
              if oObjTemp.Width < x then
                 oObjTemp.Width := x;
           end;
        end;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_MINWIDTH ' + varIIF( oObjTemp <> nil, oObjTemp.Name, '' )  + '.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_WIDTH( var oObjTemp : TUniControl; var cHint : string ) ;
var
   cTemp3 : string;
   x, y : integer;
begin
   try
      cTemp3 := rc_GetHintAttr( 'width:', cHint ) ;
      if cTemp3 <> '' then
      begin
         cTemp3 := cTemp3 + '.';
         cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

         if rc_IsMobile_V( cTemp3 ) then //8.0.0.0
         begin
              cTemp3          := rc_GetHintAttr( 'mobile-v-', cTemp3, true ) ;
              x := StrToIntDef( cTemp3, oObjTemp.Width );
              oObjTemp.Width := x;
         end
         else
         if rc_IsMobile_H( cTemp3 ) then //8.0.0.0
         begin
              cTemp3          := rc_GetHintAttr( 'mobile-h-', cTemp3, true ) ;
              x := StrToIntDef( cTemp3, oObjTemp.Width );
              oObjTemp.Width := x;
         end
         else
         if rc_IsMobile( cTemp3 ) then //8.0.0.0
         begin
              cTemp3          := rc_GetHintAttr( 'mobile-', cTemp3, true ) ;
              x   := StrToIntDef( cTemp3, oObjTemp.Width );
              oObjTemp.Width := x;
         end
         else
         //desktop
         if ( not mm.varB_Mobile_Screen ) then
         begin
            cTemp3 := cTemp3 + ' ';
            cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
            if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
            begin
               x  := StrToIntDef( cTemp3, oObjTemp.Width );
               oObjTemp.Width := x;
            end;
         end;
      end;

   except on e:exception do
      raise Exception.Create('Error On renderAttr_WIDTH ' + varIIF( oObjTemp <> nil, oObjTemp.Name, '' )  + '.' + sLineBreak + e.Message);
   end;
end;

end.
