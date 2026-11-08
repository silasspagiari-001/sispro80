unit untFrmRELACAOENTREGAS; //8.0.0.0

// =====================================================================
// untFrmRELACAOENTREGAS — conversão 3.0 -> 8.0 + redesign
// (molde §45.1: modal de relatórios, visual da casa)
// - RECEITA MODAL 3 PATAS (§45): (1) menu: rc_BuildMenuItem( '', 0,
//   'Relação de Entrega(s) frm:relacaoentregas modal:' ); (2) pas:
//   class(TfrmGenericModalForm) + untGenericModalForm no uses + UniFormResize
//   re-forçando 426x820 + poScreenCenter + OnReady vazio; (3) dfm: Hint
//   [[modal:]] + bsSingle/biSystemMenu + OnResize=UniFormResize.
//   Par de medidas: design 594x384 <-> runtime 820x426.
// - Ganchos 3.0 preservados: ESCRITA_RELATORIOENTREGAITENS (mkm_relatorios;
//   empresa + faixa pessoas/produtos + tipo doc/entrega ItemIndex + datas
//   TEXTO + UF TEXTO) -> RELATORIO_RELATORIOENTREGAITENS (mkm_impressao;
//   mesmos filtros + sql) -> unfImpressao.
// - Pesquisas: NOVA untPesquisaGenerica (§46) — PesquisarCadastro com
//   TRetornoPesquisa (dispara sempre; Selecionou=False ao cancelar).
//   Pessoas = preset PESSOAS (novo na canônica; ATIVO='T' da 3.0);
//   Produtos = preset PRODUTOS (§48: SELECT na ordem do SetaGrid).
//   INI preenche FIN (comportamento 3.0).
// - Combos verbatim da 3.0 (alimentam SQL por ItemIndex): tipodoc
//   Notas/Pedidos; tipoentrega Entrege/Disponivel/Todos; UF SP..TODOS.
//   Defaults: datas 1o do mes -> fim do mes + ItemIndex 0 (Create);
//   UF = 30 'TODOS' (Show) — idênticos à 3.0.
// =====================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniGUIBaseClasses,
  uniLabel, uniEdit, UniButtonEdit, uniButton, uniBitBtn, uniMultiItem,
  uniComboBox, uniDateTimePicker, uniScrollBox,
  untGenericModalForm;   //8.0: ancestral que governa o tamanho do modal

type
  TfrmRELACAOENTREGAS = class(TfrmGenericModalForm)
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
    UniLabel6: TUniLabel;
    UniButtonEditPRODUTOENTINI: TUniButtonEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniButtonEditPRODUTOENTFIN: TUniButtonEdit;
    rcBlock43: TUniContainerPanel;
    UniLabel4: TUniLabel;
    cbxtipodoc: TUniComboBox;
    rcBlock46: TUniContainerPanel;
    UniLabel5: TUniLabel;
    cbxtipoentrega: TUniComboBox;
    rcBlock49: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniComboBoxUF: TUniComboBox;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure edSearchPESSOAINIVENButtonClick(Sender: TObject);
    procedure edSearchPESSOAFINVENButtonClick(Sender: TObject);
    procedure UniButtonEditPRODUTOENTINIButtonClick(Sender: TObject);
    procedure UniButtonEditPRODUTOENTFINButtonClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRELACAOENTREGAS: TfrmRELACAOENTREGAS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web, untDM_RC, mkm_layout,
  mkm_relatorios, mkm_impressao, unReportImpressao,
  untPesquisaGenerica, mkm_funcoes, System.DateUtils;

function frmRELACAOENTREGAS: TfrmRELACAOENTREGAS;
begin
  Result := TfrmRELACAOENTREGAS(mm.GetFormInstance(TfrmRELACAOENTREGAS));
end;

