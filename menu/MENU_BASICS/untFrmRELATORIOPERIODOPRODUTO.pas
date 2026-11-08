unit untFrmRELATORIOPERIODOPRODUTO; //8.0.0.0

// =====================================================================
// untFrmRELATORIOPERIODOPRODUTO — conversão 3.0 -> 8.0 + redesign
// (molde §45.1: modal de relatórios, visual da casa)
// - RECEITA MODAL 3 PATAS (§45): (1) menu: rc_BuildMenuItem( '', 0,
//   'Relatorio por Periodo de Produtos frm:relatorioperiodoproduto modal:' );
//   (2) pas: class(TfrmGenericModalForm) + untGenericModalForm no uses +
//   UniFormResize re-forçando 525x820 + poScreenCenter + OnReady vazio;
//   (3) dfm: Hint [[modal:]] + bsSingle/biSystemMenu + OnResize=UniFormResize.
//   Par de medidas: design 594x483 <-> runtime 820x525 (4 linhas de filtros:
//   datas+resumo, produtos, tipo/ordem/status, grid de situacoes).
// - Sem PageControl: aba 'Relatório Vendas' virou ScrollBox na raiz —
//   subtítulo carrega o nome da aba.
// - Ganchos 3.0 preservados (datas TEXTO): RELATORIO_VENDASPERIODO_PRODUTOS
//   (mkm_relatorios; 15 params string: datas, produto ini/fin, resumo, tipo,
//   ordem, status + 6 situacoes) -> RELATORIO_Vendasporperiodoprodutos
//   (mkm_impressao; empresa, sql, resumo, datas, status) -> unfImpressao.
// - BUG CHECKBOX DUPLICADA corrigido (mesma família RELATORIOS/CRESCIMENTO):
//   a 3.0 passava TROCA 2x (param 14 e 15) e OUTROS nunca chegava ao SQL.
//   Aqui o 15o param (routros) recebe UniCheckBoxOUTROS.
// - Nomes 3.0 preservados: edits "PESSOAINI/FINVEN" filtram PRODUTOS
//   (Seta_Busca('PRODUTOS') na 3.0) — PesquisarCadastro('PRODUTOS') aqui.
//   INI NAO preenche FIN (verbatim 3.0). FIN default '99999'.
// - Feature 3.0 preservada: OnExit da Data Inicial -> Data Final =
//   EndOfTheMonth. Resumo marca/desmarca o painel Produtos Final
//   (UniContainerPanelprofinal nasce Visible=False, verbatim).
// - Defaults 3.0 (Show): DataIni=inicio do mes, DataFin=hoje; tipo=0,
//   ordem=2 ('Produtos'), status=0; VENDAS marcada. Combos verbatim.
// - Centralizacao do 3.0 (UniFormReady/Top) suplantada pelo poScreenCenter.
// =====================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniGUIBaseClasses,
  uniLabel, uniEdit, UniButtonEdit, uniButton, uniBitBtn,
  uniDateTimePicker, uniMultiItem, uniComboBox, uniCheckBox, uniScrollBox,
  untGenericModalForm;   //8.0: ancestral que governa o tamanho do modal

