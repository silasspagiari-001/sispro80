unit untFrmDEMO_BUTTONS;//7.4.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, uniGUIApplication,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload, uniMultiItem, uniComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmDEMO_BUTTONS = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    UniLabel35: TUniLabel;
    rcSweetAlert: TUniSweetAlert;
    rcBlock2000: TUniContainerPanel;
    rcBlock19: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock21: TUniContainerPanel;
    btnClose: TUniBitBtn;
    rcBlock22: TUniContainerPanel;
    btnRed: TUniBitBtn;
    rcBlock23: TUniContainerPanel;
    btnGreen: TUniBitBtn;
    rcBlock27: TUniContainerPanel;
    btnGray: TUniBitBtn;
    rcBlock28: TUniContainerPanel;
    btnSilver: TUniBitBtn;
    rcBlock29: TUniContainerPanel;
    btnCrud: TUniBitBtn;
    rcBlock24: TUniContainerPanel;
    btnOrange: TUniBitBtn;
    rcBlock25: TUniContainerPanel;
    btnBlue: TUniBitBtn;
    rcBlock26: TUniContainerPanel;
    btnDark: TUniBitBtn;
    rcBlock50: TUniContainerPanel;
    UniScrollBox3Clone: TUniScrollBox;
    UniContainerPanel1: TUniContainerPanel;
    btnLink: TUniBitBtn;
    btnPaste: TUniBitBtn;
    btnCopy: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    rcBlock51: TUniContainerPanel;
    labBtnWithIcon: TUniLabel;
    rcBlock100: TUniContainerPanel;
    UniScrollBox3CloneClone: TUniScrollBox;
    UniContainerPanel1Clone: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    UniLabel42CloneClone: TUniLabel;
    Block1: TUniContainerPanel;
    labEdit: TUniLabel;
    UniLabel3: TUniLabel;
    paFrontBtn: TUniContainerPanel;
    Block2: TUniContainerPanel;
    UniLabel4: TUniLabel;
    paFrontBtn2: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniBitBtn2: TUniBitBtn;
    UniBitBtn3: TUniBitBtn;
    rcBlock70: TUniContainerPanel;
    rcBlock75: TUniContainerPanel;
    UniLabel1Clone: TUniLabel;
    rcBlock80: TUniContainerPanel;
    btnSpin: TUniBitBtn;
    rcBlock81: TUniContainerPanel;
    UniBitBtn4: TUniBitBtn;
    rcBlock82: TUniContainerPanel;
    UniBitBtn5: TUniBitBtn;
    rcBlock83: TUniContainerPanel;
    UniBitBtn6: TUniBitBtn;
    rcBlock84: TUniContainerPanel;
    UniBitBtn7: TUniBitBtn;
    rcBlock85: TUniContainerPanel;
    UniBitBtn8: TUniBitBtn;
    rcBlock86: TUniContainerPanel;
    UniBitBtn9: TUniBitBtn;
    rcBlock88: TUniContainerPanel;
    UniBitBtn11: TUniBitBtn;
    rcBlock1010: TUniContainerPanel;
    rcBlock1020: TUniContainerPanel;
    UniLabel1CloneClone: TUniLabel;
    rcBlock1030: TUniContainerPanel;
    btnSpinClone: TUniBitBtn;
    rcBlock1040: TUniContainerPanel;
    UniBitBtn4Clone: TUniBitBtn;
    rcBlock1050: TUniContainerPanel;
    UniBitBtn5Clone: TUniBitBtn;
    rcBlock1060: TUniContainerPanel;
    UniBitBtn6Clone: TUniBitBtn;
    rcBlock1070: TUniContainerPanel;
    UniBitBtn7Clone: TUniBitBtn;
    rcBlock1080: TUniContainerPanel;
    UniBitBtn10: TUniBitBtn;
    rcBlock1200: TUniContainerPanel;
    rcBlock1210: TUniContainerPanel;
    UniLabel1CloneCloneClone: TUniLabel;
    rcBlock1220: TUniContainerPanel;
    btn1: TUniBitBtn;
    btn2: TUniBitBtn;
    btn3: TUniBitBtn;
    rcBlock1320: TUniContainerPanel;
    btnGroupOpt: TUniBitBtn;
    rcBlock1230: TUniContainerPanel;
    rcBlock1240: TUniContainerPanel;
    UniLabel1CloneCloneCloneClone: TUniLabel;
    rcBlock1250: TUniContainerPanel;
    btn1Down: TUniBitBtn;
    btn2Down: TUniBitBtn;
    btn3Down: TUniBitBtn;
    rcBlock1260: TUniContainerPanel;
    btnGroupOptDown: TUniBitBtn;
    rcBlock30: TUniContainerPanel;
    UniScrollBox1: TUniScrollBox;
    btnRedOutL: TUniBitBtn;
    btnGreenOutL: TUniBitBtn;
    btnBlueOutL: TUniBitBtn;
    btnRedRound: TUniBitBtn;
    btnGreenRound: TUniBitBtn;
    btnRound: TUniBitBtn;
    btnOrangeOutL: TUniBitBtn;
    btnGrayOutL: TUniBitBtn;
    btnOrangeRound: TUniBitBtn;
    btnSilverOutL: TUniBitBtn;
    btnGrayRound: TUniBitBtn;
    btnSilverRound: TUniBitBtn;
    rcBlock31: TUniContainerPanel;
    UniLabel2: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btnOrangeOutLClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnLinkClick(Sender: TObject);
    procedure btnPasteClick(Sender: TObject);
    procedure btnSilverRoundClick(Sender: TObject);
    procedure paFrontBtnClick(Sender: TObject);
    procedure btnSpinClick(Sender: TObject);
    procedure btnGroupOptClick(Sender: TObject);
    procedure btnGroupOptCloneClick(Sender: TObject);
    procedure btnGroupOptDownClick(Sender: TObject);

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

