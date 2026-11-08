object frmDEMO_CALENDAR: TfrmDEMO_CALENDAR
  Left = 0
  Top = 0
  Width = 1004
  Height = 677
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  ParentColor = False
  ParentBackground = False
  object sboxGridBlock: TUniScrollBox
    Left = 0
    Top = 0
    Width = 1004
    Height = 677
    Cursor = crHandPoint
    Hint = ''
    Align = alClient
    Color = 15395562
    TabOrder = 0
    ScrollHeight = 662
    ScrollWidth = 745
    object rcBlock1000: TUniContainerPanel
      Tag = 4
      Left = 108
      Top = 734
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      Enabled = False
      Visible = False
      ParentColor = False
      TabOrder = 0
    end
    object rcBlock40: TUniContainerPanel
      Left = 63
      Top = 8
      Width = 682
      Height = 654
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'noborder-all'#13#10']]'
      ParentColor = False
      TabOrder = 1
      object rcBlock50: TUniContainerPanel
        Left = 17
        Top = 84
        Width = 621
        Height = 509
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'/*min-height:790| <- fix calendar ' +
          'height  */'#13#10'scale:parent h:100%-top off:default-offset |'#13#10'nobord' +
          'er-top|'#13#10'round:b|'#13#10']]'
        ParentColor = False
        TabOrder = 1
        object UniCalendarPanel1: TUniCalendarPanel
          Left = 0
          Top = 0
          Width = 621
          Height = 509
          Hint = '[['#13#10'scrollbar-color:#c0c0c0 #fff'#13#10']]'
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          ShowHint = True
          ParentShowHint = False
          Align = alClient
          DayText = 'Day'
          MonthText = 'Month'
          ShowNavBar = False
          TodayText = 'Today'
          WeekText = 'Week'
          Calendars = <
            item
              CalendarId = 1
              Title = 'Calendar-1'
            end
            item
              CalendarId = 2
              Title = 'Calendar-2'
            end
            item
              CalendarId = 3
              Title = 'Calendar-3'
            end
            item
              CalendarId = 4
              Title = 'Calendar-4'
            end
            item
              CalendarId = 5
              Title = 'Calendar-5'
            end>
          StartDate = 40699.000000000000000000
          BorderStyle = ubsNone
          OnDayClick = UniCalendarPanel1DayClick
          OnDateChange = UniCalendarPanel1DateChange
          OnRangeSelect = UniCalendarPanel1RangeSelect
          OnEventClick = UniCalendarPanel1EventClick
        end
      end
      object rcBlock45: TUniContainerPanel
        Left = 20
        Top = 30
        Width = 618
        Height = 36
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'round:t|'#13#10'/*width:310 mobile-v-310 ' +
          'mobile-h-310|*/'#13#10'/*center:parent mobile-v-x*/'#13#10']]'
        ParentColor = False
        Color = clWhite
        TabOrder = 2
        DesignSize = (
          618
          36)
        object btnCalendarToday: TUniButton
          Left = 43
          Top = 6
          Width = 54
          Height = 25
          Hint = '[['#13#10'cls:ButtonCrud|'#13#10']]'
          Caption = 'Hoje'
          TabOrder = 1
          OnClick = btnCalendarTodayClick
        end
        object btnCalendarPrior: TUniButton
          Left = 6
          Top = 6
          Width = 35
          Height = 25
          Hint = '[['#13#10'ico:fas-arrow-left|'#13#10'cls:ButtonCrud'#13#10']]'
          Caption = '< '
          TabOrder = 2
          OnClick = btnCalendarPriorClick
        end
        object btnCalendarNext: TUniButton
          Left = 99
          Top = 6
          Width = 35
          Height = 25
          Hint = '[['#13#10'ico:fas-arrow-right|'#13#10'cls:ButtonCrud'#13#10']]'
          Caption = ' >'
          TabOrder = 3
          OnClick = btnCalendarNextClick
        end
        object btnCalendarViewMonth: TUniButton
          Left = 558
          Top = 7
          Width = 54
          Height = 25
          Hint = '[['#13#10'cls:ButtonCrud'#13#10']]'
          Caption = 'M'#234's'
          Anchors = [akTop, akRight]
          TabOrder = 4
          OnClick = btnCalendarViewMonthClick
        end
        object btnCalendarViewWeek: TUniButton
          Left = 502
          Top = 7
          Width = 54
          Height = 25
          Hint = '[['#13#10'cls:ButtonCrud|'#13#10']]'
          Caption = 'Semana'
          Anchors = [akTop, akRight]
          TabOrder = 5
          OnClick = btnCalendarViewWeekClick
        end
        object btnCalendarViewDay: TUniButton
          Left = 446
          Top = 7
          Width = 54
          Height = 25
          Hint = '[['#13#10'cls:ButtonCrud'#13#10']]'
          Caption = 'Dia'
          Anchors = [akTop, akRight]
          TabOrder = 6
          OnClick = btnCalendarViewDayClick
        end
        object labMonth: TUniLabel
          Left = 236
          Top = 7
          Width = 69
          Height = 26
          Hint = '[['#13#10'cls:rc-heading-span|'#13#10'center:parent xy|'#13#10']]'
          Alignment = taCenter
          Caption = 'MONTH'
          ParentFont = False
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 7
          OnClick = labMonthClick
        end
      end
    end
    object paCalendarDatePicker: TUniContainerPanel
      Left = 1
      Top = 240
      Width = 326
      Height = 324
      Hint = '[['#13#10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'
      Visible = False
      ParentColor = False
      Color = clWhite
      TabOrder = 2
      object paDatePickerInside: TUniContainerPanel
        Left = 7
        Top = 8
        Width = 312
        Height = 309
        Hint = 
          '[['#13#10'/*cols:xs-12 sm-12 md-12|*/'#13#10'/*hide:mobile|*/'#13#10'/*noborder-to' +
          'p|*/'#13#10'/*width:312 mobile-v-312 mobile-h-312|*/'#13#10'center:parent x|' +
          #13#10'round:all|'#13#10'border:all color-silver'#13#10']]'
        ParentColor = False
        Color = clWhite
        TabOrder = 1
        object uniCalendar: TUniCalendar
          AlignWithMargins = True
          Left = 0
          Top = -2
          Width = 311
          Height = 300
          Hint = '[['#13#10'cls:rc-datepicker-left|'#13#10'noborder-all'#13#10']]'
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          ShowHint = True
          ParentShowHint = False
          Date = 40699.000000000000000000
          FirstDayOfWeek = dowMonday
          TabStop = False
          TabOrder = 1
          OnClick = uniCalendarClick
        end
      end
    end
  end
  object rcSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ImageIndex = 0
    Padding = 20
    FocusCancel = True
    Left = 894
    Top = 46
  end
end
