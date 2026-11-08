unit untFrmDEMO_FORM_LAYOUT_6; // v. 4.3.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniPanel, uniGUIBaseClasses, uniScrollBox, uniLabel, uniMemo, uniButton, uniBitBtn, uniEdit, uniPageControl, uniImage;

type
  TfrmDEMO_FORM_LAYOUT_5 = class(TUniFrame)
    sboxSale: TUniScrollBox;
    card: TUniContainerPanel;
    memberPhoto: TUniContainerPanel;
    rcBlock277: TUniContainerPanel;
    labStatus: TUniLabel;
    lbSairPDV: TUniLabel;
    rcBlock105: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    imgUser: TUniImage;
    labOperator: TUniLabel;
    labOperatorName: TUniLabel;
    labTerminal: TUniLabel;
    labTerminalDescription: TUniLabel;
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

uses untDM_RC, mkm_layout, MainModule, ServerModule;



procedure TfrmDEMO_FORM_LAYOUT_5.btnFinishClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmDEMO_FORM_LAYOUT_5.UniFrameCreate(Sender: TObject);
begin
    // para frames, não precisa efetuar o ResizeBlocks
    rc_RenderLayout( Self, false, false, true, false );

    //if FileExists( sm.FilesFolder + '\images\avatar5.png' )  then
    //   imgUser.Picture.LoadFromFile( sm.FilesFolder + '\images\avatar5.png' );
end;

procedure TfrmDEMO_FORM_LAYOUT_5.UniFrameReady(Sender: TObject);
begin
     // 
     //dm_rc.rc_DBGridUpdateAll( Self, false, true );
     dm_rc.rc_ResizeBlocks( Self, true, true );
end;

initialization
  RegisterClass(  TfrmDEMO_FORM_LAYOUT_5 );
end.
