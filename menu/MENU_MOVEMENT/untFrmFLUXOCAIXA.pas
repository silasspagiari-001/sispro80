unit untFrmFLUXOCAIXA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniLabel, uniPanel,
  uniHTMLFrame, uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniDateTimePicker, uniScrollBox, uniPageControl, uniButton, uniBitBtn, uniEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniCalendarPanel;

type
  TfrmFLUXOCAIXA = class(TfrmBase)
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
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
    paSearchFilter1: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    edSearchCRUDDtfin: TUniDateTimePicker;
    UniLabel1: TUniLabel;
    UniFormattedNumberEditcvalor: TUniFormattedNumberEdit;
    UniLabel2: TUniLabel;
    UniCalendarPaneltitulos: TUniCalendarPanel;
    dsfiltro: TDataSource;
    tbbusca: TFDMemTable;
    tbbuscaSALDO: TFloatField;
    tbbuscaTOTALPAGAR: TFloatField;
    tbbuscaTOTALRECEBER: TFloatField;
    tbbuscaDIA: TStringField;
    tbbuscaVENCIMENTO: TStringField;
    tbbuscaSEMANA: TStringField;
    procedure btnSearchClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure preenchermemoria();
  procedure preenchercalendario();
  procedure ativabusca();
  end;

var
  frmFLUXOCAIXA: TfrmFLUXOCAIXA;

implementation

{$R *.dfm}

uses mkm_funcoes, mkm_func_web, MainModule, mkm_procedures, untDM_RC,
  System.DateUtils, uniGUIAbstractClasses, mkm_impressao, unReportImpressao;
{ TfrmFLUXOCAIXA }