procedure TfrmDEMO_BUTTONS.btnOrangeOutLClick(Sender: TObject);
begin

end;

//[PT] captura um objeto dentro de um frame
//[EN] capture an object within a frame
procedure TfrmDEMO_BUTTONS.btnGroupOptClick(Sender: TObject);
begin
     If TUniControl( sender ).Name = 'btnGroupOpt' then
     begin
          dm_rc.rc_ShowToaster( ttySuccess, 'option 0' );
     end
     else
     If TUniControl( sender ).Name = 'btnGroupOpt1' then
     begin
          dm_rc.rc_ShowToaster( ttySuccess, 'option 1' );
     end
     else
     If TUniControl( sender ).Name = 'btnGroupOpt2' then
     begin
          dm_rc.rc_ShowToaster( ttySuccess, 'option 2' );
     end;
end;

procedure TfrmDEMO_BUTTONS.btnGroupOptCloneClick(Sender: TObject);
begin
     If TUniControl( sender ).Name = 'btnGroupOptDown' then
     begin
          dm_rc.rc_ShowToaster( ttySuccess, 'option 0' );
     end
     else
     If TUniControl( sender ).Name = 'btnGroupOptDown1' then
     begin
          dm_rc.rc_ShowToaster( ttySuccess, 'option 1' );
     end
     else
     If TUniControl( sender ).Name = 'btnGroupOptDown2' then
     begin
          dm_rc.rc_ShowToaster( ttySuccess, 'option 2' );
     end;
end;

procedure TfrmDEMO_BUTTONS.btnGroupOptDownClick(Sender: TObject);
begin
     If TUniControl( sender ).Name = 'btnGroupOptDown' then
     begin
          dm_rc.rc_ShowToaster( ttySuccess, 'option 0' );
     end
     else
     If TUniControl( sender ).Name = 'btnGroupOptDown1' then
     begin
          dm_rc.rc_ShowToaster( ttySuccess, 'option 1' );
     end
     else
     If TUniControl( sender ).Name = 'btnGroupOptDown2' then
     begin
          dm_rc.rc_ShowToaster( ttySuccess, 'option 2' );
     end;
end;

procedure TfrmDEMO_BUTTONS.btnLinkClick(Sender: TObject);
var
   oQuery : TFDQuery;
begin
     oQuery := TFDQuery ( rc_FindFormFrameIntoTab( 'frmCadCLIENTES', 'sqlMaster' ) );
     if ( oQuery <> nil ) then
     begin
          if ( oQuery.Active ) then
          begin
             dm_rc.rc_ShowSweetAlertSimple( 'Client: ' + oQuery.FieldByName( 'nome' ).AsString );
             //[PT] se precisar alterar o conteudo na origem da pesquisa
             //[EN] if you need to change the content in the search source
             //oQuery.FieldByName( 'nome' ).AsString := 'ALTEREI...';
          end
          else
             dm_rc.rc_ShowSweetAlertSimple( 'Select a client. ' );
     end
     else
         dm_rc.rc_ShowSweetAlertSimple( 'I Can not find the frame/form or object' );
end;

//[PT] captura o form/frame dentro de pgGeneral para que você possa pesquisar livremente por objetos dentro dele
//[EN] capture the frame into pgGeneral so you can freely search for objects within it
procedure TfrmDEMO_BUTTONS.btnPasteClick(Sender: TObject);
var
   oFrame  : TObject;
   oEdit : TUniEdit;
