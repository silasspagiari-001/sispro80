unit untFrmDatePicker; //8.5.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, dateutils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid, uniSpeedButton, uniDBEdit,
  uniDBGrid, uniEdit, uniLabel, Data.DB,
  uniButton, uniBitBtn, uniTimer, uniCalendar, uniDateTimePicker;

type
  TfrmDatePicker = class(TUniForm)
    paBackground: TUniContainerPanel;
    timerClose: TUniTimer;
    ed_Lkp: TUniEdit;
    paBGForm: TUniContainerPanel;
    paBG: TUniContainerPanel;
    edMonth: TUniEdit;
    labDot: TUniLabel;
    btnConfirm: TUniBitBtn;
    btnCloseForm: TUniBitBtn;
    labIncMonth: TUniLabel;
    labDecMonth: TUniLabel;
    edDay: TUniEdit;
    UniLabel5: TUniLabel;
    labIncDay: TUniLabel;
    labDecDay: TUniLabel;
    labIncYear: TUniLabel;
    labDecYear: TUniLabel;
    paCalendar: TUniContainerPanel;
    Calendar: TUniCalendar;
    edYear: TUniEdit;
    btnCalendar: TUniBitBtn;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseFormClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure timerCloseTimer(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure paBGFormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure labIncYearClick(Sender: TObject);
    procedure labIncMonthClick(Sender: TObject);
    procedure labDecMonthClick(Sender: TObject);
    procedure labDecYearClick(Sender: TObject);
    procedure labIncDayClick(Sender: TObject);
    procedure labDecDayClick(Sender: TObject);
    procedure CalendarClick(Sender: TObject);
    procedure edMonthKeyPress(Sender: TObject; var Key: Char);
    procedure btnCalendarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;

    cFormModal : TUniForm;

  end;


function frmDatePicker: TfrmDatePicker;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, str_func,
  uconsts, uconsts_cfg, mkm_layout, mkm_func_web, Main;

function frmDatePicker: TfrmDatePicker;
begin
  Result := TfrmDatePicker(mm.GetFormInstance(TfrmDatePicker));
end;

procedure TfrmDatePicker.edMonthKeyPress(Sender: TObject; var Key: Char);
begin
     Key := #0;
end;
// para evitar conflito com "_onFocus"
// 6.0.0.0
procedure TfrmDatePicker.paBGFormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     if not ( ( ( x >= paBG.Left ) and ( x <= paBG.Left + paBG.Width ) ) and
          ( ( y >= paBG.Top ) and ( y <= paBG.Top + paBG.Height ) ) ) then
        btnCloseFormClick( self );
end;

procedure TfrmDatePicker.timerCloseTimer(Sender: TObject);
begin
     mm.varC_Form_Modal := cFormModal ;
     timerClose.Enabled := false;
     close;
end;

procedure TfrmDatePicker.btnCloseFormClick(Sender: TObject);
begin
     mm.varC_TempString := '';
     Close;
end;

procedure TfrmDatePicker.btnConfirmClick(Sender: TObject);
var
   oForm : TObject;
begin
     if Pos( ' yearonly' , TUniEdit(mm.Active_Component).Hint ) > 0 then
        mm.varC_TempString := Zeros( edYear.Text, 4 )
     else
     if Pos( ' monthonly' , TUniEdit(mm.Active_Component).Hint ) > 0 then
        mm.varC_TempString := Zeros( edYear.Text, 4 )
     else
     if Pos( ' dayonly' , TUniEdit(mm.Active_Component).Hint ) > 0 then
        mm.varC_TempString := Zeros( edYear.Text, 4 )
     else
        mm.varC_TempString := Zeros( edDay.Text, 2 ) + Zeros( IntToStr(edMonth.Tag ), 2 ) + Zeros( edYear.Text, 4 );
     if mm.Active_Component <> nil then
     begin
        if mm.Active_Component is TUniEdit then
           TUniEdit(mm.Active_Component).Text := mm.varC_TempString
        else
        if mm.Active_Component is TUniDBEdit then
        begin
             if ( TUniDBEdit(mm.Active_Component).DataSource <> nil ) and
                ( TUniDBEdit(mm.Active_Component).DataSource.DataSet <> nil ) and
                ( TUniDBEdit(mm.Active_Component).DataSource.DataSet.State in [dsEdit, dsInsert] ) then
             begin
                if DataTypeIsString( TDataSet( TUniDBEdit(mm.Active_Component).DataSource.DataSet ).FieldByName( TUniDBEdit(mm.Active_Component).DataField ).DataType ) then
                   TDataSet( TUniDBEdit(mm.Active_Component).DataSource.DataSet ).FieldByName( TUniDBEdit(mm.Active_Component).DataField ).AsString := mm.varC_TempString
                else
                if DataTypeIsDateTime( TDataSet( TUniDBEdit(mm.Active_Component).DataSource.DataSet ).FieldByName( TUniDBEdit(mm.Active_Component).DataField ).DataType ) then
                   TDataSet( TUniDBEdit(mm.Active_Component).DataSource.DataSet ).FieldByName( TUniDBEdit(mm.Active_Component).DataField ).AsDateTime := StrToDateTimeDef( mm.varC_TempString, 0 );
             end;
        end;
        mm.Active_Component := nil;
     end;
     Close;
end;

procedure TfrmDatePicker.CalendarClick(Sender: TObject);
begin
     edYear.Text  := YearOf( Calendar.Date ).ToString;
     edMonth.Text := MonthOf( Calendar.Date ).ToString;
     edDay.Text   := DayOf( Calendar.Date ).ToString;
     btnConfirm.Click;
end;

procedure TfrmDatePicker.btnCalendarClick(Sender: TObject);
begin
//[[
//max-width:251 mobile-251 |
//max-height:137 mobile-137
//max-width:500 mobile-326 |
//max-height:600 mobile-137
//]]
   paBG.Width  := 307;
   paBG.Height := 304;
   paCalendar.Left := 0;
   paCalendar.Top  := 0;
   paCalendar.Visible := not paCalendar.Visible;
end;

procedure TfrmDatePicker.UniFormBeforeShow(Sender: TObject);
begin
     rc_RenderLayout( Self, true, true, true, false );
end;
//6.0.0.0
// para evitar conflito com "_onFocus"
procedure TfrmDatePicker.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
//        mm.Active_Component := nil; // 6.0.0.0
end;

procedure TfrmDatePicker.UniFormCreate(Sender: TObject);
begin
  {$IFDEF RELEASE}
  dm_rc.rc_ProtectForm( Self );
  {$ENDIF}

  self.Left := -3000;
  // 6.0.0.0
  //aplica uma sombra na mensagem
  //UniSession.AddJS( Self.Webform.JsName + '.addCls(''shadow-obj-tour'')')  ;
  UniSession.AddJS( paBG.JsName + '.addCls(''shadow-lookup'')')  ;
  UniSession.AddJS( Self.Webform.JsName + '.addCls(''transparent-form-bg'')')  ;
  if mm.CONFIG_LAYOUT_ROUND_FORM = 'ON' then
     rc_AddCssClass( Self, 'form-rounded' )
  else
     rc_AddCssClass( Self, 'form-noborder' );
  rc_AddCssClass( Self, 'form-noborder' );


  // translate messages
  case mm.varLT_Lang of

       ltpt_BR, ltpt_PT : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Falha na seleção do registro( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := ' registro(s) localizado(s)';
                 end;
       lten_US, lten_GB   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                 end;
       ltes_ES   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION :='Falló la selección del registro de búsqueda (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' registro(s) encontrado ';
                   //edSearchCRUD1.EmptyText         := 'buscar contenido';
                 end;
       ltfr_FR   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'La sélection de l''enregistrement a échoué ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'enregistrement(s) trouvé(s)';
                   //edSearchCRUD1.EmptyText         := 'rechercher le contenu';
                 end;
       ltde_DE   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Datensatzauswahl fehlgeschlagen ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'Datensatz(e) gefunden';
                   //edSearchCRUD1.EmptyText         := 'Forschungsinhalt';
                 end;
       ltit_IT   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Selezione record fallita ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'record(s) trovati';
                   //edSearchCRUD1.EmptyText         := 'contenuto della ricerca';
                 end;
       lttr_TR    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Kayıt seçimi başarısız( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'kayıt(lar) bulundu';
                   //edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltru_RU    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Ошибка выбора записи поиска (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := 'найдены записи';
                   //edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltzn_CH : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   //edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltin_ID : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   //edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltth_TH : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   //edSearchCRUD1.EmptyText         := 'search content';
                 end;
       lthi_IN : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   //edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltar_SA    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'فشل اختيار سجل البحث (rc_LookUpSearchLite)';
                   cMSG_RECORDS_FOUND              := ' تم العثور على سجل (سجلات) ';
                   //edSearchCRUD1.EmptyText         := 'search content';
                 end;
  end;
end;

procedure TfrmDatePicker.UniFormDestroy(Sender: TObject);
begin
    // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
    // que estiver "abaixo" do MODAL
    mm.varC_Form_Modal := nil;
end;

procedure TfrmDatePicker.UniFormReady(Sender: TObject);
begin
     cFormModal := mm.varC_Form_Modal;
     // uma particularidade do LookUp_Lite
     // o RenderLayout deve ser no FormReady para não perder o FOCO
     //v. v.
     //rc_RenderLayout( Self, false, false, true );
     //dm_rc.rc_ResizeBlocks( Self, true, true );
     //dm_rc.rc_SetFocus( edHour );
end;

procedure TfrmDatePicker.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 27 then
     begin
          mm.varC_TempString := '';
          Close;
     end;
end;

procedure TfrmDatePicker.UniFormShow(Sender: TObject);
var
   cDate : string;
begin
  inherited;
     if Self.Tag = 0 then
     begin
         Self.Visible := True;
         paBG.Left := mm.varI_PosX - 2;
         if paBG.Left > mm.varI_ScreenWidth - paBG.Width then
            paBG.Left := mm.varI_ScreenWidth - paBG.Width - 4;
         paBG.Top  := mm.varI_PosY - 3 ;//+ mm.varI_PosH;
         if paBG.Top > mm.varI_ScreenHeight - paBG.Height then
            paBG.Top := mm.varI_ScreenHeight - paBG.Height - 4;
         if paBG.Width < mm.varI_PosW then
            paBG.Width := mm.varI_PosW;
     end
     else
     begin
       Self.Visible := False;
       Self.Top  := -1000;
     end;

     cDate := StringReplace( Trim( TUniEdit(mm.Active_Component).Text ), '/', '', [rfReplaceAll] );
     if ( Length( cDate ) = 8 ) then
     begin
         edDay.Text   := Copy( cDate, 1, 2 );
         edYear.Text  := Copy( cDate, 5, 4 );
         edMonth.Text := rc_GetMonthName( StrToIntDef( Copy( cDate, 3, 2 ), MonthOf( now ) ) );// Copy( FormatSettings.LongMonthNames[ MontOf( now ) ], 1, 3 );
         edMonth.Tag  := StrToIntDef( Copy( cDate, 3, 2 ), MonthOf( now ) );
     end
     else
     begin
        edYear.Text  := IntToStr( YearOf( now ) );
        edDay.Text   := IntToStr( DayOf( now ) );
        edMonth.Text := rc_GetMonthName( MonthOf( now ) );// Copy( FormatSettings.LongMonthNames[ MontOf( now ) ], 1, 3 );
        edMonth.Tag  := MonthOf( now );
     end;

     Self.Visible := True;
end;

procedure TfrmDatePicker.labIncYearClick(Sender: TObject);
var
   i : integer;
begin
     i := StrToIntDef( edYear.Text, 0 );
     rc_Inc( i , 1 );
     edYear.Text := i.ToString;
end;

procedure TfrmDatePicker.labDecYearClick(Sender: TObject);
var
   i : integer;
begin
     i := StrToIntDef( edYear.Text, 0 );
     rc_Dec( i , 1, 1899 );
     edYear.Text := i.ToString;
end;

procedure TfrmDatePicker.labIncMonthClick(Sender: TObject);
var
   i : integer;
begin
     i := edMonth.Tag;
     rc_Inc( i , 1, 12 );
     //edMonth.Text := i.ToString;
     edMonth.Text := rc_GetMonthName( i );// Copy( FormatSettings.LongMonthNames[ i ], 1, 3 );
     edMonth.Tag  := i;
end;

procedure TfrmDatePicker.labDecMonthClick(Sender: TObject);
var
   i : integer;
begin
     i := edMonth.Tag;
     rc_Dec( i , 1, 1 );
     //edMonth.Text := i.ToString;
     edMonth.Text := rc_GetMonthName( i );//Copy( FormatSettings.LongMonthNames[ i ], 1, 3 );
     edMonth.Tag  := i;
end;

procedure TfrmDatePicker.labIncDayClick(Sender: TObject);
var
   i,maxday : integer;

begin
     i := StrToIntDef( edDay.Text, 0 );

     If ( StrToIntDef( edMonth.Text, MonthOf( date ) ) = 2 ) then
     begin
        if ( IsLeapYear( StrToIntDef( edYear.Text , YearOf( date ) ) ) ) then
           MaxDay := 29
        else
           MaxDay := 28;
     end
     else
     If Pos( Zeros( edMonth.Text, 2 ), '01 03 05 07 08 10 12' ) > 0 then
        MaxDay := 31
     else
        MaxDay := 30;

     rc_Inc( i , 1, MaxDay );
     edDay.Text := i.ToString;
end;


procedure TfrmDatePicker.labDecDayClick(Sender: TObject);
var
   i : integer;
begin
     i := StrToIntDef( edDay.Text, 0 );
     rc_Dec( i , 1, 1 );
     edDay.Text := i.ToString;
end;

end.
