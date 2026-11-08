unit untFrmDEMO_CALENDAR;//7.2.0.1

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo, dateutils,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload, uniCalendarPanel, uniCalendar;

type
  TfrmDEMO_CALENDAR = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1000: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniCalendarPanel1: TUniCalendarPanel;
    rcBlock45: TUniContainerPanel;
    btnCalendarToday: TUniButton;
    btnCalendarPrior: TUniButton;
    btnCalendarNext: TUniButton;
    btnCalendarViewMonth: TUniButton;
    btnCalendarViewWeek: TUniButton;
    btnCalendarViewDay: TUniButton;
    labMonth: TUniLabel;
    paCalendarDatePicker: TUniContainerPanel;
    paDatePickerInside: TUniContainerPanel;
    uniCalendar: TUniCalendar;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniCalendar1Click(Sender: TObject);
    procedure UniCalendarPanel1DateChange(Sender: TUniCalendarPanel; AStartDate, AViewStart, AViewEnd: TDateTime);
    procedure UniCalendarPanel1DayClick(Sender: TUniCalendarPanel; ADate: TDateTime; Allday: Boolean);
    procedure UniCalendarPanel1EventClick(Sender: TUniCalendarPanel; AEventId: Integer; AEvent: TUniCalendarEvent);
    procedure UniCalendarPanel1RangeSelect(Sender: TUniCalendarPanel; AStartDate, AEndDate: TDateTime);
    procedure btnCalendarViewDayClick(Sender: TObject);
    procedure btnCalendarViewWeekClick(Sender: TObject);
    procedure btnCalendarViewMonthClick(Sender: TObject);
    procedure btnCalendarNextClick(Sender: TObject);
    procedure btnCalendarPriorClick(Sender: TObject);
    procedure btnCalendarTodayClick(Sender: TObject);
    procedure labMonthClick(Sender: TObject);
    procedure uniCalendarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    iSlides, iSlideCount : integer;

    pObj : TUniControl;

  end;

implementation

{$R *.dfm}

uses Main, ServerModule, MainModule, mkm_gridblock,
  mkm_layout, uconsts, uconsts_cfg, mkm_anim, untDM_RC, mkm_translate, mkm_func_web, str_func, untEventForm;

procedure TfrmDEMO_CALENDAR.btnCalendarNextClick(Sender: TObject);
begin
     UniCalendarPanel1.JSInterface.JSCall('onNextTap', []);
end;

procedure TfrmDEMO_CALENDAR.btnCalendarPriorClick(Sender: TObject);
begin
     UniCalendarPanel1.JSInterface.JSCall('onPrevTap', []);
end;

procedure TfrmDEMO_CALENDAR.btnCalendarTodayClick(Sender: TObject);
begin
     UniCalendarPanel1.JSInterface.JSCall('onTodayTap', []);
end;

procedure TfrmDEMO_CALENDAR.btnCalendarViewDayClick(Sender: TObject);
begin
   UniCalendarPanel1.JSInterface.JSCall('setView', ['day']); //day, week, month
end;

procedure TfrmDEMO_CALENDAR.btnCalendarViewMonthClick(Sender: TObject);
begin
   UniCalendarPanel1.JSInterface.JSCall('setView', ['month']); //day, week, month
end;

procedure TfrmDEMO_CALENDAR.btnCalendarViewWeekClick(Sender: TObject);
begin
   UniCalendarPanel1.JSInterface.JSCall('setView', ['week']); //day, week, month
end;

procedure TfrmDEMO_CALENDAR.labMonthClick(Sender: TObject);
begin
   UniCalendar.Date := UniCalendarPanel1.StartDate;
   dm_rc.rc_ShowHideObject(
     self,
     paCalendarDatePicker,
     0,
     0,
     1,
     false,
     ( paCalendarDatePicker.Tag = 0 ),
     true );
end;

procedure TfrmDEMO_CALENDAR.UniCalendar1Click(Sender: TObject);
begin
  UniCalendarPanel1.StartDate := Date;//UniCalendar1.Date;
end;

procedure TfrmDEMO_CALENDAR.uniCalendarClick(Sender: TObject);
begin
   UniCalendarPanel1.StartDate := UniCalendar.Date;
   dm_rc.rc_ShowHideObject(
     self,
     paCalendarDatePicker,
     0,
     0,
     1,
     false,
     ( paCalendarDatePicker.Tag = 0 ),
     true );
end;

