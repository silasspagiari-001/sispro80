unit untCadLABORATORIO; // RadCore 8.0

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, uniDBEdit,
  uniMemo, Vcl.Menus, uniMainMenu, uniSweetAlert, uniDateTimePicker;

type
  TfrmCADLABORATORIO = class(TfrmCRUDPROPRIO)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniDBEdit2: TUniDBEdit;
    UniLabel6: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel7: TUniLabel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    UniDBEdit4: TUniDBEdit;
    UniLabel8: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    UniLabel10: TUniLabel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    edCep: TUniDBEdit;
    UniLabel11: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    UniLabel12: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    UniLabel13: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    UniLabel14: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    UniLabel15: TUniLabel;
    rcBlock140: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    UniLabel17: TUniLabel;
    UniDBEdit12: TUniDBEdit;
    UniDBEdit13: TUniDBEdit;
    UniLabel18: TUniLabel;
    rcBlock135: TUniContainerPanel;
    UniDBEdit15: TUniDBEdit;
    UniLabel2: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure edCepExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADLABORATORIO: TfrmCADLABORATORIO;

implementation

{$R *.dfm}

uses untDM_RC;

procedure TfrmCADLABORATORIO.UniFrameCreate(Sender: TObject);
begin
  dbgSearchCRUD.Hint := '[[fieldmasks:grid-resize|' +
    'model-crud:0(btns-cls:colorful)|grid-paginator:center|]]';
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name, 'NOME', 'NOME');
  inherited;
end;

procedure TfrmCADLABORATORIO.edCepExit(Sender: TObject);
begin
  inherited;
  if not (sqlMaster.State in [dsEdit, dsInsert]) then
    Exit;
  dm_rc.rc_SearchPostalCodeCEP(sqlMaster.FieldByName('CEP').AsString,
    Self.Name, sqlMaster, UniDBEdit15, UniDBEdit10,
    UniDBEdit9, UniDBEdit7);
end;

initialization
  RegisterClass(TfrmCADLABORATORIO);
end.
