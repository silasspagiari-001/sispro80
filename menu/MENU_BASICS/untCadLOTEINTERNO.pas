unit untCadLOTEINTERNO; //8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0
     - TfrmcadLOTEINTERNO = class(TfrmCRUDPROPRIO) -> TfrmCadLOTEINTERNO = class(TfrmCRUDproprio)
       (⚠️ se o cadastro de menus referenciar por NOME, atualizar frmcadLOTEINTERNO -> frmCadLOTEINTERNO)
     - Scaffolding 8.0 herdado do padrão CUSTO_LOTEINTERNO (card/collapse, paSearchFilters-
       Custom stubs, ScreenMask, model-crud:2); 17 rcBlocks próprios preservados
       (CODIGO/ATIVO/POSICAO/BARRACAO/PRODUTO/DESCRICAO/LOTE/PUREZA/GERMINACAO/
       TETRAZOLIO/SAFRAVALIDA/PESOEMBALAGEM/DISPONIVEL/TOTALPONTOS/TIPO/CUSTO_UNITARIO/
       CUSTO_PONTO/CODIGOP) em dsMaster.
     - LOOKUP declarativo: UniButtonDbEditcodPRODUTO (Seta_Busca+UniFfrmPesquisa) ->
       edLkpPRODUTOS (hint lkp). edLkpPRODUTOSExit grava PRODUTO + DESCRICAO via
       rc_GetLookUpField (padrão ESPECIE).
     - FDQryFiltro -> sqlSearchMaster (10 persistent fields FDQryFiltroXxx mantidos,
       filhos do inherited; badges de TIPO e ícone opcao via OnGetText preservados).
     - popMenuOptions HERDADO da base + itens G1(Ficha Técnica)/N1MENU/R1(Recalcula);
       N1 renomeado N1MENU (colisão c/ a base). Popup acionado pela coluna opcao
       (engrenagem) no CellClick c/ posicao_x/y do MouseDown (padrão 3.0).
     - UniComboBoxtipo/UniLabeltipoordemfiltro (inherited da base 3.0) REMOVIDOS:
       a base 8.0 não os possui; o form não os referenciava.
     - rc_ShowSweetAlert 4->3 params (R1Click); TStringGrid cast (código morto do
       CellClick) removido — o popup usa posicao_x/y.
     - ⚠️ DEPENDÊNCIAS PENDENTES p/ testar G1 (Ficha Técnica): untFrmFICHA e
       untFrmFICHAANALISTA ainda na 3.0 (frameBASE) — converter antes de testar o
       menu G1. mm.varM_CODIGOMESTRE: confirmar na MainModule 8.0.
[EN] RADCore 3.0 -> 8.0 conversion
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIApplication, uniGUIClasses, uniGUIFrame, untFrmCRUDproprio, Data.DB, uniBasicGrid, uniDBGrid,
  uniPanel, uniPageControl, uniGUIBaseClasses, uniScrollBox, uniDBEdit,
  uniMultiItem, uniComboBox, uniEdit, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniCheckBox, uniFieldSet,
  uniDBComboBox, uniDBLookupComboBox, uniSpeedButton, uniDBCheckBox,
  uniMainMenu, uniHTMLFrame, Data.FMTBcd, Data.SqlExpr, uniSpinEdit, uniMemo, Vcl.Menus, uniSweetAlert, uniDBNavigator,
  uniDateTimePicker, uniDBDateTimePicker,
  untFrmBaseCRUD;

type
  TfrmCadLOTEINTERNO = class(TfrmCRUDproprio)
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
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    rcBlock160: TUniContainerPanel;
    rcBlock170: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniDBComboBoxbarracao: TUniDBComboBox;
    UniLabel6: TUniLabel;
    edLkpPRODUTOS: TUniDBEdit;
    UniLabel10: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel11: TUniLabel;
    UniLabel7: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel25: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel8: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel9: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniLabel14: TUniLabel;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniLabel15: TUniLabel;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel16: TUniLabel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    UniLabel17: TUniLabel;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    G1: TUniMenuItem;
    N1MENU: TUniMenuItem;
    R1: TUniMenuItem;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroLOTE: TStringField;
    FDQryFiltroPOSICAO: TStringField;
    FDQryFiltroDESCRICAO: TStringField;
    FDQryFiltroDISPONIVEL: TFMTBCDField;
    FDQryFiltroTOTALPONTOS: TFMTBCDField;
    FDQryFiltroBARRACAO: TStringField;
    FDQryFiltroopcao: TStringField;
    FDQryFiltroTIPO: TStringField;
    UniDBEdit6: TUniDBEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnNewRegClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure edLkpPRODUTOSExit(Sender: TObject);
    procedure FDQryFiltroopcaoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDQryFiltroTIPOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure G1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
  private
    { Private declarations }
    posicao_x, posicao_y  : Integer;
  public
    { Public declarations }
    procedure carregabarracao();
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, Main,
  untFrmMessage, uconsts, uconsts_cfg,
  mkm_func_web, mkm_layout, mkm_restfuncs, mkm_crudfuncs,
  mkm_procedures, untFrmFICHA, untFrmFICHAANALISTA; //8.0.0.0

