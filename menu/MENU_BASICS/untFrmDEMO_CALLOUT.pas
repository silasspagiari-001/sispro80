unit untFrmDEMO_CALLOUT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils, TypInfo,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload, uniMultiItem, uniComboBox;

type
  TfrmDEMO_CALLOUT = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1000: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock188: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcLabel60: TUniLabel;
    cbxTheme: TUniComboBox;
    btnTopLeft: TUniBitBtn;
    rcBlock30: TUniContainerPanel;
    UniLabel2: TUniLabel;
    cbxArrow: TUniComboBox;
    rcBlock40: TUniContainerPanel;
    UniLabel3: TUniLabel;
    cbxRelPos: TUniComboBox;
    rcBlock50: TUniContainerPanel;
    rcLabel1010: TUniLabel;
    RelPosX: TUniNumberEdit;
    rcBlock60: TUniContainerPanel;
    rcLabel1020: TUniLabel;
    RelPosY: TUniNumberEdit;
    rcBlock70: TUniContainerPanel;
    rcLabel1010Clone: TUniLabel;
    FadeIn: TUniNumberEdit;
    rcBlock80: TUniContainerPanel;
    rcLabel1020Clone: TUniLabel;
    FadeOut: TUniNumberEdit;
    rcBlock90: TUniContainerPanel;
    rcLabel1010CloneClone: TUniLabel;
    Dismiss: TUniNumberEdit;
    rcBlock100: TUniContainerPanel;
    rcLabel1020CloneClone: TUniLabel;
    Width: TUniNumberEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btnTopCenterClick(Sender: TObject);
    procedure btnBottomCenterClick(Sender: TObject);
    procedure btnTopLeftClick(Sender: TObject);
    procedure btnRightCenterClick(Sender: TObject);

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
  mkm_layout, uconsts, uconsts_cfg, mkm_anim, untDM_RC, mkm_translate, mkm_func_web, str_func, mkm_layout_aux_callout;//8.0.0.0

procedure TfrmDEMO_CALLOUT.btnBottomCenterClick(Sender: TObject);
begin
     rc_CallOut( 'Hello World!', TUniControl( sender ), ctInfo, carTop,'0,0',crpB_T );
end;

procedure TfrmDEMO_CALLOUT.btnRightCenterClick(Sender: TObject);
begin
     rc_CallOut( 'Hello World!', TUniControl( sender ), ctInfo, carLeft_Top, '0,0' ,crpL_L );
end;

procedure TfrmDEMO_CALLOUT.btnTopCenterClick(Sender: TObject);
begin
     rc_CallOut( 'Hello World!', TUniControl( sender ), ctInfo, carBottom,'0,0',crpT_T );
end;
(*
                          pFadeInDuration : integer = 200;
                          pFadeOutDuration : integer = 200;
                          pDismissDelay : integer = 5000;
                          pWidth : integer = 200 );

  TRCCalloutTheme  = (ctDefault, ctCartoon, ctFancyBlue, ctGray, ctYellow, ctDanger, ctWarning, ctSuccess, ctInfo);
  TRCCalloutArrow  = (carTop, carBottom, carRight, carRight_Top, carRight_Bottom, carLeft, carLeft_Top, carLeft_Bottom, carBottom_Right, carBottom_Left, carTop_Right, carTop_Left);
  TRCCalloutRelPos = (crpC_C, crpT_B, crpB_T, crpL_R, crpR_L, crpT_T, crpB_B, crpL_L, crpR_R, crpTR_BL, crpTL_BR, crpBL_TR, crpBR_TL);
*)
procedure TfrmDEMO_CALLOUT.btnTopLeftClick(Sender: TObject);
var
   tTheme  : TRCCalloutTheme;
   tArrow  : TRCCalloutArrow;
   tRelPos : TRCCalloutRelPos;
begin
    case cbxTheme.ItemIndex of

      00 : tTheme := ctDefault;
      01 : tTheme := ctCartoon;
      02 : tTheme := ctFancyBlue;
      03 : tTheme := ctGray;
      04 : tTheme := ctYellow;
      05 : tTheme := ctDanger;
      06 : tTheme := ctWarning;
      07 : tTheme := ctSuccess;
      08 : tTheme := ctInfo;

    end;

    case cbxArrow.ItemIndex of

      00 : tArrow := carTop;
      01 : tArrow := carBottom;
      02 : tArrow := carRight;
      03 : tArrow := carRight_Top;
      04 : tArrow := carRight_Bottom;
      05 : tArrow := carLeft;
      06 : tArrow := carLeft_Top;
      07 : tArrow := carLeft_Bottom;
      08 : tArrow := carBottom_Right;
      09 : tArrow := carBottom_Left;
      10 : tArrow := carTop_Right;
      11 : tArrow := carTop_Left;

    end;

    case cbxRelPos.ItemIndex of

      00 : tRelPos := crpC_C;
      01 : tRelPos := crpT_B;
      02 : tRelPos := crpB_T;
      03 : tRelPos := crpL_R;
      04 : tRelPos := crpR_L;
      05 : tRelPos := crpT_T;
      06 : tRelPos := crpB_B;
      07 : tRelPos := crpL_L;
      08 : tRelPos := crpR_R;
      09 : tRelPos := crpTR_BL;
      10 : tRelPos := crpTL_BR;
      11 : tRelPos := crpBL_TR;
      12 : tRelPos := crpBR_TL;

    end;

    rc_CallOut( 'Hello World!', TUniControl(sender), tTheme , tArrow, trunc(relposX.Value).ToString + ',' + trunc(relposY.Value).ToString , tRelPos, Trunc(FadeIn.Value), Trunc(FadeOut.Value), Trunc(Dismiss.Value), Trunc(Width.Value) );
end;

procedure TfrmDEMO_CALLOUT.UniFrameCreate(Sender: TObject);
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

procedure TfrmDEMO_CALLOUT.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_CALLOUT);

end.
