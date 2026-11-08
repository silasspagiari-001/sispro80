object FrmTELADETALHESPRODUCAODLOTE: TFrmTELADETALHESPRODUCAODLOTE
  Left = 0
  Top = 0
  ClientHeight = 263
  ClientWidth = 295
  Hint = '[['#13#10'modal:'#13#10']]'
  Caption = 'Pre'#231'o do KG/PONTO'
  OnShow = UniFormShow
  OnCreate = UniFormCreate
  OnBeforeShow = UniFormBeforeShow
  OnReady = UniFormReady
  OnDestroy = UniFormDestroy
  Position = poDesktopCenter
  OldCreateOrder = False
  BorderStyle = bsSingle
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 295
    Height = 263
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 122
    ExplicitHeight = 48
    object rcBlock50: TUniContainerPanel
      Left = 0
      Top = 232
      Width = 295
      Height = 31
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 233
      ExplicitWidth = 418
      object btnLkpClear: TUniBitBtn
        Left = 200
        Top = 0
        Width = 95
        Height = 31
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 28
        Margins.Bottom = 12
        Caption = 'Fechar'
        Align = alRight
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        OnClick = btnLkpClearClick
        ExplicitLeft = 323
      end
    end
    object rcBlock20: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 295
      Height = 232
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alClient
      TabOrder = 2
      ExplicitWidth = 418
      ExplicitHeight = 233
      object rcBlock40: TUniContainerPanel
        Left = 137
        Top = 0
        Width = 160
        Height = 232
        Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
        ParentColor = False
        Align = alLeft
        TabOrder = 1
        object UniLabel3: TUniLabel
          Left = 6
          Top = 32
          Width = 139
          Height = 29
          Hint = ''
          Caption = 'Total Ponto'
          ParentFont = False
          Font.Height = -24
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object UniLabel4: TUniLabel
          Left = 6
          Top = 136
          Width = 146
          Height = 29
          Hint = ''
          Caption = 'Custo Ponto'
          ParentFont = False
          Font.Height = -24
          Font.Style = [fsBold]
          TabOrder = 2
        end
        object UniFormattedNumberEdittotalponto: TUniFormattedNumberEdit
          Left = 6
          Top = 80
          Width = 130
          Height = 34
          Hint = ''
          Alignment = taRightJustify
          ParentFont = False
          Font.Height = -21
          TabOrder = 3
          ReadOnly = True
          DecimalPrecision = 4
          DecimalSeparator = ','
          ThousandSeparator = '.'
          Anchors = [akLeft, akTop, akRight]
        end
        object UniFormattedNumberEditcustoponto: TUniFormattedNumberEdit
          Left = 6
          Top = 179
          Width = 130
          Height = 34
          Hint = ''
          Alignment = taRightJustify
          ParentFont = False
          Font.Height = -21
          TabOrder = 4
          ReadOnly = True
          DecimalPrecision = 4
          DecimalSeparator = ','
          ThousandSeparator = '.'
          Anchors = [akLeft, akTop, akRight]
        end
      end
      object rcBlock30: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 137
        Height = 232
        Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
        ParentColor = False
        Align = alLeft
        TabOrder = 2
        object UniLabel1: TUniLabel
          Left = 6
          Top = 32
          Width = 100
          Height = 29
          Hint = ''
          Caption = 'Total Kg'
          ParentFont = False
          Font.Height = -24
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object UniLabel2: TUniLabel
          Left = 6
          Top = 136
          Width = 107
          Height = 29
          Hint = ''
          Caption = 'Custo Kg'
          ParentFont = False
          Font.Height = -24
          Font.Style = [fsBold]
          TabOrder = 2
        end
        object UniFormattedNumberEdittotalkg: TUniFormattedNumberEdit
          Left = 3
          Top = 80
          Width = 130
          Height = 34
          Hint = ''
          Alignment = taRightJustify
          ParentFont = False
          Font.Height = -21
          TabOrder = 3
          ReadOnly = True
          DecimalPrecision = 4
          DecimalSeparator = ','
          ThousandSeparator = '.'
          Anchors = [akLeft, akTop, akRight]
        end
        object UniFormattedNumberEditcustokg: TUniFormattedNumberEdit
          Left = 3
          Top = 179
          Width = 130
          Height = 34
          Hint = ''
          Alignment = taRightJustify
          ParentFont = False
          Font.Height = -21
          TabOrder = 4
          ReadOnly = True
          DecimalPrecision = 4
          DecimalSeparator = ','
          ThousandSeparator = '.'
          Anchors = [akLeft, akTop, akRight]
        end
      end
    end
  end
end
