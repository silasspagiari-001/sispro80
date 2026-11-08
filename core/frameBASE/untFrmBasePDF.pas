unit untFrmBasePDF; // 6.0.0.0 - [PT] Para compatibilizar com MOBILE, o UniURLFrame foi substituido pelo UniPDFFrame. Ele foi mantido para não gerar conflitos com os formulários herdados
                    //            [EN] To be compatible with MOBILE, UniURLFrame was replaced by UniPDFFrame. It has been maintained so as not to generate conflicts with inherited forms
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniURLFrame,
  uniButton, uniGUIBaseClasses, uniPanel, uniEdit,
  uniBitBtn, uniLabel, Data.DB;

type
  TfrmBasePDF = class(TUniForm)
    UniURLFrame1: TUniURLFrame;
    paTitleRegDetail: TUniContainerPanel;
    labTitleFrm: TUniLabel;
    UniPanel1: TUniPanel;
    btnExit: TUniBitBtn;
    btnPDF: TUniBitBtn;
    UniPDFFrame1: TUniPDFFrame;
    procedure UniFormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPDFClick(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmBasePDF: TfrmBasePDF;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule, untdm_rc,
  uMenu_REPORTS, mkm_func_report, mkm_layout;

function frmBasePDF: TfrmBasePDF;
begin
  Result := TfrmBasePDF(mm.GetFormInstance(TfrmBasePDF));
end;
// 6.0.0.0
procedure TfrmBasePDF.btnPDFClick(Sender: TObject);
var
  AUrl: string;
begin
  UniPDFFrame1.PdfURL := AUrl;
end;

procedure TfrmBasePDF.btnExitClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmBasePDF.UniFormCreate(Sender: TObject);
begin
    {$IFDEF RELEASE}
    dm_rc.rc_ProtectForm( Self );
    {$ENDIF}
    dm_rc.rc_RenderControls( Self );
end;

procedure TfrmBasePDF.UniFormReady(Sender: TObject);
begin
     // to solve issue with VertScrollBar Position ( ScrollBox )
     dm_rc.rc_ResizeBlocks( Self );
end;

end.
