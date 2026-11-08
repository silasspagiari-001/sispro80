unit mkm_relatorios;

interface

uses
  FireDAC.Comp.Client;

function RELATORIO_ESTOQUE_LOTE          (const etipo,elote,eboletim:string;eproduto,eempresa:integer):string;
function EXTRATO_BANCARIO_BANCO          (const eempresa,ebanco:integer;dataini,datafin:TDateTime)    :string;

function RELATORIO_VENDASPERIODO         (const rempresa:integer;rdataini,rdatafin,rpessoaini,rpessoafin,rtipo,rordem,rstatus,rvendas,rdevolucao,rvendasef,rbonifica,rtroca,routros:string):string;
function RELATORIO_VENDASPERIODO_PRODUTOS(const rempresa:integer;rdataini,rdatafin,rprodutoini,rprodutofin,rresumo,rtipo,rordem,rstatus,rvendas,rdevolucao,rvendasef,rbonifica,rtroca,routros:string):string;
function RELATORIO_LOTEBAS               (const rempresa:integer;rprodutoini,rprodutofin,rsaldos,ropcoes,rcategoria:string):string;
function RELATORIO_HISTORICOSEMSINTETICO (const rempresa:integer;rdataini,rdatafin,rprodutoini,rprodutofin,safra:string):string;
function RELATORIO_SALDOPRODUTONOTA      (const rempresa:integer;rdataini,rdatafin:string):string;

function ESCRITA_APURACAOICMS            (const rempresa:integer;dataini,datafin:string):string;
function ESCRITA_RELATORIOVENDASDETALHADA(const rempresaini,rempresafin:integer;rdataini,rdatafin,rpessoaini,rpessoafin,rtipo,rvendas,rdevolucao,rvendasef,rbonifica,rtroca,routros:string):string;
function ESCRITA_GRAFICO_FATURAMENTO_MENU(const rempresa:integer;ano:string):string;
function ESCRITA_CURVA_ABC_PESSOAS       (const rempresa,tipo:integer;ano:string):string;
function ESCRITA_HISTORICOSEMENTE        (const rempresa:integer;dataini,datafin:TDateTime;rprodutoini,rprodutofin:string):string;
function ESCRITA_TERMONOTA               (const rempresa,pnumero,pdocumento:integer):string;
function ESCRITA_SALDOBENENOTAS          (const rempresa:integer;dataini,datafin:TDateTime;rprodutoini,rprodutofin:string):string;
function ESCRITA_KARDEXPRODUTO           (const rempresa,rproduto:integer;dataini,datafin:string):string;
function ESCRITA_HISTORICOBENENOTA       (const rempresa,rproduto,rsequencia:integer;rnota,rserie:string):string;
function ESCRITA_HISTORICOBENENOTAPONTO  (const rempresa,rproduto:integer;rlote,rboletim:string):string;
function ESCRITA_HISTORICOCAMPO          (const rempresa,rproduto:integer;rcampo,rsafracampo:string):string;
function ESCRITA_VENDASVENDEDOR          (const rempresa,rvenini,rvenfin:integer;ordem,tipo,dataini,datafin:string):string;


function ESCRITA_RELATORIO_ENTREGAFUTURA (const rempresa,rprodutoini,rprodutofin,rpessoaini,rpessoafin:integer;dataini,datafin:TDateTime):string;
function ESCRITA_LISTAENTREGAITENS       (const rempresa,rnumero,rdocumento:integer):string;
function ESCRITA_RELATORIOENTREGAITENS   (const rempresa,rpessoaini,rpessoafin,rprodutoini,rprodutofin,rtipodoc,tipoentre:integer;dataini,datafin,uf:string):string;
function ESCRITA_FINANCEIRODOCUMENTO     (const rempresa,rnumero:integer;rserie:string):string;
function ESCRITA_SALDOENTREGAFUTURA      (const rempresa,rpessoa:integer):string;

function ESCRITA_RELACAOLOTEINTERNO      (const rempresa,produtoini,produtofin,grupoini,grupofin:integer;ordem,tipo,barracao,tipolote:string):string;
function ESCRITA_RELATORIOSALDOEFEP      (const rempresa,pessoaini,pessoafin,produtoini,produtofin:integer;dataini,datafin:TDateTime):string;
function ESCRITA_CRESCIMENTOTENDECIA     (const rempresa:integer;rtipo,rvendas,rdevolucao,rvendasef,rbonifica,rtroca,routros:string):string;
function ESCRITA_COMISSAOBAIXAEFETUADA   (const rempresa:integer;rfuncionarioini,rfuncionariofin:string;dataini,datafin:TDateTime):string;
function ESCRITA_PREVISAOCOMISSAO        (const rempresa:integer;rfuncionarioini,rfuncionariofin,rbuscapor:string;dataini,datafin:TDateTime):string;
function ESCRITA_COMISSAORECEBER         (const rempresa,rnumero,rsequencia:integer):string;
function ESCRITA_RELATORIO_FINANCEIRO    (const rempresaini,rempresafin,rportadorini,rportadorfin,rpessoaini,rpessoafin,rfinanceiro,rtipobusca,rsituacao,ragrupar:integer;rplanoini,rplanofin:string;dataini,datafin:TDateTime):string;

//***************************************************************************//
// SPED FISCAL
//***************************************************************************//
function ESCRITA_SPED_ENTRADA            (const rempresa:integer;dataini,datafin:TDateTime):string;
function ESCRITA_SPED_SAIDA              (const rempresa:integer;dataini,datafin:TDateTime):string;
function ESCRITA_SPED_TRANSPORTE         (const rempresa:integer;dataini,datafin:TDateTime):string;
//***************************************************************************//


function CARREGA_PERMISSAOZERADA():string;

implementation

uses MainModule, System.SysUtils, mkm_func_web, Vcl.Clipbrd, mkm_funcoes,
  mkm_procedures, untDM_RC;

function RELATORIO_ESTOQUE_LOTE(const etipo,elote,eboletim:string;eproduto,eempresa:integer):string;
begin
  Result := ' select                                                                                         ' +
            ' (row_number() over (order by rl.entrada_saida)) as sequencia,                                  ' +
            '  rl.operacao_op,rl.entrada_saida,rl.data, rl.numero, rl.serie, rl.pessoa, rl.nome, rl.estado,  ' +
            '  case when rl.entrada_saida = 0 then rl.quantidade else 0 end Entrada,                         ' +
            '  case when rl.entrada_saida = 1 then rl.quantidade else 0 end Saida,                           ' +
            '  case when rl.entrada_saida = 0 then (rl.quantidade * rl.pureza) else 0 end Entrada_Pontos,    ' +
            '  case when rl.entrada_saida = 1 then (rl.quantidade * rl.pureza) else 0 end Saida_Pontos,      ' +
            '  sum((rl.quantidade * rl.pureza)  * decode(rl.entrada_saida,0,1,-1)) over(order by rl.entrada_saida, rl.numero, sequencia) saldo_ponto,' +
            '  sum(rl.quantidade * decode(rl.entrada_saida,0,1,-1)) over(order by rl.entrada_saida, rl.numero, sequencia) saldo                      ' +
            ' FROM relatorio_lotes rl                                                                        ' +
            ' where rl.lotesemente                                                               =           ' + QuotedStr(elote)    +
            ' and   rl.boletim                                                                   =           ' + QuotedStr(eboletim) +
            ' and   rl.produto                                                                   =           ' + IntToStr(eproduto)  +
            ' and   rl.empresa                                                                   =           ' + IntToStr(eempresa)  +
            ' and   rl.cancelada <>                                                                          ' + QuotedStr('C')      +
            ' and   rl.serie     <>                                                                          ' + QuotedStr('DES')    +
            ' order by rl.data, rl.entrada_saida,rl.numero, rl.sequencia                                     ';
end;
function EXTRATO_BANCARIO_BANCO(const eempresa,ebanco:integer;dataini,datafin:TDateTime):string;
var
  escrita : string;
begin
  escrita :=
            'select                                                                                                     '+
            '  ss.tipo,ss.portador,ss.pagamento,                                                                        '+
            '  ss.serie,                                                                                                '+
            '  ss.sequencia,                                                                                            '+
            '  ss.historico,                                                                                            '+
            '  ss.saldo - ss.credito + ss.debito as saldo_anterior,                                                     '+
            '  ss.credito,                                                                                              '+
            '  ss.debito,                                                                                               '+
            '  ss.saldo                                                                                                 '+
            'from                                                                                                       '+
            '  (                                                                                                        '+
            'select                                                                                                     '+
            '  mb.tipo,mb.portador, mb.pagamento, mb.serie, mb.sequencia, mb.historico,                                                      '+
            '   case when mb.tipo = '+QuotedStr('Entrada')+'  then mb.valorpago else 0 end Credito,                                    '+
            '   case when mb.tipo = '+QuotedStr('Saida')  +'  then mb.valorpago else 0 end Debito,                                      '+
            '  sum(mb.valorpago * decode(mb.tipo,'+QuotedStr('Entrada')+',1,-1)) over(order by mb.pagamento, mb.sequencia) saldo       '+
            'from                                                                                                       '+
            '  bancos mb                                                                                                '+
            'where                                                                                                      '+
            '     mb.portador                 =                                                                         '+ IntToStr(ebanco)                          +
            'and  mb.pagamento between                                                                                  '+ QuotedStr(DataPonto(DateToStr(dataini)))  +
            'and                                                                                                        '+ QuotedStr(DataPonto(DateToStr(datafin)))  +
            'and mb.empresa                   =                                                                         '+ IntToStr(eempresa)                        +
            'order by mb.pagamento, mb.sequencia) ss                                                                    ';

  Result := escrita;
end;
function RELATORIO_VENDASPERIODO(const rempresa:integer;rdataini,rdatafin,rpessoaini,rpessoafin,rtipo,rordem,rstatus,rvendas,rdevolucao,rvendasef,rbonifica,rtroca,routros:string):string;
var
   M_SITUACAO,
   M_ORDEM,
   M_SQL,
   sql_or,
   sql_vendas,
   sql_bonificacao,
   sql_devolucao,
   sql_troca,
   sql_vendaef,
   sql_outros    :string;
