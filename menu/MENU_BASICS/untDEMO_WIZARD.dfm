inherited frmDEMO_WIZARD: TfrmDEMO_WIZARD
  Hint = '[['#13#10'modal:|'#13#10']]'#13#10
  ClientHeight = 643
  ClientWidth = 1042
  Caption = 'frmDEMO_WIZARD'
  ExplicitWidth = 1042
  ExplicitHeight = 643
  TextHeight = 15
  object sboxGridBlock: TUniScrollBox [0]
    Left = 0
    Top = 0
    Width = 1042
    Height = 643
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollHeight = 484
    ScrollWidth = 915
    object rcBlock5: TUniContainerPanel
      Left = 50
      Top = 24
      Width = 865
      Height = 460
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'scale:parent h:100%-top off:default' +
        '-offset |'#13#10'/*max-width:900 mobile-v-500 mobile-h-900|*/'#13#10'max-wid' +
        'th:900|'#13#10'center:parent x|'#13#10'round:all'#13#10']]'#13#10#13#10#13#10
      ParentColor = False
      TabOrder = 0
      object UniScrollBox1: TUniScrollBox
        Left = 0
        Top = 0
        Width = 865
        Height = 460
        Hint = ''
        Align = alClient
        Color = clBtnFace
        TabOrder = 1
        ExplicitHeight = 467
        ScrollHeight = 443
        ScrollWidth = 841
        object rcBlock50: TUniContainerPanel
          Left = 32
          Top = 118
          Width = 805
          Height = 250
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-12 lg-12 xl-12 4k-12 8k-12 |'#13#10'/*scale:pa' +
            'rent h:100%-top off:default-offset |*/'#13#10'hr:parent-top off:80 off' +
            '-mobile-v-80 off-mobile-h-80 | '#13#10'min-height:250|'#13#10'round:no | '#13#10'c' +
            'ls:card-info-box-white |'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 0
          DesignSize = (
            805
            250)
          object pgWizard: TUniPageControl
            Left = 6
            Top = 0
            Width = 785
            Height = 245
            Hint = '[['#13#10'anchor:'#13#10']]'
            ActivePage = tabWizardStep0
            TabBarVisible = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            object tabWizardStep0: TUniTabSheet
              Hint = ''
              Caption = 'tabWizardStep0'
              object sboxWizardStep0: TUniScrollBox
                Left = 0
                Top = 0
                Width = 777
                Height = 217
                Hint = ''
                Align = alClient
                TabOrder = 0
                ScrollHeight = 70
                ScrollWidth = 121
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = 10
                  Top = 10
                  Width = 111
                  Height = 60
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    111
                    60)
                  object rcLabel60: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 36
                    Height = 15
                    Hint = ''
                    Caption = 'Label1'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object rcEdit60: TUniEdit
                    Left = 0
                    Top = 21
                    Width = 110
                    Height = 38
                    Hint = '[['#13#10'valid:blank=Edit 1'#13#10']]'
                    CharCase = ecUpperCase
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
              end
            end
            object tabWizardStep1: TUniTabSheet
              Hint = ''
              Caption = 'tabWizardStep1'
              object sboxWizardStep1: TUniScrollBox
                Left = 0
                Top = 0
                Width = 777
                Height = 217
                Hint = ''
                Align = alClient
                TabOrder = 0
                ScrollHeight = 76
                ScrollWidth = 133
                object rcBlock70: TUniContainerPanel
                  Tag = 1
                  Left = 22
                  Top = 16
                  Width = 111
                  Height = 60
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    111
                    60)
                  object rcLabel70: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 36
                    Height = 15
                    Hint = ''
                    Caption = 'Label2'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object rcEdit70: TUniEdit
                    Left = 0
                    Top = 21
                    Width = 110
                    Height = 38
                    Hint = '[['#13#10'valid:blank=Edit 2'#13#10']]'
                    CharCase = ecUpperCase
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
              end
            end
            object tabWizardStep2: TUniTabSheet
              Hint = ''
              Caption = 'tabWizardStep2'
              object sboxWizardStep2: TUniScrollBox
                Left = 0
                Top = 0
                Width = 777
                Height = 217
                Hint = ''
                Align = alClient
                TabOrder = 0
                ScrollHeight = 79
                ScrollWidth = 139
                object rcBlock80: TUniContainerPanel
                  Tag = 1
                  Left = 28
                  Top = 19
                  Width = 111
                  Height = 60
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    111
                    60)
                  object rcLabel80: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 36
                    Height = 15
                    Hint = ''
                    Caption = 'Label3'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object rcEdit80: TUniEdit
                    Left = 0
                    Top = 21
                    Width = 110
                    Height = 38
                    Hint = '[['#13#10'valid:blank=Edit 3'#13#10']]'
                    CharCase = ecUpperCase
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
              end
            end
            object tabWizardStep3: TUniTabSheet
              Hint = ''
              Caption = 'tabWizardStep3'
              object sboxWizardStep3: TUniScrollBox
                Left = 0
                Top = 0
                Width = 777
                Height = 217
                Hint = ''
                Align = alClient
                TabOrder = 0
                ScrollHeight = 91
                ScrollWidth = 138
                object rcBlock90: TUniContainerPanel
                  Tag = 1
                  Left = 27
                  Top = 31
                  Width = 111
                  Height = 60
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    111
                    60)
                  object rcLabel90: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 36
                    Height = 15
                    Hint = ''
                    Caption = 'Label4'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object rcEdit90: TUniEdit
                    Left = 0
                    Top = 21
                    Width = 110
                    Height = 38
                    Hint = '[['#13#10'valid:blank=Edit 4'#13#10']]'
                    CharCase = ecUpperCase
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
              end
            end
          end
        end
        object rcBlock100: TUniContainerPanel
          Left = 38
          Top = 385
          Width = 803
          Height = 58
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'max-width:900|'#13#10'center:parent x|'#13#10']' +
            ']'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            803
            58)
          object btnWizardPrevious: TUniBitBtn
            AlignWithMargins = True
            Left = 629
            Top = 2
            Width = 80
            Height = 36
            Hint = 
              '[['#13#10'cls:ButtonOutline ButtonOutlineThemeCrud ButtonRoundest btn-' +
              'font-themecrud| '#13#10']]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = 'Previous'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Calibri'
            TabOrder = 1
            OnClick = btnWizardPreviousClick
          end
          object btnWizardNext: TUniBitBtn
            AlignWithMargins = True
            Left = 721
            Top = 2
            Width = 80
            Height = 36
            Hint = 
              '[['#13#10'cls:ButtonOutline ButtonOutlineThemeCrud ButtonRoundest btn-' +
              'font-themecrud| '#13#10']]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = 'Next'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Calibri'
            TabOrder = 2
            OnClick = btnWizardNextClick
          end
          object UniBitBtn1: TUniBitBtn
            AlignWithMargins = True
            Left = 1
            Top = 2
            Width = 80
            Height = 36
            Hint = 
              '[['#13#10'cls:ButtonOutline ButtonOutlineRed ButtonRoundest btn-font-t' +
              'hemecrud| '#13#10']]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = 'Close'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Calibri'
            TabOrder = 3
            OnClick = UniBitBtn1Click
          end
        end
        object rcBlock10: TUniContainerPanel
          Tag = 1
          Left = 32
          Top = 14
          Width = 150
          Height = 98
          Hint = 
            '[['#13#10'cols:xs-3 sm-3 md-3|'#13#10'noborder-bottom|'#13#10'min-width:default mo' +
            'bile-74|'#13#10'max-width:default mobile-69'#13#10']]'#13#10#13#10
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            150
            98)
          object paWizardStepTrack0: TUniContainerPanel
            Left = 74
            Top = 28
            Width = 77
            Height = 4
            Hint = '[['#13#10'hide:mobile|'#13#10'cls:rc-wizard-track'#13#10']]'
            ParentColor = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object paWizardStep0: TUniContainerPanel
            Left = 38
            Top = 2
            Width = 60
            Height = 60
            Hint = 
              '[['#13#10'pos-t:0|'#13#10'center:parent x|'#13#10'cls:rc-wizard rc-wizard-active|'#13 +
              #10'border:all'#13#10']]'#13#10#13#10
            ParentColor = False
            TabOrder = 1
            object labWizardIcon0: TUniLabel
              Left = 10
              Top = 3
              Width = 32
              Height = 33
              Hint = 
                '[['#13#10'ico:fas-user-lock|'#13#10'cls-ico:font-white|'#13#10'center:parent xy'#13#10']' +
                ']'
              Alignment = taCenter
              AutoSize = False
              Caption = 'labWizardIcon0'
              ParentFont = False
              Font.Height = -24
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object UniLabel1: TUniLabel
            Left = 0
            Top = 63
            Width = 149
            Height = 23
            Hint = '[[hide:mobile]]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'labStep0'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock20: TUniContainerPanel
          Tag = 1
          Left = 225
          Top = 14
          Width = 150
          Height = 98
          Hint = 
            '[['#13#10'cols:xs-3 sm-3 md-3|'#13#10'noborder-bottom|'#13#10'noborder-left|'#13#10'nobo' +
            'rder-right|'#13#10'max-width:default mobile-69'#13#10'|]]'#13#10
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            150
            98)
          object paWizardStepTrack1_right: TUniContainerPanel
            Left = 81
            Top = 28
            Width = 69
            Height = 4
            Hint = '[['#13#10'hide:mobile|'#13#10'cls:rc-wizard-track'#13#10']]'
            ParentColor = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object paWizardStepTrack1_left: TUniContainerPanel
            Left = 0
            Top = 28
            Width = 58
            Height = 4
            Hint = '[['#13#10'hide:mobile|'#13#10'cls:rc-wizard-track'#13#10']]'
            ParentColor = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object paWizardStep1: TUniContainerPanel
            Left = 40
            Top = 4
            Width = 60
            Height = 60
            Hint = '[['#13#10'pos-t:0|'#13#10'center:parent x|'#13#10'cls:rc-wizard |'#13#10']]'
            ParentColor = False
            TabOrder = 1
            object labWizardIcon1: TUniLabel
              Left = 10
              Top = 3
              Width = 32
              Height = 33
              Hint = '[['#13#10'ico:fas-user|'#13#10'cls-ico:font-white|'#13#10'center:parent xy'#13#10']]'
              Alignment = taCenter
              AutoSize = False
              Caption = 'UniLabel1'
              ParentFont = False
              Font.Height = -24
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object UniLabel2: TUniLabel
            Left = 1
            Top = 65
            Width = 149
            Height = 23
            Hint = '[[hide:mobile]]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'labStep1'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock30: TUniContainerPanel
          Tag = 1
          Left = 411
          Top = 14
          Width = 150
          Height = 98
          Hint = 
            '[['#13#10'cols:xs-3 sm-3 md-3|'#13#10'noborder-bottom|'#13#10'noborder-left|'#13#10'nobo' +
            'rder-right|'#13#10'max-width:default mobile-69'#13#10']]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            150
            98)
          object paWizardStepTrack2_left: TUniContainerPanel
            Left = 0
            Top = 28
            Width = 87
            Height = 4
            Hint = '[['#13#10'hide:mobile|'#13#10'cls:rc-wizard-track'#13#10']]'
            ParentColor = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object paWizardStepTrack2_right: TUniContainerPanel
            Left = 98
            Top = 28
            Width = 52
            Height = 4
            Hint = '[['#13#10'hide:mobile|'#13#10'cls:rc-wizard-track'#13#10']]'
            ParentColor = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object paWizardStep2: TUniContainerPanel
            Left = 42
            Top = 3
            Width = 60
            Height = 60
            Hint = '[['#13#10'pos-t:0|'#13#10'center:parent x|'#13#10'cls:rc-wizard |'#13#10']]'
            ParentColor = False
            TabOrder = 1
            object labWizardIcon2: TUniLabel
              Left = 10
              Top = 3
              Width = 32
              Height = 33
              Hint = 
                '[['#13#10'ico:fas-credit-card|'#13#10'cls-ico:font-white|'#13#10'center:parent xy'#13 +
                #10']]'
              Alignment = taCenter
              AutoSize = False
              Caption = 'UniLabel1'
              ParentFont = False
              Font.Height = -24
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object UniLabel3: TUniLabel
            Left = 1
            Top = 67
            Width = 149
            Height = 23
            Hint = '[[hide:mobile]]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'labStep2'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock40: TUniContainerPanel
          Tag = 1
          Left = 587
          Top = 14
          Width = 150
          Height = 98
          Hint = 
            '[['#13#10'cols:xs-3 sm-3 md-3|'#13#10'noborder-bottom|'#13#10'noborder-left|'#13#10'max-' +
            'width:default mobile-69'#13#10']]'
          ParentColor = False
          TabOrder = 5
          DesignSize = (
            150
            98)
          object paWizardStepTrack3: TUniContainerPanel
            Left = 0
            Top = 28
            Width = 58
            Height = 4
            Hint = '[['#13#10'hide:mobile|'#13#10'cls:rc-wizard-track'#13#10']]'
            ParentColor = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object paWizardStep3: TUniContainerPanel
            Left = 44
            Top = 3
            Width = 60
            Height = 60
            Hint = '[['#13#10'pos-t:0|'#13#10'center:parent x|'#13#10'cls:rc-wizard |'#13#10']]'
            ParentColor = False
            TabOrder = 1
            object labWizardIcon3: TUniLabel
              Left = 10
              Top = 3
              Width = 32
              Height = 33
              Hint = 
                '[['#13#10'ico:fas-check-circle|'#13#10'cls-ico:font-white|'#13#10'center:parent xy' +
                #13#10']]'
              Alignment = taCenter
              AutoSize = False
              Caption = 'UniLabel1'
              ParentFont = False
              Font.Height = -24
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object UniLabel4: TUniLabel
            Left = 1
            Top = 69
            Width = 149
            Height = 23
            Hint = '[[hide:mobile]]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'labStep3'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
      end
    end
  end
end
