unit untFrmDEMO_FORM_LAYOUT_9;// 7.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload, uniBasicGrid, uniDBGrid;

type
  TfrmDEMO_FORM_LAYOUT_10 = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1: TUniContainerPanel;
    UniLabel35: TUniLabel;
    UniBitBtn1: TUniBitBtn;
    rcBlock2070: TUniContainerPanel;
    rcBlock2080: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock2090: TUniContainerPanel;
    rcBlock2100: TUniContainerPanel;
    UniLabel2: TUniLabel;
    rcBlock2110: TUniContainerPanel;
    rcBlock2120: TUniContainerPanel;
    UniLabel3: TUniLabel;
    rcBlock2130: TUniContainerPanel;
    UniLabel4: TUniLabel;
    rcBlock2140: TUniContainerPanel;
    rcBlock2150: TUniContainerPanel;
    UniLabel5: TUniLabel;
    rcBlock2160: TUniContainerPanel;
    UniLabel6: TUniLabel;
    rcBlock2170: TUniContainerPanel;
    UniLabel7: TUniLabel;
    rcBlock2180: TUniContainerPanel;
    rcBlock2040: TUniContainerPanel;
    rcBlock2050: TUniContainerPanel;
    rcBlock2060: TUniContainerPanel;
    rcBlock2190: TUniContainerPanel;
    UniLabel8: TUniLabel;
    rcBlock2200: TUniContainerPanel;
    UniLabel6Clone: TUniLabel;
    rcBlock2210: TUniContainerPanel;
    rcBlock2220: TUniContainerPanel;
    rcBlock2230: TUniContainerPanel;
    UniLabel7Clone: TUniLabel;
    rcBlock2240: TUniContainerPanel;
    UniLabel9: TUniLabel;
    rcBlock2250: TUniContainerPanel;
    rcBlock2260: TUniContainerPanel;
    UniLabel7CloneClone: TUniLabel;
    rcBlock2270: TUniContainerPanel;
    rcBlock2280: TUniContainerPanel;
    rcBlock2290: TUniContainerPanel;
    UniLabel7CloneCloneClone: TUniLabel;
    rcBlock2300: TUniContainerPanel;
    UniLabel10: TUniLabel;
    rcBlock2310: TUniContainerPanel;
    rcBlock2320: TUniContainerPanel;
    UniLabel7CloneCloneCloneClone: TUniLabel;
    rcBlock2330: TUniContainerPanel;
    UniLabel1Clone: TUniLabel;
    rcBlock2249: TUniContainerPanel;
    UniLabel11: TUniLabel;
    rcBlock2340: TUniContainerPanel;
    UniLabel1CloneClone: TUniLabel;
    rcBlock2350: TUniContainerPanel;
    UniLabel7CloneCloneCloneCloneClone: TUniLabel;
    rcBlock2360: TUniContainerPanel;
    rcBlock2370: TUniContainerPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);

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

procedure TfrmDEMO_FORM_LAYOUT_10.UniBitBtn1Click(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmDEMO_FORM_LAYOUT_10.UniFrameCreate(Sender: TObject);
begin

     Self.Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

     iSlides     := 1;
     iSlideCount := 3;

     //hfChat.HTML.Clear;

   //  //dm_rc.rc_ShowSweetAlert( 'RadCORE' , 'Do More. Better and Fast!' , 'info' );

     //if mm.CONFIG_LANGUAGE = 'pt_BR' then
     //   btnLink.Hint := rc_SetHintAttr( 'https://radcore.pro.br/web/atualizacoes/' , 'link:', btnLink.Hint )
     //else
     //   btnLink.Hint := rc_SetHintAttr( 'https://radcore.pro.br/web/updates/' , 'link:', btnLink.Hint );

     // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
     rc_RenderLayout( Self, false, false );
end;

procedure TfrmDEMO_FORM_LAYOUT_10.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_FORM_LAYOUT_10);

end.