procedure TfrmCadLOTEINTERNO.UniFrameCreate(Sender: TObject);
begin


{
  sqlMaster.SQL.Text := ' SELECT [[fields]]   ' +
                        ' FROM [[table]] tab ' +
                        ' [[pk-show]] ' +
                        ' WHERE tab.[[pk]] = :table_pk ' +  //[PT] Apenas cadastro MESTRE é necessário o WHERE
                        ' FROM  [[table]] tab ' ;
 }

  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:2|'+
                        'grid-paginator:center|' +
                        'opcao[[width:1%|visible:false mobile]];' +
                        ']]';




  inherited;

end;

procedure TfrmCadLOTEINTERNO.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmCadLOTEINTERNO.btnNewRegClick(Sender: TObject);
begin
  inherited;
  carregabarracao();
end;

procedure TfrmCadLOTEINTERNO.carregabarracao;
begin
  UniDBComboBoxbarracao.Clear;
  SqlPesquisa('select descricao from barracao where ativo = ' + QuotedStr('T') + ' ORDER BY CODIGO');
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      UniDBComboBoxbarracao.Items.Add(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString);

      dm_rc.sqlBuscas.Next;
    end;
  dm_rc.sqlBuscas.Close;
end;

procedure TfrmCadLOTEINTERNO.dbgSearchCRUDDblClick(Sender: TObject);
begin
  carregabarracao();
  inherited;
end;

procedure TfrmCadLOTEINTERNO.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  if Column.FieldName = 'opcao' then
    begin
      popMenuOptions.Popup(posicao_x-20,posicao_y, dbgSearchCRUD);
    end;
end;

procedure TfrmCadLOTEINTERNO.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmCadLOTEINTERNO.edLkpPRODUTOSExit(Sender: TObject);
begin
  inherited;
  //8.0.0.0
  // 3.0: UniButtonDbEditcodPRODUTOButtonClick fazia mm.Seta_Busca('PRODUTOS') +
  //      UniFfrmPesquisa.ShowModal gravando PRODUTO; o Exit completava DESCRICAO
  //      via Acha_Item. 8.0: lookup declarativo; no Exit gravamos os dois campos.
  if sqlMaster.State in [dsEdit, dsInsert] then
    begin
      if (edLkpPRODUTOS.Text <> '') and (edLkpPRODUTOS.Text <> '0') then
        begin
          sqlMaster.FieldByName('PRODUTO').AsInteger  := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
          sqlMaster.FieldByName('DESCRICAO').AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'DESCRICAO' );
        end;
    end;
end;

procedure TfrmCadLOTEINTERNO.FDQryFiltroopcaoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmCadLOTEINTERNO.FDQryFiltroTIPOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if FDQryFiltroTIPO.AsString = 'Produto Acabado' then
        Text := '<span class="badge text-bg-success">'+FDQryFiltroTIPO.AsString+'</span>'
      else
      if FDQryFiltroTIPO.AsString = 'Sementes' then
        Text := '<span class="badge text-bg-warning">'+FDQryFiltroTIPO.AsString+'</span>'
      else
      if FDQryFiltroTIPO.AsString = 'Insumos' then
        Text := '<span class="badge text-bg-info">'+FDQryFiltroTIPO.AsString+'</span>'
      else
      if FDQryFiltroTIPO.AsString = 'Sacaria' then
        Text := '<span class="badge text-bg-dark">'+FDQryFiltroTIPO.AsString+'</span>'
    end;
end;

procedure TfrmCadLOTEINTERNO.G1Click(Sender: TObject);
begin
  inherited;
  if mm.varC_Doc_Customer =  '27646158000190' then
    begin
      mm.varM_CODIGOMESTRE := FDQryFiltroCODIGO.AsInteger;
      frmFICHAANALISTA.ShowModal();
    end
  else
    begin
      mm.varM_CODIGOMESTRE := FDQryFiltroCODIGO.AsInteger;
        frmFICHA.ShowModal();
    end;
end;

procedure TfrmCadLOTEINTERNO.R1Click(Sender: TObject);
begin
  inherited;
  try
    CalculaLoteInterno (mm.varI_Code_Company,
                        sqlSearchMaster.FindField('PRODUTO').AsInteger,
                        sqlSearchMaster.Findfield('LOTE').AsString);

    dm_rc.rc_ShowSweetAlert( 'Ok', 'Calculado com SUCESSO!' , 'success' );
    sqlSearchMaster.Refresh;
  except
    dm_rc.rc_ShowSweetAlert( 'ATEN'#199#195'O', 'N'#227'o Consegui calcular, chame o SUPORTE!' , 'error' );
  end;
end;

initialization
  RegisterClass(TfrmCadLOTEINTERNO);

end.
// fim do arquivo
