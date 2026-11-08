unit untFrmDEMO_FORM_LAYOUT_5; // v. 7.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniPanel, uniGUIBaseClasses, uniScrollBox, uniLabel, uniMemo, uniButton, uniBitBtn, uniEdit, uniPageControl, uniImage,
  uniDateTimePicker, uniDBDateTimePicker, uniDBEdit;

type
  TfrmDEMO_FORM_LAYOUT_5 = class(TUniFrame)
    sboxSale: TUniScrollBox;
    rcBlock132: TUniContainerPanel;
    rcBlock133: TUniContainerPanel;
    rcBlock134: TUniContainerPanel;
    UUUniDBEdit1: TUniDBEdit;
    UUUniLabel5: TUniLabel;
    rcBlock135: TUniContainerPanel;
    UUUniLabel6: TUniLabel;
    UUUniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock136: TUniContainerPanel;
    rcBlock137: TUniContainerPanel;
    UUUniLabel7: TUniLabel;
    UUUniDBEdit2: TUniDBEdit;
    rcBlock138: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    bbbtnNewReg: TUniBitBtn;
    rcBlock141: TUniContainerPanel;
    bbbtnEditReg: TUniBitBtn;
    rcBlock142: TUniContainerPanel;
    bbbtnDeleteReg: TUniBitBtn;
    rcBlock139: TUniContainerPanel;
    rcBlock144: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    rcBlock145: TUniContainerPanel;
    rcBlock147: TUniContainerPanel;
    UUUniBitBtn1: TUniBitBtn;
    rcBlock148: TUniContainerPanel;
    UUUniBitBtn2: TUniBitBtn;
    rcBlock149: TUniContainerPanel;
    UUUniBitBtn3: TUniBitBtn;
    rcBlock146: TUniContainerPanel;
    rcBlock151: TUniContainerPanel;
    rcBlock157: TUniContainerPanel;
    rcBlock152: TUniContainerPanel;
    rcBlock154: TUniContainerPanel;
    UUUniBitBtn1Clone170: TUniBitBtn;
    rcBlock155: TUniContainerPanel;
    UUUniBitBtn2Clone190: TUniBitBtn;
    rcBlock156: TUniContainerPanel;
    UUUniBitBtn3Clone210: TUniBitBtn;
    rcBlock153: TUniContainerPanel;
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
