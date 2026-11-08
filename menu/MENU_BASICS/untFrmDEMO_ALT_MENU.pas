unit untFrmDEMO_ALT_MENU;// v. 7.4.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload;

 type
  TfrmDEMO_ALT_MENU = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock10: TUniContainerPanel;
    sboxMenuOptions: TUniScrollBox;
    rcBlock11: TUniContainerPanel;
    btnHome: TUniBitBtn;
    rcBlock12: TUniContainerPanel;
    btnCalendar: TUniBitBtn;
    rcBlock13: TUniContainerPanel;
    brnMessages: TUniBitBtn;
    rcBlock14: TUniContainerPanel;
    UniBitBtn4: TUniBitBtn;
    rcBlock410: TUniContainerPanel;
    sboxOptions: TUniScrollBox;
    rcBlock490: TUniContainerPanel;
    UniLabel2: TUniLabel;
    lab_IBAberturaLogonCadastro: TUniLabel;
    UniLabel4: TUniLabel;
    pa_8: TUniContainerPanel;
    rcBlock460: TUniContainerPanel;
    UniLabel1: TUniLabel;
    lab_IBPcmsoFinanceiroFatura: TUniLabel;
    UniLabel6: TUniLabel;
    pa_5: TUniContainerPanel;
    rcBlock430: TUniContainerPanel;
    labIcoNewCustomers170: TUniLabel;
    lab_IBArquivoFuncCadastro: TUniLabel;
    UniLabel5: TUniLabel;
    pa_2: TUniContainerPanel;
    rcBlock420: TUniContainerPanel;
    labIcoSales160: TUniLabel;
    lab_IBAberturaEmpresaTrabalha: TUniLabel;
    pa_1: TUniContainerPanel;
    rcBlock440: TUniContainerPanel;
    labIcoInService180: TUniLabel;
    lab_IBPcmsoConvocacaoCadastro: TUniLabel;
    UniLabel7: TUniLabel;
    pa_3: TUniContainerPanel;
    rcBlock450: TUniContainerPanel;
    UniLabel3: TUniLabel;
    lab_IBPcmsoConfiguracaoFuncaoRisco: TUniLabel;
    UniLabel8: TUniLabel;
    pa_4: TUniContainerPanel;
    rcBlock470: TUniContainerPanel;
    labIcoEsocial: TUniLabel;
    lab_IBPcmsoArquivoESocial2220LotePrevia: TUniLabel;
    pa_6: TUniContainerPanel;
    rcBlock480: TUniContainerPanel;
    UniLabel9: TUniLabel;
    lab_IBPcmsoEpidemiologicoPorExame: TUniLabel;
    UniLabel10: TUniLabel;
    pa_7: TUniContainerPanel;
    rcBlock500: TUniContainerPanel;
    UniLabel11: TUniLabel;
    labHelp: TUniLabel;
    pa_9: TUniContainerPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnCalendarClick(Sender: TObject);
    procedure pa_1Click(Sender: TObject);
    procedure brnMessagesClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    iSlides, iSlideCount : integer;
    pObj : TUniControl;
    sboxMenu : TUniScrollBox;
    procedure CreateScrollBox;

  end;

implementation

{$R *.dfm}

uses Main, ServerModule, untFrmWEBCAM, MainModule, mkm_gridblock,
  mkm_layout, uconsts, uconsts_cfg, mkm_anim, untDM_RC, mkm_translate, mkm_validate, mkm_qrcode, mkm_func_web, untFrmQRCODE, str_func, mkm_carrousels, mkm_createcomponents;// v. 3.4.0.0    , untFrmBARCODE;

procedure TfrmDEMO_ALT_MENU.CreateScrollBox;
begin
   sboxMenu := rc_CreateScrollBox( Self, rcBlock410, 'sboxMenu', rcBlock410.Width , rcBlock410.Height , 0 , rcBlock410.Height , '', true, true );//7.0.0.0
   sboxMenu.ScrollDirection := sdBoth;
   sboxMenu.Align := alClient;
   //rc_RenderLayout( self,true, true, false );
end;

procedure TfrmDEMO_ALT_MENU.pa_1Click(Sender: TObject);
begin
   btnCalendarClick( self );
end;

procedure TfrmDEMO_ALT_MENU.btnHomeClick(Sender: TObject);
begin
  if sboxMenu <> nil then
     FreeAndNil( sboxMenu );
end;

procedure TfrmDEMO_ALT_MENU.btnCalendarClick(Sender: TObject);
begin
  CreateScrollBox;
  MainForm.rc_AddFormFrameInTab( nil, 'DEMO CALENDAR', '', 'DEMO_CALENDAR' , false, false, aftNone, 0, sboxMenu );
end;

procedure TfrmDEMO_ALT_MENU.brnMessagesClick(Sender: TObject);
begin
  CreateScrollBox;
  MainForm.rc_AddFormFrameInTab( nil, 'DEMO MESSAGES', '', 'DEMO_MESSAGES' , false, false, aftNone, 0, sboxMenu );
end;

procedure TfrmDEMO_ALT_MENU.UniFrameCreate(Sender: TObject);
begin
     Self.Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

     iSlides     := 1;
     iSlideCount := 3;

     //dm_rc.rc_ShowSweetAlert( 'RadCORE' , 'Do More. Better and Fast!' , 'info' );

     // para frames, não precisa efetuar o ResizeBlocks
     rc_RenderLayout( Self, false, false );
end;

procedure TfrmDEMO_ALT_MENU.UniFrameReady(Sender: TObject);
begin
     // adjust edit masks
     dm_rc.rc_ApplyEditMasks( Self );

     mm.varDW_LastTick := GetTickCount;
     // ShowMessage(  'Tempo( sem RDW ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
     dm_rc.rc_ResizeBlocks( Self, true, true );
     //ShowMessageN(  'Tempo( StringReplace default ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
     // in development
     rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
end;

initialization
  RegisterClass(TfrmDEMO_ALT_MENU);

end.
