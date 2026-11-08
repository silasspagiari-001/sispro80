unit untfrmImpressaoFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn,
  uniMultiItem, uniComboBox, uniLabel, uniBasicGrid, uniDBGrid, uniSpeedButton;

type
  Tfrmimpressaofinanceiro = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    UniLabel1: TUniLabel;
    cbxSearchCRUDFieldagpfinanceiro: TUniComboBox;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    UniDBGrid1: TUniDBGrid;
    UniSpeedButton1: TUniSpeedButton;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cFormModal         : TUniForm;
  end;

function frmimpressaofinanceiro: Tfrmimpressaofinanceiro;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, unReportImpressao, mkm_impressao,
  mkm_anim,mkm_layout;

function frmimpressaofinanceiro: Tfrmimpressaofinanceiro;
begin
  Result := Tfrmimpressaofinanceiro(mm.GetFormInstance(Tfrmimpressaofinanceiro));
end;

procedure Tfrmimpressaofinanceiro.btnimpressaoClick(Sender: TObject);
begin
  if dm_rc.tbgenerico.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_Financeiro(
                             MM.varSR_tipo,
                             mm.varSR_Dataini,
                             mm.varSR_Datafin,
                             mm.varI_Code_Company,
                             cbxSearchCRUDFieldagpfinanceiro.ItemIndex,
                             dm_rc.tbgenerico);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' );
end;

procedure Tfrmimpressaofinanceiro.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true, true );
end;

procedure Tfrmimpressaofinanceiro.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrmimpressaofinanceiro.UniFormCreate(Sender: TObject);
begin
  cFormModal := mm.varC_Form_Modal;
  cbxSearchCRUDFieldagpfinanceiro.ItemIndex := 0;
end;

procedure Tfrmimpressaofinanceiro.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
  dm_rc.tbgenerico.Close;
end;

procedure Tfrmimpressaofinanceiro.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure Tfrmimpressaofinanceiro.UniFormShow(Sender: TObject);
begin
  if Self.Tag = 0 then
  begin
      Self.Visible := True;
      Self.Top  := 0;

      rc_MoveAnimationForm( self,
                            self.left,
                            self.left,
                            self.top,
                            ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  ),
                            400,
                            1 ) ;
  end
  else
  begin
    Self.Visible := False;
    Self.Top  := -1000;
  end;
  Self.Visible := True;
end;

procedure Tfrmimpressaofinanceiro.UniSpeedButton1Click(Sender: TObject);
begin
  case cbxSearchCRUDFieldagpfinanceiro.ItemIndex of
    0: dm_rc.tbgenerico.IndexFieldNames := 'VENCIMENTO';// TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."VENCIMENTO">';
    1: dm_rc.tbgenerico.IndexFieldNames := 'PAGAMENTO';  //TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."PAGAMENTO">';
    2: dm_rc.tbgenerico.IndexFieldNames := 'PESSOA';     //TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."PESSOA">';
    3: dm_rc.tbgenerico.IndexFieldNames := 'EMISSAO';    //TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."EMISSAO">';
    4: dm_rc.tbgenerico.IndexFieldNames := 'NUMERO';     //TfrxGroupHeader(frxReport.FindObject('GroupHeader1')).Condition        := '<frxDBDataset."NUMERO">';
  end;
dm_rc.tbgenerico.refresh;
end;

end.
