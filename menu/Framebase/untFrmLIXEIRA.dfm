object frmLIXEIRA: TfrmLIXEIRA
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '<i class="fas fa-recycle">   Lixeira do Sistema</i>'
  ClientHeight = 514
  ClientWidth = 895
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  OnShow = UniFormShow
  TextHeight = 15
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 895
    Height = 514
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object paBaseButtons: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 44
      Height = 514
      Hint = ''
      Margins.Left = 4
      Margins.Top = 2
      Margins.Right = 6
      ParentColor = False
      Color = clWindow
      Align = alLeft
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      AutoScroll = True
      TabOrder = 1
      ScrollHeight = 514
      ScrollWidth = 44
      object btnSearch: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 5
        Width = 40
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-search | '#13#10'cls-ico:font-black |'#13#10 +
          'hint:Abre para Pesquisas t:Search w:200 d:10000 c:rc-bg-info'#13#10']]' +
          #13#10
        Margins.Left = 2
        Margins.Top = 5
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-search"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnSearchClick
      end
      object btnCloseForm: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 59
        Width = 40
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-sign-out-alt rc-mirror-h | '#13#10'cls' +
          '-ico:font-black'#13#10']]'
        Margins.Left = 2
        Margins.Top = 20
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-sign-out-alt"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 2
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnCloseFormClick
      end
    end
    object paSearchFilters: TUniPanel
      Left = 44
      Top = 0
      Width = 266
      Height = 514
      Hint = ''
      Margins.Top = 0
      Margins.Right = 0
      Align = alLeft
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
      BorderStyle = ubsNone
      Title = 'Filtros da Pesquisa'
      Caption = ''
      CollapseDirection = cdLeft
      object UniScrollBox1: TUniScrollBox
        Left = 0
        Top = 0
        Width = 266
        Height = 514
        Hint = ''
        Margins.Left = 0
        Margins.Right = 0
        Align = alClient
        Color = 15724527
        TabOrder = 1
        ScrollHeight = 270
        ScrollWidth = 262
        object paSearchFilter1: TUniContainerPanel
          AlignWithMargins = True
          Left = 12
          Top = 49
          Width = 250
          Height = 178
          Hint = ''
          Margins.Left = 10
          Margins.Top = 6
          Margins.Right = 0
          Margins.Bottom = 0
          ParentColor = False
          Color = 15724527
          TabOrder = 1
          object paSearchField1: TUniContainerPanel
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 249
            Height = 60
            Hint = ''
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            ParentColor = False
            TabOrder = 0
            DesignSize = (
              249
              60)
            object UniLabelc1: TUniLabel
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 52
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'Conteudo'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object edSearchCRUDconteudo: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 25
              Width = 246
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
              ClearButton = True
            end
          end
          object paSearchOp1: TUniContainerPanel
            AlignWithMargins = True
            Left = 0
            Top = 59
            Width = 250
            Height = 60
            Hint = ''
            Margins.Left = 0
            Margins.Top = 8
            Margins.Bottom = 0
            ParentColor = False
            TabOrder = 2
            object UniContainerPanel2: TUniContainerPanel
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 250
              Height = 60
              Hint = ''
              Margins.Left = 0
              Margins.Top = 8
              Margins.Bottom = 0
              ParentColor = False
              TabOrder = 1
              DesignSize = (
                250
                60)
              object cbxSearchCRUDordem: TUniComboBox
                AlignWithMargins = True
                Left = 3
                Top = 31
                Width = 246
                Height = 29
                Hint = ''
                Margins.Right = 5
                Style = csDropDownList
                Text = ''
                Items.Strings = (
                  'Tabela'
                  'Usuarios'
                  'Conteudo Dados')
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
                Top = 9
                Width = 37
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Ordem'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
              end
            end
          end
          object UniContainerPanel3: TUniContainerPanel
            AlignWithMargins = True
            Left = 0
            Top = 118
            Width = 250
            Height = 60
            Hint = ''
            Margins.Left = 0
            Margins.Top = 8
            Margins.Bottom = 0
            ParentColor = False
            TabOrder = 3
            object UniContainerPanel5: TUniContainerPanel
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 250
              Height = 60
              Hint = ''
              Margins.Left = 0
              Margins.Top = 8
              Margins.Bottom = 0
              ParentColor = False
              TabOrder = 1
              DesignSize = (
                250
                60)
              object UniComboBoxCRUDordem: TUniComboBox
                AlignWithMargins = True
                Left = 3
                Top = 29
                Width = 246
                Height = 29
                Hint = ''
                Margins.Right = 5
                Style = csDropDownList
                Text = ''
                Items.Strings = (
                  'Excluido'
                  'Restaurado'
                  'Todos')
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
                Top = 9
                Width = 30
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Filtro'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
              end
            end
          end
        end
        object labTitleSearch: TUniLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 158
          Height = 23
          Hint = ''
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 0
          Margins.Bottom = 10
          TextConversion = txtHTML
          Caption = 'Pesquisar Registro(s)'
          Align = alTop
          ParentFont = False
          Font.Color = clGray
          Font.Height = -19
          Font.Name = 'Calibri Light'
          ParentColor = False
          Color = clSilver
          TabOrder = 0
        end
        object paSearchBtn: TUniContainerPanel
          AlignWithMargins = True
          Left = 12
          Top = 234
          Width = 235
          Height = 36
          Hint = ''
          Margins.Left = 10
          Margins.Top = 12
          Margins.Right = 0
          Margins.Bottom = 0
          ParentColor = False
          Color = 15724527
          TabOrder = 2
          object btnSearchCRUD: TUniBitBtn
            AlignWithMargins = True
            Left = 6
            Top = 2
            Width = 228
            Height = 30
            Hint = '[['#13#10'cls:ButtonThemeCrud-no-border-left |'#13#10'ico:fas-search |'#13#10']]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = '<i class="fas fa-search"> Pesquisar</i>'
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 1
            OnClick = btnSearchCRUDClick
          end
        end
      end
    end
    object dbgSearchCRUD: TUniDBGrid
      Left = 310
      Top = 0
      Width = 585
      Height = 514
      Hint = ''
      DataSource = dslixeira
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
      WebOptions.Paged = False
      WebOptions.FetchAll = True
      LoadMask.Message = 'Loading data...'
      ForceFit = True
      Align = alClient
      Font.Height = -13
      Font.Name = 'Calibri'
      ParentFont = False
      TabOrder = 3
      Exporter.Enabled = True
      OnMouseDown = dbgSearchCRUDMouseDown
      OnCellClick = dbgSearchCRUDCellClick
      Columns = <
        item
          FieldName = 'marcador'
          Title.Caption = ' '
          Width = 30
          Font.Name = 'Calibri'
          Alignment = taCenter
          ReadOnly = True
        end
        item
          FieldName = 'STATUS'
          Title.Caption = ' '
          Width = 80
          Font.Name = 'Calibri'
          Alignment = taCenter
          ReadOnly = True
        end
        item
          FieldName = 'DATA'
          Title.Caption = 'DATA'
          Width = 100
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'HORA'
          Title.Caption = 'HORA'
          Width = 74
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'TABELA'
          Title.Caption = 'TABELA'
          Width = 200
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'USUARIO'
          Title.Caption = 'USUARIO'
          Width = 200
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'opcoes'
          Title.Caption = ' '
          Width = 30
          Font.Name = 'Calibri'
          Alignment = taCenter
          ReadOnly = True
        end>
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = FDQryFiltro
    Left = 11
    Top = 310
  end
  object FDQryFiltro: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    Left = 43
    Top = 310
  end
  object tblixeira: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 92
    Top = 415
    object tblixeiraDADOS: TBlobField
      FieldName = 'DADOS'
    end
    object tblixeiraTABELA: TStringField
      FieldName = 'TABELA'
      Size = 30
    end
    object tblixeiraDATA: TDateField
      FieldName = 'DATA'
    end
    object tblixeiraHORA: TTimeField
      FieldName = 'HORA'
    end
    object tblixeiraUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 80
    end
    object tblixeiraSTATUS: TStringField
      FieldName = 'STATUS'
      OnGetText = tblixeiraSTATUSGetText
    end
    object tblixeiraCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblixeiraopcoes: TStringField
      FieldName = 'opcoes'
      OnGetText = tblixeiraopcoesGetText
      Size = 0
    end
    object tblixeiramarcador: TStringField
      FieldName = 'marcador'
      OnGetText = tblixeiramarcadorGetText
      Size = 1
    end
  end
  object dslixeira: TDataSource
    AutoEdit = False
    DataSet = tblixeira
    Left = 59
    Top = 414
  end
  object UniPopupMenudetalhes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 79
    Top = 310
    object V1: TUniMenuItem
      Caption = 'Recuperar o Registro'
      ImageIndex = 57
      OnClick = V1Click
    end
  end
  object dsfdqrycad: TDataSource
    AutoEdit = False
    DataSet = memtable
    Left = 91
    Top = 454
  end
  object memtable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 55
    Top = 456
  end
end
