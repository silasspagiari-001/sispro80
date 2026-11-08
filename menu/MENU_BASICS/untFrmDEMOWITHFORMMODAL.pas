unit untFrmDEMOWITHFORMMODAL;//7.4.0.0 width=600

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniEdit,
  uniDBEdit, uniPanel, uniGUIBaseClasses, uniScrollBox, uniSpinEdit, uniDBText;

type
  TfrmDEMOWithFormMODAL = class(TUniForm)
    UniScrollBox1: TUniScrollBox;
    paFooter: TUniContainerPanel;
    btnCancel: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniEdit;
    UniLabel2: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edDtCad: TUniDateTimePicker;
    rcBlock30: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBDateTimePicker1: TUniDateTimePicker;
    rcBlock40: TUniContainerPanel;
    UniLabel5: TUniLabel;
    edTipoPessoa: TUniComboBox;
    rcBlock70: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBEdit21: TUniEdit;
    rcBlock80: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit1: TUniEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniDBEdit13: TUniEdit;
    rcBlock100: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniDBEdit19: TUniEdit;
    rcBlock110: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniDBEdit20: TUniEdit;
    rcBlock50: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edCnpjCpf: TUniEdit;
    rcBlock120: TUniContainerPanel;
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmDEMOWithFormMODAL: TfrmDEMOWithFormMODAL;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, mkm_layout, Main, uconsts, uconsts_cfg, mkm_func_web;

function frmDEMOWithFormMODAL: TfrmDEMOWithFormMODAL;
begin
  Result := TfrmDEMOWithFormMODAL(mm.GetFormInstance(TfrmDEMOWithFormMODAL));
end;

procedure TfrmDEMOWithFormMODAL.btnCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmDEMOWithFormMODAL.UniBitBtn1Click(Sender: TObject);
begin

     MainForm.rc_AddFormFrameInTab( nil, 'FORM B', '', 'DEMOWithFormMODAL2' , false, true, aftNone, 0, nil, false, false );
end;

procedure TfrmDEMOWithFormMODAL.UniFormBeforeShow(Sender: TObject);
begin
    rc_RenderLayout( Self, true, true, false );
end;

procedure TfrmDEMOWithFormMODAL.UniFormCreate(Sender: TObject);
begin
    rc_RenderLayout( Self, false, false, false, false );
end;

procedure TfrmDEMOWithFormMODAL.UniFormDestroy(Sender: TObject);
begin
    // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
    // que estiver "abaixo" do MODAL
    mm.varC_Form_Modal := nil;
end;

procedure TfrmDEMOWithFormMODAL.UniFormReady(Sender: TObject);
begin
    //Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
    //rc_AddCssClass( self, 'drop_in' );//7.4.0.0
end;
//[PT]
// se precisar usar o FORM com BorderStyle = bsSizeable você precisa mudar o
// AlignmentControl para uniAlignmentServer e descomentar a linha abaixo
//[EN]
// if you need to use the FORM with BorderStyle = bsSizeable you need to change the
// AlignmentControl to uniAlignmentServer and uncomment the line below
procedure TfrmDEMOWithFormMODAL.UniFormResize(Sender: TObject);
begin
//   dm_rc.rc_ResizeBlocks( self );
end;

procedure TfrmDEMOWithFormMODAL.UniFormShow(Sender: TObject);
begin
      rc_FormTransition( Self );//7.4.0.0
end;

Initialization
   RegisterClass( TfrmDEMOWithFormMODAL );

end.
