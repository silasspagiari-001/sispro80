unit mkm_gridblock_7003; // 7.0.0.0

interface

uses
    System.SysUtils, System.Classes , System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    {$ifdef MSWINDOWS}
    winapi.Windows,
    {$endif}
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics, vcl.Controls,
    uniComboBox, uniDBComboBox,uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker,  uniListBox, uniGUITypes, //7.0.0.0
    uniBitBtn, uniButton, uniEdit, UniDBEdit, UniSpeedButton, uniGUIFrame, uniGUIForm,  uniGUIDialogs, Messages,
    uniGUIClasses, uniGUIAbstractClasses,  uniGUIApplication, uniPanel, IniFiles, UniImage, uniLabel,  Unipagecontrol,
    uniMemo, uniDBMemo, uniGUIRegClasses, uniDBNavigator, uniScrollBox,
    UniDBRadioGroup, uniDBCheckBox, uniDBImage, uniDBText, System.Types, System.Generics.Collections,
    Variants, pngimage, jpeg, vcl.stdctrls, uniCheckBox, uniTreeMenu,
    uconsts ;

procedure rc_ResizeBlocksExecute( pFrame : TObject = nil;
                                  iMenu : integer = 0;
                                  iOffSet : integer = 20;
                                  iOffSet_Border : integer = 20;
                                  iNumBlocks : integer = GRID_COLS; //7.0.0.0 12
                                  iAreaAvailableH : integer = 0;
                                  iAreaAvailableV : integer = 0;
                                  iResponsivenessLimitH : integer = 0;
                                  iResponsivenessLimitV : integer = 0;
                                  bMobileScreen : boolean = false;
                                  bMobileScreenPortrait : boolean = false;
                                  bMobileScreenLandScape : boolean = false;
                                  bDesktop : boolean = false ;
                                  bTablet : boolean = false ; //6.0.0.2
//                                  iScrollbar_Size : integer = 0 ;
                                  iScreenWidth : integer = 0;
                                  iScreenHeight : integer = 0
                                  );
function  rc_GetBlockPrior( pBlock, pFrameOrig : TObject ) : string;
function  rc_GetBlockNext( pBlock, pFrameOrig : TObject ) : string;
function  rc_GetBlockHeight( oObj, pFrame : TObject; pParamBlk, pAttrib : string ) : integer;
function  rc_GetHRPercent( pAttribs, pAttrib : string ) : double ;
procedure rc_SetHeight( pFrame : TObject; pObj : TUniControl; pAttrib, pAttribs : string );

function  rc_GetOFFInfo( pFrame : TObject;
                         pHint : string;
                         iOffSet : integer = 20;
                         bMobileScreen : boolean = false;
                         bMobileScreenPortrait : boolean = false;
                         bMobileScreenLandScape : boolean = false;
                         bDesktop : boolean = false
                       ) : integer;
procedure rc_HRReplicate( pForm : TObject;
                          pObj : TUniControl;
                          pHint : string ;
                          bMobileScreen : boolean = false;
                          bMobileScreenPortrait : boolean = false;
                          bMobileScreenLandScape : boolean = false;
                          bDesktop : boolean = false
                        );
procedure rc_ColsDebug( oBlocks : array of TUniContainerPanel; iCountBlocks ,iScreenWidth, iScreenHeight : integer; pFrame : TObject ) ;
procedure rc_ValidateBlocks( pFrame : TObject );
procedure rc_LoadComponentsCmd( pFrame : TObject; pObj : TUniControl = nil );

//procedure rc_QuickSort(var A: array of Integer; const iLo, iHi: Integer);

implementation

uses str_func, mkm_func_web, mkm_layout, mkm_createcomponents;//, StrUtilsEx;

// 7.0.0.0
//[PT] carregamento do "hint" em runtime para testes de debug sem recompilar o projeto
//[EN] loading "hint" at runtime for debug testing without recompiling the project
procedure rc_LoadComponentsCmd( pFrame : TObject; pObj : TUniControl );
var
   bLoaded : boolean;
   IniFile : TMemIniFile;
   cHint   : string;
   i : integer;
