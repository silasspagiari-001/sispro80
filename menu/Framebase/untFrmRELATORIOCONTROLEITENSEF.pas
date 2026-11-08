unit untFrmRELATORIOCONTROLEITENSEF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, UniButtonEdit, uniDateTimePicker,
  uniLabel, uniPanel, uniPageControl, uniButton, uniBitBtn, uniGUIBaseClasses;

type
  TfrmRELATORIOCONTROLEITENSEF = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    rcBlock30: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    UniPageControl: TUniPageControl;
    UniTabSheetvendas: TUniTabSheet;
    UniContainerPanel2: TUniContainerPanel;
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
    UniContainerPanel1: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniButtonEditprodini: TUniButtonEdit;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniButtonEditprodfin: TUniButtonEdit;
    procedure edSearchPESSOAINIVENButtonClick(Sender: TObject);
    procedure edSearchPESSOAFINVENButtonClick(Sender: TObject);
    procedure UniButtonEditprodiniButtonClick(Sender: TObject);
    procedure UniButtonEditprodfinButtonClick(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRELATORIOCONTROLEITENSEF: TfrmRELATORIOCONTROLEITENSEF;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untFrmPesquisa, mkm_impressao, mkm_relatorios,
  unReportImpressao;

function frmRELATORIOCONTROLEITENSEF: TfrmRELATORIOCONTROLEITENSEF;
begin
  Result := TfrmRELATORIOCONTROLEITENSEF(mm.GetFormInstance(TfrmRELATORIOCONTROLEITENSEF));
end;

procedure TfrmRELATORIOCONTROLEITENSEF.btnimpressaoClick(Sender: TObject);
var
  psql :string;
begin
  psql := ESCRITA_RELATORIO_ENTREGAFUTURA(mm.varI_Code_Company,
                                          StrToInt(UniButtonEditprodini.Text),
                                          StrToInt(UniButtonEditprodfin.text),
                                          StrToInt(edSearchPESSOAINIVEN.Text),
                                          StrToInt(edSearchPESSOAFINVEN.Text),
                                          edSearchDATAINIVEN.DateTime,
                                          edSearchDATAFINVEN.DateTime);

  mm.varC_caminhopdf :=  RELATORIO_RELATORIO_ENTREGAFUTURA(mm.varI_Code_Company,
                                          StrToInt(UniButtonEditprodini.Text),
                                          StrToInt(UniButtonEditprodfin.text),
                                          StrToInt(edSearchPESSOAINIVEN.Text),
                                          StrToInt(edSearchPESSOAFINVEN.Text),
                                          edSearchDATAINIVEN.DateTime,
                                          edSearchDATAFINVEN.DateTime,
                                          psql);

  unfImpressao.ShowModal();
end;

procedure TfrmRELATORIOCONTROLEITENSEF.edSearchPESSOAFINVENButtonClick(Sender: TObject);
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

procedure TfrmRELATORIOCONTROLEITENSEF.edSearchPESSOAINIVENButtonClick(Sender: TObject);
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

procedure TfrmRELATORIOCONTROLEITENSEF.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmRELATORIOCONTROLEITENSEF.UniButtonEditprodfinButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditprodfin.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmRELATORIOCONTROLEITENSEF.UniButtonEditprodiniButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditprodini.Text := MM.varC_codigo_busca;
     end;
   end);
end;
procedure TfrmRELATORIOCONTROLEITENSEF.UniFormCreate(Sender: TObject);
begin
  edSearchDATAINIVEN.DateTime := date;
  edSearchDATAFINVEN.DateTime := date;
end;

procedure TfrmRELATORIOCONTROLEITENSEF.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

Initialization
   RegisterClass( TfrmRELATORIOCONTROLEITENSEF );
end.
