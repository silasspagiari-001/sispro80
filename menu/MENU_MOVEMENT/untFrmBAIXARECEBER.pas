unit untFrmBAIXARECEBER;

interface

uses untDM_RC, Vcl.Menus, uniMainMenu, uniSweetAlert, uniDateTimePicker,
 
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBASEBAIXATITULOS,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Menus, uniMainMenu, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame, uniBasicGrid,
  uniDBGrid, uniMultiItem, uniComboBox, uniDateTimePicker, uniGUIClasses,
  uniEdit, UniButtonEdit, uniScrollBox, uniPanel, uniPageControl, uniButton,
  uniBitBtn, uniLabel, uniGUIBaseClasses;

type
  TfrmBAIXARECEBER = class(TfrmBASEBAIXATITULOS)
    procedure I1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBAIXARECEBER: TfrmBAIXARECEBER;

implementation

{$R *.dfm}
procedure TfrmBAIXARECEBER.I1Click(Sender: TObject);
begin
  inherited;
  btnSearchCRUD.OnClick(Self);
end;

initialization
  RegisterClass(TfrmBAIXARECEBER);
end.
