unit untFrmCRESCIMENTOFATEMPRESA; //8.0.0.0

// =====================================================================
// untFrmCRESCIMENTOFATEMPRESA — conversão 3.0 -> 8.0 + redesign
// (molde §45 confirmado: modal de relatórios, visual da casa)
// - RECEITA MODAL 3 PATAS (§45): (1) menu: rc_BuildMenuItem( '', 0,
//   '<Caption> frm:crescimentoFatEmpresa modal:' ); (2) pas:
//   class(TfrmGenericModalForm) + untGenericModalForm no uses + UniFormResize
//   re-forçando 312x820 + poScreenCenter + OnReady vazio; (3) dfm: Hint
//   [[modal:]] + bsSingle/biSystemMenu + OnResize=UniFormResize.
// - Sem PageControl (aba 'vendas' virou ScrollBox na raiz — lição do vão).
// - BUG CORRIGIDO (mesma família do RELATORIOS): o 8º param (routros) de
//   ESCRITA_CRESCIMENTOTENDECIA recebia UniCheckBoxTROCA 2x — agora recebe
//   UniCheckBoxOUTROS (a flag ficava ignorada).
// - Ganchos 3.0 preservados: ESCRITA_CRESCIMENTOTENDECIA (mkm_relatorios) ->
//   RELATORIO_CRESCIMENTOTENDECIA (mkm_impressao) -> unfImpressao.ShowModal;
//   defaults no UniFormShow (tipo=Nota, VENDAS+VENDASEF); UniScreenMask1;
//   ModalResult mrOK no Sair; RegisterClass.
// =====================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniCheckBox, uniLabel, uniMultiItem,
  uniComboBox, uniPanel, uniGUIBaseClasses, uniButton, uniBitBtn,
  uniScreenMask, uniScrollBox,
  untGenericModalForm;   //8.0: ancestral que governa o tamanho do modal

type
  TFrmCRESCIMENTOFATEMPRESA = class(TfrmGenericModalForm)
    paTitulo: TUniContainerPanel;
    labTitulo: TUniLabel;
    labSubtitulo: TUniLabel;
    UniScrollBox1: TUniScrollBox;
    rcBlock30: TUniContainerPanel;
    UniLabelFd1: TUniLabel;
    cbxtipo: TUniComboBox;
    rcBlock80: TUniContainerPanel;
    UniCheckBoxVENDAS: TUniCheckBox;
    UniCheckBoxDEVOLUCAO: TUniCheckBox;
    UniCheckBoxVENDASEF: TUniCheckBox;
    UniCheckBoxBONIFICACAO: TUniCheckBox;
    UniCheckBoxTROCA: TUniCheckBox;
    UniCheckBoxOUTROS: TUniCheckBox;
    paBotoes: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    labRodape: TUniLabel;
    UniScreenMask1: TUniScreenMask;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FrmCRESCIMENTOFATEMPRESA: TFrmCRESCIMENTOFATEMPRESA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web, untDM_RC,
  mkm_layout, mkm_impressao, unReportImpressao, mkm_relatorios;

function FrmCRESCIMENTOFATEMPRESA: TFrmCRESCIMENTOFATEMPRESA;
begin
  Result := TFrmCRESCIMENTOFATEMPRESA(mm.GetFormInstance(TFrmCRESCIMENTOFATEMPRESA));
end;

//8.0.0.0 receita modal §45 (padrão CUSTOPRODUCAO/RELATORIOS)
procedure TFrmCRESCIMENTOFATEMPRESA.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
end;

procedure TFrmCRESCIMENTOFATEMPRESA.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TFrmCRESCIMENTOFATEMPRESA.UniFormReady(Sender: TObject);
begin
  // reservado p/ ajuste fino de geometria (padrão modal RC)
end;

procedure TFrmCRESCIMENTOFATEMPRESA.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 sem Constraints (regra 40b) — re-força o tamanho do design
  FrmCRESCIMENTOFATEMPRESA.Height   := 312;
  FrmCRESCIMENTOFATEMPRESA.Width    := 820;
  FrmCRESCIMENTOFATEMPRESA.Position := poScreenCenter;
end;

procedure TFrmCRESCIMENTOFATEMPRESA.UniFormShow(Sender: TObject);
begin
  cbxtipo.ItemIndex            := 0;
  UniCheckBoxVENDAS.Checked    := True;
  UniCheckBoxVENDASEF.Checked  := True;
end;

procedure TFrmCRESCIMENTOFATEMPRESA.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := ESCRITA_CRESCIMENTOTENDECIA(mm.varI_Code_Company,
                                  IntToStr(cbxtipo.ItemIndex),
                                  variif(UniCheckBoxVENDAS.Checked      = True,'T','F'),
                                  variif(UniCheckBoxDEVOLUCAO.Checked   = True,'T','F'),
                                  variif(UniCheckBoxVENDASEF.Checked    = True,'T','F'),
                                  variif(UniCheckBoxBONIFICACAO.Checked = True,'T','F'),
                                  variif(UniCheckBoxTROCA.Checked       = True,'T','F'),
                                  variif(UniCheckBoxOUTROS.Checked      = True,'T','F')); //8.0: era TROCA 2x

  mm.varC_caminhopdf :=  RELATORIO_CRESCIMENTOTENDECIA(
                         MM.varI_Code_Company,
                         cbxtipo.Text,
                         psql);

  unfImpressao.ShowModal();
end;

procedure TFrmCRESCIMENTOFATEMPRESA.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

Initialization
   RegisterClass( TFrmCRESCIMENTOFATEMPRESA );
end.
