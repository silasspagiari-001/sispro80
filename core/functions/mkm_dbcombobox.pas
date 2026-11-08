unit mkm_dbcombobox; //7.0.0.0 // original developed by Mr. JOSAURO


interface

uses
    uniDBComboBox, uniGUIFrame, uniGUIForm, System.SysUtils, vcl.Graphics,
    System.Classes, uniGUIClasses, uconsts, uconsts_cfg, TypInfo, Data.DB;

procedure rc_UpdateDBComboBox(pForm : TObject; pIn : boolean; pDataSource : TDataSource = nil ); //7.0.0.0

implementation
{------------------------------------------------------------------------------}
procedure rc_UpdateDBComboBox(pForm : TObject; pIn : boolean; pDataSource : TDataSource);
var
  I      : Integer;
  sHints : string;
  iPos   : integer;
  I2     : Integer;
  aOpt   : array[0..500] of string;
  I3     : integer;
  cbbx   : TUniDBComboBox;
  cTemp  : string;
  cTemp2 : string;
  bUpdateSameDS : boolean; //7.0.0.0
begin
  //[PT]
  // Atualiza o banco de dados conforme o valor definido no Hints para um campo
  // Combobox, onde o valor persistido no banco não é o Indice mas uma string/valor
  //  Ex: Tipo FJ  hints= '[[cbbx:{F,J}]]  será gravado F ou J conforme o ItemIndex do combobox
  //      Estado Civil     hints= '[[cbbx:{S,C,D,E,V,P}]]  Grava no banco a letra conforme o esta civil (Solteiro, Casado, Divorciado,Desquitado,Viuvo, Separado)
  // Quando pIn for false o ItemIndex é setado com o a posição do valor no Hints.
  //        pIn for true  o Field é atualizado com o valor na posição do Hints conforme o ItemIndex.
  //[EN]
  // Update the database according to the value defined in Hints for a field
  // Combobox, where the value persisted in the database is not the Index but a string/value
  // Ex: Type FJ hints= '[[cbbx:{F,J}]] F or J will be recorded according to the ItemIndex of the combobox
  // Marital Status hints= '[[cbbx:{S,C,D,E,V,P}]] Saves the letter in the bank according to marital status (Single, Married, Divorced, Broken, Widowed, Separated)
  // When pIn is false the ItemIndex is set to the position of the value in Hints.
  // pIn is true the Field is updated with the value at the Hints position according to the ItemIndex.
  I3 := 0;
  //7.0.0.0
  bUpdateSameDS := false;
//  if pDataSource = nil then
//  begin
//       pDataSource := TDataSource( TComponent( pForm ).FindComponent( 'dsMaster' ) );
//  end;
  for I := 0 to TComponent( pForm ).ComponentCount -1 do
  begin
    if TComponent(pForm).Components[i] is TUniDBComboBox then
    begin
      cbbx   := TUniDBComboBox(TComponent(pForm).Components[i]);
      sHints := cbbx.Hint;
      iPos := pos('cbbx:{', sHints);
      if (iPos > 0) then
      begin
        cTemp := copy(sHints, iPos+6, 200);
        iPos  := pos('}', cTemp);
        if iPos > 0 then
        begin
          cTemp := copy(cTemp, 1, iPos-1);
          I3    := 0;
          while cTemp <> '' do
          begin
            iPos := pos(',', cTemp);
            if iPos > 0 then
            begin
              cTemp2 := copy(cTemp,1, ipos-1);
              cTemp  := trim(copy(cTemp,ipos+1, 200));
              aOpt[I3] := cTemp2;
              inc(I3);
            end
            else
            if cTemp <> '' then
            begin
              aOpt[I3] := cTemp;
              cTemp     := '';
            end;
          end;
        end;
        //7.0.0.0
        //[PT] Atualiza o Valor do ComboBox ou Atualiza O campo no DataSet;
        //[EN] Updates the ComboBox Value or Updates the field in the DataSet;
        if ( cbbx.DataSource <> nil ) and ( cbbx.DataSource.DataSet <> nil ) and ( cbbx.DataSource.DataSet.Active ) then
        begin
           bUpdateSameDS := ( pDataSource = nil ) or ( pDataSource = cbbx.DataSource ) ;
           if bUpdateSameDS then
           begin
              if pIn then   // Atualiza valor do ComboBox;  / // Update ComboBox value;
              begin
                 for I2 := 0 to I3 do
                 if cbbx.DataSource.DataSet.FieldByName(cbbx.DataField).Value = aOpt[I2] then
                 begin
                      cbbx.ItemIndex := I2;
                      break;
                 end;
              end
              else
              if (cbbx.ItemIndex > -1) and (cbbx.ItemIndex <= I3) then // Atualiza Field no DataSet  / Update Field in DataSet
                 cbbx.DataSource.DataSet.FieldByName(cbbx.DataField).Value := aOpt[cbbx.ItemIndex];
           end;
        end;
      end;
    end;
  end;
end;
end.
