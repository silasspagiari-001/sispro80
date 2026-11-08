inherited frmEventForm: TfrmEventForm
  ClientHeight = 327
  ClientWidth = 695
  Caption = 'frmEventForm'
  OnClose = UniFormClose
  ExplicitWidth = 695
  ExplicitHeight = 327
  TextHeight = 15
  object UniScrollBox1: TUniScrollBox [0]
    Left = 0
    Top = 0
    Width = 695
    Height = 327
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollHeight = 320
    ScrollWidth = 296
    object rcBlock10: TUniContainerPanel
      Left = 16
      Top = 10
      Width = 122
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-2 ]]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        122
        60)
      object UniLabel1: TUniLabel
        Left = 0
        Top = 0
        Width = 64
        Height = 15
        Hint = ''
        Caption = 'Calendar Id'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object cbxCalendarID: TUniComboBox
        Left = 0
        Top = 21
        Width = 122
        Height = 38
        Hint = ''
        Text = 'cbxCalendarID'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 2
        IconItems = <>
      end
    end
    object rcBlock40: TUniContainerPanel
      Left = 20
      Top = 84
      Width = 122
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-6 lg-6 xl-6 4k-6 8k-6 ]]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        122
        60)
      object UniLabel2: TUniLabel
        Left = 0
        Top = 0
        Width = 24
        Height = 15
        Hint = ''
        Caption = 'Title'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edCalendarTitle: TUniEdit
        Left = 0
        Top = 21
        Width = 122
        Height = 38
        Hint = ''
        Text = 'edCalendarTitle'
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock50: TUniContainerPanel
      Left = 174
      Top = 77
      Width = 122
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-6 lg-6 xl-6 4k-6 8k-6 ]]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        122
        60)
      object UniLabel5: TUniLabel
        Left = 0
        Top = 0
        Width = 52
        Height = 15
        Hint = ''
        Caption = 'Reminder'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edCalendarReminder: TUniEdit
        Left = 0
        Top = 21
        Width = 122
        Height = 38
        Hint = ''
        Text = 'edCalendarReminder'
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock60: TUniContainerPanel
      Left = 20
      Top = 157
      Width = 122
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-6 lg-6 xl-6 4k-6 8k-6 ]]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        122
        60)
      object UniLabel3: TUniLabel
        Left = 0
        Top = 0
        Width = 26
        Height = 15
        Hint = ''
        Caption = 'Start'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edStartDate: TUniDateTimePicker
        Left = 0
        Top = 21
        Width = 122
        Height = 38
        Hint = ''
        DateTime = 40700.044536666670000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Kind = tUniDateTime
        FirstDayOfWeek = dowLocaleDefault
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Color = clWhite
      end
    end
    object rcBlock70: TUniContainerPanel
      Left = 172
      Top = 157
      Width = 122
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-6 lg-6 xl-6 4k-6 8k-6 ]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        122
        60)
      object UniLabel4: TUniLabel
        Left = 0
        Top = 0
        Width = 20
        Height = 15
        Hint = ''
        Caption = 'End'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edEndDate: TUniDateTimePicker
        Left = 0
        Top = 21
        Width = 122
        Height = 38
        Hint = ''
        DateTime = 40700.044588391210000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Kind = tUniDateTime
        FirstDayOfWeek = dowLocaleDefault
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Color = clWhite
      end
    end
    object rcBlock20: TUniContainerPanel
      Left = 158
      Top = 10
      Width = 122
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-10 lg-10 xl-10 4k-10 8k-10 ]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        122
        60)
      object chkDel: TUniCheckBox
        Left = 0
        Top = 35
        Width = 122
        Height = 25
        Hint = ''
        Caption = 'Delete'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object chkAllDay: TUniCheckBox
        Left = 0
        Top = 14
        Width = 122
        Height = 25
        Hint = ''
        Caption = 'All Day'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
    object rcBlock80: TUniContainerPanel
      Left = 70
      Top = 277
      Width = 226
      Height = 43
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        226
        43)
      object btnCancelEvent: TUniButton
        Left = 28
        Top = 2
        Width = 90
        Height = 38
        Hint = '[['#13#10'cls:ButtonThemeCrud'#13#10']]'
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object btnSaveEvent: TUniButton
        Left = 134
        Top = 2
        Width = 90
        Height = 38
        Hint = '[['#13#10'cls:ButtonThemeCrud'#13#10']]'
        Caption = 'OK'
        ModalResult = 1
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Name = 'Calibri'
        TabOrder = 2
        Default = True
      end
    end
    object rcBlock75: TUniContainerPanel
      Left = 20
      Top = 223
      Width = 122
      Height = 27
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 7
    end
  end
  inherited rcSweetAlert: TUniSweetAlert
    Left = 654
    Top = 34
  end
end
