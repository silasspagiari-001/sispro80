unit untFrmDEMO_FORMS_7503;//8.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils, Clipbrd,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload, uniMultiItem, uniComboBox;

type
  TfrmDEMO_FORMS = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    UniLabel35: TUniLabel;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1200: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock41: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edUserName: TUniEdit;
    labRepitaNova: TUniLabel;
    UniLabel2: TUniLabel;
    edPassword: TUniEdit;
    btnLink: TUniBitBtn;
    rcBlock42: TUniContainerPanel;
    rcBlock43: TUniContainerPanel;
    UniLabel3: TUniLabel;
    rcBlock44: TUniContainerPanel;
    UniEdit1: TUniEdit;
    rcBlock72: TUniContainerPanel;
    UniScrollBox1: TUniScrollBox;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    rcBlock70: TUniContainerPanel;
    rcBlock71: TUniContainerPanel;
    UniLabel19: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    bsrgpTipo01_M: TUniLabel;
    UniLabel20: TUniLabel;
    bsrgpTipo02_E: TUniLabel;
    UniLabel21: TUniLabel;
    bsrgpTipo03_F: TUniLabel;
    UniLabel22: TUniLabel;
    btnGetIndex: TUniBitBtn;
    btnGetValue: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    rcBlock46: TUniContainerPanel;
    rcBlock48: TUniContainerPanel;
    UniLabel4: TUniLabel;
    rcBlock50: TUniContainerPanel;
    rcLabel3600: TUniLabel;
    rcBlock52: TUniContainerPanel;
    edDate: TUniDateTimePicker;
    rcBlock58: TUniContainerPanel;
    UniLabel5: TUniLabel;
    rcBlock60: TUniContainerPanel;
    edID: TUniEdit;
    rcBlock65: TUniContainerPanel;
    rcBlock67: TUniContainerPanel;
    btnCancelForm: TUniBitBtn;
    rcBlock69: TUniContainerPanel;
    btnSaveFormValidate: TUniBitBtn;
    rcBlock54: TUniContainerPanel;
    UniLabel6: TUniLabel;
    rcBlock56: TUniContainerPanel;
    UniEdit2: TUniEdit;
    rcBlock63: TUniContainerPanel;
    UniLabel7: TUniLabel;
    rcBlock64: TUniContainerPanel;
    edSite: TUniEdit;
    rcBlock73: TUniContainerPanel;
    UniLabel8: TUniLabel;
    btnCopy: TUniBitBtn;
    btnPaste: TUniBitBtn;
    rcBlock45: TUniContainerPanel;
    memo: TUniMemo;
    rcBlock76: TUniContainerPanel;
    rcBlock77: TUniContainerPanel;
    UniLabel23: TUniLabel;
    btnInsertNew: TUniBitBtn;
    btnShowFishFact: TUniBitBtn;
    btnShowCustomer: TUniBitBtn;
    btnEditCustomer: TUniBitBtn;
    btnInsideBlock: TUniBitBtn;
    btnCallWithTag: TUniBitBtn;
    UniBitBtn2: TUniBitBtn;
    rcBlock390: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniLabel2Clone: TUniLabel;
    rcBlock100: TUniContainerPanel;
    UniEdit1Clone: TUniEdit;
    rcBlock110: TUniContainerPanel;
    UniEdit2CloneCloneClone: TUniEdit;
    rcBlock120: TUniContainerPanel;
    UniEdit3CloneCloneClone: TUniEdit;
    rcBlock130: TUniContainerPanel;
    UniEdit4CloneCloneClone: TUniEdit;
    rcBlock140: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    UniLabel1CloneCloneClone: TUniLabel;
    rcBlock160: TUniContainerPanel;
    rcEdit11CloneCloneClone: TUniEdit;
    rcBlock170: TUniContainerPanel;
    rcEdit11CloneCloneCloneClone: TUniEdit;
    rcBlock180: TUniContainerPanel;
    UniEdit1CloneCloneClone: TUniEdit;
    rcBlock190: TUniContainerPanel;
    rcEdit11CloneCloneCloneCloneClone: TUniEdit;
    rcBlock200: TUniContainerPanel;
    rcBlock210: TUniContainerPanel;
    UniLabel2CloneCloneCloneCloneClone: TUniLabel;
    rcBlock220: TUniContainerPanel;
    UniEdit2CloneCloneCloneCloneClone: TUniEdit;
    rcBlock230: TUniContainerPanel;
    UniEdit3CloneCloneCloneCloneClone: TUniEdit;
    rcBlock240: TUniContainerPanel;
    UniDateTimePicker1CloneCloneCloneCloneClone: TUniDateTimePicker;
    rcBlock250: TUniContainerPanel;
    UniComboBox1CloneCloneCloneCloneClone: TUniComboBox;
    rcBlock260: TUniContainerPanel;
    rcBlock270: TUniContainerPanel;
    UniLabel4CloneCloneCloneClone: TUniLabel;
    labRcCollapse6CloneCloneClone: TUniLabel;
    rcBlock280: TUniContainerPanel;
    UniEdit4CloneCloneCloneCloneClone: TUniEdit;
    rcBlock290: TUniContainerPanel;
    UniEdit5CloneCloneCloneCloneClone: TUniEdit;
    rcBlock300: TUniContainerPanel;
    UniEdit6CloneCloneCloneCloneClone: TUniEdit;
    rcBlock310: TUniContainerPanel;
    UniEdit7CloneCloneCloneCloneClone: TUniEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnShowFishFactClick(Sender: TObject);
    procedure btnShowCustomerClick(Sender: TObject);
    procedure btnEditCustomerClick(Sender: TObject);
    procedure btnInsertNewClick(Sender: TObject);
    procedure btnInsideBlockClick(Sender: TObject);
    procedure btnSaveFormValidateClick(Sender: TObject);
    procedure btnPasteClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnCancelFormClick(Sender: TObject);
    procedure btnGetValueClick(Sender: TObject);
    procedure btnGetIndexClick(Sender: TObject);
    procedure bbbtnNewRegClick(Sender: TObject);
    procedure btnCallWithTagClick(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);

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
  mkm_layout, uconsts, uconsts_cfg, mkm_anim, untDM_RC, mkm_translate, mkm_validate, mkm_func_web, str_func, mkm_layout_aux_callout;//8.0.0.0

