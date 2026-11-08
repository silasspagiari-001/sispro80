object frmPROPRIEDADE: TfrmPROPRIEDADE
  Left = 0
  Top = 0
  ClientHeight = 336
  ClientWidth = 483
  Caption = 'Cadastro de Propriedades'
  OnShow = UniFormShow
  BorderStyle = bsSizeToolWin
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  KeyPreview = True
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 305
    Width = 483
    Height = 31
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    object btnLkpClear: TUniBitBtn
      Left = 382
      Top = 1
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
    object btninclui: TUniBitBtn
      AlignWithMargins = True
      Left = -3
      Top = 1
      Width = 33
      Height = 32
      Hint = ''
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '<i class="fas fa-plus"></i>'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 2
      ScaleButton = False
      LayoutConfig.Padding = '0 2 0 0'
      OnClick = btnincluiClick
    end
    object btngrava: TUniBitBtn
      AlignWithMargins = True
      Left = 106
      Top = -3
      Width = 33
      Height = 32
      Hint = ''
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Enabled = False
      Caption = '<i class="fas fa-save"></i>'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 3
      ScaleButton = False
      LayoutConfig.Padding = '0 2 0 0'
      OnClick = btngravaClick
    end
    object btnexclui: TUniBitBtn
      AlignWithMargins = True
      Left = 69
      Top = -1
      Width = 33
      Height = 32
      Hint = 
        '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
        #13#10']]'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Enabled = False
      Caption = '<i class="fas fa-trash"></i>'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 4
      ScaleButton = False
      LayoutConfig.Padding = '0 2 0 0'
      OnClick = btnexcluiClick
    end
    object btnaltera: TUniBitBtn
      AlignWithMargins = True
      Left = 34
      Top = -1
      Width = 33
      Height = 32
      Hint = ''
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Enabled = False
      Caption = '<i class="fas fa-pencil-alt"></i>'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 5
      ScaleButton = False
      LayoutConfig.Padding = '0 2 0 0'
      OnClick = btnalteraClick
    end
  end
  object UniPageControl: TUniPageControl
    Left = 0
    Top = 0
    Width = 483
    Height = 305
    Hint = ''
    ActivePage = UniTabSheetcadastro
    Align = alClient
    TabOrder = 1
    object UniTabSheetpesquisa: TUniTabSheet
      Hint = ''
      Caption = 'Pesquisa'
      object dbgSearchCRUD: TUniDBGrid
        Left = 0
        Top = 0
        Width = 475
        Height = 277
        Hint = ''
        DataSource = dsfiltro
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
        WebOptions.Paged = False
        WebOptions.FetchAll = True
        LoadMask.Message = 'Loading data...'
        ForceFit = True
        Align = alClient
        Font.Height = -13
        Font.Name = 'Calibri'
        ParentFont = False
        TabOrder = 0
        Exporter.Enabled = True
        OnDblClick = dbgSearchCRUDDblClick
        Columns = <
          item
            FieldName = 'SEQUENCIA'
            Title.Caption = 'SEQ.'
            Width = 40
            Font.Name = 'Calibri'
            Alignment = taCenter
          end
          item
            FieldName = 'CIDADE'
            Title.Caption = 'CIDADE'
            Width = 300
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'ESTADO'
            Title.Caption = 'UF'
            Width = 60
            Font.Name = 'Calibri'
          end>
      end
    end
    object UniTabSheetcadastro: TUniTabSheet
      Hint = ''
      Caption = 'Cadastro'
      object UniContainerPanel1: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 475
        Height = 277
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object rcBlock20: TUniContainerPanel
          Left = 3
          Top = -1
          Width = 131
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            131
            48)
          object UniButtonDbEditCEPP: TUniButtonDbEdit
            Tag = 1
            Left = 3
            Top = 16
            Width = 125
            Height = 29
            Hint = ''
            DataField = 'CEP'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Color = clInfoBk
            OnExit = UniButtonDbEditCEPPExit
            OnButtonClick = UniButtonDbEditCEPPButtonClick
            IconCls = 'search'
          end
          object UniLabel15: TUniLabel
            Left = 3
            Top = 0
            Width = 20
            Height = 15
            Hint = ''
            Caption = 'Cep'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock30: TUniContainerPanel
          Left = 136
          Top = -1
          Width = 332
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-9]]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            332
            48)
          object UniLabel1: TUniLabel
            Left = 3
            Top = 0
            Width = 50
            Height = 15
            Hint = ''
            Caption = 'Endere'#231'o'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UDBEditENDERECO: TUniDBEdit
            Left = 3
            Top = 16
            Width = 326
            Height = 29
            Hint = ''
            DataField = 'ENDERECO'
            DataSource = dscrud
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock120: TUniContainerPanel
          Left = 2
          Top = 53
          Width = 131
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            131
            48)
          object UniLabel2: TUniLabel
            Left = 3
            Top = 0
            Width = 43
            Height = 15
            Hint = ''
            Caption = 'Numero'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBEdit1: TUniDBEdit
            Left = 3
            Top = 16
            Width = 125
            Height = 29
            Hint = ''
            DataField = 'NUMERO'
            DataSource = dscrud
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock130: TUniContainerPanel
          Left = 134
          Top = 53
          Width = 332
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-9]]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            332
            48)
          object UniLabel3: TUniLabel
            Left = 3
            Top = 0
            Width = 35
            Height = 15
            Hint = ''
            Caption = 'Bairro'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UDBEditBAIRRO: TUniDBEdit
            Left = 2
            Top = 16
            Width = 326
            Height = 29
            Hint = ''
            DataField = 'BAIRRO'
            DataSource = dscrud
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock220: TUniContainerPanel
          Left = 2
          Top = 104
          Width = 365
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-10]]'
          ParentColor = False
          TabOrder = 5
          DesignSize = (
            365
            48)
          object UniLabel4: TUniLabel
            Left = 3
            Top = 0
            Width = 38
            Height = 15
            Hint = ''
            Caption = 'Cidade'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UDBEditCIDADE: TUniDBEdit
            Left = 3
            Top = 16
            Width = 359
            Height = 29
            Hint = ''
            DataField = 'CIDADE'
            DataSource = dscrud
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock230: TUniContainerPanel
          Tag = 1
          Left = 368
          Top = 104
          Width = 98
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-2]]'
          ParentColor = False
          TabOrder = 6
          DesignSize = (
            98
            48)
          object UniLabel20: TUniLabel
            Left = 4
            Top = 1
            Width = 37
            Height = 15
            Hint = ''
            Caption = 'Estado'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UDBComboESTADO: TUniDBComboBox
            Left = 3
            Top = 18
            Width = 93
            Height = 29
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ESTADO'
            DataSource = dscrud
            Style = csDropDownList
            Items.Strings = (
              'SP'
              'PR'
              'MT'
              'MS'
              'SC'
              'RJ'
              'TO'
              'PA'
              'AM'
              'AC'
              'PB'
              'RN'
              'SE'
              'PE'
              'MG'
              'ES'
              'RO'
              'AP'
              'AL'
              'CE'
              'BA'
              'DF'
              'GO'
              'MA'
              'NO'
              'RS'
              'PI'
              'RR'
              'EX'
              'BR'
              '')
            ItemIndex = 0
            TabOrder = 2
            IconItems = <>
          end
        end
        object rcBlock330: TUniContainerPanel
          Tag = 1
          Left = 315
          Top = 158
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 9
          DesignSize = (
            150
            48)
          object UButDbEditIBGE: TUniButtonDbEdit
            Tag = 1
            Left = 3
            Top = 16
            Width = 145
            Height = 29
            Hint = ''
            DataField = 'IBGE'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Color = clInfoBk
            IconCls = 'search'
          end
          object UniLabel22: TUniLabel
            Left = 5
            Top = 1
            Width = 98
            Height = 15
            Hint = ''
            Caption = 'IBGE Faturamento'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock310: TUniContainerPanel
          Tag = 1
          Left = 5
          Top = 158
          Width = 140
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 7
          DesignSize = (
            140
            48)
          object UniDBEdit2: TUniDBEdit
            Left = 6
            Top = 16
            Width = 129
            Height = 29
            Hint = ''
            DataField = 'CPFCNPJ'
            DataSource = dscrud
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object UniLabel8: TUniLabel
            Left = 40
            Top = 0
            Width = 48
            Height = 15
            Hint = ''
            Caption = 'Cpf/Cnpj'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock320: TUniContainerPanel
          Tag = 1
          Left = 155
          Top = 158
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 8
          DesignSize = (
            150
            48)
          object UniLabel10: TUniLabel
            Left = 5
            Top = 0
            Width = 94
            Height = 15
            Hint = ''
            Caption = 'Insc. de Produtor'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBEdit3: TUniDBEdit
            Left = 2
            Top = 16
            Width = 145
            Height = 29
            Hint = ''
            DataField = 'INSCRICAO'
            DataSource = dscrud
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
      end
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = FDQryFiltro
    Left = 169
    Top = 247
  end
  object FDQryFiltro: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'PROPRIEDADES'
    SQL.Strings = (
      'select * from PROPRIEDADES')
    Left = 73
    Top = 239
    object FDQryFiltroSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
    end
    object FDQryFiltroCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object FDQryFiltroCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 100
    end
    object FDQryFiltroBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 100
    end
    object FDQryFiltroESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
    object FDQryFiltroNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
  end
  object dscrud: TDataSource
    AutoEdit = False
    DataSet = FDQryCad
    Left = 25
    Top = 239
  end
  object FDQryCad: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'PROPRIEDADES'
    SQL.Strings = (
      'SELECT * FROM PROPRIEDADES WHERE CODIGO = :CODIGO')
    Left = 121
    Top = 239
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
