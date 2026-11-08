object frmDEMO_ALT_MENU: TfrmDEMO_ALT_MENU
  Left = 0
  Top = 0
  Width = 902
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
    Width = 902
    Height = 677
    Cursor = crHandPoint
    Hint = ''
    Align = alClient
    Color = 15395562
    TabOrder = 0
    ScrollHeight = 577
    ScrollWidth = 891
    object rcBlock10: TUniContainerPanel
      Left = 12
      Top = 34
      Width = 225
      Height = 543
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-2|'#13#10'hr:parent-top off:default-offset  | ' +
        #13#10'max-height:mobile-80'#13#10']]'
      ParentColor = False
      TabOrder = 0
      object sboxMenuOptions: TUniScrollBox
        Left = 0
        Top = 0
        Width = 225
        Height = 543
        Hint = ''
        Align = alClient
        TabOrder = 1
        ScrollHeight = 327
        ScrollWidth = 167
        object rcBlock11: TUniContainerPanel
          Tag = 1
          Left = 17
          Top = 72
          Width = 150
          Height = 40
          Hint = '[[cols:xs-3 sm-3 md-12]]'
          ParentColor = False
          TabOrder = 0
          object btnHome: TUniBitBtn
            Left = 0
            Top = 0
            Width = 150
            Height = 38
            Hint = 
              '[['#13#10'cls:ButtonOutline ButtonOutlineGreen ButtonRounded btn-font-' +
              'green|'#13#10'ico:fas-house |'#13#10'caption-hide:mobile |'#13#10'append |'#13#10']]'
            Caption = 'HOME'
            Align = alTop
            ParentFont = False
            Font.Color = clBlack
            TabOrder = 1
            OnClick = btnHomeClick
          end
        end
        object rcBlock12: TUniContainerPanel
          Tag = 1
          Left = 17
          Top = 144
          Width = 150
          Height = 40
          Hint = '[[cols:xs-3 sm-3 md-12]]'
          ParentColor = False
          TabOrder = 1
          object btnCalendar: TUniBitBtn
            Left = 0
            Top = 0
            Width = 150
            Height = 38
            Hint = 
              '[['#13#10'cls:ButtonOutline ButtonOutlineGreen ButtonRounded btn-font-' +
              'green|'#13#10'ico:fas-calendar-days |'#13#10'caption-hide:mobile |'#13#10'append |' +
              #13#10']]'
            Caption = 'CALENDAR'
            Align = alTop
            ParentFont = False
            Font.Color = clBlack
            TabOrder = 1
            OnClick = btnCalendarClick
          end
        end
        object rcBlock13: TUniContainerPanel
          Tag = 1
          Left = 11
          Top = 214
          Width = 150
          Height = 40
          Hint = '[[cols:xs-3 sm-3 md-12]]'
          ParentColor = False
          TabOrder = 2
          object brnMessages: TUniBitBtn
            Left = 0
            Top = 0
            Width = 150
            Height = 38
            Hint = 
              '[['#13#10'cls:ButtonOutline ButtonOutlineGreen ButtonRounded btn-font-' +
              'green|'#13#10'ico:fas-message |'#13#10'caption-hide:mobile |'#13#10'append |'#13#10']]'
            Caption = 'MESSAGES'
            Align = alTop
            ParentFont = False
            Font.Color = clBlack
            TabOrder = 1
            OnClick = brnMessagesClick
          end
        end
        object rcBlock14: TUniContainerPanel
          Tag = 1
          Left = 11
          Top = 287
          Width = 150
          Height = 40
          Hint = '[[cols:xs-3 sm-3 md-12]]'
          ParentColor = False
          TabOrder = 3
          object UniBitBtn4: TUniBitBtn
            Left = 0
            Top = 0
            Width = 150
            Height = 38
            Hint = 
              '[['#13#10'cls:ButtonOutline ButtonOutlineGreen ButtonRounded btn-font-' +
              'green'#13#10']]'
            Caption = '...'
            Align = alTop
            ParentFont = False
            Font.Color = clBlack
            TabOrder = 1
          end
        end
      end
    end
    object rcBlock410: TUniContainerPanel
      Left = 288
      Top = 40
      Width = 603
      Height = 525
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-10|'#13#10'noborder-all|'#13#10'hr:parent-top off:de' +
        'fault-offset  | '#13#10']]'
      ParentColor = False
      TabOrder = 1
      object sboxOptions: TUniScrollBox
        Left = 0
        Top = 0
        Width = 603
        Height = 525
        Hint = ''
        Align = alClient
        TabOrder = 1
        ScrollHeight = 387
        ScrollWidth = 574
        object rcBlock430: TUniContainerPanel
          Tag = 2
          Left = 198
          Top = 23
          Width = 170
          Height = 100
          Hint = 
            '[['#13#10'cols:xs-12 sm-6 md-2 lg-2 |'#13#10'cls:card-info-box-white rc-shad' +
            'ow-hover |'#13#10'round:no | '#13#10']]'#13#10
          CreateOrder = 1
          ParentColor = False
          Color = clWhite
          TabOrder = 0
          DesignSize = (
            170
            100)
          object labIcoNewCustomers170: TUniLabel
            AlignWithMargins = True
            Left = 85
            Top = 25
            Width = 75
            Height = 48
            Hint = '[[ico:fas-users 2x ]]'
            Alignment = taRightJustify
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'USer'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = 15258267
            Font.Height = -24
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 2
          end
          object lab_IBArquivoFuncCadastro: TUniLabel
            Tag = 2
            Left = 9
            Top = 79
            Width = 37
            Height = 15
            Hint = ''
            Caption = 'Option'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniLabel5: TUniLabel
            Left = 10
            Top = 9
            Width = 15
            Height = 19
            Hint = ''
            Caption = 'F2'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 3
          end
          object pa_2: TUniContainerPanel
            Tag = 2
            Left = 128
            Top = 64
            Width = 166
            Height = 96
            Hint = '[[center:parent xy]]'
            ParentColor = False
            TabOrder = 4
          end
        end
        object rcBlock460: TUniContainerPanel
          Tag = 2
          Left = 198
          Top = 159
          Width = 170
          Height = 100
          Hint = 
            '[['#13#10'cols:xs-12 sm-6 md-2 lg-2 |'#13#10'cls:card-info-box-white rc-shad' +
            'ow-hover |'#13#10'round:no | '#13#10']]'#13#10
          CreateOrder = 1
          ParentColor = False
          Color = clWhite
          TabOrder = 1
          DesignSize = (
            170
            100)
          object UniLabel1: TUniLabel
            AlignWithMargins = True
            Left = 85
            Top = 23
            Width = 75
            Height = 48
            Hint = '[[ico:fas-file-invoice-dollar 2x ]]'
            Alignment = taRightJustify
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'USer'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = 12573632
            Font.Height = -24
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 2
          end
          object lab_IBPcmsoFinanceiroFatura: TUniLabel
            Tag = 1
            Left = 10
            Top = 76
            Width = 37
            Height = 15
            Hint = ''
            Caption = 'Option'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniLabel6: TUniLabel
            Left = 10
            Top = 9
            Width = 15
            Height = 19
            Hint = ''
            Caption = 'F6'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 3
          end
          object pa_5: TUniContainerPanel
            Tag = 1
            Left = 128
            Top = 64
            Width = 166
            Height = 96
            Hint = '[[center:parent xy]]'
            ParentColor = False
            TabOrder = 4
          end
        end
        object rcBlock490: TUniContainerPanel
          Tag = 2
          Left = 202
          Top = 287
          Width = 170
          Height = 100
          Hint = 
            '[['#13#10'cols:xs-12 sm-6 md-2 lg-2 |'#13#10'cls:card-info-box-white rc-shad' +
            'ow-hover |'#13#10'round:no | '#13#10']]'#13#10
          CreateOrder = 1
          ParentColor = False
          Color = clWhite
          TabOrder = 2
          DesignSize = (
            170
            100)
          object UniLabel2: TUniLabel
            AlignWithMargins = True
            Left = 85
            Top = 25
            Width = 75
            Height = 48
            Hint = '[[ico:fas-user 2x ]]'
            Alignment = taRightJustify
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'USer'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = 15258267
            Font.Height = -24
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 2
          end
          object lab_IBAberturaLogonCadastro: TUniLabel
            Tag = 1
            Left = 10
            Top = 78
            Width = 37
            Height = 15
            Hint = ''
            Caption = 'Option'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniLabel4: TUniLabel
            Left = 10
            Top = 9
            Width = 23
            Height = 19
            Hint = ''
            Caption = 'F10'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 3
          end
          object pa_8: TUniContainerPanel
            Tag = 1
            Left = 128
            Top = 64
            Width = 166
            Height = 96
            Hint = '[[center:parent xy]]'
            ParentColor = False
            TabOrder = 4
          end
        end
        object rcBlock420: TUniContainerPanel
          Tag = 2
          Left = 14
          Top = 23
          Width = 170
          Height = 100
          Hint = 
            '[['#13#10'cols:xs-12 sm-6 md-2 lg-2 |'#13#10'cls:card-info-box-white rc-shad' +
            'ow-hover |'#13#10'round:no | '#13#10']]'#13#10
          ParentColor = False
          Color = clWhite
          TabOrder = 3
          DesignSize = (
            170
            100)
          object labIcoSales160: TUniLabel
            AlignWithMargins = True
            Left = 85
            Top = 25
            Width = 75
            Height = 48
            Hint = '[['#13#10'ico:fas-calendar-alt 2x '#13#10']]'
            Alignment = taRightJustify
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Building'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = 12573632
            Font.Height = -24
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 2
          end
          object lab_IBAberturaEmpresaTrabalha: TUniLabel
            Tag = 2
            Left = 10
            Top = 76
            Width = 50
            Height = 15
            Hint = '[['#13#10'cls:rc-label-blink-fade'#13#10']]'
            Caption = 'Calendar'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object pa_1: TUniContainerPanel
            Tag = 2
            Left = 114
            Top = 59
            Width = 166
            Height = 96
            Hint = '[[center:parent xy]]'
            ParentColor = False
            TabOrder = 3
            OnClick = pa_1Click
          end
        end
        object rcBlock440: TUniContainerPanel
          Tag = 2
          Left = 383
          Top = 23
          Width = 170
          Height = 100
          Hint = 
            '[['#13#10'cols:xs-12 sm-6 md-2 lg-2 |'#13#10'cls:card-info-box-white rc-shad' +
            'ow-hover |'#13#10'round:no | '#13#10']]'#13#10
          ParentColor = False
          Color = clWhite
          TabOrder = 4
          DesignSize = (
            170
            100)
          object labIcoInService180: TUniLabel
            AlignWithMargins = True
            Left = 85
            Top = 25
            Width = 75
            Height = 48
            Hint = '[[ico:fas-address-card 2x ]]'
            Alignment = taRightJustify
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Wrench'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = 6727914
            Font.Height = -24
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentColor = False
            Color = 3640803
            TabOrder = 2
          end
          object lab_IBPcmsoConvocacaoCadastro: TUniLabel
            Tag = 1
            Left = 10
            Top = 76
            Width = 37
            Height = 15
            Hint = ''
            Caption = 'Option'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniLabel7: TUniLabel
            Left = 10
            Top = 9
            Width = 15
            Height = 19
            Hint = ''
            Caption = 'F3'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 3
          end
          object pa_3: TUniContainerPanel
            Tag = 1
            Left = 128
            Top = 64
            Width = 166
            Height = 96
            Hint = '[[center:parent xy]]'
            ParentColor = False
            TabOrder = 4
          end
        end
        object rcBlock450: TUniContainerPanel
          Tag = 2
          Left = 14
          Top = 159
          Width = 170
          Height = 100
          Hint = 
            '[['#13#10'cols:xs-12 sm-6 md-2 lg-2 |'#13#10'cls:card-info-box-white rc-shad' +
            'ow-hover |'#13#10'round:no | '#13#10']]'#13#10
          ParentColor = False
          Color = clWhite
          TabOrder = 5
          DesignSize = (
            170
            100)
          object UniLabel3: TUniLabel
            AlignWithMargins = True
            Left = 85
            Top = 25
            Width = 75
            Height = 48
            Hint = '[['#13#10'ico:fas-tools 2x '#13#10']]'
            Alignment = taRightJustify
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Shop'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = 12573632
            Font.Height = -24
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 2
          end
          object lab_IBPcmsoConfiguracaoFuncaoRisco: TUniLabel
            Tag = 1
            Left = 10
            Top = 76
            Width = 37
            Height = 15
            Hint = '[['#13#10'cls:rc-label-blink'#13#10']]'
            Caption = 'Option'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniLabel8: TUniLabel
            Left = 10
            Top = 9
            Width = 15
            Height = 19
            Hint = ''
            Caption = 'F5'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 3
          end
          object pa_4: TUniContainerPanel
            Tag = 1
            Left = 128
            Top = 64
            Width = 166
            Height = 96
            Hint = '[[center:parent xy]]'
            ParentColor = False
            TabOrder = 4
          end
        end
        object rcBlock470: TUniContainerPanel
          Tag = 2
          Left = 383
          Top = 159
          Width = 170
          Height = 100
          Hint = 
            '[['#13#10'cols:xs-12 sm-6 md-2 lg-2 |'#13#10'cls:card-info-box-white rc-shad' +
            'ow-hover |'#13#10'round:no | '#13#10']]'#13#10
          ParentColor = False
          Color = clWhite
          TabOrder = 6
          DesignSize = (
            170
            100)
          object labIcoEsocial: TUniLabel
            AlignWithMargins = True
            Left = 85
            Top = 25
            Width = 75
            Height = 48
            Hint = '[[ico:fas-address-card 2x ]]'
            Alignment = taRightJustify
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Wrench'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = 6727914
            Font.Height = -24
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentColor = False
            Color = 3640803
            TabOrder = 2
          end
          object lab_IBPcmsoArquivoESocial2220LotePrevia: TUniLabel
            Tag = 1
            Left = 12
            Top = 76
            Width = 37
            Height = 15
            Hint = ''
            Caption = 'Option'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object pa_6: TUniContainerPanel
            Tag = 1
            Left = 128
            Top = 64
            Width = 166
            Height = 96
            Hint = '[[center:parent xy]]'
            ParentColor = False
            TabOrder = 3
          end
        end
        object rcBlock480: TUniContainerPanel
          Tag = 2
          Left = 18
          Top = 287
          Width = 170
          Height = 100
          Hint = 
            '[['#13#10'cols:xs-12 sm-6 md-2 lg-2 |'#13#10'cls:card-info-box-white rc-shad' +
            'ow-hover |'#13#10'round:no | '#13#10']]'#13#10
          ParentColor = False
          Color = clWhite
          TabOrder = 7
          DesignSize = (
            170
            100)
          object UniLabel9: TUniLabel
            AlignWithMargins = True
            Left = 85
            Top = 25
            Width = 75
            Height = 48
            Hint = '[['#13#10'ico:fas-chart-line 2x '#13#10']]'
            Alignment = taRightJustify
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Shop'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = 12573632
            Font.Height = -24
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 2
          end
          object lab_IBPcmsoEpidemiologicoPorExame: TUniLabel
            Tag = 1
            Left = 10
            Top = 60
            Width = 37
            Height = 15
            Hint = '[[translate:]]'
            Caption = 'Option'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniLabel10: TUniLabel
            Tag = 1
            Left = 10
            Top = 78
            Width = 24
            Height = 15
            Hint = ''
            Caption = 'Item'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 3
          end
          object pa_7: TUniContainerPanel
            Tag = 1
            Left = 128
            Top = 64
            Width = 166
            Height = 96
            Hint = '[[center:parent xy]]'
            ParentColor = False
            TabOrder = 4
          end
        end
        object rcBlock500: TUniContainerPanel
          Tag = 2
          Left = 404
          Top = 287
          Width = 170
          Height = 100
          Hint = 
            '[['#13#10'cols:xs-12 sm-6 md-2 lg-2 |'#13#10'cls:card-info-box-white rc-shad' +
            'ow-hover |'#13#10'round:no | '#13#10']]'#13#10
          ParentColor = False
          Color = clWhite
          TabOrder = 8
          DesignSize = (
            170
            100)
          object UniLabel11: TUniLabel
            AlignWithMargins = True
            Left = 85
            Top = 25
            Width = 75
            Height = 48
            Hint = '[[ico:fas-question 2x ]]'
            Alignment = taRightJustify
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Wrench'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = 6727914
            Font.Height = -24
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentColor = False
            Color = 3640803
            TabOrder = 2
          end
          object labHelp: TUniLabel
            Tag = 1
            Left = 12
            Top = 76
            Width = 37
            Height = 15
            Hint = ''
            Caption = 'Option'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object pa_9: TUniContainerPanel
            Tag = 1
            Left = 128
            Top = 64
            Width = 166
            Height = 96
            Hint = '[[center:parent xy]]'
            ParentColor = False
            TabOrder = 3
          end
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
