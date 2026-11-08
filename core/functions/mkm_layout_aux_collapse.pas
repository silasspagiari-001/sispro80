unit mkm_layout_aux_collapse; //8.0.0.0

interface

uses
    System.SysUtils,
    System.Classes,
    System.TypInfo,
    Vcl.Controls,
    uniGUIClasses,
    uniLabel
    ;

    procedure renderAttr_COLLAPSE( var pForm : TObject; var oControl : TUniControl) ;
    procedure rc_Collapse( Sender, pForm : TObject; pObj : TUniControl ; pClose : boolean = false; pToggle : boolean = true );

implementation

uses untdm_rc, str_func, mkm_func_web, MainModule, mkm_layout;

procedure renderAttr_COLLAPSE( var pForm : TObject; var oControl : TUniControl ) ;
var
   cIconOpen, cIconClose,
   cTemp, cTemp2, cTemp3, cTemp4 : string;
   bIconOff : boolean;
   oBlock, oControlParent : TUniControl;
   r : integer;
begin
   try
     cTemp := rc_GetHintAttr( 'collapse:', oControl.Hint );
     cIconOpen  := 'fas-angle-down';
     cIconClose := 'fas-angle-up';
     if cTemp <> '' then
     begin
         //8.0.0.0 fixed
         oControl.AutoSize  := false;
         oControl.Align     := alNone;
         if Pos( ' fixed', cTemp ) = 0 then
         begin
            oControl.Alignment := taRightJustify;
            oControl.Anchors   := [akTop, akLeft,akRight];
            oControl.Left      := 0;
            oControl.Top       := 0;
            oControl.Width     := oControl.Parent.Width - 10;
            oControl.Height    := 25;
            oControl.Top       := ( oControl.Parent.Height div 2 ) - ( oControl.Height div 2 )  ;
         end;
         oControl.BringToFront;
         //rc_AddCssClass( oControl   , 'align-label-right-center' );

         bIconOff      := Pos( 'icons:off', oControl.Hint ) > 0;
         if bIconOff then
         begin
            if Pos( 'cls:rc-cursor-pointer ', oControl.Hint ) = 0 then
            begin
               oControl.Hint := StringReplace( oControl.Hint, 'cls:', 'cls:rc-cursor-pointer ' , [rfReplaceAll] );
            end
            else
            if Pos( 'cls:', oControl.Hint ) = 0 then
               oControl.Hint := rc_AddHintAttr( '|cls:rc-cursor-pointer|', oControl.Hint, false );
         end;
         if Pos( 'icons:', oControl.Hint ) > 0 then
         begin
            cIconOpen     := rc_GetHintAttr( 'icons:', oControl.Hint ) ;
            cIconClose    := trim( Copy( cIconOpen, pos( ' ', cIconOpen ) ) );
            cIconOpen     := Copy( cIconOpen, 1, pos( ' ', cIconOpen ) - 1 );
         end;
         // 6.0.0.0
         oBlock := TUniControl( TComponent( pForm ).FindComponent( Copy( cTemp, 1, Pos( ' ', cTemp ) - 1 ) ) );
         if oBlock <> nil then
         begin
            if Pos( 'objcollapse:', oBlock.Hint ) = 0 then
               oBlock.Hint := rc_AddHintAttr( '|objcollapse:' + oControl.Name, oBlock.Hint , true);
         end;
     end;

     if ( ( cTemp <> '' ) and ( pos( 'ico:', oControl.Hint ) = 0 ) and ( pos( 'cls:', oControl.Hint ) = 0 ) ) then
     begin
          oBlock := TUniControl( TComponent( pForm ).FindComponent( Copy( cTemp, 1, Pos( ' ', cTemp ) - 1 ) ) );
          cTemp3 := rc_GetHintAttr( 'collapsed', cTemp, true, true );
          // 6.0.0.0
          cTemp4 := cTemp3 + ' ';
          cTemp4 := trim( Copy( cTemp4, Pos( ' ', cTemp3 ) + 1 ) );
          cTemp3 := StringReplace( cTemp3, ' ' + cTemp4, '', [rfReplaceAll] );

          if ( ( Pos( ' collapsed' , cTemp ) > 0 ) and ( cTemp3 <> ':mobile' ) ) or
             ( ( Pos( ' collapsed' , cTemp ) > 0 ) and
             ( ( ( cTemp3 = ':mobile' ) and ( mm.varB_Mobile_Screen ) ) or
               ( ( cTemp3 <> ':mobile' ) and ( not mm.varB_Mobile_Screen ) ) ) ) then
          begin
             if ( oBlock <> nil ) then
             begin
                // 6.0.0.0
                cTemp2 := rc_GetHintAttr( 'off-', cTemp, true );
                if cTemp2 <> '' then
                begin
                   if ( Pos( 'parent', cTemp2 ) = 0 ) and ( ReturnLetters( cTemp2 ) = '' ) then
                      r := StrToIntDef ( ReturnNumbers( cTemp2 ) , 0 )
                   else
                   if Pos( 'parent', cTemp2 ) > 0 then
                   begin
                      oControlParent := TUniControl( oControl.Parent );
                      if oControlParent <> nil then
                      begin
                          r := oControlParent.Height;
                      end;
                   end
                   else
                   begin
                      oControlParent := TUniControl( TComponent( pForm ).FindComponent( cTemp2 ) );
                      if oControlParent <> nil then
                      begin
                          r := oControlParent.Height;
                      end;
                   end;
                end;

                cTemp3 := rc_GetHintAttr( 'hr-childs:', oBlock.Hint, false, true );
                cTemp2 := rc_GetHintAttr( 'expanded-', cTemp3, true );
                if Pos( 'expanded-', cTemp3 ) = 0 then
                begin
                   //6.0.0.0+
                   //oBlock.Hint := rc_SetHintAttr( 'expanded-' + r.ToString, 'hr-childs:' , oBlock.Hint, true );
                   oBlock.Hint := rc_SetHintAttr( ' expanded-' + r.ToString, 'hr-childs:' , oBlock.Hint, true );
                   cTemp3 := '|cls:';
                   If Pos( 'icons-color:', oControl.Hint ) > 0 then
                      cTemp3 := cTemp3 + rc_GetHintAttr( 'icons-color:', oControl.Hint )
                   else
                      cTemp3 := cTemp3 + 'color-black';
                   cTemp3 := cTemp3 + ' rc-font-size-18 ' +  // 6.0.0.0
                                      'rc-cursor-pointer|' +
                                      'ico:' + cIconOpen;
                   oControl.Hint := rc_AddHintAttr( cTemp3, oControl.Hint, false );
                end
                else
                begin
                   oBlock.Hint := StringReplace( oBlock.Hint, ' expanded-' + cTemp2, '', [rfReplaceAll] );
                   cTemp3 := '|cls:';
                   If Pos( 'icons-color:', oControl.Hint ) > 0 then
                      cTemp3 := cTemp3 + rc_GetHintAttr( 'icons-color:', oControl.Hint )
                   else
                      cTemp3 := cTemp3 + 'color-black';
                   cTemp3 := cTemp3 + ' rc-font-size-18 ' + // 6.0.0.0
                                      'rc-cursor-pointer|' +
                                      'ico:' + cIconClose;
                   oControl.Hint := rc_AddHintAttr( cTemp3, oControl.Hint, false );
                end;
             end;
          end

          else
          begin
             cTemp3 := '|cls:';
             If Pos( 'icons-color:', oControl.Hint ) > 0 then
                cTemp3 := cTemp3 + rc_GetHintAttr( 'icons-color:', oControl.Hint )
             else
                cTemp3 := cTemp3 + 'color-black';
             cTemp3 := cTemp3 + ' rc-font-size-18 ' + // 6.0.0.0
                                'rc-cursor-pointer|' +
                                'ico:' + cIconClose;
             oControl.Hint := rc_AddHintAttr( cTemp3, oControl.Hint, false );
          end;
     end;
     if ( cTemp <> '' ) then
        TUniLabel(oControl).OnClick := dm_rc.DynamicCollapse;

   except on e:exception do
      raise Exception.Create('Error On renderAttr_COLLAPSE.' + sLineBreak + e.Message);
   end;
