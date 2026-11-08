unit untfrmRELATORIOS; //8.0.0.0

// =====================================================================
// untfrmRELATORIOS — conversão 3.0 -> 8.0 + redesign visual (modal de relatórios)
// - Receita modal §43e (padrão FICHA): Hint [[modal:]] + rc_RenderLayout
//   (Self,false,false,false) no OnCreate e (Self,true,true) no OnBeforeShow.
//   No 3.0 os hints cols: dos rcBlocks NUNCA foram renderizados (layout pobre).
// - Visual novo: header c/ título+subtítulo, 820x490, filtros em rcBlocks
//   (6+6, 6+6, 4+4+4, 12), rodapé de botões fixo (§43a), máscaras de data
//   em ClientEvents 1-linha (rota curta), botões com ícones.
// - BUG CORRIGIDO: btnimpressao passava UniCheckBoxTROCA 2x — o 14º param
//   (routros) de RELATORIO_VENDASPERIODO agora recebe UniCheckBoxOUTROS.
// - Ativa_page/Seta_Busca/unfImpressao/varA_relatorio/varC_caminhopdf preservados
//   (ganchos vivos na base 8.0; sem PageControl no redesign; Ativa_page preservado (no-op)).
// =====================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniPageControl, uniEdit, UniButtonEdit, uniDateTimePicker, uniLabel,
  uniMultiItem, uniComboBox, uniCheckBox, uniScrollBox,
  untGenericModalForm;   //8.0: ancestral que governa o tamanho do modal

type
  TfrmRELATORIOS = class(TfrmGenericModalForm)   //8.0: base modal (padrao CUSTOPRODUCAO)
    paTitulo: TUniContainerPanel;
    labTitulo: TUniLabel;
    labSubtitulo: TUniLabel;
    paBotoes: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    labRodape: TUniLabel;
    UniScrollBox1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchDATAINIVEN: TUniDateTimePicker;
    labDataFin: TUniLabel;
    edSearchDATAFINVEN: TUniDateTimePicker;
    labPesIni: TUniLabel;
    edSearchPESSOAINIVEN: TUniButtonEdit;
    labPesFin: TUniLabel;
    edSearchPESSOAFINVEN: TUniButtonEdit;
    labTipo: TUniLabel;
    cbxtipo: TUniComboBox;
    labOrdem: TUniLabel;
    cbxordem: TUniComboBox;
    labStatus: TUniLabel;
    cbxstatus: TUniComboBox;
    labDocTipos: TUniLabel;
    UniCheckBoxVENDAS: TUniCheckBox;
    UniCheckBoxDEVOLUCAO: TUniCheckBox;
    UniCheckBoxVENDASEF: TUniCheckBox;
    UniCheckBoxBONIFICACAO: TUniCheckBox;
    UniCheckBoxTROCA: TUniCheckBox;
    UniCheckBoxOUTROS: TUniCheckBox;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure edSearchPESSOAINIVENButtonClick(Sender: TObject);
    procedure edSearchPESSOAFINVENButtonClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure edSearchDATAINIVENExit(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure Ativa_page(Const F_CADASTROS:String; F_PAGINAS:array of String);

  end;

function frmRELATORIOS: TfrmRELATORIOS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web, mkm_funcoes, untDM_RC,
  mkm_layout, untFrmPesquisa, mkm_impressao, unReportImpressao, mkm_relatorios,
  System.DateUtils;
function frmRELATORIOS: TfrmRELATORIOS;
begin
  Result := TfrmRELATORIOS(mm.GetFormInstance(TfrmRELATORIOS));
end;

procedure TfrmRELATORIOS.Ativa_page(const F_CADASTROS: String;F_PAGINAS: array of String);
var
 x,R : Integer;
begin
  for R := 0 to ComponentCount - 1 do
    if (Components[R] is TUniTabSheet ) then
      begin
        if Busca_Array(Copy((Components[R] as TUniTabSheet).Name,11,12),F_PAGINAS) then
          begin
             if (Components[R] as TUniTabSheet).TabVisible = False then
               (Components[R] as TUniTabSheet).TabVisible := True;
          end
        else
          (Components[R] as TUniTabSheet).TabVisible := False;
      end;

  //8.0.0.0 PageControl/aba unica removidos (design sem tabs): ajuste de paginas
  //virou no-op; o loop Components acima fica inerte sem TUniTabSheet no form.

end;

procedure TfrmRELATORIOS.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := RELATORIO_VENDASPERIODO(mm.varI_Code_Company,
                                  edSearchDATAINIVEN.Text,
                                  edSearchDATAFINVEN.text,
                                  edSearchPESSOAINIVEN.Text,
                                  edSearchPESSOAFINVEN.Text,
                                  IntToStr(cbxtipo.ItemIndex),
                                  IntToStr(cbxordem.ItemIndex),
                                  IntToStr(cbxstatus.ItemIndex),
                                  variif(UniCheckBoxVENDAS.Checked      = True,'T','F'),
                                  variif(UniCheckBoxDEVOLUCAO.Checked   = True,'T','F'),
                                  variif(UniCheckBoxVENDASEF.Checked    = True,'T','F'),
                                  variif(UniCheckBoxBONIFICACAO.Checked = True,'T','F'),
                                  variif(UniCheckBoxTROCA.Checked       = True,'T','F'),
                                  variif(UniCheckBoxOUTROS.Checked      = True,'T','F'));

  mm.varC_caminhopdf :=  RELATORIO_Vendasporperiodo(
                         MM.varI_Code_Company,
                         psql,
                         edSearchDATAINIVEN.Text,
                         edSearchDATAFINVEN.text,
                         IntToStr(cbxstatus.ItemIndex));

  unfImpressao.ShowModal();
end;

procedure TfrmRELATORIOS.edSearchDATAINIVENExit(Sender: TObject);
begin
  edSearchDATAFINVEN.DateTime   := EndofTheMonth(edSearchDATAINIVEN.DateTime);
end;

procedure TfrmRELATORIOS.edSearchPESSOAFINVENButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchPESSOAFINVEN.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmRELATORIOS.edSearchPESSOAINIVENButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchPESSOAINIVEN.Text := MM.varC_codigo_busca;
     end;
   end);
end;

//8.0.0.0 receita modal (padrao FICHA / §43e)
procedure TfrmRELATORIOS.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
end;

procedure TfrmRELATORIOS.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

//8.0.0.0 padrao FICHA: o motor novo estica modais [[modal:]] para tela cheia;
// o OnResize re-forca o tamanho fixo e a centralizacao a cada resize
procedure TfrmRELATORIOS.UniFormResize(Sender: TObject);
begin
  frmRELATORIOS.Height   := 490;
  frmRELATORIOS.Width    := 820;
  frmRELATORIOS.Position := poScreenCenter;
end;


procedure TfrmRELATORIOS.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;
procedure TfrmRELATORIOS.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmRELATORIOS.UniFormReady(Sender: TObject);
begin
  //8.0.0.0 padrao FICHA (OnReady vazio); centralizacao garantida pelo poScreenCenter
end;

procedure TfrmRELATORIOS.UniFormShow(Sender: TObject);
begin
  edSearchDATAINIVEN.DateTime         := StartofTheMonth(date);
  edSearchDATAFINVEN.DateTime         := Date;

  cbxtipo.ItemIndex     := 0;
  cbxordem.ItemIndex    := 0;
  cbxstatus.ItemIndex   := 0;

  UniCheckBoxVENDAS.Checked    := True;
  UniCheckBoxVENDASEF.Checked  := True;
end;

Initialization
   RegisterClass( TfrmRELATORIOS );
end.
