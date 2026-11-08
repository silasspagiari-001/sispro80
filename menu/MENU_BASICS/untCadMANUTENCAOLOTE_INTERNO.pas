unit untCadMANUTENCAOLOTE_INTERNO; //8.0.0.0
(*
[PT] Conversão RadCORE 3.0 -> 8.0
     - TfrmcadMANUTENCAOLOTE_INTERNO = class(TfrmCRUDPROPRIO) ->
       TfrmCadMANUTENCAOLOTE_INTERNO = class(TfrmCRUDproprio)
       (⚠️ se o cadastro de menus referenciar por NOME, atualizar
       frmcadMANUTENCAOLOTE_INTERNO -> frmCadMANUTENCAOLOTE_INTERNO)
     - CRUD simples de MANUTENCAOLOTE_INTERNO (inclui/ajusta pontos de lote fora da
       batida: TIPO ENTRADA/SAIDA, lote, qtd, pureza -> TOTALPONTOS calculado).
     - Scaffolding 8.0 herdado do padrão CUSTO_LOTEINTERNO/PRODUCAOINTERNA: card
       (rcBlock515 sombra + rcBlock2 card-info-box-white + rcBlock3 header com
       labRcCollapseGeneral collapse + labTitleCardGeral) e os 10 rcBlocks próprios
       (10..100, mesmos hints cols da 3.0: 3+3+3+3 / 4+2+6 / 4+4+4) em dsMaster.
     - FDQryCad -> sqlMaster (herdado da base) em todo o codigo; componentes DB
       dscrud -> dsMaster. Queries sobrescritas nos nos inherited do dfm
       (sqlSearchMaster 'select * from MANUTENCAOLOTE_INTERNO'; sqlMaster
       '... where codigo = :codigo').
     - Grid dbgSearchCRUD: 6 colunas da 3.0 (CODIGO/NUMERO/LOTE center/PRODUTO/
       DESCRICAO/QTDE) = 6 persistent fields FDQryFiltro* no sqlSearchMaster
       (regra 41c). 8.0.0.1/2: tipos confirmados em runtime (o erro de type
       mismatch revela o tipo real): NUMERO=INTEGER; QUANTIDADE=BCD -> TBCDField
       (Precision 18, padrao CUSTOPRODUCAO canonico PERCVENDAPRAZO; TBCDField vive
       em Data.DB). Regra: espelhar a classe que o erro reporta como "actual".
     - Hint de grid/model-crud: a BASE 8.0 aplica default quando o descendente nao
       seta (untFrmCRUDproprio l.1749) — UniFrameCreate desnecessario neste form.
     - LOTE: UniButtonDbEditLOTE MANTIDO (TUniButtonDbEdit + OnButtonClick) — busca
       custom via picker untFrmPesquisaloteinterno (mm.varC_Form_Modal + callback,
       receita 8.0) preenchendo LOTE/PRODUTO/DESCRICAO/PUREZA via dm_rc.sqlBuscas
       (BuscaLoteinterno). DEPENDENCIA OK: picker 8.0 entregue (§43f).
     - UniButtonDbEdit1 (PRODUTO, display sem evento) -> UniDBEditPRODUTO: TUniDBEdit
       ReadOnly (renomeado: "UniDBEdit1" ja existe no rcBlock20 p/ NUMERO).
     - UniDBFormattedNumberEdit1Exit: TOTALPONTOS := QUANTIDADE * PUREZA (preservado).
     - Uses declarativos fora: untCadLOTEINTERNO/untCadPRODUCAOINTERNA (nao
       referenciados no codigo). Var global frmcadMANUTENCAOLOTE_INTERNO removida
       (fábrica usa RegisterClass/GetFormInstance).
[EN] RadCORE 3.0 -> 8.0 conversion
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIApplication, uniGUIClasses, uniGUIFrame, untFrmCRUDproprio, Data.DB,
  uniBasicGrid, uniDBGrid, uniPanel, uniPageControl, uniGUIBaseClasses,
  uniScrollBox, uniDBEdit, uniMultiItem, uniComboBox, uniEdit, uniLabel,
  uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniDateTimePicker, uniDBDateTimePicker, uniDBComboBox, UniButtonDbEdit,
  untFrmBaseCRUD, Vcl.Menus, uniMainMenu, uniSweetAlert, uniHTMLFrame,
  uniCheckBox;

type
  TfrmCadMANUTENCAOLOTE_INTERNO = class(TfrmCRUDproprio)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock515: TUniContainerPanel;
    rcBlock2: TUniContainerPanel;
    rcBlock3: TUniContainerPanel;
    labRcCollapseGeneral: TUniLabel;
    labTitleCardGeral: TUniLabel;
    rcBlock10: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    rcBlock20: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock30: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    rcBlock40: TUniContainerPanel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel9: TUniLabel;
    rcBlock50: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniButtonDbEditLOTE: TUniButtonDbEdit;
    rcBlock60: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBEditPRODUTO: TUniDBEdit;
    rcBlock70: TUniContainerPanel;
    UniDBEdit2: TUniDBEdit;
    UniLabel7: TUniLabel;
    rcBlock80: TUniContainerPanel;
    UniLabel14: TUniLabel;
    UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    rcBlock100: TUniContainerPanel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel11: TUniLabel;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroNUMERO: TIntegerField;
    FDQryFiltroLOTE: TStringField;
    FDQryFiltroPRODUTO: TIntegerField;
    FDQryFiltroDESCRICAO: TStringField;
    FDQryFiltroQUANTIDADE: TBCDField;
    procedure UniButtonDbEditLOTEButtonClick(Sender: TObject);
    procedure UniDBFormattedNumberEdit1Exit(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure BuscaLoteinterno(codigo: integer);
  end;


implementation

{$R *.dfm}

uses
  untDM_RC, mkm_procedures, MainModule,
  untFrmPesquisaloteinterno; //8.0.0.0 untCadLOTEINTERNO/untCadPRODUCAOINTERNA fora (declarativos)

procedure TfrmCadMANUTENCAOLOTE_INTERNO.BuscaLoteinterno(codigo: integer);
begin
  if sqlMaster.State in [dsInsert,dsEdit] then
    begin
      SqlPesquisa('select * from LOTEINTERNO where codigo = ' + IntToStr(codigo));

      sqlMaster.Edit;
      sqlMaster.FindField('LOTE').AsString      :=  dm_rc.sqlBuscas.FindField('LOTE').AsString;
      sqlMaster.FindField('PRODUTO').AsInteger  :=  dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
      sqlMaster.FindField('DESCRICAO').AsString :=  dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
      sqlMaster.FindField('PUREZA').AsFloat     :=  dm_rc.sqlBuscas.FindField('PUREZA').AsFloat;
    end;
end;

procedure TfrmCadMANUTENCAOLOTE_INTERNO.UniButtonDbEditLOTEButtonClick(
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

procedure TfrmCadMANUTENCAOLOTE_INTERNO.UniDBFormattedNumberEdit1Exit(
  Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsInsert,dsEdit] then
    begin
      sqlMaster.FindField('TOTALPONTOS').AsFloat := sqlMaster.FindField('QUANTIDADE').AsFloat *
                                                    sqlMaster.FindField('PUREZA').AsFloat;
    end;
end;

procedure TfrmCadMANUTENCAOLOTE_INTERNO.UniFrameCreate(Sender: TObject);
begin

  sqlMaster.SQL.Text := ' SELECT [[fields]]   ' +
                        ' FROM [[table]] tab ' +
                        ' [[pk-show]] ' +
                        ' WHERE tab.[[pk]] = :table_pk ' +  //[PT] Apenas cadastro MESTRE é necessário o WHERE
                        ' FROM  [[table]] tab ' ;

  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:2|'+
                        'grid-paginator:center|' +
                        ']]';

  inherited;
end;

initialization
  RegisterClass(TfrmCadMANUTENCAOLOTE_INTERNO);
end.