begin
  sql_or     :=
                ' AND ('                                    +
                variif(rvendas      = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Vendas')      + ') or','') +
                variif(rbonifica    = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Bonificacao') + ') or','') +
                variif(rdevolucao   = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Devolucao')   + ') or','') +
                variif(rtroca       = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Troca')       + ') or','') +
                variif(rvendasef    = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Venda EF')    + ') or','') +
                variif(routros      = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Outros')      + ') or','') +
                ')';


  case StrToInt(rordem) of
    0 : M_ORDEM := 'ORDER BY MVMESTRE.OPERACAO, MVMESTRE.NUMERO';
    1 : M_ORDEM := 'ORDER BY MVMESTRE.OPERACAO, MVMESTRE.PESSOA';
    2 : M_ORDEM := 'ORDER BY MVMESTRE.OPERACAO, MVMESTRE.EMISSAO';
  end;


  case StrToInt(rtipo) of

    0 : M_SQL :=   ' SELECT * FROM MVMESTRE INNER JOIN OPERACOES ON (MVMESTRE.OPERACAO = OPERACOES.CODIGO) ' +
                   '                        INNER JOIN PESSOAS   ON (MVMESTRE.PESSOA   = PESSOAS.CODIGO  ) ' +
                   ' WHERE MVMESTRE.EMISSAO BETWEEN                  ' + QuotedStr(dataponto(rdataini)) +
                   ' AND                                             ' + QuotedStr(dataponto(rdatafin)) +
                   ' AND MVMESTRE.PESSOA BETWEEN                     ' + QuotedStr(rpessoaini)     +
                   ' AND                                             ' + QuotedStr(rpessoafin)     +
                   ' AND MVMESTRE.EMPRESA        =                   ' + IntToStr(rempresa)        +
                   ' AND ((MVMESTRE.DOCUMENTO = '+QuotedStr('1')+') or (MVMESTRE.DOCUMENTO = '+QuotedStr('2')+'))'+
                   variif(rstatus = '0',' AND MVMESTRE.CANCELADA      <> ' + QuotedStr('C')           + sql_or,
                                    ' AND MVMESTRE.CANCELADA          =  ' + QuotedStr('C'))          +
                   M_ORDEM;
  end;

  result := RemoverORSql(M_SQL);
end;
function RELATORIO_LOTEBAS      (const rempresa:integer;rprodutoini,rprodutofin,rsaldos,ropcoes,rcategoria:string):string;
var
  M_SQL                  : string;
  opcoes,saldos,categoria:string;
begin
  case StrToInt(rsaldos) of
    0 : saldos := ' AND DISPONIVELFISCAL > 0 ';
    1 : saldos := ' AND DISPONIVELFISCAL < 0 ';
    2 : saldos := ' AND DISPONIVELFISCAL = 0 ';
    3 : saldos := ' ';
  end;

  case StrToInt(ropcoes) of
    0 : opcoes := ' AND TIPO = ' + QuotedStr('Aguarde');
    1 : opcoes := ' AND TIPO = ' + QuotedStr('Entrada');
    2 : opcoes := ' AND TIPO = ' + QuotedStr('Saida');
    3 : opcoes := ' AND TIPO = ' + QuotedStr('Fiscal');
    4 : opcoes := ' ';
  end;

  M_SQL := ' SELECT * FROM SEMENTES WHERE EMPRESA   = ' + IntToStr(rempresa)    +
           ' AND PRODUTO BETWEEN                      ' + QuotedStr(rprodutoini)+
           ' AND                                      ' + QuotedStr(rprodutofin)+
           ' AND CATEGORIA                          = ' + QuotedStr(rcategoria) +
           ' AND ATIVO                              = ' + QuotedStr('T')        +
           opcoes + saldos + ' order by PRODUTO, LOTE ';

  Result := M_SQL;
end;
function CARREGA_PERMISSAOZERADA():string;
var
  escrita : string;
begin
  escrita :=
            '  select                                        ' +
            '    M.menu,                                     ' +
            '    M.tabela                                    ' +
            '  from  menusistema m                           ' +
            '  order by m.menu                               ';

  Result := escrita;
end;
function ESCRITA_APURACAOICMS (const rempresa:integer;dataini,datafin:string):string;
var
  escrita : string;
begin
  escrita :=
             ' SELECT M.CODIGO, SUM(M.VLRTOTAL) AS VLRTOTAL, SUM(M.VLRBASEICMS) AS VLRBASEICMS, SUM(M.VLRICMS) AS VLRICMS, SUM(M.VLRTOTAL - M.VLRBASEICMS) AS ISENTO  ' +
             ' FROM RELATORIO_MESTRE M WHERE M.EMISSAO BETWEEN ' + QuotedStr(DataPonto(dataini)) +
             ' AND                                             ' + QuotedStr(DataPonto(datafin)) +
             ' AND DOCUMENTO = 1                               ' +
             ' AND CANCELADA =                                 ' + QuotedStr('A')      +
             ' AND EMPRESA   =                                 ' + IntToStr(rempresa)  +
             ' GROUP BY M.CODIGO                               ';

  Result := escrita;
end;
function ESCRITA_RELATORIOVENDASDETALHADA(const rempresaini,rempresafin:integer;rdataini,rdatafin,rpessoaini,rpessoafin,rtipo,rvendas,rdevolucao,rvendasef,rbonifica,rtroca,routros:string):string;
var
   M_SITUACAO,
   M_ORDEM,
   M_SQL,
   M_TIPO,
   sql_or,
   sql_vendas,
   sql_bonificacao,
   sql_devolucao,
   sql_troca,
   sql_vendaef,
   sql_outros    :string;
begin

  case StrToInt(rtipo) of
    0 : M_TIPO := ' and m.documento = ' + IntToStr(1);
    1 : M_TIPO := ' and m.documento = ' + IntToStr(4);
  end;

  sql_or     :=
                ' AND ('                                    +
                variif(rvendas      = 'T','(o.OPERACAO_OP      = ' + QuotedStr('Vendas')      + ') or','') +
                variif(rbonifica    = 'T','(o.OPERACAO_OP      = ' + QuotedStr('Bonificacao') + ') or','') +
                variif(rdevolucao   = 'T','(o.OPERACAO_OP      = ' + QuotedStr('Devolucao')   + ') or','') +
                variif(rtroca       = 'T','(o.OPERACAO_OP      = ' + QuotedStr('Troca')       + ') or','') +
                variif(rvendasef    = 'T','(o.OPERACAO_OP      = ' + QuotedStr('Venda EF')    + ') or','') +
                variif(routros      = 'T','(o.OPERACAO_OP      = ' + QuotedStr('Outros')      + ') or','') +
                ')';

  M_SQL :=
           ' select o.operacao_op, m.empresa, m.serie, m.numero, m.emissao,m.condicao,m.numeropedido,m.horanota,m.funcionario,m.vlrtotal,      ' +
           ' m.pessoa,p.nome,p.cpfcnpj,p.inscricao,p.cidade,p.estado,                                                                          ' +
           ' i.produto, i.descricao, i.quantidade,i.preco, i.baseicms,i.valoricms,i.percicms,i.pesosaco, i.pesoliquido,i.pesobruto, i.total    ' +
           ' from mvmestre m                                                                                                      ' +
           '   inner join mvitens i on i.numero     = m.numero                                                                    ' +
           '     and i.documento                    = m.documento                                                                 ' +
           '   inner join pessoas p   on m.pessoa   = p.codigo                                                                    ' +
           '   inner join operacoes o on m.operacao = o.codigo                                                                    ' +
           '   where m.emissao between ' + QuotedStr(DataPonto(rdataini))+' and ' + QuotedStr(DataPonto(rdatafin))+                '' +
           '     and m.empresa between ' + IntToStr(rempresaini)         +' and ' + IntToStr(rempresafin)         +                '' +
           '     and i.empresa between ' + IntToStr(rempresaini)         +' and ' + IntToStr(rempresafin)         +                '' +
           '     and p.codigo  between ' + QuotedStr(rpessoaini)         +' and ' + QuotedStr(rpessoafin)         +                '' + M_TIPO + variif(rtipo = '0',sql_or,'') +

           ' order by m.empresa,m.numero,m.emissao                                                                                 ';

  result := RemoverORSql(M_SQL);
end;
function ESCRITA_GRAFICO_FATURAMENTO_MENU(const rempresa:integer;ano:string):string;
var
  escrita : string;
begin
  escrita :=
    ' SELECT                                                    ' +
    ' extract(month from p.emissao) AS EMISSAO,                 ' +
    '   case                                                    ' +
    '     when EXTRACT(month  from P.emissao) = 1  THEN ' + QuotedStr('Jan') +
    '     when EXTRACT(month  from P.emissao) = 2  THEN ' + QuotedStr('Fev') +
    '     when EXTRACT(month  from P.emissao) = 3  THEN ' + QuotedStr('Mar') +
    '     when EXTRACT(month  from P.emissao) = 4  THEN ' + QuotedStr('Abr') +
    '     when EXTRACT(month  from P.emissao) = 5  THEN ' + QuotedStr('Mai') +
    '     when EXTRACT(month  from P.emissao) = 6  THEN ' + QuotedStr('Jun') +
    '     when EXTRACT(month  from P.emissao) = 7  THEN ' + QuotedStr('Jul') +
    '     when EXTRACT(month  from P.emissao) = 8  THEN ' + QuotedStr('Ago') +
    '     when EXTRACT(month  from P.emissao) = 9  THEN ' + QuotedStr('Set') +
    '     when EXTRACT(month  from P.emissao) = 10 THEN ' + QuotedStr('Out') +
    '     when EXTRACT(month  from P.emissao) = 11 THEN ' + QuotedStr('Nov') +
    '     when EXTRACT(month  from P.emissao) = 12 THEN ' + QuotedStr('Dez') +
    '   end as Descricao,                                            ' +
    ' SUM(P.vlrtotal) as TOTAL                                       ' +
    ' FROM MVMESTRE P                                                ' +
    ' INNER JOIN OPERACOES O ON O.CODIGO = P.OPERACAO                ' +
    ' WHERE EXTRACT(year from P.EMISSAO) =                           ' + QuotedStr(ano)      +
    ' AND P.EMPRESA   =                                              ' + IntToStr(rempresa)  +
    ' AND ((O.operacao_op = '+QuotedStr('Vendas')+') or (o.operacao_op = '+QuotedStr('Venda EF')+'))'+
    'GROUP BY extract(month from p.emissao)';

  Result := escrita;