procedure loadCmd( pLoadObj : TUniControl );
begin
    if FileExists( '.\files\rc-forms\' + lowercase( TComponent(pFrame).Name ) + '.ini' ) then
    begin
        IniFile := TMemIniFile.Create( '.\files\rc-forms\' + lowercase( TComponent(pFrame).Name ) + '.ini' );
        cHint := IniFile.ReadString( pLoadObj.Name , 'cmd' , '' );
        IniFile.Free;
        if cHint <> '' then
        begin
           pLoadObj.hint := '[[' + rc_NormalizeHintAttr( cHint ) + ']]';
           if not bLoaded then
           begin
              if pFrame is TUniForm then
              begin
                 if Pos( ']]', TUniForm(pFrame).hint ) = 0 then
                    TUniForm(pFrame).hint := '[[rcfrmloaded:]]'
                 else
                    TUniForm(pFrame).hint := '[[rcfrmloaded:|' + Copy( TUniForm(pFrame).hint, 3, 1000 );
              end
              else
              begin
                 if Pos( ']]', TUniFrame(pFrame).hint ) = 0 then
                    TUniFrame(pFrame).hint := '[[rcfrmloaded:]]' // 6.0.0.0
                 else
                    TUniFrame(pFrame).hint := '[[rcfrmloaded:|' + Copy( TUniFrame(pFrame).hint, 3, 1000 );
              end;
           end;
        end;
    end;
end;
begin
    {$IFDEF RELEASE}
    if pFrame is TUniForm then
       bLoaded := rc_PosHintAttr('rcfrmloaded:', TUniForm(pFrame).hint ) > 0
    else
       bLoaded := rc_PosHintAttr('rcfrmloaded:', TUniFrame(pFrame).hint ) > 0;
    {$ENDIF}
    {$IFDEF DEBUG}
    bLoaded := false;
    {$ENDIF}
    if not bLoaded then
    begin
       if pObj = nil then
       begin
          for i := 0 to TComponent(pFrame).ComponentCount - 1 do
          begin
               if (TComponent(pFrame).Components[I] is TUniControl) then
               begin
                   pObj := TUniControl( TComponent(pFrame).Components[I] );
                   LoadCMD( pObj );
               end;
          end;
       end
       else
         LoadCMD( pObj );
    end;
end;
//7.0.0.0
procedure rc_ValidateBlocks( pFrame : TObject );
var
   cTemp : string;
   f : integer;
   oObjTemp : TUniControl;
begin
   {$ifdef DEBUG}
   cTemp := '';
   for f := 0 to TComponent(pFrame ).ComponentCount-1 do
   begin
        oObjTemp  := TUniControl( TComponent(pFrame ).Components[f] );
        If ( oObjTemp.ClassName='TUniContainerPanel' ) and
           ( oObjTemp.Visible ) and
           ( lowercase(Copy(oObjTemp.Name, 1, 7 )) <> 'rcblock' ) and
           ( rc_GetHintAttr( 'cols:', '[[' + rc_NormalizeHintAttr( oObjTemp.Hint ) + ']]' ) <> '' ) then
           cTemp := cTemp + '<strong>ContainerPanel: ' + oObjTemp.Name + '</strong> contains "cols" but name is invalid! ' + #13#10 + #13#10;
        //else
        If ( oObjTemp.ClassName='TUniContainerPanel' ) and
           ( oObjTemp.Visible ) and
           ( lowercase(Copy(oObjTemp.Name, 1, 7 )) = 'rcblock' ) and
           ( rc_GetHintAttr( 'cols:', '[[' + rc_NormalizeHintAttr( oObjTemp.Hint ) + ']]' ) = '' ) then
           cTemp := cTemp + '<strong>rcBlock: ' + oObjTemp.Name + '</strong> "cols" is missing ! ' + #13#10+ #13#10;
   end;
   If cTemp <> '' then
      ShowMessageN( cTemp ); //7.0.0.2
   {$endif}
end;
//7.0.0.0
procedure rc_ColsDebug( oBlocks : array of TUniContainerPanel; iCountBlocks : integer ; iScreenWidth, iScreenHeight : integer; pFrame : TObject ) ;
var
   f, x, y, z , c: integer;
   bLoaded : boolean;
   cDebugHint, cTemp, cTemp2, cTemp5  : string;
   oObjDebug, oObjNextDebug : TUniControl;
   pLabel : TUniLabel;

begin
     {$ifdef DEBUG}
     try
        x := 0;
        y := 0;
        z := 2;
        bLoaded := false;
        cTemp5 := '';
        for f := 0 to iCountBlocks-1 do
        begin
             z := 0;
             oObjDebug  := oBlocks[ f ];
             cDebugHint := '[[' + rc_NormalizeHintAttr( oObjDebug.Hint ) + ']]';
             If ( oObjDebug.Enabled ) and ( oObjDebug.Visible ) and ( Pos( 'cols-debug:', cDebugHint ) > 0 ) then
             begin
                cTemp5 := rc_GetHintAttr( 'cols-debug:', cDebugHint );
                //cols-debug:parent
                If ( not bLoaded ) and ( Pos( 'cols-debug:', cDebugHint ) > 0 ) then
                begin
                   bLoaded := true;
                   //posxy
                   pLabel := rc_CreateLabel( TComponent(oObjDebug.Owner),
                                             TUniControl( oObjDebug.Parent ),
                                             'rcDebugColLabelParent2_' + TComponent(oObjDebug).Name,
                                             iScreenWidth,
                                             17,
                                             3,
                                             0,
                                             '[[align:' + TUniControl( oObjDebug.Parent ).Name + ' b:-20|cls:bringtofront-higher-1]]',
                                             true ,
                                             true );
                   pLabel.Font.Name := 'Consolas';
                   pLabel.Font.Size := 8;
                   pLabel.Font.Color := clRed;
                   pLabel.TextConversion := txtHtml;
                   pLabel.Caption := rc_SpanText( 'rc-font-monospace text-danger' , 'x:', 'rc-font-monospace text-muted', oObjDebug.Parent.Left.ToString ) + '&nbsp&nbsp' +
                                     rc_SpanText( 'rc-font-monospace text-danger' , 'y:', 'rc-font-monospace text-muted', oObjDebug.Parent.Top.ToString ) + '&nbsp&nbsp' +
                                     rc_SpanText( 'rc-font-monospace text-danger' , 'w:', 'rc-font-monospace text-muted', oObjDebug.Parent.Width.ToString ) + '&nbsp&nbsp' +
                                     rc_SpanText( 'rc-font-monospace text-danger' , 'h:', 'rc-font-monospace text-muted', oObjDebug.Parent.Height.ToString ) ;
                   pLabel.Top     := iScreenHeight - pLabel.Height - 3;// 2;
                end;
                //transp. panel
                oObjNextDebug := rc_CreateContainer( TComponent(oObjDebug.Owner),
                                                     oObjDebug,
                                                     'rcDebugColPP_' + f.ToString,
                                                     oObjDebug.Width,
                                                     oObjDebug.Height,
                                                     0 ,
                                                     0,
                                                     '',
                                                     true,
                                                     true
                                                     );
                cTemp := cDebugHint;//rc_NormalizeHintAttr( cDebugHint );
                cTemp := StringReplace( cTemp, '|', '<br>', [rfReplaceAll] );
                cTemp2 := rc_NormalizeHintAttr( oObjDebug.Parent.Hint );
                cTemp2 := StringReplace( cTemp2, '|', '<br>', [rfReplaceAll] );
                if ( cTemp2 <> '' ) then
                begin
                   cTemp := cTemp + '<br><br>' +
                            '<div class=''rc-font-bold''>Parent [' + oObjDebug.Parent.Name + '] Attributes</div><br>' +
                            cTemp2;
                end;
                oObjNextDebug.Hint    := '[[cls:' + cTemp5 + ' bringtofront-lower-1 trans-obj-9 rc-dashed-border|hint:' + cTemp + ' t:block attributes c:info-light w:300 d:10000]]';
                oObjNextDebug.Anchors := [akLeft, akRight, akTop, akBottom];
                if cTemp5 = '' then
                   oObjNextDebug.Color   := clInfoBk;
                //name
                pLabel := rc_CreateLabel( TComponent(oObjDebug.Owner),
                                          TUniControl( oObjNextDebug ),
                                          'rcDebugColLabelName_' + oObjNextDebug.Name,
                                          65,
                                          17,
                                          5,
                                          z,
                                          '',
                                          true ,
                                          true );
                pLabel.Font.Name := 'Consolas';
                pLabel.Font.Size := 8;
                pLabel.Font.Color := clRed;
                pLabel.TextConversion := txtHtml;
                z := z + 18;
                //pLabel.Caption := rc_SpanText( 'rc-font-monospace text-danger' , 'name:', 'rc-font-monospace text-muted', TComponent(oObjDebug).Name );
                pLabel.Caption := rc_SpanText( 'rc-font-monospace text-muted', TComponent(oObjDebug).Name );
                c     := StrToIntDef( rc_GetHintAttr( 'cols-grid:', oObjDebug.Hint ), GRID_COLS );
                cTemp := rc_SpanText( 'rc-font-monospace text-danger' , '&nbsp&nbspcols:', 'rc-font-monospace text-muted', oObjDebug.Tag.ToString + '|' + c.ToString );
                pLabel.Caption := pLabel.Caption + cTemp;
                //posxy
                pLabel := rc_CreateLabel( TComponent(oObjDebug.Owner),
                                          TUniControl( oObjNextDebug ),
                                          'rcDebugColLabelPosXY_' + oObjNextDebug.Name,
                                          65,
                                          17,
                                          5,
                                          z,
                                          '',
                                          true ,
                                          true );
                pLabel.Font.Name := 'Consolas';
                pLabel.Font.Size := 8;
                pLabel.Font.Color := clRed;
                pLabel.TextConversion := txtHtml;
                z := z + 18;
                pLabel.Caption := rc_SpanText( 'rc-font-monospace text-danger' , 'x:', 'rc-font-monospace text-muted', oObjDebug.Left.ToString ) + '&nbsp&nbsp' +
                                  rc_SpanText( 'rc-font-monospace text-danger' , 'y:', 'rc-font-monospace text-muted', oObjDebug.Top.ToString ) + '&nbsp&nbsp' +
                                  rc_SpanText( 'rc-font-monospace text-danger' , 'w:', 'rc-font-monospace text-muted', oObjDebug.Width.ToString ) + '&nbsp&nbsp' +
                                  rc_SpanText( 'rc-font-monospace text-danger' , 'h:', 'rc-font-monospace text-muted', oObjDebug.Height.ToString ) + '&nbsp&nbsp' +
                                  rc_SpanText( 'rc-font-monospace text-danger' , 'Grid:', 'rc-font-monospace text-muted', GRID_SYSTEM ) ;
             end;
        end;
        if bLoaded then rc_RenderLayout( TComponent( pFrame ) );
     Except on e:exception do
            begin
                 ShowMessageN( 'cols-debug: ' + e.Message );
            end;
     End;
     {$endif}
end;
// 7.0.0.0 hr michael
procedure rc_SetHeight( pFrame : TObject; pObj : TUniControl; pAttrib, pAttribs : string );
var
   cTemp, cTemp2, cTemp3,cObjParentName : string;
   oObj_HRCHILD_Parent : TUniControl;
   fPercent : double;
   iPlus, iMinus : integer; // 6.0.0.0+
begin
   cTemp3 := rc_GetHintAttr( pAttrib + '-', pAttribs ) + ' '; // parent:50%-top
                                                       // self-top
                                                       // object-top
   cTemp3 := Copy( cTemp3, 1, pos( ' ' , cTemp3 ) - 1);
   cTemp3 := stringreplace( cTemp3, '(', '', [rfReplaceAll] );
   cTemp3 := stringreplace( cTemp3, ')', '', [rfReplaceAll] );
   cTemp3 := stringreplace( cTemp3, '-top', '', [rfReplaceAll] );

   //6.0.0.0+
   cTemp2 := '';
   iPlus  := 0;
   iMinus := 0;

   cObjParentName := '';
   if pos( '+', cTemp3 ) > 0 then
   begin
      cObjParentName := Copy( cTemp3, 1, pos( '+', cTemp3 ) - 1 );
      iPlus := StrToIntDef( ReturnNumbers( Copy( cTemp3, pos( '+', cTemp3 ) + 1 ) ), 0 )
   end
   else
   if pos( '-', cTemp3 ) > 0 then
   begin
      cObjParentName := Copy( cTemp3, 1, pos( '-', cTemp3 ) - 1 );
      iMinus := StrToIntDef( ReturnNumbers( Copy( cTemp3, pos( '-', cTemp3 ) + 1 ) ), 0 );
   end;
   if cObjParentName <> '' then
      cTemp3 := cObjParentName;

   if Pos( 'parent', cTemp3 ) > 0 then
   begin
      oObj_HRCHILD_Parent := TUniControl( pObj.Parent );
   end
   else
   if Pos( 'self', cTemp3 ) > 0 then
   begin
      oObj_HRCHILD_Parent := TUniControl( pObj )
   end
   else //other object
   begin
      cTemp2 := cTemp3;//ReturnLetters( cTemp3 );
      oObj_HRCHILD_Parent := TUniContainerPanel( rc_FindControl( cTemp2 , pFrame ) );
      //7.0.0.0 michael
      if iPlus + iMinus = 0 then
      begin
         cTemp2 := cTemp3 ;
         oObj_HRCHILD_Parent := TUniContainerPanel( rc_FindControl( cTemp2 , pFrame ) );
      end;
      if ( oObj_HRCHILD_Parent <> nil ) then
         cTemp3 := '';
   end;
   //hr:xs-(self-top) sm-(self-top) md-(parent:50%-top)
   //7.0.0.0 michael
   //7.0.0.0 hr:
   if Pos( '%', cTemp3 ) > 0 then
   begin
      //7.0.0.0 hr:
      //fPercent := rc_GetHRPercent( cTemp3, pAttrib );
      fPercent := rc_GetHRPercent( pAttribs, pAttrib );
      if fPercent = 0 then
      begin
         cTemp2 := rc_GetHintAttr( 'prior-hr:', TUniControl( pObj ).Hint );
         if cTemp2 = '' then
            TUniControl(pObj).Height := rc_GetBlockHeight( pObj, pFrame, cTemp, pAttrib )
         else
            TUniControl(pObj).Height := StrToIntDef( cTemp2, TUniControl(pObj).Height);
      end
      else
         TUniControl(pObj).Height := Trunc( ( ( fPercent ) * ( oObj_HRCHILD_Parent.Height ) )  );
   end
   else
   if ( cTemp3 <> '' ) then
   begin
      TUniControl(pObj).Height := StrToIntDef( cTemp3, TUniControl(pObj).Height );
   end
   else
   //6.0.0.0+
   if ( cTemp2 <> '' ) and ( oObj_HRCHILD_Parent <> nil ) then
   begin
      TUniControl(pObj).Height := oObj_HRCHILD_Parent.Height ;
      TUniControl(pObj).Height := TUniControl(pObj).Height + iPlus;
      TUniControl(pObj).Height := TUniControl(pObj).Height - iMinus;
   end;
end;

function  rc_GetOFFInfo( pFrame : TObject;
                         pHint : string ;
                         iOffSet : integer;
                         bMobileScreen : boolean ;
                         bMobileScreenPortrait : boolean ;
                         bMobileScreenLandScape : boolean;
                         bDesktop : boolean  ) : integer;
var
   cTemp, cTemp3, cTemp4, cTemp5 : string;
   ff : integer;
   oObjTemp2 : TUniControl;
begin
  cTemp := pHint;
  ff    := 0;
  if ( Pos( ' off:' , cTemp ) > 0 ) or
     ( Pos( ' off-mobile-v' , cTemp ) > 0 ) or
     ( Pos( ' off-mobile-h' , cTemp ) > 0 ) or
     ( Pos( ' off-mobile-' , cTemp ) > 0 ) then
  begin
     if Pos( ' off:default-offset' , cTemp ) > 0 then
        ff := iOffSet
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
              ff := oObjTemp2.Height;
              if Pos( '+', cTemp ) > 0 then
              begin
                 cTemp3 := Copy( cTemp, Pos( '+', cTemp ) + 1 ) + ' ';
                 cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 ) ;
                 ff := ff + StrToIntDef( cTemp3, 0 );
              end;
           end;
        end
        else
          ff := ff + StrToIntDef( ReturnNumbers( Copy( cTemp, Pos( ' off:' , cTemp ) , Pos( ' ' , cTemp ) ) ), 0 );
     end;

     cTemp5  := rc_GetHintAttr( 'off:', cTemp, false ) + ' ' ;
     ff := ff + StrToIntDef( Copy( cTemp5, 1, pos( ' ' , cTemp5 ) - 1 ), 0 );
     if ( Pos( 'off-mobile-v', cTemp5 ) > 0 ) and ( bMobileScreenPortrait ) then
     begin
          cTemp5  := rc_GetHintAttr( 'off-mobile-v-', cTemp, true ) ;
          if cTemp = 'default-offset' then
             ff := iOffSet
          else
             ff := StrToIntDef( cTemp5, 0 );
          cTemp5  := '';
     end
     else
     if ( Pos( 'off-mobile-h', cTemp5 ) > 0 ) and ( bMobileScreenLandScape ) then
     begin
          cTemp5  := rc_GetHintAttr( 'off-mobile-h-', cTemp, true ) ;
          if cTemp = 'default-offset' then
             ff := iOffSet
          else
             ff := StrToIntDef( cTemp5, 0 );
          cTemp5  := '';
     end
     else
     if ( Pos( 'off-mobile-', cTemp5 ) > 0 ) and ( bMobileScreen ) then
     begin
          cTemp5  := rc_GetHintAttr( 'off-mobile-', cTemp, true ) ;
          if cTemp = 'default-offset' then
             ff := iOffSet
          else
             ff := StrToIntDef( cTemp5, 0 );
          cTemp5  := '';
     end;
  end;
  if ( ( Pos( ' mobile-off' , cTemp ) > 0 ) and ( bMobileScreen ) ) or
     ( ( Pos( ' mobile-v-off' , cTemp ) > 0 ) and ( bMobileScreenPortrait ) ) or
     ( ( Pos( ' mobile-h-off' , cTemp ) > 0 ) and ( bMobileScreenLandScape ) ) then
     ff := 0;

  Result := ff;
end;
//6.0.0.2
procedure rc_HRReplicate( pForm : TObject;
                          pObj : TUniControl;
                          pHint : string ;
                          bMobileScreen : boolean ;
                          bMobileScreenPortrait : boolean ;
                          bMobileScreenLandScape : boolean;
                          bDesktop : boolean  );
var
   cTemp, cTemp2, cTemp3 : string;
   oObjTemp : TUniControl;
begin
    cTemp := rc_GetHintAttr( 'h-replicate:', pObj.Hint ) + ' ';
    while Trim( cTemp ) <> '' do
    begin
         if Copy( cTemp, 1, 7 ) = 'blocks(' then
         begin
            cTemp := Copy( cTemp, 8 );
            cTemp := StringReplace( cTemp, ')', '', [rfReplaceAll] );
         end;

         cTemp2 := Trim( Copy( cTemp, 1, pos( ' ', cTemp ) ) );
         cTemp3 := '';
         if ( Copy( cTemp2, 1, 7 ) = 'rcBlock' ) then
         begin
            oObjTemp := TUniControl( TComponent( pForm ).FindComponent( cTemp2 ) );
            if Copy( cTemp2, 1, 7 ) = 'rcBlock' then
               cTemp3 := cTemp2
            else
               cTemp3 := '';
         end
         else
         begin
            oObjTemp := TUniControl( TComponent( pForm ).FindComponent( 'rcBlock' + cTemp2 ) );
            if ReturnLetters( cTemp2 ) = '' then
               cTemp3 := 'rcBlock' + cTemp2
            else
               cTemp3 := '';
         end;

         if oObjTemp <> nil then
         begin
              if (
                 ( ( bMobileScreen ) and ( ( Pos( 'mobile-off', cTemp ) > 0 ) ) ) or
                 ( ( bMobileScreenPortrait ) and ( ( Pos( 'mobile-v-off', cTemp ) > 0 ) ) ) or
                 ( ( bMobileScreenLandScape ) and ( ( Pos( 'mobile-h-off', cTemp ) > 0 ) ) )
                 ) then
              begin
                 cTemp3 := rc_GetHintAttr( 'prior-h-replicate:', oObjTemp.Hint ) ;
                 if cTemp3 <> '' then
                    oObjTemp.Height := StrToIntDef( cTemp3, oObjTemp.Height );
              end
              else
              begin
                 oObjTemp.Hint := rc_SetHintAttr( oObjTemp.Height.ToString , 'prior-h-replicate:', oObjTemp.Hint ) ;
                 oObjTemp.Height := TUniControl(pObj).Height;
              end;
              cTemp := Trim( StringReplace( cTemp, cTemp2, '', [rfReplaceAll] ) ) + ' ';
         end
         else
         begin
            if ( cTemp3 <> '' ) then
               ShowMessage( 'h-replicate: Object ' + cTemp3 + ' not found!' );
            cTemp := '';
         end;
    end;
end;

function rc_GetHRPercent( pAttribs, pAttrib : string ) : double ;
var
  cTemp,cTemp2 : string;
begin
   Result := 0.00;
   cTemp := Copy( pAttribs, pos( pAttrib, pAttribs ) ) + ' ';
   cTemp := Copy( cTemp, 1, Pos( ' ', cTemp ) - 1 );
   cTemp := Copy( cTemp, 5);
   cTemp := StringReplace( cTemp, ')' , '', [rfReplaceAll] );
   //pegar o SELF qd for mobile... <--- FALTANDO
   if Pos( '%' , cTemp ) > 0 then
   begin
      cTemp := ReturnNumbers( Copy( cTemp, 1, pos( '%', cTemp ) - 1 ) );
      if cTemp = '' then
         cTemp := '0';
//      cTemp2 := rc_GethintProperty( 'off:', pAttribs );
//      if cTemp2 <> '' then
//      begin
//           cTemp := StringReplace( cTemp, 'off:' + cTemp2 , '', [rfReplaceAll] );
//      end;
//      cTemp := StringReplace( cTemp, '-top' , '', [rfReplaceAll] );
//      cTemp := Copy( cTemp, pos( ':', cTemp ) + 1 );
//      cTemp := StringReplace( cTemp, '%' , '', [rfReplaceAll] );
      Result := ( StrToFloat_Universal( cTemp ) / 100 ) ;
   end;
end;

function rc_GetBlockPrior( pBlock, pFrameOrig : TObject ) : string;
var
   n, f, i : integer;
   cSeq : string;
   oObject : TUniContainerPanel;
begin
     oObject := nil;

     if pBlock <> nil then
     begin
        cSeq := ReturnNumbers( TComponent(pBlock).Name );

        if Pos( '_', cSeq ) > 0 then
        begin
           n := StrToIntDef( Copy( cSeq, 1, Pos( '_' , cSeq ) - 1 ) , 0 );
           f := StrToIntDef( Copy( cSeq, Pos( '_' , cSeq ) + 1 , 5 ) , 0 );
        end
        else
        begin
           f := StrToIntDef( cSeq, 0 );
        end;

        for I := ( f - 1 ) downto 1 do
        begin
            if Pos( '_', cSeq ) > 0 then
               cSeq := n.ToString + '_' + i.ToString
            else
               cSeq := i.ToString;

            oObject := TUniContainerPanel( rc_FindControl( 'rcBlock' + cSeq , pFrameOrig ) );

            if oObject <> nil then
               if oObject.Enabled then
                  Break else cSeq := '';
        end;
     end;

     Result := cSeq;
end;

function rc_GetBlockNext( pBlock, pFrameOrig : TObject ) : string;
var
   n, f, i : integer;
   cSeq : string;
   oObject : TUniContainerPanel;
begin
     oObject := nil;

     if pBlock <> nil then
     begin
        cSeq := ReturnNumbers( TComponent(pBlock).Name );

        if Pos( '_', cSeq ) > 0 then
        begin
           n := StrToIntDef( Copy( cSeq, 1, Pos( '_' , cSeq ) - 1 ) , 0 );
           f := StrToIntDef( Copy( cSeq, Pos( '_' , cSeq ) + 1 , 5 ) , 0 );
        end
        else
        begin
           f := StrToIntDef( cSeq, 0 );
        end;

        for I := ( f + 1 ) to ( f + GRID_MAX_BLOCKS ) do
        begin
            if Pos( '_', cSeq ) > 0 then
               cSeq := n.ToString + '_' + i.ToString
            else
               cSeq := i.ToString;

            oObject := TUniContainerPanel( rc_FindControl( 'rcBlock' + cSeq , pFrameOrig ) );

            if oObject <> nil then
               if oObject.Enabled then
                  Break else cSeq := '';
        end;
     end;

     Result := cSeq;
end;

function rc_GetBlockHeight( oObj, pFrame : TObject; pParamBlk, pAttrib : string ) : integer;
var
   cTemp2, cTemp3 : string;
   x, y : integer;
   oObjTemp2 : TUniControl;
begin
   Result := 0;
   cTemp2 := Trim( Copy( pParamBlk, Pos( pAttrib + '-' , pParamBlk ) + 3 , 200 ) );

   if Pos( ' ' , cTemp2 ) > 0 then
      cTemp2 := Trim( Copy( cTemp2, 1, Pos( ' ', cTemp2 ) ) );

   if ReturnLetters( cTemp2 ) <> '' then
   begin
        if Pos( '(' , cTemp2 ) > 0 then
        begin

             cTemp2 := stringReplace( cTemp2, '(', '', [rfReplaceAll] );
             cTemp2 := stringReplace( cTemp2, ')', '', [rfReplaceAll] );
             x := 0;
             if Pos( '+', cTemp2 ) > 0 then
                x := Pos( '+', cTemp2 )
             else
             if Pos( '-', cTemp2 ) > 0 then
                x := Pos( '-', cTemp2 );
                cTemp3 := Copy( cTemp2, 1, x - 1 );
             if cTemp3 <> 'parent' then
                oObjTemp2 := TUniControl( rc_FindControl( cTemp3 , pFrame ) )
             else
             if TUniControl(oObj).HasParent then
             begin
                oObjTemp2 := TUniControl( TUniControl(oObj).Parent );
             end
             else
                oObjTemp2 := nil;

             if oObjTemp2 <> nil then
             begin

                cTemp2 := Copy( cTemp2, x , 50 );

                if x > 0 then
                begin
                   x := TUniControl(oObjTemp2).Height + StrToIntDef( cTemp2, 0  );
                end
                else
                begin

                    x := Pos( '-', cTemp2 );
                    cTemp2 := Copy( cTemp2, x , 50 );

                    if x > 0 then
                    begin
                       x := TUniControl(oObjTemp2).Height - StrToIntDef( cTemp2, 0  );
                    end
                    else
                    begin

                       x := Pos( '*', cTemp2 );
                       cTemp2 := Copy( cTemp2, x , 50 );

                       if x > 0 then
                       begin
                          x := TUniControl(oObjTemp2).Height * StrToIntDef( cTemp2, 0  );
                       end
                       else
                       begin

                          x := Pos( '/', cTemp2 );
                          cTemp2 := Copy( cTemp2, x , 50 );

                          if x > 0 then
                          begin
                             x := Trunc( TUniControl(oObjTemp2).Height / StrToIntDef( cTemp2, 1  ) );
                          end
                          else
                          begin
                             x := TUniControl( oObjTemp2 ).Height;
                          end;
                       end;
                    end;
                end;
             end
             else
                x := TUniControl( oObj ).Height;

             Result := x;
        end
        else
        begin

             if cTemp2 = 'self' then
                oObjTemp2 := TUniControl( oObj )
             else
                oObjTemp2 := TUniControl( rc_FindControl( cTemp2 , pFrame ) );
             if oObjTemp2 <> nil then
                Result := TUniControl( oObjTemp2 ).Height;
        end;
   end
   else
   begin
      pParamBlk := Trim( Copy( pParamBlk, Pos( pAttrib , pParamBlk ) + 3 , 5 ) );

      if Pos( ' ' , pParamBlk ) > 0 then
         pParamBlk := Trim( Copy( pParamBlk, 1, Pos( ' ' , pParamBlk ) - 1 ) );

      Result := StrToIntDef( pParamBlk , TUniControl( oObj ).Height );
   end;
end;

procedure rc_ResizeBlocksExecute( pFrame : TObject ;
                                  iMenu : integer;
                                  iOffSet : integer ;
                                  iOffSet_Border : integer ;
                                  iNumBlocks : integer ;
                                  iAreaAvailableH : integer ;
                                  iAreaAvailableV : integer;
                                  iResponsivenessLimitH : integer;
                                  iResponsivenessLimitV : integer ;
                                  bMobileScreen : boolean;
                                  bMobileScreenPortrait : boolean;
                                  bMobileScreenLandScape : boolean;
                                  bDesktop : boolean ;
                                  bTablet : boolean ; //6.0.0.2
                                  //iScrollbar_Size : integer = 0;
                                  iScreenWidth : integer ;
                                  iScreenHeight : integer
                                  );
var
   cAlignMobile, cAlignMobileOff,
   fClassName, cCmd, cTemp, cTemp2, cTemp3, cTemp4, cTemp5,
   pgNAme : string;
   fClass : TClass;
   pLabel : TuniLabel;
   frm : TUniFrame;
   // armazenar os blocos que totalizar 12 colunas pra cada linha
   // pora ajustar suas larguras
   oBlocks        : Array[ 1..2000 ] of TUniContainerPanel;
   oBlocksProps   : Array[ 1..2000, 1..6 ] of Integer;
   oBlocksSameLine: Array[ 1..GRID_COLS ] of TUniContainerPanel; // 7.0.0.0 12 noborderall left right
   iColsChilds    : integer;

   oBlocksChilds     : Array of TUniContainerPanel;
   oBlocksChildsNum  : Array of Integer;
   iBlocksChilds  : integer;

   oObjDebug, oObjNextDebug,
   oObj, oObjPrior, oObjNext : TUniContainerPanel;

   oObj_HRCHILD, oObj_HRCHILD_Parent,
   oObj_Parent,
   oObj4 ,
   oObjTemp, oObjTemp2, oObjTemp3, oObjTemp4 : TUniControl;

   oComponent : TComponent;

   fPercent,
   fHeight : double;

   iTabs, iTabLastPos, iFirstPos, iCountBlocks,

   iColsXS, iColsSM, iColsMD, iColsLG, iColsXL, iCols4k, iCols8k,
   iHeightXS, iHeightSM, iHeightMD, iHeightLG, iHeightXL, iHeight4k, iHeight8k,

   iTopMinus,
   i,f,n,x,y, o, ff,
   iLeft, iTop, iRight, iBottom, iWidth, iHeight, iHeightParent,
   iPos, iPos2,

   iResponsivenessLimit,

   //iBlockWidth, iBlockHeight,
   iNumBlocksH, iNumBlocksV,

   //iBlockExtraWidth, // 7.0.0.0 noborderall left right
   //iBlockAdjustWidth,// 7.0.0.0 noborderall left right

   iMaxAreaAvaibleH,
   iNextObjWidth, iPriorObjWidth,

   //7.0.0.0
   iGridCols, iGridColsQuarter,
   iMaxWidthToCheckBorders,
   iMinWidthToCheckBorders,
   iMax,
   iMax_h,
   iMax_mob,
   iMax_mob_v,
   iMax_mob_h,
   iMin,
   iMin_h,
   iMin_mob,
   iMin_mob_v,
   iMin_mob_h,
   iBiggerHeight,

   iParentWidth,
   i3, i4, i5, i6, z : integer; // 7.0.0.0 noborderall left right

   iBlockExtraWidth, // 7.0.0.0 noborderall left right
   iBlockAdjustWidth,// 7.0.0.0 noborderall left right
   iBlockWidth, iBlockHeight,
   iBlockPercent : Double;


   bMobile, // 6.0.0.0
   bMobile_off, // 6.0.0.0
   bNoBorderAll,
   bNoBorderAll2,
   bNoBorderAll3,
   bNoBorderAllBlocksInLine, // 7.0.0.0 noborderall left right
   bNoBorder,
   bBlockAreaMax,
   bNoBorderRight2, bNoBorderBottom2,
   bNoBorderLeft2, bNoBorderTop2,
   bNoBorderRight, bNoBorderBottom,
   bNoBorderLeft, bNoBorderTop,
   bNoBorderRight3, bNoBorderBottom3,
   bNoBorderLeft3, bNoBorderTop3 : boolean;
   //6.0.0.2
   cNoBorderBottom, cNoBorderLeft, cNoBorderTop,
   cNoBorderRight : string;

   IniFile : TMemIniFile;
   cHR_Obj,
   cHint, cHintNext, cHintPrior  : string;
   bHasDynamicValidation, bLoaded , bHided: boolean; //7.0.0.0
   iHRChildPlusValid : integer;

   procedure rc_CheckBorders;
   var
      iObjLeft, iObjWidth, iObjNextLeft, iObjPriorWidth : integer;
      iMaxWidth, iMinWidth, iMaxPriorWidth, iMinPriorWidth : integer;
   begin
      if not bNoBorderAllBlocksInLine then
      begin
          iObjLeft     := 0;
          iObjWidth    := 0;
          iObjNextLeft := 0;
          iObjPriorWidth := 0;

          if oObjNext <> nil then
             iObjNextLeft := oObjNext.Left;
          if oObjPrior <> nil then
          begin
             iObjPriorWidth := oObjPrior.Width;
             iMaxPriorWidth := StrToIntDef( rc_GetHintAttr( 'rc-maxwidth:', oObjPrior.Hint ), -1 );
             iMinPriorWidth := StrToIntDef( rc_GetHintAttr( 'rc-minwidth:', oObjPrior.Hint ), -1 );

             if ( i6 > 1 ) then //or ( i = 0 ) then
                oObj.Left  := oObjPrior.Left + iObjPriorWidth;
          end;

          iMaxWidth := StrToIntDef( rc_GetHintAttr( 'rc-maxwidth:', oObj.Hint ), -1 );
          iMinWidth := StrToIntDef( rc_GetHintAttr( 'rc-minwidth:', oObj.Hint ), -1 );

          if iMaxWidth <> -1 then
             oObj.Width := iMaxWidth
          else
             oObj.Width := Trunc( iBlockWidth * oObj.Tag );

          iObjLeft     := oObj.Left;
          iObjWidth    := oObj.Width;

          //BLOCO ATUAL
          //7.0.0.0 new
          iObjLeft  := iObjLeft + iOffSet_Border;
          if ( iMinWidth =-1 ) or ( ( iMinWidth >= 0 ) and ( iObjWidth - iOffSet_Border >= iMinWidth ) ) then
             iObjWidth := iObjWidth - iOffSet_Border ;
          if ( bNoBorderLeft ) then
          begin
            iObjLeft := iObjLeft - iOffSet_Border; // Ex Left=0 > Left=20px
            if ( iMaxWidth =-1 ) or ( ( iMaxWidth >= 0 ) and ( iObjWidth + iOffSet_Border < iMaxWidth ) ) then
            begin
               iObjWidth := iObjWidth + iOffSet_Border ;
               i5 := i5 + iOffSet_Border;
            end;
          end;

          //BLOCO ATUAL
          if ( bNoBorderRight ) then
          begin
            if ( iMaxWidth =-1 ) or ( ( iMaxWidth >= 0 ) and ( iObjWidth + iOffSet_Border < iMaxWidth ) ) then
            begin
               iObjWidth := iObjWidth + iOffSet_Border  ;
               i5 := i5 + iOffSet_Border;
            end;
          end;

          if ( bNoBorderRight2 ) then
          begin
            iObjLeft := iObjLeft - iOffSet_Border;
          end;

          if ( bNoBorderRight2 ) and ( bNoBorderLeft ) then
          begin
             iObjLeft  := iObjLeft + iOffSet_Border;
            if ( iMinWidth =-1 ) or ( ( iMinWidth >= 0 ) and ( iObjWidth - iOffSet_Border >= iMinWidth ) ) then
            begin
               iObjWidth := iObjWidth - iOffSet_Border  ;
               i5 := i5 - iOffSet_Border;
            end;
          end;

          oObj.Left       := iObjLeft;
          //if oObjNext <> nil then
          //   oObjNext.Left   := iObjNextLeft;
          oObj.Width      := iObjWidth;
          //if oObjPrior <> nil then
          //   oObjPrior.Width := iObjPriorWidth;
      end;
   end;

begin
     iNumBlocks := GRID_COLS;//7.0.0.0 12
     iMin_mob   := 0;
     iMin_mob_h := 0;
     iMin_mob_h := 0;
     iMin       := 0;
     iMin_h     := 0;
     iMax_mob   := 0;
     iMax_mob_h := 0;
     iMax_mob_h := 0;
     iMax       := 0;
     iMax_h     := 0;
     iColsChilds := 0;
     iTopMinus   := 0;
     // linux issue
     oObjTemp  := nil; // feedback by mesut (turkey)
     oObjTemp2 := nil;
     oObjTemp3 := nil;

     if TComponent( pFrame ).Name <> 'MainForm' then
        f := 0;

     i  := 0;
     i3 := 1; // intervalo entre sequenciais de blocos para permitir futuras inserções
     i4 := 0; // contador de colunas
     i5 := 0; // somar width dos blocos exibidos em cada linha
     i6 := 0; // contador de blocos por linha // 7.0.0.0 noborderall left right
     // organizar blocos( widgets ) de acordo com o no. de colunas que ele ocupará
     // defina a prop. tag de cada bloco: 1 , 2 , 3 ou 4 colunas
     iCountBlocks := 0;
     i3 := 0;
     // default RC GRID values
     iColsXS := GRID_COLS; //12;
     iColsSM := GRID_COLS; //12;
     iColsMD := GRID_COLS_QUARTER; //3
     iColsLG := GRID_COLS_QUARTER; //3
     iColsXL := GRID_COLS_QUARTER; //3
     iCols4K := GRID_COLS_QUARTER; //3
     iCols8K := GRID_COLS_QUARTER; //3

     iHeightXS := 52;
     iHeightSM := 52;
     iHeightMD := 52;
     iHeightLG := 52;
     iHeightXL := 52;
     iHeight4K := 52;
     iHeight8K := 52;
     oObj_Parent  := nil;
     oObj_HRCHILD := nil;
     oObj_HRCHILD_Parent := nil;
     Try
       // 7.0.0.0
       rc_ValidateBlocks( pFrame );
       for f := 1 to GRID_MAX_BLOCKS do
       begin
            oObj  := TUniContainerPanel( rc_FindControl( 'rcBlock' + f.tostring , pFrame ) );
            cHint := '';
            //7.0.0.0
            //if ( oObj <> nil ) and ( Pos( 'start-enabled:false', oObj.Hint ) = 0 ) then
            if ( oObj <> nil ) then
            begin
               oObj.Hint := '[[' + rc_NormalizeHintAttr( oObj.Hint ) + ']]';
               cTemp3 := rc_GetHintAttr( 'hide:', oObj.Hint ) ;
               if ( cTemp3 <> '' ) then
               begin
                  bHided := false;

                  if ( lowercase(oObj.Name) = 'rcblock300' ) and ( Pos( ' disable', cTemp3 ) > 3 ) then
                     cTemp3 := cTemp3;
                  if rc_GetHintAttr( 'hideh:', oObj.Hint ) = '' then
                     oObj.Hint := rc_SetHintAttr( oObj.Height.ToString , 'hideh:', oObj.Hint );

                  if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and ( bMobileScreenPortrait ) then
                  begin
                       oObj.Height := 0;
                       rc_ObjectVisible( pFrame, oObjTemp, false, true );
                       bHided := true;
                  end
                  else
                  if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and ( bMobileScreenLandscape ) then
                  begin
                       oObj.Height := 0;
                       rc_ObjectVisible( pFrame, oObjTemp, false, true );
                       bHided := true;
                  end
                  else
                  if ( ( Pos( 'mobile', cTemp3 ) > 0 ) and (  Pos( 'mobile-', cTemp3 ) = 0 ) ) and ( bMobileScreen ) then
                  begin
                       oObj.Height := 0;
                       rc_ObjectVisible( pFrame, oObjTemp, false, true );
                       bHided := true;
                  end
                  else
                  if ( Pos( 'desktop', cTemp3 ) > 0 ) and ( not bMobileScreen ) then
                  begin
                       oObj.Height := 0;
                       rc_ObjectVisible( pFrame, oObjTemp, false, true );
                       bHided := true;
                  end
                  else
                  begin
                       oObj.Height := StrToIntdef( rc_GetHintAttr( 'hideh:', oObj.Hint ) , 0 );
                  end;
                  if ( bHided ) then
                  begin
                     if ( Pos( ' disable', cTemp3 ) > 0 ) and ( not oObj.Visible ) then
                        rc_ObjectEnabled( pFrame, oObj, false, true )
                     else
                     if ( Pos( ' disable', cTemp3 ) > 0 ) and ( oObj.Visible ) then
                        rc_ObjectEnabled( pFrame, oObj, false, true )
                  end;
               end
               else
               if ( oObj.Visible ) and ( oObj.Enabled ) then
               begin
                  cTemp3 := rc_GetHintAttr( 'hideh:', oObj.Hint ) ;
                  if ( cTemp3 <> '' ) then
                  begin
                     oObj.Height := StrToIntdef( rc_GetHintAttr( 'hideh:', oObj.Hint ) , 0 );
                  end;
               end;

               if oObj.Enabled then
               begin
                  oObj.Hint := '[[' + rc_NormalizeHintAttr( oObj.Hint ) + ']]';
                  cHint     := '';

                  //7.0.0.0 GRID_COLS
                  iGridCols        := StrToIntDef( rc_GetHintAttr( 'cols-grid:', oObj.Hint ), GRID_COLS );
                  iGridColsQuarter := iGridCols div 4;
                  iNumBlocks       := iGridCols;
                  // default RC GRID values
                  iColsXS := iGridCols; //12;
                  iColsSM := iGridCols; //12;
                  iColsMD := iGridColsQuarter; //3
                  iColsLG := iGridColsQuarter; //3
                  iColsXL := iGridColsQuarter; //3
                  iCols4K := iGridColsQuarter; //3
                  iCols8K := iGridColsQuarter; //3
                  //7.0.0.0 GRID_COLS end

                  cTemp := '';

                  // 6.0.0.0
                  //[PT] carregamento do "hint" em runtime para testes de debug sem recompilar o projeto
                  //[EN] loading "hint" at runtime for debug testing without recompiling the project
                  rc_LoadComponentsCmd( pFrame, oObj );

                  Inc( iCountBlocks );
                  oBlocks[ iCountBlocks ] := oObj;
                  i3 := 0;
                  // sistema de colunas semelhante ao bootstrap
                  // [[cols:sm-1 md-2   lg-3    xl-4]]
                  cTemp := rc_GetHintAttr( 'cols:', oObj.Hint );

                  if ( ( StrToIntDef( cTemp, 0 ) = 0 ) and ( cTemp <> '0' ) ) and
                     ( Pos( 'xs-', oObj.Hint ) = 0 ) and
                     ( Pos( 'sm-', oObj.Hint ) = 0 ) and
                     ( Pos( 'md-', oObj.Hint ) = 0 ) and
                     ( Pos( 'lg-', oObj.Hint ) = 0 ) and
                     ( Pos( 'xxl-', oObj.Hint ) = 0 ) and //7.0.0.0 gridsystem
                     ( Pos( 'xl-', oObj.Hint ) = 0 ) and
                     ( Pos( '4k-', oObj.Hint ) = 0 ) and
                     ( Pos( '8k-', oObj.Hint ) = 0 ) then
                  begin
                       if Pos( '[[' , oObj.Hint ) = 0 then
                          oObj.Hint := '[[cols:' + iGridCols.ToString + ']]' //7.0.0.0 12
                       else
                          oObj.Hint := Copy( Trim( oObj.Hint ) , 1, Length( oObj.Hint ) - 2 ) + ' | cols:' + iGridCols.ToString + ']]' //7.0.0.0 12
                  end
                  else
                  if ( StrToIntDef( cTemp, 0 ) > 0 ) or ( cTemp = '0' ) then
                  begin
                       //oObj.Hint := StringReplace( oObj.Hint, 'cols:' + cTemp , 'cols:xs-' + cTemp + ' sm-' + cTemp + ' md-' + cTemp + ' lg-' + cTemp + ' xl-' + cTemp + ' xxl-' + cTemp + ' 4k-' + cTemp + ' 8k-' + cTemp , [rfReplaceAll] ); //7.0.0.0 gridsystem
                       cTemp := 'xs-' + cTemp + ' sm-' + cTemp + ' md-' + cTemp + ' lg-' + cTemp + ' xl-' + cTemp + ' xxl-' + cTemp + ' 4k-' + cTemp + ' 8k-' + cTemp;
                       oObj.Hint := rc_AddHintAttr( '|cols:' + cTemp, oObj.Hint, true );  //6.0.0.0
                  end;

                  cTemp := rc_GetHintAttr( 'cols:', oObj.Hint );
                  //[PT] md vai ser o padrão para os demais( caso não sejam definidos )
                  //[EN] md will be the default for the others (if not defined)
                  if ( Pos( 'md-', cTemp ) > 0 ) then
                  begin
                     cTemp3 := Trim( Copy( cTemp, Pos( 'md', cTemp ) + 3 , 2 ) ) ;
                     oObj.Tag := StrToIntDef( cTemp3 , 1 );
                     cTemp2   := Trim( Copy( cTemp, Pos( 'md', cTemp ) + 5 ) );
                     if cTemp2 = '' then
                     begin
                        cTemp := cTemp + ' lg-' + cTemp3 + ' xl-' + cTemp3 + ' xxl-' + cTemp3 + ' 4k-' + cTemp3 + ' 8k-' + cTemp3; //7.0.0.0 gridsystem

                        oObj.Hint := rc_AddHintAttr( '|cols:' + cTemp, oObj.Hint, true );  //6.0.0.0
                     end;
                     cTemp2 := '';
                     cTemp3 := '';
                  end;
                  //7.0.0.0 gridsystem
                  //if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 200 ) or
                  if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 400 ) or
                     ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_XS ) then
                  begin
                      if ( Pos( 'xs-', cTemp ) > 0 ) then
                         oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'xs', cTemp ) + 3 , 2 ) ) , 1 )
                      else
                         oObj.Tag := iColsXS;
                  end
                  else
