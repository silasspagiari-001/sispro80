unit untFrmDEMO_TABS;// 6.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload;

type
  TfrmDEMO_TABS = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1000: TUniContainerPanel;
    rcBlock250: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel2: TUniLabel;
    pgCardTab: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniPanel1: TUniPanel;
    UniMemo4: TUniMemo;
    UniTabSheet2: TUniTabSheet;
    UniMemo5: TUniMemo;
    UniTabSheet3: TUniTabSheet;
    UniMemo6: TUniMemo;
    paPillSample: TUniContainerPanel;
    labPills: TUniLabel;
    rcBlock230: TUniContainerPanel;
    UniLabel3: TUniLabel;
    rcBlock240: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel1: TUniLabel;
    pgTabSample: TUniPageControl;
    tabEx1: TUniTabSheet;
    pa1: TUniPanel;
    UniMemo1: TUniMemo;
    tabEx2: TUniTabSheet;
    UniMemo2: TUniMemo;
    tabEx3: TUniTabSheet;
    UniMemo3: TUniMemo;
    paTabSample: TUniContainerPanel;
    labTabs: TUniLabel;
    rcBlock350: TUniContainerPanel;
    patitleTabClone: TUniContainerPanel;
    labTitleTabClone: TUniLabel;
    pgSampleSlide: TUniPageControl;
    rctabSlideEx1: TUniTabSheet;
    UniScrollBox1: TUniScrollBox;
    rcBlock355: TUniContainerPanel;
    rctabSlideEx2: TUniTabSheet;
    UniScrollBox2: TUniScrollBox;
    rcBlock356: TUniContainerPanel;
    rctabSlideEx3: TUniTabSheet;
    UniScrollBox3: TUniScrollBox;
    rcBlock357: TUniContainerPanel;
    paSampleCarousel: TUniContainerPanel;
    rcBlock360: TUniContainerPanel;
    patitleTabDrop: TUniContainerPanel;
    labTitleTabCloneClone: TUniLabel;
    pgSampleSlideDrop: TUniPageControl;
    rctabSlideDropEx1: TUniTabSheet;
    UniScrollBox1Clone: TUniScrollBox;
    rcBlock362: TUniContainerPanel;
    rctabSlideDropEx2: TUniTabSheet;
    UniScrollBox2Clone: TUniScrollBox;
    rcBlock364: TUniContainerPanel;
    rctabSlideDropEx3: TUniTabSheet;
    UniScrollBox3Clone: TUniScrollBox;
    rcBlock366: TUniContainerPanel;
    paSampleSlideDrop: TUniContainerPanel;
    rcBlock300: TUniContainerPanel;
    patitleTab: TUniContainerPanel;
    labTitleTab: TUniLabel;
    paRcTabSample: TUniContainerPanel;
    pgRcTabSample: TUniPageControl;
    rctabEx1: TUniTabSheet;
    UniMemoTab1: TUniMemo;
    rctabEx2: TUniTabSheet;
    UniMemoTab2: TUniMemo;
    rctabEx3: TUniTabSheet;
    UniMemoTab3: TUniMemo;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);

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

procedure TfrmDEMO_TABS.UniFrameCreate(Sender: TObject);
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

procedure TfrmDEMO_TABS.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_TABS);

end.
