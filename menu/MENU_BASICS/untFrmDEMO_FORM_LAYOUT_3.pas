unit untFrmDEMO_FORM_LAYOUT_3; // 6.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniPanel, uniGUIBaseClasses, uniScrollBox, uniLabel, uniMemo, uniButton, uniBitBtn, uniEdit, uniPageControl;

type
  TfrmDEMO_FORM_LAYOUT_3 = class(TUniFrame)
    sboxSale: TUniScrollBox;
    rcBlock105: TUniContainerPanel;
    labProduct: TUniLabel;
    rcBlock350: TUniContainerPanel;
    rcBlock410: TUniContainerPanel;
    labOperator: TUniLabel;
    labOperatorName: TUniLabel;
    labTerminalDescription: TUniLabel;
    labTerminal: TUniLabel;
    rcBlock320: TUniContainerPanel;
    rcBlock330: TUniContainerPanel;
    btnCancel: TUniBitBtn;
    rcBlock340: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    rcBlock400: TUniContainerPanel;
    labStatus: TUniLabel;
    btnFinish: TUniBitBtn;
    btnPreOrder: TUniBitBtn;
    rcBlock290: TUniContainerPanel;
    gridItems: TUniDBGrid;
    rcBlock220: TUniContainerPanel;
    rcBlock270: TUniContainerPanel;
    UniLabel1: TUniLabel;
    labToPay: TUniLabel;
    rcBlock245: TUniContainerPanel;
    UniLabel2: TUniLabel;
    labUnityPrice: TUniLabel;
    rcBlock250: TUniContainerPanel;
    UniLabel3: TUniLabel;
    labTotalPrice: TUniLabel;
    rcBlock230: TUniContainerPanel;
    UniLabel4: TUniLabel;
    edId: TUniEdit;
    rcBlock235: TUniContainerPanel;
    UniLabel5: TUniLabel;
    edQtd: TUniEdit;
    rcBlock260: TUniContainerPanel;
    UniLabel6: TUniLabel;
    labItems: TUniLabel;
    rcBlock275: TUniContainerPanel;
    rcBlock277: TUniContainerPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btnFinishClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untDM_RC, mkm_layout, MainModule;



procedure TfrmDEMO_FORM_LAYOUT_3.btnFinishClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;


procedure TfrmDEMO_FORM_LAYOUT_3.UniFrameCreate(Sender: TObject);
begin
    // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
    
    rc_RenderLayout( Self, false, false, true, false );
end;

procedure TfrmDEMO_FORM_LAYOUT_3.UniFrameReady(Sender: TObject);
begin
     
     //dm_rc.rc_DBGridUpdateAll( Self, false, true );
     
     dm_rc.rc_ResizeBlocks( Self, true, true );
    // rc_RenderLayout( Self, true, true, true, false );
end;

initialization
  RegisterClass(  TfrmDEMO_FORM_LAYOUT_3 );
end.
