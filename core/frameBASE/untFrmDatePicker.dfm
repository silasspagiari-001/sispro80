object frmDatePicker: TfrmDatePicker
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal: |'#13#10'width:max|'#13#10'height:max|'#13#10']]'#13#10#13#10
  ClientHeight = 445
  ClientWidth = 531
  Caption = 'Date Picker'
  OnShow = UniFormShow
  BorderStyle = bsNone
  OldCreateOrder = False
  OnClose = UniFormClose
  OnKeyDown = UniFormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  ScreenMask.Target = Owner
  ScreenMask.Color = clGray
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object paBGForm: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 429
    Hint = '[['#13#10'anchor:'#13#10']]'
    ParentColor = False
    TabOrder = 0
    OnMouseDown = paBGFormMouseDown
    object paBG: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 493
      Height = 421
      Hint = 
        '[['#13#10'max-width:326 mobile-v-326 mobile-h-326 |'#13#10'max-height:137 mo' +
        'bile-v-137 mobile-h-137'#13#10']]'
      ParentColor = False
      Color = clWhite
      TabOrder = 1
      object ed_Lkp: TUniEdit
        Left = 172
        Top = 106
        Width = 121
        Hint = ''
        Visible = False
        Text = 'ed_Lkp'
        TabOrder = 1
      end
      object paBackground: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 493
        Height = 421
        Hint = ''
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        ParentColor = False
        Color = clWhite
        Align = alClient
        TabOrder = 2
        object edMonth: TUniEdit
          AlignWithMargins = True
          Left = 86
          Top = 52
          Width = 47
          Height = 36
          Hint = ''
          CharCase = ecUpperCase
          Alignment = taCenter
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          EmptyText = 'conte'#250'do da pesquisa'
          OnKeyPress = edMonthKeyPress
        end
        object labDot: TUniLabel
          Left = 370
          Top = 128
          Width = 9
          Height = 26
          Hint = ''
          Visible = False
          Alignment = taCenter
          Caption = '/'
          ParentFont = False
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 2
        end
        object btnConfirm: TUniBitBtn
          Left = 233
          Top = 52
          Width = 37
          Height = 36
          Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'ico:fas-check'#13#10']]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = 'V'
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 3
          OnClick = btnConfirmClick
        end
        object btnCloseForm: TUniBitBtn
          Left = 276
          Top = 52
          Width = 37
          Height = 36
          Hint = '[['#13#10'cls:ButtonThemeCrud|'#13#10'ico:fas-times'#13#10']]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = 'X'
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 4
          OnClick = btnCloseFormClick
        end
        object labIncMonth: TUniLabel
          Left = 105
          Top = 20
          Width = 12
          Height = 23
          Cursor = crHandPoint
          Hint = '[['#13#10'ico:fas-arrow-up|'#13#10'cls-ico:color-theme'#13#10']]'
          Alignment = taCenter
          Caption = 'A'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 5
          OnClick = labIncMonthClick
        end
        object labDecMonth: TUniLabel
          Left = 105
          Top = 96
          Width = 11
          Height = 23
          Cursor = crHandPoint
          Hint = '[['#13#10'ico:fas-arrow-down|'#13#10'cls-ico:color-theme'#13#10']]'
          Alignment = taCenter
          Caption = 'V'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 6
          OnClick = labDecMonthClick
        end
        object edDay: TUniEdit
          AlignWithMargins = True
          Left = 142
          Top = 52
          Width = 41
          Height = 36
          Hint = ''
          CharCase = ecUpperCase
          Alignment = taCenter
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 7
          EmptyText = 'conte'#250'do da pesquisa'
        end
        object UniLabel5: TUniLabel
          Left = 438
          Top = 128
          Width = 9
          Height = 26
          Hint = ''
          Visible = False
          Alignment = taCenter
          Caption = '/'
          ParentFont = False
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 8
        end
        object labIncDay: TUniLabel
          Left = 158
          Top = 20
          Width = 12
          Height = 23
          Cursor = crHandPoint
          Hint = '[['#13#10'ico:fas-arrow-up|'#13#10'cls-ico:color-theme'#13#10']]'
          Alignment = taCenter
          Caption = 'A'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 9
          OnClick = labIncDayClick
        end
        object labDecDay: TUniLabel
          Left = 158
          Top = 96
          Width = 11
          Height = 23
          Cursor = crHandPoint
          Hint = '[['#13#10'ico:fas-arrow-down|'#13#10'cls-ico:color-theme'#13#10']]'
          Alignment = taCenter
          Caption = 'V'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 10
          OnClick = labDecDayClick
        end
        object labIncYear: TUniLabel
          Left = 38
          Top = 20
          Width = 12
          Height = 23
          Cursor = crHandPoint
          Hint = '[['#13#10'ico:fas-arrow-up|'#13#10'cls-ico:color-theme'#13#10']]'
          Alignment = taCenter
          Caption = 'A'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 11
          OnClick = labIncYearClick
        end
        object labDecYear: TUniLabel
          Left = 38
          Top = 96
          Width = 11
          Height = 23
          Cursor = crHandPoint
          Hint = '[['#13#10'ico:fas-arrow-down|'#13#10'cls-ico:color-theme'#13#10']]'
          Alignment = taCenter
          Caption = 'V'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 12
          OnClick = labDecYearClick
        end
        object edYear: TUniEdit
          AlignWithMargins = True
          Left = 16
          Top = 52
          Width = 59
          Height = 36
          Hint = ''
          CharCase = ecUpperCase
          Alignment = taCenter
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 14
          EmptyText = 'conte'#250'do da pesquisa'
        end
        object btnCalendar: TUniBitBtn
          Left = 191
          Top = 52
          Width = 37
          Height = 36
          Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'ico:fas-calendar-days'#13#10']]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = 'V'
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 15
          OnClick = btnCalendarClick
        end
        object paCalendar: TUniContainerPanel
          Left = 18
          Top = 116
          Width = 307
          Height = 304
          Hint = '[['#13#10'round:all|'#13#10'border:all'#13#10']]'
          Visible = False
          ParentColor = False
          Color = clSilver
          TabOrder = 13
          object Calendar: TUniCalendar
            AlignWithMargins = True
            Left = -1
            Top = -1
            Width = 306
            Height = 304
            Hint = '[['#13#10'cls:rc-datepicker-left'#13#10']]'
            FieldLabelWidth = 100
            Date = 45318.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            FirstDayOfWeek = dowMonday
            TabStop = False
            TabOrder = 1
            OnClick = CalendarClick
          end
        end
      end
    end
  end
  object timerClose: TUniTimer
    Interval = 700
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = timerCloseTimer
    Left = 431
    Top = 249
  end
end
