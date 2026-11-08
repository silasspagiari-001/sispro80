object frmDEMO_LOGIN: TfrmDEMO_LOGIN
  Left = 0
  Top = 0
  Width = 954
  Height = 653
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 954
    Height = 653
    Hint = ''
    AutoScroll = True
    Align = alClient
    TabOrder = 0
    Background.Url = 'files\images\distrib\automotivo\1.jpg'
    Caption = ''
    ScrollHeight = 653
    ScrollWidth = 954
    object UniScrollBox1: TUniScrollBox
      Left = 1
      Top = 1
      Width = 952
      Height = 651
      Hint = ''
      Align = alClient
      TabOrder = 1
      ScrollHeight = 478
      ScrollWidth = 780
      object paForm: TUniContainerPanel
        Left = 450
        Top = 130
        Width = 330
        Height = 348
        Hint = 
          '[['#13#10'align:parent r:-w-default-offset mobile-off|'#13#10'center:parent ' +
          'y-mobile-xy|'#13#10'round:no | '#13#10'cls:card-info-box-white'#13#10']]'
        ParentColor = False
        TabOrder = 0
        DesignSize = (
          330
          348)
        object rcBlock1290: TUniContainerPanel
          Tag = 1
          Left = 10
          Top = 10
          Width = 111
          Height = 60
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            111
            60)
          object rcLabel1290: TUniLabel
            Left = 0
            Top = 0
            Width = 31
            Height = 15
            Hint = ''
            Caption = 'Email'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object edEmail: TUniEdit
            Left = 0
            Top = 21
            Width = 110
            Height = 38
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            Font.Height = -15
            Font.Name = 'Calibri'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock1300: TUniContainerPanel
          Tag = 1
          Left = 12
          Top = 76
          Width = 111
          Height = 60
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            111
            60)
          object rcLabel1300: TUniLabel
            Left = 0
            Top = 0
            Width = 54
            Height = 15
            Hint = ''
            Caption = 'Password'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object edPass: TUniEdit
            Left = 0
            Top = 21
            Width = 110
            Height = 38
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            Font.Height = -15
            Font.Name = 'Calibri'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock1310: TUniContainerPanel
          Tag = 1
          Left = 12
          Top = 146
          Width = 111
          Height = 60
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            111
            60)
          object rcLabel1310: TUniLabel
            Left = 0
            Top = 0
            Width = 43
            Height = 15
            Hint = ''
            Caption = 'Doc / Id'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object edID: TUniEdit
            Left = 0
            Top = 21
            Width = 110
            Height = 38
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            Font.Height = -15
            Font.Name = 'Calibri'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object UniBitBtn1: TUniBitBtn
          Left = 225
          Top = 294
          Width = 84
          Height = 38
          Hint = '[['#13#10'cls:ButtonThemeCrud'#13#10']]'
          Caption = 'Ok'
          Anchors = [akLeft, akBottom]
          TabOrder = 4
        end
      end
    end
  end
end