//                  if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 400 ) or
//                     ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < iXS ) then
                  if ( iAreaAvailableH < GRID_BS_XS ) then
                  begin
                     if ( GRID_SYSTEM = 'RC' ) then
                     begin
                        if ( Pos( 'xs-', cTemp ) > 0 ) then
                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'xs', cTemp ) + 3 , 2 ) ) , 1 )
                        else
                           oObj.Tag := iColsSM;
                     end
                     else
                     begin
                        if ( bMobileScreen ) then
                           oObj.Tag := iColsXS;
                     end;
                  end
                  else
                  if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 768 ) or // to better adjustment on MOBILE
                     ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_SM ) then
                  begin
                     //if ( GRID_SYSTEM = 'RC' ) then
                     begin
                        if ( bMobileScreen ) and ( Pos( 'sm-', cTemp ) > 0 ) then
                        begin
                            if ( Pos( 'sm-', cTemp ) > 0 )  then
                               oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'sm', cTemp ) + 3 , 2 ) ) , 1 )
                            else
                               oObj.Tag := iColsSM;
                        end
                        else
                        if ( Pos( 'md-', cTemp ) > 0 )  then
                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'md', cTemp ) + 3 , 2 ) ) , 1 )
                        else
                           oObj.Tag := iColsMD;
//                     end
//                     else
//                     begin
//                        if ( Pos( 'md-', cTemp ) > 0 )  then
//                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'md', cTemp ) + 3 , 2 ) ) , 1 )
//                        else
//                           oObj.Tag := iColsMD;
                     end;
                  end
                  else
                  if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 1199 ) or
                     ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_MD ) then
                  begin
                     //6.0.0.2
                     //if ( GRID_SYSTEM = 'RC' ) then
                     begin
                        //[PT] quando for um Tablet, na horizontal, vai priorizar o "lg-" se não encontrar, aplicará o "md-"
                        //[EN] when it's a Tablet, horizontally, it will prioritize "lg-" if it doesn't find it, it will apply "md-"
                        if ( not bTablet ) and ( bMobileScreen ) and ( Pos( 'sm-', cTemp ) > 0 ) then
                        begin
                            if ( Pos( 'sm-', cTemp ) > 0 )  then
                               oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'sm', cTemp ) + 3 , 2 ) ) , 1 )
                            else
                               oObj.Tag := iColsSM;
                        end
                        else
                        begin
                           if ( Pos( 'lg-', cTemp ) > 0 ) then
                              oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'lg', cTemp ) + 3 , 2 ) ) , 1 )
                           else
                           if ( Pos( 'md-', cTemp ) = 0 ) then
                              oObj.Tag := iColsLG;
                        end;
