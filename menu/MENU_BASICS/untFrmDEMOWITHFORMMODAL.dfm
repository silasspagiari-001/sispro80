object frmDEMOWithFormMODAL: TfrmDEMOWithFormMODAL
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  HelpType = htKeyword
  ClientHeight = 486
  ClientWidth = 594
  Caption = 'frmDEMOWithFormMODAL'
  OnShow = UniFormShow
  OnResize = UniFormResize
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  NavigateKeys.Enabled = True
  NavigateKeys.Next.Key = 13
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 594
    Height = 427
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollHeight = 422
    ScrollWidth = 506
    object rcBlock10: TUniContainerPanel
      Tag = 1
      Left = 22
      Top = 13
      Width = 100
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        100
        60)
      object edCodigo: TUniEdit
        Left = 0
        Top = 21
        Width = 100
        Height = 38
        Hint = ''
        Text = ''
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clGray
        ReadOnly = True
      end
      object UniLabel2: TUniLabel
        Left = 0
        Top = 0
        Width = 38
        Height = 13
        Hint = ''
        Caption = 'C'#243'digo'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 2
      end
    end
    object rcBlock20: TUniContainerPanel
      Tag = 1
      Left = 159
      Top = 13
      Width = 100
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        100
        60)
      object UniLabel3: TUniLabel
        Left = 0
        Top = 0
        Width = 73
        Height = 13
        Hint = ''
        Caption = 'Data Cadastro'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object edDtCad: TUniDateTimePicker
        Left = 0
        Top = 21
        Width = 100
        Height = 38
        Hint = ''
        DateTime = 43596.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock30: TUniContainerPanel
      Tag = 1
      Left = 299
      Top = 13
      Width = 100
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        100
        60)
      object UniLabel4: TUniLabel
        Left = 0
        Top = 0
        Width = 86
        Height = 13
        Hint = ''
        Caption = 'Data Anivers'#225'rio'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniDBDateTimePicker1: TUniDateTimePicker
        Left = 0
        Top = 21
        Width = 100
        Height = 38
        Hint = ''
        DateTime = 43596.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 1
      Left = 25
      Top = 72
      Width = 100
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        100
        60)
      object UniLabel5: TUniLabel
        Left = 0
        Top = 0
        Width = 44
        Height = 13
        Hint = ''
        Caption = 'PF ou PJ'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object edTipoPessoa: TUniComboBox
        Left = 0
        Top = 21
        Width = 100
        Height = 38
        Hint = ''
        Text = ''
        Items.Strings = (
          'F'
          'J')
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        IconItems = <>
      end
    end
    object rcBlock70: TUniContainerPanel
      Tag = 1
      Left = 302
      Top = 71
      Width = 100
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        100
        60)
      object UniLabel7: TUniLabel
        Left = 0
        Top = 0
        Width = 81
        Height = 13
        Hint = ''
        Caption = 'Inscr. Municipal'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniDBEdit21: TUniEdit
        Left = 0
        Top = 21
        Width = 100
        Height = 38
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        InputMask.RemoveWhiteSpace = True
      end
    end
    object rcBlock80: TUniContainerPanel
      Tag = 1
      Left = 25
      Top = 133
      Width = 376
      Height = 60
      Hint = '[[cols:12]]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        376
        60)
      object UniLabel6: TUniLabel
        Left = 0
        Top = 0
        Width = 86
        Height = 13
        Hint = ''
        Caption = 'Nome / Fantasia'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniDBEdit1: TUniEdit
        Left = 0
        Top = 21
        Width = 375
        Height = 38
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock90: TUniContainerPanel
      Tag = 1
      Left = 20
      Top = 196
      Width = 150
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        150
        60)
      object UniLabel8: TUniLabel
        Left = 0
        Top = 0
        Width = 52
        Height = 13
        Hint = ''
        Caption = 'Email NFe'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniDBEdit13: TUniEdit
        Left = 0
        Top = 21
        Width = 150
        Height = 38
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock100: TUniContainerPanel
      Tag = 1
      Left = 191
      Top = 195
      Width = 150
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        150
        60)
      object UniLabel9: TUniLabel
        Left = 0
        Top = 0
        Width = 82
        Height = 13
        Hint = ''
        Caption = 'Email Comercial'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniDBEdit19: TUniEdit
        Left = 0
        Top = 21
        Width = 150
        Height = 38
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock110: TUniContainerPanel
      Tag = 1
      Left = 356
      Top = 196
      Width = 150
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 8
      DesignSize = (
        150
        60)
      object UniLabel10: TUniLabel
        Left = 0
        Top = 0
        Width = 85
        Height = 13
        Hint = ''
        Caption = 'Email Financeiro'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniDBEdit20: TUniEdit
        Left = 0
        Top = 21
        Width = 150
        Height = 38
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock50: TUniContainerPanel
      Tag = 1
      Left = 175
      Top = 72
      Width = 100
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 9
      DesignSize = (
        100
        60)
      object UniLabel1: TUniLabel
        Left = 0
        Top = 0
        Width = 56
        Height = 13
        Hint = ''
        Caption = 'Cpf  / Cnpj'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object edCnpjCpf: TUniEdit
        Left = 0
        Top = 21
        Width = 100
        Height = 38
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        InputMask.Mask = '99.999.999/9999-99'
      end
    end
    object rcBlock120: TUniContainerPanel
      Left = 34
      Top = 306
      Width = 283
      Height = 116
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 10
    end
  end
  object paFooter: TUniContainerPanel
    Tag = 1
    Left = 0
    Top = 427
    Width = 594
    Height = 59
    Hint = ''
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 12
    ParentColor = False
    Color = 15658734
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      594
      59)
    object btnCancel: TUniBitBtn
      AlignWithMargins = True
      Left = 482
      Top = 10
      Width = 98
      Height = 38
      Hint = '[[cls:ButtonRed ]]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = 'Close Form'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object UniBitBtn1: TUniBitBtn
      AlignWithMargins = True
      Left = 367
      Top = 10
      Width = 98
      Height = 38
      Hint = '[[cls:ButtonGreen ]]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = 'Open Form B'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
      OnClick = UniBitBtn1Click
    end
  end
end
