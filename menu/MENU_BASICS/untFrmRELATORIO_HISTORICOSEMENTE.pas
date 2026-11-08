unit untFrmRELATORIO_HISTORICOSEMENTE; //8.0.0.0

// =====================================================================
// untFrmRELATORIO_HISTORICOSEMENTE — conversão 3.0 -> 8.0
// CLONE DO MOLDE CANONICO §45.1 (untFrmRELATORIO_LOTE, versão do usuario).
// - Ganchos 3.0 preservados (assinaturas conferidas):
//   ESCRITA_HISTORICOSEMENTE (mkm_relatorios; dataini,datafin:TDateTime +
//   produto ini/fin) -> IMPRESSAO_historicosemente (mkm_impressao; datas em
//   .Text + produtos + sql) -> unfImpressao.ShowModal.
// - Pesquisa de produto: untPesquisaGenerica preset PRODUTOS (§46).
// - Defaults: 1º do mês -> hoje (UniFormShow, como na 3.0).
// =====================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses,
  uniPanel, uniEdit, UniButtonEdit, uniDateTimePicker, uniLabel,
  uniMultiItem, uniComboBox, uniScrollBox,
  untGenericModalForm;   //8.0: ancestral que governa o tamanho do modal

type
  TfrmRELATORIO_HISTORICOSEMENTE = class(TfrmGenericModalForm)
    paTitulo: TUniContainerPanel;
    labTitulo: TUniLabel;
    labSubtitulo: TUniLabel;
    UniScrollBox1: TUniScrollBox;
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
    procedure edSearchPRODUTOSINIButtonClick(Sender: TObject);
    procedure edSearchPRODUTOSFINButtonClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRELATORIO_HISTORICOSEMENTE: TfrmRELATORIO_HISTORICOSEMENTE;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untPesquisaGenerica, System.DateUtils,
  mkm_func_web, untDM_RC, mkm_layout,
  mkm_impressao, unReportImpressao, mkm_relatorios;

function frmRELATORIO_HISTORICOSEMENTE: TfrmRELATORIO_HISTORICOSEMENTE;
begin
  Result := TfrmRELATORIO_HISTORICOSEMENTE(mm.GetFormInstance(TfrmRELATORIO_HISTORICOSEMENTE));
end;

//8.0.0.0 receita modal §45.1 (molde untFrmRELATORIO_LOTE)
procedure TfrmRELATORIO_HISTORICOSEMENTE.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
end;

procedure TfrmRELATORIO_HISTORICOSEMENTE.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmRELATORIO_HISTORICOSEMENTE.UniFormReady(Sender: TObject);
begin
  // reservado p/ ajuste fino de geometria (padrão modal RC)
end;

procedure TfrmRELATORIO_HISTORICOSEMENTE.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 sem Constraints (regra 40b) — re-força o tamanho do design
  frmRELATORIO_HISTORICOSEMENTE.Height   := 282;
  frmRELATORIO_HISTORICOSEMENTE.Width    := 820;
  frmRELATORIO_HISTORICOSEMENTE.Position := poScreenCenter;
end;

procedure TfrmRELATORIO_HISTORICOSEMENTE.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmRELATORIO_HISTORICOSEMENTE.UniFormShow(Sender: TObject);
begin
  edSearchDATAINI.DateTime := StartofTheMonth(date);
  edSearchDATAFIN.DateTime := Date;
end;

procedure TfrmRELATORIO_HISTORICOSEMENTE.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := ESCRITA_HISTORICOSEMENTE(mm.varI_Code_Company,
                                   edSearchDATAINI.DateTime,
                                   edSearchDATAFIN.DateTime,
                                   edSearchPRODUTOSINI.Text,
                                   edSearchPRODUTOSFIN.Text);

  mm.varC_caminhopdf :=  IMPRESSAO_historicosemente(
                         MM.varI_Code_Company,
                         edSearchDATAINI.Text,
                         edSearchDATAFIN.text,
                         edSearchPRODUTOSINI.Text,
                         edSearchPRODUTOSFIN.Text,
                         psql);

  unfImpressao.ShowModal();
end;

procedure TfrmRELATORIO_HISTORICOSEMENTE.edSearchPRODUTOSFINButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPRODUTOSFIN.Text := Codigo;
    end);
end;

procedure TfrmRELATORIO_HISTORICOSEMENTE.edSearchPRODUTOSINIButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPRODUTOSINI.Text := Codigo;
    end);
end;

procedure TfrmRELATORIO_HISTORICOSEMENTE.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

Initialization
   RegisterClass( TfrmRELATORIO_HISTORICOSEMENTE );
end.
