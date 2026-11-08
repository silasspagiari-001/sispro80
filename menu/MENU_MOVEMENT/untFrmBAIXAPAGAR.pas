unit untFrmBAIXAPAGAR;

interface

uses untDM_RC, Vcl.Menus, uniMainMenu, uniSweetAlert, uniDateTimePicker,
 
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBASEBAIXATITULOS,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.Menus, uniMainMenu, uniHTMLFrame, uniBasicGrid,
  uniDBGrid, uniMultiItem, uniComboBox, uniDateTimePicker, uniGUIClasses,
  uniEdit, UniButtonEdit, uniScrollBox, uniPanel, uniPageControl, uniButton,
  uniBitBtn, uniLabel, uniGUIBaseClasses;

type
  TfrmBAIXAPAGAR = class(TfrmBASEBAIXATITULOS)
    procedure I1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBAIXAPAGAR: TfrmBAIXAPAGAR;

implementation

{$R *.dfm}
procedure TfrmBAIXAPAGAR.I1Click(Sender: TObject);
begin
  inherited;
  btnSearchCRUD.OnClick(Self);
end;

initialization
  RegisterClass(TfrmBAIXAPAGAR);
end.
