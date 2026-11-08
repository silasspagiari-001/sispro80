unit mkm_procedures;

interface

uses
  untDM_RC, FireDAC.Comp.Client, uMsgInfo;

function  Ultimo_Codigo           (Const F_TABELA,F_CONTROLE:String; Status:Boolean): integer;
function  Ultimo_CodigoPlanoContas(): integer;
function  Ultimo_Numero(Const F_EMPRESA,F_DOCUMENTO:integer;F_SITUACAO:string): integer;
function  Gera_Amostra(const F_DATA: TDateTime): string;
function  gera_log(Frase:String):boolean;
function  Acha_Item(Const F_TABELA,F_CODIGO:String): String;
function  Acha_perc_Condicao(Const F_CODIGO:Integer): Real;
function  SqlPesquisa(Const F_SQL:String):Boolean;
function  SqlPesquisaPrimeira(Const F_SQL:String):Boolean;
function  SqlPesquisaSecundaria(Const F_SQL:String):Boolean;
function  SqlGraficos(Const F_SQL:String):Boolean;
function  Caminho(Retornar:String):String;
function  verificastatuspessoa(const rpessoa:integer):Boolean;
function  SequenciapagamentoComissao(const rpagamento:TDateTime) : integer;

function  executasql(Const F_SQL:String):Boolean;
function  SqlProdutos(Const F_SQL:String):Boolean;

function  TabelaMvitens(Const F_SQL:String):Boolean;
function  TabelaReceber(Const F_SQL:String):Boolean;
function  TabelaEmpresas(Const F_SQL:String):Boolean;
function  TabelaPortadores(Const F_SQL:String):Boolean;
function  TabelaOperacao(Const F_SQL:String):Boolean;
function  TabelaPessoas(Const F_SQL:String):Boolean;
function  TabelaDocumentos(Const F_SQL:String):Boolean;
function  TabelaMvmestre(Const F_SQL:String):Boolean;
function  TabelaTransporte(Const F_SQL:String):Boolean;
function  TabelaMedidas(Const F_SQL:String):Boolean;
function  TabelaTitulos(Const F_SQL:String): boolean;
function  TabelaSementes_BAS(Const F_SQL:String):Boolean;
function  TabelaRomaneio(Const F_SQL:String): boolean;
function  TabelaRomaneioItens(Const F_SQL:String): boolean;
function  TabelaTitulosAnexo(Const F_SQL:String): boolean;

function  TabelaProtocolo(Const F_SQL:String):Boolean;
function  TabelaAnalise(Const F_SQL:String):Boolean;
function  TabelaAnaliseItens(Const F_SQL:String):Boolean;
function  TabelaPMS(Const F_SQL:String):Boolean;
function  TabelaEspecie(Const F_SQL:String):Boolean;
function  TabelaCultivar(Const F_SQL:String):Boolean;
function  TabelaCategoria(Const F_SQL:String):Boolean;
function  TabelaPeneira(Const F_SQL:String):Boolean;
function  TabelaResponsavel(Const F_SQL:String):Boolean;
function  TabelaGerminacao(Const F_SQL:String):Boolean;
function  TabelaRTCliente(Const F_SQL:String):Boolean;
function  TabelaRTLaboratorio(Const F_SQL:String):Boolean;
function  TabelaRegiao(Const F_SQL:String):Boolean;
function  TabelaSementes(Const F_SQL:String):Boolean;
function  TabelaLaboratorio(Const F_SQL:String):Boolean;
function  TabelaProdutos(Const F_SQL:String):Boolean;
function  TabelaEscritas(Const F_SQL:String):Boolean;
function  TabelaPontos(Const F_SQL:String):Boolean;
function  TabelaEventoXML(Const F_SQL:String):Boolean;
function  TabelaBatidaItens(Const F_SQL:String):Boolean;
function  TabelaBatidaMestre(Const F_SQL:String):Boolean;
function  TabelaMfmestre(Const F_SQL:String):Boolean;
function  TabelaMfitens(Const F_SQL:String):Boolean;
function  TabelaBeneitens(Const F_SQL:String):Boolean;
function  TabelaPermissao(Const F_SQL:String):Boolean;
function  TabelaUsuarios(Const F_SQL:String):Boolean;
function  TabelaFonecedor(Const F_SQL:String): boolean;
function  TabelaCampoitens(Const F_SQL:String): boolean;
function  TabelaEntregaProduto(Const F_SQL:String): boolean;
function  TabelaChequeHistorico(Const F_SQL:String): boolean;
function  TabelaCheques(Const F_SQL:String): boolean;
function  TabelaProducaoItens(Const F_SQL:String): boolean;
function  TabelaManutencaoLoteProducao(Const F_SQL:String): boolean;
function  TabelaSolicitacaoItens(Const F_SQL:String): boolean;
function  TabelaSolicitacao(Const F_SQL:String): boolean;
function  TabelaResponsavelAssinatura(Const F_SQL:String): boolean;
function  TabelaEntregaLote(Const F_SQL:String): boolean;
function  TabelaEntregaFutura(Const F_SQL:String): boolean;
function  TabelaCustoLoteinterno(Const F_SQL:String): boolean;
function  TabelaCustoLoteinternoItens(Const F_SQL:String): boolean;
function  TabelaCustoProducao(Const F_SQL:String): boolean;
function  TabelaMovimentoComissao(Const F_SQL:String): boolean;
function  TabelaSubPlanoContas(Const F_SQL:String): boolean;
function  TabelaCBNEF(Const F_SQL:String): boolean;
function  Saldo_Banco_Atual(const F_DATA : TDateTime;F_EMPRESA:integer) : Real;
function  Calcula_AntCaixa(const F_EMPRESA,F_PORTADOR : Integer; F_DATA:TDate):Real;
function  Calcula_SaldoExtrato(const F_EMPRESA,F_FUNCIONARIO : Integer; F_DATA:TDate):Real;
function  Calcula_AntPlano(const F_EMPRESA: Integer; F_PLANO: string; F_DATA: TDate): Real;
function  Calcula_SaldoAtualCaixa(const F_EMPRESA,F_PORTADOR : Integer; F_DATA:TDate):Real;
function  Calcula_SaldoProdutoNota(const F_EMPRESA,F_PRODUTO : Integer; F_DATA:TDate):Real;
function  Sequencia_Caixa(const F_DATA : TDateTime; F_PORTADOR :integer): Integer;
function  SqlPesquisaGerais(Const F_SQL:String):TFDQuery;
function  VerificaProtocolo(Const F_PROTOCOLO:Integer;tipo:string):string;
function  VerificaDevolucao(const F_OPERACAO :Integer):string;
function  VerificaExisteAssinatura(const prt :Integer):boolean;
function  QtdeParcelas(rnumero,rdocumento,rempresa:integer;rtabela:string)   :Integer;
function  Sequencia_Propriedade       (const F_PESSOA :integer): Integer;
//************************************************************************************************************//
procedure Calcula_Lote            (const F_EMPRESA,F_PRODUTO:integer;F_LOTE,F_BOLETIM,F_TERMO,F_TIPO:string);
procedure Saldo_Beneficiamento    (const P_TIPO,P_SERIE:string;P_NOTA,P_PRODUTO,P_SEQUENCIA,P_EMPRESA:integer);
function  Sequencia_Lote          (const P_LOTE,P_BOLETIM:string;P_PRODUTO,P_EMPRESA:integer):Integer;
function  Sequencia_Menusisterma  (const P_MENU:string):Integer;
function  Verifica_Permissao      (const P_EMPRESA,P_FUNCIONARIO:Integer;P_TABELA,P_TIPO:string):string;
function  SaldoProdutoKardex_Nota (const rempresa,rproduto:integer;datafin:TDateTime):Real;
function  Verifica_MenuMainPai    (const P_EMPRESA,P_FUNCIONARIO:Integer;P_MENU:string):Boolean;

procedure DashboardFinanceiro     (const ptipo:string;pempresa:integer);
function  DashboardFinanceiroCard (const ptipo:string;pempresa:integer):Real;
function  DashboardFaturamentoCard(const ptipo:string;pempresa:integer):Real;
procedure CalculaLoteInterno      (const pempresa,pproduto:integer;lote:string);
procedure CalculaSaldoEF          (const pcontrole:integer);

procedure CalculaEntregaItens(const pempresa,pnumero,psequencia,pdocumento,pproduto:integer);
function  HttpGet(get:string):string;
function  HttpGetMSG(get: string): TMsgInfo;
function  Numero_Termo(const F_EMPRESA : Integer; F_ANO : String) : String;

implementation

uses
  System.SysUtils, Vcl.Forms, mkm_func_web, MainModule, Data.DB, Vcl.Clipbrd,
  System.DateUtils, IdGlobal, System.Classes, REST.Response.Adapter, REST.Client,
  REST.Types, System.JSON,mkm_funcoes;

var
  query : TFDQuery;
  M_SQL : string;


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

function  Sequencia_Propriedade(const F_PESSOA :integer): Integer;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn;

    M_SQL := ' execute block returns (P_RETORNO integer)                   as                         ' +
             ' declare variable NUMERO integer;                                                       ' +
             ' begin                                                                                  ' +
             '   select count(coalesce(propriedades.codigo,0))+1 as sequencia from propriedades where propriedades.pessoa  =  ' + IntToStr(F_PESSOA) +
             '   into :numero;                                                                        ' +
             '   p_retorno  = NUMERO;                                                                 ' +
             '   suspend;                                                                             ' +
             ' end                                                                                    ';

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
      on e: exception do
        begin
        end;
    end;
  finally
    result :=  Query.FindField('p_retorno').AsInteger;

    Query.Close;
    FreeAndNil(Query);
  end;
end;

