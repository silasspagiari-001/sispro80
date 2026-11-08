unit untDEMO_VOICE;//7.5.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniButton, uniLabel, uniPanel, uniGUIBaseClasses,
  uniScrollBox, uniCanvas, uniImage, Data.DB, Datasnap.DBClient, DateUtils,
  uniHTMLFrame, uniMemo, uniHTMLMemo, uniBitBtn, uniEdit, uniMultiItem,
  uniComboBox;

type
  TfrmDEMO_VOICE = class(TUniFrame)
    UniScrollBox1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock100: TUniContainerPanel;
    edVoice: TUniEdit;
    UniBitBtn1: TUniBitBtn;
    rcBlock30: TUniContainerPanel;
    rcLabel20: TUniLabel;
    cbxVoices: TUniComboBox;
    rcBlock20: TUniContainerPanel;
    rcLabel30: TUniLabel;
    rcEdit30: TUniEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel2: TUniLabel;
    rcBlock50: TUniContainerPanel;
    UniLabel3: TUniLabel;
    rcBlock60: TUniContainerPanel;
    UniLabel4: TUniLabel;
    cbxPitch: TUniComboBox;
    cbxRate: TUniComboBox;
    cbxVolume: TUniComboBox;
    UniLabel5: TUniLabel;
    procedure UniFrameReady(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untDM_RC, mkm_layout, MainModule, ServerModule, mkm_printfuncs;
// RC_CORE
// [PT] Descomente. O uso do "scale:" ou "hr:" em blocos responsivos "dentro de frames" precisa desse processo adicionar para renderizar corretamente
// [EN] Uncomment. The use of "scale:" or "hr:"  in responsive blocks "within frames" needs this process added to render correctly
// RC_CORE
// Doc Link [PT] https://radcore.pro.br/web/help/pt/RenderizandooLayout.html
//          [EN] https://radcore.pro.br/web/help/en/LayoutRender.html
procedure TfrmDEMO_VOICE.UniBitBtn1Click(Sender: TObject);
begin
    SLEEP(100);//1000
    //UniSession.AddJS('responsiveVoice.speak("' + trim( edVoice.text ) + '","Portuguese Female",{rate: 1.0},9000)');
    UniSession.AddJS( 'responsiveVoice.speak("' + trim( edVoice.text ) + '","' + cbxVoices.Text + '",{rate: ' + cbxRate.text + ',pitch: ' + cbxPitch.text + ',volume: ' + cbxVolume.text + '},9000)');
end;

procedure TfrmDEMO_VOICE.UniFrameCreate(Sender: TObject);
begin
   dm_rc.rc_FillComboBox( Self, cbxVoices, 'responsiveVoice.getVoices();' );

   rc_RenderLayout( Self, false, false, true, false );
end;

procedure TfrmDEMO_VOICE.UniFrameReady(Sender: TObject);
begin
   dm_rc.rc_ResizeBlocks( Self, true, true );
end;
// -------------------------------------------------------------------------
initialization
   RegisterClass( TfrmDEMO_VOICE );

end.


