unit mkm_validate_8402; //8.0.0.0
//valid-if:dblsituacao=RESOLVIDO

interface

uses
    System.SysUtils, System.Classes , System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics, RegularExpressions,
    vcl.Controls,
    // feedback: Mesut from Turkey
    {$ifdef LINUX}
    System.UIConsts,
    {$endif}
    uconsts, uconsts_cfg,
    uniGUIBaseClasses, uniGUIClasses, uniGUITypes, uniGUIJSUtils, Vcl.forms,
    uniComboBox, uniDBComboBox,uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker,  uniListBox,
    uniBitBtn, uniButton, uniEdit, UniDBEdit, UniSpeedButton, uniGUIFrame, uniGUIForm,  uniGUIDialogs, Messages,
    uniGUIAbstractClasses,  uniGUIApplication, uniPanel, IniFiles, UniImage, uniLabel,  Unipagecontrol,
    uniMemo, uniDBMemo, uniGUIRegClasses, uniDBNavigator, uniScrollBox,
    UniDBRadioGroup, uniDBCheckBox, uniDBImage, uniDBText, uniHTMLFrame,
    FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
    FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
    FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
    FireDAC.Comp.Client;

function rc_TypeIsValid( pType : TRCValidateTypes; pContent : Variant ) : boolean;
function rc_FormValidate( pFormFrame : TObject; pOnlyParent : TComponent = nil; pClear : boolean = false ) : boolean; // 6.0.0.0
{<*RC DB}
function rc_RecordExists( pFormFrame, pObj : TObject; pShowMsg : boolean = false ) : boolean;
{RC DB*>}
function rc_CleanValidMsg( pStr : string ) : string;
//7.5.0.3
function rc_IsValidDate( pDate : Variant ) : boolean;

implementation

uses untdm_rc, str_func, mkm_func_web, MainModule, mkm_layout, mkm_createcomponents;

//7.5.0.3
function rc_IsValidDate( pDate : Variant ) : boolean;
var
   FS: TFormatSettings;
   dDt : TDateTime;
begin
    Result := false;
    case mm.varLT_Lang of
         ltpt_BR, ltpt_PT : Result := TryStrToDate( pDate , dDt);
         lten_US : begin
                     FS := TFormatSettings.Create('en-US');
                     Result := TryStrToDate( pDate , dDt, FS );
                   end;
         lten_GB : begin
                     FS := TFormatSettings.Create('en-GB');
                     Result := TryStrToDate( pDate , dDt, FS );
                   end;
         ltes_ES : Result := TryStrToDate( pDate , dDt);
         ltfr_FR : Result := TryStrToDate( pDate , dDt);
         ltde_DE : Result := TryStrToDate( pDate , dDt);
         ltit_IT : Result := TryStrToDate( pDate , dDt);
         lttr_TR : Result := TryStrToDate( pDate , dDt);
         ltru_RU : Result := TryStrToDate( pDate , dDt);
         ltzn_CH : Result := TryStrToDate( pDate , dDt);
         ltin_ID : Result := TryStrToDate( pDate , dDt);
         ltth_TH : Result := TryStrToDate( pDate , dDt);
         lthi_IN : Result := TryStrToDate( pDate , dDt);
         ltar_SA : Result := TryStrToDate( pDate , dDt);
    end;
end;

function rc_CleanValidMsg( pStr : string ) : string;
begin
     Result := StringReplace( pStr, 'not-exists=', '', [rfReplaceAll] );
     Result := StringReplace( Result, 'notblank', '', [rfReplaceAll] );
     Result := StringReplace( Result, 'blank=', '', [rfReplaceAll] );
     Result := StringReplace( Result, 'blank', '', [rfReplaceAll] );
     Result := StringReplace( Result, '<str>', '', [rfReplaceAll] );
     Result := StringReplace( Result, '<int>', '', [rfReplaceAll] );
end;
{<*RC DB}
function rc_RecordExists( pFormFrame, pObj : TObject; pShowMsg : boolean = false ) : boolean;
var
   cTable, cField, cWhere, cOrder, cAnd, cContent,
   cHint , cDS , cState, cPk, cSql : string;
   oDs : TDataSource;
   oQuery : TFDQuery;
begin
    oDs      := nil;
    oQuery   := nil;
    cTable   := '';
    cField   := '';
    cWhere   := '';
    cOrder   := '';
    cAnd     := '';
    cContent := '';
    cState   := '';
    cPk      := '';
    cHint := TUniControl(pObj).hint;
    cDS   := rc_GetHintAttr( 'ds:', cHint, true, false, true ); // 6.0.0.0
    if ( cDS.IsEmpty ) then
    begin
       cDS := 'dsmaster';
    end;
    cTable := rc_GetHintAttr( 'table:', cHint );
    if ( cTable.IsEmpty ) then
    begin
       cTable := TUniEdit( Tcomponent(pFormFrame).FindComponent( 'ed_Table_ItemSel' ) ).Text;
    end;
    cWhere := rc_GetHintAttr( 'where:', cHint );
    //8.0.0.0
    //if ( cWhere.IsEmpty ) then
    //begin
    //   cWhere := TUniEdit( Tcomponent(pFormFrame).FindComponent( 'ed_Where_Search' ) ).Text;
    //end;
    cField := rc_GetHintAttr( 'field:', cHint );
    if ( cField.IsEmpty ) then
    begin
       If GetPropInfo( pObj.ClassInfo, 'Datasource') <> nil then
       begin
          if pObj is TUniDBEdit then
          begin
             cField   := TUniDBEdit(pObj).DataField;
             cContent := TUniDBEdit(pObj).Text;
          end;
          cState := TUniEdit( Tcomponent(pFormFrame).FindComponent( 'ed_Table_Status' ) ).Text;
          cPk    := TUniEdit( Tcomponent(pFormFrame).FindComponent( 'ed_Pk' ) ).Text;
           oDS := TDataSource( Tcomponent(pFormFrame).FindComponent( cDS ) );
           if ( oDS <> nil ) and ( cDS = lowercase( oDs.Name ) )then
           begin
               oQuery := TFDQuery( Tcomponent(pFormFrame).FindComponent( oDS.DataSet.Name ) ) ;
           end;
       end;
    end
    else
    if pObj is TUniEdit then
    begin
       cContent := TUniEdit(pObj).Text;
    end;

    if Pos( 'mask:', TUniControl(pObj).Hint ) > 0 then
    begin
       cContent := StrTokenClear( cContent ) ;
    end;

    Result := false;
    //8.0.0.0
    if not ( ( cTable + cField ).IsEmpty ) then
    begin
       cContent := varIIF( Pos( 'not-exists<int>', cHint ) = 0 , QuotedStr( cContent ), cContent );
       cSql := ' select tab.' + cField +
               ' from  ' + dm_rc.rc_DBSchema + cTable + ' tab ' ;

