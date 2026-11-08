unit mkm_impressao;

interface

uses
  FireDAC.Comp.Client,frxClass;

const   caminhosolicitacao = 'documentos\solicitacao\';

function IMPRESSAO_extratobancario  (portador,dataini,datafin:string;table:TFDMemTable)           :string;
function IMPRESSAO_caixadiario      (dataini:string;table:TFDMemTable)                            :string;
function IMPRESSAO_Financeiro       (tipo,dataini,datafin:string;empresa,agrupamento:Integer;table:TFDMemTable)    :string;
function IMPRESSAO_planoanalitico   (dataini,datafin:string;table:TFDMemTable)                    :string;
function IMPRESSAO_planoresumo      (planoini,planofin,mesini,mesfim,ano:string;table:TFDMemTable):string;
function IMPRESSAO_bancoresumo      (dataini:string;table:TFDMemTable)                            :string;
function IMPRESSAO_Duplicata        (empresa,controle,parcela:integer)                            :string;
function IMPRESSAO_Autorizareembalo (empresa,controle:integer)                                    :string;
function IMPRESSAO_recibonota       (empresa,controle:integer)                                    :string;
function IMPRESSAO_recibonotaVolume (empresa,controle:integer)                                    :string;
function IMPRESSAO_DeclaracaoRET    (empresa,controle:integer;nome,cpfcnpj:string)                :string;
function IMPRESSAO_Fluxocaixa       (saldoinicial:real;dataini,datafin:string;empresa:integer;table:TFDMemTable)    :string;
function IMPRESSAO_solicitacao (pempresa,psolicitacao:integer;psavar:Boolean;tipo:string)                           :string;
function IMPRESSAO_termocoleta      (pempresa,psolicitacao:integer)                                                 :string;
function IMPRESSAO_producaointerna  (pempresa,pmestre:integer)                                                      :string;
function IMPRESSAO_CustoProducao    (pempresa,pmestre:integer)                                                      :string;

function IMPRESSAO_extratofinanceiropessoa(scredito,sdebito,ssaldo:real;dataini,datafin:string;rempresa,rpessoa:integer;table:TFDMemTable)    :string;

function IMPRESSAO_historicosemente (empresa:integer;dataini,datafin,rprodutoini,rprodutofin,sql:string)            :string;
function IMPRESSAO_saldobenenotas   (empresa:integer;dataini,datafin,rprodutoini,rprodutofin,sql:string)            :string;

function IMPRESSAO_FichaControle    (empresa,rcontrole:integer)            :string;
function IMPRESSAO_FichaBatida      (empresa,rcontrole:integer)            :string;
function IMPRESSAO_FichaSemente     (empresa,rcontrole:integer)            :string;

function LABORATORIO_ficha        (protocolo:integer;tipo:string): string;
function LABORATORIO_Boletim      (protocolo,via:integer)        : string;
function LABORATORIO_Informativo  (protocolo:integer)            : string;
function LABORATORIO_Levantamento (dataini,datafin,dataref:string;empresa,responsavel:Integer;table:TFDMemTable)  :string;
function LABORATORIO_Demonstrativo(dataini,datafin,dataref:string;empresa,responsavel:Integer;table:TFDMemTable)  :string;
function LABORATORIO_RAM          (mes,ano:string;empresa,responsavel:Integer;table:TFDMemTable)                  :string;
function LABORATORIO_SEMRENASEM   (dataini,datafin:string;empresa,responsavel:Integer;table:TFDMemTable)          :string;
function LABORATORIO_ENTRADAS     (dataini,datafin:string;empresa:Integer;table:TFDMemTable)                      :string;

function NOTA_ContratoTranporte   (empresa,numero,documento:Integer)                            :string;
function NOTA_ControleEtiqueta    (empresa,numero,documento:Integer)                            :string;

function PEDIDOORCAMENTO_impressao   (empresa,numero,documento:Integer)                            :string;
function PEDIDOORCAMENTO_ORCDiferente(empresa,numero,documento:Integer)                            :string;
function SEMENTES_Termo              (empresa,controle,assinado:Integer;adt,termo:string)          :string;
function RECIBOENTREGA_impressao     (empresa,numero,documento:Integer;dataini,tipo:string)        :string;

function RELATORIO_Vendasporperiodo         (empresa:Integer;sql,dataini,datafin,status:string)         :string;
function RELATORIO_Vendasporperiodoprodutos (empresa:Integer;sql,rresumo,dataini,datafin,status:string)         :string;
function RELATORIO_ESTOQUELOTE              (empresa:Integer;sql:string)                                :string;
function RELATORIO_ALIQUOTAICMS             (empresa:Integer;dataini,datafin,sql:string)                :string;
function IMPRESSAO_HISTORICOSEMENTESINTETICA(empresa:Integer;dataini,datafin,sql:string)                :string;
function RELATORIO_RELATORIOVENDASDETALHADA (empresa:Integer;dataini,datafin,sql:string)                :string;
function RELATORIO_CURVAABCPESSOA           (empresa,tipo:integer;ano:string;table:TFDMemTable)         :string;
function IMPRESSAO_SaldoProdutoNota         (empresa:Integer;sql,dataini,datafin:string)                :string;
function IMPRESSAO_recibo                   (pcontrole:Integer)                                         :string;
function IMPRESSAO_reciboPagar              (pcontrole:Integer)                                         :string;

function RELATORIO_RELATORIO_ENTREGAFUTURA  (const rempresa,rprodutoini,rprodutofin,rpessoaini,rpessoafin:integer;dataini,datafin:TDateTime;sql:string):string;
function ESCRITA_GRAFICO_COMPARATIVOFAT     (const rempresa:integer;anoini,mesini:string;tipo:integer):string;
function ESCRITA_GRAFICO_COMPARATIVOANUALFAT(const rempresa:integer;anoini:string;tipo:integer):string;
function RELATORIO_VENDASVENDEDOR           (const rempresa:integer;sql:string;dataini,datafin:TDateTime):string;
function RELATORIO_RELATORIOENTREGAITENS    (const rempresa,rpessoaini,rpessoafin,rprodutoini,rprodutofin,rtipodoc,tipoentre:integer;dataini,datafin,uf,sql:string):string;
function RELATORIO_HISTORICODOCUMENTO       (const rempresa,rnumero:Integer;rserie:string;table:TFDMemTable)  :string;
function RELATORIO_ROMANEIO_RECIBO          (const rempresa,rmestre:integer)  :string;
function RELATORIO_ROMANEIO_REQUERIMENTO    (const rempresa,rmestre:integer)  :string;
function RELATORIO_RELACAOCHEQUE            (const rempresa:integer;dataini,datafin,tipo,ordem:string;table:TFDMemTable)  :string;
function RELATORIO_RELACAOLOTEINTERNO       (const rempresa:integer;ordem,tipo,sql:string):string;
function RELATORIO_RELATORIOSALDOEFEP       (const rempresa:integer;produtoini,produtofin,pessoaini,pessoafin,dataini,datafin,sql:string):string;
function RELATORIO_CRESCIMENTOTENDECIA      (const rempresa:integer;tipo,sql:string):string;
function RELATORIO_COMISSAOBAIXAEFETUADA    (const rempresa:integer;dataini,datafin:TDateTime;sql:string):string;
function RELATORIO_PREVISAOCOMISSAO         (const rempresa,rbuscatipo:integer;dataini,datafin:TDateTime;sql:string):string;
function RELATORIO_Financeiro               (tipo,dataini,datafin:string;empresa,agrupamento:Integer;table:TFDQuery)    :string;
function RELATORIO_CURVAABCPRODUTOS         (const empresa,tipo:integer;ano:string;table:TFDMemTable) :string;
function LISTAGEM_Pessoas                   (const pempresa:integer;table:TFDQuery) :string;
function LISTAGEM_Funcionarios              (const pempresa:integer;table:TFDQuery) :string;
function ESCRITA_CURVA_ABC_PRODUTOS         (const rempresa,tipo:integer;ano:string):string;

implementation

uses mkm_procedures, mkm_func_web, mkm_funcoes, System.SysUtils,ACBrExtenso, untDM_IMP,
  untDM_RC, mkm_regrasnegocio, System.Classes, uconsts, MainModule,
  System.Variants, Vcl.Forms, Winapi.Windows, Vcl.Clipbrd;

var
ldm                  : tdm_imp;
M_ARQUIVO,
imagem, M_ANARENA    : string;

I, S, P, O, T, E, PRAGA,
DOSN,QTDE_P,QTDE_D,QTDE_PD  : Integer;
   S1,P1,O1,T1              : Integer;
Total_Imposto               : Real;
TIPO_P, TIPO_D              : Integer;
diasgerminacao              : Integer;

ID, SD, PD, OD, TD, ED      : integer;

M_OE1, M_SS1, M_PR1, M_TO1  : array[1..36] of string;
M_OEB, M_SSB, M_PRB, M_TOB  : array[1..36] of string;
M_OED, M_SSD, M_PRD, M_TOD  : array[1..36] of string;

memoria                     : TFDMemTable;

DESC_INFEST : Tstringlist;


function IMPRESSAO_extratobancario(portador,dataini,datafin:string;table:TFDMemTable):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']  := dataini;
      frxReport.Script.Variables['DATAFIN']  := datafin;
      frxReport.Script.Variables['PORTADOR'] := portador;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'Bancos_extrato_bancarioPASTOFORT.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;

end;
function IMPRESSAO_caixadiario    (dataini:string;table:TFDMemTable):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';

  ldm                    := tdm_imp.Create(nil);

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']  := dataini;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'Bancos_Caixa_diario.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_planoanalitico (dataini,datafin:string;table:TFDMemTable):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';

  ldm                    := tdm_imp.Create(nil);

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']  := dataini;
      frxReport.Script.Variables['DATAFIN']  := datafin;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'Bancos_plano_analitico.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_planoresumo    (planoini,planofin,mesini,mesfim,ano:string;table:TFDMemTable):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';

  ldm                    := tdm_imp.Create(nil);

  with ldm do
    begin
      frxReport.Script.Variables['MESINI']  := mesini;
      frxReport.Script.Variables['MESFIN']  := mesfim;
      frxReport.Script.Variables['ANO']     := ano;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'Bancos_plano_resumo.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_bancoresumo    (dataini:string;table:TFDMemTable):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';

  ldm                    := tdm_imp.Create(nil);

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']  := dataini;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'Bancos_resumo.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;

function ESCRITA_CURVA_ABC_PRODUTOS      (const rempresa,tipo:integer;ano:string):string;
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
'      d2.codigo,                                ' +
'      d2.descricao,                             ' +
'      d2.valor_produto,                         ' +
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
'          d1.codigo,                            ' +
'          d1.descricao,                         ' +
'          d1.valor_produto,                     ' +
'          d1.totalgeral,                        ' +
'          d1.perc,                              ' +
'          sum(d1.perc) over(order by d1.perc desc) pacu ' +
'      from (                                            ' +
'          select                                        ' +
'              d.codigo,                                 ' +
'              d.descricao,                              ' +
'              d.valor_produto,                          ' +
'              sum(d.valor_produto) over() totalgeral,   ' +
'              cast(d.valor_produto as numeric(15,2)) / cast(sum(d.valor_produto) over() as numeric(15,2)) * 100 perc ' +
'          from (                                                                                                   ' +
'              select                                                                                               ' +
'                p.codigo,                                                                                          ' +
'                pp.descricao,                                                                                      ' +
'                sum(mv.total - mv.desconto) as valor_produto                                                       ' +
'              from mvmestre   p inner join operacoes  op on (p.operacao   = op.codigo)                             ' +
'                                 inner join mvitens   mv on (p.numero     = mv.numero)                             ' +
'                                 inner join produtos  pp on (mv.produto   = pp.codigo)                             ' +
'                                                                                                                   ' +
'                  where p.empresa      =                                                                           ' + inttostr(rempresa) + m_tipo +
                   variif(ano <> '0',
                    '  and   extract(year from p.emissao) =  ' + Quotedstr(ano),'')+
'              group by 1,2                                                                                           ' +
'              order by 2 desc) d) d1 ) d2                                                                            ';

  Result := escrita;
end;



function LABORATORIO_ficha (protocolo:integer;tipo:string):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaProtocolo     ('SELECT * FROM PROTOCOLO       WHERE CODIGO    = ' + IntToStr(protocolo));
  TabelaEmpresas      ('SELECT * FROM EMPRESAS        WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('EMPRESA').AsInteger));
  TabelaAnalise       ('SELECT * FROM ANALISE         WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaAnaliseItens  ('SELECT * FROM ANALISE_ITENS   WHERE PROTOCOLO = ' + IntToStr(protocolo) + ' ORDER BY SEQUENCIA');
  TabelaPMS           ('SELECT * FROM PMS             WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaEspecie       ('SELECT * FROM ESPECIE         WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('ESPECIE_CODIGO').AsInteger));
  TabelaCultivar      ('SELECT * FROM CULTIVAR        WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('CULTIVAR_CODIGO').AsInteger));
  SqlPesquisa         ('select PRODUTO, DESCRICAO, TIPO, SUM(QUANTIDADE) AS TOTAL from ANALISE_ITENS  where mestre_id = ' + IntToStr(dm_rc.FDQryAnalise.FindField('CODIGO').AsInteger) + ' GROUP BY 1,2,3');


  M_ANARENA            := dm_rc.FDQryProtocolo.FindField('ANALISE_RE').AsString;

  I      := 0;
  S      := 0;
  O      := 0;
  P      := 0;
  T      := 0;
  E      := 0;
  PRAGA  := 0;
  TIPO_P := 0;
  TIPO_D := 0;

  for I:=1 to 9 do
    begin
      M_SS1[I] := '';
      M_TO1[I] := '';
      M_PR1[I] := '';
      M_OE1[I] := '';
    end;

  dm_rc.FDQryAnaliseitens.First;
  while not dm_rc.FDQryAnaliseitens.Eof do
    begin
      if (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'SS')  or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NT') or
         (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'OEC') or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NP')  then
      if dm_rc.FDQryAnaliseitens.FindField('TIPO_PD').AsString = 'DOSN' then
        begin
          Inc(TIPO_D);
        end;

      if (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'SS')  or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NT') or
         (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'OEC') or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NP') then
      if dm_rc.FDQryAnaliseitens.FindField('TIPO_PD').AsString = 'PUR' then
        begin
          Inc(TIPO_P);
        end;

      dm_rc.FDQryAnaliseitens.Next;
    end;

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'SS' then
        begin
          Inc(S);  Inc(E);  Inc(PRAGA);
          M_SS1[S] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString  + ')';
        end;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'OEC' then
        begin
          Inc(O);  Inc(E); Inc(PRAGA);
          M_OE1[O] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString + ')';
        end;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'NP' then
        begin
          Inc(P);  Inc(E); Inc(PRAGA);
          M_PR1[P] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString + ')';
        end;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'NT' then
        begin
          Inc(T);  Inc(E); Inc(PRAGA);
          M_TO1[T] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString + ')';
        end;

      dm_rc.sqlBuscas.Next;
    end;

  with ldm do
    begin
      with frxReport do
        begin
          Script.Variables['CABE_EMISSAO']         := dm_rc.FDQryAnalise.FindField('EMISSAO').AsString;
          Script.Variables['AMOSTRA']              := dm_rc.FDQryAnalise.FindField('AMOSTRA').AsString;
          Script.Variables['LOTE']                 := dm_rc.FDQryAnalise.FindField('LOTE').AsString;
          Script.Variables['CATEGORIA']            := dm_rc.FDQryAnalise.FindField('CATEGORIA').AsString;
          Script.Variables['AMOSTRA']              := dm_rc.FDQryAnalise.FindField('AMOSTRA').AsString;
          Script.Variables['SAFRA']                := dm_rc.FDQryAnalise.FindField('SAFRA_VALIDA').AsString;
          Script.Variables['DATA_ENTRADA']         := dm_rc.FDQryAnalise.FindField('DATA_ENTRADA').AsString;

          Script.Variables['ANALISE_A']            := variif(dm_rc.FDQryProtocolo.FindField('ANALISE_RE').AsString = 'Analise','X','');
          Script.Variables['ANALISE_B']            := variif(dm_rc.FDQryProtocolo.FindField('ANALISE_RE').AsString = 'Reanalise','X','');

          Script.Variables['ESPECIE_NOME']         := dm_rc.FDQryEspecie.FindField('POPULAR').AsString;
          Script.Variables['ESPECIE_ESPECIE']      := dm_rc.FDQryEspecie.FindField('SEMENTENOME').AsString;
          Script.Variables['CULTIVAR']             := dm_rc.FDQRyCultivar.FindField('CULTIVAR').AsString;


          Script.Variables['NUMERO_IR']            := dm_rc.FDQryProtocolo.FindField('NUMEROIR').AsString;
          Script.Variables['BAS_NUMERO']           := variif(dm_rc.FDQryProtocolo.FindField('BOLETIM').AsString <> '',dm_rc.FDQryProtocolo.FindField('BOLETIM').AsString,'');

          Script.Variables['BALANCA_PUREZA']       := dm_rc.FDQryAnalise.FindField('BALANCA_AMOSTRA_PUREZA').AsString;
          Script.Variables['BALANCA_ANALITICA']    := dm_rc.FDQryAnalise.FindField('BALANCA_ANALITICA').AsString;

          Script.Variables['PESO_AMOSTRA_PUREZA']  := FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_PUREZA').AsFloat);
          Script.Variables['PESO_AMOSTRA_RECEBIDA']:= FormatFloat('##,###0',dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_RECEBIDA').AsFloat);
          Script.Variables['PESO_AMOSTRA_ANALISE'] := FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_ANALISE').AsFloat);


          if dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_RECEBIDA').AsFloat > 1000 then
          begin
            Script.Variables['UNIDADE_AMOSTRA'] := 'Kg';
          end
          else
            Script.Variables['UNIDADE_AMOSTRA'] := 'g';

          if dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_ANALISE').AsFloat > 1000 then
          begin
            Script.Variables['UNIDADE_ANALISE_PUREZA'] := 'Kg';
          end
          else
            Script.Variables['UNIDADE_ANALISE_PUREZA'] := 'g';


          Script.Variables['PUREZA_PESO_INICIAL'] := variif(M_ANARENA = 'Analise',FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat), '-O-');
          Script.Variables['PUREZA_PURAS_KG']     := variif(M_ANARENA = 'Analise',FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_KG').AsFloat),'-O-');

          if Frac(dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_PERC').AsFloat) = 0.00 then
          begin
            Script.Variables['PUREZA_PURAS_PER']     := dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_PERC').AsString +',0';
          end
          else
          begin
            Script.Variables['PUREZA_PURASPUREZA_PURAS_PER_PER']     := FormatFloat('##,###0.0',MRound(dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_PERC').AsFloat,2));
          end;

          Script.Variables['PUREZA_PURAS_PER']     := variif(M_ANARENA = 'Analise',FormatFloat('##,###0.0',MRound(dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_PERC').AsFloat,2)) ,'-N-');
          Script.Variables['PUREZA_INERTE_KG']     := variif(M_ANARENA = 'Analise',FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_KG').AsFloat),'-O-');
          Script.Variables['PUREZA_INERTE_PER']    := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat > 0,FormatFloat('##,###0.0',dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat),
                                                                    FormatFloat('##,###0.0',dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat)),'-N-');

          if dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_INC').AsFloat > 0 then
          begin
            Script.Variables['REVESTIDAS_OUTRA_KG']  := variif(M_ANARENA = 'Analise',FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_KG').AsFloat),'-O-');
            Script.Variables['REVESTIDAS_OUTRA_PER'] := variif(M_ANARENA = 'Analise',AnalisaOS(PRAGA,dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_KG').AsFloat,TIPO_P,TIPO_D),'-N-');
            Script.Variables['PUREZA_OUTRA_KG']      := '';
            Script.Variables['PUREZA_OUTRA_PER']     := '';
          end
          else
          begin
            Script.Variables['PUREZA_OUTRA_KG']      := variif(M_ANARENA = 'Analise',FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_KG').AsFloat),'-O-');
            Script.Variables['PUREZA_OUTRA_PER']     := variif(M_ANARENA = 'Analise',AnalisaOS(PRAGA,dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_KG').AsFloat,TIPO_P,TIPO_D),'-N-');
            Script.Variables['REVESTIDAS_OUTRA_KG']  := '-N-';
            Script.Variables['REVESTIDAS_OUTRA_PER'] := '-N-';
          end;

          if dm_rc.FDQryPMS.RecordCount > 0 then
          begin
            Script.Variables['MEDIA_PMS']    := dm_rc.FDQryPMS.FindField('MEDIA_8').AsFloat;
            Script.Variables['PESO_PMS_KG']  := dm_rc.FDQryPMS.FindField('RESULTADO_PMS').AsFloat;
            Script.Variables['DATA_PMS']     := dm_rc.FDQryPMS.FindField('DATA_ANALISE').AsString;
            Script.Variables['VISTO_PMS']    := dm_rc.FDQryPMS.FindField('NOME_ANALISTA').AsString;
          end
          else
          begin
            Script.Variables['MEDIA_PMS']    := '';
            Script.Variables['PESO_PMS_KG']  := '';
            Script.Variables['DATA_PMS']     := '';
            Script.Variables['VISTO_PMS']    := '';
          end;

          Script.Variables['VE_OBSERVACAO']       := variif(dm_rc.FDQryAnalise.FindField('OBS_VE').AsString <> '',dm_rc.FDQryAnalise.FindField('OBS_VE').AsString,'');
          Script.Variables['PUREZA_VARIACAO_KG']  := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('VARIACAO_KG').AsFloat,'-O-');
          Script.Variables['PUREZA_PESO_FINAL']   := variif(M_ANARENA = 'Analise',FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('PESO_FINAL_KG').AsFloat),'-O-');

          Script.Variables['PESO_PUREZA']         := variif(dm_rc.FDQryProtocolo.FindField('PUREZA').AsString       = 'T','X','');
          Script.Variables['PESO_DOSN']           := variif(dm_rc.FDQryProtocolo.FindField('DOSN').AsString         = 'T','X','');
          Script.Variables['PESO_TZ']             := variif(dm_rc.FDQryProtocolo.FindField('TETRAZOLIO').AsString   = 'T','X','');
          Script.Variables['PESO_GERMINACAO']     := variif(dm_rc.FDQryProtocolo.FindField('GERMINACAO').AsString   = 'T','X','');
          Script.Variables['PESO_UMIDADE']        := variif(dm_rc.FDQryProtocolo.FindField('UMIDADE').AsString      = 'T','X','');
          Script.Variables['PESO_VE']             := variif(dm_rc.FDQryProtocolo.FindField('VE').AsString           = 'T','X','');
          Script.Variables['PESO_PMS']            := variif(dm_rc.FDQryProtocolo.FindField('PMS').AsString          = 'T','X','');
          Script.Variables['PESO_SI']             := variif(dm_rc.FDQryProtocolo.FindField('SI').AsString           = 'T','X','');
          Script.Variables['PESO_VOC']            := variif(dm_rc.FDQryProtocolo.FindField('VOC').AsString          = 'T','X','');
          Script.Variables['PESO_VIGOR']          := variif(dm_rc.FDQryProtocolo.FindField('VIGOR').AsString        = 'T','X','');


          if dm_rc.FDQryProtocolo.FindField('PMS').AsString = 'T' then
          begin
            Script.Variables['PUREZA_PESO_FINAL_DOSN']   := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat  = 0,'',variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_INC').AsFloat),FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_INC').AsFloat))),'-O-');
            Script.Variables['PESO_DOSN_INICIAL']        := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat  = 0,'',variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat)       ,FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat)))       ,'-O-');
            Script.Variables['TOTAL_DOSN']               := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat  = 0,'',variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('TOTAL_DOSN').AsFloat)      ,FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('TOTAL_DOSN').AsFloat)))      ,'-O-'); // olha aqui
          end
          else
          begin
            Script.Variables['PUREZA_PESO_FINAL_DOSN']   := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat  = 0,'',variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',FormatFloat('###,###,##0.000',dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat),FormatFloat('###,###,##0.000',dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat))),'-O-');
            Script.Variables['PESO_DOSN_INICIAL']        := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat  = 0,'',variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat)      ,FormatFloat('###,###,##0.0',dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat))),'-O-');
            Script.Variables['TOTAL_DOSN']               := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat  = 0,'',variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('TOTAL_DOSN').AsFloat),FormatFloat('###,###,##0.0',dm_rc.FDQryAnalise.FindField('TOTAL_DOSN').AsFloat))),'-O-'); // olha aqui
          end;

          Script.Variables['NATUREZA_MATERIAL_INERTE']   := dm_rc.FDQryAnalise.FindField('NATUREZA_MATERIAL').AsString;

          Script.Variables['TOTAL_OE']                   := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_OE').AsFloat,'-N-');
          Script.Variables['TOTAL_SS']                   := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_SS').AsFloat,'-N-');
          Script.Variables['TOTAL_TO']                   := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_TO').AsFloat,'-N-');
          Script.Variables['TOTAL_PR']                   := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_PR').AsFloat,'-N-');

          Script.Variables['EMBEBICAO_HORA']             := dm_rc.FDQryAnalise.FindField('TRATAMENTO_EMBEBICAO_HORA').AsString;
          Script.Variables['EMBEBICAO_GRAUS']            := dm_rc.FDQryAnalise.FindField('TRATAMENTO_EMBEBICAO_GRAUS').AsString;

          Script.Variables['EMBEBICAO_INICIAL']          := dm_rc.FDQryAnalise.FindField('TRATAMENTO_EMBEBICAO_INICIO').AsString;
          Script.Variables['EMBEBICAO_HORA_INICIO']      := dm_rc.FDQryAnalise.FindField('TRATAMENTO_HORA_INICIO').AsString;
          Script.Variables['EMBEBICAO_TERMINO']          := dm_rc.FDQryAnalise.FindField('TRATAMENTO_EMBEBICAO_HORA_TERMI').AsString;
          Script.Variables['EMBEBICAO_HORA_TERMINO']     := dm_rc.FDQryAnalise.FindField('TRATAMENTO_HORA_TERMINO').AsString;


          Script.Variables['CORTE_INICIADO']             := dm_rc.FDQryAnalise.FindField('CORTE_SEMENTE_INICIO').AsString;
          Script.Variables['IMERSAO_HORA']               := dm_rc.FDQryAnalise.FindField('COLORACAO_IMERSAO_HORA').AsString;
          Script.Variables['IMERSAO_SOLUCAO_PER']        := dm_rc.FDQryAnalise.FindField('COLORACAO_SOLUCAO').AsFloat;


          Script.Variables['IMERSAO_INICIAL']            := dm_rc.FDQryAnalise.FindField('COLORACAO_INICIO').AsString;
          Script.Variables['IMERSAO_HORA_INICIO']        := dm_rc.FDQryAnalise.FindField('COLORACAO_HORA_INICIO').AsString;
          Script.Variables['IMERSAO_TERMINO']            := dm_rc.FDQryAnalise.FindField('COLORACAO_TERMINO').AsString;
          Script.Variables['IMERSAO_HORA_TERMINO']       := dm_rc.FDQryAnalise.FindField('COLORACAO_HORA_TERMINO').AsString;
          Script.Variables['IMERSAO_COLORACAO_GRAUS']    := dm_rc.FDQryAnalise.FindField('COLORACAO_IMERSAO_GRAUS').AsString;

          Script.Variables['AVALIACAO_INICIO']           := dm_rc.FDQryAnalise.FindField('AVALIACAO_SEMENTES_INICIO').AsString;
          Script.Variables['AVALIACAO_HORA']             := dm_rc.FDQryAnalise.FindField('AVALIACAO_SEMENTES_HORA').AsString;

          Script.Variables['SEMENTES_AVALIADAS_I']       := dm_rc.FDQryAnalise.FindField('SEMENTES_AVALIADAS_I').AsFloat;
          Script.Variables['SEMENTES_AVALIADAS_II']      := dm_rc.FDQryAnalise.FindField('SEMENTES_AVALIADAS_II').AsFloat;
          Script.Variables['SEMENTES_VIAVEIS_I']         := dm_rc.FDQryAnalise.FindField('SEMENTES_VIAVEIS_I').AsFloat;
          Script.Variables['SEMENTES_VIAVEIS_II']        := dm_rc.FDQryAnalise.FindField('SEMENTES_VIAVEIS_II').AsFloat;
          Script.Variables['SEMENTES_VIAVEL_TOTAL']      := dm_rc.FDQryAnalise.FindField('SEMENTES_VIAVEIS_TOTAL').AsFloat;
          Script.Variables['SEMENTES_VIAVEL_MEDIA']      := dm_rc.FDQryAnalise.FindField('SEMENTES_VIAVEIS_MEDIA').AsFloat;
          Script.Variables['SEMENTES_NAO_VIAVEIS_I']     := dm_rc.FDQryAnalise.FindField('SEMENTES_NAOVIAVEIS_I').AsFloat;
          Script.Variables['SEMENTES_NAO_VIAVEIS_II']    := dm_rc.FDQryAnalise.FindField('SEMENTES_NAOVIAVEIS_II').AsFloat;
          Script.Variables['SEMENTES_NAO_VIAVEL_TOTAL']  := dm_rc.FDQryAnalise.FindField('SEMENTES_NAOVIAVEIS_TOTAL').AsFloat;
          Script.Variables['SEMENTES_NAO_VIAVEL_MEDIA']  := dm_rc.FDQryAnalise.FindField('SEMENTES_NAOVIAVEIS_MEDIA').AsFloat;
          Script.Variables['MEDIA_VIAVEL']               := dm_rc.FDQryAnalise.FindField('MEDIA_SEMENTES_VIAVEIS').AsFloat;

          Script.Variables['OBSERVACAO']                 := dm_rc.FDQryAnalise.FindField('OBSERVACOES').AsString;
          Script.Variables['MATERIAL_INERTE']            := dm_rc.FDQryAnalise.FindField('NATUREZA_MATERIAL').AsString;
          Script.Variables['EMPNOME']                    := dm_rc.tbempresas.FindField('DESCRICAO').AsString;


          if dm_rc.FDQryAnalise.FindField('PESSOA_HOMO').AsString = '' then
          begin
            Script.Variables['NOME_HOMO']                    := '';
          end
          else
          begin
            Script.Variables['NOME_HOMO']                    := Acha_Item('FUNCIONARIOS',dm_rc.FDQryAnalise.FindField('PESSOA_HOMO').AsString);
          end;

          if dm_rc.FDQryAnalise.FindField('CODIGO_ANALISTA_PUREZA').AsString = '' then
          begin
            Script.Variables['NOME_ANALISTA_PUREZA']                    := '';
          end
          else
          begin
            Script.Variables['NOME_ANALISTA_PUREZA']                    := StrAllTrim(Acha_Item('FUNCIONARIOS',dm_rc.FDQryAnalise.FindField('CODIGO_ANALISTA_PUREZA').AsString));
          end;

          if dm_rc.FDQryAnalise.FindField('CODIGO_ANALISTA_TETRA').AsString = '' then
          begin
            Script.Variables['NOME_ANALISTA_TETRA']                    := '';
          end
          else
          begin
            Script.Variables['NOME_ANALISTA_TETRA']                    := Acha_Item('FUNCIONARIOS',dm_rc.FDQryAnalise.FindField('CODIGO_ANALISTA_TETRA').AsString);
          end;

          Script.Variables['SS_1']                    := variif(length(StrAllTrim(M_SS1[1])) > 0,M_SS1[1],'');
          Script.Variables['SS_2']                    := variif(length(StrAllTrim(M_SS1[2])) > 0,M_SS1[2],'');
          Script.Variables['SS_3']                    := variif(length(StrAllTrim(M_SS1[3])) > 0,M_SS1[3],'');
          Script.Variables['SS_4']                    := variif(length(StrAllTrim(M_SS1[4])) > 0,M_SS1[4],'');
          Script.Variables['SS_5']                    := variif(length(StrAllTrim(M_SS1[5])) > 0,M_SS1[5],'');
          Script.Variables['SS_6']                    := variif(length(StrAllTrim(M_SS1[6])) > 0,M_SS1[6],'');
          Script.Variables['SS_7']                    := variif(length(StrAllTrim(M_SS1[7])) > 0,M_SS1[7],'');

          Script.Variables['TO_1']                    := variif(length(StrAllTrim(M_TO1[1])) > 0,M_TO1[1],'');
          Script.Variables['TO_2']                    := variif(length(StrAllTrim(M_TO1[2])) > 0,M_TO1[2],'');
          Script.Variables['TO_3']                    := variif(length(StrAllTrim(M_TO1[3])) > 0,M_TO1[3],'');
          Script.Variables['TO_4']                    := variif(length(StrAllTrim(M_TO1[4])) > 0,M_TO1[4],'');
          Script.Variables['TO_5']                    := variif(length(StrAllTrim(M_TO1[5])) > 0,M_TO1[5],'');
          Script.Variables['TO_6']                    := variif(length(StrAllTrim(M_TO1[6])) > 0,M_TO1[6],'');
          Script.Variables['TO_7']                    := variif(length(StrAllTrim(M_TO1[7])) > 0,M_TO1[7],'');

          Script.Variables['PR_1']                    := variif(length(StrAllTrim(M_PR1[1])) > 0,M_PR1[1],'');
          Script.Variables['PR_2']                    := variif(length(StrAllTrim(M_PR1[2])) > 0,M_PR1[2],'');
          Script.Variables['PR_3']                    := variif(length(StrAllTrim(M_PR1[3])) > 0,M_PR1[3],'');
          Script.Variables['PR_4']                    := variif(length(StrAllTrim(M_PR1[4])) > 0,M_PR1[4],'');
          Script.Variables['PR_5']                    := variif(length(StrAllTrim(M_PR1[5])) > 0,M_PR1[5],'');
          Script.Variables['PR_6']                    := variif(length(StrAllTrim(M_PR1[6])) > 0,M_PR1[6],'');
          Script.Variables['PR_7']                    := variif(length(StrAllTrim(M_PR1[7])) > 0,M_PR1[7],'');

          Script.Variables['OE_1']                    := variif(length(StrAllTrim(M_OE1[1])) > 0,M_OE1[1],'');
          Script.Variables['OE_2']                    := variif(length(StrAllTrim(M_OE1[2])) > 0,M_OE1[2],'');
          Script.Variables['OE_3']                    := variif(length(StrAllTrim(M_OE1[3])) > 0,M_OE1[3],'');
          Script.Variables['OE_4']                    := variif(length(StrAllTrim(M_OE1[4])) > 0,M_OE1[4],'');
          Script.Variables['OE_5']                    := variif(length(StrAllTrim(M_OE1[5])) > 0,M_OE1[5],'');
          Script.Variables['OE_6']                    := variif(length(StrAllTrim(M_OE1[6])) > 0,M_OE1[6],'');
          Script.Variables['OE_7']                    := variif(length(StrAllTrim(M_OE1[7])) > 0,M_OE1[7],'');
        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'ficha_analise.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;