end;


function ESCRITA_CURVA_ABC_PESSOAS       (const rempresa,tipo:integer;ano:string):string;
var
  escrita,m_tipo : string;
begin
  case tipo of
    0 : m_tipo := ' and p.documento        = 1 ' +
                  ' and p.cancelada        =   ' + Quotedstr('A') +
                  ' and   ((op.operacao_op =   ' + QuotedStr('Vendas')+') or (op.operacao_op = '+QuotedStr('Venda EF')+')) ';
    1 : m_tipo := ' and p.documento        = 4 ';
  end;

  escrita :=
'  select                                        ' +
'      d2.pessoa,                                ' +
'      d2.nome,                                  ' +
'      d2.valor_pessoa,                          ' +
'      d2.totalgeral,                            ' +
'      d2.perc,                                  ' +
'      d2.pacu,                                  ' +
'      case                                      ' +
'        when d2.pacu <= 80 then '+QuotedStr('A')+'             ' +
'        when d2.pacu <= 95 then '+QuotedStr('B')+'             ' +
'        else                                    ' +
'          '+QuotedStr('C')+'                    ' +
'      end classe                                ' +
'  from (                                        ' +
'      select                                    ' +
'          d1.pessoa,                            ' +
'          d1.nome,                              ' +
'          d1.valor_pessoa,                      ' +
'          d1.totalgeral,                        ' +
'          d1.perc,                              ' +
'          sum(d1.perc) over(order by d1.perc desc) pacu ' +
'      from (                                            ' +
'          select                                        ' +
'              d.pessoa,                                 ' +
'              d.nome,                                   ' +
'              d.valor_pessoa,                           ' +
'              sum(d.valor_pessoa) over() totalgeral,    ' +
'              cast(d.valor_pessoa as numeric(15,2)) / cast(sum(d.valor_pessoa) over() as numeric(15,2)) * 100 perc ' +
'          from (                                                                                                   ' +
'              select                                                                                               ' +
'                p.pessoa,                                                                                          ' +
'                pp.nome,                                                                                           ' +
'                sum(P.vlrtotal) as valor_pessoa                                                                    ' +
'              from mvmestre   p inner join operacoes op on (p.operacao = op.codigo)                                ' +
'                                      inner join pessoas   pp on (p.pessoa   = pp.codigo)                          ' +
'                  where p.empresa      =                                                                           ' + inttostr(rempresa) + m_tipo +
                   variif(ano <> '0',
                    '  and   extract(year from p.emissao) =  ' + Quotedstr(ano),'')+
'              group by 1,2                                                                                           ' +
'              order by 2 desc) d) d1 ) d2                                                                            ';

  Result := escrita;
end;
function ESCRITA_HISTORICOSEMENTE        (const rempresa:integer;dataini,datafin:TDateTime;rprodutoini,rprodutofin:string):string;
var
  escrita : string;
begin
  escrita :=
    '  select                                                                    ' +
    '    rl.numero,                                                              ' +
    '    rl.serie,                                                               ' +
    '    rl.data as emissao,                                                     ' +
    '    rl.pessoa,                                                              ' +
    '    rl.nome,                                                                ' +
    '    rl.estado as uf,                                                        ' +
    '    rl.lotesemente,                                                         ' +
    '    rl.boletim,                                                             ' +
    '    rl.produto,                                                             ' +
    '    s.cultivar,                                                             ' +
    '    s.safravalida as safra,                                                 ' +
    '    rl.descricao,                                                           ' +
    '    rl.quantidade * s.analisepura as pontos,                                ' +
    '    s.analisepura as pureza,                                                ' +
    '    rl.quantidade,                                                          ' +
    '    s.disponivel                                                            ' +
    '  from                                                                      ' +
    '    relatorio_lotes rl inner join sementes s on (rl.lotesemente = s.lote)   ' +
    '  where rl.empresa =                                                        ' + IntToStr(rempresa)                       +
    '  and   rl.data between                                                     ' + QuotedStr(DataPonto(DateToStr(dataini))) +
    '  and                                                                       ' + QuotedStr(DataPonto(DateToStr(datafin))) +
    '  and   rl.produto between                                                  ' + QuotedStr(rprodutoini)                   +
    '  and                                                                       ' + QuotedStr(rprodutofin)                   +
    '  and   rl.cancelada     <>                                                 ' + QuotedStr('C')   +
    '  and   rl.serie         <>                                                 ' + QuotedStr('DES') +
    '  and   rl.serie         <>                                                 ' + QuotedStr('BES') +
    '  and   rl.serie         <>                                                 ' + QuotedStr('BEN') +
    '  order by rl.lotesemente, rl.produto                                       ';

//  CLIPBOARD.AsText := ESCRITA;
  Result := escrita;

end;
function ESCRITA_TERMONOTA               (const rempresa,pnumero,pdocumento:integer):string;
var
  escrita : string;
begin
  escrita :=
    '  select                                                             ' +
    '    s.codigo,                                                        ' +
    '    m.produto,                                                       ' +
    '    m.descricao as descricao_nota,                                   ' +
    '    s.lote,                                                          ' +
    '    s.boletim,                                                       ' +
    '    s.termo,                                                         ' +
    '    s.analisepura as pureza,                                         ' +
    '    s.validade,                                                      ' +
    '    s.pesoembalagem                                                  ' +
    '  from                                                               ' +
    '      mvitens m, sementes s                                          ' +
    '      where m.empresa   =                                            ' + IntToStr(rempresa)    +
    '      and   m.numero    =                                            ' + IntToStr(pnumero)     +
    '      and   m.documento =                                            ' + IntToStr(pdocumento)  +
    '      and   m.lotesemente = s.lote                                   ' +
    '      and   m.produto     = s.produto                                ' +
    '  order by m.sequencia                                               ';

  Result := escrita;
end;
function ESCRITA_SALDOBENENOTAS          (const rempresa:integer;dataini,datafin:TDateTime;rprodutoini,rprodutofin:string):string;
var
  escrita : string;
begin
  escrita :=
    'select                                                   ' +
    '  m.numero,                                              ' +
    '  m.serie,                                               ' +
    '  m.sequencia,                                           ' +
    '  m.emissao,                                             ' +
    '  m.pessoa,                                              ' +
    '  pp.nome,                                               ' +
    '  pp.estado,                                             ' +
    '  m.produto,                                             ' +
    '  p.descricao,                                           ' +
    '  p.cultivar,                                            ' +
    '  m.quantidade,                                          ' +
    '  m.disponivel,                                          ' +
    '  op.estoque,                                            ' +
    '  m.quantidade - m.disponivel as utilizado               ' +
    'from                                                     ' +
    '  mvitens m                                              ' +
    '  inner join produtos  p  on (m.produto = p.codigo)      ' +
    '  inner join pessoas   pp on (m.pessoa = pp.codigo)      ' +
    '  inner join operacoes op on (m.operacao = op.codigo)    ' +
    '  where m.disponivel > 0                                 ' +
    '  and   op.estoque <>                                    ' + QuotedStr('2')                           +
    '  and   m.empresa    =                                   ' + IntToStr(rempresa)                       +
    '  and   m.disponivel < m.quantidade                      ' +
    '  and   m.emissao between                                ' + QuotedStr(DataPonto(DateToStr(dataini))) +
    '  and                                                    ' + QuotedStr(DataPonto(DateToStr(datafin))) +
    '  and   m.produto between                                ' + QuotedStr(rprodutoini)                   +
    '  and                                                    ' + QuotedStr(rprodutofin)                   +
    '  order by m.produto, m.emissao                          ';

  result := escrita;
end;
function ESCRITA_KARDEXPRODUTO           (const rempresa,rproduto:integer;dataini,datafin:string):string;
var
  escrita : string;
begin
escrita :=
  'select                                                                       ' +
  '  p.numero,                                                                  ' +
  '  p.serie,                                                                   ' +
  '  p.data,                                                                    ' +
  '  p.operacao,                                                                ' +
  '  op.operacao_op,                                                            ' +
  '  p.pessoa,                                                                  ' +
  '  pp.nome,                                                                   ' +
  '  p.uf,                                                                      ' +
  '  case when op.entrada_saida = 0 then p.quantidade else 0  end Entrada,                                                 ' +
  '  case when op.entrada_saida = 1 then iif(p.descarte > 0 ,coalesce(p.descarte,0),p.quantidade) else 0  end Saida     ' +
  'from                                                                         ' +
  '  pontos p inner join operacoes op on (p.operacao = op.codigo)               ' +
  '           inner join pessoas   pp on (p.pessoa   = pp.codigo)               ' +
  'where p.produto =                                                            ' + IntToStr(rproduto)            +
  'and   p.empresa =                                                            ' + IntToStr(rempresa)            +
  'and   op.estoque <>                                                          ' + QuotedStr('2')                +
  'and   p.data  between                                                        ' + QuotedStr(DataPonto(dataini)) +
  'and                                                                          ' + QuotedStr(DataPonto(datafin)) +
  'and   p.documento <>                                                         ' + QuotedStr('4') +
  'and   p.documento <>                                                         ' + QuotedStr('6') +
  'and   p.documento <>                                                         ' + QuotedStr('7') +
  'and   p.documento <>                                                         ' + QuotedStr('3') +
  'and   p.documento <>                                                         ' + QuotedStr('5') +
  'and   p.cancelada <>                                                         ' + QuotedStr('C') +
  'and   p.serie     <>                                                         ' + QuotedStr('BES') +
  'and   p.serie     <>                                                         ' + QuotedStr('PRD') +
  'and   p.serie     <>                                                         ' + QuotedStr('BEN') +
  'order by p.data,p.numero                                                     ';

  result := escrita;
