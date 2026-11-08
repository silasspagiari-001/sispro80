unit untEVENTFORM;//7.3.0.1

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, UniCalendarPanel,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniSweetAlert, uniGUIBaseClasses, uniTimer, uniScrollBox, uniButton,
  uniCheckBox, uniEdit, uniDateTimePicker, uniMultiItem, uniComboBox, uniLabel, uniPanel;

type
  TfrmEventForm = class(TfrmGenericModalForm)
    UniScrollBox1: TUniScrollBox;
    UniLabel1: TUniLabel;
    cbxCalendarID: TUniComboBox;
    UniLabel3: TUniLabel;
    edStartDate: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    edCalendarTitle: TUniEdit;
    UniLabel4: TUniLabel;
    edEndDate: TUniDateTimePicker;
    UniLabel5: TUniLabel;
    edCalendarReminder: TUniEdit;
    rcBlock10: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    chkAllDay: TUniCheckBox;
    rcBlock20: TUniContainerPanel;
    chkDel: TUniCheckBox;
    rcBlock80: TUniContainerPanel;
    btnCancelEvent: TUniButton;
    btnSaveEvent: TUniButton;
    rcBlock75: TUniContainerPanel;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
     Event : TUniCalendarEvent; //7.1.0.0 calendar
  public
    { Public declarations }
    //7.1.0.0 calendar
    Calenedar: TUniCalendarPanel;
    procedure ClearEvent;
    procedure SetEvent(E: TUniCalendarEvent);
    procedure SetDate(A, B: TDateTime);
  end;

function frmEventForm: TfrmEventForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmEventForm: TfrmEventForm;
begin
  Result := TfrmEventForm(mm.GetFormInstance(TfrmEventForm));
end;

//7.1.0.0 calendar
procedure TfrmEventForm.ClearEvent;
begin
  Event := nil;
  edStartDate.DateTime := Date;
  edEndDate.DateTime := Date;
  edCalendarTitle.Text := 'New Event';
  edCalendarReminder.Text := '';
  cbxCalendarID.Text := '1';
end;
//7.1.0.0 calendar
procedure TfrmEventForm.SetDate(A, B: TDateTime);
begin
  edStartDate.DateTime := A;
  edEndDate.DateTime := B;
end;
//7.1.0.0 calendar
procedure TfrmEventForm.SetEvent(E: TUniCalendarEvent);
begin
  Event := E;
  if Assigned(E) then
  begin
    edStartDate.DateTime := E.StartDate;
    edEndDate.DateTime := E.EndDate;
    edCalendarTitle.Text := E.Title;
    edCalendarReminder.Text := E.Reminder;
    cbxCalendarID.Text := IntToStr(E.CalendarId);
    chkAllDay.Checked := E.IsAllDay;
  end;
end;

procedure TfrmEventForm.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if ModalResult = mrOK then
  begin
    if chkDel.Checked then
    begin
      Event.Free;
      Exit;
    end;

    if (edStartDate.DateTime = edEndDate.DateTime) and (not chkAllDay.Checked) then
    begin
      ShowMessage('Start and stop date/time must be different.');
      Action := caNone;
      Exit;
    end;

    if not Assigned(Event) then
       Event := Calenedar.Events.Add;

    Event.StartDate := edStartDate.DateTime;
    Event.EndDate := edEndDate.DateTime;
    Event.Title := edCalendarTitle.Text;
    Event.Reminder := edCalendarReminder.Text;
    if cbxCalendarID.Text<>'' then
       Event.CalendarId := StrToIntDef(cbxCalendarID.Text[1], 1);
    Event.IsAllDay := chkAllDay.Checked;
  end;
end;

procedure TfrmEventForm.UniFormShow(Sender: TObject);
var
  I : Integer;
begin
  inherited;

  if Assigned(Calenedar) then
  begin
    cbxCalendarID.Items.Clear;

    for I  :=  0 to Calenedar.Calendars.Count - 1 do
      cbxCalendarID.Items.Add(IntToStr(Calenedar.Calendars[I].CalendarId));
  end;
end;

initialization
   RegisterClass( TfrmEventForm ) ;

end.