function LABORATORIO_Boletim      (protocolo,via:integer)        :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaProtocolo     ('SELECT * FROM PROTOCOLO       WHERE CODIGO    = ' + IntToStr(protocolo));
  TabelaPessoas       ('SELECT * FROM PESSOAS         WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('PESSOA').AsInteger));
  TabelaEmpresas      ('SELECT * FROM EMPRESAS        WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('EMPRESA').AsInteger));
  TabelaAnalise       ('SELECT * FROM ANALISE         WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaAnaliseItens  ('SELECT * FROM ANALISE_ITENS   WHERE PROTOCOLO = ' + IntToStr(protocolo) + ' ORDER BY SEQUENCIA');
  TabelaPMS           ('SELECT * FROM PMS             WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaEspecie       ('SELECT * FROM ESPECIE         WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('ESPECIE_CODIGO').AsInteger));
  TabelaCultivar      ('SELECT * FROM CULTIVAR        WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('CULTIVAR_CODIGO').AsInteger));
  TabelaGerminacao    ('SELECT * FROM GERMINACAO      WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaRTCliente     ('SELECT * FROM RESPONSAVEL     WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('RESPONSAVEL').AsInteger));
  TabelaRTLaboratorio ('SELECT * FROM RESPONSAVEL     WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('RTEMPRESA').AsInteger));
  SqlPesquisa         ('select PRODUTO, DESCRICAO, TIPO, SUM(QUANTIDADE) AS TOTAL from ANALISE_ITENS  where protocolo = ' + IntToStr(protocolo) + ' GROUP BY 1,2,3');


  M_ANARENA            := dm_rc.FDQryProtocolo.FindField('ANALISE_RE').AsString;

  I      := 0;
  S      := 0;
  O      := 0;
  P      := 0;
  T      := 0;
  E      := 0;
  PRAGA  := 0;
  TIPO_P := 0;
  TIPO_D := 0;

  for I:=1 to 9 do
    begin
      M_SS1[I] := '';
      M_TO1[I] := '';
      M_PR1[I] := '';
      M_OE1[I] := '';
    end;

  dm_rc.FDQryAnaliseitens.First;
  while not dm_rc.FDQryAnaliseitens.Eof do
    begin
      if (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'SS')  or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NT') or
         (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'OEC') or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NP')  then
      if dm_rc.FDQryAnaliseitens.FindField('TIPO_PD').AsString = 'DOSN' then
        begin
          Inc(TIPO_D);
        end;

      if (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'SS')  or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NT') or
         (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'OEC') or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NP') then
      if dm_rc.FDQryAnaliseitens.FindField('TIPO_PD').AsString = 'PUR' then
        begin
          Inc(TIPO_P);
        end;

      dm_rc.FDQryAnaliseitens.Next;
    end;

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'SS' then
        begin
          Inc(S);  Inc(E);  Inc(PRAGA);
          M_SS1[S] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString  + ')';
        end;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'OEC' then
        begin
          Inc(O);  Inc(E); Inc(PRAGA);
          M_OE1[O] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString + ')';
        end;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'NP' then
        begin
          Inc(P);  Inc(E); Inc(PRAGA);
          M_PR1[P] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString + ')';
        end;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'NT' then
        begin
          Inc(T);  Inc(E); Inc(PRAGA);
          M_TO1[T] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString + ')';
        end;

      dm_rc.sqlBuscas.Next;
    end;

  with ldm do
    begin

      with frxReport do
        begin

          if via = 1 then
            Script.Variables['VIA_BOLETIM'] := '1º Via'
          else
          if via = 2 then
            Script.Variables['VIA_BOLETIM'] := '2º Via'
          else
          if via = 3 then
            Script.Variables['VIA_BOLETIM'] := '3º Via'
          else
          if via = 4 then
            Script.Variables['VIA_BOLETIM'] := '4º Via';

          Script.Variables['GERMINACAO_PENEIRA'] := variif(dm_rc.FDQryProtocolo.FindField('GERMINACAO').AsString = 'T',variif(dm_rc.FDQryGerminacao.FindField('PENEIRA').AsString = '','-N-',dm_rc.FDQryGerminacao.FindField('PENEIRA').AsString),'-N-');
          Script.Variables['EMPNOM']             := dm_rc.tbempresas.FindField('NOME').AsString;
          Script.Variables['ENDERECO']           := tratanome(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' nº ' + dm_rc.tbempresas.FindField('NUMERO').AsString + ' ' + dm_rc.tbempresas.FindField('BAIRRO').AsString;
          Script.Variables['CIDADE']             := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString);
          Script.Variables['ESTADO']             := dm_rc.tbempresas.FindField('UF').AsString;
          Script.Variables['RENASEM']            := dm_rc.tbempresas.FindField('RENASEM').AsString;
          Script.Variables['TELEFONE']           := dm_rc.tbempresas.FindField('TELEFONE').AsString + ' ' + dm_rc.tbempresas.FindField('CELULAR').AsString;
          Script.Variables['EMPRENASEM']         := dm_rc.tbempresas.FindField('RENASEM').AsString;
          Script.Variables['EMPVALIDADE']        := dm_rc.tbempresas.FindField('VALIDADE').AsString;

          Script.Variables['AMOSTRA']            := dm_rc.FDQryProtocolo.FindField('AMOSTRA').AsString;
          Script.Variables['BOLETIM']            := dm_rc.FDQryProtocolo.FindField('BOLETIM').AsString;
          Script.Variables['VALIDADE']           := '';

          Script.Variables['CLINOM']             := tratanome(Trocarletra(dm_rc.FDQryPessoas.FindField('NOME').AsString));
          Script.Variables['CLIEND']             := PrimeiraLetraMaiscula(Trocarletra(dm_rc.FDQryPessoas.FindField('ENDERECO').AsString)) + ' '   + dm_rc.FDQryPessoas.FindField('NUMERO').AsString + ' - ' +
                                                    PrimeiraLetraMaiscula(dm_rc.FDQryPessoas.FindField('BAIRRO').AsString)   + ' - ' +
                                                    PrimeiraLetraMaiscula(dm_rc.FDQryPessoas.FindField('CIDADE').AsString) + '/' + dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          Script.Variables['CLICEP']             := FORMATA_CEP(dm_rc.FDQryPessoas.FindField('CEP').AsString);
          Script.Variables['CLIRENASEM']         := dm_rc.FDQryPessoas.FindField('RENASEM').AsString;

          Script.Variables['PRODUTO_COMUM']      := dm_rc.FDQryEspecie.FindField('POPULAR').AsString;
          Script.Variables['PRODUTO_ESPECIE']    := dm_rc.FDQryEspecie.FindField('SEMENTENOME').AsString;
          Script.Variables['PRODUTO_CULTIVAR']   := dm_rc.FDQRyCultivar.FindField('CULTIVAR').AsString;
          Script.Variables['AVEIA_NATIVA']       := dm_rc.FDQryAnalise.FindField('AVEIA_NATIVA').AsString;

          Script.Variables['PROTOCOLO_SAFRA']    := dm_rc.FDQryProtocolo.FindField('SAFRAVALIDA').AsString;
          Script.Variables['PROTOCOLO_CATEGORIA']:= dm_rc.FDQryProtocolo.FindField('CATEGORIA').AsString;
          Script.Variables['DATA_AMOSTRAGEM']    := dm_rc.FDQryProtocolo.FindField('DATAAMOSTRAGEM').AsString;

          Script.Variables['PROTOCOLO_CATEGORIA']          := dm_rc.FDQryProtocolo.FindField('CATEGORIA').AsString;
          Script.Variables['PROTOCOLO_RECEBIMENTO']        := dm_rc.FDQryProtocolo.FindField('DATARECEBIMENTO').AsString;
          Script.Variables['PROTOCOLO_LOTE']               := dm_rc.FDQryProtocolo.FindField('LOTE').AsString;
          Script.Variables['PROTOCOLO_REPRESENTATIVIDADE'] := variif(dm_rc.FDQryProtocolo.FindField('REPRESENTATIVIDADE').AsFloat > 0,FormatFloat('###,###,##0',dm_rc.FDQryProtocolo.FindField('REPRESENTATIVIDADE').AsFloat) + ' Kg',dm_rc.FDQryProtocolo.FindField('REPRESENTA_ESCRITA').AsString);

          Script.Variables['PROTOCOLO_PROCEDENCIA'] := PrimeiraLetraMaiscula(dm_rc.FDQryProtocolo.FindField('CIDADE_PROCEDENCIA').AsString) + '-'+dm_rc.FDQryProtocolo.FindField('ESTADO_PROCEDENCIA').AsString;

          Script.Variables['RT_NOME_CLIENTE']    := PrimeiraLetraMaiscula(dm_rc.FDQryRTCliente.FindField('NOME').AsString);
          Script.Variables['RT_RENASEM_CLIENTE'] :=                       dm_rc.FDQryRTCliente.FindField('CREDENCIAL').AsString;

          Script.Variables['OBSERVACAO']         := dm_rc.FDQryProtocolo.FindField('OBSERVACAO').AsString;
          Script.Variables['VE_REVESTIDAS']      := variif(dm_rc.FDQryProtocolo.FindField('PMS').AsString = 'T',
                                                                         ' SEMENTES REVESTIDAS ' +
                                                                         ' % sementes puras = % pelotas puras e % de outras sementes = % sementes não revestidas','');
          Script.Variables['VE_OBSERVACAO']      := variif(dm_rc.FDQryProtocolo.FindField('VE').AsString = 'T',
                                                                         dm_rc.FDQryAnalise.FindField('OBS_VE').AsString,'');



          Script.Variables['PESO_ANALISE_PUREZA'] := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',
                                                                                                   FormatFloat('###,###,##0.000' ,dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat),
                                                                                                   FormatFloat('###,###,##0.00'  ,dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat)),'-O-');

          Script.Variables['PESO_ANALISE_PUREZA_DOSN']  := variif(dm_rc.FDQryProtocolo.FindField('PMS').AsString = 'T',
                                                                         FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_INC').AsFloat),
                                                                         variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',
                                                                             FormatFloat('###,###,##0.000',dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat),
                                                                             FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat)));

          Script.Variables['PESO_ANALISE_PUREZA_VOC']  := variif(dm_rc.FDQryProtocolo.FindField('VOC').AsString = 'T',FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat),'-0-');

          Script.Variables['PERC_SEMENTES_PURAS'] := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_PERC').AsFloat  > 0 ,FormatFloat('###,###,##0.0',dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_PERC').AsFloat) ,0) ,'-N-');//_DATAMODULE.TB_ANALISE.FindField('SEMENTES_PURAS_PERC').AsFloat;
          Script.Variables['PERC_MATERIAL_INERTE']  := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat >= 0,FormatFloat('###,###,##0.0',dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat),0) ,'-N-') ;//dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat;
          Script.Variables['PERC_OUTRAS_SEMENTES']  := variif(M_ANARENA = 'Analise',AnalisaOS(PRAGA,dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_KG').AsFloat,TIPO_P,TIPO_D),'-N-');

          Script.Variables['NATUREZA_MATERIAL_INERTE'] := PrimeiraLetraMaiscula(dm_rc.FDQryAnalise.FindField('NATUREZA_MATERIAL').AsString);

          Script.Variables['TOTAL_OE']            := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_OE').AsFloat, '-N-');
          Script.Variables['TOTAL_SS']            := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_SS').AsFloat, '-N-');
          Script.Variables['TOTAL_TO']            := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_TO').AsFloat, '-N-');
          Script.Variables['TOTAL_PR']            := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_PR').AsFloat, '-N-');
          Script.Variables['TOTAL_VOC']           := variif(dm_rc.FDQryProtocolo.FindField('VOC').AsString   = 'T',
                                                                      dm_rc.FDQryAnalise.FindField('TOTAL_VOC').AsFloat, '-N-');

          Script.Variables['TOTAL_VE']            := variif(dm_rc.FDQryAnalise.FindField('TOTAL_VE').AsFloat    <>  0  ,  dm_rc.FDQryAnalise.FindField('TOTAL_VE').AsFloat,                              '-N-');
          Script.Variables['TOTAL_SI']            := variif(dm_rc.FDQryProtocolo.FindField('SI').AsString        = 'T' ,  FormatFloat('##,###0.0' ,dm_rc.FDQryAnalise.FindField('SI_AM_MEDIA').AsFloat), '-N-');
          Script.Variables['TOTAL_PMS']           := variif(dm_rc.FDQryPMS.FindField('RESULTADO_PMS').AsFloat    <> 0  ,  FormatFloat('##,###0.00',dm_rc.FDQryPMS.FindField('RESULTADO_PMS').AsFloat)  , '-N-');
          Script.Variables['TOTAL_TZ']            := variif(dm_rc.FDQryProtocolo.FindField('TETRAZOLIO').AsString = 'T',  dm_rc.FDQryAnalise.FindField('MEDIA_SEMENTES_VIAVEIS').AsFloat               , '-N-');
          Script.Variables['MATERIAL_INERTE']     :=  dm_rc.FDQryAnalise.FindField('NATUREZA_MATERIAL').AsString;
          Script.Variables['DIAVIABILIDADE']      :=  dm_rc.FDQryAnalise.FindField('TRATAMENTO_EMBEBICAO_HORA_TERMI').AsString;


          Script.Variables['DOSN']                :=     variif(M_ANARENA = 'Analise',
                                                                       variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',
                                                                       FormatFloat('###,###,##0.00',mround(dm_rc.FDQryAnalise.FindField('TOTAL_DOSN').AsFloat,2)),
                                                                       FormatFloat('###,###,##0.0' ,mround(dm_rc.FDQryAnalise.FindField('TOTAL_DOSN').AsFloat,2))),'-O-');

          Script.Variables['MES']                 := ExtensoMes( StrToInt(FormatDateTime('mm', dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsDateTime)));
          Script.Variables['ANO']                 := StrToFloat(StrRight(dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString,4));
          Script.Variables['DIA']                 := StrToFloat(StrLeft(dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString,2));

          Script.Variables['SS1']                 := variif(length(StrAllTrim(M_SS1[1])) > 0,'11 - '+M_SS1[1],'');
          Script.Variables['SS2']                 := variif(length(StrAllTrim(M_SS1[2])) > 0,','+M_SS1[2],'');
          Script.Variables['SS3']                 := variif(length(StrAllTrim(M_SS1[3])) > 0,','+M_SS1[3],'');
          Script.Variables['SS4']                 := variif(length(StrAllTrim(M_SS1[4])) > 0,','+M_SS1[4],'');
          Script.Variables['SS5']                 := variif(length(StrAllTrim(M_SS1[5])) > 0,','+M_SS1[5],'');
          Script.Variables['SS6']                 := variif(length(StrAllTrim(M_SS1[6])) > 0,','+M_SS1[6],'');
          Script.Variables['SS7']                 := variif(length(StrAllTrim(M_SS1[7])) > 0,','+M_SS1[7],'');
          Script.Variables['SS8']                 := variif(length(StrAllTrim(M_SS1[8])) > 0,','+M_SS1[8],'');
          Script.Variables['SS9']                 := variif(length(StrAllTrim(M_SS1[9])) > 0,','+M_SS1[9],'');

          Script.Variables['TO1']                 := variif(length(StrAllTrim(M_TO1[1])) > 0,'12 - '+M_TO1[1],'');
          Script.Variables['TO2']                 := variif(length(StrAllTrim(M_TO1[2])) > 0,','+M_TO1[2],'');
          Script.Variables['TO3']                 := variif(length(StrAllTrim(M_TO1[3])) > 0,','+M_TO1[3],'');
          Script.Variables['TO4']                 := variif(length(StrAllTrim(M_TO1[4])) > 0,','+M_TO1[4],'');
          Script.Variables['TO5']                 := variif(length(StrAllTrim(M_TO1[5])) > 0,','+M_TO1[5],'');
          Script.Variables['TO6']                 := variif(length(StrAllTrim(M_TO1[6])) > 0,','+M_TO1[6],'');
          Script.Variables['TO7']                 := variif(length(StrAllTrim(M_TO1[7])) > 0,','+M_TO1[7],'');
          Script.Variables['TO8']                 := variif(length(StrAllTrim(M_TO1[8])) > 0,','+M_TO1[8],'');
          Script.Variables['TO9']                 := variif(length(StrAllTrim(M_TO1[9])) > 0,','+M_TO1[9],'');

          Script.Variables['PR1']                 := variif(length(StrAllTrim(M_PR1[1])) > 0,'13 - '+M_PR1[1],'');
          Script.Variables['PR2']                 := variif(length(StrAllTrim(M_PR1[2])) > 0,','+M_PR1[2],'');
          Script.Variables['PR3']                 := variif(length(StrAllTrim(M_PR1[3])) > 0,','+M_PR1[3],'');
          Script.Variables['PR4']                 := variif(length(StrAllTrim(M_PR1[4])) > 0,','+M_PR1[4],'');
          Script.Variables['PR5']                 := variif(length(StrAllTrim(M_PR1[5])) > 0,','+M_PR1[5],'');
          Script.Variables['PR6']                 := variif(length(StrAllTrim(M_PR1[6])) > 0,','+M_PR1[6],'');
          Script.Variables['PR7']                 := variif(length(StrAllTrim(M_PR1[7])) > 0,','+M_PR1[7],'');
          Script.Variables['PR8']                 := variif(length(StrAllTrim(M_PR1[8])) > 0,','+M_PR1[8],'');
          Script.Variables['PR9']                 := variif(length(StrAllTrim(M_PR1[9])) > 0,','+M_PR1[9],'');

          Script.Variables['OE1']                 := variif(length(StrAllTrim(M_OE1[1])) > 0,'10 - '+M_OE1[1],'');
          Script.Variables['OE2']                 := variif(length(StrAllTrim(M_OE1[2])) > 0,','+M_OE1[2],'');
          Script.Variables['OE3']                 := variif(length(StrAllTrim(M_OE1[3])) > 0,','+M_OE1[3],'');
          Script.Variables['OE4']                 := variif(length(StrAllTrim(M_OE1[4])) > 0,','+M_OE1[4],'');
          Script.Variables['OE5']                 := variif(length(StrAllTrim(M_OE1[5])) > 0,','+M_OE1[5],'');
          Script.Variables['OE6']                 := variif(length(StrAllTrim(M_OE1[6])) > 0,','+M_OE1[6],'');
          Script.Variables['OE7']                 := variif(length(StrAllTrim(M_OE1[7])) > 0,','+M_OE1[7],'');
          Script.Variables['OE8']                 := variif(length(StrAllTrim(M_OE1[8])) > 0,','+M_OE1[8],'');
          Script.Variables['OE9']                 := variif(length(StrAllTrim(M_OE1[9])) > 0,','+M_OE1[9],'');
          Script.Variables['ZERO']                := variif(E > 0,'','0');

          if dm_rc.FDQryGerminacao.RecordCount > 0 then
            begin
               Script.Variables['PLANTULAS_NORMAIS']  := FormatFloat('##,###0',dm_rc.FDQryGerminacao.FindField('PLANTULAS_NORMAIS').AsFloat);
               Script.Variables['PLANTULAS_ANORMAIS'] := FormatFloat('##,###0',dm_rc.FDQryGerminacao.FindField('PLANTULAS_ANORMAIS').AsFloat);
               Script.Variables['SEMENTES_DURAS']     := variif(dm_rc.FDQryPMS.RecordCount > 0,'-N-',FormatFloat('##,###0',dm_rc.FDQryGerminacao.FindField('SEMENTES_DURAS').AsFloat));
               Script.Variables['SEMENTES_DORMENTES'] := variif(dm_rc.FDQryPMS.RecordCount > 0,'-N-',FormatFloat('##,###0',dm_rc.FDQryGerminacao.FindField('SEMENTES_DORMENTES').AsFloat));
               Script.Variables['SEMENTES_MORTAS']    := FormatFloat('##,###0',dm_rc.FDQryGerminacao.FindField('SEMENTES_MORTAS').AsFloat);

               if dm_rc.FDQryGerminacao.FindField('MAIOR').AsString = 'A' then
                 begin
                   diasgerminacao :=  DaysBetween(dm_rc.FDQryGerminacao.FindField('DATAINICIAL_A').AsDateTime -1 ,dm_rc.FDQryGerminacao.FindField('LEITURA_3_A').AsDateTime);

                   Script.Variables['SUBSTRATO_GERMINACAO']     := dm_rc.FDQryGerminacao.FindField('SUBSTRATO_A').AsString;
                   Script.Variables['TEMPERATURA_GERMINACAO']   := dm_rc.FDQryGerminacao.FindField('TEMPERATURA_A').AsString;
                   Script.Variables['TRATAMENTO_GERMINACAO']    := variif(dm_rc.FDQryGerminacao.FindField('TRATAMENTO_A').AsString <> '',dm_rc.FDQryGerminacao.FindField('TRATAMENTO_A').AsString,'-N-') ;
                   Script.Variables['DURACAO_GERMINACAO']       := IntToStr(diasgerminacao) + ' Dias.';
                 end
               else
                 begin
                   diasgerminacao :=  DaysBetween(dm_rc.FDQryGerminacao.FindField('DATAINICIAL_A').AsDateTime - 1,
                   dm_rc.FDQryGerminacao.FindField('LEITURA_3_A').AsDateTime);

                   Script.Variables['SUBSTRATO_GERMINACAO']     := dm_rc.FDQryGerminacao.FindField('SUBSTRATO_B').AsString;
                   Script.Variables['TEMPERATURA_GERMINACAO']   := dm_rc.FDQryGerminacao.FindField('TEMPERATURA_B').AsString;
                   Script.Variables['TRATAMENTO_GERMINACAO']    := variif(dm_rc.FDQryGerminacao.FindField('TRATAMENTO_A').AsString <> '',dm_rc.FDQryGerminacao.FindField('TRATAMENTO_A').AsString,'-N-') ;
                   Script.Variables['DURACAO_GERMINACAO']       := IntToStr(diasgerminacao) + ' Dias.';
                 end;
              Script.Variables['LEITURA_3_A']                   := dm_rc.FDQryGerminacao.FindField('LEITURA_3_A').AsString;
            end
          else
            begin
              Script.Variables['PLANTULAS_NORMAIS']             := '-N-';
              Script.Variables['PLANTULAS_ANORMAIS']            := '-N-';
              Script.Variables['SEMENTES_DURAS']                := '-N-';
              Script.Variables['SEMENTES_DORMENTES']            := '-N-';
              Script.Variables['SEMENTES_MORTAS']               := '-N-';

              Script.Variables['SUBSTRATO_GERMINACAO']          := '-N-';
              Script.Variables['TEMPERATURA_GERMINACAO']        := '-N-';
              Script.Variables['TRATAMENTO_GERMINACAO']         := '-N-';
              Script.Variables['DURACAO_GERMINACAO']            := '-N-';
              Script.Variables['LEITURA_3_A']                   := '-N-';
            end;

          Script.Variables['RT_NOME']                           := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['RT_RENASEM']                        := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
          Script.Variables['RT_NOMECLATURA']                    := variif(dm_rc.FDQryResponsavel.FindField('SUBSTITUTO').AsString = 'T','Responsável Técnico Substituto','Responsável Técnico');
          Script.Variables['RESPNOM']                           := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['CREA']                              := dm_rc.FDQryResponsavel.FindField('CREA').AsString;
          Script.Variables['RESPRENASEM']                       := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'laboratorio_boletimpms.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function LABORATORIO_Informativo  (protocolo:integer)            : string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaProtocolo     ('SELECT * FROM PROTOCOLO       WHERE CODIGO    = ' + IntToStr(protocolo));
  TabelaPessoas       ('SELECT * FROM PESSOAS         WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('PESSOA').AsInteger));
  TabelaEmpresas      ('SELECT * FROM EMPRESAS        WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('EMPRESA').AsInteger));
  TabelaAnalise       ('SELECT * FROM ANALISE         WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaAnaliseItens  ('SELECT * FROM ANALISE_ITENS   WHERE PROTOCOLO = ' + IntToStr(protocolo) + ' ORDER BY SEQUENCIA');
  TabelaPMS           ('SELECT * FROM PMS             WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaEspecie       ('SELECT * FROM ESPECIE         WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('ESPECIE_CODIGO').AsInteger));
  TabelaCultivar      ('SELECT * FROM CULTIVAR        WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('CULTIVAR_CODIGO').AsInteger));
  TabelaGerminacao    ('SELECT * FROM GERMINACAO      WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaRTCliente     ('SELECT * FROM RESPONSAVEL     WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('RESPONSAVEL').AsInteger));
  TabelaRTLaboratorio ('SELECT * FROM RESPONSAVEL     WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('RTEMPRESA').AsInteger));
  SqlPesquisa         ('select PRODUTO, DESCRICAO, TIPO, SUM(QUANTIDADE) AS TOTAL from ANALISE_ITENS  where protocolo = ' + IntToStr(protocolo) + ' GROUP BY 1,2,3');

  M_ANARENA            := dm_rc.FDQryProtocolo.FindField('ANALISE_RE').AsString;

  I      := 0;
  S      := 0;
  O      := 0;
  P      := 0;
  T      := 0;
  E      := 0;
  DOSN   := 0;
  PRAGA  := 0;
  TIPO_P := 0;
  TIPO_D := 0;
  QTDE_P := 0;
  QTDE_D := 0;
  QTDE_PD:= 0;

  DESC_INFEST := TStringList.Create;
  DESC_INFEST.Clear;

  for I:=1 to 9 do
    begin
      M_SS1[I] := '';
      M_TO1[I] := '';
      M_PR1[I] := '';
      M_OE1[I] := '';
    end;

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      Inc(QTDE_PD);
      DESC_INFEST.Add(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' - ' + '('+dm_rc.sqlBuscas.FindField('TOTAL').AsString+')');
      dm_rc.sqlBuscas.Next;
    end;

  dm_rc.FDQryAnaliseitens.First;
  while not dm_rc.FDQryAnaliseitens.Eof do
    begin
      if dm_rc.FDQryAnaliseitens.FindField('TIPO_PD').AsString = 'PUR' then
        begin
          Inc(QTDE_P); Inc(TIPO_P);
          if dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'SS' then
            begin
              Inc(S);  Inc(E); Inc(PRAGA);
              M_SS1[S] := dm_rc.FDQryAnaliseitens.FindField('DESCRICAO').AsString + ' (' +  dm_rc.FDQryAnaliseitens.FindField('QUANTIDADE').AsString  + ')';
            end;

          if dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'OEC' then
            begin
              Inc(O);  Inc(E); Inc(PRAGA);
              M_OE1[O] := dm_rc.FDQryAnaliseitens.FindField('DESCRICAO').AsString + ' (' +  dm_rc.FDQryAnaliseitens.FindField('QUANTIDADE').AsString + ')';
            end;

          if dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NP' then
            begin
              Inc(P);  Inc(E); Inc(PRAGA);
              M_PR1[P] := dm_rc.FDQryAnaliseitens.FindField('DESCRICAO').AsString + ' (' +  dm_rc.FDQryAnaliseitens.FindField('QUANTIDADE').AsString + ')';
            end;

          if dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NT' then
            begin
              Inc(T);  Inc(E); Inc(PRAGA);
              M_TO1[T] := dm_rc.FDQryAnaliseitens.FindField('DESCRICAO').AsString + ' (' +  dm_rc.FDQryAnaliseitens.FindField('QUANTIDADE').AsString + ')';
            end;
        end;

      if dm_rc.FDQryAnaliseitens.FindField('TIPO_PD').AsString = 'DOSN' then
        begin
          Inc(QTDE_D); Inc(TIPO_D);
          if dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'SS' then
            begin
              Inc(SD);  Inc(ED); Inc(PRAGA);
              M_SSD[SD] := dm_rc.FDQryAnaliseitens.FindField('DESCRICAO').AsString + ' (' +  dm_rc.FDQryAnaliseitens.FindField('QUANTIDADE').AsString  + ')';
            end;


          if dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NP' then
            begin
              Inc(PD);  Inc(ED);  Inc(PRAGA);
              M_PRD[PD] := dm_rc.FDQryAnaliseitens.FindField('DESCRICAO').AsString + ' (' +  dm_rc.FDQryAnaliseitens.FindField('QUANTIDADE').AsString + ')';
            end;

          if dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NT' then
            begin
              Inc(TD);  Inc(ED); Inc(PRAGA);
              M_TOD[TD] := dm_rc.FDQryAnaliseitens.FindField('DESCRICAO').AsString + ' (' +  dm_rc.FDQryAnaliseitens.FindField('QUANTIDADE').AsString + ')';
            end;
        end;

      dm_rc.FDQryAnaliseitens.Next;
    end;

  I := dm_rc.FDQryAnalise.FindField('TOTAL_OE').AsInteger +
       dm_rc.FDQryAnalise.FindField('TOTAL_SS').AsInteger +
       dm_rc.FDQryAnalise.FindField('TOTAL_TO').AsInteger +
       dm_rc.FDQryAnalise.FindField('TOTAL_PR').AsInteger;


  with ldm do
    begin

      with frxReport do
        begin
          Script.Variables['QTDE_P']  := variif(QTDE_P  > 0,'','-O-');
          Script.Variables['QTDE_D']  := variif(QTDE_D  > 0,'','-O-');
          Script.Variables['QTDE_PD'] := variif(QTDE_PD > 0,'','-O-');

          Script.Variables['NUMEROIR']             := dm_rc.FDQryProtocolo.FindField('NUMEROIR').AsString;
          Script.Variables['CULTIVAR']             := dm_rc.FDQryProtocolo.FindField('CULTIVAR').AsString;

          Script.Variables['ESPECIE_NOME']         := dm_rc.FDQryEspecie.FindField('POPULAR').AsString;
          Script.Variables['ESPECIE_ESPECIE']      := dm_rc.FDQryEspecie.FindField('SEMENTENOME').AsString;

          Script.Variables['CLINOME']              := tratanome(dm_rc.FDQryPessoas.FindField('NOME').AsString);
          Script.Variables['CLIENDERECO']          := tratanome(dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' ' +
                                                                dm_rc.FDQryPessoas.FindField('NUMERO').AsString   + ' ' +
                                                                dm_rc.FDQryPessoas.FindField('CIDADE').AsString)  + '-' + dm_rc.FDQryPessoas.FindField('ESTADO').AsString;

          Script.Variables['AMOSTRA']              := dm_rc.FDQryProtocolo.FindField('AMOSTRA').AsString;
          Script.Variables['LOTE']                 := dm_rc.FDQryProtocolo.FindField('LOTE').AsString;
          Script.Variables['EMISSAO']              := dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString;
          Script.Variables['SAFRA']                := dm_rc.FDQryProtocolo.FindField('SAFRAVALIDA').AsString;
          Script.Variables['PUREZA']               := FormatFloat('##,#0.0',dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_PERC').AsFloat);
          Script.Variables['PESOINICIAL']          := CasasDecimais(dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat);
          Script.Variables['INERTE']               := variif(dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat = 0,'-0-', FormatFloat('##,#0.0',dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat));
          Script.Variables['GERMINACAO']           := variif(dm_rc.FDQryGerminacao.FindField('PLANTULAS_NORMAIS').AsFloat   > 0, FormatFloat('##,###0',dm_rc.FDQryGerminacao.FindField('PLANTULAS_NORMAIS').AsFloat),'-0-');//variif(dm_rc.FDQryAnalise.FindField('MEDIA_SEMENTES_VIAVEIS').AsFloat = 0,'-0-',dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat);
          Script.Variables['TETRAZOLIO']           := variif(dm_rc.FDQryAnalise.FindField('MEDIA_SEMENTES_VIAVEIS').AsFloat = 0, '-0-',dm_rc.FDQryAnalise.FindField('MEDIA_SEMENTES_VIAVEIS').AsFloat);

          Script.Variables['PMS']                  := variif(dm_rc.FDQryPMS.RecordCount                       >  0,dm_rc.FDQryPMS.FindField('MEDIA_8').AsFloat,      '-0-');
          Script.Variables['VE']                   := variif(dm_rc.FDQryAnalise.FindField('TOTAL_VE').AsFloat >  0,dm_rc.FDQryAnalise.FindField('TOTAL_VE').AsFloat, '-0-');
          Script.Variables['DESC_INFEST']          := DESC_INFEST.Text;


          Script.Variables['SNR']                  := variif(M_ANARENA = 'Analise',AnalisaOS(PRAGA,dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_KG').AsFloat,TIPO_P,TIPO_D),'-N-');

          Script.Variables['VE_REVESTIDAS']        := variif(dm_rc.FDQryProtocolo.FindField('PMS').AsString = 'T',
                                                          ' SEMENTES REVESTIDAS ' +
                                                          ' % sementes puras = % pelotas puras e % de outras sementes = % sementes não revestidas','');
          Script.Variables['VE_OBSERVACAO']        := variif(dm_rc.FDQryProtocolo.FindField('VE').AsString = 'T',
                                                          dm_rc.FDQryAnalise.FindField('OBS_VE').AsString,'');


          Script.Variables['EMPMUM']               := dm_rc.tbempresas.FindField('CIDADE').AsString;
          Script.Variables['EMPESTADO']            := dm_rc.tbempresas.FindField('UF').AsString;

          Script.Variables['EMPNOM']               := dm_rc.tbempresas.FindField('NOME').AsString;
          Script.Variables['ENDERECO']             := tratanome(dm_rc.tbempresas.FindField('ENDERECO').AsString + ' nº ' + dm_rc.tbempresas.FindField('NUMERO').AsString + ' ' + dm_rc.tbempresas.FindField('BAIRRO').AsString);
          Script.Variables['CIDADE']               := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString);
          Script.Variables['ESTADO']               := dm_rc.tbempresas.FindField('UF').AsString;
          Script.Variables['RENASEM']              := dm_rc.tbempresas.FindField('RENASEM').AsString;

          Script.Variables['TELEFONE']             := dm_rc.tbempresas.FindField('TELEFONE').AsString + ' ' + dm_rc.tbempresas.FindField('CELULAR').AsString;
          Script.Variables['OBSERVACOES']          := variif(dm_rc.FDQryAnalise.FindField('OBSERVACOES').AsString = '','-0-',
                                                          dm_rc.FDQryAnalise.FindField('OBSERVACOES').AsString);

          Script.Variables['MES']                  := variif(dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString <>'',ExtensoMes(StrToInt(FormatDateTime('mm',dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsDateTime))),'');
          Script.Variables['ANO']                  := variif(dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString <>'',StrToFloat(StrRight(dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString,4)),'');
          Script.Variables['DIA']                  := variif(dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString <>'',StrToFloat(StrLeft( dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString,2)),'');

          Script.Variables['VALIDADE']             := '27/04/2023';

          Script.Variables['SS1']                                := variif(length(StrAllTrim(M_SS1[1])) > 0,'SS - '+M_SS1[1],'');
          Script.Variables['SS2']                                := variif(length(StrAllTrim(M_SS1[2])) > 0,','+M_SS1[2],'');
          Script.Variables['SS3']                                := variif(length(StrAllTrim(M_SS1[3])) > 0,','+M_SS1[3],'');
          Script.Variables['SS4']                                := variif(length(StrAllTrim(M_SS1[4])) > 0,','+M_SS1[4],'');
          Script.Variables['SS5']                                := variif(length(StrAllTrim(M_SS1[5])) > 0,','+M_SS1[5],'');
          Script.Variables['SS6']                                := variif(length(StrAllTrim(M_SS1[6])) > 0,','+M_SS1[6],'');
          Script.Variables['SS7']                                := variif(length(StrAllTrim(M_SS1[7])) > 0,','+M_SS1[7],'');
          Script.Variables['SS8']                                := variif(length(StrAllTrim(M_SS1[8])) > 0,','+M_SS1[8],'');
          Script.Variables['SS9']                                := variif(length(StrAllTrim(M_SS1[9])) > 0,','+M_SS1[9],'');

          Script.Variables['ST1']                                := variif(length(StrAllTrim(M_TO1[1])) > 0,'NT - '+M_TO1[1],'');
          Script.Variables['ST2']                                := variif(length(StrAllTrim(M_TO1[2])) > 0,','+M_TO1[2],'');
          Script.Variables['ST3']                                := variif(length(StrAllTrim(M_TO1[3])) > 0,','+M_TO1[3],'');
          Script.Variables['ST4']                                := variif(length(StrAllTrim(M_TO1[4])) > 0,','+M_TO1[4],'');
          Script.Variables['ST5']                                := variif(length(StrAllTrim(M_TO1[5])) > 0,','+M_TO1[5],'');
          Script.Variables['ST6']                                := variif(length(StrAllTrim(M_TO1[6])) > 0,','+M_TO1[6],'');
          Script.Variables['ST7']                                := variif(length(StrAllTrim(M_TO1[7])) > 0,','+M_TO1[7],'');
          Script.Variables['ST8']                                := variif(length(StrAllTrim(M_TO1[8])) > 0,','+M_TO1[8],'');
          Script.Variables['ST9']                                := variif(length(StrAllTrim(M_TO1[9])) > 0,','+M_TO1[9],'');

          Script.Variables['SP1']                                := variif(length(StrAllTrim(M_PR1[1])) > 0,'NP - '+M_PR1[1],'');
          Script.Variables['SP2']                                := variif(length(StrAllTrim(M_PR1[2])) > 0,','+M_PR1[2],'');
          Script.Variables['SP3']                                := variif(length(StrAllTrim(M_PR1[3])) > 0,','+M_PR1[3],'');
          Script.Variables['SP4']                                := variif(length(StrAllTrim(M_PR1[4])) > 0,','+M_PR1[4],'');
          Script.Variables['SP5']                                := variif(length(StrAllTrim(M_PR1[5])) > 0,','+M_PR1[5],'');
          Script.Variables['SP6']                                := variif(length(StrAllTrim(M_PR1[6])) > 0,','+M_PR1[6],'');
          Script.Variables['SP7']                                := variif(length(StrAllTrim(M_PR1[7])) > 0,','+M_PR1[7],'');
          Script.Variables['SP8']                                := variif(length(StrAllTrim(M_PR1[8])) > 0,','+M_PR1[8],'');
          Script.Variables['SP9']                                := variif(length(StrAllTrim(M_PR1[9])) > 0,','+M_PR1[9],'');

          Script.Variables['OE1']                                := variif(length(StrAllTrim(M_OE1[1])) > 0,'OEC - '+M_OE1[1],'');
          Script.Variables['OE2']                                := variif(length(StrAllTrim(M_OE1[2])) > 0,','+M_OE1[2],'');
          Script.Variables['OE3']                                := variif(length(StrAllTrim(M_OE1[3])) > 0,','+M_OE1[3],'');
          Script.Variables['OE4']                                := variif(length(StrAllTrim(M_OE1[4])) > 0,','+M_OE1[4],'');
          Script.Variables['OE5']                                := variif(length(StrAllTrim(M_OE1[5])) > 0,','+M_OE1[5],'');
          Script.Variables['OE6']                                := variif(length(StrAllTrim(M_OE1[6])) > 0,','+M_OE1[6],'');
          Script.Variables['OE7']                                := variif(length(StrAllTrim(M_OE1[7])) > 0,','+M_OE1[7],'');
          Script.Variables['OE8']                                := variif(length(StrAllTrim(M_OE1[8])) > 0,','+M_OE1[8],'');
          Script.Variables['OE9']                                := variif(length(StrAllTrim(M_OE1[9])) > 0,','+M_OE1[9],'');

          //**************************************************************************//
          // NOCIVAS DOSN
          //**************************************************************************//
          Script.Variables['SS1D']                                     := variif(length(StrAllTrim(M_SSD[1])) > 0,'SS - '+M_SSD[1],'');
          Script.Variables['SS2D']                                     := variif(length(StrAllTrim(M_SSD[2])) > 0,','+M_SSD[2],'');
          Script.Variables['SS3D']                                     := variif(length(StrAllTrim(M_SSD[3])) > 0,','+M_SSD[3],'');
          Script.Variables['SS4D']                                     := variif(length(StrAllTrim(M_SSD[4])) > 0,','+M_SSD[4],'');
          Script.Variables['SS5D']                                     := variif(length(StrAllTrim(M_SSD[5])) > 0,','+M_SSD[5],'');
          Script.Variables['SS6D']                                     := variif(length(StrAllTrim(M_SSD[6])) > 0,','+M_SSD[6],'');
          Script.Variables['SS7D']                                     := variif(length(StrAllTrim(M_SSD[7])) > 0,','+M_SSD[7],'');
          Script.Variables['SS8D']                                     := variif(length(StrAllTrim(M_SSD[8])) > 0,','+M_SSD[8],'');
          Script.Variables['SS9D']                                     := variif(length(StrAllTrim(M_SSD[9])) > 0,','+M_SSD[9],'');

          Script.Variables['ST1D']                                   := variif(length(StrAllTrim(M_TOD[1])) > 0,'NT - '+M_TOD[1],'');
          Script.Variables['ST2D']                                   := variif(length(StrAllTrim(M_TOD[2])) > 0,','+M_TOD[2],'');
          Script.Variables['ST3D']                                   := variif(length(StrAllTrim(M_TOD[3])) > 0,','+M_TOD[3],'');
          Script.Variables['ST4D']                                   := variif(length(StrAllTrim(M_TOD[4])) > 0,','+M_TOD[4],'');
          Script.Variables['ST5D']                                   := variif(length(StrAllTrim(M_TOD[5])) > 0,','+M_TOD[5],'');
          Script.Variables['ST6D']                                   := variif(length(StrAllTrim(M_TOD[6])) > 0,','+M_TOD[6],'');
          Script.Variables['ST7D']                                   := variif(length(StrAllTrim(M_TOD[7])) > 0,','+M_TOD[7],'');
          Script.Variables['ST8D']                                   := variif(length(StrAllTrim(M_TOD[8])) > 0,','+M_TOD[8],'');
          Script.Variables['ST9D']                                   := variif(length(StrAllTrim(M_TOD[9])) > 0,','+M_TOD[9],'');

          Script.Variables['SP1D']                                   := variif(length(StrAllTrim(M_PRD[1])) > 0,'NP - '+M_PRD[1],'');
          Script.Variables['SP2D']                                   := variif(length(StrAllTrim(M_PRD[2])) > 0,','+M_PRD[2],'');
          Script.Variables['SP3D']                                   := variif(length(StrAllTrim(M_PRD[3])) > 0,','+M_PRD[3],'');
          Script.Variables['SP4D']                                   := variif(length(StrAllTrim(M_PRD[4])) > 0,','+M_PRD[4],'');
          Script.Variables['SP5D']                                   := variif(length(StrAllTrim(M_PRD[5])) > 0,','+M_PRD[5],'');
          Script.Variables['SP6D']                                   := variif(length(StrAllTrim(M_PRD[6])) > 0,','+M_PRD[6],'');
          Script.Variables['SP7D']                                   := variif(length(StrAllTrim(M_PRD[7])) > 0,','+M_PRD[7],'');
          Script.Variables['SP8D']                                   := variif(length(StrAllTrim(M_PRD[8])) > 0,','+M_PRD[8],'');
          Script.Variables['SP9D']                                   := variif(length(StrAllTrim(M_PRD[9])) > 0,','+M_PRD[9],'');
          //**************************************************************************//

          Script.Variables['RT_NOME']                                := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['RT_RENASEM']                             := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
          Script.Variables['RT_NOMECLATURA']                         := variif(dm_rc.FDQryResponsavel.FindField('SUBSTITUTO').AsString = 'T','Responsável Técnico Substituto','Responsável Técnico');
          Script.Variables['RESPNOM']                                := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['CREA']                                   := dm_rc.FDQryResponsavel.FindField('CREA').AsString;
          Script.Variables['RESPRENASEM']                            := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;

        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'laboratorio_informativopms.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function LABORATORIO_Levantamento (dataini,datafin,dataref:string;empresa,responsavel:Integer;table:TFDMemTable)  :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaRTLaboratorio('SELECT * FROM RESPONSAVEL WHERE CODIGO = ' + IntToStr(responsavel));
  TabelaEmpresas     ('SELECT * FROM EMPRESAS    WHERE CODIGO = ' + IntToStr(empresa));


  with ldm do
    begin

      with frxReport do
        begin
          Script.Variables['EMPNOME']          := dm_rc.tbempresas.FindField('NOME').AsString;
          Script.Variables['EMPNOME_TOP']      := dm_rc.tbempresas.FindField('NOME').AsString;
          Script.Variables['EMPFANTASIA']      := dm_rc.tbempresas.FindField('DESCRICAO').AsString;
          Script.Variables['EMPENDERECO']      := PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' ' + dm_rc.tbempresas.FindField('NUMERO').AsString;
          Script.Variables['EMPCIDADE']        := PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('CIDADE').AsString);
          Script.Variables['EMPESTADO']        := dm_rc.tbempresas.FindField('UF').AsString;
          Script.Variables['EMPCEP']           := FORMATA_CEP(dm_rc.tbempresas.FindField('CEP').AsString);
          Script.Variables['EMPTELEFONE']      := dm_rc.tbempresas.FindField('TELEFONE').AsString + ' ' + dm_rc.tbempresas.FindField('CELULAR').AsString;
          Script.Variables['EMPEMAIL']         := dm_rc.tbempresas.FindField('EMAIL').AsString;
          Script.Variables['RENASEM']          := dm_rc.tbempresas.FindField('RENASEM').AsString;
          Script.Variables['MES']              := ExtensoMes( StrToInt(FormatDateTime('mm', StrToDate(dataini))));
          Script.Variables['ANO']              := StrToFloat(StrRight(dataref,4));

          Script.Variables['MES_ANO']          := ExtensoMes( StrToInt(FormatDateTime('mm', StrToDate(dataref))));
          Script.Variables['ANO_ANO']          := StrToFloat(StrRight(dataref,4));
          Script.Variables['DIA']              := StrToFloat(StrLeft(dataref,2));

          Script.Variables['LOCAL']            := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + '/' + dm_rc.tbempresas.FindField('UF').AsString;

          Script.Variables['RT_NOME']          := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['RT_RENASEM']       := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
          Script.Variables['RT_NOMECLATURA']   := variif(dm_rc.FDQryResponsavel.FindField('SUBSTITUTO').AsString = 'T','Responsável Técnico Substituto','Responsável Técnico');
          Script.Variables['RESPNOM']          := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['CREA']             := dm_rc.FDQryResponsavel.FindField('CREA').AsString;
          Script.Variables['RESPRENASEM']      := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDatasetLevantamento.DataSet         := table;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'laboratorio_Levantamento.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;

function LABORATORIO_Demonstrativo (dataini,datafin,dataref:string;empresa,responsavel:Integer;table:TFDMemTable)  :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaRTLaboratorio('SELECT * FROM RESPONSAVEL WHERE CODIGO = ' + IntToStr(responsavel));
  TabelaEmpresas     ('SELECT * FROM EMPRESAS    WHERE CODIGO = ' + IntToStr(empresa));


  with ldm do
    begin

      with frxReport do
        begin
          Script.Variables['EMPFAN']           := dm_rc.tbempresas.FindField('DESCRICAO').AsString;
          Script.Variables['EMPNOME']          := dm_rc.tbempresas.FindField('NOME').AsString;
          Script.Variables['EMPENDERECO']      := PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' ' + dm_rc.tbempresas.FindField('NUMERO').AsString;
          Script.Variables['EMPCIDADE']        := PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('CIDADE').AsString);
          Script.Variables['EMPESTADO']        := dm_rc.tbempresas.FindField('UF').AsString;
          Script.Variables['EMPCEP']           := FORMATA_CEP(dm_rc.tbempresas.FindField('CEP').AsString);
          Script.Variables['EMPTELEFONE']      := dm_rc.tbempresas.FindField('TELEFONE').AsString + ' ' + dm_rc.tbempresas.FindField('CELULAR').AsString;
          Script.Variables['EMPEMAIL']         := dm_rc.tbempresas.FindField('EMAIL').AsString;
          Script.Variables['RENASEM']          := dm_rc.tbempresas.FindField('RENASEM').AsString;

          Script.Variables['MES']              := ExtensoMes( StrToInt(FormatDateTime('mm', StrToDate(dataini))));
          Script.Variables['ANO']              := StrToFloat(StrRight(dataref,4));

          Script.Variables['MES_ANO']          := ExtensoMes( StrToInt(FormatDateTime('mm', StrToDate(dataref))));
          Script.Variables['ANO_ANO']          := StrToFloat(StrRight(dataref,4));
          Script.Variables['DIA']              := StrToFloat(StrLeft(dataref,2));

          Script.Variables['LOCAL']            := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + '/' + dm_rc.tbempresas.FindField('UF').AsString;
          Script.Variables['NPAGINAS']         := IntToStr(frxReport.PreviewPages.Count);


          Script.Variables['RT_NOME']          := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['RT_RENASEM']       := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
          Script.Variables['RT_NOMECLATURA']   := variif(dm_rc.FDQryResponsavel.FindField('SUBSTITUTO').AsString = 'T','Responsável Técnico Substituto','Responsável Técnico');
          Script.Variables['RESPNOM']          := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['CREA']             := dm_rc.FDQryResponsavel.FindField('CREA').AsString;
          Script.Variables['RESPRENASEM']      := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := table;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'laboratorio_demonstrativo.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function LABORATORIO_RAM          (mes,ano:string;empresa,responsavel:Integer;table:TFDMemTable)           :string;
  var
  JAN_REC, FEV_REC, MAR_REC, ABR_REC, MAI_REC, JUN_REC, JUL_REC, AGO_REC, SET_REC, OUT_REC, NOV_REC, DEZ_REC : Real;
  JAN_PRO, FEV_PRO, MAR_PRO, ABR_PRO, MAI_PRO, JUN_PRO, JUL_PRO, AGO_PRO, SET_PRO, OUT_PRO, NOV_PRO, DEZ_PRO : Real;

begin
  JAN_REC := 0; FEV_REC := 0; MAR_REC := 0; MAI_REC := 0; JUN_REC := 0; JUL_REC := 0; AGO_REC := 0; SET_REC := 0; OUT_REC := 0; NOV_REC := 0; DEZ_REC := 0;
  JAN_PRO := 0; FEV_PRO := 0; MAR_PRO := 0; MAI_PRO := 0; JUN_PRO := 0; JUL_PRO := 0; AGO_PRO := 0; SET_PRO := 0; OUT_PRO := 0; NOV_PRO := 0; DEZ_PRO := 0;

  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaRTLaboratorio('SELECT * FROM RESPONSAVEL WHERE CODIGO = ' + IntToStr(responsavel));
  TabelaEmpresas     ('SELECT * FROM EMPRESAS    WHERE CODIGO = ' + IntToStr(empresa));

  table.First;
  while not table.Eof do
    begin
      if table.FindField('MES').AsString = 'Jan' then
        JAN_REC := table.FindField('JAN_REC').AsFloat;
      if table.FindField('MES').AsString = 'Fev' then
        FEV_REC := table.FindField('FEV_REC').AsFloat;
      if table.FindField('MES').AsString = 'Mar' then
        MAR_REC := table.FindField('MAR_REC').AsFloat;
      if table.FindField('MES').AsString = 'Abr' then
        ABR_REC := table.FindField('ABR_REC').AsFloat;
      if table.FindField('MES').AsString = 'Mai' then
        MAI_REC := table.FindField('MAI_REC').AsFloat;
      if table.FindField('MES').AsString = 'Jun' then
        JUN_REC := table.FindField('JUN_REC').AsFloat;
      if table.FindField('MES').AsString = 'Jul' then
        JUL_REC := table.FindField('JUL_REC').AsFloat;
      if table.FindField('MES').AsString = 'Ago' then
        AGO_REC := table.FindField('AGO_REC').AsFloat;
      if table.FindField('MES').AsString = 'Set' then
        SET_REC := table.FindField('SET_REC').AsFloat;
      if table.FindField('MES').AsString = 'Out' then
        OUT_REC := table.FindField('OUT_REC').AsFloat;
      if table.FindField('MES').AsString = 'Nov' then
        NOV_REC := table.FindField('NOV_REC').AsFloat;
      if table.FindField('MES').AsString = 'Dez' then
        DEZ_REC := table.FindField('DEZ_REC').AsFloat;

      // AMOSTRAS PROCESSADAS
      if table.FindField('MES').AsString = 'Jan' then
        JAN_PRO := table.FindField('JAN_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Fev' then
        FEV_PRO := table.FindField('FEV_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Mar' then
        MAR_PRO := table.FindField('MAR_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Abr' then
        ABR_PRO := table.FindField('ABR_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Mai' then
        MAI_PRO := table.FindField('MAI_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Jun' then
        JUN_PRO := table.FindField('JUN_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Jul' then
        JUL_PRO := table.FindField('JUL_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Ago' then
        AGO_PRO := table.FindField('AGO_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Set' then
        SET_PRO := table.FindField('SET_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Out' then
        OUT_PRO := table.FindField('OUT_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Nov' then
        NOV_PRO := table.FindField('NOV_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Dez' then
        DEZ_PRO := table.FindField('DEZ_PRO').AsFloat;

      table.Next;
    end;


  with ldm do
    begin

      with frxReport do
        begin
          Script.Variables['EMPNOME']          := dm_rc.tbempresas.FindField('NOME').AsString;

          Script.Variables['JAN_REC']           := variif(JAN_REC > 0,JAN_REC,'');
          Script.Variables['FEV_REC']           := variif(FEV_REC > 0,FEV_REC,'');
          Script.Variables['MAR_REC']           := variif(MAR_REC > 0,MAR_REC,'');
          Script.Variables['ABR_REC']           := variif(ABR_REC > 0,ABR_REC,'');
          Script.Variables['MAI_REC']           := variif(MAI_REC > 0,MAI_REC,'');
          Script.Variables['JUN_REC']           := variif(JUN_REC > 0,JUN_REC,'');
          Script.Variables['JUL_REC']           := variif(JUL_REC > 0,JUL_REC,'');
          Script.Variables['AGO_REC']           := variif(AGO_REC > 0,AGO_REC,'');
          Script.Variables['SET_REC']           := variif(SET_REC > 0,SET_REC,'');
          Script.Variables['OUT_REC']           := variif(OUT_REC > 0,OUT_REC,'');
          Script.Variables['NOV_REC']           := variif(NOV_REC > 0,NOV_REC,'');
          Script.Variables['DEZ_REC']           := variif(DEZ_REC > 0,DEZ_REC,'');

          Script.Variables['JAN_PRO']           := variif(JAN_PRO > 0,JAN_PRO,'');
          Script.Variables['FEV_PRO']           := variif(FEV_PRO > 0,FEV_PRO,'');
          Script.Variables['MAR_PRO']           := variif(MAR_PRO > 0,MAR_PRO,'');
          Script.Variables['ABR_PRO']           := variif(ABR_PRO > 0,ABR_PRO,'');
          Script.Variables['MAI_PRO']           := variif(MAI_PRO > 0,MAI_PRO,'');
          Script.Variables['JUN_PRO']           := variif(JUN_PRO > 0,JUN_PRO,'');
          Script.Variables['JUL_PRO']           := variif(JUL_PRO > 0,JUL_PRO,'');
          Script.Variables['AGO_PRO']           := variif(AGO_PRO > 0,AGO_PRO,'');
          Script.Variables['SET_PRO']           := variif(SET_PRO > 0,SET_PRO,'');
          Script.Variables['OUT_PRO']           := variif(OUT_PRO > 0,OUT_PRO,'');
          Script.Variables['NOV_PRO']           := variif(NOV_PRO > 0,NOV_PRO,'');
          Script.Variables['DEZ_PRO']           := variif(DEZ_PRO > 0,DEZ_PRO,'');

          Script.Variables['TOTAL_REC']         := JAN_REC + FEV_REC + MAR_REC + ABR_REC + MAI_REC + NOV_REC +
                                                   JUN_REC + JUL_REC + AGO_REC + SET_REC + OUT_REC + DEZ_REC;

          Script.Variables['TOTAL_PRO']         := JAN_PRO + FEV_PRO + MAR_PRO + ABR_PRO + MAI_PRO + NOV_PRO +
                                                   JUN_PRO + JUL_PRO + AGO_PRO + SET_PRO + OUT_PRO + DEZ_PRO;


        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := table;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'laboratorio_ram.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;

end;
function LABORATORIO_SEMRENASEM   (dataini,datafin:string;empresa,responsavel:Integer;table:TFDMemTable)          :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaRTLaboratorio('SELECT * FROM RESPONSAVEL WHERE CODIGO = ' + IntToStr(responsavel));
  TabelaEmpresas     ('SELECT * FROM EMPRESAS    WHERE CODIGO = ' + IntToStr(empresa));

  with ldm do
    begin

      with frxReport do
        begin
          Script.Variables['EMISSAO']                   := dataini;
          Script.Variables['FANTASIA']                  := dm_rc.tbempresas.FindField('DESCRICAO').AsString;

          Script.Variables['EMP_NOME']                  := PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('NOME').AsString);
          Script.Variables['EMP_CNPJ']                  := dm_rc.tbempresas.FindField('CNPJ').AsString;
          Script.Variables['EMP_RENASEM']               := dm_rc.tbempresas.FindField('RENASEM').AsString;
          Script.Variables['EMP_ENDERECO']              := PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' nº ' + dm_rc.tbempresas.FindField('NUMERO').AsString + ' ' + PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('BAIRRO').AsString);
          Script.Variables['EMP_TELEFONE']              := dm_rc.tbempresas.FindField('TELEFONE').AsString + ' ' + dm_rc.tbempresas.FindField('CELULAR').AsString;
          Script.Variables['EMP_EMAIL']                 := LowerCase(dm_rc.tbempresas.FindField('EMAIL').AsString);
          Script.Variables['EMP_CIDADE']                := PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('CIDADE').AsString);
          Script.Variables['EMP_ESTADO']                := dm_rc.tbempresas.FindField('UF').AsString;
          Script.Variables['EMP_CEP']                   := FORMATA_CEP(dm_rc.tbempresas.FindField('CEP').AsString);
          Script.Variables['MES_ANO']                   := ExtensoMes( StrToInt(FormatDateTime('mm',StrToDate(dataini)))) + '/' + StrRight(dataini,4);

          Script.Variables['MES']                       := ExtensoMes( StrToInt(FormatDateTime('mm',StrToDate(dataini))));
          Script.Variables['ANO']                       := StrToFloat(StrRight(dataini,4));

          Script.Variables['MES_ANO1']                  := ExtensoMes( StrToInt(FormatDateTime('mm',StrToDate(dataini))));
          Script.Variables['ANO_ANO']                   := StrToFloat(StrRight(DateToStr(DATE),4));
          Script.Variables['DIA']                       := StrToFloat(StrLeft(DateToStr(DATE),2));

          Script.Variables['LOCAL']                     := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + '/' + dm_rc.tbempresas.FindField('UF').AsString;

        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := table;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'laboratorio_semrenasem.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function LABORATORIO_ENTRADAS (dataini,datafin:string;empresa:Integer;table:TFDMemTable)          :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas     ('SELECT * FROM EMPRESAS    WHERE CODIGO = ' + IntToStr(empresa));

  with ldm do
    begin

      with frxReport do
        begin
          Script.Variables['EMPNOM']   := dm_rc.tbempresas.FindField('NOME').AsString;
          Script.Variables['NPAGINAS'] := IntToStr(PreviewPages.Count);
        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := table;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'laboratorio_relentradas.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function NOTA_ContratoTranporte   (empresa,numero,documento:Integer)                            :string;
var
  tabela : TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  tabela                 := CriaMemoria('CONTRATO_NOTA');

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(empresa));
  TabelaMvmestre  (' SELECT * FROM MVMESTRE WHERE NUMERO    = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa));

  TabelaMvitens   (' SELECT * FROM MVITENS WHERE NUMERO     = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa)  +
                   ' ORDER BY SEQUENCIA');

  TabelaPessoas   (' SELECT * FROM PESSOAS WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));
  TabelaTransporte(' SELECT * FROM TRANSPORTES WHERE CODIGO = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('TRANSPORTADORA').AsInteger));

  tabela.Close;
  tabela.Open;

  dm_rc.tbmvitens.First;
  while not dm_rc.tbmvitens.Eof do
    begin
      tabela.Append;
      tabela.FindField('PRODUTO').AsInteger      := dm_rc.tbmvitens.FindField('PRODUTO').AsInteger;
      tabela.FindField('DESCRICAO').AsString     := dm_rc.tbmvitens.FindField('DESCRICAO').AsString;
      tabela.FindField('QUANTIDADE').AsFloat     := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
      tabela.FindField('PESOSACO').AsFloat       := dm_rc.tbmvitens.FindField('PESOSACO').AsFloat;

      if dm_rc.tbmvitens.FindField('PESOSACO').AsFloat > 0 then
        tabela.FindField('QUANTIDADESACO').AsFloat := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat / dm_rc.tbmvitens.FindField('PESOSACO').AsFloat;

      tabela.Post;

      dm_rc.tbmvitens.Next;
    end;

  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['EMPFAN']        := dm_rc.tbempresas.FindField('FANTASIA').AsString;
          frxReport.Script.Variables['EMPNOM']        := dm_rc.tbempresas.FindField('NOME').AsString;

          frxReport.Script.Variables['SAINUM']        := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;
          frxReport.Script.Variables['SAIDTE']        := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;

          frxReport.Script.Variables['CLINOM']        := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          frxReport.Script.Variables['CLICNP']        := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          frxReport.Script.Variables['CLIBAR']        := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['CLITLR']        := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['CLIEDR']        := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['CLIUFR']        := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['CLIMUR']        := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['CLIIES']        := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['CLICPR']        := dm_rc.FDQryPessoas.FindField('CEP').AsString;

          frxReport.Script.Variables['TRANOM']        := dm_rc.FDQryTransportes.FindField('NOME').AsString;
          frxReport.Script.Variables['TRAEND']        := dm_rc.FDQryTransportes.FindField('ENDERECO').AsString + ' nº ' + dm_rc.FDQryTransportes.FindField('NUMERO').AsString + ' ' +
                                                         dm_rc.FDQryTransportes.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['TRAINSCRICAO']  := dm_rc.FDQryTransportes.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['TRACPF']        := Formata_Cnpj(dm_rc.FDQryTransportes.FindField('CPFCNPJ').AsString);
          frxReport.Script.Variables['TRACIDADE']     := dm_rc.FDQryTransportes.FindField('CIDADE').AsString + ' - ' + dm_rc.FDQryTransportes.FindField('ESTADO').AsString;
          frxReport.Script.Variables['TRAPLACA']      := dm_rc.FDQryTransportes.FindField('PLACA').AsString  + ' - ' + dm_rc.FDQryTransportes.FindField('PLACAESTADO').AsString;
          frxReport.Script.Variables['TRATELEFONE']   := dm_rc.FDQryTransportes.FindField('TELEFONE').AsString;
        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := tabela;


      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'contrato_transporte_agronagai.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('PictureLogo')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function NOTA_ControleEtiqueta    (empresa,numero,documento:Integer)                            :string;
var
  tabela : TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  tabela                 := CriaMemoria('CONTRATO_NOTA');

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(empresa));
  TabelaMvmestre  (' SELECT * FROM MVMESTRE WHERE NUMERO    = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa));

  TabelaMvitens   (' SELECT * FROM MVITENS WHERE NUMERO     = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa)  +
                   ' ORDER BY SEQUENCIA');

  TabelaPessoas   (' SELECT * FROM PESSOAS WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));
  TabelaTransporte(' SELECT * FROM TRANSPORTES WHERE CODIGO = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('TRANSPORTADORA').AsInteger));

  tabela.Close;
  tabela.Open;

  dm_rc.tbmvitens.First;
  while not dm_rc.tbmvitens.Eof do
    begin
      tabela.Append;
      tabela.FindField('PRODUTO').AsInteger      := dm_rc.tbmvitens.FindField('PRODUTO').AsInteger;
      tabela.FindField('DESCRICAO').AsString     := dm_rc.tbmvitens.FindField('DESCRICAO').AsString;
      tabela.FindField('QUANTIDADE').AsFloat     := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
      tabela.FindField('LOTE').AsString          := dm_rc.tbmvitens.FindField('LOTESEMENTE').AsString;
      tabela.FindField('PESOSACO').AsFloat       := dm_rc.tbmvitens.FindField('PESOSACO').AsFloat;
      tabela.FindField('PESO').AsFloat           := dm_rc.tbmvitens.FindField('PESOSACO').AsFloat;

      if dm_rc.tbmvitens.FindField('PESOSACO').AsFloat > 0 then
        tabela.FindField('QUANTIDADESACO').AsFloat := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat / dm_rc.tbmvitens.FindField('PESOSACO').AsFloat;

      tabela.Post;

      dm_rc.tbmvitens.Next;
    end;

  with ldm do
    begin

      with frxReport do
        begin
          frxReport.Script.Variables['EMPFAN']  := dm_rc.tbempresas.FindField('DESCRICAO').AsString;
          frxReport.Script.Variables['EMPNOM']  := dm_rc.tbempresas.FindField('NOME').AsString;
          frxReport.Script.Variables['EMPEND']  := dm_rc.tbempresas.FindField('ENDERECO').AsString + ' - ' + dm_rc.tbempresas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['EMPBAR']  := dm_rc.tbempresas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['EMPMUN']  := dm_rc.tbempresas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['EMPCEP']  := FORMATA_CEP(dm_rc.tbempresas.FindField('CEP').AsString);
          frxReport.Script.Variables['EMPTEL']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPEMAIL']:= dm_rc.tbempresas.FindField('EMAIL').AsString;

          frxReport.Script.Variables['SAINUM']  := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;
          frxReport.Script.Variables['SAIDTE']  := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;

          frxReport.Script.Variables['CLINOM']  := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          frxReport.Script.Variables['CLICNP']  := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          frxReport.Script.Variables['CLIBAR']  := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['CLITLR']  := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['CLIEDR']  := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['CLIUFR']  := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['CLIMUR']  := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['CLIIES']  := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['CLIUFR']  := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['CLIFUN']  := Acha_Item('FUNCIONARIOS',dm_rc.FDQryMvmestre.FindField('FUNCIONARIO').AsString);
        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := tabela;


      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'controle_etiquetas.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('PictureLogo')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function PEDIDOORCAMENTO_ORCDiferente(empresa,numero,documento:Integer)                            :string;
var
  itens,financeiro : TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(empresa));
  TabelaMvmestre  (' SELECT * FROM MVMESTRE WHERE NUMERO    = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa));
  TabelaOperacao  ('select * from operacoes where codigo    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('OPERACAO').AsInteger));

  TabelaMvitens   (' SELECT * FROM MVITENS WHERE NUMERO     = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa)  +
                   ' ORDER BY SEQUENCIA');

  TabelaPessoas   (' SELECT * FROM PESSOAS WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));
  SqlPesquisa     (' select * from                            ' + variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'receber ','pagar ')+
                                                                                    'where numero                          = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                                                                                    'and documento                         = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                                                                                    'and empresa                           = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger));


  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['EMPFAN']  := dm_rc.tbempresas.FindField('FANTASIA').AsString;
          frxReport.Script.Variables['EMPMUN']  := dm_rc.tbempresas.FindField('CIDADE').AsString + '/' + dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['EMPCNPJ'] := dm_rc.tbempresas.FindField('CNPJ').AsString;
          frxReport.Script.Variables['EMPINS']  := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['EMPTEL']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPEND']  := dm_rc.tbempresas.FindField('ENDERECO').AsString + ' - ' + dm_rc.tbempresas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['EMPFAX']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPCEL']  := dm_rc.tbempresas.FindField('CELULAR').AsString;
          frxReport.Script.Variables['EMPCEP']  := dm_rc.tbempresas.FindField('CEP').AsString;
          frxReport.Script.Variables['EMPBAR']  := dm_rc.tbempresas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['EMPSITE'] := dm_rc.tbempresas.FindField('SMTP').AsString;
          frxReport.Script.Variables['EMPEMA']  := dm_rc.tbempresas.FindField('SITE').AsString;
          frxReport.Script.Variables['EMPEMAIL']:= dm_rc.tbempresas.FindField('EMAIL').AsString;
          frxReport.Script.Variables['PEDIDO_TALAO']     := dm_rc.FDQryMvmestre.FindField('PEDIDO').AsString;

          frxReport.Script.Variables['CLIFUN']  := Acha_Item('FUNCIONARIOS',dm_rc.FDQryMvmestre.FindField('FUNCIONARIO').AsString);


          frxReport.Script.Variables['SAINUM']  := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;
          frxReport.Script.Variables['SAIDTE']  := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;

          if dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger = 4 then
            frxReport.Script.Variables['CLITIP']  := 'PEDIDOS'
          else
          if dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger = 3 then
            frxReport.Script.Variables['CLITIP']  := 'ORÇAMENTO';

          frxReport.Script.Variables['CLINOM']  := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          frxReport.Script.Variables['CLICNP']  := dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString;
          frxReport.Script.Variables['CLIBAR']  := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['CLIIBG']  := dm_rc.FDQryPessoas.FindField('IBGE').AsString;
          frxReport.Script.Variables['CLITLR']  := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['CLIEDR']  := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['CLIUFR']  := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['CLIMUR']  := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['CLIIES']  := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['CLICPR']  := dm_rc.FDQryPessoas.FindField('CEP').AsString;

          frxReport.Script.Variables['CLIEDR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_ENDERECO').AsString + ' ' + dm_rc.FDQryMvmestre.FindField('ENTREGA_NUMERO').AsString;
          frxReport.Script.Variables['CLIUFR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_ESTADO').AsString;
          frxReport.Script.Variables['CLIMUR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_CIDADE').AsString;
          frxReport.Script.Variables['CLICPR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString;
          frxReport.Script.Variables['CLIBAR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_BAIRRO').AsString;
          frxReport.Script.Variables['CLIEDR_CEPENTREGA']:= FORMATA_CEP(dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString);


          frxReport.Script.Variables['DESCRICAO_PRO']       := dm_rc.tbmvitens.FindField('DESCRICAO').AsString;
          frxReport.Script.Variables['CODIGO_PRO']          := dm_rc.tbmvitens.FindField('CODIGO').AsInteger;

          frxReport.Script.Variables['VISTA']               := dm_rc.tbmvitens.FindField('PRECO').AsFloat;
          frxReport.Script.Variables['P30']                 := MRound((dm_rc.tbmvitens.FindField('PRECO').AsFloat * Acha_perc_Condicao(337)) + dm_rc.tbmvitens.FindField('PRECO').AsFloat,2);
          frxReport.Script.Variables['P3060']               := MRound((dm_rc.tbmvitens.FindField('PRECO').AsFloat * Acha_perc_Condicao(338)) + dm_rc.tbmvitens.FindField('PRECO').AsFloat,2);
          frxReport.Script.Variables['P306090']             := MRound((dm_rc.tbmvitens.FindField('PRECO').AsFloat * Acha_perc_Condicao(339)) + dm_rc.tbmvitens.FindField('PRECO').AsFloat,2);
          frxReport.Script.Variables['P306090120']          := MRound((dm_rc.tbmvitens.FindField('PRECO').AsFloat * Acha_perc_Condicao(440)) + dm_rc.tbmvitens.FindField('PRECO').AsFloat,2);
          frxReport.Script.Variables['P306090120150']       := MRound((dm_rc.tbmvitens.FindField('PRECO').AsFloat * Acha_perc_Condicao(441)) + dm_rc.tbmvitens.FindField('PRECO').AsFloat,2);
          frxReport.Script.Variables['P306090120150180']    := MRound((dm_rc.tbmvitens.FindField('PRECO').AsFloat * Acha_perc_Condicao(442)) + dm_rc.tbmvitens.FindField('PRECO').AsFloat,2);
          frxReport.Script.Variables['PACIMA']              := MRound((dm_rc.tbmvitens.FindField('PRECO').AsFloat * Acha_perc_Condicao(444)) + dm_rc.tbmvitens.FindField('PRECO').AsFloat,2);

          frxReport.Script.Variables['BVISTA']              := dm_rc.tbmvitens.FindField('PRECO').AsFloat;
          frxReport.Script.Variables['BP30']                := MRound((dm_rc.tbmvitens.FindField('PRECO').AsFloat * Acha_perc_Condicao(445)) + dm_rc.tbmvitens.FindField('PRECO').AsFloat,2);
          frxReport.Script.Variables['BP3060']              := MRound((dm_rc.tbmvitens.FindField('PRECO').AsFloat * Acha_perc_Condicao(446)) + dm_rc.tbmvitens.FindField('PRECO').AsFloat,2);
          frxReport.Script.Variables['BP306090']            := MRound((dm_rc.tbmvitens.FindField('PRECO').AsFloat * Acha_perc_Condicao(447)) + dm_rc.tbmvitens.FindField('PRECO').AsFloat,2);
          frxReport.Script.Variables['BP306090120']         := MRound((dm_rc.tbmvitens.FindField('PRECO').AsFloat * Acha_perc_Condicao(448)) + dm_rc.tbmvitens.FindField('PRECO').AsFloat,2);
          frxReport.Script.Variables['BP306090120150']      := MRound((dm_rc.tbmvitens.FindField('PRECO').AsFloat * Acha_perc_Condicao(449)) + dm_rc.tbmvitens.FindField('PRECO').AsFloat,2);
          frxReport.Script.Variables['BP306090120150180']   := MRound((dm_rc.tbmvitens.FindField('PRECO').AsFloat * Acha_perc_Condicao(550)) + dm_rc.tbmvitens.FindField('PRECO').AsFloat,2);

          frxReport.Script.Variables['PESOTOTAL']           := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
        end;


      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
//      frxDBDataset.DataSet                     := itens;


      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'orcamentofuturo_pastofort.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;

end;
function PEDIDOORCAMENTO_impressao(empresa,numero,documento:Integer)                            :string;
var
  itens,financeiro : TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  itens                  := CriaMemoria('CONTRATO_NOTA');
  financeiro             := CriaMemoria('VNC');

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(empresa));
  TabelaMvmestre  (' SELECT * FROM MVMESTRE WHERE NUMERO    = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa));
  TabelaOperacao  ('select * from operacoes where codigo    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('OPERACAO').AsInteger));

  TabelaMvitens   (' SELECT * FROM MVITENS WHERE NUMERO     = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa)  +
                   ' ORDER BY SEQUENCIA');

  TabelaPessoas   (' SELECT * FROM PESSOAS WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));
  SqlPesquisa     (' select * from                            ' + variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'receber ','pagar ')+
                                                                                    'where numero                          = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                                                                                    'and documento                         = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                                                                                    'and empresa                           = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger));


  itens.Close;
  itens.Open;

  dm_rc.tbmvitens.First;
  while not dm_rc.tbmvitens.Eof do
    begin
      itens.Append;
      itens.FindField('PRODUTO').AsInteger      := dm_rc.tbmvitens.FindField('PRODUTO').AsInteger;
      itens.FindField('DESCRICAO').AsString     := dm_rc.tbmvitens.FindField('DESCRICAO').AsString +
                                                   variif(dm_rc.tbmvitens.FindField('PEDIDOITEMOR').AsString <> '',
                                                   ' --- Pedido nº ' + dm_rc.tbmvitens.FindField('PEDIDOOR').AsString + '  ' +
                                                   ' Item nº   ' + dm_rc.tbmvitens.FindField('PEDIDOITEMOR').AsString,'') ;
      itens.FindField('QUANTIDADE').AsFloat     := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
      itens.FindField('PRECO').AsFloat          := dm_rc.tbmvitens.FindField('PRECO').AsFloat;
      itens.FindField('TOTAL').AsFloat          := dm_rc.tbmvitens.FindField('TOTAL').AsFloat;
      itens.FindField('LOTE').AsString          := dm_rc.tbmvitens.FindField('LOTESEMENTE').AsString;
      itens.FindField('UNIDADE').AsString       := dm_rc.tbmvitens.FindField('UNIDADE').AsString;
      itens.FindField('PESOSACO').AsFloat       := dm_rc.tbmvitens.FindField('PESOSACO').AsFloat;

      if dm_rc.tbmvitens.FindField('PESOSACO').AsString <> '' then
        begin
          if itens.FindField('PESOSACO').AsFloat > 0 then
            itens.FindField('QTDESACO').AsFloat :=  itens.FindField('QUANTIDADE').AsFloat / itens.FindField('PESOSACO').AsFloat
          else
            itens.FindField('QTDESACO').AsFloat :=  0;
        end;

      itens.Post;

      dm_rc.tbmvitens.Next;
    end;

  financeiro.Close;
  financeiro.Open;

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      financeiro.Append;
      financeiro.FindField('NUMERO').AsInteger       := dm_rc.sqlBuscas.FindField('NUMERO').AsInteger;
      financeiro.FindField('SEQUENCIA').AsInteger    := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsInteger;
      financeiro.FindField('TOTAL').AsFloat          := dm_rc.sqlBuscas.FindField('VALORATUAL').AsFloat;
      financeiro.FindField('VENCIMENTO').AsDateTime  := dm_rc.sqlBuscas.FindField('VENCIMENTO').AsDateTime;
      financeiro.Post;

      dm_rc.sqlBuscas.Next;
    end;

  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['EMPFAN']  := dm_rc.tbempresas.FindField('FANTASIA').AsString;
          frxReport.Script.Variables['EMPMUN']  := dm_rc.tbempresas.FindField('CIDADE').AsString + '/' + dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['EMPCNPJ'] := dm_rc.tbempresas.FindField('CNPJ').AsString;
          frxReport.Script.Variables['EMPINS']  := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['EMPTEL']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPEND']  := dm_rc.tbempresas.FindField('ENDERECO').AsString + ' - ' + dm_rc.tbempresas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['EMPFAX']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPCEL']  := dm_rc.tbempresas.FindField('CELULAR').AsString;
          frxReport.Script.Variables['EMPCEP']  := dm_rc.tbempresas.FindField('CEP').AsString;
          frxReport.Script.Variables['EMPBAR']  := dm_rc.tbempresas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['EMPSITE'] := dm_rc.tbempresas.FindField('SMTP').AsString;
          frxReport.Script.Variables['EMPEMA']  := dm_rc.tbempresas.FindField('SITE').AsString;
          frxReport.Script.Variables['EMPEMAIL']:= dm_rc.tbempresas.FindField('EMAIL').AsString;
          frxReport.Script.Variables['CLIFUN']  := Acha_Item('FUNCIONARIOS',dm_rc.FDQryMvmestre.FindField('FUNCIONARIO').AsString);


          frxReport.Script.Variables['SAINUM']  := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;
          frxReport.Script.Variables['SAIDTE']  := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;

          if dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger = 4 then
            frxReport.Script.Variables['CLITIP']  := 'PEDIDOS'
          else
          if dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger = 3 then
            frxReport.Script.Variables['CLITIP']  := 'ORÇAMENTO';

          frxReport.Script.Variables['CLINOM']  := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          frxReport.Script.Variables['CLICNP']  := dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString;
          frxReport.Script.Variables['CLIBAR']  := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['CLIIBG']  := dm_rc.FDQryPessoas.FindField('IBGE').AsString;
          frxReport.Script.Variables['CLITLR']  := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['CLIEDR']  := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['CLIUFR']  := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['CLIMUR']  := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['CLIIES']  := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['CLICPR']  := dm_rc.FDQryPessoas.FindField('CEP').AsString;

          frxReport.Script.Variables['PGTO']             := Acha_Item('CONDICOES',dm_rc.FDQryMvmestre.FindField('CONDICAO').AsString);
          frxReport.Script.Variables['SAIVLP']           := dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsString;
          frxReport.Script.Variables['SAIDES']           := dm_rc.FDQryMvmestre.FindField('VLRDESCONTOS').AsFloat;
          frxReport.Script.Variables['SAIVLN']           := dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat;
          frxReport.Script.Variables['SAIOB1']           := dm_rc.FDQryMvmestre.FindField('OBSERVACOES').AsString;
          frxReport.Script.Variables['PEDIDO_TALAO']     := dm_rc.FDQryMvmestre.FindField('PEDIDO').AsString;

          frxReport.Script.Variables['CLIEDR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_ENDERECO').AsString + ' ' + dm_rc.FDQryMvmestre.FindField('ENTREGA_NUMERO').AsString;
          frxReport.Script.Variables['CLIUFR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_ESTADO').AsString;
          frxReport.Script.Variables['CLIMUR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_CIDADE').AsString;
          frxReport.Script.Variables['CLICPR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString;
          frxReport.Script.Variables['CLIBAR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_BAIRRO').AsString;
          frxReport.Script.Variables['CLIEDR_CEPENTREGA']:= FORMATA_CEP(dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString);

          frxReport.Script.Variables['SAIOB1']     := dm_rc.FDQryMvmestre.FindField('OBSPEDIDO').AsString;
        end;


      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := itens;
      frxDBDatasetTitulos.DataSet              := financeiro;


      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'pedidoorcamento_pastofort.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function SEMENTES_Termo(empresa,controle,assinado:Integer;adt,termo:string)                :string;
  var
   data     : string;
   mes, ano : Integer;
   tp_g,tp_v: Integer;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := CriaMemoria('TERMO');

  TabelaEmpresas    (' SELECT * FROM EMPRESAS     WHERE CODIGO     = ' + IntToStr(empresa));
  TabelaSementes    (' SELECT * FROM SEMENTES     WHERE TERMO      = ' + QuotedStr(termo));
  TabelaResponsavel (' SELECT * FROM RESPONSAVEL  WHERE CODIGO     = ' + IntToStr(dm_rc.fdqrysementes.FindField('RESPONSAVEL').AsInteger));
  TabelaLaboratorio (' SELECT * FROM LABORATORIO  WHERE CODIGO     = ' + IntToStr(dm_rc.fdqrysementes.FindField('LABORATORIO').AsInteger));
  TabelaSementes_BAS(' SELECT * FROM SEMENTES_BAS WHERE MESTRE_ID  = ' + IntToStr(dm_rc.fdqrysementes.FindField('CODIGO').AsInteger));

  tp_g := 0; tp_v := 0;

  dm_rc.fdqrysementes.First;
  while not dm_rc.fdqrysementes.Eof do
    begin

      memoria.Append;

      mes  := StrToInt(FormatDateTime('MM'  , dm_rc.fdqrysementes.FindField('VALIDADE').AsDateTime));
      ano  := StrToInt(FormatDateTime('YYYY', dm_rc.fdqrysementes.FindField('VALIDADE').AsDateTime));
      data := IntToStr(mes) + '/' + IntToStr(ano);

      memoria.FindField('LOTE').AsString               := dm_rc.fdqrysementes.Findfield('LOTE').AsString;
      memoria.FindField('PESO').AsFloat                := dm_rc.fdqrysementes.Findfield('PESOEMBALAGEM').AsFloat;
      memoria.FindField('BOLETIM').AsString            := dm_rc.fdqrysementes.Findfield('BOLETIM').AsString;
      memoria.FindField('DATABOLETIM').AsString        := dm_rc.fdqrysementes.Findfield('RECEBIDA').AsString;
      memoria.FindField('PUREZA').AsFloat              := dm_rc.fdqrysementes.Findfield('ANALISEPURA').AsFloat;

      if dm_rc.fdqrysementes.Findfield('GERNORMAIS').AsFloat > 0 then
        begin
          memoria.FindField('GERMINACAO').AsFloat        := dm_rc.fdqrysementes.Findfield('GERNORMAIS').AsFloat;
          tp_g                                           := 1;
          tp_v                                           := 0;
        end
      else
        begin
          memoria.FindField('GERMINACAO').AsFloat        := dm_rc.fdqrysementes.Findfield('TETRAZOLIO').AsFloat;
          tp_g                                           := 0;
          tp_v                                           := 1;
        end;

      memoria.FindField('SEMDURAS').AsFloat            := dm_rc.fdqrysementes.Findfield('SEMDURAS').AsFloat;
      memoria.FindField('VALIDADEGERMINACAO').AsString := data;
      memoria.FindField('EMBALAGEM').AsString          := dm_rc.fdqrysementes.Findfield('NSACOS').AsString;
      memoria.FindField('CODIGO').AsInteger            := dm_rc.fdqrysementes.Findfield('CODIGO').AsInteger;

      memoria.FindField('OE').AsString                 := variif(dm_rc.fdqrysementes.Findfield('OUTCULTIVAR').AsString = '','0',dm_rc.fdqrysementes.Findfield('OUTCULTIVAR').AsString) ;
      memoria.FindField('SS').AsFloat                  := dm_rc.fdqrysementes.Findfield('SEMSILVESTRES').AsFloat;
      memoria.FindField('PN').AsString                 := variif(dm_rc.fdqrysementes.Findfield('PENEIRA').AsString = '','-',dm_rc.fdqrysementes.Findfield('PENEIRA').AsString);
      memoria.FindField('SNT').AsFloat                 := dm_rc.fdqrysementes.Findfield('SEMTOLERADAS').AsFloat;
      memoria.FindField('SI').AsFloat                  := dm_rc.fdqrysementes.Findfield('SEMPROIBIDAS').AsFloat;
      memoria.FindField('RP').AsFloat                  := 0;

      if dm_rc.fdqrysementes_bas.RecordCount > 0 then
        begin
          memoria.FindField('SILVESTRES').AsFloat          := dm_rc.fdqrysementes_bas.Findfield('OSN_SS').AsFloat;
          memoria.FindField('NOCIVAS').AsFloat             := dm_rc.fdqrysementes_bas.Findfield('OSN_TO').AsFloat;
          memoria.FindField('CULTIVADAS').AsFloat          := dm_rc.fdqrysementes_bas.Findfield('OSN_OEC').AsFloat;
        end
      else
        begin
          memoria.FindField('SILVESTRES').AsFloat          := dm_rc.fdqrysementes.Findfield('SEMSILVESTRES').AsFloat;
          memoria.FindField('NOCIVAS').AsFloat             := dm_rc.fdqrysementes.Findfield('SEMPROIBIDAS').AsFloat;
          memoria.FindField('CULTIVADAS').AsFloat          := dm_rc.fdqrysementes.Findfield('SEMTOLERADAS').AsFloat;
        end;


      memoria.Post;

      dm_rc.fdqrysementes.Next;
    end;
  dm_rc.fdqrysementes.First;


  with ldm do
    begin
      with frxReport do
        begin

          TabelaProdutos('select sementenome, cultivar from produtos where codigo = ' + IntToStr(dm_rc.fdqrysementes.FindField('PRODUTO').AsInteger));

          frxReport.Script.Variables['TERMO']       := dm_rc.fdqrysementes.FindField('TERMO').AsString;

          if StrContains('08606807000184',dm_rc.tbempresas.FindField('CNPJ').AsString) then
            frxReport.Script.Variables['ESPECIE']     := 'Semente ' + dm_rc.FDQryProdutos.FindField('SEMENTENOME').AsString
          else
            frxReport.Script.Variables['ESPECIE']     := dm_rc.FDQryProdutos.FindField('SEMENTENOME').AsString;

          frxReport.Script.Variables['CULTIVAR']    := dm_rc.FDQryProdutos.FindField('CULTIVAR').AsString;
          frxReport.Script.Variables['CATEGORIA']   := dm_rc.fdqrysementes.FindField('CATEGORIA').AsString;
          frxReport.Script.Variables['SAFRA']       := dm_rc.fdqrysementes.FindField('SAFRAVALIDA').AsString;

          frxReport.Script.Variables['EMPFAN']      := dm_rc.tbempresas.FindField('FANTASIA').AsString;
          frxReport.Script.Variables['RESPNOM']     := tratanome(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          frxReport.Script.Variables['RESPCPF']     := Formata_Cnpj(dm_rc.FDQryResponsavel.FindField('CPFCNPJ').AsString);
          frxReport.Script.Variables['RESPEND']     := tratanome(dm_rc.FDQryResponsavel.FindField('ENDERECO').AsString) + ' ' + dm_rc.FDQryResponsavel.FindField('NUMERO').AsString;
          frxReport.Script.Variables['RESPTEL']     := dm_rc.FDQryResponsavel.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['RESPBAIRRO']  := tratanome(dm_rc.FDQryResponsavel.FindField('BAIRRO').AsString);
          frxReport.Script.Variables['RESPEMAIL']   := dm_rc.FDQryResponsavel.FindField('EMAIL').AsString;
          frxReport.Script.Variables['RESPCIDADE']  := tratanome(dm_rc.FDQryResponsavel.FindField('CIDADE').AsString) + ' ' + dm_rc.FDQryResponsavel.FindField('ESTADO').AsString;
          frxReport.Script.Variables['RESPCEP']     := Formata_Cep(dm_rc.FDQryResponsavel.FindField('CEP').AsString);
          frxReport.Script.Variables['RESPINC']     := dm_rc.FDQryResponsavel.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['RESPRENASEM'] := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;

          frxReport.Script.Variables['CREA']        := dm_rc.FDQryResponsavel.FindField('CREA').AsString;

          frxReport.Script.Variables['EMPNOM']      := tratanome(dm_rc.tbempresas.FindField('NOME').AsString);
          frxReport.Script.Variables['EMPCPF']      := Formata_Cnpj(dm_rc.tbempresas.FindField('CNPJ').AsString);
          frxReport.Script.Variables['EMPINS']      := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['EMPRENA']     := dm_rc.tbempresas.FindField('RENASEM').AsString;
          frxReport.Script.Variables['EMPEND']      := tratanome(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' ' + dm_rc.tbempresas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['EMPMUN']      := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString);
          frxReport.Script.Variables['EMPCEP']      := Formata_Cep(dm_rc.tbempresas.FindField('CEP').AsString);
          frxReport.Script.Variables['EMPUF']       := dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['LOCAL']       := Trocarletra(tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString)) + ' - ' + dm_rc.tbempresas.FindField('ESTADO').AsString;

          frxReport.Script.Variables['RESPNOME']    := tratanome(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          frxReport.Script.Variables['LABNOME']     := tratanome (dm_rc.fdqrylaboratorio.FindField('NOME').AsString);
          frxReport.Script.Variables['LABESTADO']   := NomeEstado(dm_rc.fdqrylaboratorio.FindField('ESTADO').AsString);
          frxReport.Script.Variables['LABRENASEM']  := dm_rc.fdqrylaboratorio.FindField('CREDENCIAL').AsString;

          frxReport.Script.Variables['TP_V']        := varIIF(tp_v = 1,'x','');
          frxReport.Script.Variables['TP_G']        := varIIF(tp_g = 1,'x','');


          if adt = 'S' then
            begin
              frxReport.Script.Variables['DIA']         := FormatDateTime('dd',dm_rc.fdqrysementes_bas.FindField('RECEBIMENTO_DATA').AsDateTime);
              frxReport.Script.Variables['MES']         := ExtensoMes(StrToInt(FormatDateTime('mm',dm_rc.fdqrysementes_bas.FindField('RECEBIMENTO_DATA').AsDateTime)));
              frxReport.Script.Variables['ANO']         := FormatDateTime('yyyy',dm_rc.fdqrysementes_bas.FindField('RECEBIMENTO_DATA').AsDateTime);
            end
          else
            begin
              frxReport.Script.Variables['DIA']         := FormatDateTime('dd',dm_rc.fdqrysementes.FindField('RECEBIDA').AsDateTime);
              frxReport.Script.Variables['MES']         := ExtensoMes(StrToInt(FormatDateTime('mm',dm_rc.fdqrysementes.FindField('RECEBIDA').AsDateTime)));
              frxReport.Script.Variables['ANO']         := FormatDateTime('yyyy',dm_rc.fdqrysementes.FindField('RECEBIDA').AsDateTime);
            end;


          frxReport.Script.Variables['EMPENDERECO'] := tratanome(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' ' + dm_rc.tbempresas.FindField('NUMERO').AsString + ' ' +
                                                       tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + ' - ' + dm_rc.tbempresas.FindField('ESTADO').AsString;;

          frxReport.Script.Variables['EMPTEL']      := tratanome(dm_rc.tbempresas.FindField('TELEFONE').AsString);
          frxReport.Script.Variables['REEMBALADA']  := varIIF(dm_rc.fdqrysementes.FindField('REEMBALADA').AsString = 'T','*Semente Reembalada','');

          frxReport.Script.Variables['OBS_SEMENTES']:= dm_rc.fdqrysementes.FindField('OBSERVACOES').AsString + ' ' +
                                                       variif(dm_rc.fdqrysementes_bas.RecordCount > 0,
                                                              dm_rc.fdqrysementes_bas.FindField('OBSERVACOES').AsString + ' ' +
                                                              dm_rc.fdqrysementes_bas.FindField('OBS_NOCIVAS').AsString + ' ' +
                                                              dm_rc.fdqrysementes_bas.FindField('OBS_MATERIALINERTE').AsString,'');

          frxReport.Script.Variables['TIPO_EMPRESA']:= 'PRODUTOR/REEMBALADOR';

{
          if dm_rc.fdqrysementes.FindField('REEMBALADA').AsString = 'T' then
            begin
              frxReport.Script.Variables['TIPO_EMPRESA']     := 'REEMBALADOR';
            end
          else
            begin
              frxReport.Script.Variables['TIPO_EMPRESA']     := 'PRODUTOR';
            end;
}
          if adt = 'S' then
            begin
              frxReport.Script.Variables['TERMO']            := dm_rc.fdqrysementes.FindField('TERMO').AsString;
              frxReport.Script.Variables['TERMO_DATA']       := dm_rc.fdqrysementes.FindField('TERMO_DATA').AsString;
              frxReport.Script.Variables['CERTIFICADO_DATA'] := dm_rc.fdqrysementes.FindField('CERTIFICADO_DATA').AsString;
              frxReport.Script.Variables['CERTIFICADO']      := dm_rc.fdqrysementes.FindField('CERTIFICADO').AsString;
              frxReport.Script.Variables['OP_TERMO']         := varIIF(dm_rc.fdqrysementes.FindField('OP_TERMO').AsInteger       = 1,'X','');
              frxReport.Script.Variables['OP_CERTIFICADO']   := varIIF(dm_rc.fdqrysementes.FindField('OP_CERTIFICADO').AsInteger = 1,'X','');
            end;
        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := memoria;

      frxReport.Clear;

      if (StrContains('00948261000138',dm_rc.tbempresas.FindField('CNPJ').AsString)) and ( adt = 'S') then
        frxReport.LoadFromFile(mm.M_FASTREPORT+'termoaditivo_sementeira_duvalle.fr3')
      else
      if adt = 'S' then
        frxReport.LoadFromFile(mm.M_FASTREPORT+'termoaditivo_sementeira.fr3')
      else
        begin
          frxReport.LoadFromFile(mm.M_FASTREPORT+'termo_conformidade_selegram.fr3')
        end;

      if assinado = 0 then
        TfrxPictureView(frxReport.FindComponent('assinatura')).Visible := False
      else
        begin
          TfrxPictureView(frxReport.FindComponent('assinatura')).Picture.CleanupInstance;
          TfrxPictureView(frxReport.FindComponent('assinatura')).Visible := True;
          TfrxPictureView(frxReport.FindComponent('assinatura')).Picture.LoadFromFile(dm_rc.FDQryResponsavel.FindField('ASSINATURA').AsString);
        end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;


  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_Duplicata      (empresa,controle,parcela:integer)                            :string;
var
  ACBrExtensoDuplicata      : TACBrExtenso;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := CriaMemoria('DUPLICATAMERCANTIL');
  ACBrExtensoDuplicata   := TACBrExtenso.Create(NIL);

  TabelaEmpresas    (' SELECT * FROM EMPRESAS WHERE CODIGO     = ' + IntToStr(empresa));

  if parcela <> 0 then
    begin
      TabelaReceber     (' SELECT * FROM RECEBER  WHERE CODIGO     = ' + IntToStr(controle)   +
                         ' AND SEQUENCIA                           = ' + IntToStr(parcela));
      TabelaPessoas     (' SELECT * FROM PESSOAS  WHERE CODIGO     = ' + IntToStr(dm_rc.tbreceber.FindField('PESSOA').AsInteger));
      TabelaMvmestre    (' SELECT * FROM MVMESTRE WHERE NUMERO     = ' + IntToStr(dm_rc.tbreceber.FindField('NUMERO').AsInteger) +
                         ' AND DOCUMENTO                           = ' + IntToStr(dm_rc.tbreceber.FindField('DOCUMENTO').AsInteger));
    end
  else
    begin

      TabelaMvmestre    (' SELECT * FROM MVMESTRE WHERE CODIGO     = ' + IntToStr(controle));
      TabelaPessoas     (' SELECT * FROM PESSOAS  WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));
      TabelaReceber     (' SELECT * FROM RECEBER  WHERE NUMERO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)   +
                         ' AND                          DOCUMENTO  = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger)+
                         ' ORDER BY SEQUENCIA');
    end;


  if dm_rc.tbreceber.RecordCount > 0 then
    begin
      memoria.Close;
      memoria.Open;

      dm_rc.tbreceber.First;
      while not dm_rc.tbreceber.Eof do
        begin
          Inc(I);

          ACBrExtensoDuplicata.Valor                    := dm_rc.tbreceber.FindField('VALORATUAL').AsFloat;
          memoria.Append;
          memoria.FindField('MEMNUM').AsString          := dm_rc.tbreceber.FindField('NUMERO').AsString;
          memoria.FindField('MEMDTE').AsString          := dm_rc.tbreceber.FindField('EMISSAO').AsString;
          memoria.FindField('MEMVCT').AsString          := dm_rc.tbreceber.FindField('VENCIMENTO').AsString;
          memoria.FindField('MEMORD') .AsString         := dm_rc.tbreceber.FindField('SEQUENCIA').AsString;
          memoria.FindField('MEMVALORPARCELA').AsString := dm_rc.tbreceber.FindField('VALORATUAL').AsString;
          memoria.FindField('MEMNOM').AsString          := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          memoria.FindField('MEMVALORTOTAL').AsString   := varIIF(dm_rc.FDQryMvmestre.RecordCount > 0,dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsString,dm_rc.tbreceber.FindField('VALORORIGINAL').AsString);
          memoria.FindField('MEMVALORFINAL').AsString   := varIIF(dm_rc.FDQryMvmestre.RecordCount > 0,dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsString,dm_rc.tbreceber.FindField('VALORORIGINAL').AsString);
          memoria.FindField('MEMPEDIDO').AsString       := dm_rc.tbreceber.FindField('PEDIDO').AsString;
          memoria.FindField('EXTENSAO').AsString        := ACBrExtensoDuplicata.Texto;
          memoria.Post;

          dm_rc.tbreceber.Next;
        end;
    end;

  with ldm do
    begin
      with frxReport do
        begin
            frxReport.Script.Variables['EMPNOM']        := dm_rc.tbempresas.FindField('NOME').AsString;
            frxReport.Script.Variables['EMPMUN']        := dm_rc.tbempresas.FindField('CIDADE').AsString;
            frxReport.Script.Variables['EMPTEL']        := dm_rc.tbempresas.FindField('TELEFONE').AsString;
            frxReport.Script.Variables['EMPEND']        := dm_rc.tbempresas.FindField('ENDERECO').AsString;
            frxReport.Script.Variables['EMPFAX']        := dm_rc.tbempresas.FindField('CELULAR').AsString;
            frxReport.Script.Variables['EMPCEP']        := Formata_Cep(dm_rc.tbempresas.FindField('CEP').AsString);
            frxReport.Script.Variables['EMPBAR']        := dm_rc.tbempresas.FindField('BAIRRO').AsString;
            frxReport.Script.Variables['EMPIES']        := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
            frxReport.Script.Variables['EMPCNPJ']       := dm_rc.tbempresas.FindField('CNPJ').AsString;

            if StrContains('52070356000103',dm_rc.tbempresas.FindField('CNPJ').AsString) then
              begin
                if dm_rc.FDQryPessoas.FindField('ENDERECOCOBRANCA').AsString <> '' then
                  begin
                    frxReport.Script.Variables['CLINOM']        := dm_rc.FDQryPessoas.FindField('NOME').AsString;
                    frxReport.Script.Variables['CLICNP']        := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
                    frxReport.Script.Variables['CLIIBG']        := dm_rc.FDQryPessoas.FindField('IBGE').AsString;
                    frxReport.Script.Variables['CLIEMA']        := dm_rc.FDQryPessoas.FindField('EMAIL').AsString;
                    frxReport.Script.Variables['SAIOB1']        := '';
                    frxReport.Script.Variables['CLITLR']        := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
                    frxReport.Script.Variables['CLIEDR']        := dm_rc.FDQryPessoas.FindField('ENDERECOCOBRANCA').AsString + ' n. ' +dm_rc.FDQryPessoas.FindField('NUMEROCOBRANCA').AsString;
                    frxReport.Script.Variables['CLIUFR']        := dm_rc.FDQryPessoas.FindField('ESTADOCOBRANCA').AsString;
                    frxReport.Script.Variables['CLIMUR']        := dm_rc.FDQryPessoas.FindField('CIDADECOBRANCA').AsString;
                    frxReport.Script.Variables['CLIIES']        := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
                    frxReport.Script.Variables['CLIUFR']        := dm_rc.FDQryPessoas.FindField('ESTADOCOBRANCA').AsString;
                    frxReport.Script.Variables['CLIBAR']        := dm_rc.FDQryPessoas.FindField('BAIRROCOBRANCA').AsString;
                    frxReport.Script.Variables['CLICPR']        := Formata_Cep(dm_rc.FDQryPessoas.FindField('CEPCOBRANCA').AsString);
                  end
                else
                  begin
                    frxReport.Script.Variables['CLINOM']        := dm_rc.FDQryPessoas.FindField('NOME').AsString;
                    frxReport.Script.Variables['CLICNP']        := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
                    frxReport.Script.Variables['CLIBAR']        := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
                    frxReport.Script.Variables['CLIIBG']        := dm_rc.FDQryPessoas.FindField('IBGE').AsString;
                    frxReport.Script.Variables['CLIEMA']        := dm_rc.FDQryPessoas.FindField('EMAIL').AsString;
                    frxReport.Script.Variables['SAIOB1']        := '';
                    frxReport.Script.Variables['CLITLR']        := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
                    frxReport.Script.Variables['CLIEDR']        := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' n. ' +dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
                    frxReport.Script.Variables['CLIUFR']        := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
                    frxReport.Script.Variables['CLIMUR']        := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
                    frxReport.Script.Variables['CLIIES']        := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
                    frxReport.Script.Variables['CLIUFR']        := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
                    frxReport.Script.Variables['CLICPR']        := Formata_Cep(dm_rc.FDQryPessoas.FindField('CEP').AsString);
                  end;
              end
            else
              begin
                frxReport.Script.Variables['CLINOM']        := dm_rc.FDQryPessoas.FindField('NOME').AsString;
                frxReport.Script.Variables['CLICNP']        := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
                frxReport.Script.Variables['CLIBAR']        := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
                frxReport.Script.Variables['CLIIBG']        := dm_rc.FDQryPessoas.FindField('IBGE').AsString;
                frxReport.Script.Variables['CLIEMA']        := dm_rc.FDQryPessoas.FindField('EMAIL').AsString;
                frxReport.Script.Variables['SAIOB1']        := '';//dm_rc.FDQryPessoas.FindField('MEMINSTRUCAO').AsString;
                frxReport.Script.Variables['CLITLR']        := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
                frxReport.Script.Variables['CLIEDR']        := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' n. ' +dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
                frxReport.Script.Variables['CLIUFR']        := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
                frxReport.Script.Variables['CLIMUR']        := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
                frxReport.Script.Variables['CLIIES']        := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
                frxReport.Script.Variables['CLIUFR']        := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
                frxReport.Script.Variables['CLICPR']        := Formata_Cep(dm_rc.FDQryPessoas.FindField('CEP').AsString);
              end;

            ACBrExtensoDuplicata.Valor                  := memoria.FindField('MEMVALORTOTAL').AsFloat;
            frxReport.Script.Variables['SAINUM']        := memoria.FindField('MEMNUM').AsString;
            frxReport.Script.Variables['SAIDTE']        := memoria.FindField('MEMDTE').AsString;
            frxReport.Script.Variables['TOTAL']         := memoria.FindField('MEMVALORTOTAL').AsString;

          frxPDFExport.Author                 := 'Sistema Sisgraos';
          frxPDFExport.Creator                := 'Sisgraos';
          frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
          frxPDFExport.FileName               := M_ARQUIVO;
          frxPDFExport.OpenAfterExport        := False;
          frxPDFExport.ShowDialog             := False;
          frxPDFExport.ShowProgress           := False;
          frxPDFExport.OverwritePrompt        := False;

          frxDBDataset.DataSet                := memoria;

          frxReport.Clear;
          if StrContains('52070356000103',dm_rc.tbempresas.FindField('CNPJ').AsString) then
            frxReport.LoadFromFile(mm.M_FASTREPORT+'duplicata_mercantil_selegram.fr3')
          else
            frxReport.LoadFromFile(mm.M_FASTREPORT+'duplicata_mercantil.fr3');

          if (FileExists(mm.M_IMAGEM)) then
              begin
                TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
              end;

          frxReport.PrepareReport(True);
          frxReport.Export(frxPDFExport);
        end;
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_recibonotaVolume (empresa,controle:integer)                                    :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas    (' SELECT * FROM EMPRESAS WHERE CODIGO     = ' + IntToStr(empresa));
  TabelaMvmestre    (' SELECT * FROM MVMESTRE WHERE CODIGO     = ' + IntToStr(controle));
  TabelaPessoas     (' SELECT * FROM PESSOAS  WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));

  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['CLINOM']          := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          frxReport.Script.Variables['CLICNPJ']         := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          frxReport.Script.Variables['CIDADE']          := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['CLIRENASEM']      := dm_rc.FDQryPessoas.FindField('RENASEM').AsString;

          frxReport.Script.Variables['EMPNOM']          := dm_rc.tbempresas.FindField('FANTASIA').AsString;
          frxReport.Script.Variables['EMPCNPJ']         := Formata_Cnpj(dm_rc.tbempresas.FindField('CNPJ').AsString);
          frxReport.Script.Variables['NUMERONOTA']      := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;

          frxReport.Script.Variables['LOCAL']           := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + ' - ' + dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['MES']             := ExtensoMes( StrToInt(FormatDateTime('mm', dm_rc.FDQryMvmestre.FindField('EMISSAO').AsDateTime)));
          frxReport.Script.Variables['ANO']             := StrToFloat(StrRight(dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,4));
          frxReport.Script.Variables['DIA']             := StrToFloat(StrLeft( dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,2));
        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'recibonota_agronagai.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;


      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm        .Free;
  finally
    Result := M_ARQUIVO;
  end;

end;
function IMPRESSAO_recibonota       (empresa,controle:integer)                                    :string;
var
  ACBrExtenso: TACBrExtenso;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  ACBrExtenso            := TACBrExtenso.Create(nil);

  TabelaEmpresas    (' SELECT * FROM EMPRESAS WHERE CODIGO     = ' + IntToStr(empresa));
  TabelaMvmestre    (' SELECT * FROM MVMESTRE WHERE CODIGO     = ' + IntToStr(controle));
  TabelaPessoas     (' SELECT * FROM PESSOAS  WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));

  ACBrExtenso.Valor := dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat;

  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['CLINOM']          := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          frxReport.Script.Variables['CLICNPJ']         := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          frxReport.Script.Variables['CIDADE']          := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['CLIRENASEM']      := dm_rc.FDQryPessoas.FindField('RENASEM').AsString;

          frxReport.Script.Variables['EMPNOM']          := dm_rc.tbempresas.FindField('FANTASIA').AsString;
          frxReport.Script.Variables['EMPCNPJ']         := Formata_Cnpj(dm_rc.tbempresas.FindField('CNPJ').AsString);
          frxReport.Script.Variables['NUMERONOTA']      := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;
          frxReport.Script.Variables['VALORNOTA']       := FormatFloat('###,##0.00',dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat);
          frxReport.Script.Variables['EXTENSAOVALOR']   := ACBrExtenso.Texto;

          frxReport.Script.Variables['LOCAL']           := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + ' - ' + dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['MES']             := ExtensoMes( StrToInt(FormatDateTime('mm', dm_rc.FDQryMvmestre.FindField('EMISSAO').AsDateTime)));
          frxReport.Script.Variables['ANO']             := StrToFloat(StrRight(dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,4));
          frxReport.Script.Variables['DIA']             := StrToFloat(StrLeft( dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,2));
        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'recibonota_agronagai1.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;


      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm        .Free;
    ACBrExtenso.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_Autorizareembalo (empresa,controle:integer)                                    :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := CriaMemoria('MEMCAD');

  TabelaEmpresas    (' SELECT * FROM EMPRESAS WHERE CODIGO     = ' + IntToStr(empresa));
  TabelaMvmestre    (' SELECT * FROM MVMESTRE WHERE CODIGO     = ' + IntToStr(controle));
  TabelaMvitens     (' SELECT * FROM MVITENS  WHERE NUMERO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                     ' AND                          DOCUMENTO  = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                     ' ORDER BY SEQUENCIA');
  TabelaPessoas     (' SELECT * FROM PESSOAS  WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));

  memoria.Close;
  memoria.Open;

  dm_rc.tbmvitens.First;
  while not dm_rc.tbmvitens.Eof do
    begin
      TabelaProdutos('SELECT SEMENTENOME, CULTIVAR FROM PRODUTOS WHERE CODIGO = ' + IntToStr(dm_rc.tbmvitens.FindField('PRODUTO').AsInteger));

      memoria.Append;
      memoria.FindField('ESPECIE').AsString       := dm_rc.tbmvitens.FindField('DESCRICAO').AsString;
      memoria.FindField('CULTIVAR').AsString      := dm_rc.FDQryProdutos.FindField('CULTIVAR').AsString;
      memoria.FindField('CATEGORIA').AsString     := dm_rc.tbmvitens.FindField('CATEGORIA').AsString;
      memoria.FindField('LOTE').AsString          := dm_rc.tbmvitens.FindField('LOTESEMENTE').AsString;
      memoria.FindField('QUANTIDADE').AsFloat     := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
      memoria.FindField('TERMO').AsString         := dm_rc.tbmvitens.FindField('TERMOSEMENTE').AsString;
      memoria.FindField('NUMERONOTA').AsString    := dm_rc.tbmvitens.FindField('NUMERO').AsString;
      memoria.Post;

      dm_rc.tbmvitens.Next;
    end;


  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['EMPRESA']         := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          frxReport.Script.Variables['CLICNPJ']         := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          frxReport.Script.Variables['CLIIE']           := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['ENDERECO']        := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['CIDADE']          := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['CLIRENASEM']      := dm_rc.FDQryPessoas.FindField('RENASEM').AsString;
          frxReport.Script.Variables['ESTADO']          := NomeEstado(dm_rc.FDQryPessoas.FindField('ESTADO').AsString);
          frxReport.Script.Variables['NUMERONOTA']      := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;

          frxReport.Script.Variables['NOMEEMPRESA']     := dm_rc.tbempresas.FindField('NOME').AsString;
          frxReport.Script.Variables['RENASEM']         := dm_rc.tbempresas.FindField('RENASEM').AsString;
          frxReport.Script.Variables['EMPFAN']          := dm_rc.tbempresas.FindField('FANTASIA').AsString;
          frxReport.Script.Variables['EMPEND']          := dm_rc.tbempresas.FindField('ENDERECO').AsString + ' ' + dm_rc.tbempresas.FindField('NUMERO').AsString ;
          frxReport.Script.Variables['EMPBAR']          := dm_rc.tbempresas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['EMPMUN']          := dm_rc.tbempresas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['EMPCEP']          := FORMATA_CEP(dm_rc.tbempresas.FindField('CEP').AsString);
          frxReport.Script.Variables['EMPTEL']          := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPEMAIL']        := dm_rc.tbempresas.FindField('EMAIL').AsString;


          frxReport.Script.Variables['LOCAL']           := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + ' - ' + dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['MES1']            := ExtensoMes( StrToInt(FormatDateTime('mm', dm_rc.FDQryMvmestre.FindField('EMISSAO').AsDateTime)));
          frxReport.Script.Variables['ANO']             := StrToFloat(StrRight(dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,4));
          frxReport.Script.Variables['DIA']             := StrToFloat(StrLeft(dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,2));
        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'autorizacao_reembalo_agronagai.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('PictureLogo')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;


      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;

end;
function IMPRESSAO_DeclaracaoRET (empresa,controle:integer;nome,cpfcnpj:string)                        :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := CriaMemoria('MEMCAD');

  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(controle));
  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));
  TabelaPessoas( 'select * from pessoas where codigo  = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));

  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['EMPNOM']           := tratanome(dm_rc.tbempresas.FindField('NOME').AsString);
          frxReport.Script.Variables['EMPCNPJ']          := Formata_Cnpj(dm_rc.tbempresas.FindField('CNPJ').AsString);
          frxReport.Script.Variables['NUMERONOTA']       := tratanome(dm_rc.FDQryMvmestre.FindField('NUMERO').AsString);

          frxReport.Script.Variables['CLINOM']           := tratanome(dm_rc.FDQryPessoas.FindField('NOME').AsString);
          frxReport.Script.Variables['CLICNPJ']          := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);

          frxReport.Script.Variables['LOCAL']           := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + ' - ' + dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['MES']             := ExtensoMes( StrToInt(FormatDateTime('mm', dm_rc.FDQryMvmestre.FindField('EMISSAO').AsDateTime)));
          frxReport.Script.Variables['ANO']             := StrToFloat(StrRight(dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,4));
          frxReport.Script.Variables['DIA']             := StrToFloat(StrLeft(dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,2));

          frxReport.Script.Variables['TESTEMUNHANOME']  := tratanome(nome);
          frxReport.Script.Variables['TESTEMUNHACPF']   := Formata_Cnpj(cpfcnpj);

        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'declaracaoderetirada.fr3');

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    dm_rc.tbempresas.close;
    dm_rc.FDQryMvmestre.Close;
    dm_rc.FDQryPessoas.Close;
  finally
    Result := M_ARQUIVO;
  end;
end;

{
function RELATORIO_Financeiro               (tipo,dataini,datafin:string;empresa,agrupamento:Integer;table:TFDQuery)    :string;
var
  memoria           : TFDMemTable;
  ABERTO,PAGO,TOTAL : Real;
  descanenexo       : TStringList;
  vlrtotalanexo     : Real;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := TFDMemTable.Create(nil);
  memoria                := CriaMemoria('FINANCEIRO_SINTETICO');

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));

  memoria.Close;
  memoria.Open;

  ABERTO := 0;
  PAGO   := 0;
  TOTAL  := 0;

  table.First;
  while not table.Eof do
    begin
      memoria.Append;

      memoria.FindField('NUMERO').AsInteger             := table.FindField('NUMERO').AsInteger;
      memoria.FindField('CARTEIRA').AsInteger           := table.FindField('CARTEIRA').AsInteger;
      memoria.FindField('EMPRESA').AsInteger            := table.FindField('EMPRESA').AsInteger;
      memoria.FindField('SERIE').AsString               := table.FindField('SERIE').AsString;
      memoria.FindField('PARCELA').AsString             := table.FindField('SEQUENCIA').AsString + '/' + IntToStr(QtdeParcelas(table.FindField('NUMERO').AsInteger,
                                                                                                                               table.FindField('DOCUMENTO').AsInteger,
                                                                                                                               empresa,
                                                                                                                               variif(tipo = '0','RECEBER','PAGAR')));
      memoria.FindField('PESSOA').AsInteger             := table.FindField('PESSOA').AsInteger;
      memoria.FindField('NOME').AsString                := copy(Acha_Item('PESSOAS',table.FindField('PESSOA').AsString),1,40);
      memoria.FindField('EMISSAO').AsDateTime           := table.FindField('EMISSAO').AsDateTime;
      memoria.FindField('VENCIMENTO').AsDateTime        := table.FindField('VENCIMENTO').AsDateTime;
      memoria.FindField('PAGAMENTO').AsString           := table.FindField('PAGAMENTO').AsString;
      memoria.FindField('ORIGINAL').AsString            := table.FindField('VALORORIGINAL').AsString;
      memoria.FindField('ATUAL').AsString               := table.FindField('VALORATUAL').AsString;
      memoria.FindField('OBSERVACOES').AsString         := table.FindField('OBSERVACOES').AsString;
      memoria.FindField('NOME_EMPRESA').AsString        := Acha_Item('EMPRESAS',table.FindField('EMPRESA').AsString);

      if memoria.FindField('PAGAMENTO').AsString = '' then
        begin
          if (memoria.FindField('VENCIMENTO').AsString = '01/01/1800') or (memoria.FindField('VENCIMENTO').AsString = '30/12/1899') or (memoria.FindField('VENCIMENTO').IsNull) then
            memoria.FindField('PRAZO').AsString         := IntToStr(ABS(DaysBetween(DATE,table.FindField('EMISSAO').AsDateTime)))
          else
            memoria.FindField('PRAZO').AsString         := IntToStr(ABS(DaysBetween(DATE,table.FindField('VENCIMENTO').AsDateTime)));
          memoria.FindField('ABERTO').AsString          := table.FindField('VALORATUAL').AsString
        end
      else
        begin
          memoria.FindField('PRAZO').AsString            := '';
          memoria.FindField('PAGO').AsString             := table.FindField('VALORPAGO').AsString;
        end;

      if SqlPesquisaPrimeira(' select * from TITULOS_PLANOS where MESTRE_ID = ' + IntToStr(table.FindField('CODIGO').AsInteger) +
                             ' order by sequencia asc') then
      begin
        vlrtotalanexo := 0;
        descanenexo   := TStringList.Create;

        dm_rc.sqlpesquisaprimaria.First;
        while not dm_rc.sqlpesquisaprimaria.Eof do
          begin
            vlrtotalanexo := dm_rc.sqlpesquisaprimaria.FindField('VALOR').AsFloat + vlrtotalanexo;

            descanenexo.Add('Plano Contas..: ' + Copy(dm_rc.sqlpesquisaprimaria.FindField('PLANO').AsString + StrReplicate('.',05),1,15) + '|' + 'SubPlano..: ' + dm_rc.sqlpesquisaprimaria.FindField('SEQUENCIA').AsString + ' - ' + copy(dm_rc.sqlpesquisaprimaria.FindField('DESCRICAO').AsString + StrReplicate('.',100),1,40) + '|' + copy(FormatFloat('R$ #,##0.00',dm_rc.sqlpesquisaprimaria.FindField('VALOR').AsFloat)+StrReplicate('.',30),1,20) + '|' + dm_rc.sqlpesquisaprimaria.FindField('OBSERVACAO').AsString);
            dm_rc.sqlpesquisaprimaria.Next;
          end;

        descanenexo.Add(Copy('TOTAL SUBPLANO..: ' + StrReplicate('.',100) ,1,80)+ FormatFloat('R$ #,##0.00',vlrtotalanexo));

        memoria.FindField('DESCANEXO').AsString         := descanenexo.Text;

        descanenexo.Free;
      end;

      memoria.Post;

      table.Next;
    end;


  case agrupamento of
    0: memoria.IndexFieldNames := 'NUMERO';
    1: memoria.IndexFieldNames := 'PESSOA';
    2: memoria.IndexFieldNames := 'EMISSAO';
    3: memoria.IndexFieldNames := 'VENCIMENTO';
    4: memoria.IndexFieldNames := 'PAGAMENTO';
  end;


  memoria.refresh;

  with ldm do
    begin
      frxReport.Script.Variables['EMISSAO']     := dataini;
      frxReport.Script.Variables['EMISSAOATE']  := datafin;
      frxReport.Script.Variables['TIPO']        := varIIF(tipo = '1','CONTAS A PAGAR','CONTAS A RECEBER');
      frxReport.Script.Variables['FANTASIA']    := dm_rc.tbempresas.FindField('FANTASIA').AsString;


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'financeiro_pastofort.fr3');


      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;



      case agrupamento of
        0: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."NUMERO">';
        1: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."PESSOA">';
        2: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."EMISSAO">';
        3: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."VENCIMENTO">';
        4: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."PAGAMENTO">';
      end;

      case agrupamento of
        0: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('****** NUMERO    : [frxDBDataset."NUMERO"] ****** ');
        1: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('****** CODIGO    : [frxDBDataset."PESSOA"]: [frxDBDataset."NOME"] ******');
        2: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('****** EMISSÃO   : [frxDBDataset."EMISSAO"]    ******');
        3: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('****** VENCIMENTO: [frxDBDataset."VENCIMENTO"] ****** ');
        4: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('****** PAGAMENTO : [frxDBDataset."PAGAMENTO"]  ****** ');
      end;

      case agrupamento of
        0: frxReport.Script.Variables['AGRUPAMENTO']    := 'NUMERO';
        1: frxReport.Script.Variables['AGRUPAMENTO']    := 'PESSOA';
        2: frxReport.Script.Variables['AGRUPAMENTO']    := 'EMISSAO';
        3: frxReport.Script.Variables['AGRUPAMENTO']    := 'VENCIMENTO';
        4: frxReport.Script.Variables['AGRUPAMENTO']    := 'PAGAMENTO';
      end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    memoria.Free;
    dm_rc.tbempresas.close;
  finally
    Result := M_ARQUIVO;
  end;

end;
}

function RELATORIO_Financeiro  (tipo,dataini,datafin:string;empresa,agrupamento:Integer;table:TFDQuery)    :string;
var
  memoria:TFDMemTable;
  ABERTO,PAGO,TOTAL:Real;
  vlrtotalanexo    : Real;
  descanenexo      : TStringList;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := TFDMemTable.Create(nil);
  memoria                := CriaMemoria('FINANCEIRO_SINTETICO');
  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));

  memoria.Close;
  memoria.Open;

  ABERTO := 0;
  PAGO   := 0;
  TOTAL  := 0;

  table.First;
  while not table.Eof do
    begin
      memoria.Append;
      memoria.FindField('NUMERO').AsInteger             := table.FindField('NUMERO').AsInteger;
      memoria.FindField('CARTEIRA').AsInteger           := table.FindField('CARTEIRA').AsInteger;
      memoria.FindField('SERIE').AsString               := table.FindField('SERIE').AsString;
      memoria.FindField('PARCELA').AsString             := table.FindField('SEQUENCIA').AsString + '/' + IntToStr(QtdeParcelas(table.FindField('NUMERO').AsInteger,
                                                                                                                               table.FindField('DOCUMENTO').AsInteger,
                                                                                                                               empresa,
                                                                                                                               variif(tipo = '1','RECEBER','PAGAR')));
      memoria.FindField('PESSOA').AsInteger             := table.FindField('PESSOA').AsInteger;
      memoria.FindField('NOME').AsString                := copy(Acha_Item('PESSOAS',table.FindField('PESSOA').AsString),1,40);
      memoria.FindField('EMISSAO').AsDateTime           := table.FindField('EMISSAO').AsDateTime;
      memoria.FindField('VENCIMENTO').AsDateTime        := table.FindField('VENCIMENTO').AsDateTime;
      memoria.FindField('PAGAMENTO').AsString           := table.FindField('PAGAMENTO').AsString;
      memoria.FindField('ORIGINAL').AsFloat             := table.FindField('VALORORIGINAL').AsFloat;
      memoria.FindField('ATUAL').AsFloat                := table.FindField('VALORATUAL').AsFloat;
      memoria.FindField('OBSERVACOES').AsString         := table.FindField('OBSERVACOES').AsString;

      if memoria.FindField('PAGAMENTO').AsString = '' then
        begin
          memoria.FindField('PRAZO').AsString           := IntToStr(ABS(DaysBetween(DATE,StrToDate(table.FindField('VENCIMENTO').AsString))));
          memoria.FindField('ABERTO').AsFloat           := table.FindField('VALORATUAL').AsFloat
        end
      else
        begin
          memoria.FindField('PRAZO').AsString            := '';
          memoria.FindField('PAGO').AsFloat              := table.FindField('VALORPAGO').AsFloat;
        end;

      if SqlPesquisa(' select * from TITULOS_PLANOS where MESTRE_ID = ' + IntToStr(table.FindField('CODIGO').AsInteger) +
                     ' order by sequencia asc') then
      begin
        vlrtotalanexo := 0;
        descanenexo   := TStringList.Create;

        dm_rc.sqlBuscas.First;
        while not dm_rc.sqlBuscas.Eof do
          begin
            vlrtotalanexo := dm_rc.sqlBuscas.FindField('VALOR').AsFloat + vlrtotalanexo;

            descanenexo.Add('Plano Contas..: ' + Copy(dm_rc.sqlBuscas.FindField('PLANO').AsString + StrReplicate('.',05),1,15) + '|' + 'SubPlano..: ' + dm_rc.sqlBuscas.FindField('SEQUENCIA').AsString + ' - ' + copy(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + StrReplicate('.',100),1,40) + '|' + copy(FormatFloat('R$ #,##0.00',dm_rc.sqlBuscas.FindField('VALOR').AsFloat)+StrReplicate('.',30),1,20) + '|' + dm_rc.sqlBuscas.FindField('OBSERVACAO').AsString);
            dm_rc.sqlBuscas.Next;
          end;

        descanenexo.Add(Copy('TOTAL SUBPLANO..: ' + StrReplicate('.',100) ,1,80)+ FormatFloat('R$ #,##0.00',vlrtotalanexo));

        memoria.FindField('DESCANEXO').AsString         := descanenexo.Text;

        descanenexo.Free;
      end;

      memoria.Post;

      table.Next;
    end;

  case agrupamento of
    0: memoria.IndexFieldNames := 'VENCIMENTO';// TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."VENCIMENTO">';
    1: memoria.IndexFieldNames := 'PAGAMENTO';  //TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."PAGAMENTO">';
    2: memoria.IndexFieldNames := 'PESSOA';     //TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."PESSOA">';
    3: memoria.IndexFieldNames := 'EMISSAO';    //TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."EMISSAO">';
    4: memoria.IndexFieldNames := 'NUMERO';     //TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."NUMERO">';
  end;


  memoria.refresh;

  with ldm do
    begin
      frxReport.Script.Variables['EMISSAO']     := dataini;
      frxReport.Script.Variables['EMISSAOATE']  := datafin;
      frxReport.Script.Variables['TIPO']        := varIIF(tipo = '0','CONTAS A PAGAR','CONTAS A RECEBER');
      frxReport.Script.Variables['FANTASIA']    := dm_rc.tbempresas.FindField('FANTASIA').AsString;


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'financeiro_pastofortBase.fr3');


      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

     if not StrContains('05668334000151',dm_rc.tbempresas.FindField('CNPJ').AsString) then
       begin

          case agrupamento of
            0: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."VENCIMENTO">';
            1: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."PAGAMENTO">';
            2: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."PESSOA">';
            3: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."EMISSAO">';
            4: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."NUMERO">';
          end;


          case agrupamento of
            0: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('****** VENCIMENTO: [frxDBDataset."VENCIMENTO"] ****** ');
            1: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('****** PAGAMENTO: [frxDBDataset."PAGAMENTO"] ****** ');
            2: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('[frxDBDataset."NOME"]: [frxDBDataset."PESSOA"]');
            3: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('****** EMISSÃO:[frxDBDataset."EMISSAO"] ****** ');
            4: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('****** NUMERO: [frxDBDataset."NUMERO"] ****** ');
          end;

          case agrupamento of
            0: frxReport.Script.Variables['AGRUPAMENTO']    := 'VENCIMENTO';
            1: frxReport.Script.Variables['AGRUPAMENTO']    := 'PAGAMENTO';
            2: frxReport.Script.Variables['AGRUPAMENTO']    := 'PESSOA';
            3: frxReport.Script.Variables['AGRUPAMENTO']    := 'EMISSAO';
            4: frxReport.Script.Variables['AGRUPAMENTO']    := 'NUMERO';
          end;
       end;
      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    memoria.Free;
    dm_rc.tbempresas.close;
  finally
    Result := M_ARQUIVO;
  end;
end;


function IMPRESSAO_Financeiro  (tipo,dataini,datafin:string;empresa,agrupamento:Integer;table:TFDMemTable)    :string;
var
  memoria:TFDMemTable;
  ABERTO,PAGO,TOTAL:Real;
  vlrtotalanexo    : Real;
  descanenexo      : TStringList;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := TFDMemTable.Create(nil);
  memoria                := CriaMemoria('FINANCEIRO_SINTETICO');
  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));

  memoria.Close;
  memoria.Open;

  ABERTO := 0;
  PAGO   := 0;
  TOTAL  := 0;

  table.First;
  while not table.Eof do
    begin
      memoria.Append;
      memoria.FindField('NUMERO').AsInteger             := table.FindField('NUMERO').AsInteger;
      memoria.FindField('CARTEIRA').AsInteger           := table.FindField('CARTEIRA').AsInteger;
      memoria.FindField('SERIE').AsString               := table.FindField('SERIE').AsString;
      memoria.FindField('PARCELA').AsString             := table.FindField('SEQUENCIA').AsString + '/' + IntToStr(QtdeParcelas(table.FindField('NUMERO').AsInteger,
                                                                                                                               table.FindField('DOCUMENTO').AsInteger,
                                                                                                                               empresa,
                                                                                                                               variif(tipo = '1','RECEBER','PAGAR')));
      memoria.FindField('PESSOA').AsInteger             := table.FindField('PESSOA').AsInteger;
      memoria.FindField('NOME').AsString                := copy(table.FindField('NOME').AsString,1,40);
      memoria.FindField('EMISSAO').AsDateTime           := table.FindField('EMISSAO').AsDateTime;
      memoria.FindField('VENCIMENTO').AsDateTime        := table.FindField('VENCIMENTO').AsDateTime;
      memoria.FindField('PAGAMENTO').AsString           := table.FindField('PAGAMENTO').AsString;
      memoria.FindField('ORIGINAL').AsFloat             := table.FindField('VALORORIGINAL').AsFloat;
      memoria.FindField('ATUAL').AsFloat                := table.FindField('VALORATUAL').AsFloat;
      memoria.FindField('OBSERVACOES').AsString         := table.FindField('OBSERVACOES').AsString;

      if memoria.FindField('PAGAMENTO').AsString = '' then
        begin
          memoria.FindField('PRAZO').AsString           := IntToStr(ABS(DaysBetween(DATE,StrToDate(table.FindField('VENCIMENTO').AsString))));
          memoria.FindField('ABERTO').AsFloat           := table.FindField('VALORATUAL').AsFloat
        end
      else
        begin
          memoria.FindField('PRAZO').AsString            := '';
          memoria.FindField('PAGO').AsFloat              := table.FindField('VALORPAGO').AsFloat;
        end;

      if SqlPesquisa(' select * from TITULOS_PLANOS where MESTRE_ID = ' + IntToStr(table.FindField('CODIGO').AsInteger) +
                     ' order by sequencia asc') then
      begin
        vlrtotalanexo := 0;
        descanenexo   := TStringList.Create;

        dm_rc.sqlBuscas.First;
        while not dm_rc.sqlBuscas.Eof do
          begin
            vlrtotalanexo := dm_rc.sqlBuscas.FindField('VALOR').AsFloat + vlrtotalanexo;

            descanenexo.Add('Plano Contas..: ' + Copy(dm_rc.sqlBuscas.FindField('PLANO').AsString + StrReplicate('.',05),1,15) + '|' + 'SubPlano..: ' + dm_rc.sqlBuscas.FindField('SEQUENCIA').AsString + ' - ' + copy(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + StrReplicate('.',100),1,40) + '|' + copy(FormatFloat('R$ #,##0.00',dm_rc.sqlBuscas.FindField('VALOR').AsFloat)+StrReplicate('.',30),1,20) + '|' + dm_rc.sqlBuscas.FindField('OBSERVACAO').AsString);
            dm_rc.sqlBuscas.Next;
          end;

        descanenexo.Add(Copy('TOTAL SUBPLANO..: ' + StrReplicate('.',100) ,1,80)+ FormatFloat('R$ #,##0.00',vlrtotalanexo));

        memoria.FindField('DESCANEXO').AsString         := descanenexo.Text;

        descanenexo.Free;
      end;

      memoria.Post;

      table.Next;
    end;

  case agrupamento of
    0: memoria.IndexFieldNames := 'VENCIMENTO';// TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."VENCIMENTO">';
    1: memoria.IndexFieldNames := 'PAGAMENTO';  //TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."PAGAMENTO">';
    2: memoria.IndexFieldNames := 'PESSOA';     //TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."PESSOA">';
    3: memoria.IndexFieldNames := 'EMISSAO';    //TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."EMISSAO">';
    4: memoria.IndexFieldNames := 'NUMERO';     //TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."NUMERO">';
  end;


  memoria.refresh;

  with ldm do
    begin
      frxReport.Script.Variables['EMISSAO']     := dataini;
      frxReport.Script.Variables['EMISSAOATE']  := datafin;
      frxReport.Script.Variables['TIPO']        := varIIF(tipo = '0','CONTAS A PAGAR','CONTAS A RECEBER');
      frxReport.Script.Variables['FANTASIA']    := dm_rc.tbempresas.FindField('FANTASIA').AsString;


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'financeiro_pastofortBase.fr3');


      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

     if not StrContains('05668334000151',dm_rc.tbempresas.FindField('CNPJ').AsString) then
       begin

          case agrupamento of
            0: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."VENCIMENTO">';
            1: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."PAGAMENTO">';
            2: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."PESSOA">';
            3: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."EMISSAO">';
            4: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."NUMERO">';
          end;


          case agrupamento of
            0: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('****** VENCIMENTO: [frxDBDataset."VENCIMENTO"] ****** ');
            1: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('****** PAGAMENTO: [frxDBDataset."PAGAMENTO"] ****** ');
            2: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('[frxDBDataset."NOME"]: [frxDBDataset."PESSOA"]');
            3: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('****** EMISSÃO:[frxDBDataset."EMISSAO"] ****** ');
            4: TfrxMemoView(frxReport.FindComponent('Memo25')).Memo.Add('****** NUMERO: [frxDBDataset."NUMERO"] ****** ');
          end;

          case agrupamento of
            0: frxReport.Script.Variables['AGRUPAMENTO']    := 'VENCIMENTO';
            1: frxReport.Script.Variables['AGRUPAMENTO']    := 'PAGAMENTO';
            2: frxReport.Script.Variables['AGRUPAMENTO']    := 'PESSOA';
            3: frxReport.Script.Variables['AGRUPAMENTO']    := 'EMISSAO';
            4: frxReport.Script.Variables['AGRUPAMENTO']    := 'NUMERO';
          end;
       end;
      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    memoria.Free;
    dm_rc.tbempresas.close;
  finally
    Result := M_ARQUIVO;
  end;
end;



function RELATORIO_Vendasporperiodo (empresa:Integer;sql,dataini,datafin,status:string)  :string;
var
  memoria:TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := TFDMemTable.Create(nil);
  memoria                := CriaMemoria('MEMCAD');

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));
  TabelaMvmestre(sql);

  dm_rc.FDQryMvmestre.First;
  while not dm_rc.FDQryMvmestre.Eof do
    begin
      TabelaMvitens(' select sum(quantidade) AS QUANTIDADE from mvitens where ' +
                    ' empresa                                =  ' + IntToStr(empresa) +
                    ' and numero                             =  ' + QuotedStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsString) +
                    ' and serie                              =  ' + QuotedStr(dm_rc.FDQryMvmestre.FindField('SERIE').AsString)  +
                    ' and documento                          =  ' + QuotedStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsString));

      memoria.Append;
      memoria.FindField('OPERACAO').AsInteger     := dm_rc.FDQryMvmestre.FindField('OPERACAO').AsInteger;
      memoria.FindField('CODIGO').AsInteger       := dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger;
      memoria.FindField('DATAINICIAL').AsString   := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;
      memoria.FindField('NUMERO') .AsInteger      := dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger;
      memoria.FindField('SERIE').AsString         := dm_rc.FDQryMvmestre.FindField('SERIE').AsString;
      memoria.FindField('CIDADE').AsString        := dm_rc.FDQryMvmestre.FindField('CIDADE').AsString;
      memoria.FindField('ESTADO').AsString        := dm_rc.FDQryMvmestre.FindField('ESTADO').AsString;
      memoria.FindField('NOME')   .AsString       := dm_rc.FDQryMvmestre.FindField('NOME').AsString;
      memoria.FindField('EMISSAO').AsString       := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;
      memoria.FindField('TIPO_OP').AsString       := dm_rc.FDQryMvmestre.FindField('OPERACAO_OP').AsString;
      memoria.FindField('VALORPAGO')  .AsFloat    := variif(StrContains('Complementar',dm_rc.FDQryMvmestre.FindField('TIPO').AsString),0,variif(dm_rc.FDQryMvmestre.FindField('OPERACAO_OP').AsString = 'Devolucao',(dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat) * - 1 ,dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat));
      memoria.FindField('ENDERECO').AsString      := dm_rc.FDQryMvmestre.FindField('OPERACAO').AsString + ' - ' +
                                                     dm_rc.FDQryMvmestre.FindField('DESCRICAO').AsString;
      memoria.FindField('QUANTIDADE') .AsFloat    := variif(StrContains('Complementar',dm_rc.FDQryMvmestre.FindField('TIPO').AsString),0,variif(dm_rc.FDQryMvmestre.FindField('OPERACAO_OP').AsString = 'Devolucao',(dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat) * - 1 ,dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat));

      memoria.Post;

      dm_rc.FDQryMvmestre.Next;
    end;

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']   := dataini;
      frxReport.Script.Variables['DATAFIN']   := datafin;
      frxReport.Script.Variables['STATUS']    := variif(status = '0','AUTORIZADA','CANCELADAS');


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'vendasporperiodo.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picturelogo')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm.Free;
    memoria.Free;
    dm_rc.tbempresas.close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_Vendasporperiodoprodutos (empresa:Integer;sql,rresumo,dataini,datafin,status:string)         :string;
var
  memoria:TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := CriaMemoria('MEMCAD');

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));
  TabelaMvmestre(sql);

  if rresumo = 'T' then
    begin
      while not dm_rc.FDQryMvmestre.Eof do
        begin
          memoria.Append;
          memoria.FindField('PRODUTO').AsInteger      := dm_rc.FDQryMvmestre.FindField('PRODUTO').AsInteger;
          memoria.FindField('DESCRICAO').AsString     := Acha_Item('PRODUTOS',memoria.FindField('PRODUTO').AsString);
          memoria.FindField('PRECO') .AsFloat         := dm_rc.FDQryMvmestre.FindField('MEDIA').AsFloat;
          memoria.FindField('VALORPAGO')  .AsFloat    := dm_rc.FDQryMvmestre.FindField('TOTAL').AsFloat;
          memoria.FindField('QUANTIDADE') .AsFloat    := dm_rc.FDQryMvmestre.FindField('QUANTIDADE').AsFloat;
          memoria.Post;

          dm_rc.FDQryMvmestre.Next;
        end;

    end
  else
    begin
      dm_rc.FDQryMvmestre.First;
      while not dm_rc.FDQryMvmestre.Eof do
        begin
          SqlPesquisa  ('select * from pessoas where codigo      =  ' + IntToStr (dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));

          memoria.Append;
          memoria.FindField('OPERACAO').AsInteger     := dm_rc.FDQryMvmestre.FindField('OPERACAO').AsInteger;
          memoria.FindField('PRODUTO').AsInteger      := dm_rc.FDQryMvmestre.FindField('PRODUTO').AsInteger;
          memoria.FindField('DESCRICAO').AsString     := Acha_Item('PRODUTOS',memoria.FindField('PRODUTO').AsString);
          memoria.FindField('DATAINICIAL').AsString   := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;
          memoria.FindField('NUMERO') .AsInteger      := dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger;
          memoria.FindField('SERIE').AsString         := dm_rc.FDQryMvmestre.FindField('SERIE').AsString;
          memoria.FindField('ESTADO').AsString        := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
          memoria.FindField('EMISSAO').AsString       := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;
          memoria.FindField('PRECO') .AsFloat         := dm_rc.FDQryMvmestre.FindField('PRECO').AsFloat;
          memoria.FindField('VALORPAGO')  .AsFloat    := dm_rc.FDQryMvmestre.FindField('TOTAL').AsFloat - dm_rc.FDQryMvmestre.FindField('DESCONTO').AsFloat;
          memoria.FindField('QUANTIDADE') .AsFloat    := dm_rc.FDQryMvmestre.FindField('QUANTIDADE').AsFloat;
          memoria.FindField('ENDERECO').AsString      := dm_rc.FDQryMvmestre.FindField('OPERACAO').AsString + ' - ' + Acha_Item('OPERACOES',dm_rc.FDQryMvmestre.FindField('OPERACAO').AsString);
          memoria.Post;

          dm_rc.FDQryMvmestre.Next;
        end;
    end;


  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']   := dataini;
      frxReport.Script.Variables['DATAFIN']   := datafin;
      frxReport.Script.Variables['STATUS']    := variif(status = '0','AUTORIZADA','CANCELADAS');


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;

      if rresumo = 'T' then
        frxReport.LoadFromFile(mm.M_FASTREPORT+'vendasporperiodoprodutos_resumo.fr3')
      else
        frxReport.LoadFromFile(mm.M_FASTREPORT+'vendasporperiodoprodutos.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picturelogo')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm.Free;
    memoria.Free;
    dm_rc.tbempresas.close;
  finally
    Result := M_ARQUIVO;
  end;
end;

function RELATORIO_ESTOQUELOTE (empresa:Integer;sql:string)                                :string;
var
  memoria:TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := TFDMemTable.Create(nil);
  memoria                := CriaMemoria('MEMCAD');

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));
  TabelaSementes(sql);

  dm_rc.fdqrysementes.First;
  while not dm_rc.fdqrysementes.Eof do
    begin
      memoria.Append;
      memoria.FindField('NOME').AsString          := ' Cultivar : ' +
                                                     dm_rc.fdqrysementes.FindField('CULTIVAR').AsString + ' - ' +
                                                     dm_rc.fdqrysementes.FindField('PRODUTO').AsString  + '   ' +
                                                     dm_rc.fdqrysementes.FindField('NOME').AsString;
      memoria.FindField('PRODUTO').AsString       := dm_rc.fdqrysementes.FindField('PRODUTO').AsString;
      memoria.FindField('LOTE').AsString          := dm_rc.fdqrysementes.FindField('LOTE').AsString;
      memoria.FindField('TIPO').AsString          := dm_rc.fdqrysementes.FindField('TIPO').AsString;
      memoria.FindField('BOLETIM').AsString       := dm_rc.fdqrysementes.FindField('BOLETIM').AsString;
      memoria.FindField('TERMO').AsString         := dm_rc.fdqrysementes.FindField('TERMO').AsString;
      memoria.FindField('SALDOKG').AsFloat        := dm_rc.fdqrysementes.FindField('DISPONIVEL').AsFloat;
      memoria.FindField('VALORCULTURAL').AsFloat  := dm_rc.fdqrysementes.FindField('VALORCULTURAL').AsFloat;
      memoria.FindField('PUREZA').AsFloat         := dm_rc.fdqrysementes.FindField('ANALISEPURA').AsFloat;
      memoria.Post;

      dm_rc.fdqrysementes.Next;
    end;

  with ldm do
    begin
      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'Relatorio_Lotes.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    memoria.Free;
    dm_rc.tbempresas.close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_Fluxocaixa (saldoinicial:real;dataini,datafin:string;empresa:integer;table:TFDMemTable)                                   :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']       := dataini;
      frxReport.Script.Variables['DATAFIN']       := datafin;
      frxReport.Script.Variables['SALDOINICIAL']  := saldoinicial;


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'fluxocaixa.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_ALIQUOTAICMS     (empresa:Integer;dataini,datafin,sql:string)  :string;
var
  memoria:TFDMemTable;
  M_ENTRADA,M_SAIDA :Real;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := TFDMemTable.Create(nil);
  memoria                := CriaMemoria('ALIQUOTAICMS');

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));
  SqlPesquisa(sql);

  M_ENTRADA := 0;
  M_SAIDA   := 0;
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      memoria.Append;
      if StrLeft(dm_rc.sqlBuscas.FindField('CODIGO').AsString,1) = '1' then
        begin
          memoria.FindField('ENDERECO').AsString      := '1000\2000 - COMPRAS E\OU PRESTAÇÃO DE SERVIÇOS NO ESTADO E OUTROS ESTADO';
          memoria.FindField('OPERACAO').AsString      := '1';
          M_ENTRADA                                                     :=  dm_rc.sqlBuscas.FindField('VLRICMS').AsFloat;

          memoria.FindField('CFOP1').AsString         := dm_rc.sqlBuscas.FindField('CODIGO').AsString;
          memoria.FindField('VALORORIGINAL').AsFloat  := dm_rc.sqlBuscas.FindField('VLRTOTAL').AsFloat;
          memoria.FindField('BASEICMS') .AsFloat      := dm_rc.sqlBuscas.FindField('VLRBASEICMS').AsFloat;
          memoria.FindField('VALORICMS').AsFloat      := dm_rc.sqlBuscas.FindField('VLRICMS').AsFloat;
          memoria.FindField('NAOTRIBUTADO').AsFloat   := dm_rc.sqlBuscas.FindField('ISENTO').AsFloat;
          memoria.FindField('ENTRADA').AsFloat        := M_ENTRADA;
          memoria.Post;
        end;

      if StrLeft(dm_rc.sqlBuscas.FindField('CODIGO').AsString,1) = '2' then
        begin
          memoria.FindField('ENDERECO').AsString      := '1000\2000 - COMPRAS E\OU PRESTAÇÃO DE SERVIÇOS NO ESTADO E OUTROS ESTADO';
          memoria.FindField('OPERACAO').AsString      := '1';
          M_ENTRADA                                   :=  dm_rc.sqlBuscas.FindField('VLRICMS').AsFloat;

          memoria.FindField('CFOP1').AsString         := dm_rc.sqlBuscas.FindField('CODIGO').AsString;
          memoria.FindField('VALORORIGINAL').AsFloat  := dm_rc.sqlBuscas.FindField('VLRTOTAL').AsFloat;
          memoria.FindField('BASEICMS') .AsFloat      := dm_rc.sqlBuscas.FindField('VLRBASEICMS').AsFloat;
          memoria.FindField('VALORICMS').AsFloat      := dm_rc.sqlBuscas.FindField('VLRICMS').AsFloat;
          memoria.FindField('NAOTRIBUTADO').AsFloat   := dm_rc.sqlBuscas.FindField('ISENTO').AsFloat;
          memoria.FindField('ENTRADA').AsFloat        := M_ENTRADA;
          memoria.Post;
        end;

      if StrLeft(dm_rc.sqlBuscas.FindField('CODIGO').AsString,1) = '5' then
        begin
          memoria.FindField('ENDERECO').AsString      := '5000\6000 - SAIDAS E\OU PRESTAÇÃO DE SERVIÇOS NO ESTADO E FORA DO ESTADO';
          memoria.FindField('OPERACAO').AsString      := '3';
          M_SAIDA                                     :=  dm_rc.sqlBuscas.FindField('VLRICMS').AsFloat;

          memoria.FindField('CFOP1').AsString         := dm_rc.sqlBuscas.FindField('CODIGO').AsString;
          memoria.FindField('VALORORIGINAL').AsFloat  := dm_rc.sqlBuscas.FindField('VLRTOTAL').AsFloat;
          memoria.FindField('BASEICMS') .AsFloat      := dm_rc.sqlBuscas.FindField('VLRBASEICMS').AsFloat;
          memoria.FindField('VALORICMS').AsFloat      := dm_rc.sqlBuscas.FindField('VLRICMS').AsFloat;
          memoria.FindField('NAOTRIBUTADO').AsFloat   := dm_rc.sqlBuscas.FindField('ISENTO').AsFloat;
          memoria.FindField('SAIDA').AsFloat          := M_SAIDA;
          memoria.Post;
        end;

      if StrLeft(dm_rc.sqlBuscas.FindField('CODIGO').AsString,1) = '6' then
        begin
          memoria.FindField('ENDERECO').AsString      := '5000\6000 - SAIDAS E\OU PRESTAÇÃO DE SERVIÇOS NO ESTADO E FORA DO ESTADO';
          memoria.FindField('OPERACAO').AsString      := '3';
          M_SAIDA                                     := dm_rc.sqlBuscas.FindField('VLRICMS').AsFloat;

          memoria.FindField('CFOP1').AsString         := dm_rc.sqlBuscas.FindField('CODIGO').AsString;
          memoria.FindField('VALORORIGINAL').AsFloat  := dm_rc.sqlBuscas.FindField('VLRTOTAL').AsFloat;
          memoria.FindField('BASEICMS') .AsFloat      := dm_rc.sqlBuscas.FindField('VLRBASEICMS').AsFloat;
          memoria.FindField('VALORICMS').AsFloat      := dm_rc.sqlBuscas.FindField('VLRICMS').AsFloat;
          memoria.FindField('NAOTRIBUTADO').AsFloat   := dm_rc.sqlBuscas.FindField('ISENTO').AsFloat;
          memoria.FindField('SAIDA').AsFloat          := M_SAIDA;
          memoria.Post;
        end;

      if StrLeft(dm_rc.sqlBuscas.FindField('CODIGO').AsString,1) = '7' then
        begin
          memoria.FindField('ENDERECO').AsString      := '7000 - SAIDAS E\OU PRESTAÇÃO DE SERVIÇOS INTERNACIONAL';
          memoria.FindField('OPERACAO').AsString      := '5';

          memoria.FindField('CFOP1').AsString         := dm_rc.sqlBuscas.FindField('CODIGO').AsString;
          memoria.FindField('VALORORIGINAL').AsFloat  := dm_rc.sqlBuscas.FindField('VLRTOTAL').AsFloat;
          memoria.FindField('BASEICMS') .AsFloat      := dm_rc.sqlBuscas.FindField('VLRBASEICMS').AsFloat;
          memoria.FindField('VALORICMS').AsFloat      := dm_rc.sqlBuscas.FindField('VLRICMS').AsFloat;
          memoria.FindField('NAOTRIBUTADO').AsFloat   := dm_rc.sqlBuscas.FindField('ISENTO').AsFloat;
          memoria.Post;
        end;

      dm_rc.sqlBuscas.next;
    end;

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']       := dataini;
      frxReport.Script.Variables['DATAFIN']       := datafin;


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'apuracaoicms.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;

function RELATORIO_CURVAABCPRODUTOS         (const empresa,tipo:integer;ano:string;table:TFDMemTable) :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));

  with ldm do
    begin
      frxReport.Script.Variables['FANTASIA']   := dm_rc.tbempresas.FindField('FANTASIA').AsString;
      frxReport.Script.Variables['ANO']        := VARIIF(tipo = 0,'NOTAS - ','PEDIDOS - ') + VARIIF(ano = '0','ANALISE GERAL',ano);

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'curva_ABC_produtos.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;

