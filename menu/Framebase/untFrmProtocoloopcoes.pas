unit untFrmProtocoloopcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, uniLabel, Vcl.Menus, uniMainMenu;

type
  TfrmProtocoloopcoes = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    UniSpeedButton1: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    UniSpeedButton3: TUniSpeedButton;
    UniSpeedButton4: TUniSpeedButton;
    UniPopupMenuBOLETIM: TUniPopupMenu;
    B4: TUniMenuItem;
    B5: TUniMenuItem;
    b6: TUniMenuItem;
    b7: TUniMenuItem;
    N2: TUniMenuItem;
    N4: TUniMenuItem;
    N5: TUniMenuItem;
    UniPopupMenuFICHAANALISE: TUniPopupMenu;
    f1: TUniMenuItem;
    UniPopupMenuINFORMATIVO: TUniPopupMenu;
    UniMenuItem1: TUniMenuItem;
    UniPopupMenuGERMINACAO: TUniPopupMenu;
    UniMenuItem4: TUniMenuItem;
    rcBlock50: TUniContainerPanel;
    btnLkpClear: TUniBitBtn;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure UniSpeedButton2Click(Sender: TObject);
    procedure UniSpeedButton3Click(Sender: TObject);
    procedure UniSpeedButton4Click(Sender: TObject);
    procedure f1Click(Sender: TObject);
    procedure B4Click(Sender: TObject);
    procedure B5Click(Sender: TObject);
    procedure b6Click(Sender: TObject);
    procedure b7Click(Sender: TObject);
    procedure UniMenuItem1Click(Sender: TObject);
    procedure btnLkpClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImpressaoBOLETIM(via: Integer);
  end;

function frmProtocoloopcoes: TfrmProtocoloopcoes;

implementation

{ *.dfm}

uses
  untDM_RC,
  MainModule, uniGUIApplication, uconsts, mkm_layout, mkm_func_web,
  Vcl.Clipbrd, mkm_anim, mkm_impressao, unReportImpressao, untFrmPROTOCOLO,
  Main, mkm_procedures;

function frmProtocoloopcoes: TfrmProtocoloopcoes;
begin
  Result := TfrmProtocoloopcoes(mm.GetFormInstance(TfrmProtocoloopcoes));
end;

procedure TfrmProtocoloopcoes.B4Click(Sender: TObject);
begin
  ImpressaoBOLETIM(1);
end;

procedure TfrmProtocoloopcoes.B5Click(Sender: TObject);
begin
  ImpressaoBOLETIM(2);
end;

procedure TfrmProtocoloopcoes.b6Click(Sender: TObject);
begin
  ImpressaoBOLETIM(3);
end;

procedure TfrmProtocoloopcoes.b7Click(Sender: TObject);
begin
  ImpressaoBOLETIM(4);
end;

procedure TfrmProtocoloopcoes.btnLkpClearClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmProtocoloopcoes.f1Click(Sender: TObject);
begin
  if VerificaProtocolo(mm.varcI_protocolo, 'FICHA') = 'F' then
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Este protocolo não foi gerado FICHA', 'error')
  else
  begin
    mm.varC_caminhopdf := LABORATORIO_ficha(mm.varcI_protocolo, '');
    unfImpressao.ShowModal();
  end;
end;

procedure TfrmProtocoloopcoes.ImpressaoBOLETIM(via: Integer);
begin
  if VerificaProtocolo(mm.varcI_protocolo, 'BOLETIM') = 'F' then
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Este protocolo não foi gerado BOLETIM', 'error')
  else
  begin
    mm.varC_caminhopdf := LABORATORIO_Boletim(mm.varcI_protocolo, via);
    unfImpressao.ShowModal();
  end;
end;

procedure TfrmProtocoloopcoes.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmProtocoloopcoes.UniFormReady(Sender: TObject);
begin
  Self.Top := (UniSession.UniApplication.ScreenHeight div 2) - (Self.Height div 2);
end;

procedure TfrmProtocoloopcoes.UniFormShow(Sender: TObject);
begin
  if Self.Tag = 0 then
  begin
    Self.Visible := True;
    Self.Top := 0;

    rc_MoveAnimationForm(Self,
      Self.Left,
      Self.Left,
      Self.Top,
      (UniSession.UniApplication.ScreenHeight div 2) - (Self.Height div 2),
      400,
      1);
  end;
  Self.Visible := True;
end;

procedure TfrmProtocoloopcoes.UniMenuItem1Click(Sender: TObject);
begin
  if VerificaProtocolo(mm.varcI_protocolo, 'INFORMATIVO') = 'F' then
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Este protocolo não foi gerado INFORMATIVO', 'error')
  else
  begin
    mm.varC_caminhopdf := LABORATORIO_Informativo(mm.varcI_protocolo);
    unfImpressao.ShowModal();
  end;
end;

procedure TfrmProtocoloopcoes.UniSpeedButton1Click(Sender: TObject);
begin
  UniPopupMenuBOLETIM.PopupBy(TUniButton(Sender));
end;

procedure TfrmProtocoloopcoes.UniSpeedButton2Click(Sender: TObject);
begin
  UniPopupMenuFICHAANALISE.PopupBy(TUniButton(Sender));
end;

procedure TfrmProtocoloopcoes.UniSpeedButton3Click(Sender: TObject);
begin
  UniPopupMenuINFORMATIVO.PopupBy(TUniButton(Sender));
end;

procedure TfrmProtocoloopcoes.UniSpeedButton4Click(Sender: TObject);
begin
  UniPopupMenuGERMINACAO.PopupBy(TUniButton(Sender));
end;

end.
