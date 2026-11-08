unit untCadPLANOCONTAS; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0
     - UniButtonDbEditCENTROCUSTO (busca manual mm.Seta_Busca/UniFfrmPesquisa)
       -> lookup declarativo edLkpCENTROCUSTO via Hint no DFM +
          edLkpCENTROCUSTO_SetDS_CENTROCUSTO exibindo o codigo selecionado
     - FDQryFiltroKEYGetText (icone fa-cog) + dbgSearchCRUDCellClick/MouseDown (popup manual)
       -> coluna de acoes da base ([[grid-btn:edo]]) + popMenuOptions herdado
     - FDQryFiltro fields declarados -> removidos (sqlMaster/sqlSearchMaster: select * from)
     - Item de menu R1 (UniPopupMenudetalhes) -> item SubPlanos1 dentro do popMenuOptions herdado
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
  untFrmBaseCRUD, uniDateTimePicker;

type
  TfrmCadPLANOCONTAS = class(TfrmCRUDproprio)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock515: TUniContainerPanel;
    rcBlock2: TUniContainerPanel;
    rcBlock3: TUniContainerPanel;
    labRcCollapseGeneral: TUniLabel;
    labTitleCardGeral: TUniLabel;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    rcBlock30: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel5: TUniLabel;
    rcBlock50: TUniContainerPanel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel7: TUniLabel;
    rcBlock60: TUniContainerPanel;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel8: TUniLabel;
    rcBlock70: TUniContainerPanel;
    UniDBComboBox3: TUniDBComboBox;
    UniLabel9: TUniLabel;
    rcBlock80: TUniContainerPanel;
    UniLabel10: TUniLabel;
    edLkpCENTROCUSTO: TUniDBEdit;
    SubPlanos1: TUniMenuItem;
    procedure edLkpCENTROCUSTOExit(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure SubPlanos1Click(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, Main,
  untFrmMessage, uconsts, uconsts_cfg,
  mkm_func_web, mkm_layout, mkm_restfuncs, mkm_crudfuncs, //8.0.0.0
  untFrmSUBPLANOCONTAS;

procedure TfrmCadPLANOCONTAS.UniFrameCreate(Sender: TObject);
begin
  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:0(btns-cls:colorful)|'+
                        'grid-paginator:center|' +
                        ']]';

  inherited;

end;

procedure TfrmCadPLANOCONTAS.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

//8.0.0.0
// 3.0: UniButtonDbEditCENTROCUSTOButtonClick fazia mm.Seta_Busca('CENTROCUSTO') + UniFfrmPesquisa.ShowModal
//      e UniButtonDbEditCENTROCUSTOExit preenchia CENTRO_DESCRICAO via Acha_Item
// 8.0: a selecao e feita pelo lookup declarativo (Hint do DFM); no Exit gravamos
//      o codigo selecionado em CENTROCUSTO e completamos CENTRO_DESCRICAO
procedure TfrmCadPLANOCONTAS.edLkpCENTROCUSTOExit(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
  begin
    sqlMaster.FieldByName( 'CENTROCUSTO' ).AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
    if sqlMaster.FieldByName( 'CENTROCUSTO' ).AsString <> '' then
       sqlMaster.FieldByName( 'CENTRO_DESCRICAO' ).AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'DESCRICAO' );
  end;
end;

//8.0.0.0
// 3.0: R1 (UniPopupMenudetalhes) -> agora item do popMenuOptions herdado da base
procedure TfrmCadPLANOCONTAS.SubPlanos1Click(Sender: TObject);
begin
  inherited;
  mm.varcI_code_planosub := sqlSearchMaster.FieldByName( 'PLANO' ).AsString;
  FrmSUBPLANOCONTAS.ShowModal();
end;

initialization
  RegisterClass(TfrmCadPLANOCONTAS);

end.
