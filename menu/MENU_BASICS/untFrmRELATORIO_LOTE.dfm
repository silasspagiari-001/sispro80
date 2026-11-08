object frmRELATORIO_LOTE: TfrmRELATORIO_LOTE
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  ActiveControl = btnimpressao
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Lote/BAS'
  ClientHeight = 282
  ClientWidth = 594
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
  object paTitulo: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 50
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 820
    object labTitulo: TUniLabel
      AlignWithMargins = True
      Left = 16
      Top = 6
      Width = 556
      Height = 23
      Hint = ''
      Margins.Left = 16
      Margins.Top = 6
      TextConversion = txtHTML
      Caption = 
        '<i class="fas fa-boxes" style="color:#b8860b;"></i>  Relat'#243'rio d' +
        'e Lote/BAS'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri Light'
      TabOrder = 1
    end
    object labSubtitulo: TUniLabel
      AlignWithMargins = True
      Left = 20
      Top = 34
      Width = 308
      Height = 13
      Hint = ''
      Margins.Left = 20
      Caption = 
        'Faixa de produtos, saldos, op'#231#245'es e categoria do estoque por lot' +
        'e'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object paBotoes: TUniContainerPanel
    Left = 0
    Top = 220
    Width = 594
    Height = 62
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 262
    ExplicitWidth = 820
    DesignSize = (
      594
      62)
    object btnimpressao: TUniBitBtn
      AlignWithMargins = True
      Left = 12
      Top = 12
      Width = 149
      Height = 38
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Left = 12
      Margins.Top = 12
      Caption = '<i class="fas fa-file-pdf"></i>  Impress'#227'o (PDF)'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnimpressaoClick
    end
    object UniBitBtn1: TUniBitBtn
      AlignWithMargins = True
      Left = 167
      Top = 12
      Width = 98
      Height = 38
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 12
      Caption = '<i class="fas fa-sign-out-alt"></i>  Sair'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
      OnClick = UniBitBtn1Click
    end
    object labRodape: TUniLabel
      Left = 271
      Top = 15
      Width = 277
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      Caption = 'O relat'#243'rio '#233' gerado em PDF e aberto na tela de impress'#227'o.'
      Anchors = []
      ParentFont = False
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Calibri'
      TabOrder = 3
    end
  end
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 50
    Width = 594
    Height = 170
    Hint = ''
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 551
    ExplicitHeight = 212
    object rcBlock20: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 592
      Height = 168
      Hint = '[[cols:xs-12 sm-12 md-12]]'
      ParentColor = False
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 177
      object rcBlock25: TUniContainerPanel
        Left = 3
        Top = 3
        Width = 157
        Height = 62
        Hint = '[[cols:xs-12 sm-6 md-6]]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          157
          62)
        object UniLabelDtIni: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 126
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Produto In'#237'cio (c'#243'digo)'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edSearchprodutoINI: TUniButtonEdit
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 149
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Text = ''
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          IconCls = 'search'
          ExplicitWidth = 245
        end
      end
      object rcBlock28: TUniContainerPanel
        Left = 175
        Top = 5
        Width = 152
        Height = 62
        Hint = '[[cols:xs-12 sm-6 md-6]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          152
          62)
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 123
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Produto Final (c'#243'digo)'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edSearchprodutoFIN: TUniButtonEdit
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 144
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Text = ''
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          IconCls = 'search'
          ExplicitWidth = 226
        end
      end
      object rcBlock30: TUniContainerPanel
        Left = 3
        Top = 72
        Width = 118
        Height = 62
        Hint = '[[cols:xs-12 sm-6 md-4]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          118
          62)
        object UniLabel2: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 37
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Saldos'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object cbxsaldos: TUniComboBox
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 110
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Text = 'Todos'
          Items.Strings = (
            'Positivo'
            'Negativo'
            'Zerado'
            'Todos')
          ItemIndex = 3
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
          IconItems = <>
          ExplicitWidth = 245
        end
      end
      object rcBlock40: TUniContainerPanel
        Left = 127
        Top = 73
        Width = 106
        Height = 62
        Hint = '[[cols:xs-12 sm-6 md-4]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          106
          62)
        object UniLabel3: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 41
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Op'#231#245'es'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object cbxopcoes: TUniComboBox
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 98
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Text = 'Todos'
          Items.Strings = (
            'Aguarde'
            'Entrada'
            'Saida'
            'Fiscal'
            'Todos')
          ItemIndex = 4
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
          IconItems = <>
          ExplicitWidth = 245
        end
      end
      object rcBlock50: TUniContainerPanel
        Left = 239
        Top = 73
        Width = 138
        Height = 62
        Hint = '[[cols:xs-12 sm-6 md-4]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          138
          62)
        object UniLabel4: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 53
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Categoria'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object cbxcategoria: TUniComboBox
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 130
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Text = ''
          Items.Strings = (
            'C1'
            'C2'
            'S1'
            'S2'
            'S1+S2'
            '')
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
          IconItems = <>
          ExplicitWidth = 245
        end
      end
    end
  end
end
