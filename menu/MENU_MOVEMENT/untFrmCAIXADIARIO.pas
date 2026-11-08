unit untFrmCAIXADIARIO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniButton,
  uniBitBtn, uniMultiItem, uniComboBox, uniDateTimePicker, uniEdit,
  UniButtonEdit, uniLabel, uniScrollBox, uniPageControl, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
  uniGUITypes;

type
  TfrmCAIXADIARIO = class(TfrmBase)
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    paSearchFilter1: TUniContainerPanel;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    dbgSearchCRUD: TUniDBGrid;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    dsfiltro: TDataSource;
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    paGC: TUniContainerPanel;
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
    procedure btnSearchClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure tbbuscadetalhesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure labExitClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ativabusca();
  procedure rc_DefaultTitleForm;

  end;

var
  frmCAIXADIARIO: TfrmCAIXADIARIO;

implementation

{$R *.dfm}

uses MainModule, mkm_func_web, mkm_procedures, mkm_regrasnegocio, mkm_layout,
  mkm_impressao, unReportImpressao, untDM_RC;

{ TfrmCAIXADIARIO }

procedure TfrmCAIXADIARIO.ativabusca;
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

procedure TfrmCAIXADIARIO.btnOptionsClick(Sender: TObject);
begin
  inherited;
  if tbbusca.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_caixadiario(edSearchCRUDDtIni.Text,
                             tbbusca);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' , false );
end;

procedure TfrmCAIXADIARIO.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmCAIXADIARIO.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;

  tbbusca.Close;
  tbbusca.CopyDataSet(caixadiario(mm.varI_Code_Company,edSearchCRUDDtIni.DateTime));
  tbbusca.Open;
end;

procedure TfrmCAIXADIARIO.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  if (tbbuscaSALDO.AsFloat  < 0 ) then
    attribs.Font.Color:= clRed
  else
  if (tbbuscaSALDO.AsFloat  > 0 ) then
    attribs.Font.Color:= clBlue;

  if (tbbuscaPORTADOR.AsInteger <> 0 ) then
    Attribs.Color:= clSilver;

end;

procedure TfrmCAIXADIARIO.labExitClick(Sender: TObject);
var
   I, F : integer;

begin

  inherited;

  rc_DefaultTitleForm; // v. 3.2.0.0

  if mm.oPgGeneral <> nil then
    mm.oPgGeneral.ActivePage.Close;

end;

procedure TfrmCAIXADIARIO.rc_DefaultTitleForm;
var
   i : integer;
begin
     i := Pos( ' [ID:', labTitleForm.Caption );
     if ( i > 0 ) and ( Pos( 'caption-id', labTitleForm.Hint ) > 0 ) then
     begin
        labTitleForm.Caption := Copy ( labTitleForm.Caption, 1, i-1 );
        labTitleForm.hint := rc_SetHintProperty( '', 'caption-dots-default:', labTitleForm.hint );
        labTitleForm.hint := StringReplace( labTitleForm.hint, 'caption-dots-default:', '', [rfReplaceAll] );
     end;
end;

procedure TfrmCAIXADIARIO.tbbuscadetalhesGetText(Sender: TField;
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

procedure TfrmCAIXADIARIO.UniFrameCreate(Sender: TObject);
begin
  inherited;

  edSearchCRUDDtIni.DateTime := Date;
  btnSearchCRUD.OnClick(Self);
  ativabusca();
end;
initialization
  RegisterClass(TfrmCAIXADIARIO);
end.
