object frmDashboardHOSPITAL_BG: TfrmDashboardHOSPITAL_BG
  Left = 0
  Top = 0
  Width = 854
  Height = 685
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object paBG: TUniPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 685
    Hint = '[['#13#10'cls:trans-obj-4'#13#10']]'
    Visible = False
    AutoScroll = True
    Align = alClient
    TabOrder = 0
    BorderStyle = ubsNone
    Background.Url = 'files\images\default\5.jpg'
    Caption = ''
    ScrollHeight = 685
    ScrollWidth = 854
  end
  object rcBlock5: TUniContainerPanel
    Left = 20
    Top = 57
    Width = 789
    Height = 452
    Hint = 
      '[['#13#10'cols:12 |'#13#10'noborder-all|'#13#10'scale:parent h:100%-top off:0 |'#13#10'/' +
      '*h-auto:mobile-off |*/'#13#10'img:files/images/hospital/1.jpg |'#13#10'img-c' +
      'ls:img-responsive trans-obj-7'#13#10']]'
    ParentColor = False
    TabOrder = 1
    object sboxHospital: TUniScrollBox
      Left = 0
      Top = 0
      Width = 789
      Height = 452
      Hint = '[['#13#10'cls:bringtofront-higher-1 rc-scrollbar-transp'#13#10']]'
      Align = alClient
      TabOrder = 1
      ScrollHeight = 357
      ScrollWidth = 749
      object rcBlock30: TUniContainerPanel
        Tag = 2
        Left = 196
        Top = 20
        Width = 170
        Height = 100
        Hint = 
          '[['#13#10'cols:xs-12 sm-6 md-6  |'#13#10'cls:card-info-box-white rc-hover-zo' +
          'om-1-1|'#13#10'round:no |'#13#10']]'#13#10#13#10
        CreateOrder = 1
        ParentColor = False
        Color = clWhite
        TabOrder = 0
        DesignSize = (
          170
          100)
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 85
          Top = 25
          Width = 75
          Height = 48
          Hint = '[['#13#10'ico:fas-procedures 2x | '#13#10']]'
          Alignment = taRightJustify
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Pacient Ico'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 8887535
          Font.Height = -24
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 3
        end
        object UniLabel3: TUniLabel
          Left = 10
          Top = 76
          Width = 53
          Height = 15
          Hint = ''
          Caption = 'Pacientes'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniLabel4: TUniLabel
          Left = 10
          Top = 6
          Width = 54
          Height = 42
          Hint = ''
          Caption = '544'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -35
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock25: TUniContainerPanel
        Tag = 2
        Left = 12
        Top = 20
        Width = 170
        Height = 100
        Hint = 
          '[['#13#10'cols:xs-12 sm-6 md-6  |'#13#10'cls:card-info-box-white rc-hover-zo' +
          'om-1-1|'#13#10'round:no |'#13#10']]'#13#10#13#10
        ParentColor = False
        Color = clWhite
        TabOrder = 1
        DesignSize = (
          170
          100)
        object UniLabel5: TUniLabel
          AlignWithMargins = True
          Left = 85
          Top = 25
          Width = 75
          Height = 48
          Hint = '[['#13#10'ico:fas-stethoscope 2x | '#13#10']]'
          Alignment = taRightJustify
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Medic Ico'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 12573632
          Font.Height = -24
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 3
        end
        object UniLabel6: TUniLabel
          Left = 10
          Top = 6
          Width = 36
          Height = 42
          Hint = ''
          Caption = '34'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -35
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniLabel7: TUniLabel
          Left = 10
          Top = 76
          Width = 47
          Height = 15
          Hint = ''
          Caption = 'M'#233'dicos'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock35: TUniContainerPanel
        Tag = 2
        Left = 381
        Top = 20
        Width = 170
        Height = 100
        Hint = 
          '[['#13#10'cols:xs-12 sm-6 md-6  |'#13#10'cls:card-info-box-white rc-hover-zo' +
          'om-1-1|'#13#10'round:no |'#13#10']]'#13#10#13#10
        ParentColor = False
        Color = clWhite
        TabOrder = 2
        DesignSize = (
          170
          100)
        object UniLabel8: TUniLabel
          AlignWithMargins = True
          Left = 85
          Top = 25
          Width = 75
          Height = 48
          Hint = '[[ico:fas-clinic-medical 2x | ]]'
          Alignment = taRightJustify
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Enferm Ico'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 6727914
          Font.Height = -24
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 3
        end
        object UniLabel9: TUniLabel
          Left = 10
          Top = 76
          Width = 66
          Height = 15
          Hint = ''
          Caption = 'Enfermeiras'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniLabel10: TUniLabel
          Left = 10
          Top = 6
          Width = 54
          Height = 42
          Hint = ''
          Caption = '132'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -35
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock40: TUniContainerPanel
        Tag = 2
        Left = 567
        Top = 20
        Width = 172
        Height = 100
        Hint = 
          '[['#13#10'cols:xs-12 sm-6 md-6  |'#13#10'cls:card-info-box-white rc-hover-zo' +
          'om-1-1|'#13#10'round:no |'#13#10']]'#13#10#13#10
        ParentColor = False
        Color = clWhite
        TabOrder = 3
        DesignSize = (
          172
          100)
        object UniLabel11: TUniLabel
          AlignWithMargins = True
          Left = 85
          Top = 25
          Width = 75
          Height = 48
          Hint = '[['#13#10'ico:fas-capsules 2x | '#13#10#13#10']]'
          Alignment = taRightJustify
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Farmac Ico'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 15258267
          Font.Height = -24
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 3
        end
        object UniLabel12: TUniLabel
          Left = 10
          Top = 76
          Width = 80
          Height = 15
          Hint = ''
          Caption = 'Farmac'#234'uticos'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniLabel13: TUniLabel
          Left = 10
          Top = 6
          Width = 36
          Height = 42
          Hint = ''
          Caption = '25'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -35
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock50: TUniContainerPanel
        Tag = 2
        AlignWithMargins = True
        Left = 22
        Top = 138
        Width = 727
        Height = 219
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp | ' +
          #13#10'cls:card-info-box-white'#13#10']]'#13#10
        Margins.Left = 15
        Margins.Top = 15
        Margins.Right = 15
        Margins.Bottom = 10
        ParentColor = False
        AutoScroll = True
        TabOrder = 4
        ScrollHeight = 219
        ScrollWidth = 727
        object rcBlock70: TUniContainerPanel
          Tag = 1
          Left = 24
          Top = 64
          Width = 150
          Height = 85
          Hint = '[['#13#10'cols:xs-12 sm-12 md-3 |'#13#10']]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            150
            85)
          object labToday: TUniLabel
            Left = 3
            Top = 24
            Width = 144
            Height = 58
            Hint = '[['#13#10'cls:rc-label-clear rc-font-bold'#13#10']]'#13#10
            Alignment = taCenter
            AutoSize = False
            Caption = 'R$ 43.454,00'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -25
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniLabel14: TUniLabel
            Left = 3
            Top = 2
            Width = 144
            Height = 33
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = 'Hoje'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock80: TUniContainerPanel
          Tag = 1
          Left = 205
          Top = 64
          Width = 150
          Height = 85
          Hint = '[['#13#10'cols:xs-12 sm-12 md-3 |'#13#10']]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            150
            85)
          object UniLabel15: TUniLabel
            Left = 3
            Top = 2
            Width = 144
            Height = 33
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = 'Esta Semana'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object labThisWeek: TUniLabel
            Left = 3
            Top = 24
            Width = 144
            Height = 58
            Hint = '[['#13#10'cls:rc-label-clear rc-font-bold'#13#10']]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'R$ 232.154,00'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -25
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock90: TUniContainerPanel
          Tag = 1
          Left = 377
          Top = 64
          Width = 150
          Height = 85
          Hint = '[['#13#10'cols:xs-12 sm-12 md-3 |'#13#10']]'
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            150
            85)
          object UniLabel16: TUniLabel
            Left = 3
            Top = 2
            Width = 144
            Height = 33
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = 'Neste M'#234's'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object labThisMonth: TUniLabel
            Left = 3
            Top = 24
            Width = 144
            Height = 58
            Hint = '[['#13#10'cls:rc-label-clear rc-font-bold'#13#10']]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'R$ 1.343.632,00'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -25
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock100: TUniContainerPanel
          Tag = 1
          Left = 552
          Top = 64
          Width = 150
          Height = 85
          Hint = '[['#13#10'cols:xs-12 sm-12 md-3 |'#13#10']]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            150
            85)
          object UniLabel17: TUniLabel
            Left = 3
            Top = 2
            Width = 144
            Height = 33
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = 'Neste Ano'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object labThisYear: TUniLabel
            Left = 3
            Top = 24
            Width = 144
            Height = 58
            Hint = '[['#13#10'cls:rc-label-clear rc-font-bold'#13#10']]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'R$ 19.343.864,00'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -25
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock60: TUniContainerPanel
          Left = 18
          Top = 4
          Width = 678
          Height = 46
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'noborder-top|'#13#10'border:b color-silv' +
            'er-light'#13#10']]'
          ParentColor = False
          TabOrder = 5
          DesignSize = (
            678
            46)
          object UniLabel2: TUniLabel
            AlignWithMargins = True
            Left = 0
            Top = 8
            Width = 605
            Height = 27
            Hint = '[['#13#10'cls:rc-label-clear left-center'#13#10']]'#13#10#13#10#13#10
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            AutoSize = False
            Caption = 'Faturamento Geral'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -24
            Font.Name = 'Calibri'
            ParentColor = False
            Color = clBtnFace
            TabOrder = 1
          end
          object labRcCollapse60: TUniLabel
            Left = 661
            Top = 10
            Width = 15
            Height = 25
            Hint = '[['#13#10'collapse:rcBlock50 off-64 icons:fas-plus fas-minus'#13#10']]'#13#10
            TextConversion = txtHTML
            Caption = '^'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Height = -21
            ParentColor = False
            Color = clBlack
            TabOrder = 2
          end
        end
      end
    end
  end
end
