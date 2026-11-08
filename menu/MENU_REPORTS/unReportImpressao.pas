unit unReportImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniURLFrame, uniGUIBaseClasses, uniButton;

type
  TunfImpressao = class(TUniForm)
    UniButton2: TUniButton;
    UniURLFrame: TUniPDFFrame;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function unfImpressao: TunfImpressao;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule, uconsts;

function unfImpressao: TunfImpressao;
begin
  Result := TunfImpressao(mm.GetFormInstance(TunfImpressao));
end;

procedure TunfImpressao.UniButton2Click(Sender: TObject);
begin
  DeleteFile (IncludeTrailingPathDelimiter(mm.M_PATHIMPRESSAO) + ExtractFileName(mm.varC_caminhopdf));
  ModalResult := mrOK;
end;

procedure TunfImpressao.UniFormBeforeShow(Sender: TObject);
begin
  UniURLFrame.PdfURL     := sm.FilesFolderURL + 'temp/' + ExtractFileName(mm.varC_caminhopdf);
end;

procedure TunfImpressao.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

end.
