unit untFrmInputBox; 

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniGUIBaseClasses, uniTimer, uniScrollBox, uniButton, uniBitBtn, uniPanel, uniImage, uniLabel, uniHTMLFrame, uniEdit, uniSweetAlert, uniDateTimePicker;

type
  TfrmInputBox = class(TfrmGenericModalForm)
    UniScrollBox1: TUniScrollBox;
    rcBlock6: TUniContainerPanel;
    lab1: TUniLabel;
    ed2: TUniEdit;
    ed1: TUniEdit;
    lab2: TUniLabel;
    btnNo: TUniBitBtn;
    btnOk: TUniBitBtn;
    rcBlock2: TUniContainerPanel;
    imgTipo: TUniImage;
    ed1_dt: TUniDateTimePicker;
    ed2_dt: TUniDateTimePicker;
    rcBlock4: TUniContainerPanel;
    labTitleForm: TUniLabel;
    procedure btnOkClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cMSG_APP_TERMINATED : string;
    procedure rc_Exit;
  end;

function frmInputBox: TfrmInputBox;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_layout, mkm_translate, uconsts;

function frmInputBox: TfrmInputBox;
begin
  Result := TfrmInputBox(mm.GetFormInstance(TfrmInputBox));
end;

procedure TfrmInputBox.rc_Exit;
begin
      //timerClose.Enabled := true;
      //rc_AddCssClass( self, 'drop_out' );
end;

procedure TfrmInputBox.UniFormCreate(Sender: TObject);
begin
  inherited;
  ed1.SetFocus;
end;

procedure TfrmInputBox.UniFormShow(Sender: TObject);
begin
  inherited;
  rc_AddCssClass( imgTipo , 'rc-rotator' );
end;

procedure TfrmInputBox.btnNoClick(Sender: TObject);
begin
  inherited;
  Self.ModalResult := mrCancel;
end;

procedure TfrmInputBox.btnOkClick(Sender: TObject);
begin
  inherited;
     if ed1_dt.Visible then
        mm.varC_InputBox_Result1 := ed1_dt.Text
     else
        mm.varC_InputBox_Result1 := ed1.Text;

     if ed2_dt.Visible then
        mm.varC_InputBox_Result2 := ed2_dt.Text
     else
        mm.varC_InputBox_Result2 := ed2.Text;

     Self.ModalResult := mrOk;
end;

end.
