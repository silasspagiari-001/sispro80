object frmDEMO_FORM_LAYOUT_7: TfrmDEMO_FORM_LAYOUT_7
  Left = 0
  Top = 0
  Width = 1004
  Height = 677
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  ParentColor = False
  ParentBackground = False
  object sboxGridBlock: TUniScrollBox
    Left = 0
    Top = 0
    Width = 1004
    Height = 677
    Cursor = crHandPoint
    Hint = ''
    Align = alClient
    Color = 15395562
    TabOrder = 0
    ScrollHeight = 675
    ScrollWidth = 971
    object rcBlock132: TUniContainerPanel
      Left = 8
      Top = 146
      Width = 309
      Height = 180
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10'hr:180 mobile-v-228 mobile-h-228 |'#13#10'/*hr-childs:xs-exp sm-' +
        'exp md-exp '#13#10'min-height:180 |*/'#13#10']]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 0
      object rcBlock133: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 253
        Height = 162
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-11 |'#13#10'noborder-all|'#13#10'/*scale:parent h:10' +
          '0% off-mobile-48|*/'#13#10'scale:parent w:100% off:48 mobile-off  |'#13#10'm' +
          'in-height:180 |'#13#10']]'#13#10#13#10#13#10#13#10
        ParentColor = False
        TabOrder = 1
        object rcBlock134: TUniContainerPanel
          Tag = 1
          Left = 14
          Top = 16
          Width = 70
          Height = 60
          Hint = '[[cols:xs-6 sm-6 md-2 ]]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            70
            60)
          object UUUniDBEdit1: TUniDBEdit
            Left = 0
            Top = 21
            Width = 70
            Height = 38
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
            Color = clGray
            ReadOnly = True
          end
          object UUUniLabel5: TUniLabel
            Left = 0
            Top = 0
            Width = 13
            Height = 18
            Hint = ''
            Caption = 'ID'
            ParentFont = False
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 2
          end
        end
        object rcBlock135: TUniContainerPanel
          Tag = 1
          Left = 97
          Top = 16
          Width = 70
          Height = 60
          Hint = '[[cols:xs-6 sm-6 md-2 ]]'#13#10
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            70
            60)
          object UUUniLabel6: TUniLabel
            Left = 0
            Top = 0
            Width = 41
            Height = 18
            Hint = ''
            Caption = 'Field 1'
            ParentFont = False
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object UUUniDBDateTimePicker1: TUniDBDateTimePicker
            Left = 1
            Top = 21
            Width = 68
            Height = 38
            Hint = ''
            DateTime = 44924.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock136: TUniContainerPanel
          Tag = 1
          Left = 171
          Top = 15
          Width = 70
          Height = 60
          Hint = '[['#13#10'cols:xs-0 sm-0 md-8 |'#13#10']]'
          ParentColor = False
          TabOrder = 3
        end
        object rcBlock137: TUniContainerPanel
          Tag = 1
          Left = 15
          Top = 84
          Width = 70
          Height = 60
          Hint = '[[cols:xs-12 sm-12 md-6 ]]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            70
            60)
          object UUUniLabel7: TUniLabel
            Left = 0
            Top = 0
            Width = 41
            Height = 18
            Hint = ''
            Caption = 'Field 4'
            ParentFont = False
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object UUUniDBEdit2: TUniDBEdit
            Left = 0
            Top = 21
            Width = 70
            Height = 38
            Hint = '[['#13#10'cls:rc-edit-date-trigger|'#13#10']]'
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            InputMask.Mask = '99.999.999/9999-99'
          end
        end
      end
      object rcBlock138: TUniContainerPanel
        Left = 259
        Top = 0
        Width = 44
        Height = 162
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-1 |'#13#10'noborder-all |'#13#10'hr:parent mobile-v-' +
          '48 mobile-h-48 |'#13#10'width:50 mobile-v-parent mobile-h-parent  |'#13#10'a' +
          'lign:rcBlock133 r:0 t:0 mobile-off |'#13#10']]'#13#10#13#10
        ParentColor = False
        Color = 5354999
        TabOrder = 2
        object rcBlock140: TUniContainerPanel
          Left = 5
          Top = 25
          Width = 32
          Height = 32
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'/*noborder-left| */'#13#10'noborder' +
            '-right|'#13#10'center:parent x-mobile-y'#13#10']]'#13#10#13#10
          ParentColor = False
          TabOrder = 1
          object bbbtnNewReg: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 2
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black |'#13#10'ce' +
              'nter:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '+'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock141: TUniContainerPanel
          Left = 5
          Top = 64
          Width = 32
          Height = 32
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left:mobile |'#13#10'nobor' +
            'der-right:mobile|'#13#10'center:parent x-mobile-y'#13#10']]'
          ParentColor = False
          TabOrder = 2
          object bbbtnEditReg: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '!'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock142: TUniContainerPanel
          Left = 5
          Top = 104
          Width = 32
          Height = 32
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left:mobile |'#13#10'cente' +
            'r:parent x-mobile-y'#13#10']]'
          ParentColor = False
          TabOrder = 3
          object bbbtnDeleteReg: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 0
            Caption = '#'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock139: TUniContainerPanel
          Left = 9
          Top = 3
          Width = 32
          Height = 7
          Hint = 
            '[['#13#10'cols:xs-1 sm-1 md-12 |'#13#10'/*noborder-all |*/'#13#10'noborder-top:des' +
            'ktop|'#13#10'noborder-left:mobile|'#13#10'/*noborder-bottom|*/'#13#10'noborder-rig' +
            'ht|'#13#10'width:6 mobile-v-6 mobile-h-6|'#13#10'/*hide:mobile disable*/'#13#10']]' +
            #13#10#13#10
          ParentColor = False
          TabOrder = 4
        end
      end
    end
    object rcBlock144: TUniContainerPanel
      Left = 323
      Top = 146
      Width = 321
      Height = 180
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10'/*hr:170 mobile-v-218 mobile-h-218 |*/'#13#10'hr:180 mobile-v-22' +
        '8 mobile-h-228 |'#13#10']]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 1
      object rcBlock150: TUniContainerPanel
        Left = 65
        Top = 0
        Width = 253
        Height = 162
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-11 |'#13#10'noborder-all|'#13#10'scale:parent h:100%' +
          ' |'#13#10']]'
        ParentColor = False
        TabOrder = 1
      end
      object rcBlock145: TUniContainerPanel
        Left = 8
        Top = 0
        Width = 44
        Height = 162
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-1 |'#13#10'noborder-all |'#13#10'/*hr:170 mobile-v-4' +
          '8 mobile-h-48 |*'#13#10'hr:parent mobile-v-48 mobile-h-48 |'#13#10'width:50 ' +
          ' |'#13#10']]'
        ParentColor = False
        Color = 5354999
        TabOrder = 2
        object rcBlock147: TUniContainerPanel
          Left = 5
          Top = 19
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'/*noborder-left| */'#13#10'noborder' +
            '-right|'#13#10'center:parent x-mobile-y |'#13#10']]'#13#10#13#10
          ParentColor = False
          TabOrder = 1
          object UUUniBitBtn1: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black |'#13#10'ce' +
              'nter:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '+'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock148: TUniContainerPanel
          Left = 5
          Top = 60
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left:mobile |'#13#10'nobor' +
            'der-right:mobile|'#13#10'center:parent x-mobile-y'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 2
          object UUUniBitBtn2: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '!'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock149: TUniContainerPanel
          Left = 5
          Top = 100
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left:mobile |'#13#10'cente' +
            'r:parent x-mobile-y'#13#10']]'
          ParentColor = False
          TabOrder = 3
          object UUUniBitBtn3: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 0
            Caption = '#'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock146: TUniContainerPanel
          Left = 11
          Top = 7
          Width = 32
          Height = 7
          Hint = 
            '[['#13#10'cols:xs-1 sm-1 md-12 |'#13#10'/*noborder-all |*/'#13#10'noborder-top:des' +
            'ktop|'#13#10'noborder-left:mobile|'#13#10'noborder-right|'#13#10'width:mobile-6|'#13#10 +
            '/*hide:mobile disable*/'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 4
        end
      end
    end
    object rcBlock151: TUniContainerPanel
      Left = 650
      Top = 139
      Width = 321
      Height = 180
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10'/*hr:218 mobile-v-170 mobile-h-170 |*/'#13#10'hr:180 mobile-v-22' +
        '8 mobile-h-228 |'#13#10']]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 2
      object rcBlock157: TUniContainerPanel
        Left = 62
        Top = 0
        Width = 253
        Height = 162
        Hint = 
          '[['#13#10'cols:xs-10 sm-10 md-12 |'#13#10'noborder-all|'#13#10'scale:parent h:100%' +
          ' |'#13#10']]'
        ParentColor = False
        TabOrder = 1
      end
      object rcBlock152: TUniContainerPanel
        Left = 8
        Top = 0
        Width = 44
        Height = 162
        Hint = 
          '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'noborder-all |'#13#10'hr:48 mobile-v-paren' +
          't mobile-h-parent |'#13#10'width:mobile-50  |'#13#10']]'#13#10#13#10#13#10#13#10
        ParentColor = False
        Color = 5354999
        TabOrder = 2
        object rcBlock154: TUniContainerPanel
          Left = 5
          Top = 19
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:36 mobile-36 |'#13#10'/*noborder-left|*/'#13#10'noborder-right|'#13#10'noborde' +
            'r-top:mobile|'#13#10'center:parent y-mobile-x'#13#10']]'#13#10#13#10
          ParentColor = False
          TabOrder = 1
          object UUUniBitBtn1Clone170: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black |'#13#10'ce' +
              'nter:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '+'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock155: TUniContainerPanel
          Left = 5
          Top = 60
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:36 mobile-36 |'#13#10'noborder-top:mobile |'#13#10'/*noborder-left |*/'#13#10 +
            '/*noborder-right |*/'#13#10'center:parent y-mobile-x |'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 2
          object UUUniBitBtn2Clone190: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '!'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock156: TUniContainerPanel
          Left = 5
          Top = 100
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:36 mobile-36 |'#13#10'noborder-top:mobile |'#13#10'noborder-left |'#13#10'cent' +
            'er:parent y-mobile-x |'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 3
          object UUUniBitBtn3Clone210: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 0
            Caption = '#'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock153: TUniContainerPanel
          Left = 8
          Top = 7
          Width = 32
          Height = 7
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'/*noborder-all |*/'#13#10'noborder-left:d' +
            'esktop|'#13#10'noborder-top|'#13#10'noborder-bottom|'#13#10'noborder-right|'#13#10'width' +
            ':6 |'#13#10'/*hide:desktop disable*/'#13#10']]'#13#10#13#10#13#10
          ParentColor = False
          TabOrder = 4
        end
      end
    end
    object rcBlock158: TUniContainerPanel
      Left = 61
      Top = 444
      Width = 489
      Height = 231
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10'/*hr:198 mobile-v-150 mobile-h-150 |*/'#13#10'hr:228 mobile-v-34' +
        '0 mobile-h-228 |/*180 + 48 */'#13#10#13#10']]'
      ParentColor = False
      TabOrder = 3
      object rcBlock164: TUniContainerPanel
        Left = 68
        Top = 26
        Width = 383
        Height = 162
        Hint = 
          '[['#13#10'cols:xs-10 sm-10 md-12 |'#13#10'noborder-all|'#13#10'scale:parent h:100%' +
          ' |'#13#10']]'#13#10
        ParentColor = False
        TabOrder = 1
        object rcBlock165: TUniContainerPanel
          Tag = 1
          Left = 20
          Top = 18
          Width = 167
          Height = 60
          Hint = '[[cols:xs-12 sm-8 md-8]]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            167
            60)
          object UniLabel24: TUniLabel
            Left = 0
            Top = 0
            Width = 114
            Height = 15
            Hint = ''
            Caption = 'STATE( "searchonly" )'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object edLkpUFS: TUniDBEdit
            Left = 0
            Top = 21
            Width = 167
            Height = 38
            Hint = '[['#13#10'DESCRICAO searchonly ! |'#13#10'valid:blank=Status|'#13#10']]'#13#10#13#10
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            Color = clInfoBk
            ReadOnly = True
            InputType = 'text'
            OnEnter = edLkpUFSEnter
          end
        end
        object rcBlock167: TUniContainerPanel
          Tag = 1
          Left = 20
          Top = 88
          Width = 219
          Height = 60
          Hint = '[[cols:xs-12 sm-8 md-8]]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            219
            60)
          object UniLabel25: TUniLabel
            Left = 0
            Top = 0
            Width = 57
            Height = 14
            Hint = ''
            Caption = 'Get Result'
            ParentFont = False
            Font.Height = -12
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object ed_lkp_teste: TUniEdit
            Left = 1
            Top = 21
            Width = 218
            Height = 38
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock166: TUniContainerPanel
          Left = 204
          Top = 18
          Width = 115
          Height = 60
          Hint = '[[cols:xs-12 sm-4 md-4]]'
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            115
            60)
          object UniBitBtn2: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 21
            Width = 57
            Height = 38
            Hint = '[[cls:ButtonGreen ]]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = 'Set PK=6'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
            OnClick = UniBitBtn2Click
          end
          object UniBitBtn3: TUniBitBtn
            AlignWithMargins = True
            Left = 61
            Top = 21
            Width = 53
            Height = 38
            Hint = '[[cls:ButtonGreen ]]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = 'Clear'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
            OnClick = UniBitBtn3Click
          end
        end
        object rcBlock168: TUniContainerPanel
          Left = 245
          Top = 88
          Width = 137
          Height = 60
          Hint = '[[cols:xs-12 sm-4 md-4]]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            137
            60)
          object btnLookUp: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 21
            Width = 137
            Height = 38
            Hint = '[[cls:ButtonGreen ]]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = 'Open LookUp Form'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
            OnClick = btnLookUpClick
          end
        end
      end
      object rcBlock159: TUniContainerPanel
        Left = 8
        Top = 0
        Width = 44
        Height = 162
        Hint = 
          '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'noborder-all |'#13#10'hr:48 mobile-v-paren' +
          't mobile-h-parent |'#13#10'/*hr:48 mobile-v-228 mobile-h-228 |*/'#13#10'/*wi' +
          'dth:max mobile-v-50 mobile-h-50  |'#13#10'*/'#13#10'width:default mobile-v-5' +
          '0 mobile-h-50  |'#13#10']]'#13#10#13#10
        ParentColor = False
        Color = 4737096
        TabOrder = 2
        object rcBlock161: TUniContainerPanel
          Left = 5
          Top = 19
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols-offset:8|'#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 m' +
            'obile-h-36 |'#13#10'width:90 mobile-32 |'#13#10'/*noborder-top:mobile|*/'#13#10'/*' +
            'noborder-left |*/'#13#10'/*noborder-right|*/'#13#10'center:parent y-mobile-x' +
            ' |'#13#10']]'#13#10#13#10
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            30
            30)
          object UUUUniBitBtn1Clone170: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonBlue |'#13#10'ico:fas-plus | '#13#10'append |'#13#10'center:parent x' +
              'y |'#13#10'caption-hide:mobile'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'New'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock162: TUniContainerPanel
          Left = 5
          Top = 60
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols-offset:8|'#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 m' +
            'obile-h-36 |'#13#10'width:90 mobile-32 |'#13#10'noborder-top:mobile |'#13#10'cente' +
            'r:parent y-mobile-x |'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            30
            30)
          object UUUUniBitBtn2Clone190: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonBlue|'#13#10'ico:fas-pencil-alt |'#13#10'append | '#13#10'center:par' +
              'ent xy |'#13#10'caption-hide:mobile'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Edit'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock163: TUniContainerPanel
          Left = 5
          Top = 100
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols-offset:8|'#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 m' +
            'obile-h-36 |'#13#10'width:90 mobile-32 |'#13#10'noborder-top:mobile |'#13#10#13#10'cen' +
            'ter:parent y-mobile-x |'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            30
            30)
          object UUUUniBitBtn3Clone210: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonBlue | '#13#10'ico:fas-trash-alt | '#13#10'append |'#13#10'center:pa' +
              'rent xy |'#13#10'caption-hide:mobile'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 0
            Caption = 'Cancel'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock160: TUniContainerPanel
          Left = 8
          Top = 7
          Width = 32
          Height = 7
          Hint = '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-all |'#13#10'width:12 |'#13#10']]'
          Enabled = False
          Visible = False
          ParentColor = False
          TabOrder = 4
        end
      end
    end
  end
  object rcSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ImageIndex = 0
    Padding = 20
    FocusCancel = True
    Left = 894
    Top = 46
  end
end
