object frmRELACAOENTREGAS: TfrmRELACAOENTREGAS
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  ActiveControl = btnimpressao
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rela'#231#227'o de Entrega(s)'
  ClientHeight = 384
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
        '<i class="fas fa-truck" style="color:#2f8a4c;"></i>  Rela'#231#227'o' +
        ' de Entrega(s)'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri Light'
      TabOrder = 1
    end
    object labSubtitulo: TUniLabel
      AlignWithMargins = True
      Left = 20
      Top = 34
      Width = 556
      Height = 13
      Hint = ''
      Margins.Left = 20
      Caption = 'Per'#237'odo, pessoas, produtos e situa'#231#227'o das entregas'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object paBotoes: TUniContainerPanel
    Left = 0
    Top = 322
    Width = 594
    Height = 62
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 322
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
    Height = 272
    Hint = ''
    Align = alClient
    ScrollHeight = 272
    ScrollWidth = 592
    TabOrder = 0
    ExplicitWidth = 820
    object rcBlock20: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 592
      Height = 272
      Hint = '[[cols:xs-12 sm-12 md-12]]'
      ParentColor = False
      Align = alClient
      TabOrder = 0
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
          DateTime = 43232
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ClientEvents.ExtEvents.Strings = (
            'afterrender=function afterrender(sender, eOpts) { $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder:"  /  /   "}); }')
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
          Width = 123
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
          Width = 144
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          DateTime = 43232
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ClientEvents.ExtEvents.Strings = (
            'afterrender=function afterrender(sender, eOpts) { $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder:"  /  /   "}); }')
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
          Width = 140
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
          IconCls = 'search'
          OnButtonClick = edSearchPESSOAINIVENButtonClick
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
          Width = 137
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Pessoas Final'
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
          IconCls = 'search'
          OnButtonClick = edSearchPESSOAFINVENButtonClick
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
        object UniLabel6: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 140
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Produto Inicial'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniButtonEditPRODUTOENTINI: TUniButtonEdit
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
          IconCls = 'search'
          OnButtonClick = UniButtonEditPRODUTOENTINIButtonClick
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
        object UniLabel7: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 137
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Produto Final'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniButtonEditPRODUTOENTFIN: TUniButtonEdit
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
          IconCls = 'search'
          OnButtonClick = UniButtonEditPRODUTOENTFINButtonClick
        end
      end
      object rcBlock43: TUniContainerPanel
        Left = 3
        Top = 210
        Width = 157
        Height = 62
        Hint = '[[cols:xs-12 sm-4 md-4]]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          157
          62)
        object UniLabel4: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 126
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Tipo de Doc.'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object cbxtipodoc: TUniComboBox
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 149
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'Notas'
            'Pedidos')
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          IconItems = <>
        end
      end
      object rcBlock46: TUniContainerPanel
        Left = 175
        Top = 210
        Width = 152
        Height = 62
        Hint = '[[cols:xs-12 sm-4 md-4]]'
        ParentColor = False
        TabOrder = 8
        DesignSize = (
          152
          62)
        object UniLabel5: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 126
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Tipo de Entrega'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object cbxtipoentrega: TUniComboBox
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 144
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'Entrege'
            'Disponivel'
            'Todos')
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          IconItems = <>
        end
      end
      object rcBlock49: TUniContainerPanel
        Left = 347
        Top = 210
        Width = 150
        Height = 62
        Hint = '[[cols:xs-12 sm-4 md-4]]'
        ParentColor = False
        TabOrder = 9
        DesignSize = (
          150
          62)
        object UniLabel8: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 126
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'UF'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniComboBoxUF: TUniComboBox
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 142
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Style = csDropDownList
          Text = ''
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
            'TODOS')
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          IconItems = <>
        end
      end
    end
  end
end.
