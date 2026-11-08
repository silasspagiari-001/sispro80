unit untFrmDEMO_COLS_OFFSET;// 7.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload, uniBasicGrid, uniDBGrid;

type
  TfrmDEMO_COLS_OFFSET = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1040: TUniContainerPanel;
    rcBlock1050: TUniContainerPanel;
    rcBlock1060: TUniContainerPanel;
    rcBlock1070: TUniContainerPanel;
    rcBlock1065: TUniContainerPanel;
    rcBlock1090: TUniContainerPanel;
    rcBlock1100: TUniContainerPanel;
    rcBlock1110: TUniContainerPanel;
    rcBlock1120: TUniContainerPanel;
    rcBlock1115: TUniContainerPanel;
    rcBlock1140: TUniContainerPanel;
    rcBlock1150: TUniContainerPanel;
    rcBlock1160: TUniContainerPanel;
    rcBlock1170: TUniContainerPanel;
    rcBlock1165: TUniContainerPanel;
    rcBlock1190: TUniContainerPanel;
    rcBlock1200: TUniContainerPanel;
    rcBlock1210: TUniContainerPanel;
    rcBlock1220: TUniContainerPanel;
    rcBlock1215: TUniContainerPanel;
    rcBlock1240: TUniContainerPanel;
    rcBlock1250: TUniContainerPanel;
    rcBlock1260: TUniContainerPanel;
    rcBlock1270: TUniContainerPanel;
    rcBlock1265: TUniContainerPanel;
    rcBlock1035: TUniContainerPanel;
    UniLabel47: TUniLabel;
    rcBlock1085: TUniContainerPanel;
    UniLabel48: TUniLabel;
    rcBlock1135: TUniContainerPanel;
    UniLabel49: TUniLabel;
    rcBlock1235: TUniContainerPanel;
    UniLabel50: TUniLabel;
    rcBlock1185: TUniContainerPanel;
    UniLabel51: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniBitBtn1CloneClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    iSlides, iSlideCount : integer;

    pObj : TUniControl;

  end;

implementation

{$R *.dfm}

uses Main, ServerModule, MainModule, mkm_gridblock,
  mkm_layout, uconsts, uconsts_cfg, mkm_anim, untDM_RC, mkm_translate, mkm_func_web, str_func;    

procedure TfrmDEMO_COLS_OFFSET.UniBitBtn1CloneClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmDEMO_COLS_OFFSET.UniFrameCreate(Sender: TObject);
begin

     Self.Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

     iSlides     := 1;
     iSlideCount := 3;

     //hfChat.HTML.Clear;

     //dm_rc.rc_ShowSweetAlert( 'RadCORE' , 'Do More. Better and Fast!' , 'info' );

     //if mm.CONFIG_LANGUAGE = 'pt_BR' then
     //   btnLink.Hint := rc_SetHintAttr( 'https://radcore.pro.br/web/atualizacoes/' , 'link:', btnLink.Hint )
     //else
     //   btnLink.Hint := rc_SetHintAttr( 'https://radcore.pro.br/web/updates/' , 'link:', btnLink.Hint );

     // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
     rc_RenderLayout( Self, false, false );
end;

procedure TfrmDEMO_COLS_OFFSET.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_COLS_OFFSET);

end.
