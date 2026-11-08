unit untCadCENTROCUSTO; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0
     - TfrmCADCENTROCUSTO = class(TfrmCRUDPROPRIO) -> TfrmCadCENTROCUSTO = class(TfrmCRUDproprio)
     - var global removida; uses Vcl/Winapi/System removido
     - form sem lógica customizada no 3.0: recebe o scaffolding padrão 8.0
       (UniFrameCreate com fieldmasks + dbgSearchCRUDDrawColumnCell com rc_GridDrawCell)
     - estrutura final (card/collapse) fecha com a conversão do DFM
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
  TfrmCadCENTROCUSTO = class(TfrmCRUDproprio)
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
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel4: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel5: TUniLabel;
    rcBlock40: TUniContainerPanel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel6: TUniLabel;
    UniDBEdit2: TUniDBEdit;
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

procedure TfrmCadCENTROCUSTO.UniFrameCreate(Sender: TObject);
begin

  sqlMaster.SQL.Text := ' SELECT [[fields]]   ' +
                        ' FROM [[table]] tab ' +
                        ' [[pk-show]] ' +
                        ' WHERE tab.[[pk]] = :table_pk ' +  //[PT] Apenas cadastro MESTRE é necessário o WHERE
                        ' FROM  [[table]] tab ' ;

  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:0(btns-cls:colorful)|'+
                        'grid-paginator:center|' +
                        ']]';

  inherited;

end;

procedure TfrmCadCENTROCUSTO.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

initialization
  RegisterClass(TfrmCadCENTROCUSTO);

end.
