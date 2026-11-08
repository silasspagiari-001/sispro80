unit untFrmTELADETALHESPRODLOTE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniButton, uniBitBtn, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniEdit, uniLabel;

type
  TFrmTELADETALHESPRODLOTE = class(TForm)
    rcBlock10: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    btnLkpClear: TUniBitBtn;
    rcBlock30: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniFormattedNumberEdittotalkg: TUniFormattedNumberEdit;
    UniFormattedNumberEditcustokg: TUniFormattedNumberEdit;
    UniFormattedNumberEdittotalponto: TUniFormattedNumberEdit;
    UniFormattedNumberEditcustoponto: TUniFormattedNumberEdit;
    procedure btnLkpClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTELADETALHESPRODLOTE: TFrmTELADETALHESPRODLOTE;

implementation

{$R *.dfm}

uses MainModule;

procedure TFrmTELADETALHESPRODLOTE.btnLkpClearClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFrmTELADETALHESPRODLOTE.FormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TFrmTELADETALHESPRODLOTE.FormShow(Sender: TObject);
begin
  UniFormattedNumberEdittotalkg.Value    := mm.varV_totalkg;
  UniFormattedNumberEditcustokg.Value    := mm.varV_custokg;
  UniFormattedNumberEdittotalponto.Value := mm.varV_totalponto;
  UniFormattedNumberEditcustoponto.Value := mm.varV_custoponto;
end;

end.
