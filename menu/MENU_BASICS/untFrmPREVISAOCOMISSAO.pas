unit untFrmPREVISAOCOMISSAO; //8.0.0.0

// =====================================================================
// untFrmPREVISAOCOMISSAO — conversão 3.0 -> 8.0 + redesign
// (molde §45.1: modal de relatórios, visual da casa)
// - RECEITA MODAL 3 PATAS (§45): (1) menu: rc_BuildMenuItem( '', 0,
//   'Previsão de Comissão frm:previsaocomissao modal:' );
//   (2) pas: class(TfrmGenericModalForm) + untGenericModalForm no uses +
//   UniFormResize re-forçando 357x820 + poScreenCenter + OnReady vazio;
//   (3) dfm: Hint [[modal:]] + bsSingle/biSystemMenu + OnResize=UniFormResize.
//   Par de medidas: design 594x315 <-> runtime 820x357 (3 linhas de filtros
//   FECHADAS: scroll 203 = 3+62+7+62+7+62, sem estouro).
// - Sem PageControl: aba virou ScrollBox na raiz — subtítulo carrega o nome.
// - Ganchos 3.0 preservados: ESCRITA_PREVISAOCOMISSAO (mkm_relatorios;
//   empresa INT + funcionario ini/fin TEXTO + tipo ItemIndex TEXTO + datas
//   TDateTime) -> RELATORIO_PREVISAOCOMISSAO (mkm_impressao; empresa INT +
//   tipo ItemIndex INTEGER + datas TDateTime + sql) -> unfImpressao.
// - Combo verbatim da 3.0 (alimenta ItemIndex): 'Emiss'#227'o' / 'vencimento'
//   (minúscula, verbatim estrito); default 0.
// - Botões search dos funcionários: INERTES na 3.0 (IconCls search SEM
//   handler) — preservados sem handler (§46 só converte handler existente).
//   Para ativar: PesquisarCadastro('FUNCIONARIOS', ...) nos OnButtonClick.
// - Defaults 3.0 (Show): DataIni=inicio do mes, DataFin=hoje, tipo=0.
//   Faixas 00001 / 9999999 (7 noves, verbatim).
// - Destroy 3.0 limpa SOMENTE varC_Form_Modal — preservado verbatim.
// - Centralizacao do 3.0 (UniFormReady/Top) suplantada pelo poScreenCenter.
// =====================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniGUIBaseClasses,
  uniLabel, uniEdit, UniButtonEdit, uniButton, uniBitBtn,
  uniDateTimePicker, uniMultiItem, uniComboBox, uniScrollBox,
  untGenericModalForm;   //8.0: ancestral que governa o tamanho do modal

type
  TfrmPREVISAOCOMISSAO = class(TfrmGenericModalForm)
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
    edSearchDATAINIVEN: TUniDateTimePicker;
    rcBlock28: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edSearchDATAFINVEN: TUniDateTimePicker;
    rcBlock31: TUniContainerPanel;
    UniLabel2: TUniLabel;
    edSearchPESSOAINIVEN: TUniButtonEdit;
    rcBlock34: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edSearchPESSOAFINVEN: TUniButtonEdit;
    rcBlock37: TUniContainerPanel;
    UniLabelFd1: TUniLabel;
    cbxtipo: TUniComboBox;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmPREVISAOCOMISSAO: TfrmPREVISAOCOMISSAO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web, untDM_RC, mkm_layout,
  mkm_impressao, mkm_relatorios, System.DateUtils, unReportImpressao;

function frmPREVISAOCOMISSAO: TfrmPREVISAOCOMISSAO;
begin
  Result := TfrmPREVISAOCOMISSAO(mm.GetFormInstance(TfrmPREVISAOCOMISSAO));
end;

//8.0.0.0 receita modal §45 (padrão COMISSAOBAIXAEFETUADA)
procedure TfrmPREVISAOCOMISSAO.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
end;

procedure TfrmPREVISAOCOMISSAO.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmPREVISAOCOMISSAO.UniFormReady(Sender: TObject);
begin
  // 3.0 centralizava por Top aqui — no 8.0 o poScreenCenter da receita §45
  // (UniFormResize) supre o centro. Reservado p/ ajuste fino de geometria.
end;

procedure TfrmPREVISAOCOMISSAO.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 sem Constraints (regra 40b) — re-força o tamanho do design
//  frmPREVISAOCOMISSAO.Height   := 357;
//  frmPREVISAOCOMISSAO.Width    := 820;
//  frmPREVISAOCOMISSAO.Position := poScreenCenter;
end;

procedure TfrmPREVISAOCOMISSAO.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmPREVISAOCOMISSAO.UniFormShow(Sender: TObject);
begin
  edSearchDATAINIVEN.DateTime         := StartofTheMonth(date);
  edSearchDATAFINVEN.DateTime         := Date;
  cbxtipo.ItemIndex                   := 0;
end;

procedure TfrmPREVISAOCOMISSAO.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := ESCRITA_PREVISAOCOMISSAO(mm.varI_Code_Company,
                                        edSearchPESSOAINIVEN.Text,
                                        edSearchPESSOAFINVEN.Text,
                                        IntToStr(cbxtipo.ItemIndex),
                                        edSearchDATAINIVEN.DateTime,
                                        edSearchDATAFINVEN.DateTime);

  mm.varC_caminhopdf :=  RELATORIO_PREVISAOCOMISSAO(
                                        MM.varI_Code_Company,
                                        cbxtipo.ItemIndex,
                                        edSearchDATAINIVEN.DateTime,
                                        edSearchDATAFINVEN.DateTime,
                                        psql);

  unfImpressao.ShowModal();
end;

procedure TfrmPREVISAOCOMISSAO.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

Initialization
   RegisterClass( TfrmPREVISAOCOMISSAO );
end.
