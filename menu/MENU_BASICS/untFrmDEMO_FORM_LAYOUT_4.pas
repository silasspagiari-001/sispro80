unit untFrmDEMO_FORM_LAYOUT_4;//8.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, uniGUIApplication,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload, uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox;

type
  TfrmDEMO_FORM_LAYOUT_4 = class(TUniFrame)
    rcSweetAlert: TUniSweetAlert;
    sboxGridBlock: TUniScrollBox;
    rcBlock2: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock50: TUniContainerPanel;
    btnPay7: TUniBitBtn;
    btnPay8: TUniBitBtn;
    btnPay9: TUniBitBtn;
    btnPay1: TUniBitBtn;
    btnPay2: TUniBitBtn;
    btnPay3: TUniBitBtn;
    btnPay4: TUniBitBtn;
    btnPay5: TUniBitBtn;
    btnPay0: TUniBitBtn;
    btnPay6: TUniBitBtn;
    btnPayComma: TUniBitBtn;
    UniContainerPanel1: TUniContainerPanel;
    labPayDisplay: TUniLabel;
    btnPayClear: TUniBitBtn;
    btnPayCancel: TUniBitBtn;
    btnPayEnter: TUniBitBtn;
    edNumberTyped: TUniFormattedNumberEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btnPay7Click(Sender: TObject);
    procedure labExitClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    iSlides, iSlideCount : integer;

    pObj : TUniControl;
    function GetDisplayData : string;
    procedure SetDisplayData( sender : TObject );
    procedure ClearDisplayData;

  end;

implementation

{$R *.dfm}

uses Main, ServerModule, MainModule, mkm_gridblock,
  mkm_layout, uconsts, uconsts_cfg, mkm_anim, untDM_RC, mkm_translate, mkm_func_web, str_func;    

procedure TfrmDEMO_FORM_LAYOUT_4.UniFrameCreate(Sender: TObject);
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

procedure TfrmDEMO_FORM_LAYOUT_4.UniFrameReady(Sender: TObject);
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

procedure TfrmDEMO_FORM_LAYOUT_4.btnPay7Click(Sender: TObject);
begin
     SetDisplayData( sender );
end;

procedure TfrmDEMO_FORM_LAYOUT_4.ClearDisplayData;
begin
     labPayDisplay.Caption := '';
end;

function TfrmDEMO_FORM_LAYOUT_4.GetDisplayData: string;
begin
     Result := labPayDisplay.Caption;
end;

procedure TfrmDEMO_FORM_LAYOUT_4.labExitClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmDEMO_FORM_LAYOUT_4.SetDisplayData( sender : TObject );
var
   cSender, c : string;
begin
     c := IntToStr( TUniBitBtn( sender ).Tag );

     cSender := c;
     if c = '20' then
        c := PFmtSettings.DecimalSeparator
     else
     if ( c = '30') then
     begin
        c := '';
        dm_rc.rc_ShowToaster( 'success', 'Payment of $ ' + labPayDisplay.Caption + ' Done !', false, 'slideLeftRightFade' );
        ClearDisplayData;
     end
     else
     if ( c = '40') then
     begin
        ClearDisplayData;
        c := '';
        dm_rc.rc_ShowToaster( 'error', 'Payment Cancelled !', false, 'slideLeftRightFade' );
     end
     else
     if ( c = '50') then
     begin
        c := GetDisplayData;
        c := Copy( c, 1, Length( c ) - 1 );
        //edPayDisplay.Text := c;
        labPayDisplay.Caption := c;
     end;

     if ( cSender <> '50') then
     begin
       // edPayDisplay.Text := edPayDisplay.Text + c;
        labPayDisplay.Caption := labPayDisplay.Caption + c;
        //labPayDisplay.Caption := FloatToStrF( edNumberTyped.Value, ffNumber, 18, 2 );
     end;
     edNumberTyped.Value := StrToFloatDef( labPayDisplay.Caption , 0.00 );
end;

initialization
  RegisterClass(TfrmDEMO_FORM_LAYOUT_4);

end.
