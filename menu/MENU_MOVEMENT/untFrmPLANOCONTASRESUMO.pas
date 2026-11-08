unit untFrmPLANOCONTASRESUMO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniEdit, uniDateTimePicker, UniButtonEdit,
  uniLabel, uniScrollBox, uniBasicGrid, uniDBGrid, uniPageControl, uniButton,
  uniBitBtn, uniMultiItem, uniComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniGUITypes;

type
  TfrmPLANOCONTASRESUMO = class(TfrmBase)
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
    dbgSearchCRUD: TUniDBGrid;
    UniScrollBox1: TUniScrollBox;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    paSearchFilter1: TUniContainerPanel;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditplanoini: TUniButtonEdit;
    paSearchOp1: TUniContainerPanel;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    UniButtonEditplanofin: TUniButtonEdit;
    UniLabel1: TUniLabel;
    UniComboBoxmesini: TUniComboBox;
    UniLabel2: TUniLabel;
    UniComboBoxmesfin: TUniComboBox;
    UniLabel3: TUniLabel;
    UniEditano: TUniEdit;
    UniLabel4: TUniLabel;
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
    procedure UniFrameCreate(Sender: TObject);
    procedure tbbuscadetalhesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure labExitClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ativabusca();
  end;

var
  frmPLANOCONTASRESUMO: TfrmPLANOCONTASRESUMO;

implementation

{$R *.dfm}

uses mkm_regrasnegocio, MainModule, mkm_func_web, mkm_impressao,
  unReportImpressao, untDM_RC;

procedure TfrmPLANOCONTASRESUMO.ativabusca;
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

procedure TfrmPLANOCONTASRESUMO.btnOptionsClick(Sender: TObject);
begin
  inherited;
  if tbbusca.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_planoresumo(
                                                   UniButtonEditplanoini.Text,
                                                   UniButtonEditplanofin.Text,
                                                   UniComboBoxmesini.Text,
                                                   UniComboBoxmesfin.Text,
                                                   UniEditano.Text,
                                                   tbbusca);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' , false );

end;

procedure TfrmPLANOCONTASRESUMO.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmPLANOCONTASRESUMO.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;

  tbbusca.Close;
  tbbusca.CopyDataSet(planoresumo(mm.varI_Code_Company,UniComboBoxmesini.Text,UniComboBoxmesfin.Text,UniEditano.Text,UniButtonEditplanoini.Text,UniButtonEditplanofin.Text));
  tbbusca.Open;

end;

procedure TfrmPLANOCONTASRESUMO.dbgSearchCRUDDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  if (tbbuscaSALDO.AsFloat  < 0 ) then
    attribs.Font.Color:= clRed
  else
  if (tbbuscaSALDO.AsFloat  > 0 ) then
    attribs.Font.Color:= clBlue;
end;

procedure TfrmPLANOCONTASRESUMO.labExitClick(Sender: TObject);
var
   I, F : integer;

begin

  inherited;

  if mm.oPgGeneral <> nil then
    mm.oPgGeneral.ActivePage.Close;

end;

procedure TfrmPLANOCONTASRESUMO.tbbuscadetalhesGetText(Sender: TField;
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

procedure TfrmPLANOCONTASRESUMO.UniFrameCreate(Sender: TObject);
begin
  inherited;
  UniComboBoxmesini.ItemIndex := 0;
  UniComboBoxmesfin.ItemIndex := 11;
  UniEditano.Text             := FormatDateTime('yyyy', Date);
  ativabusca();
  btnSearchCRUD.OnClick(Self);
end;
initialization
  RegisterClass(TfrmPLANOCONTASRESUMO);
end.