end;


function RELATORIO_RELATORIOVENDASDETALHADA(empresa:Integer;dataini,datafin,sql:string)                :string;
var
  memoria, memdetalhes:TFDMemTable;
  M_ENTRADA,M_SAIDA, M_TOTAL :Real;
begin

  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := TFDMemTable.Create(nil);
  memdetalhes            := TFDMemTable.Create(nil);

  memoria                := CriaMemoria('VENDASDETALHADAS');
  memdetalhes            := CriaMemoria('VENDASDETALHADASRESUMO');

  M_TOTAL                := 0;

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));
  SqlPesquisa(sql);

  memoria.Close;
  memoria.Open;
  memdetalhes.Close;
  memdetalhes.Open;
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      memoria.Append;
      memoria.FindField('PESSOA').AsInteger      := dm_rc.sqlBuscas.FindField('PESSOA').AsInteger;
      memoria.FindField('PRODUTO').AsInteger     := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
      memoria.FindField('NUMERO').AsInteger      := dm_rc.sqlBuscas.FindField('NUMERO').AsInteger;
      memoria.FindField('VLRTOTAL').AsFloat      := dm_rc.sqlBuscas.FindField('VLRTOTAL').AsFloat;
      memoria.FindField('PESOLIQUIDO').AsFloat   := dm_rc.sqlBuscas.FindField('PESOLIQUIDO').AsFloat;
      memoria.FindField('BASEICMS').AsFloat      := dm_rc.sqlBuscas.FindField('BASEICMS').AsFloat;
      memoria.FindField('VALORICMS').AsFloat     := dm_rc.sqlBuscas.FindField('VALORICMS').AsFloat;
      memoria.FindField('QUANTIDADE').AsFloat    := dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
      memoria.FindField('TOTAL').AsFloat         := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
      memoria.FindField('PRECO').AsFloat         := dm_rc.sqlBuscas.FindField('PRECO').AsFloat;
      memoria.FindField('NOME').AsString         := copy(dm_rc.sqlBuscas.FindField('NOME').AsString,1,30);
      memoria.FindField('SERIE').AsString        := dm_rc.sqlBuscas.FindField('SERIE').AsString;
      memoria.FindField('ESTADO').AsString       := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
      memoria.FindField('DESCRICAO').AsString    := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
      memoria.FindField('HORA').AsString         := dm_rc.sqlBuscas.FindField('HORANOTA').AsString;
      memoria.FindField('EMISSAO').AsString      := dm_rc.sqlBuscas.FindField('EMISSAO').AsString;
      memoria.FindField('OPERACAO_OP').AsString  := dm_rc.sqlBuscas.FindField('OPERACAO_OP').AsString;
      memoria.FindField('EMPRESA').AsInteger     := dm_rc.sqlBuscas.FindField('EMPRESA').AsInteger;
      memoria.FindField('NOME_EMPRESA').AsString := Acha_Item('EMPRESAS',dm_rc.sqlBuscas.FindField('EMPRESA').AsString);
      memoria.Post;

      M_TOTAL := M_TOTAL + memoria.FindField('TOTAL').AsFloat;

      if not memdetalhes.Locate('PRODUTO',VarArrayOf([memoria.FindField('PRODUTO').AsString]),[]) then
        begin
          memdetalhes.Append;
          memdetalhes.FindField('PRODUTO').AsInteger    := memoria.FindField('PRODUTO').AsInteger;
          memdetalhes.FindField('DESCRICAO').AsString   := memoria.FindField('DESCRICAO').AsString;
          memdetalhes.FindField('QUANTIDADE').AsFloat   := memoria.FindField('QUANTIDADE').AsFloat;
          memdetalhes.FindField('PESOLIQUIDO').AsFloat  := memoria.FindField('PESOLIQUIDO').AsFloat;
          memdetalhes.FindField('TOTAL').AsFloat        := memoria.FindField('TOTAL').AsFloat;
          memdetalhes.Post;
        end
      else
        begin
          memdetalhes.edit;
          memdetalhes.FindField('QUANTIDADE').AsFloat   := memdetalhes.FindField('QUANTIDADE').AsFloat  + memoria.FindField('QUANTIDADE').AsFloat;
          memdetalhes.FindField('PESOLIQUIDO').AsFloat  := memdetalhes.FindField('PESOLIQUIDO').AsFloat + memoria.FindField('PESOLIQUIDO').AsFloat;
          memdetalhes.FindField('TOTAL').AsFloat        := memdetalhes.FindField('TOTAL').AsFloat       + memoria.FindField('TOTAL').AsFloat;
          memdetalhes.Post;
        end;
      dm_rc.sqlBuscas.Next;
    end;

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']       := dataini;
      frxReport.Script.Variables['DATAFIN']       := datafin;
      frxReport.Script.Variables['SOMATOTAL']     := M_TOTAL;


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;
      frxDBDatasetdetalhes.DataSet        := memdetalhes;

      frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'vendasdetalhadas.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    memoria.Free;
    memdetalhes.Free;
  finally
    Result := M_ARQUIVO;
  end;

