unit untFrmRELATORIO_SALDOBENENOTAS; //8.0.0.0

// =====================================================================
// untFrmRELATORIO_SALDOBENENOTAS — conversão 3.0 -> 8.0 + redesign
// (molde §45.1: modal de relatórios, visual da casa)
// - RECEITA MODAL 3 PATAS (§45): (1) menu: rc_BuildMenuItem( '', 0,
//   'Saldo de Produtos por Nota frm:saldobeneficiamento modal:' );
//   (2) pas: class(TfrmGenericModalForm) + untGenericModalForm no uses +
//   UniFormResize re-forçando 282x820 + poScreenCenter + OnReady vazio;
//   (3) dfm: Hint [[modal:]] + bsSingle/biSystemMenu + OnResize=UniFormResize.
//   Par de medidas: design 594x220 <-> runtime 820x282 (2 linhas de filtros,
//   mesma geometria do RELATORIO_HISTORICOSEMENTE).
// - Nome da classe 3.0 PRESERVADO: TfrmSALDOBENEFICIAMENTO (a unit se chama
//   untFrmRELATORIO_SALDOBENENOTAS; o token de menu segue a classe).
// - Ganchos 3.0 preservados: ESCRITA_SALDOBENENOTAS (mkm_relatorios;
//   empresa INT + datas TDateTime + produto ini/fin TEXTO) ->
//   IMPRESSAO_saldobenenotas (mkm_impressao; empresa + datas/produtos TEXTO
//   + sql) -> unfImpressao. Datas: .DateTime na ESCRITA, .Text na IMPRESSAO
//   (padrão HISTORICOSEMENTE).
// - Pesquisas: NOVA untPesquisaGenerica (§46) — PRODUTOS x2.
//   Verbatim 3.0: INI NAO preenche FIN; defaults 00001 / 99999.
// - Defaults 3.0 (Show): DataIni=inicio do mes, DataFin=hoje.
// - TYPO 3.0 CORRIGIDO + documentado: o label sobre o picker da Data FINAL
//   dizia 'Data Inicial' (copy/paste) — agora 'Data Final'.
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
  TfrmSALDOBENEFICIAMENTO = class(TfrmGenericModalForm)
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
    rcBlock31: TUniContainerPanel;
    UniLabel2: TUniLabel;
    edSearchPRODUTOSINI: TUniButtonEdit;
    rcBlock34: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edSearchPRODUTOSFIN: TUniButtonEdit;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure edSearchPRODUTOSFINButtonClick(Sender: TObject);
    procedure edSearchPRODUTOSINIButtonClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmSALDOBENEFICIAMENTO: TfrmSALDOBENEFICIAMENTO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web, untDM_RC, mkm_layout,
  mkm_impressao, mkm_relatorios, System.DateUtils, unReportImpressao,
  untPesquisaGenerica;

function frmSALDOBENEFICIAMENTO: TfrmSALDOBENEFICIAMENTO;
begin
  Result := TfrmSALDOBENEFICIAMENTO(mm.GetFormInstance(TfrmSALDOBENEFICIAMENTO));
end;

//8.0.0.0 receita modal §45 (padrão RELATORIO_HISTORICOSEMENTE)
procedure TfrmSALDOBENEFICIAMENTO.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
end;

procedure TfrmSALDOBENEFICIAMENTO.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmSALDOBENEFICIAMENTO.UniFormReady(Sender: TObject);
begin
  // 3.0 centralizava por Top aqui — no 8.0 o poScreenCenter da receita §45
  // (UniFormResize) supre o centro. Reservado p/ ajuste fino de geometria.
end;

procedure TfrmSALDOBENEFICIAMENTO.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 sem Constraints (regra 40b) — re-força o tamanho do design
//  frmSALDOBENEFICIAMENTO.Height   := 282;
//  frmSALDOBENEFICIAMENTO.Width    := 820;
 // frmSALDOBENEFICIAMENTO.Position := poScreenCenter;
end;

procedure TfrmSALDOBENEFICIAMENTO.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmSALDOBENEFICIAMENTO.UniFormShow(Sender: TObject);
begin
  edSearchDATAINI.DateTime    := StartofTheMonth(date);
  edSearchDATAFIN.DateTime    := Date;
end;

procedure TfrmSALDOBENEFICIAMENTO.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := ESCRITA_SALDOBENENOTAS(mm.varI_Code_Company,
                                   edSearchDATAINI.DateTime,
                                   edSearchDATAFIN.DateTime,
                                   edSearchPRODUTOSINI.Text,
                                   edSearchPRODUTOSFIN.Text);

  mm.varC_caminhopdf :=  IMPRESSAO_saldobenenotas(
                         MM.varI_Code_Company,
                         edSearchDATAINI.Text,
                         edSearchDATAFIN.text,
                         edSearchPRODUTOSINI.Text,
                         edSearchPRODUTOSFIN.Text,
                         psql);

  unfImpressao.ShowModal();
end;

procedure TfrmSALDOBENEFICIAMENTO.edSearchPRODUTOSFINButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPRODUTOSFIN.Text := Codigo;
    end);
end;

procedure TfrmSALDOBENEFICIAMENTO.edSearchPRODUTOSINIButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPRODUTOSINI.Text := Codigo;
    end);
end;

procedure TfrmSALDOBENEFICIAMENTO.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

Initialization
   RegisterClass( TfrmSALDOBENEFICIAMENTO );
end.
