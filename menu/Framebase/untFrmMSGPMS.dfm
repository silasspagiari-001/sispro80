object frmMSGPMS: TfrmMSGPMS
  Left = 0
  Top = 0
  ClientHeight = 264
  ClientWidth = 461
  Caption = 'P.M.S. V'#193'LIDO'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  Position = poDesktopCenter
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 231
    Width = 461
    Height = 33
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    object btnLkpClear: TUniBitBtn
      Left = 364
      Top = 3
      Width = 95
      Height = 29
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = 'Fechar'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnLkpClearClick
    end
  end
  object rcBlock20: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 461
    Height = 231
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object rcBlock30: TUniContainerPanel
      Tag = 1
      Left = 3
      Top = 3
      Width = 150
      Height = 49
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        150
        49)
      object UniFormattedNumberEditCV: TUniFormattedNumberEdit
        Left = 3
        Top = 18
        Width = 144
        Height = 29
        Hint = ''
        Alignment = taCenter
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
        DecimalPrecision = 4
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel16: TUniLabel
        Left = 3
        Top = -1
        Width = 144
        Height = 19
        Hint = ''
        Alignment = taCenter
        AutoSize = False
        Caption = 'CV ='
        ParentFont = False
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 1
      Left = 156
      Top = 3
      Width = 150
      Height = 49
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        150
        49)
      object UniFormattedNumberEditPMS: TUniFormattedNumberEdit
        Left = 3
        Top = 18
        Width = 144
        Height = 29
        Hint = ''
        Alignment = taCenter
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
        DecimalPrecision = 4
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel1: TUniLabel
        Left = 3
        Top = -1
        Width = 143
        Height = 19
        Hint = ''
        Alignment = taCenter
        AutoSize = False
        Caption = 'PMS ='
        ParentFont = False
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock50: TUniContainerPanel
      Tag = 1
      Left = 308
      Top = 3
      Width = 150
      Height = 49
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        150
        49)
      object UniFormattedNumberEditMEDIA: TUniFormattedNumberEdit
        Left = 2
        Top = 18
        Width = 146
        Height = 29
        Hint = ''
        Alignment = taCenter
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
        DecimalPrecision = 3
        DecimalSeparator = ','
        ThousandSeparator = '.'
        OnClick = btnLkpClearClick
      end
      object UniLabel2: TUniLabel
        Left = 3
        Top = -1
        Width = 143
        Height = 19
        Hint = ''
        Alignment = taCenter
        AutoSize = False
        Caption = 'M'#201'DIA ='
        ParentFont = False
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock60: TUniContainerPanel
      Left = 3
      Top = 55
      Width = 455
      Height = 171
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 4
      object UniMemomsgpms: TUniMemo
        Left = 0
        Top = 0
        Width = 455
        Height = 171
        Hint = ''
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Align = alClient
        ReadOnly = True
        Color = clSkyBlue
        TabOrder = 1
      end
    end
  end
end