end;
function ESCRITA_HISTORICOBENENOTA       (const rempresa,rproduto,rsequencia:integer;rnota,rserie:string):string;
var
  escrita : string;
begin
  escrita :=
     ' SELECT * FROM BENEITENS WHERE EMPRESA = ' + IntToStr(rempresa)      +
     ' AND NOTA                              = ' + QuotedStr(rnota)        +
     ' AND SERIE                             = ' + QuotedStr(rserie)       +
     ' AND SEQITENS                          = ' + IntToStr(rsequencia)    +
     ' AND PRODUTO                           = ' + IntToStr(rproduto);

  Result := escrita;
end;
function ESCRITA_HISTORICOBENENOTAPONTO  (const rempresa,rproduto:integer;rlote,rboletim:string):string;
var
  escrita : string;
begin
  escrita :=
            '  select                                                         ' +
            '    p.data,                                                      ' +
            '    p.numero,                                                    ' +
            '    p.serie,                                                     ' +
            '    p.pessoa,                                                    ' +
            '    p.uf,                                                        ' +
            '    pp.nome,                                                     ' +
            '    p.quantidade                                                 ' +
            '  from                                                           ' +
            '      pontos p inner join pessoas pp on (p.pessoa = pp.codigo)   ' +
            '  where p.empresa     =                                          ' + IntToStr(rempresa)  +
            '  and   p.produto     =                                          ' + IntToStr(rproduto)  +
            '  and   p.lotesemente =                                          ' + QuotedStr(rlote)    +
            '  and   p.boletim     =                                          ' + QuotedStr(rboletim) +
            '  and   p.documento   =                                          ' + QuotedStr('1') +
            '  and   p.cancelada   <>                                         ' + QuotedStr('C') +
            '  order by p.codigo, p.numero, p.data                            ';

  Result := escrita;
end;
function ESCRITA_HISTORICOCAMPO          (const rempresa,rproduto:integer;rcampo,rsafracampo:string):string;
var
  escrita : string;
begin
  escrita :=
    '  select                                                                    ' +
    '    b.emissao,                                                              ' +
    '    b.numero,                                                               ' +
    '    b.nota,                                                                 ' +
    '    b.serie,                                                                ' +
    '    b.produto,                                                              ' +
    '    b.loteorigem,                                                           ' +
    '    b.qtenota,                                                              ' +
    '    b.quantidade,                                                           ' +
    '    b.lotedestino,                                                          ' +
    '    b.boletimdestino,                                                       ' +
    '    s.valorcultural,                                                        ' +
    '    s.analisepura,                                                          ' +
    '    s.tetrazolio,                                                           ' +
    '    s.pesoembalagem                                                         ' +
    '  from beneitens b inner join sementes s on (b.lotedestino = s.lote)        ' +
    '                              and           (b.boletimdestino = s.boletim)  ' +
    '  where b.empresa    =                                                      ' + IntToStr(rempresa)     +
    '  and   b.campo      =                                                      ' + QuotedStr(rcampo)      +
    '  and   b.produto    =                                                      ' + IntToStr(rproduto)     +
    '  and   b.safracampo =                                                      ' + QuotedStr(rsafracampo) +
    ' order by b.lotedestino, b.boletimdestino                                   ';

  Result := escrita;
end;
function ESCRITA_RELATORIO_ENTREGAFUTURA (const rempresa,rprodutoini,rprodutofin,rpessoaini,rpessoafin:integer;dataini,datafin:TDateTime):string;
var
  escrita : string;
begin
  escrita :=
          '  select                                                                       ' +
          '    m.numero,                                                                  ' +
          '    m.serie,                                                                   ' +
          '    m.emissao,                                                                 ' +
          '    m.pessoa,                                                                  ' +
          '    p.nome,                                                                    ' +
          '    m.operacao,                                                                ' +
          '    op.operacao_op,                                                            ' +
          '    op.descricao as referencia,                                                ' +
          '    m.produto,                                                                 ' +
          '    m.descricao,                                                               ' +
          '    m.preco,                                                                   ' +
          '    m.quantidade                                                               ' +
          '  from                                                                         ' +
          '  mvitens m inner join operacoes op on (m.operacao = op.codigo)                ' +
          '            inner join pessoas    p on (m.pessoa   = p.codigo)                 ' +
          '  where    m.empresa      =                                                    ' + IntToStr(rempresa)    +
          '  and      m.documento    =                                                    ' + IntToStr(1)           +
          '  and      op.operacao_op =                                                    ' + QuotedStr('Venda EF') +
          '  and      m.pessoa  between                                                   ' + IntToStr(rpessoaini)  +
          '  and                                                                          ' + IntToStr(rpessoafin)  +
          '  and      m.produto between                                                   ' + IntToStr(rprodutoini) +
          '  and                                                                          ' + IntToStr(rprodutofin) +
          '  and      m.emissao between                                                   ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
          '  and                                                                          ' + QuotedStr(DataPonto(DateToStr(datafin)))  +
          '  order by m.emissao, m.pessoa                                                 ';

  Result := escrita;
end;

//***************************************************************************//
// SPED FISCAL
//***************************************************************************//
function ESCRITA_SPED_ENTRADA            (const rempresa:integer;dataini,datafin:TDateTime):string;
var
  escrita : string;
begin
  escrita :=
            '  select NUMERO,                                                                      ' +
            '  SERIE,                                                                              ' +
            '  DOCUMENTO,                                                                          ' +
            '  OPERACAO,                                                                           ' +
            '  PESSOA,                                                                             ' +
            '  CODIGOBARRAS,                                                                       ' +
            '  PROTOCOLO,                                                                          ' +
            '  VLRBASEICMS,                                                                        ' +
            '  VLRICMS,                                                                            ' +
            '  VLRDESCONTOS,                                                                       ' +
            '  VLRPRODUTOS,                                                                        ' +
            '  VLRTOTAL,                                                                           ' +
            '  CONDICAO,                                                                           ' +
            '  CANCELADA,                                                                          ' +
            '  EMISSAO,                                                                            ' +
            '  EMPRESA,                                                                            ' +
            '  VLRDSPTRIBUTADA,                                                                    ' +
            '  TRAFRETE,                                                                           ' +
            '  VLRIPI,                                                                             ' +
            '  ENTRADA_SAIDA,                                                                      ' +
            '  CODIGOBARRASCOMPLEMENTO                                                             ' +
            '   FROM MVMESTRE inner join OPERACOES ON (OPERACOES.CODIGO = MVMESTRE.OPERACAO)       ' +
            '  where OPERACOES.TRANSPORTES     = '+QuotedStr('0')+'                                ' +
            '  AND   OPERACOES.GERA_SPED       = '+QuotedStr('1')+'                                ' +
            '  AND   OPERACOES.ENTRADA_SAIDA   = '+QuotedStr('0')+'                                ' +
            '  AND   ((MVMESTRE.DOCUMENTO      = '+QuotedStr('1')+ ')' + ' OR (MVMESTRE.DOCUMENTO = ' + QuotedStr('2')+'))'+
            '  AND   MVMESTRE.EMPRESA         =  '+IntToStr(rempresa) +'                           ' +
            '  AND   MVMESTRE.EMISSAO BETWEEN    '+QuotedStr(DataPonto(DateToStr(dataini))) + '    ' +
            '  AND                               '+QuotedStr(DataPonto(DateToStr(datafin))) + '    ' +
            '  ORDER BY MVMESTRE.DOCUMENTO,  MVMESTRE.EMISSAO,  MVMESTRE.NUMERO                    ';

  Result := escrita;
end;
function ESCRITA_SPED_SAIDA            (const rempresa:integer;dataini,datafin:TDateTime):string;
var
  escrita : string;
begin
  escrita :=
            '  select NUMERO,                                                                      ' +
            '  SERIE,                                                                              ' +
            '  DOCUMENTO,                                                                          ' +
            '  OPERACAO,                                                                           ' +
            '  PESSOA,                                                                             ' +
            '  CODIGOBARRAS,                                                                       ' +
            '  PROTOCOLO,                                                                          ' +
            '  VLRBASEICMS,                                                                        ' +
            '  VLRICMS,                                                                            ' +
            '  VLRDESCONTOS,                                                                       ' +
            '  VLRPRODUTOS,                                                                        ' +
            '  VLRTOTAL,                                                                           ' +
            '  CONDICAO,                                                                           ' +
            '  CANCELADA,                                                                          ' +
            '  EMISSAO,                                                                            ' +
            '  EMPRESA,                                                                            ' +
            '  VLRDSPTRIBUTADA,                                                                    ' +
            '  TRAFRETE,                                                                           ' +
            '  VLRIPI,                                                                             ' +
            '  ENTRADA_SAIDA,                                                                      ' +
            '  CODIGOBARRASCOMPLEMENTO                                                             ' +
            '   FROM MVMESTRE inner join OPERACOES ON (OPERACOES.CODIGO = MVMESTRE.OPERACAO)       ' +
            '  where OPERACOES.TRANSPORTES     = '+QuotedStr('0')+'                                ' +
            '  AND   OPERACOES.GERA_SPED       = '+QuotedStr('1')+'                                ' +
            '  AND   OPERACOES.ENTRADA_SAIDA   = '+QuotedStr('1')+'                                ' +
            '  AND   MVMESTRE.DOCUMENTO        = '+QuotedStr('1')+'                                ' +
            '  AND   MVMESTRE.CANCELADA        = '+QuotedStr('A')+'                                ' +
            '  AND   MVMESTRE.EMPRESA          = '+IntToStr(rempresa) +'                           ' +
            '  AND   MVMESTRE.EMISSAO BETWEEN    '+QuotedStr(DataPonto(DateToStr(dataini))) + '    ' +
            '  AND                               '+QuotedStr(DataPonto(DateToStr(datafin))) + '    ' +
            '  ORDER BY MVMESTRE.DOCUMENTO,  MVMESTRE.EMISSAO,  MVMESTRE.NUMERO                    ';

  Result := escrita;
