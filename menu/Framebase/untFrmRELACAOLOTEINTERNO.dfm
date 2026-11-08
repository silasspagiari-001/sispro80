object frmRELACAOLOTEINTERNO: TfrmRELACAOLOTEINTERNO
  Left = 0
  Top = 0
  ClientHeight = 346
  ClientWidth = 613
  Caption = 'Rela'#231#227'o do Lote Interno'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 287
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitTop = -1
    object UniContainerPanel1: TUniContainerPanel
      Left = 3
      Top = 3
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        150
        48)
      object edSearchprodutoINI: TUniButtonEdit
        AlignWithMargins = True
        Left = 2
        Top = 20
        Width = 146
        Height = 26
        Hint = ''
        Text = '00001'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnButtonClick = edSearchprodutoINIButtonClick
        IconCls = 'search'
      end
      object UniLabelDtIni: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 2
        Width = 83
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Produto Inicial'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock20: TUniContainerPanel
      Left = 196
      Top = 3
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        150
        48)
      object edSearchprodutoFIN: TUniButtonEdit
        AlignWithMargins = True
        Left = 3
        Top = 19
        Width = 145
        Height = 26
        Hint = ''
        Text = '99999'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnButtonClick = edSearchprodutoFINButtonClick
        IconCls = 'search'
      end
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 2
        Width = 17
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'at'#233
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock30: TUniContainerPanel
      Tag = 1
      Left = 3
      Top = 63
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        150
        48)
      object cbxsordem: TUniComboBox
        AlignWithMargins = True
        Left = 3
        Top = 18
        Width = 145
        Height = 29
        Hint = ''
        Margins.Right = 5
        Style = csDropDownList
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
        TabOrder = 1
        IconItems = <>
      end
      object UniLabel2: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 37
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Saldos'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 1
      Left = 196
      Top = 63
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        150
        48)
      object cbxtipo: TUniComboBox
        AlignWithMargins = True
        Left = 3
        Top = 18
        Width = 145
        Height = 29
        Hint = ''
        Margins.Right = 5
        Style = csDropDownList
        Text = 'Barrac'#227'o'
        Items.Strings = (
          'Barrac'#227'o'
          'Produto'
          'Grupo')
        ItemIndex = 0
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
        Top = 1
        Width = 44
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Agrupar'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel2: TUniContainerPanel
      Left = 364
      Top = 1
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        150
        48)
      object UniButtonEditBARRACAO: TUniButtonEdit
        AlignWithMargins = True
        Left = 2
        Top = 20
        Width = 146
        Height = 26
        Hint = ''
        Text = '0'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnButtonClick = UniButtonEditBARRACAOButtonClick
        IconCls = 'search'
      end
      object UniLabel4: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 2
        Width = 51
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Barrac'#227'o'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel5: TUniContainerPanel
      Tag = 1
      Left = 364
      Top = 63
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        150
        48)
      object UniComboBoxtipo: TUniComboBox
        AlignWithMargins = True
        Left = 3
        Top = 18
        Width = 145
        Height = 29
        Hint = ''
        Margins.Right = 5
        Style = csDropDownList
        Text = 'Produto Acabado'
        Items.Strings = (
          'Produto Acabado'
          'Sementes'
          'Insumos'
          'Sacaria'
          'Todos')
        ItemIndex = 0
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        IconItems = <>
      end
      object UniLabel5: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 24
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Tipo'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel6: TUniContainerPanel
      Left = 196
      Top = 123
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        150
        48)
      object edSearchGrupoFIN: TUniButtonEdit
        AlignWithMargins = True
        Left = 3
        Top = 22
        Width = 145
        Height = 26
        Hint = ''
        Text = '99999'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnButtonClick = edSearchGrupoFINButtonClick
        IconCls = 'search'
      end
      object UniLabel6: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 2
        Width = 17
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'at'#233
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel7: TUniContainerPanel
      Left = 3
      Top = 123
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 8
      DesignSize = (
        150
        48)
      object edSearchGrupoINI: TUniButtonEdit
        AlignWithMargins = True
        Left = 2
        Top = 20
        Width = 146
        Height = 26
        Hint = ''
        Text = '00001'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnButtonClick = edSearchGrupoINIButtonClick
        IconCls = 'search'
      end
      object UniLabel7: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 73
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Grupo Inicial'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
  end
  object rcBlock60: TUniContainerPanel
    Left = 0
    Top = 287
    Width = 613
    Height = 59
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    object UniContainerPanel3: TUniContainerPanel
      Left = 3
      Top = 5
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 1
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
    object UniContainerPanel4: TUniContainerPanel
      Left = 196
      Top = 5
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 2
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
  end
end
