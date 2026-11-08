object frmRECIBOTERMO: TfrmRECIBOTERMO
  Left = 0
  Top = 0
  ClientHeight = 343
  ClientWidth = 557
  Caption = 'Impress'#227'o RECIBO/TERMO'
  OnResize = UniFormResize
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 185
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object UniDBGridEntrega: TUniDBGrid
      Left = 0
      Top = 0
      Width = 557
      Height = 185
      Hint = ''
      DataSource = dm_rc.ds_recibotermo
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
      Columns = <
        item
          FieldName = 'OP'
          Title.Caption = 'OP'
          Width = 18
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'MOTORISTA'
          Title.Caption = 'MTR'
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'NOME'
          Title.Caption = 'NOME'
          Width = 300
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'VALOR'
          Title.Caption = 'VALOR'
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
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 298
    Width = 557
    Height = 45
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 1
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
  object rcBlock20: TUniContainerPanel
    Left = 0
    Top = 186
    Width = 557
    Height = 48
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    TabOrder = 2
    object rcBlock30: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 105
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 1
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
        Caption = 'Emiss'#227'o'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel2: TUniContainerPanel
      Left = 106
      Top = 0
      Width = 77
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        77
        48)
      object UniButtonEditpbancos: TUniButtonEdit
        AlignWithMargins = True
        Left = 2
        Top = 17
        Width = 75
        Height = 29
        Hint = ''
        Text = '0'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        IconCls = 'search'
      end
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 2
        Top = 1
        Width = 75
        Height = 16
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Motorista'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel4: TUniContainerPanel
      Left = 184
      Top = 0
      Width = 257
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        257
        48)
      object UniEditdescricaobanco: TUniEdit
        AlignWithMargins = True
        Left = 1
        Top = 17
        Width = 255
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel2: TUniLabel
        AlignWithMargins = True
        Left = 2
        Top = 1
        Width = 252
        Height = 16
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Nome Motorista'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel5: TUniContainerPanel
      Left = 442
      Top = 0
      Width = 113
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        113
        48)
      object UniEdit1: TUniEdit
        AlignWithMargins = True
        Left = 0
        Top = 17
        Width = 112
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel3: TUniLabel
        AlignWithMargins = True
        Left = 0
        Top = 1
        Width = 109
        Height = 16
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'CPF Motorista'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
  end
  object rcBlock40: TUniContainerPanel
    Left = 0
    Top = 236
    Width = 557
    Height = 48
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    TabOrder = 3
    object UniContainerPanel7: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 506
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        506
        48)
      object UniLabel4: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 499
        Height = 16
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor do Recibo'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniFormattedNumberEditcCREDITO: TUniFormattedNumberEdit
        Left = 3
        Top = 19
        Width = 501
        Height = 29
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object UniContainerPanel6: TUniContainerPanel
      Left = 507
      Top = 0
      Width = 48
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 2
      object UniBitBtn12: TUniBitBtn
        AlignWithMargins = True
        Left = 7
        Top = 16
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
      end
    end
  end
  object UniPopupMenu: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 495
    Top = 166
    object L1: TUniMenuItem
      Caption = 'Recibo do Motorista'
      ImageIndex = 36
    end
    object N6: TUniMenuItem
      Caption = '-'
    end
    object L2: TUniMenuItem
      Caption = 'Termo de Responsabilidade'
      ImageIndex = 27
    end
  end
end
