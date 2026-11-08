unit untFrmRCBLOCKS; // 7.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDBEdit, uniCheckBox, uniDBCheckBox, uniButton,
  uniBitBtn, uniSpeedButton, uniEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniPanel, uniScrollBox,
  uniPageControl, uniGUIBaseClasses, uniBasicGrid, uniDBGrid, uniListBox, uniDBLookupComboBox, uniImage, Vcl.Imaging.pngimage, uniImageList, uniHTMLFrame, uniMemo;

type
  TfrmRCBlocks = class(TUniFrame)
    rcBlock1: TUniContainerPanel;
    pgPadrao: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel17: TUniLabel;
    edDtCad: TUniDBDateTimePicker;
    rcBlock30: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock50: TUniContainerPanel;
    UniLabel10: TUniLabel;
    edCnpjCpf: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel18: TUniLabel;
    edTipoPessoa: TUniDBComboBox;
    rcBlock70: TUniContainerPanel;
    UniLabel19: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    btnCancel: TUniBitBtn;
    rcBlock80: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel12: TUniLabel;
    edRazSoc: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    UniLabel4: TUniLabel;
    edCep: TUniDBEdit;
    rcBlock110: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    rcBlock120: TUniContainerPanel;
    UniLabel13: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    rcBlock130: TUniContainerPanel;
    UniLabel21: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    rcBlock140: TUniContainerPanel;
    UniLabel23: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    rcBlock150: TUniContainerPanel;
    UniLabel14: TUniLabel;
    edLkpUFS: TUniDBEdit;
    rcBlock160: TUniContainerPanel;
    UniLabel15: TUniLabel;
    edLkpCIDADES: TUniDBEdit;
    rcBlock180: TUniContainerPanel;
    UniLabel16: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    rcBlock170: TUniContainerPanel;
    UniLabel26: TUniLabel;
    edLkpCIDADES_SetDS: TUniDBEdit;
    rcBlock190: TUniContainerPanel;
    UniLabel27: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    rcBlock200: TUniContainerPanel;
    UniLabel28: TUniLabel;
    UniDBEdit11: TUniDBEdit;
    rcBlock210: TUniContainerPanel;
    UniLabel29: TUniLabel;
    UniDBEdit12: TUniDBEdit;
    rcBlock220: TUniContainerPanel;
    UniLabel31: TUniLabel;
    UniDBEdit13: TUniDBEdit;
    rcBlock270: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    rcBlock5: TUniContainerPanel;
    labAlert: TUniLabel;
    UniTabSheet2: TUniTabSheet;
    sboxGridBlockTab2: TUniScrollBox;
    rcBlock360: TUniContainerPanel;
    UniLabel33: TUniLabel;
    UniDBEdit15: TUniDBEdit;
    rcBlock370: TUniContainerPanel;
    UniLabel34: TUniLabel;
    UniDBEdit18: TUniDBEdit;
    rcBlock380: TUniContainerPanel;
    UniLabel35: TUniLabel;
    UniDBEdit19: TUniDBEdit;
    rcBlock390: TUniContainerPanel;
    UniLabel36: TUniLabel;
    UniDBEdit20: TUniDBEdit;
    rcBlock400: TUniContainerPanel;
    UniLabel40: TUniLabel;
    UniDBEdit21: TUniDBEdit;
    rcBlock410: TUniContainerPanel;
    UniLabel43: TUniLabel;
    edLkpUFS__ENTREGA: TUniDBEdit;
    rcBlock420: TUniContainerPanel;
    UniLabel45: TUniLabel;
    edLkpCIDADES__ENTREGA: TUniDBEdit;
    rcBlock430: TUniContainerPanel;
    UniLabel46: TUniLabel;
    UniDBEdit22: TUniDBEdit;
    rcBlock350: TUniContainerPanel;
    UniLabel30: TUniLabel;
    rcBlock460: TUniContainerPanel;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    sboxGridBlockTab3: TUniScrollBox;
    rcBlock465: TUniContainerPanel;
    UniDBEdit2: TUniDBEdit;
    UniLabel1: TUniLabel;
    rcBlock466: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    rcBlock467: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBDateTimePicker3: TUniDBDateTimePicker;
    rcBlock469: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    rcBlock468: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;
    rcBlock470: TUniContainerPanel;
    UniLabel22: TUniLabel;
    UniDBEdit14: TUniDBEdit;
    rcBlock490: TUniContainerPanel;
    UniLabel24: TUniLabel;
    UniDBEdit16: TUniDBEdit;
    rcBlock500: TUniContainerPanel;
    UniLabel25: TUniLabel;
    UniDBEdit17: TUniDBEdit;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel32: TUniLabel;
    rcBlock459: TUniContainerPanel;
    UniPageControl2: TUniPageControl;
    UniTabSheet4: TUniTabSheet;
    UniScrollBox1: TUniScrollBox;
    rcBlock510: TUniContainerPanel;
    UniDBEdit23: TUniDBEdit;
    UniLabel37: TUniLabel;
    rcBlock520: TUniContainerPanel;
    UniLabel38: TUniLabel;
    UniDBDateTimePicker4: TUniDBDateTimePicker;
    rcBlock530: TUniContainerPanel;
    UniLabel39: TUniLabel;
    UniDBDateTimePicker5: TUniDBDateTimePicker;
    rcBlock550: TUniContainerPanel;
    UniLabel41: TUniLabel;
    UniDBEdit24: TUniDBEdit;
    rcBlock540: TUniContainerPanel;
    UniLabel42: TUniLabel;
    UniDBComboBox2: TUniDBComboBox;
    rcBlock560: TUniContainerPanel;
    UniLabel44: TUniLabel;
    UniDBEdit25: TUniDBEdit;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel11: TUniLabel;
    UniTabSheet5: TUniTabSheet;
    UniScrollBox1Clone: TUniScrollBox;
    rcBlock970: TUniContainerPanel;
    rcBlock980: TUniContainerPanel;
    rcBlock990: TUniContainerPanel;
    rcBlock1000: TUniContainerPanel;
    rcBlock1010: TUniContainerPanel;
    rcBlock1020: TUniContainerPanel;
    rcBlock1030: TUniContainerPanel;
    rcBlock960: TUniContainerPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, Main, mkm_layout;

procedure TfrmRCBlocks.btnCancelClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;
procedure TfrmRCBlocks.UniBitBtn1Click(Sender: TObject);
begin
   labAlert.Caption := ' Alert Changed !!!';
   // render label again.
   dm_rc.rc_BootStrapRender( self, false, labAlert );
end;

procedure TfrmRCBlocks.UniFrameCreate(Sender: TObject);
begin
  pgPadrao.ActivePage    := tabGeral;
  Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
  
  // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
  rc_RenderLayout( Self, false, false );


  //rc_AddCssClass( unipanel1, 'rc-border-color-red'  );

  //rc_AddCssClass( rcBlock680, 'rc-border-color-red'  );

  //UniPanel1.JSInterface.JSCode('var me='#1'; if (me.body.hasCls("rc-border-color-red")) {me.removeBodyCls("rc-border-color-red")} else {me.addBodyCls("rc-border-color-red")};');

end;

procedure TfrmRCBlocks.UniFrameReady(Sender: TObject);
begin
     
     dm_rc.rc_ResizeBlocks( Self, true, true );
     //rc_RenderLayout( Self, true, true, true );
     dm_rc.rc_SetFocus( edDtCad );
end;

initialization

  RegisterClass( TfrmRCBlocks );

end.