// copy to "clipboard"
procedure TfrmDEMO_FORMS.btnCopyClick(Sender: TObject);
begin
     if UniEdit1.Text = '' then
        rc_CallOut( 'Content is Empty!', UniEdit1, ctDanger )
     else
     begin
        //UniSession.AddJS( 'ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_CopyToClipBoard", ["content=" + ' + QuotedStr( UniEdit1.Text ) + '] );' );
        dm_rc.rc_CopyToClipBoard( UniEdit1 );
        rc_CallOut( 'Content Copied! Use CTRL V to paste.', UniEdit1, ctInfo );
     end;
end;
// paste from "clipboard"
procedure TfrmDEMO_FORMS.bbbtnNewRegClick(Sender: TObject);
begin
//   rc_AddCssClass( UUUniDBDateTimePicker1, 'rc-icon-trigger-top-' + 5.ToString );
end;

procedure TfrmDEMO_FORMS.btnPasteClick(Sender: TObject);
begin
     memo.Lines.Clear;
     //memo.Lines.Add( mm.varC_TempString );
     memo.Lines.Add( Clipboard.AsText );
     memo.SetFocus;

     rc_CallOut( 'Content Pasted!', memo, ctSuccess, carBottom, '100,0', crpB_T  );
end;

procedure TfrmDEMO_FORMS.btnCancelFormClick(Sender: TObject);
begin
     dm_rc.rc_MaskAdjust( edID, mt_UNMASK, '' ); //7.3.0.0
     rc_ClearValidation( self );
end;

procedure TfrmDEMO_FORMS.btnCloseClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmDEMO_FORMS.btnEditCustomerClick(Sender: TObject);
begin
     MainForm.rc_AddFormFrameInTab( nil, 'Clientes', 'clientes', '' , false, false, aftEdit, 569 );
end;

procedure TfrmDEMO_FORMS.btnGetIndexClick(Sender: TObject);
begin
   //dm_rc.rc_ShowMessage( 'Selected ItemIndex = ' + dm_rc.rc_GetItemIndexFromRgp( bsrgpTipo01_M ).ToString );
   ShowMessage( 'Selected ItemIndex = ' + dm_rc.rc_GetItemIndexFromRgp( bsrgpTipo01_M ).ToString );
end;

procedure TfrmDEMO_FORMS.btnGetValueClick(Sender: TObject);
begin
   //dm_rc.rc_ShowMessage( 'Selected Item Value = ' + dm_rc.rc_GetValueFromRgp( bsrgpTipo01_M ) );
  // ShowMessage( 'Selected Item Value = ' + dm_rc.rc_GetValueFromRgp( bsrgpTipo01_M ) );

   rc_RenderLayout( Self, false, false, false, false, true );
end;

procedure TfrmDEMO_FORMS.btnInsertNewClick(Sender: TObject);
begin
     MainForm.rc_AddFormFrameInTab( nil, 'Clientes', 'clientes', '' , false, false, aftInsert );
     dm_rc.rc_ConsoleLog('Clicked option 4');
end;

