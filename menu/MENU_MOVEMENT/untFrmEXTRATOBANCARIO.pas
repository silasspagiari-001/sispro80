unit untFrmEXTRATOBANCARIO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniBasicGrid, uniDBGrid,
  uniGUIClasses, uniDateTimePicker, uniLabel, uniScrollBox, uniPanel,
  uniPageControl, uniButton, uniBitBtn, uniHTMLFrame, uniGUIBaseClasses,
  uniEdit, UniButtonEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniGUITypes;

type
  TfrmEXTRATOBANCARIO = class(TfrmBase)
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
    dbgSearchCRUD: TUniDBGrid;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    paSearchFilter1: TUniContainerPanel;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditpbancos: TUniButtonEdit;
    paSearchOp1: TUniContainerPanel;
    UniEditdescricaobanco: TUniEdit;
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
    UniButtonEditempresa: TUniButtonEdit;
    UniLabel5: TUniLabel;
    tbbuscaEMPRESA: TIntegerField;
    procedure UniButtonEditpbancosButtonClick(Sender: TObject);
    procedure UniButtonEditpbancosExit(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure labExitClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure edSearchCRUDDtIniExit(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure tbbuscadetalhesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnOptionsClick(Sender: TObject);
    procedure UniButtonEditempresaButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure CalculaExtrato();
  procedure ativabusca();
  end;

var
  frmEXTRATOBANCARIO: TfrmEXTRATOBANCARIO;

implementation

{$R *.dfm}

uses MainModule, untFrmPesquisa, mkm_procedures, mkm_regrasnegocio, mkm_func_web,
  System.DateUtils, mkm_impressao, unReportImpressao, untDM_RC;

procedure TfrmEXTRATOBANCARIO.ativabusca;
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

procedure TfrmEXTRATOBANCARIO.btnOptionsClick(Sender: TObject);
begin
  inherited;
  if tbbusca.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_extratobancario(UniEditdescricaobanco.Text,
                             edSearchCRUDDtIni.Text,
                             edSearchCRUDDtEnd.Text,
                             tbbusca);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' , false );
end;

procedure TfrmEXTRATOBANCARIO.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmEXTRATOBANCARIO.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;

  tbbusca.Close;
  tbbusca.CopyDataSet(extratobancario(StrToInt(UniButtonEditempresa.Text),
                                      StrToInt(UniButtonEditpbancos.Text),
                                      edSearchCRUDDtIni.DateTime,
                                      edSearchCRUDDtEnd.DateTime));
  tbbusca.Open;

  CalculaExtrato();

end;

procedure TfrmEXTRATOBANCARIO.CalculaExtrato;
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
  UniFormattedNumberEditSALDO.Value    := Calcula_SaldoatualCaixa(StrToInt(UniButtonEditempresa.Text),
                                                                  StrToInt(UniButtonEditpbancos.Text),Date);
end;

procedure TfrmEXTRATOBANCARIO.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  if (tbbuscaSALDO.AsFloat  < 0 ) then
    attribs.Font.Color:= clRed
  else
  if (tbbuscaSALDO.AsFloat  > 0 ) then
    attribs.Font.Color:= clBlue;

  if (tbbuscaEMPRESA.AsFloat  > 1 ) then
    attribs.Font.Color:= clPurple;


end;

procedure TfrmEXTRATOBANCARIO.edSearchCRUDDtIniExit(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtEnd.Text := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
end;

procedure TfrmEXTRATOBANCARIO.labExitClick(Sender: TObject);
var
   I, F : integer;

begin

  inherited;

  if mm.oPgGeneral <> nil then
    mm.oPgGeneral.ActivePage.Close;

end;

procedure TfrmEXTRATOBANCARIO.tbbuscadetalhesGetText(Sender: TField;
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

procedure TfrmEXTRATOBANCARIO.UniButtonEditempresaButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('EMPRESAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditempresa.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmEXTRATOBANCARIO.UniButtonEditpbancosButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PORTADORES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditpbancos.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmEXTRATOBANCARIO.UniButtonEditpbancosExit(Sender: TObject);
begin
  inherited;
    UniEditdescricaobanco.Text := Acha_Item('PORTADORES'  ,UniButtonEditpbancos.Text);
end;
procedure TfrmEXTRATOBANCARIO.UniFrameCreate(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtIni.Text := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
end;

initialization
  RegisterClass(TfrmEXTRATOBANCARIO);
end.
