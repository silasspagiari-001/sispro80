object frmCADENTREGAS: TfrmCADENTREGAS
  Left = 0
  Top = 0
  ClientHeight = 333
  ClientWidth = 547
  Caption = 'Rela'#231#227'o das Entregas'
  OnShow = UniFormShow
  OnResize = UniFormResize
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 288
    Width = 547
    Height = 45
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 0
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
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 547
    Height = 288
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object rcBlock20: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 547
      Height = 231
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alTop
      TabOrder = 1
      object UniDBGridEntrega: TUniDBGrid
        Left = 0
        Top = 0
        Width = 547
        Height = 231
        Hint = ''
        DataSource = dm_rc.dsrelacaoentrega
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
            FieldName = 'opcoes'
            Title.Caption = ' '
            Width = 30
            Font.Color = clBlack
            Font.Name = 'Calibri'
            Alignment = taCenter
          end
          item
            FieldName = 'EMISSAO'
            Title.Caption = 'EMISS'#195'O'
            Width = 74
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'NUMERO'
            Title.Caption = 'NUMERO'
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
            FieldName = 'DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 180
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'ENTREGUE'
            Title.Caption = 'ENT.'
            Width = 70
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
      Width = 122
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 2
      object UniDateTimePickerentreganemissao: TUniDateTimePicker
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 116
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
        Width = 116
        Height = 16
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        AutoSize = False
        Caption = 'Retirada'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel4: TUniContainerPanel
      Left = 125
      Top = 235
      Width = 122
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        122
        48)
      object UniFormattedNumberEditentregatotaldoc: TUniFormattedNumberEdit
        Left = 2
        Top = 17
        Width = 118
        Height = 29
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel110: TUniLabel
        AlignWithMargins = True
        Left = 2
        Top = 1
        Width = 118
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
      Left = 250
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
  end
end
