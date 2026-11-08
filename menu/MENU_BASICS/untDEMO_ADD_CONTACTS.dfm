inherited frmDEMO_ADD_CONTACTS: TfrmDEMO_ADD_CONTACTS
  ClientHeight = 436
  ClientWidth = 704
  Caption = 'frmDEMO_ADD_CONTACTS'
  ExplicitWidth = 704
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 13
  object UniScrollBox1: TUniScrollBox [0]
    Left = 4
    Top = 50
    Width = 692
    Height = 382
    Hint = 
      '[['#13#10'align:BlockTitle b:0 l:0|'#13#10'scale:parent w:100% |'#13#10'scale:pare' +
      'nt h:100%-top |'#13#10']]'#13#10
    Color = clWhite
    TabOrder = 0
    ScrollHeight = 334
    ScrollWidth = 680
    object rcBlock2: TUniContainerPanel
      Tag = 1
      Left = 11
      Top = 16
      Width = 669
      Height = 143
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'hr-childs:xs-exp sm-exp md-exp |'#13#10'r' +
        'ound:no | '#13#10'cls:card-info-box-white'#13#10']]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        669
        143)
      object rcBlock200: TUniContainerPanel
        Left = 14
        Top = 85
        Width = 122
        Height = 39
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 1
        object btnNewContact: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 0
          Width = 120
          Height = 38
          Hint = '[['#13#10'ico:fas-plus | '#13#10'cls:ButtonGreen | '#13#10'append '#13#10']]'#13#10#13#10
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Contact'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnNewContactClick
        end
      end
      object rcBlock1: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 248
        Height = 42
        Hint = 
          '[['#13#10'cols:12 | '#13#10'noborder-top | '#13#10'noborder-left | '#13#10'scale:parent ' +
          'w:100% | '#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = 14802398
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        object UniLabel3: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 10
          Width = 242
          Height = 25
          Hint = 
            '[['#13#10'ico:far-address-book|'#13#10'cls-ico:color-black|'#13#10'/*cls:left-cent' +
            'er align-btn-caption|*/'#13#10'cls:align-btn-caption|'#13#10'align:rcblock1 ' +
            'l:10|'#13#10'center:parent y|'#13#10'append'#13#10']]'#13#10
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Contacts'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
    end
    object rcBlock220: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 11
      Top = 196
      Width = 249
      Height = 47
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-fix | '#13 +
        #10'round:no | '#13#10'cls:card-info-box-white'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      Color = clMoneyGreen
      AutoScroll = True
      TabOrder = 1
      ScrollHeight = 47
      ScrollWidth = 249
      object UniLabel2: TUniLabel
        Left = 22
        Top = 16
        Width = 85
        Height = 13
        Hint = ''
        Caption = 'Another block ....'
        TabOrder = 1
      end
    end
    object rcBlock230: TUniContainerPanel
      Left = 42
      Top = 308
      Width = 122
      Height = 26
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 2
    end
  end
  object BlockTitle: TUniContainerPanel [1]
    Left = 2
    Top = 0
    Width = 702
    Height = 46
    Hint = 
      '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'scale:parent w:100% |'#13#10'round:t | '#13#10'cls:c' +
      'ard-light |'#13#10']]'#13#10
    ParentColor = False
    TabOrder = 1
    object btSair: TUniLabel
      Left = 2
      Top = 1
      Width = 33
      Height = 28
      Cursor = crHandPoint
      Hint = '[['#13#10'center:parent y|'#13#10'ico:fas-sign-out-alt rc-mirror-h |'#13#10']]'
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 0
      Margins.Bottom = 4
      Alignment = taCenter
      TextConversion = txtHTML
      AutoSize = False
      Caption = '<'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Calibri Light'
      ParentColor = False
      Color = clSilver
      TabOrder = 1
      OnClick = btSairClick
    end
    object UniLabel1: TUniLabel
      AlignWithMargins = True
      Left = 41
      Top = 6
      Width = 121
      Height = 23
      Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'align:btSair r:6'#13#10']]'
      Margins.Left = 6
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'ADD CONTACTS'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object memContacts: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 526
    Top = 206
  end
  object dsMemContacts: TDataSource
    DataSet = memContacts
    Left = 528
    Top = 252
  end
end
