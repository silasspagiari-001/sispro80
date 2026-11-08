object frmGraphGOOGLE: TfrmGraphGOOGLE
  Left = 0
  Top = 0
  Width = 1059
  Height = 752
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 1059
    Height = 752
    Hint = ''
    Align = alClient
    Color = 15395562
    TabOrder = 0
    ScrollHeight = 1008
    ScrollWidth = 579
    object rcBlock40: TUniContainerPanel
      Tag = 6
      Left = 20
      Top = 18
      Width = 251
      Height = 513
      Hint = '[['#13#10'cols:xs-12 sm-12 md-6  | '#13#10'round:all'#13#10']]'
      ParentColor = False
      TabOrder = 0
      object htmlMapBR: TUniHTMLFrame
        Left = 34
        Top = 45
        Width = 195
        Height = 182
        Hint = '[['#13#10'anchor:'#13#10']]'
      end
    end
    object rcBlock140: TUniContainerPanel
      Left = 34
      Top = 968
      Width = 545
      Height = 40
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 1
    end
    object rcBlock50: TUniContainerPanel
      Tag = 6
      Left = 310
      Top = 12
      Width = 251
      Height = 513
      Hint = '[['#13#10'cols:xs-12 sm-12 md-6  | '#13#10'round:all'#13#10']]'
      ParentColor = False
      TabOrder = 2
      object htmlMapWORLD: TUniHTMLFrame
        Left = 34
        Top = 45
        Width = 195
        Height = 182
        Hint = '[['#13#10'anchor:'#13#10']]'
      end
    end
  end
  object memWorld: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 712
    Top = 111
  end
  object dsMemWorld: TDataSource
    DataSet = memWorld
    Left = 712
    Top = 152
  end
end
