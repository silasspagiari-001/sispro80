unit untGenericModalForm; //7.4.0.0

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid, uniSpeedButton,
  uniDBGrid, uniEdit, uniLabel, uniButton, uniBitBtn, uniTimer,
  uniMemo, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniSweetAlert;

type

  TfrmGenericModalForm = class(TUniForm)
    rcSweetAlert: TUniSweetAlert;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;


function frmGenericModalForm: TfrmGenericModalForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, str_func,
  uconsts, uconsts_cfg, Main, mkm_layout, mkm_translate, mkm_anim;

function frmGenericModalForm: TfrmGenericModalForm;
begin
  Result := TfrmGenericModalForm(mm.GetFormInstance(TfrmGenericModalForm));
end;

procedure TfrmGenericModalForm.UniFormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmGenericModalForm.UniFormReady(Sender: TObject);
begin
    rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
end;
procedure TfrmGenericModalForm.UniFormAfterShow(Sender: TObject);
begin
   //8.5.0.0 adjust scrollbar if not in position 0
   dm_rc.rc_ResizeBlocks( self );
end;

procedure TfrmGenericModalForm.UniFormBeforeShow(Sender: TObject);
begin
   rc_RenderLayout( Self, true, true, true );
end;
//[PT] não apague o conteúdo abaixo
//[EN] do not delete the content below
procedure TfrmGenericModalForm.UniFormCreate(Sender: TObject);
begin
   //8.5.0.0
   rc_BackgroundThemedColor( self );

   //rc_RenderLayout( Self, false, false, false, false );
   // contar quantos campos tem pra ativar ou nao o FORCEFIT
   // FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
   //dm_rc.rc_DBGridUpdateAll( Self , false, false, false );
end;

procedure TfrmGenericModalForm.UniFormDestroy(Sender: TObject);
begin
    //[PT] para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no que estiver "abaixo" do MODAL
    //[EN] so that when a FORM MODAL is active, do not run "dbGridUpdate" on anything "below" the MODAL
    mm.varC_Form_Modal := nil;
end;
//7.4.0.0
procedure TfrmGenericModalForm.UniFormShow(Sender: TObject);
begin
  inherited;
  rc_FormTransition( Self );
end;
end.
