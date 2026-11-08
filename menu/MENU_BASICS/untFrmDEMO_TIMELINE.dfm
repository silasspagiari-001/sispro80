object frmDEMO_TIMELINE: TfrmDEMO_TIMELINE
  Left = 0
  Top = 0
  Width = 954
  Height = 653
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  ParentColor = False
  ParentBackground = False
  object rcBlock5: TUniContainerPanel
    Left = 2
    Top = 2
    Width = 702
    Height = 70
    Hint = '[['#13#10'cols:12|'#13#10'cls:card-info-box-white |'#13#10']]'
    ParentColor = False
    TabOrder = 0
    DesignSize = (
      702
      70)
    object btSair: TUniLabel
      Left = 6
      Top = 18
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
    object labFormName: TUniLabel
      Left = 45
      Top = 18
      Width = 97
      Height = 26
      Hint = '[['#13#10'center:parent y'#13#10']]'
      TextConversion = txtHTML
      Caption = 'Update Log'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Calibri'
      TabOrder = 2
    end
    object imgLogo: TUniImage
      AlignWithMargins = True
      Left = 578
      Top = 2
      Width = 124
      Height = 63
      Cursor = crHandPoint
      Hint = ''
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 12
      Center = True
      Url = 'files/images/logo_login.png'
      Anchors = [akTop, akRight]
      Transparent = True
      LayoutConfig.Region = 'center'
    end
  end
  object UniHTMLFrame1: TUniHTMLFrame
    Left = 178
    Top = 18
    Width = 23
    Height = 37
    Hint = ''
    Visible = False
    OnAjaxEvent = UniHTMLFrame1AjaxEvent
  end
  object sboxGridBlock: TUniScrollBox
    Left = 8
    Top = 88
    Width = 703
    Height = 357
    Hint = 
      '[['#13#10'align:rcBlock5 b:0 l:0|'#13#10'scale:parent w:100%-left off:0|'#13#10'/*' +
      #13#10'scale:parent w:100%-left off:default-offset |'#13#10'scale:parent h:' +
      '100%-top off:default-offset|'#13#10'*/'#13#10'scale:parent h:100%-top off:de' +
      'fault-offset|'#13#10#13#10']]'
    TabOrder = 2
  end
  object memTimeLine: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 886
    Top = 39
  end
  object dsMemTimeLine: TDataSource
    DataSet = memTimeLine
    Left = 886
    Top = 80
  end
end
