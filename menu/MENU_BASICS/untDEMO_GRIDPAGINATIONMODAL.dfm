inherited frmDEMO_GRIDPAGINATIONMODAL: TfrmDEMO_GRIDPAGINATIONMODAL
  ClientHeight = 436
  ClientWidth = 704
  Caption = 'frmDEMO_GRIDPAGINATIONMODAL'
  OnAfterShow = UniFormAfterShow
  ExplicitWidth = 704
  ExplicitHeight = 436
  TextHeight = 15
  object UniScrollBox1: TUniScrollBox [0]
    Left = 4
    Top = 50
    Width = 704
    Height = 385
    Hint = 
      '[['#13#10'align:BlockTitle b:0 l:0|'#13#10'scale:parent w:100% |'#13#10'scale:pare' +
      'nt h:100%-top |'#13#10']]'#13#10
    TabOrder = 0
    ScrollHeight = 383
    ScrollWidth = 682
    object rcBlock2: TUniContainerPanel
      Tag = 1
      Left = 13
      Top = 16
      Width = 669
      Height = 307
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'noborder-all|'#13#10'hr:parent-top off:58' +
        ' off-mobile-v-70 off-mobile-h-0 |'#13#10'min-height:200 mobile-220| '#13#10 +
        ']]'
      ParentColor = False
      TabOrder = 0
    end
    object rcBlock3: TUniContainerPanel
      Left = 13
      Top = 325
      Width = 669
      Height = 58
      Hint = 
        '[['#13#10'cols:12|'#13#10'noborder-all|'#13#10'hr-childs:xs-exp sm-exp md-fix |'#13#10'c' +
        'ls:card-light |'#13#10']]'
      ParentColor = False
      TabOrder = 1
      object edPage: TUniEdit
        Left = 495
        Top = 7
        Width = 35
        Hint = ''
        Visible = False
        Alignment = taCenter
        Text = '1'
        TabOrder = 3
      end
      object edTotPages: TUniEdit
        Left = 544
        Top = 7
        Width = 35
        Hint = ''
        Visible = False
        Alignment = taCenter
        Text = '0'
        TabOrder = 4
      end
      object rcBlock8: TUniContainerPanel
        Left = 507
        Top = 17
        Width = 76
        Height = 35
        Hint = 
          '[['#13#10'cols:xs-6 sm-6 md-2|'#13#10'cols-offset:10 |'#13#10'min-width:100 mobile' +
          '-h-110 mobile-v-110'#13#10']]'#13#10
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          76
          35)
        object cbxItemsPerPage: TUniComboBox
          Left = 0
          Top = 0
          Width = 75
          Height = 33
          Cursor = crHandPoint
          Hint = '[['#13#10'cls:rc-form-text-center'#13#10']]'
          Text = 'cbxItemsPerPage'
          Items.Strings = (
            '10 / page'
            '15 / page'
            '25 / page'
            '50 / page'
            '100 / page')
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          TabOrder = 1
          ReadOnly = True
          ScreenMask.Enabled = True
          ScreenMask.Target = Owner
          IconItems = <>
          OnClick = cbxItemsPerPageClick
          OnChange = cbxItemsPerPageChange
        end
      end
      object rcBlock6: TUniContainerPanel
        Left = 424
        Top = 4
        Width = 85
        Height = 35
        Hint = 
          '[['#13#10'cols:xs-6 sm-6 md-2|'#13#10'cols-offset:10 |'#13#10'min-width:100 mobile' +
          '-h-110 mobile-v-110'#13#10']]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          85
          35)
        object lab_rc_Recs: TUniLabel
          Left = 3
          Top = 8
          Width = 79
          Height = 16
          Hint = ''
          Enabled = False
          Visible = False
          Alignment = taRightJustify
          AutoSize = False
          Caption = '1 / 10 of 1000 '
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          TabOrder = 1
        end
        object cbxRecs: TUniComboBox
          Left = 1
          Top = 0
          Width = 82
          Height = 33
          Cursor = crHandPoint
          Hint = '[['#13#10'cls:rc-form-text-center'#13#10']]'
          Text = 'cbxItemsPerPage'
          Items.Strings = (
            '10 / page'
            '15 / page'
            '25 / page'
            '50 / page'
            '100 / page')
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          TabOrder = 2
          ReadOnly = True
          ScreenMask.Target = Owner
          IconItems = <>
          OnClick = cbxRecsClick
        end
      end
      object rcBlock4: TUniContainerPanel
        Left = 4
        Top = 9
        Width = 413
        Height = 35
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-8|'#13#10'cols-offset:10 |'#13#10'/*center:parent mo' +
          'bile-x|*/'#13#10'/*max-width:428 mobile-h-470 mobile-v-340*/'#13#10']]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          413
          35)
        object BlockBtns: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 412
          Height = 35
          Hint = 
            '[['#13#10'anchor:|'#13#10'center:parent xy|'#13#10'/*max-width:428 mobile-h-470 mo' +
            'bile-v-340*/'#13#10']]'
          ParentColor = False
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          object btn_rc_First_pg: TUniBitBtn
            Left = 1
            Top = 0
            Width = 75
            Height = 33
            Hint = 
              '[['#13#10'width:81 mobile-h-86 mobile-v-52|'#13#10'ico:fas-angles-left|'#13#10'cap' +
              'tion-hide:mobile|'#13#10'append'#13#10']]'
            Caption = 'First'
            TabOrder = 1
            ScreenMask.Enabled = True
            ScreenMask.Target = Owner
            OnClick = btn_rc_First_pgClick
          end
          object btn_rc_Previous_pg: TUniBitBtn
            Left = 77
            Top = 0
            Width = 75
            Height = 33
            Hint = 
              '[['#13#10'width:81 mobile-h-86 mobile-v-52|'#13#10'align:btn_rc_First_pg r:3' +
              '|'#13#10'ico:fas-angle-left|'#13#10'caption-hide:mobile|'#13#10'append'#13#10']]'
            Caption = 'Previous'
            TabOrder = 2
            ScreenMask.Enabled = True
            ScreenMask.Target = Owner
            OnClick = btn_rc_Previous_pgClick
          end
          object btn_rc_pg_1: TUniBitBtn
            Left = 154
            Top = 0
            Width = 36
            Height = 33
            Hint = '[['#13#10#13#10'align:btn_rc_Previous_pg r:4|'#13#10']]'
            Caption = '1'
            TabOrder = 3
            ScreenMask.Enabled = True
            ScreenMask.Target = Owner
            OnClick = btn_rc_pg_1Click
          end
          object btn_rc_pg_2: TUniBitBtn
            Left = 188
            Top = 0
            Width = 36
            Height = 33
            Hint = '[['#13#10'align:btn_rc_pg_1 r:3|'#13#10']]'
            Caption = '2'
            TabOrder = 4
            ScreenMask.Enabled = True
            ScreenMask.Target = Owner
            OnClick = btn_rc_pg_1Click
          end
          object btn_rc_pg_3: TUniBitBtn
            Left = 222
            Top = 0
            Width = 36
            Height = 33
            Hint = '[['#13#10'align:btn_rc_pg_2 r:3|'#13#10']]'#13#10
            Caption = '3'
            TabOrder = 5
            ScreenMask.Enabled = True
            ScreenMask.Target = Owner
            OnClick = btn_rc_pg_1Click
          end
          object btn_rc_Next_pg: TUniBitBtn
            Left = 260
            Top = 0
            Width = 75
            Height = 33
            Hint = 
              '[['#13#10'width:81 mobile-h-86 mobile-v-52|'#13#10'align:btn_rc_pg_3 r:4|'#13#10'i' +
              'co:fas-angle-right|'#13#10'ico-pos:right |'#13#10'caption-hide:mobile|'#13#10'appe' +
              'nd'#13#10']]'
            Caption = 'Next'
            TabOrder = 6
            ScreenMask.Enabled = True
            ScreenMask.Target = Owner
            OnClick = btn_rc_Next_pgClick
          end
          object btn_rc_Last_pg: TUniBitBtn
            Left = 336
            Top = 0
            Width = 75
            Height = 33
            Hint = 
              '[['#13#10'width:81 mobile-h-86 mobile-v-52|'#13#10'align:btn_rc_Next_pg r:3|' +
              #13#10'ico:fas-angles-right|'#13#10'ico-pos:right |'#13#10'caption-hide:mobile|'#13#10 +
              'append'#13#10']]'
            Caption = 'Last'
            TabOrder = 7
            ScreenMask.Enabled = True
            ScreenMask.Target = Owner
            OnClick = btn_rc_Last_pgClick
          end
        end
      end
    end
  end
  object BlockTitle: TUniContainerPanel [1]
    Left = 2
    Top = 2
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
    object UniLabel2: TUniLabel
      Left = 41
      Top = 6
      Width = 154
      Height = 23
      Hint = '[['#13#10'cls:rc-label-clear |'#13#10'center:parent y|'#13#10'align:btSair r:6'#13#10']]'
      Margins.Left = 6
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'List View Pagination'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object paPanelOptions: TUniContainerPanel [2]
    Left = 369
    Top = 67
    Width = 220
    Height = 178
    Hint = '[['#13#10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'
    Visible = False
    ParentColor = False
    Color = clWhite
    TabOrder = 2
    DesignSize = (
      220
      178)
    object rcBlock2000: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 220
      Height = 42
      Hint = '[[cols:12|noborder-all|round:t | cls:card-light]]'#13#10#13#10
      ParentColor = False
      Color = clSilver
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        220
        42)
      object UniLabel9: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 0
        Width = 214
        Height = 25
        Hint = '[['#13#10'bsh6:|'#13#10'cls:left-center|'#13#10'center:parent y'#13#10']]'
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        AutoSize = False
        Caption = 'Select one Page'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object labClosePanelOptions: TUniLabel
        Left = 181
        Top = 8
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-times |'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 2
        OnClick = labClosePanelOptionsClick
      end
    end
    object btnOk: TUniBitBtn
      Left = 15
      Top = 123
      Width = 80
      Height = 38
      Hint = '[['#13#10'center:parent x'#13#10']]'
      Caption = 'Go'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Height = -15
      Font.Name = 'Calibri'
      TabOrder = 3
      OnClick = btnOkClick
    end
    object paEdit: TUniContainerPanel
      Left = 15
      Top = 65
      Width = 190
      Height = 40
      Hint = '[[center:parent x]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        190
        40)
      object edIniSpin: TUniNumberEdit
        Left = 0
        Top = 0
        Width = 190
        Height = 38
        Hint = '[['#13#10'valid:>0|'#13#10'input-addon:spin min:0 max:100 step:1'#13#10']]'#13#10
        Alignment = taCenter
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DecimalSeparator = ','
      end
    end
  end
  object sqlActions: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'select * '
      'from cidades'
      'order by codigo')
    Left = 310
    Top = 132
  end
  object dsActions: TDataSource
    AutoEdit = False
    DataSet = sqlActions
    Left = 312
    Top = 180
  end
end
