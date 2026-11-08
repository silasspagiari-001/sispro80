unit mkm_layout_aux_tooltip; //8.0.0.0

interface

uses
    System.SysUtils,
    System.TypInfo,
    System.Classes,
    Vcl.Controls,
    uniGUIClasses,
    uniGUIApplication,
    uniURLFrame,
    uconsts
    ;

    procedure renderAttr_TOOLTIP( var oControl : TUniControl; var cHint : string );

implementation

uses str_func, MainModule, mkm_layout;

procedure renderAttr_TOOLTIP( var oControl : TUniControl; var cHint : string );
var
   cAlign,cClass,cCaption,cTemp : string;
   iDelay,iWidth : integer;
begin
   try
     if ( Pos( 'hint:' , cHint ) > 0 ) and ( ( oControl is TUniControl ) ) then
     begin
        //to avoid conflict with "scale:"...
        cTemp    := Trim( rc_GetHintAttr( 'hint:', cHint, true, true ));
        cCaption := '';
        if Pos( 't:', cHint ) > 0  then
        begin
             cCaption := ( rc_GetHintAttr( 't:', cHint, true, false ) );
             cTemp := StringReplace( cTemp, 't:' + cCaption, '', [rfReplaceAll] );
        end
        else
            cCaption := 'default';

        iWidth := 0;
        if Pos( 'w:', cHint ) > 0  then
        begin
             cClass := rc_GetHintAttr( 'w:', cHint, true );
             iWidth := StrToIntDef( cClass, 0 );
             cTemp := StringReplace( cTemp, 'w:' + cClass, '', [rfReplaceAll] );
        end;
        iDelay := 0;
        if Pos( 'd:', cHint ) > 0  then
        begin
             cClass := rc_GetHintAttr( 'd:', cHint, true );
             iDelay := StrToIntDef( cClass, 0 );

             cTemp := StringReplace( cTemp, 'd:' + cClass, '', [rfReplaceAll] );
        end;

        cAlign        := '';
        if Pos( 'a:', cHint ) > 0  then
        begin
             cAlign := rc_GetHintAttr( 'a:', cHint, true );

             cTemp := StringReplace( cTemp, 'a:' + cAlign, '', [rfReplaceAll] );
        end;
        if Pos( 'c:', cHint ) > 0  then
        begin
             cClass := rc_GetHintAttr( 'c:', cHint, true, false );

             cTemp := StringReplace( cTemp, 'c:' + cClass, '', [rfReplaceAll] );
        end
        else
          cClass := '';

        if ( Pos( 'default', cClass ) = 0 ) and ( Pos( StringReplace( cClass, '-light', '', [rfReplaceAll] ) , 'gray success info warning danger' ) > 0 ) then
        begin
           if Pos( '-light', cClass ) > 0 then
              cClass := 'rc-tip-' + cClass + ' rc-tip-title-' + cClass + ' rc-tip-text-' + cClass
           else
           if Pos( 'gray', cClass ) > 0 then
              cClass := 'rc-tip-' + cClass
           else
              cClass := 'rc-tip-' + cClass + ' rc-tip-text-black';
        end;

        //8.0.0.0
        If ( GetPropInfo( oControl.ClassInfo, 'RTL') <> nil ) then
        begin
           oControl.RTL := ( mm.RTL ) and ( Pos( 'ltr:', oControl.Hint ) = 0 ) ;
        end;

        //hint:Show / Hide Search Dialog title:Search Button
        TUniControl( oControl ).ClientEvents.ExtEvents.Values['afterrender'] :=
           'function afterrender(sender, eOpts){'+
              'sender.rc_Tip = Ext.create(''Ext.tip.ToolTip'','+//8.5.0.1
              '{  target: sender.getEl(), ' +
              '   trackMouse: true,'+
              //'   id : ' + QuotedStr('tooltip-' + TUniControl( pControl ).Name ) + ',' +
              //'   anchor : ''top'',' + // não consegui ajustar a cor corretamente...fica para uma prox. versão
//                      'closable: true, ' +
//                      'align: ''tl'',' +
//                      'focusOnToFront: true, ' +
//                      'autoHide: true, ' +
//                      'autoShow: true, ' +
//                      'autoScroll: true, ' +
              //varIIF( cAlign   <> '', ' align: ''' + cAlign + ''',' , '' ) +
              varIIF( iWidth    > 0 , ' width: ' + iWidth.ToString + ', ' , '' ) + //  + ( Length( cTemp ) * 10 ).ToString + ',' +
              varIIF( cCaption <> '', ' title: ''' + cCaption + ''',' , '' ) +
              varIIF( cClass   <> '', ' cls: ''' + cClass + ''',' , '' ) +
              varIIF( iDelay    > 0 , ' dismissDelay: ' + iDelay.ToString + ', ' , '' ) + '   html: " ' + cTemp + '"})}' ;

        cTemp := '';
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_TOOLTIP.' + sLineBreak + e.Message);
   end;
end;

end.
