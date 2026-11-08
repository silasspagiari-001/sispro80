object frmDEMO_FORM_LAYOUT_5: TfrmDEMO_FORM_LAYOUT_5
  Left = 0
  Top = 0
  Width = 1047
  Height = 610
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object sboxSale: TUniScrollBox
    Left = 0
    Top = 0
    Width = 1047
    Height = 610
    Hint = ''
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 930
    ExplicitHeight = 527
    ScrollHeight = 209
    ScrollWidth = 984
    object rcBlock132: TUniContainerPanel
      Left = 10
      Top = 29
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
      Left = 329
      Top = 27
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
      Left = 663
      Top = 29
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
  end
end
