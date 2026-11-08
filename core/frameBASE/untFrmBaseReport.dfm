object frmBaseReport: TfrmBaseReport
  Left = 0
  Top = 0
  ClientHeight = 822
  ClientWidth = 1113
  Caption = 'frmBaseReport'
  OnShow = UniFormShow
  BorderStyle = bsNone
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  Font.Height = -13
  Font.Name = 'Calibri'
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  TextHeight = 15
  object UniURLFrame1: TUniURLFrame
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 1107
    Height = 772
    Hint = ''
    Margins.Top = 0
    Enabled = False
    Visible = False
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
  end
  object ed_Table_ItemSel: TUniEdit
    Left = 573
    Top = -6
    Width = 41
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 1
  end
  object ed_FormOrigin: TUniEdit
    Left = 599
    Top = -6
    Width = 41
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 2
  end
  object ed_FormOrigin_Tab: TUniEdit
    Left = 627
    Top = -6
    Width = 41
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 3
  end
  object ed_Table_Status: TUniEdit
    Left = 654
    Top = -6
    Width = 41
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 4
  end
  object ed_Order_Search: TUniEdit
    Left = 679
    Top = -6
    Width = 41
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 5
  end
  object ed_Where_Search: TUniEdit
    Left = 699
    Top = -6
    Width = 41
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 6
  end
  object ed_CodMaster: TUniEdit
    Left = 717
    Top = -6
    Width = 41
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 7
  end
  object paTitleRegDetail: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1113
    Height = 43
    Hint = ''
    Margins.Top = 0
    Margins.Bottom = 0
    ParentColor = False
    Color = clWhite
    Align = alTop
    TabOrder = 8
    DesignSize = (
      1113
      43)
    object btnGeneratePDF: TUniBitBtn
      AlignWithMargins = True
      Left = 1006
      Top = 4
      Width = 99
      Height = 35
      Hint = 
        '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-print cls-ico:font-black|'#13#10'capti' +
        'on-hide:mobile|'#13#10'append'#13#10']]'
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 10
      Margins.Bottom = 4
      Visible = False
      Caption = 'Print'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TabOrder = 1
      ScaleButton = False
      OnClick = btnGeneratePDFClick
    end
    object btnExit: TUniBitBtn
      AlignWithMargins = True
      Left = 6
      Top = 4
      Width = 35
      Height = 35
      Hint = 
        '[['#13#10'cls:ButtonWhite rc-mirror-h| '#13#10'ico:fas-sign-out-alt cls-ico:' +
        'font-black'#13#10']]'
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 10
      Margins.Bottom = 4
      Caption = '<'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TabOrder = 2
      ScaleButton = False
      OnClick = btnExitClick
    end
    object labTitleFrm: TUniLabel
      AlignWithMargins = True
      Left = 46
      Top = 5
      Width = 891
      Height = 35
      Hint = ''
      Margins.Left = 10
      Margins.Top = 5
      AutoSize = False
      Caption = 'Generic Report'
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clGray
      Font.Height = -24
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TabOrder = 3
    end
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 43
    Width = 1113
    Height = 4
    Hint = ''
    Align = alTop
    TabOrder = 9
    Caption = ''
  end
  object UniPDFFrame1: TUniPDFFrame
    Left = 0
    Top = 47
    Width = 1113
    Height = 775
    Hint = ''
    Align = alClient
    TabOrder = 10
    object RLReport: TRLReport
      Left = 66
      Top = 18
      Width = 794
      Height = 1123
      DataSource = dsMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Visible = False
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 972
    Top = 32
  end
  object RLExpressionParser1: TRLExpressionParser
    Left = 974
    Top = 78
  end
  object sqlMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'Select * from cargos')
    Left = 975
    Top = 135
  end
  object dsMaster: TDataSource
    AutoEdit = False
    DataSet = sqlMaster
    Left = 972
    Top = 185
  end
  object sqlSearchMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime, fvFmtDisplayDate, fvFmtDisplayNumeric, fvStrsTrim2Len]
    SQL.Strings = (
      '')
    Left = 975
    Top = 235
  end
  object dsSearchMaster: TDataSource
    AutoEdit = False
    DataSet = sqlSearchMaster
    Left = 974
    Top = 281
  end
end