end;
function ESCRITA_SPED_TRANSPORTE         (const rempresa:integer;dataini,datafin:TDateTime):string;
var
  escrita : string;
begin
  escrita :=
            '  select NUMERO,                                                                      ' +
            '  SERIE,                                                                              ' +
            '  DOCUMENTO,                                                                          ' +
            '  OPERACAO,                                                                           ' +
            '  PESSOA,                                                                             ' +
            '  CODIGOBARRAS,                                                                       ' +
            '  PROTOCOLO,                                                                          ' +
            '  VLRBASEICMS,                                                                        ' +
            '  VLRICMS,                                                                            ' +
            '  VLRDESCONTOS,                                                                       ' +
            '  VLRPRODUTOS,                                                                        ' +
            '  VLRTOTAL,                                                                           ' +
            '  CONDICAO,                                                                           ' +
            '  CANCELADA,                                                                          ' +
            '  EMISSAO,                                                                            ' +
            '  EMPRESA,                                                                            ' +
            '  VLRDSPTRIBUTADA,                                                                    ' +
            '  TRAFRETE,                                                                           ' +
            '  VLRIPI,                                                                             ' +
            '  ENTRADA_SAIDA,                                                                      ' +
            '  CODIGOBARRASCOMPLEMENTO                                                             ' +
            '   FROM MVMESTRE inner join OPERACOES ON (OPERACOES.CODIGO = MVMESTRE.OPERACAO)       ' +
            '  where OPERACOES.TRANSPORTES     = '+QuotedStr('1')+'                                ' +
            '  AND   OPERACOES.GERA_SPED       = '+QuotedStr('1')+'                                ' +
            '  AND   MVMESTRE.EMPRESA          = '+IntToStr(rempresa) +'                           ' +
            '  AND   MVMESTRE.EMISSAO BETWEEN    '+QuotedStr(DataPonto(DateToStr(dataini))) + '    ' +
            '  AND                               '+QuotedStr(DataPonto(DateToStr(datafin))) + '    ' +
            '  ORDER BY MVMESTRE.DOCUMENTO,  MVMESTRE.EMISSAO,  MVMESTRE.NUMERO                    ';

  Result := escrita;
end;
function ESCRITA_VENDASVENDEDOR          (const rempresa,rvenini,rvenfin:integer;ordem,tipo,dataini,datafin:string):string;
var
  escrita : string;
  mwhere  : string;
  mand    : string;
  mordem  : string;
begin

  case StrToInt(ordem) of
    0 : mordem := ' order by m.funcionario, m.numero ' ;
    1 : mordem := ' order by m.funcionario, m.emissao' ;
  end;

  case StrToInt(tipo) of
    0 : mand := ' and m.documento  = ' + IntToStr(4);
    1 : mand := ' and m.documento  = ' + IntToStr(1) +
                ' and m.cancelada  = ' + QuotedStr('A');
  end;

  mwhere :=
     ' where m.empresa =                                                                  ' + IntToStr(rempresa)            +
     ' and m.emissao between                                                              ' + QuotedStr(DataPonto(dataini)) +
     ' and                                                                                ' + QuotedStr(DataPonto(datafin)) +
     ' and m.funcionario between                                                          ' + IntToStr(rvenini) +
     ' and                                                                                ' + IntToStr(rvenfin);

  escrita :=
     ' select                                                                             ' +
     '   f.codigo,                                                                        ' +
     '   M.funcionario,                                                                   ' +
     '   f.nome as nomefuncionario,                                                       ' +
     '   p.nome,                                                                          ' +
     '   m.numero,                                                                        ' +
     '   m.serie,                                                                         ' +
     '   m.emissao,                                                                       ' +
     '   m.comissaofuncionario,                                                           ' +
     '   coalesce((m.vlrtotal * m.comissaofuncionario)/100,0) as valorcomissao,           ' +
     '   m.vlrtotal                                                                       ' +
     ' from mvmestre m inner join funcionarios f ON (m.funcionario = f.codigo)            ' +
     '                 inner join pessoas      p on (m.pessoa      = p.codigo)            ';

  Result := escrita + mwhere + mand + mordem;

end;
function ESCRITA_LISTAENTREGAITENS       (const rempresa,rnumero,rdocumento:integer):string;
var
  escrita : string;
begin
  escrita :=
           ' select                                                                             ' +
           '   sub.numero,                                                                      ' +
           '   sub.sequencia,                                                                   ' +
           '   sub.produto,                                                                     ' +
           '   sub.descricao,                                                                   ' +
           '   sub.quantidade,                                                                  ' +
           '   sub.entregue,                                                                    ' +
           '   sub.lotesemente,                                                                 ' +
           '   sub.boletimsemente,                                                              ' +
           '   sub.termosemente,                                                                ' +
           '   sub.pesosaco,                                                                    ' +
           '   sub.quantidade  - sub.entregue as disponivel,                                    ' +
           '  ((sub.quantidade - sub.entregue) / sub.pesosaco) as saldosacos,                   ' +
           '   case when (sub.entregue < sub.quantidade) then '+QuotedStr('DISPONIVEL')+' else '+QuotedStr('ENTREGUE')+' end MSG     ' +
           '   from                                                                             ' +
           '   (                                                                                ' +
           '     select                                                                         ' +
           '       m.numero,                                                                    ' +
           '       m.sequencia,                                                                 ' +
           '       m.produto,                                                                   ' +
           '       m.descricao,                                                                 ' +
           '       m.pesosaco,                                                                  ' +
           '       m.lotesemente,                                                               ' +
           '       m.boletimsemente,                                                            ' +
           '       m.termosemente,                                                              ' +
           '       coalesce(sum(m.quantidade),0) as quantidade,                                 ' +
           '       coalesce(sum(m.entregue)  ,0 )as entregue                                    ' +
           '     from                                                                           ' +
           '       mvitens m                                                                    ' +
           '    where                                                                           ' +
           '       m.numero    = '+IntToStr(rnumero)   + '   and                                ' +
           '       m.documento = '+IntToStr(rdocumento)+ '   and                                ' +
           '       m.empresa   = '+IntToStr(rempresa)  + '                                      ' +
           '     group by  1,2,3,4,5,6,7,8                                                      ' +
           '     order by 1) as Sub                                                             ' ;

  Result := escrita;
//  clipboard.AsText := Result;

end;
function ESCRITA_RELATORIOENTREGAITENS   (const rempresa,rpessoaini,rpessoafin,rprodutoini,rprodutofin,rtipodoc,tipoentre:integer;dataini,datafin,uf:string):string;
var
  escrita               :string;
  mdocumento,mwhere,
  tipoentrega,mestado   :string;
begin

  case rtipodoc of
    0 : mdocumento  := ' and SubSelect2.documento = ' + IntToStr(1) + ' and SubSelect2.cancelada = ' + QuotedStr('A'); //notas
    1 : mdocumento  := ' and SubSelect2.documento = ' + IntToStr(4); //pedidos
  end;

  case tipoentre of
    0 : tipoentrega := ' and SubSelect2.entregue  > 0 '; //entregue
    1 : tipoentrega := ' and SubSelect2.entregue  = 0 '; //disponivel
    2 : tipoentrega := ' ';                              //todos
  end;

  mestado:= variif(uf = 'TODOS','',' and SubSelect2.estado = ' + QuotedStr(uf));
  mwhere :=
          ' where SubSelect2.empresa       = ' + IntToStr (rempresa)  +
          ' and   SubSelect2.codigo between  ' + IntToStr (rpessoaini)+
          ' and                              ' + IntToStr (rpessoafin)+
          ' and   SubSelect2.emissao between ' + QuotedStr(DataPonto(dataini)) +
          ' and                              ' + QuotedStr(DataPonto(datafin)) +
          ' and   SubSelect2.produto between ' + IntToStr (rprodutoini)        +
          ' and                              ' + IntToStr (rprodutofin);


  escrita :=
           ' select                                                                                                            ' +
           '     SubSelect2.emissao,                                                                                           ' +
           '     SubSelect2.empresa,                                                                                           ' +
           '     SubSelect2.codigo,                                                                                            ' +
           '     SubSelect2.nome,                                                                                              ' +
           '     SubSelect2.estado,                                                                                            ' +
           '     SubSelect2.numero,                                                                                            ' +
           '     SubSelect2.sequencia,                                                                                         ' +
           '     SubSelect2.documento,                                                                                         ' +
           '     SubSelect2.produto,                                                                                           ' +
           '     SubSelect2.descricao,                                                                                         ' +
           '     SubSelect2.quantidade,                                                                                        ' +
           '     SubSelect2.entregue,                                                                                          ' +
           '     SubSelect2.lotesemente,                                                                                       ' +
           '     SubSelect2.boletimsemente,                                                                                    ' +
           '     SubSelect2.termosemente,                                                                                      ' +
           '     SubSelect2.disponivel,                                                                                        ' +
           '     SubSelect2.saldosacos,                                                                                        ' +
           '     SubSelect2.cancelada,                                                                                         ' +
           '     SubSelect2.msg                                                                                                ' +
           '   from                                                                                                            ' +
           '     (                                                                                                             ' +
           '         select                                                                                                    ' +
           '           sub.empresa,                                                                                            ' +
           '           sub.emissao,                                                                                            ' +
           '           sub.codigo,                                                                                             ' +
           '           sub.nome,                                                                                               ' +
           '           sub.estado,                                                                                             ' +
           '           sub.numero,                                                                                             ' +
           '           sub.sequencia,                                                                                          ' +
           '           sub.documento,                                                                                          ' +
           '           sub.produto,                                                                                            ' +
           '           sub.descricao,                                                                                          ' +
           '           sub.quantidade,                                                                                         ' +
           '           sub.entregue,                                                                                           ' +
           '           sub.lotesemente,                                                                                        ' +
           '           sub.boletimsemente,                                                                                     ' +
           '           sub.termosemente,                                                                                       ' +
           '           sub.cancelada,                                                                                          ' +
           '           sub.quantidade - sub.entregue as DISPONIVEL,                                                            ' +
           '           ((sub.quantidade - sub.entregue) / sub.pesosaco) as saldosacos,                                         ' +
           '           case when (sub.entregue < sub.quantidade) then '+QuotedStr('DISPONIVEL')+' else '+QuotedStr('ENTREGUE')+' end MSG                 ' +
           '           from                                                                                                    ' +
           '           (                                                                                                       ' +
           '             select                                                                                                ' +
           '               m.empresa,                                                                                          ' +
           '               m.emissao,                                                                                          ' +
           '               m.sequencia,                                                                                        ' +
           '               m.documento,                                                                                        ' +
           '               m.produto,                                                                                          ' +
           '               m.descricao,                                                                                        ' +
           '               m.pesosaco,                                                                                         ' +
           '               m.lotesemente,                                                                                      ' +
           '               m.boletimsemente,                                                                                   ' +
           '               m.termosemente,                                                                                     ' +
           '               m.numero,                                                                                           ' +
           '               m.cancelada,                                                                                        ' +
           '               p.codigo,                                                                                           ' +
           '               p.nome,                                                                                             ' +
           '               p.estado,                                                                                           ' +
           '               coalesce(sum(m.quantidade),0) as quantidade,                                                        ' +
           '               coalesce(sum(m.entregue)  ,0 )as entregue                                                           ' +
           '             from                                                                                                  ' +
           '               mvitens m inner join pessoas p on (m.pessoa = p.codigo)                                             ' +
           '             group by  1,2,3,4,5,6,7,8,9,10,11,12,13,14,15                                                         ' +
           '             order by 13) as Sub) as SubSelect2                                                                    ' +
           '                                                                                                                   ' +
           mwhere + mdocumento + tipoentrega + mestado;
  Result := escrita;
