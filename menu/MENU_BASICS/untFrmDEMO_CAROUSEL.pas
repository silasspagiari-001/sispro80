unit untFrmDEMO_CAROUSEL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload;

 type
  SlidesCarousel_1 = record
                       Image : string;
                       Title : string;
                       Text  : string;
                     end;

  TfrmDEMO_CAROUSEL = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock200: TUniContainerPanel;
    UniLabel2: TUniLabel;
    rcBlock490: TUniContainerPanel;
    htmlCarousel: TUniHTMLFrame;
    rcBlock500: TUniContainerPanel;
    htmlCarousel2: TUniHTMLFrame;
    rcBlock495: TUniContainerPanel;
    UniLabel1: TUniLabel;
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

uses Main, ServerModule, untFrmWEBCAM, MainModule, mkm_gridblock,
  mkm_layout, uconsts, uconsts_cfg, mkm_anim, untDM_RC, mkm_translate, mkm_validate, mkm_qrcode, mkm_func_web, untFrmQRCODE, str_func, mkm_carrousels;    

procedure TfrmDEMO_CAROUSEL.UniFrameCreate(Sender: TObject);
begin
     rc_Carousel( htmlCarousel, 1, 'c');
     rc_Carousel( htmlCarousel, 1, 'i', 'files/images/slides/1.jpg', '', 'Delphi Tutorials'     , 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel, 1, 'i', 'files/images/slides/2.jpg', '',  'HTML CSS3 Tutorials'  , 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel, 1, 'i', 'files/images/slides/3.jpg', '',  'Wordpress Tutorials'  , 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel, 1, 'i', 'files/images/slides/4.jpg', '',  'PHP MySQL Tutorials'  , 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel, 1, 'i', 'files/images/slides/5.jpg', '',  'Javascript Tutorials' , 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel, 1, 'i', 'files/images/slides/6.jpg', '',  'Bootstrap Tutorials'  , 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel, 1, 'f');

     rc_Carousel( htmlCarousel2, 2, 'c', '', 'Tutorials Options');
     rc_Carousel( htmlCarousel2, 2, 'i', 'files/images/slides/1.jpg', '' , 'Delphi Tutorials'    , 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel2, 2, 'i', 'files/images/slides/2.jpg', '' , 'HTML CSS3 Tutorials' , 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel2, 2, 'i', 'files/images/slides/3.jpg', '' , 'Wordpress Tutorials' , 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel2, 2, 'i', 'files/images/slides/4.jpg', '' , 'PHP MySQL Tutorials' , 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel2, 2, 'i', 'files/images/slides/5.jpg', '' , 'Javascript Tutorials', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel2, 2, 'i', 'files/images/slides/6.jpg', '' , 'Bootstrap Tutorials' , 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel2, 2, 'f');

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

procedure TfrmDEMO_CAROUSEL.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_CAROUSEL);

end.
