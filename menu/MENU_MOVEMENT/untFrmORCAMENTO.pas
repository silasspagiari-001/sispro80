unit untFrmORCAMENTO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmMOVIMENTOMESTRE,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniHTMLFrame, uniBasicGrid, uniDBGrid, uniMultiItem,
  uniComboBox, uniDateTimePicker, uniGUIClasses, uniEdit, UniButtonEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, Vcl.Menus, uniMainMenu, uniDBEdit, uniMemo, uniDBMemo,
  UniButtonDbEdit, uniDBDateTimePicker, uniScreenMask, uniDBComboBox,
  uniSweetAlert, uniCheckBox;

type
  TfrmORCAMENTO = class(TfrmMOVIMENTOMESTRE)
    N2: TUniMenuItem;
    i3: TUniMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmORCAMENTO: TfrmORCAMENTO;

implementation

{$R *.dfm}

uses MainModule, mkm_impressao, unReportImpressao;



initialization

  RegisterClass(TfrmORCAMENTO);
end.
