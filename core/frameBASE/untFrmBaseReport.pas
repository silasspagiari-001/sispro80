//8.4.0.3//RLReport must be Visible=False to not freeze
unit untFrmBaseReport; // 6.0.0.0 - [PT] Para compatibilizar com MOBILE, o UniURLFrame foi substituido pelo UniPDFFrame. Ele foi mantido para não gerar conflitos com os formulários herdados
                       //            [EN] To be compatible with MOBILE, UniURLFrame was replaced by UniPDFFrame. It has been maintained so as not to generate conflicts with inherited forms

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, RLReport, RLFilters, RLPDFFilter, uniURLFrame,
  uniButton, uniGUIBaseClasses, uniPanel, uniEdit, RLParser, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniBitBtn, uniLabel;

type
  TfrmBaseReport = class(TUniForm)
    RLPDFFilter1: TRLPDFFilter;
    UniURLFrame1: TUniURLFrame;
    ed_Table_ItemSel: TUniEdit;
    ed_FormOrigin: TUniEdit;
    ed_FormOrigin_Tab: TUniEdit;
    ed_Table_Status: TUniEdit;
    ed_Order_Search: TUniEdit;
    ed_Where_Search: TUniEdit;
    ed_CodMaster: TUniEdit;
    RLExpressionParser1: TRLExpressionParser;
    sqlMaster: TFDQuery;
    dsMaster: TDataSource;
    sqlSearchMaster: TFDQuery;
    dsSearchMaster: TDataSource;
    paTitleRegDetail: TUniContainerPanel;
    UniPanel1: TUniPanel;
    UniPDFFrame1: TUniPDFFrame;
    RLReport: TRLReport;
    btnGeneratePDF: TUniBitBtn;
    btnExit: TUniBitBtn;
    labTitleFrm: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnGeneratePDFClick(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmBaseReport: TfrmBaseReport;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule, untdm_rc,
  uMenu_REPORTS, mkm_func_report, mkm_layout;

function frmBaseReport: TfrmBaseReport;
begin
  Result := TfrmBaseReport(mm.GetFormInstance(TfrmBaseReport));
end;
// 6.0.0.0
procedure TfrmBaseReport.btnGeneratePDFClick(Sender: TObject);
var
  AUrl: string;
begin
  // Desativa a Barra de Progresso do RLPDFFilter / Disables the RLPDFFilter Progress Bar
  RLPDFFilter1.ShowProgress := False;
  // Desativa a Barra de Progresso e o Dialog do RLReport / Disables the RLReport Progress Bar and Dialog
  TRLReport( Self.FindComponent( 'RLReport' ) ).ShowProgress := False;
  TRLReport( Self.FindComponent( 'RLReport' ) ).PrintDialog := False;
  // Oculta o RLReport no Form / Hide the RLReport in the Form
  TRLReport( Self.FindComponent( 'RLReport' ) ).Visible := False;
  // Informa o caminho temporario do PDF | Informs the temporary path of the PDF
  TRLReport( Self.FindComponent( 'RLReport' ) ).SaveToFile(sm.NewCacheFileUrl(False, 'pdf', '', '', AUrl, True));
  // Gera o PDF / Generate PDF
  TRLReport( Self.FindComponent( 'RLReport' ) ).Prepare;
  // Mostra o PDF / Shows PDF
  UniPDFFrame1.PdfURL := AUrl;
end;

procedure TfrmBaseReport.btnExitClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmBaseReport.UniFormCreate(Sender: TObject);
begin
     {$IFDEF RELEASE}
     dm_rc.rc_ProtectForm( Self );
     {$ENDIF}
     // para formulários, deve-se efetuar o ResizeBlocks | For forms, resizeblocks should be made
     rc_RenderLayout( Self, true, false, true ); // 6.0.0.0
end;

procedure TfrmBaseReport.UniFormReady(Sender: TObject);
begin
    //dm_rc.rc_ResizeBlocks( Self, true, true );  // 6.0.0.0
end;

procedure TfrmBaseReport.UniFormShow(Sender: TObject);
begin
     btnGeneratePDFClick(self);
end;

end.