begin
     oFrame := rc_FindFormFrameIntoTab( 'frmCadCLIENTES' );
     if oFrame <> nil then
     begin
        oEdit := TUniEdit ( rc_FindObject( 'edCliName' , oFrame ) );
        dm_rc.rc_ShowSweetAlertSimple( oEdit.Text );
     end
     else
        dm_rc.rc_ShowSweetAlertSimple( 'I Can not find the frame/form or component' );
end;

procedure TfrmDEMO_BUTTONS.btnSilverRoundClick(Sender: TObject);
var
   cFrm : string;
   FrmC : TUniFormClass;
   Frm  : TUniForm;

begin
      cFrm := 'DEMOACTIONS_BIND'; // passar o nome com ou sem prefizo( frm/frmCad ) dependendo do uconst.
      FrmC := TUniFormClass( FindAnyClass( 'TfrmModalFrameForm' ) );
      Frm                 := FrmC.Create( uniSession.uniapplication );
      Frm.Name            := Frm.Name + '__' + TUniControl(sender).Name ;
      mm.varC_FormSource_Search := frm.Name;
      if rc_GetHintAttr( 'modal:', Frm.Hint ) = '' then
      begin
         Frm.Hint := rc_SetHintAttr( '' , 'modal:', Frm.Hint, True );
         //Frm.Hint := rc_SetHintAttr( cTableName + '_ADD' , 'rcdynaddfrmtbl:', Frm.Hint, True );
         Frm.Hint := rc_SetHintAttr( cFrm                , 'rcdynaddfrm:', Frm.Hint, True );
      end;

      Frm.ShowModal( procedure(Sender: TComponent; Result:Integer)
                     begin
                        // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
                        // que estiver "abaixo" do MODAL
                        mm.varC_Form_Modal := nil;
                     end
                   );
end;

procedure TfrmDEMO_BUTTONS.btnSpinClick(Sender: TObject);
var
   cAnim : string;
begin
     cAnim := lowercase( rc_GetHintAttr( 'caption:', TUniBitBtn( sender ).hint ) );
     if Pos( 'fa-' + cAnim, TUniBitBtn( sender ).Hint ) = 0 then
        TUniBitBtn( sender ).Hint := rc_SetHintAttr( 'fa-' + cAnim, 'cls-ico:', TUniBitBtn( sender ).Hint, true )
     else
        TUniBitBtn( sender ).Hint := StringReplace( TUniBitBtn( sender ).Hint, 'fa-' + cAnim, '', [rfReplaceAll] );

     dm_rc.rc_RenderControls( self, TUniBitBtn( sender ) );

end;

procedure TfrmDEMO_BUTTONS.paFrontBtnClick(Sender: TObject);
begin
     dm_rc.rc_ShowSweetAlertSimple( 'Clicked !' );
end;


procedure TfrmDEMO_BUTTONS.btnCopyClick(Sender: TObject);
begin
   rc_ChangeCls( self, btnLink, 'ButtonOutlineRed', 'ButtonOutlineGreen' , true );
end;

procedure TfrmDEMO_BUTTONS.UniBitBtn1Click(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmDEMO_BUTTONS.UniFrameCreate(Sender: TObject);
begin

     Self.Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

     iSlides     := 1;
     iSlideCount := 3;
     //8.2.0.0
     rcBlock81.Visible := mm.CONFIG_LAYOUT_FONTAWS <> '5';
     rcBlock82.Visible := mm.CONFIG_LAYOUT_FONTAWS <> '5';
     rcBlock83.Visible := mm.CONFIG_LAYOUT_FONTAWS <> '5';
     rcBlock84.Visible := mm.CONFIG_LAYOUT_FONTAWS <> '5';
     rcBlock85.Visible := mm.CONFIG_LAYOUT_FONTAWS <> '5';
     rcBlock86.Visible := mm.CONFIG_LAYOUT_FONTAWS <> '5';
     //rcBlock87.Visible := mm.CONFIG_LAYOUT_FONTAWS <> '5';
     //rcBlock88.Visible := mm.CONFIG_LAYOUT_FONTAWS <> '5';
     rcBlock1010.Visible := mm.CONFIG_LAYOUT_FONTAWS <> '5';

     //hfChat.HTML.Clear;

     //dm_rc.rc_ShowSweetAlert( 'RadCORE' , 'Do More. Better and Fast!' , 'info' );

     //if mm.CONFIG_LANGUAGE = 'pt_BR' then
     //   btnLink.Hint := rc_SetHintAttr( 'https://radcore.pro.br/web/atualizacoes/' , 'link:', btnLink.Hint )
     //else
     //   btnLink.Hint := rc_SetHintAttr( 'https://radcore.pro.br/web/updates/' , 'link:', btnLink.Hint );

     // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
     rc_RenderLayout( Self, false, false );
end;

procedure TfrmDEMO_BUTTONS.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_BUTTONS);

end.
