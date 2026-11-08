object unfImpressao: TunfImpressao
  Left = 0
  Top = 0
  ClientHeight = 513
  ClientWidth = 760
  Caption = 'unfImpressao'
  BorderStyle = bsNone
  WindowState = wsMaximized
  Position = poDesktopCenter
  OldCreateOrder = False
  BorderIcons = [biSystemMenu, biMaximize]
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object UniButton2: TUniButton
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 754
    Height = 40
    Hint = ''
    Caption = 'Fechar'
    Align = alTop
    TabOrder = 0
    ClientEvents.ExtEvents.Strings = (
      
        'added=function added(sender, container, pos, eOpts)'#13#10'{'#13#10'  sender' +
        '.addCls('#39'BotaoVermelho'#39');'#13#10'}')
    OnClick = UniButton2Click
  end
  object UniURLFrame: TUniPDFFrame
    Left = 0
    Top = 46
    Width = 760
    Height = 467
    Hint = ''
    Align = alClient
    TabOrder = 1
  end
end
