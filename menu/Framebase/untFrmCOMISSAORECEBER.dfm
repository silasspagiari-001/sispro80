object FrmCOMISSAORECEBER: TFrmCOMISSAORECEBER
  Left = 0
  Top = 0
  ClientHeight = 343
  ClientWidth = 557
  Caption = 'Comiss'#227'o por T'#237'tulo'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  Position = poDesktopCenter
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
    Width = 557
    Height = 300
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object UniDBGridEntrega: TUniDBGrid
      Left = 0
      Top = 0
      Width = 557
      Height = 300
      Hint = ''
      DataSource = ds_comissao
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
          FieldName = 'FUNCIONARIO'
          Title.Caption = 'FUN.'
          Width = 50
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'NOMEFUNCIONARIO'
          Title.Caption = 'NOME'
          Width = 220
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'VALORATUAL'
          Title.Caption = 'VLR TITULO'
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'PERCCOMISSAO'
          Title.Caption = '% '
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'COMISSAOPAGA'
          Title.Caption = 'COMISS'#195'O'
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
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
      Left = 404
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
        Left = 30
        Top = 5
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
  object tb_comissao: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 448
    Top = 16
    object tb_comissaoFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
    end
    object tb_comissaoNOMEFUNCIONARIO: TStringField
      FieldName = 'NOMEFUNCIONARIO'
      Size = 100
    end
    object tb_comissaoVALORATUAL: TFloatField
      FieldName = 'VALORATUAL'
      currency = True
    end
    object tb_comissaoPERCCOMISSAO: TFloatField
      FieldName = 'PERCCOMISSAO'
    end
    object tb_comissaoCOMISSAOPAGA: TFloatField
      FieldName = 'COMISSAOPAGA'
      currency = True
    end
  end
  object ds_comissao: TDataSource
    DataSet = tb_comissao
    Left = 480
    Top = 16
  end
end
