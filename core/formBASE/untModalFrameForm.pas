unit untModalFrameForm; //8.3.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid, uniSpeedButton,
  uniDBGrid, uniEdit, uniLabel, uniButton, uniBitBtn, uniTimer,
  uniMemo, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniSweetAlert, uniScrollBox, uniPageControl;

type
  TfrmModalFrameForm = class(TUniForm)
    timerClose: TUniTimer;
    rcSweetAlert: TUniSweetAlert;
    sboxModalFrameForm: TUniContainerPanel;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure CloseForm;
  end;


function frmModalFrameForm: TfrmModalFrameForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, str_func,
  uconsts, uconsts_cfg, Main, mkm_layout, mkm_translate, mkm_anim, untFrmLookUp_Lite_model_2;

function frmModalFrameForm: TfrmModalFrameForm;
begin
  Result := TfrmModalFrameForm(mm.GetFormInstance(TfrmModalFrameForm));
end;

procedure TfrmModalFrameForm.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 27 then
     begin
        mm.varB_Yes                 := False;
        mm.varB_No                  := True;
        Self.ModalResult            := mrNone;
        Close;
     end;
end;

procedure TfrmModalFrameForm.UniFormReady(Sender: TObject);
begin
    rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
end;
procedure TfrmModalFrameForm.CloseForm;
begin
    mm.varB_Yes                 := False;
    mm.varB_No                  := True;
    Self.ModalResult            := mrNone;
    Close;
end;

procedure TfrmModalFrameForm.UniFormAfterShow(Sender: TObject);
var
  iPos : integer;
  cFrm, cTableName, cTagString, cGetThisPk : string;
begin
   rc_RenderLayout( Self, true, true, true );

    cFrm := Self.Hint;
    if Pos( 'dynaddfrm', cFrm ) > 0 then
    begin
       cFrm := rc_GetHintAttr( 'rcdynaddfrm:', Self.Hint );
       cTableName := rc_GetHintAttr( 'rcdynaddfrmtbl:', Self.Hint );
       //8.3.0.0
       cTagString := rc_GetHintAttr( 'rcdynaddtagstring:', Self.Hint );
       cGetThisPk := rc_GetHintAttr( 'rcdynaddgetthispk:', Self.Hint );

       MainForm.rc_AddFormFrameInTab( nil , '', cTableName , cFrm , false, false , aftNone, 0, sboxModalFrameForm, True, False, cTagString, cGetThisPk );
    end;
end;

procedure TfrmModalFrameForm.UniFormBeforeShow(Sender: TObject);
begin
   rc_RenderLayout( Self, true, true, true );
end;
// 6.0.0.0
procedure TfrmModalFrameForm.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
     MainForm.rc_ForceLookUpsToClose;
end;

procedure TfrmModalFrameForm.UniFormCreate(Sender: TObject);
begin
     rc_RenderLayout( Self, false, false, false, false );
end;

procedure TfrmModalFrameForm.UniFormDestroy(Sender: TObject);
begin
    //[PT] para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no que estiver "abaixo" do MODAL
    //[EN] so when a FORM MODAL is active, do not run "dbGridUpdate" on anything "below" the MODAL
    mm.varC_Form_Modal := nil;
end;

procedure TfrmModalFrameForm.UniFormShow(Sender: TObject);
begin
  inherited;
    BringToFront;// 6.0.0.0
    rc_AddCssClass( self, 'drop_in' );
end;

initialization
    RegisterClass( TfrmModalFrameForm );

end.