procedure TfrmDEMO_FORMS.btnInsideBlockClick(Sender: TObject);
begin
     rcblock390.Height := 215;
     MainForm.rc_AddFormFrameInTab( nil, 'Fish Fact', '', 'FISHFACT' , false, false, aftNone, 0, rcblock390, true, false );
     //MainForm.rc_AddFormFrameInTab( nil, 'DEMO MODAL', '', 'DEMOWITHFORMMODAL' , false, false, aftNone, 0, rcblock390, true, false );
end;

procedure TfrmDEMO_FORMS.btnSaveFormValidateClick(Sender: TObject);
begin
  //if not rc_FormValidate( Self, rcBlock46 ) then
  //if not rc_FormValidate( Self, rcBlock42 ) then
  if not rc_FormValidate( Self ) then
  begin
     Abort;
  end;
end;

procedure TfrmDEMO_FORMS.btnShowCustomerClick(Sender: TObject);
begin
     //                                   Form Title  Form table
     MainForm.rc_AddFormFrameInTab( nil, 'Clientes', 'clientes', '' , false, false, aftShowReg,  569 );
end;

procedure TfrmDEMO_FORMS.btnShowFishFactClick(Sender: TObject);
begin
     //                                   Form Title  Form table
     //MainForm.rc_AddFormFrameInTab( nil, 'Fish Fact', '', 'FISHFACT' , false, false );
     MainForm.rc_AddFormFrameInTab( nil, 'Demo Form', '', 'DEMOWITHFORM' , false, false , aftNone, 0, nil, true, false, '1');
end;

procedure TfrmDEMO_FORMS.UniBitBtn1Click(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;
//7.2.0.0 frame modal
procedure TfrmDEMO_FORMS.UniBitBtn2Click(Sender: TObject);
var
   cFrm,cTbl : string;
   FrmC : TUniFormClass;
   Frm  : TUniForm;
begin
  Frm := dm_rc.rc_PrepareFrameAsModal( Self, 'DEMO_TIMELINE' , 'Update Log Sample' ); //8.0.0.0
  Frm.ShowModal( procedure(Sender: TComponent; Result:Integer)
                 begin
                    //[PT] para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no que estiver "abaixo" do MODAL
                    //[EN] For when a modal form is active, do not perform the "dbgridupdate" in what is "below" of the modal
                 end
               );
//      //[PT] passar o nome( cFrm ) com ou sem prefixo( frm/frmCad ) dependendo do uconst.
//      //[EN] Pass the name( cFrm ) with or without prefix (FRM/FRMCAD) depending on UCONST.
//      cFrm := 'DEMO_TIMELINE';
//      cTbl := '';
//      //open "frmBaseCRUD" based as MODAL
//      //cFrm := 'CIDADES'; //Default Prefix "frmCad"
//      //cTbl := 'CIDADES'; //7.2.0.0
//      FrmC := TUniFormClass( FindAnyClass( 'TfrmModalFrameForm' ) );
//      Frm                 := FrmC.Create( uniSession.uniapplication );
//      Frm.Name            := Frm.Name + '__' + TUniControl(sender).Name ;
//      mm.varC_FormSource_Search := frm.Name;
//      if rc_GetHintAttr( 'modal:', Frm.Hint ) = '' then
//      begin
//         Frm.Hint := rc_SetHintAttr( ''    , 'modal:' , Frm.Hint, True );
//         //Frm.Hint := rc_SetHintAttr( cTbl + '_ADD' , 'rcdynaddfrmtbl:', Frm.Hint, True );//If want to start form "inserting"
//         Frm.Hint := rc_SetHintAttr( cTbl  , 'rcdynaddfrmtbl:', Frm.Hint, True );//7.2.0.0
//         Frm.Hint := rc_SetHintAttr( cFrm  , 'rcdynaddfrm:', Frm.Hint, True );
//      end;
//      Frm.ShowModal( procedure(Sender: TComponent; Result:Integer)
//                     begin
//                        //[PT] para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no que estiver "abaixo" do MODAL
//                        //[EN] For when a modal form is active, do not perform the "dbgridupdate" in what is "below" of the modal
//                        mm.varC_Form_Modal := nil;
//                     end
//                   );
end;

procedure TfrmDEMO_FORMS.btnCallWithTagClick(Sender: TObject);
begin
     MainForm.rc_AddFormFrameInTab( nil, 'BIND de Dados Dinâmico', '', 'DEMO_DYNAMIC_BIND' , false, false , aftNone, 0, nil, true, false, 'E');
end;

procedure TfrmDEMO_FORMS.UniFrameCreate(Sender: TObject);
begin
     edDate.ShowBlankDate := true;
     edDate.DateTime := 0;
     edDate.Text     := '';

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
     rc_RenderLayout( Self, false, false, false, false, true );
end;

procedure TfrmDEMO_FORMS.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_FORMS);

end.
