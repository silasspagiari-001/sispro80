unit untFrmPLANOCONTASINDIVIDUAL;

interface

uses untDM_RC, Vcl.Menus, uniMainMenu, uniSweetAlert, uniDateTimePicker,
 
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniBasicGrid, uniDBGrid,
  uniEdit, uniDateTimePicker, uniGUIClasses, UniButtonEdit, uniLabel,
  uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn, uniHTMLFrame,
  uniGUIBaseClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.DB, uniGUITypes;

type
  TfrmPLANOCONTASINDIVIDUAL = class(TfrmBase)
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
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditplanocontas: TUniButtonEdit;
    paSearchOp1: TUniContainerPanel;
    UniEditdescricaoplanocontas: TUniEdit;
    UniLabel1: TUniLabel;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    UniContainerPanel3: TUniContainerPanel;
    UniFormattedNumberEditcCREDITO: TUniFormattedNumberEdit;
    UniLabel2: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    UniFormattedNumberEditDEBITO: TUniFormattedNumberEdit;
    UniLabel3: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniFormattedNumberEditSALDO: TUniFormattedNumberEdit;
    UniLabel4: TUniLabel;
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
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    procedure UniButtonEditplanocontasButtonClick(Sender: TObject);
    procedure UniButtonEditplanocontasExit(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure tbbuscadetalhesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure edSearchCRUDDtIniExit(Sender: TObject);
    procedure labExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure CalculaExtrato();
  procedure ativabusca();

  end;

var
  frmPLANOCONTASINDIVIDUAL: TfrmPLANOCONTASINDIVIDUAL;

implementation

{$R *.dfm}

uses MainModule, untFrmPesquisa, mkm_procedures, System.DateUtils, mkm_func_web,
  mkm_regrasnegocio;
procedure TfrmPLANOCONTASINDIVIDUAL.ativabusca;
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

procedure TfrmPLANOCONTASINDIVIDUAL.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmPLANOCONTASINDIVIDUAL.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;

  tbbusca.Close;
  tbbusca.CopyDataSet(extratoplano(mm.varI_Code_Company,UniButtonEditplanocontas.Text,edSearchCRUDDtIni.DateTime,edSearchCRUDDtEnd.DateTime));
  tbbusca.Open;

  CalculaExtrato();

end;

procedure TfrmPLANOCONTASINDIVIDUAL.CalculaExtrato;
var
  I :integer;
  ENTRADA,SAIDA,SALDO : Real;
begin
  I       := 0;
  ENTRADA := 0;
  SAIDA   := 0;
  SALDO   := 0;

  tbbusca.DisableControls;
  tbbusca.First;
  while not tbbusca.Eof do
    begin
      Inc(I);

      if tbbusca.FindField('CREDITO').AsFloat > 0 then
        ENTRADA := ENTRADA + tbbusca.FindField('CREDITO').AsFloat;

      if tbbusca.FindField('DEBITO').AsFloat > 0 then
        SAIDA := SAIDA + tbbusca.FindField('DEBITO').AsFloat;

      SALDO := tbbusca.FindField('SALDO').AsFloat;

      tbbusca.Next;
    end;
  tbbusca.last;
  tbbusca.EnableControls;

  UniFormattedNumberEditcCREDITO.Value := ENTRADA;
  UniFormattedNumberEditDEBITO.Value   := SAIDA;
  UniFormattedNumberEditSALDO.Value    := SALDO;
end;

procedure TfrmPLANOCONTASINDIVIDUAL.dbgSearchCRUDDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  if (tbbuscaSALDO.AsFloat  < 0 ) then
    attribs.Font.Color:= clRed
  else
  if (tbbuscaSALDO.AsFloat  > 0 ) then
    attribs.Font.Color:= clBlue;
end;

procedure TfrmPLANOCONTASINDIVIDUAL.edSearchCRUDDtIniExit(Sender: TObject);
begin
  inherited;
 edSearchCRUDDtEnd.Text := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
end;

procedure TfrmPLANOCONTASINDIVIDUAL.labExitClick(Sender: TObject);
var
   I, F : integer;

begin

  inherited;

  if mm.oPgGeneral <> nil then
    mm.oPgGeneral.ActivePage.Close;

end;

procedure TfrmPLANOCONTASINDIVIDUAL.tbbuscadetalhesGetText(Sender: TField;
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

procedure TfrmPLANOCONTASINDIVIDUAL.UniButtonEditplanocontasButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PLANOCONTAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditplanocontas.Text := MM.varC_codigo_busca;
     end;
   end);

end;

procedure TfrmPLANOCONTASINDIVIDUAL.UniButtonEditplanocontasExit(
  Sender: TObject);
begin
  inherited;
    UniEditdescricaoplanocontas.Text := Acha_Item('PLANOCONTAS'  ,UniButtonEditplanocontas.Text);

end;

procedure TfrmPLANOCONTASINDIVIDUAL.UniFrameCreate(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtIni.Text := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
  ativabusca();
end;

initialization
  RegisterClass(TfrmPLANOCONTASINDIVIDUAL);
end.