end;
function RELATORIO_CURVAABCPESSOA(empresa,tipo:integer;ano:string;table:TFDMemTable) :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));

  with ldm do
    begin
      frxReport.Script.Variables['FANTASIA']   := dm_rc.tbempresas.FindField('FANTASIA').AsString;
      frxReport.Script.Variables['ANO']        := VARIIF(tipo = 0,'NOTAS - ','PEDIDOS - ') + VARIIF(ano = '0','ANALISE GERAL',ano);

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'curva_ABC_pessoas.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_historicosemente (empresa:integer;dataini,datafin,rprodutoini,rprodutofin,sql:string)            :string;
var
  tabela : TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  tabela                 := CriaMemoria('HISTORICOSEMENTE');

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(empresa));
  SqlPesquisa     (sql);

  tabela.Close;
  tabela.Open;
{
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      tabela.Append;
      tabela.FindField('PRODUTO').AsInteger    := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
      tabela.FindField('PESSOA').AsInteger     := dm_rc.sqlBuscas.FindField('PESSOA').AsInteger;
      tabela.FindField('LOTESEMENTE').AsString := dm_rc.sqlBuscas.FindField('LOTESEMENTE').AsString;
      tabela.FindField('BOLETIM').AsString     := dm_rc.sqlBuscas.FindField('BOLETIM').AsString;
      tabela.FindField('SAFRA').AsString       := dm_rc.sqlBuscas.FindField('SAFRAVALIDA').AsString;
      tabela.FindField('CULTIVAR').AsString    := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;
      tabela.FindField('NUMERO').AsString      := dm_rc.sqlBuscas.FindField('NUMERO').AsString;
      tabela.FindField('SERIE').AsString       := dm_rc.sqlBuscas.FindField('SERIE').AsString;
      tabela.FindField('EMISSAO').AsString     := dm_rc.sqlBuscas.FindField('DATA').AsString;
      tabela.FindField('NOME').AsString        := dm_rc.sqlBuscas.FindField('NOME').AsString;
      tabela.FindField('UF').AsString          := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
      tabela.FindField('PONTOS').AsFloat       := dm_rc.sqlBuscas.FindField('PONTOS').AsFloat;
      tabela.FindField('PUREZA').AsFloat       := dm_rc.sqlBuscas.FindField('PUREZA').AsFloat;
      tabela.FindField('QUANTIDADE').AsFloat   := dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
      tabela.Post;

      dm_rc.sqlBuscas.Next;
    end;
}
  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']       := dataini;
      frxReport.Script.Variables['DATAFIN']       := datafin;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.sqlBuscas;

      frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'historicosemente.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    tabela.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_saldobenenotas   (empresa:integer;dataini,datafin,rprodutoini,rprodutofin,sql:string)            :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(empresa));
  SqlPesquisa     (sql);

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']       := dataini;
      frxReport.Script.Variables['DATAFIN']       := datafin;
      frxReport.Script.Variables['PRODINI']       := rprodutoini;
      frxReport.Script.Variables['PRODFIN']       := rprodutofin;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.sqlBuscas;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'relatorio_saldobeneficiamentonotas.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    dm_rc.sqlBuscas.Close;
  finally
    Result := M_ARQUIVO;
  end;
