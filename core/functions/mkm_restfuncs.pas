unit mkm_restfuncs; //7.4.0.0

interface

uses
    uniDBComboBox, uniGUIFrame, uniGUIForm, System.SysUtils, vcl.Graphics, vcl.menus, // 6.0.0.0
    System.Classes, uniGUIClasses, uconsts, uconsts_cfg, TypInfo, Data.DB, //System.JSON,( future implementation ) //6.0.0.0

    REST.Types, REST.Client, IpPeerClient, //7.4.0.0( TOKYO bug fix )
    System.Net.HttpClientComponent, System.Net.HttpClient, REST.Json, System.Json, IdHTTP,
    uniDateTimePicker, uniDBDateTimePicker, uniDBCheckBox, uniCheckBox, uniComboBox, uniRadioGroup, uniRadioButton,
    uniDBListBox, uniDBLookupComboBox, uniStringGrid, uniMemo, uniDBMemo,
    uniEdit, uniDBEdit, uniLabel, uniPanel, uniDBGrid;

//7.3.0.0 only for BRAZIL( dados do cnpj )
procedure rc_GetCompanyData( pFrame       : TObject;
                             pCnpj        : string;
                             pRazSoc      : TUniControl = nil;
                             pFantasia    : TUniControl = nil;
                             pIE          : TUniControl = nil;
                             pTelefone    : TUniControl = nil;
                             pEndereco    : TUniControl = nil;
                             pNumero     : TUniControl = nil;
                             pComplemento : TUniControl = nil;
                             pBairro      : TUniControl = nil;
                             pCidade      : TUniControl = nil;
                             pUF          : TUniControl = nil;
                             pCep         : TUniControl = nil
                           );
//8.4.0.1
function rc_GetExternalData( cIP : string ) : TServerExternalData;


implementation
{------------------------------------------------------------------------------}

uses mkm_layout, untDM_RC, str_func, mkm_func_web, uClientClass;

//8.4.0.1 thanks for Wilton
function rc_GetExternalData( cIP : string ): TServerExternalData;
var
  LJsonObj : TJSONObject;
  Http     : TIdHttp;
  cToken, RsltStr  : String;
begin
  cToken := '';//'aaaaaaaaaaaa'; //Get your token "https://ipinfo.io/missingauth"

  if cToken <> '' then
  begin
    Result.ExternalIP      := '';
    Result.asn             := '';
    Result.as_name         := '';
    Result.as_domain       := '';
    Result.country_code    := '';
    Result.country         := '';
    Result.continent_code  := '';
    Result.continent       := '';


    Try
      Http := TIdHTTP.Create(nil);
      try
        //8.4.0.1
        //RsltStr := Http.Get('http://ipinfo.io/json');
        //cIp := '50.114.32.71';

        //RsltStr := Http.Get('https://api.ipinfo.io/lite/' + cIp + '?token=' + cToken);
        RsltStr := Http.Get('http://api.ipinfo.io/lite/' + cIp + '?token=' + cToken);

        LJsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(RsltStr),0) as TJSONObject;

        Result.ExternalIP      := LJsonObj.Get('ip').JsonValue.Value;
        Result.asn             := LJsonObj.Get('asn').JsonValue.Value;
        Result.as_name         := LJsonObj.Get('as_name').JsonValue.Value;
        Result.as_domain       := LJsonObj.Get('as_domain').JsonValue.Value;
        Result.country_code    := LJsonObj.Get('country_code').JsonValue.Value;
        Result.country         := LJsonObj.Get('country').JsonValue.Value;
        Result.continent_code  := LJsonObj.Get('continent_code').JsonValue.Value;
        Result.continent       := LJsonObj.Get('continent').JsonValue.Value;
        (*
        ip:"8.8.8.8",
        asn:"AS15169",
        as_name:"Google LLC",
        as_domain:"google.com",
        country_code:"US",
        country:"United States",
        continent_code:"NA",
        continent:"North America"
        *)
      Except;
      end;
    Finally
      FreeAndNil(LJsonObj);
      FreeAndNil(Http);
    End;
  end;
end;

//7.0.0.0
procedure rc_GetCompanyData( pFrame       : TObject;
                             pCnpj        : string;
                             pRazSoc      ,
                             pFantasia    ,
                             pIE          ,
                             pTelefone    ,
                             pEndereco    ,
                             pNumero     ,
                             pComplemento ,
                             pBairro      ,
                             pCidade      ,
                             pUF          ,
                             pCep         : TUniControl
                           );
var
  Cliente: TClientClass;
  Json: TJSONObject;
  qsa: TJSONArray;
  jsonObject, qsaObject,atividade_principalObject,atividade_secundariaObject: TJSONObject;
  jsonArray: TJSONArray;
  nome_dono,atividade_principal,atividade_secundaria: string;
  i,at: Integer;
  pObj : TUniControl;
  oUniDBEdit : TUniDBEdit;
  oUniEdit : TUniEdit;
  oUniComboBox : TUniComboBox;
  oUniDBComboBox : TUniDBComboBox;
