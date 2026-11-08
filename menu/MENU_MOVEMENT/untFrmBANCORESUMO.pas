unit untFrmBANCORESUMO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniDateTimePicker,
  uniLabel, uniScrollBox, uniPageControl, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniGUITypes;

type
  TfrmBANCORESUMO = class(TfrmBase)
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    paGC: TUniContainerPanel;
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    paSearchFilter1: TUniContainerPanel;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    dbgSearchCRUD: TUniDBGrid;
    dsfiltro: TDataSource;
    tbbusca: TFDMemTable;
    tbbuscaPORTADOR: TIntegerField;
    tbbuscaDESCRICAOAPLICACAO: TStringField;
    tbbuscaHISTORICO: TStringField;
    tbbuscaSALDO2: TFloatField;
    tbbuscaSALDOANTERIOR: TFloatField;
    tbbuscaSEQUENCIA: TIntegerField;
    tbbuscaPLANO: TStringField;
    tbbuscaAPLICACAO: TIntegerField;
    tbbuscaEMISSAO: TDateField;
    tbbuscaSERIE: TStringField;
    tbbuscaTIPO: TStringField;
    tbbuscaCREDITO: TFloatField;
    tbbuscaDEBITO: TFloatField;
    tbbuscaSALDO: TFloatField;
    tbbuscadetalhes: TStringField;
    tbbuscaSINAL: TStringField;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    tbbuscaLIMITE: TFloatField;
    procedure btnSearchClick(Sender: TObject);
    procedure labExitClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure tbbuscadetalhesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ativabusca();
  end;

var
  frmBANCORESUMO: TfrmBANCORESUMO;

implementation

{$R *.dfm}

uses MainModule, mkm_funcoes, mkm_regrasnegocio, mkm_func_web, mkm_impressao,
  unReportImpressao, untDM_RC;
{, mkm_func_web TfrmBANCORESUMO }

procedure TfrmBANCORESUMO.ativabusca;
begin
  if not ( dsfiltro.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;

procedure TfrmBANCORESUMO.btnOptionsClick(Sender: TObject);
begin
  inherited;
  if tbbusca.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_bancoresumo(
                             edSearchCRUDDtIni.Text,
                             tbbusca);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' , false );
end;

procedure TfrmBANCORESUMO.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmBANCORESUMO.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;
  tbbusca.Close;
  tbbusca.CopyDataSet(bancoresumo(mm.varI_Code_Company,edSearchCRUDDtIni.DateTime));
  tbbusca.Open;

end;

procedure TfrmBANCORESUMO.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  if (tbbuscaSALDO.AsFloat  < 0 ) then
    attribs.Font.Color:= clRed
  else
  if (tbbuscaSALDO.AsFloat  > 0 ) then
    attribs.Font.Color:= clBlue;
end;

procedure TfrmBANCORESUMO.labExitClick(Sender: TObject);
var
   I, F : integer;

begin

  inherited;

  if mm.oPgGeneral <> nil then
    mm.oPgGeneral.ActivePage.Close;

end;

procedure TfrmBANCORESUMO.tbbuscadetalhesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if tbbuscaSALDO.AsFloat < 0 then
        Text := '<i title="detalhes" class="fa fa-arrow-down"; style="color:red; cursor:pointer;"></i>'
      else
      if tbbuscaSALDO.AsFloat > 0 then
        Text := '<i title="detalhes" class="fa fa-arrow-up"; style="color:blue; cursor:pointer;"></i>'
      else
        Text := '<i title="detalhes" class="fa fa-arrows-h"; style="color:black; cursor:pointer;"></i>';
    end;
end;

procedure TfrmBANCORESUMO.UniFrameCreate(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtIni.DateTime := Date;
  ativabusca();
  btnSearchCRUD.OnClick(Self);
end;

initialization
  RegisterClass(TfrmBANCORESUMO);
end.
