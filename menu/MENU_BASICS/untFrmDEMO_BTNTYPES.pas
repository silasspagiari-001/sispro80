unit untFrmDEMO_BTNTYPES;//8.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload;

type
  TfrmDEMO_BTNTYPES = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1000: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock100: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniEdit1: TUniEdit;
    rcBlock150: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edClip: TUniEdit;
    rcBlock120: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniEdit2: TUniEdit;
    rcBlock130: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniEdit4: TUniEdit;
    rcBlock140: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniEdit6: TUniEdit;
    rcBlock170: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniEdit7: TUniEdit;
    rcBlock180: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniEdit8: TUniEdit;
    rcBlock190: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniEdit9: TUniEdit;
    rcBlock110: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniEdit5: TUniEdit;
    rcBlock160: TUniContainerPanel;
    UniLabel11: TUniLabel;
    UniEdit3: TUniEdit;
    rcBlock400: TUniContainerPanel;
    UniLabel12: TUniLabel;
    edLkpFUNCIONARIOS: TUniDBEdit;
    rcBlock410: TUniContainerPanel;
    UniLabel13: TUniLabel;
    edLkpFUNCIONARIOS__THEME: TUniDBEdit;
    rcBlock420: TUniContainerPanel;
    UniLabel14: TUniLabel;
    edLkpFUNCIONARIOS__OUTLINE: TUniDBEdit;
    rcBlock430: TUniContainerPanel;
    UniLabel15: TUniLabel;
    edLkpFUNCIONARIOS__GRAY: TUniDBEdit;
    rcBlock440: TUniContainerPanel;
    UniLabel16: TUniLabel;
    edLkpFUNCIONARIOS__WHITE: TUniDBEdit;
    rcBlock192: TUniContainerPanel;
    UniLabel17: TUniLabel;
    UniEdit10: TUniEdit;
    rcBlock142: TUniContainerPanel;
    UniLabel18: TUniLabel;
    UniEdit11: TUniEdit;
    rcBlock442: TUniContainerPanel;
    UniLabel19: TUniLabel;
    edLkpFUNCIONARIOS__TRIGGER: TUniDBEdit;
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

procedure TfrmDEMO_BTNTYPES.UniFrameCreate(Sender: TObject);
begin
//     Self.Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
     // configurar lookups...mascaras...etc.. preparar query [[fields]]...

     // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
     rc_RenderLayout( Self, false, false );

     // adjust the lookup tables according to the query name
     dm_rc.rc_RenderLookUpControls( Self );

end;

procedure TfrmDEMO_BTNTYPES.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_BTNTYPES);

end.