function Ultimo_Numero(Const F_EMPRESA,F_DOCUMENTO:integer;F_SITUACAO:string): integer;
begin
  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;

    M_SQL := ' execute block returns (P_RETORNO integer)                   as                                                ' +
             ' declare variable P_NUMERO integer;                                                                            ' +
             ' declare variable P_SITUACAO varchar(10);                                                                      ' +
             ' begin                                                                                                         ' +
             ' P_SITUACAO = ' + QuotedStr('GRAVAR')                                                                     + ' ;' +
             '   for select numero from documentos where documento = ' + IntToStr(F_DOCUMENTO) + ' and empresa = ' + IntToStr(F_EMPRESA) + ' into :p_numero do    ' +
             '     begin                                                                                                     ' +
             '       p_numero  = p_numero + 1;                                                                               ' +
             '       p_retorno = p_numero;                                                                                   ' +
             '        if (p_situacao = ' + QuotedStr(F_SITUACAO) +') then                                                    ' +
             '          begin                                                                                                ' +
             '            update documentos set numero = :p_numero where empresa = ' + IntToStr(F_EMPRESA) + ' and documento = ' + IntToStr(F_DOCUMENTO) +';     ' +
             '          end                                                                                                  ' +
             '     end                                                                                                       ' +
             '   suspend;                                                                                                    ' +
             ' end                                                                                                           ' ;

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := M_SQL;
      Prepare;
      open;
    end;

  Result := Query.FindField('P_RETORNO').AsInteger;
  FreeAndNil(query);
end;
function  Ultimo_CodigoPlanoContas(): integer;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn;

      M_SQL :=    'execute block returns (ULTIMO integer) as      ' +
                  'declare variable incremento integer;           ' +
                  'declare variable v_contador integer;           ' +
                  'begin                                          ' +
                  '  incremento = gen_id(GEN_PLANOCONTAS_PL_ID, 1); ' +
                  '  v_contador = incremento;                     ' +
                  '  while (exists(select * from                  ' + 'PLANOCONTAS '   + ' where ' + ' PLANO ' + ' =  :v_contador)) do ' +
                  '    begin                                      ' +
                  '      v_contador = v_contador + 1;             ' +
                  '    end                                        ' +
                  '  if (v_contador > incremento) then            ' +
                  '    ULTIMO = v_contador;                       ' +
                  '  else                                         ' +
                  '    ULTIMO = incremento;                       ' +
                  '  execute statement '+QuotedStr(' set generator ') +' || ' + QuotedStr(' GEN_PLANOCONTAS_PL_ID ') + ' || ' + QuotedStr(' to ')+  ' || ' + ' :ULTIMO;'+
                  '  suspend;                                     ' +
                  'end                                            ';

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
      on e: exception do gera_log('ULTIMO PLANO DE CONTAS ' + e.message);
    end;
  finally
    result :=  Query.FindField('ULTIMO').AsInteger;
    Query.Close;
    FreeAndNil(Query);
  end;
end;
function Ultimo_Codigo(Const F_TABELA,F_CONTROLE:String; Status:Boolean): integer;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn;

    if Status = False then
      M_SQL :=    'select max(' + F_CONTROLE + ') as ULTIMO from ' + F_TABELA
    else
      M_SQL :=    'execute block returns (ULTIMO integer) as      ' +
                  'declare variable incremento integer;           ' +
                  'declare variable v_contador integer;           ' +
                  'begin                                          ' +
                  '  incremento = gen_id(GEN_'+F_TABELA+'_ID, 1); ' +
                  '  v_contador = incremento;                     ' +
                  '  while (exists(select * from                  ' + F_TABELA   + ' where ' + F_CONTROLE + ' =  :v_contador)) do ' +
                  '    begin                                      ' +
                  '      v_contador = v_contador + 1;             ' +
                  '    end                                        ' +
                  '  if (v_contador > incremento) then            ' +
                  '    ULTIMO = v_contador;                       ' +
                  '  else                                         ' +
                  '    ULTIMO = incremento;                       ' +
                  '  execute statement '+QuotedStr(' set generator ') +' || ' + QuotedStr(' GEN_'+F_TABELA+'_ID ') + ' || ' + QuotedStr(' to ')+  ' || ' + ' :ULTIMO;'+
                  '  suspend;                                     ' +
                  'end                                            ';

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
      on e: exception do gera_log('ULTIMO CODIGO ' + e.message);
    end;
  finally
    if Status = False then
      result :=  Query.FindField('ULTIMO').AsInteger + 1
    else
      result :=  Query.FindField('ULTIMO').AsInteger;
    Query.Close;
    FreeAndNil(Query);
  end;
end;
function  Acha_perc_Condicao(Const F_CODIGO:Integer): Real;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn;

    M_SQL := ' SELECT BASECALCULO FROM CONDICOES WHERE CODIGO = ' + IntToStr(F_CODIGO);
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
    result :=  Query.FindField('BASECALCULO').AsFloat;
    Query.Close;
    FreeAndNil(Query);
  end;
end;
function  Acha_Item(Const F_TABELA,F_CODIGO:String): String;
var
  M_DESCRICAO : string;
  M_CONTROLE  : String;
begin
  if StrContains('PLANOCONTAS',F_TABELA) then
    begin
      M_DESCRICAO := 'DESCRICAO';
      M_CONTROLE  := 'PLANO';
    end
  else
  if StrContains('PRODUTOS#CARTEIRA#APLICACAO#PORTADORES#OPERACOES#HISTORICO#GRUPOS#CARTAO#HISTORICO#CENTROCUSTO#CUSTO_LOTEINTERNO#BARRACAO#CARTEIRA',F_TABELA) then
    begin
      M_DESCRICAO := 'DESCRICAO';
      M_CONTROLE  := 'CODIGO';
    end
  else
  if StrContains('SAFRA#PORTADOR#CARTEIRA#APLICACAO#PLANOCONTAS#PRAGAS',F_TABELA) then
    begin
      M_DESCRICAO := 'DESCRICAO';
      M_CONTROLE  := 'CODIGO';
    end
  else
  if StrContains('CONDICOES',F_TABELA) then
    begin
      M_DESCRICAO := 'DESCRICAO';
      M_CONTROLE  := 'CODIGO';
    end
  else
  if StrContains('CULTIVAR',F_TABELA) then
    begin
      M_DESCRICAO := 'CULTIVAR';
      M_CONTROLE  := 'CODIGO';
    end
  else
  if StrContains('ESPECIE',F_TABELA) then
    begin
      M_DESCRICAO := 'SEMENTENOME';
      M_CONTROLE  := 'CODIGO';
    end
  else
  if StrContains('RESPONSAVEL#FUNCIONARIOS#PESSOAS#LABORATORIO',F_TABELA) then
    begin
      M_DESCRICAO := 'NOME';
      M_CONTROLE  := 'CODIGO';
    end
  else
    begin
      M_DESCRICAO := 'NOME';
      M_CONTROLE  := 'CODIGO';
    end;

  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn;

    M_SQL := ' execute block returns (P_RETORNO varchar(80))               as           ' +
             ' declare variable V_CODIGO varchar(20);                                   ' +
             ' declare variable P_TABELA varchar(20);                                   ' +
             ' declare variable P_RESULTADO varchar(80);                                ' +
             ' declare variable P_ERRO integer;                                         ' +
             ' begin                                                                    ' +
             '   select ' + M_CONTROLE + ',' + M_DESCRICAO + ' from ' + F_TABELA      + ' where ' + M_CONTROLE + ' = ' + QuotedStr(F_CODIGO) + '       ' +
             '     into                                                                 ' +
             '       V_CODIGO,                                                          ' +
             '         P_RESULTADO;                                                     ' +
             '   P_RETORNO = P_RESULTADO;                                               ' +
             '   suspend;                                                               ' +
             '                                                                          ' +
             ' end                                                                      ';
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
      on e: exception do
        begin
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE!' , 'error');
        end;
    end;
  finally
    result :=  Query.FindField('P_RETORNO').AsString;
    Query.Close;
    FreeAndNil(Query);
  end;

end;
function gera_log(Frase:String):boolean;
var
  Arquivo: String;
  Texto  : TextFile;
begin
  Arquivo := ExtractFilePath(Application.ExeName) +'erro' + '.log';
  AssignFile(Texto,Arquivo);
  if not FileExists(Arquivo) then
    Rewrite(Texto)
  else
    Append(Texto);
  WriteLn(Texto, Frase);
  CloseFile(Texto);
end;
function  executasql(Const F_SQL:String): boolean;
begin
  try
    with dm_rc.executasql do
      begin
        Close;
        DataSource := nil;
        UnPrepare;
        Sql.Clear;
        Sql.Add(F_SQL);
        Prepare;
        ExecSQL;
      end;
    result := True;
  except
    result := False;
  end;
end;

function  SqlProdutos(Const F_SQL:String): boolean;
begin
  with dm_rc.tbprodutos do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.tbprodutos.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaMvitens(Const F_SQL:String): boolean;
begin
  with dm_rc.tbmvitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.tbmvitens.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaMvmestre(Const F_SQL:String): boolean;
begin
  with dm_rc.FDQryMvmestre do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryMvmestre.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaTransporte(Const F_SQL:String): boolean;
