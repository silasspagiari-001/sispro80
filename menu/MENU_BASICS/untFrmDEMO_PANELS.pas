unit untFrmDEMO_PANELS;// 6.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload;

type
  TfrmDEMO_PANELS = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock10: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock172: TUniContainerPanel;
    UniContainerPanel11: TUniContainerPanel;
    labAlert: TUniLabel;
    labAlert2: TUniLabel;
    rcBlock170: TUniContainerPanel;
    UniLabel14: TUniLabel;
    rcBlock174: TUniContainerPanel;
    UniContainerPanel12: TUniContainerPanel;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    rcBlock178: TUniContainerPanel;
    UniContainerPanel13: TUniContainerPanel;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    UniLabel20: TUniLabel;
    rcBlock176: TUniContainerPanel;
    UniContainerPanel14: TUniContainerPanel;
    UniLabel21: TUniLabel;
    UniLabel22: TUniLabel;
    UniLabel23: TUniLabel;
    rcBlock180: TUniContainerPanel;
    UniLabel24: TUniLabel;
    rcBlock182: TUniContainerPanel;
    UniLabel25: TUniLabel;
    rcBlock183: TUniContainerPanel;
    UniLabel26: TUniLabel;
    rcBlock184: TUniContainerPanel;
    UniLabel27: TUniLabel;
    rcBlock185: TUniContainerPanel;
    UniLabel28: TUniLabel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    btnGenerate: TUniButton;
    btnChangeAlert1: TUniBitBtn;
    UniLabel2: TUniLabel;
    rcBlock2000: TUniContainerPanel;
    rcBlock200: TUniContainerPanel;
    UniContainerPanel1Clone: TUniContainerPanel;
    rcBlock210: TUniContainerPanel;
    UniContainerPanel2Clone: TUniContainerPanel;
    rcBlock220: TUniContainerPanel;
    UniContainerPanel3Clone: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
    UniContainerPanel4Clone: TUniContainerPanel;
    rcBlock190: TUniContainerPanel;
    UniLabel29: TUniLabel;
    rcBlock250: TUniContainerPanel;
    Block260: TUniContainerPanel;
    rcBlock310: TUniContainerPanel;
    Block320: TUniContainerPanel;
    rcBlock360: TUniContainerPanel;
    Block350CloneClone: TUniContainerPanel;
    Block360CloneClone: TUniContainerPanel;
    rcBlock370: TUniContainerPanel;
    Block350CloneCloneClone: TUniContainerPanel;
    UniContainerPanel1CloneCloneClone: TUniContainerPanel;
    Block360CloneCloneClone: TUniContainerPanel;
    rcBlock350: TUniContainerPanel;
    rcBlock390: TUniContainerPanel;
    rcBlock400: TUniContainerPanel;
    rcBlock410: TUniContainerPanel;
    rcBlock420: TUniContainerPanel;
    rcBlock430: TUniContainerPanel;
    rcBlock440: TUniContainerPanel;
    rcBlock450: TUniContainerPanel;
    rcBlock460: TUniContainerPanel;
    UniLabel30: TUniLabel;
    UniLabel31: TUniLabel;
    UniBitBtn1: TUniBitBtn;
    rcBlock20: TUniContainerPanel;
    UniScrollBox1: TUniScrollBox;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniContainerPanel6: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniContainerPanel7: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniContainerPanel8: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniContainerPanel9: TUniContainerPanel;
    UniLabel11: TUniLabel;
    UniContainerPanel10: TUniContainerPanel;
    UniLabel32: TUniLabel;
    UniContainerPanel15: TUniContainerPanel;
    UniLabel33: TUniLabel;
    UniContainerPanel16: TUniContainerPanel;
    UniLabel34: TUniLabel;
    UniContainerPanel17: TUniContainerPanel;
    UniLabel35: TUniLabel;
    UniContainerPanel18: TUniContainerPanel;
    UniLabel36: TUniLabel;
    UniContainerPanel19: TUniContainerPanel;
    UniLabel37: TUniLabel;
    UniContainerPanel20: TUniContainerPanel;
    UniLabel38: TUniLabel;
    UniContainerPanel21: TUniContainerPanel;
    UniLabel39: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UniLabel13: TUniLabel;
    UniLabel12: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnChangeAlert1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    iSlides, iSlideCount : integer;
    pObj : TUniControl;

    procedure rc_UpdateBlocks( sender : TObject );

  end;

implementation

{$R *.dfm}

uses Main, ServerModule, MainModule, mkm_gridblock,
  mkm_layout, uconsts, uconsts_cfg, mkm_anim, untDM_RC, mkm_translate, mkm_func_web, str_func, mkm_createcomponents;