end;
function ESCRITA_SALDOENTREGAFUTURA      (const rempresa,rpessoa:integer):string;
var
  escrita               :string;
begin
  escrita :=
           ' select                                                        ' +
           ' ef.codigo,                                                    ' +
           ' ef.emissao,                                                   ' +
           ' ef.numero,                                                    ' +
           ' ef.documento,                                                 ' +
           ' ef.serie,                                                     ' +
           ' ef.produto,                                                   ' +
           ' ef.sequencia,                                                 ' +
           ' ef.descricao,                                                 ' +
           ' ef.quantidade,                                                ' +
           ' ef.entregue,                                                  ' +
           ' coalesce((ef.saldo),0) as saldo                               ' +
           ' from                                                          ' +
           '   entrega_futura ef                                           ' +
           ' where ef.empresa                                            = ' + IntToStr(rempresa)   +
           ' and   ef.pessoa                                             = ' + IntToStr(rpessoa)    +
           ' order by ef.emissao, ef.numero                                ';

  Result := escrita;

end;
function ESCRITA_FINANCEIRODOCUMENTO     (const rempresa,rnumero:integer;rserie:string):string;
var
  escrita               :string;
begin
  escrita :=
           ' select                                                        ' +
           '   r.numero,                                                   ' +
           '   r.serie,                                                    ' +
           '   r.sequencia,                                                ' +
           '   r.empresa,                                                  ' +
           '   r.pessoa,                                                   ' +
           '   p.nome,                                                     ' +
           '   r.vencimento,                                               ' +
           '   r.valoratual,                                               ' +
           '   r.pagamento,                                                ' +
           '   r.valorpago,                                                ' +
           '   r.situacao                                                  ' +
           ' from                                                          ' +
           '   receber r inner join pessoas p on (r.pessoa = p.codigo)     ' +
           ' where r.empresa                                             = ' + IntToStr(rempresa)   +
           ' and   r.numero                                              = ' + IntToStr(rnumero)    +
           ' and   r.serie                                               = ' + QuotedStr(rserie)    +
           ' order by r.emissao, r.sequencia, r.pagamento                  ';

  Result := escrita;
end;
function ESCRITA_RELACAOLOTEINTERNO      (const rempresa,produtoini,produtofin,grupoini,grupofin:integer;ordem,tipo,barracao,tipolote:string):string;
var
  escrita                      : string;
  m_ordem, m_tipo, m_barracao  : string;
begin
  m_barracao := Acha_Item('BARRACAO',barracao);

  case StrToInt(ordem) of
    0 : m_tipo := ' and li.disponivel > 0';
    1 : m_tipo := ' and li.disponivel < 0';
    2 : m_tipo := ' and li.disponivel = 0';
    3 : m_tipo := ' ';
  end;


  case StrToInt(tipo) of
    0 : m_ordem := ' order by li.barracao';
    1 : m_ordem := ' order by li.produto';
    2 : m_ordem := ' order by pr.grupo,li.produto';
  end;

  escrita :=

            '  select                                                     ' +
            '    li.barracao,                                             ' +
            '    li.posicao,                                              ' +
            '    li.lote,                                                 ' +
            '    li.tipo,                                                 ' +
            '    li.produto,                                              ' +
            '    li.descricao,                                            ' +
            '    li.pureza,                                               ' +
            '    li.valorcultural,                                        ' +
            '    li.disponivel,                                           ' +
            '    li.totalpontos,                                          ' +
            '    pr.grupo,                                                ' +
            '    pr.nomegrupo                                             ' +
            '  from loteinterno li                                        ' +
            '  left join produtos pr on li.produto = pr.codigo                 ' +
            '    where li.empresa  = ' + IntToStr(rempresa)               + '  ' + m_tipo +
            varIIF(barracao = '0'    ,'',' and li.barracao = ' + QuotedStr(m_barracao)) +
            varIIF(tipolote = 'Todos','',' and li.tipo     = ' + QuotedStr(tipolote))   +
            '      and li.produto between '+IntToStr(produtoini)+
            '      and                    '+IntToStr(produtofin)+
            '      and pr.grupo between   '+IntToStr(grupoini)+
            '      and                    '+IntToStr(grupofin)+ '  ' + m_ordem;


  Result := escrita;
end;
function ESCRITA_RELATORIOSALDOEFEP      (const rempresa,pessoaini,pessoafin,produtoini,produtofin:integer;dataini,datafin:TDateTime):string;
var
  escrita : string;
begin
  escrita :=
            '  select                                                            ' +
            '  ef.codigo,                                                        ' +
            '  ef.pessoa,                                                        ' +
            '  p.nome,                                                           ' +
            '  p.estado,                                                         ' +
            '  ef.emissao as emissaoef,                                          ' +
            '  ef.numero  as numeroef,                                           ' +
            '  ef.serie   as serieef,                                            ' +
            '  ef.emissao as emissaoef,                                          ' +
            '  ef.produto,                                                       ' +
            '  pr.descricao,                                                     ' +
            '  ef.quantidade as ACUMULADO,                                       ' +
            '  ef.entregue,                                                      ' +
            '  ef.saldo,                                                         ' +
            '  m.numero,                                                         ' +
            '  m.serie,                                                          ' +
            '  m.emissao,                                                        ' +
            '  m.quantidade                                                      ' +
            '  from                                                              ' +
            '  entrega_futura ef inner join mvitens   m on (ef.codigo  = m.codvef)  ' +
            '                    inner join pessoas   p on (ef.pessoa  = p.codigo)  ' +
            '                    inner join produtos pr on (ef.produto = pr.codigo) ' +
            '  where ef.pessoa between  ' + IntToStr(pessoaini) +'  and ' + IntToStr(pessoafin) + '  ' +
            '  and   ef.produto between ' + IntToStr(produtoini)+'  and ' + IntToStr(produtofin)+ '  ' +
            '  and   ef.emissao between ' + QuotedStr(DataPonto(DateToStr(dataini)))            + '  ' +
            '  and                      ' + QuotedStr(DataPonto(DateToStr(datafin)))            +
            '  and   m.cancelada <>     ' + QuotedStr('C')                                      + '  ' +
            '  and   m.empresa   =      ' + IntToStr(rempresa)                                  + '  ' +
            '  order by ef.codigo                                                                 ';

  Result := escrita;
end;
function RELATORIO_VENDASPERIODO_PRODUTOS(const rempresa:integer;rdataini,rdatafin,rprodutoini,rprodutofin,rresumo,rtipo,rordem,rstatus,rvendas,rdevolucao,rvendasef,rbonifica,rtroca,routros:string):string;
var
   M_SITUACAO,
   M_ORDEM,
   M_SQL,
   sql_or,
   sql_vendas,
   sql_bonificacao,
   sql_devolucao,
   sql_troca,
   sql_vendaef,
   sql_outros    :string;
