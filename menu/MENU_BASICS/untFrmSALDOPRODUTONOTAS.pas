unit untFrmSALDOPRODUTONOTAS; //8.0.0.0

// =====================================================================
// untFrmSALDOPRODUTONOTAS — conversão 3.0 -> 8.0 + redesign
// (molde §45.1: modal de relatórios, visual da casa)
// - RECEITA MODAL 3 PATAS (§45): (1) menu: rc_BuildMenuItem( '', 0,
//   'Saldo de Produtos com Base em Notas frm:saldoprodutonotas modal:' );
//   (2) pas: class(TfrmGenericModalForm) + untGenericModalForm no uses +
//   UniFormResize re-forçando 222x820 + poScreenCenter + OnReady vazio;
//   (3) dfm: Hint [[modal:]] + bsSingle/biSystemMenu + OnResize=UniFormResize.
//   Par de medidas: design 594x180 <-> runtime 820x222 (1 linha de filtros).
// - Sem PageControl: aba virou ScrollBox na raiz — subtítulo carrega o nome.
// - Ganchos 3.0 preservados: RELATORIO_SALDOPRODUTONOTA (mkm_relatorios;
//   empresa INT + datas TEXTO) -> mm.varC_caminhopdf -> unfImpressao.
// - FIX de compilacao: o fonte 3.0 chama IMPRESSAO_SALDOPRODUTONOTA, que
//   NAO existe no repo — a funcao real do mkm_impressao e
//   IMPRESSAO_SaldoProdutoNota(empresa; sql, dataini, datafin: string),
//   mesma assinatura dos 4 parametros chamados. Corrigido para o nome real.
// - OnExit DtIni -> DtFin = EndofTheMonth (verbatim 3.0, sem inherited);
//   Show: DtIni=inicio do mes, DtFin=hoje (verbatim). SEM pesquisa de
//   cadastro (§46 n/a).
// - Destroy 3.0 limpa varA_relatorio E varC_Form_Modal — preservado verbatim.
// - Centralizacao do 3.0 (nao havia) suprida pelo poScreenCenter da receita.
// =====================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniGUIBaseClasses,
  uniLabel, uniButton, uniBitBtn, uniDateTimePicker, uniScrollBox,
  untGenericModalForm;   //8.0: ancestral que governa o tamanho do modal

type
  TfrmSALDOPRODUTONOTAS = class(TfrmGenericModalForm)
    paTitulo: TUniContainerPanel;
    labTitulo: TUniLabel;
    labSubtitulo: TUniLabel;
    UniScrollBox1: TUniScrollBox;
    paBotoes: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    labRodape: TUniLabel;
    rcBlock20: TUniContainerPanel;
    rcBlock25: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchDATAINI: TUniDateTimePicker;
    rcBlock28: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edSearchDATAFIN: TUniDateTimePicker;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure edSearchDATAINIExit(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmSALDOPRODUTONOTAS: TfrmSALDOPRODUTONOTAS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web, untDM_RC, mkm_layout,
  mkm_impressao, mkm_relatorios, System.DateUtils, unReportImpressao;

function frmSALDOPRODUTONOTAS: TfrmSALDOPRODUTONOTAS;
begin
  Result := TfrmSALDOPRODUTONOTAS(MM.GetFormInstance(TfrmSALDOPRODUTONOTAS));
end;

//8.0.0.0 receita modal §45 (padrão RELATORIO_SALDOBENENOTAS)
procedure TfrmSALDOPRODUTONOTAS.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
end;

procedure TfrmSALDOPRODUTONOTAS.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmSALDOPRODUTONOTAS.UniFormReady(Sender: TObject);
begin
  // 3.0 centralizava por Top aqui — no 8.0 o poScreenCenter da receita §45
  // (UniFormResize) supre o centro. Reservado p/ ajuste fino de geometria.
end;

procedure TfrmSALDOPRODUTONOTAS.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmSALDOPRODUTONOTAS.UniFormShow(Sender: TObject);
begin
  edSearchDATAINI.DateTime := StartofTheMonth(date);
  edSearchDATAFIN.DateTime := Date;
end;

procedure TfrmSALDOPRODUTONOTAS.edSearchDATAINIExit(Sender: TObject);
begin
  edSearchDATAFIN.DateTime   := EndofTheMonth(edSearchDATAINI.DateTime);
end;

procedure TfrmSALDOPRODUTONOTAS.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := RELATORIO_SALDOPRODUTONOTA(mm.varI_Code_Company,
                                 edSearchDATAINI.Text,
                                 edSearchDATAFIN.Text);

  mm.varC_caminhopdf :=  IMPRESSAO_SaldoProdutoNota(mm.varI_Code_Company,
                                                    psql,
                                                    edSearchDATAINI.Text,
                                                    edSearchDATAFIN.Text);

  unfImpressao.ShowModal();
end;

procedure TfrmSALDOPRODUTONOTAS.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

initialization
   RegisterClass( TfrmSALDOPRODUTONOTAS );
end.
