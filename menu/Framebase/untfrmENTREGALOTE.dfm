object frmENTREGALOTE: TfrmENTREGALOTE
  Left = 0
  Top = 0
  ClientHeight = 343
  ClientWidth = 557
  Caption = 'Defini'#231#227'o do Lote'
  OnShow = UniFormShow
  OnResize = UniFormResize
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 298
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 547
    ExplicitHeight = 288
    object rcBlock20: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 557
      Height = 231
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 547
      object UniDBGridEntrega: TUniDBGrid
        Left = 0
        Top = 0
        Width = 557
        Height = 231
        Hint = ''
        DataSource = dm_rc.dsentregalote
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Message = 'Carregando Item(s)...'
        ForceFit = True
        Align = alClient
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        ParentFont = False
        TabOrder = 1
        Summary.Enabled = True
        OnCellClick = UniDBGridEntregaCellClick
        Columns = <
          item
            FieldName = 'EMISSAO'
            Title.Caption = 'EMISS'#195'O'
            Width = 74
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'PRODUTO'
            Title.Caption = 'PROD.'
            Width = 65
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'LOTE'
            Title.Caption = 'LOTE'
            Width = 180
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'QUANTIDADE'
            Title.Caption = 'QTDE'
            Width = 70
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'PESOSACO'
            Title.Caption = 'SACO'
            Width = 74
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'exclui'
            Title.Caption = ' '
            Width = 30
            Font.Color = clBlack
            Font.Name = 'Calibri'
            Alignment = taCenter
          end>
      end
    end
    object rcBlock30: TUniContainerPanel
      Left = 0
      Top = 235
      Width = 105
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 2
      object UniDateTimePickerentreganemissao: TUniDateTimePicker
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 99
        Height = 29
        Hint = ''
        Margins.Right = 5
        DateTime = 43232.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        ClientEvents.ExtEvents.Strings = (
          
            'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
            '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
            '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
            ':"  /  /   "});'#13#10'}')
      end
      object UniLabel108: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 99
        Height = 16
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Retirada'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel4: TUniContainerPanel
      Left = 106
      Top = 235
      Width = 92
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        92
        48)
      object UniFormattedNumberEditentregatotaldoc: TUniFormattedNumberEdit
        Left = 2
        Top = 17
        Width = 87
        Height = 29
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel110: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 86
        Height = 16
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Qtde Retirada'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel5: TUniContainerPanel
      Left = 489
      Top = 235
      Width = 55
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 4
      object UniBitBtn12: TUniBitBtn
        AlignWithMargins = True
        Left = 11
        Top = 14
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
          #13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-save"></i>'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = UniBitBtn12Click
      end
    end
    object UniContainerPanel2: TUniContainerPanel
      Left = 199
      Top = 235
      Width = 140
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        140
        48)
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 134
        Height = 16
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Lote'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniButtonEditplote: TUniButtonEdit
        AlignWithMargins = True
        Left = 0
        Top = 17
        Width = 139
        Height = 29
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        OnButtonClick = UniButtonEditploteButtonClick
        IconCls = 'search'
      end
    end
    object UniContainerPanel6: TUniContainerPanel
      Left = 340
      Top = 235
      Width = 84
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        84
        48)
      object UniFormattedNumberEditPESOSACO: TUniFormattedNumberEdit
        Left = 2
        Top = 17
        Width = 79
        Height = 29
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DecimalPrecision = 0
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel2: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 76
        Height = 16
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Peso SC'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel7: TUniContainerPanel
      Left = 425
      Top = 235
      Width = 63
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        63
        48)
      object UniLabel3: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 54
        Height = 16
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Produto'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniButtonEditCODPRO: TUniButtonEdit
        AlignWithMargins = True
        Left = 0
        Top = 17
        Width = 63
        Height = 29
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ReadOnly = True
        IconCls = 'search'
      end
    end
  end
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 298
    Width = 557
    Height = 45
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 288
    ExplicitWidth = 547
    object UniContainerPanel3: TUniContainerPanel
      Left = 396
      Top = 5
      Width = 150
      Height = 38
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        150
        38)
      object UniBitBtn1: TUniBitBtn
        Left = 17
        Top = 3
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
  object UniPopupMenulote: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 487
    Top = 70
    object L1: TUniMenuItem
      Caption = 'Lote de Venda - Nota'
      ImageIndex = 36
    end
    object N6: TUniMenuItem
      Caption = '-'
    end
    object L2: TUniMenuItem
      Caption = 'Lote de Produ'#231#227'o Acabada'
      ImageIndex = 55
      OnClick = L2Click
    end
  end
end
