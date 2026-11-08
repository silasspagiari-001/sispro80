unit untFrmRELATORIOBASE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel;

type
  TfrmRELATORIOBASE = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    btnLkpSearch: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRELATORIOBASE: TfrmRELATORIOBASE;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_impressao, mkm_relatorios, mkm_funcoes;

function frmRELATORIOBASE: TfrmRELATORIOBASE;
begin
  Result := TfrmRELATORIOBASE(mm.GetFormInstance(TfrmRELATORIOBASE));
end;

procedure TfrmRELATORIOBASE.UniBitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmRELATORIOBASE.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmRELATORIOBASE.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

end.
