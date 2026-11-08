unit untCadPORTADORES;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, uniDBEdit, uniMemo, uniDBMemo,
  uniScreenMask, Vcl.Menus, uniMainMenu, uniSweetAlert,
  uniDateTimePicker;

type
  TfrmCADPORTADORES = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBEdit1: TUniDBEdit;
    UniLabel5: TUniLabel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    UniDBEdit2: TUniDBEdit;
    UniLabel6: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel7: TUniLabel;
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
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniLabel11: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel12: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    rcBlock160: TUniContainerPanel;
    rcBlock170: TUniContainerPanel;
    UniDBEdit7: TUniDBEdit;
    UniDBEdit8: TUniDBEdit;
    UniDBEdit9: TUniDBEdit;
    UniDBEdit10: TUniDBEdit;
    UniDBEdit11: TUniDBEdit;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    rcBlock180: TUniContainerPanel;
    rcBlock190: TUniContainerPanel;
    rcBlock200: TUniContainerPanel;
    UniDBEdit12: TUniDBEdit;
    UniDBEdit13: TUniDBEdit;
    UniDBEdit14: TUniDBEdit;
    UniLabel20: TUniLabel;
    UniLabel21: TUniLabel;
    UniLabel22: TUniLabel;
    rcBlock210: TUniContainerPanel;
    UniDBEdit15: TUniDBEdit;
    UniLabel23: TUniLabel;
    rcBlock220: TUniContainerPanel;
    UniDBMemo1: TUniDBMemo;
    UniLabel24: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADPORTADORES: TfrmCADPORTADORES;

implementation

{$R *.dfm}
procedure TfrmCADPORTADORES.UniFrameCreate(Sender: TObject);
begin
  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:0(btns-cls:colorful)|'+
                        'grid-paginator:center|' +
                        ']]';

  inherited;

end;

initialization
  RegisterClass(TfrmCADPORTADORES);
end.
