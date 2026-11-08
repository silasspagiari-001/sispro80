unit untFrmRELACAOENTREGAS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniMultiItem, uniComboBox, uniButton, uniBitBtn,
  uniEdit, UniButtonEdit, uniDateTimePicker, uniLabel, uniGUIBaseClasses,
  uniPanel;

type
  TfrmRELACAOENTREGAS = class(TUniForm)
    rcBlock40: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchDATAINIVEN: TUniDateTimePicker;
    rcBlock50: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edSearchDATAFINVEN: TUniDateTimePicker;
    rcBlock60: TUniContainerPanel;
    UniLabel2: TUniLabel;
    edSearchPESSOAINIVEN: TUniButtonEdit;
    rcBlock70: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edSearchPESSOAFINVEN: TUniButtonEdit;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    rcBlock30: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    rcBlock80: TUniContainerPanel;
    cbxtipodoc: TUniComboBox;
    UniLabel4: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    cbxtipoentrega: TUniComboBox;
    UniLabel5: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniButtonEditPRODUTOENTINI: TUniButtonEdit;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniButtonEditPRODUTOENTFIN: TUniButtonEdit;
    UniContainerPanel4: TUniContainerPanel;
    UniComboBoxUF: TUniComboBox;
    UniLabel8: TUniLabel;
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure edSearchPESSOAINIVENButtonClick(Sender: TObject);
    procedure edSearchPESSOAFINVENButtonClick(Sender: TObject);
    procedure UniButtonEditPRODUTOENTINIButtonClick(Sender: TObject);
    procedure UniButtonEditPRODUTOENTFINButtonClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRELACAOENTREGAS: TfrmRELACAOENTREGAS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_relatorios, mkm_impressao,
  unReportImpressao, mkm_funcoes, System.DateUtils, mkm_func_web,
  untFrmPesquisa;

function frmRELACAOENTREGAS: TfrmRELACAOENTREGAS;
begin
  Result := TfrmRELACAOENTREGAS(mm.GetFormInstance(TfrmRELACAOENTREGAS));
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

procedure TfrmRELACAOENTREGAS.edSearchPESSOAINIVENButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchPESSOAINIVEN.Text := MM.varC_codigo_busca;
       edSearchPESSOAFINVEN.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmRELACAOENTREGAS.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmRELACAOENTREGAS.UniButtonEditPRODUTOENTFINButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditPRODUTOENTFIN.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmRELACAOENTREGAS.UniButtonEditPRODUTOENTINIButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditPRODUTOENTINI.Text := MM.varC_codigo_busca;
       UniButtonEditPRODUTOENTFIN.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmRELACAOENTREGAS.UniFormCreate(Sender: TObject);
begin
  edSearchDATAINIVEN.Text := DateToStr(StartOfTheMonth(date));
  edSearchDATAFINVEN.Text := DateToStr(EndOfMonth(StrToDate(edSearchDATAINIVEN.Text)));

  cbxtipodoc.ItemIndex        := 0;
  cbxtipoentrega.ItemIndex    := 0;
end;

procedure TfrmRELACAOENTREGAS.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;
procedure TfrmRELACAOENTREGAS.UniFormShow(Sender: TObject);
begin
  UniComboBoxUF.ItemIndex := 30;
end;

Initialization
   RegisterClass( TfrmRELACAOENTREGAS );
end.
