unit untFrmDEMO_COLLAPSE;//8.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload, uniBasicGrid, uniDBGrid,
  uniMultiItem, uniComboBox, uniDBComboBox;

type
  TfrmDEMO_COLLAPSE = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1: TUniContainerPanel;
    UniLabel35: TUniLabel;
    UniBitBtn1: TUniBitBtn;
    rcBlock5: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    UniLabel1: TUniLabel;
    labRcCollapse24: TUniLabel;
    rcBlock25: TUniContainerPanel;
    UUUniDBEdit1: TUniDBEdit;
    UUUniLabel5: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UUUniLabel6: TUniLabel;
    UUUniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock35: TUniContainerPanel;
    UUUniLabel7: TUniLabel;
    UUUniDBEdit2: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel35Clone: TUniLabel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    edCodigoClone: TUniDBEdit;
    UniLabel3Clone: TUniLabel;
    rcBlock70: TUniContainerPanel;
    labDtCadClone: TUniLabel;
    edDtCadClone: TUniDBDateTimePicker;
    rcBlock80: TUniContainerPanel;
    UniLabel5Clone: TUniLabel;
    edDtBirthdayClone: TUniDBDateTimePicker;
    rcBlock90: TUniContainerPanel;
    UniLabel9Clone: TUniLabel;
    edCnpjCpfClone: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    UniLabel10Clone: TUniLabel;
    edTipoPessoaClone: TUniDBComboBox;
    rcBlock110: TUniContainerPanel;
    UniLabel11Clone: TUniLabel;
    UniDBEdit2Clone: TUniDBEdit;
    rcBlock120: TUniContainerPanel;
    UniLabel6Clone: TUniLabel;
    edCliNameClone: TUniDBEdit;
    rcBlock130: TUniContainerPanel;
    UniLabel12Clone: TUniLabel;
    edRazSocClone: TUniDBEdit;
    rcBlock55: TUniContainerPanel;
    labClient_01: TUniLabel;
    UniLabel8Clone: TUniLabel;
    rcBlock140: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    UniLabel2Clone: TUniLabel;
    labClient_02: TUniLabel;
    rcBlock160: TUniContainerPanel;
    UniLabel4Clone: TUniLabel;
    UniDBEdit4Clone: TUniDBEdit;
    rcBlock170: TUniContainerPanel;
    UniLabel7Clone: TUniLabel;
    UniDBEdit5Clone: TUniDBEdit;
    rcBlock180: TUniContainerPanel;
    UniLabel13Clone: TUniLabel;
    edLkpUFSClone: TUniDBEdit;
    rcBlock190: TUniContainerPanel;
    UniLabel14Clone: TUniLabel;
    edLkpCIDADESClone: TUniDBEdit;
    rcBlock200: TUniContainerPanel;
    UniLabel15Clone: TUniLabel;
    UniDBEdit6Clone: TUniDBEdit;
    rcBlock155: TUniContainerPanel;
    UniLabel16Clone: TUniLabel;
    edCepClone: TUniDBEdit;
    rcBlock195: TUniContainerPanel;
    UniLabel18Clone: TUniLabel;
    edLkpCIDADES_SetDS_CODIIBGEClone: TUniDBEdit;
    rcBlock210: TUniContainerPanel;
    rcBlock220: TUniContainerPanel;
    UniLabel2CloneClone: TUniLabel;
    labClient_03: TUniLabel;
    rcBlock230: TUniContainerPanel;
    UniLabel4CloneClone: TUniLabel;
    UniDBEdit4CloneClone: TUniDBEdit;
    rcBlock240: TUniContainerPanel;
    UniLabel7CloneClone: TUniLabel;
    UniDBEdit5CloneClone: TUniDBEdit;
    rcBlock250: TUniContainerPanel;
    UniLabel13CloneClone: TUniLabel;
    edLkpUFSCloneClone: TUniDBEdit;
    rcBlock260: TUniContainerPanel;
    UniLabel14CloneClone: TUniLabel;
    edLkpCIDADESCloneClone: TUniDBEdit;
    rcBlock270: TUniContainerPanel;
    UniLabel15CloneClone: TUniLabel;
    UniDBEdit6CloneClone: TUniDBEdit;
    rcBlock225: TUniContainerPanel;
    UniLabel16CloneClone: TUniLabel;
    edCepCloneClone: TUniDBEdit;
    rcBlock265: TUniContainerPanel;
    UniLabel18CloneClone: TUniLabel;
    edLkpCIDADES_SetDS_CODIIBGECloneClone: TUniDBEdit;
    UniBitBtn2: TUniBitBtn;
    UniBitBtn2Clone: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
    procedure UniBitBtn2CloneClick(Sender: TObject);
    procedure UniLabel1Click(Sender: TObject);

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
  mkm_layout, uconsts, uconsts_cfg, mkm_anim, untDM_RC, mkm_translate, mkm_func_web, str_func, mkm_layout_aux_collapse;//8.0.0.0

procedure TfrmDEMO_COLLAPSE.UniBitBtn1Click(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmDEMO_COLLAPSE.UniBitBtn2Click(Sender: TObject);
begin
     rc_Collapse( labRcCollapse24, Self, labRcCollapse24 , false, true );
end;

procedure TfrmDEMO_COLLAPSE.UniBitBtn2CloneClick(Sender: TObject);
begin
     rc_Collapse( labRcCollapse24, Self, labRcCollapse24 , true );
end;

procedure TfrmDEMO_COLLAPSE.UniFrameCreate(Sender: TObject);
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

procedure TfrmDEMO_COLLAPSE.UniFrameReady(Sender: TObject);
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

procedure TfrmDEMO_COLLAPSE.UniLabel1Click(Sender: TObject);
begin
   rc_Collapse( labRcCollapse24, Self, labRcCollapse24 , false, true );
end;

initialization
  RegisterClass(TfrmDEMO_COLLAPSE);

end.
