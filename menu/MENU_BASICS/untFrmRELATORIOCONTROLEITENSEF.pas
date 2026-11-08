unit untFrmRELATORIOCONTROLEITENSEF; //8.0.0.0

// =====================================================================
// untFrmRELATORIOCONTROLEITENSEF — conversão 3.0 -> 8.0 + redesign
// (molde §45.1: modal de relatórios, visual da casa)
// - RECEITA MODAL 3 PATAS (§45): (1) menu: rc_BuildMenuItem( '', 0,
//   'Relatório de Controle E.F./E.P frm:relatoriocontroleitensef modal:' );
//   (2) pas: class(TfrmGenericModalForm) + untGenericModalForm no uses +
//   UniFormResize re-forçando 324x820 + poScreenCenter + OnReady vazio;
//   (3) dfm: Hint [[modal:]] + bsSingle/biSystemMenu + OnResize=UniFormResize.
//   Par de medidas: design 594x282 <-> runtime 820x324 (3 linhas de filtros,
//   mesma geometria do HISTORICOSEMENTESINTETICO).
// - Sem PageControl: aba 'Relatório Detalhado' virou ScrollBox na raiz
//   (lição do vão branco) — subtítulo carrega o nome da aba.
// - Ganchos 3.0 preservados: ESCRITA_RELATORIO_ENTREGAFUTURA
//   (mkm_relatorios; empresa + produto/pessoa ini/fin + datas TDateTime)
//   -> RELATORIO_RELATORIO_ENTREGAFUTURA (mkm_impressao; +sql) ->
//   unfImpressao. Datas passam .DateTime (TDateTime), não .Text.
// - Pesquisas: NOVA untPesquisaGenerica (§46) — PESSOAS x2 e PRODUTOS x2.
//   Verbatim 3.0: INI de PESSOAS preenche FIN; INI de PRODUTOS NAO preenche.
// - Defaults (Create) idênticos à 3.0: ambas as datas = hoje.
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
  TfrmRELATORIOCONTROLEITENSEF = class(TfrmGenericModalForm)
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
    UniButtonEditprodini: TUniButtonEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniButtonEditprodfin: TUniButtonEdit;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure edSearchPESSOAINIVENButtonClick(Sender: TObject);
    procedure edSearchPESSOAFINVENButtonClick(Sender: TObject);
    procedure UniButtonEditprodiniButtonClick(Sender: TObject);
    procedure UniButtonEditprodfinButtonClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRELATORIOCONTROLEITENSEF: TfrmRELATORIOCONTROLEITENSEF;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web, untDM_RC, mkm_layout,
  mkm_impressao, mkm_relatorios, unReportImpressao,
  untPesquisaGenerica;

function frmRELATORIOCONTROLEITENSEF: TfrmRELATORIOCONTROLEITENSEF;
begin
  Result := TfrmRELATORIOCONTROLEITENSEF(mm.GetFormInstance(TfrmRELATORIOCONTROLEITENSEF));
end;

//8.0.0.0 receita modal §45 (padrão HISTORICOSEMENTESINTETICO)
procedure TfrmRELATORIOCONTROLEITENSEF.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );

  edSearchDATAINIVEN.DateTime := date;
  edSearchDATAFINVEN.DateTime := date;
end;

procedure TfrmRELATORIOCONTROLEITENSEF.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmRELATORIOCONTROLEITENSEF.UniFormReady(Sender: TObject);
begin
  // reservado p/ ajuste fino de geometria (padrão modal RC)
end;

procedure TfrmRELATORIOCONTROLEITENSEF.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 sem Constraints (regra 40b) — re-força o tamanho do design
  frmRELATORIOCONTROLEITENSEF.Height   := 324;
  frmRELATORIOCONTROLEITENSEF.Width    := 820;
  frmRELATORIOCONTROLEITENSEF.Position := poScreenCenter;
end;

procedure TfrmRELATORIOCONTROLEITENSEF.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmRELATORIOCONTROLEITENSEF.btnimpressaoClick(Sender: TObject);
var
  psql :string;
begin
  psql := ESCRITA_RELATORIO_ENTREGAFUTURA(mm.varI_Code_Company,
                                          StrToInt(UniButtonEditprodini.Text),
                                          StrToInt(UniButtonEditprodfin.text),
                                          StrToInt(edSearchPESSOAINIVEN.Text),
                                          StrToInt(edSearchPESSOAFINVEN.Text),
                                          edSearchDATAINIVEN.DateTime,
                                          edSearchDATAFINVEN.DateTime);

  mm.varC_caminhopdf :=  RELATORIO_RELATORIO_ENTREGAFUTURA(mm.varI_Code_Company,
                                          StrToInt(UniButtonEditprodini.Text),
                                          StrToInt(UniButtonEditprodfin.text),
                                          StrToInt(edSearchPESSOAINIVEN.Text),
                                          StrToInt(edSearchPESSOAFINVEN.Text),
                                          edSearchDATAINIVEN.DateTime,
                                          edSearchDATAFINVEN.DateTime,
                                          psql);

  unfImpressao.ShowModal();
end;

procedure TfrmRELATORIOCONTROLEITENSEF.edSearchPESSOAFINVENButtonClick(Sender: TObject);
begin
  PesquisarCadastro('PESSOAS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPESSOAFINVEN.Text := Codigo;
    end);
end;

procedure TfrmRELATORIOCONTROLEITENSEF.edSearchPESSOAINIVENButtonClick(Sender: TObject);
begin
  PesquisarCadastro('PESSOAS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPESSOAINIVEN.Text := Codigo;
      edSearchPESSOAFINVEN.Text := Codigo;
    end);
end;

procedure TfrmRELATORIOCONTROLEITENSEF.UniButtonEditprodfinButtonClick(Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      UniButtonEditprodfin.Text := Codigo;
    end);
end;

procedure TfrmRELATORIOCONTROLEITENSEF.UniButtonEditprodiniButtonClick(Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      UniButtonEditprodini.Text := Codigo;
    end);
end;

procedure TfrmRELATORIOCONTROLEITENSEF.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

Initialization
   RegisterClass( TfrmRELATORIOCONTROLEITENSEF );
end.
