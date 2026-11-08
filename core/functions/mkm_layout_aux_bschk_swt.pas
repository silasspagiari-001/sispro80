unit mkm_layout_aux_bschk_swt; //8.0.0.0

interface

uses
    System.SysUtils,
    System.Classes,
    uniGUIClasses,
    uniGUIApplication,
    uniGUITypes,
    uniLabel,
    uconsts,
    DB
    ;

    procedure renderAttr_BSCHK_SWT( pForm: TObject; var oObj : TObject; var cHint : string; pUpdateDBFields : Boolean; var cBsID : string );

implementation

uses mkm_layout, mkm_layout_aux, untDM_RC, MainModule, mkm_func_web, str_func,
  mkm_layout_aux_align;

procedure renderAttr_BSCHK_SWT( pForm : TObject; var oObj : TObject; var cHint : string; pUpdateDBFields : Boolean; var cBsID : string );
var
   f,
   iPosIni, iPosEnd,
   iBsTempVal : integer;
   bisDB, bEnabled : boolean;
   cBsField, cBsComponent, cBsTemp, cBsCaption,
   cDataSource, cQuery,
   cTemp, cTemp2 : string;
   pDM : TDataModule;
  {RC DB}pQryMaster : TDataSet;//TFDQuery;//7.0.0.0
  {RC DB}pDsMaster  : TDataSource;

