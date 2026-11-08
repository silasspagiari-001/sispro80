object frmFINANCEIRONOTA: TfrmFINANCEIRONOTA
  Left = 0
  Top = 0
  ClientHeight = 513
  ClientWidth = 888
  Caption = 'Financeiro da nota'
  OnShow = ExibirParcelas
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  Font.Height = -13
  OnReady = ExibirParcelas
  TextHeight = 17
  object rcBlock40: TUniContainerPanel
    Left = 0
    Top = 453
    Width = 888
    Height = 60
    Hint = '[[cols:12]]'
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 481
    ExplicitWidth = 838
    object paRodape: TUniPanel
      Left = 0
      Top = 0
      Width = 888
      Height = 60
      Hint = ''
      Align = alClient
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      Color = 16316664
      ExplicitLeft = -62
      ExplicitWidth = 900
      ExplicitHeight = 55
      object labOrientacao: TUniLabel
        Left = 26
        Top = 24
        Width = 830
        Height = 22
        Hint = ''
        AutoSize = False
        Caption = 'As alteracoes serao aplicadas a nota somente ao confirmar.'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -12
        TabOrder = 1
      end
      object btnCancelar: TUniButton
        Left = 574
        Top = 10
        Width = 135
        Height = 36
        Hint = ''
        Caption = 'Cancelar'
        TabOrder = 2
        OnClick = CancelarClick
      end
      object btnConfirmar: TUniButton
        Left = 720
        Top = 10
        Width = 155
        Height = 36
        Hint = ''
        Caption = 'Confirmar parcelas'
        TabOrder = 3
        OnClick = ConfirmarClick
      end
    end
  end
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 888
    Height = 453
    Hint = ''
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 487
    ScrollHeight = 160
    object rcBlock10: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 886
      Height = 53
      Hint = '[[cols:12]]'
      ParentColor = False
      Align = alTop
      TabOrder = 0
      object paCabecalho: TUniPanel
        Left = 0
        Top = 0
        Width = 886
        Height = 52
        Hint = ''
        Align = alTop
        TabOrder = 1
        BorderStyle = ubsNone
        Caption = ''
        Color = 2364689
        object labTitulo: TUniLabel
          Left = 24
          Top = -1
          Width = 830
          Height = 28
          Hint = ''
          AutoSize = False
          Caption = 'Financeiro da nota'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -23
          TabOrder = 1
        end
        object labNota: TUniLabel
          Left = 24
          Top = 30
          Width = 830
          Height = 22
          Hint = ''
          AutoSize = False
          Caption = 'Parcelas e vencimentos'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          TabOrder = 2
        end
      end
    end
    object rcBlock20: TUniContainerPanel
      Left = 0
      Top = 53
      Width = 886
      Height = 60
      Hint = '[[cols:12]]'
      ParentColor = False
      Align = alTop
      TabOrder = 1
      object paResumo: TUniPanel
        Left = 0
        Top = 0
        Width = 886
        Height = 59
        Hint = ''
        Align = alTop
        TabOrder = 1
        BorderStyle = ubsNone
        Caption = ''
        Color = 16316664
        object labTituloValorNota: TUniLabel
          Left = 24
          Top = 6
          Width = 265
          Height = 18
          Hint = ''
          AutoSize = False
          Caption = 'VALOR DA NOTA'
          ParentFont = False
          Font.Color = 9142630
          Font.Height = -12
          TabOrder = 1
        end
        object labValorNota: TUniLabel
          Left = 24
          Top = 22
          Width = 265
          Height = 38
          Hint = ''
          AutoSize = False
          Caption = 'R$ 0,00'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -24
          Font.Style = [fsBold]
          TabOrder = 2
        end
        object labTituloParcelas: TUniLabel
          Left = 318
          Top = 6
          Width = 265
          Height = 18
          Hint = ''
          AutoSize = False
          Caption = 'TOTAL DAS PARCELAS'
          ParentFont = False
          Font.Color = 9142630
          Font.Height = -12
          TabOrder = 3
        end
        object labParcelas: TUniLabel
          Left = 318
          Top = 22
          Width = 265
          Height = 38
          Hint = ''
          AutoSize = False
          Caption = 'R$ 0,00'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -24
          Font.Style = [fsBold]
          TabOrder = 4
        end
        object labTituloDiferenca: TUniLabel
          Left = 612
          Top = 6
          Width = 265
          Height = 18
          Hint = ''
          AutoSize = False
          Caption = 'DIFERENCA'
          ParentFont = False
          Font.Color = 9142630
          Font.Height = -12
          TabOrder = 5
        end
        object labDiferenca: TUniLabel
          Left = 612
          Top = 22
          Width = 265
          Height = 38
          Hint = ''
          AutoSize = False
          Caption = 'R$ 0,00'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -24
          Font.Style = [fsBold]
          TabOrder = 6
        end
      end
    end
    object rcBlock480: TUniContainerPanel
      Tag = 1
      Left = 0
      Top = 160
      Width = 886
      Height = 291
      Hint = '[[cols:12]]'
      ParentColor = False
      Align = alClient
      ParentAlignmentControl = False
      TabOrder = 2
      ExplicitLeft = 22
      ExplicitTop = 195
      ExplicitWidth = 842
      ExplicitHeight = 246
      object gridParcelas: TUniDBGrid
        AlignWithMargins = True
        Left = 10
        Top = 5
        Width = 866
        Height = 281
        Hint = ''
        Margins.Left = 10
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        ClicksToEdit = 1
        DataSource = dsParcelas
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgTabs, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Message = 'Loading data...'
        ForceFit = True
        Align = alClient
        TabOrder = 1
        Columns = <
          item
            FieldName = 'PARCELA'
            Title.Caption = 'Parcela'
            Width = 100
          end
          item
            FieldName = 'VENCIMENTO'
            Title.Caption = 'Vencimento'
            Width = 250
          end
          item
            FieldName = 'VALOR'
            Title.Caption = 'Valor da parcela (R$)'
            Width = 300
          end>
      end
    end
    object rcBlock30: TUniContainerPanel
      Left = 0
      Top = 113
      Width = 886
      Height = 47
      Hint = '[[cols:12]]'
      ParentColor = False
      Align = alTop
      TabOrder = 3
      object paAcoes: TUniPanel
        Left = 0
        Top = 0
        Width = 886
        Height = 46
        Hint = ''
        Align = alTop
        TabOrder = 1
        BorderStyle = ubsNone
        Alignment = taLeftJustify
        Caption = ''
        Color = clWhite
        object btnIncluir: TUniButton
          Left = 25
          Top = 5
          Width = 145
          Height = 36
          Hint = ''
          Caption = 'Adicionar parcela'
          TabOrder = 1
          OnClick = IncluirClick
        end
        object btnExcluir: TUniButton
          Left = 180
          Top = 5
          Width = 135
          Height = 36
          Hint = ''
          Caption = 'Excluir parcela'
          TabOrder = 2
          OnClick = ExcluirClick
        end
        object btnConferir: TUniButton
          Left = 324
          Top = 5
          Width = 135
          Height = 36
          Hint = ''
          Caption = 'Conferir totais'
          TabOrder = 3
          OnClick = ConferirClick
        end
      end
    end
  end
  object memParcelas: TFDMemTable
    BeforePost = ParcelaBeforePost
    AfterPost = ParcelasAlteradas
    AfterDelete = ParcelasAlteradas
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 992
    Top = 48
  end
  object dsParcelas: TDataSource
    DataSet = memParcelas
    Left = 992
    Top = 128
  end
end
