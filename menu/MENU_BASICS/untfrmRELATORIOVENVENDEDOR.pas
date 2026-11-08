unit untfrmRELATORIOVENVENDEDOR; //8.0.0.0

// =====================================================================
// untfrmRELATORIOVENVENDEDOR — conversão 3.0 -> 8.0 + redesign
// (molde §45 confirmado: modal de relatórios, visual da casa)
// - RECEITA MODAL 3 PATAS (§45): (1) menu: rc_BuildMenuItem( '', 0,
//   '<Caption> frm:relatoriovenvendedor modal:' ); (2) pas:
//   class(TfrmGenericModalForm) + untGenericModalForm no uses + UniFormResize
//   re-forçando 324x820 + poScreenCenter + OnReady vazio; (3) dfm: Hint
//   [[modal:]] + bsSingle/biSystemMenu + OnResize=UniFormResize.
// - Sem PageControl (aba 'vendas' virou ScrollBox na raiz — lição do vão).
// - Ganchos 3.0 preservados: ESCRITA_VENDASVENDEDOR (mkm_relatorios;
//   2 inteiros de vendedor + ordem/tipo + 2 datas) -> RELATORIO_VENDASVENDEDOR
//   (mkm_impressao; sql + TDateTime) -> unfImpressao.ShowModal.
// - Pesquisa de vendedor: NOVA untPesquisaGenerica (§46 — todos os botões):
//   preset FUNCIONARIOS (adicionado na canonica: CODIGO/NOME) e callback
//   TRetornoPesquisa; clique no INICIAL preenche o FINAL (comport. 3.0).
// - Combos verbatim da 3.0: tipo (Pedidos/Nota) e ordem (Numero/Emissão).
// =====================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniMultiItem,
  uniComboBox, uniEdit, UniButtonEdit, uniDateTimePicker, uniLabel,
  uniPanel, uniGUIBaseClasses, uniScrollBox,
  untGenericModalForm;   //8.0: ancestral que governa o tamanho do modal

type
  TfrmRELATORIOVENVENDEDOR = class(TfrmGenericModalForm)
    paTitulo: TUniContainerPanel;
    labTitulo: TUniLabel;
    labSubtitulo: TUniLabel;
    UniScrollBox1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchDATAINIVEN: TUniDateTimePicker;
    rcBlock20: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edSearchDATAFINVEN: TUniDateTimePicker;
    rcBlock30: TUniContainerPanel;
    UniLabel2: TUniLabel;
    edSearchVENDEDORINIVEN: TUniButtonEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edSearchVENDEDORFINVEN: TUniButtonEdit;
    rcBlock50: TUniContainerPanel;
    UniLabelFd1: TUniLabel;
    cbxtipo: TUniComboBox;
    rcBlock60: TUniContainerPanel;
    UniLabel4: TUniLabel;
    cbxordem: TUniComboBox;
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
    procedure edSearchVENDEDORINIVENButtonClick(Sender: TObject);
    procedure edSearchVENDEDORFINVENButtonClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRELATORIOVENVENDEDOR: TfrmRELATORIOVENVENDEDOR;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, System.DateUtils, untPesquisaGenerica,
  mkm_func_web, untDM_RC, mkm_layout,
  mkm_relatorios, mkm_impressao, unReportImpressao;

function frmRELATORIOVENVENDEDOR: TfrmRELATORIOVENVENDEDOR;
begin
  Result := TfrmRELATORIOVENVENDEDOR(mm.GetFormInstance(TfrmRELATORIOVENVENDEDOR));
end;

//8.0.0.0 receita modal §45 (padrão CUSTOPRODUCAO/RELATORIOS)
procedure TfrmRELATORIOVENVENDEDOR.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
end;

procedure TfrmRELATORIOVENVENDEDOR.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmRELATORIOVENVENDEDOR.UniFormReady(Sender: TObject);
begin
  // reservado p/ ajuste fino de geometria (padrão modal RC)
end;

procedure TfrmRELATORIOVENVENDEDOR.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 sem Constraints (regra 40b) — re-força o tamanho do design
  frmRELATORIOVENVENDEDOR.Height   := 324;
  frmRELATORIOVENVENDEDOR.Width    := 820;
  frmRELATORIOVENVENDEDOR.Position := poScreenCenter;
end;

procedure TfrmRELATORIOVENVENDEDOR.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmRELATORIOVENVENDEDOR.UniFormShow(Sender: TObject);
begin
  edSearchDATAINIVEN.DateTime := StartofTheMonth(date);
  edSearchDATAFINVEN.DateTime := Date;

  cbxtipo.ItemIndex           := 0;
  cbxordem.ItemIndex          := 0;
end;

procedure TfrmRELATORIOVENVENDEDOR.btnimpressaoClick(Sender: TObject);
var
  psql : string;
begin
  psql := ESCRITA_VENDASVENDEDOR(mm.varI_Code_Company,
                                  StrToInt(edSearchVENDEDORINIVEN.Text),
                                  StrToInt(edSearchVENDEDORFINVEN.text),
                                  IntToStr(cbxordem.ItemIndex),
                                  IntToStr(cbxtipo.ItemIndex),
                                  edSearchDATAINIVEN.Text,
                                  edSearchDATAFINVEN.Text);

  mm.varC_caminhopdf :=  RELATORIO_VENDASVENDEDOR(
                         MM.varI_Code_Company,
                         psql,
                         edSearchDATAINIVEN.DateTime,
                         edSearchDATAFINVEN.DateTime);

  unfImpressao.ShowModal();
end;

procedure TfrmRELATORIOVENVENDEDOR.edSearchVENDEDORINIVENButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('FUNCIONARIOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchVENDEDORINIVEN.Text := Codigo;
      edSearchVENDEDORFINVEN.Text := Codigo;
    end);
end;

procedure TfrmRELATORIOVENVENDEDOR.edSearchVENDEDORFINVENButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('FUNCIONARIOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchVENDEDORFINVEN.Text := Codigo;
    end);
end;

procedure TfrmRELATORIOVENVENDEDOR.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

Initialization
   RegisterClass( TfrmRELATORIOVENVENDEDOR );
end.