//outra api e
//https://api-publica.speedio.com.br/buscarcnpj?cnpj=00000000000191
//caso a receitaws pare
begin
  dm_rc.RESTRequestRC.Method   := rmGet;
  dm_rc.RESTClientRC.BaseURL   := 'https://www.receitaws.com.br/v1/cnpj/';
  dm_rc.RESTRequestRC.Resource := ReturnNumbers( pCnpj );
  dm_rc.RESTRequestRC.Execute;

  Cliente := TClientClass.Create;
  try
    Cliente := TJson.JsonToObject<TClientClass>( dm_rc.RESTResponseRC.Content );

    //Memo1.Clear;
    If ( GetPropInfo( pRazSoc.ClassInfo, 'DataSource') <> nil ) and ( TUniDBEdit(pRazSoc).DataSource.State in [dsInsert, dsEdit ] ) then
    begin
      if pUF <> nil then
      begin
         pObj := pUF ;
         if ( pObj = nil ) or ( pObj.ClassType = TUniDBCombobox )  then
            oUniDBComboBox := TUniDBComboBox( pUF );
         if ( pObj <> nil ) and ( oUniDBComboBox = nil ) then
         begin
            oUniDBEdit := TUniDBEdit( pObj );
            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := AnsiUpperCase( Cliente.uf );
         end
         else
            TDataSet( oUniDBComboBox.DataSource.DataSet ).FieldByName( oUniDBComboBox.DataField ).AsString := AnsiUpperCase( Cliente.uf );
      end;

      if pCidade <> nil then
      begin
         oUniDBEdit := TUniDBEdit( pCidade );
         if oUniDBEdit <> nil then
            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := AnsiUpperCase( Cliente.municipio );
      end;

      if pBairro <> nil then
      begin
         oUniDBEdit := TUniDBEdit( pBairro );
         if oUniDBEdit <> nil then
            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := AnsiUpperCase( Cliente.bairro );
      end;

      if pEndereco <> nil then
      begin
         oUniDBEdit := TUniDBEdit( pEndereco );
         if oUniDBEdit <> nil then
            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := AnsiUpperCase( Cliente.logradouro );
      end;

      if pNumero <> nil then
      begin
         oUniDBEdit := TUniDBEdit( pNumero );
         if oUniDBEdit <> nil then
            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := AnsiUpperCase( Cliente.numero );
      end;

      if pCep <> nil then
      begin
         oUniDBEdit := TUniDBEdit( pCep );
         if oUniDBEdit <> nil then
            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := AnsiUpperCase( Cliente.cep );
      end;

      if pComplemento <> nil then
      begin
         oUniDBEdit := TUniDBEdit( pComplemento );
         if oUniDBEdit <> nil then
            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := AnsiUpperCase( Cliente.complemento );
      end;

      if pTelefone <> nil then
      begin
         oUniDBEdit := TUniDBEdit( pTelefone );
         if oUniDBEdit <> nil then
            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := AnsiUpperCase( Cliente.telefone );
      end;

      if pRazSoc <> nil then
      begin
         oUniDBEdit := TUniDBEdit( pRazSoc );
         if oUniDBEdit <> nil then
            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := AnsiUpperCase( Cliente.nome );
      end;

      if pFantasia <> nil then
      begin
         oUniDBEdit := TUniDBEdit( pFantasia );
         if oUniDBEdit <> nil then
            TDataSet( oUniDBEdit.DataSource.DataSet ).FieldByName( oUniDBEdit.DataField ).AsString := AnsiUpperCase( Cliente.fantasia );
      end;
    end
    else
    begin
      if pUF <> nil then
      begin
         pObj := pUF ;
         if ( pObj = nil ) or ( pObj.ClassType = TUniCombobox )  then
            oUniComboBox := TUniComboBox( pUF );
         if ( pObj <> nil ) and ( oUniComboBox = nil ) then
         begin
            oUniEdit := TUniEdit( pObj );
            oUniEdit.Text := AnsiUpperCase( Cliente.uf );
         end
         else
            oUniDBComboBox.Text := AnsiUpperCase( Cliente.uf );
      end;

      if pCidade <> nil then
      begin
         oUniEdit := TUniEdit( pCidade );
         if oUniEdit <> nil then
            oUniEdit.Text := AnsiUpperCase( Cliente.municipio );
      end;

      if pBairro <> nil then
      begin
         oUniEdit := TUniEdit( pBairro );
         if oUniEdit <> nil then
            oUniEdit.Text := AnsiUpperCase( Cliente.bairro );
      end;

      if pEndereco <> nil then
      begin
         oUniEdit := TUniEdit( pEndereco );
         if oUniEdit <> nil then
            oUniEdit.Text := AnsiUpperCase( Cliente.logradouro );
      end;

      if pNumero <> nil then
      begin
         oUniEdit := TUniEdit( pNumero );
         if oUniEdit <> nil then
            oUniEdit.Text := AnsiUpperCase( Cliente.numero );
      end;

      if pCep <> nil then
      begin
         oUniEdit := TUniEdit( pCep );
         if oUniEdit <> nil then
            oUniEdit.Text := AnsiUpperCase( Cliente.cep );
      end;

      if pComplemento <> nil then
      begin
         oUniEdit := TUniEdit( pComplemento );
         if oUniEdit <> nil then
            oUniEdit.Text := AnsiUpperCase( Cliente.complemento );
      end;

      if pTelefone <> nil then
      begin
         oUniEdit := TUniEdit( pTelefone );
         if oUniEdit <> nil then
            oUniEdit.Text := AnsiUpperCase( Cliente.telefone );
      end;

      if pRazSoc <> nil then
      begin
         oUniEdit := TUniEdit( pRazSoc );
         if oUniEdit <> nil then
            oUniEdit.Text := AnsiUpperCase( Cliente.nome );
      end;

      if pFantasia <> nil then
      begin
         oUniEdit := TUniEdit( pFantasia );
         if oUniEdit <> nil then
            oUniEdit.Text := AnsiUpperCase( Cliente.fantasia );
      end;


