unit untFrmBLOQUEIOSISTEMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniLabel, acPNG, uniImage,
  uniGUIBaseClasses, uniPanel;

type
  TfrmBLOQUEIOSISTEMA = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniImage1: TUniImage;
    UniLabel9: TUniLabel;
    UniLabel1: TUniLabel;
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cFormModal         : TUniForm;
  end;

function frmBLOQUEIOSISTEMA: TfrmBLOQUEIOSISTEMA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmBLOQUEIOSISTEMA: TfrmBLOQUEIOSISTEMA;
begin
  Result := TfrmBLOQUEIOSISTEMA(mm.GetFormInstance(TfrmBLOQUEIOSISTEMA));
end;

procedure TfrmBLOQUEIOSISTEMA.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmBLOQUEIOSISTEMA.UniFormShow(Sender: TObject);
begin
  cFormModal := mm.varC_Form_Modal;
end;

end.
