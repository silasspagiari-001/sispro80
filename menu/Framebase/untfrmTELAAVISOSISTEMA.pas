unit untfrmTELAAVISOSISTEMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, Vcl.Imaging.jpeg,
  uniImage, uniButton, uniBitBtn, uniLabel, acPNG;

type
  TfrmTELAAVISOSISTEMA = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    UniImage1: TUniImage;
    UniBitBtn1: TUniBitBtn;
    UniLabel9: TUniLabel;
    UniLabel1: TUniLabel;
    UniImage2: TUniImage;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cFormModal         : TUniForm;
  end;

function frmTELAAVISOSISTEMA: TfrmTELAAVISOSISTEMA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmTELAAVISOSISTEMA: TfrmTELAAVISOSISTEMA;
begin
  Result := TfrmTELAAVISOSISTEMA(mm.GetFormInstance(TfrmTELAAVISOSISTEMA));
end;

procedure TfrmTELAAVISOSISTEMA.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmTELAAVISOSISTEMA.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmTELAAVISOSISTEMA.UniFormShow(Sender: TObject);
begin
  cFormModal := mm.varC_Form_Modal;
end;

end.