begin
  sql_or     :=
                ' AND ('                                    +
                variif(rvendas      = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Vendas')      + ') or','') +
                variif(rbonifica    = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Bonificacao') + ') or','') +
                variif(rdevolucao   = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Devolucao')   + ') or','') +
                variif(rtroca       = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Troca')       + ') or','') +
                variif(rvendasef    = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Venda EF')    + ') or','') +
                variif(routros      = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Outros')      + ') or','') +
                ')';


  case StrToInt(rordem) of
    0 : M_ORDEM := 'ORDER BY MVMESTRE.OPERACAO, MVMESTRE.NUMERO';
    1 : M_ORDEM := 'ORDER BY MVMESTRE.OPERACAO, MVITENS.PRODUTO';
    2 : M_ORDEM := 'ORDER BY MVMESTRE.OPERACAO, MVMESTRE.EMISSAO';
  end;

  if rresumo = 'T' then
    begin
            M_SQL :=   ' SELECT                                                            ' +
                       '  MVITENS.PRODUTO,                                                 ' +
                       '  AVG(MVITENS.preco) AS MEDIA,                                     ' +
                       '  SUM(MVITENS.quantidade) AS QUANTIDADE,                           ' +
                       '  SUM(MVITENS.TOTAL - MVITENS.DESCONTO) AS TOTAL                   ' +
                       '  FROM MVITENS, MVMESTRE                                           ' +
                       '  INNER JOIN OPERACOES ON (MVMESTRE.OPERACAO = OPERACOES.CODIGO)   ' +
                       '  WHERE MVMESTRE.NUMERO = MVITENS.NUMERO                       AND ' +
                       '  MVMESTRE.DOCUMENTO    = MVITENS.DOCUMENTO                    AND ' +
                       '  MVMESTRE.EMISSAO BETWEEN                       ' + QuotedStr(dataponto(rdataini)) +
                       ' AND                                             ' + QuotedStr(dataponto(rdatafin)) +
                       ' AND MVITENS.PRODUTO  between                    ' + QuotedStr(rprodutoini)     +
                       ' AND                                             ' + QuotedStr(rprodutofin)     +
                       ' AND MVMESTRE.EMPRESA        =                   ' + IntToStr(rempresa)         +
                       ' AND ((MVMESTRE.DOCUMENTO    =                   ' + QuotedStr('1')+') or (MVMESTRE.DOCUMENTO = '+QuotedStr('2')+'))'+
                       variif(rstatus = '0',' AND MVMESTRE.CANCELADA      <> ' + QuotedStr('C')           + sql_or,
                                        ' AND MVMESTRE.CANCELADA          =  ' + QuotedStr('C'))          +
                       ' GROUP BY MVITENS.PRODUTO ORDER BY MVITENS.PRODUTO';
    end
  else
    begin
      case StrToInt(rtipo) of

        0 : M_SQL :=   ' SELECT                                                     ' +
                       '  MVITENS.PESSOA,                                           ' +
                       '  MVITENS.EMISSAO,                                          ' +
                       '  MVITENS.numero,                                           ' +
                       '  MVITENS.SERIE,                                            ' +
                       '  MVITENS.DOCUMENTO,                                        ' +
                       '  MVITENS.PRODUTO,                                          ' +
                       '  MVITENS.DESCRICAO,                                        ' +
                       '  MVITENS.OPERACAO,                                         ' +
                       '  MVITENS.QUANTIDADE,                                       ' +
                       '  MVITENS.PRECO,                                            ' +
                       '  MVITENS.DESCONTO,                                         ' +
                       '  CAST (MVITENS.TOTAL AS NUMERIC(15,2)) AS TOTAL,           ' +
                       '  OPERACOES.TIPO,                                           ' +
                       '  OPERACOES.OPERACAO_OP                                     ' +
                       '  FROM MVITENS, MVMESTRE                                           ' +
                       '  INNER JOIN OPERACOES ON (MVMESTRE.OPERACAO = OPERACOES.CODIGO)   ' +
                       '  WHERE MVMESTRE.NUMERO = MVITENS.NUMERO                       AND ' +
                       '  MVMESTRE.DOCUMENTO    = MVITENS.DOCUMENTO                    AND ' +
                       '  MVMESTRE.EMISSAO BETWEEN                       ' + QuotedStr(dataponto(rdataini)) +
                       ' AND                                             ' + QuotedStr(dataponto(rdatafin)) +
                       ' AND MVITENS.PRODUTO         =                   ' + QuotedStr(rprodutoini)     +
                       ' AND MVMESTRE.EMPRESA        =                   ' + IntToStr(rempresa)         +
                       ' AND ((MVMESTRE.DOCUMENTO    =                   ' + QuotedStr('1')+') or (MVMESTRE.DOCUMENTO = '+QuotedStr('2')+'))'+
                       variif(rstatus = '0',' AND MVMESTRE.CANCELADA      <> ' + QuotedStr('C')           + sql_or,
                                        ' AND MVMESTRE.CANCELADA          =  ' + QuotedStr('C'))          +
                       M_ORDEM;
      end;
    end;
  result := RemoverORSql(M_SQL);
//  clipboard.AsText := result;
end;
function RELATORIO_HISTORICOSEMSINTETICO (const rempresa:integer;rdataini,rdatafin,rprodutoini,rprodutofin,safra:string):string;
var
  escrita : string;
begin
  escrita :=

  ' SELECT * FROM MVITENS INNER JOIN SEMENTES ON (SEMENTES.LOTE = MVITENS.LOTESEMENTE)                ' +
  ' WHERE MVITENS.EMPRESA =                       ' + IntToStr(rempresa)                         +
  ' AND MVITENS.EMISSAO BETWEEN                   ' + QuotedStr(DataPonto(rdataini))             +
  ' AND                                           ' + QuotedStr(DataPonto(rdatafin))             +
  ' AND MVITENS.PRODUTO BETWEEN                   ' + QuotedStr(rprodutoini)                     +
  ' AND                                           ' + QuotedStr(rprodutofin)                     +
  ' AND MVITENS.PRODUTO     = SEMENTES.PRODUTO    ' +
  ' AND MVITENS.CANCELADA   <>                    ' + QuotedStr('C')           +
  variif(safra = 'TODOS','',' AND SEMENTES.SAFRAVALIDA = ' + QuotedStr(safra)) +
  ' ORDER BY SEMENTES.SAFRAVALIDA asc, SEMENTES.LOTE, MVITENS.NUMERO';


  Result := escrita;
end;
function RELATORIO_SALDOPRODUTONOTA  (const rempresa:integer;rdataini,rdatafin:string):string;
var
  escrita : string;
begin
  escrita :=
            '  select                                                          ' +
            '    m.produto,                                                    ' +
            '    cast(avg(m.preco) as numeric(15,2)) as media                  ' +
            '  from                                                            ' +
            '    mvitens m inner join operacoes o on (m.operacao = o.codigo)   ' +
            '    where m.empresa       =                                       ' + IntToStr(rempresa)             +  '     ' +
            '    and   m.emissao between                                       ' + QuotedStr(dataponto(rdataini)) +  ' and ' + QuotedStr(dataponto(rdatafin)) +'                 ' +
            '    and   ((m.documento = 1) or (m.documento = 2))                ' +
            '    and   o.tipo <> '+QuotedStr('Venda EF')                     + ' ' +
            '    group by 1                                                    ' +
            '    order by 1                                                    ';

  Result := escrita;
end;
function ESCRITA_CRESCIMENTOTENDECIA     (const rempresa:integer;rtipo,rvendas,rdevolucao,rvendasef,rbonifica,rtroca,routros:string):string;
var
   M_SITUACAO,
   M_ORDEM,
   M_SQL,
   M_TIPO,
   sql_or,
   sql_vendas,
   sql_bonificacao,
   sql_devolucao,
   sql_troca,
   sql_vendaef,
   sql_outros,
   escrita     :string;
begin

  sql_or     :=
                ' AND ('                                           +
                variif(rvendas      = 'T','(o.OPERACAO_OP      = ' + QuotedStr('Vendas')      + ') or','') +
                variif(rbonifica    = 'T','(o.OPERACAO_OP      = ' + QuotedStr('Bonificacao') + ') or','') +
                variif(rdevolucao   = 'T','(o.OPERACAO_OP      = ' + QuotedStr('Devolucao')   + ') or','') +
                variif(rtroca       = 'T','(o.OPERACAO_OP      = ' + QuotedStr('Troca')       + ') or','') +
                variif(rvendasef    = 'T','(o.OPERACAO_OP      = ' + QuotedStr('Venda EF')    + ') or','') +
                variif(routros      = 'T','(o.OPERACAO_OP      = ' + QuotedStr('Outros')      + ') or','') +
                ')';

  case StrToInt(rtipo) of
    0 : M_TIPO := ' where a.documento = ' + IntToStr(1) + ' and a.cancelada = ' + QuotedStr('A') + sql_or;
    1 : M_TIPO := ' where a.documento = ' + IntToStr(4);
  end;

  M_SQL :=
          '  with fat_base as (                                                                        ' +
          '    select                                                                                  ' +
          '      extract(year from a.emissao) ano,                                                     ' +
          '      sum(a.vlrtotal) total                                                                 ' +
          '    from mvmestre a inner join operacoes o on o.codigo = a.operacao                         ' + M_TIPO +
          '    group by ano)                                                                           ' +
          '  , fat_crescimento as (                                                                    ' +
          '    select                                                                                  ' +
          '      fb.ano,                                                                               ' +
          '      fb.total,                                                                             ' +
          '      fba.ano   as  ano_ant,                                                                ' +
          '      fba.total as  total_ant,                                                              ' +
          '      cast((fb.total - fba.total) / fba.total * 100 as numeric(15,2)) crescimento           ' +
          '    from fat_base fb                                                                        ' +
          '    left join fat_base fba on fba.ano = fb.ano -1                                           ' +
          '  )                                                                                         ' +
          '  ,                                                                                         ' +
          '  faturamento as (                                                                          ' +
          '    select                                                                                  ' +
          '      fc.ano,                                                                               ' +
          '      fc.total,                                                                             ' +
          '      fc.ano_ant,                                                                           ' +
          '      fc.total_ant,                                                                         ' +
          '      fc.crescimento,                                                                       ' +
          '      fc.crescimento - fca.crescimento tendencia                                            ' +
          '    from fat_crescimento fc                                                                 ' +
          '    left join fat_crescimento fca on fca.ano = fc.ano -1                                    ' +
          '  )                                                                                         ' +
          '  select * from faturamento                                                                 ';

  Result := RemoverORSql(M_SQL);

end;
function ESCRITA_COMISSAOBAIXAEFETUADA   (const rempresa:integer;rfuncionarioini,rfuncionariofin:string;dataini,datafin:TDateTime):string;
var
  escrita     :string;
