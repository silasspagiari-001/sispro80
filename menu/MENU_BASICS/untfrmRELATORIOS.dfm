object frmRELATORIOS: TfrmRELATORIOS
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  ActiveControl = btnimpressao
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Vendas por Per'#237'odo'
  ClientHeight = 437
  ClientWidth = 820
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
    Width = 820
    Height = 56
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 2
    object labTitulo: TUniLabel
      AlignWithMargins = True
      Left = 16
      Top = 6
      Width = 716
      Height = 23
      Hint = ''
      Margins.Left = 16
      Margins.Top = 6
      TextConversion = txtHTML
      Caption = 
        '<i class="fas fa-file-invoice-dollar" style="color:#2f6fd0;"></i' +
        '>  Relat'#243'rio de Vendas por Per'#237'odo'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri Light'
      TabOrder = 1
    end
    object labSubtitulo: TUniLabel
      AlignWithMargins = True
      Left = 20
      Top = 34
      Width = 243
      Height = 13
      Hint = ''
      Margins.Left = 20
      Caption = 'Per'#237'odo, cliente, tipo, ordem e documentos a incluir'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object paBotoes: TUniContainerPanel
    Left = 0
    Top = 375
    Width = 820
    Height = 62
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 428
    object btnimpressao: TUniBitBtn
      AlignWithMargins = True
      Left = 12
      Top = 12
      Width = 200
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
      Left = 226
      Top = 12
      Width = 150
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
      Left = 396
      Top = 23
      Width = 277
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      Caption = 'O relat'#243'rio '#233' gerado em PDF e aberto na tela de impress'#227'o.'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Calibri'
      TabOrder = 3
    end
  end
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 56
    Width = 820
    Height = 319
    Hint = ''
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 345
    ScrollHeight = 310
    ScrollWidth = 791
    object rcBlock10: TUniContainerPanel
      Left = 3
      Top = 3
      Width = 386
      Height = 62
      Hint = '[[cols:xs-12 sm-6 md-6]]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        386
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
        Width = 378
        Height = 32
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
    object rcBlock20: TUniContainerPanel
      Left = 405
      Top = 3
      Width = 386
      Height = 62
      Hint = '[[cols:xs-12 sm-6 md-6]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        386
        62)
      object labDataFin: TUniLabel
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 57
        Height = 15
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Bottom = 2
        Caption = 'Data Final'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edSearchDATAFINVEN: TUniDateTimePicker
        AlignWithMargins = True
        Left = 2
        Top = 22
        Width = 378
        Height = 32
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
    object rcBlock30: TUniContainerPanel
      Left = 3
      Top = 72
      Width = 386
      Height = 62
      Hint = '[[cols:xs-12 sm-6 md-6]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        386
        62)
      object labPesIni: TUniLabel
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 126
        Height = 15
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Bottom = 2
        Caption = 'Pessoa Inicial (c'#243'digo)'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edSearchPESSOAINIVEN: TUniButtonEdit
        AlignWithMargins = True
        Left = 2
        Top = 24
        Width = 378
        Height = 32
        Hint = ''
        Margins.Left = 2
        Margins.Right = 6
        Text = '00001'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        OnButtonClick = edSearchPESSOAINIVENButtonClick
        IconCls = 'search'
      end
    end
    object rcBlock40: TUniContainerPanel
      Left = 405
      Top = 72
      Width = 386
      Height = 62
      Hint = '[[cols:xs-12 sm-6 md-6]]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        386
        62)
      object labPesFin: TUniLabel
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 118
        Height = 15
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Bottom = 2
        Caption = 'Pessoa Final (c'#243'digo)'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edSearchPESSOAFINVEN: TUniButtonEdit
        AlignWithMargins = True
        Left = 2
        Top = 24
        Width = 378
        Height = 32
        Hint = ''
        Margins.Left = 2
        Margins.Right = 6
        Text = '9999999'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        OnButtonClick = edSearchPESSOAFINVENButtonClick
        IconCls = 'search'
      end
    end
    object rcBlock50: TUniContainerPanel
      Left = 3
      Top = 141
      Width = 253
      Height = 62
      Hint = '[[cols:xs-12 sm-4 md-4]]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        253
        62)
      object labTipo: TUniLabel
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 24
        Height = 15
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Bottom = 2
        Caption = 'Tipo'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object cbxtipo: TUniComboBox
        AlignWithMargins = True
        Left = 2
        Top = 22
        Width = 245
        Height = 32
        Hint = ''
        Margins.Left = 2
        Margins.Right = 6
        Style = csDropDownList
        Text = 'Nota'
        Items.Strings = (
          'Nota')
        ItemIndex = 0
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        IconItems = <>
      end
    end
    object rcBlock60: TUniContainerPanel
      Left = 269
      Top = 141
      Width = 253
      Height = 62
      Hint = '[[cols:xs-12 sm-4 md-6]]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        253
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
        Width = 245
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
      end
    end
    object rcBlock70: TUniContainerPanel
      Left = 535
      Top = 141
      Width = 253
      Height = 62
      Hint = '[[cols:xs-12 sm-4 md-4]]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        253
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
        Width = 245
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
      end
    end
    object rcBlock80: TUniContainerPanel
      Left = 3
      Top = 210
      Width = 785
      Height = 100
      Hint = '[[cols:xs-12 sm-12 md-12]]'
      ParentColor = False
      TabOrder = 6
      object labDocTipos: TUniLabel
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 187
        Height = 15
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Bottom = 2
        Caption = 'Documentos a incluir no relat'#243'rio'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniCheckBoxVENDAS: TUniCheckBox
        Left = 2
        Top = 34
        Width = 120
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Vendas'
        TabOrder = 2
      end
      object UniCheckBoxDEVOLUCAO: TUniCheckBox
        Left = 140
        Top = 34
        Width = 120
        Height = 17
        Hint = ''
        Caption = 'Devolu'#231#227'o'
        TabOrder = 3
      end
      object UniCheckBoxVENDASEF: TUniCheckBox
        Left = 278
        Top = 34
        Width = 120
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Venda E.F.'
        TabOrder = 4
      end
      object UniCheckBoxBONIFICACAO: TUniCheckBox
        Left = 416
        Top = 34
        Width = 120
        Height = 17
        Hint = ''
        Caption = 'Bonifica'#231#227'o'
        TabOrder = 5
      end
      object UniCheckBoxTROCA: TUniCheckBox
        Left = 2
        Top = 66
        Width = 120
        Height = 17
        Hint = ''
        Caption = 'Troca'
        TabOrder = 6
      end
      object UniCheckBoxOUTROS: TUniCheckBox
        Left = 140
        Top = 66
        Width = 120
        Height = 17
        Hint = ''
        Caption = 'Outros'
        TabOrder = 7
      end
    end
  end
end