procedure TfrmDEMO_CALENDAR.UniCalendarPanel1DateChange(Sender: TUniCalendarPanel; AStartDate, AViewStart, AViewEnd: TDateTime);
begin
   //UniCalendar1.Date := UniCalendarPanel1.StartDate;
   labMonth.Caption := rc_CamelCase( rc_GetMonthName( MonthOf( UniCalendarPanel1.StartDate ), true ) ) + ' ' + YearOf ( UniCalendarPanel1.StartDate ).ToString;
end;

procedure TfrmDEMO_CALENDAR.UniCalendarPanel1DayClick(Sender: TUniCalendarPanel; ADate: TDateTime; Allday: Boolean);
begin
  if not frmEventForm.Visible then
  begin
    frmEventForm.Calenedar := UniCalendarPanel1;
    frmEventForm.ClearEvent;
    frmEventForm.SetDate(ADate, ADate);
    frmEventForm.ShowModal;
  end;
end;

procedure TfrmDEMO_CALENDAR.UniCalendarPanel1EventClick(Sender: TUniCalendarPanel; AEventId: Integer; AEvent: TUniCalendarEvent);
begin
  if not frmEventForm.Visible then
  begin
    frmEventForm.Calenedar := UniCalendarPanel1;
    frmEventForm.SetEvent(AEvent);
    frmEventForm.ShowModal;
  end;
end;

procedure TfrmDEMO_CALENDAR.UniCalendarPanel1RangeSelect(Sender: TUniCalendarPanel; AStartDate, AEndDate: TDateTime);
begin
  if not frmEventForm.Visible then
  begin
    frmEventForm.Calenedar := UniCalendarPanel1;
    frmEventForm.ClearEvent;
    frmEventForm.SetDate(AStartDate, AEndDate);
    frmEventForm.ShowModal;
  end;
end;

procedure TfrmDEMO_CALENDAR.UniFrameCreate(Sender: TObject);
var
  E : TUniCalendarEvent;
begin
   //UniCalendar1.Date := Date;
   UniCalendarPanel1.StartDate := Date;
   labMonth.Caption := rc_CamelCase( rc_GetMonthName( MonthOf( UniCalendarPanel1.StartDate ), true ) ) + ' ' + YearOf ( UniCalendarPanel1.StartDate ).ToString;
   UniCalendarPanel1.WeekTimeRange.TimeStart := 0.0;

   E := UniCalendarPanel1.Events.Add;
   E.CalendarId := 1;
   E.Title := 'Meeting';
   E.StartDate := Date;
   E.EndDate := Date;
   E.IsAllDay := True;

   E := UniCalendarPanel1.Events.Add;
   E.CalendarId := 2;
   E.Title := 'Meeting-2';
   E.StartDate := Date+1;
   E.EndDate := Date+1;
   E.IsAllDay := True;

   E := UniCalendarPanel1.Events.Add;
   E.CalendarId := 3;
   E.Title := 'Meeting-3';
   E.StartDate := Date + 1.0 + StrToTime('15:30');
   E.EndDate := Date + 1.0 + StrToTime('16:30');

   E := UniCalendarPanel1.Events.Add;
   E.CalendarId := 4;
   E.Title := 'Meeting-4';
   E.StartDate := Date + 2.0 + StrToTime('10:00');
   E.EndDate := Date + 2.0 + StrToTime('12:00');

   Self.Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

   iSlides     := 1;
   iSlideCount := 3;

   //hfChat.HTML.Clear;

   ////dm_rc.rc_ShowSweetAlert( 'RadCORE' , 'Do More. Better and Fast!' , 'info' );

   //if mm.CONFIG_LANGUAGE = 'pt_BR' then
   //   btnLink.Hint := rc_SetHintAttr( 'https://radcore.pro.br/web/atualizacoes/' , 'link:', btnLink.Hint )
   //else
   //   btnLink.Hint := rc_SetHintAttr( 'https://radcore.pro.br/web/updates/' , 'link:', btnLink.Hint );

   // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
   rc_RenderLayout( Self, false, false );
end;

procedure TfrmDEMO_CALENDAR.UniFrameReady(Sender: TObject);
begin
     // adjust edit masks
     dm_rc.rc_ApplyEditMasks( Self );

     mm.varDW_LastTick := GetTickCount;
     // ShowMessage(  'Tempo( sem RDW ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
     dm_rc.rc_ResizeBlocks( Self, true, true );
     //ShowMessageN(  'Tempo( StringReplace default ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
     // in development
     rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
end;

initialization
  RegisterClass(TfrmDEMO_CALENDAR);

end.
