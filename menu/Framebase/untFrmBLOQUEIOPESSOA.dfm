object frmBLOQUEIOPESSOA: TfrmBLOQUEIOPESSOA
  Left = 0
  Top = 0
  ClientHeight = 343
  ClientWidth = 545
  Caption = ''
  BorderStyle = bsNone
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 545
    Height = 343
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 122
    ExplicitHeight = 48
    object rcBlock20: TUniContainerPanel
      Left = 0
      Top = 311
      Width = 545
      Height = 32
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Color = clWindow
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 310
      object btnLkpClear: TUniBitBtn
        Left = 450
        Top = 1
        Width = 95
        Height = 29
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 28
        Margins.Bottom = 12
        Caption = 'Fechar'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        OnClick = btnLkpClearClick
      end
    end
    object rcBlock30: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 545
      Height = 263
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Color = clWindow
      Align = alClient
      TabOrder = 2
      ExplicitHeight = 185
      object UniImage1: TUniImage
        Left = 0
        Top = 0
        Width = 545
        Height = 263
        Hint = ''
        Center = True
        Align = alClient
        Transparent = True
        ExplicitLeft = 176
        ExplicitTop = 64
        ExplicitWidth = 128
        ExplicitHeight = 128
      end
    end
    object rcBlock40: TUniContainerPanel
      Left = 0
      Top = 263
      Width = 545
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Color = clWindow
      Align = alBottom
      TabOrder = 3
      ExplicitLeft = 8
      ExplicitTop = 8
      ExplicitWidth = 122
      object UniLabel1: TUniLabel
        Left = 3
        Top = 3
        Width = 542
        Height = 39
        Hint = ''
        Alignment = taCenter
        AutoSize = False
        Caption = 'PESSOA BLOQUEADA'
        ParentFont = False
        Font.Color = clRed
        Font.Height = -32
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
end
