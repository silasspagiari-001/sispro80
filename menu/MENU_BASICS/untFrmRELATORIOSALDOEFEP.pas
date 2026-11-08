unit untFrmRELATORIOSALDOEFEP; //8.0.0.0

// =====================================================================
// untFrmRELATORIOSALDOEFEP — conversão 3.0 -> 8.0 + redesign
// (molde §45.1: modal de relatórios, visual da casa)
// - RECEITA MODAL 3 PATAS (§45): (1) menu: rc_BuildMenuItem( '', 0,
//   'Relatório de Saldo E.F./E.P frm:relatoriosaldoefep modal:' );
//   (2) pas: class(TfrmGenericModalForm) + untGenericModalForm no uses +
//   UniFormResize re-forçando 324x820 + poScreenCenter + OnReady vazio;
//   (3) dfm: Hint [[modal:]] + bsSingle/biSystemMenu + OnResize=UniFormResize.
//   Par de medidas: design 594x282 <-> runtime 820x324 (3 linhas de filtros,
//   mesma geometria do HISTORICOSEMENTESINTETICO/CONTROLEITENSEF).
// - Sem PageControl: aba 'Relatório Detalhado' virou ScrollBox na raiz
//   (lição do vão branco) — subtítulo carrega o nome da aba.
// - Ganchos 3.0 preservados (ORDEM DE PARAMETROS divergente entre eles,
//   verbatim): ESCRITA_RELATORIOSALDOEFEP (mkm_relatorios; empresa,
//   pessoas ini/fin, produtos ini/fin INT + datas TDateTime) ->
//   RELATORIO_RELATORIOSALDOEFEP (mkm_impressao; empresa, produtos ini/fin,
//   pessoas ini/fin, datas TEXTO + sql) -> unfImpressao.
// - Feature 3.0 preservada: OnExit da Data Inicial -> Data Final =
//   EndOfTheMonth(Data Inicial).
// - Pesquisas: NOVA untPesquisaGenerica (§46) — PESSOAS x2 e PRODUTOS x2.
//   Verbatim 3.0: INI preenche FIN em ambos (pessoas E produtos).
// - Defaults 3.0: Show = Data Inicial := Date (Data Final fica p/ OnExit);
//   centralizacao do 3.0 (UniFormReady/Top) suplantada pelo poScreenCenter.
// =====================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniGUIBaseClasses,
  uniLabel, uniEdit, UniButtonEdit, uniButton, uniBitBtn,
  uniDateTimePicker, uniScrollBox,
  untGenericModalForm;   //8.0: ancestral que governa o tamanho do modal

type
  TfrmRELATORIOSALDOEFEP = class(TfrmGenericModalForm)
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
    UniLabel4: TUniLabel;
    edSearchProdutosini: TUniButtonEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel5: TUniLabel;
    edSearchProdutosfin: TUniButtonEdit;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure edSearchDATAINIVENExit(Sender: TObject);
    procedure edSearchProdutosiniButtonClick(Sender: TObject);
    procedure edSearchProdutosfinButtonClick(Sender: TObject);
    procedure edSearchPESSOAINIVENButtonClick(Sender: TObject);
    procedure edSearchPESSOAFINVENButtonClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRELATORIOSALDOEFEP: TfrmRELATORIOSALDOEFEP;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web, untDM_RC, mkm_layout,
  mkm_impressao, mkm_relatorios, System.DateUtils, unReportImpressao,
  untPesquisaGenerica;

function frmRELATORIOSALDOEFEP: TfrmRELATORIOSALDOEFEP;
begin
  Result := TfrmRELATORIOSALDOEFEP(mm.GetFormInstance(TfrmRELATORIOSALDOEFEP));
end;

//8.0.0.0 receita modal §45 (padrão CONTROLEITENSEF/HISTORICOSEMENTESINTETICO)
procedure TfrmRELATORIOSALDOEFEP.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
end;

procedure TfrmRELATORIOSALDOEFEP.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmRELATORIOSALDOEFEP.UniFormReady(Sender: TObject);
begin
  // 3.0 centralizava por Top aqui — no 8.0 o poScreenCenter da receita §45
  // (UniFormResize) supre o centro. Reservado p/ ajuste fino de geometria.
end;

procedure TfrmRELATORIOSALDOEFEP.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 sem Constraints (regra 40b) — re-força o tamanho do design
 // frmRELATORIOSALDOEFEP.Height   := 324;
 // frmRELATORIOSALDOEFEP.Width    := 820;
//  frmRELATORIOSALDOEFEP.Position := poScreenCenter;
end;

procedure TfrmRELATORIOSALDOEFEP.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmRELATORIOSALDOEFEP.UniFormShow(Sender: TObject);
begin
  edSearchDATAINIVEN.DateTime := Date;
end;

procedure TfrmRELATORIOSALDOEFEP.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := ESCRITA_RELATORIOSALDOEFEP(mm.varI_Code_Company     ,
                                     StrToInt(edSearchPESSOAINIVEN.Text),
                                     StrToInt(edSearchPESSOAFINVEN.Text),
                                     StrToInt(edSearchProdutosini.Text) ,
                                     StrToInt(edSearchProdutosfin.Text) ,
                                     edSearchDATAINIVEN.DateTime,
                                     edSearchDATAFINVEN.DateTime);

  mm.varC_caminhopdf :=  RELATORIO_RELATORIOSALDOEFEP(
                                                       MM.varI_Code_Company     ,
                                                       edSearchProdutosini.Text ,
                                                       edSearchProdutosfin.Text ,
                                                       edSearchPESSOAINIVEN.Text,
                                                       edSearchPESSOAFINVEN.Text,
                                                       edSearchDATAINIVEN.Text  ,
                                                       edSearchDATAFINVEN.Text  ,
                                                       psql);

  unfImpressao.ShowModal();
end;

procedure TfrmRELATORIOSALDOEFEP.edSearchDATAINIVENExit(Sender: TObject);
begin
  edSearchDATAFINVEN.DateTime   := EndofTheMonth(edSearchDATAINIVEN.DateTime);
end;

procedure TfrmRELATORIOSALDOEFEP.edSearchProdutosfinButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchProdutosfin.Text := Codigo;
    end);
end;

procedure TfrmRELATORIOSALDOEFEP.edSearchProdutosiniButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchProdutosini.Text := Codigo;
      edSearchProdutosfin.Text := Codigo;
    end);
end;

procedure TfrmRELATORIOSALDOEFEP.edSearchPESSOAFINVENButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('PESSOAS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPESSOAFINVEN.Text := Codigo;
    end);
end;

procedure TfrmRELATORIOSALDOEFEP.edSearchPESSOAINIVENButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('PESSOAS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPESSOAINIVEN.Text := Codigo;
      edSearchPESSOAFINVEN.Text := Codigo;
    end);
end;

procedure TfrmRELATORIOSALDOEFEP.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

Initialization
   RegisterClass( TfrmRELATORIOSALDOEFEP );
end.