procedure TfrmFLUXOCAIXA.ativabusca;
begin
  if not ( dsfiltro.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, UniCalendarPaneltitulos.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;

procedure TfrmFLUXOCAIXA.btnOptionsClick(Sender: TObject);
begin
  btnSearchCRUD.onclick(Self);
  if tbbusca.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_Fluxocaixa(
                             UniFormattedNumberEditcvalor.value,
                             edSearchCRUDDtIni.Text,
                             edSearchCRUDDtfin.Text,
                             mm.varI_Code_Company,
                             tbbusca);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' , false );
end;

procedure TfrmFLUXOCAIXA.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmFLUXOCAIXA.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;
  preenchermemoria();
  preenchercalendario();
end;

procedure TfrmFLUXOCAIXA.preenchercalendario;
var
  E  : TUniCalendarEvent;
  I  : Integer;
begin
  UniCalendarPaneltitulos.StartDate  := edSearchCRUDDtIni.DateTime;

  if tbbusca.RecordCount = 0 then
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NADA A APRESENTAR!' , 'warning' , false )
  else
    begin
      I := 0;
      UniCalendarPaneltitulos.Events.Clear;
      tbbusca.First;
      while not tbbusca.Eof do
        begin
          I:=0;

            begin
              Inc(I);
              E             := UniCalendarPaneltitulos.Events.Add;
              E.CalendarId  := I;
              E.Title       := 'Pagar ' + FormatFloat('###,##0.00',tbbusca.FindField('TOTALPAGAR').AsFloat);
              E.StartDate   := tbbusca.FindField('VENCIMENTO').AsDateTime;
              E.EndDate     := tbbusca.FindField('VENCIMENTO').AsDateTime;
              E.IsAllDay    := True;
            end;

            begin
              Inc(I);
              E             := UniCalendarPaneltitulos.Events.Add;
              E.CalendarId  := I;
              E.Title       := 'Receber ' + FormatFloat('###,##0.00',tbbusca.FindField('TOTALRECEBER').AsFloat);
              E.StartDate   := tbbusca.FindField('VENCIMENTO').AsDateTime;
              E.EndDate     := tbbusca.FindField('VENCIMENTO').AsDateTime;
              E.IsAllDay    := True;
            End;

            begin
              Inc(I);
              E             := UniCalendarPaneltitulos.Events.Add;
              E.CalendarId  := I;
              E.Title       := 'Saldo ' + FormatFloat('###,##0.00',tbbusca.FindField('SALDO').AsFloat);
              E.StartDate   := tbbusca.FindField('VENCIMENTO').AsDateTime;
              E.EndDate     := tbbusca.FindField('VENCIMENTO').AsDateTime;
              E.IsAllDay    := True;
            end;
          tbbusca.Next;
        end;
      UniCalendarPaneltitulos.Refresh;
    end;
end;

procedure TfrmFLUXOCAIXA.preenchermemoria;
var
  m_sql,M_CONT    : string;
 fluxo_dataini    : TDateTime;
 dataini, datafin : string;
 I                : integer;
 M_SALDOANT, valor: Real;
begin
  tbbusca.Close;
  tbbusca.Open;

  dataini    := edSearchCRUDDtIni.Text;
  datafin    := edSearchCRUDDtfin.Text;
  M_SALDOANT := 0;
  valor      := 0;
  valor      := UniFormattedNumberEditcvalor.Value;

  fluxo_dataini := StrToDate(dataini);
  M_CONT        := IntToStr(DaysBetween(StrToDate(dataini),
                                        StrToDate(datafin))+ 1);

  for I := 1 to StrToInt(M_CONT) do
    begin
      tbbusca.Append;
      tbbusca.FindField('SEMANA').AsString       := DiaSemana(incDay(fluxo_dataini,I-1));
      tbbusca.FindField('VENCIMENTO').AsDateTime := incDay(fluxo_dataini,I-1);
      tbbusca.Post;
    end;

  M_SQL := 'SELECT  VENCIMENTO, SUM(VALORATUAL) AS SOMA FROM RECEBER ' +
           ' WHERE VENCIMENTO BETWEEN                                ' + QuotedStr(DataPonto(dataini)) +
           ' AND                                                     ' + QuotedStr(DataPonto(datafin)) +
           ' AND FINANCEIRO                        = 1               ' +
           ' AND SITUACAO                          =                 ' + QuotedStr('Aberto')               +
           ' AND EMPRESA                           =                 ' + IntToStr(mm.varI_Code_Company)    +
           ' GROUP BY VENCIMENTO                                     ' +
           ' ORDER BY VENCIMENTO                                     ';

  SqlPesquisa(m_sql);
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      if tbbusca.Locate('VENCIMENTO',VarArrayOf([
         dm_rc.sqlBuscas.FindField('VENCIMENTO').AsString]),[]) then
        begin
          tbbusca.Edit;
          tbbusca.FindField('TOTALRECEBER').AsFloat := dm_rc.sqlBuscas.Findfield('SOMA').AsFloat;
          tbbusca.Post;
        end;
      dm_rc.sqlBuscas.Next;
    end;

  M_SQL := 'SELECT  VENCIMENTO, SUM(VALORATUAL) AS SOMA FROM PAGAR ' +
           ' WHERE VENCIMENTO BETWEEN                              ' + QuotedStr(DataPonto(dataini)) +
           ' AND                                                   ' + QuotedStr(DataPonto(datafin)) +
           ' AND FINANCEIRO                        = 0             ' +
           ' AND SITUACAO                          =               ' + QuotedStr('Aberto')              +
           ' AND EMPRESA                           =               ' + IntToStr(mm.varI_Code_Company)   +
           ' GROUP BY VENCIMENTO                                   ' +
           ' ORDER BY VENCIMENTO                                   ';

  dm_rc.sqlBuscas.SQL.Clear;
  dm_rc.sqlBuscas.Close;
  dm_rc.sqlBuscas.SQL.Text := M_SQL;
  dm_rc.sqlBuscas.Open;

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      if tbbusca.Locate('VENCIMENTO',VarArrayOf([
         dm_rc.sqlBuscas.FindField('VENCIMENTO').AsString]),[]) then
        begin
          tbbusca.Edit;
          tbbusca.FindField('TOTALPAGAR').AsFloat := dm_rc.sqlBuscas.Findfield('SOMA').AsFloat;
          tbbusca.Post;
        end;
      dm_rc.sqlBuscas.Next;
    end;

  tbbusca.First;
  while not tbbusca.Eof do
    begin
      tbbusca.Edit;

      if tbbusca.recno = 1 then
        tbbusca.FindField('SALDO').AsFloat := (valor + tbbusca.FindField('TOTALRECEBER').AsFloat) -
                                                       tbbusca.FindField('TOTALPAGAR').AsFloat
      else
        tbbusca.FindField('SALDO').AsFloat := M_SALDOANT + (tbbusca.FindField('TOTALRECEBER').AsFloat) -
                                                            tbbusca.FindField('TOTALPAGAR').AsFloat;

      M_SALDOANT                          := tbbusca.FindField('SALDO').AsFloat ;

      if tbbusca.FindField('TOTALRECEBER').AsString = '' then
        tbbusca.FindField('TOTALRECEBER').AsFloat  := 0;

      if tbbusca.FindField('TOTALPAGAR').AsString = '' then
        tbbusca.FindField('TOTALPAGAR').AsFloat   := 0;

      tbbusca.Post;

      tbbusca.Next;
    end;
end;

procedure TfrmFLUXOCAIXA.UniFrameCreate(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtIni.Text             := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtfin.Text             := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
  UniCalendarPaneltitulos.StartDate  := date;
  ativabusca();
end;

initialization
  RegisterClass(TfrmFLUXOCAIXA);
end.
