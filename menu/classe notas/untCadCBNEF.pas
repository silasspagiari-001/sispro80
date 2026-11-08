unit untCadCBNEF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCRUDPROPRIO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uniGUIBaseClasses, uniGUIClasses, uniScreenMask, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, uniHTMLFrame, uniBasicGrid, uniDBGrid, uniMultiItem,
  uniComboBox, uniEdit, uniScrollBox, uniPanel, uniPageControl, uniButton,
  uniBitBtn, uniLabel, uniMemo, uniCheckBox, uniDBCheckBox, uniDBEdit, uniDBMemo;

type
  TfrmcadCBNEF = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    UniDBEdit2: TUniDBEdit;
    UniLabel6: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniDBMemo1: TUniDBMemo;
    rcBlock70: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniDBEdit4: TUniDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadCBNEF: TfrmcadCBNEF;

implementation

{$R *.dfm}
initialization
  RegisterClass(TfrmcadCBNEF);
end.
