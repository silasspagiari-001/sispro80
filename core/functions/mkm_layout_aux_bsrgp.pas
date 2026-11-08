unit mkm_layout_aux_bsrgp; //8.0.0.0

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

    procedure renderAttr_BSRGP( pForm: TObject; var oObj : TObject; var cHint : string; pUpdateDBFields : Boolean; var cBsID : string );

implementation

uses mkm_layout, mkm_layout_aux, untDM_RC, mkm_func_web, str_func;

procedure renderAttr_BSRGP( pForm : TObject; var oObj : TObject; var cHint : string; pUpdateDBFields : Boolean; var cBsID : string );
var
   f,
   iPos, iPosIni, iPosEnd,
   iBsTempVal : integer;
   bisDB, bEnabled : boolean;
   cBsField, cBsComponent, cBsTemp, cBsCaption,
   cDataSource, cQuery, cField, cValue, cBsTempVal,
   cSeq, cTemp, cTemp2, cTemp3 : string;
   pDM : TDataModule;
  {RC DB}pQryMaster : TDataSet;//TFDQuery;//7.0.0.0
  {RC DB}pDsMaster  : TDataSource;

begin
   try
      TUniLabel( oObj ).TextConversion := txtHTML;
      cBsComponent := 'bsrgp';

      //bsrgpTipo01_M     bsrgpTipo_do_feriado01_M_db
      cHint    := TUniControl( oObj ).Name;

      if Pos( 'bsrgpTipo', TUniLabel( oObj ).Name ) > 0 then
         cTemp2 := cTemp2;

      cTemp2   := cHint;
      cTemp3   := ReverseStr( cTemp2 );

      // field ?   //M_10opiTpgRsb   bd_M_10odairef_od_opiTpgRsb
      bisDB    := ( Pos( 'bd_', cTemp3 ) > 0 );

      cSeq     := dm_rc.rc_GetParamFromRGP( cHint, rptSEQ );
      cField   := dm_rc.rc_GetParamFromRGP( cHint, rptFIELD );
      cValue   := dm_rc.rc_GetParamFromRGP( cHint, rptVALUE );
      cBsField := cField;
      cBsTemp  := cValue;
      cBsCaption := '';
      cBsTempVal := cBsTemp;

      iPos       := StrToIntDef( cSeq, 0 );

      iBsTempVal := TUniControl( oObj ).Tag;

      cTemp  := TUniControl( oObj ).Caption ;

      cDataSource := '';
      {RC DB(*}pQryMaster  := nil;
      cQuery      := '';
      pDM         := nil;
      If ( bisDB ) then
      begin
         if ( Pos( ' ds:', TUniControl( oObj ).hint ) > 0 ) or ( Pos( '[ds:', TUniControl( oObj ).hint ) > 0 ) then
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

         pQryMaster := nil;
         cQuery     := '';
         if pDsMaster <> nil then
         begin
            pQryMaster := pDsMaster.DataSet;
            cQuery     := pQryMaster.Name;
         end;
      end;
      // read and update?
      if ( pUpdateDBFields ) and ( bisDB ) then
      begin
         cTemp  := TUniControl( oObj ).Caption ;

         if pQryMaster <> nil then
         begin
            if ( pQryMaster.State <> dsInactive ) then
            begin
                 cTemp  := TUniControl( oObj ).Caption ;

                 iPosIni := Pos( 'field=' , cTemp ) + 6;
                 iPosEnd := Pos( 'form='  , cTemp ) - 1;

                 cBsField   := Copy( cTemp, iPosIni, iPosEnd ) ;
                 cBsField   := Trim( Copy( cBsField, 1, Pos ( ',', cBsField ) - 3 ) ) ;

                 if cBsField <> '' then
                 begin
                    // field content
                    try
                        if DataTypeIsNumber( pQryMaster.FieldByName( cBsField ).DataType ) then
                           cBsTempVal := varIIF( pQryMaster.FieldByName( cBsField ).IsNull, -1, pQryMaster.FieldByName( cBsField ).Value )
                        else
                           cBsTempVal := varIIF( pQryMaster.FieldByName( cBsField ).IsNull, '', pQryMaster.FieldByName( cBsField ).Value );
                    except on e:exception do
                           begin
                                dm_rc.rc_ShowError( cBsField + ' ' + e.Message )
                           end;
                    end;

                    iPosIni := Pos( 'type="radio"' , cTemp );
                    iPosEnd := Pos( 'onclick="ajaxRequest' , cTemp );

                    cTemp2 := Copy( cTemp, iPosIni, iPosEnd ) ;

                    // rc_RgpCheck / rc_RgpInitialize
                    if ( iBsTempVal = 999 ) or ( iBsTempVal = -999 ) then
                    begin
                       if iBsTempVal = 999 then
                       begin
                          iBsTempVal := 1;

                          if pQryMaster.State in [dsInsert, dsEdit ] then
                             pQryMaster.FieldByName( cBsField ).Value := cBsTemp;

                       end
                       else
                       if iBsTempVal = -999 then
                       begin
                          iBsTempVal := 0;

                          if pQryMaster.State in [dsInsert, dsEdit ] then
                             pQryMaster.FieldByName( cBsField ).Clear;
                       end;
                    end
                    else
                    if iBsTempVal <> -1 then
                       iBsTempVal := varIIF( cBsTempVal = cBsTemp , 1, 0 )
                    else
                       iBsTempVal := 0;


                    TUniControl( oObj ).Tag := iBsTempVal;

                    cTemp := StringReplace( cTemp, ' checked="" ', '',[rfReplaceAll] );
                    cTemp := StringReplace( cTemp, ' disabled="" ', '',[rfReplaceAll] );

                    if iBsTempVal = -1 then
                       TUniControl( oObj ).Caption :=
                          Copy( cTemp, 1, iPosIni + 12 ) + '' +
                          varIIF( pQryMaster.State in [dsInsert, dsEdit ] , '', ' disabled="" ' ) +
                          Trim( Copy( cTemp, iPosIni + 12, 500 ) )
                    else
                       TUniControl( oObj ).Caption :=
                          Copy( cTemp, 1, iPosIni + 12 ) + varIIF( iBsTempVal = 1, ' checked="" ', '' ) +
                          varIIF( pQryMaster.State in [dsInsert, dsEdit ] , '', ' disabled="" ' ) +
                          Trim( Copy( cTemp, iPosIni + 12, 500 ) );

                    cTemp := cTemp ;
                 end;
            end;
         end;
      end
      else {RC DB*>}
      begin
            // rc_RgpCheck / rc_RgpInitialize
            if ( iBsTempVal = 999 ) or ( iBsTempVal = -999 ) then
            begin
               if iBsTempVal = 999 then
               begin
                  iBsTempVal := 1;
               end
               else
               if iBsTempVal = -999 then
               begin
                  iBsTempVal := 0;
               end;
            end
            else
            if iBsTempVal = -1 then
               iBsTempVal := 0;

            TUniControl( oObj ).Caption :=
              '  <div class="form-check">' +
              '    <input class="form-check-input" type="radio" ' + varIIF( iBsTempVal = 1, ' checked="" ', '' ) +
                   'onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                      QuotedStr( cBsComponent + '=' + TUniControl( oObj ).Name ) + ', ' +
                      QuotedStr( 'field=' + cBsField ) + ' , ' +
                      QuotedStr( 'value=' + cBsTempVal ) + ' , ' +
                      QuotedStr( 'radio=' + iPos.ToString ) + ' , ' +
                      QuotedStr( 'query=' + cQuery ) + ' , ' +
                      QuotedStr( 'form=' + TComponent( pForm ).Name ) + '] );" name="customRadio' + TUniControl( oObj ).Name + '__' + cBsID + '" id="customRadio' + TUniControl( oObj ).Name + '__' + cBsID +
                         '"><label class="form-check-label" for="customRadio' + TUniControl( oObj ).Name + '__' + cBsID +
                         '">' + cBsCaption + '</label>' +
              '  </div>' ;
      end;

   except on e:exception do
      raise Exception.Create('Error On renderAttr_BSRGP.' + sLineBreak + e.Message);
   end;
end;

end.
