object formBase: TformBase
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal: |'#13#10#10']]'#13#10
  Margins.Left = 4
  Margins.Top = 4
  Margins.Right = 4
  Margins.Bottom = 4
  ClientHeight = 497
  ClientWidth = 360
  Caption = ''
  Color = clWhite
  OnShow = UniFormShow
  BorderStyle = bsNone
  OldCreateOrder = False
  OnClose = UniFormClose
  OnKeyDown = UniFormKeyDown
  KeyPreview = True
  NavigateKeys.Enabled = True
  NavigateKeys.Prior.Key = 13
  NavigateKeys.Prior.ShiftState = [ussShift]
  NavigateKeys.Next.Key = 13
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object paBackground: TUniContainerPanel
    AlignWithMargins = True
    Left = 4
    Top = 42
    Width = 356
    Height = 455
    Hint = ''
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ParentColor = False
    Color = 15987699
    Align = alClient
    AutoScroll = True
    TabOrder = 0
    ScrollHeight = 455
    ScrollWidth = 356
  end
  object paBaseTopTitle: TUniContainerPanel
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 356
    Height = 38
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 0
    Margins.Bottom = 0
    ParentColor = False
    Color = 2763306
    Align = alTop
    TabOrder = 1
    object labTitleForm: TUniLabel
      AlignWithMargins = True
      Left = 6
      Top = 3
      Width = 237
      Height = 27
      Hint = ''
      Margins.Left = 6
      Margins.Bottom = 8
      TextConversion = txtHTML
      AutoSize = False
      Caption = 'Title'
      Align = alLeft
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Calibri Light'
      ParentColor = False
      Color = clSilver
      TabOrder = 1
    end
  end
  object timerClose: TUniTimer
    Interval = 500
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = timerCloseTimer
    Left = 200
    Top = 9
  end
end
