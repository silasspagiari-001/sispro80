unit untFrmEXTRATOFINANCEIROPESSOA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniEdit,
  uniDateTimePicker, UniButtonEdit, uniLabel, uniScrollBox, uniPageControl,
  uniButton, uniBitBtn, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniGUITypes;

type
  TfrmEXTRATOFINANCEIROPESSOA = class(TfrmBase)
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
    UniButtonEditpessoa: TUniButtonEdit;
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
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniFormattedNumberEditSALDO: TUniFormattedNumberEdit;
    UniLabel4: TUniLabel;
    dbgSearchCRUD: TUniDBGrid;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    dsfiltro: TDataSource;
    tbbusca: TFDMemTable;
    tbbuscaEMISSAO: TStringField;
    tbbuscaNUMERO: TIntegerField;
    tbbuscaSERIE: TStringField;
    tbbuscaVENCIMENTO: TStringField;
    tbbuscaPAGAMENTO: TStringField;
    tbbuscaTOTAL: TCurrencyField;
    tbbuscaABERTO: TCurrencyField;
    tbbuscaPAGO: TCurrencyField;
    tbbuscaSALDO: TCurrencyField;
    tbbuscaSEQUENCIA: TIntegerField;
    UniLabel3: TUniLabel;
    UniFormattedNumberEditDEBITO: TUniFormattedNumberEdit;
    UniLabel2: TUniLabel;
    UniFormattedNumberEditcCREDITO: TUniFormattedNumberEdit;
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniButtonEditpessoaButtonClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniButtonEditpessoaExit(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ativabusca();
  procedure CalculaExtrato();
  end;

var
  frmEXTRATOFINANCEIROPESSOA: TfrmEXTRATOFINANCEIROPESSOA;

implementation

{$R *.dfm}

uses mkm_regrasnegocio, MainModule, untFrmPesquisa, System.DateUtils,
  mkm_funcoes, mkm_func_web, mkm_procedures, mkm_impressao, unReportImpressao,
  untDM_RC;

procedure TfrmEXTRATOFINANCEIROPESSOA.ativabusca;
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

procedure TfrmEXTRATOFINANCEIROPESSOA.btnOptionsClick(Sender: TObject);
begin
  inherited;
  if tbbusca.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_extratofinanceiropessoa(
                             UniFormattedNumberEditcCREDITO.Value,
                             UniFormattedNumberEditDEBITO.Value,
                             UniFormattedNumberEditSALDO.Value,
                             edSearchCRUDDtIni.Text,
                             edSearchCRUDDtEnd.Text,
                             MM.varI_Code_Company,
                             strtoint(UniButtonEditpessoa.Text),
                             tbbusca);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' , false );
end;

procedure TfrmEXTRATOFINANCEIROPESSOA.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmEXTRATOFINANCEIROPESSOA.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;
  tbbusca.Close;
  tbbusca.CopyDataSet(extratofinanceiropessoa(mm.varI_Code_Company,StrToInt(UniButtonEditpessoa.Text),
                                              0,
                                              edSearchCRUDDtIni.DateTime,
                                              edSearchCRUDDtEnd.DateTime));
  tbbusca.Open;

  CalculaExtrato();
end;
procedure TfrmEXTRATOFINANCEIROPESSOA.CalculaExtrato;
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

      if tbbusca.FindField('TOTAL').AsFloat > 0 then
        ENTRADA := ENTRADA + tbbusca.FindField('TOTAL').AsFloat;

      if tbbusca.FindField('PAGO').AsFloat > 0 then
        SAIDA := SAIDA + tbbusca.FindField('PAGO').AsFloat;

      SALDO := tbbusca.FindField('SALDO').AsFloat;

      tbbusca.Next;
    end;
  tbbusca.last;
  tbbusca.EnableControls;

  SALDO := (ENTRADA - SAIDA)*-1;

  UniFormattedNumberEditcCREDITO.Value := SAIDA;
  UniFormattedNumberEditDEBITO.Value   := ENTRADA;
  UniFormattedNumberEditSALDO.Value    := SALDO;
end;

procedure TfrmEXTRATOFINANCEIROPESSOA.dbgSearchCRUDDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn;
  Attribs: TUniCellAttribs);
begin
  inherited;

  if (tbbuscaTOTAL.AsFloat  > 0 ) then
    begin
      Attribs.Color := $00D2AAF0;
    end
  else
  if (tbbuscaPAGO.AsFloat  > 0 ) then
    attribs.Font.Color:= clBlue
  else
    attribs.Font.Color:= clRed;
end;

procedure TfrmEXTRATOFINANCEIROPESSOA.UniButtonEditpessoaButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditpessoa.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmEXTRATOFINANCEIROPESSOA.UniButtonEditpessoaExit(Sender: TObject);
begin
  inherited;
  tbbusca.Close;
  UniEditdescricaobanco.Text := Acha_Item('PESSOAS'  ,UniButtonEditpessoa.Text);

  UniFormattedNumberEditcCREDITO.Value := 0;
  UniFormattedNumberEditDEBITO.Value   := 0;
  UniFormattedNumberEditSALDO.Value    := 0;
end;

procedure TfrmEXTRATOFINANCEIROPESSOA.UniFrameCreate(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtIni.Text := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
end;

initialization
  RegisterClass(TfrmEXTRATOFINANCEIROPESSOA);
end.
