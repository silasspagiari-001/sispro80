object frmDEMOWithFormMODAL2: TfrmDEMOWithFormMODAL2
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'#13#10#13#10
  HelpType = htKeyword
  ClientHeight = 559
  ClientWidth = 649
  Caption = 'frmDEMOWithFormMODAL B'
  OnShow = UniFormShow
  OnResize = UniFormResize
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  NavigateKeys.Enabled = True
  NavigateKeys.Next.Key = 13
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object rcBlock200: TUniContainerPanel
    Tag = 1
    Left = 17
    Top = 491
    Width = 612
    Height = 38
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10']]'#13#10#13#10
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 12
    ParentColor = False
    TabOrder = 0
    DesignSize = (
      612
      38)
    object btnCancel: TUniBitBtn
      AlignWithMargins = True
      Left = 500
      Top = 0
      Width = 98
      Height = 38
      Hint = '[[cls:ButtonRed ]]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = 'Close Form'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnCancelClick
      ExplicitLeft = 666
    end
  end
  object rcBlock2: TUniContainerPanel
    Left = 17
    Top = 8
    Width = 606
    Height = 451
    Hint = 
      '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'hr:parent-top off:120 off-mobile-v-' +
      '120 off-mobile-h-120 |'#13#10'noborder-all'#13#10']]'#13#10#13#10
    ParentColor = False
    TabOrder = 1
    object UniScrollBox1: TUniScrollBox
      Left = 16
      Top = 10
      Width = 551
      Height = 405
      Hint = '[['#13#10'anchor:'#13#10']]'
      TabOrder = 1
      ScrollHeight = 101
      ScrollWidth = 403
      object rcBlock80: TUniContainerPanel
        Tag = 1
        Left = 27
        Top = 41
        Width = 376
        Height = 60
        Hint = '[[cols:12]]'
        ParentColor = False
        TabOrder = 0
        DesignSize = (
          376
          60)
        object UniLabel6: TUniLabel
          Left = 0
          Top = 0
          Width = 86
          Height = 13
          Hint = ''
          Caption = 'Nome / Fantasia'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object UniDBEdit1: TUniEdit
          Left = 0
          Top = 21
          Width = 375
          Height = 38
          Hint = ''
          CharCase = ecUpperCase
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
    end
  end
end