//       cSql := cSql +
//               ' LEFT JOIN ' + dm_rc.rc_DBSchema + 'usuarios_empresa ue ' +
//               ' ON ue.codiuser = tab.codigo ' ;

       if cState = 'I' then
          cSql := cSql +
                  ' where tab.' + cField + ' = ' + cContent
       else
       if cState = 'E' then
          cSql := cSql +
                  ' where tab.' + cField + ' = ' + cContent +
                  ' and tab.' + cPk + ' <> ' + oQuery.FieldByName( cPK ).AsString;

       cSql := cSql + varIIF( cWhere <> '', ' and ' + StringReplace( cWhere, '''''', '''',[rfReplaceAll] ) , '' );
       if ( cOrder.IsEmpty ) then
          cOrder := ' tab.' + cField;
       cSql := cSql + ' order by ' + cOrder;

       if cContent <> '' then
       begin
          dm_rc.memTemp.Close;
          dm_rc.memTemp.Data := dm_rc.rc_GetRecord( mm.varB_IsNot_API ,
                                                    false,
                                                    cSql );
          if mm.varC_LastErrorMsg <> '' then
          begin
             dm_rc.rc_ShowWarning( mm.MSG_VALIDATE_INVALID_EXISTS + sLineBreak + sLineBreak +
                                   mm.varC_LastErrorMsg );
             Abort;
          end;
          Result := dm_rc.memTemp.RecordCount > 0;
       end;
    end;
end;
{RC DB*>}
//showdelphi
function IsValidEmail(const Value: string): Boolean;
  function CheckAllowed(const s: string): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 1 to Length(s) do
      if not CharInSet( s[i] , ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_', '-', '.'] ) then
        Exit;
    Result := true;
  end;
var
  i: Integer;
  NamePart, ServerPart: string;
begin
  Result := False;
  i := Pos('@', Value);
  if i = 0 then
    Exit;
  NamePart := Copy(Value, 1, i - 1);
  ServerPart := Copy(Value, i + 1, Length(Value));
  if (Length(NamePart) = 0) or ((Length(ServerPart) < 5)) then
    Exit;
  i := Pos('.', ServerPart);
  if (i = 0) or (i > (Length(ServerPart) - 2)) then
    Exit;
  Result := CheckAllowed(NamePart) and CheckAllowed(ServerPart);
end;

function IsValidCpfCnpj( pCpf : boolean; Numero : String) : Boolean;
Var
  i,d,b,
  Digito : Byte;
  Soma : Integer;
  CNPJ : Boolean;
  DgPass,
  DgCalc : String;
begin
  Result := False;
  Numero := ReturnNumbers(Numero);
  CNPJ   := not pCpf;
  // Separa o número do digito
  DgCalc := '';
  DgPass := Copy(Numero,Length(Numero)-1,2);
  Numero := Copy(Numero,1,Length(Numero)-2);
  // Calcula o digito 1 e 2
  For d := 1 to 2 do begin
    B := varIIF(D=1,2,3); // BYTE
    SOMA := varIIF(D=1,0,STRTOINTDEF(DGCALC,0)*2);
    for i := Length(Numero) downto 1 do begin
      Soma := Soma + (Ord(Numero[I])-Ord('0'))*b;
      Inc(b);
      If (b > 9) And CNPJ Then
        b := 2;
    end;
   Digito := 11 - Soma mod 11;
   If Digito >= 10 then
     Digito := 0;
   DgCalc := DgCalc + Chr(Digito + Ord('0'));
  end;
  Result := DgCalc = DgPass;
end;

function IsValidIP( pIP : string ) : boolean;
var
   ipRegExp : string;
begin
    ipRegExp := '\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b';

    Result := TRegEx.IsMatch( pIP, ipRegExp ) ;
end;

//7.1.0.0
function IsValidPIS( pPIS: String): boolean;
var
  i, wsoma, Wm11, Wdv,wdigito : Integer;
begin
  Result := false;
  try
    if Trim(pPIS) <> '' Then
    begin
      if ( Length(pPis)=12 ) and ( Copy( pPis, 1, 1 ) = '0' ) then
         pPis := Copy( pPIS, 2 );
      wdv := strtoint( copy( pPIS, 11, 1 ) );
      wsoma := 0;
      wm11 := 2;
      for i := 1 to 10 do //2005025690 9
      begin
        wsoma := wsoma + ( wm11 * strtoint( copy( pPIS , 11 - I, 1 ) ) );
        if wm11 < 9 then
        begin
           wm11 := wm11 + 1
        end
        else
        begin
          wm11 := 2;
        end;
      end;
      wdigito := 11 - ( wsoma MOD 11 );
      if wdigito > 9 then
      begin
         wdigito := 0;
      end;
      if wdv = wdigito then
      begin
        Result := true;
      end
      else
      begin
        Result := false;
      end;
    end;
  except on E: Exception do
    //UniMainModule.Toast.Warning('Atenção', 'O PIS digitado é inválido e/ou o número de caracteres está incorreto!');  end;
  end;
end;

function rc_TypeIsValid( pType : TRCValidateTypes; pContent : Variant ) : boolean;
var
   FS: TFormatSettings;
   dDt : TDateTime;
begin
  Result := false;

  Case pType of
       vtNotBlank : Result := pContent <> EmptyStr;

       vtNumbers  : Result := ReturnLetters( pContent ) = '';

       vtLetters  : Result := ReturnNumbers( pContent ) = '';

       vtIP       : Result := TRegEx.IsMatch( pContent, RegEx_IP4 ) ;//IsValidIP( pContent );
       //6.1.0.1
       vtEmail    : begin
                      //Result := TRegEx.IsMatch( pContent, RegEx_EMAIL ) ;//IsValidEmail( pContent );
                      Result := rc_IsValidEmail( pContent );
                    end;
       //6.1.0.1
       vtSQLI     : Result := rc_AntiSqlInjection( pContent );

       vtPASS     : Result := TRegEx.IsMatch( pContent, RegEx_PASS ) ;//IsValidEmail( pContent );

       vtCPF,
       vtCNPJ     : Result := IsValidCpfCnpj( pType = vtCPF, pContent );

       vtPIS      : Result := IsValidPIS( pContent ); //7.1.0.0
       //8.0.0.0
       vtDATE     : Result := rc_IsValidDate( pContent );
  End;
end;
//8.4.0.0
function rc_FormValidate(pFormFrame: TObject; pOnlyParent : TComponent; pClear : boolean ) : boolean;
const
   VALIDS_PARAMS = '> < = >= <= @ ' +//8.0.0.0
                   'notblank blank blank= email not-exists not-exists= not-exists<str> not-exists<int> ' +
                   'ip date pass min- max- cpfcnpj cpf pis sqli';
var
   CompCount1, CompCount2,i, l1, l2 : integer;
   oOnlyParent : TComponent; // 6.0.0.0
   bIsControl : boolean; // 6.0.0.0
   iTotControls : integer; // 6.0.0.0
   oObj, oObj2, oObj3 : TUniControl;
   bValid, bTrue : boolean;

   oFieldType : TFieldType;
   cPF, cPJ, cCompName, //8.0.0.0
   cValid, cValid2, cValidType, cValidExpression, cV1, cV2, cV2And, cV2Or, cV2Eq, cV2Dif, cV2Gt, cV2GtE, cV2Lt, cV2LtE,
   cHint, cValidProccess, cTmp, cTmp2, cTmp3, cTmp4, cTmp5, cMsg, cMsgOr : string;

   aInvalids : array[0..99] of string;
   iInvalidsSeq : integer;
   procedure rc_ExpressionValidate( pType : string );
   begin
       cMsgOr := '';
       if pType = '>=' then
       begin
          if cValidType = '<int>' then
          begin
             if ( not ( StrToIntDef( cTmp, 0 ) >= StrToIntDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<str>' then
          begin
             if ( not ( cTmp >= cV1 ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<float>' then
          begin
             if ( not ( StrToFloat_Universal( cTmp ) >= StrToFloat_Universal( cV1 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<date>' then
          begin
             if ( not ( StrToDateDef( cTmp, 0 ) >= StrToDateDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end;
       end
       else
       if pType = '<=' then
       begin
          if cValidType = '<int>' then
          begin
             if ( not ( StrToIntDef( cTmp, 0 ) <= StrToIntDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<str>' then
          begin
             if ( not ( cTmp <= cV1 ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<float>' then
          begin
             if ( not ( StrToFloat_Universal( cTmp ) <= StrToFloat_Universal( cV1 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<date>' then
          begin
             if ( not ( StrToDateDef( cTmp, 0 ) <= StrToDateDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end;
       end
       else
       if pType = '=' then
       begin
          if cValidType = '<int>' then
          begin
             if ( not ( StrToIntDef( cTmp, 0 ) = StrToIntDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<str>' then
          begin
             if ( not ( cTmp = cV1 ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<float>' then
          begin
             if ( not ( StrToFloat_Universal( cTmp ) = StrToFloat_Universal( cV1 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<date>' then
          begin
             if ( not ( StrToDateDef( cTmp, 0 ) = StrToDateDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end;
       end
       else
       if pType = '<>' then
       begin
          if cValidType = '<int>' then
          begin
             if ( not ( StrToIntDef( cTmp, 0 ) <> StrToIntDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<str>' then
          begin
             if ( not ( cTmp <> cV1 ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<float>' then
          begin
             if ( not ( StrToFloat_Universal( cTmp ) <> StrToFloat_Universal( cV1 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<date>' then
          begin
             if ( not ( StrToDateDef( cTmp, 0 ) <> StrToDateDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end;
       end
       else
       if pType = '<' then
       begin
          if cValidType = '<int>' then
          begin
             if ( not ( StrToIntDef( cTmp, 0 ) < StrToIntDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<str>' then
          begin
             if ( not ( cTmp < cV1 ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<float>' then
          begin
             if ( not ( StrToFloat_Universal( cTmp ) < StrToFloat_Universal( cV1 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<date>' then
          begin
             if ( not ( StrToDateDef( cTmp, 0 ) < StrToDateDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end;
       end
       else
       if pType = '>' then
       begin
          if cValidType = '<int>' then
          begin
             if ( not ( StrToIntDef( cTmp, 0 ) > StrToIntDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<str>' then
          begin
             if ( not ( cTmp > cV1 ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<float>' then
          begin
             if ( not ( StrToFloat_Universal( cTmp ) > StrToFloat_Universal( cV1 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<date>' then
          begin
             if ( not ( StrToDateDef( cTmp, 0 ) > StrToDateDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end;
       end;
   end;

   procedure rc_Expression_AndOr_Validate;//( pV1, pV2 : Variant ) ;
   begin
      if not cV2Eq.IsEmpty then
      begin
         if cV2And = '1' then
         begin
            if cValidType = '<int>' then
            begin
               if ( cMsg = '1' ) or not ( StrToIntDef( cTmp, 0 ) = StrToIntDef( cV2Eq, 0 ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if ( cMsg = '1' ) or not ( cTmp = cV2Eq ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if ( cMsg = '1' ) or not ( StrToFloat_Universal( cTmp ) = StrToFloat_Universal( cV2Eq ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if ( cMsg = '1' ) or not ( StrToDateDef( cTmp, 0 ) = StrToDateDef( cV2Eq, 0 ) ) then
                  cMsg := '1';
            end;
         end
         else
         begin
            if cValidType = '<int>' then
            begin
               if not ( StrToIntDef( cTmp, 0 ) = StrToIntDef( cV2Eq, 0 ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if not ( cTmp = cV2Eq ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if not ( StrToFloat_Universal( cTmp ) = StrToFloat_Universal( cV2Eq ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if not ( StrToDateDef( cTmp, 0 ) = StrToDateDef( cV2Eq, 0 ) ) then
                  cMsgOr := '1';
            end;
         end;
      end
      else
      if not cV2Dif.IsEmpty then
      begin
         if cV2And = '1' then
         begin
            if cValidType = '<int>' then
            begin
               if ( cMsg = '1' ) or not ( StrToIntDef( cTmp, 0 ) <> StrToIntDef( cV2Dif, 0 ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if ( cMsg = '1' ) or not ( cTmp <> cV2Dif ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if ( cMsg = '1' ) or not ( StrToFloat_Universal( cTmp ) <> StrToFloat_Universal( cV2Dif ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if ( cMsg = '1' ) or not ( StrToDateDef( cTmp, 0 ) <> StrToDateDef( cV2Dif, 0 ) ) then
                  cMsg := '1';
            end;
         end
         else
         begin
            if cValidType = '<int>' then
            begin
               if not ( StrToIntDef( cTmp, 0 ) <> StrToIntDef( cV2Dif, 0 ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if not ( cTmp <> cV2Dif ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if not ( StrToFloat_Universal( cTmp ) <> StrToFloat_Universal( cV2Dif ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if not ( StrToDateDef( cTmp, 0 ) <> StrToDateDef( cV2Dif, 0 ) ) then
                  cMsgOr := '1';
            end;
         end;
      end
      else
      if not cV2GtE.IsEmpty then
      begin
         if cV2And = '1' then
         begin
            if cValidType = '<int>' then
            begin
               if ( cMsg = '1' ) or not ( StrToIntDef( cTmp, 0 ) <> StrToIntDef( cV2GtE, 0 ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if ( cMsg = '1' ) or not ( cTmp <> cV2GtE ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if ( cMsg = '1' ) or not ( StrToFloat_Universal( cTmp ) <> StrToFloat_Universal( cV2GtE ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if ( cMsg = '1' ) or not ( StrToDateDef( cTmp, 0 ) <> StrToDateDef( cV2GtE, 0 ) ) then
                  cMsg := '1';
            end;
         end
         else
         begin
            if cValidType = '<int>' then
            begin
               if not ( StrToIntDef( cTmp, 0 ) <> StrToIntDef( cV2GtE, 0 ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if not ( cTmp <> cV2GtE ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if not ( StrToFloat_Universal( cTmp ) <> StrToFloat_Universal( cV2GtE ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if not ( StrToDateDef( cTmp, 0 ) <> StrToDateDef( cV2GtE, 0 ) ) then
                  cMsgOr := '1';
            end;
         end;
      end
      else
      if not cV2LtE.IsEmpty then
      begin
         if cV2And = '1' then
         begin
            if cValidType = '<int>' then
            begin
               if ( cMsg = '1' ) or not ( StrToIntDef( cTmp, 0 ) <= StrToIntDef( cV2LtE, 0 ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if ( cMsg = '1' ) or not ( cTmp <= cV2LtE )  then
                  cMsg := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if ( cMsg = '1' ) or not ( StrToFloat_Universal( cTmp ) <= StrToFloat_Universal( cV2LtE ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if ( cMsg = '1' ) or not ( StrToDateDef( cTmp, 0 ) <= StrToDateDef( cV2LtE, 0 ) ) then
                  cMsg := '1';
            end;
         end
         else
         begin
            if cValidType = '<int>' then
            begin
               if not ( StrToIntDef( cTmp, 0 ) <= StrToIntDef( cV2LtE, 0 ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if not ( cTmp <= cV2LtE ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if not ( StrToFloat_Universal( cTmp ) <= StrToFloat_Universal( cV2LtE ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if not ( StrToDateDef( cTmp, 0 ) <= StrToDateDef( cV2LtE, 0 ) ) then
                  cMsgOr := '1';
            end;
         end;
      end
      else
      if not cV2Gt.IsEmpty then
      begin
         if cV2And = '1' then
         begin
            if cValidType = '<int>' then
            begin
               if ( cMsg = '1' ) or not ( StrToIntDef( cTmp, 0 ) > StrToIntDef( cV2Gt, 0 ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if ( cMsg = '1' ) or not ( cTmp > cV2Gt ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if ( cMsg = '1' ) or not ( StrToFloat_Universal( cTmp ) > StrToFloat_Universal( cV2Gt ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if ( cMsg = '1' ) or not ( StrToDateDef( cTmp, 0 ) > StrToDateDef( cV2Gt, 0 ) ) then
                  cMsg := '1';
            end;
         end
         else
         begin
            if cValidType = '<int>' then
            begin
               if not ( StrToIntDef( cTmp, 0 ) > StrToIntDef( cV2Gt, 0 ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if not ( cTmp <> cV2Gt ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if not ( StrToFloat_Universal( cTmp ) > StrToFloat_Universal( cV2Gt ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if not ( StrToDateDef( cTmp, 0 ) > StrToDateDef( cV2Gt, 0 ) ) then
                  cMsgOr := '1';
            end;
         end;
      end
      else
      if not cV2Lt.IsEmpty then
      begin
         if cV2And = '1' then
         begin
            if cValidType = '<int>' then
            begin
               if ( cMsg = '1' ) or not ( StrToIntDef( cTmp, 0 ) < StrToIntDef( cV2Lt, 0 ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if ( cMsg = '1' ) or not( cTmp < cV2Lt ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if ( cMsg = '1' ) or not ( StrToFloat_Universal( cTmp ) < StrToFloat_Universal( cV2Lt ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if ( cMsg = '1' ) or not ( StrToDateDef( cTmp, 0 ) < StrToDateDef( cV2Lt, 0 ) ) then
                  cMsg := '1';
            end;
         end
         else
         begin
            if cValidType = '<int>' then
            begin
               if not ( StrToIntDef( cTmp, 0 ) < StrToIntDef( cV2Lt, 0 ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if not ( cTmp < cV2Lt ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if not ( StrToFloat_Universal( cTmp ) < StrToFloat_Universal( cV2Lt ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if not ( StrToDateDef( cTmp, 0 ) < StrToDateDef( cV2Lt, 0 ) ) then
                  cMsgOr := '1';
            end;
         end;
      end;

      if cV2Or <> '' then
      begin
           if ( cMsg <> '1' ) or ( cMsgOr <> '1' ) then
              cMsg := '';
      end;
   end;

begin
  Result := True;
  iInvalidsSeq := 0;
  CompCount1 := TComponent(pFormFrame).ComponentCount;
  for i := 0 to CompCount1 - 1 do
  begin
     oObj  := TUniControl( TComponent( pFormFrame ).Components[I] );
     if ( oObj is TUniControl ) then
     begin
        If GetPropInfo( oObj.ClassInfo, 'Hint') <> nil then
        begin
           // 6.0.0.0
           cHint := oObj.Hint;
           if pOnlyParent <> nil then
           begin
              If not rc_ObjIsParentOf( pFormFrame, oObj, pOnlyParent ) then
                 cHint := '';
           end;

           while Pos( 'valid:', cHint ) > 0 do
           begin
              if rc_AttrExists( 'valid:', cHint ) then //8.0.0.0
              begin
                 if pClear then
                    rc_RemoveCssClass( oObj , 'rc-invalid' )
                 else
                 begin
                    //
                    cValid := rc_GetHintAttr( 'valid:', cHint ) + ' ';
                    cValidProccess := cValid;
                    cTmp := trim( Copy( cValid, 1, Pos( ' ', cValid ) ) );
                    if copy ( cTmp, 1, 4 ) = 'min-' then
                       cTmp := 'min-'
                    else
                    if copy ( cTmp, 1, 4 ) = 'max-' then
                       cTmp := 'max-'
                    else
                    if copy ( cTmp, 1, 5 ) = 'blank' then
                       cTmp := 'blank'
                    else
                    if copy ( cTmp, 1, 8 ) = 'notblank' then
                       cTmp := 'notblank'
                    else
                    if copy ( cTmp, 1, 10 ) = 'not-exists' then
                       cTmp := 'not-exists'
                    else
                    if copy ( cTmp, 1, 2 ) = '>=' then
                       cTmp := '>='
                    else
                    if copy ( cTmp, 1, 2 ) = '<=' then
                       cTmp := '<='
                    else
                    if copy ( cTmp, 1, 1 ) = '>' then
                       cTmp := '>'
                    else
                    if copy ( cTmp, 1, 1 ) = '<' then
                       cTmp := '<'
                    else
                    //8.0.0.0
                    if copy ( cTmp, 1, 1 ) = '=' then
                       cTmp := '='
                    else
                    If copy( cTmp, 1, 1 ) = '@' then
                       cTmp := '@';
                    if Pos( cTmp, VALIDS_PARAMS ) = 0 then //7.1.0.0
                    begin
                        dm_rc.rc_ShowError( cTmp + ' is not a "valid:" parameter');
                        cMsg := '';
                        cTmp := '@#$%¨&*-+!';
                        Result := False;
                    end
                    else
                    begin
                       cMsg := '';
                       cTmp := '@#$%¨&*-+!';
                       //8.4.0.2 thanks Mr. Valdir for bugtracker
//                       If ( GetPropInfo( oObj.ClassInfo, 'DataSource') <> nil ) and
//                          ( Pos( 'searchonly', cHint ) = 0 ) then
                       If ( GetPropInfo( oObj.ClassInfo, 'DataSource') <> nil ) then
                       begin
                          cTmp := TUniDBEdit( oObj ).Text;

                          if ( oObj.ClassNameIs( 'TUniDBDateTimePicker' ) ) and
                             ( TUniDBDateTimePicker( oObj ).DataSource <> nil ) and
                             ( TUniDBDateTimePicker( oObj ).DataField <> '' ) then
                          begin
                             oFieldType := TDataSet( TUniDBDateTimePicker( oObj ).DataSource.DataSet ).FieldByName( TUniDBDateTimePicker( oObj ).DataField ).DataType;
                            if TDataSet( TUniDBDateTimePicker( oObj ).DataSource.DataSet ).FieldByName( TUniDBDateTimePicker( oObj ).DataField ).IsNull then
                            begin
                               cTmp := '';
                            end;
                            if mm.varC_InvalidDateObj = TUniControl( oObj ).Name then
                            begin
                               cTmp := mm.varC_InvalidDate;
                               mm.varC_InvalidDate := '';
                               mm.varC_InvalidDateObj := '';
                            end;
                          end
                          else
                          if ( oObj.ClassNameIs( 'TUniDBComboBox' ) ) and
                             ( TUniDBComboBox( oObj ).DataSource <> nil ) and
                             ( TUniDBComboBox( oObj ).DataField <> '' ) then
                             oFieldType := TDataSet( TUniDBComboBox( oObj ).DataSource.DataSet ).FieldByName( TUniDBComboBox( oObj ).DataField ).DataType
                          else
                          if ( oObj.ClassNameIs( 'TUniDBLookupComboBox' ) ) and
                             ( TUniDBLookupComboBox( oObj ).DataSource <> nil ) and
                             ( TUniDBLookupComboBox( oObj ).DataField <> '' ) then
                             oFieldType := TDataSet( TUniDBLookupComboBox( oObj ).DataSource.DataSet ).FieldByName( TUniDBLookupComboBox( oObj ).DataField ).DataType
                          else
                          if ( oObj.ClassNameIs( 'TUniDBMemo' ) ) and
                             ( TUniDBMemo( oObj ).DataSource <> nil ) and
                             ( TUniDBMemo( oObj ).DataField <> '' ) then
                             oFieldType := TDataSet( TUniDBMemo( oObj ).DataSource.DataSet ).FieldByName( TUniDBMemo( oObj ).DataField ).DataType
                          else
                          if ( oObj.ClassNameIs( 'TUniDBNumberEdit' ) ) and
                             ( TUniDBNumberEdit( oObj ).DataSource <> nil ) and
                             ( TUniDBNumberEdit( oObj ).DataField <> '' ) then
                             oFieldType := TDataSet( TUniDBNumberEdit( oObj ).DataSource.DataSet ).FieldByName( TUniDBNumberEdit( oObj ).DataField ).DataType
                          else
                          if ( oObj.ClassNameIs( 'TUniDBFormattedNumberEdit' ) ) and
                             ( TUniDBFormattedNumberEdit( oObj ).DataSource <> nil ) and
                             ( TUniDBFormattedNumberEdit( oObj ).DataField <> '' ) then
                             oFieldType := TDataSet( TUniDBFormattedNumberEdit( oObj ).DataSource.DataSet ).FieldByName( TUniDBFormattedNumberEdit( oObj ).DataField ).DataType
                          else
                          if ( oObj.ClassNameIs( 'TUniDBEdit' ) ) and
                             ( TUniDBEdit( oObj ).DataSource <> nil ) and
                             ( TUniDBEdit( oObj ).DataField <> '' ) then
                             oFieldType := TDataSet( TUniDBEdit( oObj ).DataSource.DataSet ).FieldByName( TUniDBEdit( oObj ).DataField ).DataType
                          else
                             oFieldType := ftUnknown;
                       end
                       else
                       If GetPropInfo( oObj.ClassInfo, 'DateTime') <> nil then
                       begin
                          //7.3.0.0 date
                          if TUniDateTimePicker( oObj ).DateTime =  default(TDateTime) then
                             cTmp := ''
                          else
                             cTmp := TUniDateTimePicker( oObj ).Text;
                          oFieldType := ftUnknown;
                       end
                       else
                       If GetPropInfo( oObj.ClassInfo, 'Text') <> nil then
                       begin
                          cTmp := TUniEdit( oObj ).Text;
                          oFieldType := ftUnknown;
                       end
                       else
                       If GetPropInfo( oObj.ClassInfo, 'Lines') <> nil then
                       begin
                          cTmp := TUniMemo( oObj ).Lines.Text;
                          oFieldType := ftUnknown;
                       end;

                       if cTmp <> '@#$%¨&*-+!' then
                       begin
                          cV1    := '';
                          cV2And := '';
                          cV2Or  := '';
                          cV2Eq  := '';
                          cV2Dif := '';
                          cV2Gt  := '';
                          cV2GtE := '';
                          cV2Lt  := '';
                          cV2LtE := '';
                          cValidExpression := cValid;
                          cValid2:= '';
                          cValidType := '';
                          //8.0.0.0
                          cCompName := '';
                          if ( Pos( '@' , cValid ) > 0 ) then
                          begin
                             cCompName := Copy( cValid, Pos( '@' , cValid ) + 1 );
                             cValid    := StringReplace( cValid, '@' + cCompName , '', [rfReplaceAll] ) + ' ';
                             cValidExpression := cValid;
                             cCompName := cCompName + ': ';
                          end;

                          if ( Pos( '<int>' , cValid ) > 0 ) or ( DataTypeIsInt( oFieldType ) ) then
                             cValidType := '<int>'
                          else
                          if ( Pos( '<str>' , cValid ) > 0 ) or ( oFieldType = ftString ) then
                             cValidType := '<str>'
                          else
                          if ( Pos( '<float>' , cValid ) > 0 ) or ( DataTypeIsFloat( oFieldType ) ) then
                             cValidType := '<float>'
                          else
                          if ( Pos( '<date>' , cValid ) > 0 ) or ( ( oFieldType = ftDate ) or ( oFieldType = ftDateTime ) ) then
                             cValidType := '<date>';
                          if cValidType <> '' then
                             cValid := StringReplace( cValid, cValidType, '', [rfReplaceAll] );

                          if Pos( ' and ' , cValid ) > 0 then
                          begin
                             cV2And  := '1';
                             cValid2 := Trim( Copy( cValid  , Pos( ' and ' , cValid ) + 5 ) );
                             cValid  := StringReplace( cValid, ' and ' + cValid2, '', [rfReplaceAll] );

                             if Copy( cValid2, 1, 1 ) = '=' then
                                cV2Eq := Trim( Copy( cValid2 , 2 ) )
                             else
                             if Copy( cValid2, 1, 2 ) = '<>' then
                                cV2Dif := Trim( Copy( cValid2 , 3 ) )
                             else
                             if Copy( cValid2, 1, 2 ) = '>=' then
                                cV2GtE := Trim( Copy( cValid2 , 3 ) )
                             else
                             if Copy( cValid2, 1, 2 ) = '<=' then
                                cV2LtE := Trim( Copy( cValid2 , 3 ) )
                             else
                             if Copy( cValid2, 1, 1 ) = '>' then
                                cV2Gt := Trim( Copy( cValid2 , 2 ) )
                             else
                             if Copy( cValid2, 1, 1 ) = '<' then
                                cV2Lt := Trim( Copy( cValid2 , 2 ) );
                          end
                          else
                          if Pos( ' or ' , cValid ) > 0 then
                          begin
                             cV2Or  := '1';
                             cValid2 := Trim( Copy( cValid  , Pos( ' or ' , cValid ) + 4 ) );
                             cValid  := StringReplace( cValid, ' or ' + cValid2, '', [rfReplaceAll] );
                             if Copy( cValid2, 1, 1 ) = '=' then
                                cV2Eq := Trim( Copy( cValid2 , 2 ) )
                             else
                             if Copy( cValid2, 1, 2 ) = '<>' then
                                cV2Dif := Trim( Copy( cValid2 , 3 ) )
                             else
                             if Copy( cValid2, 1, 2 ) = '>=' then
                                cV2GtE := Trim( Copy( cValid2 , 3 ) )
                             else
                             if Copy( cValid2, 1, 2 ) = '<=' then
                                cV2LtE := Trim( Copy( cValid2 , 3 ) )
                             else
                             if Copy( cValid2, 1, 1 ) = '>' then
                                cV2Gt := Trim( Copy( cValid2 , 2 ) )
                             else
                             if Copy( cValid2, 1, 1 ) = '<' then
                                cV2Lt := Trim( Copy( cValid2 , 2 ) );
                          end;

                          cMsg   := '';
                          cMsgOr := '';
                          if cValidType <> '' then
                          begin
                             cMsg := '0';
                             if Copy( cValid, 1, 2 ) = '<>' then
                             begin
                                  cV1 := Trim( Copy( cValid, 3, Pos( ' ' , cValid ) - 1 ) );

                                  rc_ExpressionValidate( '<>' );
                             end
                             else
                             if Copy( cValid, 1, 1 ) = '=' then
                             begin
                                  cV1 := Trim( Copy( cValid, 2, Pos( ' ' , cValid ) - 1 ) );

                                  rc_ExpressionValidate( '=' );
                             end
                             else
                             if Copy( cValid, 1, 2 ) = '>=' then
                             begin
                                  cV1 := Trim( Copy( cValid, 3, Pos( ' ' , cValid ) - 1 ) );

                                  rc_ExpressionValidate( '>=' );
                             end
                             else
                             if Copy( cValid, 1, 2 ) = '<=' then
                             begin
                                  cV1 := Trim( Copy( cValid, 3, Pos( ' ' , cValid ) - 1 ) );

                                  rc_ExpressionValidate( '<=' );
                             end
                             else
                             if Copy( cValid, 1, 1 ) = '<' then
                             begin
                                  cV1 := Trim( Copy( cValid, 2, Pos( ' ' , cValid ) - 1 ) );

                                  rc_ExpressionValidate( '<' );
                             end
                             else
                             if Copy( cValid, 1, 1 ) = '>' then
                             begin
                                  cV1 := Trim( Copy( cValid, 2, Pos( ' ' , cValid ) - 1 ) );

                                  rc_ExpressionValidate( '>' );
                             end;
                             if ( not cValid2.IsEmpty ) then
                                rc_Expression_AndOr_Validate;
                             // expression validate results
                             if ( cMsg = '1' ) then // or ( cMsgOr = '1' ) then
                             begin
                                  cMsg := mm.MSG_VALIDATE_INVALID_VALUE + '<br>( ' + cValidExpression + ' )' ;
                                  cMsg := cCompName + rc_CleanValidMsg( cMsg );//8.0.0.0
                                  rc_AddCssClass( oObj , 'rc-invalid' );
                                  oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                  Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                             end
                             else
                             if cMsg = '0' then
                             begin
                                 cMsg   := '';
                                 if Pos( 'invalidate:true' , oObj.Hint ) = 0 then
                                 begin
                                    rc_RemoveCssClass( oObj , 'rc-invalid' );
                                    oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                 end;
                             end;
                          end;
                          if cValid = 'YN' then
                          begin
                               if ( Pos( mm.VALUE_YES, cTmp ) = 0 ) and ( Pos( mm.VALUE_NO, cTmp ) = 0 ) then
                               begin
                                    cMsg := mm.MSG_VALIDATE_INVALID_VALUE +  '<br>( ' + mm.VALUE_YES + '/' + mm.VALUE_NO + ' )' ;
                                    cMsg := cCompName + rc_CleanValidMsg( cMsg );//8.0.0.0
                                    rc_AddCssClass( oObj , 'rc-invalid' );
                                    oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                    Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                               end
                               else
                               begin
                                   rc_RemoveCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end;
                          end;
                          //6.1.0.5 ini
                          cTmp2 := rc_GetHintAttr( 'valid:', cHint );
                          if Pos( 'valid:blank', cHint ) > 0 then
                          begin
                               bValid := true;
                               bTrue  := false;
                               oObj3  := nil;
                               cTmp3  := rc_GetHintAttr( 'ifnotempty:', cHint ); //valid:blank=Cnpj ifnotempty:edTest
                               if cTmp3 <> '' then
                               begin
                                    oObj3 := TUniControl( TComponent(pFormFrame).FindComponent( cTmp3 ) );
                                    if ( oObj3 <> nil ) then
                                    begin
                                       if oObj3 is TUniEdit then
                                          bTrue := TUniEdit( oObj3 ).Text <> ''
                                       else
                                       if oObj3 is TUniDBText then
                                          bTrue := TUniDBText( oObj3 ).Text <> ''
                                       else
                                       if oObj3 is TUniComboBox then
                                          bTrue := TUniComboBox( oObj3 ).Text <> ''
                                       else
                                       if oObj3 is TUniDBComboBox then
                                          bTrue := TUniDBComboBox( oObj3 ).Text <> ''
                                       else
                                       if oObj3 is TUniDBLookupComboBox then
                                          bTrue := TUniDBLookupComboBox( oObj3 ).Text <> ''
                                       else
                                       if oObj3 is TUniDBEdit then
                                          bTrue := TUniDBEdit( oObj3 ).Text <> ''
                                       else
                                       if oObj3 is TUniNumberEdit then
                                          bTrue := StringReplace( TUniNumberEdit( oObj3 ).Text , '0' , '' , [rfReplaceAll] ) <> ''
                                       else
                                       if oObj3 is TUniDBNumberEdit then
                                          bTrue := StringReplace( TUniDBNumberEdit( oObj3 ).Text , '0' , '' , [rfReplaceAll] ) <> ''
                                       else
                                       if oObj3 is TUniFormattedNumberEdit then
                                       begin
                                          cTmp3 := StringReplace( TUniFormattedNumberEdit( oObj3 ).Text , '0' , '' , [rfReplaceAll] );
                                          cTmp3 := StringReplace( cTmp3 , '.' , '' , [rfReplaceAll] );
                                          cTmp3 := StringReplace( cTmp3 , ',' , '' , [rfReplaceAll] );
                                          bTrue := cTmp3 <> '';
                                       end
                                       else
                                       if oObj3 is TUniDBFormattedNumberEdit then
                                       begin
                                          cTmp3 := StringReplace( TUniDBFormattedNumberEdit( oObj3 ).Text , '0' , '' , [rfReplaceAll] );
                                          cTmp3 := StringReplace( cTmp3 , '.' , '' , [rfReplaceAll] );
                                          cTmp3 := StringReplace( cTmp3 , ',' , '' , [rfReplaceAll] );
                                          bTrue := cTmp3 <> '';
                                       end
                                       else
                                       if oObj3 is TUniDateTimePicker then
                                          bTrue := StringReplace( TUniDateTimePicker( oObj3 ).Text, '/', '', [rfReplaceAll] ) <> ''
                                       else
                                       if oObj3 is TUniDBDateTimePicker then
                                          bTrue := StringReplace( TUniDBDateTimePicker( oObj3 ).Text, '/', '', [rfReplaceAll] ) <> '' ;
                                    end;
                               end;
                               if cTmp3 = '' then
                               begin
                                  cTmp3  := rc_GetHintAttr( 'if>0:', cHint );  //valid:blank=Cnpj if>0:edTest
                                  if cTmp3 <> '' then
                                    begin
                                       if oObj3 is TUniEdit then
                                          bTrue := StrToIntDef( TUniEdit( oObj3 ).Text, 0 ) > 0
                                       else
                                       if oObj3 is TUniDBText then
                                          bTrue := StrToIntDef( TUniDBText( oObj3 ).Text, 0 ) > 0
                                       else
                                       if oObj3 is TUniDBEdit then
                                          bTrue := StrToIntDef( TUniDBEdit( oObj3 ).Text, 0 ) > 0
                                       else
                                       if oObj3 is TUniNumberEdit then
                                          bTrue := TUniNumberEdit( oObj3 ).Value > 0
                                       else
                                       if oObj3 is TUniDBNumberEdit then
                                          bTrue := TUniDBNumberEdit( oObj3 ).Value > 0
                                       else
                                       if oObj3 is TUniFormattedNumberEdit then
                                          bTrue := TUniFormattedNumberEdit( oObj3 ).Value > 0
                                       else
                                       if oObj3 is TUniFormattedNumberEdit then
                                          bTrue := TUniDBFormattedNumberEdit( oObj3 ).Value > 0;
                                    end;
                               end;
                               if cTmp3 = '' then
                               begin
                                  cTmp3  := rc_GetHintAttr( 'ifvisible:', cHint );
                                  if cTmp3 <> '' then
                                  begin
                                       oObj3 := TUniControl( TComponent(pFormFrame).FindComponent( cTmp3 ) );
                                       if ( oObj3 <> nil ) then
                                          bTrue := oObj3.Visible ;
                                  end
                               end;
                               if cTmp3 = '' then
                               begin
                                  cTmp3  := rc_GetHintAttr( 'ifenabled:', cHint );
                                  if cTmp3 <> '' then
                                  begin
                                       oObj3 := TUniControl( TComponent(pFormFrame).FindComponent( cTmp3 ) );
                                       if ( oObj3 <> nil ) then
                                          bTrue := oObj3.Enabled ;
                                  end;
                               end;
                               if ( oObj3 = nil ) or ( ( oObj3 <> nil ) and ( bTrue ) ) then
                                  bValid := ( rc_TypeIsValid( vtNotBlank, cTmp ) );
                               //6.1.0.5 end
                               if ( not bValid ) then
                               begin
                                    if Pos( '=', cHint ) > 0 then
                                    begin
                                       if Pos( ':', cTmp2 ) > 0 then
                                          cTmp2 := rc_GetHintAttr( 'valid:', cHint , true);
                                    end;

                                    cTmp2 := rc_CleanValidMsg( cTmp2 );
                                    //8.0.0.0
                                    If cTmp2 = '' then
                                       cTmp2 := cCompName;

                                    if cTmp2 <> '' then
                                       cMsg := Format( mm.MSG_VALIDATE_BLANK_FIELD, [' [' + cTmp2 + '] '] )
                                    else
                                       cMsg := Format( mm.MSG_VALIDATE_BLANK_FIELD, ['']  );
                                    rc_AddCssClass( oObj , 'rc-invalid' );
                                    oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                    Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                               end
                               else
                               begin
                                   if Pos( 'invalidate:true' , oObj.Hint ) = 0 then
                                   begin
                                      rc_RemoveCssClass( oObj , 'rc-invalid' );
                                      oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                   end;
                               end;
                          end;
                          {<*RC DB}
                          if Pos( 'valid:not-exists', cHint ) > 0 then
                          begin
                               if rc_RecordExists( pFormFrame, oObj, false ) then
                               begin
                                    if Pos( '=', cHint ) > 0 then
                                    begin
                                       if Pos( ':', cTmp2 ) > 0 then
                                          cTmp2 := rc_GetHintAttr( 'valid:', cHint , true)
                                       else
                                       begin
                                          cTmp2 := Copy( cHint, Pos( 'valid:not-exists', cHint ) + 16 );
                                          cTmp2 := Copy( cTmp2, Pos( '=', cTmp2 ) + 1 );
                                          cTmp2 := Copy( cTmp2, 1, Pos( ']]', cTmp2 ) - 1 );
                                          if Pos( '|', cTmp2 ) > 0 then
                                             cTmp2 := Copy( cTmp2, 1, Pos( '|', cTmp2 ) - 1 );
                                       end;
                                    end;
                                    cTmp2 := rc_CleanValidMsg( cTmp2 );//

                                    if cTmp2 <> '' then
                                       cMsg := mm.MSG_VALIDATE_INVALID_EXISTS //+ '[' + cTmp2 + ']'
                                    else
                                       cMsg := Format( mm.MSG_VALIDATE_INVALID_EXISTS, ['']  );

                                    rc_AddCssClass( oObj , 'rc-invalid' );
                                    oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                    Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                               end
                               else
                               begin
                                  if Pos( 'invalidate:true' , oObj.Hint ) = 0 then
                                  begin
                                      rc_RemoveCssClass( oObj , 'rc-invalid' );
                                      oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                  end;
                               end;
                          end;
                          {RC DB*>}
                          if Pos( 'valid:ip', cHint ) > 0 then
                          begin
                               if not ( rc_TypeIsValid( vtIP, cTmp ) ) then
                               begin
                                    if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) then
                                    begin
                                       cMsg := 'IP: ' + mm.MSG_INVALID + ' ' + mm.MSG_VALIDATE_OR_BLANK_CONTENT;
                                       rc_AddCssClass( oObj , 'rc-invalid' );
                                       oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                       Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                                    end;
                               end
                               else
                               begin
                                   rc_RemoveCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end;
                          end;
                          //7.3.0.0 valid date
                          if ( Pos( 'valid:date', cHint ) > 0 ) then
                          begin
                               if ( not ( rc_TypeIsValid( vtDATE, cTmp ) ) )  then
                               begin
                                    if ( Pos( ' notblank', cHint ) = 0 ) then
                                    begin
                                       if ( Pos( ' notblank', cHint ) > 0 ) and ( cTmp <> '' ) then
                                          cMsg := mm.MSG_DATETYPE + ': ' + mm.MSG_INVALID
                                       else
                                          cMsg := mm.MSG_DATETYPE + ': ' + mm.MSG_INVALID + ' ' + mm.MSG_VALIDATE_OR_BLANK_CONTENT;

                                       rc_AddCssClass( oObj , 'rc-invalid' );
                                       oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                       Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                                    end;
                               end
                               else
                               begin
                                   rc_RemoveCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end;
                          end;

                          if Pos( 'valid:email', cHint ) > 0 then
                          begin
                               if not ( rc_TypeIsValid( vtEmail, cTmp ) ) then
                               begin
                                    if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( cTmp <> '' ) then
                                    begin
                                       cMsg := 'Email: ' + mm.MSG_INVALID + ' ' + mm.MSG_VALIDATE_OR_BLANK_CONTENT;
                                       rc_AddCssClass( oObj , 'rc-invalid' );
                                       oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                       Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                                    end;
                               end
                               else
                               begin
                                   rc_RemoveCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end;
                          end;
                          //6.1.0.1
                          if Pos( 'valid:sqli', cHint ) > 0 then
                          begin
                               if not ( rc_TypeIsValid( vtSQLI, cTmp ) ) then
                               begin
                                    if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( cTmp <> '' ) then
                                    begin
                                       //cMsg := 'SQLI: ' + mm.MSG_INVALID + ' ' + mm.MSG_VALIDATE_OR_BLANK_CONTENT;
                                       cMsg := 'SQLI: ' + 'Senha Inválida.<br>( não use os caracteres "' + ANTI_SQLINJECTION + ')"!';
                                       rc_AddCssClass( oObj , 'rc-invalid' );
                                       oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                       Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                                    end;
                               end
                               else
                               begin
                                   rc_RemoveCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end;
                          end;
                          // The RegEX context applyed here sometimes "broken"...I am still trying to undestand why.
                          if Pos( 'valid:pass', cHint ) > 0 then
                          begin
                               if not ( rc_TypeIsValid( vtPASS, cTmp ) ) then
                               begin
                                  if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( cTmp <> '' ) then
                                  begin
                                     cMsg := mm.MSG_VALIDATE_PASSWORD;
                                     rc_AddCssClass( oObj , 'rc-invalid' );
                                     oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                     Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                                  end;
                               end
                               else
                               begin
                                   rc_RemoveCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end;
                          end;

                          cTmp3 := rc_GetHintAttr( 'valid:', cHint );
                          if Pos( 'min-', cTmp3 ) > 0 then
                          begin
                               cTmp3 := StringReplace( cTmp3, 'min-', '', [rfReplaceAll] ) + ' ' ;
                               cTmp3 := Copy( cTmp3, 1, Pos( ' ', cTmp3 ) - 1 );
                               l1 := StrToIntDef( cTmp3, 0 );

                               if rc_GetHintAttr( 'mask:', oObj.Hint ) <> '' then
                                  cTmp4 := StrTokenClear( TUniEdit( oObj ).Text )
                               else
                                  cTmp4 := TUniEdit( oObj ).Text;

                               l2 := Length( cTmp4 );
                               if l2 < l1 then
                               begin
                                  if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( cTmp <> '' ) then
                                  begin
                                     cMsg := format( mm.MSG_VALIDATE_LENGTH_MIN, [ l1.ToString, l2.ToString ] );
                                     rc_AddCssClass( oObj , 'rc-invalid' );
                                     oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                     Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                                  end;
                               end
                               else
                               begin
                                   rc_RemoveCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end;
                          end;

                          cTmp3 := rc_GetHintAttr( 'valid:', cHint );
                          if Pos( 'max-', cTmp3 ) > 0 then
                          begin

                               cTmp3 := StringReplace( cTmp3, 'max-', '', [rfReplaceAll] ) + ' ' ;
                               cTmp3 := Copy( cTmp3, 1, Pos( ' ', cTmp3 ) - 1 );
                               l1 := StrToIntDef( cTmp3, 0 );

                               if rc_GetHintAttr( 'mask:', oObj.Hint ) <> '' then
                                  cTmp4 := StrTokenClear( TUniEdit( oObj ).Text )
                               else
                                  cTmp4 := TUniEdit( oObj ).Text;

                               l2 := Length( cTmp4 );
                               if l2 > l1 then
                               begin
                                  if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( cTmp <> '' ) then
                                  begin
                                     cMsg := format( mm.MSG_VALIDATE_LENGTH_MAX, [ l1.ToString, l2.ToString ] );
                                     rc_AddCssClass( oObj , 'rc-invalid' );
                                     oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                     Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                                  end;
                               end
                               else
                               begin
                                   rc_RemoveCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end;
                          end;
                          //7.1.0.0
                          if Pos( 'valid:pis', cHint ) > 0 then
                          begin
                               if not ( rc_TypeIsValid( vtPIS, cTmp ) ) then
                               begin
                                    if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( cTmp <> '' ) then
                                    begin
                                       cMsg := 'Pis: ' + mm.MSG_INVALID + ' ' + mm.MSG_VALIDATE_OR_BLANK_CONTENT;
                                       rc_AddCssClass( oObj , 'rc-invalid' );
                                       oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                       Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                                    end;
                               end
                               else
                               begin
                                   rc_RemoveCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end;
                          end;
                          // CPF and CNPJ are brazilian document types
                          if ( Pos( 'valid:cpfcnpj', cHint ) > 0 ) or ( Pos( 'valid:cnpjcpf', cHint ) > 0 ) or
                             ( Pos( 'valid:cpf', cHint ) > 0 ) or ( Pos( 'valid:cnpj', cHint ) > 0 ) then
                          begin
                               // campo PESSOA
                               cTmp3 := '';
                               cTmp4 := ''; //8.4.0.2
                               oObj2 := nil;
                               if Pos( ' &', cHint ) > 0 then
                               begin
                                    cTmp2 := StringReplace( Trim( Copy( cHint, Pos( ' &', cHint ) + 1, 100 ) ), '|', '', [rfReplaceAll] ) + ' ';

                                    cTmp3 := Copy( cTmp2, Pos( '"', cTmp2 ) + 1 , 100 );
                                    cTmp2 := trim( Copy( cTmp2, 2, Pos( '=' , cTmp2 ) - 2 ) );
                                    cTmp3 := Copy( cTmp3, 1, Pos( '"', cTmp3 ) - 1 );

                                    cPf   := Copy( cTmp3, 1, Pos( ' ', cTmp3 ) - 1 );
                                    cPj   := Copy( cTmp3, Pos( ' ', cTmp3 ) + 1, 100 );

                                    oObj2  := TUniControl ( TComponent( pFormFrame ).FindComponent( cTmp2 ) );

                                    if oObj2 <> nil then
                                    begin
                                         If GetPropInfo( oObj2.ClassInfo, 'DataSource') <> nil then
                                            cTmp4 := TUniDBEdit( oObj2 ).Text
                                         else
                                         If GetPropInfo( oObj2.ClassInfo, 'Text') <> nil then
                                            cTmp4 := TUniEdit( oObj2 ).Text;

                                         cTmp5 := rc_GetHintAttr( 'cbbxdata:' , TUniDBComboBox( oObj2 ).Hint ) + ',' ;
                                         l2 := Pos( cTmp4, cTmp5 );
                                         if l2 > 0 then
                                         begin
                                             cTmp3 := Copy( cTmp5, l2 );
                                             cTmp3 := Copy( cTmp3 , 1, Pos( ',', cTmp3 ) - 1 );
                                             cTmp3 := Copy( cTmp3 , Pos( '=', cTmp3 ) + 1 );
                                             cTmp4 := cTmp3;
                                         end;
                                    end;
                               end;

                               if cTmp4 <> '' then
                               begin
                                   if ( Pos( 'valid:cpfcnpj', cHint ) > 0 ) and ( cTmp4 = cPF ) and ( not rc_TypeIsValid( vtCPF, cTmp ) ) then
                                   begin
                                      if ( Pos( ' notblank', cHint ) = 0 ) or ( ( Pos( ' notblank', cHint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) ) then
                                      begin
                                         cMsg := 'Cpf inválido ou em branco !';
                                         rc_AddCssClass( oObj , 'rc-invalid' );
                                         oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                         Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                                      end;
                                   end
                                   else
                                   if ( Pos( 'valid:cpfcnpj', cHint ) > 0 ) and ( cTmp4 = cPJ ) and ( not rc_TypeIsValid( vtCNPJ, cTmp ) ) then
                                   begin
                                      if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) then
                                      begin
                                         cMsg := 'Cnpj inválido ou em branco!';
                                         rc_AddCssClass( oObj , 'rc-invalid' );
                                         oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                         Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                                      end;
                                   end
                                   else
                                   begin
                                       rc_RemoveCssClass( oObj , 'rc-invalid' );
                                       oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                   end;
                               end
                               else
                               if ( ( Pos( 'valid:cpf', cHint ) > 0 ) and ( Length( ReturnNumbers( cTmp ) ) <= 11 ) ) and ( not rc_TypeIsValid( vtCPF, cTmp ) ) then
                               begin
                                  if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) then
                                  begin
                                     cMsg := 'Cpf inválido !';
                                     rc_AddCssClass( oObj , 'rc-invalid' );
                                     oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                     Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                                  end
                                  else
                                  begin
                                      rc_RemoveCssClass( oObj , 'rc-invalid' );
                                      oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                  end;
                               end
                               else
                               if ( ( Pos( 'valid:cnpj', cHint ) > 0 ) and ( Length( ReturnNumbers( cTmp ) ) <= 14 ) ) and ( not rc_TypeIsValid( vtCNPJ, cTmp ) ) then
                               begin
                                  if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) then
                                  begin
                                     cMsg := 'Cnpj inválido !';
                                     rc_AddCssClass( oObj , 'rc-invalid' );
                                     oObj.Hint := rc_SetHintAttr( 'true imsg:'+cMSG , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro

                                     Inc( iInvalidsSeq ); aInvalids[ iInvalidsSeq ] := cMSG;
                                  end
                                  else
                                  begin
                                      rc_RemoveCssClass( oObj , 'rc-invalid' );
                                      oObj.Hint := rc_SetHintAttr( 'false' , 'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                  end;
                               end;
                          end;
                       end;

                       if cMsg <> EmptyStr then
                       begin
                           Result := False;

                           cMSG := aInvalids[ 1 ];
                           dm_rc.rc_ShowSweetAlert( mm.MSG_WARNING, cMsg, 'warning', pFormFrame );

                           CompCount2 := oObj.Owner.ComponentCount;
                           for l1 := 0 to CompCount2 - 1 do
                           begin
                                oObj2 := TUniControl( oObj.Owner.Components[l1] );
                                If GetPropInfo( TComponent(oObj2).ClassInfo, 'Hint') <> nil then
                                begin
                                   l2 := Pos( ' imsg:', TUniControl( oObj2 ).Hint );
                                   if l2 > 0 then
                                   begin
                                        cMSG := Copy( oObj2.Hint, l2 + 6 );
                                        cMSG := StringReplace( cMSG, ']]', '', [rfReplaceAll] );
                                        If Pos( '|', cMSG ) > 0 then cMSG := Copy( cMSG, 1, Pos( '|', cMSG ) - 1 ); //6.0.0.0
                                        oObj3 := rc_CreateLabel( oObj2.Owner, TUniControl(oObj2.Parent), '_inv_lab_' + TUniControl(oObj2).Name, TUniControl(oObj2).Width-10,28,TUniControl(oObj2).Left + 2,TUniControl(oObj2).Top - 1,'',true );
                                        TUniLAbel(oObj3).Anchors := [akRight,akBottom];
                                        TUniLAbel(oObj3).TextConversion := txtRegular;
                                        TUniLAbel(oObj3).Font.Size  := 8;
                                        TUniLAbel(oObj3).Font.Color := clMaroon;
                                        TUniLAbel(oObj3).AutoSize   := false;
                                        TUniLAbel(oObj3).Caption := StringReplace( cMSG, '<br>', '', [rfReplaceAll] );
                                        if ( Length( TUniLAbel(oObj3).Caption ) * 5.6 ) > ( TUniControl(oObj2).Width - 2 - ( 6*2) ) then
                                        begin
                                            TUniLAbel(oObj3).TextConversion := txtHTML;
                                            TUniLAbel(oObj3).Width := TUniControl(oObj2).Width;
                                            TUniLAbel(oObj3).Caption := '<marquee>' + StringReplace( cMSG, '<br>', '', [rfReplaceAll] ) + '</marquee>';
                                        end;

                                        if TUniControl(oObj2).HasParent then
                                        begin
                                           if ( Copy( lowercasE(TUniControl(oObj2).Parent.Name), 1, 7 ) = 'rcblock' ) and // 6.0.0.0
                                              ( TUniControl(oObj2).Parent.HasParent ) then
                                           begin
//                                              // 6.0.0.0
                                              if TUniControl(oObj2).Parent.Height >= 60 then
                                              begin
                                                 TUniLAbel(oObj3).Parent  := TUniControl(oObj2).Parent.Parent;
                                                 TUniLAbel(oObj3).Top     := TUniControl(oObj2).Parent.Top + TUniControl(oObj2).Parent.Height  - 3; // 6.0.0.0
                                                 TUniLAbel(oObj3).Left    := TUniControl(oObj2).Parent.Left;
                                              end
                                              else
                                              if ( ( TUniControl(oObj2).Parent.Height ) - ( oObj2.Height ) ) >= 22 then
                                              begin
                                                 TUniLAbel(oObj3).Parent  := TUniControl(oObj2).Parent;
                                                 TUniLAbel(oObj3).Top     := TUniControl(oObj2).Top + TUniControl(oObj2).Height - 3; // 6.0.0.0
                                                 TUniLAbel(oObj3).Left    := TUniControl(oObj2).Left;
                                              end
                                              else
                                              begin
                                                 TUniLAbel(oObj3).Parent  := TUniControl(oObj2).Parent.Parent;
                                                 TUniLAbel(oObj3).Top     := TUniControl(oObj2).Parent.Top + TUniControl(oObj2).Parent.Height  - 3; // 6.0.0.0
                                                 TUniLAbel(oObj3).Left    := TUniControl(oObj2).Parent.Left;
                                              end;
                                              rc_BringToFront( TUniLAbel(oObj3) );
                                           end
                                           else
                                           begin
                                              TUniLAbel(oObj3).Parent  := TUniControl(oObj2).Parent;
                                              TUniLAbel(oObj3).Top     := TUniControl(oObj2).Top + TUniControl(oObj2).Height  - 3; // 6.0.0.0
                                              TUniLAbel(oObj3).Left    := TUniControl(oObj2).Left;
                                              rc_BringToFront( TUniLAbel(oObj3) );
                                           end;
                                        end;
                                   end;
                                end;
                           end;
                       end;

                    end;
                 end;
              end;
              cHint := StringReplace( cHint, 'valid:' + trim(cValidProccess), '', [rfReplaceAll] );
           end;
        end;
     end;
  end;
end;
end.
