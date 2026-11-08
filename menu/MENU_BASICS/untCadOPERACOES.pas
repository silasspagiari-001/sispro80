unit untCadOPERACOES; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0
     - UniButtonDbEditcusto (busca 'OPERACOES' -> campo SUBSTITUICAO)
       -> lookup declarativo edLkpOPERACOES + edLkpOPERACOES_SetDS_SUBSTITUICAO
     - UniButtonDbEdit1 (busca 'ESCRITAS' -> campo ESCRITA)
       -> lookup declarativo edLkpESCRITAS + edLkpESCRITAS_SetDS_ESCRITA
     - FDQryCad.Edit/FindField -> sqlMaster.FieldByName
     - estrutura final (card/collapse/radios/checkboxes) fecha com a conversão do DFM
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
  untFrmBaseCRUD, uniRadioGroup, uniDBRadioGroup, uniDateTimePicker;

type
  TfrmCadOPERACOES = class(TfrmCRUDproprio)
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
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    rcBlock30: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniDBEdit2: TUniDBEdit;
    UniLabel6: TUniLabel;
    rcBlock50: TUniContainerPanel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel7: TUniLabel;
    rcBlock60: TUniContainerPanel;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel8: TUniLabel;
    rcBlock70: TUniContainerPanel;
    edLkpOPERACOES: TUniDBEdit;
    UniLabel9: TUniLabel;
    rcBlock80: TUniContainerPanel;
    edLkpESCRITAS: TUniDBEdit;
    UniLabel10: TUniLabel;
    rcBlock90: TUniContainerPanel;
    UniDBRadioGroup1: TUniDBRadioGroup;
    rcBlock100: TUniContainerPanel;
    UniDBRadioGroup2: TUniDBRadioGroup;
    rcBlock110: TUniContainerPanel;
    UniDBRadioGroup3: TUniDBRadioGroup;
    rcBlock120: TUniContainerPanel;
    UniLabel11: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    procedure edLkpOPERACOESExit(Sender: TObject);
    procedure edLkpESCRITASExit(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
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
  mkm_func_web, mkm_layout, mkm_restfuncs, mkm_crudfuncs; //8.0.0.0

procedure TfrmCadOPERACOES.UniFrameCreate(Sender: TObject);
begin
  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:0(btns-cls:colorful)|'+
                        'grid-paginator:center|' +
                        ']]';

  inherited;

end;

procedure TfrmCadOPERACOES.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

//8.0.0.0
// 3.0: UniButtonDbEditcustoButtonClick fazia mm.Seta_Busca('OPERACOES') + UniFfrmPesquisa.ShowModal
//      e gravava FDQryCad.FindField('SUBSTITUICAO') com o codigo escolhido
// 8.0: lookup declarativo; no Exit gravamos o codigo selecionado em SUBSTITUICAO
procedure TfrmCadOPERACOES.edLkpOPERACOESExit(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
     sqlMaster.FieldByName( 'SUBSTITUICAO' ).AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
end;

//8.0.0.0
// 3.0: UniButtonDbEdit1ButtonClick fazia mm.Seta_Busca('ESCRITAS') + UniFfrmPesquisa.ShowModal
//      e gravava FDQryCad.FindField('ESCRITA') com o codigo escolhido
// 8.0: lookup declarativo; no Exit gravamos o codigo selecionado em ESCRITA
procedure TfrmCadOPERACOES.edLkpESCRITASExit(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
     sqlMaster.FieldByName( 'ESCRITA' ).AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
end;

initialization
  RegisterClass(TfrmCadOPERACOES);

end.
