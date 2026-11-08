object frmdeclaracaoretirada: Tfrmdeclaracaoretirada
  Left = 0
  Top = 0
  ClientHeight = 242
  ClientWidth = 551
  Caption = 'Declara'#231#227'o de Retirada'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 551
    Height = 242
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 112
    ExplicitTop = 56
    ExplicitWidth = 256
    ExplicitHeight = 128
    object rcBlock10: TUniContainerPanel
      Left = 3
      Top = 3
      Width = 545
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        545
        48)
      object UniEditdeclarantenome: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 18
        Width = 537
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 111
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Nome do Declarante'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock20: TUniContainerPanel
      Left = 3
      Top = 57
      Width = 545
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        545
        48)
      object UniLabel2: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 2
        Width = 161
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Cpf/Cnpj sem pontos e tra'#231'os'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEditdocumentodeclarante: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 18
        Width = 537
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock30: TUniContainerPanel
      Left = 3
      Top = 191
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        150
        48)
      object btnLkpSearch: TUniBitBtn
        Left = 11
        Top = 13
        Width = 119
        Height = 29
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 28
        Margins.Bottom = 12
        Caption = '<i class="fas fa-file-pdf"> Impress'#227'o</i>'
        Anchors = [akLeft, akRight, akBottom]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        OnClick = btnLkpSearchClick
      end
    end
    object rcBlock40: TUniContainerPanel
      Left = 196
      Top = 191
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        150
        48)
      object UniBitBtn1: TUniBitBtn
        Left = 13
        Top = 13
        Width = 119
        Height = 29
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 28
        Margins.Bottom = 12
        Caption = 'Sair'
        Anchors = [akLeft, akRight, akBottom]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        OnClick = UniBitBtn1Click
      end
    end
  end
end
