unit untFrmCUSTOPRODUCAO;

//8.0.0.0 - conversao RadCORE 3.0 -> 8.0 (frameBASE -> modal 8.0)
// - TfrmCUSTOPRODUCAO (Custo da Producao, tabela CUSTO_PRODUCAO por MESTRE_ID =
//   mm.varM_CODIGOMESTRE; chamado pelo untCadPRODUCAOINTERNA item C1).
// - Receita modal 8.0: Hint '[[modal:]]' + BorderStyle bsSingle (era bsNone) +
//   rc_RenderLayout(Self,false,false,false) no OnCreate e (Self,true,true) no
//   BeforeShow; OnReady vazio; UniFormResize SEM Constraints (regra 40b, 935x556).
// - Lookups declarativos (regras 38/40): UniButtonDbEditcustoprod ->
//   edLkpCUSTOLOTEINTERNO__PRODUCAO (hint DESTINO=CODIGO_CUSTOPRODUCAO) + OnExit
//   gravando DESCRICAO_CUSTOPRODUCAO via rc_GetLookUpField (substitui Acha_Item,
//   que na 3.0 cairia no default NOME - bug corrigido). UniButtonDbEditPRODUTO-
//   DESTINO e UniButtonDbEdit3 eram displays sem evento -> TUniDBEdit ReadOnly.
// - Handler morto UniButtonDbEditcustotaxaButtonClick removido (nenhum controle
//   o usava); campo publico cFormModal removido (atribuido e nunca lido).
// - Painel de memos (PAINEL_INFO/PRODUCAO/TAXAS/VENDAS) mantido FIXO (dashboard
//   3.0): hints cols removidos dos containers fixos (regra 40 - hint so em rcBlock).
// - rcBlocks SOMENTE no cabecalho (20/30/40/50/60 unicos e sequenciais:
//   linha1 2+2+8, linha2 3+9 = 12; rcBlock40 declarado na ordem visual).
//   Wrapper do conteudo e dashboard (barras/memos) FIXOS como na 3.0:
//   rcBlock10->UniContainerPanel14 (na RAIZ, irmao da sidebar - rcBlock na raiz
//   seria re-largurado md-12 POR CIMA da barra lateral), rcBlock70/80 ->
//   UniContainerPanel15/16. akRight nos campos (regra 40a).
// - rc_ShowSweetAlert 4 -> 3 params (4x). MontagemCusto/SetBut/Transfere intactos.
// - Impressao: mkm_impressao (IMPRESSAO_CustoProducao) + unReportImpressao.

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniImage, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniPanel, uniEdit, uniDBEdit, uniLabel, uniDateTimePicker,
  uniDBDateTimePicker, UniButtonDbEdit, uniMemo, uniDBMemo, uniMultiItem,
  uniListBox, uniDBListBox, uniScrollBox,untGenericModalForm, uniSweetAlert;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros, tpCalcular, tpAguarde);

  TfrmCUSTOPRODUCAO = class(TfrmGenericModalForm)
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    dsMaster: TDataSource;
    sqlMaster: TFDQuery;
    UniScrollBox1: TUniScrollBox;
    UniContainerPanel14: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    rcBlock30: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    rcBlock40: TUniContainerPanel;
    UniLabel13: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniContainerPanel15: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    UniDBMemoinformacao: TUniDBMemo;
    UniContainerPanel6: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniContainerPanel7: TUniContainerPanel;
    UniDBMemoresumoproducao: TUniDBMemo;
    UniContainerPanel8: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniContainerPanel9: TUniContainerPanel;
    UniDBMemotaxas: TUniDBMemo;
    UniContainerPanel10: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniContainerPanel11: TUniContainerPanel;
    UniDBMemovendas: TUniDBMemo;
    UniContainerPanel16: TUniContainerPanel;
    UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit;
    UniLabel11: TUniLabel;
    UniContainerPanel12: TUniContainerPanel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel12: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel2: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel14: TUniLabel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniLabel16: TUniLabel;
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    UniImage1: TUniImage;
    paNAE: TUniContainerPanel;
    btnEditReg: TUniBitBtn;
    btnDeleteReg: TUniBitBtn;
    paGC: TUniContainerPanel;
    btnSaveReg: TUniBitBtn;
    btnCancelReg: TUniBitBtn;
    btnCalcReg: TUniBitBtn;
    btnimpressao: TUniBitBtn;
    rcBlock50: TUniContainerPanel;
    UniLabel7: TUniLabel;
    edLkpCUSTO_LOTEINTERNO: TUniDBEdit;
    sqlMasterKEY: TStringField;
    sqlMasterCODIGO: TIntegerField;
    sqlMasterMESTRE_ID: TIntegerField;
    sqlMasterEMPRESA: TIntegerField;
    sqlMasterEMISSAO: TDateField;
    sqlMasterCODIGO_CUSTOPRODUCAO: TIntegerField;
    sqlMasterDESCRICAO_CUSTOPRODUCAO: TStringField;
    sqlMasterCODIGO_CUSTOVENDA: TIntegerField;
    sqlMasterDESCRICAO_CUSTOVENDA: TStringField;
    sqlMasterPAINEL_INFO: TBlobField;
    sqlMasterPAINEL_PRODUCAO: TBlobField;
    sqlMasterPAINEL_TAXAS: TBlobField;
    sqlMasterPAINEL_VENDAS: TBlobField;
    sqlMasterPERCVENDAPRAZO: TBCDField;
    sqlMasterVALORFRETETONELADA: TBCDField;
    sqlMasterCODIGOP: TStringField;
    sqlMasterMARGEMLUCRO: TBCDField;
    sqlMasterCOMISSAO: TBCDField;
    sqlMasterIMPOSTO: TBCDField;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnCalcRegClick(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
  private
    { Private declarations }
  state : string;
  public
    { Public declarations }
  procedure SetBut(Acao:TAcaoCrud);
  procedure Transfere();
  procedure MontagemCusto(mestreid:integer);
  end;

function frmCUSTOPRODUCAO: TfrmCUSTOPRODUCAO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_funcoes, mkm_func_web,
  mkm_procedures, untDM_RC, mkm_layout, System.TypInfo, mkm_impressao,
  unReportImpressao; //8.0.0.0 untFrmPesquisa/Vcl.Clipbrd fora (declarativo/codigo morto)

function frmCUSTOPRODUCAO: TfrmCUSTOPRODUCAO;
begin
  Result := TfrmCUSTOPRODUCAO(mm.GetFormInstance(TfrmCUSTOPRODUCAO));
end;

procedure TfrmCUSTOPRODUCAO.btnCalcRegClick(Sender: TObject);
begin
  MontagemCusto(mm.varM_CODIGOMESTRE);
end;

procedure TfrmCUSTOPRODUCAO.btnCancelRegClick(Sender: TObject);
begin
  sqlMaster.Cancel;
    SetBut(tpListacomRegistros);
end;

procedure TfrmCUSTOPRODUCAO.btnDeleteRegClick(Sender: TObject);
begin
  try
  executasql('delete from custo_producao where mestre_id = ' + IntToStr(mm.varM_CODIGOMESTRE));

   dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados deletado com SUCESSO!' , 'success' );
  except
   dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui deletar, chame o SUPORTE!' , 'error' );
  end;
  SetBut(tpExcluir);
end;

procedure TfrmCUSTOPRODUCAO.btnEditRegClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  if not SqlPesquisa('select * from custo_producao where mestre_id = ' + IntToStr(mm.varM_CODIGOMESTRE)) then
    begin
      state := 'inclui';
      try
        sqlMaster.Close ;
        for i := 0 to  sqlMaster.Params.Count - 1 do
        begin
          Cmp :=  sqlMaster.Params[i].Name;
           sqlMaster.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
        end;
         sqlMaster.Open;
      Except
         sqlMaster.Params[0].AsInteger := -1 ;
         sqlMaster.Open;
      End;

      SqlPesquisa('select * from loteinterno where codigo = ' + IntToStr(mm.varM_CODIGOMESTRE));

      sqlMaster.Append;
      sqlMaster.FindField('CODIGO_CUSTOPRODUCAO').AsInteger := 0;
      sqlMaster.FindField('CODIGO_CUSTOVENDA').AsInteger    := 0;
      sqlMaster.FindField('VALORFRETETONELADA').AsInteger   := 0;
      sqlMaster.FindField('MARGEMLUCRO').AsInteger          := 0;
      sqlMaster.FindField('COMISSAO').AsInteger             := 0;
      sqlMaster.FindField('IMPOSTO').AsInteger              := 0;
      sqlMaster.FindField('PERCVENDAPRAZO').AsInteger       := 0;

      sqlMaster.FindField('EMISSAO').AsDateTime             := Date;
      sqlMaster.FindField('EMPRESA').AsInteger              := MM.varI_Code_Company;
      sqlMaster.FindField('MESTRE_ID').AsInteger            := mm.varM_CODIGOMESTRE;
      sqlMaster.FindField('CODIGOP').AsString               := dm_rc.sqlBuscas.FindField('CODIGOP').AsString;
    end
  else
    begin
      state := 'altera';
      sqlMaster.Edit;
    end;
  SetBut(tpAlterar);
end;

procedure TfrmCUSTOPRODUCAO.btnimpressaoClick(Sender: TObject);
begin
  mm.varC_caminhopdf :=  IMPRESSAO_CustoProducao(
                         MM.varI_Code_Company,
                         FDQryFiltro.FindField('CODIGO').AsInteger);

  unfImpressao.ShowModal();
end;

procedure TfrmCUSTOPRODUCAO.btnOptionsClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmCUSTOPRODUCAO.btnSaveRegClick(Sender: TObject);
begin
  if sqlMaster.State in [dsInsert,dsEdit] then
   Begin
     if sqlMaster.State in [dsInsert] then
       begin
         sqlMaster.FindField('KEY').AsString              := Gera_Guid;
         sqlMaster.FindField('CODIGO').AsInteger          := Ultimo_Codigo('CUSTO_PRODUCAO','CODIGO',True);
         sqlMaster.FindField('EMPRESA').AsInteger         := mm.varI_Code_Company;
         sqlMaster.FindField('MESTRE_ID').AsInteger       := mm.varM_CODIGOMESTRE;
       end
     else
       sqlMaster.Edit;
   End;

  try
    sqlMaster.Post;
    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success' );
  except
  on e : Exception do
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE!' , 'error' );
    end;
  end;
  setbut(tpListacomRegistros);
end;

procedure TfrmCUSTOPRODUCAO.MontagemCusto(mestreid: integer);
var
  p_sacos                 : Real;
  p_pesosaco              : integer;
  totalcustoencargos,
  totalgeralcustoencargos : Real;
  totalcustobatida,
  custounitario,
  resumototalcusto        : Real;

  vlrmargemlucro,
  vlrcomissao,
  vlrimposto,
  vlrfretetonelada                  : Real;
  vlrvendavistasaco,vlrvendavistakg,
  vlrvendaprazosaco,vlrvendaprazokg : Real;

  function valorimposto(custounitario,comissao,imposto,vlrlmlucro:real):real;
  var
    r,s,perc,soma:real;
  begin
    perc   :=  comissao              + imposto;
    soma   :=  custounitario         + vlrlmlucro;
    r      :=  ((soma * perc) / 100) ;
    s      :=  (r + soma) * imposto / 100;
    Result :=  s;
  end;

  function valorcomissao(custounitario,comissao,imposto,vlrlmlucro:real):real;
  var
    r,s,perc,soma:real;
  begin
    perc   :=  comissao              + imposto;
    soma   :=  custounitario         + vlrlmlucro;
    r      :=  ((soma * perc) / 100) ;
    s      :=  (r + soma) * comissao / 100;
    Result :=  s;
  end;
  function fretetonelada(freteton,pesosaco,qtesacos:real):real;
  begin
    Result := ((((freteton/1000)*pesosaco)* qtesacos)/ qtesacos);
  end;
  function margemlucro(custounitario,perc:real):real;
  begin
    Result :=  abs(MRound((custounitario / (100 - perc)*100) - custounitario,2));
  end;
  function calculasacos(pesoini,pesosaco:real) : real;
  begin
    Result := mround(pesoini / pesosaco,0);
  end;
  function replicadescricao(pdescricao:string;espaco:integer) : string;
    var
      qtdespace      : integer;
      redefinestring : string;
  begin
    qtdespace      := espaco - length(pdescricao);
    redefinestring := StrReplicate('.',qtdespace);
    Result         := pdescricao+redefinestring;
  end;
begin
  UniDBMemoinformacao.Clear;
  SqlPesquisa('select * from PRODUCAOINTERNA where codigo = ' + IntToStr(mestreid));

  sqlMaster.FindField('CODIGOP').AsString :=  dm_rc.sqlBuscas.FindField('PADRAO').AsString;

  if dm_rc.sqlBuscas.FindField('SACO_10KG').AsString = 'T' then
    p_pesosaco := 10
  else
  if dm_rc.sqlBuscas.FindField('SACO_15KG').AsString = 'T' then
    p_pesosaco := 15
  else
    p_pesosaco := 20;

  p_sacos := calculasacos(dm_rc.sqlBuscas.FindField('TOTALKG').AsFloat,p_pesosaco);

  UniDBMemoinformacao.Lines.Add('QUANT. SACOS');
  UniDBMemoinformacao.Lines.Add(FloatToStr(p_sacos) + ' Sacos');
  UniDBMemoinformacao.Lines.Add(StrReplicate('-',21));
  UniDBMemoinformacao.Lines.Add('FAMILIA');
  UniDBMemoinformacao.Lines.Add(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString);
  UniDBMemoinformacao.Lines.Add(StrReplicate('-',21));
  UniDBMemoinformacao.Lines.Add('PUREZA % (VC)');
  UniDBMemoinformacao.Lines.Add(dm_rc.sqlBuscas.FindField('PUREZA').AsString);
  UniDBMemoinformacao.Lines.Add(StrReplicate('-',21));
  UniDBMemoinformacao.Lines.Add('CODIGO "P"');
  UniDBMemoinformacao.Lines.Add(dm_rc.sqlBuscas.FindField('PADRAO').AsString);
  UniDBMemoinformacao.Lines.Add(StrReplicate('-',21));
  UniDBMemoinformacao.Lines.Add('PESO P/ SACO');
  if dm_rc.sqlBuscas.FindField('SACO_10KG').AsString = 'T' then
    UniDBMemoinformacao.Lines.Add('10')
  else
  if dm_rc.sqlBuscas.FindField('SACO_15KG').AsString = 'T' then
    UniDBMemoinformacao.Lines.Add('15')
  else
    UniDBMemoinformacao.Lines.Add('20');
  UniDBMemoinformacao.Lines.Add(StrReplicate('-',21));
  //**************************************************************************//
  resumototalcusto := 0;
  UniDBMemoresumoproducao.Clear;
  TabelaProducaoItens(
                      '  SELECT                                                                     ' +
                      '    p.lote,                                                                  ' +
                      '    li.tipo,                                                                 ' +
                      '    p.descricao,                                                             ' +
                      '    p.quantidade,                                                            ' +
                      '    p.custo_unitario,                                                        ' +
                      '    p.total_custo,                                                           ' +
                      '    p.pontos,                                                                ' +
                      '    p.custo_ponto,                                                           ' +
                      '    p.total_ponto                                                            ' +
                      '  FROM                                                                       ' +
                      '  PRODUCAOINTERNA_ITENS p inner join loteinterno li on (p.lote = li.lote)    ' +
                      '  WHERE p.mestre_id                                                        = ' + IntToStr(dm_rc.sqlBuscas.FindField('CODIGO').AsInteger) +
                      ' and li.tipo <>                                                              ' + QuotedStr('Sacaria') +
                      ' order by p.sequencia');

  UniDBMemoresumoproducao.Lines.Add(StrReplicate('*',77));
  UniDBMemoresumoproducao.Lines.Add('RELAÇÃO DOS ITENS UTILIZADOS');
  UniDBMemoresumoproducao.Lines.Add(StrReplicate('*',77));
  UniDBMemoresumoproducao.Lines.Add(replicadescricao('DESCRIÇÃO',40) + '|' +
                                    replicadescricao('QTDE',10)      + '|' +
                                    replicadescricao('PREÇO',11)     + '|' +
                                    replicadescricao('TOTAL',11)     + '|');


  dm_rc.fdqryproducaointernaitens.First;
  while not dm_rc.fdqryproducaointernaitens.Eof do
    begin
      if dm_rc.fdqryproducaointernaitens.findfield('TIPO').AsString = 'Sementes' then
        begin
          UniDBMemoresumoproducao.Lines.Add(copy(replicadescricao(dm_rc.fdqryproducaointernaitens.FindField('DESCRICAO').AsString + ' ' + dm_rc.fdqryproducaointernaitens.FindField('LOTE').AsString,40),1,40)                   + '|'+
                                            replicadescricao(dm_rc.fdqryproducaointernaitens.FindField('QUANTIDADE').AsString,10)                             + '|'+
                                            replicadescricao(FormatFloat('R$ 0.00',dm_rc.fdqryproducaointernaitens.FindField('CUSTO_PONTO').AsFloat),11)      + '|'+
                                            replicadescricao(FormatFloat('R$ 0.00',dm_rc.fdqryproducaointernaitens.FindField('TOTAL_PONTO').AsFloat)   ,11)   + '|');
          resumototalcusto := resumototalcusto + dm_rc.fdqryproducaointernaitens.FindField('TOTAL_PONTO').AsFloat;

        end
      else
        begin
          UniDBMemoresumoproducao.Lines.Add(copy(replicadescricao(dm_rc.fdqryproducaointernaitens.FindField('DESCRICAO').AsString,40),1,40)                   + '|'+
                                            replicadescricao(dm_rc.fdqryproducaointernaitens.FindField('QUANTIDADE').AsString,10)                             + '|'+
                                            replicadescricao(FormatFloat('R$ 0.00',dm_rc.fdqryproducaointernaitens.FindField('CUSTO_UNITARIO').AsFloat),11)   + '|'+
                                            replicadescricao(FormatFloat('R$ 0.00',dm_rc.fdqryproducaointernaitens.FindField('TOTAL_CUSTO').AsFloat)   ,11)   + '|');

          resumototalcusto := resumototalcusto + dm_rc.fdqryproducaointernaitens.FindField('TOTAL_CUSTO').AsFloat;
        end;
      dm_rc.fdqryproducaointernaitens.Next;
    end;

  UniDBMemoresumoproducao.Lines.Add(replicadescricao('TOTAL GERAL',40) + '|'+
                                    replicadescricao(dm_rc.sqlBuscas.FindField('TOTALKG').AsString,10)   + '|' +
                                    replicadescricao('',11)                                              + '|' +
                                    replicadescricao(FormatFloat('R$ 0.00',resumototalcusto),11)         + '|');

  UniDBMemoresumoproducao.Lines.Add('');
  UniDBMemoresumoproducao.Lines.Add(StrReplicate('*',77));
  UniDBMemoresumoproducao.Lines.Add('DEMAIS CUSTOS/ENCARGOS');
  UniDBMemoresumoproducao.Lines.Add(StrReplicate('*',77));
  UniDBMemoresumoproducao.Lines.Add(replicadescricao('DESCRIÇÃO',51) + '|' +
                                    replicadescricao('PREÇO',11)     + '|' +
                                    replicadescricao('TOTAL',11)     + '|');

  TabelaCustoLoteinternoItens('select * from CUSTO_LOTEINTERNOITENS where mestre_id = ' + IntToStr(sqlMaster.FindField('CODIGO_CUSTOPRODUCAO').AsInteger) + ' order by sequencia');
  totalgeralcustoencargos := 0;
  dm_rc.fdqrycustoloteinternoitens.First;
  while not dm_rc.fdqrycustoloteinternoitens.Eof do
    begin
      totalcustoencargos := 0;
      totalcustoencargos := dm_rc.fdqrycustoloteinternoitens.FindField('CUSTO').AsFloat * p_sacos;
      UniDBMemoresumoproducao.Lines.Add(copy(replicadescricao(dm_rc.fdqrycustoloteinternoitens.FindField('DESCRICAO').AsString,51),1            ,52)   + '|'+
                                             replicadescricao(FormatFloat('R$ 0.00',dm_rc.fdqrycustoloteinternoitens.FindField('CUSTO').AsFloat),11)   + '|'+
                                             replicadescricao(FormatFloat('R$ 0.00',totalcustoencargos)                                         ,11)   + '|');

      totalgeralcustoencargos := totalgeralcustoencargos + totalcustoencargos;

      dm_rc.fdqrycustoloteinternoitens.Next;
    end;
  UniDBMemoresumoproducao.Lines.Add(replicadescricao('TOTAL GERAL',63)                                     + '|'+
                                    replicadescricao(FormatFloat('R$ 0.00',totalgeralcustoencargos) ,11)   + '|');

  totalcustobatida := 0;
  custounitario    := 0;
  totalcustobatida := (resumototalcusto + totalgeralcustoencargos);
  custounitario    := MRound((totalcustobatida / p_sacos),2);

  UniDBMemoresumoproducao.Lines.Add('');
  UniDBMemoresumoproducao.Lines.Add(StrReplicate('*',77));
  UniDBMemoresumoproducao.Lines.Add('RESULTADOS DA PRODUÇÃO');
  UniDBMemoresumoproducao.Lines.Add(StrReplicate('*',77));
  UniDBMemoresumoproducao.Lines.Add(replicadescricao('PESO BRUTO'                                            ,63) + '|' +
                                    replicadescricao(dm_rc.sqlBuscas.FindField('TOTALKG').AsString + ' kg'   ,11) + '|');
  UniDBMemoresumoproducao.Lines.Add(replicadescricao('TOTAL DE PONTOS'                                       ,63) + '|' +
                                    replicadescricao(dm_rc.sqlBuscas.FindField('TOTALPONTOS').AsString       ,11) + '|');
  UniDBMemoresumoproducao.Lines.Add(replicadescricao('CUSTO TOTAL BATIDA'                                    ,63) + '|' +
                                    replicadescricao(FormatFloat('R$ 0.00',(totalcustobatida))               ,11) + '|');
  UniDBMemoresumoproducao.Lines.Add(replicadescricao('QUANTIDADE BATIDA'                                     ,63) + '|' +
                                    replicadescricao(FloatToStr(p_sacos) + ' Sacos'                          ,11) + '|');
  UniDBMemoresumoproducao.Lines.Add(replicadescricao('CUSTO UNITÁRIO'                                        ,63) + '|' +
                                    replicadescricao(FormatFloat('R$ 0.00',(custounitario))                  ,11) + '|');

  //*************************************************************************************************************************************//
  vlrmargemlucro   := 0;
  vlrcomissao      := 0;
  vlrimposto       := 0;
  vlrfretetonelada := 0;

  vlrfretetonelada := fretetonelada(sqlMaster.FindField('VALORFRETETONELADA').AsFloat,
                                    p_pesosaco,
                                    p_sacos);
  vlrmargemlucro   := margemlucro  (custounitario,
                                    sqlMaster.FindField('MARGEMLUCRO').AsFloat);
  vlrcomissao      := valorcomissao(custounitario                         ,
                                    sqlMaster.FindField('COMISSAO').AsFloat,
                                    sqlMaster.FindField('IMPOSTO').AsFloat ,
                                    vlrmargemlucro);
  vlrimposto       := valorimposto (custounitario                         ,
                                    sqlMaster.FindField('COMISSAO').AsFloat,
                                    sqlMaster.FindField('IMPOSTO').AsFloat ,
                                    vlrmargemlucro);
  UniDBMemotaxas.Clear;

  UniDBMemotaxas.Lines.Add(replicadescricao('DESCRIÇÃO'      ,26) + '|' +
                           replicadescricao('TAXAS '         ,11) + '|' +
                           replicadescricao('VLR P/ SC'      ,11) + '|');

  UniDBMemotaxas.Lines.Add(replicadescricao('MARGEM DE LUCRO'                                                       ,26) + '|' +
                           replicadescricao(FormatFloat('%  0.00',sqlMaster.FindField('MARGEMLUCRO').AsFloat)        ,11) + '|' +
                           replicadescricao(FormatFloat('R$ 0.00',vlrmargemlucro)                                   ,11) + '|');

  UniDBMemotaxas.Lines.Add(replicadescricao('COMISSÃO'                                                              ,26) + '|' +
                           replicadescricao(FormatFloat('%  0.00',sqlMaster.FindField('COMISSAO').AsFloat)           ,11) + '|' +
                           replicadescricao(FormatFloat('R$ 0.00',vlrcomissao)                                      ,11) + '|');

  UniDBMemotaxas.Lines.Add(replicadescricao('IMPOSTO'                                                               ,26) + '|' +
                           replicadescricao(FormatFloat('% 0.00',sqlMaster.FindField('IMPOSTO').AsFloat)             ,11) + '|' +
                           replicadescricao(FormatFloat('R$ 0.00',vlrimposto)                                       ,11) + '|');

  UniDBMemotaxas.Lines.Add(replicadescricao('FRETE TONELADA'                                                        ,26) + '|' +
                           replicadescricao(FormatFloat('R$ 0.00',sqlMaster.FindField('VALORFRETETONELADA').AsFloat) ,11) + '|' +
                           replicadescricao(FormatFloat('R$ 0.00',vlrfretetonelada)                                 ,11) + '|');

  //*************************************************************************************************************************************//
  vlrvendavistasaco := 0;
  vlrvendavistakg   := 0;
  vlrvendaprazosaco := 0;
  vlrvendaprazokg   := 0;

  vlrvendavistasaco := custounitario + vlrmargemlucro + vlrcomissao + vlrimposto + vlrfretetonelada;
  vlrvendavistakg   := MRound((vlrvendavistasaco / p_pesosaco),2);
  vlrvendaprazosaco := ((vlrvendavistasaco * sqlMaster.FindField('PERCVENDAPRAZO').AsFloat)/100) + vlrvendavistasaco;
  vlrvendaprazokg   := MRound((vlrvendaprazosaco / p_pesosaco),2);

  UniDBMemovendas.Clear;
  UniDBMemovendas.Lines.Add(replicadescricao('DESCRIÇÃO' ,27)  + '|' +
                            replicadescricao('POR SACO'  ,11)  + '|' +
                            replicadescricao('POR KG'    ,11)  + '|');

  UniDBMemovendas.Lines.Add(replicadescricao('VENDA A VISTA'                           ,27)  + '|' +
                            replicadescricao(FormatFloat('R$ 0.00',vlrvendavistasaco)  ,11)  + '|' +
                            replicadescricao(FormatFloat('R$ 0.00',vlrvendavistakg)    ,11)  + '|');
  UniDBMemovendas.Lines.Add(replicadescricao('VENDA A PRAZO'                           ,27)  + '|' +
                            replicadescricao(FormatFloat('R$ 0.00',vlrvendaprazosaco)  ,11)  + '|' +
                            replicadescricao(FormatFloat('R$ 0.00',vlrvendaprazokg)    ,11)  + '|');

  UniDBMemovendas.Lines.Add('');
end;


procedure TfrmCUSTOPRODUCAO.SetBut(Acao: TAcaoCrud);
var s:string ;
begin
  s := GetEnumName(TypeInfo(TAcaoCrud),integer(Acao));

  // Controle dos botoes
  if acao in [tpAguarde] then
    begin
      btnEditReg.Visible    := True;
      btnDeleteReg.Visible  := True;
      btnCancelReg.Visible  := False;
      btnOptions.Visible    := True;

      btnCalcReg.Visible    := False;
      btnSaveReg.Visible    := False;
      btnimpressao.Visible  := True;
    end
  else
  if acao in [tpIncluir,tpAlterar,tpExcluir] then
     begin
       btnEditReg.Visible    := false;
       btnDeleteReg.Visible  := false;
       btnCancelReg.Visible  := true;
       btnOptions.Visible    := True;

       btnCalcReg.Visible    := True;
       btnSaveReg.Visible    := True;
       btnimpressao.Visible  := False;

     end
   else if acao in [tpListaVazia] then
      begin
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCalcReg.Visible    := False;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
        btnOptions.Visible    := True;
        btnimpressao.Visible  := False;
      end
   else if acao in [tpCalcular] then
     begin
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCalcReg.Visible    := True;
        btnCancelReg.Visible  := True;
        btnSaveReg.Visible    := True;
        btnOptions.Visible    := True;
        btnimpressao.Visible  := False;
     end
    else if acao in [tpListacomRegistros] then
      begin
        btnEditReg.Visible    := true;
        btnDeleteReg.Visible  := true;
        btnCalcReg.Visible    := False;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
        btnOptions.Visible    := True;
        btnimpressao.Visible  := True;
       end;
end;

procedure TfrmCUSTOPRODUCAO.Transfere;
  var i : integer; Cmp:String;
begin
  sqlMaster.Close;
  FDQryFiltro.Close;
  FDQryFiltro.sql.Clear;
  FDQryFiltro.SQL.Text := 'SELECT * FROM custo_producao WHERE mestre_id = ' + IntToStr(mm.varM_CODIGOMESTRE);
  FDQryFiltro.Open;

  try
    sqlMaster.Close ;
    for i := 0 to  sqlMaster.Params.Count - 1 do
    begin
      Cmp :=  sqlMaster.Params[i].Name;
       sqlMaster.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
    end;
     sqlMaster.Open;
  Except
     sqlMaster.Params[0].AsInteger := -1 ;
     sqlMaster.Open;
  End;

  setbut(tpListacomRegistros);
   dm_rc.rc_LookUpUpdateData( Self ); //8.0: DEPOIS de abrir o registro (padrao da base)
end;

//8.0.0.0 receita modal (padrao DETALHESBENEFICIAMENTO)
procedure TfrmCUSTOPRODUCAO.UniFormCreate(Sender: TObject);
begin
//  rc_RenderLayout( Self, false, false, false );
  mm.varC_Lookup_Code := '';
  dm_rc.rc_RenderLookUpControls( Self );
  dm_rc.rc_LookUpUpdateData(  self  );
end;

procedure TfrmCUSTOPRODUCAO.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal          := nil;
end;

procedure TfrmCUSTOPRODUCAO.UniFormReady(Sender: TObject);
begin
  // reservado p/ ajuste fino de geometria (padrao modal RC)
end;

procedure TfrmCUSTOPRODUCAO.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 sem Constraints (regra 40b)
  frmCUSTOPRODUCAO.Height   := 556;
  frmCUSTOPRODUCAO.Width    := 935;
  frmCUSTOPRODUCAO.Position := poScreenCenter;
end;

procedure TfrmCUSTOPRODUCAO.UniFormShow(Sender: TObject);
begin
  Transfere();
end;

end.
