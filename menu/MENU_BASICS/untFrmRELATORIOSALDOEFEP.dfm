object frmRELATORIOSALDOEFEP: TfrmRELATORIOSALDOEFEP
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  ActiveControl = btnimpressao
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Saldo E.F./E.P'
  ClientHeight = 357
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
    ExplicitLeft = 1
    ExplicitTop = 8
    object labTitulo: TUniLabel
      AlignWithMargins = True
      Left = 16
      Top = 6
      Width = 610
      Height = 23
      Hint = ''
      Margins.Left = 16
      Margins.Top = 6
      TextConversion = txtHTML
      Caption = 
        '<i class="fas fa-chart-bar" style="color:#2f8a4c;"></i>  Relat'#243'r' +
        'io de Saldo E.F./E.P'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri Light'
      TabOrder = 1
    end
    object labSubtitulo: TUniLabel
      AlignWithMargins = True
      Left = 20
      Top = 34
      Width = 285
      Height = 13
      Hint = ''
      Margins.Left = 20
      Caption = 'Relat'#243'rio detalhado '#226#128#148' saldo por per'#237'odo, pessoas e produtos'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object paBotoes: TUniContainerPanel
    Left = 0
    Top = 295
    Width = 594
    Height = 62
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 310
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
    Height = 245
    Hint = ''
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 170
    object rcBlock20: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 592
      Height = 243
      Hint = '[[cols:xs-12 sm-12 md-12]]'
      ParentColor = False
      Align = alClient
      TabOrder = 0
      ExplicitLeft = -1
      ExplicitTop = 40
      ExplicitHeight = 252
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
          Width = 65
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Data Inicial'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edSearchDATAINIVEN: TUniDateTimePicker
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 149
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          DateTime = 43232.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          ClientEvents.ExtEvents.Strings = (
            
              'afterrender=function afterrender(sender, eOpts) { $("#"+sender.i' +
              'nputEl.id).inputmask("99/99/9999",{placeholder:"  /  /   "}); }')
          OnExit = edSearchDATAINIVENExit
        end
      end
      object rcBlock28: TUniContainerPanel
        Left = 175
        Top = 3
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
          Width = 17
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'at'#233
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edSearchDATAFINVEN: TUniDateTimePicker
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 144
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          DateTime = 43232.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          ClientEvents.ExtEvents.Strings = (
            
              'afterrender=function afterrender(sender, eOpts) { $("#"+sender.i' +
              'nputEl.id).inputmask("99/99/9999",{placeholder:"  /  /   "}); }')
        end
      end
      object rcBlock31: TUniContainerPanel
        Left = 3
        Top = 72
        Width = 157
        Height = 62
        Hint = '[[cols:xs-12 sm-6 md-6]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          157
          62)
        object UniLabel2: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 84
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Pessoas Inicial'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edSearchPESSOAINIVEN: TUniButtonEdit
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 149
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Text = '00001'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnButtonClick = edSearchPESSOAINIVENButtonClick
          IconCls = 'search'
        end
      end
      object rcBlock34: TUniContainerPanel
        Left = 175
        Top = 72
        Width = 152
        Height = 62
        Hint = '[[cols:xs-12 sm-6 md-6]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          152
          62)
        object UniLabel3: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 17
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'at'#233
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edSearchPESSOAFINVEN: TUniButtonEdit
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 144
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Text = '9999999'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnButtonClick = edSearchPESSOAFINVENButtonClick
          IconCls = 'search'
        end
      end
      object rcBlock37: TUniContainerPanel
        Left = 3
        Top = 141
        Width = 157
        Height = 62
        Hint = '[[cols:xs-12 sm-6 md-6]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          157
          62)
        object UniLabel4: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 89
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Produtos Inicial'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edSearchProdutosini: TUniButtonEdit
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 149
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Text = '00001'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnButtonClick = edSearchProdutosiniButtonClick
          IconCls = 'search'
        end
      end
      object rcBlock40: TUniContainerPanel
        Left = 175
        Top = 141
        Width = 152
        Height = 62
        Hint = '[[cols:xs-12 sm-6 md-6]]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          152
          62)
        object UniLabel5: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 17
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'at'#233
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edSearchProdutosfin: TUniButtonEdit
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 144
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Text = '9999999'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnButtonClick = edSearchProdutosfinButtonClick
          IconCls = 'search'
        end
      end
    end
  end
end
