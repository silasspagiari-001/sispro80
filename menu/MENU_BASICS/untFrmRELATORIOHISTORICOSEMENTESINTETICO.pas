unit untFrmRELATORIOHISTORICOSEMENTESINTETICO; //8.0.0.0

// =====================================================================
// untFrmRELATORIOHISTORICOSEMENTESINTETICO — conversão 3.0 -> 8.0
// CLONE DO MOLDE CANONICO §45.1 (untFrmRELATORIO_LOTE, versão do usuario):
// GenericModalForm + [[modal:]] + resize 820x324 + PesquisarCadastro nos
// botões (§46) + rcBlocks aninhados em wrapper md-12 + IconCls search.
// - Ganchos 3.0 preservados: RELATORIO_HISTORICOSEMSINTETICO (mkm_relatorios;
//   datas+produto ini/fin+safravalida TEXTO) -> IMPRESSAO_HISTORICOSEMENTESINTETICA
//   (mkm_impressao; datas+sql) -> unfImpressao.ShowModal.
// - Safras carregadas dinamicamente no UniFormShow via SqlPesquisa (sementes.
//   safravalida) + 'TODOS' na pos 0 — comportamento 3.0 mantido.
// - Pesquisa de produto: untPesquisaGenerica preset PRODUTOS (§46); INICIAL
//   preenche FINAL (comport. 3.0). Defaults: 1º do mês -> fim do mês (Create).
// =====================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniEdit, UniButtonEdit,
  uniDateTimePicker, uniLabel, uniPanel, uniGUIBaseClasses,
  uniMultiItem, uniComboBox, uniScrollBox,
  untGenericModalForm,mkm_funcoes;   //8.0: ancestral que governa o tamanho do modal

type
  TFrmRELATORIOHISTORICOSEMENTESINTETICO = class(TfrmGenericModalForm)
    paTitulo: TUniContainerPanel;
    labTitulo: TUniLabel;
    labSubtitulo: TUniLabel;
    UniScrollBox1: TUniScrollBox;
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
    cbxsafra: TUniComboBox;
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
    procedure edSearchPESSOAINIVENButtonClick(Sender: TObject);
    procedure edSearchPESSOAFINVENButtonClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FrmRELATORIOHISTORICOSEMENTESINTETICO: TFrmRELATORIOHISTORICOSEMENTESINTETICO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untPesquisaGenerica, System.DateUtils,
  mkm_func_web, untDM_RC, mkm_layout,
  mkm_impressao, mkm_relatorios, unReportImpressao, mkm_procedures;

function FrmRELATORIOHISTORICOSEMENTESINTETICO: TFrmRELATORIOHISTORICOSEMENTESINTETICO;
begin
  Result := TFrmRELATORIOHISTORICOSEMENTESINTETICO(mm.GetFormInstance(TFrmRELATORIOHISTORICOSEMENTESINTETICO));
end;

//8.0.0.0 receita modal §45.1 (molde untFrmRELATORIO_LOTE)
procedure TFrmRELATORIOHISTORICOSEMENTESINTETICO.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
  edSearchDATAINIVEN.Text := DateToStr(StartOfTheMonth(date));
  edSearchDATAFINVEN.Text := DateToStr(EndOfMonth(StrToDate(edSearchDATAINIVEN.Text)));
end;

procedure TFrmRELATORIOHISTORICOSEMENTESINTETICO.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TFrmRELATORIOHISTORICOSEMENTESINTETICO.UniFormReady(Sender: TObject);
begin
  // reservado p/ ajuste fino de geometria (padrão modal RC)
end;

procedure TFrmRELATORIOHISTORICOSEMENTESINTETICO.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 sem Constraints (regra 40b) — re-força o tamanho do design
  FrmRELATORIOHISTORICOSEMENTESINTETICO.Height   := 324;
  FrmRELATORIOHISTORICOSEMENTESINTETICO.Width    := 820;
  FrmRELATORIOHISTORICOSEMENTESINTETICO.Position := poScreenCenter;
end;

procedure TFrmRELATORIOHISTORICOSEMENTESINTETICO.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TFrmRELATORIOHISTORICOSEMENTESINTETICO.UniFormShow(Sender: TObject);
begin
  SqlPesquisa(
             ' select                ' +
             '   s.safravalida       ' +
             ' from                  ' +
             ' sementes s            ' +
             ' group by 1            ' +
             ' order by 1            ');

  cbxsafra.Clear;
  cbxsafra.Items.Add('TODOS');
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      cbxsafra.Items.Add(dm_rc.sqlBuscas.FindField('SAFRAVALIDA').AsString);
      dm_rc.sqlBuscas.Next;
    end;
  cbxsafra.ItemIndex := 0;
end;

procedure TFrmRELATORIOHISTORICOSEMENTESINTETICO.btnimpressaoClick(
  Sender: TObject);
var
  psql:string;
begin
  psql := RELATORIO_HISTORICOSEMSINTETICO(mm.varI_Code_Company,
                                           edSearchDATAINIVEN.Text,
                                           edSearchDATAFINVEN.Text,
                                           edSearchPESSOAINIVEN.Text,
                                           edSearchPESSOAFINVEN.Text,
                                           Trim(cbxsafra.Text));

  mm.varC_caminhopdf :=  IMPRESSAO_HISTORICOSEMENTESINTETICA(
                         MM.varI_Code_Company,
                         edSearchDATAINIVEN.Text,
                         edSearchDATAFINVEN.Text,
                         psql);

  unfImpressao.ShowModal();
end;

procedure TFrmRELATORIOHISTORICOSEMENTESINTETICO.edSearchPESSOAFINVENButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPESSOAFINVEN.Text := Codigo;
    end);
end;

procedure TFrmRELATORIOHISTORICOSEMENTESINTETICO.edSearchPESSOAINIVENButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPESSOAINIVEN.Text := Codigo;
      edSearchPESSOAFINVEN.Text := Codigo;
    end);
end;

procedure TFrmRELATORIOHISTORICOSEMENTESINTETICO.UniBitBtn1Click(
  Sender: TObject);
begin
  ModalResult := mrOK;
end;

Initialization
   RegisterClass( TFrmRELATORIOHISTORICOSEMENTESINTETICO );
end.
