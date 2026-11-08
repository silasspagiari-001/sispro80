unit untFrmDEMOWITHFORM; // 6.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniEdit,
  uniDBEdit, uniPanel, uniGUIBaseClasses, uniScrollBox, uniSpinEdit,
  uniDBLookupComboBox;

type
  TfrmDEMOWithForm = class(TUniForm)
    UniScrollBox2: TUniScrollBox;
    rcBlock9: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel66: TUniLabel;
    edDtCad: TUniDBDateTimePicker;
    rcBlock30: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock50: TUniContainerPanel;
    UniLabel10: TUniLabel;
    edCnpjCpf: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel67: TUniLabel;
    edTipoPessoa: TUniDBComboBox;
    rcBlock70: TUniContainerPanel;
    UniLabel68: TUniLabel;
    UniDBEdit21: TUniDBEdit;
    rcBlock80: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel56: TUniLabel;
    UniDBEdit13: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    UniLabel57: TUniLabel;
    UniDBEdit19: TUniDBEdit;
    rcBlock110: TUniContainerPanel;
    UniLabel58: TUniLabel;
    UniDBEdit20: TUniDBEdit;
    rcBlock120: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniHiddenPanel1: TUniHiddenPanel;
    btnClickOnRecall: TUniButton;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnClickOnRecallClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmDEMOWithForm: TfrmDEMOWithForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, mkm_layout, Main, untFrmDEMOWITHFORMMODAL;

function frmDEMOWithForm: TfrmDEMOWithForm;
begin
  Result := TfrmDEMOWithForm(mm.GetFormInstance(TfrmDEMOWithForm));
end;

procedure TfrmDEMOWithForm.btnClickOnRecallClick(Sender: TObject);
begin
     showmessagen( 'Click On Recall' );
end;

procedure TfrmDEMOWithForm.UniFormBeforeShow(Sender: TObject);
begin
     rc_RenderLayout( Self, true, true, true );
end;

procedure TfrmDEMOWithForm.UniFormShow(Sender: TObject);
begin
   rc_FormTransition( Self );//7.4.0.0
end;

Initialization
   RegisterClass( TfrmDEMOWithForm );

end.
