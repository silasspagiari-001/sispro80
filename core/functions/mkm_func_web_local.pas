unit mkm_func_web_local; //8.5.0.1

interface

uses
    System.SysUtils,
    vcl.Forms,
    System.Classes ,
    System.TypInfo,
    JSON, DBXJSON, DBXJSONReflect, System.DateUtils,
    //8.4.0.0 TList, TComparer
    System.Generics.Collections, System.Generics.Defaults,
    System.NetEncoding, Winapi.ShellAPI,
    // feedback: Mesut from Turkey
    {$ifdef MSWINDOWS}
    Winapi.Windows,
    {$endif}
    System.UIConsts, idGlobal,//feedback: Mesut from Turkey to Linux( 6.0.0.0 )
    jpeg, pngimage,
    math, System.Rtti, System.StrUtils, Vcl.Graphics, Data.Db, uconsts, uconsts_cfg, uniComboBox, uniImage, uniPanel,
    UniGuiClasses, UniEdit, uniGUIApplication; //7.5.0.0


//8.5.0.0
function StrContains(const S1, S2: string): Boolean;
function StrPosicao(const S, SubStr: string; Index: Integer): Integer;
function DataPonto(F_DATA:String): string;
function StrZeroS(Const X: String; Len: Integer): string;
function StrAllTrim(const S: string): string;
function StrReplicate(const S: string; Count: Integer): string;
function StrRTrim(const S: string): string;
function StrLTrim(const S: string): string;
function StrLeft(const S: string; Count: Integer): string;
function EndOfMonth(Dt: TDateTime): TDateTime;
function StrEmpty(const S: string): Boolean;
function MRound(Value: Double; Dec: Integer): Double;
function Pow(X, Y: Double): Double;
function Explode(str, separador: string): TStringList;

implementation

uses str_func, untDM_RC, MainModule, ServerModule;//7.3.0.0

function Explode(str, separador: string): TStringList;
var
  p: integer;
begin
  Result := TStringList.Create;
  p := Pos(separador, str);
  while (p > 0) do
  begin
    Result.Add(Copy(str, 1, p-1));
    Delete(str, 1, p + Length(separador) - 1);
    p := Pos(separador, str);
  end;
  if (str <> '') then  Result.Add(str);
end;

function MRound(Value: Double; Dec: Integer): Double;
var
  Ord: Double;
  Sign: integer;
begin
  Sign := 1;
  if Value < 0 then
    Sign := -1;
  Ord := Pow(10, Dec);
  Result := Value - (Frac(Frac(Value) * Ord) / Ord);
  if Abs(Frac(Frac(Value) * Ord)) >= 0.5 then
    Result := Result + (Pow(10, -Dec) * Sign);
end;

function Pow(X, Y: Double): Double;
begin
  Result := Exp(Ln(X) * Y);
end;


function StrEmpty(const S: string): Boolean;
begin
   Result := (S = '');
end;

function EndOfMonth(Dt: TDateTime): TDateTime;
var
  Y, M, D: Word;
begin
  DecodeDate(Dt, Y, M, D);
  Result := EncodeDate(Y, M, DaysInMonth(Dt));
end;

function StrLeft(const S: string; Count: Integer): string;
begin
  Result := Copy(S, 1, Count);
end;

function StrLTrim(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  if S = '' then
    Exit;
  I := 1;
  while (S[I] = ' ') and (I <= Length(S)) do
    Inc(I);
  Result := Copy(S, I, Length(S));
end;

function StrRTrim(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  if S = '' then
    Exit;
  I := Length(S);
  while (S[I] = ' ') and (I > 0) do
    Dec(I);
  Result := Copy(S, 1, I);
end;


function StrReplicate(const S: string; Count: Integer): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Count do
    Result := Result + S;
end;

function StrAllTrim(const S: string): string;
begin
  Result := StrRTrim(StrLTrim(S));
end;

function DataPonto(F_DATA:String): string;
begin
  result := Copy(F_DATA,1, 2) + '.' +  Copy(F_DATA,4, 2) + '.' + Copy(F_DATA,7, 4);
end;

function StrZeroS(Const X: String; Len: Integer): string;
var
  S: string;
begin
  S := StrAllTrim(StrLeft(X,Len));
  Result := StrReplicate('0', Len - Length(S)) + S;
end;


function StrContains(const S1, S2: string): Boolean;
begin
//  Result := (StrPos(S1, S2, 1) > 0);
  if StrPosicao(S1,S2,1) > 0 then
    result := True
  else
    result := False;
end;

function StrPosicao(const S, SubStr: string; Index: Integer): Integer;
var
  Found, I: Integer;
begin
  Result := 0;
  if (Index < 1) or (S = '') or (SubStr = '') then
    Exit;
  Found := 0;
  I := 1;
  while (I <= Length(S)) and (Found < Index) do
    begin
      if Copy(S, I, Length(SubStr)) = SubStr then
        Inc(Found);
      Inc(I);
    end;
  if Found = Index then
    Result := I - 1;
end;

//8.5.0.0

end.
