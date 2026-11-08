unit untFrmRECIBOTERMO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniDateTimePicker, uniButton, uniBitBtn,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, UniButtonEdit,
  Vcl.Menus, uniMainMenu;

type
  TfrmRECIBOTERMO = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    UniDBGridEntrega: TUniDBGrid;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    UniDateTimePickerentreganemissao: TUniDateTimePicker;
    UniLabel108: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniButtonEditpbancos: TUniButtonEdit;
    UniLabel1: TUniLabel;
    UniEditdescricaobanco: TUniEdit;
    UniLabel2: TUniLabel;
    UniEdit1: TUniEdit;
    UniLabel3: TUniLabel;
    UniPopupMenu: TUniPopupMenu;
    L1: TUniMenuItem;
    N6: TUniMenuItem;
    L2: TUniMenuItem;
    rcBlock40: TUniContainerPanel;
    UniContainerPanel7: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniContainerPanel6: TUniContainerPanel;
    UniBitBtn12: TUniBitBtn;
    UniFormattedNumberEditcCREDITO: TUniFormattedNumberEdit;
    procedure UniFormResize(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRECIBOTERMO: TfrmRECIBOTERMO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC;

function frmRECIBOTERMO: TfrmRECIBOTERMO;
begin
  Result := TfrmRECIBOTERMO(mm.GetFormInstance(TfrmRECIBOTERMO));
end;

procedure TfrmRECIBOTERMO.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmRECIBOTERMO.UniFormResize(Sender: TObject);
begin
  frmRECIBOTERMO.Height   := 372;
  frmRECIBOTERMO.Width    := 563;

  with frmRECIBOTERMO.Constraints do
    begin
      MaxWidth  := 563;
      MinWidth  := 563;
      MaxHeight := 372;
      MinHeight := 372;
    end;

  frmRECIBOTERMO.Position := poScreenCenter;
end;

end.
