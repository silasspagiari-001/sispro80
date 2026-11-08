unit mkm_funcoes;

interface

uses
  FireDAC.Comp.Client, Data.DB, REST.Response.Adapter,System.Classes,System.DateUtils ;


function  Gera_Guid: String;
function  StrSubst(const S, Del, Ins: string; Count: Integer): string;
function  StrContains(const S1, S2: string): Boolean;
function  StrPos(const S, SubStr: string; Index: Integer): Integer;
function  CriaMemoria (tabela: String): TFDMemTable;
function  tratanome(aux: string): String;
function  Trocarletra(Str:String): String;
function  PrimeiraLetraMaiscula(Str: string): string;
function  Sigla_Mes(Const F_DATA:TDateTime): String;
Function  DataValida(sData : String): Boolean;
function  Month(Dt: TDateTime): Integer;
function  StrRight(const S: string; Count: Integer): string;
Function  FORMATA_CEP(const F_CLICEP:string):String;
function  ExtensoMes(n: Integer): String;
function  CasasDecimais(const f_valor:Real):string;
Function  Formata_Cnpj(const F_CLICNP:string):String;
function  Busca_Array(F_CAMPO:string;F_ARRAY:array of String):Boolean;
function  NomeEstado(F_ESTADO : String): String;
function  Retornastatustable(DataSet: TDataSet): String;
function  RemoverEspeciais(Str:String): String;
function  StrLeft(const S: string; Count: Integer): string;
function  ValidaSenha(F_NIVEL,F_VALOR,F_SENHA :String):Boolean;
function  DataSetToJsonTXT(pDataSet: TDataSet): String;
procedure JsonToDataset(aDataset : TDataSet; aJSON : string);
function  Validacaminho(pempresa:integer;caminho,pcnpj,ptipo,pemissao,peventosnfe:string):string;
function  ValidadorAcbr(const campo,tipo:string):string;
procedure Exclui_Movimento(F_TABELA,F_SERIE:String;F_EMPRESA,F_DOCUMENTO,F_NUMERO:Integer);
procedure EventoXmlAcbr(pnumero,pdocumento,pempresa,ptipo:string);
procedure GravaLog(lempresa,lusuario,lcodigo:integer;lloguin,lacao,ltabela,larquivo,dados:string);
function  Downloadremessa(const caminhoarq, nomearquivo : string): string;
function  RemoverORSql(Str:String): String;
function  Renovarsenha0(Str:String): String;
function  VerificafinanceiroPessoa(cpessoa :integer): Boolean;
function  DaysBetween(Dt1, Dt2: TDateTime): Integer;
function  DiaSemana(Data:TDateTime): String;
function  IncDay(const AValue: TDateTime;const ANumberOfDays: Integer): TDateTime;
function  DescricaoNotaEletronicaItens(const cnpj, lote:string;pproduto:integer): string;
function  Numero_Termo(const F_EMPRESA : Integer; F_ANO : String) : String;
function  Numero_TermoColeta(const F_EMPRESA : Integer; F_ANO : String) : String;
function  RemoverEspacos(Str:String): String;
function  ValidarChaveNFe(const ChaveNFe: string):boolean;
function  Acha_Item_Unidade(Const F_UNIDADE:String): String;
function  StrZero(Number: Double; Len, Dec: Integer): string;
function  SituacaoFicalChave(const chave :string) : string;
function  AliquotaTabelaIcms(const F_ORIGEM,F_DESTINO:string):Real;
function  Envia_EmailACBr(pempresa, pcontrole: integer; email:string):string;
function Enviar_Email(mensagem,titulo,empresa,destinatarioemail,anexo1,anexo2:String): Boolean;
procedure Lixeira(lempresa:integer;lloguin,ltabela,dados:string);
function  IsDir(const DirName: string): Boolean;
function Valor_Int(Const ValorString:string): integer;
function Valor_Str(Const ValorInteiro:integer): String;
function StrPosicao(const S, SubStr: string; Index: Integer): Integer;
function DataPonto(F_DATA:String): string;
function StrZeroS(Const X: String; Len: Integer): string;
function StrAllTrim(const S: string): string;
function StrReplicate(const S: string; Count: Integer): string;
function StrRTrim(const S: string): string;
function StrLTrim(const S: string): string;
function EndOfMonth(Dt: TDateTime): TDateTime;
function StrEmpty(const S: string): Boolean;
function MRound(Value: Double; Dec: Integer): Double;
function Pow(X, Y: Double): Double;
function Explode(str, separador: string): TStringList;



implementation

uses
  System.SysUtils, mkm_func_web, System.AnsiStrings, System.StrUtils,
  MainModule, mkm_procedures, System.TypInfo, uniMemo, Vcl.StdCtrls, untDM_RC,
  System.JSON, ACBrValidador, Vcl.Forms, Winapi.Windows,
  Vcl.Clipbrd,IdHTTP,idSMTP,IdText,IdAttachmentFile,IdMessage;

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

function Gera_Guid: String;
var
  Guid: TGUID;
begin
  CreateGUID(Guid);
  Result := StrSubst(StrSubst(GuidToString(Guid),'{','',0),'}','',0);
end;
function StrSubst(const S, Del, Ins: string; Count: Integer): string;
var
  I, Found: Integer;
  R: string;
begin
  R := S;
  if (S = '') or (Del = '') or (Del = Ins) then
    R := ''
  else
    begin
      Found := 0;
      I := 1;
      while ((Count = 0) or (Found < Count)) and (I <= Length(R)) do
        begin
          if Copy(R, I, Length(Del)) = Del then
            begin
              Inc(Found);
              Delete(R, I, Length(Del));
              Insert(Ins, R, I);
              Inc(I, Length(Ins));
            end
          else
            Inc(I);
        end;
    end;
  Result := R;
end;

function StrPos(const S, SubStr: string; Index: Integer): Integer;
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
function  CriaMemoria (tabela: String): TFDMemTable;
var
 QueryVirtual : TFDMemTable;