end;

procedure rc_Collapse( Sender, pForm : TObject; pObj : TUniControl ; pClose : boolean ; pToggle : boolean );
var
   iH, iAccordion, iFirst : integer;
   oObjAccordion, oObjCollapse, oObj, oControlParent : TUniControl;
   bIconOff : boolean;
   cIconOpen, cIconClose,
   cTmp, cTmp2, cTmpTarget, cTmpTargetAccordion, cTargetProcessed : string;
   bTargetClosed : boolean;
begin
   try
      iAccordion := 1;
      oObjAccordion := pObj;
      cTargetProcessed := '';
      bTargetClosed := false;
      iFirst        := 0;
      repeat
         cTmp := rc_GetHintAttr( 'collapse:', oObjAccordion.Hint );
         if cTmp <> '' then
         begin

            cIconOpen  := '-angle-down';
            cIconClose := '-angle-up';
            if cTmp <> '' then
            begin
                bIconOff   := Pos( 'icons:off', oObjAccordion.Hint ) > 0;
                cIconOpen  := rc_GetHintAttr( 'icons:', oObjAccordion.Hint ) ;
                cIconClose := trim( Copy( cIconOpen, pos( ' ', cIconOpen ) ) );
                cTmp2      := Copy( cIconClose , 4 );
                cIconClose := varIIF( cTmp2 = '', '-angle-up' , cTmp2 );
                cIconOpen  := Copy( cIconOpen, 1, pos( ' ', cIconOpen ) - 1 );
                cTmp2      := Copy( cIconOpen , 4 );
                cIconOpen  := varIIF( cTmp2 = '', '-angle-down' , cTmp2 );
            end;

            oObj := TUniControl( TComponent( pForm ).FindComponent( Copy( cTmp, 1, Pos( ' ', cTmp ) - 1 ) ) );
            if oObj <> nil then
            begin
               cTmpTarget := rc_GetHintAttr( 'hr-childs:', oObj.Hint, false, true );
               // 6.0.0.0
               cTmp2 := rc_GetHintAttr( 'off-', cTmp, true );
               if cTmp2 <> '' then
               begin
                  if ( Pos( 'parent', cTmp2 ) = 0 ) and ( ReturnLetters( cTmp2 ) = '' ) then
                     iH := StrToIntDef ( ReturnNumbers( cTmp2 ) , 0 )
                  else
                  if Pos( 'parent', cTmp2 ) > 0 then
                  begin
                     oControlParent := TUniControl( oObjAccordion.Parent );
                     if oControlParent <> nil then
                     begin
                         iH := oControlParent.Height;
                     end;
                  end
                  else
                  begin
                     oControlParent := TUniControl( TComponent( pForm ).FindComponent( cTmp2 ) );
                     if oControlParent <> nil then
                     begin
                         iH := oControlParent.Height;
                     end;
                  end;
               end;

               cTmp2 := rc_GetHintAttr( 'expanded-', cTmpTarget, true );
               if ( cTmpTargetAccordion = '' ) then
               begin
                  if ( ( Pos( 'expanded-', cTmpTarget ) = 0 ) and ( pToggle ) ) or ( ( pClose ) ) then
                  begin
                     //6.0.0.0+
                     oObj.Hint := rc_SetHintAttr( ' expanded-' + iH.ToString, 'hr-childs:' , oObj.Hint, true );

                     if not bIconOff then
                        oObjAccordion.caption := StringReplace( oObjAccordion.caption, cIconClose, cIconOpen , [rfReplaceAll] );
                     if ( iAccordion = 1 ) and ( iFirst <> -1 ) then bTargetClosed := false;
                  end
                  else
                  if ( ( Pos( 'expanded-', cTmpTarget ) > 0 ) and ( pToggle ) ) or ( ( not pClose ) ) then
                  begin
                     oObj.Hint := StringReplace( oObj.Hint, ' expanded-' + cTmp2, '', [rfReplaceAll] );

                     if not bIconOff then
                        oObjAccordion.caption := StringReplace( oObjAccordion.caption, cIconOpen, cIconClose , [rfReplaceAll] );
                     bTargetClosed := true;
                  end;
               end
               else
               begin
                  if ( bTargetClosed )  then
                  begin
                     // abriu um, fecha os outros....
                     if ( Pos( 'expanded-', cTmpTarget ) = 0 ) then
                     begin
                        // 6.0.0.0+
                        oObj.Hint := rc_SetHintAttr( ' expanded-' + iH.ToString, 'hr-childs:' , oObj.Hint, true );

                        if not bIconOff then
                           oObjAccordion.caption := StringReplace( oObjAccordion.caption, cIconClose, cIconOpen , [rfReplaceAll] );
                     end;
                  end;
               end;
            end;
         end;
         cTargetProcessed := cTargetProcessed + ' ' + oObjAccordion.Name;
         if ( iAccordion = 1 ) and ( iFirst <> -1 ) then
         begin
            cTmpTargetAccordion := oObjAccordion.Name;
            iFirst              := StrToIntDef( Copy( cTmpTargetAccordion, Length( cTmpTargetAccordion ) - 1 ), 0 );
            iAccordion          := iFirst;
         end;
         Inc( iAccordion );
         cTmp          := Copy( cTmpTargetAccordion, 1, Length( cTmpTargetAccordion ) - 2 ) + Zeros( IntToStr(iAccordion), 2 ) ;
         oObjAccordion := rc_FindControl( cTmp, pForm );
         if ( oObjAccordion = nil ) and ( iFirst > 1 ) and ( iAccordion > 1 ) and ( Pos( cTmp, cTargetProcessed ) = 0 ) then
         begin
              iFirst     := -1;
              iAccordion := 1;
              cTmp       := Copy( cTmpTargetAccordion, 1, Length( cTmpTargetAccordion ) - 2 ) + Zeros( IntToStr(iAccordion), 2 ) ;
              if Pos( cTmp, cTargetProcessed ) = 0 then
                 oObjAccordion := rc_FindControl( cTmp, pForm );
         end;
         if ( Pos( cTmp, cTargetProcessed ) > 0 ) then
         begin
            oObjAccordion := nil;
         end;
      until oObjAccordion = nil;
      //8.0.0.0
      if oObj <> nil then
         TUniControl( oObj ).Parent.SetFocus;
      dm_rc.rc_ResizeBlocks( pForm, true, true, false );
      dm_rc.rc_ResizeBlocks( pForm, true, true, false );  //it´s needed to render complex layouts
   except on e:exception do
      raise Exception.Create('Error On rc_Collapse.' + sLineBreak + e.Message);
   end;
end;

end.
