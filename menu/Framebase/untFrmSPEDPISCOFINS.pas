unit untFrmSPEDPISCOFINS; //8.0.0.0

// =====================================================================
// untFrmSPEDPISCOFINS — conversão 3.0 -> 8.0 (receita CONSULTA: frame TfrmBase,
// dfm verbatim; §44.1 ReadOnly nas colunas HTML; §41b badges text-bg-*)
// - Frame de ABA — NAO é modal §45. labExit/btnCloseForm SEM OnClick na 3.0:
//   preservados inertes (não inventar handler).
// - Fluxo: btnSearchCRUD -> Entradas/Saidas (ESCRITA_SPED_ENTRADA/SAIDA ->
//   SqlPesquisa -> sqlBuscas -> tbbusca.CopyDataSet) no dbgSearchCRUD;
//   click na coluna doc abre frmTELAGENERICA (DETALHESEMISSORDOC).
// - btnOptions: ProdutosB200 (Bloco K: TB_BLOCOK_0200/TB_MEDIDAS/
//   TB_OPERACAOSPED/tb_pessoassped p/ 0150/0200/0190) + SpedFiscal
//   (mkm_spedpiscofins: rempresa + rempresaserv=UniButtonEditempresa)
//   -> uniSession.SendFile (download do txt).
// - §46: pesquisa EMPRESAS -> untPesquisaGenerica.PesquisarCadastro
//   (preset EMPRESAS novo na canônica; ATIVO='T' herdado da 3.0).
// - rc_ShowSweetAlert 4->3 params (receita 8.0); badges badge-* -> text-bg-*.
// - Checkboxes Estoque Fiscal / Gerar Produção - BLOCO K: INERTES na 3.0
//   (sem handler, sem leitura no código) — preservadas verbatim.
// - OnExit DtIni -> DtEnd = EndOfMonth; UniFrameCreate: inicio->fim do mes.
// =====================================================================

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, uniEdit, UniButtonEdit, uniScreenMask, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniBasicGrid, uniDBGrid,
  uniCheckBox, uniDateTimePicker, uniScrollBox, uniPageControl, uniButton,
  uniBitBtn, uniLabel, uniSweetAlert;

type
  TfrmSPEDPISCOFINS = class(TfrmBase)
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    paGC: TUniContainerPanel;
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    paSearchFilter1: TUniContainerPanel;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    UniContainerPanel1: TUniContainerPanel;
    UniCheckBoxestoquefiscal: TUniCheckBox;
    UniCheckBoxproducao: TUniCheckBox;
    dbgSearchCRUD: TUniDBGrid;
    dsfiltro: TDataSource;
    tbbusca: TFDMemTable;
    tbbuscadetalhes: TStringField;
    tbbuscaSERIE: TStringField;
    tbbuscaDOCUMENTO: TIntegerField;
    tbbuscaOPERACAO: TStringField;
    tbbuscaPESSOA: TIntegerField;
    tbbuscaCODIGOBARRAS: TStringField;
    tbbuscaPROTOCOLO: TStringField;
    tbbuscaVLRBASEICMS: TFloatField;
    tbbuscaVLRICMS: TFloatField;
    tbbuscaVLRDESCONTOS: TFloatField;
    tbbuscaVLRPRODUTOS: TFloatField;
    tbbuscaVLRTOTAL: TFloatField;
    tbbuscaCONDICAO: TIntegerField;
    tbbuscaCANCELADA: TStringField;
    tbbuscaEMISSAO: TDateField;
    tbbuscaEMPRESA: TIntegerField;
    tbbuscaVLRDSPTRIBUTADA: TFloatField;
    tbbuscaTRAFRETE: TIntegerField;
    tbbuscaVLRIPI: TFloatField;
    tbbuscaCODIGOBARRASCOMPLEMENTO: TStringField;
    tbbuscaNUMERO: TStringField;
    tbbuscaENTRADA_SAIDA: TIntegerField;
    tbbuscadoc: TStringField;
    UniScreenMask1: TUniScreenMask;
    UniLabel5: TUniLabel;
    UniButtonEditempresa: TUniButtonEdit;
    procedure UniButtonEditempresaButtonClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edSearchCRUDDtIniExit(Sender: TObject);
    procedure tbbuscadetalhesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tbbuscadocGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnOptionsClick(Sender: TObject);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ativabusca();
  procedure Entradas    (const rempresa:integer;dataini,datafin:TDateTime);
  procedure Saidas      (const rempresa:integer;dataini,datafin:TDateTime);
  procedure ProdutosB200(const rempresa:integer;dataini,datafin:TDateTime);

  end;

