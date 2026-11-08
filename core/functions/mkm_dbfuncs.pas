unit mkm_dbfuncs; //8.4.0.0

interface

uses
    uniDBComboBox, uniGUIFrame, uniGUIForm, System.SysUtils,
    DateUtils, System.Variants, // 8.0.0.0
    vcl.Graphics, vcl.menus,
    System.Classes, uniGUIClasses, uconsts, uconsts_cfg, TypInfo, Data.DB, //System.JSON,( future implementation ) //6.0.0.0
    //8.4.0.0 Thanks Mr. Fabio Oliveira - PKs Compostas
    FireDAC.Stan.Intf, FireDAC.Stan.Option,
    FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
    FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
    FireDAC.Comp.DataSet, FireDAC.Comp.Client,

    uniDateTimePicker, uniDBDateTimePicker, uniDBCheckBox, uniCheckBox, uniComboBox, uniRadioGroup, uniRadioButton,
    uniDBListBox, uniDBLookupComboBox, uniStringGrid, uniMemo, uniDBMemo,
    uniEdit, uniDBEdit, uniLabel, uniPanel, uniDBGrid;

procedure rc_DSReactiveCheck(pForm: TObject; pDS:TDataSource );
function rc_Locate( pGrid:TUniDBGrid; pDataSet:TDataSet; pAKeyFields:string; pAKeyValues:Variant; pAOptions:TLocateOption; pUpdatePaginator:boolean=true ) : boolean; // 6.0.0.0
function rc_DynamicBindLoad( pForm: TObject ) : boolean ; // 6.0.0.0
function rc_DynamicBindSave( pForm: TObject ) : boolean ; // 6.0.0.0
procedure rc_GridOnColumnFilter(Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant);
procedure rc_GridColumnFilter(pForm: TObject; Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant); //8.0.0.0
procedure rc_GridColumnSearchRender( pForm: TObject; pGrid: TUniDBGrid ; pHiddenPanel : TUniHiddenPanel);//8.0.0.0
//8.4.0.0 pk composta
function rc_AddTabPrefix( pPkFields : string ) : string;
function rc_GetPKWhereStr( pPKFields : string; pQrySearchMaster : TDataSet ) : string;
//8.4.0.0 Thanks Mr. Fabio Oliveira - PKs Compostas
function  rc_GetPKValues(pDataSet : TDataSet; pPkFields : String) : String;
procedure rc_SetPKParams(pDataSetParam, pDataSetValues : TFdQuery; pPkFields : String);
function  rc_AddPKWhere(pAliasPrefix : String = 'tab.'; pPkFields : String = '' ) : String;
//8.4.0.1 lookup str
function rc_GetLookupPKDataType( pLookupName : string ) : String;


//function rc_DynamicBindGetJSON( pForm: TObject ) : TJSONObject;  // 6.0.0.0 ( future implementation )
  // - grid
  // - query
  // - field
  // - content
  // - Aoptions

implementation
{------------------------------------------------------------------------------}

uses mkm_layout, untDM_RC, str_func, mkm_func_web, mkm_validate, MainModule,
     mkm_createcomponents, mkm_layout_aux; //8.0.0.2

//8.4.0.1 lookup str
function rc_GetLookupPKDataType( pLookupName : string ) : String;
var
   cPkType : string;
begin
    cPkType := lowercase( pLookupName );
    cPkType := StringReplace( cPkType, '_codid', '', [rfReplaceAll] );
    cPkType := Copy( cPkType , 6 ) + '__';
    cPkType := trim(lowercase( Copy( cPkType , 1, Pos( '__', cPkType ) - 1 ) ) );
    cPkType := dm_rc.rc_GetPrimaryKey( cPkType );
    cPkType := trim(lowercase( dm_rc.memPK.FieldByName( 'type' ).AsString ));
    Result  := cPkType ;
end;
//8.4.0.0 pk composta
function rc_GetPKWhereStr( pPKFields : string; pQrySearchMaster : TDataSet ) : string;
var
   cPk, cPkID, cTmp : string;
begin
    mm.varC_SQL_GENERIC := ' WHERE ';
    cTmp := pPKFields;// rc_GetPrimaryKey( pTable, true );
    while Pos( ';', cTmp ) > 0 do
    begin
       cPk := Copy( cTmp, 1, Pos( ';', cTmp ) - 1 );
       cTmp := StringReplace( cTmp, cPk + ';', '', [rfReplaceAll] );
       if DataTypeIsNumber( pQrySearchMaster.FieldByName( cPk ).DataType ) then
          cPkId := pQrySearchMaster.FieldByName( cPk ).AsString
       else
       if DataTypeIsString( pQrySearchMaster.FieldByName( cPk ).DataType ) then
          cPkId := QuotedStr( pQrySearchMaster.FieldByName( cPk ).AsString )
       else
       if DataTypeIsDateTime( pQrySearchMaster.FieldByName( cPk ).DataType ) then
       begin
          cPkId := QuotedStr( DateTimeToStr( rc_RemoveMiliseconds( pQrySearchMaster.FieldByName( cPk ).AsDateTime ) ) );
          if Pos( 'FIREBIRD' , mm.CONFIG_DATABASE ) > 0 then
             cPkId := StringReplace( cPkId, '/', '.', [rfReplaceAll] );
       end;

       mm.varC_SQL_GENERIC := mm.varC_SQL_GENERIC + cPK + ' = ' + cPkID + ' ';
       if Pos( ';', cTmp ) > 0 then
          mm.varC_SQL_GENERIC := mm.varC_SQL_GENERIC + 'and ';
    end;
    Result := mm.varC_SQL_GENERIC;
end;
//8.4.0.0 pk composta
function rc_AddTabPrefix( pPkFields : string ) : string;
var
   cTemp : string;
begin
     Result := '';
     while StrTokenCount( pPkFields, ';' ) > 0 do
     begin
          cTemp := Copy( pPkFields, 1, pos( ';',pPkFields ) - 1 );
          pPkFields := StringReplace( pPkFields, cTemp + ';', '', [rfReplaceAll] );
          Result := Result + ' tab.' + cTemp + ',';
     end;
end;
//8.4.0.0 Thanks Mr. Fabio Oliveira
function  rc_AddPKWhere(pAliasPrefix : String = 'tab.'; pPkFields : String = '' ) : String;
var
  vStrParams, vField: String;
  vPkList: TStringList;
  i: Integer;
begin
  //pPkFields Sample: 'empresa;codigo;documento;serie;'

  if pPkFields = '' then
  begin
     Result := '';
     Exit;
  end;

  if StrTokenCount( pPkFields, ';' ) > 1 then
  begin
    vPkList := TStringList.Create;
    try
      vPkList.Delimiter := ';';
      vPkList.StrictDelimiter := True;
      vPkList.DelimitedText := pPkFields;

      vStrParams := '';
      for i := 0 to vPkList.Count - 1 do
      begin
        vField := Trim(vPkList[i]);
        if vField <> '' then
        begin
          if vStrParams <> '' then
            vStrParams := vStrParams + ' AND ';
          vStrParams := vStrParams + Format( pAliasPrefix + '%s = :%s', [vField, vField]);
        end;
      end;
      Result := vStrParams + ' ';
    finally
      vPkList.Free;
    end;
  end
  else
    Result := ' tab.[[pk]] = :table_pk ';
end;
//8.4.0.0 Thanks Mr. Fabio Oliveira
function  rc_GetPKValues(pDataSet : TDataSet; pPkFields : String) : String;
var
  vField: String;
  vPkList: TStringList;
  i: Integer;
begin
  vPkList := TStringList.Create;
  try
    vPkList.Delimiter       := ';';
    vPkList.StrictDelimiter := True;
    vPkList.DelimitedText   := pPkFields;
    for i := 0 to vPkList.Count - 1 do
    begin
      vField := Trim(vPkList[i]);
      if (vField <> '') and (pDataSet.FindField(vField) <> nil) then
      begin
         Result := Result + pDataSet.FieldByName(vField).AsString + ';';
      end;
    end;
  finally
    vPkList.Free;
  end;
end;
//8.4.0.2 ( Thanks for bug tracker Mr. Fabio Oliveira )
procedure rc_SetPKParams(pDataSetParam, pDataSetValues : TFdQuery; pPkFields : String);
var
  vField: String;
  vPkList: TStringList;
  i: Integer;
