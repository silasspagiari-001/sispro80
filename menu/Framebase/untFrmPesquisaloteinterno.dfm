object FrmPesquisaloteinterno: TFrmPesquisaloteinterno
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisar Lote(s) Interno(s)'
  ClientHeight = 517
  ClientWidth = 936
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  OnResize = UniFormResize
  OnShow = UniFormShow
  TextHeight = 15
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 936
    Height = 517
    Hint = ''
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 722
    object UniContainerPanel14: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 934
      Height = 515
      Hint = ''
      ParentColor = False
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 720
      object rcBlock10: TUniContainerPanel
        Tag = 1
        Left = 8
        Top = 8
        Width = 129
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          129
          48)
        object UniLabelv1: TUniLabel
          AlignWithMargins = True
          Left = 1
          Top = 0
          Width = 52
          Height = 15
          Hint = ''
          Margins.Left = 10
          Margins.Top = 15
          Caption = 'Conte'#250'do'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edSearchCRUDconteudo: TUniEdit
          Left = 1
          Top = 17
          Width = 125
          Height = 29
          Hint = ''
          Margins.Left = 10
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          EmptyText = 'digite o conte'#250'do a ser pesquisado'
          ClearButton = True
        end
      end
      object rcBlock20: TUniContainerPanel
        Tag = 1
        Left = 141
        Top = 8
        Width = 134
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          134
          48)
        object cbxSearchCRUDFieldordem: TUniComboBox
          AlignWithMargins = True
          Left = 3
          Top = 17
          Width = 126
          Height = 30
          Hint = ''
          Margins.Right = 5
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'Emiss'#227'o'
            'Vencimento'
            'Pagamento')
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          IconItems = <>
        end
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 55
          Height = 15
          Hint = ''
          Margins.Left = 10
          Margins.Top = 15
          Caption = 'Busca Por'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock30: TUniContainerPanel
        Tag = 1
        Left = 279
        Top = 8
        Width = 113
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          113
          48)
        object UniComboBoxestoque: TUniComboBox
          AlignWithMargins = True
          Left = 3
          Top = 17
          Width = 107
          Height = 30
          Hint = ''
          Margins.Right = 5
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'Emiss'#227'o'
            'Vencimento'
            'Pagamento')
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          IconItems = <>
        end
        object UniLabel2: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 43
          Height = 15
          Hint = ''
          Margins.Left = 10
          Margins.Top = 15
          Caption = 'Estoque'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock40: TUniContainerPanel
        Tag = 1
        Left = 395
        Top = 8
        Width = 107
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          107
          48)
        object UniComboBoxstatus: TUniComboBox
          AlignWithMargins = True
          Left = 3
          Top = 17
          Width = 101
          Height = 30
          Hint = ''
          Margins.Right = 5
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'Ativo'
            'Inativo'
            'Todos')
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          IconItems = <>
        end
        object UniLabel3: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 34
          Height = 15
          Hint = ''
          Margins.Left = 10
          Margins.Top = 15
          Caption = 'Status'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock50: TUniContainerPanel
        Tag = 1
        Left = 505
        Top = 8
        Width = 162
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          162
          48)
        object UniComboBoxtipo: TUniComboBox
          AlignWithMargins = True
          Left = 3
          Top = 17
          Width = 156
          Height = 30
          Hint = ''
          Margins.Right = 5
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'Produto Acabado'
            'Materia Prima')
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          IconItems = <>
        end
        object UniLabel4: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 24
          Height = 15
          Hint = ''
          Margins.Left = 10
          Margins.Top = 15
          Caption = 'Tipo'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock60: TUniContainerPanel
        Tag = 1
        Left = 670
        Top = 8
        Width = 54
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-1'#13#10']]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          54
          48)
        object btnLkpSearch: TUniBitBtn
          Left = 3
          Top = 17
          Width = 48
          Height = 29
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = '<i class="fas fa-search"></i>'
          Anchors = [akLeft, akRight, akBottom]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnLkpSearchClick
        end
      end
      object rcBlock70: TUniContainerPanel
        Left = 8
        Top = 62
        Width = 905
        Height = 428
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 7
        object UniDBGridLOTE: TUniDBGrid
          Left = 0
          Top = 0
          Width = 905
          Height = 428
          Hint = ''
          TitleFont.Name = 'Calibri'
          DataSource = dslote
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.FetchAll = True
          LoadMask.WaitData = True
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          BorderStyle = ubsNone
          Align = alClient
          Font.Height = -13
          Font.Name = 'Calibri'
          ParentFont = False
          TabOrder = 1
          OnDblClick = UniDBGridLOTEDblClick
          Columns = <
            item
              Flex = 130
              FieldName = 'TIPO'
              Title.Caption = ' '
              Width = 100
              Font.Name = 'Calibri'
              Alignment = taCenter
            end
            item
              FieldName = 'CODIGOP'
              Title.Caption = 'CODIGO  "P"'
              Width = 80
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'BARRACAO'
              Title.Caption = 'BARRAC'#195'O'
              Width = 130
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'LOTE'
              Title.Caption = 'LOTE'
              Width = 150
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'PRODUTO'
              Title.Caption = 'PROD'
              Width = 74
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'DESCRICAO'
              Title.Caption = 'DESCRI'#199#195'O'
              Width = 260
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'DISPONIVEL'
              Title.Caption = 'SLD KG'
              Width = 74
              Font.Name = 'Calibri'
            end>
        end
      end
      object labTotReg: TUniLabel
        Left = 0
        Top = 496
        Width = 934
        Height = 19
        Hint = ''
        Margins.Top = 10
        Alignment = taCenter
        AutoSize = False
        Caption = '0 registro(s)'
        Align = alBottom
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 8
        ExplicitWidth = 720
      end
    end
  end
  object tblote: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 616
    Top = 110
    object tbloteLOTE: TStringField
      FieldName = 'LOTE'
      Size = 30
    end
    object tbloteCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblotePRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object tbloteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object tblotePUREZA: TFloatField
      FieldName = 'PUREZA'
    end
    object tbloteDISPONIVEL: TFloatField
      FieldName = 'DISPONIVEL'
    end
    object tbloteTOTALPONTOS: TFloatField
      FieldName = 'TOTALPONTOS'
    end
    object tbloteBARRACAO: TStringField
      FieldName = 'BARRACAO'
      Size = 30
    end
    object tbloteTIPO: TStringField
      FieldName = 'TIPO'
      OnGetText = tbloteTIPOGetText
      Size = 15
    end
    object tbloteCODIGOP: TStringField
      FieldName = 'CODIGOP'
    end
  end
  object dslote: TDataSource
    DataSet = tblote
    Left = 648
    Top = 110
  end
  object timerClose: TUniTimer
    Interval = 700
    Enabled = False
    RunOnce = True
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    Left = 681
    Top = 117
  end
end
