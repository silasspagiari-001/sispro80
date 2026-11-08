unit untCadTABELAICMS;

interface

uses untDM_RC, Vcl.Menus, uniMainMenu, uniSweetAlert, uniDateTimePicker,
 
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uniGUIBaseClasses, uniGUIClasses, uniScreenMask, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, uniHTMLFrame, uniBasicGrid, uniDBGrid, uniMultiItem,
  uniComboBox, uniEdit, uniLabel, uniScrollBox, uniPanel, uniPageControl,
  uniButton, uniBitBtn, uniMemo, uniDBEdit, uniDBComboBox, uniCheckBox,
  uniDBCheckBox;

type
  TfrmcadTABELAICMS = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBComboBox4: TUniDBComboBox;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniLabel7: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadTABELAICMS: TfrmcadTABELAICMS;

implementation

{$R *.dfm}
initialization
  RegisterClass(TfrmcadTABELAICMS);
end.