begin
  vPkList := TStringList.Create;
  try
    vPkList.Delimiter       := ';';
    vPkList.StrictDelimiter := True;
    vPkList.DelimitedText   := pPkFields;

    for i := 0 to vPkList.Count - 1 do
    begin
      vField := Trim(vPkList[i]);

      //8.4.0.1 upd #1
      if pDataSetParam.State = dsInsert then
      begin
         if (vField <> '') and (pDataSetValues.FindField(vField) <> nil) then
         begin
           if DataTypeIsNumber( pDataSetValues.FieldByName(vField).DataType ) then
              pDataSetParam.ParamByName(vField).AsInteger := -123456789
           else
           if DataTypeIsFloat( pDataSetValues.FieldByName(vField).DataType ) then
              pDataSetParam.ParamByName(vField).AsFloat := -123456789
           else
           if DataTypeIsString( pDataSetValues.FieldByName(vField).DataType ) then
              pDataSetParam.ParamByName(vField).AsString := '-9'
           else
           if DataTypeIsDateTime( pDataSetValues.FieldByName(vField).DataType ) then
              pDataSetParam.ParamByName(vField).AsDateTime := StrToDateTime('01/01/1900 00:00:00')
           else
           raise Exception.Create('Data type not suported for field: ' + vField);
         end;
      end
      else
      begin
         if (vField <> '') and (pDataSetValues.FindField(vField) <> nil) then
         begin
           if DataTypeIsNumber( pDataSetValues.FieldByName(vField).DataType ) then
              pDataSetParam.ParamByName(vField).AsInteger := pDataSetValues.FieldByName(vField).AsInteger
           else
           if DataTypeIsFloat( pDataSetValues.FieldByName(vField).DataType ) then
              pDataSetParam.ParamByName(vField).AsFloat := pDataSetValues.FieldByName(vField).AsFloat
           else
           if DataTypeIsString( pDataSetValues.FieldByName(vField).DataType ) then
              pDataSetParam.ParamByName(vField).AsString := pDataSetValues.FieldByName(vField).AsString
           else
           if DataTypeIsDateTime( pDataSetValues.FieldByName(vField).DataType ) then
              pDataSetParam.ParamByName(vField).AsDateTime := rc_RemoveMiliseconds( pDataSetValues.FieldByName(vField).AsDateTime )
           else
           raise Exception.Create('Data type not suported for field: ' + vField);
         end;
      end;
    end;

  finally
    vPkList.Free;
  end;
end;
//8.0.0.0 grid
procedure rc_GridOnColumnFilter(Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant);
begin
   rc_GridColumnFilter( Sender.Owner, Sender, Column, Value );
end;
//8.0.0.0 grid
procedure rc_GridColumnSearchRender( pForm: TObject; pGrid: TUniDBGrid ; pHiddenPanel : TUniHiddenPanel);
var
   i : integer;
   oEdtFilter : TUniEdit;
   //oEdtFilter : TUniControl;
   cFieldName : string;
begin
    //8.4.0.0
    exit;
    //8.2.0.0 model-search
    If ( Pos( 'rc-searchcol' , pGrid.Hint ) > 0 ) or ( Pos( 'model-search:column' , pGrid.Hint ) > 0 ) then
    //If ( Pos( 'rc-searchcol' , pGrid.Hint ) > 0 ) then
    //If Pos( 'model-search:column' , pGrid.Hint ) > 0 then
    begin

       dm_rc.rc_ShowToaster( ttyInfo, 'rc_GridColumnSearchRender', false, ttrPinItUp, 3500 ); //

       rc_AddCssClass( pGrid, 'rc-grid-search-column' );

       for I := 0 to pGrid.Columns.Count - 1 do
       begin
         if ( pGrid.Columns.Items[i].Visible ) then
         begin
            try
               //oEdtFilter := TUniEdit( Self.FindComponent( 'edMFTER' + sqlSearchMaster.Fields[I].FieldName + '_' + Self.ed_Table_ItemSel.Text ) );
               cFieldName := StrTokenClear( RemoveAccents( stringReplace( pGrid.Columns.Items[i].FieldName, ' ', '', [rfReplaceAll] ) ) );
               cFieldName := cFieldName + '_' + pGrid.Name;

               oEdtFilter := TUniEdit( TComponent(pForm).FindComponent( 'edMFTER' + cFieldName ) );

               if oEdtFilter = nil then
               begin
                 if oEdtFilter = nil then
                    oEdtFilter := TUniEdit.Create( TComponent(pForm) );
                 if DataTypeIsDateTime( pGrid.Columns[I].Field.DataType ) then
                 begin
                    oEdtFilter.hint := '[[mask:date]]';
                 end;
                 oEdtFilter.Parent    := pHiddenPanel;
                 oEdtFilter.Font.Name := DEFAULT_FONT_NAME;
                 oEdtFilter.Font.Size := DEAFULT_BTN_EDT_FONT_SIZE;
                 oEdtFilter.Name      := 'edMFTER' + cFieldName;
                 oEdtFilter.TabOrder  := I;
                 dm_rc.rc_ApplyEditMasks( pForm , oEdtFilter );
                 //8.0.0.0
                 rc_AddCssClass( oEdtFilter, 'border-bottom-edit-rounded-noshadow' );
               end;
               pGrid.Columns.Items[i].Filtering.Enabled := True;
               pGrid.Columns.Items[i].Filtering.Editor  := oEdtFilter;

            except on e:exception do
              begin
                 raise Exception.Create('rc_GridColumnSearchRender Error: ' + e.Message);
              end;
            end;
         end;
       end;
    end
    else
    begin
        rc_RemoveCssClass( pGrid, 'rc-grid-search-column' );
    end;
end;
//8.0.0.0
procedure rc_GridColumnFilter(pForm: TObject; Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant);
var
  V : Variant;
  I : Integer;
  cFieldName, lvFilter : string;
  dDate : TDate;
  oQry : TDataSet;
begin
  cFieldName := Sender.DataSource.DataSet.Name;
  oQry := TDataSet( rc_FindControl( cFieldName , pForm ) );
  //if sqlSearchMaster.Active then
  if ( oQry <> nil ) and ( oQry.Active ) then
  begin
    for I := 0 to Sender.Columns.Count - 1  do
    begin
      if Sender.Columns[I].Filtering.Enabled then
      begin
        V := Trim(VarToStrDef(Sender.Columns[I].Filtering.VarValue, ''));
        if V <> '' then
        begin
          //flavio 31/08/2022
          cFieldName := lowercase( RemoveAccents( Sender.Columns[I].FieldName ) );
          if DataTypeIsNumber( Sender.Columns[I].Field.DataType ) then
          begin
             If StrToIntDef( VarToStr( V ), -1 ) >= 0 then
             begin
                if lvFilter = '' then
                  lvFilter := '(' + cFieldName + ' = ' + V + ')'
                else
                  lvFilter := lvFilter + ' and (' + cFieldName + ' = ' + V + ')'
             end;
          end
          else
          if DataTypeIsString( Sender.Columns[I].Field.DataType ) then
          begin
             if lvFilter = '' then
               lvFilter := '(' + cFieldName + ' like ' + QuotedStr( '%' + V + '%' ) + ')'
             else
               lvFilter := lvFilter + ' and (' + cFieldName + ' like ' + QuotedStr( '%' + V + '%' ) + ')';

             lvFilter := '( ' + lvFilter + ') or (' + cFieldName + ' like ' + QuotedStr( '%' + AnsiUpperCase ( V ) + '%' ) + ')'
          end
          else
          if DataTypeIsDateTime( Sender.Columns[I].Field.DataType ) then
          begin
             try
                if ( rc_IsValidDate( V ) ) then
                begin
                  try
                    dDate := VarToDateTime( V );
                  except
                    dDate := 0;
                  end;

                  if ( YearOf( dDate ) > 1900 ) then
                  begin
                    if lvFilter = '' then
                      lvFilter := '(' + cFieldName + ' = ' + QuotedStr( FormatDateTime( StringReplace( mm.APP_SQL_DATE_FORMAT, '.', '/', [rfReplaceAll] ), dDate ) + ' 00:00:00' ) + ')'
                    else
                      lvFilter := lvFilter + ' and (' + cFieldName + ' = ' + QuotedStr( FormatDateTime( StringReplace( mm.APP_SQL_DATE_FORMAT, '.', '/', [rfReplaceAll] ), dDate ) + ' 00:00:00' ) + ')'
                  end;
                end;
             except
             end;
          end;
        end;
      end;
    end;
    oQry.Filtered := False;//sqlSearchMaster.Filtered := False;
    if lvFilter <> '' then
    begin
      oQry.Filter := lvFilter;//sqlSearchMaster.Filter := lvFilter;
      oQry.Filtered := True;//sqlSearchMaster.Filtered := True;
    end;
  end;
end;
//8.4.0.0
function rc_DynamicBindLoad( pForm: TObject ) : boolean; // 6.0.0.0
var
   CompCount,f,i : integer;
   oObj : TUniControl;
   FieldValue, FieldValue1, FieldValue2 : Variant;
   cField, cParam1, cParam2, cHint, cTmp, cParamI, cParamE, cParamB, cDS : string;
   bVisible : boolean;
   oDS : TDataSource;
   vChecked, vUnchecked : variant;
   cItemValues : string;