end;

function RELATORIO_RELATORIO_ENTREGAFUTURA   (const rempresa,rprodutoini,rprodutofin,rpessoaini,rpessoafin:integer;dataini,datafin:TDateTime;sql:string):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(rempresa));
  SqlPesquisa     (sql);

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']       := dataini;
      frxReport.Script.Variables['DATAFIN']       := datafin;
      frxReport.Script.Variables['PRODUTOINI']    := rprodutoini;
      frxReport.Script.Variables['PRODUTOFIN']    := rprodutofin;
      frxReport.Script.Variables['PESSOAINI']     := rpessoaini;
      frxReport.Script.Variables['PESSOAFIN']     := rpessoafin;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.sqlBuscas;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'relatoriocontroleitensef.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    dm_rc.sqlBuscas.Close;
  finally
    Result := M_ARQUIVO;
  end;
end;

function ESCRITA_GRAFICO_COMPARATIVOFAT(const rempresa:integer;anoini,mesini:string;tipo:integer):string;
var
  escrita : string;
begin
  if TIPO = 0 then
    begin
      escrita :=
        ' SELECT                                                    ' +
        ' extract(month from p.emissao) AS MES,                     ' +
        ' extract(year  from p.emissao) AS ANO,                     ' +
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
        '   end as Descricao,                                                   ' +
        ' SUM(p.vlrtotal) as total                                              ' +
        ' FROM MVMESTRE P INNER JOIN OPERACOES OP ON (P.operacao = Op.codigo)   ' +
        ' WHERE p.empresa =                                                     ' + IntToStr(rempresa)         +
        ' AND EXTRACT(year  from P.emissao) <=                                      ' + QuotedStr(anoini)      +
        ' AND EXTRACT(month from P.emissao) =                                       ' + QuotedStr(mesini)      +
        ' AND P.DOCUMENTO                   =                                       ' + IntToStr(1)            +
        ' AND P.CANCELADA                   =                                       ' + QuotedStr('A')         +
        ' and ((OP.operacao_op = '+QuotedStr('Vendas')+') or (op.operacao_op = '+QuotedStr('Venda EF')+'))'+
        'GROUP BY 1,2';
    end;

  if TIPO = 1 then
    begin
      escrita :=
        ' SELECT                                                    ' +
        ' extract(month from p.emissao) AS MES,                     ' +
        ' extract(year  from p.emissao) AS ANO,                     ' +
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
        '   end as Descricao,                                                   ' +
        ' SUM(p.vlrtotal) as total                                              ' +
        ' FROM MVMESTRE P INNER JOIN OPERACOES OP ON (P.operacao = Op.codigo)   ' +
        ' WHERE p.empresa =                                                     ' + IntToStr(rempresa)         +
        ' AND EXTRACT(year  from P.emissao) <=                                      ' + QuotedStr(anoini)      +
        ' AND EXTRACT(month from P.emissao) =                                       ' + QuotedStr(mesini)      +
        ' AND P.DOCUMENTO                   =                                       ' + IntToStr(4)            +
        'GROUP BY 1,2';

    end;


  result := escrita;
