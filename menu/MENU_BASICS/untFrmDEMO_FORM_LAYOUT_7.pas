unit untFrmDEMO_FORM_LAYOUT_7;// 7.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload, uniBasicGrid, uniDBGrid;

type
  TfrmDEMO_FORM_LAYOUT_7 = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock132: TUniContainerPanel;
    rcBlock133: TUniContainerPanel;
    rcBlock134: TUniContainerPanel;
    UUUniDBEdit1: TUniDBEdit;
    UUUniLabel5: TUniLabel;
    rcBlock135: TUniContainerPanel;
    UUUniLabel6: TUniLabel;
    UUUniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock136: TUniContainerPanel;
    rcBlock137: TUniContainerPanel;
    UUUniLabel7: TUniLabel;
    UUUniDBEdit2: TUniDBEdit;
    rcBlock138: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    bbbtnNewReg: TUniBitBtn;
    rcBlock141: TUniContainerPanel;
    bbbtnEditReg: TUniBitBtn;
    rcBlock142: TUniContainerPanel;
    bbbtnDeleteReg: TUniBitBtn;
    rcBlock139: TUniContainerPanel;
    rcBlock144: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    rcBlock145: TUniContainerPanel;
    rcBlock147: TUniContainerPanel;
    UUUniBitBtn1: TUniBitBtn;
    rcBlock148: TUniContainerPanel;
    UUUniBitBtn2: TUniBitBtn;
    rcBlock149: TUniContainerPanel;
    UUUniBitBtn3: TUniBitBtn;
    rcBlock146: TUniContainerPanel;
    rcBlock151: TUniContainerPanel;
    rcBlock157: TUniContainerPanel;
    rcBlock152: TUniContainerPanel;
    rcBlock154: TUniContainerPanel;
    UUUniBitBtn1Clone170: TUniBitBtn;
    rcBlock155: TUniContainerPanel;
    UUUniBitBtn2Clone190: TUniBitBtn;
    rcBlock156: TUniContainerPanel;
    UUUniBitBtn3Clone210: TUniBitBtn;
    rcBlock153: TUniContainerPanel;
    rcBlock158: TUniContainerPanel;
    rcBlock164: TUniContainerPanel;
    rcBlock165: TUniContainerPanel;
    UniLabel24: TUniLabel;
    edLkpUFS: TUniDBEdit;
    rcBlock167: TUniContainerPanel;
    UniLabel25: TUniLabel;
    ed_lkp_teste: TUniEdit;
    rcBlock166: TUniContainerPanel;
    UniBitBtn2: TUniBitBtn;
    UniBitBtn3: TUniBitBtn;
    rcBlock168: TUniContainerPanel;
    btnLookUp: TUniBitBtn;
    rcBlock159: TUniContainerPanel;
    rcBlock161: TUniContainerPanel;
    UUUUniBitBtn1Clone170: TUniBitBtn;
    rcBlock162: TUniContainerPanel;
    UUUUniBitBtn2Clone190: TUniBitBtn;
    rcBlock163: TUniContainerPanel;
    UUUUniBitBtn3Clone210: TUniBitBtn;
    rcBlock160: TUniContainerPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
    procedure UniBitBtn3Click(Sender: TObject);
    procedure edLkpUFSEnter(Sender: TObject);
    procedure btnLookUpClick(Sender: TObject);

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

procedure TfrmDEMO_FORM_LAYOUT_7.btnLookUpClick(Sender: TObject);
begin
  MainForm.rc_AddFormFrameInTab( nil, 'FORM B', '', 'DEMO_LOOKUPMODAL' , false, true, aftNone, 0, nil, false, false );
end;

procedure TfrmDEMO_FORM_LAYOUT_7.edLkpUFSEnter(Sender: TObject);
begin
  ed_lkp_teste.Text := edLkpUFS.Text + ' Pk=' + IntToStr( dm_rc.rc_GetLookUpTag( edLkpUFS ) ) // edLkpUFS.Tag.ToString
end;

procedure TfrmDEMO_FORM_LAYOUT_7.UniBitBtn2Click(Sender: TObject);
begin
     edLkpUFS.Tag := 6;
     //bighont 6.0.0.0
     //edLkpUFS.Hint := rc_AddHintAttr( '|lkp-tag:' + '6' , edLkpUFS.Hint, True );
     dm_rc.rc_SetLookUpTag( edLkpUFS , 6 );
     dm_rc.rc_LookUpUpdateData( self, edLkpUFS );
end;

procedure TfrmDEMO_FORM_LAYOUT_7.UniBitBtn3Click(Sender: TObject);
begin
     //edLkpUFS.Tag := 0;
     //bighont 6.0.0.0
     //edLkpUFS.Hint := rc_AddHintAttr( '|lkp-tag:' + '0' , edLkpUFS.Hint, True );
     dm_rc.rc_SetLookUpTag( edLkpUFS , 0 );
     dm_rc.rc_LookUpUpdateData( self, edLkpUFS );
end;

procedure TfrmDEMO_FORM_LAYOUT_7.UniFrameCreate(Sender: TObject);
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

     // configurar lookups...mascaras...etc.. preparar query [[fields]]...
     // adjust the lookup tables according to the query name
     dm_rc.rc_RenderLookUpControls( Self );
     // atualizar todos os LOOKUPs dinamicamente
     mm.varC_Lookup_Code := '';
     //dm_rc.rc_LookUpUpdateData(  self  );
end;

procedure TfrmDEMO_FORM_LAYOUT_7.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_FORM_LAYOUT_7);

end.