//      oUniEdit := TUniEdit( pIE );
//      if oUniEdit <> nil then
//         oUniEdit.Text := Cliente.inscricao_estadual ;
    end;
    // presponsavel.Text := Cliente.qs

   (*
   // pegando nome do dono - so retorna 1, se quiser todos
   // coloca em uma string list ou memo
   jsonObject := TJSONObject.ParseJSONValue( dm_rc.RESTResponseRC.JSONText ) as TJSONObject;
    try
      jsonArray := jsonObject.GetValue('qsa') as TJSONArray;
      for i := 0 to jsonArray.Count - 1 do
      begin
        qsaObject := jsonArray.Items[i] as TJSONObject;
        if Assigned( qsaObject ) then // verifica se o item é realmente um objeto JSON
        begin
          UniMemo1.Lines.Add( qsaObject.GetValue('nome').Value );
          nome_dono := qsaObject.GetValue('nome').Value;
          edtresponsavel.Text := nome_dono;
        end;
      end;
    finally
      jsonObject.Free;
    end;
    // pegando os CNAE principal
    // coloca em uma string list ou memo
    jsonObject := TJSONObject.ParseJSONValue( dm_rc.RESTResponse1.JSONText ) as TJSONObject;
    try
      jsonArray := jsonObject.GetValue( 'atividade_principal' ) as TJSONArray;
      for at := 0 to jsonArray.Count - 1 do
      begin
        atividade_principalObject := jsonArray.Items[at] as TJSONObject;
        if Assigned(atividade_principalObject) then // verifica se o item é realmente um objeto JSON
        begin
          UniMemo1.Lines.Add(atividade_principalObject.GetValue( 'code' ).Value);
          UniMemo1.Lines.Add(atividade_principalObject.GetValue( 'text' ).Value);
          atividade_principal := atividade_principalObject.GetValue( 'text' ).Value;
        end;
      end;
    finally
      jsonObject.Free;
    end;
    // pegando os CNAE secundario
    // coloca em uma string list ou memo
    jsonObject := TJSONObject.ParseJSONValue(dm_rc.RESTResponse1.JSONText ) as TJSONObject;
    try
      jsonArray := jsonObject.GetValue( 'atividades_secundarias' ) as TJSONArray;
      for at := 0 to jsonArray.Count - 1 do
      begin
        atividade_secundariaObject := jsonArray.Items[at] as TJSONObject;
        if Assigned(atividade_secundariaObject) then // verifica se o item é realmente um objeto JSON
        begin
          UniMemo1.Lines.Add(atividade_secundariaObject.GetValue( 'code' ).Value);
          UniMemo1.Lines.Add(atividade_secundariaObject.GetValue( 'text' ).Value);
          atividade_secundaria := atividade_secundariaObject.GetValue( 'text' ).Value;
        end;
      end;
    finally
      jsonObject.Free;
    end;
    *)
  finally
    Cliente.Free;
  end;
end;
//var
//   oEdit : TUniEdit;
//begin
//     if pForm <> nil then
//     begin
//        oEdit := TUniEdit ( rc_FindObject( 'edSearchFilter' , pForm ) );
//        oEdit.Text := pFilter;
//     end
//     else
//        dm_rc.rc_ShowSweetAlertSimple( 'rc_SearchFilterExecute: I Can not find the frame/form or component' );
//end;

end.
