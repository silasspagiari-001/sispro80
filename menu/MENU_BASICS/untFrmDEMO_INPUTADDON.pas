unit untFrmDEMO_INPUTADDON; //8.3.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDBEdit, uniCheckBox, uniDBCheckBox, uniButton,
  uniBitBtn, uniSpeedButton, uniEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniPanel, uniScrollBox,
  uniPageControl, uniGUIBaseClasses, uniBasicGrid, uniDBGrid, uniListBox, uniDBLookupComboBox, uniImage, Vcl.Imaging.pngimage, uniImageList, uniHTMLFrame, uniMemo;

type
  TfrmDEMO_INPUTADDON = class(TUniFrame)
    UniScrollBox1: TUniScrollBox;
    rcBlock60: TUniContainerPanel;
    rcLabel60CloneClone: TUniLabel;
    rcEdit60CloneClone: TUniEdit;
    rcBlock50: TUniContainerPanel;
    rcLabel60Clone: TUniLabel;
    rcEdit60Clone: TUniEdit;
    rcBlock40: TUniContainerPanel;
    rcLabel50Clone: TUniLabel;
    edHoursClone: TUniEdit;
    rcBlock30: TUniContainerPanel;
    rcLabel40Clone: TUniLabel;
    rcEdit40Clone: TUniEdit;
    rcBlock20: TUniContainerPanel;
    rcLabel70Clone: TUniLabel;
    rcEdit70Clone: TUniEdit;
    rcBlock10: TUniContainerPanel;
    rcLabel30Clone: TUniLabel;
    Price: TUniFormattedNumberEdit;
    rcBlock70: TUniContainerPanel;
    rcLabel30CloneClone: TUniLabel;
    UniFormattedNumberEdit1: TUniFormattedNumberEdit;
    rcBlock80: TUniContainerPanel;
    rcLabel40CloneClone: TUniLabel;
    rcEdit40CloneClone: TUniEdit;
    rcBlock90: TUniContainerPanel;
    rcLabel50CloneClone: TUniLabel;
    edHoursCloneClone: TUniEdit;
    rcBlock100: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniEdit1: TUniEdit;
    rcBlock110: TUniContainerPanel;
    rcLabel70CloneClone: TUniLabel;
    rcEdit70CloneClone: TUniEdit;
    rcBlock120: TUniContainerPanel;
    rcLabel60CloneCloneClone: TUniLabel;
    rcEdit60CloneCloneClone: TUniEdit;
    rcBlock130: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniFormattedNumberEdit1Clone: TUniFormattedNumberEdit;
    rcBlock140: TUniContainerPanel;
    rcLabel40CloneCloneClone: TUniLabel;
    rcEdit40CloneCloneClone: TUniEdit;
    rcBlock150: TUniContainerPanel;
    rcLabel50CloneCloneClone: TUniLabel;
    edHoursCloneCloneClone: TUniEdit;
    rcBlock160: TUniContainerPanel;
    UniLabel8Clone: TUniLabel;
    UniEdit1Clone: TUniEdit;
    rcBlock170: TUniContainerPanel;
    rcLabel70CloneCloneClone: TUniLabel;
    rcEdit70CloneCloneClone: TUniEdit;
    rcBlock180: TUniContainerPanel;
    rcLabel60CloneCloneCloneClone: TUniLabel;
    rcEdit60CloneCloneCloneClone: TUniEdit;
    rcBlock5: TUniContainerPanel;
    UniLabel3Clone: TUniLabel;
    rcBlock65: TUniContainerPanel;
    UniLabel3CloneClone: TUniLabel;
    rcBlock125: TUniContainerPanel;
    UniLabel3CloneCloneClone: TUniLabel;
    rcBlock470: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edColorInputClone: TUniEdit;
    rcBlock480: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniEdit2: TUniEdit;
    rcBlock500: TUniContainerPanel;
    rcBlock320: TUniContainerPanel;
    UniLabel7Clone: TUniLabel;
    UniFormattedNumberEdit1CloneClone: TUniFormattedNumberEdit;
    rcBlock330: TUniContainerPanel;
    rcLabel40CloneCloneCloneClone: TUniLabel;
    rcEdit40CloneCloneCloneClone: TUniEdit;
    rcBlock340: TUniContainerPanel;
    rcLabel50CloneCloneCloneClone: TUniLabel;
    edHoursCloneCloneCloneClone: TUniEdit;
    rcBlock350: TUniContainerPanel;
    UniLabel8CloneClone: TUniLabel;
    UniEdit1CloneClone: TUniEdit;
    rcBlock360: TUniContainerPanel;
    rcLabel70CloneCloneCloneClone: TUniLabel;
    rcEdit70CloneCloneCloneClone: TUniEdit;
    rcBlock370: TUniContainerPanel;
    rcLabel60CloneCloneCloneCloneClone: TUniLabel;
    rcEdit60CloneCloneCloneCloneClone: TUniEdit;
    rcBlock300: TUniContainerPanel;
    UniLabel3: TUniLabel;
    rcBlock450: TUniContainerPanel;
    UniLabel3CloneCloneCloneCloneClone: TUniLabel;
    rcBlock490: TUniContainerPanel;
    rcLabel30CloneCloneCloneCloneCloneClone: TUniLabel;
    UniEdit1CloneCloneCloneCloneCloneClone: TUniEdit;
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

procedure TfrmDEMO_INPUTADDON.btnCancelClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;
procedure TfrmDEMO_INPUTADDON.UniFrameCreate(Sender: TObject);
begin
  Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

  // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
  rc_RenderLayout( Self, false, false );


  //rc_AddCssClass( unipanel1, 'rc-border-color-red'  );

  //rc_AddCssClass( rcBlock680, 'rc-border-color-red'  );

  //UniPanel1.JSInterface.JSCode('var me='#1'; if (me.body.hasCls("rc-border-color-red")) {me.removeBodyCls("rc-border-color-red")} else {me.addBodyCls("rc-border-color-red")};');

end;

procedure TfrmDEMO_INPUTADDON.UniFrameReady(Sender: TObject);
begin
     dm_rc.rc_ApplyEditMasks( Self );
     dm_rc.rc_ResizeBlocks( Self, true, true );
     //rc_RenderLayout( Self, true, true, true );

end;

initialization

  RegisterClass( TfrmDEMO_INPUTADDON );

end.