var
  frmSPEDPISCOFINS: TfrmSPEDPISCOFINS;

implementation

{$R *.dfm}

uses MainModule, untPesquisaGenerica, System.DateUtils, mkm_funcoes, untDM_RC,
  mkm_procedures, mkm_func_web, untFrmTELAGENERICA, mkm_relatorios,
  mkm_spedpiscofins, ServerModule;

procedure TfrmSPEDPISCOFINS.ativabusca;
begin
  if not ( dsfiltro.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;



procedure TfrmSPEDPISCOFINS.btnOptionsClick(Sender: TObject);
var
  arq_dow : string;
begin
  inherited;
  btnSearchCRUD.OnClick(Self);
  ProdutosB200(mm.varI_Code_Company,edSearchCRUDDtIni.DateTime,edSearchCRUDDtEnd.DateTime);


  try
    arq_dow :=  SpedFiscal(mm.varI_Code_Company,
                           StrToInt(UniButtonEditempresa.Text),
                           edSearchCRUDDtIni.DateTime,
                           edSearchCRUDDtEnd.DateTime);

    unisession.SendFile(sm.LocalCachePath + arq_dow);
  except
    on e: exception do
    begin
      gera_log(e.message);
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI GERAR O SPED!' + e.Message , 'error' );
    end;
  end;
end;

procedure TfrmSPEDPISCOFINS.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmSPEDPISCOFINS.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;
  tbbusca.Close;
  Entradas(mm.varI_Code_Company,edSearchCRUDDtIni.DateTime,edSearchCRUDDtEnd.DateTime);
  Saidas  (mm.varI_Code_Company,edSearchCRUDDtIni.DateTime,edSearchCRUDDtEnd.DateTime);
  tbbusca.Open;
end;

procedure TfrmSPEDPISCOFINS.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  if Column.FieldName = 'doc' then
    begin
      mm.varI_Code_Numero_Documento    := tbbusca.FindField('NUMERO').AsInteger;
      mm.varI_Code_Documento_Documento := tbbusca.FindField('DOCUMENTO').AsInteger;
      mm.VarC_Atelagenerica            := 'DETALHESEMISSORDOC';
      frmTELAGENERICA.ShowModal();
    end;
end;

procedure TfrmSPEDPISCOFINS.edSearchCRUDDtIniExit(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtEnd.Text := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
end;

procedure TfrmSPEDPISCOFINS.Entradas(const rempresa: integer; dataini,
  datafin: TDateTime);
begin
  SqlPesquisa(ESCRITA_SPED_ENTRADA(rempresa,dataini,datafin));

  if dm_rc.sqlBuscas.recordcount > 0 then
    begin
      tbbusca.CopyDataSet(dm_rc.sqlBuscas);
    end;
end;

procedure TfrmSPEDPISCOFINS.ProdutosB200(const rempresa: integer; dataini,
  datafin: TDateTime);
var
  M_SQL : string;
begin
  dm_rc.TB_BLOCOK_0200.Close;
  dm_rc.TB_BLOCOK_0200.Open;
  //**************************************************************************//
  // ENTRADAS DOS PRODUTOS
  //**************************************************************************//
  M_SQL :=       ' SELECT I.PRODUTO FROM MVITENS I, OPERACOES O WHERE ' +
                 ' I.EMISSAO BETWEEN                                  ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
                 ' AND                                                ' + QuotedStr(DataPonto(DateToStr(datafin)))  +
                 ' AND O.CODIGO = I.OPERACAO                          ' +
                 ' AND O.ENTRADA_SAIDA = 0                            ' +
                 ' AND O.GERA_SPED     = 1                            ' +
                 ' AND O.TRANSPORTES   = 0                            ' +
                 ' AND I.EMPRESA       =                              ' + IntToStr(rempresa) +
                 ' GROUP BY 1 ORDER BY 1                              ';

  if SqlPesquisa(M_SQL) then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          SqlPesquisaPrimeira(' SELECT * FROM PRODUTOS P INNER JOIN SALDOS S ON (S.PRODUTO = P.CODIGO)' +
                              ' WHERE S.EMPRESA                                          =            ' + IntToStr(rempresa) +
                              ' AND   P.CODIGO                                           =            ' + IntToStr(dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger));

          dm_rc.TB_BLOCOK_0200.Append;
          dm_rc.TB_BLOCOK_0200.FindField('PRODUTO').AsInteger  := dm_rc.sqlpesquisaprimaria.FindField('CODIGO').AsInteger;
          dm_rc.TB_BLOCOK_0200.FindField('DESCRICAO').AsString := Acha_Item('PRODUTOS',dm_rc.sqlpesquisaprimaria.FindField('CODIGO').AsString);
          dm_rc.TB_BLOCOK_0200.FindField('UNIDADE').AsString   := dm_rc.sqlpesquisaprimaria.FindField('UNIDADE').AsString;
          dm_rc.TB_BLOCOK_0200.FindField('CUSTO').AsFloat      := dm_rc.sqlpesquisaprimaria.FindField('CUSTO').AsFloat;
          dm_rc.TB_BLOCOK_0200.FindField('NUMERONCM').AsString := dm_rc.sqlpesquisaprimaria.FindField('NUMERONCM').AsString;
          dm_rc.TB_BLOCOK_0200.FindField('QUANTIDADE').AsFloat := Abs(SaldoProdutoKardex_Nota(MM.varI_Code_Company,dm_rc.sqlpesquisaprimaria.FindField('CODIGO').AsInteger,datafin));
          dm_rc.TB_BLOCOK_0200.Post;

          dm_rc.sqlBuscas.Next;
        end;
    end;

  //**************************************************************************//
  // SAIDAS DOS PRODUTOS
  //**************************************************************************//

  M_SQL :=       ' SELECT I.PRODUTO FROM MVITENS I, OPERACOES O WHERE ' +
                 ' I.EMISSAO BETWEEN                                  ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
                 ' AND                                                ' + QuotedStr(DataPonto(DateToStr(datafin)))  +
                 ' AND O.CODIGO = I.OPERACAO                          ' +
                 ' AND O.ENTRADA_SAIDA = 1                            ' +
                 ' AND O.GERA_SPED     = 1                            ' +
                 ' AND O.TRANSPORTES   = 0                            ' +
                 ' AND I.EMPRESA       =                              ' + IntToStr(rempresa) +
                 ' GROUP BY 1 ORDER BY 1                              ';

  if SqlPesquisa(M_SQL) then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          SqlPesquisaPrimeira(' SELECT * FROM PRODUTOS P INNER JOIN SALDOS S ON (S.PRODUTO = P.CODIGO)' +
                              '                          INNER JOIN GRUPOS G ON (P.GRUPO   = G.CODIGO)' +
                              ' WHERE S.EMPRESA                                          =            ' + IntToStr(rempresa) +
                              ' AND   P.CODIGO                                           =            ' + IntToStr(dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger));

          if not dm_rc.TB_BLOCOK_0200.Locate('PRODUTO',dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger,[]) then
            begin
              dm_rc.TB_BLOCOK_0200.Append;
              dm_rc.TB_BLOCOK_0200.FindField('PRODUTO').AsInteger  := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
              dm_rc.TB_BLOCOK_0200.FindField('DESCRICAO').AsString := Acha_Item('PRODUTOS',dm_rc.sqlBuscas.FindField('PRODUTO').AsString);
              dm_rc.TB_BLOCOK_0200.FindField('UNIDADE').AsString   := dm_rc.sqlpesquisaprimaria.FindField('UNIDADE').AsString;
              dm_rc.TB_BLOCOK_0200.FindField('NUMERONCM').AsString := dm_rc.sqlpesquisaprimaria.FindField('NUMERONCM').AsString;
              dm_rc.TB_BLOCOK_0200.FindField('TIPO').AsString      := variif(dm_rc.sqlpesquisaprimaria.FindField('TIPO').AsString = '','00 - Mercadoria para Revenda',dm_rc.sqlpesquisaprimaria.FindField('TIPO').AsString);
              dm_rc.TB_BLOCOK_0200.FindField('CUSTO').AsFloat      := dm_rc.sqlpesquisaprimaria.FindField('CUSTO').AsFloat;
              dm_rc.TB_BLOCOK_0200.FindField('ICMS0').AsFloat      := variif(dm_rc.sqlpesquisaprimaria.FindField('ICMS0').AsFloat = 0,18,dm_rc.sqlpesquisaprimaria.FindField('ICMS0').AsFloat);
              dm_rc.TB_BLOCOK_0200.FindField('QUANTIDADE').AsFloat := abs(SaldoProdutoKardex_Nota(MM.varI_Code_Company,dm_rc.sqlpesquisaprimaria.FindField('CODIGO').AsInteger,datafin));
              dm_rc.TB_BLOCOK_0200.Post;
            end;
          dm_rc.sqlBuscas.Next;
        end;
    end;

  //***********************************************************************//
  //  MEDIDAS
  //***********************************************************************//
  dm_rc.TB_MEDIDAS.Close;
  dm_rc.TB_MEDIDAS.Open;

  M_SQL :=
         ' SELECT UPPER(MVITENS.unidade) UNIDADE, UPPER(MEDIDAS.DESCRICAO) DESCRICAO  ' +
         ' FROM MVITENS INNER JOIN MEDIDAS    ON (MVITENS.unidade  = MEDIDAS.SIGLA)   ' +
         '              INNER JOIN OPERACOES  ON (OPERACOES.CODIGO = MVITENS.OPERACAO)' +
         ' AND  OPERACOES.gera_sped =                                                 ' + QuotedStr('1')                            +
         ' AND   MVITENS.emissao between                                              ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
         ' and                                                                        ' + QuotedStr(DataPonto(DateToStr(datafin)))  +
         ' AND   OPERACOES.ENTRADA_SAIDA                                           =  ' + QuotedStr('0')                             +
         ' AND   MVITENS.EMPRESA                                                   =  ' + IntToStr(rempresa)                        +
         ' GROUP BY 1,2                                                               ';

  if SqlPesquisa(M_SQL) then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          if not dm_rc.TB_MEDIDAS.Locate('UNIDADE',dm_rc.sqlBuscas.FindField('UNIDADE').AsString,[]) then
            begin
              dm_rc.TB_MEDIDAS.append;
              dm_rc.TB_MEDIDAS.FindField('UNIDADE').AsString   := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;
              dm_rc.TB_MEDIDAS.FindField('DESCRICAO').AsString := variif(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = '','SEM NOMECLATURA',dm_rc.sqlBuscas.FindField('DESCRICAO').AsString);
              dm_rc.TB_MEDIDAS.post;
            end;
          dm_rc.sqlBuscas.Next;
        end;
    end;


  M_SQL :=
         ' SELECT UPPER(MVITENS.unidade) UNIDADE, UPPER(MEDIDAS.DESCRICAO) DESCRICAO  ' +
         ' FROM MVITENS INNER JOIN MEDIDAS    ON (MVITENS.unidade  = MEDIDAS.SIGLA)   ' +
         '              INNER JOIN OPERACOES  ON (OPERACOES.CODIGO = MVITENS.OPERACAO)' +
         ' AND  OPERACOES.gera_sped =                                                 ' + QuotedStr('1')                            +
         ' AND   MVITENS.emissao between                                              ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
         ' and                                                                        ' + QuotedStr(DataPonto(DateToStr(datafin)))  +
         ' AND   OPERACOES.ENTRADA_SAIDA                                           =  ' + QuotedStr('1')                             +
         ' AND   MVITENS.EMPRESA                                                   =  ' + IntToStr(rempresa)                        +
         ' GROUP BY 1,2                                                               ';

  if SqlPesquisa(M_SQL) then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          if not dm_rc.TB_MEDIDAS.Locate('UNIDADE',dm_rc.sqlBuscas.FindField('UNIDADE').AsString,[]) then
            begin
              dm_rc.TB_MEDIDAS.append;
              dm_rc.TB_MEDIDAS.FindField('UNIDADE').AsString   := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;
              dm_rc.TB_MEDIDAS.FindField('DESCRICAO').AsString := variif(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = '','SEM NOMECLATURA',dm_rc.sqlBuscas.FindField('DESCRICAO').AsString);
              dm_rc.TB_MEDIDAS.post;
            end;
          dm_rc.sqlBuscas.Next;
        end;
    end;

  //***********************************************************************//
  //  OPERACAO
  //***********************************************************************//

  dm_rc.TB_OPERACAOSPED.Close;
  dm_rc.TB_OPERACAOSPED.Open;

  M_SQL :=
          ' SELECT substring(OPERACAO from 1 for 4) OPERACAO FROM MVMESTRE, OPERACOES WHERE  ' +
          ' MVMESTRE.EMISSAO BETWEEN                                   ' + QuotedStr(DataPonto(DateToStr(dataini))) +
          ' AND                                                        ' + QuotedStr(DataPonto(DateToStr(datafin))) +
          ' AND   MVMESTRE.OPERACAO = OPERACOES.CODIGO                 ' +
          ' AND   ((OPERACOES.ENTRADA_SAIDA       = 0) or              ' +
          '        (OPERACOES.ENTRADA_SAIDA       = 1))                ' +
          ' AND   OPERACOES.GERA_SPED             = 1                  ' +
          ' AND   OPERACOES.TRANSPORTES           = 0                  ' +
          ' AND   ((MVMESTRE.EMPRESA              =                    ' + Inttostr(rempresa) + ')'+ 'or'+
          '(MVMESTRE.EMPRESA                      =                    ' + QuotedStr(UniButtonEditempresa.Text) + '))'+
          ' GROUP BY 1                                                 ';

  if SqlPesquisa(M_SQL) then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          dm_rc.TB_OPERACAOSPED.Append;
          dm_rc.TB_OPERACAOSPED.FindField('CODIGO').AsString    := dm_rc.sqlBuscas.FindField('OPERACAO').AsString;
          dm_rc.TB_OPERACAOSPED.FindField('DESCRICAO').AsString := Acha_Item('OPERACOES',dm_rc.sqlBuscas.FindField('OPERACAO').AsString);
          dm_rc.TB_OPERACAOSPED.Post;

          dm_rc.sqlBuscas.Next;
        end;
    end;

  //***********************************************************************//
  //  BLOCO 150 - ENTRADAS - PESSOAS
  //***********************************************************************//
  dm_rc.tb_pessoassped.Close;
  dm_rc.tb_pessoassped.Open;

  M_SQL :=
          ' SELECT PESSOA, DOCUMENTO FROM SPED_ENTRADAS WHERE  ' +
          ' EMISSAO BETWEEN                                    ' + QuotedStr(DataPonto(DateToStr(dataini))) +
          ' AND                                                ' + QuotedStr(DataPonto(DateToStr(datafin))) +
          ' AND EMPRESA                                     =  ' + IntToStr(rempresa) +
          ' GROUP BY PESSOA, DOCUMENTO                         ';

  if SqlPesquisa(M_SQL) then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          dm_rc.tb_pessoassped.Append;
          dm_rc.tb_pessoassped.FindField('CONTROLE').AsInteger := dm_rc.sqlBuscas.FindField('PESSOA').AsInteger;
          dm_rc.tb_pessoassped.FindField('CODIGO').AsString    := variif(dm_rc.sqlBuscas.FindField('DOCUMENTO').AsString = '1','C','F') + dm_rc.sqlBuscas.FindField('PESSOA').AsString;
          dm_rc.tb_pessoassped.FindField('NOME').AsString      := Acha_Item('PESSOAS',dm_rc.sqlBuscas.FindField('PESSOA').AsString);
          dm_rc.tb_pessoassped.Post;

          dm_rc.sqlBuscas.Next;
        end;
    end;

  //***********************************************************************//
  //  BLOCO 150 - SAIDAS - PESSOAS
  //***********************************************************************//
  M_SQL :=
          ' SELECT PESSOA, DOCUMENTO FROM SPED_SAIDAS WHERE    ' +
          ' EMISSAO BETWEEN                                    ' + QuotedStr(DataPonto(DateToStr(dataini))) +
          ' AND                                                ' + QuotedStr(DataPonto(DateToStr(datafin))) +
          ' AND EMPRESA                                     =  ' + IntToStr(rempresa) +
          ' GROUP BY PESSOA, DOCUMENTO                         ';

  if SqlPesquisa(M_SQL) then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          if not dm_rc.tb_pessoassped.Locate('CONTROLE',dm_rc.sqlBuscas.FindField('PESSOA').AsInteger,[]) then
            begin
              dm_rc.tb_pessoassped.Append;
              dm_rc.tb_pessoassped.FindField('CONTROLE').AsInteger := dm_rc.sqlBuscas.FindField('PESSOA').AsInteger;
              dm_rc.tb_pessoassped.FindField('CODIGO').AsString    := variif(dm_rc.sqlBuscas.FindField('DOCUMENTO').AsString = '1','C','F') + dm_rc.sqlBuscas.FindField('PESSOA').AsString;
              dm_rc.tb_pessoassped.FindField('NOME').AsString      := Acha_Item('PESSOAS',dm_rc.sqlBuscas.FindField('PESSOA').AsString);
              dm_rc.tb_pessoassped.Post;
            end;
          dm_rc.sqlBuscas.Next;
        end;
    end;
  //***********************************************************************//

  //***********************************************************************//
  //  BLOCO 150 - SAIDAS - TRANSPORTES
  //***********************************************************************//
  M_SQL :=
          ' SELECT PESSOA, DOCUMENTO FROM SPED_TRANSPORTES WHERE    ' +
          ' EMISSAO BETWEEN                                         ' + QuotedStr(DataPonto(DateToStr(dataini))) +
          ' AND                                                     ' + QuotedStr(DataPonto(DateToStr(datafin))) +
          ' AND EMPRESA                                          =  ' + IntToStr(rempresa) +
          ' GROUP BY PESSOA, DOCUMENTO                              ';

  if SqlPesquisa(M_SQL) then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          if not dm_rc.tb_pessoassped.Locate('CONTROLE',dm_rc.sqlBuscas.FindField('PESSOA').AsInteger,[]) then
            begin
              dm_rc.tb_pessoassped.Append;
              dm_rc.tb_pessoassped.FindField('CONTROLE').AsInteger := dm_rc.sqlBuscas.FindField('PESSOA').AsInteger;
              dm_rc.tb_pessoassped.FindField('CODIGO').AsString    := variif(dm_rc.sqlBuscas.FindField('DOCUMENTO').AsString = '1','C','F') + dm_rc.sqlBuscas.FindField('PESSOA').AsString;
              dm_rc.tb_pessoassped.FindField('NOME').AsString      := Acha_Item('PESSOAS',dm_rc.sqlBuscas.FindField('PESSOA').AsString);
              dm_rc.tb_pessoassped.Post;
            end;

          dm_rc.sqlBuscas.Next;
        end;
    end;
  //***********************************************************************//

  dm_rc.tb_pessoassped.IndexFieldNames := 'CONTROLE';
  dm_rc.TB_BLOCOK_0200.IndexFieldNames := 'PRODUTO';
  mm.VarC_Atelagenerica                := 'BLOCOK200';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmSPEDPISCOFINS.Saidas(const rempresa: integer; dataini,
  datafin: TDateTime);
begin
  SqlPesquisa(ESCRITA_SPED_SAIDA(rempresa,dataini,datafin));

  if dm_rc.sqlBuscas.recordcount > 0 then
    begin
      tbbusca.CopyDataSet(dm_rc.sqlBuscas);
    end;
end;

procedure TfrmSPEDPISCOFINS.tbbuscadetalhesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if tbbuscaENTRADA_SAIDA.AsString = '1' then
        Text := '<span class="badge text-bg-success">Saidas</span>'
      else
      if tbbuscaENTRADA_SAIDA.AsString = '0' then
        Text := '<span class="badge text-bg-danger">Entradas</span>';
    end;
end;

procedure TfrmSPEDPISCOFINS.tbbuscadocGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  inherited;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-file-alt fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmSPEDPISCOFINS.UniButtonEditempresaButtonClick(Sender: TObject);
begin
  inherited;
  PesquisarCadastro('EMPRESAS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      UniButtonEditempresa.Text := Codigo;
    end);
end;
procedure TfrmSPEDPISCOFINS.UniFrameCreate(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtIni.Text := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
end;

initialization
  RegisterClass(TfrmSPEDPISCOFINS);
end.