type
  TfrmRELATORIOPERIODOPRODUTO = class(TfrmGenericModalForm)
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
    UniCheckBoxresumo: TUniCheckBox;
    rcBlock34: TUniContainerPanel;
    UniLabel2: TUniLabel;
    edSearchPESSOAINIVEN: TUniButtonEdit;
    rcBlock36: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edSearchPESSOAFINVEN: TUniButtonEdit;
    rcBlock40: TUniContainerPanel;
    UniLabelFd1: TUniLabel;
    cbxtipo: TUniComboBox;
    rcBlock43: TUniContainerPanel;
    UniLabel4: TUniLabel;
    cbxordem: TUniComboBox;
    rcBlock46: TUniContainerPanel;
    UniLabel5: TUniLabel;
    cbxstatus: TUniComboBox;
    rcBlock49: TUniContainerPanel;
    UniCheckBoxVENDAS: TUniCheckBox;
    UniCheckBoxDEVOLUCAO: TUniCheckBox;
    UniCheckBoxVENDASEF: TUniCheckBox;
    UniCheckBoxBONIFICACAO: TUniCheckBox;
    UniCheckBoxTROCA: TUniCheckBox;
    UniCheckBoxOUTROS: TUniCheckBox;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure edSearchDATAINIVENExit(Sender: TObject);
    procedure UniCheckBoxresumoChange(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure edSearchPESSOAINIVENButtonClick(Sender: TObject);
    procedure edSearchPESSOAFINVENButtonClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
     bCompras: Boolean; //§49: false=Venda (default) / true=Compras (menu 'Compras...')
     { Private declarations }
  public
    { Public declarations }
  end;

function FrmRELATORIOPERIODOPRODUTO: TfrmRELATORIOPERIODOPRODUTO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web, untDM_RC, mkm_layout,
  mkm_impressao, mkm_relatorios, System.DateUtils, unReportImpressao,
  untPesquisaGenerica;

function FrmRELATORIOPERIODOPRODUTO: TfrmRELATORIOPERIODOPRODUTO;
begin
  Result := TfrmRELATORIOPERIODOPRODUTO(mm.GetFormInstance(TfrmRELATORIOPERIODOPRODUTO));
end;

//8.0.0.0 receita modal §45 (padrão SALDOEFEP/CONTROLEITENSEF)
procedure TfrmRELATORIOPERIODOPRODUTO.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
end;

procedure TfrmRELATORIOPERIODOPRODUTO.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmRELATORIOPERIODOPRODUTO.UniFormReady(Sender: TObject);
begin
  // 3.0 centralizava por Top aqui — no 8.0 o poScreenCenter da receita §45
  // (UniFormResize) supre o centro. Reservado p/ ajuste fino de geometria.
end;

procedure TfrmRELATORIOPERIODOPRODUTO.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 sem Constraints (regra 40b) — re-força o tamanho do design
//  TfrmRELATORIOPERIODOPRODUTO.Height   := 525;
//  TfrmRELATORIOPERIODOPRODUTO.Width    := 820;
//  TfrmRELATORIOPERIODOPRODUTO.Position := poScreenCenter;
end;

procedure TfrmRELATORIOPERIODOPRODUTO.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmRELATORIOPERIODOPRODUTO.UniFormShow(Sender: TObject);
begin
  edSearchDATAINIVEN.DateTime         := StartofTheMonth(date);
  edSearchDATAFINVEN.DateTime         := Date;

  cbxtipo.ItemIndex     := 0;
  cbxordem.ItemIndex    := 2;
  cbxstatus.ItemIndex   := 0;

  UniCheckBoxVENDAS.Checked    := True;

  bCompras := Pos('compra', LowerCase(mm.varC_SelectedItem_FSideMenu)) > 0;
  if bCompras then
  begin
    Caption              := 'Compras de Produtos';
    labTitulo.Caption    := '<i class="fas fa-boxes" style="color:#2f8a4c;"></i>  Compras de Produtos';
    labSubtitulo.Caption := 'Compras — período, produtos, tipo, ordem e situações';
  end;

end;

procedure TfrmRELATORIOPERIODOPRODUTO.edSearchDATAINIVENExit(Sender: TObject);
begin
  edSearchDATAFINVEN.DateTime   := EndofTheMonth(edSearchDATAINIVEN.DateTime);
end;

procedure TfrmRELATORIOPERIODOPRODUTO.UniCheckBoxresumoChange(Sender: TObject);
begin
  if UniCheckBoxresumo.Checked then
    rcBlock36.Visible := true
  else
    rcBlock36.Visible := False;
end;

procedure TfrmRELATORIOPERIODOPRODUTO.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin

if bCompras then
  begin

  psql := RELATORIO_VENDASPERIODO_PRODUTOS(mm.varI_Code_Company,
                                            edSearchDATAINIVEN.Text,
                                            edSearchDATAFINVEN.text,
                                            edSearchPESSOAINIVEN.Text,
                                            edSearchPESSOAFINVEN.Text,
                                            variif(UniCheckBoxresumo.Checked      = True,'T','F'),
                                            IntToStr(cbxtipo.ItemIndex),
                                            IntToStr(cbxordem.ItemIndex),
                                            IntToStr(cbxstatus.ItemIndex),
                                            variif(UniCheckBoxVENDAS.Checked      = True,'T','F'),
                                            variif(UniCheckBoxDEVOLUCAO.Checked   = True,'T','F'),
                                            variif(UniCheckBoxVENDASEF.Checked    = True,'T','F'),
                                            variif(UniCheckBoxBONIFICACAO.Checked = True,'T','F'),
                                            variif(UniCheckBoxTROCA.Checked       = True,'T','F'),
                                            variif(UniCheckBoxOUTROS.Checked      = True,'T','F'));

  mm.varC_caminhopdf :=  RELATORIO_Vendasporperiodoprodutos(
                         MM.varI_Code_Company,
                         psql,
                         variif(UniCheckBoxresumo.Checked      = True,'T','F'),
                         edSearchDATAINIVEN.Text,
                         edSearchDATAFINVEN.text,
                         IntToStr(cbxstatus.ItemIndex));
  end
  else
  begin

  end;

  unfImpressao.ShowModal();
end;

procedure TfrmRELATORIOPERIODOPRODUTO.edSearchPESSOAFINVENButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPESSOAFINVEN.Text := Codigo;
    end);
end;

procedure TfrmRELATORIOPERIODOPRODUTO.edSearchPESSOAINIVENButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPESSOAINIVEN.Text := Codigo;
    end);
end;

procedure TfrmRELATORIOPERIODOPRODUTO.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

Initialization
   RegisterClass( TfrmRELATORIOPERIODOPRODUTO );
end.