//                     end
//                     else
//                     begin
//                        if ( Pos( 'lg-', cTemp ) > 0 ) then
//                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'lg', cTemp ) + 3 , 2 ) ) , 1 )
//                        else
//                        if ( Pos( 'md-', cTemp ) = 0 ) then
//                           oObj.Tag := iColsLG;
                     end;
                  end
                  else
                  if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 1366 ) or // 1368 thanks Fabio Oliveira
                     ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_LG ) then
                  begin
                     //6.0.0.2
                     //if ( GRID_SYSTEM = 'RC' ) then
                     begin
                        //[PT] quando for um Tablet, na horizontal, vai priorizar o "lg-" se não encontrar, aplicará o "md-"
                        //[EN] when it's a Tablet, horizontally, it will prioritize "lg-" if it doesn't find it, it will apply "md-"
                        if ( not bTablet ) and ( bMobileScreen ) and ( Pos( 'sm-', cTemp ) > 0 ) then
                        begin
                            if ( Pos( 'sm-', cTemp ) > 0 )  then
                               oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'sm', cTemp ) + 3 , 2 ) ) , 1 )
                            else
                               oObj.Tag := iColsSM;
                        end
                        else
                        begin
                           if ( Pos( 'lg-', cTemp ) > 0 ) then
                              oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'lg', cTemp ) + 3 , 2 ) ) , 1 )
                           else
                           if ( Pos( 'md-', cTemp ) = 0 ) then
                              oObj.Tag := iColsLG;
                        end;
//                     end
//                     else
//                     begin
//                        if ( Pos( 'lg-', cTemp ) > 0 ) then
//                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'lg', cTemp ) + 3 , 2 ) ) , 1 )
//                        else
//                        if ( Pos( 'md-', cTemp ) = 0 ) then
//                           oObj.Tag := iColsLG;
                     end;
                  end
                  else
                  if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 1399 ) or
                     ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_XL ) then
                  begin
                     //6.0.0.2
                     if ( GRID_SYSTEM = 'RC' ) then
                     begin
                        //[PT] quando for um Tablet, na horizontal, vai priorizar o "lg-" se não encontrar, aplicará o "md-"
                        //[EN] when it's a Tablet, horizontally, it will prioritize "lg-" if it doesn't find it, it will apply "md-"
                        if ( not bTablet ) and ( bMobileScreen ) and ( Pos( 'sm-', cTemp ) > 0 ) then
                        begin
                            if ( Pos( 'sm-', cTemp ) > 0 )  then
                               oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'sm', cTemp ) + 3 , 2 ) ) , 1 )
                            else
                               oObj.Tag := iColsSM;
                        end
                        else
                        begin
                           if ( Pos( 'lg-', cTemp ) > 0 ) then
                              oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'lg', cTemp ) + 3 , 2 ) ) , 1 )
                           else
                           if ( Pos( 'md-', cTemp ) = 0 ) then
                              oObj.Tag := iColsLG;
                        end;
                     end
                     else
                     begin
                        if ( Pos( 'lg-', cTemp ) > 0 ) then
                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'lg', cTemp ) + 3 , 2 ) ) , 1 )
                        else
                        if ( Pos( 'md-', cTemp ) = 0 ) then
                           oObj.Tag := iColsLG;
                     end;
                  end
                  else
                  if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 1920 ) or
                     ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_XXL ) then
                  begin
                     if ( GRID_SYSTEM = 'RC' ) then
                     begin
                        //6.0.0.2
                        //[PT] quando for um Tablet, na horizontal, vai priorizar o "lg-" se não encontrar, aplicará o "md-"
                        //[EN] when it's a Tablet, horizontally, it will prioritize "lg-" if it doesn't find it, it will apply "md-"
                        if ( not bTablet ) and ( bMobileScreen ) and ( Pos( 'sm-', cTemp ) > 0 ) then
                        begin
                            if ( Pos( 'sm-', cTemp ) > 0 )  then
                               oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'sm', cTemp ) + 3 , 2 ) ) , 1 )
                            else
                               oObj.Tag := iColsSM;
                        end
                        else
                        begin
                           if ( Pos( 'xl-', cTemp ) > 0 ) then
                              oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'xl', cTemp ) + 3 , 2 ) ) , 1 )
                           else
                           if ( Pos( 'lg-', cTemp ) > 0 ) then
                              oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'lg', cTemp ) + 3 , 2 ) ) , 1 )
                           else
                           if ( Pos( 'md-', cTemp ) = 0 ) then
                              oObj.Tag := iColsXL;
                        end;
                     end
                     else
                     begin
                        if ( Pos( 'xl-', cTemp ) > 0 ) then
                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'xl', cTemp ) + 3 , 2 ) ) , 1 )
                        else
                        if ( Pos( 'lg-', cTemp ) > 0 ) then
                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'lg', cTemp ) + 3 , 2 ) ) , 1 )
                        else
                        if ( Pos( 'md-', cTemp ) = 0 ) then
                           oObj.Tag := iColsXL;
                     end;
                  end
                  else
                  if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 3000 ) or
                     ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_4K ) then
                  begin
//                     if ( bMobileScreen ) and ( Pos( 'sm-', cTemp ) > 0 ) then
//                     begin
//                         if ( Pos( 'sm-', cTemp ) > 0 )  then
//                            oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'sm', cTemp ) + 3 , 2 ) ) , 1 )
//                         else
//                            oObj.Tag := iColsSM;
//                     end
//                     else
                     begin
                        if ( Pos( '4k-', cTemp ) > 0 ) then
                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( '4k', cTemp ) + 3 , 2 ) ) , 1 )
                        else
                        if ( Pos( 'md-', cTemp ) = 0 ) then
                           oObj.Tag := iCols4k;
                     end;
//                        if ( Pos( '4k-', cTemp ) > 0 ) then
//                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( '4k', cTemp ) + 3 , 2 ) ) , 1 )
//                        else
//                        if ( Pos( 'md-', cTemp ) = 0 ) then
//                           oObj.Tag := iCols4k;
                  end
                  else
                  if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 7000 ) or
                     ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_8K ) then
                  begin