end;
function ESCRITA_GRAFICO_COMPARATIVOANUALFAT(const rempresa:integer;anoini:string;tipo:integer):string;
var
  escrita : string;
begin
  if tipo = 0 then
    begin
      escrita :=
        ' SELECT                                                    ' +
        ' extract(year  from p.emissao) AS ANO,                     ' +
        ' SUM(p.vlrtotal) as total                                                  ' +
        ' FROM MVMESTRE P INNER JOIN OPERACOES OP ON (P.operacao = Op.codigo)       ' +
        ' WHERE p.empresa =                                                         ' + IntToStr(rempresa)         +
        ' AND EXTRACT(year  from P.emissao) <=                                      ' + QuotedStr(anoini)      +
        ' AND P.DOCUMENTO                   =                                       ' + IntToStr(1)            +
        ' AND P.CANCELADA                   =                                       ' + QuotedStr('A')         +
        ' and ((OP.operacao_op = '+QuotedStr('Vendas')+') or (op.operacao_op = '+QuotedStr('Venda EF')+'))'+
        'GROUP BY 1';
    end;

  if tipo = 1 then
    begin
      escrita :=
        ' SELECT                                                    ' +
        ' extract(year  from p.emissao) AS ANO,                     ' +
        ' SUM(p.vlrtotal) as total                                                  ' +
        ' FROM MVMESTRE P INNER JOIN OPERACOES OP ON (P.operacao = Op.codigo)       ' +
        ' WHERE p.empresa =                                                         ' + IntToStr(rempresa)         +
        ' AND EXTRACT(year  from P.emissao) <=                                      ' + QuotedStr(anoini)      +
        ' AND P.DOCUMENTO                   =                                       ' + IntToStr(4)            +
        'GROUP BY 1';
    end;

  result := escrita;
end;
function RELATORIO_VENDASVENDEDOR (const rempresa:integer;sql:string;dataini,datafin:TDateTime):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(rempresa));
  SqlPesquisa     (sql);

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI'] := dataini;
      frxReport.Script.Variables['DATAFIN'] := datafin;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.sqlBuscas;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'vendasporvendedor.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    dm_rc.sqlBuscas.Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_RELATORIOENTREGAITENS    (const rempresa,rpessoaini,rpessoafin,rprodutoini,rprodutofin,rtipodoc,tipoentre:integer;dataini,datafin,uf,sql:string):string;
var
  mdocumento,tipoentrega :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(rempresa));
  SqlPesquisa     (sql);

    case rtipodoc of
      0 : mdocumento  := 'N O T A S'; //notas
      1 : mdocumento  := 'P E D I D O S' //pedidos
    end;

    case tipoentre of
      0 : tipoentrega := ' ENTREGUE   '; //entregue
      1 : tipoentrega := ' DISPONIVEL '; //disponivel
      2 : tipoentrega := ' TODOS      '; //todos
    end;

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']     := dataini;
      frxReport.Script.Variables['DATAFIN']     := datafin;
      frxReport.Script.Variables['TIPODOC']     := mdocumento;
      frxReport.Script.Variables['TIPOENTREGA'] := tipoentrega;


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.sqlBuscas;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'relacao_entregas.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    dm_rc.sqlBuscas.Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_HISTORICODOCUMENTO       (const rempresa,rnumero:Integer;rserie:string;table:TFDMemTable)  :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(rempresa));
  SqlPesquisa     (' select * from mvmestre where empresa   = ' + IntToStr(rempresa) +
                   ' and numero                             = ' + IntToStr(rnumero)  +
                   ' and serie                              = ' + QuotedStr(rserie));

  with ldm do
    begin
      frxReport.Script.Variables['EMISSAO']     := dm_rc.sqlBuscas.FindField('EMISSAO').AsDateTime;
      frxReport.Script.Variables['NUMERO']      := dm_rc.sqlBuscas.FindField('NUMERO').AsString;
      frxReport.Script.Variables['NOME']        := Acha_Item('PESSOAS',dm_rc.sqlBuscas.FindField('PESSOA').AsString);


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'relatorio_historicofinanceirodocumento.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    dm_rc.sqlBuscas.Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_ROMANEIO_RECIBO          (const rempresa,rmestre:integer)  :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas      ('SELECT * FROM EMPRESAS      WHERE CODIGO     = ' + IntToStr(rempresa));
  TabelaRomaneio      ('SELECT * FROM ROMANEIO      WHERE CODIGO     = ' + IntToStr(rmestre));
  TabelaRomaneioItens ('SELECT * FROM ROMANEIOITENS WHERE MESTRE_ID  = ' + IntToStr(rmestre) + ' ORDER BY CODIGO');
  TabelaTransporte    ('SELECT * FROM TRANSPORTES   WHERE CODIGO     = ' + IntToStr(DM_RC.fdqryromaneio.FindField('MOTORISTA').AsInteger));

  with ldm do
    begin
      frxReport.Script.Variables['MOTORISTA']   := dm_rc.fdqryromaneio.FindField('NOME').AsString;
      frxReport.Script.Variables['DOCUMENTO']   := Formata_Cnpj(dm_rc.FDQryTransportes.FindField('CPFCNPJ').AsString);
      frxReport.Script.Variables['ENDERECO']    := dm_rc.FDQryTransportes.FindField('ENDERECO').AsString + ' nº ' + dm_rc.FDQryTransportes.FindField('NUMERO').AsString ;
      frxReport.Script.Variables['CIDADE']      := dm_rc.FDQryTransportes.FindField('CIDADE').AsString   + ' '    + dm_rc.FDQryTransportes.FindField('ESTADO').AsString;
      frxReport.Script.Variables['PLACA']       := dm_rc.fdqryromaneio.FindField('PLACA').AsString;

      frxReport.Script.Variables['VALORFRETE']  := dm_rc.fdqryromaneio.FindField('VALORFRETE').AsFloat;
      frxReport.Script.Variables['VALORPAGO']   := dm_rc.fdqryromaneio.FindField('PAGO').AsFloat;
      frxReport.Script.Variables['VALORRECEBER']:= dm_rc.fdqryromaneio.FindField('VALORFRETE').AsFloat - dm_rc.fdqryromaneio.FindField('PAGO').AsFloat;

      frxReport.Script.Variables['LOCAL']       := dm_rc.tbempresas.FindField('CIDADE').AsString;
      frxReport.Script.Variables['DIA']         := FormatDateTime('dd'  ,dm_rc.fdqryromaneio.FindField('EMISSAO').AsDateTime);
      frxReport.Script.Variables['MES']         := FormatDateTime('mm'  ,dm_rc.fdqryromaneio.FindField('EMISSAO').AsDateTime);
      frxReport.Script.Variables['ANO']         := FormatDateTime('yyyy',dm_rc.fdqryromaneio.FindField('EMISSAO').AsDateTime);


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.fdqryromaneioitens;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'romaneio_recibomotorista.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    dm_rc.sqlBuscas.Close;
  finally
    Result := M_ARQUIVO;
  end;

end;
function RELATORIO_ROMANEIO_REQUERIMENTO    (const rempresa,rmestre:integer)  :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas      ('SELECT * FROM EMPRESAS      WHERE CODIGO     = ' + IntToStr(rempresa));
  TabelaRomaneio      ('SELECT * FROM ROMANEIO      WHERE CODIGO     = ' + IntToStr(rmestre));

  TabelaRomaneioItens (' SELECT                                                                         ' +
                       ' p.endereco,                                                                    ' +
                       ' p.cidade,                                                                      ' +
                       ' p.estado,                                                                      ' +
                       ' p.nome,                                                                        ' +
                       ' r.pessoa,                                                                      ' +
                       ' p.numero,                                                                      ' +
                       ' r.produto,                                                                     ' +
                       ' r.descricao,                                                                   ' +
                       ' r.quantidade,                                                                  ' +
                       ' r.sacos,                                                                       ' +
                       ' case when r.sacos > 0 then coalesce(r.quantidade / r.sacos,2) else 0 end TOTAL ' +
                       ' FROM ROMANEIOITENS r inner join pessoas p on (p.codigo = r.pessoa)             ' +
                       ' WHERE r.MESTRE_ID                                                           =  ' + IntToStr(rmestre) +
                       ' ORDER BY r.CODIGO');

  TabelaTransporte    ('SELECT * FROM TRANSPORTES   WHERE CODIGO     = ' + IntToStr(DM_RC.fdqryromaneio.FindField('MOTORISTA').AsInteger));

  with ldm do
    begin
      frxReport.Script.Variables['MOTORISTA']   := dm_rc.fdqryromaneio.FindField('NOME').AsString;
      frxReport.Script.Variables['PLACA']       := dm_rc.fdqryromaneio.FindField('PLACA').AsString;
      frxReport.Script.Variables['NUMERO']      := StrZeroS(dm_rc.fdqryromaneio.FindField('CODIGO').AsString,5);


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.fdqryromaneioitens;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'romaneio_requerimento.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    dm_rc.sqlBuscas.Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_RELACAOCHEQUE            (const rempresa:integer;dataini,datafin,tipo,ordem:string;table:TFDMemTable)  :string;
begin

  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas      ('SELECT * FROM EMPRESAS      WHERE CODIGO     = ' + IntToStr(rempresa));
  table.IndexFieldNames := 'STATUS';

  with ldm do
    begin
      frxReport.Script.Variables['EMISSAO']       := dataini;
      frxReport.Script.Variables['EMISSAOATE']    := datafin;
      frxReport.Script.Variables['FANTASIA']      := dm_rc.tbempresas.findfield('FANTASIA').asstring;
      frxReport.Script.Variables['TIPO']          := tipo;


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'relacaocheques.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    dm_rc.sqlBuscas.Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_RELACAOLOTEINTERNO       (const rempresa:integer;ordem,tipo,sql:string):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas      ('SELECT * FROM EMPRESAS      WHERE CODIGO     = ' + IntToStr(rempresa));
  SqlPesquisa(sql);

  with ldm do
    begin

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.sqlBuscas;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'relacaolote_interno.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      case StrToInt(tipo) of
        0: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."BARRACAO">';
        1: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."PRODUTO">';
        2: TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."GRUPO">';
      end;


      case StrToInt(tipo) of
        0: TfrxMemoView(frxReport.FindComponent('Memo4')).Memo.Add('BARRACÃO - [frxDBDataset."BARRACAO"]');
        1: TfrxMemoView(frxReport.FindComponent('Memo4')).Memo.Add('PRODUTO - [frxDBDataset."DESCRICAO"]');
        2: TfrxMemoView(frxReport.FindComponent('Memo4')).Memo.Add('GRUPO - [frxDBDataset."NOMEGRUPO"]');
      end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    dm_rc.sqlBuscas.Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_RELATORIOSALDOEFEP       (const rempresa:integer;produtoini,produtofin,pessoaini,pessoafin,dataini,datafin,sql:string):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas      ('SELECT * FROM EMPRESAS      WHERE CODIGO     = ' + IntToStr(rempresa));
  SqlPesquisa(sql);

  with ldm do
    begin

      frxReport.Script.Variables['DATAINI']       := dataini;
      frxReport.Script.Variables['DATAFIN']       := datafin;
      frxReport.Script.Variables['PRODUTOINI']    := produtoini;
      frxReport.Script.Variables['PRODUTOFIN']    := produtoini;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.sqlBuscas;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'relatoriosaldoefep.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    dm_rc.sqlBuscas.Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_extratofinanceiropessoa(scredito,sdebito,ssaldo:real;dataini,datafin:string;rempresa,rpessoa:integer;table:TFDMemTable)    :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas('SELECT * FROM EMPRESAS WHERE CODIGO = ' + IntToStr(rempresa));
  TabelaPessoas ('SELECT * FROM PESSOAS  WHERE CODIGO = ' + IntToStr(rpessoa));
  SqlPesquisa   ('SELECT * FROM RECEBER  WHERE PESSOA = ' + IntToStr(rpessoa)  +
                 'AND FINANCEIRO                      = ' + IntToStr(1)        +
                 'AND SITUACAO                        = ' + QuotedStr('Aberto')+
                 'order by VENCIMENTO DESC');

  with ldm do
    begin
      if dm_rc.sqlBuscas.RecordCount > 0 then
        dm_rc.sqlBuscas.First;

      frxReport.Script.Variables['DATAINI']    := dataini;
      frxReport.Script.Variables['DATAFIN']    := datafin;

      frxReport.Script.Variables['DEBITO']     := sdebito;
      frxReport.Script.Variables['CREDITO']    := scredito;
      frxReport.Script.Variables['SALDO']      := ssaldo;

      frxReport.Script.Variables['NOME']       := dm_rc.FDQryPessoas.FindField('NOME').AsString;
      frxReport.Script.Variables['ENDERECO']   := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString;
      frxReport.Script.Variables['BAIRRO']     := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
      frxReport.Script.Variables['CEP']        := FORMATA_CEP(dm_rc.FDQryPessoas.FindField('CEP').AsString);
      frxReport.Script.Variables['CIDADE']     := dm_rc.FDQryPessoas.FindField('CIDADE').AsString + '/'+dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
      frxReport.Script.Variables['TELEFONE']   := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
      frxReport.Script.Variables['CELULAR']    := dm_rc.FDQryPessoas.FindField('CELULAR').AsString;
      frxReport.Script.Variables['EMAIL']      := LowerCase(dm_rc.FDQryPessoas.FindField('EMAIL').AsString);


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;
      frxDBDatasetTitulos.DataSet         := dm_rc.sqlBuscas;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'extratopessoa.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;


  try
    ldm.Free;
    dm_rc.sqlBuscas.Close;
  finally
    Result := M_ARQUIVO;
  end;

end;

function IMPRESSAO_solicitacao (pempresa,psolicitacao:integer;psavar:Boolean;tipo:string) :string;
var
  nomearqsolicitacao:string;
  caminhoraiz       :string;
