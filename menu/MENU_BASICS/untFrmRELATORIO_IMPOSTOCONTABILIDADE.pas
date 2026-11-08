unit untFrmRELATORIO_IMPOSTOCONTABILIDADE; //8.0.0.0

// =====================================================================
// untFrmRELATORIO_IMPOSTOCONTABILIDADE — conversão 3.0 -> 8.0 + redesign
// (molde §45 confirmado do untfrmRELATORIOS: modal de relatórios)
// - RECEITA MODAL 3 PATAS (§45): (1) menu: rc_BuildMenuItem( '', 0,
//   '<Caption> frm:relatorio_impostocontabilidade modal:' ); (2) pas:
//   class(TfrmGenericModalForm) + untGenericModalForm no uses + UniFormResize
//   re-forçando 380x820 + poScreenCenter + OnReady vazio; (3) dfm: Hint
//   [[modal:]] + bsSingle/biSystemMenu + OnResize=UniFormResize.
// - Sem PageControl (aba única 'Resumo I.C.M.S.' virou ScrollBox na raiz —
//   lição do vão em branco do RELATORIOS).
// - Ganchos 3.0 preservados: ESCRITA_APURACAOICMS (mkm_relatorios) ->
//   RELATORIO_ALIQUOTAICMS (mkm_impressao) -> unfImpressao.ShowModal;
//   defaults de data no UniFormShow; EndOfTheMonth no OnExit do DATAINI;
//   varA_relatorio/varC_Form_Modal := nil no Destroy; RegisterClass.
// =====================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniDateTimePicker, uniButton, uniBitBtn,
  uniLabel, uniPanel, uniGUIBaseClasses, uniScrollBox,
  untGenericModalForm;   //8.0: ancestral que governa o tamanho do modal

type
  TfrmRELATORIO_IMPOSTOCONTABILIDADE = class(TfrmGenericModalForm)
    paTitulo: TUniContainerPanel;
    labTitulo: TUniLabel;
    labSubtitulo: TUniLabel;
    UniScrollBox1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchDATAINI: TUniDateTimePicker;
    rcBlock20: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edSearchDATAFIN: TUniDateTimePicker;
    paBotoes: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    labRodape: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure edSearchDATAINIExit(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRELATORIO_IMPOSTOCONTABILIDADE: TfrmRELATORIO_IMPOSTOCONTABILIDADE;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web, untDM_RC,
  mkm_layout, mkm_impressao, mkm_relatorios, unReportImpressao,
  System.DateUtils;

function frmRELATORIO_IMPOSTOCONTABILIDADE: TfrmRELATORIO_IMPOSTOCONTABILIDADE;
begin
  Result := TfrmRELATORIO_IMPOSTOCONTABILIDADE(MM.GetFormInstance(TfrmRELATORIO_IMPOSTOCONTABILIDADE));
end;

//8.0.0.0 receita modal §45 (padrão CUSTOPRODUCAO/RELATORIOS)
procedure TfrmRELATORIO_IMPOSTOCONTABILIDADE.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
end;

procedure TfrmRELATORIO_IMPOSTOCONTABILIDADE.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmRELATORIO_IMPOSTOCONTABILIDADE.UniFormReady(Sender: TObject);
begin
  // reservado p/ ajuste fino de geometria (padrão modal RC)
end;

procedure TfrmRELATORIO_IMPOSTOCONTABILIDADE.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 sem Constraints (regra 40b) — re-força o tamanho do design
//  frmRELATORIO_IMPOSTOCONTABILIDADE.Height   := 380;
//  frmRELATORIO_IMPOSTOCONTABILIDADE.Width    := 820;
//  frmRELATORIO_IMPOSTOCONTABILIDADE.Position := poScreenCenter;
end;

procedure TfrmRELATORIO_IMPOSTOCONTABILIDADE.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmRELATORIO_IMPOSTOCONTABILIDADE.UniFormShow(Sender: TObject);
begin
  edSearchDATAINI.DateTime := StartofTheMonth(date);
  edSearchDATAFIN.DateTime := Date;
end;

procedure TfrmRELATORIO_IMPOSTOCONTABILIDADE.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := ESCRITA_APURACAOICMS(mm.varI_Code_Company,
                               edSearchDATAINI.Text,
                               edSearchDATAFIN.Text);

  mm.varC_caminhopdf :=  RELATORIO_ALIQUOTAICMS(mm.varI_Code_Company,
                                                edSearchDATAINI.Text,
                                                edSearchDATAFIN.Text,
                                                psql);

  unfImpressao.ShowModal();
end;

procedure TfrmRELATORIO_IMPOSTOCONTABILIDADE.edSearchDATAINIExit(
  Sender: TObject);
begin
  edSearchDATAFIN.DateTime := EndofTheMonth(edSearchDATAINI.DateTime);
end;

procedure TfrmRELATORIO_IMPOSTOCONTABILIDADE.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

Initialization
   RegisterClass( TfrmRELATORIO_IMPOSTOCONTABILIDADE );
end.
