inherited frmDEMO_LOOKUPMODAL: TfrmDEMO_LOOKUPMODAL
  ClientHeight = 415
  ClientWidth = 637
  Caption = 'frmDEMO_LOOKUPMODAL'
  ExplicitWidth = 637
  ExplicitHeight = 415
  TextHeight = 15
  object UniScrollBox1: TUniScrollBox [0]
    Left = 0
    Top = 0
    Width = 637
    Height = 415
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollHeight = 378
    ScrollWidth = 370
    object rcBlock5: TUniContainerPanel
      Left = 3
      Top = 3
      Width = 268
      Height = 46
      Hint = 
        '[['#13#10'cols:12 |'#13#10'scale:parent w:100%|'#13#10'noborder-all | '#13#10'round:t | ' +
        #13#10'cls:card-light |'#13#10']]'
      ParentColor = False
      TabOrder = 0
      object btSair: TUniLabel
        Left = 4
        Top = 3
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-sign-out-alt rc-mirror-h |'#13#10'center:parent y'#13#10']]'
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
      object UniLabel5: TUniLabel
        AlignWithMargins = True
        Left = 41
        Top = 6
        Width = 117
        Height = 23
        Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'align:btSair r:6'#13#10']]'
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = 'Lookup Sample'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock20: TUniContainerPanel
      Tag = 1
      Left = 12
      Top = 182
      Width = 221
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-7]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        221
        60)
      object UniLabel1Clone: TUniLabel
        Left = 0
        Top = -3
        Width = 142
        Height = 15
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'PK INT( +modal readonly )'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edLkpCLIENTES: TUniDBEdit
        Left = 0
        Top = 21
        Width = 220
        Height = 38
        Hint = 
          '[['#13#10'NOME CODICLI ! searchonly readonly +modal searchall|'#13#10']]'#13#10#13#10 +
          #13#10#13#10
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        ReadOnly = True
        InputType = 'text'
        OnClick = edLkpCLIENTESClick
        OnEnter = edLkpCLIENTESEnter
      end
    end
    object rcBlock30: TUniContainerPanel
      Tag = 1
      Left = 250
      Top = 182
      Width = 120
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-5]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        120
        60)
      object UniLabel2Clone: TUniLabel
        Left = 0
        Top = 0
        Width = 53
        Height = 13
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'Get Result'
        ParentFont = False
        Font.Height = -12
        TabOrder = 1
      end
      object ed_lkp_client: TUniEdit
        Left = 1
        Top = 21
        Width = 118
        Height = 38
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        OnEnter = ed_lkp_clientEnter
      end
    end
    object rcBlock7: TUniContainerPanel
      Tag = 1
      Left = 14
      Top = 54
      Width = 221
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-7]]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        221
        60)
      object UniLabel1: TUniLabel
        Left = 0
        Top = -3
        Width = 142
        Height = 15
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'PK BIG INT( "searchonly" )'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edLkpTB_BIGINT: TUniDBEdit
        Left = 0
        Top = 21
        Width = 221
        Height = 38
        Hint = '[['#13#10'DETAIL searchonly !|'#13#10'valid:blank=Status'#13#10']]'#13#10#13#10
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        ReadOnly = True
        InputType = 'text'
        OnEnter = edLkpTB_BIGINTEnter
      end
    end
    object rcBlock9: TUniContainerPanel
      Tag = 1
      Left = 250
      Top = 54
      Width = 120
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-5'#13#10']]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        120
        60)
      object UniLabel5Clone: TUniLabel
        Left = 0
        Top = 0
        Width = 53
        Height = 13
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'Get Result'
        ParentFont = False
        Font.Height = -12
        TabOrder = 1
      end
      object ed_lkp_test_bigint: TUniEdit
        Left = 1
        Top = 21
        Width = 118
        Height = 38
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock12: TUniContainerPanel
      Tag = 1
      Left = 14
      Top = 118
      Width = 221
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-7]]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        221
        60)
      object UniLabel2: TUniLabel
        Left = 0
        Top = -3
        Width = 217
        Height = 15
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'PK STRING( "searchonly and readonly" )'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edLkpT040001: TUniDBEdit
        Left = 0
        Top = 21
        Width = 221
        Height = 38
        Hint = '[['#13#10'DESCRICAO ID_STR @80 ! ds:dslookup | '#13#10']]'#13#10#13#10
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        ReadOnly = True
        InputType = 'text'
        OnEnter = edLkpT040001Enter
      end
    end
    object rcBlock15: TUniContainerPanel
      Tag = 1
      Left = 250
      Top = 118
      Width = 120
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-5'#13#10']]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        120
        60)
      object UniLabel5CloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 53
        Height = 13
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'Get Result'
        ParentFont = False
        Font.Height = -12
        TabOrder = 1
      end
      object ed_lkp_test_string: TUniEdit
        Left = 1
        Top = 21
        Width = 118
        Height = 38
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock80: TUniContainerPanel
      Tag = 1
      Left = 14
      Top = 254
      Width = 221
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-7]]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        221
        60)
      object UniLabel4: TUniLabel
        Left = 0
        Top = -1
        Width = 128
        Height = 15
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'PK DATE( "searchonly" )'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edLkpMOVCAIXA: TUniDBEdit
        Left = 0
        Top = 21
        Width = 221
        Height = 38
        Hint = '[['#13#10'DESCRICAO searchonly |'#13#10']]'#13#10#13#10
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        ReadOnly = True
        InputType = 'text'
        OnEnter = edLkpMOVCAIXAEnter
      end
    end
    object rcBlock90: TUniContainerPanel
      Tag = 1
      Left = 250
      Top = 254
      Width = 120
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-5'#13#10']]'
      ParentColor = False
      TabOrder = 8
      DesignSize = (
        120
        60)
      object UniLabel5CloneCloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 53
        Height = 13
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'Get Result'
        ParentFont = False
        Font.Height = -12
        TabOrder = 1
      end
      object ed_lkp_test_date: TUniEdit
        Left = 1
        Top = 21
        Width = 118
        Height = 38
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock100: TUniContainerPanel
      Tag = 1
      Left = 14
      Top = 318
      Width = 221
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-7]]'
      ParentColor = False
      TabOrder = 9
      DesignSize = (
        221
        60)
      object UniLabel4Clone: TUniLabel
        Left = 0
        Top = -3
        Width = 179
        Height = 15
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'PK INT( "searchonly and getpk:" )'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edLkpTB_TEST: TUniDBEdit
        Left = 42
        Top = 21
        Width = 179
        Height = 38
        Hint = '[['#13#10'DESCRICAO searchonly getpk:IDPROD !|'#13#10']]'#13#10#13#10
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        ReadOnly = True
        InputType = 'text'
        OnClick = edLkpTB_TESTClick
        OnEnter = edLkpTB_TESTEnter
      end
      object edIDFILIAL: TUniEdit
        Left = 0
        Top = 21
        Width = 39
        Height = 38
        Hint = ''
        Text = '1'
        TabOrder = 3
      end
    end
    object rcBlock110: TUniContainerPanel
      Tag = 1
      Left = 250
      Top = 318
      Width = 120
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-5'#13#10']]'
      ParentColor = False
      TabOrder = 10
      DesignSize = (
        120
        60)
      object UniLabel5CloneCloneCloneClone: TUniLabel
        Left = 0
        Top = -1
        Width = 106
        Height = 13
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'Get Result( IDPROD )'
        ParentFont = False
        Font.Height = -12
        TabOrder = 1
      end
      object ed_lkp_test_getpk: TUniEdit
        Left = 1
        Top = 21
        Width = 118
        Height = 38
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
  end
  inherited rcSweetAlert: TUniSweetAlert
    Left = 498
    Top = 74
  end
  object sqlLookUp: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'select * '
      'from tb_reports'
      'where codigo = :table_pk')
    Left = 428
    Top = 14
    ParamData = <
      item
        Name = 'TABLE_PK'
        ParamType = ptInput
      end>
  end
  object dsLookUp: TDataSource
    AutoEdit = False
    DataSet = sqlLookUp
    Left = 456
    Top = 150
  end
end