begin

  TabelaEmpresas        ('SELECT * FROM EMPRESAS          WHERE CODIGO    = ' + IntToStr(pempresa));
  SqlPesquisa           ('SELECT * FROM SOLICITACAO       WHERE CODIGO    = ' + IntToStr(psolicitacao));
  TabelaResponsavel     ('SELECT * FROM RESPONSAVEL       WHERE CODIGO    = ' + IntToStr(DM_RC.sqlBuscas.FindField('RESPONSAVEL').AsInteger));
  TabelaLaboratorio     ('SELECT * FROM LABORATORIO       WHERE CODIGO    = ' + IntToStr(DM_RC.sqlBuscas.FindField('LABORATORIO').AsInteger));
  SqlPesquisaPrimeira   ('SELECT * FROM RESPONSAVEL       WHERE CODIGO    = ' + IntToStr(DM_RC.sqlBuscas.FindField('AMOSTRADOR').AsInteger));
  TabelaSolicitacaoItens('SELECT * FROM SOLICITACAO_ITENS WHERE MESTRE_ID = ' + IntToStr(psolicitacao) + ' ORDER BY SEQUENCIA');

  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  if psavar = True then
    begin
      caminhoraiz        := extractfilepath(Application.ExeName);
      forceDirectories(caminhoraiz+caminhosolicitacao);
      nomearqsolicitacao := 'SOLICITACAO_TERMOEMBALAGEM_' + M_ARQUIVO;
    end;

  if DM_RC.sqlBuscas.FindField('CAMINHO').AsString = '' then
    begin
      with ldm do
        begin
          frxReport.Script.Variables['REVESTIDAS']     := variif(dm_rc.sqlBuscas.FindField('REVESTIDAS').AsString     = 'Sim','X','');

          if DM_RC.sqlBuscas.FindField('FINALIDADE').AsString = 'BAS' then
            begin
              frxReport.Script.Variables['BAS']    := 'X';
              frxReport.Script.Variables['IR']     := '';
            end
          else
            begin
              frxReport.Script.Variables['BAS']    := '';
              frxReport.Script.Variables['IR']     := 'X';
            end;

          if DM_RC.sqlBuscas.FindField('TRATADA').AsString = 'Sim' then
            begin
              frxReport.Script.Variables['SIM']    := 'X';
              frxReport.Script.Variables['NAO']    := '';
            end
          else
            begin
              frxReport.Script.Variables['SIM']    := '';
              frxReport.Script.Variables['NAO']    := 'X';
            end;

          frxReport.Script.Variables['EMPFAN']               := dm_rc.tbempresas.FindField('FANTASIA').AsString;

          frxReport.Script.Variables['NOME_REMETENTE']       := tratanome(dm_rc.tbempresas.FindField('NOME').AsString);
          frxReport.Script.Variables['CNPJ_REMETENTE']       := Formata_Cnpj(dm_rc.tbempresas.FindField('CNPJ').AsString);
          frxReport.Script.Variables['ENDERECO_REMETENTE']   := tratanome(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' ' +
                                                                dm_rc.tbempresas.FindField('NUMERO').AsString   + ' ' +
                                                                tratanome(dm_rc.tbempresas.FindField('BAIRRO').AsString);

          frxReport.Script.Variables['CIDADE_REMETENTE']     := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString);
          frxReport.Script.Variables['RENASEM_REMETENTE']    := dm_rc.tbempresas.FindField('RENASEM').AsString;
          frxReport.Script.Variables['INSCRICAO_REMETENTE']  := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['ESTADO_REMETENTE']     := dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['CEP_REMETENTE']        := FORMATA_CEP(dm_rc.tbempresas.FindField('CEP').AsString);
          frxReport.Script.Variables['TELEFONE_REMETENTE']   := dm_rc.tbempresas.FindField('TELEFONE').AsString + ' ' + dm_rc.tbempresas.FindField('CELULAR').AsString;

          frxReport.Script.Variables['PUREZA']               := variif(dm_rc.sqlBuscas.FindField('ANA_PUREZA').AsString = 'T','X','');
          frxReport.Script.Variables['DOSN']                 := variif(dm_rc.sqlBuscas.FindField('ANA_DSON').AsString   = 'T','X','');
          frxReport.Script.Variables['TETRAZOLIO']           := variif(dm_rc.sqlBuscas.FindField('ANA_TZ').AsString     = 'T','X','');
          frxReport.Script.Variables['GERMINACAO']           := variif(dm_rc.sqlBuscas.FindField('ANA_GER').AsString    = 'T','X','');
          frxReport.Script.Variables['UMIDADE']              := variif(dm_rc.sqlBuscas.FindField('ANA_UMI').AsString    = 'T','X','');
          frxReport.Script.Variables['PMS']                  := variif(dm_rc.sqlBuscas.FindField('ANA_PMS').AsString    = 'T','X','');
          frxReport.Script.Variables['VE']                   := variif(dm_rc.sqlBuscas.FindField('ANA_VE').AsString     = 'T','X','');
          frxReport.Script.Variables['SI']                   := variif(dm_rc.sqlBuscas.FindField('ANA_SI').AsString     = 'T','X','');
          frxReport.Script.Variables['NOME_AMOSTRADOR']      := tratanome(dm_rc.sqlpesquisaprimaria.FindField('NOME').AsString);

          if tipo = 'A' then
            begin
              frxReport.Script.Variables['NOME_RESPONSAVEL']     := tratanome(dm_rc.sqlpesquisaprimaria.FindField('NOME').AsString);
              frxReport.Script.Variables['RENASEM_AMOSTRADOR']   := dm_rc.sqlpesquisaprimaria.FindField('CREDENCIAL').AsString;
            end
          else
            begin
              frxReport.Script.Variables['NOME_RESPONSAVEL']     := tratanome(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
              frxReport.Script.Variables['RENASEM_AMOSTRADOR']   := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
            end;


          frxPDFExport.Author                 := 'Sistema Sisgraos';
          frxPDFExport.Creator                := 'Sisgraos';
          frxPDFExport.DefaultPath            := varIIF(psavar = True,caminhoraiz+caminhosolicitacao ,mm.M_PATHIMPRESSAO);
          frxPDFExport.FileName               := varIIF(psavar = True,nomearqsolicitacao             ,M_ARQUIVO);
          frxPDFExport.OpenAfterExport        := False;
          frxPDFExport.ShowDialog             := False;
          frxPDFExport.ShowProgress           := False;
          frxPDFExport.OverwritePrompt        := False;
          frxDBDataset.DataSet                := dm_rc.fdqrysolicitacaoitens;

          frxReport.Clear;
          frxReport.LoadFromFile(mm.M_FASTREPORT+'solicitacaoanalise_termoembalagem.fr3');

          if ( FileExists(mm.M_IMAGEM)) then
              begin
                TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
              end;


          if psavar = True then
            begin
              if ( FileExists(dm_rc.FDQryResponsavel.FindField('ASSINATURA').AsString)) then
                  begin
                    TfrxPictureView(frxReport.FindComponent('Pictureassinado')).Picture.LoadFromFile(dm_rc.FDQryResponsavel.FindField('ASSINATURA').AsString);
                  end;

              if psavar = True then
                executasql(' update solicitacao set caminho = ' + QuotedStr(caminhoraiz+caminhosolicitacao+nomearqsolicitacao) +
                           ' where codigo                   = ' + IntToStr(psolicitacao));
            end;

          frxReport.PrepareReport(True);
          frxReport.Export(frxPDFExport);
        end;
    end
  else
    begin
      CopyFile(pchar(DM_RC.sqlBuscas.FindField('CAMINHO').AsString),pchar(mm.M_PATHIMPRESSAO+ExtractFileName(DM_RC.sqlBuscas.FindField('CAMINHO').AsString)),true);
      M_ARQUIVO :=  ExtractFileName(DM_RC.sqlBuscas.FindField('CAMINHO').AsString);
    end;

{
  else
  if dm_rc.fdqrylaboratorio.FindField('CPFCNPJ').AsString = '13234470000161' then //LASSA
    begin
      if psavar = True then
        begin
          caminhoraiz        := extractfilepath(Application.ExeName);
          forceDirectories(caminhoraiz+caminhosolicitacao);
          nomearqsolicitacao := 'SOLICITACAO_LASSA_' + M_ARQUIVO;
        end;

      if DM_RC.sqlBuscas.FindField('CAMINHO').AsString = '' then
        begin
          with ldm do
            begin
              if DM_RC.sqlBuscas.FindField('FINALIDADE').AsString = 'BAS' then
                begin
                  frxReport.Script.Variables['BAS']    := 'X';
                  frxReport.Script.Variables['IR']     := '';
                end
              else
                begin
                  frxReport.Script.Variables['BAS']    := '';
                  frxReport.Script.Variables['IR']     := 'X';
                end;

              frxReport.Script.Variables['NOME_REMETENTE']       := UpperCase(dm_rc.tbempresas.FindField('NOME').AsString);
              frxReport.Script.Variables['CPFCNPJ_REMETENTE']    := Formata_Cnpj(dm_rc.tbempresas.FindField('CNPJ').AsString);
              frxReport.Script.Variables['ENDERECO_REMETENTE']   := UpperCase(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' ' +
                                                                    dm_rc.tbempresas.FindField('NUMERO').AsString              + ' ' +
                                                                    UpperCase(dm_rc.tbempresas.FindField('BAIRRO').AsString);

              frxReport.Script.Variables['CIDADE_REMETENTE']     := UpperCase(dm_rc.tbempresas.FindField('CIDADE').AsString);
              frxReport.Script.Variables['RENASEM_REMETENTE']    := dm_rc.tbempresas.FindField('RENASEM').AsString;
              frxReport.Script.Variables['INSCRICAO_REMETENTE']  := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
              frxReport.Script.Variables['ESTADO_REMETENTE']     := dm_rc.tbempresas.FindField('ESTADO').AsString;
              frxReport.Script.Variables['CEP_REMETENTE']        := FORMATA_CEP(dm_rc.tbempresas.FindField('CEP').AsString);
              frxReport.Script.Variables['TELEFONE_REMETENTE']   := dm_rc.tbempresas.FindField('TELEFONE').AsString + ' ' + dm_rc.tbempresas.FindField('CELULAR').AsString;

              frxReport.Script.Variables['EMISSAO_AMOSTRAGEM']   := dm_rc.sqlBuscas.FindField('EMISSAO').AsString;

              frxReport.Script.Variables['PUREZA']               := variif(dm_rc.sqlBuscas.FindField('ANA_PUREZA').AsString = 'T','X','');
              frxReport.Script.Variables['DOSN']                 := variif(dm_rc.sqlBuscas.FindField('ANA_DSON').AsString   = 'T','X','');
              frxReport.Script.Variables['TETRAZOLIO']           := variif(dm_rc.sqlBuscas.FindField('ANA_TZ').AsString     = 'T','X','');
              frxReport.Script.Variables['GERMINACAO']           := variif(dm_rc.sqlBuscas.FindField('ANA_GER').AsString    = 'T','X','');
              frxReport.Script.Variables['UMIDADE']              := variif(dm_rc.sqlBuscas.FindField('ANA_UMI').AsString    = 'T','X','');
              frxReport.Script.Variables['PMS']                  := variif(dm_rc.sqlBuscas.FindField('ANA_PMS').AsString    = 'T','X','');
              frxReport.Script.Variables['SI']                   := variif(dm_rc.sqlBuscas.FindField('ANA_SI').AsString     = 'T','X','');
              frxReport.Script.Variables['UMIDADE']              := variif(dm_rc.sqlBuscas.FindField('ANA_UMI').AsString    = 'T','X','');
              frxReport.Script.Variables['VE']                   := variif(dm_rc.sqlBuscas.FindField('ANA_VE').AsString     = 'T','X','');
              frxReport.Script.Variables['VOC']                  := variif(dm_rc.sqlBuscas.FindField('ANA_VOC').AsString    = 'T','X','');

              frxReport.Script.Variables['NOME_AMOSTRADOR']      := UpperCase(dm_rc.sqlpesquisaprimaria.FindField('NOME').AsString);
              frxReport.Script.Variables['RENASEM_AMOSTRADOR']   := dm_rc.sqlpesquisaprimaria.FindField('CREA').AsString;
              frxReport.Script.Variables['CPF_AMOSTRADOR']       := Formata_Cnpj(dm_rc.sqlpesquisaprimaria.FindField('CPFCNPJ').AsString);


              frxPDFExport.Author                 := 'Sistema Sisgraos';
              frxPDFExport.Creator                := 'Sisgraos';
              frxPDFExport.DefaultPath            := varIIF(psavar = True,caminhoraiz+caminhosolicitacao ,mm.M_PATHIMPRESSAO);
              frxPDFExport.FileName               := varIIF(psavar = True,nomearqsolicitacao             ,M_ARQUIVO);
              frxPDFExport.OpenAfterExport        := False;
              frxPDFExport.ShowDialog             := False;
              frxPDFExport.ShowProgress           := False;
              frxPDFExport.OverwritePrompt        := False;
              frxDBDataset.DataSet                := dm_rc.fdqrysolicitacaoitens;

              frxReport.Clear;
              frxReport.LoadFromFile(mm.M_FASTREPORT+'solicitacaoanalise_LASSA.fr3');

              if psavar = True then
                begin
                  if ( FileExists(dm_rc.FDQryResponsavel.FindField('ASSINATURA').AsString)) then
                      begin
                        TfrxPictureView(frxReport.FindComponent('Pictureassinado')).Picture.LoadFromFile(dm_rc.FDQryResponsavel.FindField('ASSINATURA').AsString);
                      end;
                end;

              if psavar = True then
                executasql(' update solicitacao set caminho = ' + QuotedStr(caminhoraiz+caminhosolicitacao+nomearqsolicitacao) +
                           ' where codigo                   = ' + IntToStr(psolicitacao));

              frxReport.PrepareReport(True);
              frxReport.Export(frxPDFExport);
            end;
        end
      else
        begin
          CopyFile(pchar(DM_RC.sqlBuscas.FindField('CAMINHO').AsString),pchar(mm.M_PATHIMPRESSAO+ExtractFileName(DM_RC.sqlBuscas.FindField('CAMINHO').AsString)),true);
          M_ARQUIVO :=  ExtractFileName(DM_RC.sqlBuscas.FindField('CAMINHO').AsString);
        end;
    end
  else
  if dm_rc.fdqrylaboratorio.FindField('CPFCNPJ').AsString = '04958108000142' then //PAPINI
    begin
      if psavar = True then
        begin
          caminhoraiz        := extractfilepath(Application.ExeName);
          forceDirectories(caminhoraiz+caminhosolicitacao);
          nomearqsolicitacao := 'SOLICITACAO_PAPINI_' + M_ARQUIVO;
        end;

      if DM_RC.sqlBuscas.FindField('CAMINHO').AsString = '' then
        begin
          with ldm do
            begin
              if DM_RC.sqlBuscas.FindField('FINALIDADE').AsString = 'BAS' then
                begin
                  frxReport.Script.Variables['BAS']    := 'X';
                  frxReport.Script.Variables['IR']     := '';
                end
              else
                begin
                  frxReport.Script.Variables['BAS']    := '';
                  frxReport.Script.Variables['IR']     := 'X';
                end;

              frxReport.Script.Variables['NOME_REMETENTE']       := UpperCase(dm_rc.tbempresas.FindField('NOME').AsString);
              frxReport.Script.Variables['ENDERECO_REMETENTE']   := UpperCase(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' ' +
                                                                    dm_rc.tbempresas.FindField('NUMERO').AsString              + ' ' +
                                                                    UpperCase(dm_rc.tbempresas.FindField('BAIRRO').AsString);

              frxReport.Script.Variables['CIDADE_REMETENTE']     := UpperCase(dm_rc.tbempresas.FindField('CIDADE').AsString) + '/'+ dm_rc.tbempresas.FindField('ESTADO').AsString;
              frxReport.Script.Variables['RENASEM_REMETENTE']    := dm_rc.tbempresas.FindField('RENASEM').AsString;


              frxReport.Script.Variables['PUREZA']               := variif(dm_rc.sqlBuscas.FindField('ANA_PUREZA').AsString = 'T','X','');
              frxReport.Script.Variables['DOSN']                 := variif(dm_rc.sqlBuscas.FindField('ANA_DSON').AsString   = 'T','X','');
              frxReport.Script.Variables['TETRAZOLIO']           := variif(dm_rc.sqlBuscas.FindField('ANA_TZ').AsString     = 'T','X','');
              frxReport.Script.Variables['GERMINACAO']           := variif(dm_rc.sqlBuscas.FindField('ANA_GER').AsString    = 'T','X','');
              frxReport.Script.Variables['PMS']                  := variif(dm_rc.sqlBuscas.FindField('ANA_PMS').AsString    = 'T','X','');
              frxReport.Script.Variables['SI']                   := variif(dm_rc.sqlBuscas.FindField('ANA_SI').AsString     = 'T','X','');
              frxReport.Script.Variables['VE']                   := variif(dm_rc.sqlBuscas.FindField('ANA_VE').AsString     = 'T','X','');
              frxReport.Script.Variables['VOC']                  := variif(dm_rc.sqlBuscas.FindField('ANA_VOC').AsString    = 'T','X','');

              frxReport.Script.Variables['NOME_AMOSTRADOR']      := UpperCase(dm_rc.sqlpesquisaprimaria.FindField('NOME').AsString);
              frxReport.Script.Variables['RENASEM_AMOSTRADOR']   := dm_rc.sqlpesquisaprimaria.FindField('CREA').AsString;
              frxReport.Script.Variables['NOME_RESPONSAVEL']     := UpperCase(dm_rc.sqlpesquisaprimaria.FindField('NOME').AsString);


              frxPDFExport.Author                 := 'Sistema Sisgraos';
              frxPDFExport.Creator                := 'Sisgraos';
              frxPDFExport.DefaultPath            := varIIF(psavar = True,caminhoraiz+caminhosolicitacao ,mm.M_PATHIMPRESSAO);
              frxPDFExport.FileName               := varIIF(psavar = True,nomearqsolicitacao             ,M_ARQUIVO);
              frxPDFExport.OpenAfterExport        := False;
              frxPDFExport.ShowDialog             := False;
              frxPDFExport.ShowProgress           := False;
              frxPDFExport.OverwritePrompt        := False;
              frxDBDataset.DataSet                := dm_rc.fdqrysolicitacaoitens;

              frxReport.Clear;
              frxReport.LoadFromFile(mm.M_FASTREPORT+'solicitacaoanalise_PAPINI.fr3');

              if psavar = True then
                begin
                  if ( FileExists(dm_rc.FDQryResponsavel.FindField('ASSINATURA').AsString)) then
                      begin
                        TfrxPictureView(frxReport.FindComponent('Pictureassinado')).Picture.LoadFromFile(dm_rc.FDQryResponsavel.FindField('ASSINATURA').AsString);
                      end;
                end;

              if psavar = True then
                executasql(' update solicitacao set caminho = ' + QuotedStr(caminhoraiz+caminhosolicitacao+nomearqsolicitacao) +
                           ' where codigo                   = ' + IntToStr(psolicitacao));

              frxReport.PrepareReport(True);
              frxReport.Export(frxPDFExport);
            end;
        end
      else
        begin
          CopyFile(pchar(DM_RC.sqlBuscas.FindField('CAMINHO').AsString),pchar(mm.M_PATHIMPRESSAO+ExtractFileName(DM_RC.sqlBuscas.FindField('CAMINHO').AsString)),true);
          M_ARQUIVO :=  ExtractFileName(DM_RC.sqlBuscas.FindField('CAMINHO').AsString);
        end;
    end
  else
    begin
      if psavar = True then
        begin
          caminhoraiz        := extractfilepath(Application.ExeName);
          forceDirectories(caminhoraiz+caminhosolicitacao);
          nomearqsolicitacao := 'SOLICITACAO_GERAL_' + M_ARQUIVO;
        end;

      if DM_RC.sqlBuscas.FindField('CAMINHO').AsString = '' then
        begin
          with ldm do
            begin
              if DM_RC.sqlBuscas.FindField('FINALIDADE').AsString = 'BAS' then
                begin
                  frxReport.Script.Variables['BAS']    := 'X';
                  frxReport.Script.Variables['IR']     := '';
                end
              else
                begin
                  frxReport.Script.Variables['BAS']    := '';
                  frxReport.Script.Variables['IR']     := 'X';
                end;

              frxReport.Script.Variables['EMPFAN']               := dm_rc.tbempresas.FindField('DESCRICAO').AsString;
              frxReport.Script.Variables['NOME_REMETENTE']       := UpperCase(dm_rc.tbempresas.FindField('NOME').AsString);
              frxReport.Script.Variables['ENDERECO_REMETENTE']   := UpperCase(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' ' +
                                                                    dm_rc.tbempresas.FindField('NUMERO').AsString              + ' ' +
                                                                    UpperCase(dm_rc.tbempresas.FindField('BAIRRO').AsString);

              frxReport.Script.Variables['CIDADE_REMETENTE']     := UpperCase(dm_rc.tbempresas.FindField('CIDADE').AsString) + '/'+ dm_rc.tbempresas.FindField('ESTADO').AsString;
              frxReport.Script.Variables['RENASEM_REMETENTE']    := dm_rc.tbempresas.FindField('RENASEM').AsString;


              frxReport.Script.Variables['PUREZA']               := variif(dm_rc.sqlBuscas.FindField('ANA_PUREZA').AsString = 'T','X','');
              frxReport.Script.Variables['DOSN']                 := variif(dm_rc.sqlBuscas.FindField('ANA_DSON').AsString   = 'T','X','');
              frxReport.Script.Variables['TETRAZOLIO']           := variif(dm_rc.sqlBuscas.FindField('ANA_TZ').AsString     = 'T','X','');
              frxReport.Script.Variables['GERMINACAO']           := variif(dm_rc.sqlBuscas.FindField('ANA_GER').AsString    = 'T','X','');
              frxReport.Script.Variables['PMS']                  := variif(dm_rc.sqlBuscas.FindField('ANA_PMS').AsString    = 'T','X','');
              frxReport.Script.Variables['SI']                   := variif(dm_rc.sqlBuscas.FindField('ANA_SI').AsString     = 'T','X','');
              frxReport.Script.Variables['VE']                   := variif(dm_rc.sqlBuscas.FindField('ANA_VE').AsString     = 'T','X','');
              frxReport.Script.Variables['VOC']                  := variif(dm_rc.sqlBuscas.FindField('ANA_VOC').AsString    = 'T','X','');

              frxReport.Script.Variables['NOME_AMOSTRADOR']      := UpperCase(dm_rc.sqlpesquisaprimaria.FindField('NOME').AsString);
              frxReport.Script.Variables['RENASEM_AMOSTRADOR']   := dm_rc.sqlpesquisaprimaria.FindField('CREA').AsString;
              frxReport.Script.Variables['NOME_RESPONSAVEL']     := UpperCase(dm_rc.sqlpesquisaprimaria.FindField('NOME').AsString);


              frxPDFExport.Author                 := 'Sistema Sisgraos';
              frxPDFExport.Creator                := 'Sisgraos';
              frxPDFExport.DefaultPath            := varIIF(psavar = True,caminhoraiz+caminhosolicitacao ,mm.M_PATHIMPRESSAO);
              frxPDFExport.FileName               := varIIF(psavar = True,nomearqsolicitacao             ,M_ARQUIVO);
              frxPDFExport.OpenAfterExport        := False;
              frxPDFExport.ShowDialog             := False;
              frxPDFExport.ShowProgress           := False;
              frxPDFExport.OverwritePrompt        := False;
              frxDBDataset.DataSet                := dm_rc.fdqrysolicitacaoitens;

              frxReport.Clear;
              frxReport.LoadFromFile(mm.M_FASTREPORT+'solicitacaoanalise_GERAL.fr3');

              if ( FileExists(mm.M_IMAGEM)) then
                  begin
                    TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
                  end;

              if psavar = True then
                begin
                  if ( FileExists(dm_rc.FDQryResponsavel.FindField('ASSINATURA').AsString)) then
                      begin
                        TfrxPictureView(frxReport.FindComponent('Pictureassinado')).Picture.LoadFromFile(dm_rc.FDQryResponsavel.FindField('ASSINATURA').AsString);
                      end;
                end;

              if psavar = True then
                executasql(' update solicitacao set caminho = ' + QuotedStr(caminhoraiz+caminhosolicitacao+nomearqsolicitacao) +
                           ' where codigo                   = ' + IntToStr(psolicitacao));

              frxReport.PrepareReport(True);
              frxReport.Export(frxPDFExport);
            end;
        end
      else
        begin
          CopyFile(pchar(DM_RC.sqlBuscas.FindField('CAMINHO').AsString),pchar(mm.M_PATHIMPRESSAO+ExtractFileName(DM_RC.sqlBuscas.FindField('CAMINHO').AsString)),true);
          M_ARQUIVO :=  ExtractFileName(DM_RC.sqlBuscas.FindField('CAMINHO').AsString);
        end;
    end;
}

  try
    ldm  .Free;
    dm_rc.sqlBuscas            .Close;
    dm_rc.tbempresas           .Close;
    dm_rc.FDQryResponsavel     .Close;
    dm_rc.fdqrylaboratorio     .Close;
    dm_rc.sqlpesquisaprimaria  .Close;
    dm_rc.fdqrysolicitacaoitens.Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_CustoProducao    (pempresa,pmestre:integer)                                                      :string;
var
  qtdesacos,pesosaco:Real;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  qtdesacos              := 0;

  TabelaCustoProducao('select * from custo_producao  where codigo = ' + IntToStr(pmestre));
  SqlPesquisa        ('select * from PRODUCAOINTERNA where codigo = ' + IntToStr(dm_rc.fdqrycustoproducao.FindField('MESTRE_ID').AsInteger));

  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['PUREZA']                   := dm_rc.sqlBuscas.FindField('PUREZA').AsFloat;
          frxReport.Script.Variables['CODIGOP']                  := dm_rc.sqlBuscas.FindField('PADRAO').AsString;
          frxReport.Script.Variables['FAMILIA']                  := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;

          if dm_rc.sqlBuscas.FindField('SACO_10KG').AsString = 'T' then
            begin
              frxReport.Script.Variables['PESOSACO']               := '10 Kg.';
              pesosaco                                             := 10;
            end
          else
          if dm_rc.sqlBuscas.FindField('SACO_15KG').AsString = 'T' then
            begin
              frxReport.Script.Variables['PESOSACO']               := '15 Kg.';
              pesosaco                                             := 15;
            end
          else
          if dm_rc.sqlBuscas.FindField('SACO_20KG').AsString = 'T' then
            begin
              frxReport.Script.Variables['PESOSACO']               := '20 Kg.';
              pesosaco                                             := 20;
            end;

          qtdesacos := dm_rc.sqlBuscas.FindField('TOTALKG').AsFloat / pesosaco;

          frxReport.Script.Variables['SACOS']                    := qtdesacos;

          frxReport.Script.Variables['PRODUCAO_TONELADA']        := dm_rc.fdqrycustoproducao.FindField('VALORFRETETONELADA').AsString;
          frxReport.Script.Variables['PRODUCAO_MARGEM']          := dm_rc.fdqrycustoproducao.FindField('MARGEMLUCRO').AsString;
          frxReport.Script.Variables['PRODUCAO_COMISSAO']        := dm_rc.fdqrycustoproducao.FindField('COMISSAO').AsString;
          frxReport.Script.Variables['PRODUCAO_IMPOSTO']         := dm_rc.fdqrycustoproducao.FindField('IMPOSTO').AsString;
          frxReport.Script.Variables['PRODUCAO_PRAZO']           := dm_rc.fdqrycustoproducao.FindField('PERCVENDAPRAZO').AsString;

          frxReport.Script.Variables['PRODUCAO_INFO']            := dm_rc.fdqrycustoproducao.FindField('PAINEL_INFO').AsString;
          frxReport.Script.Variables['PRODUCAO_EXTRATO']         := dm_rc.fdqrycustoproducao.FindField('PAINEL_PRODUCAO').AsString;
          frxReport.Script.Variables['PRODUCAO_TAXAS']           := dm_rc.fdqrycustoproducao.FindField('PAINEL_TAXAS').AsString;
          frxReport.Script.Variables['PRODUCAO_VENDAS']          := dm_rc.fdqrycustoproducao.FindField('PAINEL_VENDAS').AsString;
        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.fdqryproducaointernaitens;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'impressaoproducao_custos.fr3');

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm  .Free;
    dm_rc.fdqrycustoproducao.Close;
  finally
    Result := M_ARQUIVO;
  end;

end;
function IMPRESSAO_producaointerna  (pempresa,pmestre:integer)                                                      :string;
begin
  TabelaEmpresas        ('SELECT * FROM EMPRESAS          WHERE CODIGO    = ' + IntToStr(pempresa));
  SqlPesquisa           ('SELECT * FROM PRODUCAOINTERNA   WHERE CODIGO    = ' + IntToStr(pmestre));
  TabelaProducaoItens   (
                         ' SELECT                                                                          ' +
                         '   li.tipo,                                                                      ' +
                         '   pi.lote,                                                                      ' +
                         '   pi.descricao,                                                                 ' +
                         '   pi.perc,                                                                      ' +
                         '   pi.quantidade                                                                 ' +
                         ' from                                                                            ' +
                         '   producaointerna_itens  pi inner join loteinterno li on (pi.lote = li.lote)    ' +
                         '   where pi.mestre_id =                                                          ' + IntToStr(pmestre) +
                         ' order by pi.sequencia asc');

  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['NUMERO']           := dm_rc.sqlBuscas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['PRODUTO']          := dm_rc.sqlBuscas.FindField('PRODUTO').AsString;
          frxReport.Script.Variables['DESCRICAO']        := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
          frxReport.Script.Variables['CODIGOP']          := dm_rc.sqlBuscas.FindField('PADRAO').AsString;
          frxReport.Script.Variables['MARCA']            := dm_rc.sqlBuscas.FindField('SACARIA').AsString;

          frxReport.Script.Variables['10KG']             := varIIF(dm_rc.sqlBuscas.FindField('SACO_10KG').AsString           = 'T','(X)','( )');
          frxReport.Script.Variables['15KG']             := varIIF(dm_rc.sqlBuscas.FindField('SACO_15KG').AsString           = 'T','(X)','( )');
          frxReport.Script.Variables['20KG']             := varIIF(dm_rc.sqlBuscas.FindField('SACO_20KG').AsString           = 'T','(X)','( )');
        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.fdqryproducaointernaitens;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'impressaoproducao_interna.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;


  try
    ldm  .Free;
  finally
    Result := M_ARQUIVO;
  end;


end;
function IMPRESSAO_termocoleta      (pempresa,psolicitacao:integer)                                                 :string;
begin
  TabelaEmpresas        ('SELECT * FROM EMPRESAS          WHERE CODIGO    = ' + IntToStr(pempresa));
  TabelaSolicitacao     ('SELECT * FROM SOLICITACAO       WHERE CODIGO    = ' + IntToStr(psolicitacao));
  TabelaSolicitacaoItens('SELECT * FROM SOLICITACAO_ITENS WHERE MESTRE_ID = ' + IntToStr(psolicitacao) + ' ORDER BY SEQUENCIA');

  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['EMPNOME']          := dm_rc.tbempresas.FindField('NOME').AsString;
          frxReport.Script.Variables['EMPCPFCNPJ']       := Formata_Cnpj(dm_rc.tbempresas.FindField('CNPJ').AsString);
          frxReport.Script.Variables['EMPENDERECO']      := tratanome(dm_rc.tbempresas.FindField('NOME').AsString) + ' ' + dm_rc.tbempresas.FindField('NUMERO').AsString + ' '+
                                                            tratanome(dm_rc.tbempresas.FindField('BAIRRO').AsString);
          frxReport.Script.Variables['EMPCIDADE']        := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + '/'+ dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['EMPCEP']           := FORMATA_CEP(dm_rc.tbempresas.FindField('CEP').AsString);


          frxReport.Script.Variables['NUMERO_TERMO']     := dm_rc.fdqrysolicitacao.FindField('NUMERO_TERMO').AsString;
          frxReport.Script.Variables['CERTIFICADOR']     := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_CERTIFICADOR').AsString  = 'T','X',' ');
          frxReport.Script.Variables['PRODUTOR']         := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_PRODUTOR').AsString      = 'T','X',' ');
          frxReport.Script.Variables['REEMBALADOR']      := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_REEMBLADOR').AsString    = 'T','X',' ');

          frxReport.Script.Variables['PUREZA']           := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_PUREZA').AsString        = 'T','X',' ');
          frxReport.Script.Variables['GERMINACAO']       := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_GERMINACAO').AsString    = 'T','X',' ');
          frxReport.Script.Variables['VIABILIDADE']      := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_VIABILIDADE').AsString   = 'T','X',' ');
          frxReport.Script.Variables['PORCENTAGEM']      := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_PERCRET').AsString       = 'T','X',' ');
          frxReport.Script.Variables['PMS']              := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_PMS').AsString           = 'T','X',' ');
          frxReport.Script.Variables['GERPRECOCE']       := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_GERENV').AsString        = 'T','X',' ');
          frxReport.Script.Variables['NOCIVAS']          := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_NOCIVAS').AsString       = 'T','X',' ');


          frxReport.Script.Variables['LOCAL']           := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + ' - ' + dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['MES']             := ExtensoMes( StrToInt(FormatDateTime('mm', dm_rc.fdqrysolicitacao.FindField('EMISSAO').AsDateTime)));
          frxReport.Script.Variables['ANO']             := StrToFloat(StrRight(dm_rc.fdqrysolicitacao.FindField('EMISSAO').AsString,4));
          frxReport.Script.Variables['DIA']             := StrToFloat(StrLeft (dm_rc.fdqrysolicitacao.FindField('EMISSAO').AsString,2));
        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.fdqrysolicitacaoitens;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'termodecoleta_geral.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;


  try
    ldm  .Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RECIBOENTREGA_impressao  (empresa,numero,documento:Integer;dataini,tipo:string)             :string;
var
  itens,financeiro : TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  itens                  := CriaMemoria('CONTRATO_NOTA');
  financeiro             := CriaMemoria('VNC');

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(empresa));
  TabelaMvmestre  (' SELECT * FROM MVMESTRE WHERE NUMERO    = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa));
  TabelaPessoas   (' SELECT * FROM PESSOAS WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));



  itens.Close;
  itens.Open;

  if tipo = 'PARCIAL' then
    begin
      if dataini <> '' then
        TabelaEntregaProduto(' select * from ENTREGA_PRODUTO ' +
                             ' where numero    = ' + IntToStr(numero)        +
                             ' and   documento = ' + IntToStr(documento)     +
                             ' and   empresa   = ' + IntToStr(empresa)       +
                             ' and   emissao   = ' + QuotedStr(DataPonto(dataini)) +
                             ' order by codigo ');

      dm_rc.fdqryentregaproduto.First;
      while not dm_rc.fdqryentregaproduto.Eof do
        begin
          itens.Append;
          itens.FindField('PRODUTO').AsInteger      := dm_rc.fdqryentregaproduto.FindField('PRODUTO').AsInteger;
          itens.FindField('DESCRICAO').AsString     := dm_rc.fdqryentregaproduto.FindField('DESCRICAO').AsString;
          itens.FindField('QUANTIDADE').AsFloat     := dm_rc.fdqryentregaproduto.FindField('ENTREGUE').AsFloat;
          itens.FindField('DATA').AsDateTime        := dm_rc.fdqryentregaproduto.FindField('EMISSAO').AsDateTime;

          TabelaMvitens('select * from mvitens ' +
                        ' where numero    = ' + IntToStr(numero)        +
                        ' and   documento = ' + IntToStr(documento)     +
                        ' and   empresa   = ' + IntToStr(empresa)       +
                        ' and   produto   = ' + IntToStr(dm_rc.fdqryentregaproduto.FindField('PRODUTO').AsInteger) +
                        ' and   sequencia = ' + IntToStr(dm_rc.fdqryentregaproduto.FindField('SEQUENCIA').AsInteger));

          itens.FindField('PESOSACO').AsFloat       := dm_rc.tbmvitens.FindField('PESOSACO').AsFloat;

          if dm_rc.tbmvitens.FindField('PESOSACO').AsString <> '' then
            begin
              itens.FindField('QTDESACO').AsFloat       := variif(itens.FindField('PESOSACO').AsFloat > 0,
                                                                  itens.FindField('QUANTIDADE').AsFloat / itens.FindField('PESOSACO').AsFloat,0);
            end;

          itens.Post;

          dm_rc.fdqryentregaproduto.Next;
        end;
    end
  else
    begin
      TabelaMvitens   (' SELECT * FROM MVITENS WHERE NUMERO     = ' + IntToStr(numero)   +
                       ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                       ' AND EMPRESA                            = ' + IntToStr(empresa)  +
                       ' ORDER BY SEQUENCIA');

      dm_rc.tbmvitens.First;
      while not dm_rc.tbmvitens.Eof do
        begin
          itens.Append;
          itens.FindField('PRODUTO').AsInteger      := dm_rc.tbmvitens.FindField('PRODUTO').AsInteger;
          itens.FindField('DESCRICAO').AsString     := dm_rc.tbmvitens.FindField('DESCRICAO').AsString +
                                                       variif(dm_rc.tbmvitens.FindField('PEDIDOITEMOR').AsString <> '',
                                                       ' --- Pedido nº ' + dm_rc.tbmvitens.FindField('PEDIDOOR').AsString + '  ' +
                                                       ' Item nº   ' + dm_rc.tbmvitens.FindField('PEDIDOITEMOR').AsString,'') ;
          itens.FindField('QUANTIDADE').AsFloat     := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
          itens.FindField('PESOSACO').AsFloat       := dm_rc.tbmvitens.FindField('PESOSACO').AsFloat;
          itens.FindField('DATA').AsDateTime        := dm_rc.tbmvitens.FindField('EMISSAO').AsDateTime;


          if dm_rc.tbmvitens.FindField('PESOSACO').AsString <> '' then
            begin
              itens.FindField('QTDESACO').AsFloat       := variif(itens.FindField('PESOSACO').AsFloat > 0,
                                                                  itens.FindField('QUANTIDADE').AsFloat / itens.FindField('PESOSACO').AsFloat,0);
            end;

          itens.Post;

          dm_rc.tbmvitens.Next;
        end;

    end;

  with ldm do
    begin
      with frxReport do
        begin

          if dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger = 4 then
            frxReport.Script.Variables['TIPO']  := 'PEDIDOS'
          else
          if dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger = 3 then
            frxReport.Script.Variables['TIPO']  := 'ORÇAMENTO';

          frxReport.Script.Variables['EMPFAN']  := dm_rc.tbempresas.FindField('DESCRICAO').AsString;
          frxReport.Script.Variables['EMPMUN']  := dm_rc.tbempresas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['EMPCNPJ'] := dm_rc.tbempresas.FindField('CNPJ').AsString;
          frxReport.Script.Variables['EMPINS']  := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['EMPTEL']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPEND']  := dm_rc.tbempresas.FindField('ENDERECO').AsString + ' - ' + dm_rc.tbempresas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['EMPFAX']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPCEL']  := dm_rc.tbempresas.FindField('CELULAR').AsString;
          frxReport.Script.Variables['EMPCEP']  := dm_rc.tbempresas.FindField('CEP').AsString;
          frxReport.Script.Variables['EMPBAR']  := dm_rc.tbempresas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['EMPSITE'] := '';//dm_rc.tbempresas.FindField('SMTP').AsString;
          frxReport.Script.Variables['EMPEMA']  := dm_rc.tbempresas.FindField('EMAIL').AsString;
          frxReport.Script.Variables['EMPEMAIL']:= dm_rc.tbempresas.FindField('EMAIL').AsString;

          if dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger = 4 then
            frxReport.Script.Variables['CLIFUN']  := Acha_Item('FUNCIONARIOS',dm_rc.FDQryMvmestre.FindField('FUNCIONARIO').AsString)
          else
            frxReport.Script.Variables['CLIFUN']  := '';


          frxReport.Script.Variables['SAINUM']  := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;
          frxReport.Script.Variables['SAIDTE']  := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;

          frxReport.Script.Variables['CLINOM']  := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          frxReport.Script.Variables['CLICNP']  := dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString;
          frxReport.Script.Variables['CLIBAR']  := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['CLIIBG']  := dm_rc.FDQryPessoas.FindField('IBGE').AsString;
          frxReport.Script.Variables['CLITLR']  := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['CLIEDR']  := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['CLIUFR']  := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['CLIMUR']  := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['CLIIES']  := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['CLICPR']  := dm_rc.FDQryPessoas.FindField('CEP').AsString;

          frxReport.Script.Variables['SAINUMCTR']  := dm_rc.FDQryMvmestre.FindField('NUMEROPEDIDO').AsString;

          //********************************************************************************************//
          // SELEGRAM
          //********************************************************************************************//
          if StrContains('52070356000103',dm_rc.tbempresas.FindField('CNPJ').AsString) then
            begin
              frxReport.Script.Variables['CLIEDRCEP']        := dm_rc.FDQryPessoas.FindField('CEP').AsString;
              frxReport.Script.Variables['CONDDES']          := Acha_Item('CONDICOES',dm_rc.FDQryMvmestre.FindField('CONDICAO').AsString);

              frxReport.Script.Variables['CLIEDR_COBRANCA']   := dm_rc.FDQryPessoas.FindField('ENDERECOCOBRANCA').AsString + ' ' + dm_rc.FDQryPessoas.FindField('NUMEROCOBRANCA').AsString;
              frxReport.Script.Variables['CLIUFR_COBRANCA']   := dm_rc.FDQryPessoas.FindField('ESTADOCOBRANCA').AsString;
              frxReport.Script.Variables['CLIMUR_COBRANCA']   := dm_rc.FDQryPessoas.FindField('CIDADECOBRANCA').AsString;
              frxReport.Script.Variables['CLICPR_COBRANCA']   := dm_rc.FDQryPessoas.FindField('CEPCOBRANCA').AsString;
              frxReport.Script.Variables['CLIBAR_COBRANCA']   := dm_rc.FDQryPessoas.FindField('BAIRROCOBRANCA').AsString;
              frxReport.Script.Variables['CLIEDR_CEPCOBRANCA']:= FORMATA_CEP(dm_rc.FDQryPessoas.FindField('CEPCOBRANCA').AsString);


              frxReport.Script.Variables['CLIEDR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_ENDERECO').AsString + ' ' + dm_rc.FDQryMvmestre.FindField('ENTREGA_NUMERO').AsString;
              frxReport.Script.Variables['CLIUFR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_ESTADO').AsString;
              frxReport.Script.Variables['CLIMUR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_CIDADE').AsString;
              frxReport.Script.Variables['CLICPR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString;
              frxReport.Script.Variables['CLIBAR_ENTREGA']   := dm_rc.FDQryMvmestre.FindField('ENTREGA_BAIRRO').AsString;
              frxReport.Script.Variables['CLIEDR_CEPENTREGA']:= FORMATA_CEP(dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString);

              frxReport.Script.Variables['SAIOB1']           := dm_rc.FDQryMvmestre.FindField('OBSERVACOES').AsString;
              frxReport.Script.Variables['OBSPED']           := dm_rc.FDQryMvmestre.FindField('OBSPEDIDO').AsString;
            end;
        end;


      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := itens;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'reciboentrega_dumato.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;

end;
function IMPRESSAO_FichaControle    (empresa,rcontrole:integer)            :string;
begin
  M_ARQUIVO           := Gera_Guid()+'.pdf';
  ldm                 := tdm_imp.Create(nil);
  memoria             := CriaMemoria('IMPRESSAOFICHABATIDA');

  TabelaEmpresas      ('SELECT * FROM EMPRESAS      WHERE CODIGO     = ' + IntToStr(empresa));
  SqlPesquisa         ('SELECT * FROM FICHA F INNER JOIN LOTEINTERNO LI ON (LI.CODIGO = F.MESTRE_ID) ' +
                       'WHERE LI.CODIGO                              = ' + IntToStr(rcontrole));
  TabelaPessoas       ('SELECT * FROM PESSOAS       WHERE CODIGO     = ' + IntToStr(DM_RC.sqlBuscas.FindField('PESSOA').AsInteger));
  TabelaProducaoItens (
                       'select                                                                                         ' +
                       '  pi.emissao,                                                                                  ' +
                       '  pi.lote,                                                                                     ' +
                       '  pi.descricao,                                                                                ' +
                       '  pi.quantidade                                                                                ' +
                       '  from producaointerna p inner join PRODUCAOINTERNA_ITENS pi on (p.codigo = pi.mestre_id)      ' +
                       '  where p.lote    = ' + QuotedStr(DM_RC.sqlBuscas.FindField('LOTE').AsString)     + ' and      ' +
                       '        p.produto = ' + IntToStr (DM_RC.sqlBuscas.FindField('PRODUTO').AsInteger) +
                       ' order by pi.emissao, pi.sequencia');

  memoria.Close;
  memoria.Open;
  dm_rc.fdqryproducaointernaitens.First;
  while not dm_rc.fdqryproducaointernaitens.Eof do
    begin

      memoria.Append;
      memoria.FindField('LOTE').AsString      :=  dm_rc.fdqryproducaointernaitens.FindField('LOTE').AsString;
      memoria.FindField('DATA').AsString      :=  dm_rc.fdqryproducaointernaitens.FindField('EMISSAO').AsString;
      memoria.FindField('DESCRICAO').AsString :=  dm_rc.fdqryproducaointernaitens.FindField('DESCRICAO').AsString;
      memoria.FindField('QUANTIDADE').AsFloat :=  dm_rc.fdqryproducaointernaitens.FindField('QUANTIDADE').AsFloat;
      memoria.Post;

      dm_rc.fdqryproducaointernaitens.Next;
    end;


  with ldm do
    begin
      frxReport.Script.Variables['LOTE_ENTRADA']  := dm_rc.sqlBuscas.FindField('MESTRE_LOTE').AsString;
      frxReport.Script.Variables['DATA_ENTRADA']  := dm_rc.sqlBuscas.FindField('DATAENTRADA').AsDateTime;
      frxReport.Script.Variables['HORA_ENTRADA']  := dm_rc.sqlBuscas.FindField('HORAENTRADA').AsDateTime;

      frxReport.Script.Variables['EMPFAN']        := dm_rc.tbempresas.FindField('FANTASIA').AsString;
      frxReport.Script.Variables['EMPCNPJ']       := Formata_Cnpj(dm_rc.tbempresas.FindField('CNPJ').AsString);
      frxReport.Script.Variables['EMPRENASEM']    := dm_rc.tbempresas.FindField('RENASEM').AsString;
      frxReport.Script.Variables['EMPTEL']        := dm_rc.tbempresas.FindField('TELEFONE').AsString;
      frxReport.Script.Variables['EMPEND']        := dm_rc.tbempresas.FindField('ENDERECO').AsString + ' ' + dm_rc.tbempresas.FindField('NUMERO').AsString    + ' - ' +
                                                     dm_rc.tbempresas.FindField('BAIRRO').AsString   + ' ' + dm_rc.tbempresas.FindField('CIDADE').AsString    + '/' +
                                                     dm_rc.tbempresas.FindField('ESTADO').AsString;

      frxReport.Script.Variables['CLINOME']       := dm_rc.FDQryPessoas.FindField('NOME').AsString;
      frxReport.Script.Variables['CLICPFCNPJ']    := dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString;
      frxReport.Script.Variables['CLIENDERECO']   := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString;
      frxReport.Script.Variables['CLIUF']         := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
      frxReport.Script.Variables['CLICEP']        := FORMATA_CEP(dm_rc.FDQryPessoas.FindField('CEP').AsString);
      frxReport.Script.Variables['CLITELEFONE']   := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
      frxReport.Script.Variables['CLIRENASEM']    := dm_rc.FDQryPessoas.FindField('RENASEM').AsString;
      frxReport.Script.Variables['CLIMUNICIPIO']  := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;

      // DADOS DO REGISTRO
      frxReport.Script.Variables['TERMO_ENTRADA']   := dm_rc.sqlBuscas.FindField('TERMO').AsString;
      frxReport.Script.Variables['BOLETIM_ENTRADA'] := dm_rc.sqlBuscas.FindField('BOLETIM').AsString;
      frxReport.Script.Variables['LOTE_ENTRADA']    := dm_rc.sqlBuscas.FindField('LOTE').AsString;
      frxReport.Script.Variables['NOTA_FISCAL']     := dm_rc.sqlBuscas.FindField('NOTAFISCAL').AsString;

      // DADOS DO PRODUTO
      frxReport.Script.Variables['ESPECIE']         := dm_rc.sqlBuscas.FindField('ESPECIE').AsString;
      frxReport.Script.Variables['CULTIVAR']        := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;
      frxReport.Script.Variables['CATEGORIA']       := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
      frxReport.Script.Variables['SAFRA']           := dm_rc.sqlBuscas.FindField('SAFRA').AsString;
      frxReport.Script.Variables['CAMPO']           := dm_rc.sqlBuscas.FindField('CAMPO').AsString;

      frxReport.Script.Variables['PESO_AMOSTRA']         := dm_rc.sqlBuscas.FindField('PESOENTRADA').AsFloat;
      frxReport.Script.Variables['PUREZA_FOR']           := dm_rc.sqlBuscas.FindField('PUREZA_FOR').AsFloat;
      frxReport.Script.Variables['VIABILIDADE_FOR']      := dm_rc.sqlBuscas.FindField('VIABILIDADE_FOR').AsFloat;
      frxReport.Script.Variables['PUREZA_INTERNO']       := dm_rc.sqlBuscas.FindField('PUREZA_INTERNA').AsFloat;
      frxReport.Script.Variables['VIABILIDADE_INTERNO']  := dm_rc.sqlBuscas.FindField('VIABILIDADE_INTERNA').AsFloat;


      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'REEMBALADOR' then
        begin
          frxReport.Script.Variables['REEB']    := '( X )';
          frxReport.Script.Variables['TRAN']    := '(   )';
        end
      else
        begin
          frxReport.Script.Variables['REEB']    := '(   )';
          frxReport.Script.Variables['TRAN']    := '( X )';
        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'fichacontrole_dumato.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_FichaSemente     (empresa,rcontrole:integer)            :string;
begin
  M_ARQUIVO           := Gera_Guid()+'.pdf';
  ldm                 := tdm_imp.Create(nil);

  TabelaEmpresas      ('SELECT * FROM EMPRESAS      WHERE CODIGO     = ' + IntToStr(empresa));
  SqlPesquisa         (
                       ' select                                                                           ' +
                       ' *                                                                                ' +
                       ' from                                                                             ' +
                       '   SEMENTES_ANALISTA SA INNER JOIN LOTEINTERNO LI ON (SA.mestre_id = LI.codigo)   ' +
                       '                        INNER JOIN PRODUTOS     P ON (LI.PRODUTO   = P.CODIGO)    ' +
                       ' where SA.MESTRE_ID =                                                             ' + IntToStr(rcontrole));

  with ldm do
    begin
      frxReport.Script.Variables['DATA']     := dm_rc.sqlBuscas.FindField('DATA_ANALISE').AsDateTime;
      frxReport.Script.Variables['ESPECIE']  := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;
      frxReport.Script.Variables['LOTE']     := dm_rc.sqlBuscas.FindField('LOTE').AsString;

      frxReport.Script.Variables['BOLETIM']  := dm_rc.sqlBuscas.FindField('BOLETIM').AsString;
      frxReport.Script.Variables['SACOS']    := dm_rc.sqlBuscas.FindField('SACARIA').AsString;
      frxReport.Script.Variables['ORIGEM']   := dm_rc.sqlBuscas.FindField('ORIGEM').AsString;

      frxReport.Script.Variables['PESO']     := dm_rc.sqlBuscas.FindField('PESO').AsFloat;

      frxReport.Script.Variables['PESO1']    := dm_rc.sqlBuscas.FindField('PESO_INI_I').AsFloat;
      frxReport.Script.Variables['PESO2']    := dm_rc.sqlBuscas.FindField('PESO_INI_II').AsFloat;
      frxReport.Script.Variables['PESO3']    := dm_rc.sqlBuscas.FindField('PESO_INI_III').AsFloat;

      frxReport.Script.Variables['PESO4']    := dm_rc.sqlBuscas.FindField('PESO_FIN_I').AsFloat;
      frxReport.Script.Variables['PESO5']    := dm_rc.sqlBuscas.FindField('PESO_FIN_II').AsFloat;
      frxReport.Script.Variables['PESO6']    := dm_rc.sqlBuscas.FindField('PESO_FIN_III').AsFloat;

      frxReport.Script.Variables['RES1']     := dm_rc.sqlBuscas.FindField('PESO_MEDIA_I').AsFloat;
      frxReport.Script.Variables['RES2']     := dm_rc.sqlBuscas.FindField('PESO_MEDIA_II').AsFloat;
      frxReport.Script.Variables['RES3']     := dm_rc.sqlBuscas.FindField('PESO_MEDIA_III').AsFloat;

      frxReport.Script.Variables['MEDIA']    := dm_rc.sqlBuscas.FindField('MEDIA_GERAL').AsFloat;

      frxReport.Script.Variables['TZ']       := dm_rc.sqlBuscas.FindField('TETRAZOLIO').AsFloat;
      frxReport.Script.Variables['GE']       := dm_rc.sqlBuscas.FindField('GERMINACAO').AsFloat;
      frxReport.Script.Variables['VC']       := dm_rc.sqlBuscas.FindField('VALORCULTURAL').AsFloat;
      frxReport.Script.Variables['OBS']      := dm_rc.sqlBuscas.FindField('OBSERVACAO').AsString;

      frxReport.Script.Variables['ANA1']     := varIIF(dm_rc.sqlBuscas.FindField('ANALISTA_I').AsInteger   > 0, Acha_Item('FUNCIONARIOS',dm_rc.sqlBuscas.FindField('ANALISTA_I').AsString)  ,'');
      frxReport.Script.Variables['ANA2']     := varIIF(dm_rc.sqlBuscas.FindField('ANALISTA_II').AsInteger  > 0, Acha_Item('FUNCIONARIOS',dm_rc.sqlBuscas.FindField('ANALISTA_II').AsString) ,'');
      frxReport.Script.Variables['ANA3']     := varIIF(dm_rc.sqlBuscas.FindField('ANALISTA_III').AsInteger > 0, Acha_Item('FUNCIONARIOS',dm_rc.sqlBuscas.FindField('ANALISTA_III').AsString),'');


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'fichaanalise_granpastos.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;

end;
function IMPRESSAO_FichaBatida      (empresa,rcontrole:integer)            :string;
begin
  M_ARQUIVO           := Gera_Guid()+'.pdf';
  ldm                 := tdm_imp.Create(nil);
  memoria             := CriaMemoria('IMPRESSAOFICHABATIDA');

  TabelaEmpresas      ('SELECT * FROM EMPRESAS      WHERE CODIGO     = ' + IntToStr(empresa));
  SqlPesquisa         ('SELECT * FROM LOTEINTERNO LI INNER JOIN FICHA F ON (LI.CODIGO = F.MESTRE_ID) ' +
                       'WHERE LI.CODIGO                              = ' + IntToStr(rcontrole));
  TabelaPessoas       ('SELECT * FROM PESSOAS       WHERE CODIGO     = ' + IntToStr(DM_RC.sqlBuscas.FindField('PESSOA').AsInteger));
  TabelaManutencaoLoteProducao (
                                 'select                                                                                             ' +
                                 '  p.emissao,                                                                                       ' +
                                 '  pin.lote,                                                                                        ' +
                                 '  pin.descricao,                                                                                   ' +
                                 '  p.quantidade,                                                                                    ' +
                                 '  p.tipo                                                                                           ' +
                                 '  from MANUTENCAOLOTE_INTERNO P inner join producaointerna pin on (p.mestre_producao = pin.codigo) ' +
                                 '  where p.lote    = ' + QuotedStr(DM_RC.sqlBuscas.FindField('LOTE').AsString)     + ' and          ' +
                                 '        p.produto = ' + IntToStr (DM_RC.sqlBuscas.FindField('PRODUTO').AsInteger) +
                                 ' order by p.emissao, p.sequencia');

  memoria.Close;
  memoria.Open;
  dm_rc.FDQuerymanutencaolote_interno.First;
  while not dm_rc.FDQuerymanutencaolote_interno.Eof do
    begin

      memoria.Append;
      memoria.FindField('LOTE').AsString      :=  dm_rc.FDQuerymanutencaolote_interno.FindField('LOTE').AsString;
      memoria.FindField('DATA').AsString      :=  dm_rc.FDQuerymanutencaolote_interno.FindField('EMISSAO').AsString;
      memoria.FindField('TIPO').AsString      :=  dm_rc.FDQuerymanutencaolote_interno.FindField('TIPO').AsString;
      memoria.FindField('DESCRICAO').AsString :=  dm_rc.FDQuerymanutencaolote_interno.FindField('DESCRICAO').AsString;
      memoria.FindField('QUANTIDADE').AsFloat :=  dm_rc.FDQuerymanutencaolote_interno.FindField('QUANTIDADE').AsFloat;
      memoria.Post;

      dm_rc.FDQuerymanutencaolote_interno.Next;
    end;


  with ldm do
    begin
      frxReport.Script.Variables['LOTE_ENTRADA']  := dm_rc.sqlBuscas.FindField('MESTRE_LOTE').AsString;
      frxReport.Script.Variables['DATA_ENTRADA']  := dm_rc.sqlBuscas.FindField('DATAENTRADA').AsDateTime;

      frxReport.Script.Variables['EMPFAN']        := dm_rc.tbempresas.FindField('FANTASIA').AsString;
      frxReport.Script.Variables['EMPCNPJ']       := Formata_Cnpj(dm_rc.tbempresas.FindField('CNPJ').AsString);
      frxReport.Script.Variables['EMPRENASEM']    := dm_rc.tbempresas.FindField('RENASEM').AsString;
      frxReport.Script.Variables['EMPTEL']        := dm_rc.tbempresas.FindField('TELEFONE').AsString;

      frxReport.Script.Variables['CLINOME']       := dm_rc.FDQryPessoas.FindField('NOME').AsString;
      frxReport.Script.Variables['CLIUF']         := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
      frxReport.Script.Variables['CLIMUNICIPIO']  := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;

      // DADOS DO REGISTRO
      frxReport.Script.Variables['TERMO_ENTRADA']   := dm_rc.sqlBuscas.FindField('TERMO').AsString;
      frxReport.Script.Variables['BOLETIM_ENTRADA'] := dm_rc.sqlBuscas.FindField('BOLETIM').AsString;
      frxReport.Script.Variables['LOTE_ENTRADA']    := dm_rc.sqlBuscas.FindField('LOTE').AsString;
      frxReport.Script.Variables['NOTA_FISCAL']     := dm_rc.sqlBuscas.FindField('NOTAFISCAL').AsString;

      // DADOS DO PRODUTO
      frxReport.Script.Variables['ESPECIE']         := dm_rc.sqlBuscas.FindField('ESPECIE').AsString;
      frxReport.Script.Variables['CULTIVAR']        := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;
      frxReport.Script.Variables['CATEGORIA']       := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
      frxReport.Script.Variables['SAFRA']           := dm_rc.sqlBuscas.FindField('SAFRA').AsString;
      frxReport.Script.Variables['CAMPO']           := dm_rc.sqlBuscas.FindField('CAMPO').AsString;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'REEMBALADOR' then
        begin
          frxReport.Script.Variables['REEB']    := '( X )';
          frxReport.Script.Variables['TRAN']    := '(   )';
        end
      else
        begin
          frxReport.Script.Variables['REEB']    := '(   )';
          frxReport.Script.Variables['TRAN']    := '( X )';
        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'fichacontrole_dumato_batida.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_HISTORICOSEMENTESINTETICA(empresa:Integer;dataini,datafin,sql:string)                :string;
var
  memoria,totalizador:TFDMemTable;
  M_ESTADUAL,M_EXPORTACAO,M_INTERESTADUAL : Real;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  memoria                := CriaMemoria('MEMCAD');
  totalizador            := CriaMemoria('TOTALIZADOR');

  M_ESTADUAL      := 0;
  M_INTERESTADUAL := 0;
  M_EXPORTACAO    := 0;

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));
  SqlPesquisa   (sql);

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin

      if dm_rc.sqlBuscas.FindField('UF').AsString = dm_rc.tbempresas.FindField('ESTADO').AsString then
        M_ESTADUAL := dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat + M_ESTADUAL
      else
      if dm_rc.sqlBuscas.FindField('UF').AsString = 'EX' then
         M_EXPORTACAO := dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat + M_EXPORTACAO
      else
      if (dm_rc.sqlBuscas.FindField('UF').AsString <> 'EX') and
         (dm_rc.sqlBuscas.FindField('UF').AsString <> dm_rc.tbempresas.FindField('ESTADO').AsString) then
        M_INTERESTADUAL := dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat + M_INTERESTADUAL;


      memoria.Append;
      memoria.FindField('LOTE').AsString       := dm_rc.sqlBuscas.FindField('LOTESEMENTE').AsString;
      memoria.FindField('SAFRA').AsString      := dm_rc.sqlBuscas.FindField('SAFRAVALIDA').AsString;

      memoria.FindField('PRODUTO').AsInteger   := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
      memoria.FindField('BOLETIM').AsString    := dm_rc.sqlBuscas.FindField('BOLETIMSEMENTE').AsString;
      memoria.FindField('PONTOS').AsString     := dm_rc.sqlBuscas.FindField('SALDOPONTO').AsString;
      memoria.FindField('QUANTIDADE').AsString := dm_rc.sqlBuscas.FindField('QUANTIDADE').AsString;
      memoria.FindField('ESTADO').AsString     := dm_rc.sqlBuscas.FindField('UF').AsString;
      memoria.FindField('EMISSAO').AsDateTime  := dm_rc.sqlBuscas.FindField('EMISSAO').AsDateTime;
      memoria.FindField('NUMERO').AsString     := dm_rc.sqlBuscas.FindField('NUMERO').AsString;
      memoria.FindField('SERIE').AsString      := dm_rc.sqlBuscas.FindField('SERIE').AsString;
      memoria.FindField('PESSOA').AsString     := dm_rc.sqlBuscas.FindField('PESSOA').AsString;
      memoria.FindField('PUREZA').AsFloat      := dm_rc.sqlBuscas.FindField('PUREZA').AsFloat;
      memoria.FindField('NOME').AsString       := Acha_Item('PESSOAS',memoria.FindField('PESSOA').AsString);
      memoria.Post;

      dm_rc.sqlBuscas.Next;
    end;

  for I:=1 to 3 do
    begin
      totalizador.Append;
      if I = 1 then
        begin
          totalizador.FindField('ESTADO').AsString   := dm_rc.tbempresas.FindField('ESTADO').AsString;
          totalizador.FindField('QUANTIDADE').AsFloat:= M_ESTADUAL;
        end
      else
        if I = 2 then
          begin
            totalizador.FindField('ESTADO').AsString   := 'OUTROS';
            totalizador.FindField('QUANTIDADE').AsFloat:= M_INTERESTADUAL;
          end
        else
          begin
            totalizador.FindField('ESTADO').AsString   := 'EX';
            totalizador.FindField('QUANTIDADE').AsFloat:= M_EXPORTACAO;
          end;
      totalizador.Post;
    end;

  with ldm do
    begin

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;
      frxDBDatasetdetalhes.DataSet        := totalizador;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'historicosementesintetico.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picturelogo')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm             .Free;
    memoria         .Free;
    totalizador     .Free;
    dm_rc.tbempresas.close;
    dm_rc.sqlBuscas .Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_reciboPagar (pcontrole:Integer) :string;
var
  ACBrExtensoDuplicata      : TACBrExtenso;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  ACBrExtensoDuplicata   := TACBrExtenso.Create(nil);

  ACBrExtensoDuplicata.StrMoeda   := 'real';
  ACBrExtensoDuplicata.StrMoedas  := 'reais';
  ACBrExtensoDuplicata.StrCentavo := 'centavo';
  ACBrExtensoDuplicata.StrCentavos:= 'centavos';


  SqlPesquisa    ('SELECT * FROM PAGAR    WHERE CODIGO = ' + IntToStr(pcontrole));
  TabelaEmpresas ('SELECT * FROM EMPRESAS WHERE CODIGO = ' + IntToStr(dm_rc.sqlBuscas.FindField('EMPRESA').AsInteger));

  with ldm do
    begin
      ACBrExtensoDuplicata.Valor               := dm_rc.sqlBuscas.FindField('VALOR').AsFloat;

      frxReport.Script.Variables['NUMERO']     := dm_rc.sqlBuscas.FindField('NUMERO').AsString;
      frxReport.Script.Variables['SEQUENCIA']  := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsString;
      frxReport.Script.Variables['RECEBI']     := dm_rc.tbempresas.FindField('FANTASIA').AsString;
      frxReport.Script.Variables['REFERENTE']  := dm_rc.sqlBuscas.FindField('REFERENTE').AsString;
      frxReport.Script.Variables['CIDADE']     := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
      frxReport.Script.Variables['ESTADO']     := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
      frxReport.Script.Variables['VALOR']      := dm_rc.sqlBuscas.FindField('VALOR').AsFloat;
      frxReport.Script.Variables['EXTENSO']    := ACBrExtensoDuplicata.Texto;
      frxReport.Script.Variables['NOME']       := dm_rc.sqlBuscas.FindField('NOME').AsString;
      frxReport.Script.Variables['CPFCNPJ']    := Formata_Cnpj(dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString);

      frxReport.Script.Variables['MES']        := ExtensoMes( StrToInt(FormatDateTime('mm', dm_rc.sqlBuscas.FindField('PAGAMENTO').AsDateTime)));
      frxReport.Script.Variables['ANO']        := StrToFloat(StrRight(dm_rc.sqlBuscas.FindField('PAGAMENTO').AsString,4));
      frxReport.Script.Variables['DIA']        := StrToFloat(StrLeft(dm_rc.sqlBuscas.FindField('PAGAMENTO').AsString,2));


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'recibosistema.fr3');

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm                 .Free;
    ACBrExtensoDuplicata.Free;
    dm_rc.sqlBuscas     .Close;
  finally
    Result := M_ARQUIVO;
  end;
