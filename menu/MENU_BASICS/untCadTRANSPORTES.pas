unit untCadTRANSPORTES; // RadCore 8.0

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, uniDBEdit, uniDBComboBox,
  uniMemo, uniDBMemo, uniScreenMask, Vcl.Menus, uniMainMenu, uniSweetAlert,
  uniDateTimePicker;

type
  TfrmcadTRANSPORTES = class(TfrmCRUDPROPRIO)
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
    UniLabel8: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    UniLabel13: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    UniLabel14: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    edCep: TUniDBEdit;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    UniLabel17: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    UniLabel18: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniDBComboBoxestado: TUniDBComboBox;
    UniLabel23: TUniLabel;
    UniDBEdit11: TUniDBEdit;
    UniLabel6: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    rcBlock160: TUniContainerPanel;
    UniDBMemo1: TUniDBMemo;
    UniLabel10: TUniLabel;
    UniTabSheetveiculos: TUniTabSheet;
    UniScrollBox3: TUniScrollBox;
    rcBlock170: TUniContainerPanel;
    rcBlock180: TUniContainerPanel;
    rcBlock190: TUniContainerPanel;
    UniLabel11: TUniLabel;
    UniDBEdit12: TUniDBEdit;
    UniDBEdit13: TUniDBEdit;
    UniDBEdit14: TUniDBEdit;
    UniLabel12: TUniLabel;
    UniLabel19: TUniLabel;
    rcBlock200: TUniContainerPanel;
    rcBlock210: TUniContainerPanel;
    rcBlock220: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
    rcBlock240: TUniContainerPanel;
    UniDBEdit15: TUniDBEdit;
    UniLabel21: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel22: TUniLabel;
    UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit;
    UniLabel24: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel25: TUniLabel;
    UniLabel26: TUniLabel;
    rcBlock250: TUniContainerPanel;
    rcBlock260: TUniContainerPanel;
    rcBlock270: TUniContainerPanel;
    rcBlock280: TUniContainerPanel;
    rcBlock290: TUniContainerPanel;
    UniLabel27: TUniLabel;
    UniDBEdit16: TUniDBEdit;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel28: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel29: TUniLabel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniLabel30: TUniLabel;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniLabel31: TUniLabel;
    rcBlock300: TUniContainerPanel;
    rcBlock310: TUniContainerPanel;
    rcBlock320: TUniContainerPanel;
    rcBlock330: TUniContainerPanel;
    rcBlock340: TUniContainerPanel;
    UniLabel32: TUniLabel;
    UniDBEdit17: TUniDBEdit;
    UniDBComboBox3: TUniDBComboBox;
    UniLabel33: TUniLabel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    UniLabel34: TUniLabel;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    UniLabel35: TUniLabel;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniLabel36: TUniLabel;
    rcBlock350: TUniContainerPanel;
    rcBlock360: TUniContainerPanel;
    UniDBComboBox4: TUniDBComboBox;
    UniLabel37: TUniLabel;
    UniDBComboBox5: TUniDBComboBox;
    UniLabel38: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure edCepExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadTRANSPORTES: TfrmcadTRANSPORTES;

implementation

{$R *.dfm}

uses untDM_RC;

procedure TfrmcadTRANSPORTES.UniFrameCreate(Sender: TObject);
begin
  dbgSearchCRUD.Hint := '[[fieldmasks:grid-resize|' +
    'model-crud:0(btns-cls:colorful)|grid-paginator:center|]]';
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name, 'NOME', 'NOME');
  inherited;
end;

procedure TfrmcadTRANSPORTES.edCepExit(Sender: TObject);
begin
  inherited;
  if not (sqlMaster.State in [dsEdit, dsInsert]) then
    Exit;

  // Mesmo mecanismo de PESSOAS, com os campos de destino de TRANSPORTES.
  dm_rc.rc_SearchPostalCodeCEP(sqlMaster.FieldByName('CEP').AsString,
    Self.Name, sqlMaster, UniDBComboBoxestado, UniDBEdit4,
    UniDBEdit9, UniDBEdit7);
end;

initialization
  RegisterClass(TfrmcadTRANSPORTES);
end.
