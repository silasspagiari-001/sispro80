unit untCadAPLICACAO; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0
     - UniButtonDbEditcusto (busca 'CENTROCUSTO' -> campo CENTROCUSTO)
       -> lookup declarativo edLkpCENTROCUSTO + edLkpCENTROCUSTO_SetDS_CENTROCUSTO
     - UniButtonDbEditcustoExit preenchia NOMECENTRO via Acha_Item
       -> edLkpCENTROCUSTOExit grava CENTROCUSTO (CODIGO) e NOMECENTRO (DESCRICAO)
          via dm_rc.rc_GetLookUpField
     - FDQryCad.FindField/dscrud.State -> sqlMaster
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
  TfrmCadAPLICACAO = class(TfrmCRUDproprio)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab1: TUniScrollBox;
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
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel9: TUniLabel;
    edLkpCENTROCUSTO: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;
    UniDBEdit2: TUniDBEdit;
    UniDBEdit3: TUniDBEdit;
    procedure edLkpCENTROCUSTOExit(Sender: TObject);
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

procedure TfrmCadAPLICACAO.UniFrameCreate(Sender: TObject);
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

procedure TfrmCadAPLICACAO.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

//8.0.0.0
// 3.0: UniButtonDbEditcustoButtonClick fazia mm.Seta_Busca('CENTROCUSTO') e gravava CENTROCUSTO;
//      UniButtonDbEditcustoExit completava NOMECENTRO via Acha_Item('CENTROCUSTO', codigo)
// 8.0: lookup declarativo; no Exit gravamos o codigo em CENTROCUSTO e a descricao em NOMECENTRO
procedure TfrmCadAPLICACAO.edLkpCENTROCUSTOExit(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
  begin
    sqlMaster.FieldByName( 'CENTROCUSTO' ).AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
    if sqlMaster.FieldByName( 'CENTROCUSTO' ).AsString <> '' then
       sqlMaster.FieldByName( 'NOMECENTRO' ).AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'DESCRICAO' );
  end;
end;

initialization
  RegisterClass(TfrmCadAPLICACAO);

end.
