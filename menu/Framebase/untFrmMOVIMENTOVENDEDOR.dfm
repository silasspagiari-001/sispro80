object FrmMOVIMENTOVENDEDOR: TFrmMOVIMENTOVENDEDOR
  Left = 0
  Top = 0
  ClientHeight = 343
  ClientWidth = 557
  Caption = 'Vendedores Vinculados'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 298
    Width = 557
    Height = 45
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      557
      45)
    object UniBitBtn12: TUniBitBtn
      AlignWithMargins = True
      Left = 3
      Top = 5
      Width = 33
      Height = 32
      Hint = 
        '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
        #13#10']]'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '<i class="fas fa-plus"></i>'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 1
      ScaleButton = False
      LayoutConfig.Padding = '0 2 0 0'
      OnClick = UniBitBtn12Click
    end
    object UniBitBtn1: TUniBitBtn
      Left = 432
      Top = 7
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
      TabOrder = 2
      OnClick = UniBitBtn1Click
    end
  end
  object rcBlock20: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 247
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object UniDBGridEntrega: TUniDBGrid
      Left = 0
      Top = 0
      Width = 557
      Height = 247
      Hint = ''
      DataSource = dm_rc.dsmovimentovendedor
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
          FieldName = 'FUNCIONARIO'
          Title.Caption = 'C'#211'DIGO'
          Width = 80
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
          FieldName = 'COMISSAO'
          Title.Caption = 'COM %'
          Width = 80
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
    Top = 247
    Width = 557
    Height = 51
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      557
      51)
    object UniButtonEditfuncionarios: TUniButtonEdit
      AlignWithMargins = True
      Left = 3
      Top = 22
      Width = 118
      Height = 26
      Hint = ''
      Text = '0'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnExit = UniButtonEditfuncionariosExit
      OnButtonClick = UniButtonEditfuncionariosButtonClick
      IconCls = 'search'
    end
    object UniLabel1: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 5
      Width = 67
      Height = 15
      Hint = ''
      Margins.Top = 1
      Margins.Bottom = 2
      Caption = 'Funcion'#225'rio'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
    object UniEditdescricaovendedor: TUniEdit
      AlignWithMargins = True
      Left = 124
      Top = 22
      Width = 325
      Height = 26
      Hint = ''
      Margins.Right = 5
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ReadOnly = True
    end
    object UniLabel2: TUniLabel
      AlignWithMargins = True
      Left = 124
      Top = 5
      Width = 102
      Height = 15
      Hint = ''
      Margins.Top = 1
      Margins.Bottom = 2
      Caption = 'Nome do Vendedor'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 4
    end
    object UniFormattedNumberEditcomissoa: TUniFormattedNumberEdit
      Left = 451
      Top = 22
      Width = 106
      Height = 26
      Hint = ''
      Alignment = taRightJustify
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      DecimalSeparator = ','
      ThousandSeparator = '.'
    end
    object UniLabel3: TUniLabel
      AlignWithMargins = True
      Left = 451
      Top = 5
      Width = 66
      Height = 15
      Hint = ''
      Margins.Top = 1
      Margins.Bottom = 2
      Caption = '% Comiss'#227'o'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 6
    end
  end
end
