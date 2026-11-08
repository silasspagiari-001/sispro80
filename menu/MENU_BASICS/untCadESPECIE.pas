unit untCadESPECIE; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0
     - UniButtonDbEditcodigogrupo (busca 'GRUPOSESPECIE' -> campo GRUPO)
       -> lookup declarativo edLkpGRUPOSESPECIE + edLkpGRUPOSESPECIE_SetDS_GRUPO
     - FDQryCad.Edit/FindField -> sqlMaster.FieldByName
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
  TfrmCadESPECIE = class(TfrmCRUDproprio)
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
    UniDBEdit2: TUniDBEdit;
    UniLabel6: TUniLabel;
    rcBlock50: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBCheckBox2: TUniDBCheckBox;
    rcBlock60: TUniContainerPanel;
    UniLabel8: TUniLabel;
    edLkpGRUPOSESPECIE: TUniDBEdit;
    UniDBEdit3: TUniDBEdit;
    procedure edLkpGRUPOSESPECIEExit(Sender: TObject);
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

procedure TfrmCadESPECIE.UniFrameCreate(Sender: TObject);
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

procedure TfrmCadESPECIE.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

//8.0.0.0
// 3.0: UniButtonDbEditcodigogrupoButtonClick fazia mm.Seta_Busca('GRUPOSESPECIE') + UniFfrmPesquisa.ShowModal
//      e gravava FDQryCad.FindField('GRUPO') com o codigo escolhido
// 8.0: lookup declarativo; no Exit gravamos o codigo selecionado em GRUPO
procedure TfrmCadESPECIE.edLkpGRUPOSESPECIEExit(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
     sqlMaster.FieldByName( 'GRUPO' ).AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
end;

initialization
  RegisterClass(TfrmCadESPECIE);

end.
