unit untCadPRODUCAOINTERNA; //8.0.0.0
(*
[PT] Conversao RadCORE 3.0 -> 8.0
     - TfrmcadPRODUCAOINTERNO -> TfrmCadPRODUCAOINTERNA (menus por NOME: atualizar)
     - Mestre-detalhe: cabecalho PRODUCAOINTERNA em dsMaster (sqlMaster) + itens
       PRODUCAOINTERNA_ITENS no tbdetalhes herdado (grid UniDBGridbatidaitens
       dentro do card, em rcBlock160, DataSource dsdetalhes - padrao CUSTO_LOTEINTERNO).
     - rcBlocks do cabecalho preservados da 3.0 (10..150, unicidade/ordem visual ok,
       linhas somam 12: 3+3+3+3 / 3+1+5+3 / 6+6 / 4+4+4); hints cols originais;
       campos com Anchors akRight (regra 40a); grid em rcBlock160 (md-12).
     - UniButtonDbEditPRODUTODESTINO -> edLkpPRODUTOS declarativo (hint DESTINO=PRODUTO,
       regra 38) + OnExit grava PRODUTO/DESCRICAO via rc_GetLookUpField.
     - UniButtonDbEditLOTEDESTINO MANTIDO (busca custom FrmPesquisaloteinterno que
       preenche LOTE/PRODUTO/DESCRICAO/PUREZA/PADRAO - nao e lookup declaravel).
     - Popup proprio UniPopupMenudetalhes (impressao/custos/duplicar-importar) aberto
       pelo labOptions (topbar 8.0); N1 renomeado N1DUP (colisao c/ base).
     - FDQryCad -> sqlMaster (dsMaster) em todo o codigo; FDQryFiltro (16 persistent
       fields) agora filhos do sqlSearchMaster; badges de STATUS preservados.
     - rc_ShowYesNo sincrona (8.0 retorna boolean) no exclui do grid.
     - rc_ShowToasterRT -> rc_ShowToaster (assinatura 8.0 confirmada).
     - Modais via mm.varC_Form_Modal + GetFormInstance (receita 8.0): CUSTOPRODUCAO,
       TELADETALHESPRODUCAODLOTE, Pesquisaloteinterno.
     - DEPENDENCIAS a converter/confirmar no projeto 8.0: untFrmPesquisaloteinterno,
       untFrmTELADETALHESPRODUCAODLOTE, untFrmCUSTOPRODUCAO, untFrmPesquisa (I1),
       mkm_impressao (IMPRESSAO_producaointerna), unReportImpressao, mkm_procedures
       (SqlPesquisa/SqlPesquisaPrimeira/TabelaProducaoItens/executasql/CalculaLoteInterno),
       dm_rc.fdqryproducaointernaitens, mm.varC_codigo_busca_lote/Seta_Busca (ok na 8.0).
[EN] RadCORE 3.0 -> 8.0 conversion
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIApplication, uniGUIFrame, untFrmCRUDproprio, Data.DB, uniBasicGrid, uniDBGrid,
  uniPanel, uniPageControl, uniGUIBaseClasses, uniScrollBox, uniDBEdit,
  uniMultiItem, uniComboBox, uniEdit, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniCheckBox, uniFieldSet,
  uniDBComboBox, uniDBLookupComboBox, uniSpeedButton, uniDBCheckBox,
  uniMainMenu, uniHTMLFrame, Data.FMTBcd, Data.SqlExpr, uniSpinEdit, uniMemo, Vcl.Menus, uniSweetAlert, uniDBNavigator,
  uniDateTimePicker, uniDBDateTimePicker, UniButtonDbEdit,
  untFrmBaseCRUD, uniGUIClasses,mkm_funcoes;

type
  TfrmCadPRODUCAOINTERNA = class(TfrmCRUDproprio)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock515: TUniContainerPanel;
    rcBlock2: TUniContainerPanel;
    rcBlock3: TUniContainerPanel;
    labRcCollapseGeneral: TUniLabel;
    labTitleCardGeral: TUniLabel;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock28: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock68: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    rcBlock108: TUniContainerPanel;
    rcBlock57: TUniContainerPanel;
    rcBlock148: TUniContainerPanel;
    rcBlock65: TUniContainerPanel;
    rcBlock160: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    edCodigo: TUniDBEdit;
    UniDBEdit1: TUniDBEdit;
    UniDBEdit2: TUniDBEdit;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniButtonDbEditLOTEDESTINO: TUniButtonDbEdit;
    edLkpPRODUTOS: TUniDBEdit;
    UniDBFormattedNumberEditquantidade: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniDBComboBox2: TUniDBComboBox;
    UniDBComboBoxMARCA: TUniDBComboBox;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBCheckBox2: TUniDBCheckBox;
    UniDBCheckBox3: TUniDBCheckBox;
    UniDBGridbatidaitens: TUniDBGrid;
    UniPopupMenudetalhes: TUniPopupMenu;
    EntregadosItenss1: TUniMenuItem;
    N13: TUniMenuItem;
    C1: TUniMenuItem;
    N1DUP: TUniMenuItem;
    I1: TUniMenuItem;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroEMISSAO: TDateField;
    FDQryFiltroDOCUMENTO: TIntegerField;
    FDQryFiltroLOTE: TStringField;
    FDQryFiltroPRODUTO: TIntegerField;
    FDQryFiltroDESCRICAO: TStringField;
    FDQryFiltroPUREZA: TFMTBCDField;
    FDQryFiltroTOTALKG: TFMTBCDField;
    FDQryFiltroTOTALPONTOS: TFMTBCDField;
    FDQryFiltroSTATUS: TStringField;
    FDQryFiltroTOTAL_CUSTO: TBCDField;
    tbdetalhesLOTE: TStringField;
    tbdetalhesPRODUTO: TIntegerField;
    tbdetalhesDESCRICAO: TStringField;
    tbdetalhesSEQUENCIA: TIntegerField;
    tbdetalhesQUANTIDADE: TFloatField;
    tbdetalhesbuscalote: TStringField;
    tbdetalhesexclui: TStringField;
    tbdetalhesTIPO: TStringField;
    tbdetalhesPUREZA: TFloatField;
    tbdetalhesPONTOS: TFloatField;
    tbdetalhesCUSTO_UNITARIO: TCurrencyField;
    tbdetalhesTOTAL_CUSTO: TCurrencyField;
    tbdetalhesPERC: TStringField;
    tbdetalhesCUSTO_PONTO: TFloatField;
    tbdetalhesTOTAL_PONTO: TFloatField;
    tbdetalhescalculos: TStringField;
    sqlSearchMasterNUMERO: TIntegerField;
    UniDBEdit4: TUniDBEdit;
    rcBlock98: TUniContainerPanel;
    rcBlock128: TUniContainerPanel;
    UniLabel16: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel10: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniButtonDbEditLOTEDESTINOButtonClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure tbdetalhesbuscaloteGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tbdetalhesexcluiGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniDBGridbatidaitensCellClick(Column: TUniDBGridColumn);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure tbdetalhesAfterPost(DataSet: TDataSet);
    procedure tbdetalhesBeforePost(DataSet: TDataSet);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure UniDBFormattedNumberEditquantidadeExit(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure FDQryFiltroSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tbdetalhesAfterDelete(DataSet: TDataSet);
    procedure tbdetalhesTIPOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tbdetalhescalculosGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure EntregadosItenss1Click(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure edLkpPRODUTOSExit(Sender: TObject);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
  procedure BuscaLoteinterno(codigo:integer);
  procedure carregalote(codigo:integer);
  procedure CalculaTotal();
  procedure Exclui(codigo:integer);
  procedure CarregaMarca();
  procedure HabilitaMenu(acao:string);
  procedure importacabecalho(mestreid:integer);
  procedure importacaoitens(mestreid:integer);
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, Main,
  untFrmMessage, uconsts, uconsts_cfg,
  mkm_func_web, mkm_layout, mkm_restfuncs, mkm_crudfuncs,
  mkm_procedures, untFrmPesquisaloteinterno,
  untFrmTELADETALHESPRODUCAODLOTE, mkm_impressao, unReportImpressao,
  untFrmCUSTOPRODUCAO, untFrmPesquisa; //8.0.0.0

procedure TfrmCadPRODUCAOINTERNA.UniFrameCreate(Sender: TObject);
begin
  CarregaMarca();

  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:2|'+
                        'grid-paginator:center|' +
                        ']]';

  inherited;

end;

procedure TfrmCadPRODUCAOINTERNA.btnCancelRegClick(Sender: TObject);
begin
  inherited;
  tbdetalhes.Close;
  HabilitaMenu('cancela');

end;

procedure TfrmCadPRODUCAOINTERNA.btnDeleteRegClick(Sender: TObject);
begin
  Exclui(sqlMaster.FindField('CODIGO').AsInteger);
  inherited;
end;

procedure TfrmCadPRODUCAOINTERNA.btnEditRegClick(Sender: TObject);
begin
  tbdetalhes.AfterPost  := nil;
  tbdetalhes.BeforePost := nil;
  tbdetalhes.AfterDelete:= nil;

  inherited;

  tbdetalhes.AfterPost   := tbdetalhesAfterPost;
  tbdetalhes.BeforePost  := tbdetalhesBeforePost;
  tbdetalhes.AfterDelete := tbdetalhesAfterDelete;

  UniDBGridbatidaitens.Options          := UniDBGridbatidaitens.Options - [dgRowSelect];
  UniDBGridbatidaitens.Options          := UniDBGridbatidaitens.Options + [dgEditing];

  HabilitaMenu('altera');

end;

procedure TfrmCadPRODUCAOINTERNA.btnNewRegClick(Sender: TObject);
begin
  tbdetalhes.AfterPost    := nil;
  tbdetalhes.BeforePost   := nil;
  tbdetalhes.AfterDelete  := nil;

  CarregaMarca();

  inherited;

  tbdetalhes.AfterPost    := tbdetalhesAfterPost;
  tbdetalhes.BeforePost   := tbdetalhesBeforePost;
  tbdetalhes.AfterDelete  := tbdetalhesAfterDelete;

  UniButtonDbEditLOTEDESTINO.SetFocus;

  UniDBGridbatidaitens.Options          := UniDBGridbatidaitens.Options - [dgRowSelect];
  UniDBGridbatidaitens.Options          := UniDBGridbatidaitens.Options + [dgEditing];
  HabilitaMenu('inclui');
end;

procedure TfrmCadPRODUCAOINTERNA.btnOptionsClick(Sender: TObject);
begin
  inherited;
  //8.0.0.0 o botao de opcoes da 3.0 virou o labOptions da topbar 8.0
  UniPopupMenudetalhes.PopupBy( TUniLabel( sender ) );
end;

procedure TfrmCadPRODUCAOINTERNA.btnSaveRegClick(Sender: TObject);
begin
  inherited;
  UniDBGridbatidaitens.Options          := UniDBGridbatidaitens.Options - [dgEditing];
  HabilitaMenu('grava');

end;

procedure TfrmCadPRODUCAOINTERNA.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;
  if FDQryFiltro.RecordCount > 0 then
    HabilitaMenu('carrega')
  else
    HabilitaMenu('grava')

end;

procedure TfrmCadPRODUCAOINTERNA.BuscaLoteinterno(codigo: integer);
begin
  if sqlMaster.State in [dsInsert,dsEdit] then
    begin
      SqlPesquisa('select * from LOTEINTERNO where codigo = ' + IntToStr(codigo));

      sqlMaster.Edit;
      sqlMaster.FindField('LOTE').AsString      :=  dm_rc.sqlBuscas.FindField('LOTE').AsString;
      sqlMaster.FindField('PRODUTO').AsInteger  :=  dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
      sqlMaster.FindField('DESCRICAO').AsString :=  dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
      sqlMaster.FindField('PUREZA').AsFloat     :=  dm_rc.sqlBuscas.FindField('PUREZA').AsFloat;
      sqlMaster.FindField('PADRAO').AsString    :=  dm_rc.sqlBuscas.FindField('CODIGOP').AsString;

    end;

end;

procedure TfrmCadPRODUCAOINTERNA.C1Click(Sender: TObject);
begin
  inherited;
  mm.varM_CODIGOMESTRE := FDQryFiltroCODIGO.AsInteger;
  mm.varC_Form_Modal := untFrmCUSTOPRODUCAO.frmCUSTOPRODUCAO; //8.0.0.0 padrao modal
  mm.varC_Form_Modal.ShowModal();
end;

procedure TfrmCadPRODUCAOINTERNA.CalculaTotal;
var
  M_MARCA       : TBookMark;
  TOTAL         : Real;
  CUSTOTOTAL    : Real;
  TOTALPONTOS   : Real;
  TOTALQTDEPERC,
  RESULTPERC    : Real;
begin
  M_MARCA      := tbdetalhes.GetBookmark;
  TOTALPONTOS  := 0;
  TOTAL        := 0;
  CUSTOTOTAL   := 0;
  TOTALQTDEPERC:= 0;
  RESULTPERC   := 0;


  tbdetalhes.DisableControls;
  tbdetalhes.AfterPost  := nil;
  tbdetalhes.BeforePost := nil;

  tbdetalhes.First;
  while not tbdetalhes.Eof do
    begin
      if tbdetalhesLOTE.AsString <> '' then
        begin
          tbdetalhes.Edit;
          tbdetalhesTOTAL_CUSTO.AsFloat  := MRound(tbdetalhesCUSTO_UNITARIO.AsFloat * tbdetalhesQUANTIDADE.AsFloat,2);
          tbdetalhesPONTOS.AsFloat       := MRound((tbdetalhesQUANTIDADE.AsFloat    * tbdetalhesPUREZA.AsFloat),2);
          tbdetalhesTOTAL_PONTO.AsFloat  := MRound(tbdetalhesCUSTO_PONTO.AsFloat    * tbdetalhesPONTOS.AsFloat,2);

          if tbdetalhesTIPO.AsString = 'Sementes' then
            begin
              TOTALPONTOS  := TOTALPONTOS + tbdetalhesPONTOS.AsFloat;
              CUSTOTOTAL   := CUSTOTOTAL  + tbdetalhesTOTAL_PONTO.AsFloat;
            end;

          if tbdetalhesQUANTIDADE.AsString <> '' then
            begin
              if (tbdetalhesTIPO.AsString <> 'Sacaria') then
                TOTAL      := TOTAL      + tbdetalhesQUANTIDADE.AsFloat;

              CUSTOTOTAL := CUSTOTOTAL + tbdetalhesTOTAL_CUSTO.AsFloat;
            end;
        end;

      TOTALQTDEPERC := TOTALQTDEPERC + tbdetalhesQUANTIDADE.AsFloat;

      tbdetalhes.Next;
    end;

  tbdetalhes.First;
  while not tbdetalhes.Eof do
    begin
      if tbdetalhesLOTE.AsString <> '' then
        begin
          RESULTPERC := MRound((tbdetalhesQUANTIDADE.AsFloat / TOTALQTDEPERC) *100,2);

          tbdetalhes.Edit;
          tbdetalhesPERC.AsString := FloatToStr(RESULTPERC);
        end;
      tbdetalhes.Next;
    end;

  sqlMaster.FindField('TOTAL_CUSTO').AsCurrency  := MRound(CUSTOTOTAL,2);
  sqlMaster.FindField('TOTALKG').AsCurrency      := MRound(TOTAL,2);
  sqlMaster.FindField('TOTALPONTOS').AsFloat     := TOTALPONTOS;

  tbdetalhes.AfterPost  := tbdetalhesAfterPost;
  tbdetalhes.BeforePost := tbdetalhesBeforePost;

  tbdetalhes.GotoBookmark(M_MARCA);
  tbdetalhes.FreeBookmark(M_MARCA);
  tbdetalhes.Refresh;
  tbdetalhes.EnableControls;
end;

procedure TfrmCadPRODUCAOINTERNA.carregalote(codigo: integer);
begin
  if sqlMaster.State in [dsInsert,dsEdit] then
    begin
      SqlPesquisa('select * from LOTEINTERNO where codigo = ' + IntToStr(codigo));

      tbdetalhes.Edit;
      tbdetalhes.FindField('LOTE').AsString           :=  dm_rc.sqlBuscas.FindField('LOTE').AsString;
      tbdetalhes.FindField('PRODUTO').AsInteger       :=  dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
      tbdetalhes.FindField('DESCRICAO').AsString      :=  dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
      tbdetalhes.FindField('CUSTO_UNITARIO').AsFloat  :=  dm_rc.sqlBuscas.FindField('CUSTO_UNITARIO').AsFloat;
      tbdetalhes.FindField('CUSTO_PONTO').AsFloat     :=  dm_rc.sqlBuscas.FindField('CUSTO_PONTO').AsFloat;
      tbdetalhes.FindField('PUREZA').AsFloat          :=  dm_rc.sqlBuscas.FindField('PUREZA').AsFloat;
      tbdetalhes.FindField('TIPO').AsString           :=  dm_rc.sqlBuscas.FindField('TIPO').AsString;
    end;
end;

procedure TfrmCadPRODUCAOINTERNA.CarregaMarca;
begin
  UniDBComboBoxMARCA.Clear;
  if SqlPesquisa('SELECT DESCRICAO FROM MARCA WHERE ATIVO = '+QuotedStr('T')+' ORDER BY CODIGO') then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          UniDBComboBoxMARCA.Items.Add(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString);

          dm_rc.sqlBuscas.Next;
        end;
    end;
end;

procedure TfrmCadPRODUCAOINTERNA.dbgSearchCRUDDblClick(Sender: TObject);
begin
  tbdetalhes.AfterPost  := nil;
  tbdetalhes.BeforePost := nil;
  inherited;
  tbdetalhes.AfterPost  := tbdetalhesAfterPost;
  tbdetalhes.BeforePost := tbdetalhesBeforePost;
  HabilitaMenu('carrega');

end;

procedure TfrmCadPRODUCAOINTERNA.EntregadosItenss1Click(Sender: TObject);
begin
  mm.varC_caminhopdf :=  IMPRESSAO_producaointerna(
                         MM.varI_Code_Company,
                         FDQryFiltro.FindField('CODIGO').AsInteger);

  unfImpressao.ShowModal();
end;

procedure TfrmCadPRODUCAOINTERNA.Exclui(codigo: integer);
begin
  if TabelaProducaoItens('select * from MANUTENCAOLOTE_INTERNO where MESTRE_PRODUCAO = ' + IntToStr(codigo)) then
    begin
      executasql        ('delete   from MANUTENCAOLOTE_INTERNO where MESTRE_PRODUCAO =  ' + IntToStr(codigo));
      dm_rc.fdqryproducaointernaitens.First;
      while not dm_rc.fdqryproducaointernaitens.Eof do
        begin

          CalculaLoteInterno (mm.varI_Code_Company,
                              dm_rc.fdqryproducaointernaitens.FindField('PRODUTO').AsInteger,
                              dm_rc.fdqryproducaointernaitens.Findfield('LOTE').AsString);

          dm_rc.fdqryproducaointernaitens.Next;
        end;
    end;
end;

procedure TfrmCadPRODUCAOINTERNA.FDQryFiltroSTATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if FDQryFiltroSTATUS.AsString = 'Concluido' then
        Text := '<span class="badge text-bg-success">Concluido</span>'
      else
      if FDQryFiltroSTATUS.AsString = 'Andamento' then
        Text := '<span class="badge text-bg-danger">Adamento</span>'
    end;
end;

procedure TfrmCadPRODUCAOINTERNA.HabilitaMenu(acao: string);
begin
  if StrContains('inclui',acao) then
    begin
      I1.Enabled                := True;     //duplicar
      EntregadosItenss1.Enabled := False;    //impresssao
      C1.Enabled                := False;    //custos
    end;
  if StrContains('altera',acao) then
    begin
      I1.Enabled                := False;    //duplicar
      EntregadosItenss1.Enabled := False;    //impresssao
      C1.Enabled                := False;    //custos
    end;
  if StrContains('carrega#grava',acao) then
    begin
      I1.Enabled                := False;    //duplicar
      EntregadosItenss1.Enabled := True;     //impresssao
      C1.Enabled                := True;     //custos
    end;
  if StrContains('cancela',acao) then
    begin
      I1.Enabled                := False;    //duplicar
      EntregadosItenss1.Enabled := False;    //impresssao
      C1.Enabled                := False;    //custos
    end;
end;
procedure TfrmCadPRODUCAOINTERNA.importacabecalho(mestreid:integer);
  var
    i            : integer; Cmp:String;
    tableimporta : TFDQuery;
begin
  tableimporta            := TFDQuery.Create(nil);
  tableimporta.Connection := mm.SQLConn;

  tableimporta.Close;
  tableimporta.SQL.Clear;
  tableimporta.sql.Text  := 'select * from producaointerna where codigo = ' + IntToStr(mestreid);
  tableimporta.Open();

  try
    sqlMaster.FindField('CODIGO').AsInteger    := 0;
    sqlMaster.FindField('NUMERO').AsInteger    := 0;
    sqlMaster.FindField('DOCUMENTO').AsInteger := 70;
    sqlMaster.FindField('EMISSAO').AsDateTime  := Date;
    sqlMaster.FindField('EMPRESA').AsInteger   := MM.varI_Code_Company;
    sqlMaster.FindField('STATUS').AsString     := 'Andamento';

    sqlMaster.FindField('PRODUTO').AsInteger   := tableimporta.FindField('PRODUTO').AsInteger;
    sqlMaster.FindField('DESCRICAO').AsString  := tableimporta.FindField('DESCRICAO').AsString;
    sqlMaster.FindField('SACARIA').AsString    := tableimporta.FindField('SACARIA').AsString;
    sqlMaster.FindField('PADRAO').AsString     := tableimporta.FindField('PADRAO').AsString;
    sqlMaster.FindField('LOTE').AsString       := tableimporta.FindField('LOTE').AsString;
    sqlMaster.FindField('PUREZA').AsFloat      := tableimporta.FindField('PUREZA').AsFloat;
    sqlMaster.FindField('TOTALKG').AsFloat     := tableimporta.FindField('TOTALKG').AsFloat;
    sqlMaster.FindField('TOTALPONTOS').AsFloat := tableimporta.FindField('TOTALPONTOS').AsFloat;
    sqlMaster.FindField('TOTAL_CUSTO').AsFloat := tableimporta.FindField('TOTAL_CUSTO').AsFloat;
    sqlMaster.FindField('PESOSACO').AsFloat    := tableimporta.FindField('PESOSACO').AsFloat;
    sqlMaster.FindField('SACO_05KG').AsString  := tableimporta.FindField('SACO_05KG').AsString;
    sqlMaster.FindField('SACO_10KG').AsString  := tableimporta.FindField('SACO_10KG').AsString;
    sqlMaster.FindField('SACO_20KG').AsString  := tableimporta.FindField('SACO_20KG').AsString;

    dm_rc.rc_ShowToaster( 'info', 'Produ'#231#227'o Importada com Sucesso!' ); //8.0.0.0 rc_ShowToasterRT -> rc_ShowToaster
  finally
    tableimporta.Free;
  end;
end;
procedure TfrmCadPRODUCAOINTERNA.importacaoitens(mestreid: integer);
begin
  tbdetalhes.Close;
  tbdetalhes.open;
  tbdetalhes.DisableControls;
  SqlPesquisa('SELECT * FROM PRODUCAOINTERNA_ITENS WHERE MESTRE_ID = ' + IntToStr(mestreid) + ' order by sequencia');

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      SqlPesquisaPrimeira(' SELECT * FROM LOTEINTERNO WHERE LOTE = ' + QuotedStr(dm_rc.sqlBuscas.Findfield('LOTE').AsString) +
                          ' AND PRODUTO                          = ' + IntToStr (dm_rc.sqlBuscas.Findfield('PRODUTO').AsInteger));

      tbdetalhes.Append;
      tbdetalhes.FindField('LOTE').AsString            := dm_rc.sqlBuscas.Findfield('LOTE').AsString;
      tbdetalhes.FindField('PRODUTO').AsInteger        := dm_rc.sqlBuscas.Findfield('PRODUTO').AsInteger;
      tbdetalhes.FindField('DESCRICAO').AsString       := dm_rc.sqlBuscas.Findfield('DESCRICAO').AsString;
      tbdetalhes.FindField('SEQUENCIA').AsInteger      := dm_rc.sqlBuscas.Findfield('SEQUENCIA').AsInteger;
      tbdetalhes.FindField('QUANTIDADE').AsFloat       := dm_rc.sqlBuscas.Findfield('QUANTIDADE').AsFloat;
      tbdetalhes.FindField('CUSTO_UNITARIO').AsCurrency:= dm_rc.sqlBuscas.Findfield('CUSTO_UNITARIO').AsCurrency;
      tbdetalhes.FindField('TOTAL_CUSTO').AsCurrency   := dm_rc.sqlBuscas.Findfield('TOTAL_CUSTO').AsCurrency;
      tbdetalhes.FindField('TOTAL_PONTO').AsCurrency   := dm_rc.sqlBuscas.Findfield('TOTAL_PONTO').AsCurrency;
      tbdetalhes.FindField('CUSTO_PONTO').AsCurrency   := dm_rc.sqlBuscas.Findfield('CUSTO_PONTO').AsCurrency;
      tbdetalhes.FindField('PUREZA').AsFloat           := dm_rc.sqlBuscas.Findfield('PUREZA').AsFloat;
      tbdetalhes.FindField('PONTOS').AsFloat           := dm_rc.sqlBuscas.Findfield('PONTOS').AsFloat;
      tbdetalhes.FindField('TIPO').AsString            := dm_rc.sqlpesquisaprimaria.Findfield('TIPO').AsString;
      tbdetalhes.FindField('PERC').AsString            := FloatToStr(dm_rc.sqlBuscas.Findfield('PERC').AsFloat);
      tbdetalhes.Post;

      dm_rc.sqlBuscas.Next;
    end;

  tbdetalhes.First;
  tbdetalhes.EnableControls;
  tbdetalhes.First;
end;

procedure TfrmCadPRODUCAOINTERNA.I1Click(Sender: TObject);

begin
  inherited;
  mm.Seta_Busca('PRODUCAOINTERNA');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       importacabecalho(StrToInt(MM.varC_codigo_busca));
       importacaoitens (StrToInt(MM.varC_codigo_busca));
     end;
   end);
end;

procedure TfrmCadPRODUCAOINTERNA.tbdetalhesAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CalculaTotal;
end;

procedure TfrmCadPRODUCAOINTERNA.tbdetalhesAfterPost(DataSet: TDataSet);
begin
  inherited;
  CalculaTotal;
end;

procedure TfrmCadPRODUCAOINTERNA.tbdetalhesBeforePost(DataSet: TDataSet);
begin
  inherited;
  CalculaTotal;
end;

procedure TfrmCadPRODUCAOINTERNA.tbdetalhesbuscaloteGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Lote Interno" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmCadPRODUCAOINTERNA.tbdetalhescalculosGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Calculos" class="fa fa-lg fas fa-percentage fa-lg" style="color:black; cursor:pointer;"></i>';
end;

procedure TfrmCadPRODUCAOINTERNA.tbdetalhesexcluiGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';
end;

procedure TfrmCadPRODUCAOINTERNA.tbdetalhesTIPOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if tbdetalhesTIPO.AsString = 'Produto Acabado' then
        Text := '<span class="badge text-bg-success">'+tbdetalhesTIPO.AsString+'</span>'
      else
      if tbdetalhesTIPO.AsString = 'Sementes' then
        Text := '<span class="badge text-bg-warning">'+tbdetalhesTIPO.AsString+'</span>'
      else
      if tbdetalhesTIPO.AsString = 'Insumos' then
        Text := '<span class="badge text-bg-info">'+tbdetalhesTIPO.AsString+'</span>'
      else
      if tbdetalhesTIPO.AsString = 'Sacaria' then
        Text := '<span class="badge text-bg-dark">'+tbdetalhesTIPO.AsString+'</span>'
    end;
end;

procedure TfrmCadPRODUCAOINTERNA.UniButtonDbEditLOTEDESTINOButtonClick(
  Sender: TObject);
begin
  inherited;

  mm.varC_Form_Modal := untFrmPesquisaloteinterno.FrmPesquisaloteinterno; //8.0.0.0 padrao modal
  mm.varC_Form_Modal.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
        BuscaLoteinterno(StrToInt(mm.varC_codigo_busca_lote));
     end;
   end);
end;

procedure TfrmCadPRODUCAOINTERNA.UniDBFormattedNumberEditquantidadeExit(
  Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsInsert,dsEdit] then
    begin
      CalculaTotal;
    end;
end;

procedure TfrmCadPRODUCAOINTERNA.UniDBGridbatidaitensCellClick(
  Column: TUniDBGridColumn);
begin
  inherited;
  if sqlMaster.State in [dsInsert,dsEdit] then
    begin
      if Column.FieldName = 'exclui' then
        begin
          //8.0.0.0 rc_ShowYesNo sincrona (retorna boolean)
          if dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' ) then
            begin
              tbdetalhes.Delete;
            end
        end;

      if Column.FieldName = 'buscalote' then
        begin
          mm.varC_Form_Modal := untFrmPesquisaloteinterno.FrmPesquisaloteinterno; //8.0.0.0 padrao modal
          mm.varC_Form_Modal.ShowModal(
          procedure(Sender: TComponent; AResult: Integer)
           begin
             if AResult = mrOK then
             begin
               carregalote(StrToInt(MM.varC_codigo_busca_lote));
             end;
           end);
        end;
    end;

  if Column.FieldName = 'calculos' then
    begin
      mm.varV_totalkg    := tbdetalhesTOTAL_CUSTO.AsFloat;
      mm.varV_custokg    := tbdetalhesCUSTO_UNITARIO.AsFloat;
      mm.varV_totalponto := tbdetalhesTOTAL_PONTO.AsFloat;
      mm.varV_custoponto := tbdetalhesCUSTO_PONTO.AsFloat;

      mm.varC_Form_Modal := untFrmTELADETALHESPRODUCAODLOTE.FrmTELADETALHESPRODUCAODLOTE; //8.0.0.0 padrao modal
      mm.varC_Form_Modal.ShowModal();
    end;
end;

procedure TfrmCadPRODUCAOINTERNA.edLkpPRODUTOSExit(Sender: TObject);
begin
  inherited;
  //8.0.0.0 lookup declarativo (regra 38: DESTINO=PRODUTO) - grava PRODUTO + DESCRICAO
  if sqlMaster.State in [dsEdit, dsInsert] then
    begin
      if ( edLkpPRODUTOS.Text <> '' ) and ( edLkpPRODUTOS.Text <> '0' ) then
        begin
          sqlMaster.FieldByName('PRODUTO').AsInteger  := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
          sqlMaster.FieldByName('DESCRICAO').AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'DESCRICAO' );
        end;
    end;
end;

initialization
  RegisterClass(TfrmCadPRODUCAOINTERNA);

end.
// fim do arquivo
