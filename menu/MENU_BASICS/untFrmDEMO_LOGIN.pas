unit untFrmDEMO_LOGIN; // 7.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDBEdit, uniCheckBox, uniDBCheckBox, uniButton,
  uniBitBtn, uniSpeedButton, uniEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniPanel, uniScrollBox,
  uniPageControl, uniGUIBaseClasses, uniBasicGrid, uniDBGrid, uniListBox, uniDBLookupComboBox, uniImage, Vcl.Imaging.pngimage, uniImageList, uniHTMLFrame, uniMemo;

type
  TfrmDEMO_LOGIN = class(TUniFrame)
    UniPanel1: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    paForm: TUniContainerPanel;
    rcBlock1290: TUniContainerPanel;
    rcLabel1290: TUniLabel;
    edEmail: TUniEdit;
    rcBlock1300: TUniContainerPanel;
    rcLabel1300: TUniLabel;
    edPass: TUniEdit;
    rcBlock1310: TUniContainerPanel;
    rcLabel1310: TUniLabel;
    edID: TUniEdit;
    UniBitBtn1: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, Main, mkm_layout;

procedure TfrmDEMO_LOGIN.btnCancelClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;
procedure TfrmDEMO_LOGIN.UniFrameCreate(Sender: TObject);
begin
  Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
  
  // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
  rc_RenderLayout( Self, false, false );


  //rc_AddCssClass( unipanel1, 'rc-border-color-red'  );

  //rc_AddCssClass( rcBlock680, 'rc-border-color-red'  );

  //UniPanel1.JSInterface.JSCode('var me='#1'; if (me.body.hasCls("rc-border-color-red")) {me.removeBodyCls("rc-border-color-red")} else {me.addBodyCls("rc-border-color-red")};');

end;

procedure TfrmDEMO_LOGIN.UniFrameReady(Sender: TObject);
begin
     
     dm_rc.rc_ResizeBlocks( Self, true, true );
     //rc_RenderLayout( Self, true, true, true );
     dm_rc.rc_SetFocus( edEmail );
end;

initialization

  RegisterClass( TfrmDEMO_LOGIN );

end.
