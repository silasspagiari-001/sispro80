unit untCadGERMINADOR;

interface

uses untDM_RC, Vcl.Menus, uniMainMenu, uniSweetAlert, uniDateTimePicker,
 
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, uniDBEdit, uniMemo;

type
  TfrmCADGERMINADOR = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel4: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel5: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADGERMINADOR: TfrmCADGERMINADOR;

implementation

{$R *.dfm}
initialization
  RegisterClass(TfrmCADGERMINADOR);
end.
