unit untfrmDeclaracaoretirada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn,
  uniLabel, uniEdit;

type
  Tfrmdeclaracaoretirada = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    btnLkpSearch: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    UniEditdeclarantenome: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniEditdocumentodeclarante: TUniEdit;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnLkpSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmdeclaracaoretirada: Tfrmdeclaracaoretirada;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_impressao, unReportImpressao;

function frmdeclaracaoretirada: Tfrmdeclaracaoretirada;
begin
  Result := Tfrmdeclaracaoretirada(mm.GetFormInstance(Tfrmdeclaracaoretirada));
end;

procedure Tfrmdeclaracaoretirada.btnLkpSearchClick(Sender: TObject);
begin
  mm.varC_caminhopdf :=  IMPRESSAO_DeclaracaoRET(mm.varI_Code_Company,
                                                 mm.varI_Code_Documento_Controle,
                                                 UniEditdeclarantenome.Text,
                                                 UniEditdocumentodeclarante.Text);

  unfImpressao.ShowModal();
end;

procedure Tfrmdeclaracaoretirada.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
