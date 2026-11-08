object frmCADANEXOTITULOS: TfrmCADANEXOTITULOS
  Left = 0
  Top = 0
  ClientHeight = 333
  ClientWidth = 547
  Caption = 'Anexo do Titulo'
  OnShow = UniFormShow
  OnResize = UniFormResize
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
    object UniContainerPanel2: TUniContainerPanel
      Left = 2
      Top = 6
      Width = 150
      Height = 38
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        150
        38)
      object UniBitBtn2: TUniBitBtn
        Left = 17
        Top = 3
        Width = 119
        Height = 29
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 28
        Margins.Bottom = 12
        Caption = 'Carregar SubPlano'
        Anchors = [akLeft, akRight, akBottom]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        OnClick = UniBitBtn2Click
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
      Height = 285
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alTop
      TabOrder = 1
      object UniDBGridAnexo: TUniDBGrid
        Left = 0
        Top = 0
        Width = 547
        Height = 285
        Hint = ''
        DataSource = dm_rc.dsanexotitulos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Message = 'Carregando Item(s)...'
        Align = alClient
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        ParentFont = False
        TabOrder = 1
        Summary.Enabled = True
        OnCellClick = UniDBGridAnexoCellClick
        Columns = <
          item
            FieldName = 'exclui'
            Title.Caption = '...'
            Width = 30
            Font.Color = clBlack
            Font.Name = 'Calibri'
            Alignment = taCenter
          end
          item
            FieldName = 'busca'
            Title.Caption = '...'
            Width = 30
            Font.Color = clBlack
            Font.Name = 'Calibri'
            Alignment = taCenter
          end
          item
            FieldName = 'PLANO'
            Title.Caption = 'PLANO'
            Width = 74
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'SUBPLANO'
            Title.Caption = 'SUBPLANO'
            Width = 74
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 250
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'VALOR'
            Title.Caption = 'VALOR'
            Width = 130
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'OBSERVACAO'
            Title.Caption = 'OBSERVA'#199#195'O'
            Width = 704
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end>
      end
    end
  end
end
