unit untFrmRELATORIO_LOTE; //8.0.0.0

// =====================================================================
// untFrmRELATORIO_LOTE — conversão 3.0 -> 8.0 + redesign
// (molde §45 confirmado: modal de relatórios, visual da casa)
// - RECEITA MODAL 3 PATAS (§45): (1) menu: rc_BuildMenuItem( '', 0,
//   '<Caption> frm:relatorio_lote modal:' ); (2) pas:
//   class(TfrmGenericModalForm) + untGenericModalForm no uses + UniFormResize
//   re-forçando 324x820 + poScreenCenter + OnReady vazio; (3) dfm: Hint
//   [[modal:]] + bsSingle/biSystemMenu + OnResize=UniFormResize.
// - Sem PageControl (aba virou ScrollBox na raiz — lição do vão branco).
// - Ganchos 3.0 preservados: RELATORIO_LOTEBAS (mkm_relatorios; produto
//   ini/fin + saldos/opcoes ItemIndex + categoria TEXTO) ->
//   RELATORIO_ESTOQUELOTE (mkm_impressao; empresa+sql) -> unfImpressao.
// - Pesquisa de produto: NOVA untPesquisaGenerica (pedido do usuario) —
//   PesquisarCadastro('PRODUTOS', callback) com TRetornoPesquisa (dispara
//   sempre; Selecionou=False ao cancelar).
// - Combos verbatim da 3.0 (categoria passa .Text pro SQL: lista EXATA
//   C1,C2,S1,S2,S1+S2,'' preservada); defaults no UniFormShow: categoria=3
//   ('S2'), opcoes=4 (Todos), saldos=3 (Todos) — idênticos à 3.0.
// =====================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniGUIBaseClasses,
  uniLabel, uniEdit, UniButtonEdit, uniButton, uniBitBtn, uniMultiItem,
  uniComboBox, uniScrollBox,
  untGenericModalForm;   //8.0: ancestral que governa o tamanho do modal

type
  TfrmRELATORIO_LOTE = class(TfrmGenericModalForm)
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
    edSearchprodutoINI: TUniButtonEdit;
    rcBlock28: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edSearchprodutoFIN: TUniButtonEdit;
    rcBlock30: TUniContainerPanel;
    UniLabel2: TUniLabel;
    cbxsaldos: TUniComboBox;
    rcBlock40: TUniContainerPanel;
    UniLabel3: TUniLabel;
    cbxopcoes: TUniComboBox;
    rcBlock50: TUniContainerPanel;
    UniLabel4: TUniLabel;
    cbxcategoria: TUniComboBox;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure edSearchprodutoINIButtonClick(Sender: TObject);
    procedure edSearchprodutoFINButtonClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRELATORIO_LOTE: TfrmRELATORIO_LOTE;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web, untDM_RC, mkm_layout,
  mkm_relatorios, mkm_impressao, unReportImpressao, untPesquisaGenerica;

function frmRELATORIO_LOTE: TfrmRELATORIO_LOTE;
begin
  Result := TfrmRELATORIO_LOTE(mm.GetFormInstance(TfrmRELATORIO_LOTE));
end;

//8.0.0.0 receita modal §45 (padrão CUSTOPRODUCAO/RELATORIOS)
procedure TfrmRELATORIO_LOTE.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
end;

procedure TfrmRELATORIO_LOTE.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmRELATORIO_LOTE.UniFormReady(Sender: TObject);
begin
  // reservado p/ ajuste fino de geometria (padrão modal RC)
end;

procedure TfrmRELATORIO_LOTE.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 sem Constraints (regra 40b) — re-força o tamanho do design
  frmRELATORIO_LOTE.Height   := 324;
  frmRELATORIO_LOTE.Width    := 820;
  frmRELATORIO_LOTE.Position := poScreenCenter;
end;

procedure TfrmRELATORIO_LOTE.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmRELATORIO_LOTE.UniFormShow(Sender: TObject);
begin
  cbxcategoria.ItemIndex := 3;
  cbxopcoes.ItemIndex    := 4;
  cbxsaldos.ItemIndex    := 3;
end;

procedure TfrmRELATORIO_LOTE.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := RELATORIO_LOTEBAS(
  mm.varI_Code_Company,
  edSearchprodutoINI.Text,
  edSearchprodutoFIN.Text,
  IntToStr(cbxsaldos.ItemIndex),
  IntToStr(cbxopcoes.ItemIndex),
  cbxcategoria.Text);

  mm.varC_caminhopdf :=  RELATORIO_ESTOQUELOTE(
                         MM.varI_Code_Company,
                         psql);

  unfImpressao.ShowModal();
end;

procedure TfrmRELATORIO_LOTE.edSearchprodutoFINButtonClick(Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchprodutoFIN.Text := Codigo;
    end);
end;

procedure TfrmRELATORIO_LOTE.edSearchprodutoINIButtonClick(Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchprodutoINI.Text := Codigo;
    end);
end;

procedure TfrmRELATORIO_LOTE.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

Initialization
   RegisterClass( TfrmRELATORIO_LOTE );
end.
