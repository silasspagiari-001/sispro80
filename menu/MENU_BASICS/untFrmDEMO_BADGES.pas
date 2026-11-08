unit untFrmDEMO_BADGES;//8.2.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload;

type
  TfrmDEMO_BADGES = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1000: TUniContainerPanel;
    rcBlock187: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock188: TUniContainerPanel;
    UniLabel2: TUniLabel;
    rcBlock189: TUniContainerPanel;
    UniLabel3: TUniLabel;
    rcBlock192: TUniContainerPanel;
    UniLabel4: TUniLabel;
    rcBlock190: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel11: TUniLabel;
    rcBlock200: TUniContainerPanel;
    UniLabel2Clone: TUniLabel;
    UniLabel5Clone: TUniLabel;
    rcBlock210: TUniContainerPanel;
    UniLabel3Clone: TUniLabel;
    UniLabel7Clone: TUniLabel;
    rcBlock230: TUniContainerPanel;
    UniLabel4Clone: TUniLabel;
    UniLabel11Clone: TUniLabel;
    rcBlock220: TUniContainerPanel;
    UniLabel8Clone: TUniLabel;
    UniLabel9Clone: TUniLabel;
    rcBlock240: TUniContainerPanel;
    UniLabel2CloneClone: TUniLabel;
    UniLabel5CloneClone: TUniLabel;
    rcBlock250: TUniContainerPanel;
    UniLabel3CloneClone: TUniLabel;
    UniLabel7CloneClone: TUniLabel;
    rcBlock270: TUniContainerPanel;
    UniLabel4CloneClone: TUniLabel;
    UniLabel11CloneClone: TUniLabel;
    rcBlock260: TUniContainerPanel;
    UniLabel8CloneClone: TUniLabel;
    UniLabel9CloneClone: TUniLabel;
    rcBlock280: TUniContainerPanel;
    UniLabel2CloneCloneClone: TUniLabel;
    UniLabel5CloneCloneClone: TUniLabel;
    rcBlock290: TUniContainerPanel;
    UniLabel3CloneCloneClone: TUniLabel;
    UniLabel7CloneCloneClone: TUniLabel;
    rcBlock310: TUniContainerPanel;
    UniLabel4CloneCloneClone: TUniLabel;
    UniLabel11CloneCloneClone: TUniLabel;
    rcBlock300: TUniContainerPanel;
    UniLabel8CloneCloneClone: TUniLabel;
    UniLabel9CloneCloneClone: TUniLabel;
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

procedure TfrmDEMO_BADGES.UniFrameCreate(Sender: TObject);
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

procedure TfrmDEMO_BADGES.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_BADGES);

end.