end;

function IMPRESSAO_recibo (pcontrole:Integer) :string;
var
  ACBrExtensoDuplicata      : TACBrExtenso;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  ACBrExtensoDuplicata   := TACBrExtenso.Create(nil);

  ACBrExtensoDuplicata.StrMoeda   := 'real';
  ACBrExtensoDuplicata.StrMoedas  := 'reais';
  ACBrExtensoDuplicata.StrCentavo := 'centavo';
  ACBrExtensoDuplicata.StrCentavos:= 'centavos';


  SqlPesquisa   ('SELECT * FROM RECIBOS WHERE CODIGO = ' + IntToStr(pcontrole));

  with ldm do
    begin
      ACBrExtensoDuplicata.Valor               := dm_rc.sqlBuscas.FindField('VALOR').AsFloat;

      frxReport.Script.Variables['NUMERO']     := dm_rc.sqlBuscas.FindField('NUMERO').AsString;
      frxReport.Script.Variables['SEQUENCIA']  := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsString;
      frxReport.Script.Variables['RECEBI']     := dm_rc.sqlBuscas.FindField('RECEBI_DE').AsString;
      frxReport.Script.Variables['REFERENTE']  := dm_rc.sqlBuscas.FindField('REFERENTE').AsString;
      frxReport.Script.Variables['CIDADE']     := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
      frxReport.Script.Variables['ESTADO']     := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
      frxReport.Script.Variables['VALOR']      := dm_rc.sqlBuscas.FindField('VALOR').AsFloat;
      frxReport.Script.Variables['EXTENSO']    := ACBrExtensoDuplicata.Texto;
      frxReport.Script.Variables['NOME']       := dm_rc.sqlBuscas.FindField('NOME').AsString;
      frxReport.Script.Variables['CPFCNPJ']    := Formata_Cnpj(dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString);

      frxReport.Script.Variables['MES']        := ExtensoMes( StrToInt(FormatDateTime('mm', dm_rc.sqlBuscas.FindField('PAGAMENTO').AsDateTime)));
      frxReport.Script.Variables['ANO']        := StrToFloat(StrRight(dm_rc.sqlBuscas.FindField('PAGAMENTO').AsString,4));
      frxReport.Script.Variables['DIA']        := StrToFloat(StrLeft(dm_rc.sqlBuscas.FindField('PAGAMENTO').AsString,2));


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'recibosistema.fr3');

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm                 .Free;
    ACBrExtensoDuplicata.Free;
    dm_rc.sqlBuscas     .Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_SaldoProdutoNota         (empresa:Integer;sql,dataini,datafin:string)                    :string;
var
  memoria:TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  memoria                := CriaMemoria('MEMCAD');

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));
  SqlPesquisa   (sql);

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      memoria.Append;

      memoria.FindField('PRODUTO').AsInteger   := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
      memoria.FindField('DESCRICAO').AsString  := Acha_Item('PRODUTOS',memoria.FindField('PRODUTO').AsString);
      memoria.FindField('MEDIA').AsFloat       := dm_rc.sqlBuscas.FindField('MEDIA').AsFloat;
      memoria.FindField('VALORPAGO').AsFloat   := Calcula_SaldoProdutoNota(empresa,
                                                                           memoria.FindField('PRODUTO').AsInteger,
                                                                           StrToDate(datafin));
      memoria.FindField('MEDIATOTAL').AsFloat  := Abs(memoria.FindField('VALORPAGO').AsFloat * dm_rc.sqlBuscas.FindField('MEDIA').AsFloat);
      memoria.Post;

      dm_rc.sqlBuscas.Next;
    end;

  with ldm do
    begin

      frxReport.Script.Variables['DATAINI']  := dataini;
      frxReport.Script.Variables['DATAFIN']  := datafin;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'saldoprodutosnotas.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picturelogo')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm             .Free;
    memoria         .Free;
    dm_rc.tbempresas.close;
    dm_rc.sqlBuscas .Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_CRESCIMENTOTENDECIA        (const rempresa:integer;tipo,sql:string):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(rempresa));
  SqlPesquisa   (sql);

  with ldm do
    begin

      frxReport.Script.Variables['TIPO']  := tipo;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.sqlBuscas;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'relatorio_crescimentofaturamentoempresa.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm             .Free;
    memoria         .Free;
    dm_rc.tbempresas.close;
    dm_rc.sqlBuscas .Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_COMISSAOBAIXAEFETUADA      (const rempresa:integer;dataini,datafin:TDateTime;sql:string):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(rempresa));
  SqlPesquisa   (sql);

  with ldm do
    begin

      frxReport.Script.Variables['DATAINI']  := dataini;
      frxReport.Script.Variables['DATAFIN']  := datafin;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.sqlBuscas;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'comissaobaixaefetuada.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      TfrxGroupHeader(frxReport.FindObject('GroupHeaderVendedor')).Condition        := '<frxDBDataset."FUNCIONARIO">';

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm             .Free;
    memoria         .Free;
    dm_rc.tbempresas.close;
    dm_rc.sqlBuscas .Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_PREVISAOCOMISSAO         (const rempresa,rbuscatipo:integer;dataini,datafin:TDateTime;sql:string):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(rempresa));
  SqlPesquisa   (sql);

  with ldm do
    begin

      frxReport.Script.Variables['DATAINI']  := dataini;
      frxReport.Script.Variables['DATAFIN']  := datafin;
      frxReport.Script.Variables['BUSCATIPO']:= VARIIF(rbuscatipo = 0,'EMISSÃO','VENCIMENTO');

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := dm_rc.sqlBuscas;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'previsaocomissaovendedor_agronagai.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      TfrxGroupHeader(frxReport.FindObject('GroupHeaderVendedor')).Condition        := '<frxDBDataset."FUNCIONARIO">';

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm             .Free;
    memoria         .Free;
    dm_rc.tbempresas.close;
    dm_rc.sqlBuscas .Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function LISTAGEM_Funcionarios              (const pempresa:integer;table:TFDQuery) :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(pempresa));

  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['EMPFAN']  := dm_rc.tbempresas.FindField('FANTASIA').AsString;
          frxReport.Script.Variables['EMPMUN']  := dm_rc.tbempresas.FindField('CIDADE').AsString + '/' + dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['EMPCNPJ'] := dm_rc.tbempresas.FindField('CNPJ').AsString;
          frxReport.Script.Variables['EMPINS']  := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['EMPTEL']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPEND']  := dm_rc.tbempresas.FindField('ENDERECO').AsString + ' - ' + dm_rc.tbempresas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['EMPFAX']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPCEL']  := dm_rc.tbempresas.FindField('CELULAR').AsString;
          frxReport.Script.Variables['EMPCEP']  := dm_rc.tbempresas.FindField('CEP').AsString;
          frxReport.Script.Variables['EMPBAR']  := dm_rc.tbempresas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['EMPSITE'] := dm_rc.tbempresas.FindField('SMTP').AsString;
          frxReport.Script.Variables['EMPEMA']  := dm_rc.tbempresas.FindField('SITE').AsString;
          frxReport.Script.Variables['EMPEMAIL']:= dm_rc.tbempresas.FindField('EMAIL').AsString;
        end;


      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := table;


      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'listagemfuncionarios_pastofort.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm             .Free;
    dm_rc.tbempresas.close;
    dm_rc.sqlBuscas .Close;
  finally
    Result := M_ARQUIVO;
  end;

end;
function LISTAGEM_Pessoas  (const pempresa:integer;table:TFDQuery) :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(pempresa));

  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['EMPFAN']  := dm_rc.tbempresas.FindField('FANTASIA').AsString;
          frxReport.Script.Variables['EMPMUN']  := dm_rc.tbempresas.FindField('CIDADE').AsString + '/' + dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['EMPCNPJ'] := dm_rc.tbempresas.FindField('CNPJ').AsString;
          frxReport.Script.Variables['EMPINS']  := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['EMPTEL']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPEND']  := dm_rc.tbempresas.FindField('ENDERECO').AsString + ' - ' + dm_rc.tbempresas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['EMPFAX']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPCEL']  := dm_rc.tbempresas.FindField('CELULAR').AsString;
          frxReport.Script.Variables['EMPCEP']  := dm_rc.tbempresas.FindField('CEP').AsString;
          frxReport.Script.Variables['EMPBAR']  := dm_rc.tbempresas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['EMPSITE'] := dm_rc.tbempresas.FindField('SMTP').AsString;
          frxReport.Script.Variables['EMPEMA']  := dm_rc.tbempresas.FindField('SITE').AsString;
          frxReport.Script.Variables['EMPEMAIL']:= dm_rc.tbempresas.FindField('EMAIL').AsString;
        end;


      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := table;


      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'listagemcliente_pastofort.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm             .Free;
    dm_rc.tbempresas.close;
    dm_rc.sqlBuscas .Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
end.

