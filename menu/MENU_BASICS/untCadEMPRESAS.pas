unit untCadEMPRESAS; // RadCore 8.0

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniDBComboBox, uniCheckBox, uniDBCheckBox,
  uniDBEdit, uniMemo, Vcl.Menus, uniMainMenu, uniScreenMask, uniSweetAlert,
  uniDateTimePicker;

type
  TfrmcadEMPRESAS = class(TfrmCRUDPROPRIO)
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
    UniLabel7: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel4: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel9: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    UniDBEdit3: TUniDBEdit;
    UniLabel6: TUniLabel;
    UniLabel8: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    edCep: TUniDBEdit;
    edIBGERetorno: TUniDBEdit;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    UniLabel17: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    UniLabel18: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    UniLabel19: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    rcBlock160: TUniContainerPanel;
    rcBlock170: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniDBComboBoxestado: TUniDBComboBox;
    UniLabel21: TUniLabel;
    edIBGEEntrega: TUniDBEdit;
    UniDBEdit5: TUniDBEdit;
    UniLabel10: TUniLabel;
    UniLabel22: TUniLabel;
    edLkpCIDADES__IBGE: TUniDBEdit;
    rcBlock180: TUniContainerPanel;
    rcBlock190: TUniContainerPanel;
    rcBlock200: TUniContainerPanel;
    rcBlock210: TUniContainerPanel;
    UniLabel11: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    UniDBEdit11: TUniDBEdit;
    UniLabel12: TUniLabel;
    UniDBEdit12: TUniDBEdit;
    UniLabel13: TUniLabel;
    UniDBEdit13: TUniDBEdit;
    UniLabel14: TUniLabel;
    rcBlock220: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
    UniDBEdit14: TUniDBEdit;
    UniLabel23: TUniLabel;
    UniDBEdit15: TUniDBEdit;
    UniLabel24: TUniLabel;
    HistricodeMovimentaoEstoque1: TUniMenuItem;
    rcBlock240: TUniContainerPanel;
    rcBlock250: TUniContainerPanel;
    rcBlock260: TUniContainerPanel;
    rcBlock270: TUniContainerPanel;
    UniLabel25: TUniLabel;
    UniDBEdit16: TUniDBEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure edCepExit(Sender: TObject);
    procedure HistricodeMovimentaoEstoque1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadEMPRESAS: TfrmcadEMPRESAS;

implementation

{$R *.dfm}

uses MainModule, untDM_RC, untFrmTELAGENERICA;

procedure TfrmcadEMPRESAS.UniFrameCreate(Sender: TObject);
begin
  dbgSearchCRUD.Hint := '[[fieldmasks:grid-resize|' +
    'model-crud:0(btns-cls:colorful)|grid-paginator:center|]]';
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name, 'NOME', 'NOME');
  inherited;
end;

procedure TfrmcadEMPRESAS.edCepExit(Sender: TObject);
begin
  inherited;
  if not (sqlMaster.State in [dsEdit, dsInsert]) then
    Exit;
  dm_rc.rc_SearchPostalCodeCEP(sqlMaster.FieldByName('CEP').AsString,
    Self.Name, sqlMaster, UniDBComboBoxestado, UniDBEdit10,
    UniDBEdit9, UniDBEdit7, edIBGERetorno);
end;

procedure TfrmcadEMPRESAS.HistricodeMovimentaoEstoque1Click(Sender: TObject);
var
  Empresa: TDataSet;
begin
  Empresa := sqlSearchMaster;
  if (pgBaseCadControl.ActivePage = tabRegister) and sqlMaster.Active then
    Empresa := sqlMaster;
  if not Empresa.Active or Empresa.IsEmpty then
    Exit;
  mm.varI_Code_Empresa_Configuranota := Empresa.FieldByName('CODIGO').AsInteger;
  mm.VarC_Atelagenerica := 'CONFIGURANOTAELETRONICA';
  frmTELAGENERICA.ShowModal();
end;

initialization
  RegisterClass(TfrmcadEMPRESAS);
end.
