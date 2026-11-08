unit untFrmCOMISSAOBAIXAEFETUADA; //8.0.0.0

// =====================================================================
// untFrmCOMISSAOBAIXAEFETUADA — conversão 3.0 -> 8.0 + redesign
// (molde §45.1: modal de relatórios, visual da casa)
// - RECEITA MODAL 3 PATAS (§45): (1) menu: rc_BuildMenuItem( '', 0,
//   'Comissão por Baixa Efetuada frm:comissaobaixaefetuada modal:' );
//   (2) pas: class(TfrmGenericModalForm) + untGenericModalForm no uses +
//   UniFormResize re-forçando 282x820 + poScreenCenter + OnReady vazio;
//   (3) dfm: Hint [[modal:]] + bsSingle/biSystemMenu + OnResize=UniFormResize.
//   Par de medidas: design 594x220 <-> runtime 820x282 (2 linhas de filtros).
// - Sem PageControl: aba virou ScrollBox na raiz — subtítulo carrega o nome.
// - Ganchos 3.0 preservados: ESCRITA_COMISSAOBAIXAEFETUADA (mkm_relatorios;
//   empresa INT + funcionario ini/fin TEXTO + datas TDateTime) ->
//   RELATORIO_COMISSAOBAIXAEFETUADA (mkm_impressao; empresa + datas
//   TDateTime + sql; SEM faixa de funcionarios) -> unfImpressao.
// - Pesquisas: NOVA untPesquisaGenerica (§46) — FUNCIONARIOS x2 (os edits
//   "PESSOA" pesquisam funcionários, verbatim 3.0). INI preenche FIN.
// - Defaults 3.0 (Show): DataIni=inicio do mes, DataFin=hoje; faixas
//   00001 / 9999999 (7 noves, verbatim).
// - Destroy 3.0 limpa SOMENTE varC_Form_Modal (sem varA_relatorio) —
//   preservado verbatim.
// - Centralizacao do 3.0 (UniFormReady/Top) suplantada pelo poScreenCenter.
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
  TfrmCOMISSAOBAIXAEFETUADA = class(TfrmGenericModalForm)
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
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure edSearchPESSOAINIVENButtonClick(Sender: TObject);
    procedure edSearchPESSOAFINVENButtonClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmCOMISSAOBAIXAEFETUADA: TfrmCOMISSAOBAIXAEFETUADA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web, untDM_RC, mkm_layout,
  mkm_impressao, mkm_relatorios, System.DateUtils, unReportImpressao,
  untPesquisaGenerica;

function frmCOMISSAOBAIXAEFETUADA: TfrmCOMISSAOBAIXAEFETUADA;
begin
  Result := TfrmCOMISSAOBAIXAEFETUADA(mm.GetFormInstance(TfrmCOMISSAOBAIXAEFETUADA));
end;

//8.0.0.0 receita modal §45 (padrão RELATORIO_SALDOBENENOTAS)
procedure TfrmCOMISSAOBAIXAEFETUADA.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
end;

procedure TfrmCOMISSAOBAIXAEFETUADA.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmCOMISSAOBAIXAEFETUADA.UniFormReady(Sender: TObject);
begin
  // 3.0 centralizava por Top aqui — no 8.0 o poScreenCenter da receita §45
  // (UniFormResize) supre o centro. Reservado p/ ajuste fino de geometria.
end;

procedure TfrmCOMISSAOBAIXAEFETUADA.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 sem Constraints (regra 40b) — re-força o tamanho do design
//  frmCOMISSAOBAIXAEFETUADA.Height   := 282;
 // frmCOMISSAOBAIXAEFETUADA.Width    := 820;
 // frmCOMISSAOBAIXAEFETUADA.Position := poScreenCenter;
end;

procedure TfrmCOMISSAOBAIXAEFETUADA.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmCOMISSAOBAIXAEFETUADA.UniFormShow(Sender: TObject);
begin
  edSearchDATAINIVEN.DateTime         := StartofTheMonth(date);
  edSearchDATAFINVEN.DateTime         := Date;
end;

procedure TfrmCOMISSAOBAIXAEFETUADA.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := ESCRITA_COMISSAOBAIXAEFETUADA(mm.varI_Code_Company,
                                        edSearchPESSOAINIVEN.Text,
                                        edSearchPESSOAFINVEN.Text,
                                        edSearchDATAINIVEN.DateTime,
                                        edSearchDATAFINVEN.DateTime);

  mm.varC_caminhopdf :=  RELATORIO_COMISSAOBAIXAEFETUADA(
                                        MM.varI_Code_Company,
                                        edSearchDATAINIVEN.DateTime,
                                        edSearchDATAFINVEN.DateTime,
                                        psql);

  unfImpressao.ShowModal();
end;

procedure TfrmCOMISSAOBAIXAEFETUADA.edSearchPESSOAFINVENButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('FUNCIONARIOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPESSOAFINVEN.Text := Codigo;
    end);
end;

procedure TfrmCOMISSAOBAIXAEFETUADA.edSearchPESSOAINIVENButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('FUNCIONARIOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPESSOAINIVEN.Text := Codigo;
      edSearchPESSOAFINVEN.Text := Codigo;
    end);
end;

procedure TfrmCOMISSAOBAIXAEFETUADA.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

Initialization
   RegisterClass( TfrmCOMISSAOBAIXAEFETUADA );
end.