//                     if ( bMobileScreen ) and ( Pos( 'sm-', cTemp ) > 0 ) then
//                     begin
//                         if ( Pos( 'sm-', cTemp ) > 0 )  then
//                            oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'sm', cTemp ) + 3 , 2 ) ) , 1 )
//                         else
//                            oObj.Tag := iColsSM;
//                     end
//                     else
                     begin
                        if ( Pos( '8k-', cTemp ) > 0 ) then
                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( '8k', cTemp ) + 3 , 2 ) ) , 1 )
                        else
                        if ( Pos( '4k-', cTemp ) > 0 ) then
                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( '4k', cTemp ) + 3 , 2 ) ) , 1 )
                        else
                        if ( Pos( 'md-', cTemp ) = 0 ) then
                           oObj.Tag := iCols8k;
                     end;
                  end;
               end
            end
            else
                Inc( i3 ); // [PT] dois intervalos entre sem encontrar um bloco indica que pode encerrar
                           // [EN] two gaps between without finding a block indicates that it can terminate
            // [PT] por padrão usamos intervalos de 5 em 5 , 10 em 10, 100 em 100... o limite até 5000 blocos
            //      isso permite inserir novos objetos dentro de uma sequencia
            // [PT] by default we use intervals of 5 in 5, 10 in 10, 100 in 100... the limit up to 5000 blocks
            //      this allows you to insert new objects into a sequence
            // rcBlock5..rcBlock10..rcBlock15
            // rcBlock5..rcBlock7...rcBlock10...rcBlock512...rcBlock15
            //if i3 > 5 then
            if i3 > GRID_MAX_BLOCKS then
               Break;
       end;
     Except on e:exception do
            begin
                 ShowMessageN( 'rcBlocks( p1[' + iCountBlocks.ToString + '] ): ' + e.Message );
            end;
     End;

     // ajustar HEIGHT-CHILDs
     try
       iColsChilds := 0;
       for f := 1 to iCountBlocks do
       begin
            oObj := oBlocks[ f ];
            if ( oObj.Enabled ) then
            begin
                 //7.0.0.0 col-offset( future )
                 if Pos( 'cols-offset:', oObj.Hint ) > 0 then
                    iOffSet_Border := StrToIntDef( rc_GetHintAttr( 'cols-offset:', oObj.Hint ), iOffSet )
                 else
                    iOffSet_Border := iOffSet;

                  //7.0.0.0 GRID_COLS
                  iGridCols        := StrToIntDef( rc_GetHintAttr( 'cols-grid:', oObj.Hint ), GRID_COLS );
                  iGridColsQuarter := iGridCols div 4;
                  iNumBlocks       := iGridCols;
                  // default RC GRID values
                  iColsXS := iGridCols; //12;
                  iColsSM := iGridCols; //12;
                  iColsMD := iGridColsQuarter; //3
                  iColsLG := iGridColsQuarter; //3
                  iColsXL := iGridColsQuarter; //3
                  iCols4K := iGridColsQuarter; //3
                  iCols8K := iGridColsQuarter; //3
                  //7.0.0.0 GRID_COLS end

                 // HEIGHT responsivo: sum childs height
                 // Set DEAULT HEIGHT
                 // [[hr:sm-1 md-2   lg-3    xl-4]]
                 iPos  := Pos( 'hr-childs:' , oObj.Hint );
                 if ( iPos > 0 ) and ( oObj.Height > 0 ) then
                 begin
                    x := 0;
                    y := 0;
                    fHeight := 2;
                    //7.0.0.0 col-offset( future )
                    //n := iOffSet_Border; //contar os offsets de cada bloco
                    iBlocksChilds := 0;
                    SetLength( oBlocksChilds , 200 );
                    SetLength( oBlocksChildsNum , 200 );
                    for o := 0 to TUniControl( oObj ).ControlCount - 1 do
                    begin
                         oObj_HRCHILD := TUniContainerPanel( TUniControl( oObj ).Controls[ o ] );
                         //7.0.0.0
                         //if ( Pos( 'rcblock', lowercase( oObj_HRCHILD.Name ) ) > 0 ) and ( oObj_HRCHILD.Enabled ) then
                         if ( Copy( lowercase( oObj_HRCHILD.Name ), 1, 7 ) = 'rcblock' ) and ( oObj_HRCHILD.Enabled ) then
                         begin
                              Inc( iBlocksChilds );
                              oBlocksChildsNum [ iBlocksChilds ] := StrToInt( ReturnNumbers( TUniContainerPanel( oObj_HRCHILD ).Name ) );
                         end;
                    end;
                    SetLength( oBlocksChilds , iBlocksChilds + 1 );
                    SetLength( oBlocksChildsNum , iBlocksChilds + 1 );
                    rc_QuickSort( oBlocksChildsNum, 1, iBlocksChilds  );
                    for o := 1 to iBlocksChilds do
                    begin
                         oBlocksChilds [ o ] := TUniContainerPanel( rc_FindControl( 'rcBlock' + oBlocksChildsNum [ o ].ToString , pFrame ) );
                    end;

                    for o := 1 to iBlocksChilds do
                    begin
                         oObj_HRCHILD := oBlocksChilds [ o ];
                         //7.0.0.0 col-offset( future )
                         if Pos( 'cols-offset:', oObj_HRCHILD.Hint ) > 0 then
                            iOffSet_Border := StrToIntDef( rc_GetHintAttr( 'cols-offset:', oObj_HRCHILD.Hint ), iOffSet )
                         else
                            iOffSet_Border := iOffSet;

                         //7.0.0.0 GRID_COLS
                         iGridCols        := StrToIntDef( rc_GetHintAttr( 'cols-grid:', oObj_HRCHILD.Hint ), GRID_COLS );
                         iGridColsQuarter := iGridCols div 4;
                         iNumBlocks       := iGridCols;
                         // default RC GRID values
                         iColsXS := iGridCols; //12;
                         iColsSM := iGridCols; //12;
                         iColsMD := iGridColsQuarter; //3
                         iColsLG := iGridColsQuarter; //3
                         iColsXL := iGridColsQuarter; //3
                         iCols4K := iGridColsQuarter; //3
                         iCols8K := iGridColsQuarter; //3
                         //7.0.0.0 GRID_COLS end

                         //7.0.0.0 col-offset( future )
                         if o = 1 then
                            n := iOffSet_Border; //contar os offsets de cada bloco
                         //7.0.0.0
                         if ( Copy( lowercase( oObj_HRCHILD.Name ), 1, 7 ) = 'rcblock' ) then
                         begin
                            y := oObj_HRCHILD.Height;
                            //7.0.0.0
                            if not oObj_HRCHILD.Enabled then
                            begin
                               cTemp := rc_GetHintAttr( 'hide:', oObj_HRCHILD.Hint ) ;
                               if cTemp <> '' then
                               begin
                                  if ( bMobileScreenPortrait ) and ( Pos( 'mobile-v' , cTemp ) > 0 ) then
                                     y := 0
                                  else
                                  if ( bMobileScreenLandScape ) and ( Pos( 'mobile-h' , cTemp ) > 0 ) then
                                     y := 0
                                  else
                                  if ( bMobileScreen ) and ( Pos( 'mobile' , cTemp ) > 0 ) then
                                     y := 0
                                  else
                                  if ( not bMobileScreen ) and ( Pos( 'desktop' , cTemp ) > 0 ) then
                                     y := 0;
                               end;
                            end;
                            if ( y > 0 ) then
                            begin
                               iColsChilds := iColsChilds + oObj_HRCHILD.tag;
                               if ( ( iColsChilds >= iNumBlocks ) or ( o = iBlocksChilds ) ) then//7.0.0.0 12
                               begin
                                  n := n + iOffSet_Border ;

                                  if ( bMobileScreenPortrait ) and
                                     ( ( Pos( 'noborder-all:mobile-v' , oObj_HRCHILD.Hint ) > 0 ) or ( Pos( 'noborder-all|' , oObj_HRCHILD.Hint ) > 0 ) ) then
                                     n := n - iOffSet_Border
                                  else
                                  if ( bMobileScreenLandScape ) and
                                     ( ( Pos( 'noborder-all:mobile-h' , oObj_HRCHILD.Hint ) > 0 ) or ( Pos( 'noborder-all|' , oObj_HRCHILD.Hint ) > 0 ) ) then
                                     n := n - iOffSet_Border
                                  else
                                  if ( bMobileScreen ) and
                                     ( ( Pos( 'noborder-all:mobile' , oObj_HRCHILD.Hint ) > 0 ) or ( Pos( 'noborder-all|' , oObj_HRCHILD.Hint ) > 0 ) ) then
                                     n := n - iOffSet_Border
                                  else
                                  if ( not bMobileScreen ) and
                                     ( ( Pos( 'noborder-all:desktop' , oObj_HRCHILD.Hint ) > 0 ) or ( Pos( 'noborder-all|' , oObj_HRCHILD.Hint ) > 0 ) ) then
                                     n := n - iOffSet_Border
                                  else
                                  begin
                                     if ( Pos( 'noborder-top' , oObj_HRCHILD.Hint ) > 0 ) then
                                     begin
                                        if ( bMobileScreenPortrait ) and
                                           ( ( Pos( 'noborder-top:mobile-v' , oObj_HRCHILD.Hint ) > 0 ) or ( Pos( 'noborder-top|' , oObj_HRCHILD.Hint ) > 0 ) ) then
                                           n := n - iOffSet_Border
                                        else
                                        if ( bMobileScreenLandScape ) and
                                           ( ( Pos( 'noborder-top:mobile-h' , oObj_HRCHILD.Hint ) > 0 ) or ( Pos( 'noborder-top|' , oObj_HRCHILD.Hint ) > 0 ) ) then
                                           n := n - iOffSet_Border
                                        else
                                        if ( bMobileScreen ) and
                                           ( ( Pos( 'noborder-top:mobile' , oObj_HRCHILD.Hint ) > 0 ) or ( Pos( 'noborder-top|' , oObj_HRCHILD.Hint ) > 0 ) ) then
                                           n := n - iOffSet_Border
                                        else
                                        if ( not bMobileScreen ) and
                                           ( ( Pos( 'noborder-top:desktop' , oObj_HRCHILD.Hint ) > 0 ) or ( Pos( 'noborder-top|' , oObj_HRCHILD.Hint ) > 0 ) ) then
                                           n := n - iOffSet_Border;
                                     end
                                     else
                                     if ( Pos( 'noborder-bottom' , oObj_HRCHILD.Hint ) > 0 ) then
                                     begin
                                        if ( bMobileScreenPortrait ) and
                                           ( ( Pos( 'noborder-bottom:mobile-v' , oObj_HRCHILD.Hint ) > 0 ) or ( Pos( 'noborder-bottom|' , oObj_HRCHILD.Hint ) > 0 ) ) then
                                           n := n - iOffSet_Border
                                        else
                                        if ( bMobileScreenLandScape ) and
                                           ( ( Pos( 'noborder-bottom:mobile-h' , oObj_HRCHILD.Hint ) > 0 ) or ( Pos( 'noborder-bottom|' , oObj_HRCHILD.Hint ) > 0 ) ) then
                                           n := n - iOffSet_Border
                                        else
                                        if ( bMobileScreen ) and
                                           ( ( Pos( 'noborder-bottom:mobile' , oObj_HRCHILD.Hint ) > 0 ) or ( Pos( 'noborder-bottom|' , oObj_HRCHILD.Hint ) > 0 ) ) then
                                           n := n - iOffSet_Border
                                        else
                                        if ( not bMobileScreen ) and
                                           ( ( Pos( 'noborder-bottom:desktop' , oObj_HRCHILD.Hint ) > 0 ) or ( Pos( 'noborder-bottom|' , oObj_HRCHILD.Hint ) > 0 ) ) then
                                           n := n - iOffSet_Border;
                                     end;
                                  end;

                                  iColsChilds := 0;
                                  x := x + y;
                                  fHeight := 1;
                               end;
                            end;
                         end;
                    end;
                    //[PT] se não houver nenhum componente dentro do bloco, x recebe o proprio height
                    //[EN] if there is no component inside the block, x receives its own height
                    if x = 0 then
                       x := oObj.Height;

                    if x > 0 then
                    begin
                         //7.0.0.0 noborder hr-childs
                         //if bNoBorder then
                         begin
                            if ( Pos( ' fit' , oObj.Hint ) > 0 ) then
                               n := n - iOffSet_Border ;
                         end;
                         x := x + n  ;
                         n := 0;
                         cTemp := rc_GetHintAttr( 'hr-sumchild:', oObj.Hint ) ;
                         n := StrToIntDeF( Trim( Copy( cTemp, 1, Pos( '=', cTemp ) - 1 ) ), 0 );

                         if n > 0 then
                            y := n    //140
                         else
                            y := oObj.Height; //317

                         oObj.Hint := rc_SetHintAttr( y.ToString + '=' + x.ToString , 'hr-sumchild:', oObj.Hint ) ;

                         // HEIGHT responsivo
                         // [[hr:sm-1 md-2   lg-3    xl-4]]
                         iPos  := Pos( 'hr-childs:' , oObj.Hint );
                         iPos2 := Pos( 'hr-sumchild:' , oObj.Hint );
                         if iPos > 0 then
                         begin
                            iPos2 := Pos( '|' , Copy( oObj.Hint, iPos + 3 , 100 ) );
                            if iPos2 = 0 then
                               iPos2 := Pos( ']]' , Copy( oObj.Hint, iPos + 3 , 100 ) );

                            cTemp := lowercase( Trim( Copy( oObj.Hint, iPos + 3, iPos2 ) ) );
                            cTemp := StringReplace( cTemp, '|' , '', [rfReplaceAll] );
                            cTemp := Trim( StringReplace( cTemp, ']' , '', [rfReplaceAll] ) );

                            if ( StrToIntDef( cTemp, 0 ) = 0 ) and
                               ( Pos( 'xs-', oObj.Hint ) = 0 ) and
                               ( Pos( 'sm-', oObj.Hint ) = 0 ) and
                               ( Pos( 'md-', oObj.Hint ) = 0 ) and
                               ( Pos( 'lg-', oObj.Hint ) = 0 ) and
                               ( Pos( 'xxl-', oObj.Hint ) = 0 ) and // 7.0.0.0 gridsystem
                               ( Pos( 'xl-', oObj.Hint ) = 0 ) and
                               ( Pos( '4k-', oObj.Hint ) = 0 ) and
                               ( Pos( '8k-', oObj.Hint ) = 0 ) then
                            begin
                                 //if Pos( '[[' , oObj.Hint ) = 0 then
                                 //   oObj.Hint := '[[cols:xs-12 sm-6 md-3 lg-3 xl-3 4k-3 8k-3]]'
                                 //else
                                 //   oObj.Hint := Copy( Trim( oObj.Hint ) , 1, Length( oObj.Hint ) - 2 ) + ' | cols:xs-12 sm-6 md-3 lg-3 xl-3 4k-3 8k-3]]';
                            end
                            else
                            if ( StrToIntDef( cTemp, 0 ) > 0 ) then
                            begin
                                 oObj.Hint := StringReplace( oObj.Hint, 'hr-childs:' + cTemp , 'hr-childs:xs-' + cTemp + ' sm-' + cTemp + ' md-' + cTemp + ' lg-' + cTemp + ' xl-' + cTemp + ' xxl-' + cTemp + ' 4k-' + cTemp + ' 8k-' + cTemp , [rfReplaceAll] ); //7.0.0.0 gridsystem
                            end;

                            iPos  := Pos( 'hr-childs:' , oObj.Hint );
                            iPos2 := Pos( '|' , Copy( oObj.Hint, iPos + 3 , 100 ) );
                            if iPos2 = 0 then
                               iPos2 := Pos( ']]' , Copy( oObj.Hint, iPos + 3 , 100 ) );

                            cTemp := lowercase( Trim( Copy( oObj.Hint, iPos + 3, iPos2 ) ) );
                            cTemp := StringReplace( cTemp, '|' , '', [rfReplaceAll] );
                            cTemp := StringReplace( cTemp, ']' , '', [rfReplaceAll] );

                            If Pos( 'expanded-' , oObj.Hint ) > 0 then
                            begin
                                //if Pos( 'off-', cTemp ) > 0 then
                                begin
                                   cTemp := rc_GetHintAttr( 'expanded-', oObj.Hint, true );
                                   x := StrToIntDef ( cTemp, 0 );
                                   TUniControl(oObj).Height := x;
                                   rc_AddCssClass( TUniControl(oObj), 'rc-scrollbar-hidden' );
                                end;
                            end
                            else
                            begin
                               rc_RemoveCssClass( TUniControl(oObj), 'rc-scrollbar-hidden' );
                               // md vai ser o padrão para os demais( caso não sejam definidos )
                               if ( Pos( 'md-exp', cTemp ) > 0 ) then
                               begin
                                  TUniControl(oObj).Height := x + iHRChildPlusValid { removed...  };
                               end
                               else
                                  TUniControl(oObj).Height := y;
                               //7.0.0.0 gridsystem
                               if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 200 ) or
                                  ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_XS ) then
                               begin
                                   if ( Pos( 'xs-exp', cTemp ) > 0 ) then
                                      TUniControl(oObj).Height := x
                                   else
                                      TUniControl(oObj).Height := y;
                               end
                               else
                               if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 400 ) or
                                  ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_SM ) then
                               begin
                                  if ( Pos( 'sm-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := x
                                  else
                                     TUniControl(oObj).Height := y;
                               end
                               else
                               if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 768 ) or
                                  ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_MD ) then
                               begin
                                  //if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 200 ) then
                                  begin
                                  //[PT] mesmo que esteja md-fix mas se estiver acessando fisicamente de um MOBILE vai expandir...
                                  //[EN] even if it is md-fix but if you are physically accessing it from a MOBILE it will expand...
                                  if bMobileScreen then
                                     TUniControl(oObj).Height := x
                                  else
                                  if ( Pos( 'md-exp', cTemp ) > 0 )  then
                                     TUniControl(oObj).Height := x + iHRChildPlusValid { v.  }
                                  else
                                     TUniControl(oObj).Height := y;
                                  end;
                               end
                               else
                               if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 1366 ) or
                                  ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_LG ) then
                               begin
                                  //[PT] mesmo que esteja md-fix mas se estiver acessando fisicamente de um MOBILE vai expandir...
                                  //[EN] even if it is md-fix but if you are physically accessing it from a MOBILE it will expand...
                                  if bMobileScreen then
                                     TUniControl(oObj).Height := x
                                  else
                                  if ( Pos( 'lg-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := x
                                  else
                                  if ( Pos( 'md-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := x + iHRChildPlusValid { v.  }
                                  else
                                     TUniControl(oObj).Height := y;
                               end
                               else
                               if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 1920 ) or
                                  ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_XL ) then
                               begin
                                  //[PT] mesmo que esteja md-fix mas se estiver acessando fisicamente de um MOBILE vai expandir...
                                  //[EN] even if it is md-fix but if you are physically accessing it from a MOBILE it will expand...
                                  if bMobileScreen then
                                     TUniControl(oObj).Height := x
                                  else
                                  if ( Pos( 'xl-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, 'xl' )
                                  else
                                  if ( Pos( 'md-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := x + iHRChildPlusValid { v.  }
                                  else
                                     TUniControl(oObj).Height := y;
                               end
                               else
                               if ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_XS ) then
                               if ( iAreaAvailableH < GRID_BS_XXL ) then
                               begin
                                  //[PT] mesmo que esteja md-fix mas se estiver acessando fisicamente de um MOBILE vai expandir...
                                  //[EN] even if it is md-fix but if you are physically accessing it from a MOBILE it will expand...
                                  if bMobileScreen then
                                     TUniControl(oObj).Height := x
                                  else
                                  if ( Pos( 'xxl-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, 'xxl' )
                                  else
                                  if ( Pos( 'xl-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, 'xl' )
                                  else
                                  if ( Pos( 'md-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := x + iHRChildPlusValid { v.  }
                                  else
                                     TUniControl(oObj).Height := y;
                               end
                               else
                               if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 3000 ) or
                                  ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_4K ) then
                               begin
                                  //[PT] mesmo que esteja md-fix mas se estiver acessando fisicamente de um MOBILE vai expandir...
                                  //[EN] even if it is md-fix but if you are physically accessing it from a MOBILE it will expand...
                                  if bMobileScreen then
                                     TUniControl(oObj).Height := x
                                  else
                                  if ( Pos( '4k-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, '4k' )
                                  else
                                  if ( Pos( 'md-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := x + iHRChildPlusValid { v.  }
                                  else
                                     TUniControl(oObj).Height := y;
                               end
                               else
                               if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 7000 ) or
                                  ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_8K ) then
                               begin
                                  if ( Pos( '8k-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, '8k' )
                                  else
                                  if ( Pos( 'md-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := x + iHRChildPlusValid { v.  }
                                  else
                                     TUniControl(oObj).Height := y;
                               end;
                            end;
                            rc_HRReplicate( pFrame, oObj, oObj.Hint, bMobileScreen, bMobileScreenPortrait, bMobileScreenLandScape, bDesktop );
                            oObjTemp := nil;
                         end;
                    end;
                 end;
            end;
       end;

       // ajustar WIDTH..etc
       iTabLastPos := 1;
       i3 := 1;   // intervalo entre sequenciais de blocos para permitir futuras inserções | interval between block sequences to allow future insertions
       i4 := 0;   // contador de colunas | column counter
       i5 := 0;   // somar width dos blocos exibidos | add width of displayed blocks
       i6 := 0;   // contador de blocos por linha // 7.0.0.0 noborderall left right
       iPos := 0;
       iFirstPos := 0;
       iHeight   :=0 ;
       //7.0.0.0 bigger height
       iBiggerHeight := 0;
       for f := 1 to iCountBlocks do
       begin
            oObj  := oBlocks[ f ];

            if f > 1 then
            begin
               oObjPrior := oBlocks[ f - 1 ];
            end
            else
               oObjPrior := nil;

            if f < iCountBlocks then
            begin
               oObjNext := oBlocks[ f + 1 ];
            end
            else
               oObjNext := nil;

           if oObj <> nil then
           begin
               bNoBorderAll2    := false;
               bNoBorderAll3    := false;
               bNoBorderLeft2   := false;
               bNoBorderTop2    := false;
               bNoBorderBottom2 := false;
               bNoBorderRight2  := false;
               bNoBorderLeft3   := false;
               bNoBorderTop3    := false;
               bNoBorderBottom3 := false;
               bNoBorderRight3  := false;
               cHintNext        := '';
               iNextObjWidth    := 0;
               cHintPrior       := '';
               iPriorObjWidth   := 0;
               if oObj.Enabled then
               begin
                    // parent do objeto atual | parent of the current object
                    oObjTemp2 := TUniControl( oObj.GetParentComponent );
                    // another parent object ?
                    //7.0.0.0 col-offset( future )
                    if Pos( 'cols-offset:', oObj.Hint ) > 0 then
                       iOffSet_Border := StrToIntDef( rc_GetHintAttr( 'cols-offset:', oObj.Hint ), iOffSet )
                    else
                       iOffSet_Border := iOffSet;

                    //7.0.0.0 GRID_COLS
                    iGridCols        := StrToIntDef( rc_GetHintAttr( 'cols-grid:', oObj.Hint ), GRID_COLS );
                    iGridColsQuarter := iGridCols div 4;
                    iNumBlocks       := iGridCols;
                    // default RC GRID values
                    iColsXS := iGridCols; //12;
                    iColsSM := iGridCols; //12;
                    iColsMD := iGridColsQuarter; //3
                    iColsLG := iGridColsQuarter; //3
                    iColsXL := iGridColsQuarter; //3
                    iCols4K := iGridColsQuarter; //3
                    iCols8K := iGridColsQuarter; //3
                    //7.0.0.0 GRID_COLS end

                    if oObjTemp <> nil then
                    begin
                       //7.0.0.0 col-offset( future )
                       if Pos( 'cols-offset:', oObj.Hint ) > 0 then
                          iOffSet_Border := StrToIntDef( rc_GetHintAttr( 'cols-offset:', oObj.Hint ), iOffSet )
                       else
                          iOffSet_Border := iOffSet;

                       //7.0.0.0 GRID_COLS
                       iGridCols        := StrToIntDef( rc_GetHintAttr( 'cols-grid:', oObj.Hint ), GRID_COLS );
                       iGridColsQuarter := iGridCols div 4;
                       iNumBlocks       := iGridCols;
                       // default RC GRID values
                       iColsXS := iGridCols; //12;
                       iColsSM := iGridCols; //12;
                       iColsMD := iGridColsQuarter; //3
                       iColsLG := iGridColsQuarter; //3
                       iColsXL := iGridColsQuarter; //3
                       iCols4K := iGridColsQuarter; //3
                       iCols8K := iGridColsQuarter; //3
                       //7.0.0.0 GRID_COLS end

                       if ( oObjTemp.Name <> oObjTemp2.Name ) then
                       begin
                          // se o obj anterior existir... verificar se está dentro de outro parent
                          (*
                          block7  	    parent = scroll		left 0

                             block8  	parent = block7		left 0
                             block9  	parent = block7		left 0 se for comeco de linha
                             block10  	parent = block7

                          block13  	  parent = scroll		left ult. block mesmo parent
                                                         left 0 se for comeco de linha
                          *)
                          oObjTemp3 := nil;
                          if oObjPrior <> nil then
                             for o := f-1 downto 1 do
                             begin
                                  oObjTemp3 := TUniControl( oBlocks[ o ].GetParentComponent );

                                  if ( oObjTemp3 = oObjTemp2 ) then
                                  begin
                                     oObjTemp2 := oObjTemp3;
                                     oObjTemp  := oObjTemp2;
                                     oObjTemp3 := oBlocks[ o ] ; // block13 é o atual...e achou o block7 de mesmo parent
                                     oObjPrior := oBlocks[ o ];
                                     iPos := oBlocksProps[ o, 1 ];
                                     i    := oBlocksProps[ o, 2 ];
                                     i3   := oBlocksProps[ o, 3 ];
                                     i4   := oBlocksProps[ o, 4 ];
                                     i5   := oBlocksProps[ o, 5 ];

                                     Break;
                                  end
                                  else
                                      oObjTemp3 := nil;
                             end;

                          if oObjTemp3 = nil then
                          begin
                             i3 := 1;
                             i4 := 0;
                             i5 := 0;
                             iPos := 0;
                             iFirstPos := 0;
                             oObjTemp := oObjTemp2;
                          end;
                       end;
                    end
                    else
                       oObjTemp := oObjTemp2; // percorrer todos blocos do mesmo "parent" atual | traverse all blocks of the same current "parent"

                    cHint           := oObj.Hint;
                    // 6.0.0.0
                    bNoBorderAll    := ( ( Pos( 'noborder-all'           , cHint ) > 0 ) and ( Pos( 'noborder-all:'   , cHint ) = 0 ) ) or
                                       ( ( Pos( 'noborder-all:mobile'    , cHint ) > 0 ) and ( bMobileScreen ) ) or
                                       ( ( Pos( 'noborder-all:desktop'   , cHint ) > 0 ) and ( not bMobileScreen ) ) or
                                       ( ( oObj.Height = 0 ) and ( not oObj.Visible ) ) ;
                    //6.0.0.2
                    cNoBorderLeft := rc_GetHintAttr( 'noborder-left:', cHint );
                    bNoBorderLeft   := ( bNoBorderAll ) or
                                       ( ( ( Pos( 'noborder-left'          , cHint ) > 0 ) and ( Pos( 'noborder-left:'  , cHint ) = 0 ) ) or
                                         ( ( Pos( 'noborder-left:mobile'   , cHint ) > 0 ) and ( bMobileScreen ) ) or
                                         ( ( Pos( 'noborder-left:desktop'   , cHint ) > 0 ) and ( not bMobileScreen ) ) );
                    if bMobileScreen then
                    begin
                       if ( ( bMobileScreenLandScape ) and ( Pos( 'mobile-v' , cNoBorderLeft ) > 0 ) ) then
                          bNoBorderLeft := false;
                       if ( ( bMobileScreenPortrait ) and ( Pos( 'mobile-h' , cNoBorderLeft ) > 0 ) ) then
                          bNoBorderLeft := false;
                       if not bNoBorderLeft then
                       begin
                          bNoBorderLeft := ( ( bMobileScreenLandScape ) and ( Pos( 'mobile-h' , cNoBorderLeft ) > 0 ) );
                          if not bNoBorderLeft then
                             bNoBorderLeft := ( ( bMobileScreenPortrait ) and ( Pos( 'mobile-v' , cNoBorderLeft ) > 0 ) );
                       end;
                    end;

                    //6.0.0.2
                    cNoBorderRight := rc_GetHintAttr( 'noborder-right:', cHint );
                    bNoBorderRight  := ( bNoBorderAll ) or
                                       ( ( ( Pos( 'noborder-right'         , cHint ) > 0 ) and ( Pos( 'noborder-right:' , cHint ) = 0 ) ) or
                                         ( ( Pos( 'noborder-right:mobile'  , cHint ) > 0 ) and ( bMobileScreen ) ) or
                                         ( ( Pos( 'noborder-right:desktop'   , cHint ) > 0 ) and ( not bMobileScreen ) ) );
                    if bMobileScreen then
                    begin
                       if ( ( bMobileScreenLandScape ) and ( Pos( 'mobile-v' , cNoBorderRight ) > 0 ) ) then
                          bNoBorderRight := false;
                       if ( ( bMobileScreenPortrait ) and ( Pos( 'mobile-h' , cNoBorderRight ) > 0 ) ) then
                          bNoBorderRight := false;
                       if not bNoBorderRight then
                       begin
                          bNoBorderRight := ( ( bMobileScreenLandScape ) and ( Pos( 'mobile-h' , cNoBorderRight ) > 0 ) );
                          if not bNoBorderRight then
                             bNoBorderRight := ( ( bMobileScreenPortrait ) and ( Pos( 'mobile-v' , cNoBorderRight ) > 0 ) );
                       end;
                    end;
                    //6.0.0.2
                    cNoBorderTop := rc_GetHintAttr( 'noborder-top:', cHint );
                    bNoBorderTop    := ( bNoBorderAll ) or
                                       ( ( ( Pos( 'noborder-top'           , cHint ) > 0 ) and ( Pos( 'noborder-top:'   , cHint ) = 0 ) ) or
                                         ( ( Pos( 'noborder-top:mobile'    , cHint ) > 0 ) and ( bMobileScreen ) ) or
                                         ( ( Pos( 'noborder-top:desktop'   , cHint ) > 0 ) and ( not bMobileScreen ) ) );
                    if bMobileScreen then
                    begin
                       if ( ( bMobileScreenLandScape ) and ( Pos( 'mobile-v' , cNoBorderTop ) > 0 ) ) then
                          bNoBorderTop := false;
                       if ( ( bMobileScreenPortrait ) and ( Pos( 'mobile-h' , cNoBorderTop ) > 0 ) ) then
                          bNoBorderTop := false;
                       if not bNoBorderTop then
                       begin
                          bNoBorderTop := ( ( bMobileScreenLandScape ) and ( Pos( 'mobile-h' , cNoBorderTop ) > 0 ) );
                          if not bNoBorderTop then
                             bNoBorderTop := ( ( bMobileScreenPortrait ) and ( Pos( 'mobile-v' , cNoBorderTop ) > 0 ) );
                       end;
                    end;
                    //6.0.0.2
                    cNoBorderBottom := rc_GetHintAttr( 'noborder-bottom:', cHint );
                    bNoBorderBottom := ( bNoBorderAll ) or
                                       ( ( ( Pos( 'noborder-bottom'        , cHint ) > 0 ) and ( Pos( 'noborder-bottom:', cHint ) = 0 ) ) or
                                         ( ( Pos( 'noborder-bottom:mobile' , cHint ) > 0 ) and ( bMobileScreen ) ) or
                                         ( ( Pos( 'noborder-bottom:desktop'   , cHint ) > 0 ) and ( not bMobileScreen ) ) );
                    if bMobileScreen then
                    begin
                       if ( ( bMobileScreenLandScape ) and ( Pos( 'mobile-v' , cNoBorderBottom ) > 0 ) ) then
                          bNoBorderBottom := false;
                       if ( ( bMobileScreenPortrait ) and ( Pos( 'mobile-h' , cNoBorderBottom ) > 0 ) ) then
                          bNoBorderBottom := false;
                       if not bNoBorderBottom then
                       begin
                          bNoBorderBottom := ( ( bMobileScreenLandScape ) and ( Pos( 'mobile-h' , cNoBorderBottom ) > 0 ) );
                          if not bNoBorderBottom then
                             bNoBorderBottom := ( ( bMobileScreenPortrait ) and ( Pos( 'mobile-v' , cNoBorderBottom ) > 0 ) );
                       end;
                    end;

//                    //7.0.0.0 GRID_COLS
//                    iGridCols        := StrToIntDef( rc_GetHintAttr( 'cols-grid:', oObj.Hint ), GRID_COLS );
//                    iGridColsQuarter := iGridCols div 4;
//                    iNumBlocks       := iGridCols;
//                    // default RC GRID values
//                    iColsXS := iGridCols; //12;
//                    iColsSM := iGridCols; //12;
//                    iColsMD := iGridColsQuarter; //3
//                    iColsLG := iGridColsQuarter; //3
//                    iColsXL := iGridColsQuarter; //3
//                    iCols4K := iGridColsQuarter; //3
//                    iCols8K := iGridColsQuarter; //3
//                    //7.0.0.0 GRID_COLS end

                    //7.0.0.0 last right offset a partir da segunda linha de blocos com prim. linha de blocos cols-offset:0
                    if ( iFirstPos = 0 ) or ( i4 = 0 ) or ( oObjTemp3 <> nil ) then
                    begin
                         iAreaAvailableH := oObjTemp2.Width ;                                    // Ex 960px

                         iBlockWidth   := iResponsivenessLimitH;
                         iBlockHeight  := iResponsivenessLimitV;
                         iBlockPercent := ( 1 / iNumBlocks ) ;                                   // Ex 0.0833333333333333

                         iBlockWidth   := ( iAreaAvailableH - iOffSet_Border ) * iBlockPercent ;
                         //7.0.0.0 new
                         //iBlockWidth   := ( iAreaAvailableH ) * iBlockPercent ;                  // Ex 79.99 > 80px

                         i6 := 0; // 7.0.0.0 blocks  per line. noborderall left right
                    end;
                    //7.0.0.0 new
                    oObj.Width := Trunc ( ( iBlockWidth * oObj.tag ) - iOffSet_Border );
                    //oObj.Width := Trunc ( ( iBlockWidth * oObj.tag ) );                          // Ex 80px x 2cols = 160px

                    if oObj.Width < 0 then
                       oObj.Width := 0;

                    //7.0.0.0 new noborder-all
//                    if oObjPrior <> nil then
//                       oObj.Left := oObjPrior.Left
//                    else
//                       oObj.Left := 0;

                    iMin_mob   := 0;
                    iMin_mob_h := 0;
                    iMin_mob_v := 0; // 6.0.0.0
                    iMin       := 0;
                    iMax_mob   := 0;
                    iMax_mob_h := 0;
                    iMax_mob_v := 0; // 6.0.0.0
                    iMax       := 0;
                    iMax_h     := 0;
                    iMin_h     := 0;
                    iMaxWidthToCheckBorders := -1;
                    iMinWidthToCheckBorders := -1;
                    //7.0.0.0 BUGFIX#3
                    cTemp3 := rc_GetHintAttr( 'max-width:', oObj.Hint ) ;
                    if cTemp3 <> '' then
                    begin
                       cTemp3 := cTemp3 + '.';//rc_GetHintAttr( 'max-width:', oObj.Hint ) ;
                       cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                       if Copy( cTemp3, 1, pos( ' ' , cTemp3 )-1) <> 'default' then
                       begin
                          if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and ( bMobileScreenPortrait ) then
                          begin
                               cTemp3     := rc_GetHintAttr( 'mobile-v-', cTemp3, true ) ;
                               iMax_mob_v := StrToIntDef( cTemp3, oObj.Width );
                               //7.0.0.0 BUGFIX#3
                               if oObj.Width > iMax_mob_v then
                               begin
                                  oObj.Width := iMax_mob_v;
                                  iMaxWidthToCheckBorders := oObj.Width;
                               end;
                          end
                          else
                          if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and ( bMobileScreenLandscape ) then
                          begin
                               cTemp3     := rc_GetHintAttr( 'mobile-h-', cTemp3, true ) ;
                               iMax_mob_h := StrToIntDef( cTemp3, oObj.Width );
                               if oObj.Width > iMax_mob_h then
                               begin
                                  oObj.Width := iMax_mob_h;
                                  iMaxWidthToCheckBorders := oObj.Width;
                               end;
                          end
                          else
                          if ( Pos( 'mobile-', cTemp3 ) > 0 ) and ( bMobileScreen ) then
                          begin
                               cTemp3   := rc_GetHintAttr( 'mobile-', cTemp3, true ) ;
                               iMax_mob := StrToIntDef( cTemp3, oObj.Width );
                               if oObj.Width > iMax_mob then
                               begin
                                  oObj.Width := iMax_mob;
                                  iMaxWidthToCheckBorders := oObj.Width;
                               end;
                          end
                          else
                          //desktop
                          if ( not bMobileScreen ) then
                          begin
                             cTemp3 := cTemp3 + ' ';
                             cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                             if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                             begin
                                iMax := StrToIntDef( cTemp3, oObj.Width );
                                if oObj.Width > iMax then
                                begin
                                   oObj.Width := iMax;
                                   iMaxWidthToCheckBorders := oObj.Width;
                               end;
                             end;
                          end;
                          if iMaxWidthToCheckBorders >= 0 then
                          begin
                             oObj.Hint := rc_AddHintAttr( '|rc-maxwidth:' + iMaxWidthToCheckBorders.ToString, oObj.Hint, true );
                             oObj.Hint := rc_AddHintAttr( '|rc-minwidth:' + iMinWidthToCheckBorders.ToString, oObj.Hint, true );
                          end
                          else
                          begin
                             oObj.Hint := rc_AddHintAttr( '|rc-maxwidth:-1', oObj.Hint, true );
                             oObj.Hint := rc_AddHintAttr( '|rc-minwidth:-1', oObj.Hint, true );
                          end;
                       end;
                    end;
                    //7.0.0.0
                    iMaxWidthToCheckBorders := -1;
                    iMinWidthToCheckBorders := -1;
                    cTemp3 := rc_GetHintAttr( 'min-width:', oObj.Hint ) ;
                    if cTemp3 <> '' then
                    begin
                       cTemp3 := cTemp3 + '.';//rc_GetHintAttr( 'max-width:', oObj.Hint ) ;
                       cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                       if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and ( bMobileScreenPortrait ) then
                       begin
                            cTemp3     := rc_GetHintAttr( 'mobile-v-', cTemp3, true ) ;
                            iMin_mob_v := StrToIntDef( cTemp3, oObj.Width );
                            if oObj.Width < iMin_mob_v then
                            begin
                               oObj.Width := iMin_mob_v;
                               iMinWidthToCheckBorders := oObj.Width;
                            end;
                       end
                       else
                       if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and ( bMobileScreenLandscape ) then
                       begin
                            cTemp3     := rc_GetHintAttr( 'mobile-h-', cTemp3, true ) ;
                            iMin_mob_h := StrToIntDef( cTemp3, oObj.Width );
                            if oObj.Width < iMin_mob_h then
                            begin
                               oObj.Width := iMin_mob_h;
                               iMinWidthToCheckBorders := oObj.Width;
                            end;
                       end
                       else
                       if ( Pos( 'mobile-', cTemp3 ) > 0 ) and ( bMobileScreen ) then
                       begin
                            cTemp3   := rc_GetHintAttr( 'mobile-', cTemp3, true ) ;
                            iMin_mob := StrToIntDef( cTemp3, oObj.Width );
                            if oObj.Width < iMin_mob then
                            begin
                               oObj.Width := iMin_mob;
                               iMinWidthToCheckBorders := oObj.Width;
                            end;
                       end
                       else
                       //desktop
                       if ( not bMobileScreen ) then
                       begin
                          cTemp3 := cTemp3 + ' ';
                          cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                          if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                          begin
                             iMin  := StrToIntDef( cTemp3, oObj.Width );
                             if oObj.Width < iMin then
                             begin
                                oObj.Width := iMin;
                               iMinWidthToCheckBorders := oObj.Width;
                             end;
                          end;
                       end;
                       if iMinWidthToCheckBorders >= 0 then
                       begin
                          oObj.Hint := rc_AddHintAttr( '|rc-minwidth:' + iMinWidthToCheckBorders.ToString, oObj.Hint, true );
                       end
                       else
                       begin
                          oObj.Hint := rc_AddHintAttr( '|rc-minwidth:-1', oObj.Hint, true );
                       end;
                    end;
                    iMaxWidthToCheckBorders := -1;
                    iMinWidthToCheckBorders := -1;
                    cTemp3 := rc_GetHintAttr( 'width:', oObj.Hint ) ;
                    if cTemp3 <> '' then
                    begin
                       cTemp3 := cTemp3 + '.';//rc_GetHintAttr( 'max-width:', oObj.Hint ) ;
                       cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                       if Copy( cTemp3, 1, pos( ' ' , cTemp3 )-1) <> 'default' then
                       begin
                         if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and ( bMobileScreenPortrait ) then
                         begin
                              cTemp3     := rc_GetHintAttr( 'mobile-v-', cTemp3, true ) ;
                              iMax_mob_v := StrToIntDef( cTemp3, oObj.Width );
                              oObj.Width := iMax_mob_v;
                              iMaxWidthToCheckBorders := oObj.Width;
                              iMinWidthToCheckBorders := oObj.Width;
                         end
                         else
                         if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and ( bMobileScreenLandscape ) then
                         begin
                              cTemp3     := rc_GetHintAttr( 'mobile-h-', cTemp3, true ) ;
                              iMax_mob_h := StrToIntDef( cTemp3, oObj.Width );
                              oObj.Width := iMax_mob_h;
                              iMaxWidthToCheckBorders := oObj.Width;
                              iMinWidthToCheckBorders := oObj.Width;
                         end
                         else
                         if ( Pos( 'mobile-', cTemp3 ) > 0 ) and ( bMobileScreen ) then
                         begin
                              cTemp3     := rc_GetHintAttr( 'mobile-', cTemp3, true ) ;
                              iMax_mob   := StrToIntDef( cTemp3, oObj.Width );
                              oObj.Width := iMax_mob;
                              iMaxWidthToCheckBorders := oObj.Width;
                              iMinWidthToCheckBorders := oObj.Width;
                         end
                         else
                         //desktop
                         if ( not bMobileScreen ) then
                         begin
                            cTemp3 := cTemp3 + ' ';
                            cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                            if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                            begin
                               iMax  := StrToIntDef( cTemp3, oObj.Width );
                               oObj.Width := iMax;
                              iMaxWidthToCheckBorders := oObj.Width;
                              iMinWidthToCheckBorders := oObj.Width;
                            end;
                         end;
                         if iMaxWidthToCheckBorders >= 0 then
                         begin
                            oObj.Hint := rc_AddHintAttr( '|rc-maxwidth:' + iMaxWidthToCheckBorders.ToString, oObj.Hint, true );
                            oObj.Hint := rc_AddHintAttr( '|rc-minwidth:' + iMinWidthToCheckBorders.ToString, oObj.Hint, true );
                         end
                         else
                         begin
                            oObj.Hint := rc_AddHintAttr( '|rc-maxwidth:-1', oObj.Hint, true );
                            oObj.Hint := rc_AddHintAttr( '|rc-minwidth:-1', oObj.Hint, true );
                         end;
                       end;
                    end;

                    cTemp3 := rc_GetHintAttr( 'hide:', oObj.Hint ) ;
                    if ( cTemp3 <> '' ) and ( not oObj.Enabled ) then
                    begin
                       if rc_GetHintAttr( 'hidew:', oObj.Hint ) = '' then
                          oObj.Hint := rc_SetHintAttr( oObj.Height.ToString , 'hidew:', oObj.Hint );

                       if ( cTemp3 = 'mobile-v' ) and
                          ( bMobileScreenPortrait ) then
                       begin
                            oObj.Width := 0;
                       end
                       else
                       if ( cTemp3 = 'mobile-h' ) and
                          ( bMobileScreenLandscape ) then
                       begin
                            oObj.Width := 0;
                       end
                       else
                       if ( cTemp3 = 'mobile' ) and ( bMobileScreen ) then
                       begin
                            oObj.Width := 0;
                       end
                       else
                       if ( cTemp3 = 'desktop' ) and ( not bMobileScreen ) then
                       begin
                            oObj.Width := 0;
                       end
                       else
                       begin
                            oObj.Width := StrToIntdef( rc_GetHintAttr( 'hidew:', oObj.Hint ) , 0 );
                       end;
                    end;

                    iNextObjWidth := 0;
                    oObjTemp4 := nil;
                    oObjNext  := nil;
                    for o := f+1 to iCountBlocks do
                    begin
                         oObjTemp4 := TUniControl( oBlocks[ o ].GetParentComponent );

                         if ( oObjTemp4 = oObjTemp2 ) then
                         begin
                            oObjNext := oBlocks[ o ];
                            Break;
                         end
                         else
                            oObjTemp4 := nil;
                    end;

                    if oObjNext <> nil then
                    begin
                       cHintNext        := oObjNext.Hint;
                       //7.0.0.0 BUGFIX#1
                       bNoBorderAll3    := ( ( Pos( 'noborder-all'           , cHintNext ) > 0 ) and ( Pos( 'noborder-all:'   , cHintNext ) = 0 ) ) or
                                           ( ( Pos( 'noborder-all:mobile'    , cHintNext ) > 0 ) and ( bMobileScreen ) ) or
                                           ( ( Pos( 'noborder-all:desktop'   , cHintNext ) > 0 ) and ( not bMobileScreen ) );
                       bNoBorderLeft3   := ( bNoBorderAll3 ) or
                                           ( ( ( Pos( 'noborder-left'          , cHintNext ) > 0 ) and ( Pos( 'noborder-left:'  , cHintNext ) = 0 ) ) or
                                             ( ( Pos( 'noborder-left:mobile'   , cHintNext ) > 0 ) and ( bMobileScreen ) ) or
                                             ( ( Pos( 'noborder-left:desktop'  , cHintNext ) > 0 ) and ( not bMobileScreen ) ) );
                       bNoBorderRight3  := ( bNoBorderAll3 ) or
                                           ( ( ( Pos( 'noborder-right'         , cHintNext ) > 0 ) and ( Pos( 'noborder-right:' , cHintNext ) = 0 ) ) or
                                             ( ( Pos( 'noborder-right:mobile'  , cHintNext ) > 0 ) and ( bMobileScreen ) ) or
                                             ( ( Pos( 'noborder-right:desktop' , cHintNext ) > 0 ) and ( not bMobileScreen ) ) );
                       bNoBorderTop3    := ( bNoBorderAll3 ) or
                                           ( ( ( Pos( 'noborder-top'           , cHintNext ) > 0 ) and ( Pos( 'noborder-top:'   , cHintNext ) = 0 ) ) or
                                             ( ( Pos( 'noborder-top:mobile'    , cHintNext ) > 0 ) and ( bMobileScreen ) ) or
                                             ( ( Pos( 'noborder-top:desktop'   , cHintNext ) > 0 ) and ( not bMobileScreen ) ) );
                       bNoBorderBottom3 := ( bNoBorderAll3 ) or
                                           ( ( ( Pos( 'noborder-bottom'        , cHintNext ) > 0 ) and ( Pos( 'noborder-bottom:', cHintNext ) = 0 ) ) or
                                             ( ( Pos( 'noborder-bottom:mobile' , cHintNext ) > 0 ) and ( bMobileScreen ) ) or
                                             ( ( Pos( 'noborder-bottom:desktop', cHintNext ) > 0 ) and ( not bMobileScreen ) ) );

                       //7.0.0.0 right
                       //7.0.0.0 new
                       // nao é o prox. obj q aumenta o width é o obj que tem o noborder-right
                       //oObjNext.Width := Trunc( ( iBlockWidth * oObjNext.tag ) - IfThen( bNoBorderRight3, 0, iOffSet_Border ) );
                       oObjNext.Width := Trunc( ( iBlockWidth * oObjNext.tag ) ); // Ex 80px x 2cols = 160px

                       iNextObjWidth  := oObjNext.Width;
                    end;
                       // em landscape...abro o MENU..e GIRO...
                    //7.0.0.0 BUGFIX#2
                    if ( iFirstPos > 0 ) then
                    begin
                      //7.0.0.0 BUGFIX#2
                      If i4 > 0 then
                      begin
                            // se houve mudanca de parent...manter o PRIOR
                         if ( oObjTemp3 = nil ) then
                         begin
                            cTemp := rc_GetBlockPrior( oObj , pFrame );
                            oObjPrior := TUniContainerPanel( rc_FindControl( 'rcBlock' + cTemp , pFrame ) );
                         end;

                         cHintPrior       := oObjPrior.Hint;
                         //7.0.0.0 BUGFIX#2
                         bNoBorderAll2    := ( ( Pos( 'noborder-all'           , cHintPrior ) > 0 ) and ( Pos( 'noborder-all:'   , cHintPrior ) = 0 ) ) or
                                             ( ( Pos( 'noborder-all:mobile'    , cHintPrior ) > 0 ) and ( bMobileScreen ) ) or
                                             ( ( Pos( 'noborder-all:desktop'   , cHintPrior ) > 0 ) and ( not bMobileScreen ) );
                         bNoBorderLeft2   := ( bNoBorderAll2 ) or
                                             ( ( ( Pos( 'noborder-left'          , cHintPrior ) > 0 ) and ( Pos( 'noborder-left:'  , cHintPrior ) = 0 ) ) or
                                               ( ( Pos( 'noborder-left:mobile'   , cHintPrior ) > 0 ) and ( bMobileScreen ) ) or
                                               ( ( Pos( 'noborder-left:desktop'  , cHintPrior ) > 0 ) and ( not bMobileScreen ) ) );
                         bNoBorderRight2  := ( bNoBorderAll2 ) or
                                             ( ( ( Pos( 'noborder-right'         , cHintPrior ) > 0 ) and ( Pos( 'noborder-right:' , cHintPrior ) = 0 ) ) or
                                               ( ( Pos( 'noborder-right:mobile'  , cHintPrior ) > 0 ) and ( bMobileScreen ) ) or
                                               ( ( Pos( 'noborder-right:desktop' , cHintPrior ) > 0 ) and ( not bMobileScreen ) ) );
                         bNoBorderTop2    := ( bNoBorderAll2 ) or
                                             ( ( ( Pos( 'noborder-top'           , cHintPrior ) > 0 ) and ( Pos( 'noborder-top:'   , cHintPrior ) = 0 ) ) or
                                               ( ( Pos( 'noborder-top:mobile'    , cHintPrior ) > 0 ) and ( bMobileScreen ) ) or
                                               ( ( Pos( 'noborder-top:desktop'   , cHintPrior ) > 0 ) and ( not bMobileScreen ) ) );
                         bNoBorderBottom2 := ( bNoBorderAll2 ) or
                                             ( ( ( Pos( 'noborder-bottom'        , cHintPrior ) > 0 ) and ( Pos( 'noborder-bottom:', cHintPrior ) = 0 ) ) or
                                               ( ( Pos( 'noborder-bottom:mobile' , cHintPrior ) > 0 ) and ( bMobileScreen ) ) or
                                               ( ( Pos( 'noborder-bottom:desktop', cHintPrior ) > 0 ) and ( not bMobileScreen ) ) );
                      end;
                    end;

                    if iFirstPos = 0 then
                       iFirstPos := f;

                    i3 := 0;

                    // tentar ver em modo landscape por que nao tá expandido sem a imagem
                    bNoBorderAllBlocksInLine := false;//7.0.0.0 BUGFIX#2
                    if oObj.Width > 0 then
                    begin
                         Inc( i6 );
                         oBlocksSameLine[ i6 ] := oObj;

                         // somar os offsets

                         //7.0.0.0 new
                         //if not bNoBorderRight then
                         //   i5 := i5 + iOffSet_Border;

                         // pular linha final
                         if ( i4 + oObj.tag = iNumBlocks ) or
                            ( i5 + oObj.width >= iAreaAvailableH ) or
                            ( i5 + oObj.width + iNextObjWidth  >= iAreaAvailableH ) then
                         begin
                            // 7.0.0.0 "same-width:" noborderall left right
                            ff := oBlocksSameLine[ 1 ].Tag;
                            if i6 > 1 then
                            begin
//                              for z := 1 to i6 do
//                              begin
//                                   bNoBorderAllBlocksInLine := ( oBlocksSameLine[ z ].Tag = ff ) and
//                                                               (
//                                                               ( Pos( 'noborder-all', oBlocksSameLine[ z ].Hint ) > 0 ) or
//                                                               ( ( Pos( 'noborder-left', oBlocksSameLine[ z ].Hint ) > 0 ) and
//                                                                 ( Pos( 'noborder-right', oBlocksSameLine[ z ].Hint ) > 0 ) )
//                                                               );
//
//                                   if not bNoBorderAllBlocksInLine then
//                                      Break;
//                              end;
                              //7.0.0.0 new
                              //if bNoBorderAllBlocksInLine then
                              begin
                                 iBlockExtraWidth  := 0;
                                 iBlockAdjustWidth := iBlockWidth;
                                 //iBlockWidth   := SimpleRoundTo( ( iAreaAvailableH ) / i6 );
//
//                                 for z := 1 to i6 do
//                                 begin
//                                      //oBlocksSameLine[ z ].Width := Trunc( iBlockWidth ) * oBlocksSameLine[ z ].Tag;
//                                      oBlocksSameLine[ z ].Width := Trunc( iBlockWidth * oBlocksSameLine[ z ].Tag );
//                                      if z > 1 then
//                                         oBlocksSameLine[ z ].Left  := oBlocksSameLine[ z-1 ].Left + oBlocksSameLine[ z-1 ].Width;
//                                      //else
//                                       //  oBlocksSameLine[ z ].Left  := 0;
//                                      iBlockExtraWidth := iBlockExtraWidth + oBlocksSameLine[ z ].Width;
//                                 end;

//                                 While Trunc( iAreaAvailableH - iBlockExtraWidth ) >= 1 do
//                                 begin
//                                   oBlocksSameLine[ z-1 ].Width := oBlocksSameLine[ z-1 ].Width + 1;//Trunc( iAreaAvailableH - iBlockExtraWidth );
//
//                                   iBlockExtraWidth := iBlockExtraWidth + 1;
//                                   Dec( z );
//                                 end;
                                 //iBlockWidth := iBlockAdjustWidth;
                              end;
                            end;
                         end;
                         i5 := i5 + oObj.width;
                         i4 := i4 + oObj.tag;

//                         if ( i4 = iNumBlocks ) then
//                         begin
//                            for z := 1 to i6 do
//                            begin
//                                 //oBlocksSameLine[ z ].Width := Trunc( iBlockWidth ) * oBlocksSameLine[ z ].Tag;
//                                 oBlocksSameLine[ z ].Width := Trunc( iBlockWidth * oBlocksSameLine[ z ].Tag );
//                                 if z > 1 then
//                                    oBlocksSameLine[ z ].Left  := oBlocksSameLine[ z-1 ].Left + oBlocksSameLine[ z-1 ].Width;
//                                 //else
//                                  //  oBlocksSameLine[ z ].Left  := 0;
//                                 iBlockExtraWidth := iBlockExtraWidth + oBlocksSameLine[ z ].Width;
//                            end;
//                         end;
                    end;

                    //bNoBorderAllBlocksInLine := true;//test...remover...//7.0.0.0 new

                    // primeiro bloco encontrado...
                    //7.0.0.0 new
                    if ( ( f <= iFirstPos ) and ( iPos = 0 ) ) then
                    begin
                       iPos := 1;

                       if not bNoBorderAllBlocksInLine then
                          oObj.Left := 0;//IfThen( bNoBorderLeft, 0, iOffSet_Border );
                       oObj.Top  := IfThen( bNoBorderTop , 0, iOffSet_Border );

                       //7.0.0.0 BUGFIX#3
                       //rc_CheckBorders;
                    end
                    else
                    begin
                       if i = 0 then
                       begin
                          if oObjPrior <> nil then
                          begin
                                if not bNoBorderAllBlocksInLine then
                                begin
                                   //7.0.0.0 BUGFIX#3
                                   //oObj.Left := oObjPrior.Left + oObjPrior.Width + iOffSet_Border ;
                                   oObj.Left := oObjPrior.Left + oObjPrior.Width  ;
                                end;

                                oObj.Top  := oObjPrior.Top;

                                //7.0.0.0 BUGFIX#3
                                //rc_CheckBorders;

                                if ( bNoBorderTop2 ) and ( bNoBorderTop ) then
                                   oObj.Top  := oObjPrior.Top
                                else
                                if ( bNoBorderTop2 ) then
                                   oObj.Top  := IfThen( bNoBorderTop  , oObjPrior.Top, oObj.Top );

                                if oObj.Top < 0 then
                                   oObj.Top := 0;
                          end;
                       end
                       else
                       begin
                          //7.0.0.0 BUGFIX#3
                          if not bNoBorderAllBlocksInLine then
                             oObj.Left := 0;//IfThen( bNoBorderLeft, 0, iOffSet_Border );

                          //7.0.0.0 BUGFIX#3
                          //rc_CheckBorders;

                          oObj.Top  := IfThen( bNoBorderTop , i - iOffSet_Border, i );

                          if oObj.Top < 0 then
                             oObj.Top := 0;
                       end;

                       if ( bNoBorderTop2 ) and ( bNoBorderTop ) then
                          oObj.Top  := oObjPrior.Top
                       else
                       if ( bNoBorderTop2 ) then
                          oObj.Top  := IfThen( bNoBorderTop  , oObjPrior.Top, oObj.Top );

                       if oObj.Top < 0 then
                          oObj.Top := 0;

                      //7.0.0.0 test
                      if oObj.Left < 0 then
                         oObj.Left  := 0;
                    end;
//                    if iAreaAvailableH = 960 then
//                       iAreaAvailableH := iAreaAvailableH;
                    rc_CheckBorders;

                    // HEIGHT responsivo
                    // hr:340 mobile-v-340 mobile-h-340
                    // hr:xs-(parent-80-top) sm-(parent-80-top) md-(parent-80-top) |
                    // hr:xs-(self-top) sm-(self-top) md-(parent:50%-top)
                    // hr:parent-top off:80 mobile-v-160 mobile-h-80 |
                    // hr:objeto....
                    cTemp := rc_GetHintAttr( 'hr:', oObj.Hint );
                    iPos  := Pos( 'hr:' , oObj.Hint );
                    if iPos > 0 then
                    begin
                       iPos2 := Pos( '|' , Copy( oObj.Hint, iPos + 3 , 100 ) );
                       if iPos2 = 0 then
                          iPos2 := Pos( ']]' , Copy( oObj.Hint, iPos + 3 , 100 ) );

                       cTemp := lowercase( Trim( Copy( oObj.Hint, iPos + 3, iPos2 ) ) );
                       cTemp := StringReplace( cTemp, '|' , '', [rfReplaceAll] );
                       cTemp := Trim( StringReplace( cTemp, ']' , '', [rfReplaceAll] ) );

                       oObj_HRCHILD_Parent := nil;

                       n := 0;
                       cTemp4 := rc_GetHintAttr( 'hr:', oObj.Hint, true ) + ' ';
                       if ( ReturnNumbers( Copy( cTemp4, 1, 1 ) ) = '' ) and ( Copy( cTemp4, 3, 1 ) <> '-' ) then // xs- sm- md- ...
                       begin
                          // hr:objeto ? ... instable
                          // hr:parent
                          // hr:xs-
                          cTemp := cTemp + ' ';
                          if Pos( 'parent', cTemp4 ) > 0 then
                             oObj_HRCHILD_Parent := TUniControl( oObj.Parent )
                          else
                          begin
                             oObj_HRCHILD_Parent := TUniContainerPanel( rc_FindControl( Copy( cTemp4, 1, pos( ' ', cTemp4 ) - 1 ) , pFrame ) );
                          end;
                       end
                       else
                       begin
                            cTemp4 := Copy( cTemp4, 1 , Pos( ' ', cTemp4 ) - 1 );
                            if ReturnNumbers( cTemp4 ) <> '' then
                               n := StrToIntDef( cTemp4, oObj.Height );
                       end;


                       cTemp4 := '';
                       if Pos( '-top' , cTemp ) > 0 then
                       begin
                          cTemp4 := '-top';
                          cTemp := StringReplace( cTemp, '-top' , '', [rfReplaceAll] );
                          if ( Pos( ' mobile-v-off', cTemp ) > 0 ) and ( bMobileScreenPortrait ) then
                             cTemp4 := ''
                          else
                          if ( Pos( ' mobile-h-off', cTemp ) > 0 ) and ( bMobileScreenLandScape ) then
                             cTemp4 := ''
                          else
                          if ( Pos( ' mobile-off', cTemp ) > 0 ) and ( bMobileScreen ) then
                             cTemp4 := '';
                       end;

                       oObj.Hint := rc_AddHintAttr( '|prior-hr:' + oObj.Height.ToString , oObj.Hint , false) ;

                       // hr com mobile-v / h ?
                       if ( Pos( 'xs-', cTemp ) = 0 ) and
                          ( Pos( 'sm-', cTemp ) = 0 ) and
                          ( Pos( 'md-', cTemp ) = 0 ) and
                          ( Pos( 'lg-', cTemp ) = 0 ) and
                          ( Pos( 'xxl-', cTemp ) = 0 ) and //7.0.0.0 gridsystem
                          ( Pos( 'xl-', cTemp ) = 0 ) and
                          ( Pos( '4k-', cTemp ) = 0 ) and
                          ( Pos( '8k-', cTemp ) = 0 ) then
                       begin
                          cTemp3 := Copy( cTemp, Pos( ' ', cTemp ) + 1, 1000 );

                          if ( n = 0 ) and ( oObj_HRCHILD_Parent <> nil ) then
                             n := oObj_HRCHILD_Parent.Height;

                          iHeight := n;

                          ff := 0;//default-offset
                          //pra separar mobile-... do hr: e off:
                          cTemp5 := cTemp;
                          if ( Pos( ' mobile-v-', cTemp5 ) > 0 ) and ( bMobileScreenPortrait ) then
                          begin
                             if ( Pos( ' mobile-v-parent', cTemp5 ) > 0 ) then
                                iHeight := TUniControl( oObj.Parent ).Height
                             else
                                iHeight := StrToIntDef( rc_GetHintAttr( 'mobile-v-', cTemp5, true ) , iHeight );
                          end
                          else
                          if ( Pos( ' mobile-h-', cTemp5 ) > 0 ) and ( bMobileScreenLandScape ) then
                          begin
                             if ( Pos( ' mobile-h-parent', cTemp5 ) > 0 ) then
                                iHeight := TUniControl( oObj.Parent ).Height
                             else
                                iHeight := StrToIntDef( rc_GetHintAttr( 'mobile-h-', cTemp5, true ) , iHeight );
                          end
                          else
                          if ( Pos( ' mobile-', cTemp5 ) > 0 ) and ( bMobileScreen ) then
                          begin
                             if ( Pos( ' mobile-parent', cTemp5 ) > 0 ) then
                                iHeight := TUniControl( oObj.Parent ).Height
                             else
                                iHeight := StrToIntDef( rc_GetHintAttr( 'mobile-', cTemp5, true ) , iHeight );
                          end;

                          oObj.Height := iHeight;

                          cHint := oObj.Hint;
                       end
                       else
                       begin
                          if ( StrToIntDef( cTemp, 0 ) > 0 ) then
                          begin
                               oObj.Hint := StringReplace( oObj.Hint, 'hr:' + cTemp , 'hr:xs-' + cTemp + ' sm-' + cTemp + ' md-' + cTemp + ' lg-' + cTemp + ' xl-' + cTemp + ' xxl-' + cTemp + ' 4k-' + cTemp + ' 8k-' + cTemp , [rfReplaceAll] ); //7.0.0.0 gridsystem
                          end;

                          iPos  := Pos( 'hr:' , oObj.Hint );
                          iPos2 := Pos( '|' , Copy( oObj.Hint, iPos + 3 , 100 ) );
                          if iPos2 = 0 then
                             iPos2 := Pos( ']]' , Copy( oObj.Hint, iPos + 3 , 100 ) );

                          cTemp := lowercase( Trim( Copy( oObj.Hint, iPos + 3, iPos2 ) ) );
                          cTemp := StringReplace( cTemp, '|' , '', [rfReplaceAll] );
                          cTemp := StringReplace( cTemp, ']' , '', [rfReplaceAll] );

                          fPercent := 0;
                          begin
                             // md vai ser o padrão para os demais( caso não sejam definidos )
                             if ( Pos( 'md-', cTemp ) > 0 ) then
                             begin
                                rc_SetHeight( pFrame, oObj, 'md', cTemp );
                             end;

                             if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 200 ) or
                                ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_XS ) then
                             begin
                                rc_SetHeight( pFrame, oObj, 'xs', cTemp );
                             end
                             else
                             if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 400 ) then
                             begin
                                rc_SetHeight( pFrame, oObj, 'sm', cTemp );
                             end
                             else
                             if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 768 ) or
                                ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_MD ) then
                             begin
                                if ( bMobileScreen ) and ( Pos( 'sm-', cTemp ) > 0 ) then
                                begin
                                    if ( Pos( 'sm-', cTemp ) > 0 )  then
                                    begin
                                       rc_SetHeight( pFrame, oObj, 'sm', cTemp );
                                    end
                                    else
                                       oObj.Tag := iColsSM;
                                end
                                else
                                begin
                                    if ( Pos( 'md-', cTemp ) > 0 )  then
                                    begin
                                       rc_SetHeight( pFrame, oObj, 'md', cTemp );
                                    end
                                    else
                                       TUniControl(oObj).Height := iHeightMD;
                                end;
                             end
                             else
                             if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 1366 ) or
                                ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_LG ) then
                             begin
                                if ( Pos( 'lg-', cTemp ) > 0 ) then
                                begin
                                    rc_SetHeight( pFrame, oObj, 'md', cTemp );
                                end
                                else
                                if ( Pos( 'md-', cTemp ) = 0 ) then
                                   TUniControl(oObj).Height := iHeightLG;
                             end
                             else
                             if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 1920 ) or
                                ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_XL ) then
                             begin
                                if ( Pos( 'xl-', cTemp ) > 0 ) then
                                begin
                                   rc_SetHeight( pFrame, oObj, 'xl', cTemp );
                                end
                                else
                                if ( Pos( 'md-', cTemp ) = 0 ) then
                                   TUniControl(oObj).Height := iHeightXL;
                             end
                             else
                             if ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_XXL ) then
                             begin
                                if ( Pos( 'xxl-', cTemp ) > 0 ) then
                                begin
                                   rc_SetHeight( pFrame, oObj, 'xl', cTemp );
                                end
                                else
                                if ( Pos( 'xl-', cTemp ) > 0 ) then
                                begin
                                   rc_SetHeight( pFrame, oObj, 'xl', cTemp );
                                end
                                else
                                if ( Pos( 'md-', cTemp ) = 0 ) then
                                   TUniControl(oObj).Height := iHeightXL;
                             end
                             else
                             if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 3000 ) or
                                ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_4K ) then
                             begin
                                if ( Pos( '4k-', cTemp ) > 0 ) then
                                begin
                                   rc_SetHeight( pFrame, oObj, '4k', cTemp );
                                end
                                else
                                if ( Pos( 'md-', cTemp ) = 0 ) then
                                   TUniControl(oObj).Height := iHeight4k;
                             end
                             else
                             if ( GRID_SYSTEM = 'RC' ) and ( iAreaAvailableH <= 7000 ) or
                                ( GRID_SYSTEM = 'BS' ) and ( iAreaAvailableH < GRID_BS_8K ) then
                             begin
                                if ( Pos( '8k-', cTemp ) > 0 ) then
                                begin
                                   rc_SetHeight( pFrame, oObj, '8k', cTemp );
                                end
                                else
                                if ( Pos( 'md-', cTemp ) = 0 ) then
                                   TUniControl(oObj).Height := iHeight8k;
                             end;
                          end;
                       end;
                       // hr:xs-(parent-80-top) sm-(parent-80-top) md-(parent-80-top) |
                       // hr:parent-top off:80 mobile-v-160 mobile-h-80 |
                       if cTemp4 = '-top' then
                       begin
                          TUniControl(oObj).Height := TUniControl(oObj).Height - TUniControl(oObj).Top;
                       end;

                       ff := rc_GetOFFInfo( pFrame, cTemp, iOffSet_Border, bMobileScreen, bMobileScreenPortrait, bMobileScreenLandScape , bDesktop );//6.0.0.0
                       // offset( off )
                       if ff > 0 then
                          TUniControl(oObj).Height := TUniControl(oObj).Height - ff;
                       rc_HRReplicate( pFrame, oObj, oObj.Hint, bMobileScreen, bMobileScreenPortrait, bMobileScreenLandScape, bDesktop );
                    end;

                    iMin_mob   := 0;
                    iMin_mob_h := 0;
                    iMin_mob_v := 0; // 6.0.0.0
                    iMin       := 0;
                    iMax_mob   := 0;
                    iMax_mob_h := 0;
                    iMax_mob_v := 0; // 6.0.0.0
                    iMax       := 0;
                    cTemp3 := rc_GetHintAttr( 'min-height:', oObj.Hint ) ;
                    if cTemp3 <> '' then
                    begin
                       cTemp3 := cTemp3 + '.';//rc_GetHintAttr( 'max-width:', oObj.Hint ) ;
                       cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                       if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and ( bMobileScreenPortrait ) then
                       begin
                            cTemp3          := rc_GetHintAttr( 'mobile-v-', cTemp3, true ) ;
                            iMax_mob_v := StrToIntDef( cTemp3, oObj.Height );
                            if oObj.Height < iMax_mob_v then
                               oObj.Height := iMax_mob_v;
                       end
                       else
                       if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and ( bMobileScreenLandscape ) then
                       begin
                            cTemp3          := rc_GetHintAttr( 'mobile-h-', cTemp3, true ) ;
                            iMax_mob_h := StrToIntDef( cTemp3, oObj.Height );
                            if oObj.Height < iMax_mob_h then
                               oObj.Height := iMax_mob_h;
                       end
                       else
                       if ( Pos( 'mobile-', cTemp3 ) > 0 ) and ( bMobileScreen ) then
                       begin
                            cTemp3          := rc_GetHintAttr( 'mobile-', cTemp3, true ) ;
                            iMax_mob   := StrToIntDef( cTemp3, oObj.Height );
                            if oObj.Height < iMax_mob then
                               oObj.Height := iMax_mob;
                       end
                       else
                       //desktop
                       begin
                          cTemp3 := cTemp3 + ' ';
                          cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                          if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                          begin
                             iMax  := StrToIntDef( cTemp3, oObj.Height );
                             if oObj.Height < iMax then
                                oObj.Height := iMax;
                          end;
                       end;
                    end;

                    iMin_mob   := 0;
                    iMin_mob_h := 0;
                    iMin_mob_v := 0; // 6.0.0.0
                    iMin       := 0;
                    iMax_mob   := 0;
                    iMax_mob_h := 0;
                    iMax_mob_v := 0; // 6.0.0.0
                    iMax       := 0;
                    cTemp3 := rc_GetHintAttr( 'max-height:', oObj.Hint ) ;
                    if cTemp3 <> '' then
                    begin
                       cTemp3 := cTemp3 + '.';//rc_GetHintAttr( 'max-width:', oObj.Hint ) ;
                       cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                       if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and ( bMobileScreenPortrait ) then
                       begin
                            cTemp3          := rc_GetHintAttr( 'mobile-v-', cTemp3, true ) ;
                            iMax_mob_v := StrToIntDef( cTemp3, oObj.Height );
                            if oObj.Height > iMax_mob_v then
                               oObj.Height := iMax_mob_v;
                       end
                       else
                       if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and ( bMobileScreenLandscape ) then
                       begin
                            cTemp3          := rc_GetHintAttr( 'mobile-h-', cTemp3, true ) ;
                            iMax_mob_h := StrToIntDef( cTemp3, oObj.Height );
                            if oObj.Height > iMax_mob_h then
                               oObj.Height := iMax_mob_h;
                       end
                       else
                       if ( Pos( 'mobile-', cTemp3 ) > 0 ) and ( bMobileScreen ) then
                       begin
                            cTemp3          := rc_GetHintAttr( 'mobile-', cTemp3, true ) ;
                            iMax_mob   := StrToIntDef( cTemp3, oObj.Height );
                            if oObj.Height > iMax_mob then
                               oObj.Height := iMax_mob;
                       end
                       else
                       //desktop
                       begin
                          cTemp3 := cTemp3 + ' ';
                          cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                          if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                          begin
                             iMax  := StrToIntDef( cTemp3, oObj.Height );
                             if oObj.Height > iMax then
                                oObj.Height := iMax;
                          end;
                       end;
                    end;

                    iMin_mob   := 0;
                    iMin_mob_h := 0;
                    iMin_mob_v := 0; // 6.0.0.0
                    iMin       := 0;
                    iMax_mob   := 0;
                    iMax_mob_h := 0;
                    iMax_mob_v := 0; // 6.0.0.0
                    iMax       := 0;
                    cTemp3 := rc_GetHintAttr( 'height:', oObj.Hint ) ;
                    if cTemp3 <> '' then
                    begin
                       cTemp3 := cTemp3 + '.';//rc_GetHintAttr( 'max-width:', oObj.Hint ) ;
                       cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                       if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and ( bMobileScreenPortrait ) then
                       begin
                            cTemp3          := rc_GetHintAttr( 'mobile-v-', cTemp3, true ) ;
                            iMax_mob_v := StrToIntDef( cTemp3, oObj.Height );
                            oObj.Height := iMax_mob_v;
                       end
                       else
                       if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and ( bMobileScreenLandscape ) then
                       begin
                            cTemp3          := rc_GetHintAttr( 'mobile-h-', cTemp3, true ) ;
                            iMax_mob_h := StrToIntDef( cTemp3, oObj.Height );
                            oObj.Height := iMax_mob_h;
                       end
                       else
                       if ( Pos( 'mobile-', cTemp3 ) > 0 ) and ( bMobileScreen ) then
                       begin
                            cTemp3          := rc_GetHintAttr( 'mobile-', cTemp3, true ) ;
                            iMax_mob   := StrToIntDef( cTemp3, oObj.Height );
                            oObj.Height := iMax_mob;
                       end
                       else
                       //desktop
                       begin
                          cTemp3 := cTemp3 + ' ';
                          cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                          if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                          begin
                             iMax  := StrToIntDef( cTemp3, oObj.Height );
                             oObj.Height := iMax;
                          end;
                       end;
                    end;

                    iMin_mob   := 0;
                    iMin_mob_h := 0;
                    iMin_mob_v := 0; // 6.0.0.0
                    iMin       := 0;
                    iMax_mob   := 0;
                    iMax_mob_h := 0;
                    iMax_mob_v := 0; // 6.0.0.0
                    iMax       := 0;

                    iNextObjWidth := 0;
                    If oObjNext <> nil then
                       iNextObjWidth := oObjNext.Width;

                    //7.0.0.0 bigger height
//                    if ( i5 < iAreaAvailableH ) and
//                       ( i4 < iNumBlocks ) then
//                       if oObj.top + oObj.height >= iBiggerHeight then
//                          iBiggerHeight := oObj.top + oObj.height;

                    // pular linha
                    if ( i5 >= iAreaAvailableH ) or
                       ( i4 = iNumBlocks ) or
                       ( i5 + iNextObjWidth  > iAreaAvailableH  ) then
                    begin
                        //7.0.0.0 col-offset( future )
                        If oObjNext <> nil then
                        begin
                           if Pos( 'cols-offset:', oObjNext.Hint ) > 0 then
                              iOffSet_Border := StrToIntDef( rc_GetHintAttr( 'cols-offset:', oObjNext.Hint ), iOffSet )
                           else
                              iOffSet_Border := iOffSet;
                        end;

                        //7.0.0.0 PASSO5
                        if oObjNext = nil then
                        begin
                           if ( i5 >= iAreaAvailableH ) or
                              ( i4 = iNumBlocks ) then
                                i  := iOffSet_Border + oObj.top + oObj.height;//iBiggerHeight;// oObj.top + oObj.height ;
                        end
                        else
                        begin
                           if ( i5 >= iAreaAvailableH ) or
                              ( i4 = iNumBlocks ) or
                              ( i4 + oObjNext.Tag >= iNumBlocks ) then
                                i  := iOffSet_Border + oObj.top + oObj.height;//iBiggerHeight;// oObj.top + oObj.height ;
                        end;

                        oBlocksProps[ f, 6 ] := oBlocksProps[ f, 6 ] + i;
                        //7.0.0.0 noborder left right
                        if ( not bNoBorderAllBlocksInLine ) and ( oObj.Width > 0 ) then
                        begin
                           if bNoBorderRight then
                           begin
                              x := oObj.Width;
                              y := 0;

                              o := oObj.Width;
                              //7.0.0.0 BUGFIX#1
                              if ( i4 = iNumBlocks ) and ( ( iAreaAvailableH - i5 ) > 0 ) then
                              begin
                                 oObj.Width := oObj.Width + ( iAreaAvailableH - i5 );
                                 if bMobileScreenLandScape then
                                    oObj.Width := oObj.Width;
                                 i5 := i5 - o;
                                 i5 := i5 + oObj.Width;
                                 //7.0.0.0 test
                                 if (oObj.Left + oObj.Width) > i5 then
                                   oObj.Width := oObj.Width - iOffSet_Border; //7.0.0.0 right
                              end;

                              if ( iMax_mob_v > 0 ) and ( bMobileScreenPortrait ) then
                              begin
                                   y := iMax_mob_v;
                              end
                              else
                              if ( iMax_mob_h > 0 ) and ( bMobileScreenLandscape ) then
                              begin
                                   y := iMax_mob_h;
                              end
                              else
                              if ( iMax_mob > 0 ) and ( bMobileScreen ) then
                              begin
                                   y := iMax_mob;
                              end
                              else
                              //desktop
                              if ( not bMobileScreen ) and ( iMax > 0  ) then
                              begin
                                 y := iMax;
                              end;

                              if ( y > 0 )then
                              begin

//                                   oObj.Left  := oObj.Left + ( oObj.Width - y );
//
//                                   if oObjPrior <> nil then
//                                      oObjPrior.Width := oObjPrior.Width + ( oObj.Width - y );
//
//                                   oObj.Width := y;
                              end ;
                           end;
                        end;
                        //7.0.0.0 PASSO5
//                        if ( i5 >= iAreaAvailableH ) or
//                           ( i4 = iNumBlocks ) then
//                        begin
//                           i4 := 0;
//                           i5 := 0;
//                           i6 := 0;
//                           //7.0.0.0 bigger height
//                           iBiggerHeight := 0;
//                        end;
                        {$IFDEF DEBUG}
                        cTemp := '';
                        ff := GRID_COLS;
                        if ( i6 >= 1 ) then
                           ff := StrToIntDef( rc_GetHintAttr( 'cols-grid:', oBlocksSameLine[ 1 ].hint ), GRID_COLS );
                        o  := 0;
                        for z := 1 to i6 do
                        begin
                             if ff = StrToIntDef( rc_GetHintAttr( 'cols-grid:', oBlocksSameLine[ z ].hint ), GRID_COLS ) then
                             begin
                                cTemp := cTemp + oBlocksSameLine[ z ].Name + '=' + oBlocksSameLine[ z ].Tag.ToString + '<br>';
                                o := o + oBlocksSameLine[ z ].Tag;
                             end
                             else
                                break;
                        end;
                        if ( i6 > 1 ) and ( o <> ff ) then
                        begin
                           ShowMessageN( 'Checksum of blocks < ' + ff.ToString + ' !<br><br>' + cTemp );
                           i3 := GRID_MAX_BLOCKS + 1;
                           break;
                        end;
                        {$ENDIF}

                        //iBiggerHeight := oObj.top + oObj.height;//7.0.0.0 bigger height

                        if oObjNext = nil then
                        begin
                           if ( i5 >= iAreaAvailableH ) or
                              ( i4 = iNumBlocks ) then
                           begin
                              i4 := 0;
                              i5 := 0;
                              i6 := 0;
                              //7.0.0.0 bigger height
                              iBiggerHeight := 0;
                           end;
                        end
                        else
                        begin
                            if ( i5 >= iAreaAvailableH ) or
                               ( i4 = iNumBlocks ) or
                               ( ( i4 + oObjNext.Tag >= iNumBlocks ) and ( oObjNext.Parent = oObj.Parent ) ) then
                            begin
                               i4 := 0;
                               i5 := 0;
                               i6 := 0;
                               //7.0.0.0 bigger height
                               iBiggerHeight := 0;
//                               if ( ( i4 + oObjNext.Tag >= iNumBlocks ) and ( oObjNext.Parent = oObj.Parent ) ) then
//                                  iBiggerHeight := oObjNext.top + oObj.height;


                            end;
                        end;
                    end
                    else
                       i := 0;

                    oBlocksProps[ f, 1 ] := iPos;
                    oBlocksProps[ f, 2 ] := i;
                    oBlocksProps[ f, 3 ] := i3;
                    oBlocksProps[ f, 4 ] := i4;
                    oBlocksProps[ f, 5 ] := i5;
               end;
           end
           else
           begin
               if i3 > GRID_MAX_BLOCKS then
                  Break
               else
                  Inc( i3 );
           end;
       end;
     Except on e:exception do
            begin
                 if oObj <> nil then
                    ShowMessageN( 'rcBlocks( ' + oObj.Name + ' ): ' + e.Message )
                 else
                    ShowMessageN( 'rcBlocks( 2 ): ' + e.Message );
            end;
     End;
     //7.0.0.0 cols-debug:
     rc_ColsDebug( oBlocks, iCountBlocks, iScreenWidth, iScreenHeight, TComponent( pFrame ) );
end;
end.