begin
  try
     CompCount := TComponent(pForm).ComponentCount;
     for i := 0 to CompCount - 1 do
     begin
        //7.0.0.0
        if TComponent(pForm).Components[ I ].Name = 'ExportarpraEXCEL1' then
           cTmp := cTmp;
      //8.0.0.2
      If rc_CanRender( TUniControl( TComponent( pForm ).Components[I] ) ) then
//       If ( Pos( 'TAction' , TComponent( pForm ).Components[I].ClassName ) = 0 ) and
//          ( Pos( 'THelp' , TComponent( pForm ).Components[I].ClassName ) = 0 ) then
       begin
          oObj := TUniControl( TComponent(pForm).Components[i] );
          If ( GetPropInfo( oObj.ClassInfo, 'Hint') <> nil ) then
          begin
             if ( Pos( 'TUniMenuItem' , TComponent(pForm).Components[I].ClassName ) > 0 ) then
                cHint := TMenuItem(oObj).Hint
             else
                 cHint := oObj.Hint;
             cTmp := rc_GetHintAttr( 'bind:', cHint );
             if cTmp <> '' then
             begin
               cDS   := lowercase( rc_GetHintAttr( 'ds:', cHint, true, false, true ) ); //7.5.0.3 lowercase
               cField := Copy( cTmp, 1, Pos( ' ', cTmp ) - 1 );
               vChecked := rc_GetHintAttr( 'y:', cHint, true );
               vUnChecked := rc_GetHintAttr( 'n:', cHint, true );
               cItemValues := rc_GetHintAttr( 'values:', cHint, true );
               if cItemValues <> '' then
                  cItemValues := cItemValues + ',';
               if ( cDS.IsEmpty ) then
                  cDS := 'dsmaster';
               oDS := TDataSource( TComponent( pForm ).FindComponent( cDS ) );
               if oDS <> nil then
               begin
                  if ( Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunidbedit' ) > 0 ) and ( Copy( lowercase( TUniDBEdit( oObj ).Name ),1, 5 ) = 'edlkp' ) then
                  begin
                     dm_rc.rc_SetLookUpTag( TUniDBEdit( oObj ) , oDS.DataSet.FieldByName( cField ).Value );
                     dm_rc.rc_LookUpUpdateData( pForm, TUniDBEdit( oObj ) );
                  end
                  else
                  if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tuniedit' ) > 0 then
                     TUniEdit( oObj ).Text := oDS.DataSet.FieldByName( cField ).Value
                  else
                  if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunimemo' ) > 0 then
                  begin
                     TUniMemo( oObj ).Lines.Clear;
                     TUniMemo( oObj ).Lines.Text := oDS.DataSet.FieldByName( cField ).Value;
                  end
                  else
                  if ( Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tuniformattednumberedit' ) > 0 ) or
                     ( Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tuninumberedit' ) > 0 ) or
                     ( Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunispinedit' ) > 0 ) then
                     TUniFormattedNumberEdit( oObj ).Value := oDS.DataSet.FieldByName( cField ).Value
                  else
                  if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunidatetimepicker' ) > 0 then
                     TUniDateTimePicker( oObj ).DateTime := oDS.DataSet.FieldByName( cField ).Value
                  else
                  if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunicheckbox' ) > 0 then
                     TUniCheckBox( oObj ).Checked := varIIF( oDS.DataSet.FieldByName( cField ).AsString = vChecked, true, false )
                  else
                  if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tuniradiogroup' ) > 0 then
                  begin
                     for f := 0 to TUniRadioGroup( oObj ).Items.Count - 1 do
                     begin
                        cTmp := Copy( cItemValues, 1, Pos( ',', cItemValues ) - 1 );
                        cItemValues := StringReplace( cItemValues, cTmp + ',', '', [rfReplaceAll] );
                        if oDS.DataSet.FieldByName( cField ).AsString = cTmp then
                        begin
                           TUniRadioGroup( oObj ).ItemIndex := f;
                           Break;
                        end;
                     end;
                  end
                  else
                  if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunicombobox' ) > 0 then
                  begin
                     for f := 0 to TUniComboBox( oObj ).Items.Count - 1 do
                     begin
                        cTmp := Copy( cItemValues, 1, Pos( ',', cItemValues ) - 1 );
                        cItemValues := StringReplace( cItemValues, cTmp + ',', '', [rfReplaceAll] );
                        if oDS.DataSet.FieldByName( cField ).AsString = cTmp then
                        begin
                           TUniComboBox( oObj ).ItemIndex := f;
                           Break;
                        end;
                     end;
                  end;
               end
               else
               begin
                    Result := false;
                    dm_rc.rc_ShowSweetAlertWarning( 'rc_DynamicBindLoad: DataSource ' + cDS + ' not found!' );
               end;
             end;
          end;
          Result := true;
       end;
     end;
  except on e:exception do
         begin
            Result := false;
            dm_rc.rc_ShowError( 'rc_DynamicBindLoad:' + #13#10 + #13#10 + e.Message );
         end;
  end;
end;
//8.4.0.0
function rc_DynamicBindSave( pForm: TObject ) : boolean ; // 6.0.0.0
var
   CompCount,c,f,i : integer;
   oObj : TUniControl;
   FieldValue, FieldValue1, FieldValue2 : Variant;
   cField, cParam1, cParam2, cHint, cTmp, cParamI, cParamE, cParamB, cDS : string;
   bVisible : boolean;
   oDS : TDataSource;
   oDataSet : TDataSet;
   oFieldType : TFieldType;
   vChecked, vUnchecked : variant;
   cItemValues : string;
begin
  try
     CompCount := TComponent(pForm).ComponentCount;
     for i := 0 to CompCount - 1 do
     begin
       // thanks to feedback: SANTIAGO from Angentina
       If ( Pos( 'TAction' , TComponent( pForm ).Components[I].ClassName ) = 0 ) and
          ( Pos( 'THelp' , TComponent( pForm ).Components[I].ClassName ) = 0 ) then
       begin
          oObj := TUniControl( TComponent(pForm).Components[i] );
          If ( GetPropInfo( oObj.ClassInfo, 'Hint') <> nil ) then
          begin
             if ( Pos( 'TUniMenuItem' , TComponent(pForm).Components[I].ClassName ) > 0 ) then
                cHint := TMenuItem(oObj).Hint
             else
                 cHint := oObj.Hint;
             cTmp := rc_GetHintAttr( 'bind:', cHint );
             if cTmp <> '' then
             begin
               cDS   := lowercase( rc_GetHintAttr( 'ds:', cHint, true, false, true ) ); //7.5.0.3 lowercase
               cField := Copy( cTmp, 1, Pos( ' ', cTmp ) - 1 );
               vChecked := rc_GetHintAttr( 'y:', cHint, true );
               vUnChecked := rc_GetHintAttr( 'n:', cHint, true );
               cItemValues := rc_GetHintAttr( 'values:', cHint, true );
               if cItemValues <> '' then
                  cItemValues := cItemValues + ',';
               if ( cDS.IsEmpty ) then
                  cDS := 'dsmaster';
               oDS := TDataSource( TComponent( pForm ).FindComponent( cDS ) );
               if oDS <> nil then
               begin
                  oDataSet := TDataSet( oDs.DataSet );
                  oDataSet.Edit;
                  oFieldType := oDataSet.FieldByName( cField ).DataType;
                  if ( Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunidbedit' ) > 0 ) and ( Copy( lowercase( TUniDBEdit( oObj ).Name ),1, 5 ) = 'edlkp' ) then
                  begin
                     if DataTypeIsInt( oFieldType ) then
                        oDataSet.FieldByName( cField ).AsInteger := dm_rc.rc_GetLookUpTag( TUniDBEdit( oObj ) , lktInteger )
                     else
                     if DataTypeIsBigInt( oFieldType ) then
                        oDataSet.FieldByName( cField ).AsLargeInt := dm_rc.rc_GetLookUpTag( TUniDBEdit( oObj ) , lktInt64 )
                     else
                     if DataTypeIsString( oFieldType ) then
                        oDataSet.FieldByName( cField ).AsString := dm_rc.rc_GetLookUpTag( TUniDBEdit( oObj ) , lktString )
                     else
                     if DataTypeIsDateTime( oFieldType ) then
                        oDataSet.FieldByName( cField ).AsDateTime := dm_rc.rc_GetLookUpTag( TUniDBEdit( oObj ) , lktDateTime );
                     //dm_rc.rc_LookUpUpdateData( pForm, TUniDBEdit( oObj ) );
                  end
                  else
                  if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tuniedit' ) > 0 then
                  begin
                     //TUniEdit( oObj ).Text := oDS.DataSet.FieldByName( cField ).Value
                     if DataTypeIsInt( oFieldType ) then
                        oDataSet.FieldByName( cField ).AsInteger := StrToIntDef( TUniEdit( oObj ).Text, 0 )
                     else
                     if DataTypeIsBigInt( oFieldType ) then
                        oDataSet.FieldByName( cField ).AsLargeInt := StrToInt64Def( TUniEdit( oObj ).Text, 0 )
                     else
                     if DataTypeIsString( oFieldType ) then
                        oDataSet.FieldByName( cField ).AsString := TUniEdit( oObj ).Text
                     else
                     if DataTypeIsDateTime( oFieldType ) then
                        oDataSet.FieldByName( cField ).AsDateTime := StrToDateTimeDef( TUniEdit( oObj ).Text, 0 );
                  end
                  else
                  if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunimemo' ) > 0 then
                  begin
                     //TUniMemo( oObj ).Lines.Clear;
                     oDS.DataSet.FieldByName( cField ).AsString := TUniMemo( oObj ).Lines.Text
                  end
                  else
                  if ( Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tuniformattednumberedit' ) > 0 ) or
                     ( Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tuninumberedit' ) > 0 ) or
                     ( Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunispinedit' ) > 0 ) then
                     oDS.DataSet.FieldByName( cField ).Value := TUniFormattedNumberEdit( oObj ).Value
                  else
                  if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunidatetimepicker' ) > 0 then
                     oDS.DataSet.FieldByName( cField ).Value := TUniDateTimePicker( oObj ).DateTime
                  else
                  if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunicheckbox' ) > 0 then
                     oDS.DataSet.FieldByName( cField ).Value := varIIF( TUniCheckBox( oObj ).Checked, vChecked, vUnChecked )
                  else
                  if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tuniradiogroup' ) > 0 then
                  begin
                     for f := 0 to TUniRadioGroup( oObj ).Items.Count - 1 do   // F,J,
                     begin
                        if TUniRadioGroup( oObj ).ItemIndex = f then
                        begin
                           for c := 0 to f do
                           begin
                              cTmp := Copy( cItemValues, 1, Pos( ',', cItemValues ) - 1 ); //F
                              cItemValues := StringReplace( cItemValues, cTmp + ',', '', [rfReplaceAll] ); //J,
                              oDS.DataSet.FieldByName( cField ).Value := cTmp;
                           end;
                           Break;
                        end;
                     end;
                  end
                  else
                  if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunicombobox' ) > 0 then
                  begin
                     for f := 0 to TUniComboBox( oObj ).Items.Count - 1 do
                     begin
                        if TUniComboBox( oObj ).ItemIndex = f then
                        begin
                           for c := 0 to f do
                           begin
                              cTmp := Copy( cItemValues, 1, Pos( ',', cItemValues ) - 1 ); //F
                              cItemValues := StringReplace( cItemValues, cTmp + ',', '', [rfReplaceAll] ); //J,
                              oDS.DataSet.FieldByName( cField ).Value := cTmp;
                           end;
                           Break;
                        end;
                     end;
                  end;
                  oDataSet.Post;
                  Result := true;
               end
               else
               begin
                    Result := false;
                    dm_rc.rc_ShowSweetAlertWarning( 'rc_DynamicBindSave: DataSource ' + cDS + ' not found!' );
               end;
             end;
          end;
       end;
     end;
  except on e:exception do
         begin
            Result := false;
            dm_rc.rc_ShowError( 'rc_DynamicBindSave:' + #13#10 + #13#10 + e.Message );
         end;
  end;
end;
// 6.0.0.0 ( future implementation )
//function rc_DynamicBindGetJSON( pForm: TObject ) : TJSONObject ; // 6.0.0.0
//var
//   //FDQuery : TFDQuery;
//   cFieldName, cColumnName, cColumnValue : String;
//   LJSONObject:TJsonObject;
//   q,c,f,i : integer;
//   oObj : TUniControl;
//   FieldValue, FieldValue1, FieldValue2 : Variant;
//   cField, cParam1, cParam2, cHint, cTmp, cParamI, cParamE, cParamB, cDS : string;
//   bVisible : boolean;
//   oDS : TDataSource;
//   oDataSet : TDataSet;
//   oFieldType : TFieldType;
//   vChecked, vUnchecked : variant;
//   cItemValues : string;
//begin
//  for i := 0 to TComponent(pForm).ComponentCount -1 do
//  begin
//    // thanks to feedback: SANTIAGO from Angentina
//    If ( Pos( 'TAction' , TComponent( pForm ).Components[I].ClassName ) = 0 ) and
//       ( Pos( 'THelp' , TComponent( pForm ).Components[I].ClassName ) = 0 ) then
//    begin
//       oObj := TUniControl( TComponent(pForm).Components[i] );
//       If ( GetPropInfo( oObj.ClassInfo, 'Hint') <> nil ) then
//       begin
//          if ( Pos( 'TUniMenuItem' , TComponent(pForm).Components[I].ClassName ) > 0 ) then
//             cHint := TMenuItem(oObj).Hint
//          else
//              cHint := oObj.Hint;
//          cTmp := rc_GetHintAttr( 'bind:', cHint );
//          if cTmp <> '' then
//          begin
//            cDS   := rc_GetHintAttr( 'ds:', cHint, true, false, true ).ToLower;  // 6.0.0.0
//            cField := Copy( cTmp, 1, Pos( ' ', cTmp ) - 1 );
//            vChecked := rc_GetHintAttr( 'y:', cHint, true );
//            vUnChecked := rc_GetHintAttr( 'n:', cHint, true );
//            cItemValues := rc_GetHintAttr( 'values:', cHint, true );
//            if cItemValues <> '' then
//               cItemValues := cItemValues + ',';
//            if ( cDS.IsEmpty ) then
//               cDS := 'dsmaster';
//            oDS := TDataSource( TComponent( pForm ).FindComponent( cDS ) );
//            if oDS <> nil then
//            begin
//               oDataSet := TDataSet( oDs.DataSet );
//               oDataSet.Edit;
//               oFieldType  := oDataSet.FieldByName( cField ).DataType;
//               LJSONObject := TJSONObject.Create;
//               //cColumnName := oDataSet.FieldDefs[I].Name;
//               if ( Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunidbedit' ) > 0 ) and ( Copy( lowercase( TUniDBEdit( oObj ).Name ),1, 5 ) = 'edlkp' ) then
//               begin
//                  //boolean
//                  //IF FDQuery.FieldDefs[I].Value=True then   LJSONObject.AddPair(TJSONPair.Create(TJSONString.Create( ColumnName),TJSONTrue.Create)) else
//                  //   LJSONObject.AddPair(TJSONPair.Create(TJSONString.Create( ColumnName),TJSONFalse.Create));
//                  if DataTypeIsInt( oFieldType ) then
//                     //oDataSet.FieldByName( cField ).AsInteger := dm_rc.rc_GetLookUpTag( TUniDBEdit( oObj ) , lktInteger )
//                     //LJSONObject.AddPair( TJSONPair.Create( TJSONString.Create( cField ), TJSONNumber.Create( dm_rc.rc_GetLookUpTag( TUniDBEdit( oObj ) , lktInteger ) ) ) );
//                     LJSONObject.AddPair( TJSONPair.Create( TJSONString.Create( cField ),TJSONString.Create( dm_rc.rc_GetLookUpTag( TUniDBEdit( oObj ) , lktInteger ) ) ) )
//                  else
//                  if DataTypeIsBigInt( oFieldType ) then
//                     oDataSet.FieldByName( cField ).AsLargeInt := dm_rc.rc_GetLookUpTag( TUniDBEdit( oObj ) , lktInt64 )
//                  else
//                  if DataTypeIsString( oFieldType ) then
//                     oDataSet.FieldByName( cField ).AsString := dm_rc.rc_GetLookUpTag( TUniDBEdit( oObj ) , lktString )
//                  else
//                  if DataTypeIsDateTime( oFieldType ) then
//                     oDataSet.FieldByName( cField ).AsDateTime := dm_rc.rc_GetLookUpTag( TUniDBEdit( oObj ) , lktDateTime );
//                  //dm_rc.rc_LookUpUpdateData( pForm, TUniDBEdit( oObj ) );
//               end
//               else
//               if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tuniedit' ) > 0 then
//               begin
//                  //TUniEdit( oObj ).Text := oDS.DataSet.FieldByName( cField ).Value
//                  if DataTypeIsInt( oFieldType ) then
//                     oDataSet.FieldByName( cField ).AsInteger := StrToIntDef( TUniEdit( oObj ).Text, 0 )
//                  else
//                  if DataTypeIsBigInt( oFieldType ) then
//                     oDataSet.FieldByName( cField ).AsLargeInt := StrToInt64Def( TUniEdit( oObj ).Text, 0 )
//                  else
//                  if DataTypeIsString( oFieldType ) then
//                     oDataSet.FieldByName( cField ).AsString := TUniEdit( oObj ).Text
//                  else
//                  if DataTypeIsDateTime( oFieldType ) then
//                     oDataSet.FieldByName( cField ).AsDateTime := StrToDateTimeDef( TUniEdit( oObj ).Text, 0 );
//               end
//               else
//               if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunimemo' ) > 0 then
//               begin
//                  //TUniMemo( oObj ).Lines.Clear;
//                  oDS.DataSet.FieldByName( cField ).AsString := TUniMemo( oObj ).Lines.Text
//               end
//               else
//               if ( Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tuniformattednumberedit' ) > 0 ) or
//                  ( Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tuninumberedit' ) > 0 ) or
//                  ( Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunispinedit' ) > 0 ) then
//                  oDS.DataSet.FieldByName( cField ).Value := TUniFormattedNumberEdit( oObj ).Value
//               else
//               if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunidatetimepicker' ) > 0 then
//                  oDS.DataSet.FieldByName( cField ).Value := TUniDateTimePicker( oObj ).DateTime
//               else
//               if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunicheckbox' ) > 0 then
//                  oDS.DataSet.FieldByName( cField ).Value := varIIF( TUniCheckBox( oObj ).Checked, vChecked, vUnChecked )
//               else
//               if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tuniradiogroup' ) > 0 then
//               begin
//                  for f := 0 to TUniRadioGroup( oObj ).Items.Count - 1 do   // F,J,
//                  begin
//                     if TUniRadioGroup( oObj ).ItemIndex = f then
//                     begin
//                        for c := 0 to f do
//                        begin
//                           cTmp := Copy( cItemValues, 1, Pos( ',', cItemValues ) - 1 ); //F
//                           cItemValues := StringReplace( cItemValues, cTmp + ',', '', [rfReplaceAll] ); //J,
//                           oDS.DataSet.FieldByName( cField ).Value := cTmp;
//                        end;
//                        Break;
//                     end;
//                  end;
//               end
//               else
//               if Pos( lowercase( oObj.ClassName ) {7.5.0.3 lowercase}, 'tunicombobox' ) > 0 then
//               begin
//                  for f := 0 to TUniComboBox( oObj ).Items.Count - 1 do
//                  begin
//                     if TUniComboBox( oObj ).ItemIndex = f then
//                     begin
//                        for c := 0 to f do
//                        begin
//                           cTmp := Copy( cItemValues, 1, Pos( ',', cItemValues ) - 1 ); //F
//                           cItemValues := StringReplace( cItemValues, cTmp + ',', '', [rfReplaceAll] ); //J,
//                           oDS.DataSet.FieldByName( cField ).Value := cTmp;
//                        end;
//                        Break;
//                     end;
//                  end;
//               end;
//               oDataSet.Post;
//               Result := LJSONObject;
//            end
//            else
//            begin
//                 Result := LJSONObject;
//                 dm_rc.rc_ShowSweetAlertWarning( 'rc_DynamicBindGetJSON: DataSource ' + cDS + ' not found!' );
//            end;
//          end;
//       end;
//    end;
//  end;
//end;
// 6.0.0.0
function rc_Locate( pGrid:TUniDBGrid; pDataSet:TDataSet; pAKeyFields:string; pAKeyValues:Variant; pAOptions:TLocateOption; pUpdatePaginator:boolean=true ) : boolean;
var
   bFound : boolean;
begin
  if not pGrid.DataSource.DataSet.Active then
     pGrid.DataSource.DataSet.Active := true;
  bFound := pDataSet.Locate( pAKeyFields, pAKeyValues, [pAOptions]);
  if ( Length( pAKeyValues ) >= 3 ) and ( not bFound ) then
     pGrid.DataSource.DataSet.Active := false;
  if pUpdatePaginator then
  begin
     dm_rc.rc_GridPaginatorNext( pGrid, true );
  end;
// for future implementarion
// do not work properly when page changes
// find a way to put an "ExtJs..Load..event"
//
//  pGrid.JSInterface.JSCode( '$("#'+ pGrid.JSId +'").unmark'+
//                            '  ({ '+
//                            '    done: function() {'+
//////                            '                      $("#'+ pGrid.JSId +'").mark("' + pAKeyValues + '", {caseSensitive: false, accuracy: "partially", className: "x-grid-row"});'+
//                            '                      $("#'+ pGrid.JSId +'").mark("' + pAKeyValues + '", {caseSensitive: false, accuracy: "partially", exclude:["x-column-header-text"]});'+
//                            '                     }'+
//                            '  });');
end;
// 7.0.0.1
procedure rc_DSReactiveCheck(pForm: TObject; pDS:TDataSource );
var
   CompCount,i : integer;
   oObj : TUniControl;
   FieldValue, FieldValue1, FieldValue2 : Variant;

   cField, cParam1, cParam2, cHint, cTmp, cTmp2, cParamI, cParamE, cParamB, cDS : string;
   bVisible : boolean;
   oGrid : TUniDBGrid;
   bResize, bBoolean : boolean;
   oDM : TDataModule;
begin
  bVisible := false;
  bResize  := false;
  oDM      := nil; //7.0.0.0
  CompCount := TComponent(pForm).ComponentCount;
  for i := 0 to CompCount - 1 do
  begin
     //7.0.0.0
     if TComponent(pForm).Components[ I ].Name = 'ExportarpraEXCEL1' then
        cTmp := cTmp;
    // thanks to feedback: SANTIAGO from Angentina
    If ( Pos( 'TAction' , TComponent( pForm ).Components[I].ClassName ) = 0 ) and
       ( Pos( 'THelp' , TComponent( pForm ).Components[I].ClassName ) = 0 ) then
    begin
       if TComponent(pForm).Components[i] is TUniDBGrid then
          cTmp := cTmp;

       oObj := TUniControl( TComponent(pForm).Components[i] );
       If ( pDS <> nil ) and ( GetPropInfo( oObj.ClassInfo, 'Hint') <> nil ) then
       begin
          // 6.0.0.0
          if ( Pos( 'TUniMenuItem' , TComponent(pForm).Components[I].ClassName ) > 0 ) then
             cHint := TMenuItem(oObj).Hint
          else
              cHint := oObj.Hint;

          if not cHint.IsEmpty then
          begin
            //6.1.0.0
            if Pos( ' ds:', cHint ) > 0 then
            begin
               cDS   := lowercase( rc_GetHintAttr( 'ds:', cHint, true, false, true ) ); //7.5.0.3 lowercase
               If Pos( '.', cDS ) > 0 then
               begin
                   oDM := nil;
                   oDM := dm_rc.rc_FindDataModule( Copy( cDS, 1, pos( '.', cDS ) - 1 ) );
                   cTmp := Copy( cDS, pos( '.', cDS ) + 1 );
               end;
               if oDM <> nil then
                  pDS  := TDataSource( oDM.FindComponent( cTmp ) )
               else
                  pDS  := TDataSource( TComponent( TComponent( pForm ) ).FindComponent( cDS ) );
            end
            else
            //7.0.0.0 thanks for BugTracker Mr.Javier
            begin
               cDS := 'dsmaster';
               pDS  := TDataSource( TComponent( TComponent( pForm ) ).FindComponent( cDS ) );
            end;
            //7.0.0.0
            //if Pos( lowercase( pDS.Name ), cDS ) > 0 then //if ( cDS = lowercase( pDS.Name ) ) then //6.1.0.0
            if ( pDS <> nil ) and ( Pos( lowercase( pDS.Name ), cDS ) > 0 ) then
            begin
               //readonly
               cTmp := rc_GetHintAttr( 'state-readonly:', cHint );
               if ( cTmp <> '' ) then
               begin
                  if ( pDS.State = dsInsert ) then
                  begin
                       bBoolean := Pos( 'i-true', cTmp ) > 0 ;
                       if not bBoolean then
                          bBoolean := not Pos( 'i-false', cTmp ) > 0 ;
                  end
                  else
                  if ( pDS.State = dsEdit ) then
                  begin
                       bBoolean := Pos( 'e-true', cTmp ) > 0 ;
                       if not bBoolean then
                          bBoolean := not Pos( 'e-false', cTmp ) > 0 ; //
                  end
                  else
                  if ( pDS.State = dsBrowse ) then
                  begin
                       bBoolean := Pos( 'b-true', cTmp ) > 0 ;
                       if not bBoolean then
                          bBoolean := not Pos( 'b-false', cTmp ) > 0 ; //

                       if ( pDS.DataSet.Bof ) and ( Pos( 'bof-false', cTmp ) > 0 ) then
                          bBoolean := false
                       else
                       if ( pDS.DataSet.Eof ) and ( Pos( 'eof-false', cTmp ) > 0 ) then
                          bBoolean := false;
                  end;
                  //empty
                  if ( not ( pDS.State in [dsEdit , dsInsert] ) ) and ( Pos( 'empty-', cTmp ) > 0 ) then
                  begin
                     if ( pDS.DataSet.IsEmpty ) then
                        bBoolean := ( pDS.DataSet.Bof ) and ( Pos( 'empty-true', cTmp ) > 0 )
                     else
                        bBoolean := ( pDS.DataSet.Bof ) and ( Pos( 'empty-false', cTmp ) > 0 ) ;
                  end;

                  if oObj is TUniEdit then
                     TUniEdit( oObj ).ReadOnly := bBoolean
                  else
                  if oObj is TUniDBEdit then
                     TUniDBEdit( oObj ).ReadOnly := bBoolean
                  else
                  if oObj is TUniDateTimePicker then
                     TUniDateTimePicker( oObj ).ReadOnly := bBoolean
                  else
                  if oObj is TUniDBDateTimePicker then
                     TUniDBDateTimePicker( oObj ).ReadOnly := bBoolean
                  else
                  if oObj is TUniCheckBox then
                     TUniCheckBox( oObj ).ReadOnly := bBoolean
                  else
                  if oObj is TUniDBCheckBox then
                     TUniDBCheckBox( oObj ).ReadOnly := bBoolean
                  else
                  if oObj is TUniComboBox then
                     TUniComboBox( oObj ).ReadOnly := bBoolean
                  else
                  if oObj is TUniDBComboBox then
                     TUniDBComboBox( oObj ).ReadOnly := bBoolean
                  else
                  if oObj is TUniMemo then
                     TUniMemo( oObj ).ReadOnly := bBoolean
                  else
                  if oObj is TUniDBMemo then
                     TUniDBMemo( oObj ).ReadOnly := bBoolean
                  else
                  if oObj is TUniDBLookupComboBox then
                     TUniDBLookupComboBox( oObj ).ReadOnly := bBoolean
                  else
                  if oObj is TUniNumberEdit then
                     TUniNumberEdit( oObj ).ReadOnly := bBoolean
                  else
                  if oObj is TUniDBNumberEdit then
                     TUniDBNumberEdit( oObj ).ReadOnly := bBoolean
                  else
                  if oObj is TUniFormattedNumberEdit then
                     TUniFormattedNumberEdit( oObj ).ReadOnly := bBoolean
                  else
                  if oObj is TUniDBFormattedNumberEdit then
                     TUniDBFormattedNumberEdit( oObj ).ReadOnly := bBoolean;
               end;
               //visible
               // 6.0.0.0
               cTmp := rc_GetHintAttr( 'state-visible:', cHint );
               if ( cTmp <> '' ) then //and ( cDS = lowercase( pDS.Name ) ) then
               begin
                  if lowercase(Copy( TUniControl( oObj ).Name, 1, 7 )) = 'rcblock' then // 6.0.0.0
                     bVisible := oObj.Visible;

                  if lowercase(TUniControl( oObj ).Name) = 'rcblock300' then
                     bVisible := bVisible;

                  if ( pDS.State = dsInsert ) then
                  begin
                       if ( Pos( 'i-true', cTmp ) > 0 ) then
                          //oObj.Visible := True
                          rc_ObjectVisible( pForm, oObj, true, true ) //7.0.0.0
                       else
                       if ( Pos( 'i-false', cTmp ) > 0 ) then
                          //oObj.Visible := False;
                          rc_ObjectVisible( pForm, oObj, false, true ); //7.0.0.0
                  end
                  else
                  if ( pDS.State = dsEdit ) then
                  begin
                       if ( Pos( 'e-true', cTmp ) > 0 ) then
                          //oObj.Visible := True
                          rc_ObjectVisible( pForm, oObj, true, true ) //7.0.0.0
                       else
                       if ( Pos( 'e-false', cTmp ) > 0 ) then
                          //oObj.Visible := False;
                          rc_ObjectVisible( pForm, oObj, false, true ); //7.0.0.0
                  end
                  else
                  if ( pDS.State = dsBrowse ) then
                  begin
                       if ( Pos( 'b-true', cTmp ) > 0 ) then
                          //oObj.Visible := True
                          rc_ObjectVisible( pForm, oObj, true, true ) //7.0.0.0
                       else
                       if ( Pos( 'b-false', cTmp ) > 0 ) then
                          //oObj.Visible := False;
                          rc_ObjectVisible( pForm, oObj, false, true ); //7.0.0.0
                  end;
                  //[PT] empty-true : se estiver vazio, visible = true | empty-false : se estiver vazio, visible = true
                  //[EN] empty-true : if empty, visible = true | empty-false : if empty, visible = true
                  if ( Pos( 'empty-', cTmp ) > 0 ) then
                  begin
//                     if ( pDS.DataSet.IsEmpty ) then
//                        //oObj.Visible := ( Pos( 'empty-true', cTmp ) > 0 )
//                        rc_ObjectVisible( pForm, oObj, ( Pos( 'empty-true', cTmp ) > 0 ), true ) //7.0.0.0
//                     else
//                        //oObj.Visible := ( Pos( 'empty-false', cTmp ) > 0 );
//                        rc_ObjectVisible( pForm, oObj, ( Pos( 'empty-false', cTmp ) > 0 ), true ); //7.0.0.0
                     if ( pDS.DataSet.IsEmpty ) then
                     begin
                        if ( Pos( 'empty-true', cTmp ) > 0 ) then
                           rc_ObjectVisible( pForm, oObj, true, true ) //7.0.0.0
                        else
                        if ( Pos( 'empty-false', cTmp ) > 0 ) then
                           rc_ObjectVisible( pForm, oObj, false, true ) //7.0.0.0
                     end
                     else
                     begin
                        if ( Pos( 'empty-true', cTmp ) > 0 ) then
                           rc_ObjectVisible( pForm, oObj, false, true )
                        else
                        if ( Pos( 'empty-false', cTmp ) > 0 ) then
                           rc_ObjectVisible( pForm, oObj, true, true ); //7.0.0.0
                     end;
                  end;
                  //8.0.0.0
                  if ( Pos( 'hide:mobile-v', TUniControl( oObj ).Hint ) > 0 ) and ( dm_rc.bMobile_Screen_Portrait ) then
                     bVisible := False
                  else
                  if ( Pos( 'hide:mobile-h', TUniControl( oObj ).Hint ) > 0 ) and ( dm_rc.bMobile_Screen_Landscape ) then
                     bVisible := False
                  else
                  if ( ( Pos( 'hide:mobile', TUniControl( oObj ).Hint ) > 0 ) and (  Pos( 'hide:mobile-', TUniControl( oObj ).Hint ) = 0 ) ) and ( dm_rc.bMobile_Screen ) then
                    bVisible := False
                  else
                  if ( Pos( 'hide:desktop', TUniControl( oObj ).Hint ) > 0 ) and ( not dm_rc.bMobile_Screen ) then
                    bVisible := False;
                  // 6.0.0.0
                  if oObj.Visible then
                     oObj.Hint := rc_AddHintAttr( '|rc-state-visible:true', oObj.Hint , true )
                  else
                     oObj.Hint := rc_AddHintAttr( '|rc-state-visible:false', oObj.Hint , true );

                  if ( lowercase(Copy( TUniControl( oObj ).Name, 1, 7 )) = 'rcblock' ) and // 6.0.0.0
                     ( bVisible <> oObj.Visible ) then
                  begin
                     //7.0.0.0
                     //oObj.Enabled := oObj.Visible;
                     rc_ObjectEnabled( pForm, oObj, oObj.Visible, true ); //7.0.0.0
                     bResize  := true;//dm_rc.rc_ResizeBlocks( pForm ); //7.0.0.1
                  end;
               end;
               //enable
               cTmp := rc_GetHintAttr( 'state-enable:', cHint );
               if ( cTmp <> '' ) and ( not bResize ) then
               begin
                  if ( pDS.State = dsInsert ) then
                  begin
                       bBoolean := Pos( 'i-true', cTmp ) > 0 ;
                       if not bBoolean then
                          bBoolean := not Pos( 'i-false', cTmp ) > 0 ;

                       rc_ObjectEnabled( pForm, oObj, bBoolean , true ); //7.0.0.1
                  end
                  else
                  if ( pDS.State = dsEdit ) then
                  begin
                       bBoolean := Pos( 'e-true', cTmp ) > 0 ;
                       if not bBoolean then
                          bBoolean := not Pos( 'e-false', cTmp ) > 0 ; //

                       rc_ObjectEnabled( pForm, oObj, bBoolean , true ); //7.0.0.1
                  end
                  else
                  if ( pDS.State = dsBrowse ) then
                  begin
                       bBoolean := Pos( 'b-true', cTmp ) > 0 ;
                       if not bBoolean then
                          bBoolean := not Pos( 'b-false', cTmp ) > 0 ; //

                       if ( pDS.DataSet.Bof ) and ( Pos( 'bof-false', cTmp ) > 0 ) then
                          bBoolean := false
                       else
                       if ( pDS.DataSet.Eof ) and ( Pos( 'eof-false', cTmp ) > 0 ) then
                          bBoolean := false;

                       rc_ObjectEnabled( pForm, oObj, bBoolean, true ); //7.0.0.1
                  end;
                  //empty
                  if ( not ( pDS.State in [dsEdit , dsInsert] ) ) and ( Pos( 'empty-', cTmp ) > 0 ) then
                  begin
                     if ( pDS.DataSet.IsEmpty ) then
                        rc_ObjectEnabled( pForm, oObj, ( Pos( 'empty-true', cTmp ) > 0 ), true ) //7.0.0.1
                     else
                        rc_ObjectEnabled( pForm, oObj, ( Pos( 'empty-false', cTmp ) > 0 ), true ); //7.0.0.1
                  end;
               end;
               //color
               cTmp := rc_GetHintAttr( 'state-color:', cHint );
               if ( cTmp <> '' ) then
               begin
                  if ( pDS.State = dsInsert ) then
                  begin
                       cParamI := rc_GetHintAttr( 'i-', cTmp, true ) + ' ';
                       cParamI := Copy( cParamI, 1, Pos( ' ', cParamI ) - 1 );
                       If ( cParamI <> '' ) then
                          TUniControl( oObj ).Color := StringToColor( cParamI );
                  end
                  else
                  if ( pDS.State = dsEdit ) then
                  begin
                       cParamE := rc_GetHintAttr( 'e-', cTmp, true ) + ' ';
                       cParamE := Copy( cParamE, 1, Pos( ' ', cParamE ) - 1 );
                       If ( cParamE <> '' ) then
                          TUniControl( oObj ).Color := StringToColor( cParamE );
                  end
                  else
                  if ( pDS.State = dsBrowse ) then
                  begin
                       cParamB := rc_GetHintAttr( 'b-', cTmp, true ) + ' ';
                       cParamB := Copy( cParamB, 1, Pos( ' ', cParamB ) - 1 );
                       If ( cParamB <> '' ) then
                          TUniControl( oObj ).Color := StringToColor( cParamB );
                  end;
                  //empty
                  if ( not ( pDS.State in [dsEdit , dsInsert] ) ) and ( Pos( 'empty-', cTmp ) > 0 ) then
                  begin
                     if ( pDS.DataSet.IsEmpty ) then
                     begin
                        cParamB := rc_GetHintAttr( 'empty-', cTmp, true ) + ' ';
                        cParamB := Copy( cParamB, 1, Pos( ' ', cParamB ) - 1 );
                        If ( cParamB <> '' ) then
                           TUniControl( oObj ).Color := StringToColor( cParamB );
                     end;
                  end;
               end;
               //font-color

               cTmp := rc_GetHintAttr( 'state-font-color:', cHint );
               if ( cTmp <> '' ) then
               begin
                  if ( pDS.State = dsInsert ) then
                  begin
                       cParamI := rc_GetHintAttr( 'i-', cTmp, true ) + ' ';
                       cParamI := Copy( cParamI, 1, Pos( ' ', cParamI ) - 1 );
                       If ( cParamI <> '' ) then
                       begin
                          if oObj is TUniLabel then
                             TUniLabel( oObj ).Font.Color := StringToColor( cParamI )
                          else
                          if oObj is TUniEdit then
                             TUniEdit( oObj ).Font.Color := StringToColor( cParamI )
                          else
                          if oObj is TUniDBEdit then
                             TUniDBEdit( oObj ).Font.Color := StringToColor( cParamI );
                       end;
                  end
                  else
                  if ( pDS.State = dsEdit ) then
                  begin
                       cParamE := rc_GetHintAttr( 'e-', cTmp, true ) + ' ';
                       cParamE := Copy( cParamE, 1, Pos( ' ', cParamE ) - 1 );
                       If ( cParamE <> '' ) then
                       begin
                          if oObj is TUniLabel then
                             TUniLabel( oObj ).Font.Color := StringToColor( cParamE )
                          else
                          if oObj is TUniEdit then
                             TUniEdit( oObj ).Font.Color := StringToColor( cParamE )
                          else
                          if oObj is TUniDBEdit then
                             TUniDBEdit( oObj ).Font.Color := StringToColor( cParamE );
                       end;
                  end
                  else
                  if ( pDS.State = dsBrowse ) then
                  begin
                       // paginator ?
                       if Pos( Copy( TUniLabel( oObj ).Name, 1, Pos ( '_', TUniLabel( oObj ).Name )-1 ), ' labPageFirst labPagePrior labPageNext labPageLast' ) > 0  then
                       begin
                            oGrid := TUniDBGrid( TComponent(pForm).FindComponent( Copy( TUniLabel( oObj ).Name, Pos ( '_', TUniLabel( oObj ).Name ) + 1 ) ) );
                            if oGrid <> nil then
                               dm_rc.rc_GridPaginatorUpdateControls( oGrid , -1, -1 );
                       end
                       else
                       begin
                          cParamB := rc_GetHintAttr( 'b-', cTmp, true ) + ' ';
                          cParamB := Copy( cParamB, 1, Pos( ' ', cParamB ) - 1 );
                          If ( cParamB <> '' ) then
                             if oObj is TUniLabel then
                                TUniLabel( oObj ).Font.Color := StringToColor( cParamB )
                             else
                             if oObj is TUniEdit then
                                TUniEdit( oObj ).Font.Color := StringToColor( cParamB )
                             else
                             if oObj is TUniDBEdit then
                                TUniDBEdit( oObj ).Font.Color := StringToColor( cParamB );

                          if ( pDS.DataSet.Bof ) and ( Pos( 'bof-', cTmp ) > 0 ) then
                          begin
                             cParamB := rc_GetHintAttr( 'bof-', cTmp, true ) + ' ';
                             cParamB := Copy( cParamB, 1, Pos( ' ', cParamB ) - 1 );
                             If ( cParamB <> '' ) then
                                if oObj is TUniLabel then
                                   TUniLabel( oObj ).Font.Color := StringToColor( cParamB )
                                else
                                if oObj is TUniEdit then
                                   TUniEdit( oObj ).Font.Color := StringToColor( cParamB )
                                else
                                if oObj is TUniDBEdit then
                                   TUniDBEdit( oObj ).Font.Color := StringToColor( cParamB );
                          end
                          else
                          if ( pDS.DataSet.Eof ) and ( Pos( 'eof-', cTmp ) > 0 ) then
                          begin
                             cParamB := rc_GetHintAttr( 'eof-', cTmp, true ) + ' ';
                             cParamB := Copy( cParamB, 1, Pos( ' ', cParamB ) - 1 );
                             If ( cParamB <> '' ) then
                                if oObj is TUniLabel then
                                   TUniLabel( oObj ).Font.Color := StringToColor( cParamB )
                                else
                                if oObj is TUniEdit then
                                   TUniEdit( oObj ).Font.Color := StringToColor( cParamB )
                                else
                                if oObj is TUniDBEdit then
                                   TUniDBEdit( oObj ).Font.Color := StringToColor( cParamB );
                          end;
                       end;
                  end;
                  //empty
                  if ( not ( pDS.State in [dsEdit , dsInsert] ) ) and ( Pos( 'empty-', cTmp ) > 0 ) then
                     if ( pDS.DataSet.IsEmpty ) then
                     begin
                        cParamB := rc_GetHintAttr( 'empty-', cTmp, true ) + ' ';
                        cParamB := Copy( cParamB, 1, Pos( ' ', cParamB ) - 1 );
                        If ( cParamB <> '' ) then
                        begin
                          if oObj is TUniLabel then
                             TUniLabel( oObj ).Font.Color := StringToColor( cParamB )
                          else
                          if oObj is TUniEdit then
                             TUniEdit( oObj ).Font.Color := StringToColor( cParamB )
                          else
                          if oObj is TUniDBEdit then
                             TUniDBEdit( oObj ).Font.Color := StringToColor( cParamB );
                        end;
                     end;
               end;
               //caption
               cTmp := rc_GetHintAttr( 'state-caption:', cHint );

               //if ( cTmp <> '' ) and ( cDS = lowercase( pDS.Name ) ) and ( oObj is TUniLabel ) then
               if ( cTmp <> '' ) and ( oObj is TUniLabel ) then
               begin
                  if ( pDS.State = dsInsert ) then
                  begin
                       cParamI := rc_GetHintAttr( 'i-', cTmp, true );
                       If ( cParamI <> '' ) then
                          TUniLabel( oObj ).Caption := cParamI;
                  end
                  else
                  if ( pDS.State = dsEdit ) then
                  begin
                       cParamE := rc_GetHintAttr( 'e-', cTmp, true );
                       If ( cParamE <> '' ) then
                          TUniLabel( oObj ).Caption := cParamE ;
                  end
                  else
                  if ( pDS.State = dsBrowse ) then
                  begin
                       cParamB := rc_GetHintAttr( 'b-', cTmp, true );
                       If ( cParamB <> '' ) then
                          TUniLabel( oObj ).Caption := cParamB ;
                  end;
               end;
               //cls
               cTmp := rc_GetHintAttr( 'state-cls:', cHint );
               if ( cTmp <> '' ) then //and ( cDS = lowercase( pDS.Name ) ) then
               begin
                  cParamI := rc_GetHintAttr( 'i-', cTmp, true , true) + ' ';
                  cParamI := Copy( cParamI , 1, Pos( ' ', cParamI ) - 1 );
                  cParamE := rc_GetHintAttr( 'e-', cTmp, true , true) + ' ';
                  cParamE := Copy( cParamE , 1, Pos( ' ', cParamE ) - 1 );
                  cParamB := rc_GetHintAttr( 'b-', cTmp, true , true) + ' ';
                  cParamB := Copy( cParamB , 1, Pos( ' ', cParamB ) - 1 );

                  if not cParamI.IsEmpty then rc_RemoveCssClass( oObj, cParamI );
                  if not cParamE.IsEmpty then rc_RemoveCssClass( oObj, cParamE );
                  if not cParamB.IsEmpty then rc_RemoveCssClass( oObj, cParamB );

                  if ( pDS.State = dsInsert ) then
                  begin
                       If ( cParamI <> '' ) then
                       begin
                          rc_AddCssClass( oObj, cParamI );
                       end;
                  end
                  else
                  if ( pDS.State = dsEdit ) then
                  begin
                       If ( cParamE <> '' ) then
                       begin
                          rc_AddCssClass( oObj, cParamE );
                       end;
                  end
                  else
                  if ( pDS.State = dsBrowse ) then
                  begin
                       If ( cParamB <> '' ) then
                       begin
                          rc_AddCssClass( oObj, cParamB );
                       end;
                  end;
               end;
               //field-cls:bloqueado value-F:ButtonWhite value-J:ButtonThemeCrud ds:dsMaster|
               //field-ico:bloqueado value-F:fas-paper-plane  value-J:far-paper-plane ds:dsMaster|
               //field-cls-ico:bloqueado value-F:font-black  value-J: ds:dsMaster|
               // field-cls
               cTmp := rc_GetHintAttr( 'field-cls:', cHint );

               if ( cTmp <> '' ) and ( pDS.DataSet.active ) then
               begin

                  if Pos( ' ds:', cTmp ) > 0 then
                     cTmp := Copy( cTmp, 1, Pos( ' ds:', cTmp ) - 1 );

                  cField     := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                  if pDS.DataSet.FindField( cField ) <> nil then
                  begin
                     FieldValue := pDS.DataSet.FieldByName( cField ).Value;
                     cTmp       := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );

                     FieldValue1 := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                     cTmp        := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );
                     FieldValue1 := Copy( FieldValue1, 7, 2000 );
                     cParam1     := Trim( Copy( FieldValue1, Pos( ':', FieldValue1 ) +1, 2000 ) );
                     FieldValue1 := Copy( FieldValue1, 1, Pos( ':', FieldValue1 ) -1 );

                     FieldValue2 := Copy( cTmp, 7, 2000 );
                     cParam2     := Trim( Copy( FieldValue2, Pos( ':', FieldValue2 ) +1, 2000 ) );
                     FieldValue2 := Copy( FieldValue2, 1, Pos( ':', FieldValue2 ) -1 );

                     if FieldValue1 = FieldValue then
                     begin
                         rc_RemoveCssClass( oObj, cParam2 );
                         rc_AddCssClass( oObj, cParam1 );
                     end
                     else
                     begin
                        rc_RemoveCssClass( oObj, cParam1 );
                        rc_AddCssClass( oObj, cParam2 );
                     end;
                  end;
               end;
               // field-cls-ico
               cTmp := rc_GetHintAttr( 'field-cls-ico:', cHint );

               if ( cTmp <> '' ) and ( pDS.DataSet.active ) then
               begin

                  if Pos( ' ds:', cTmp ) > 0 then
                     cTmp := Copy( cTmp, 1, Pos( ' ds:', cTmp ) - 1 );

                  cField     := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                  if pDS.DataSet.FindField( cField ) <> nil then
                  begin
                     FieldValue := pDS.DataSet.FieldByName( cField ).Value;
                     cTmp       := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );

                     FieldValue1 := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                     cTmp        := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );
                     FieldValue1 := Copy( FieldValue1, 7, 2000 );
                     cParam1     := Trim( Copy( FieldValue1, Pos( ':', FieldValue1 ) +1, 2000 ) );
                     FieldValue1 := Copy( FieldValue1, 1, Pos( ':', FieldValue1 ) -1 );

                     FieldValue2 := Copy( cTmp, 7, 2000 );
                     cParam2     := Trim( Copy( FieldValue2, Pos( ':', FieldValue2 ) +1, 2000 ) );
                     FieldValue2 := Copy( FieldValue2, 1, Pos( ':', FieldValue2 ) -1 );

                     if FieldValue1 = FieldValue then
                     begin
                        rc_RemoveCssClass( oObj, cParam2 );
                        rc_AddCssClass( oObj, cParam1 );
                     end
                     else
                     begin
                        rc_RemoveCssClass( oObj, cParam1 );
                        rc_AddCssClass( oObj, cParam2 );
                     end;
                  end;
               end;
               // field-ico
               cTmp := rc_GetHintAttr( 'field-ico:', cHint );

               if ( cTmp <> '' ) and ( pDS.DataSet.active ) then
               begin

                  if Pos( ' ds:', cTmp ) > 0 then
                     cTmp := Copy( cTmp, 1, Pos( ' ds:', cTmp ) - 1 );

                  cField     := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                  if pDS.DataSet.FindField( cField ) <> nil then
                  begin
                     FieldValue := pDS.DataSet.FieldByName( cField ).Value;
                     cTmp       := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );

                     FieldValue1 := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                     cTmp        := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );
                     FieldValue1 := Copy( FieldValue1, 7, 2000 );
                     cParam1     := Trim( Copy( FieldValue1, Pos( ':', FieldValue1 ) +1, 2000 ) );
                     FieldValue1 := Copy( FieldValue1, 1, Pos( ':', FieldValue1 ) -1 );

                     FieldValue2 := Copy( cTmp, 7, 2000 );
                     cParam2     := Trim( Copy( FieldValue2, Pos( ':', FieldValue2 ) +1, 2000 ) );
                     FieldValue2 := Copy( FieldValue2, 1, Pos( ':', FieldValue2 ) -1 );

                     if FieldValue1 = FieldValue then
                     begin
                        cTmp   := oObj.Caption;
                        cField := Copy( cTmp, Pos( 'fa-', cTmp ) + 3 ) + ' ' ;
                        cField := Copy( cField, 1, Pos( ' ', cField ) - 1 );
                        if Pos( 'fa fa-', cTmp ) > 0 then
                           FieldValue1 := 'fa'
                        else
                        if Pos( 'fas fa-', cTmp ) > 0 then
                           FieldValue1 := 'fas'
                        else
                        if Pos( 'far fa-', cTmp ) > 0 then
                           FieldValue1 := 'far'
                        else
                        if Pos( 'fab fa-', cTmp ) > 0 then
                           FieldValue1 := 'fab';

                        FieldValue2 := FieldValue1 + ' fa-' + Copy( cParam2, Pos( '-', cParam2 ) + 1 );

                        cTmp := StringReplace( cTmp, FieldValue1 + ' fa-' + cField, FieldValue2, [rfReplaceAll] );
                     end
                     else
                     begin
                        cTmp   := oObj.Caption;
                        cField := Copy( cTmp, Pos( 'fa-', cTmp ) + 3 ) + ' ' ;
                        cField := Copy( cField, 1, Pos( ' ', cField ) - 1 );
                        if Pos( 'fa fa-', cTmp ) > 0 then
                           FieldValue1 := 'fa'
                        else
                        if Pos( 'fas fa-', cTmp ) > 0 then
                           FieldValue1 := 'fas'
                        else
                        if Pos( 'far fa-', cTmp ) > 0 then
                           FieldValue1 := 'far'
                        else
                        if Pos( 'fab fa-', cTmp ) > 0 then
                           FieldValue1 := 'fab';

                        FieldValue2 := FieldValue1 + ' fa-' + Copy( cParam1, Pos( '-', cParam1 ) + 1 );

                        cTmp := StringReplace( cTmp, FieldValue1 + ' fa-' + cField, FieldValue2, [rfReplaceAll] );
                     end;
                     oObj.Caption := cTmp;
                  end;
               end;
            end;
          end;
       end;
    end;
  end;
  //7.0.0.1
  if bResize then
     dm_rc.rc_ResizeBlocks( pForm, true, true, false );//8.0.0.0 do not scroll
end;
end.