procedure TfrmDEMO_PANELS.UniBitBtn1Click(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;
// 6.0.0.0
procedure TfrmDEMO_PANELS.btnChangeAlert1Click(Sender: TObject);
begin
   labAlert.Caption := ' Alert Changed !!!';
   labAlert.Hint    := '[[bsalert:warning alert-ico:fas-exclamation-circle ]]';// '[[bsalert:warning icon-off]]';
   // render label again.
   dm_rc.rc_BootStrapRender( self, false, labAlert );

   labAlert2.Caption := ' RC Alert Changed !!!';
   labAlert2.Hint    := '[[rcalert:danger title:Ops Sample alert-ico:fas-exclamation-circle ]]';
   // render label again.
   dm_rc.rc_BootStrapRender( self, false, labAlert2 );
end;

procedure TfrmDEMO_PANELS.btnGenerateClick(Sender: TObject);
var
   w, i, c : integer;
   oPg, oBlock, oBlock2 : TUniContainerPanel;
   sboxHorizontalScroll : TUniScrollBox;
   oLabel : TUniLabel;
begin
    try
       dm_rc.memTemp.Close;
       dm_rc.memTemp.filtered := false;

       dm_rc.memTemp.Data := dm_rc.rc_GetRecord( mm.varB_IsNot_API ,
                                      True,
                                      ' select codigo,nome,avatar ' +
                                      ' from ' + dm_rc.rc_DBSchema + 'usuarios ' + //6.1.0.0
                                      ' order by codigo' );

       if mm.varC_LastErrorMsg <> '' then
       begin
           dm_rc.rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' );
           Exit;
       end;

       i := 20;
       c := 0;
       //sboxHorizontalScroll := rc_CreateScrollBox( Self, rcBlock40, 'sboxHorizontalScroll', rcBlock40.Width , rcBlock40.Height - rcBlock50.Height, 0 , rcBlock50.Height + 1, '[[scrollbar:show-both not-refresh-scroll|scrollbar-color:#c0c0c0 #fff]]', true, true );//7.0.0.0
       sboxHorizontalScroll := rc_CreateScrollBox( Self, rcBlock40, 'sboxHorizontalScroll', rcBlock40.Width , rcBlock40.Height - rcBlock50.Height, 0 , rcBlock50.Height + 1, '[[scrollbar:show-h not-refresh-scroll|scrollbar-color:#c0c0c0 #fff]]', true, true );//7.0.0.0
       sboxHorizontalScroll.ScrollDirection := sdBoth;
       sboxHorizontalScroll.Anchors := [ akLeft,akRight,akTop,akBottom ];
       dm_rc.memTemp.First;
       for c := 1 to 10 do
       begin
            oBlock2 := rc_CreateContainer( Self, sboxHorizontalScroll, 'card_' + c.ToString, 140 , 124, i , StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ), '[[cls:card-info-box-white]]', true );
              oBlock2.Color := clSilver;
              oLabel := rc_CreateLabel( Self, oBlock2, 'avatar' + i.ToString, 100, 30, 5, 5, '' ); //80 - ( i * 80 )
              oLabel.TextConversion :=  txtHTML;
              oLabel.Caption := '<img id="userimg" class="mini-avatar img-thumbnail" src="files/images/avatars/avatar_' + c.ToString + '.png" alt="User Img' + c.ToString + '">';
              //oLabel.OnClick := rc_UpdateBlocks;

              oLabel := rc_CreateLabel( Self, oBlock2, 'labtest' + i.ToString, 100, 30, 5, 70, '[[cls:align-label-center-center|center:parent xy]]', true, true ); //80 - ( i * 80 )
              oLabel.TextConversion :=  txtHTML;
              oLabel.Caption := 'Your Text';
              oLabel.AutoSize := false;
              oLabel.Alignment:= taCenter;

            i := i + 140 + StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 );
       end;
       //vertical panels
//       i := 124;
//       for c := 11 to 20 do
//       begin
//            oBlock2 := rc_CreateContainer( Self, sboxHorizontalScroll, 'card_' + c.ToString, 140 , 124, 20 , i + StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ), '[[cls:card-info-box-white]]', true );
//              oBlock2.Color := clSilver;
//              oLabel := rc_CreateLabel( Self, oBlock2, 'avatar' + i.ToString, 100, 30, 5, 5, '' ); //80 - ( i * 80 )
//              oLabel.TextConversion :=  txtHTML;
//              oLabel.Caption := '<img id="userimg" class="mini-avatar img-thumbnail" src="files/images/avatars/avatar_' + c.ToString + '.png" alt="User Img' + c.ToString + '">';
//              //oLabel.OnClick := rc_UpdateBlocks;
//
//              oLabel := rc_CreateLabel( Self, oBlock2, 'labtest' + i.ToString, 100, 30, 5, 70, '[[cls:align-label-center-center|center:parent xy]]', true, true ); //80 - ( i * 80 )
//              oLabel.TextConversion :=  txtHTML;
//              oLabel.Caption := 'Your Text';
//              oLabel.AutoSize := false;
//              oLabel.Alignment:= taCenter;
//
//            i := i + 124 + StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 );
//       end;

    finally
       rc_RenderLayout( Self, false, true );
       dm_rc.rc_ResizeBlocks( Self, true, true, false );//8.0.0.0 do not scroll
    end;
end;
//[PT] para testar o "[[scrollbar:show-h not-refresh-scroll]]" que mantém o scroll na posição que está após a renderização
//[EN] to test "[[scrollbar:show-h not-refresh-scroll]]" which keeps the scroll in the position it is after rendering
procedure TfrmDEMO_PANELS.rc_UpdateBlocks(sender: TObject);
var
   i:integer;
   sb : TUniScrollBox;
begin
    sb := TUniscrollBox( rc_FindControl( 'sboxHorizontalScroll', self ) );
    sb.BeginUpdate;
    rc_RenderLayout( Self, false, false );
    dm_rc.rc_ResizeBlocks( Self, true, true, false );
    sb.EndUpdate;
end;

procedure TfrmDEMO_PANELS.UniFrameCreate(Sender: TObject);
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

procedure TfrmDEMO_PANELS.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_PANELS);

end.