begin
  escrita :=
          '  select                                                             ' +
          '      r.empresa,                                                     ' +
          '      r.pessoa,                                                      ' +
          '      mc.funcionario,                                                ' +
          '      p.nome as nomepessoa,                                          ' +
          '      f.nome as nomefuncionario,                                     ' +
          '      r.numero,                                                      ' +
          '      r.serie,                                                       ' +
          '      r.sequencia,                                                   ' +
          '      r.emissao,                                                     ' +
          '      r.vencimento,                                                  ' +
          '      r.pagamento,                                                   ' +
          '      (r.valorpago - r.valorjuros) as valororiginal,             ' +
          '      r.numeropedido,                                                ' +
          '      f.pix,                                                         ' +
          '      mc.comissao as perccomissao,                                   ' +
          '      (((r.valorpago - r.valorjuros) * mc.comissao) / 100) as comissaopaga   ' +
          '  from                                                               ' +
          '  receber r inner join  movimento_comissao mc   on (r.numero       = mc.numero ) ' +
          '            inner join pessoas                p on (r.pessoa       = p.codigo)   ' +
          '            inner join funcionarios           f on (mc.funcionario = f.codigo)   ' +
          '  where                                                              ' +
          '  r.pagamento between        ' + QuotedStr(DataPonto(DateToStr(dataini)))      +
          '  and                        ' + QuotedStr(DataPonto(DateToStr(datafin)))      +
          '  and r.empresa            = ' + IntToStr(rempresa)         +
          '  and mc.funcionario between ' + QuotedStr(rfuncionarioini) +
          '  and                        ' + QuotedStr(rfuncionariofin) +
          '  and r.financeiro         = ' + IntToStr(1)                +
          '  and r.situacao           = ' + QuotedStr('Pago')          +
          ' order by mc.funcionario,r.pagamento, r.numero          ';

  Result := escrita;
end;
function ESCRITA_COMISSAORECEBER         (const rempresa,rnumero,rsequencia:integer):string;
var
escrita:string;
begin
  escrita :=
          '  select                                                             ' +
          '      mc.funcionario,                                                ' +
          '      f.nome as nomefuncionario,                                     ' +
          '      r.valoratual,                                                  ' +
          '      mc.comissao as perccomissao,                                   ' +
          '      (r.valoratual * mc.comissao) / 100 as comissaopaga             ' +
          '  from                                                               ' +
          '  receber r inner join  movimento_comissao mc   on (r.numero       = mc.numero ) ' +
          '            inner join pessoas             p    on (r.pessoa       = p.codigo)   ' +
          '            inner join funcionarios        f    on (mc.funcionario = f.codigo)   ' +
          '  where r.numero           = ' + IntToStr(rnumero)    +
          '  and r.sequencia          = ' + IntToStr(rsequencia) +
          '  and r.empresa            = ' + IntToStr(rempresa)   +
          '  and r.financeiro         = ' + IntToStr(1);

  Result := escrita;
end;
function ESCRITA_PREVISAOCOMISSAO   (const rempresa:integer;rfuncionarioini,rfuncionariofin,rbuscapor:string;dataini,datafin:TDateTime):string;
var
  escrita,
  where     :string;
begin

  case StrToInt(rbuscapor) of
    0 : where := '  r.emissao between         ' + QuotedStr(DataPonto(DateToStr(dataini)))      +
                 '  and                       ' + QuotedStr(DataPonto(DateToStr(datafin)));
    1 : where := '  r.vencimento between      ' + QuotedStr(DataPonto(DateToStr(dataini)))      +
                 '  and                       ' + QuotedStr(DataPonto(DateToStr(datafin)));
  end;

  escrita :=
          '  select                                                             ' +
          '      r.empresa,                                                     ' +
          '      r.pessoa,                                                      ' +
          '      r.funcionario,                                                ' +
          '      p.nome as nomepessoa,                                          ' +
          '      f.nome as nomefuncionario,                                     ' +
          '      r.numero,                                                      ' +
          '      r.serie,                                                       ' +
          '      r.sequencia,                                                   ' +
          '      r.emissao,                                                     ' +
          '      r.vencimento,                                                  ' +
          '      r.valorpago,                                                   ' +
          '      r.valororiginal,                                               ' +
          '      r.numeropedido,                                                ' +
          '      r.perccomissao ,                                               ' +
          '      (r.valororiginal * r.perccomissao) / 100 as comissaopaga      ' +
          '  from                                                               ' +
          '  receber r                                                          ' +
          '            inner join pessoas             p    on (r.pessoa       = p.codigo)   ' +
          '            inner join funcionarios        f    on (r.funcionario  = f.codigo)   ' +

          '  where                                                              ' + where +
          '  and r.empresa            = ' + IntToStr(rempresa)         +
          '  and r.funcionario between  ' + QuotedStr(rfuncionarioini) +
          '  and                        ' + QuotedStr(rfuncionariofin) +
          '  and r.financeiro         = ' + IntToStr(1)                +
          '  and r.situacao           = ' + QuotedStr('Aberto')        +
          ' order by r.funcionario,r.numero, r.sequencia,'+variif(StrToInt(rbuscapor) = 0,'r.emissao','r.vencimento');

  Result := escrita;
end;
function ESCRITA_RELATORIO_FINANCEIRO    (const rempresaini,rempresafin,rportadorini,rportadorfin,rpessoaini,rpessoafin,rfinanceiro,rtipobusca,rsituacao,ragrupar:integer;rplanoini,rplanofin:string;dataini,datafin:TDateTime):string;
var
  select, escrita, situacao, agrupar,
  where     :string;
begin

  case rfinanceiro of
    0 : select := 'select * from receber t where t.financeiro = 1 ';
    1 : select := 'select * from pagar   t where t.financeiro = 0 ';
  end;

  case rtipobusca of
    0 : where := '  and  t.emissao between     ' + QuotedStr(DataPonto(DateToStr(dataini)))      +
                 '  and                        ' + QuotedStr(DataPonto(DateToStr(datafin)));
    1 : where := '  and  t.vencimento between  ' + QuotedStr(DataPonto(DateToStr(dataini)))      +
                 '  and                        ' + QuotedStr(DataPonto(DateToStr(datafin)));
    2 : where := '  and  t.pagamento between   ' + QuotedStr(DataPonto(DateToStr(dataini)))      +
                 '  and                        ' + QuotedStr(DataPonto(DateToStr(datafin)));
  end;

  case rsituacao of
    0 : situacao := ' and t.situacao = ' + QuotedStr('Aberto');
    1 : situacao := ' and t.situacao = ' + QuotedStr('Pago');
    2 : situacao := '';
  end;

  case ragrupar of
    0 : agrupar := ' order by t.empresa, t.numero';
    1 : agrupar := ' order by t.empresa, t.pessoa';
    2 : agrupar := ' order by t.empresa, t.emissao';
    3 : agrupar := ' order by t.empresa, t.vencimento';
    4 : agrupar := ' order by t.empresa, t.pagamento';
  end;

  escrita := select + where + situacao +
             ' and t.pessoa   between    ' + IntToStr(rpessoaini)   + ' and ' + IntToStr(rpessoafin)   +
             ' and t.portador between    ' + IntToStr(rportadorini) + ' and ' + IntToStr(rportadorfin) +
             ' and t.planocontas between ' + QuotedStr(rplanoini)   + ' and ' + QuotedStr(rplanofin)   +
             ' and t.empresa     between ' + IntToStr(rempresaini)  + ' and ' + IntToStr(rempresafin)  +
             agrupar;

  Result := escrita;
end;
function RELATORIO_ESTOQUE_MANUTENCAOLOTE(const elote:string;eproduto,eempresa:integer)  :TFDMemTable;
var
  I :integer;
  ENTRADA,SAIDA,SALDO : Real;
  escrita:string;
begin
      escrita :=
                '  select                                                                                                          ' +
                '      rl.tipo,                                                                                                    ' +
                '      rl.emissao,                                                                                                 ' +
                '      rl.numero,                                                                                                  ' +
                '      rl.lote,                                                                                                    ' +
                '      rl.produto,                                                                                                 ' +
                '      rl.descricao,                                                                                               ' +
                '      rl.pureza,                                                                                                  ' +
                '      rl.totalpontos,                                                                                             ' +
                '      rl.quantidade                                                                                               ' +
                '  FROM manutencaolote_interno rl                                                                                  ' +
                '  where rl.empresa                                                                   =                            ' + IntToStr(eempresa) +
                '  and   rl.produto                                                                   =                            ' + IntToStr(eproduto) +
                '  and   rl.lote                                                                      =                            ' + QuotedStr(elote)   +
                '  order by rl.emissao,rl.numero, rl.sequencia                                                                     ';

  SqlPesquisa(escrita);

  I       := 0;
  ENTRADA := 0;
  SAIDA   := 0;
  SALDO   := 0;

  dm_rc.tbkardexmanulote.DisableControls;
  dm_rc.tbkardexmanulote.First;
  while not dm_rc.tbkardexmanulote.Eof do
    begin
      Inc(I);

      dm_rc.tbkardexmanulote.Append;
      dm_rc.tbkardexmanulote.FindField('EMISSAO').AsDateTime := dm_rc.sqlBuscas.FindField('EMISSAO').AsDateTime;
      dm_rc.tbkardexmanulote.FindField('NUMERO').AsInteger   := dm_rc.sqlBuscas.FindField('NUMERO').AsInteger;
      dm_rc.tbkardexmanulote.FindField('LOTE').AsString      := dm_rc.sqlBuscas.FindField('LOTE').AsString;
      dm_rc.tbkardexmanulote.FindField('DESCRICAO').AsString := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
      dm_rc.tbkardexmanulote.FindField('PRODUTO').AsInteger  := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
      dm_rc.tbkardexmanulote.FindField('PUREZA').AsFloat     := dm_rc.sqlBuscas.FindField('PUREZA').AsFloat;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'ENTRADA' then
        begin
          dm_rc.tbkardexmanulote.FindField('ENTRADA').AsFloat     := dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
          ENTRADA := ENTRADA + dm_rc.tbkardexmanulote.FindField('CREDITO').AsFloat;
        end;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'SAIDA' then
        begin
          dm_rc.tbkardexmanulote.FindField('SAIDA').AsFloat     := dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
          SAIDA := SAIDA + dm_rc.tbkardexmanulote.FindField('DEBITO').AsFloat;
        end;

      SALDO := SALDO + dm_rc.tbkardexmanulote.FindField('ENTRADA').AsFloat - dm_rc.tbkardexmanulote.FindField('SAIDA').AsFloat;
      dm_rc.tbkardexmanulote.FindField('SALDO').AsFloat         := SALDO;

      dm_rc.tbkardexmanulote.Post;

      dm_rc.tbkardexmanulote.Next;
    end;

  Result := dm_rc.tbkardexmanulote;
end;
end.