begin
  QueryVirtual  :=  TFDMemTable.Create(nil);
  try
    try

      if tabela = 'TOTALIZADOR' then
        begin
          QueryVirtual.FieldDefs.Add('QUANTIDADE'    , ftfloat);
          QueryVirtual.FieldDefs.Add('ESTADO'        , ftString,  010 , False);
        end;

      if tabela = 'IMPRESSAOFICHABATIDA' then
        begin
          QueryVirtual.FieldDefs.Add('QUANTIDADE'    , ftfloat);
          QueryVirtual.FieldDefs.Add('LOTE'          , ftString,  100 , False);
          QueryVirtual.FieldDefs.Add('TIPO'          , ftString,  010 , False);
          QueryVirtual.FieldDefs.Add('DESCRICAO'     , ftString,  100 , False);
          QueryVirtual.FieldDefs.Add('DATA'          , ftString,  010 , False);

        end;

      if tabela = 'HISTORICOSEMENTE' then
        begin
          QueryVirtual.FieldDefs.Add('PESSOA'        , ftfloat);
          QueryVirtual.FieldDefs.Add('NUMERO'        , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTO'       , ftfloat);
          QueryVirtual.FieldDefs.Add('PONTOS'        , ftfloat);
          QueryVirtual.FieldDefs.Add('PUREZA'        , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'    , ftfloat);
          QueryVirtual.FieldDefs.Add('DISPONIVEL'    , ftfloat);

          QueryVirtual.FieldDefs.Add('LOTESEMENTE'   , ftString,  100 , False);
          QueryVirtual.FieldDefs.Add('NOME'          , ftString,  100 , False);
          QueryVirtual.FieldDefs.Add('BOLETIM'       , ftString,  060 , False);
          QueryVirtual.FieldDefs.Add('SAFRA'         , ftString,  060 , False);
          QueryVirtual.FieldDefs.Add('CULTIVAR'      , ftString,  060 , False);
          QueryVirtual.FieldDefs.Add('EMISSAO'       , ftString,  010 , False);
          QueryVirtual.FieldDefs.Add('SERIE'         , ftString,  005 , False);
          QueryVirtual.FieldDefs.Add('UF'            , ftString,  002 , False);

        end;

      if tabela = 'CURVAABCPESSOA' then
        begin
          QueryVirtual.FieldDefs.Add('PESSOA'        , ftfloat);
          QueryVirtual.FieldDefs.Add('VALOR_PESSOA'  , ftfloat);
          QueryVirtual.FieldDefs.Add('PERC'          , ftfloat);
          QueryVirtual.FieldDefs.Add('NOME'          , ftString,  100 , False);
          QueryVirtual.FieldDefs.Add('CLASSE'        , ftString,  001 , False);
        end;

      if tabela = 'VENDASDETALHADASRESUMO' then
        begin
          QueryVirtual.FieldDefs.Add('QUANTIDADE'    , ftfloat);
          QueryVirtual.FieldDefs.Add('PESOLIQUIDO'   , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL'         , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTO'       , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCRICAO'     , ftString,  100 , False);
        end;

      if tabela = 'EXTRATOFINANCEIROPESSOA' then
        begin
          QueryVirtual.FieldDefs.Add('ABERTO'    , ftCurrency);
          QueryVirtual.FieldDefs.Add('PAGO'      , ftCurrency);
          QueryVirtual.FieldDefs.Add('SALDO'     , ftCurrency);
          QueryVirtual.FieldDefs.Add('TOTAL'     , ftCurrency);
          QueryVirtual.FieldDefs.Add('SERIE'     , ftString,  005 , False);
          QueryVirtual.FieldDefs.Add('EMISSAO'   , ftString,  010 , False);
          QueryVirtual.FieldDefs.Add('VENCIMENTO', ftString,  010 , False);
          QueryVirtual.FieldDefs.Add('PAGAMENTO' , ftString,  010 , False);
          QueryVirtual.FieldDefs.Add('SEQUENCIA' , ftInteger);
          QueryVirtual.FieldDefs.Add('NUMERO'    , ftInteger);
        end;


      if tabela = 'VENDASDETALHADAS' then
        begin
          QueryVirtual.FieldDefs.Add('SERIE'         , ftString,  010 , False);
          QueryVirtual.FieldDefs.Add('NOME'          , ftString,  100 , False);
          QueryVirtual.FieldDefs.Add('ESTADO'        , ftString,  002 , False);
          QueryVirtual.FieldDefs.Add('DESCRICAO'     , ftString,  100 , False);
          QueryVirtual.FieldDefs.Add('HORA'          , ftString,  015 , False);
          QueryVirtual.FieldDefs.Add('EMISSAO'       , ftString,  015 , False);
          QueryVirtual.FieldDefs.Add('OPERACAO_OP'   , ftString,  015 , False);
          QueryVirtual.FieldDefs.Add('NOME_EMPRESA'  , ftString,  100 , False);

          QueryVirtual.FieldDefs.Add('VLRTOTAL'      , ftfloat);
          QueryVirtual.FieldDefs.Add('PESOLIQUIDO'   , ftfloat);
          QueryVirtual.FieldDefs.Add('BASEICMS'      , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORICMS'     , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL'         , ftfloat);
          QueryVirtual.FieldDefs.Add('PRECO'         , ftfloat);
          QueryVirtual.FieldDefs.Add('PESSOA'        , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTO'       , ftfloat);
          QueryVirtual.FieldDefs.Add('PERCICMS'      , ftfloat);
          QueryVirtual.FieldDefs.Add('NUMERO'        , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'    , ftfloat);
          QueryVirtual.FieldDefs.Add('EMPRESA'       , ftfloat);

        end;

      if tabela = 'ALIQUOTAICMS' then
        begin
          QueryVirtual.FieldDefs.Add('CFOP1'            , ftString,  10 , False);
          QueryVirtual.FieldDefs.Add('ENDERECO'         , ftString,  100 , False);
          QueryVirtual.FieldDefs.Add('OPERACAO'         , ftString,  10 , False);

          QueryVirtual.FieldDefs.Add('VALORORIGINAL'    , ftfloat);
          QueryVirtual.FieldDefs.Add('BASEICMS'         , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORICMS'        , ftfloat);
          QueryVirtual.FieldDefs.Add('NAOTRIBUTADO'     , ftfloat);
          QueryVirtual.FieldDefs.Add('ENTRADA'          , ftfloat);
          QueryVirtual.FieldDefs.Add('SAIDA'            , ftfloat);

        end;

      if tabela = 'FINANCEIRO_SINTETICO' then
        begin
          QueryVirtual.FieldDefs.Add('NUMERO'      , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTO'     , ftfloat);
          QueryVirtual.FieldDefs.Add('PARCELA'     , ftString,  10 , False);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'   , ftfloat);
          QueryVirtual.FieldDefs.Add('PESSOA'      , ftfloat);
          QueryVirtual.FieldDefs.Add('EMPRESA'     , ftfloat);
          QueryVirtual.FieldDefs.Add('CARTEIRA'    , ftfloat);
          QueryVirtual.FieldDefs.Add('ORIGINAL'    , ftfloat);
          QueryVirtual.FieldDefs.Add('ATUAL'       , ftfloat);
          QueryVirtual.FieldDefs.Add('ABERTO'      , ftfloat);
          QueryVirtual.FieldDefs.Add('PAGO'        , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCANEXOVLR', ftfloat);

          QueryVirtual.FieldDefs.Add('PRAZO'       , ftString,  10 , False);
          QueryVirtual.FieldDefs.Add('NOME_EMPRESA', ftString,  100 , False);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'  , ftfloat);
          QueryVirtual.FieldDefs.Add('PERCPERCA'   , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE_PERCA'  , ftfloat);
          QueryVirtual.FieldDefs.Add('PRECO'             , ftfloat);
          QueryVirtual.FieldDefs.Add('EMISSAO'    , ftDateTime);
          QueryVirtual.FieldDefs.Add('DESCRICAO'  , ftString,  80 , False);
          QueryVirtual.FieldDefs.Add('DATAINICIAL', ftString,  10 , False);
          QueryVirtual.FieldDefs.Add('SERIE'      , ftString,  05 , False);
          QueryVirtual.FieldDefs.Add('VENCIMENTO' , ftDateTime);
          QueryVirtual.FieldDefs.Add('PAGAMENTO'  , ftString,  10 , False);
          QueryVirtual.FieldDefs.Add('NOME'       , ftString,  34 , False);
          QueryVirtual.FieldDefs.Add('SITUACAO'   , ftString,  20 , False);
          QueryVirtual.FieldDefs.Add('CPFCNPJ'    , ftString,  20 , False);

          QueryVirtual.FieldDefs.Add('DESCRICAO_CARTEIRA'  , ftString,  80   , False);
          QueryVirtual.FieldDefs.Add('OBSERVACOES'         , ftString,  300  , False);
          QueryVirtual.FieldDefs.Add('DESCANEXO'           , ftString,  1200 , False);
        end;

      if tabela = 'DUPLICATAMERCANTIL' then
        begin
          QueryVirtual.FieldDefs.Add('MEMNUM'                , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('MEMNOM'                , ftString,  100,False);
          QueryVirtual.FieldDefs.Add('MEMDTE'                , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('MEMVCT'                , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('MEMORD'                , ftString,  01, False);
          QueryVirtual.FieldDefs.Add('MEMVALORFINAL'         , ftString,  20, False);
          QueryVirtual.FieldDefs.Add('MEMPEDIDO'             , ftString,  20, False);
          QueryVirtual.FieldDefs.Add('EXTENSAO'              , ftString,  150, False);
          QueryVirtual.FieldDefs.Add('MEMVALORPARCELA'       , ftString,  20, False);
          QueryVirtual.FieldDefs.Add('MEMVALORTOTAL'         , ftString,  20, False);
        end;

      if tabela = 'TERMO' then
        begin
          QueryVirtual.FieldDefs.Add('LOTE'         , ftString,  50, False);
          QueryVirtual.FieldDefs.Add('BOLETIM'      , ftString,  50, False);
          QueryVirtual.FieldDefs.Add('DATABOLETIM'  , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('EMBALAGEM'    , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('OE'           , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('PN'           , ftString,  20, False);
          QueryVirtual.FieldDefs.Add('PESO'         , ftfloat);
          QueryVirtual.FieldDefs.Add('GERMINACAO'   , ftfloat);
          QueryVirtual.FieldDefs.Add('SEMDURAS'     , ftfloat);
          QueryVirtual.FieldDefs.Add('CODIGO'       , ftfloat);
          QueryVirtual.FieldDefs.Add('SS'           , ftfloat);
          QueryVirtual.FieldDefs.Add('SI'           , ftfloat);
          QueryVirtual.FieldDefs.Add('RP'           , ftfloat);
          QueryVirtual.FieldDefs.Add('SNT'          , ftfloat);
          QueryVirtual.FieldDefs.Add('PUREZA'       , ftfloat);
          QueryVirtual.FieldDefs.Add('SILVESTRES'   , ftfloat);
          QueryVirtual.FieldDefs.Add('NOCIVAS'      , ftfloat);
          QueryVirtual.FieldDefs.Add('CULTIVADAS'   , ftfloat);
          QueryVirtual.FieldDefs.Add('VALIDADEGERMINACAO'  , ftString,  10, False);
        end;

      if tabela = 'CONTRATO_NOTA' then
        begin
          QueryVirtual.FieldDefs.Add('PRODUTO'        , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADESACO' , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'     , ftfloat);
          QueryVirtual.FieldDefs.Add('PRECO'          , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL'          , ftfloat);
          QueryVirtual.FieldDefs.Add('PESOSACO'       , ftfloat);
          QueryVirtual.FieldDefs.Add('PESO'           , ftfloat);
          QueryVirtual.FieldDefs.Add('QTDESACO'       , ftfloat);
          QueryVirtual.FieldDefs.Add('DATA'           , ftDateTime);
          QueryVirtual.FieldDefs.Add('DESCRICAO'      , ftString,   100, False);
          QueryVirtual.FieldDefs.Add('UNIDADE'        , ftString,   005, False);
          QueryVirtual.FieldDefs.Add('LOTE'           , ftString,   100, False);

        end;

      if tabela = 'CONSULTABOLETIM' then
        begin
          QueryVirtual.FieldDefs.Add('PROTOCOLO'   , ftfloat);
          QueryVirtual.FieldDefs.Add('AMOSTRA'     , ftString,   20, False);
          QueryVirtual.FieldDefs.Add('SITUACAO'    , ftString,   15, False);
          QueryVirtual.FieldDefs.Add('BOLETIM'     , ftString,   15, False);
          QueryVirtual.FieldDefs.Add('NUMEROIR'    , ftString,   15, False);
          QueryVirtual.FieldDefs.Add('ESPECIE'     , ftString,   80, False);
          QueryVirtual.FieldDefs.Add('EMISSAO'     , ftString,   10, False);
          QueryVirtual.FieldDefs.Add('CULTIVAR'    , ftString,   80, False);
          QueryVirtual.FieldDefs.Add('ARQUIVO_IR'  , ftString,   80, False);
          QueryVirtual.FieldDefs.Add('ARQUIVO_BO'  , ftString,   80, False);
          QueryVirtual.FieldDefs.Add('CATEGORIA'   , ftString,   15, False);
          QueryVirtual.FieldDefs.Add('LOTE'        , ftString,   80, False);
          QueryVirtual.FieldDefs.Add('SAFRAVALIDA' , ftString,   20, False);
          QueryVirtual.FieldDefs.Add('ANALISE'     , ftString,   10, False);
          QueryVirtual.FieldDefs.Add('SOLICITADO'  , ftString,   10, False);
        end;

      if tabela = 'ARQUIVOREMESSA' then
        begin
          QueryVirtual.FieldDefs.Add('DATA_GERADA'   , ftString,   10, False);
          QueryVirtual.FieldDefs.Add('HORA_GERADA'   , ftString,   10, False);
          QueryVirtual.FieldDefs.Add('ARQUIVO'       , ftString,   10, False);
          QueryVirtual.FieldDefs.Add('detalhes'      , ftString,   05, False);
          QueryVirtual.FieldDefs.Add('LOG_INCLUSAO'  , ftString,   100, False);
          QueryVirtual.FieldDefs.Add('CAMINHO'       , ftString,   100, False);
        end;

      if tabela = 'REFERENCIACOMERCIAL' then
        begin
          QueryVirtual.FieldDefs.Add('VLRBASEICMS'           , ftfloat);
          QueryVirtual.FieldDefs.Add('VLRTOTAL'              , ftfloat);
          QueryVirtual.FieldDefs.Add('VLRICMS'               , ftfloat);
          QueryVirtual.FieldDefs.Add('NUMERO'                , ftfloat);
          QueryVirtual.FieldDefs.Add('TIPO'                  , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('SERIE'                 , ftString,   05, False);
          QueryVirtual.FieldDefs.Add('OPERACAO'              , ftString,   05, False);
          QueryVirtual.FieldDefs.Add('EMISSAO'               , ftString,   10, False);
        end;

      if tabela = 'HISTORICOBENEFICIAMENTO' then
        begin
          QueryVirtual.FieldDefs.Add('NUMERO'                , ftfloat);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'             , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'            , ftfloat);
          QueryVirtual.FieldDefs.Add('PUREZA'                , ftfloat);
          QueryVirtual.FieldDefs.Add('GERMINACAO'            , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCARTE'              , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORCULTURAL'         , ftfloat);
          QueryVirtual.FieldDefs.Add('NOMEPESSOA'            , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('SERIE'                 , ftString,  003, False);
          QueryVirtual.FieldDefs.Add('EMISSAO'               , ftString,  010, False);
          QueryVirtual.FieldDefs.Add('LOTEDESTINO'           , ftString,  020, False);
          QueryVirtual.FieldDefs.Add('BOLETIM'               , ftString,  020, False);
          QueryVirtual.FieldDefs.Add('TERMO'                 , ftString,  020, False);
        end;

      if tabela = 'FLUXOCAIXA' then
        begin
          QueryVirtual.FieldDefs.Add('SALDO'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTALPAGAR'            , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTALRECEBER'          , ftfloat);
          QueryVirtual.FieldDefs.Add('DIA'                   , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('VENCIMENTO'            , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('SEMANA'                , ftString,  20, False);
        end;

      if tabela = 'ESPECIE' then
        begin
          QueryVirtual.FieldDefs.Add('CODIGO'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCRICAO'              , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('POPULAR'                , ftString,  050, False);
        end;

      if tabela = 'CADASTRO_PRODUTOS' then
        begin
          QueryVirtual.FieldDefs.Add('CODIGO'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCRICAO'              , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('UNIDADE'                , ftString,  025, False);
          QueryVirtual.FieldDefs.Add('SEMENTENOME'            , ftString,  080, False);
          QueryVirtual.FieldDefs.Add('CULTIVAR'               , ftString,  025, False);
        end;

      if tabela = 'BUSCACADASTRO' then
        begin
          QueryVirtual.FieldDefs.Add('CODIGO'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('NOME'                   , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('CPFCNPJ'                , ftString,  025, False);
          QueryVirtual.FieldDefs.Add('CIDADE'                 , ftString,  080, False);
          QueryVirtual.FieldDefs.Add('ESTADO'                 , ftString,  002, False);
          QueryVirtual.FieldDefs.Add('TELEFONE'               , ftString,  025, False);
        end;

      if tabela = 'PESSOASPRODUTOS' then
        begin
          QueryVirtual.FieldDefs.Add('OPERACAO'        , ftfloat);
          QueryVirtual.FieldDefs.Add('NUMERO'          , ftfloat);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'       , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTO'         , ftfloat);
          QueryVirtual.FieldDefs.Add('PRECO'           , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'      , ftfloat);
          QueryVirtual.FieldDefs.Add('EMISSAO'         , ftString, 010, False);
          QueryVirtual.FieldDefs.Add('NOMEPRODUTO'     , ftString, 100, False);
          QueryVirtual.FieldDefs.Add('SERIE'           , ftString, 3  , False);
          QueryVirtual.FieldDefs.Add('DESCRICAO'       , ftString, 100, False);
        end;

      if tabela = 'KARDEXPRODUTO' then
        begin
          QueryVirtual.FieldDefs.Add('OPERACAO'        , ftfloat);
          QueryVirtual.FieldDefs.Add('NUMERO'          , ftfloat);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'       , ftfloat);
          QueryVirtual.FieldDefs.Add('PESSOA'          , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTO'         , ftfloat);
          QueryVirtual.FieldDefs.Add('PRECO'           , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL'           , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'      , ftfloat);
          QueryVirtual.FieldDefs.Add('PUREZA'          , ftfloat);
          QueryVirtual.FieldDefs.Add('PONTOS'          , ftfloat);
          QueryVirtual.FieldDefs.Add('ENTRADA'         , ftfloat);
          QueryVirtual.FieldDefs.Add('SAIDA'           , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDO'           , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDO_ANTERIOR'  , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOUN'         , ftfloat);

          QueryVirtual.FieldDefs.Add('ENTRADA_PONTO'   , ftfloat);
          QueryVirtual.FieldDefs.Add('SAIDA_PONTO'     , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDO_PONTO'     , ftfloat);
          QueryVirtual.FieldDefs.Add('PONTO_ANTERIOR'  , ftfloat);

          QueryVirtual.FieldDefs.Add('EMISSAO'         , ftDateTime);
          QueryVirtual.FieldDefs.Add('NOMEPESSOA'      , ftString, 100, False);
          QueryVirtual.FieldDefs.Add('NOMEPRODUTO'     , ftString, 100, False);
          QueryVirtual.FieldDefs.Add('SERIE'           , ftString, 3  , False);
          QueryVirtual.FieldDefs.Add('DESCRICAO'       , ftString, 100, False);
          QueryVirtual.FieldDefs.Add('UF'              , ftString, 2  , False);
          QueryVirtual.FieldDefs.Add('CPFCNPJ'         , ftString, 025, False);
          QueryVirtual.FieldDefs.Add('CIDADE'          , ftString, 100, False);
        end;

      if Tabela = 'ITENS_MOVIMENTO_TOTAL' then
        begin
          QueryVirtual.FieldDefs.Add('OPERACAO'        , ftfloat);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'       , ftfloat);
          QueryVirtual.FieldDefs.Add('PRECO'           , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCRICAO'       , ftString, 100, False);
          QueryVirtual.FieldDefs.Add('CST'             , ftString, 3, False);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'      , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTO'         , ftfloat);
          QueryVirtual.FieldDefs.Add('LIQUIDO'         , ftfloat);
          QueryVirtual.FieldDefs.Add('DESPESAS'        , ftfloat);
          QueryVirtual.FieldDefs.Add('BASEICMS'        , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORICMS'       , ftfloat);
          QueryVirtual.FieldDefs.Add('PERCICMS'        , ftfloat);
          QueryVirtual.FieldDefs.Add('REDUCAO'         , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORIPI'        , ftfloat);
          QueryVirtual.FieldDefs.Add('PERCIPI'         , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCONTOS'       , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL'           , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTOS'        , ftfloat);
          QueryVirtual.FieldDefs.Add('FRETE'           , ftfloat);

          QueryVirtual.FieldDefs.Add('BASE0'           , ftfloat);
          QueryVirtual.FieldDefs.Add('BASE1'           , ftfloat);
          QueryVirtual.FieldDefs.Add('BASE2'           , ftfloat);

          QueryVirtual.FieldDefs.Add('ICMS0'           , ftfloat);
          QueryVirtual.FieldDefs.Add('ICMS1'           , ftfloat);
          QueryVirtual.FieldDefs.Add('ICMS2'           , ftfloat);
        end;

      if Tabela = 'MESTRE_MOVIMENTO_TOTAL' then
        begin
          QueryVirtual.FieldDefs.Add('BASE_ICMS'       , ftfloat);
          QueryVirtual.FieldDefs.Add('VALOR_ICMS'      , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL_PRODUTO'   , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL_NOTA'      , ftfloat);
        end;


      if tabela = 'PLANOCONTAS' then
        begin
          QueryVirtual.FieldDefs.Add('CODIGO'                 , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('DESCRICAO'              , ftString,  80, False);
          QueryVirtual.FieldDefs.Add('ATIVO'                  , ftString,  01, False);
          QueryVirtual.FieldDefs.Add('TIPO'                   , ftString,  15, False);
          QueryVirtual.FieldDefs.Add('DESTINO'                , ftString,  15, False);
          QueryVirtual.FieldDefs.Add('CUSTO'                  , ftString,  15, False);
        end;

      if tabela = 'TITULOS' then
        begin
          QueryVirtual.FieldDefs.Add('VALORPAGO'              , ftfloat);
          QueryVirtual.FieldDefs.Add('CONTROLE'               , ftfloat);
          QueryVirtual.FieldDefs.Add('VENDEDOR'               , ftfloat);
          QueryVirtual.FieldDefs.Add('PARCELA'                , ftfloat);
          QueryVirtual.FieldDefs.Add('NUMERO'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('PRAZO'                  , ftfloat);

          QueryVirtual.FieldDefs.Add('SEQUENCIA'              , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORATUAL'             , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORORIGINAL'          , ftfloat);
          QueryVirtual.FieldDefs.Add('COMISSAO'               , ftfloat);
          QueryVirtual.FieldDefs.Add('PERCCOMISSAO'           , ftfloat);

          QueryVirtual.FieldDefs.Add('EMISSAO'                , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('VENCIMENTO'             , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('PAGAMENTO'              , ftString,  10, False);

          QueryVirtual.FieldDefs.Add('STATUS'                 , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('SERIE'                  , ftString,  10, False);

          QueryVirtual.FieldDefs.Add('PORTADOR'               , ftfloat);
          QueryVirtual.FieldDefs.Add('PORTADOR_DESCRICAO'     , ftString,  50, False);

          QueryVirtual.FieldDefs.Add('PESSOA'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('NOME_PESSOA'            , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('PESSOA_CPF'             , ftString,  20, False);
          QueryVirtual.FieldDefs.Add('PESSOA_TELEFONE'        , ftString,  20, False);

          QueryVirtual.FieldDefs.Add('PLANOCONTAS'            , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('PLANOCONTAS_DESCRICAO'  , ftString,  50, False);

          QueryVirtual.FieldDefs.Add('VENDEDOR_NOME'          , ftString,  80, False);
          QueryVirtual.FieldDefs.Add('VENDEDOR_COMISSAO'      , ftfloat);
        end;

      if tabela = 'LOTES' then
        begin
          QueryVirtual.FieldDefs.Add('SALDOFISCAL'              , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOKG'                  , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORCULTURAL'            , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOPONTO'               , ftfloat);

          QueryVirtual.FieldDefs.Add('NOME'                     , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('TIPO'                     , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('PRODUTO'                  , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('LOTE'                     , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('BOLETIM'                  , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('TERMO'                    , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('VENCIMENTO'               , ftString,  10,  False);
        end;

      if tabela = 'APURAICMS' then
        begin
          QueryVirtual.FieldDefs.Add('VALORORIGINAL'            , ftfloat);
          QueryVirtual.FieldDefs.Add('BASEICMS'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORICMS'                , ftfloat);
          QueryVirtual.FieldDefs.Add('NAOTRIBUTADO'             , ftfloat);
          QueryVirtual.FieldDefs.Add('ENTRADA'                  , ftfloat);
          QueryVirtual.FieldDefs.Add('SAIDA'                    , ftfloat);

          QueryVirtual.FieldDefs.Add('PIS'                      , ftfloat);
          QueryVirtual.FieldDefs.Add('COFINS'                   , ftfloat);
          QueryVirtual.FieldDefs.Add('CSLL'                     , ftfloat);
          QueryVirtual.FieldDefs.Add('ICMS'                     , ftfloat);
          QueryVirtual.FieldDefs.Add('IR'                       , ftfloat);
          QueryVirtual.FieldDefs.Add('CFOP'                     , ftfloat);

          QueryVirtual.FieldDefs.Add('ENDERECO'                 , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('OPERACAO'                 , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('CFOP1'                    , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('DIAANO'                   , ftString,  20,  False);
          QueryVirtual.FieldDefs.Add('ESTADO'                   , ftString,  10,  False);

        end;

      if tabela = 'FINANCEIRO' then
        begin
          QueryVirtual.FieldDefs.Add('VALORATUAL'               , ftfloat);
          QueryVirtual.FieldDefs.Add('NUMERO'                   , ftfloat);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'                , ftfloat);
          QueryVirtual.FieldDefs.Add('PORTADOR'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('DIASABERTO'               , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCRICAO_PORTADOR'       , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('VENCIMENTO'               , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('EMISSAO'                  , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('SERIE'                    , ftString,  05,  False);
          QueryVirtual.FieldDefs.Add('CIDADE'                   , ftString,  50,  False);
          QueryVirtual.FieldDefs.Add('ESTADO'                   , ftString,  05,  False);
        end;

      if tabela = 'GRAFICO' then
        begin
          QueryVirtual.FieldDefs.Add('TOTAL'                , ftfloat);
          QueryVirtual.FieldDefs.Add('ESTADO'               , ftString,  05,  False);
          QueryVirtual.FieldDefs.Add('MES'                  , ftString,  15,  False);

        end;
      if tabela = 'MEMCAD' then
        begin
          QueryVirtual.FieldDefs.Add('NUMERO'               , ftfloat);
          QueryVirtual.FieldDefs.Add('CODIGO'               , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'           , ftfloat);
          QueryVirtual.FieldDefs.Add('BASEICMS'             , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTALBASE'            , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTALICMS'            , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORICMS'            , ftfloat);
          QueryVirtual.FieldDefs.Add('OPERACAO'             , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL'                , ftfloat);
          QueryVirtual.FieldDefs.Add('PESSOA'               , ftfloat);
          QueryVirtual.FieldDefs.Add('CONDICAO'             , ftfloat);
          QueryVirtual.FieldDefs.Add('VENDEDOR'             , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTALCOM'             , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORPAGO'            , ftfloat);
          QueryVirtual.FieldDefs.Add('COMISSAO'             , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTO'              , ftfloat);
          QueryVirtual.FieldDefs.Add('ENTRADAUN'            , ftfloat);
          QueryVirtual.FieldDefs.Add('SAIDAUN'              , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOUN'              , ftfloat);
          QueryVirtual.FieldDefs.Add('ATUAL'                , ftfloat);
          QueryVirtual.FieldDefs.Add('PESOSACO'             , ftfloat);
          QueryVirtual.FieldDefs.Add('ENTRADA'              , ftfloat);
          QueryVirtual.FieldDefs.Add('ENTPONTOS'            , ftfloat);
          QueryVirtual.FieldDefs.Add('ENTSACOS'             , ftfloat);
          QueryVirtual.FieldDefs.Add('PRECO'                , ftfloat);
          QueryVirtual.FieldDefs.Add('MEDIA'                , ftfloat);
          QueryVirtual.FieldDefs.Add('MEDIATOTAL'           , ftfloat);
          QueryVirtual.FieldDefs.Add('SAIDA'                , ftfloat);
          QueryVirtual.FieldDefs.Add('SAIPONTOS'            , ftfloat);
          QueryVirtual.FieldDefs.Add('SAISACOS'             , ftfloat);
          QueryVirtual.FieldDefs.Add('QTESACOS'             , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOPONTOS'          , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOSACOS'           , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDO'                , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOKG'              , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORCULTURAL'        , ftfloat);
          QueryVirtual.FieldDefs.Add('PUREZA'               , ftfloat);
          QueryVirtual.FieldDefs.Add('PONTOS'               , ftfloat);

          QueryVirtual.FieldDefs.Add('TIPO'                 , ftString,  05,  False);
          QueryVirtual.FieldDefs.Add('SERIE'                , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('DATAINICIAL'          , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('BOLETIM'              , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('SAFRA'                , ftString,  100, False);

          QueryVirtual.FieldDefs.Add('DESCRICAO'            , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('CABECALHO'            , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('FANTASIA'             , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('NOME'                 , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('ENDERECO'             , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('ESTADO'               , ftString,  05 , False);
          QueryVirtual.FieldDefs.Add('CIDADE'               , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('PEDIDO'               , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('NOMEPESSOA'           , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('DESOPERACAO'          , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'            , ftString,  05 , False);
          QueryVirtual.FieldDefs.Add('STATUSTIPO'           , ftString,  01 , False);
          QueryVirtual.FieldDefs.Add('SITUACAO'             , ftString,  10 , False);
          QueryVirtual.FieldDefs.Add('DETALHES'             , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('EMISSAO'              , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('PAGAMENTO'            , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('VENCIMENTO'           , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('CATEGORIA'            , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('TERMO'                , ftString,  20,  False);
          QueryVirtual.FieldDefs.Add('CULTIVAR'             , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('ESPECIE'              , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('LOTEORIGEM'           , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('LOTE'                 , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('NUMERONOTA'           , ftString,  015, False);
          QueryVirtual.FieldDefs.Add('TIPO_OP'              , ftString,  015, False);
        end;

      if tabela = 'BANCOS' then
        begin
          QueryVirtual.FieldDefs.Add('DESCRICAOAPLICACAO'   , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('HISTORICO'            , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('DESCPORTADOR'         , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('PLANO'                , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('SERIE'                , ftString,  05,  False);
          QueryVirtual.FieldDefs.Add('TIPO'                 , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('EMISSAO'              , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('PAGAMENTO'            , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('SINAL'                , ftString,  03,  False);

          QueryVirtual.FieldDefs.Add('PORTADOR'             , ftfloat);
          QueryVirtual.FieldDefs.Add('CONTROLE'             , ftfloat);
          QueryVirtual.FieldDefs.Add('APLICACAO'            , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDO2'               , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDO'                , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOANTERIOR'        , ftfloat);
          QueryVirtual.FieldDefs.Add('CREDITO'              , ftfloat);
          QueryVirtual.FieldDefs.Add('DEBITO'               , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORPAGO'            , ftfloat);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'            , ftfloat);
          QueryVirtual.FieldDefs.Add('LIMITE'               , ftfloat);
          QueryVirtual.FieldDefs.Add('EMPRESA'              , ftfloat);
        end;

      if Tabela = 'VNC' then
        begin
          QueryVirtual.FieldDefs.Add('NUMERO'       , ftString, 15, False);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'    , ftString, 5 , False);
          QueryVirtual.FieldDefs.Add('TOTAL'        , ftfloat);
          QueryVirtual.FieldDefs.Add('VENCIMENTO'   , ftDateTime);
        end;

    except
//       on e: exception do gera_log('CriaMemoria: ' + e.message + Tabela);
    end;
  finally
    QueryVirtual.Open;
    result := QueryVirtual;
  end;
end;
function tratanome(aux: string): String;
var
  i: integer;
begin
  aux:=lowercase(aux);
 if length(aux)<>0then
  Begin
    aux[1]:=Upcase(aux[1]);
    for i:=2 to length(aux) do
      if aux[i]=' '
      then aux[i+1]:=Upcase(aux[i+1]);
    tratanome:=aux;
  end
 else
   tratanome:='';
end;
function Trocarletra(Str:String): String;
Const ComAcento = 'ÇÔÃÕÂÊÁ';
      SemAcento = 'çôãõâêá';
Var
  R: Integer;
Begin
  for R := 1 to Length(Str) do
    begin
      if Pos(Copy(Str,R,1),ComAcento)<>0 Then
        begin
          Str := StrSubst(Str,Copy(Str,R,1),SemAcento[Pos(Copy(Str,R,1),ComAcento)],1);
        end;
    end;
  Result := Str;
end;
function PrimeiraLetraMaiscula(Str: string): string;
 var
   i: integer;
   esp: boolean;
 begin
   str := LowerCase(Trim(str));
   for i := 1 to Length(str) do
   begin
     if i = 1 then
       str[i] := UpCase(str[i])
     else
       begin
         if i <> Length(str) then
         begin
           esp := (str[i] = ' ');
           if esp then
             str[i+1] := UpCase(str[i+1]);
         end;
       end;
   end;
   Result := Str;
 end;

Function DataValida(sData : String): Boolean;
Begin
  Try
    sData := DateToStr(StrToDate(sData));
    Result := True;
  Except
    Result := False;
  End;
End;

function Sigla_Mes(Const F_DATA:TDateTime): String;
begin
 if month(F_DATA) =  1 then result := 'Jan01';
 if month(F_DATA) =  2 then result := 'Fev02';
 if month(F_DATA) =  3 then result := 'Mar03';
 if month(F_DATA) =  4 then result := 'Abr04';
 if month(F_DATA) =  5 then result := 'Mai05';
 if month(F_DATA) =  6 then result := 'Jun06';
 if month(F_DATA) =  7 then result := 'Jul07';
 if month(F_DATA) =  8 then result := 'Ago08';
 if month(F_DATA) =  9 then result := 'Set09';
 if month(F_DATA) = 10 then result := 'Out10';
 if month(F_DATA) = 11 then result := 'Nov11';
 if month(F_DATA) = 12 then result := 'Dez12';
end;


function Month(Dt: TDateTime): Integer;
var
  Y, M, D: Word;
begin
  DecodeDate(Dt, Y, M, D);
  Result := M;
end;
function StrRight(const S: string; Count: Integer): string;
begin
  Result := Copy(S, Length(S) - Count + 1, Count);
end;
Function FORMATA_CEP(const F_CLICEP:string):String;
begin
  result:=Copy(F_CLICEP, 1, 5) + '-' + Copy(F_CLICEP, 6, 3);
end;
function ExtensoMes(n: Integer): String;
var
 m : string;
begin
 Case n Of
    01 : m:= 'Janeiro';
    02 : m:= 'Fevereiro';
    03 : m:= 'Março';
    04 : m:= 'Abril';
    05 : m:= 'Maio';
    06 : m:= 'Junho';
    07 : m:= 'Julho';
    08 : m:= 'Agosto';
    09 : m:= 'Setembro';
    10 : m:= 'Outubro';
    11 : m:= 'Novembro';
    12 : m:= 'Dezembro';
  end;
  Result := m;
end;
function CasasDecimais(const f_valor: Real): string;
var
  posicao : Extended;
  I       : Integer;
  retorno : string;
begin

  if f_valor < 1.000 then
    Result :=  FormatFloat('##,#0.0000',f_valor)
  else
  if (f_valor > 1.000) and (f_valor < 9.999) then
    Result :=  FormatFloat('##,#0.000',f_valor)
  else
  if (f_valor > 10.00) and (f_valor < 99.99) then
    Result :=  FormatFloat('##,#0.00',f_valor)
  else
  if (f_valor > 100.0) and (f_valor < 999.9) then
    Result :=  FormatFloat('##,#0.0',f_valor)
  else
    Result :=  FormatFloat('##,#0',f_valor)
end;
Function Formata_Cnpj(const F_CLICNP:string):String;
begin
  if Length(F_CLICNP) = 11 then
    result:=Copy(F_CLICNP, 1, 3) + '.' + Copy(F_CLICNP, 4, 3) + '.' + Copy(F_CLICNP, 7, 3) + '-' + Copy(F_CLICNP, 10, 2)
  else
    result:=Copy(F_CLICNP, 1, 2) + '.' + Copy(F_CLICNP, 3, 3) + '.' + Copy(F_CLICNP, 6, 3) + '/' + Copy(F_CLICNP, 9, 4)+ '-' + Copy(F_CLICNP, 13, 2);
end;
function Busca_Array(F_CAMPO:string;F_ARRAY:array of String):Boolean;
Var Indice : Integer;
begin
  Indice := AnsiIndexText(F_CAMPO,F_ARRAY);
  if Indice = -1 then
    result := False
  else
    Result := True;
end;
function NomeEstado(F_ESTADO : String): String;
begin
  case AnsiIndexStr(F_ESTADO,['MS','SP','MT','PR','AM','RR','MG','DF','GO','PA','PI','AL','RJ','SE','CE','RN','RS','SC','ES','AC','MA','PE','RO','TO','BH','PA','AP']) of
     0 : Result := 'Mato Grosso do Sul';
     1 : Result := 'São Paulo';
     2 : Result := 'Mato Grosso';
     3 : Result := 'Paraná';
     4 : Result := 'Amazonas';
     5 : Result := 'Roraima';
     6 : Result := 'Minas Gerais';
     7 : Result := 'Distrito Federal';
     8 : Result := 'Goias';
     9 : Result := 'Paraiba';
    10 : Result := 'Piaui';
    11 : Result := 'Alagoas';
    12 : Result := 'Rio de Janeiro';
    13 : Result := 'Sergipe';
    14 : Result := 'Ceará';
    15 : Result := 'Rio Grande do Norte';
    16 : Result := 'Rio Grande do Sul';
    17 : Result := 'Santa Catarina';
    18 : Result := 'Espirito Santo';
    19 : Result := 'Acre';
    20 : Result := 'Maranhão';
    21 : Result := 'Pernambuco';
    22 : Result := 'Roraima';
    23 : Result := 'Tocantins';
    24 : Result := 'Bahia';
    25 : Result := 'Pará';
    26 : Result := 'Amapá';
  end;
end;
procedure Lixeira(lempresa:integer;lloguin,ltabela,dados:string);
var
  lixeiratab   : TFDQuery;
  listadados   : TUnimemo;
  i            : integer;
begin
  lixeiratab                               := TFDQuery.Create(nil);
  lixeiratab.Connection                    := mm.SQLConn;
  lixeiratab.UpdateOptions.UpdateTableName := 'LIXEIRA';

  lixeiratab.Close;
  lixeiratab.SQL.Text := 'select * from lixeira where codigo = 0';
  lixeiratab.Open();

  mm.FDTransaction.StartTransaction;

  lixeiratab.Append;
  lixeiratab.FindField('KEY').AsString             := Gera_Guid();
  lixeiratab.FindField('CODIGO').AsInteger         := Ultimo_Codigo('LIXEIRA','CODIGO',True);
  lixeiratab.FindField('EMPRESA').AsInteger        := lempresa;
  lixeiratab.FindField('DATA').AsDateTime          := Date;
  lixeiratab.FindField('USUARIO').AsString         := lloguin;
  lixeiratab.FindField('HORA').AsDateTime          := Time;
  lixeiratab.FindField('TABELA').AsString          := ltabela;
  lixeiratab.FindField('DADOS').AsString           := dados;
  lixeiratab.FindField('STATUS').AsString          := 'E';
  lixeiratab.Post;

  mm.FDTransaction.CommitRetaining;
  mm.FDTransaction.Commit;

  lixeiratab.Free;

end;
procedure GravaLog(lempresa,lusuario,lcodigo:integer;lloguin,lacao,ltabela,larquivo,dados:string);
var
  logtable   : TFDQuery;
  listadados : TUnimemo;
  i          : integer;
begin
  logtable                               := TFDQuery.Create(nil);
  logtable.Connection                    := mm.SQLConn;
  logtable.UpdateOptions.UpdateTableName := 'RASTREIO';

  logtable.Close;
  logtable.SQL.Text := 'select * from rastreio where codigo = 0';
  logtable.Open();

  mm.FDTransaction.StartTransaction;
  logtable.Append;
  logtable.FindField('KEY').AsString             := Gera_Guid();
  logtable.FindField('CODIGO').AsInteger         := Ultimo_Codigo('RASTREIO','CODIGO',True);
  logtable.FindField('EMPRESA').AsInteger        := lempresa;
  logtable.FindField('CODFUNCIONARIO').AsInteger := lusuario;
  logtable.FindField('CODIGOTABELA').AsInteger   := lcodigo;
  logtable.FindField('DATA').AsDateTime          := Date;
  logtable.FindField('USUARIO').AsString         := lloguin;
  logtable.FindField('HORA').AsDateTime          := Time;
  logtable.FindField('ACAO').AsString            := lacao;
  logtable.FindField('TABELA').AsString          := ltabela;
  logtable.FindField('ARQUIVO').AsString         := larquivo;
  logtable.FindField('DADOS').AsString           := dados;
  logtable.FindField('BROWSER').AsString         := mm.vUserBrowserType;
  logtable.FindField('VERSAOBROWSER').AsString   := mm.vUserBrowserVersion;
  logtable.FindField('SOUSUARIO').AsString       := mm.vUSer_SO;
  logtable.Post;

  mm.FDTransaction.CommitRetaining;
  mm.FDTransaction.Commit;

  logtable.Free;

end;
function Retornastatustable(DataSet: TDataSet): String;
begin
  Result := Format('%s',[GetEnumName(TypeInfo(TDataSetState),
  Ord(DataSet.State))]);
end;

function RemoverEspeciais(Str:String): String;
Begin
  Str := StrSubst(Str,'.','',0);
  Str := StrSubst(Str,'/','',0);
  Str := StrSubst(Str,'-','',0);
  Str := StrSubst(Str,'(','',0);
  Str := StrSubst(Str,')','',0);
  Str := StrSubst(Str,',','',0);
  Str := StrSubst(Str,'"','',0);
  Str := StrSubst(Str,'.','',0);
  Str := StrSubst(Str,'«','',0);
  Str := StrSubst(Str,':','',0);
  Str := StrSubst(Str,',','',0);
  Str := StrSubst(Str,'+','',0);
  Str := StrSubst(Str,'ª','',0);
  Str := StrSubst(Str,':','',0);

  Result := Str;
end;

function ValidaSenha(F_NIVEL,F_VALOR,F_SENHA :String):Boolean;
var
  M_VALOR : Real;
  M_TOTAL : string;
  M_SENHA : String;
  M_SUPER : String;
begin

  if F_NIVEL = 'FINANCEIRO' then
    M_VALOR := StrToFloat(F_SENHA) / 7
  else
    M_VALOR := StrToFloat(F_SENHA) / 3;

  M_TOTAL := StrLeft(FloatToStr(M_VALOR),4);
  M_SUPER := F_VALOR;

  if M_SUPER = '4001' then
    Result             := true
  else
  if M_SUPER <> M_TOTAL then
    begin
      Result := False;
    end
  else
    Result   := true;
end;
function DataSetToJsonTXT(pDataSet: TDataSet): String;
  var
    ArrayJSon : TJSONArray;
    ObjJSon   : TJSONObject;
    strJSon   : TJSONString;
    intJSon   : TJSONNumber;
    floatJson : TJSONValue;
    dateJson  : TJSONString;
    TrueJSon  : TJSONTrue;
    FalseJSon : TJSONFalse;
    pField    : TField;
begin
  ArrayJSon   := TJSONArray.Create;
  try
    pDataSet.First;
    while not pDataSet.Eof do
       begin
         ObjJSon:=TJSONObject.Create;
         for pField in pDataSet.Fields do
           case pField.DataType of
             ftString:
               begin
                 strJSon:=TJSONString.Create(pField.AsString);
                 ObjJSon.AddPair(pField.FieldName,strJSon);
               end;
            ftInteger:
               begin
                 IntJSon:=TJSONNumber.Create(pField.AsInteger);
                 ObjJSon.AddPair(pField.FieldName,IntJSon);
               end;
            ftFloat:
               begin
                 floatJson:=TJSONNumber.Create(pField.AsFloat);
                 ObjJSon.AddPair(pField.FieldName,floatJson);
               end;
            ftDateTime:
               begin
                 dateJson:=TJSONString.Create(pField.AsString);
                 ObjJSon.AddPair(pField.FieldName,dateJson);
               end;
           else
              begin
                strJSon:=TJSONString.Create(pField.AsString);
                ObjJSon.AddPair(pField.FieldName,strJSon);
              end;
           end;
          ArrayJSon.AddElement(ObjJSon);
          pDataSet.next;
        end;
    result:=ArrayJSon.ToString;
  finally
    ArrayJSon.Free;
  end;
end;

function  Validacaminho(pempresa:integer;caminho,pcnpj,ptipo,pemissao,peventosnfe:string):string;
var
  pcaminho : string;
begin
  pcaminho :=  pcnpj                                       + '\'                           +
               FormatDateTime('yyyy',StrToDate(pemissao))  + '\'+ptipo+'\'                 +
               '0'+IntToStr(pempresa)                                                      +
               copy(ExtensoMes(StrToInt(FormatDateTime('mm'  , StrToDate(pemissao)))),1,3) +
               FormatDateTime('yy', StrToDate(pemissao))                                   + variif(ptipo = 'MDFe','mfd','') +
               '\'+ptipo+'\' +
               variif(peventosnfe <> '',peventosnfe+'\','');

  if not DirectoryExists(caminho+pcaminho) then forceDirectories(caminho+pcaminho);

  Result := caminho+pcaminho;
end;

procedure Exclui_Movimento(F_TABELA,F_SERIE:String;F_EMPRESA,F_DOCUMENTO,F_NUMERO:Integer);
var ST_ITENS:TStringlist;
    R       : Integer;
begin
  if F_TABELA = 'MVITENS' then
    begin
      if TabelaMvitens('SELECT * FROM MVITENS WHERE EMPRESA = ' + IntToStr(F_EMPRESA)   +
                       'AND DOCUMENTO                       = ' + IntToStr(F_DOCUMENTO) +
                       'AND NUMERO                          = ' + intToStr(F_NUMERO)    +
                       'AND SERIE                           = ' + QuotedStr(F_SERIE)) then
        begin
          executasql('DELETE FROM PONTOS   WHERE EMPRESA = ' + IntToStr(F_EMPRESA)+ ' AND DOCUMENTO = ' + IntToStr(F_DOCUMENTO) + ' AND NUMERO = ' + intToStr(F_NUMERO) + ' AND SERIE = ' + QuotedStr(F_SERIE));
          executasql('DELETE FROM MVITENS  WHERE EMPRESA = ' + IntToStr(F_EMPRESA)+ ' AND DOCUMENTO = ' + IntToStr(F_DOCUMENTO) + ' AND NUMERO = ' + intToStr(F_NUMERO) + ' AND SERIE = ' + QuotedStr(F_SERIE));

          dm_rc.tbmvitens.First;
          while not dm_rc.tbmvitens.Eof do
            begin
              if (IntToStr(dm_rc.tbmvitens.FindField('CODVEF').AsInteger) <> '0') and
                 (IntToStr(dm_rc.tbmvitens.FindField('CODVEF').AsInteger) <> '') then
                CalculaSaldoEF(dm_rc.tbmvitens.FindField('CODVEF').AsInteger);

              dm_rc.tbmvitens.Next;
            end;
        end;
    end;

  if F_TABELA = 'PONTOS' then
    begin
      if TabelaPontos('SELECT * FROM PONTOS WHERE EMPRESA = ' + IntToStr(F_EMPRESA)   +
                      ' AND DOCUMENTO                     = ' + IntToStr(F_DOCUMENTO) +
                      ' AND NUMERO                        = ' + intToStr(F_NUMERO)    +
                      ' AND SERIE                         = ' + QuotedStr(F_SERIE)) then
        begin
          executasql('DELETE FROM PONTOS   WHERE EMPRESA = ' + IntToStr(F_EMPRESA)   +
                     ' AND DOCUMENTO                     = ' + IntToStr(F_DOCUMENTO) +
                     ' AND NUMERO                        = ' + intToStr(F_NUMERO)    +
                     ' AND SERIE                         = ' + QuotedStr(F_SERIE));

          ST_ITENS := TStringList.Create;
          dm_rc.fdqrypontos.First;
          while not dm_rc.fdqrypontos.Eof do
            begin
              Calcula_Lote(F_EMPRESA,
                           dm_rc.fdqrypontos.FindField('PRODUTO').AsInteger,
                           dm_rc.fdqrypontos.FindField('LOTESEMENTE').AsString,
                           dm_rc.fdqrypontos.FindField('BOLETIM').AsString,
                           dm_rc.fdqrypontos.FindField('TERMO').AsString,
                           '');

              Saldo_Beneficiamento('EXCLUI',F_SERIE,F_NUMERO,
                                   dm_rc.tbmvitens.FindField('PRODUTO').AsInteger,
                                   dm_rc.tbmvitens.FindField('SEQUENCIA').AsInteger,
                                   mm.varI_Code_Company);

              dm_rc.fdqrypontos.Next;
            end;
        end;
    end;

  if F_TABELA = 'PRODUCAOITENS' then
    begin
      if TabelaMvitens(' SELECT * FROM MVITENS WHERE EMPRESA = ' + IntToStr(F_EMPRESA)   +
                       ' AND DOCUMENTO                       = ' + IntToStr(F_DOCUMENTO) +
                       ' AND NUMERO                          = ' + intToStr(F_NUMERO)    +
                       ' AND SERIE                           = ' + QuotedStr(F_SERIE)    +
                       ' AND TIPOLOTE                        = ' + QuotedStr('P')) then
        begin
          executasql('DELETE FROM MANUTENCAOLOTE_INTERNO   WHERE EMPRESA = ' + IntToStr(F_EMPRESA)   +
                     ' AND DOCUMENTO                     = ' + IntToStr(F_DOCUMENTO) +
                     ' AND NUMERO                        = ' + intToStr(F_NUMERO));

          ST_ITENS := TStringList.Create;
          dm_rc.tbmvitens.First;
          while not dm_rc.tbmvitens.Eof do
            begin
              CalculaLoteInterno (mm.varI_Code_Company,
                                  dm_rc.tbmvitens.FindField('PRODUTO').AsInteger,
                                  dm_rc.tbmvitens.Findfield('LOTESEMENTE').AsString);

              dm_rc.tbmvitens.Next;
            end;
        end;
    end;

  if F_TABELA = 'BENEFICIAMENTO' then
    begin
      if TabelaBeneitens('SELECT * FROM BENEITENS WHERE NUMERO = ' + IntToStr(F_NUMERO)) then
        begin
          executasql('DELETE FROM BENEITENS   WHERE NUMERO = ' + IntToStr(F_NUMERO));
          executasql     ('delete   from PONTOS    where numero   = ' + IntToStr(F_NUMERO) +
                          'and                              serie = ' + QuotedStr('BEN')   +
                          'and                            empresa = ' + IntToStr(mm.varI_Code_Company));
          executasql     ('delete   from PONTOS    where numero   = ' + IntToStr(F_NUMERO) +
                          'and                              serie = ' + QuotedStr('DES')   +
                          'and                            empresa = ' + IntToStr(mm.varI_Code_Company));

          dm_rc.fdqrybeneitens.First;
          while not dm_rc.fdqrybeneitens.Eof do
            begin
              Calcula_Lote(F_EMPRESA,
                           dm_rc.fdqrybeneitens.FindField('PRODUTO').AsInteger,
                           dm_rc.fdqrybeneitens.FindField('LOTEDESTINO').AsString,
                           dm_rc.fdqrybeneitens.FindField('BOLETIMDESTINO').AsString,
                           dm_rc.fdqrybeneitens.FindField('TERMO').AsString,
                           '');

              Saldo_Beneficiamento('EXCLUI',F_SERIE,F_NUMERO,
                                   dm_rc.fdqrybeneitens.FindField('PRODUTO').AsInteger,
                                   dm_rc.fdqrybeneitens.FindField('SEQUENCIA').AsInteger,
                                   mm.varI_Code_Company);

              dm_rc.fdqrybeneitens.Next;
            end;
        end;
    end;

  if F_TABELA = 'RECEBER' then
    begin
      executasql('DELETE FROM RECEBER WHERE EMPRESA = ' + IntToStr(F_EMPRESA)+ ' AND DOCUMENTO = ' + IntToStr(F_DOCUMENTO) + ' AND NUMERO = ' + intToStr(F_NUMERO) + ' AND SERIE = ' + QuotedStr(F_SERIE));
    end;

  if F_TABELA = 'PAGAR' then
    begin
      executasql('DELETE FROM PAGAR WHERE EMPRESA = ' + IntToStr(F_EMPRESA)+ ' AND DOCUMENTO = ' + IntToStr(F_DOCUMENTO) + ' AND NUMERO = ' + intToStr(F_NUMERO) + ' AND SERIE = ' + QuotedStr(F_SERIE));
    end;
end;
procedure EventoXmlAcbr(pnumero,pdocumento,pempresa,ptipo:string);
begin
  TabelaEventoXML('select * from eventosxml where codigo = 0');

  if ptipo = 'CCE' then
    begin
      executasql(' delete from eventosxml where numero = ' + QuotedStr(pnumero)   +
                 ' and documento                       = ' + QuotedStr(pdocumento)+
                 ' and empresa                         = ' + QuotedStr(pempresa));
    end;

  dm_rc.fdqryeventoxml.Append;
  dm_rc.fdqryeventoxml.FindField('KEY').AsString        := Gera_Guid();
  dm_rc.fdqryeventoxml.FindField('CODIGO').AsInteger    := Ultimo_Codigo('EVENTOSXML','CODIGO',False);
  dm_rc.fdqryeventoxml.FindField('NUMERO').AsInteger    := StrToInt(pnumero);
  dm_rc.fdqryeventoxml.FindField('EMPRESA').AsInteger   := StrToInt(pempresa);
  dm_rc.fdqryeventoxml.FindField('DOCUMENTO').AsInteger := StrToInt(pdocumento);
  dm_rc.fdqryeventoxml.FindField('EMISSAO').AsDateTime  := Date;
  dm_rc.fdqryeventoxml.FindField('HORA').AsDateTime     := Time;
  dm_rc.fdqryeventoxml.FindField('TIPO').AsString       := ptipo;
  dm_rc.fdqryeventoxml.FindField('XML').AsString        := variif(ptipo = 'I',
                                                           dm_rc.ACBrNFe.WebServices.Inutilizacao.RetornoWS,
                                                           dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.XML);
  dm_rc.fdqryeventoxml.Post;

end;
function  ValidadorAcbr(const campo,tipo:string):string;
begin
  if tipo = 'CPFCNPJ' then
    dm_rc.ACBrValidador.TipoDocto := docCNPJ;

  dm_rc.ACBrValidador.documento := campo;

  if not dm_rc.ACBrValidador.Validar then
    begin
      if tipo = 'CPFCNPJ' then
        Result :=  'ESTE CPF/CNPJ NÃO É VÁLIDO!';
    end
  else
    Result := '';
end;
function Downloadremessa(const caminhoarq, nomearquivo : string): string;
var
  original, destino : string;
  Arquivo           : TStringList;
begin
  if caminhoarq <> '' then
    begin
      original := caminhoarq+nomearquivo;
      destino  := ExtractFilePath(Application.ExeName)+'files\';
      Arquivo  := TStringList.Create();

      Arquivo.LoadFromFile(original);
      Arquivo.SaveToFile(destino+nomearquivo);
      Arquivo.Free;
    end;
  Result := nomearquivo;
end;
function RemoverORSql(Str:String): String;
Begin
  Str := StrSubst(Str,'or)',')',0);
  Result := Str;
end;
function  Renovarsenha0(Str:String): String;
begin
  Str := StrSubst(Str,'0','7',0);
  Result := Str;
end;
function  VerificafinanceiroPessoa(cpessoa :integer): Boolean;
var
  contagem : integer;
begin
  contagem := 0;
  // CTA RECEBER
  if SqlPesquisa('select count(pessoa) as qte from receber where pessoa = ' + IntToStr(cpessoa)) then
    contagem := dm_rc.sqlBuscas.FindField('qte').AsInteger;
  // CTA PAGAR
  if SqlPesquisa('select count(pessoa) as qte from pagar where pessoa = ' + IntToStr(cpessoa)) then
    contagem := contagem + dm_rc.sqlBuscas.FindField('qte').AsInteger;

  if contagem > 0 then
    Result := True
  else
    Result := False;
end;
function DaysBetween(Dt1, Dt2: TDateTime): Integer;
begin
  Result := Round(Dt2 - Dt1);
end;
function DiaSemana(Data:TDateTime): String;
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String[13];
begin
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terça-feira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';
  NoDia:=DayOfWeek(Data);
  DiaSemana:=DiaDasemana[NoDia];
end;
function IncDay(const AValue: TDateTime;const ANumberOfDays: Integer): TDateTime;
begin
  Result := AValue + ANumberOfDays;
end;
function  DescricaoNotaEletronicaItens(const cnpj, lote:string;pproduto:integer): string;
var
 QuerySementes,QueryProdutos : TFDQuery;
 ano,mes:string;
begin
  QuerySementes := TFDQuery.Create(nil);
  QueryProdutos := TFDQuery.Create(nil);

  QuerySementes.Connection := mm.SQLConn;
  QueryProdutos.Connection := mm.SQLConn;

  if lote <> '' then
    begin
      with QuerySementes do
        begin
          close;
          Unprepare;
          sql.Clear;
          SQL.Text := ' select * from sementes s     ' +
                      ' where s.produto           =  ' + IntToStr(pproduto) +
                      ' and s.lote                =  ' + QuotedStr(lote);
          Prepare;
          Open();
        end;

      with QueryProdutos do
        begin
          close;
          Unprepare;
          sql.Clear;
          SQL.Text := ' select sementenome from produtos where codigo =  ' + IntToStr(pproduto);
          Prepare;
          Open();
        end;



      Result := 'Sementes de '  + StrAllTrim(QueryProdutos.FindField('SEMENTENOME').AsString)   +
                ' CV '          + StrAllTrim(QuerySementes.FindField('CULTIVAR').AsString)      + ' - '  +
                'Lote:  '       + StrAllTrim(QuerySementes.FindField('LOTE').AsString)          + ' - ' +
                'Termo  '       + QuerySementes.FindField('TERMO').AsString                     + ' - '  +
                'Categoria: '   + StrAllTrim(QuerySementes.FindField('CATEGORIA').AsString);
    end
  else
    Result := '';

  QueryProdutos.Free;
  QuerySementes.Free;
end;
function  Numero_TermoColeta(const F_EMPRESA : Integer; F_ANO : String) : String;
var
 Query : TFDQuery;
 msql   : string;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := mm.SQLConn;

  msql :=  ' execute block returns (P_RETORNO integer)                   as                                     ' +
           ' declare variable P_NUMERO integer;                                                                 ' +
           ' begin                                                                                              ' +
           '   for select max(coalesce(s.seqtermo,0)) from solicitacao s                                         ' +
           '    where extract(year from s.emissao) = ' + QuotedStr(F_ANO) + ' and empresa = ' + IntToStr(F_EMPRESA) + ' into :p_numero do         ' +
           '     begin                                                                                          ' +
           '       p_numero  = p_numero + 1;                                                                    ' +
           '       p_retorno = (p_numero);                                                                      ' +
           '    end                                                                                             ' +
           '   suspend;                                                                                         ' +
           ' end                                                                                                ';

  try
    with query do
      begin
        Close;
        UnPrepare;
        Sql.Clear;
        sql.Add(msql);
        Prepare;
        Open;
      end;
  except
    on e: exception do
      begin
        gera_log(e.message);
      end;
  end;

  result :=  Query.FindField('P_RETORNO').AsString;
  Query.Close;
  FreeAndNil(Query);

end;
function  Numero_Termo(const F_EMPRESA : Integer; F_ANO : String) : String;
var
 Query : TFDQuery;
 msql   : string;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := mm.SQLConn;

  msql :=  ' execute block returns (P_RETORNO integer)                   as                                     ' +
           ' declare variable P_NUMERO integer;                                                                 ' +
           ' begin                                                                                              ' +
           '   for select max(coalesce(s.seqtermo,0)) from sementes s                                           ' +
           '    where extract(year from s.recebida) = ' + QuotedStr(F_ANO) + ' and empresa = ' + IntToStr(F_EMPRESA) + ' into :p_numero do         ' +
           '     begin                                                                                          ' +
           '       p_numero  = p_numero + 1;                                                                    ' +
           '       p_retorno = (p_numero);                                                                      ' +
           '    end                                                                                             ' +
           '   suspend;                                                                                         ' +
           ' end                                                                                                ';

  try
    with query do
      begin
        Close;
        UnPrepare;
        Sql.Clear;
        sql.Add(msql);
        Prepare;
        Open;
      end;
  except
    on e: exception do
      begin
        gera_log(e.message);
      end;
  end;

  result :=  Query.FindField('P_RETORNO').AsString;
  Query.Close;
  FreeAndNil(Query);
end;
//*************************************//
function RemoverEspacos(Str:String): String;
//*************************************//
Begin
  Str := StrSubst(Str,' ','',0);
  Result := Str;
end;
function ValidarChaveNFe(const ChaveNFe: string):boolean;
const
  PESO : Array[0..43] of Integer = (4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 0);
var
  Retorno : boolean;
  aChave  : Array[0..43] of Char;
  Soma    : Integer;
  Verif   : Integer;
  I       : Integer;
begin
  Retorno := false;
  try
    try
      if not Length(ChaveNFe) = 44 then
        raise Exception.Create('');

      StrPCopy(aChave,StringReplace(ChaveNFe,' ', '',[rfReplaceAll]));
      Soma := 0;
      for I := Low(aChave) to High(aChave) do
        Soma := Soma + (StrToInt(aChave[i]) * PESO[i]);

      if Soma = 0 then
        raise Exception.Create('');

      Soma := Soma - (11 * (Trunc(Soma / 11)));
      if (Soma = 0) or (Soma = 1) then
        Verif := 0
      else
        Verif := 11 - Soma;

      Retorno := Verif = StrToInt(aChave[43]);
    except
      Retorno := false;
    end;
  finally
    Result := Retorno;
  end;
end;
function  Acha_Item_Unidade(Const F_UNIDADE:String): String;
var
  M_DESCRICAO : string;
  M_CONTROLE  : String;
  query       : TFDQuery;
  M_SQL       : string;
begin

  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn;

    M_SQL := ' select * from medidas where sigla = ' + QuotedStr(F_UNIDADE);
    try
      with query do
        begin
          Close;
          UnPrepare;
          Sql.Clear;
          sql.Text := M_SQL;
          Prepare;
          Open;
        end;
    except

    end;
  finally
    if Query.FindField('sigla').AsString <> '' then
      result :=  Query.FindField('sigla').AsString
    else
      Result := 'KG';
    Query.Close;
    FreeAndNil(Query);
  end;
end;
function StrZero(Number: Double; Len, Dec: Integer): string;
var
  S: string;
begin
  Str(Number : Len : Dec, S);
  S := StrAllTrim(S);
  Result := StrReplicate('0', Len - Length(S)) + S;
end;
function SituacaoFicalChave(const chave :string) : string;
var
  cnpj : string;
begin
  cnpj :=  Copy(chave,7,14);

  if StrContains('01409655000180#03526252000147',cnpj) then
    Result := '08';
end;
function  AliquotaTabelaIcms(const F_ORIGEM,F_DESTINO:string):Real;
var
  query       : TFDQuery;
  M_SQL       : string;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn;

    M_SQL            := ' select PORCENTAGEM from TABELAICMS where ORIGEM = ' + QuotedStr(F_ORIGEM) +
                        ' and                                     DESTINO = ' + QuotedStr(F_DESTINO);

    with query do
      begin
        Close;
        UnPrepare;
        Sql.Clear;
        sql.Text := M_SQL;
        Prepare;
        Open;
      end;

  finally
    Result := query.FindField('PORCENTAGEM').AsFloat;

    Query.Close;
    FreeAndNil(Query);
  end;
end;
procedure JsonToDataset(aDataset : TDataSet; aJSON : string);
var
  JObj  : TJSONArray;
  vConv : TCustomJSONDataSetAdapter;
begin
  if (aJSON = EmptyStr) then
  begin
    Exit;
  end;

  JObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(aJSON),0) as TJSONArray;
  vConv := TCustomJSONDataSetAdapter.Create(Nil);

  try
    vConv.Dataset := aDataset;
    vConv.UpdateDataSet(JObj);
  finally
    vConv.Free;
    JObj.Free;
  end;
end;
function Envia_EmailACBr(pempresa, pcontrole: integer; email:string):string;
var
  CC, msg: Tstrings;
  M_ARQUIVOXML :string;

  procedure ConfigurarEmail;
    begin
      dm_rc.ACBrMail.Host                := 'smtpi.sisgraos.com.br';
      dm_rc.ACBrMail.Port                := '587';
      dm_rc.ACBrMail.Username            := 'nferedesisgraos@sisgraos.com.br';
      dm_rc.ACBrMail.Password            := 'sistema@2020';
      dm_rc.ACBrMail.From                := 'nferedesisgraos@sisgraos.com.br';
      dm_rc.ACBrMail.SetSSL              := False;               // SSL - Conexao Segura
      dm_rc.ACBrMail.SetTLS              := False;               // Auto TLS
      dm_rc.ACBrMail.ReadingConfirmation := False;              // Pede confirmacao de leitura do email
      dm_rc.ACBrMail.UseThread           := False;              // Aguarda Envio do Email(nao usa thread)
      dm_rc.ACBrMail.FromName            := dm_rc.tbempresas.FindField('FANTASIA').AsString;
    end;
begin
  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(pempresa));
  TabelaMvmestre('select * from mvmestre inner join pessoas on (mvmestre.pessoa = pessoas.codigo) where mvmestre.codigo = ' + IntToStr(pcontrole));
  M_ARQUIVOXML := Validacaminho(pempresa,
                                mm.M_PATHXML,
                                mm.varC_Doc_Customer,
                                'NFe',
                                dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,
                                '') + dm_rc.FDQryMvmestre.FindField('CODIGOBARRAS').AsString + '-nfe.xml';

    dm_rc.ACBrNFe.NotasFiscais.Clear;
    dm_rc.ACBrNFe.NotasFiscais.LoadFromFile(M_ARQUIVOXML);
//    dm_rc.ACBrNFeDANFEFR.FastFile                       := dm_rc.tbempresas.FindField('caminho_fastreport').AsString + '\DANFePaisagem.fr3';

    CC  := TStringList.Create;
    msg := TStringList.Create;
    msg.Add('-------------------------------------------------------------------------');
    msg.Add('XML/PDF da NOTA ELETRÔNICA');
    msg.Add(dm_rc.tbempresas.FindField('FANTASIA').AsString);
    msg.Add('Segue em anexo o arquivo XML/PDF referente nota fiscal eletrônica*');
    msg.Add('-------------------------------------------------------------------------');
    msg.Add('Fantasia: ' + dm_rc.tbempresas.FindField('FANTASIA').AsString);
    msg.Add('Emitente: ' + dm_rc.tbempresas.FindField('NOME').AsString);
    msg.Add('Cnpj....: ' + Formata_Cnpj(dm_rc.tbempresas.FindField('CPFCNPJ').AsString));
    msg.Add('Cidade..: ' + dm_rc.tbempresas.FindField('CIDADE').AsString + '/'+dm_rc.tbempresas.FindField('ESTADO').AsString);
    msg.Add('Número..: ' + dm_rc.FDQryMvmestre.FindField('NUMERO').AsString);
    msg.Add('Nome....: ' + dm_rc.FDQryMvmestre.FindField('NOME').AsString);
    msg.Add('Emissão.: ' + dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString + ' - ' + dm_rc.FDQryMvmestre.FindField('HORANOTA').AsString) ;
    msg.Add('Chave...: ' + dm_rc.FDQryMvmestre.FindField('CODIGOBARRAS').AsString) ;
    msg.Add('Prot....: ' + dm_rc.FDQryMvmestre.FindField('PROTOCOLO').AsString) ;
    msg.Add('Valor R$: ' + FormatFloat('###,###,##0.00',dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat));
    msg.Add('-------------------------------------------------------------------------');
    msg.Add('*Não responder a este email - email de envio de notas automático');
    msg.Add('');
    msg.Add('-------------------------------------------------------------------------');
    msg.Add('Sisgrãos - Sistema de Gestão de Sementeiras e Laboratórios');
    msg.Add('-------------------------------------------------------------------------');


    ConfigurarEmail;
    try
      cc.Add(email);
      dm_rc.ACBrNFe.NotasFiscais.Items[0].EnviarEmail(email
        , 'Segue Anexo documento da nota eletrônica'
        , msg
        , True  // Enviar PDF junto
        , CC    // Lista com emails que serao enviado copias - TStrings
        , nil   // Lista de anexos - TStrings
        );
      result := 'EMAIL ENVIADO COM SUCESSO!';
    except
      on e: exception do
      begin
        Result := e.Message;
      end;
    end;
end;
function IsDir(const DirName: string): Boolean;
var
  Attr: Integer;
begin
  Attr := GetFileAttributes(PChar(DirName));
  Result := (Attr <> -1) and ((FILE_ATTRIBUTE_DIRECTORY and Attr) <> 0);
end;

function Valor_Int(Const ValorString:string): integer;

var
  I, Code: Integer;
begin
  Val(StrAllTrim(ValorString), I, Code);
  if Code <> 0 then
    result := 0
  else
    result := I;
end;

function Valor_Str(Const ValorInteiro:integer): String;
begin
  try
    Result := StrAllTrim(IntToStr(ValorInteiro));
  except
    Result := '0';
  end;
end;

function Enviar_Email(mensagem,titulo,empresa,destinatarioemail,anexo1,anexo2:String): Boolean;
var
  idSMTP     : TIdSMTP;
  Parametros : TStringList;
  Resposta   : String;
  JsonToSend : TStringStream;
  Msg        : TIdMessage;
  TextoHtml  : TIdText;
begin

  IdSMTP := TIdSMTP.Create(nil);

  try
    IdSMTP.Host     := 'smtpi.sisgraos.com.br';
    IdSMTP.Port     := 587;
    IdSMTP.Username := 'nferedesisgraos@sisgraos.com.br';
    IdSMTP.Password := 'sistema@2020';

    Msg             := TIdMessage.Create(nil);
    Msg.Body.Clear;

    TextoHtml             := TIdText.Create(Msg.MessageParts);
    TextoHtml.ContentType := 'text/html';
    TextoHtml.Body.Text   := mensagem;
    TextoHtml.CharSet     := 'ISO-8859-1';

    try
      Msg.From.Name                 := empresa;
      Msg.From.Address              := 'nferedesisgraos@sisgraos.com.br';
      Msg.Subject                   := titulo;
      Msg.Recipients.EMailAddresses := destinatarioemail;
      Msg.CCList.EMailAddresses     := '';
      Msg.ReceiptRecipient.Name     := empresa;
      Msg.Priority                  := mpLow;
      Msg.ReceiptRecipient.Text     := 'nferedesisgraos@sisgraos.com.br';

      if not StrEmpty(anexo1) then
        TIdAttachmentFile.Create(Msg.MessageParts,anexo1);

      if not StrEmpty(anexo2) then
        TIdAttachmentFile.Create(Msg.MessageParts,anexo2);

      if not IdSMTP.Connected then IdSMTP.Connect;

      try
        IdSMTP.Send(Msg);
        Result := True;
      except
        Result := False;
      end;

    finally
      FreeAndNil(Msg);
      IdSMTP.Disconnect;
    end;

  finally
    FreeAndNil(IdSMTP);
  end;

end;


end.
