object frmTimePicker: TfrmTimePicker
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal: |'#13#10'width:max|'#13#10'height:max|'#13#10']]'#13#10#13#10
  ClientHeight = 137
  ClientWidth = 251
  Caption = 'Time Picker'
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
    Width = 326
    Height = 350
    Hint = '[['#13#10'anchor:'#13#10']]'
    ParentColor = False
    TabOrder = 0
    OnMouseDown = paBGFormMouseDown
    object paBG: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 326
      Height = 350
      Hint = 
        '[['#13#10'max-width:251 mobile-v-251 mobile-h-251 |'#13#10'max-height:137 mo' +
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
        Width = 326
        Height = 350
        Hint = ''
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        ParentColor = False
        Color = clWhite
        Align = alClient
        TabOrder = 2
        object edHour: TUniEdit
          AlignWithMargins = True
          Left = 30
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
          TabOrder = 1
          EmptyText = 'conte'#250'do da pesquisa'
        end
        object edMin: TUniEdit
          AlignWithMargins = True
          Left = 94
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
          TabOrder = 2
          EmptyText = 'conte'#250'do da pesquisa'
        end
        object labDot: TUniLabel
          Left = 80
          Top = 56
          Width = 6
          Height = 26
          Hint = ''
          Alignment = taCenter
          Caption = ':'
          ParentFont = False
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 3
        end
        object UniLabel1: TUniLabel
          Left = 44
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
          TabOrder = 4
          OnClick = UniLabel1Click
        end
        object UniLabel2: TUniLabel
          Left = 44
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
          TabOrder = 5
          OnClick = UniLabel2Click
        end
        object btnConfirm: TUniBitBtn
          Left = 143
          Top = 52
          Width = 37
          Height = 36
          Hint = '[['#13#10'cls:ButtonThemeCrud|'#13#10'ico:fas-check'#13#10']]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = 'V'
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 6
          OnClick = btnConfirmClick
        end
        object btnCloseForm: TUniBitBtn
          Left = 186
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
          TabOrder = 7
          OnClick = btnCloseFormClick
        end
        object UniLabel3: TUniLabel
          Left = 110
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
          TabOrder = 8
          OnClick = UniLabel3Click
        end
        object UniLabel4: TUniLabel
          Left = 110
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
          TabOrder = 9
          OnClick = UniLabel4Click
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