//8.0.0.0 receita modal §45 (padrão RELATORIO_LOTE/HISTORICOSEMENTE)
procedure TfrmRELACAOENTREGAS.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );

  edSearchDATAINIVEN.Text := DateToStr(StartOfTheMonth(date));
  edSearchDATAFINVEN.Text := DateToStr(EndOfMonth(StrToDate(edSearchDATAINIVEN.Text)));

  cbxtipodoc.ItemIndex     := 0;
  cbxtipoentrega.ItemIndex := 0;
end;

procedure TfrmRELACAOENTREGAS.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmRELACAOENTREGAS.UniFormReady(Sender: TObject);
begin
  // reservado p/ ajuste fino de geometria (padrão modal RC)
end;

procedure TfrmRELACAOENTREGAS.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 sem Constraints (regra 40b) — re-força o tamanho do design
  frmRELACAOENTREGAS.Height   := 426;
  frmRELACAOENTREGAS.Width    := 820;
  frmRELACAOENTREGAS.Position := poScreenCenter;
end;

procedure TfrmRELACAOENTREGAS.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmRELACAOENTREGAS.UniFormShow(Sender: TObject);
begin
  UniComboBoxUF.ItemIndex := 30; // 'TODOS' (verbatim 3.0)
end;

procedure TfrmRELACAOENTREGAS.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := ESCRITA_RELATORIOENTREGAITENS(mm.varI_Code_Company,
                                         StrToInt(edSearchPESSOAINIVEN.Text),
                                         StrToInt(edSearchPESSOAFINVEN.Text),
                                         StrToInt(UniButtonEditPRODUTOENTINI.Text),
                                         StrToInt(UniButtonEditPRODUTOENTFIN.Text),
                                         cbxtipodoc.ItemIndex,
                                         cbxtipoentrega.ItemIndex,
                                         edSearchDATAINIVEN.Text,
                                         edSearchDATAFINVEN.Text,
                                         UniComboBoxUF.Text);

  mm.varC_caminhopdf :=  RELATORIO_RELATORIOENTREGAITENS(mm.varI_Code_Company,
                                                       StrToInt(edSearchPESSOAINIVEN.Text),
                                                       StrToInt(edSearchPESSOAFINVEN.Text),
                                                       StrToInt(UniButtonEditPRODUTOENTINI.Text),
                                                       StrToInt(UniButtonEditPRODUTOENTFIN.Text),
                                                       cbxtipodoc.ItemIndex,
                                                       cbxtipoentrega.ItemIndex,
                                                       edSearchDATAINIVEN.Text,
                                                       edSearchDATAFINVEN.Text,
                                                       UniComboBoxUF.Text,
                                                       psql);

  unfImpressao.ShowModal();
end;

procedure TfrmRELACAOENTREGAS.edSearchPESSOAFINVENButtonClick(Sender: TObject);
begin
  PesquisarCadastro('PESSOAS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPESSOAFINVEN.Text := Codigo;
    end);
end;

procedure TfrmRELACAOENTREGAS.edSearchPESSOAINIVENButtonClick(Sender: TObject);
begin
  PesquisarCadastro('PESSOAS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      edSearchPESSOAINIVEN.Text := Codigo;
      edSearchPESSOAFINVEN.Text := Codigo;
    end);
end;

procedure TfrmRELACAOENTREGAS.UniButtonEditPRODUTOENTFINButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      UniButtonEditPRODUTOENTFIN.Text := Codigo;
    end);
end;

procedure TfrmRELACAOENTREGAS.UniButtonEditPRODUTOENTINIButtonClick(
  Sender: TObject);
begin
  PesquisarCadastro('PRODUTOS',
    procedure(const Codigo: string; Selecionou: Boolean)
    begin
      if not Selecionou then Exit;
      UniButtonEditPRODUTOENTINI.Text := Codigo;
      UniButtonEditPRODUTOENTFIN.Text := Codigo;
    end);
end;

procedure TfrmRELACAOENTREGAS.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

Initialization
   RegisterClass( TfrmRELACAOENTREGAS );
end.
