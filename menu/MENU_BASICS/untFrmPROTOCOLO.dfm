inherited frmCADprotocolo: TfrmCADprotocolo
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      inherited paBaseTopTitle: TUniContainerPanel
        inherited btnQuickSearch: TUniBitBtn
          ScreenMask.Target = Owner
        end
      end
    end
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 988
      ScrollWidth = 37
      inherited paOF: TUniContainerPanel
        Margins.Left = 0
        Margins.Top = 20
        Align = alTop
        TabOrder = 4
        inherited btnCloseForm: TUniBitBtn
          Align = alTop
          TabOrder = 2
          LayoutConfig.Padding = '0 2 0 0'
        end
        inherited btnOptions: TUniBitBtn
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-cog | '#13#10'cls-ico:font-black'#13#10']]'
          Align = alTop
          TabOrder = 1
          LayoutConfig.Padding = '0 2 0 0'
        end
      end
      inherited paP: TUniContainerPanel
        Height = 39
        Margins.Top = 6
        Align = alTop
        TabOrder = 0
        ExplicitHeight = 39
        inherited btnSearch: TUniBitBtn
          Top = 0
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-search | '#13#10'cls-ico:font-black |'#13#10 +
            'hint:Abre para Pesquisas t:Search w:200 d:10000 c:rc-bg-info'#13#10']]' +
            #13#10
          Margins.Top = 0
          Align = alTop
          LayoutConfig.Padding = '0 2 0 0'
          ExplicitTop = 0
        end
      end
      inherited paNAE: TUniContainerPanel
        Height = 110
        Margins.Left = 0
        Margins.Top = 20
        Align = alTop
        TabOrder = 2
        ExplicitHeight = 110
        inherited btnNewReg: TUniBitBtn
          Align = alTop
          LayoutConfig.Padding = '0 2 0 0'
        end
        inherited btnEditReg: TUniBitBtn
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
          Align = alTop
          ScreenMask.Target = Owner
          LayoutConfig.Padding = '0 2 0 0'
        end
        inherited btnDeleteReg: TUniBitBtn
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
          Margins.Bottom = 0
          Align = alTop
          LayoutConfig.Padding = '0 2 0 0'
        end
      end
      inherited paGC: TUniContainerPanel
        Height = 73
        Margins.Left = 0
        Margins.Top = 20
        Align = alTop
        TabOrder = 3
        ExplicitHeight = 73
        inherited btnSaveReg: TUniBitBtn
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-check | '#13#10'cls-ico:font-black'#13#10']]'
          Align = alTop
          ScreenMask.Target = Owner
          LayoutConfig.Padding = '0 2 0 0'
        end
        inherited btnCancelReg: TUniBitBtn
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-times | '#13#10'cls-ico:font-black'#13#10']]'
          Align = alTop
          ScreenMask.Target = Owner
          LayoutConfig.Padding = '0 2 0 0'
        end
      end
    end
    inherited paBaseCadControl: TUniContainerPanel
      inherited pgBaseCadControl: TUniPageControl
        AlignWithMargins = True
        Left = 268
        Top = 2
        Width = 1092
        Height = 983
        Hint = ''
        ActivePage = tabRegister
        ExplicitLeft = 268
        ExplicitTop = 2
        ExplicitWidth = 1092
        ExplicitHeight = 983
        inherited tabSearch: TUniTabSheet
          ExplicitWidth = 1084
          ExplicitHeight = 955
          inherited paBaseRegSearch: TUniContainerPanel
            Width = 1084
            Height = 955
            ExplicitWidth = 1084
            ExplicitHeight = 955
            inherited paGridOffset: TUniContainerPanel
              Width = 1078
              Height = 947
              ExplicitWidth = 1078
              ExplicitHeight = 947
              inherited dbgSearchCRUD: TUniDBGrid
                Width = 1078
                Height = 947
                ForceFit = True
                Font.Height = -13
                Columns = <
                  item
                    FieldName = 'CODIGO'
                    Title.Caption = ' '
                    Width = 50
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'SITUACAO'
                    Title.Caption = 'SITUACAO'
                    Width = 100
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'DATAEMISSAO'
                    Title.Caption = 'EMISS'#195'O'
                    Width = 110
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'AMOSTRA'
                    Title.Caption = 'AMOSTRA'
                    Width = 120
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'BOLETIM'
                    Title.Caption = 'BOLETIM'
                    Width = 120
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'NUMEROIR'
                    Title.Caption = 'I.R.'
                    Width = 120
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'CATEGORIA'
                    Title.Caption = 'CAT.'
                    Width = 60
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'NOMEPESSOA'
                    Title.Caption = 'NOME'
                    Width = 350
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'CULTIVAR'
                    Title.Caption = 'CULTIVAR'
                    Width = 300
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end>
              end
            end
          end
        end
        inherited tabRegister: TUniTabSheet
          ExplicitWidth = 1084
          ExplicitHeight = 955
          inherited paBaseRegData1: TUniContainerPanel
            Width = 1084
            Height = 955
            ExplicitWidth = 1084
            ExplicitHeight = 955
            ScrollHeight = 955
            ScrollWidth = 1084
            object UniPageControlcadastros: TUniPageControl
              Left = 0
              Top = 0
              Width = 1084
              Height = 955
              Hint = ''
              ActivePage = UniTabSheetCRUD
              Align = alClient
              TabOrder = 1
              object UniTabSheetCRUD: TUniTabSheet
                Hint = ''
                Caption = 'Geral'
                object UniScrollBox2: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1076
                  Height = 925
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 539
                  ScrollWidth = 855
                  object rcBlock350: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 0
                    DesignSize = (
                      150
                      48)
                    object edCodigo: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CODIGO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Color = clWhite
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      TabOrder = 1
                      Color = clGray
                      ReadOnly = True
                    end
                    object UniLabel5: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 38
                      Height = 15
                      Hint = ''
                      Caption = 'C'#243'digo'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock360: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit1: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'AMOSTRA'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ReadOnly = True
                    end
                    object UniLabel8: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 53
                      Height = 15
                      Hint = ''
                      Caption = 'AMOSTRA'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock370: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      150
                      48)
                    object UniDBDateTimePicker2: TUniDBDateTimePicker
                      Tag = 1
                      Left = 2
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'DATAAMOSTRAGEM'
                      DataSource = dsMaster
                      DateTime = 44561.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel6: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 97
                      Height = 15
                      Hint = ''
                      Caption = 'Data Amostragem'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock380: TUniContainerPanel
                    Tag = 1
                    Left = 542
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      150
                      48)
                    object UniDBDateTimePicker1: TUniDBDateTimePicker
                      Tag = 1
                      Left = 2
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'DATARECEBIMENTO'
                      DataSource = dsMaster
                      DateTime = 44561.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel7: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 99
                      Height = 15
                      Hint = ''
                      Caption = 'Data Recebimento'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock390: TUniContainerPanel
                    Tag = 1
                    Left = 705
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'PESO_RECEBIDA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Color = clBlue
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold, fsItalic]
                      TabOrder = 1
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel9: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 128
                      Height = 15
                      Hint = ''
                      Caption = 'Peso Amostra Recebida'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock400: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 54
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'PESO_RECEBIDA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Color = clBlue
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold, fsItalic]
                      TabOrder = 1
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel10: TUniLabel
                      Left = 3
                      Top = 2
                      Width = 50
                      Height = 15
                      Hint = ''
                      Caption = 'Rep. 0,00'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock410: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 54
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 6
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit2: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'REPRESENTA_ESCRITA'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel11: TUniLabel
                      Left = 3
                      Top = 2
                      Width = 64
                      Height = 15
                      Hint = ''
                      Caption = 'Rep. Escrita'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock420: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 54
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 7
                    DesignSize = (
                      150
                      48)
                    object cbxdbpeneira: TUniDBComboBox
                      Left = 2
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'PENEIRA'
                      DataSource = dsMaster
                      Style = csDropDownList
                      TabOrder = 1
                      IconItems = <>
                    end
                    object UniLabel12: TUniLabel
                      Left = 2
                      Top = 2
                      Width = 42
                      Height = 15
                      Hint = ''
                      Caption = 'Peneira'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock430: TUniContainerPanel
                    Tag = 1
                    Left = 542
                    Top = 54
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 8
                    DesignSize = (
                      150
                      48)
                    object cbxdbcategoria: TUniDBComboBox
                      Tag = 1
                      Left = 2
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'CATEGORIA'
                      DataSource = dsMaster
                      Style = csDropDownList
                      TabOrder = 1
                      IconItems = <>
                    end
                    object UniLabel13: TUniLabel
                      Left = 2
                      Top = 2
                      Width = 53
                      Height = 15
                      Hint = ''
                      Caption = 'Categoria'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock440: TUniContainerPanel
                    Tag = 1
                    Left = 705
                    Top = 54
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 9
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit3: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'AMOSTRA'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel14: TUniLabel
                      Left = 3
                      Top = 2
                      Width = 67
                      Height = 15
                      Hint = ''
                      Caption = 'Safra V'#225'lida'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock450: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 106
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-1]]'
                    ParentColor = False
                    TabOrder = 10
                    DesignSize = (
                      150
                      48)
                    object UniButtonDbEditCEPP: TUniButtonDbEdit
                      Tag = 1
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'ESPECIE_CODIGO'
                      DataSource = dsMaster
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
                      Width = 41
                      Height = 15
                      Hint = ''
                      Caption = #201'specie'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock460: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 106
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 11
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit4: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'ESPECIE'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ReadOnly = True
                    end
                    object UniLabel16: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 99
                      Height = 15
                      Hint = ''
                      Caption = 'Descri'#231#227'o '#201'specie'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock470: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 106
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-1]]'
                    ParentColor = False
                    TabOrder = 12
                    DesignSize = (
                      150
                      48)
                    object UniButtonDbEdit1: TUniButtonDbEdit
                      Tag = 1
                      Left = 3
                      Top = 17
                      Width = 145
                      Height = 29
                      Hint = ''
                      DataField = 'CULTIVAR_CODIGO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      Color = clInfoBk
                      OnExit = UniButtonDbEdit1Exit
                      OnButtonClick = UniButtonDbEdit1ButtonClick
                      IconCls = 'search'
                    end
                    object UniLabel17: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 43
                      Height = 15
                      Hint = ''
                      Caption = 'Cultivar'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock480: TUniContainerPanel
                    Tag = 1
                    Left = 542
                    Top = 106
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 13
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit5: TUniDBEdit
                      Left = 2
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CULTIVAR'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ReadOnly = True
                    end
                    object UniLabel18: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 101
                      Height = 15
                      Hint = ''
                      Caption = 'Descri'#231#227'o Cultivar'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock490: TUniContainerPanel
                    Tag = 1
                    Left = 705
                    Top = 106
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 14
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit6: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'LOTE'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel19: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 22
                      Height = 15
                      Hint = ''
                      Caption = 'Lote'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock500: TUniContainerPanel
                    Left = 3
                    Top = 158
                    Width = 852
                    Height = 21
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    Color = clMoneyGreen
                    TabOrder = 15
                    object UniLabel21: TUniLabel
                      AlignWithMargins = True
                      Left = 2
                      Top = 1
                      Width = 251
                      Height = 19
                      Hint = '[[cols:12 | round:all]]'
                      Margins.Left = 6
                      Margins.Top = 6
                      Margins.Right = 6
                      Margins.Bottom = 6
                      AutoSize = False
                      Caption = 'DADOS DO REQUERENTE'
                      ParentFont = False
                      Font.Color = clGray
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                  end
                  object rcBlock510: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 183
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 16
                    DesignSize = (
                      150
                      48)
                    object UniLabel20: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 88
                      Height = 15
                      Hint = ''
                      Caption = 'C'#243'd. Requerente'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniButtonDbEdit2: TUniButtonDbEdit
                      Tag = 1
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'PESSOA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      Color = clInfoBk
                      OnExit = UniButtonDbEdit2Exit
                      OnButtonClick = UniButtonDbEdit2ButtonClick
                      IconCls = 'search'
                    end
                  end
                  object rcBlock520: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 183
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 17
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit7: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'NOMEPESSOA'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ReadOnly = True
                    end
                    object UniLabel22: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 112
                      Height = 15
                      Hint = ''
                      Caption = 'Nome do Requerente'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock530: TUniContainerPanel
                    Tag = 1
                    Left = 382
                    Top = 183
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 18
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit8: TUniDBEdit
                      Left = 2
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CPFCNPJ'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ReadOnly = True
                    end
                    object UniLabel23: TUniLabel
                      Left = 2
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
                  object rcBlock540: TUniContainerPanel
                    Tag = 1
                    Left = 558
                    Top = 183
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-1]]'
                    ParentColor = False
                    TabOrder = 19
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit9: TUniDBEdit
                      Left = 2
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'ESTADO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ReadOnly = True
                    end
                    object UniLabel24: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 19
                      Height = 15
                      Hint = ''
                      Caption = 'U.F.'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock550: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 235
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 20
                    DesignSize = (
                      150
                      48)
                    object UniButtonDbEdit3: TUniButtonDbEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'SIGLA_PROCEDENCIA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      Color = clInfoBk
                      OnExit = UniButtonDbEdit3Exit
                      OnButtonClick = UniButtonDbEdit3ButtonClick
                      IconCls = 'search'
                    end
                    object UniLabel25: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 109
                      Height = 15
                      Hint = ''
                      Caption = 'Cidade Proced'#234'ncia'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock560: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 235
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 21
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit10: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CIDADE_PROCEDENCIA'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ReadOnly = True
                    end
                    object UniLabel26: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 113
                      Height = 15
                      Hint = ''
                      Caption = 'Descri'#231#227'o da Cidade'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock570: TUniContainerPanel
                    Tag = 1
                    Left = 382
                    Top = 235
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 22
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit11: TUniDBEdit
                      Left = 2
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'ESTADO_PROCEDENCIA'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ReadOnly = True
                    end
                    object UniLabel27: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 19
                      Height = 15
                      Hint = ''
                      Caption = 'U.F.'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock580: TUniContainerPanel
                    Tag = 1
                    Left = 558
                    Top = 234
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-1]]'
                    ParentColor = False
                    TabOrder = 23
                    DesignSize = (
                      150
                      48)
                    object UniButtonDbEdit4: TUniButtonDbEdit
                      Tag = 1
                      Left = 2
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'RESPONSAVEL'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      Color = clInfoBk
                      OnButtonClick = UniButtonDbEdit4ButtonClick
                      IconCls = 'search'
                    end
                    object UniLabel28: TUniLabel
                      Left = 2
                      Top = 1
                      Width = 67
                      Height = 15
                      Hint = ''
                      Caption = 'R.T. Empresa'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock590: TUniContainerPanel
                    Left = 3
                    Top = 286
                    Width = 852
                    Height = 21
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    Color = clMoneyGreen
                    TabOrder = 24
                    object UniLabel29: TUniLabel
                      AlignWithMargins = True
                      Left = 2
                      Top = 2
                      Width = 251
                      Height = 19
                      Hint = '[[cols:12 | round:all]]'
                      Margins.Left = 6
                      Margins.Top = 6
                      Margins.Right = 6
                      Margins.Bottom = 6
                      AutoSize = False
                      Caption = 'DADOS DO PROTOCOLO'
                      ParentFont = False
                      Font.Color = clGray
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                  end
                  object rcBlock600: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 311
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 25
                    DesignSize = (
                      150
                      48)
                    object UniDBDateTimePicker3: TUniDBDateTimePicker
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'DATAEMISSAO'
                      DataSource = dsMaster
                      DateTime = 44561.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel30: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 81
                      Height = 15
                      Hint = ''
                      Caption = 'Emiss'#227'o BO/IR'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock610: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 311
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 26
                    DesignSize = (
                      150
                      48)
                    object UniButtonDbEdit5: TUniButtonDbEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'NUMEROIR'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      Color = clInfoBk
                      ReadOnly = True
                      IconCls = 'search'
                    end
                    object UniLabel31: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 33
                      Height = 15
                      Hint = ''
                      Caption = 'N'#186' I.R.'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock620: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 311
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 27
                    DesignSize = (
                      150
                      48)
                    object UniButtonDbEdit6: TUniButtonDbEdit
                      Left = 2
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'BOLETIM'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      Color = clInfoBk
                      ReadOnly = True
                      IconCls = 'search'
                    end
                    object UniLabel32: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 36
                      Height = 15
                      Hint = ''
                      Caption = 'N'#186' BAS'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock630: TUniContainerPanel
                    Tag = 1
                    Left = 542
                    Top = 311
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 28
                    DesignSize = (
                      150
                      48)
                    object UniButtonDbEdit7: TUniButtonDbEdit
                      Tag = 1
                      Left = 2
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'RTEMPRESA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      Color = clInfoBk
                      OnExit = UniButtonDbEdit7Exit
                      OnButtonClick = UniButtonDbEdit7ButtonClick
                      IconCls = 'search'
                    end
                    object UniLabel33: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 85
                      Height = 15
                      Hint = ''
                      Caption = 'R.T. Laborat'#243'rio'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock640: TUniContainerPanel
                    Tag = 1
                    Left = 705
                    Top = 311
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 29
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit12: TUniDBEdit
                      Left = 2
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'RTNOME'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ReadOnly = True
                    end
                    object UniLabel34: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 136
                      Height = 15
                      Hint = ''
                      Caption = 'Nome do R.T. Laborat'#243'rio'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock650: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 363
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 30
                    DesignSize = (
                      150
                      48)
                    object cbxdbtipoamostra: TUniDBComboBox
                      Tag = 1
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'ANALISE_RE'
                      DataSource = dsMaster
                      Style = csDropDownList
                      Items.Strings = (
                        'Analise'
                        'Reanalise')
                      TabOrder = 1
                      IconItems = <>
                    end
                    object UniLabel35: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 89
                      Height = 15
                      Hint = ''
                      Caption = 'Tipo de Amostra'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock660: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 363
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 31
                    DesignSize = (
                      150
                      48)
                    object cbxdbsituacao: TUniDBComboBox
                      Tag = 1
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'SITUACAO'
                      DataSource = dsMaster
                      Style = csDropDownList
                      Items.Strings = (
                        'Aberto'
                        'Aguarde'
                        'Fechado')
                      TabOrder = 1
                      IconItems = <>
                    end
                    object UniLabel36: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 48
                      Height = 15
                      Hint = ''
                      Caption = 'Situa'#231#227'o'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock670: TUniContainerPanel
                    Tag = 1
                    Left = 382
                    Top = 363
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 32
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'PESO_RECEBIDA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Color = clBlue
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold, fsItalic]
                      TabOrder = 1
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel37: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 79
                      Height = 15
                      Hint = ''
                      Caption = 'Valor Cobrado'
                      ParentFont = False
                      Font.Color = clRed
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock680: TUniContainerPanel
                    Left = 3
                    Top = 415
                    Width = 852
                    Height = 124
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 33
                    object UniDBCheckBox1: TUniDBCheckBox
                      Left = 5
                      Top = 16
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'PUREZA'
                      DataSource = dsMaster
                      Caption = 'PUREZA'
                      TabOrder = 1
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox2: TUniDBCheckBox
                      Left = 108
                      Top = 16
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'TETRAZOLIO'
                      DataSource = dsMaster
                      Caption = 'TETRAZ'#211'LIO'
                      TabOrder = 2
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox3: TUniDBCheckBox
                      Left = 211
                      Top = 16
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'UMIDADE'
                      DataSource = dsMaster
                      Caption = 'UMIDADE'
                      TabOrder = 3
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox4: TUniDBCheckBox
                      Left = 314
                      Top = 16
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'GERMINACAO'
                      DataSource = dsMaster
                      Caption = 'GERMINA'#199#195'O'
                      TabOrder = 4
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox5: TUniDBCheckBox
                      Left = 428
                      Top = 16
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'DOSN'
                      DataSource = dsMaster
                      Caption = 'DOSN'
                      TabOrder = 5
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox6: TUniDBCheckBox
                      Left = 5
                      Top = 52
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'VE'
                      DataSource = dsMaster
                      Caption = 'V.E.'
                      TabOrder = 6
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox7: TUniDBCheckBox
                      Left = 108
                      Top = 52
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'PMS'
                      DataSource = dsMaster
                      Caption = 'P.M.S.'
                      TabOrder = 7
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox8: TUniDBCheckBox
                      Left = 211
                      Top = 52
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'SI'
                      DataSource = dsMaster
                      Caption = 'S.I.'
                      TabOrder = 8
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox9: TUniDBCheckBox
                      Left = 314
                      Top = 52
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'VOC'
                      DataSource = dsMaster
                      Caption = 'V.O.C.'
                      TabOrder = 9
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox10: TUniDBCheckBox
                      Left = 428
                      Top = 52
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'VIGOR'
                      DataSource = dsMaster
                      Caption = 'VIGOR'
                      TabOrder = 10
                      ParentColor = False
                      Color = clBtnFace
                    end
                  end
                end
              end
            end
          end
        end
      end
      inherited paSearchFilters: TUniPanel
        Left = 0
        Top = 0
        Width = 266
        Height = 993
        Hint = ''
        Align = alLeft
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 266
        ExplicitHeight = 993
        inherited UniScrollBox1: TUniScrollBox
          Height = 581
          ExplicitHeight = 581
          ScrollHeight = 746
          ScrollWidth = 261
          inherited paSearchFilterAndOr: TUniContainerPanel
            inherited paSearchFilterDescendent: TUniContainerPanel
              ExplicitTop = 3
            end
          end
          inherited paSearchBtn: TUniContainerPanel
            inherited btnSearchCRUD: TUniBitBtn
              ScreenMask.Target = Owner
            end
          end
          object UniContainerPanel1: TUniContainerPanel
            AlignWithMargins = True
            Left = 10
            Top = 229
            Width = 251
            Height = 127
            Hint = ''
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            ParentColor = False
            Color = 15724527
            AlignmentControl = uniAlignmentClient
            ParentAlignmentControl = False
            TabOrder = 10
            DesignSize = (
              251
              127)
            object UniContainerPanel3: TUniContainerPanel
              AlignWithMargins = True
              Left = 0
              Top = 69
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
              object UniLabel4: TUniLabel
                AlignWithMargins = True
                Left = 4
                Top = 5
                Width = 37
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Ordem'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object UniComboBoxCRUDordem: TUniComboBox
                AlignWithMargins = True
                Left = 4
                Top = 31
                Width = 246
                Height = 29
                Hint = ''
                Margins.Right = 5
                Style = csDropDownList
                Text = ''
                Items.Strings = (
                  'Lote'
                  'Nome'
                  'Numero I.R.'
                  'Numero Boletim'
                  'Numero Amostra')
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
                IconItems = <>
              end
            end
            object UniComboBoxCRUDstatus: TUniComboBox
              AlignWithMargins = True
              Left = 4
              Top = 29
              Width = 246
              Height = 29
              Hint = ''
              Margins.Right = 5
              Style = csDropDownList
              Text = ''
              Items.Strings = (
                'Aberto'
                'Andamento'
                'Fechada'
                'Confirma'#231#227'o'
                'Todos')
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
              IconItems = <>
            end
            object UniLabel3: TUniLabel
              AlignWithMargins = True
              Left = 4
              Top = 9
              Width = 34
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'Status'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 3
            end
          end
        end
      end
      inherited paSearchFiltersCustom: TUniPanel
        inherited sboxSearchFiltersCustom: TUniScrollBox
          ScrollHeight = 33
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    Left = 939
    Top = 7
  end
  inherited dsSearchMaster: TDataSource
    Left = 875
    Top = 7
  end
  inherited sqlSearchMaster: TFDQuery
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'PROTOCOLO'
    SQL.Strings = (
      'select'
      'CODIGO,SITUACAO,'
      'PLATAFORMA , DATAEMISSAO, AMOSTRA, BOLETIM, NUMEROIR,'
      'CATEGORIA, NOMEPESSOA, CULTIVAR'
      'from PROTOCOLO')
    Left = 905
    Top = 7
    object sqlSearchMasterPLATAFORMA: TStringField
      FieldName = 'PLATAFORMA'
      Origin = 'PLATAFORMA'
      Size = 10
    end
    object sqlSearchMasterDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'DATAEMISSAO'
    end
    object sqlSearchMasterAMOSTRA: TStringField
      FieldName = 'AMOSTRA'
      Origin = 'AMOSTRA'
      Size = 10
    end
    object sqlSearchMasterBOLETIM: TStringField
      FieldName = 'BOLETIM'
      Origin = 'BOLETIM'
      Size = 10
    end
    object sqlSearchMasterNUMEROIR: TStringField
      FieldName = 'NUMEROIR'
      Origin = 'NUMEROIR'
      Size = 10
    end
    object sqlSearchMasterCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
      Size = 8
    end
    object sqlSearchMasterNOMEPESSOA: TStringField
      FieldName = 'NOMEPESSOA'
      Origin = 'NOMEPESSOA'
      Size = 80
    end
    object sqlSearchMasterCULTIVAR: TStringField
      FieldName = 'CULTIVAR'
      Origin = 'CULTIVAR'
      Size = 250
    end
    object sqlSearchMasterCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
      OnGetText = sqlSearchMasterCODIGOGetText
    end
    object sqlSearchMasterSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      OnGetText = sqlSearchMasterSITUACAOGetText
      Size = 10
    end
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'PROTOCOLO'
    SQL.Strings = (
      'SELECT * FROM PROTOCOLO WHERE CODIGO = :CODIGO')
    Left = 969
    Top = 7
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 847
    Top = 7
    object GINFORMATIVO: TUniMenuItem
      Caption = 'Gerar N'#186' de INFORMATIVO'
      ImageIndex = 27
    end
    object N1Prot: TUniMenuItem
      Caption = '-'
    end
    object GBAS: TUniMenuItem
      Caption = 'Gerar N'#186' do BAS'
      ImageIndex = 61
    end
  end
end
