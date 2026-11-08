inherited frmBaseReportMenu: TfrmBaseReportMenu
  Height = 685
  OnDestroy = UniFrameDestroy
  AlignmentControl = uniAlignmentServer
  ExplicitHeight = 685
  DesignSize = (
    1020
    685)
  inherited paBaseBackGround: TUniContainerPanel
    AlignWithMargins = True
    Left = 15
    Top = 15
    Width = 990
    Height = 655
    Hint = '[['#13#10'round:all'#13#10']]'
    Margins.Left = 15
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 15
    Color = clWhite
    AlignmentControl = uniAlignmentServer
    ParentAlignmentControl = False
    ExplicitLeft = 15
    ExplicitTop = 15
    ExplicitWidth = 990
    ExplicitHeight = 620
    inherited paBaseTop: TUniContainerPanel
      Width = 990
      Height = 46
      Hint = '[['#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
      Color = clBtnFace
      ExplicitWidth = 990
      ExplicitHeight = 46
      DesignSize = (
        990
        46)
      object labDownloadReport: TUniLabel
        Left = 946
        Top = 12
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-download |'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Visible = False
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'D'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 9
        OnClick = labDownloadReportClick
      end
      object labOptionsReport: TUniLabel
        Left = 946
        Top = 10
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-bars |'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Visible = False
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '='
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 10
        OnClick = labOptionsReportClick
      end
      object labState: TUniLabel
        AlignWithMargins = True
        Left = 804
        Top = 16
        Width = 176
        Height = 22
        Hint = ''
        Margins.Left = 8
        Margins.Top = 12
        Margins.Right = 8
        Margins.Bottom = 6
        Visible = False
        Alignment = taRightJustify
        TextConversion = txtHTML
        AutoSize = False
        Caption = '[ consultando ]'
        Anchors = [akRight, akBottom]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentColor = False
        Color = clWhite
        TabOrder = 1
      end
      object btnOptions: TUniBitBtn
        AlignWithMargins = True
        Left = 643
        Top = 5
        Width = 33
        Height = 32
        Hint = '[['#13#10'ico:fas-bars |'#13#10']]'
        Margins.Left = 7
        Margins.Top = 5
        Margins.Right = 6
        Margins.Bottom = 5
        Visible = False
        Caption = '='
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -21
        Font.Name = 'Calibri Light'
        TabOrder = 2
        ScaleButton = False
        OnClick = btnOptionsClick
      end
      object btnExit: TUniBitBtn
        AlignWithMargins = True
        Left = 524
        Top = 5
        Width = 33
        Height = 32
        Hint = '[['#13#10'ico:fas-sign-out-alt rc-mirror-h'#13#10']]'
        Margins.Left = 7
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        Visible = False
        Caption = '<'
        ParentFont = False
        Font.Height = -21
        Font.Name = 'Calibri Light'
        TabOrder = 3
        ScaleButton = False
        OnClick = btnExitClick
      end
      object btnSaveReport: TUniBitBtn
        AlignWithMargins = True
        Left = 605
        Top = 5
        Width = 33
        Height = 32
        Hint = '[['#13#10'ico:fas-download |'#13#10']]'
        Margins.Left = 7
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 5
        Enabled = False
        Visible = False
        Caption = 'D'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -21
        Font.Name = 'Calibri Light'
        TabOrder = 4
        ScaleButton = False
        OnClick = btnSaveReportClick
      end
      object btnProcessReport: TUniBitBtn
        AlignWithMargins = True
        Left = 567
        Top = 5
        Width = 33
        Height = 32
        Hint = '[['#13#10'ico:fas-bolt |'#13#10']]'
        Margins.Left = 7
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 5
        Visible = False
        Caption = '!'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -21
        Font.Name = 'Calibri Light'
        TabOrder = 5
        ScaleButton = False
        ScreenMask.WaitData = True
        ScreenMask.Target = Owner
        OnClick = btnProcessReportClick
      end
      object labTitleForm: TUniLabel
        AlignWithMargins = True
        Left = 53
        Top = 10
        Width = 37
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-16'#13#10']]'
        Margins.Left = 2
        Margins.Top = 6
        Margins.Bottom = 8
        TextConversion = txtHTML
        Caption = 'Title'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 6
      end
      object labExit: TUniLabel
        Left = 8
        Top = 10
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-sign-out-alt rc-mirror-h'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 7
        OnClick = labExitClick
      end
      object labShowReport: TUniLabel
        Left = 946
        Top = 12
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-print |'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '!'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 8
        OnClick = labShowReportClick
      end
    end
    object pgBaseCadControl: TUniPageControl
      AlignWithMargins = True
      Left = 4
      Top = 50
      Width = 982
      Height = 601
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ActivePage = tabSearch
      Align = alClient
      TabOrder = 2
      OnChange = pgBaseCadControlChange
      ExplicitHeight = 566
      object tabSearch: TUniTabSheet
        Hint = ''
        Caption = 'Op'#231#245'es'
        Font.Height = -13
        Font.Name = 'Calibri'
        ParentFont = False
        ExplicitHeight = 536
        object paBaseRegSearch: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 974
          Height = 571
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          ExplicitHeight = 536
          object sbox: TUniScrollBox
            Left = 0
            Top = 0
            Width = 974
            Height = 571
            Hint = ''
            Margins.Left = 0
            Margins.Right = 0
            Align = alClient
            Color = clWhite
            TabOrder = 1
            ScrollHeight = 566
            ScrollWidth = 935
            object paRelatorioOpcoes: TUniContainerPanel
              AlignWithMargins = True
              Left = 6
              Top = 6
              Width = 0
              Height = 15
              Hint = ''
              Margins.Right = 0
              Visible = False
              ParentColor = False
              Color = 15395562
              TabOrder = 0
            end
            object paReportFilters: TUniContainerPanel
              AlignWithMargins = True
              Left = 12
              Top = 9
              Width = 0
              Height = 8
              Hint = ''
              Margins.Left = 0
              ParentColor = False
              Color = 15395562
              TabOrder = 1
            end
            object rcBlock80: TUniContainerPanel
              Tag = 1
              Left = 8
              Top = 165
              Width = 265
              Height = 400
              Hint = '[['#13#10'cols:xs-12 sm-12 md-4 |'#13#10']]'#13#10
              ParentColor = False
              ParentAlignmentControl = False
              TabOrder = 2
              object paOptionsTitle: TUniContainerPanel
                Left = 0
                Top = 0
                Width = 265
                Height = 32
                Hint = '[['#13#10'round:t | '#13#10'cls:card-light|'#13#10']]'
                ParentColor = False
                Color = clSilver
                Align = alTop
                TabOrder = 1
                DesignSize = (
                  265
                  32)
                object UniLabel3: TUniLabel
                  AlignWithMargins = True
                  Left = 6
                  Top = 0
                  Width = 259
                  Height = 29
                  Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                  Margins.Left = 6
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  AutoSize = False
                  Caption = 'Op'#231#245'es de Relat'#243'rio'
                  ParentFont = False
                  Font.Color = clGray
                  Font.Height = -16
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object UniLabel4: TUniLabel
                  Left = 241
                  Top = 8
                  Width = 10
                  Height = 26
                  Hint = 
                    '[['#13#10'collapse:rcBlock80 off-paOptionsTitle |'#13#10'center:parent y'#13#10']]' +
                    #13#10
                  Visible = False
                  TextConversion = txtHTML
                  Caption = '^'
                  Anchors = [akTop, akRight]
                  ParentFont = False
                  Font.Height = -21
                  Font.Name = 'Calibri'
                  ParentColor = False
                  Color = clBlack
                  TabOrder = 2
                  ExplicitLeft = 371
                end
              end
              object paOpcoes: TUniPanel
                AlignWithMargins = True
                Left = 1
                Top = 33
                Width = 263
                Height = 366
                Hint = '[[round:no | cls:card-info-box-white]]'
                Margins.Left = 1
                Margins.Top = 1
                Margins.Right = 1
                Margins.Bottom = 1
                Align = alClient
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = clWhite
                ExplicitTop = 43
                ExplicitWidth = 393
                ExplicitHeight = 356
                DesignSize = (
                  263
                  366)
                object lbxReportOptions: TUniListBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 6
                  Width = 252
                  Height = 335
                  Hint = ''
                  Margins.Left = 5
                  Margins.Top = 6
                  Margins.Right = 6
                  Margins.Bottom = 25
                  Items.Strings = (
                    'Vendas no Per'#237'odo'
                    'Apura'#231#227'o de ICMS'
                    'Curva ABC Pessoa'
                    'Curva ABC Produtos')
                  Align = alClient
                  TabOrder = 1
                  ParentFont = False
                  Font.Height = -13
                  BorderStyle = ubsNone
                  OnChange = lbxReportOptionsChange
                  ExplicitWidth = 382
                  ExplicitHeight = 325
                end
                object chkReportGreenBar: TUniCheckBox
                  Left = 11
                  Top = 339
                  Width = 118
                  Height = 22
                  Hint = ''
                  Checked = True
                  Caption = 'Zebrado'
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  Anchors = [akLeft, akBottom]
                  TabOrder = 2
                  Color = clWhite
                  ExplicitTop = 329
                end
                object chkReportHeader: TUniCheckBox
                  Left = 110
                  Top = 339
                  Width = 124
                  Height = 22
                  Hint = ''
                  Caption = 'Sem Cabe'#231'alho'
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  Anchors = [akLeft, akBottom]
                  TabOrder = 3
                  Color = clWhite
                  ExplicitTop = 329
                end
              end
            end
            object rcBlock10: TUniContainerPanel
              Tag = 1
              Left = 9
              Top = 1
              Width = 783
              Height = 156
              Hint = '[['#13#10'cols:xs-12 sm-12 md-8 | '#13#10'cls:card-info-box-white'#13#10']]'#13#10#13#10
              Enabled = False
              ParentColor = False
              Color = clWhite
              ParentAlignmentControl = False
              TabOrder = 3
              object rcBlock12: TUniContainerPanel
                Left = 0
                Top = 0
                Width = 708
                Height = 33
                Hint = '[['#13#10'cols:12 |'#13#10'noborder-all|'#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
                ParentColor = False
                Color = clSilver
                TabOrder = 1
                DesignSize = (
                  708
                  33)
                object UniLabel1: TUniLabel
                  AlignWithMargins = True
                  Left = 6
                  Top = 0
                  Width = 702
                  Height = 33
                  Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                  Margins.Left = 6
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  AutoSize = False
                  Caption = 'Filtrar por Per'#237'odo'
                  Align = alClient
                  ParentFont = False
                  Font.Color = clGray
                  Font.Height = -16
                  Font.Name = 'Calibri'
                  TabOrder = 1
                  ExplicitTop = -5
                  ExplicitHeight = 38
                end
                object labRcCollapse3: TUniLabel
                  Left = 684
                  Top = 8
                  Width = 10
                  Height = 26
                  Hint = '[['#13#10'collapse:rcBlock10 off-rcBlock12 |'#13#10'center:parent y'#13#10']]'#13#10
                  Visible = False
                  TextConversion = txtHTML
                  Caption = '^'
                  Anchors = [akTop, akRight]
                  ParentFont = False
                  Font.Height = -21
                  Font.Name = 'Calibri'
                  ParentColor = False
                  Color = clBlack
                  TabOrder = 2
                end
              end
              object rcBlock15: TUniContainerPanel
                Tag = 1
                Left = 6
                Top = 36
                Width = 161
                Height = 52
                Hint = '[['#13#10'cols:xs-12 sm-12 md-6 |'#13#10']]'
                ParentColor = False
                Color = clWhite
                TabOrder = 2
                DesignSize = (
                  161
                  52)
                object labReportPeriod: TUniLabel
                  AlignWithMargins = True
                  Left = 0
                  Top = 1
                  Width = 148
                  Height = 15
                  Hint = ''
                  AutoSize = False
                  Caption = 'Per'#237'odo Pr'#233'-Definido'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object cbxSearchCRUDPeriod: TUniComboBox
                  AlignWithMargins = True
                  Left = 1
                  Top = 17
                  Width = 159
                  Height = 32
                  Hint = ''
                  Margins.Right = 5
                  Text = ''
                  Items.Strings = (
                    ''
                    'Hoje'
                    'Ontem'
                    'Antes de Ontem'
                    'Amanh'#227
                    'Depois de Amanh'#227
                    'Essa Semana'
                    'Semana Passada'
                    'Pr'#243'xima Semana'
                    'Essa Quinzena'
                    'Quinzena Passada'
                    'Pr'#243'xima Quinzena'
                    'Esse M'#234's'
                    'M'#234's Passado'
                    'Pr'#243'ximo M'#234's'
                    'Nesse Bimestre'
                    'Nesse Trimestre'
                    'Nesse Semestre'
                    'Nesse Ano'
                    'Ano Passado'
                    'Processar Tudo'
                    'Processar Tudo: At'#233' Hoje')
                  ItemIndex = 1
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  IconItems = <>
                  OnChange = cbxSearchCRUDPeriodChange
                end
              end
              object rcBlock20: TUniContainerPanel
                Tag = 1
                Left = 181
                Top = 37
                Width = 161
                Height = 51
                Hint = '[['#13#10'cols:xs-12 sm-12 md-6 '#13#10']]'#13#10
                ParentColor = False
                Color = clWhite
                TabOrder = 3
                DesignSize = (
                  161
                  51)
                object labReportFieldFilter: TUniLabel
                  AlignWithMargins = True
                  Left = 0
                  Top = 0
                  Width = 137
                  Height = 15
                  Hint = ''
                  AutoSize = False
                  Caption = 'Filtrar Campo Data...'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object cbxSearchCRUDFieldDate: TUniComboBox
                  AlignWithMargins = True
                  Left = 1
                  Top = 16
                  Width = 159
                  Height = 32
                  Hint = ''
                  Margins.Right = 5
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  IconItems = <>
                  OnChange = cbxSearchCRUDFieldDateChange
                end
                object cbxSearchCRUDFieldDate_Fields: TUniComboBox
                  AlignWithMargins = True
                  Left = 116
                  Top = 1
                  Width = 34
                  Height = 23
                  Hint = ''
                  Visible = False
                  Text = ''
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 3
                  IconItems = <>
                end
              end
              object rcBlock25: TUniContainerPanel
                Tag = 1
                Left = 6
                Top = 90
                Width = 159
                Height = 52
                Hint = '[['#13#10'cols:xs-12 sm-12 md-6 '#13#10']]'
                ParentColor = False
                Color = clWhite
                TabOrder = 4
                DesignSize = (
                  159
                  52)
                object labDtIni: TUniLabel
                  AlignWithMargins = True
                  Left = 6
                  Top = -1
                  Width = 106
                  Height = 15
                  Hint = ''
                  AutoSize = False
                  Caption = 'Data Inicial'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object edSearchCRUDDtIni: TUniEdit
                  Left = 3
                  Top = 16
                  Width = 153
                  Height = 32
                  Hint = ''
                  Text = ''
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  InputMask.Mask = '99/99/9999'
                  InputType = 'text'
                end
              end
              object rcBlock30: TUniContainerPanel
                Tag = 1
                Left = 182
                Top = 90
                Width = 159
                Height = 51
                Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
                ParentColor = False
                Color = clWhite
                TabOrder = 5
                DesignSize = (
                  159
                  51)
                object labDtFim: TUniLabel
                  AlignWithMargins = True
                  Left = 3
                  Top = -2
                  Width = 109
                  Height = 15
                  Hint = ''
                  AutoSize = False
                  Caption = 'Data Final'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object edSearchCRUDDtEnd: TUniEdit
                  Left = 3
                  Top = 16
                  Width = 154
                  Height = 32
                  Hint = ''
                  Text = ''
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  InputMask.Mask = '99/99/9999'
                  InputType = 'text'
                  ExplicitWidth = 156
                end
              end
              object cbxModelReport_form: TUniComboBox
                AlignWithMargins = True
                Left = 318
                Top = 3
                Width = 66
                Height = 23
                Hint = ''
                Visible = False
                Text = ''
                Items.Strings = (
                  '1'
                  '2'
                  '3'
                  '4'
                  '5')
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 6
                IconItems = <>
              end
            end
            object rcBlock100: TUniContainerPanel
              Tag = 1
              Left = 279
              Top = 166
              Width = 537
              Height = 400
              Hint = '[['#13#10'cols:xs-12 sm-12 md-4 | '#13#10'cls:card-info-box-white |'#13#10']]'#13#10
              ParentColor = False
              ParentAlignmentControl = False
              TabOrder = 4
              object paRepFilters: TUniPanel
                AlignWithMargins = True
                Left = 1
                Top = 3
                Width = 8
                Height = 12
                Hint = '[[round:no | cls:card-info-box-white]]'
                Margins.Left = 1
                Margins.Top = 1
                Margins.Right = 1
                Margins.Bottom = 1
                Visible = False
                TabOrder = 1
                BorderStyle = ubsNone
                Caption = ''
                Color = clWhite
              end
              object rcBlock110: TUniContainerPanel
                Left = 0
                Top = 0
                Width = 537
                Height = 32
                Hint = '[['#13#10'cols:12 |'#13#10'noborder-all|'#13#10'round:t | '#13#10'cls:card-light'#13#10']]'#13#10
                ParentColor = False
                Color = clSilver
                TabOrder = 2
                object UniLabel2: TUniLabel
                  AlignWithMargins = True
                  Left = 6
                  Top = 0
                  Width = 531
                  Height = 31
                  Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                  Margins.Left = 6
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  AutoSize = False
                  Caption = 'Outras Op'#231#245'es'
                  ParentFont = False
                  Font.Color = clGray
                  Font.Height = -16
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
              end
              object rcBlock115: TUniContainerPanel
                Left = 6
                Top = 50
                Width = 155
                Height = 62
                Hint = '[[cols:xs-12 sm-4 md-6]]'
                ParentColor = False
                TabOrder = 3
                DesignSize = (
                  155
                  62)
                object labOrdem: TUniLabel
                  AlignWithMargins = True
                  Left = 2
                  Top = 2
                  Width = 37
                  Height = 15
                  Hint = ''
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Bottom = 2
                  Caption = 'Ordem'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object cbxordem: TUniComboBox
                  AlignWithMargins = True
                  Left = 2
                  Top = 22
                  Width = 147
                  Height = 32
                  Hint = ''
                  Margins.Left = 2
                  Margins.Right = 6
                  Style = csDropDownList
                  Text = 'Numero'
                  Items.Strings = (
                    'Numero'
                    'Emiss'#227'o'
                    'Pessoa')
                  ItemIndex = 0
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  IconItems = <>
                  ExplicitWidth = 245
                end
              end
              object rcBlock118: TUniContainerPanel
                Left = 161
                Top = 48
                Width = 176
                Height = 62
                Hint = '[[cols:xs-12 sm-4 md-6]]'
                ParentColor = False
                TabOrder = 4
                DesignSize = (
                  176
                  62)
                object labStatus: TUniLabel
                  AlignWithMargins = True
                  Left = 2
                  Top = 2
                  Width = 34
                  Height = 15
                  Hint = ''
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Bottom = 2
                  Caption = 'Status'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object cbxstatus: TUniComboBox
                  AlignWithMargins = True
                  Left = 2
                  Top = 22
                  Width = 168
                  Height = 32
                  Hint = ''
                  Margins.Left = 2
                  Margins.Right = 6
                  Style = csDropDownList
                  Text = 'Autorizada'
                  Items.Strings = (
                    'Autorizada'
                    'Cancelada')
                  ItemIndex = 0
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  IconItems = <>
                  ExplicitWidth = 245
                end
              end
              object rcBlock130: TUniContainerPanel
                Left = 12
                Top = 110
                Width = 75
                Height = 39
                Hint = '[[cols:xs-12 sm-4 md-2]]'
                ParentColor = False
                TabOrder = 5
                object UniCheckBoxVENDAS: TUniCheckBox
                  Left = 9
                  Top = 9
                  Width = 64
                  Height = 17
                  Hint = ''
                  Checked = True
                  Caption = 'Vendas'
                  TabOrder = 1
                end
              end
              object rcBlock140: TUniContainerPanel
                Left = 91
                Top = 110
                Width = 82
                Height = 39
                Hint = '[[cols:xs-12 sm-4 md-2]]'
                ParentColor = False
                TabOrder = 6
                object UniCheckBoxDEVOLUCAO: TUniCheckBox
                  Left = 5
                  Top = 9
                  Width = 78
                  Height = 17
                  Hint = ''
                  Caption = 'Devolu'#231#227'o'
                  TabOrder = 1
                end
              end
              object rcBlock170: TUniContainerPanel
                Left = 359
                Top = 108
                Width = 58
                Height = 39
                Hint = '[[cols:xs-12 sm-4 md-2]]'
                ParentColor = False
                TabOrder = 7
                object UniCheckBoxTROCA: TUniCheckBox
                  Left = 7
                  Top = 9
                  Width = 59
                  Height = 17
                  Hint = ''
                  Caption = 'Troca'
                  TabOrder = 1
                end
              end
              object rcBlock150: TUniContainerPanel
                Left = 178
                Top = 110
                Width = 84
                Height = 39
                Hint = '[[cols:xs-12 sm-4 md-2]]'
                ParentColor = False
                TabOrder = 8
                object UniCheckBoxVENDASEF: TUniCheckBox
                  Left = 5
                  Top = 9
                  Width = 81
                  Height = 17
                  Hint = ''
                  Checked = True
                  Caption = 'Venda E.F.'
                  TabOrder = 1
                end
              end
              object rcBlock160: TUniContainerPanel
                Left = 268
                Top = 110
                Width = 85
                Height = 39
                Hint = '[[cols:xs-12 sm-4 md-2]]'
                ParentColor = False
                TabOrder = 9
                object UniCheckBoxBONIFICACAO: TUniCheckBox
                  Left = 3
                  Top = 9
                  Width = 88
                  Height = 17
                  Hint = ''
                  Caption = 'Bonifica'#231#227'o'
                  TabOrder = 1
                end
              end
              object rcBlock180: TUniContainerPanel
                Left = 431
                Top = 108
                Width = 75
                Height = 39
                Hint = '[[cols:xs-12 sm-4 md-2]]'
                ParentColor = False
                TabOrder = 10
                object UniCheckBoxOUTROS: TUniCheckBox
                  Left = 8
                  Top = 9
                  Width = 67
                  Height = 17
                  Hint = ''
                  Caption = 'Outros'
                  TabOrder = 1
                end
              end
            end
            object paReportPeriod: TUniPanel
              Left = 3
              Top = 1
              Width = 0
              Height = 18
              Hint = '[[round:no | cls:card-info-box-white]]'
              Margins.Left = 5
              Margins.Top = 0
              Margins.Right = 5
              Margins.Bottom = 5
              TabOrder = 5
              BorderStyle = ubsNone
              Caption = ''
              Color = clWhite
            end
            object paOutrasOpcoes: TUniPanel
              AlignWithMargins = True
              Left = 5
              Top = 6
              Width = 1
              Height = 14
              Hint = '[[round:no | cls:card-info-box-white]]'
              Margins.Left = 5
              Margins.Top = 0
              Margins.Right = 5
              Margins.Bottom = 5
              Visible = False
              TabOrder = 6
              BorderStyle = ubsNone
              Caption = ''
              Color = clWhite
              object UniListBox1: TUniListBox
                AlignWithMargins = True
                Left = -2
                Top = 0
                Width = 0
                Height = 52
                Hint = ''
                Margins.Left = 5
                Margins.Top = 0
                Margins.Right = 6
                Margins.Bottom = 5
                TabOrder = 1
                BorderStyle = ubsNone
                OnChange = lbxReportOptionsChange
              end
            end
            object rcBlock102: TUniContainerPanel
              Left = 822
              Top = 166
              Width = 113
              Height = 400
              Hint = '[['#13#10'cols:xs-12 sm-12 md-4 |'#13#10']]'
              ParentColor = False
              TabOrder = 7
            end
            object rcBlock11: TUniContainerPanel
              Left = 798
              Top = 3
              Width = 113
              Height = 154
              Hint = '[['#13#10'cols:xs-12 sm-12 md-4 |'#13#10']]'
              ParentColor = False
              TabOrder = 8
            end
          end
        end
      end
    end
  end
  inherited htmlFrame: TUniHTMLFrame
    Anchors = [akTop, akRight]
  end
  object UniHTMLFrame1: TUniHTMLFrame [2]
    Left = 694
    Top = 0
    Width = 15
    Height = 39
    Hint = ''
    Visible = False
    Anchors = [akTop, akRight]
  end
  object ed_Table_ItemSel: TUniEdit [3]
    Left = 575
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    Anchors = [akTop, akRight]
    TabOrder = 3
  end
  object ed_FormOrigin: TUniEdit [4]
    Left = 595
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    Anchors = [akTop, akRight]
    TabOrder = 4
  end
  object ed_FormOrigin_Tab: TUniEdit [5]
    Left = 615
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    Anchors = [akTop, akRight]
    TabOrder = 5
  end
  object ed_Table_Status: TUniEdit [6]
    Left = 636
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    Anchors = [akTop, akRight]
    TabOrder = 6
  end
  object ed_Order_Search: TUniEdit [7]
    Left = 657
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    Anchors = [akTop, akRight]
    TabOrder = 7
  end
  object ed_Where_Search: TUniEdit [8]
    Left = 677
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    Anchors = [akTop, akRight]
    TabOrder = 8
  end
  object ed_CodMaster: TUniEdit [9]
    Left = 695
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    Anchors = [akTop, akRight]
    TabOrder = 9
  end
  object ed_PK: TUniEdit [10]
    Left = 713
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    Anchors = [akTop, akRight]
    TabOrder = 10
  end
  object ed_FieldMasks: TUniEdit [11]
    Left = 730
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    Anchors = [akTop, akRight]
    TabOrder = 11
  end
  object ed_OldPKValue: TUniEdit [12]
    Left = 749
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    Anchors = [akTop, akRight]
    TabOrder = 12
  end
  object ed_Table_Status_OLD: TUniEdit [13]
    Left = 766
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    Anchors = [akTop, akRight]
    TabOrder = 13
  end
  object ed_GenNextID_OnNew: TUniEdit [14]
    Left = 784
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    Anchors = [akTop, akRight]
    TabOrder = 14
  end
  object ed_AskNewRec_AfterPost: TUniEdit [15]
    Left = 801
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    Anchors = [akTop, akRight]
    TabOrder = 15
  end
  inherited rcSweetAlert: TUniSweetAlert
    Left = 956
    Top = 20
  end
  object dsMaster: TDataSource
    AutoEdit = False
    DataSet = sqlMaster
    OnStateChange = dsMasterStateChange
    Left = 770
    Top = 15
  end
  object dsSearchMaster: TDataSource
    AutoEdit = False
    DataSet = sqlSearchMaster
    Left = 908
    Top = 31
  end
  object sqlSearchMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime, fvFmtDisplayDate, fvFmtDisplayNumeric, fvStrsTrim2Len]
    SQL.Strings = (
      '')
    Left = 837
    Top = 25
  end
  object sqlMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'select * '
      'from tb_reports'
      'where codigo = :table_pk')
    Left = 821
    Top = 21
    ParamData = <
      item
        Name = 'TABLE_PK'
        ParamType = ptInput
      end>
  end
  object popMenuOptions: TUniPopupMenu
    Left = 464
    Top = 598
  end
  object mem_Master: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 860
    Top = 14
  end
end