begin
   try
     cHint := Trim( cHint );
     TUniLabel( oObj ).TextConversion := txtHTML;
     if Pos( 'bschk:' , cHint ) > 0 then
        cBsComponent := 'bschk'
     else
     begin
        cBsComponent := 'bsswt';
     end;

     cTemp2 := cHint;

     // field ?
     if Pos( 'field:' , cTemp2 ) > 0 then
     begin
        cBsField := Copy( cTemp2, Pos( 'field:' , cTemp2 ) , 100 );
        cHint := StringReplace( cTemp2, cBsField, '',[rfReplaceAll] );
        cBsField := Trim( Copy( cBsField, 7 , 100 ) ) + ' ';
        cBsField := Copy( cBsField, 1, Pos( ' ' , cBsField ) -1 );
     end
     else
        cBsField := '';

     bisDB       := ( cBsField <> '' );

     cTemp2      := cHint;

     cBsTemp     := Copy( cTemp2, Pos( '_' , lowercase( cTemp2 ) ) + 1 , 100 );
     cBsCaption  := '';
     iBsTempVal  := TUniControl( oObj ).Tag;
     bEnabled    := TUniControl( oObj ).Enabled;
     cTemp       := '';

     cDataSource := '';
     {<*RC DB}pDsMaster   := nil;
     cQuery      := '';
     pDM         := nil;
     if bisDB then
     begin

        if Pos( ' ds:', TUniControl( oObj ).hint ) > 0 then
        begin
           // 6.0.0.0
           cDataSource := rc_GetHintAttr( 'ds:', TUniControl( oObj ).hint, true, false, true );

           If Pos( '.', cDataSource ) > 0 then
           begin
               pDM := nil;
               pDM := dm_rc.rc_FindDataModule( Copy( cDataSource, 1, pos( '.', cDataSource ) - 1 ) );
               cTemp := Copy( cDataSource, pos( '.', cDataSource ) + 1 );
           end;
           if pDM <> nil then
              pDsMaster  := TDataSource( pDM.FindComponent( cTemp ) )//6.1.0.0
           else
              pDsMaster  := TDataSource( TComponent( TComponent( pForm ) ).FindComponent( cDataSource ) );
        end
        else
           pDsMaster   := TDataSource( TComponent( TComponent( pForm ) ).FindComponent( 'dsmaster' ) );
     end;

     if pDsMaster <> nil then
     begin
        pQryMaster := pDsMaster.DataSet;//TFdQuery( pDsMaster.DataSet );//7.0.0.0
        cQuery     := pQryMaster.Name;
     end;

     // read and update?
     if ( pUpdateDBFields ) and ( bisDB ) then
     begin
        if pQryMaster <> nil then
           if ( pQryMaster.State <> dsInactive ) then
           begin
                cTemp  := TUniControl( oObj ).Caption ;

                iPosIni := Pos( 'field=' , cTemp ) + 6;
                iPosEnd := Pos( 'form='  , cTemp ) - 1;

                cBsField   := Copy( cTemp, iPosIni, iPosEnd ) ;
                cBsField   := Trim( Copy( cBsField, 1, Pos ( ',', cBsField ) - 3 ) ) ;

                if cBsField <> '' then
                begin
                   try
                      if DataTypeIsNumber( pQryMaster.FieldByName( cBsField ).DataType ) then
                         iBsTempVal := varIIF( pQryMaster.FieldByName( cBsField ).IsNull, 0, pQryMaster.FieldByName( cBsField ).Value )
                      else
                         iBsTempVal := varIIF( ( pQryMaster.FieldByName( cBsField ).Value = mm.VALUE_YES ) , 1, 0 );
                   except on e:exception do
                          begin
                               dm_rc.rc_ShowError( cBsField + ' ' + e.Message )
                          end;
                   end;

                   iPosIni := Pos( 'type="checkbox"' , cTemp );
                   iPosEnd := Pos( 'class="form-check-input"' , cTemp );

                   cTemp2 := Copy( cTemp, iPosIni, iPosEnd ) ;

                   TUniControl( oObj ).Tag := iBsTempVal;

                   cTemp := StringReplace( cTemp, 'checked=""', '',[rfReplaceAll] );
                   cTemp := StringReplace( cTemp, 'disabled=""', '',[rfReplaceAll] );

                   TUniControl( oObj ).Caption :=
                      Copy( cTemp, 1, iPosIni + 16 ) + varIIF( iBsTempVal = 1, 'checked=""', '' ) +
                      varIIF( ( pQryMaster.State in [dsInsert, dsEdit ] ) and ( bEnabled ) , '', 'disabled=""' ) +
                      Trim( Copy( cTemp, iPosIni + 16, 500 ) );
                end;

           end;
     end
     else {RC DB*>}
     begin
        if cBsComponent = 'bschk' then
           TUniControl( oObj ).Caption :=
             '<div class="form-check">' +
             '  <input type="checkbox" ' +
                varIIF( iBsTempVal = 1, 'checked=""', '' ) +
                varIIF( bEnabled, '', 'disabled=""' ) +
                ' class="form-check-input" ' +
                'onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                   QuotedStr( cBsComponent + '=' + iBsTempVal.ToString ) + ', ' +
                   QuotedStr( 'chk=' + TUniControl( oObj ).Name ) + ' , ' +
                   QuotedStr( 'field=' + cBsField ) + ' , ' +
                   QuotedStr( 'query=' + cQuery ) + ' , ' +
                   QuotedStr( 'form=' + TComponent( pForm ).Name ) + '] );" id="bschk_' +
                      TUniControl( oObj ).Name + '__' + cBsID + '"><label class="form-check-label" for="bschk_' +
                      TUniControl( oObj ).Name + '__' + cBsID + '">' + cBsCaption + '</label></div>'
        else
           TUniControl( oObj ).Caption :=
             '<div class="form-check form-switch ' + varIIF( TUniControl( oObj ).Alignment = taCenter,'switch-center','' ) + cTemp + '">' +//8.5.0.1
             //'  <input type="checkbox" role="switch" ' +
             '  <input type="checkbox" ' +
                varIIF( iBsTempVal = 1, 'checked=""', '' ) +
                varIIF( bEnabled, '', 'disabled=""' ) +
                ' class="form-check-input' + cTemp + '" ' + // 6.0.0.0
                'onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                   QuotedStr( cBsComponent + '=' + iBsTempVal.ToString ) + ', ' +
                   QuotedStr( 'swt=' + TUniControl( oObj ).Name ) + ' , ' +
                   QuotedStr( 'field=' + cBsField ) + ' , ' +
                   QuotedStr( 'query=' + cQuery ) + ' , ' +
                   QuotedStr( 'form=' + TComponent( pForm ).Name ) + '] );" id="bsswt_' +
                      TUniControl( oObj ).Name + '__' + cBsID + '"><label class="form-check-label" for="bsswt_' +
                      TUniControl( oObj ).Name + '__' + cBsID + '">' + cBsCaption + '</label></div>';
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_BSCHK_SWT.' + sLineBreak + e.Message);
   end;
end;

end.