begin
  with dm_rc.FDQryTransportes do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryTransportes.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaMedidas(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqrymedidas do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrymedidas.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaOperacao(Const F_SQL:String): boolean;
begin
  with dm_rc.FDQryoperacoes do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryoperacoes.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaDocumentos(Const F_SQL:String): boolean;
begin
  with dm_rc.FDQryDocumentos do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryDocumentos.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaRomaneio(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqryromaneio do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryromaneio.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaTitulosAnexo(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqrytitulosplanos do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrytitulosplanos.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaRomaneioItens(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqryromaneioitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryromaneioitens.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaSementes_BAS(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqrysementes_bas do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrysementes_bas.IsEmpty then
   result := False
 else
   result := True;
end;


function  TabelaPessoas(Const F_SQL:String): boolean;
begin
  with dm_rc.FDQryPessoas do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryPessoas.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaEmpresas(Const F_SQL:String): boolean;
begin
  with dm_rc.tbempresas do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.tbempresas.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaPortadores(Const F_SQL:String): boolean;
begin
  with dm_rc.tbportadores do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.tbportadores.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaReceber(Const F_SQL:String): boolean;
begin
  with dm_rc.tbreceber do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.tbreceber.IsEmpty then
   result := False
 else
   result := True;
end;


function  SqlPesquisa(Const F_SQL:String): boolean;
begin
  with dm_rc.sqlBuscas do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.sqlBuscas.IsEmpty then
   result := False
 else
   result := True;
end;
function  Saldo_Banco_Atual(const F_DATA : TDateTime;F_EMPRESA:integer) : real;
var
  saldoatual : real;
begin
  saldoatual := 0;

  if SqlPesquisa(' SELECT B.PORTADOR FROM BANCOS B ' +
                 ' WHERE EMISSAO <=                ' + QuotedStr(DataPonto(DateToStr(F_DATA))) +
                 ' AND    EMPRESA          =       ' + Inttostr(F_EMPRESA)                     +
                 ' AND B.PORTADOR <> 0             ' +
                 ' GROUP BY PORTADOR               ' +
                 ' ORDER BY B.PORTADOR') then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          saldoatual   := saldoatual +  Calcula_AntCaixa(F_EMPRESA,dm_rc.sqlBuscas.findfield('PORTADOR').AsInteger,F_DATA);

          dm_rc.sqlBuscas.Next;
        end;
    end;
  Result := saldoatual;
end;
function  Calcula_SaldoExtrato(const F_EMPRESA,F_FUNCIONARIO : Integer; F_DATA:TDate):Real;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn;

    M_SQL := ' execute block returns (P_RETORNO numeric(15,4))             as                ' +
             ' declare variable V_CREDITA numeric(14,3);                                     ' +
             ' declare variable V_DEBITA numeric(14,3);                                      ' +
             ' declare variable V_SALDO numeric(14,3);                                       ' +
             ' begin                                                                         ' +
             ' /* credita */                                                                 ' +
             '     select coalesce(sum(ec.valor),0)         from extrato_comissao ec         ' +
             '               where ec.empresa     = ' + IntToStr(F_EMPRESA)                + '  and                   ' +
             '                     ec.funcionario = ' +  IntToStr(F_FUNCIONARIO)           + '  and                   ' +
             '                     ec.tipo        = ' + QuotedStr('Entrada')               + '  and                   ' +
             '                     ec.pagamento  <= ' + QuotedStr(DataPonto(DateToStr(F_DATA))) + '  into :v_credita; ' +
             ' /* debita */                                                                  ' +
             '     select coalesce(sum(ec.valor),0)         from extrato_comissao ec         ' +
             '               where ec.empresa     = ' + IntToStr(F_EMPRESA)                + '  and                 ' +
             '                     ec.funcionario = ' +  IntToStr(F_FUNCIONARIO)           + '  and                 ' +
             '                     ec.tipo        = ' + QuotedStr('Saida')                 + '  and                 ' +
             '                     ec.pagamento  <= ' + QuotedStr(DataPonto(DateToStr(F_DATA))) + '  into :v_debita;' +
             '                                                                               ' +
             '   v_saldo = v_credita - v_debita ;                                            ' +
             '                                                                               ' +
             '   P_RETORNO = v_saldo;                                                        ' +
             '                                                                               ' +
             '   suspend;                                                                    ' +
             '                                                                               ' +
             'end                                                                            ';



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
      on e: exception do
        begin
        end;
    end;
  finally
    result :=  Query.FindField('P_RETORNO').AsFloat;
    Query.Close;
    FreeAndNil(Query);
  end;

end;
function  Calcula_AntCaixa(const F_EMPRESA,F_PORTADOR : Integer; F_DATA:TDate):Real;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn;

    M_SQL := ' execute block returns (P_RETORNO numeric(15,4))             as                ' +
             ' declare variable V_CREDITA numeric(14,3);                                     ' +
             ' declare variable V_DEBITA numeric(14,3);                                      ' +
             ' declare variable V_SALDO numeric(14,3);                                       ' +
             ' begin                                                                         ' +
             ' if (' + IntToStr(F_PORTADOR) +' = 0) then                                                         ' +
             '   begin                                                                       ' +
             ' /* credita */                                                                 ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.tipo    = ' + QuotedStr('Entrada')                                        + '  and                 ' +
             variif(F_EMPRESA = 0,'','                     bancos.empresa =  ' + IntToStr(F_EMPRESA)                + '  and                 ') +
             '                     bancos.emissao < ' + QuotedStr(DataPonto(DateToStr(F_DATA)))       + '  into :v_credita;  ' +
             ' /* debita */                                                                  ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.tipo    = ' + QuotedStr('Saida')                 + '  and                ' +
             variif(F_EMPRESA = 0,'','                     bancos.empresa =  ' + IntToStr(F_EMPRESA)                + '  and                 ') +
             '                     bancos.emissao < ' + QuotedStr(DataPonto(DateToStr(F_DATA)))       + ' into :v_debita;     ' +
             '   end                                                                         ' +
             ' else                                                                          ' +
             '   begin                                                                       ' +
             ' /* credita */                                                                 ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.portador = ' +  IntToStr(F_PORTADOR)             + '  and                 ' +
             variif(F_EMPRESA = 0,'','                     bancos.empresa =  ' + IntToStr(F_EMPRESA)                + '  and                 ') +
             '                     bancos.tipo     = ' + QuotedStr('Entrada')              + '  and                 ' +
             '                     bancos.emissao <  '+ QuotedStr(DataPonto(DateToStr(F_DATA)))        + '  into :v_credita;    ' +
             ' /* debita */                                                                  ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.portador = ' + IntToStr(F_PORTADOR)              + '  and                  ' +
             variif(F_EMPRESA = 0,'','                     bancos.empresa =  ' + IntToStr(F_EMPRESA)                + '  and                 ') +
             '                     bancos.tipo    =  ' + QuotedStr('Saida')                + '  and                  ' +
             '                     bancos.emissao <  ' + QuotedStr(DataPonto(DateToStr(F_DATA)))      + ' into :v_debita;       ' +
             '   end                                                                         ' +
             '                                                                               ' +
             '   v_saldo = v_credita - v_debita ;                                            ' +
             '                                                                               ' +
             '   P_RETORNO = v_saldo;                                                        ' +
             '                                                                               ' +
             '   suspend;                                                                    ' +
             '                                                                               ' +
             'end                                                                            ';



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
      on e: exception do
        begin
          //msg('Calcula_AntCaixa_Procedure Erro: ' + e.message);
        end;
    end;
  finally
    result :=  Query.FindField('P_RETORNO').AsFloat;
    Query.Close;
    FreeAndNil(Query);
  end;
end;
function  Calcula_SaldoatualCaixa(const F_EMPRESA,F_PORTADOR : Integer; F_DATA:TDate):Real;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn ;

    M_SQL := ' execute block returns (P_RETORNO numeric(15,4))             as                ' +
             ' declare variable V_CREDITA numeric(14,3);                                     ' +
             ' declare variable V_DEBITA numeric(14,3);                                      ' +
             ' declare variable V_SALDO numeric(14,3);                                       ' +
             ' begin                                                                         ' +
             ' if (' + IntToStr(F_PORTADOR) +' = 0) then                                     ' +
             '   begin                                                                       ' +
             ' /* credita */                                                                 ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.tipo    = ' + QuotedStr('Entrada')               + '  and               ' +
             variif(F_EMPRESA = 0, '','                     bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and               ') +
             '                     bancos.emissao < ' + QuotedStr(DataPonto(DateToStr(F_DATA)))       + '  into :v_credita;  ' +
             ' /* debita */                                                                  ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.tipo    = ' + QuotedStr('Saida')                 + '  and                ' +
             variif(F_EMPRESA = 0, '','                     bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and               ') +
             '                     bancos.emissao < ' + QuotedStr(DataPonto(DateToStr(F_DATA)))       + ' into :v_debita;     ' +
             '   end                                                                         ' +
             ' else                                                                          ' +
             '   begin                                                                       ' +
             ' /* credita */                                                                 ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.portador = ' + IntToStr(F_PORTADOR)                  + '  and                 ' +
             variif(F_EMPRESA = 0, '','                     bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and               ') +
             '                     bancos.tipo     = ' + QuotedStr('Entrada')                  + '  and                 ' +
             '                     bancos.emissao <= ' + QuotedStr(DataPonto(DateToStr(F_DATA)))        + '  into :v_credita;    ' +
             ' /* debita */                                                                  ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.portador = ' + IntToStr(F_PORTADOR)              + '  and                  ' +
             variif(F_EMPRESA = 0, '','                     bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and               ') +
             '                     bancos.tipo    =  ' + QuotedStr('Saida')                + '  and                  ' +
             '                     bancos.emissao <= ' + QuotedStr(DataPonto(DateToStr(F_DATA)))      + ' into :v_debita;       ' +
             '   end                                                                         ' +
             '                                                                               ' +
             '   v_saldo = v_credita - v_debita ;                                            ' +
             '                                                                               ' +
             '   P_RETORNO = v_saldo;                                                        ' +
             '                                                                               ' +
             '   suspend;                                                                    ' +
             '                                                                               ' +
             'end                                                                            ';

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
      on e: exception do
        begin
//          msg('Calcula_AntCaixa_Procedure Erro: ' + e.message);
        end;
    end;
  finally
    result :=  Query.FindField('P_RETORNO').AsFloat;
    Query.Close;
    FreeAndNil(Query);
  end;
end;
function  Sequencia_Caixa(const F_DATA : TDateTime; F_PORTADOR :integer) : Integer;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn;

    M_SQL := ' execute block returns (P_RETORNO integer)                   as                         ' +
             ' declare variable NUMERO integer;                                                       ' +
             ' begin                                                                                  ' +
             '   select count(coalesce(bancos.codigo,0))+1 as sequencia from bancos where bancos.portador  =                    ' + IntToStr(F_PORTADOR) +
             '   and bancos.emissao                                                                        =                    ' + QuotedStr(DataPonto(DateToStr(F_DATA))) + '             ' +
             '   into :numero;                                                                        ' +
             '   p_retorno  = NUMERO;                                                                 ' +
             '   suspend;                                                                             ' +
             ' end                                                                                    ';

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
      on e: exception do
        begin
        end;
    end;
  finally
    result :=  Query.FindField('p_retorno').AsInteger;

    Query.Close;
    FreeAndNil(Query);
  end;
end;
function  SqlPesquisaGerais(Const F_SQL:String):TFDQuery;
begin
  query := TFDQuery.Create(nil);
  with query do
    begin
      try
        try
          Connection := mm.SQLConn;
          UnPrepare;
          Close;
          sql.Clear;
          SQL.Add(F_SQL);
          Prepare;
          Open;
        except
          on e: exception do
            begin
              gera_log('Abre_Tabela ' + e.message);
            end;
        end;
      finally
        Result := query;
      end;
    end;
end;
function Calcula_AntPlano(const F_EMPRESA: Integer; F_PLANO: string; F_DATA: TDate): Real;
var
  M_SQL        : string;
  numero       : Integer;
  vError       : string;
  FDQryExecute : TFDQuery;
begin

  try
    M_SQL := ' execute block returns (P_RETORNO numeric(15,4))             as                ' +
             ' declare variable V_CREDITA numeric(14,3);                                     ' +
             ' declare variable V_DEBITA numeric(14,3);                                      ' +
             ' declare variable V_SALDO numeric(14,3);                                       ' +
             ' begin                                                                         ' +
             ' if (' + F_PLANO +' = 0) then                                                  ' +
             '   begin                                                                       ' +
             ' /* credita */                                                                 ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and                           ' +
             '                     bancos.tipo    = ' + QuotedStr('Entrada')               + '  and                           ' +
             '                     bancos.emissao < ' + QuotedStr(DataPonto(DateToStr(F_DATA)))       + '  into :v_credita;              ' +
             ' /* debita */                                                                  ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and                           ' +
             '                     bancos.tipo    = ' + QuotedStr('Saida')                 + '  and                           ' +
             '                     bancos.emissao < ' + QuotedStr(DataPonto(DateToStr(F_DATA)))       + ' into :v_debita;                ' +
             '   end                                                                         ' +
             ' else                                                                          ' +
             '   begin                                                                       ' +
             ' /* credita */                                                                 ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and                           ' +
             '                     bancos.planocontas = ' + QuotedStr(F_PLANO)             + '  and                           ' +
             '                     bancos.tipo    = ' + QuotedStr('Entrada')               + '  and                           ' +
             '                     bancos.emissao <     ' + QuotedStr(DataPonto(DateToStr(F_DATA)))   + ' into :v_credita;               ' +
             ' /* debita */                                                                  ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and                           ' +
             '                     bancos.planocontas = ' + QuotedStr(F_PLANO)             + '  and                           ' +
             '                     bancos.tipo        = ' + QuotedStr('Saida')             + '  and                           ' +
             '                     bancos.emissao <     ' + QuotedStr(DataPonto(DateToStr(F_DATA)))   + ' into :v_debita;                ' +
             '   end                                                                         ' +
             '                                                                               ' +
             '   v_saldo = v_credita - v_debita ;                                            ' +
             '                                                                               ' +
             '   P_RETORNO = v_saldo;                                                        ' +
             '                                                                               ' +
             '   suspend;                                                                    ' +
             '                                                                               ' +
             ' end                                                                           ';

    try
      FDQryExecute             := TFDQuery.Create(nil);
      FDQryExecute.Connection  := mm.SQLConn;
      with FDQryExecute do
        begin
          Close;
          Sql.Clear;
          SQL.Text := M_SQL;
          Open;
        end;
    except
      on e: exception do
        begin
          gera_log('Calcula Antplano: ' + e.message);
        end;
    end;
  finally
    result := FDQryExecute.FindField('P_RETORNO').asfloat;

    FreeAndNil(FDQryExecute);
  end;
end;

function Gera_Amostra(const F_DATA: TDateTime): string;
var
  M_AMOSTRA : string;
begin

  dm_rc.FDQryDocumentos.Close;
  dm_rc.FDQryDocumentos.SQL.Clear;
  dm_rc.FDQryDocumentos.SQL.Text := 'SELECT * FROM DOCUMENTOS WHERE DOCUMENTO = 8';
  dm_rc.FDQryDocumentos.Open;

 if  dm_rc.FDQryDocumentos.RecordCount > 0 then
   begin
     M_AMOSTRA := '';
     M_AMOSTRA := IntToStr(dm_rc.FDQryDocumentos.FindField('NUMERO').AsInteger + 1);

     try
       dm_rc.FDQryDocumentos.Edit;
       dm_rc.FDQryDocumentos.FindField('NUMERO').AsInteger := StrToInt(M_AMOSTRA);
       dm_rc.FDQryDocumentos.Post;
     finally
       if dm_rc.FDQryDocumentos.State = dsBrowse then  dm_rc.FDQryDocumentos.Edit;
         Result := StrZeroS(M_AMOSTRA,5)+ '/' + FormatDateTime('yy', F_DATA);
     end;
   end
 else
   Result := 'NC';
end;
function  TabelaProtocolo(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryProtocolo do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryProtocolo.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaAnalise(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryAnalise do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryAnalise.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaAnaliseItens(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryAnaliseitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryAnaliseitens.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaPMS(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryPMS do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryPMS.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaEspecie(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryEspecie do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryEspecie.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaCultivar(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryCultivar do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryCultivar.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaResponsavel(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryResponsavel do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryResponsavel.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaGerminacao(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryGerminacao do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryGerminacao.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaRTCliente(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryRTCliente do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryRTCliente.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaRTLaboratorio(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryResponsavel do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryResponsavel.IsEmpty then
   result := False
 else
   result := True;
end;
function VerificaProtocolo(Const F_PROTOCOLO:Integer;tipo:string):string;
var
  sql : string;
begin
  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;

  if tipo = 'BOLETIM' then
    M_SQL := 'select boletim as resultado  from protocolo where codigo  = ' + IntToStr(F_PROTOCOLO);
  if tipo = 'INFORMATIVO' then
    M_SQL := 'select numeroir as resultado from protocolo where codigo = ' + IntToStr(F_PROTOCOLO);
  if tipo = 'FICHA' then
    M_SQL := 'select protocolo as resultado from analise where protocolo = ' + IntToStr(F_PROTOCOLO);

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := M_SQL;
      Prepare;
      Open;
    end;

  if query.FindField('resultado').AsString <> ''  then
    Result := 'T'
  else
    Result := 'F';

  query.Free;
end;
function  SqlPesquisaSecundaria(Const F_SQL:String):Boolean;
begin
  with dm_rc.sqlpesquisasecundaria do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.sqlpesquisasecundaria.IsEmpty then
   result := False
 else
   result := True;

end;
function  SqlGraficos(Const F_SQL:String):Boolean;
begin
  with dm_rc.sqlgraficos do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.sqlgraficos.IsEmpty then
   result := False
 else
   result := True;
end;

function  SqlPesquisaPrimeira(Const F_SQL:String):Boolean;
begin
  with dm_rc.sqlpesquisaprimaria do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.sqlpesquisaprimaria.IsEmpty then
   result := False
 else
   result := True;

end;
function  TabelaCategoria(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrycategoria do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrycategoria.IsEmpty then
   result := False
 else
   result := True;

end;
function  TabelaPeneira(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrypeneira do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrypeneira.IsEmpty then
   result := False
 else
   result := True;
end;
function  Tabelaregiao(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqryregiao do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryregiao.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaSementes(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrysementes do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrysementes.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaLaboratorio(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrylaboratorio do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrylaboratorio.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaProdutos(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryProdutos do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryProdutos.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaTitulos(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrytitulos do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrytitulos.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaEscritas(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqryescritas do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryescritas.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaPontos(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrypontos do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrypontos.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaEventoXML(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqryeventoxml do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryeventoxml.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaUsuarios(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqryusuarios do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryusuarios.IsEmpty then
   result := False
 else
   result := True;
end;
function  VerificaExisteAssinatura(const prt :Integer):boolean;
var
  sql : string;
begin
  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;
  M_SQL            := 'select assinatura from responsavel where codigo = ' + IntToStr(prt);

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := M_SQL;
      Prepare;
      Open;
    end;

  if query.FindField('assinatura').AsString = '' then
    Result := False
  else
    Result := True;

  query.Free;
end;
function  QtdeParcelas(rnumero,rdocumento,rempresa:integer;rtabela:string)   :Integer;
var
  sql : string;
begin
  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;
  M_SQL            := ' select count(codigo) as parcelas from ' + rtabela  +
                      ' where numero      = ' + IntToStr(rnumero)    +
                      ' and documento     = ' + IntToStr(rdocumento) +
                      ' and empresa       = ' + IntToStr(rempresa);

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := M_SQL;
      Prepare;
      Open;
    end;

  Result := query.FindField('parcelas').AsInteger;

  query.Free;

end;
function  VerificaDevolucao(const F_OPERACAO :Integer):string;
var
  sql : string;
begin
  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;
  M_SQL            := 'select tipo from operacoes where codigo = ' + IntToStr(F_OPERACAO);

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := M_SQL;
      Prepare;
      Open;
    end;

  result:= query.FindField('tipo').AsString
end;
procedure CalculaSaldoEF          (const pcontrole:integer);
var
  tabelaef : TFDQuery;
begin
  tabelaef            := TFDQuery.Create(nil);
  tabelaef.Connection := mm.SQLConn;
  mm.FDTransaction.StartTransaction;

  M_SQL := ' execute block returns (r_resultado Numeric(15,4)) as ' +
           ' declare variable V_CREDITO    numeric(14,3);         ' +
           ' declare variable V_DEBITO     numeric(14,3);         ' +
           ' declare variable V_SALDO      numeric(14,3);         ' +
           ' declare variable V_ENTREGUE   numeric(14,3);         ' +
           'begin                                                 ' +
           'select coalesce(sum(r.quantidade),0) from ENTREGA_FUTURA r                          ' +
           '          where                                                                     ' +
           '          r.codigo             =  ' + IntToStr(pcontrole) + '       into :v_credito;' +
           'select coalesce(sum(r.quantidade),0) from mvitens  r                                ' +
           '          where                                                                     ' +
           '          r.CODVEF             =                                                    ' + IntToStr(pcontrole) + ' and ' +
           '          r.cancelada <> '+QuotedStr('C')                                         + '    into :v_debito; '  +
           'v_saldo     = v_credito - v_debito;                                                 ' +
           'v_entregue  = v_credito - v_saldo;                                                  ' +
           'r_resultado = v_saldo;                                                              ' +
           'update ENTREGA_FUTURA set ENTREGA_FUTURA.saldo       = :v_saldo,                    ' +
           '                          entrega_futura.entregue    = :v_entregue                  ' +
           'where  ENTREGA_FUTURA.codigo =                                                      ' + IntToStr(pcontrole) +' ; '  +
           'suspend;                                                                            ' +
           'end                                                                                 ';

    try
      with tabelaef do
        begin
          Close;
          DataSource := nil;
          UnPrepare;
          Sql.Clear;
          Sql.Add(M_SQL);
          Prepare;
          ExecSQL;
        end;
    except
      on e: exception do
        begin
          gera_log('CalculaSaldoEF Erro: ' + e.message);
        end;
    end;

  mm.FDTransaction.CommitRetaining;
  mm.FDTransaction.Commit;
  tabelaef.Free;
end;
procedure Calcula_Lote(const F_EMPRESA,F_PRODUTO:integer;F_LOTE,F_BOLETIM,F_TERMO,F_TIPO:string);
var
  procgeralote : TFDQuery;
begin
  procgeralote            := TFDQuery.Create(nil);
  procgeralote.Connection := mm.SQLConn;
  mm.FDTransaction.StartTransaction;

  M_SQL := ' execute block returns (r_resultado Numeric(15,4)) as ' +
           ' declare variable V_CREDITO numeric(14,3);      ' +
           ' declare variable V_DEBITO  numeric(14,3);      ' +
           ' declare variable V_SALDO   numeric(14,3);      ' +
           'begin                                           ' +
           'select coalesce(sum(r.quantidade),0) from relatorio_lotes r                         ' +
           '          where                                                                     ' +
           '                 r.entrada_saida    =     0                         and             ' +
           '                 r.EMPRESA          = ' + IntToStr(F_EMPRESA) + '   and             ' +
           '                 r.PRODUTO          = ' + IntToStr(F_PRODUTO) + '   and             ' +
           '                 r.lotesemente      = ' + QuotedStr(F_LOTE)   + '   and             ' +
           '                 r.boletim          = ' + QuotedStr(F_BOLETIM)+ '   into :v_credito;' +
           'select                                                                              ' +
           variif(F_TIPO = 'Saco',
           'coalesce(sum((r.quantidade) * r.pesosaco),0)                                        ',
           'coalesce(sum(r.quantidade),0)                                                       ')+
           'from relatorio_lotes r                                                              ' +
           '          where                                                                     ' +
           '                 r.entrada_saida    =     1                         and             ' +
           '                 r.cancelada        <>' + QuotedStr('C')      + '   and             ' +
           '                 r.EMPRESA          = ' + IntToStr(F_EMPRESA) + '   and             ' +
           '                 r.PRODUTO          = ' + IntToStr(F_PRODUTO) + '   and             ' +
           '                 r.lotesemente      = ' + QuotedStr(F_LOTE)   + '   and             ' +
           '                 r.boletim          = ' + QuotedStr(F_BOLETIM)+ '   into :v_debito ;' +
           'v_saldo     = v_credito - v_debito;                                                 ' +
           'r_resultado = v_saldo;                                                              ' +
           'update sementes set sementes.disponivel       = :v_saldo where   produto = '+IntToStr(F_PRODUTO) +' and  '  +
           '                                                                 lote    = '+QuotedStr(F_LOTE)   +' and  '  +
           '                                                                 empresa = '+IntToStr(F_EMPRESA) +' and  '  +
           '                                                                 boletim = '+QuotedStr(F_BOLETIM)+' ;    '  +
           'update sementes set sementes.disponivelfiscal = :v_saldo where   produto = '+IntToStr(F_PRODUTO) +' and  '  +
           '                                                                 lote    = '+QuotedStr(F_LOTE)   +' and  '  +
           '                                                                 empresa = '+IntToStr(F_EMPRESA) +' and  '  +
           '                                                                 boletim = '+QuotedStr(F_BOLETIM)+' ;    '  +
           'suspend;                                                                                        '           +
           'end                                                                                             ';


    try
      with procgeralote do
        begin
          Close;
          DataSource := nil;
          UnPrepare;
          Sql.Clear;
          Sql.Add(M_SQL);
          Prepare;
          ExecSQL;
        end;
    except
      on e: exception do
        begin
          gera_log('Gera_Lote Erro: ' + e.message);
        end;
    end;

  mm.FDTransaction.CommitRetaining;
  mm.FDTransaction.Commit;
  procgeralote.Free;

end;
function  TabelaBatidaItens(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrybatidaitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrybatidaitens.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaBatidaMestre(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrybatidamestre do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrybatidamestre.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaMfmestre(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrymfmestre do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrymfmestre.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaMfitens(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrymfitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrymfitens.IsEmpty then
   result := False
 else
   result := True;
end;
function  Tabelabeneitens(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrybeneitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrybeneitens.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaPermissao(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrypermissao do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrypermissao.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaCampoitens(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqrycampoitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrycampoitens.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaResponsavelAssinatura(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqryresponsavelassinatura do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryresponsavelassinatura.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaSolicitacao(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqrysolicitacao do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrysolicitacao.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaSolicitacaoItens(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqrysolicitacaoitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrysolicitacaoitens.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaManutencaoLoteProducao(Const F_SQL:String): boolean;
begin
  with dm_rc.FDQuerymanutencaolote_interno do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQuerymanutencaolote_interno.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaProducaoItens(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqryproducaointernaitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryproducaointernaitens.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaCheques(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqrycheques do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrycheques.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaChequeHistorico(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqrychequeshistorico do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrychequeshistorico.IsEmpty then
   result := False
 else
   result := True;

end;
function  TabelaCustoProducao(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqrycustoproducao do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrycustoproducao.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaCustoLoteinternoItens(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqrycustoloteinternoitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrycustoloteinternoitens.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaCustoLoteinterno(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqrycustoloteinterno do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrycustoloteinterno.IsEmpty then
   result := False
 else
   result := True;

end;
function  TabelaEntregaLote(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqryentregalote do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryentregalote.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaEntregaFutura(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqryentregafutura do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryentregafutura.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaEntregaProduto(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqryentregaproduto do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryentregaproduto.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaFonecedor(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqryfornecedorproduto do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryfornecedorproduto.IsEmpty then
   result := False
 else
   result := True;
end;
function  Sequencia_Lote(const P_LOTE,P_BOLETIM:string;P_PRODUTO,P_EMPRESA:integer):Integer;
begin
  with dm_rc.procSEQUENCIA_LOTE do
    begin
      StoredProcName := 'SEQUENCIA_LOTE';
      Prepare;
      ParamByName('P_EMPRESA').AsInteger     := P_EMPRESA;
      ParamByName('P_PRODUTO').AsInteger     := P_PRODUTO;
      ParamByName('P_LOTE').AsString         := P_LOTE;
      ParamByName('P_BOLETIM').AsString      := P_BOLETIM;
      ExecProc;

      result := ParamByName('R_SEQUENCIA').AsInteger;
    end;

end;
procedure  Saldo_Beneficiamento(const P_TIPO,P_SERIE:string;P_NOTA,P_PRODUTO,P_SEQUENCIA,P_EMPRESA:integer);
var
  procgeralote : TFDQuery;
begin
  procgeralote            := TFDQuery.Create(nil);
  procgeralote.Connection := mm.SQLConn;
  mm.FDTransaction.StartTransaction;

    M_SQL := ' execute block returns (P_RETORNO integer)                   as                                     '  +
             ' declare variable V_SALDO numeric(15,4);                                                            '  +
             ' declare variable V_CREDITO numeric(15,4);                                                          '  +
             ' declare variable P_TIPO varchar(10);                                                               '  +
             ' declare variable V_DEBITO numeric(15,4);                                                           '  +
             ' begin                                                                                              '  +
             '   if (p_tipo = ' + QuotedStr('CARREGA') + ') then                                                  '  +
             '     begin                                                                                          '  +
             '       SELECT mvitens.disponivel FROM mvitens WHERE numero = ' + IntToStr(P_NOTA)                 + '                                '  +
             '       AND SERIE     = ' + QuotedStr(P_SERIE) + '                                                   '  +
             '       AND PRODUTO   = ' + IntToStr(P_PRODUTO)+ '                                                   '  +
             '       AND EMPRESA   = ' + IntToStr(P_EMPRESA)+ '                                                   '  +
             '       AND SEQUENCIA = ' + IntToStr(P_SEQUENCIA) + ' into V_SALDO;                                  '  +
             '       p_retorno     =  V_SALDO;                                                                    '  +
             '     end                                                                                            '  +
             '   if ((p_tipo = ' + QuotedStr('GRAVA') + ') or (p_tipo = ' + QuotedStr('EXCLUI') +') ) then        '  +
             '     begin                                                                                          '  +
             '       SELECT coalesce(SUM(beneitens.quantidade),0) FROM beneitens WHERE nota = ' + IntToStr(P_NOTA)+'             '  +
             '       AND SERIE     = ' + QuotedStr(P_SERIE) + '                                                   '  +
             '       AND PRODUTO   = ' + IntToStr(P_PRODUTO)+ '                                                   '  +
             '       AND EMPRESA   = ' + IntToStr(P_EMPRESA)+ '                                                   '  +
             '       AND SEQUENCIA = ' + IntToStr(P_SEQUENCIA) + '  into v_debito;                                '  +
             '                                                                                                    '  +
             '       SELECT coalesce(SUM(mvitens.quantidade),0) FROM MVITENS WHERE NUMERO = '+ IntToStr(P_NOTA)+'                '  +
             '       AND SERIE     = ' + QuotedStr(P_SERIE) + '                                                   '  +
             '       AND PRODUTO   = ' + IntToStr(P_PRODUTO)+ '                                                   '  +
             '       AND EMPRESA   = ' + IntToStr(P_EMPRESA)+ '                                                   '  +
             '       AND SEQUENCIA = ' + IntToStr(P_SEQUENCIA) + ' into v_credito;                                '  +
             '                                                                                                    '  +
             '       V_SALDO       = v_credito - v_debito;                                                        '  +
             '       p_retorno     = V_SALDO;                                                                     '  +
             '                                                                                                    '  +
             '       update mvitens set mvitens.disponivel = :v_saldo where empresa                             = ' + IntToStr(P_EMPRESA)   +
             '       and produto                                                                                = ' + IntToStr(P_PRODUTO)   +
             '       and serie                                                                                  = ' + QuotedStr(P_SERIE)    + ' ' +
             '       and sequencia                                                                              = ' + IntToStr(P_SEQUENCIA) +
             '       and numero                                                                                 = ' + IntToStr(P_NOTA) +'; ' +
             '     end                                                                                                                              ' +
             '   suspend;                                                                                                                           ' +
             ' end                                                                                                                                  ';

    try
      with procgeralote do
        begin
          Close;
          DataSource := nil;
          UnPrepare;
          Sql.Clear;
          Sql.Add(M_SQL);
          Prepare;
          ExecSQL;
        end;
    except
      on e: exception do
        begin
          gera_log('Gera_Lote Erro: ' + e.message);
        end;
    end;

  mm.FDTransaction.CommitRetaining;
  mm.FDTransaction.Commit;
  procgeralote.Free;

end;
function  Sequencia_Menusisterma(const P_MENU:string):Integer;
begin
  with dm_rc.procSEQUENCIA_MENUSISTEMA do
    begin
      StoredProcName := 'SEQUENCIA_MENUSISTEMA';
      Prepare;
      ParamByName('P_MENU').AsString         := P_MENU;
      ExecProc;

      result := ParamByName('R_SEQUENCIA').AsInteger;

    end;
end;
function  Verifica_Permissao(const P_EMPRESA,P_FUNCIONARIO:Integer;P_TABELA,P_TIPO:string):string;
begin
  with dm_rc.procVERIFICA_PERMISSAO do
    begin
      StoredProcName := 'VERIFICA_PERMISSAO';
      Prepare;
      ParamByName('P_EMPRESA').AsInteger       := P_EMPRESA;
      ParamByName('P_FUNCIONARIO').AsInteger   := P_FUNCIONARIO;
      ParamByName('P_TABELA').AsString         := P_TABELA;
      ParamByName('P_TIPO').AsString           := P_TIPO;
      ExecProc;

      if (P_FUNCIONARIO = 9999) or (mm.vUserMaster = 'S') then
        Result := 'T'
      else
        result := ParamByName('R_RESULTADO').AsString;
    end;
end;
function DashboardFaturamentoCard   (const ptipo:string;pempresa:integer) : Real;
var
  sql: string;
  datainiciomes,
  datafinalmes   : string;
begin

  datainiciomes := DateToStr(StartOfTheMonth(date));
  datafinalmes  := DateToStr(EndOfMonth(StrToDate(datainiciomes)));

  if ptipo = 'totalnotas' then
    begin
      sql :=
       ' select coalesce(sum(m.vlrtotal),0) as emitidas from mvmestre m     ' +
       '   inner join operacoes o on o.codigo = m.operacao                  ' +
       '   where m.empresa =                                                ' + IntToStr(pempresa)  +
       '   and m.cancelada =                                                ' + QuotedStr('A')      +
       '   and m.emissao between                                            ' + QuotedStr(DataPonto(datainiciomes)) +
       '   and                                                              ' + QuotedStr(DataPonto(datafinalmes))  +
       '   and ((O.operacao_op = '+QuotedStr('Vendas')+') or (o.operacao_op = '+QuotedStr('Venda EF')+'))';
      SqlPesquisa(sql);
      Result := dm_rc.sqlBuscas.FindField('emitidas').AsFloat;
    end;

  if ptipo = 'qtdenotas' then
    begin
      sql :=
       ' select coalesce(count(m.codigo),0) as qtdenotas from mvmestre m     ' +
       '   where m.empresa =                                                ' + IntToStr(pempresa)  +
       '   and m.cancelada =                                                ' + QuotedStr('A')      +
       '   and m.emissao between                                            ' + QuotedStr(DataPonto(datainiciomes)) +
       '   and                                                              ' + QuotedStr(DataPonto(datafinalmes));
      SqlPesquisa(sql);
      Result := dm_rc.sqlBuscas.FindField('qtdenotas').AsFloat;
    end;
  if ptipo = 'maniaberto' then
    begin
      sql :=
       ' select coalesce(count(m.codigo),0) as qtdemani from mfmestre m     ' +
       '   where m.empresa =                                                ' + IntToStr(pempresa)  +
       '   and m.cancelada =                                                ' + QuotedStr('A');
      SqlPesquisa(sql);
      Result := dm_rc.sqlBuscas.FindField('qtdemani').AsFloat;
    end;
  if ptipo = 'valoricms' then
    begin
      sql :=
       ' select coalesce(sum(m.vlricms),0) as totalicms from mvmestre m     ' +
       '   where m.empresa =                                                ' + IntToStr(pempresa)  +
       '   and m.cancelada =                                                ' + QuotedStr('A')      +
       '   and m.emissao between                                            ' + QuotedStr(DataPonto(datainiciomes)) +
       '   and                                                              ' + QuotedStr(DataPonto(datafinalmes));
      SqlPesquisa(sql);
      Result := dm_rc.sqlBuscas.FindField('totalicms').AsFloat;
    end;
end;
procedure DashboardFinanceiro    (const ptipo:string;pempresa:integer);
var
  sql: string;
  datainiciosemana,
  datafinalsemana : string;
begin
  if ptipo = 'atrasado' then
    begin
      dm_rc.tbatrasados.Close;
      dm_rc.tbatrasados.Open;

      sql :=
           ' select r.pessoa,p.nome,r.sequencia,r.vencimento,r.valoratual from receber r ' +
           '   inner join pessoas p on p.codigo = r.pessoa                      ' +
           '   where r.empresa =                                                ' + IntToStr(pempresa)  +
           '   and   r.financeiro =                                             ' + IntToStr(1)         +
           '   and   r.vencimento <                                             ' + QuotedStr(DataPonto(datetostr(date))) +
           '   and   r.situacao   =                                             ' + QuotedStr('Aberto') +
           ' order by r.vencimento                                        ';

      if SqlPesquisa(sql) then
        begin
          dm_rc.sqlBuscas.First;
          while not dm_rc.sqlBuscas.Eof do
            begin
              dm_rc.tbatrasados.Append;
              dm_rc.tbatrasados.FindField('NOME').AsString       := dm_rc.sqlBuscas.FindField('NOME').AsString;
              dm_rc.tbatrasados.FindField('VENCIMENTO').AsString := dm_rc.sqlBuscas.FindField('VENCIMENTO').AsString;
              dm_rc.tbatrasados.FindField('PARCELA').AsInteger   := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsInteger;
              dm_rc.tbatrasados.FindField('PESSOA').AsInteger    := dm_rc.sqlBuscas.FindField('PESSOA').AsInteger;
              dm_rc.tbatrasados.FindField('VALOR').AsFloat       := dm_rc.sqlBuscas.FindField('VALORATUAL').AsFloat;
              dm_rc.tbatrasados.FindField('DIAS').AsInteger      := DaysBetween(dm_rc.tbatrasados.FindField('VENCIMENTO').AsDateTime,Date) * (-1);
              dm_rc.tbatrasados.Post;

              dm_rc.sqlBuscas.Next;
            end;
          dm_rc.tbatrasados.First;
        end;
    end;

  if ptipo = 'vencendohoje' then
    begin
      datainiciosemana := DateToStr( StartOftheWeek(date)-1 );
      datafinalsemana  := DateToStr( StartOftheWeek(date)+5 );


      dm_rc.tbvencendohoje.Close;
      dm_rc.tbvencendohoje.Open;

      sql :=
           ' select r.pessoa,p.nome,r.sequencia,r.valoratual,r.vencimento from receber r ' +
           '   inner join pessoas p on p.codigo = r.pessoa                      ' +
           '   where r.empresa =                                                ' + IntToStr(pempresa)  +
           '   and   r.financeiro =                                             ' + IntToStr(1)         +
           '   and   r.vencimento between                                       ' + QuotedStr(DataPonto(datainiciosemana)) +
           '   and                                                              ' + QuotedStr(DataPonto(datafinalsemana))  +
           '   and   r.situacao   =                                             ' + QuotedStr('Aberto') +
           ' order by r.vencimento                                              ';

      if SqlPesquisa(sql) then
        begin
          dm_rc.sqlBuscas.First;
          while not dm_rc.sqlBuscas.Eof do
            begin
              dm_rc.tbvencendohoje.Append;
              dm_rc.tbvencendohoje.FindField('NOME').AsString       := dm_rc.sqlBuscas.FindField('NOME').AsString;
              dm_rc.tbvencendohoje.FindField('PARCELA').AsInteger   := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsInteger;
              dm_rc.tbvencendohoje.FindField('PESSOA').AsInteger    := dm_rc.sqlBuscas.FindField('PESSOA').AsInteger;
              dm_rc.tbvencendohoje.FindField('VALOR').AsFloat       := dm_rc.sqlBuscas.FindField('VALORATUAL').AsFloat;
              dm_rc.tbvencendohoje.FindField('VENCIMENTO').AsString := dm_rc.sqlBuscas.FindField('VENCIMENTO').AsString;
              dm_rc.tbvencendohoje.Post;

              dm_rc.sqlBuscas.Next;
            end;
          dm_rc.tbvencendohoje.First;
        end;
    end;

end;
function  DashboardFinanceiroCard(const ptipo:string;pempresa:integer):Real;
var
  sql: string;
  datainiciosemana,
  datafinalsemana        : string;
  spagar,sreceber,ssaldo : Real;
begin
  if ptipo = 'receber' then
    begin
      sql :=
       ' select coalesce(sum(r.valoratual),0) as receber from receber r     ' +
       '   where r.empresa =                                                ' + IntToStr(pempresa)  +
       '   and   r.financeiro =                                             ' + IntToStr(1)         +
       '   and   r.situacao   =                                             ' + QuotedStr('Aberto');
      SqlPesquisa(sql);
      Result := dm_rc.sqlBuscas.FindField('RECEBER').AsFloat;
    end;
  if ptipo = 'pagar' then
    begin
      sql :=
       ' select coalesce(sum(r.valoratual),0) as pagar from pagar r         ' +
       '   where r.empresa =                                                ' + IntToStr(pempresa)  +
       '   and   r.financeiro =                                             ' + IntToStr(0)         +
       '   and   r.situacao   =                                             ' + QuotedStr('Aberto');
      SqlPesquisa(sql);
      Result := dm_rc.sqlBuscas.FindField('pagar').AsFloat;
    end;
  if ptipo = 'saldo' then
    begin
      ssaldo   := 0;
      spagar   := 0;
      sreceber := 0;

      sql :=
       ' select coalesce(sum(r.valoratual),0) as receber from receber r     ' +
       '   where r.empresa =                                                ' + IntToStr(pempresa)  +
       '   and   r.financeiro =                                             ' + IntToStr(1)         +
       '   and   r.situacao   =                                             ' + QuotedStr('Aberto');
      SqlPesquisa(sql);
      sreceber := dm_rc.sqlBuscas.FindField('receber').AsFloat;
      sql :=
       ' select coalesce(sum(r.valoratual),0) as pagar from pagar r         ' +
       '   where r.empresa =                                                ' + IntToStr(pempresa)  +
       '   and   r.financeiro =                                             ' + IntToStr(0)         +
       '   and   r.situacao   =                                             ' + QuotedStr('Aberto');
      SqlPesquisa(sql);
      spagar := dm_rc.sqlBuscas.FindField('pagar').AsFloat;

      ssaldo := sreceber - spagar;
      Result := ssaldo;
    end;

  if ptipo = 'vencendosemana' then
    begin
      datainiciosemana := DateToStr( StartOftheWeek(date)-1 );
      datafinalsemana  := DateToStr( StartOftheWeek(date)+5 );

      sql :=
           ' select coalesce(sum(r.valoratual),0) as semana from receber r             ' +
           '   where r.empresa =                                                ' + IntToStr(pempresa)  +
           '   and   r.financeiro =                                             ' + IntToStr(1)         +
           '   and   r.vencimento between                                       ' + QuotedStr(DataPonto(datainiciosemana)) +
           '   and                                                              ' + QuotedStr(DataPonto(datafinalsemana))  +
           '   and   r.situacao   =                                             ' + QuotedStr('Aberto');

      SqlPesquisa(sql);
      Result := dm_rc.sqlBuscas.FindField('semana').AsFloat;
    end;

  if ptipo = 'atrasados' then
    begin
      datainiciosemana := DateToStr( StartOftheWeek(date)-1 );
      datafinalsemana  := DateToStr( StartOftheWeek(date)+5 );

      sql :=
           ' select coalesce(sum(r.valoratual),0) as atrasados from receber r   ' +
           '   where r.empresa =                                                ' + IntToStr(pempresa)  +
           '   and   r.financeiro =                                             ' + IntToStr(1)         +
           '   and   r.vencimento < current_date                                ' +
           '   and   r.situacao   =                                             ' + QuotedStr('Aberto');

      SqlPesquisa(sql);
      Result := dm_rc.sqlBuscas.FindField('atrasados').AsFloat;
    end;
end;
function  SaldoProdutoKardex_Nota (const rempresa,rproduto:integer;datafin:TDateTime):Real;
var
  procgeralote : TFDQuery;
  V_SALDO      : Real;
begin
  procgeralote            := TFDQuery.Create(nil);
  procgeralote.Connection := mm.SQLConn;
  V_SALDO                 := 0;

  M_SQL :=
          'select                                                                                 ' +
          '  entradas - saidas as saldo                                                           ' +
          'from (                                                                                 ' +
          '    select                                                                             ' +
          '      p.produto,                                                                       ' +
          '      sum(iif(op.entrada_saida = 0 and p.data < ' + QuotedStr(DataPonto(DateToStr(datafin))) + ',p.quantidade,0)) entradas,    ' +
          '      sum(iif(op.entrada_saida = 1 and p.data < ' + QuotedStr(DataPonto(DateToStr(datafin))) + ',p.quantidade,0)) saidas       ' +
          '    from                                                                               ' +
          '      pontos p inner join operacoes op on (p.operacao = op.codigo)                     ' +
          '               inner join pessoas   pp on (p.pessoa   = pp.codigo)                     ' +
          '    where p.produto =                                                                  ' + IntToStr(rproduto) +
          '    and   p.empresa =                                                                  ' + IntToStr(rempresa) +
          '    and   p.data <                                                                     ' + QuotedStr(DataPonto(DateToStr(datafin))) +
          '    and   p.documento <>                                                               ' + QuotedStr('3')  +
          '    and   p.documento <>                                                               ' + QuotedStr('4')  +
          '    and   p.documento <>                                                               ' + QuotedStr('5')  +
          '    and   p.documento <>                                                               ' + QuotedStr('6')  +
          '    and   p.documento <>                                                               ' + QuotedStr('7')  +
          '    and   p.cancelada <>                                                               ' + QuotedStr('C')  +
          '    and   op.estoque  <>                                                               ' + QuotedStr('2')  +
//          '    and   p.serie     <>                                                               ' + QuotedStr('PRD')+
//          '    and   p.serie     <>                                                               ' + QuotedStr('BES')+
          '   group by 1 ) k                                                                      ';

  try
    with procgeralote do
      begin
        Close;
        UnPrepare;
        Sql.Clear;
        sql.Text := M_SQL;
        Prepare;
        Open;
      end;
    V_SALDO := procgeralote.FindField('SALDO').AsFloat;
  except
    on e: exception do
      begin
        gera_log('Saldo_Produto_Nota_Procedure Erro: ' + e.message);
      end;
  end;
  Result := V_SALDO;

  procgeralote.Free;
end;
procedure CalculaEntregaItens(const pempresa,pnumero,psequencia,pdocumento,pproduto:integer);
var
  calculaitens : TFDQuery;
begin
  calculaitens            := TFDQuery.Create(nil);
  calculaitens.Connection := mm.SQLConn;

  M_SQL :=
          ' execute block returns (r_resultado Numeric(15,4)) as             ' +
          ' declare variable V_DEBITO  numeric(14,3);                        ' +
          'begin                                                             ' +
          '  select coalesce(sum(ep.entregue),0) from entrega_produto ep     ' +
          '  where ep.numero    = '+IntToStr(pnumero)   +'                   ' +
          '  and   ep.documento = '+IntToStr(pdocumento)+'                   ' +
          '  and   ep.produto   = '+IntToStr(pproduto)  +'                   ' +
          '  and   ep.sequencia = '+IntToStr(psequencia)+'                   ' +
          '  and   ep.empresa   = '+IntToStr(pempresa)  +'                   ' +
          '  into v_debito;                                                  ' +
          '                                                                  ' +
          '  r_resultado   = v_debito;                                       ' +
          '                                                                  ' +
          '  update mvitens m set m.entregue = :v_debito                     ' +
          '               where m.numero    = '+IntToStr(pnumero)   +'       ' +
          '               and   m.documento = '+IntToStr(pdocumento)+'       ' +
          '               and   m.produto   = '+IntToStr(pproduto)  +'       ' +
          '               and   m.sequencia = '+IntToStr(psequencia)+'       ' +
          '               and   m.empresa   = '+IntToStr(pempresa)  +';      ' +
          '                                                                  ' +
          '  suspend;                                                        ' +
          'end                                                               ';

  try
    with calculaitens do
      begin
        Close;
        UnPrepare;
        Sql.Clear;
        sql.Text := M_SQL;
        Prepare;
        Open;
      end;
  except
    on e: exception do
      begin
        gera_log('CalculaEntregaItens Erro: ' + e.message);
      end;
  end;
  calculaitens.Free;
end;
function  Verifica_MenuMainPai    (const P_EMPRESA,P_FUNCIONARIO:Integer;P_MENU:string):Boolean;
var
  menu : TFDQuery;
begin
  menu            := TFDQuery.Create(nil);
  menu.Connection := mm.SQLConn;

  M_SQL :=
          'select                                                                    ' +
          '  men.menu                                                                ' +
          'from                                                                      ' +
          '  permissao per inner join menusistema men on (per.tabela = men.tabela)   ' +
          '  where per.funcionario                                                 = ' + IntToStr(P_FUNCIONARIO)+
          ' and per.empresa                                                        = ' + IntToStr(P_EMPRESA)    +
          ' and men.menu                                                           = ' + QuotedStr(P_MENU)      +
          ' and per.acessar                                                        = ' + QuotedStr('T')         +
          'group by 1                                                                ' ;

  try
    with menu do
      begin
        Close;
        UnPrepare;
        Sql.Clear;
        sql.Text := M_SQL;
        Prepare;
        Open;
        if menu.RecordCount > 0 then
          Result := True
        else
          Result := False;
      end;
  except
    on e: exception do
      begin
        gera_log('Verifica_MenuMainPai Erro: ' + e.message);
      end;
  end;
  menu.Free;
end;
procedure CalculaLoteInterno (const pempresa,pproduto:integer;lote:string);
var
  calculaitens : TFDQuery;
begin
  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;
  mm.FDTransaction.StartTransaction;

  M_SQL :=

    'execute block  as                                                                       '+
    'declare variable creditoKG numeric(18,2);                                               '+
    'declare variable debitoKG  numeric(18,2);                                               '+
    'declare variable saldoKG   numeric(18,2);                                               '+
    '                                                                                        '+
    'declare variable creditoPT numeric(18,2);                                               '+
    'declare variable debitoPT  numeric(18,2);                                               '+
    'declare variable saldoPT   numeric(18,2);                                               '+
    'declare variable entregadebitokg numeric(18,2);                                         '+
    'declare variable entregadebitopt numeric(18,2);                                         '+
    '                                                                                        '+
    'begin                                                                                   '+
    '  select coalesce(sum(mi.quantidade),0) from manutencaolote_interno mi                  '+
    '    where mi.empresa = '+IntToStr(pempresa)  +'                                         '+
    '    and   mi.produto = '+IntToStr(pproduto)  +'                                         '+
    '    and   mi.tipo    = '+QuotedStr('ENTRADA')+'                                         '+
    '    and   mi.lote    = '+QuotedStr(lote)     +' into creditoKG;                         '+
    '                                                                                        '+
    '  select coalesce(sum(mi.quantidade),0) from manutencaolote_interno mi                  '+
    '    where mi.empresa = '+IntToStr(pempresa)  +'                                         '+
    '    and   mi.produto = '+IntToStr(pproduto)  +'                                         '+
    '    and   mi.tipo    = '+QuotedStr('SAIDA')  +'                                         '+
    '    and   mi.lote    = '+QuotedStr(lote)     +' into debitoKG;                          '+
    '                                                                                        '+
    '  select coalesce(sum(el.quantidade),0) from entrega_lote el                            '+
    '    where el.empresa = '+IntToStr(pempresa)  +'                                         '+
    '    and   el.produto = '+IntToStr(pproduto)  +'                                         '+
    '    and   el.lote    = '+QuotedStr(lote)     +' into entregadebitokg;                   '+
    '                                                                                        '+
    '  saldoKG = (creditoKG - (debitoKG + entregadebitokg));                                 '+
    '                                                                                        '+
    '  select coalesce(sum(mi.totalpontos),0) from manutencaolote_interno mi                 '+
    '    where mi.empresa = '+IntToStr(pempresa)  +'                                         '+
    '    and   mi.produto = '+IntToStr(pproduto)  +'                                         '+
    '    and   mi.tipo    = '+QuotedStr('ENTRADA')+'                                         '+
    '    and   mi.lote    = '+QuotedStr(lote)     +' into creditopt;                         '+
    '                                                                                        '+
    '  select coalesce(sum(mi.totalpontos),0) from manutencaolote_interno mi                 '+
    '    where mi.empresa = '+IntToStr(pempresa)  +'                                         '+
    '    and   mi.produto = '+IntToStr(pproduto)  +'                                         '+
    '    and   mi.tipo    = '+QuotedStr('SAIDA')  +'                                         '+
    '    and   mi.lote    = '+QuotedStr(lote)     +' into debitopt;                          '+
    '                                                                                        '+
    '  select coalesce(sum(el.quantidade * li.pureza),0) from entrega_lote el inner join loteinterno li on (li.lote = el.lote) '+
    '    where el.empresa = '+IntToStr(pempresa)  +'                                         '+
    '    and   el.produto = '+IntToStr(pproduto)  +'                                         '+
    '    and   el.lote    = '+QuotedStr(lote)     +' into entregadebitopt;                   '+
    '  saldopt = (creditoPT - (debitoPT + entregadebitopt));                                 '+
    '                                                                                        '+
    '  update loteinterno li set li.disponivel  = :saldoKG,                                  '+
    '  li.totalpontos   =                         :saldopt                                   '+
    '  where li.empresa = '+IntToStr(pempresa)+'                                             '+
    '  and   li.produto = '+IntToStr(pproduto)+'                                             '+
    '  and   li.lote    = '+QuotedStr(lote)   +';                                            '+
    '  suspend;                                                                              '+
    'end                                                                                     ';


//  clipboard.AsText := m_sql;


  try

    with query do
      begin
        Close;
        DataSource := nil;
        UnPrepare;
        Sql.Clear;
        Sql.Add(M_SQL);
        Prepare;
        ExecSQL;
      end;

  except
    on e: exception do
      begin
        gera_log('CalculaLoteInterno Erro: ' + e.message);
      end;
  end;
  mm.FDTransaction.CommitRetaining;
  mm.FDTransaction.Commit;
  calculaitens.Free;
end;
function HttpGetMSG(get: string): TMsgInfo;
var
  RestClient  : TRESTClient;
  RestRequest : TRESTRequest;
  Response    : TRESTResponse;
  JsonObj     : TJSONObject;
begin
  RestClient  := TRESTClient.Create(nil);
  RestRequest := TRESTRequest.Create(nil);
  Response    := TRESTResponse.Create(nil);
  Result := TMsgInfo.Create; // Criamos a instância para armazenar os valores

  try
    RestRequest.Client     := RestClient;
    RestRequest.Response   := Response;

    RestClient.BaseURL     := get;
    RestClient.ContentType := 'application/json';
    RestRequest.Accept     := 'application/json';
    RestRequest.Method     := rmGET;

    RestRequest.Execute;

    // Faz o parsing do JSON recebido
    JsonObj := TJSONObject.ParseJSONValue(Response.Content) as TJSONObject;

    if Assigned(JsonObj) then
    try
      // Preenche os valores no objeto
      Result.Registro := JsonObj.GetValue<Integer>('registro');
      Result.Titulo   := JsonObj.GetValue<string>('titulo');
      Result.Corpo    := JsonObj.GetValue<string>('corpo');
    finally
      JsonObj.Free;
    end;

  finally
    RestRequest.Free;
    RestClient.Free;
    Response.Free;
  end;
end;
function HttpGet(get:string):string;
var
  RestClient  : TRESTClient;
  RestRequest : TRESTRequest;
  Response    : TRESTResponse;
  ArrayMsg    : TJSONArray;
  x           : integer;
begin

  RestRequest            := TRESTRequest .Create(mm);
  RestClient             := TRESTClient  .Create(mm);
  Response               := TRESTResponse.Create(mm);

  RestRequest.Client     := RestClient;
  RestRequest.Response   := Response;

  RestClient.BaseURL     := get;
  RestClient.ContentType := 'application/json';
  RestRequest.Accept     := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  RestRequest.Method     := rmGET;


  try
    RestRequest.Execute;

    ArrayMsg := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Response.JSONValue.ToJSON),0) as TJSONArray;
    Result   := ArrayMsg.Get(0).GetValue<string>('msg');
  finally

    FreeAndNil(RestRequest);
    FreeAndNil(RestClient);
    FreeAndNil(Response);
    ArrayMsg.DisposeOf;
  end;
end;
function Caminho(Retornar:String):String;
var
  Config: TextFile;
  Linha : string;
begin
  AssignFile(Config,ExtractFilePath(Application.ExeName) + 'Config.ib');
  Reset(Config);
  while not Eof(Config) do
    begin
      Readln(Config, Linha);
      if UpperCase(Copy(Linha,1,length(Retornar))) = UpperCase(Retornar) then
        Result := StrAllTrim(Copy(Linha,length(Retornar)+1,300));
    end;
  CloseFile(Config);
end;
function  verificastatuspessoa(const rpessoa:integer):Boolean;
var
  verpes : TFDQuery;
begin
  verpes            := TFDQuery.Create(nil);
  verpes.Connection := mm.SQLConn;

  M_SQL := 'select status from pessoas where codigo = ' + IntToStr(rpessoa);

  with verpes do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := M_SQL;
      Prepare;
      Open;
    end;

  if verpes.FindField('status').AsString = 'Block' then
    Result := True
  else
    Result := False;

  verpes.Free;
end;
function  Calcula_SaldoProdutoNota(const F_EMPRESA,F_PRODUTO : Integer; F_DATA:TDate):Real;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn ;

    M_SQL := ' execute block returns (P_RETORNO numeric(15,4))             as            ' +
             ' declare variable V_CREDITA numeric(14,3);                                 ' +
             ' declare variable V_DEBITA numeric(14,3);                                  ' +
             ' declare variable V_SALDO numeric(14,3);                                   ' +
             ' begin                                                                     ' +
             ' /* credita */                                                             ' +
             '     select coalesce(sum(m.quantidade),0) from mvitens m                   ' +
             '               inner join operacoes o on (o.codigo = m.operacao)           ' +
             '               where m.empresa       = ' + IntToStr(F_EMPRESA)               + '  and                 ' +
             '                     m.produto       = ' + IntToStr(F_PRODUTO)               + '  and                 ' +
             '                     m.cancelada    <> ' + QuotedStr('C')                    + '  and                 ' +
             '                     ((m.documento   = 1) or (m.documento = 2))            ' + '  and                 ' +
             '                     o.entrada_saida = ' + QuotedStr('0')                    + '  and                 ' +
             '                     o.tipo         <> ' + QuotedStr('Venda EF')             + '  and                 ' +
             '                     m.emissao      <= ' + QuotedStr(DataPonto(DateToStr(F_DATA)))        + '  into :v_credita;    ' +
             ' /* debita */                                                                  ' +
             '     select coalesce(sum(m.quantidade),0) from mvitens m                   ' +
             '               inner join operacoes o on (o.codigo = m.operacao)           ' +
             '               where m.empresa       = ' + IntToStr(F_EMPRESA)               + '  and                 ' +
             '                     m.produto       = ' + IntToStr(F_PRODUTO)               + '  and                 ' +
             '                     m.cancelada    <> ' + QuotedStr('C')                    + '  and                 ' +
             '                     ((m.documento   = 1) or (m.documento = 2))            ' + '  and                 ' +
             '                     o.entrada_saida = ' + QuotedStr('1')                    + '  and                 ' +
             '                     o.tipo         <> ' + QuotedStr('Venda EF')             + '  and                 ' +
             '                     m.emissao      <= ' + QuotedStr(DataPonto(DateToStr(F_DATA)))        + '  into :v_debita;    ' +
             '                                                                               ' +
             '   v_saldo = v_credita - v_debita ;                                            ' +
             '                                                                               ' +
             '   P_RETORNO = v_saldo;                                                        ' +
             '                                                                               ' +
             '   suspend;                                                                    ' +
             '                                                                               ' +
             'end                                                                            ';

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
      on e: exception do
        begin
        end;
    end;
  finally
    result :=  Query.FindField('P_RETORNO').AsFloat;
    Query.Close;
    FreeAndNil(Query);
  end;
end;
function  SequenciapagamentoComissao(const rpagamento:TDateTime) : integer;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn ;

    M_SQL := 'select                                     ' +
             '   count(ex.pagamento) + 1 as sequencia    ' +
             ' from                                      ' +
             ' extrato_comissao ex                       ' +
             ' where pagamento =                         ' + QuotedStr(DataPonto(DateToStr(rpagamento)));

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
      on e: exception do
        begin
        end;
    end;
  finally
    result :=  Query.FindField('sequencia').AsInteger;
    Query.Close;
    FreeAndNil(Query);
  end;
end;
function  TabelaSubPlanoContas(Const F_SQL:String): boolean;
begin
begin
  with dm_rc.fdqrysubplanocontas do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrysubplanocontas.IsEmpty then
   result := False
 else
   result := True;
end;
end;
function  TabelaMovimentoComissao(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqrymovcomissao do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrymovcomissao.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaCBNEF(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqrycbnef do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrycbnef.IsEmpty then
   result := False
 else
   result := True;
end;
end.
