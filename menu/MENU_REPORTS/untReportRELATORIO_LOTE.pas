unit untReportRELATORIO_LOTE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmRELATORIOBASE, uniButton,
  uniBitBtn, uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  TfrmRELATORIOLOTE = class(TfrmRELATORIOBASE)
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRELATORIOLOTE: TfrmRELATORIOLOTE;

implementation

{$R *.dfm}

procedure TfrmRELATORIOLOTE.UniFormShow(Sender: TObject);
begin
  inherited;
  frmRELATORIOLOTE.Caption := 'Relatório de Lote/BAS';
end;

end.
