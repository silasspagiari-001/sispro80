unit untFrmDEMOWITHFORMMODAL2;//8.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniEdit,
  uniDBEdit, uniPanel, uniGUIBaseClasses, uniScrollBox, uniSpinEdit;

type
  TfrmDEMOWithFormMODAL2 = class(TUniForm)
    rcBlock200: TUniContainerPanel;
    btnCancel: TUniBitBtn;
    rcBlock2: TUniContainerPanel;
    UniScrollBox1: TUniScrollBox;
    rcBlock80: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit1: TUniEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmDEMOWithFormMODAL2: TfrmDEMOWithFormMODAL2;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, mkm_layout, Main;

function frmDEMOWithFormMODAL2: TfrmDEMOWithFormMODAL2;
begin
  Result := TfrmDEMOWithFormMODAL2(mm.GetFormInstance(TfrmDEMOWithFormMODAL2));
end;

procedure TfrmDEMOWithFormMODAL2.btnCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmDEMOWithFormMODAL2.UniFormBeforeShow(Sender: TObject);
begin
     rc_RenderLayout( Self, true, true, false );
end;

procedure TfrmDEMOWithFormMODAL2.UniFormDestroy(Sender: TObject);
begin
    // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
    // que estiver "abaixo" do MODAL
    mm.varC_Form_Modal := nil;
end;

procedure TfrmDEMOWithFormMODAL2.UniFormReady(Sender: TObject);
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
procedure TfrmDEMOWithFormMODAL2.UniFormResize(Sender: TObject);
begin
//   dm_rc.rc_ResizeBlocks( self );
end;

procedure TfrmDEMOWithFormMODAL2.UniFormShow(Sender: TObject);
begin
   rc_FormTransition( Self );//7.4.0.0
end;

Initialization
   RegisterClass( TfrmDEMOWithFormMODAL2 );

end.
