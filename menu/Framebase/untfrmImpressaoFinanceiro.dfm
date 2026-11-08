object frmimpressaofinanceiro: Tfrmimpressaofinanceiro
  Left = 0
  Top = 0
  ClientHeight = 242
  ClientWidth = 551
  Caption = 'Impress'#227'o Financeiro'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 551
    Height = 242
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object rcBlock10: TUniContainerPanel
      Left = 8
      Top = 8
      Width = 529
      Height = 65
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        529
        65)
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 116
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Tipo de Agrupamento'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object cbxSearchCRUDFieldagpfinanceiro: TUniComboBox
        AlignWithMargins = True
        Left = 5
        Top = 28
        Width = 229
        Height = 29
        Hint = ''
        Margins.Right = 5
        Style = csDropDownList
        Text = 'Vencimento'
        Items.Strings = (
          'Vencimento'
          'Pagamento '
          'Pessoa'
          'Emiss'#227'o'
          'Numero')
        ItemIndex = 0
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        IconItems = <>
      end
    end
    object rcBlock20: TUniContainerPanel
      Left = 8
      Top = 191
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        150
        48)
      object btnimpressao: TUniBitBtn
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
        OnClick = btnimpressaoClick
      end
    end
    object rcBlock30: TUniContainerPanel
      Left = 201
      Top = 191
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        150
        48)
      object UniBitBtn1: TUniBitBtn
        Left = 17
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
    object UniDBGrid1: TUniDBGrid
      Left = 247
      Top = 28
      Width = 301
      Height = 214
      Hint = ''
      Visible = False
      DataSource = dm_rc.dsgenerico
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      ForceFit = True
      TabOrder = 4
      Columns = <
        item
          FieldName = 'PESSOA'
          Title.Caption = 'PESSOA'
          Width = 64
        end
        item
          FieldName = 'EMISSAO'
          Title.Caption = 'EMISSAO'
          Width = 64
        end
        item
          FieldName = 'VENCIMENTO'
          Title.Caption = 'VENCIMENTO'
          Width = 64
        end>
    end
    object UniSpeedButton1: TUniSpeedButton
      Left = 72
      Top = 112
      Width = 81
      Height = 22
      Hint = ''
      Visible = False
      Caption = 'testar'
      ParentColor = False
      TabOrder = 5
      OnClick = UniSpeedButton1Click
    end
  end
end
