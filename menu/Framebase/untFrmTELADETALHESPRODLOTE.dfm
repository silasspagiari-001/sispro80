object FrmTELADETALHESPRODLOTE: TFrmTELADETALHESPRODLOTE
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmTELADETALHESPRODLOTE'
  ClientHeight = 264
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 418
    Height = 264
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 122
    ExplicitHeight = 48
    object UniContainerPanel1: TUniContainerPanel
      Left = 0
      Top = 233
      Width = 418
      Height = 31
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 311
      ExplicitWidth = 545
      object btnLkpClear: TUniBitBtn
        Left = 323
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
        ExplicitLeft = 450
        ExplicitTop = 1
        ExplicitHeight = 29
      end
    end
    object rcBlock20: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 418
      Height = 233
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 8
      ExplicitTop = 8
      ExplicitWidth = 122
      ExplicitHeight = 48
      object rcBlock30: TUniContainerPanel
        Left = 207
        Top = 0
        Width = 207
        Height = 233
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alLeft
        TabOrder = 1
        ExplicitLeft = 0
        object UniLabel3: TUniLabel
          Left = 40
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
          Left = 40
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
          Left = 48
          Top = 80
          Width = 121
          Height = 34
          Hint = ''
          Alignment = taRightJustify
          ParentFont = False
          Font.Height = -21
          TabOrder = 3
          ReadOnly = True
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniFormattedNumberEditcustoponto: TUniFormattedNumberEdit
          Left = 48
          Top = 179
          Width = 121
          Height = 34
          Hint = ''
          Alignment = taRightJustify
          ParentFont = False
          Font.Height = -21
          TabOrder = 4
          ReadOnly = True
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
      end
      object UniContainerPanel2: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 207
        Height = 233
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alLeft
        TabOrder = 2
        ExplicitLeft = 8
        object UniLabel1: TUniLabel
          Left = 48
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
          Left = 48
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
          Left = 48
          Top = 80
          Width = 121
          Height = 34
          Hint = ''
          Alignment = taRightJustify
          ParentFont = False
          Font.Height = -21
          TabOrder = 3
          ReadOnly = True
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniFormattedNumberEditcustokg: TUniFormattedNumberEdit
          Left = 48
          Top = 179
          Width = 121
          Height = 34
          Hint = ''
          Alignment = taRightJustify
          ParentFont = False
          Font.Height = -21
          TabOrder = 4
          ReadOnly = True
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
      end
    end
  end
end
