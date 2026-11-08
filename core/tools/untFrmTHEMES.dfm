object frmThemes: TfrmThemes
  Left = 0
  Top = 0
  Hint = '[['#13#10'frm-align:right |'#13#10'height:max |'#13#10'width:fix'#13#10']]'#13#10#13#10#13#10
  ClientHeight = 1840
  ClientWidth = 350
  Caption = 'Themes'
  OnShow = UniFormShow
  BorderStyle = bsNone
  Position = poDefaultPosOnly
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  DesignSize = (
    350
    1840)
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel16: TUniContainerPanel
    Left = 0
    Top = 41
    Width = 350
    Height = 1932
    Hint = ''
    ParentColor = False
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    object pgConfig: TUniPageControl
      Left = 0
      Top = 40
      Width = 350
      Height = 1892
      Hint = ''
      ActivePage = tabLayout
      Align = alClient
      TabOrder = 1
      object tabColors: TUniTabSheet
        Hint = ''
        Caption = 'Colors'
        object UniContainerPanel5: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 342
          Height = 183
          Hint = ''
          ParentColor = False
          Align = alTop
          TabOrder = 1
          object UniContainerPanel1: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 15
            Top = 10
            Width = 312
            Height = 172
            Hint = '[[round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            Color = 15395562
            TabOrder = 1
            object UniContainerPanel3: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 312
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel58: TUniLabel
                Left = 6
                Top = 12
                Width = 84
                Height = 15
                Hint = '[[bsh6: |center:parent y ]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Default Themes'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object pa012DefaultPattern: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 52
              Width = 283
              Height = 110
              Hint = ''
              Margins.Top = 4
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 2
              object UniLabel56: TUniLabel
                Left = 7
                Top = 61
                Width = 116
                Height = 16
                Hint = ''
                Margins.Left = 10
                Margins.Bottom = 0
                AutoSize = False
                Caption = 'LIGHT THEMES'
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object btnBlue: TUniContainerPanel
                AlignWithMargins = True
                Left = 8
                Top = 7
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = 7537159
                TabOrder = 2
                OnClick = btnBlueClick
              end
              object btnGray: TUniContainerPanel
                AlignWithMargins = True
                Left = 53
                Top = 7
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clGray
                TabOrder = 3
                OnClick = btnBlueClick
              end
              object btnRed: TUniContainerPanel
                AlignWithMargins = True
                Left = 98
                Top = 7
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = 140
                TabOrder = 4
                OnClick = btnBlueClick
              end
              object btnOrange: TUniContainerPanel
                AlignWithMargins = True
                Left = 143
                Top = 7
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = 1410280
                TabOrder = 5
                OnClick = btnBlueClick
              end
              object btnGreen: TUniContainerPanel
                AlignWithMargins = True
                Left = 188
                Top = 7
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = 16384
                TabOrder = 6
                OnClick = btnBlueClick
              end
              object btnIndigo: TUniContainerPanel
                AlignWithMargins = True
                Left = 233
                Top = 7
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = 16711808
                TabOrder = 7
                OnClick = btnBlueClick
              end
              object btnLight: TUniContainerPanel
                AlignWithMargins = True
                Left = 233
                Top = 30
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = 16315902
                TabOrder = 8
                OnClick = btnBlueClick
              end
              object btnDark: TUniContainerPanel
                AlignWithMargins = True
                Left = 188
                Top = 30
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = 2302755
                TabOrder = 9
                OnClick = btnBlueClick
              end
              object btnPurple: TUniContainerPanel
                AlignWithMargins = True
                Left = 143
                Top = 30
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = 5182271
                TabOrder = 10
                OnClick = btnBlueClick
              end
              object btnChocolate: TUniContainerPanel
                AlignWithMargins = True
                Left = 98
                Top = 30
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = 16512
                TabOrder = 11
                OnClick = btnBlueClick
              end
              object btnDarkGray: TUniContainerPanel
                AlignWithMargins = True
                Left = 53
                Top = 30
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = 4737096
                TabOrder = 12
                OnClick = btnBlueClick
              end
              object btnBlueLight: TUniContainerPanel
                AlignWithMargins = True
                Left = 8
                Top = 30
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = 16744448
                TabOrder = 13
                OnClick = btnBlueClick
              end
              object btnLightBlue: TUniContainerPanel
                AlignWithMargins = True
                Left = 8
                Top = 83
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all color-blue]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clWhite
                TabOrder = 14
                OnClick = btnBlueClick
              end
              object btnLightRed: TUniContainerPanel
                AlignWithMargins = True
                Left = 53
                Top = 83
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all color-red]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clWhite
                TabOrder = 15
                OnClick = btnBlueClick
              end
              object btnLightGreen: TUniContainerPanel
                AlignWithMargins = True
                Left = 98
                Top = 83
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all color-green]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clWhite
                TabOrder = 16
                OnClick = btnBlueClick
              end
              object btnLightOrange: TUniContainerPanel
                AlignWithMargins = True
                Left = 143
                Top = 83
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all color-orange]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clWhite
                TabOrder = 17
                OnClick = btnBlueClick
              end
              object btnLightPurple: TUniContainerPanel
                AlignWithMargins = True
                Left = 188
                Top = 83
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all color-purple]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clWhite
                TabOrder = 18
                OnClick = btnBlueClick
              end
              object btnLightIndigo: TUniContainerPanel
                AlignWithMargins = True
                Left = 233
                Top = 83
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all color-indigo]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clWhite
                TabOrder = 19
                OnClick = btnBlueClick
              end
              object btnSalmon: TUniContainerPanel
                AlignWithMargins = True
                Left = 233
                Top = 54
                Width = 42
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                Visible = False
                ParentColor = False
                Color = 6579421
                TabOrder = 20
                OnClick = btnBlueClick
              end
            end
          end
        end
        object sBoxColors: TUniScrollBox
          Left = 0
          Top = 183
          Width = 342
          Height = 1681
          Hint = ''
          Align = alClient
          TabOrder = 0
          OnScrollChange = sBoxColorsScrollChange
          ScrollHeight = 1392
          ScrollWidth = 327
          object paColors: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 15
            Top = 11
            Width = 312
            Height = 986
            Hint = '[[round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            TabOrder = 0
            object UniContainerPanel6: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 312
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel3: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 12
                Width = 36
                Height = 15
                Hint = '[[bsh6: |cls:left-center rc-card-title]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Colors'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object pa001Login: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 53
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 10
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 2
              object labOptLOGIN: TUniLabel
                Left = 10
                Top = 11
                Width = 116
                Height = 16
                Hint = ''
                Margins.Left = 10
                Margins.Bottom = 0
                AutoSize = False
                Caption = 'LOGIN'
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderLogin: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_Login: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object pa002Buttons: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 121
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 3
              object labOptBUTTONS: TUniLabel
                Left = 10
                Top = 11
                Width = 116
                Height = 16
                Hint = ''
                Margins.Left = 10
                Margins.Bottom = 0
                AutoSize = False
                Caption = 'BUTTONS'
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderButton_Color: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_Button_Color: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
              object btnSelColor_Button_Color_Hover: TUniPanel
                AlignWithMargins = True
                Left = 206
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                Align = alRight
                ParentFont = False
                Font.Color = clSilver
                Font.Height = -9
                TabOrder = 4
                BorderStyle = ubsNone
                Caption = 'hover'
                Color = clBlack
                OnClick = btnSelColor_LoginClick
              end
            end
            object pa003Cruds: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 155
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 4
              object labOptBUTTONS_CRUD: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 145
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Cruds'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderButton_Color_Crud: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_Button_Color_Crud: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
              object btnSelColor_Button_Color_Crud_Hover: TUniPanel
                AlignWithMargins = True
                Left = 206
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                Align = alRight
                ParentFont = False
                Font.Color = clSilver
                Font.Height = -9
                TabOrder = 4
                BorderStyle = ubsNone
                Caption = 'hover'
                Color = clBlack
                OnClick = btnSelColor_LoginClick
              end
            end
            object pa004MainMenu: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 189
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 5
              object labOptMENU: TUniLabel
                Left = 10
                Top = 11
                Width = 116
                Height = 16
                Hint = ''
                Margins.Left = 10
                AutoSize = False
                Caption = 'MENU'
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderMenu: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_Menu: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object pa005MainMenuFont: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 223
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 6
              object labOptMENUFONT: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Font'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderMenuFont: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_MenuFont: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object pa007LookUp: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 359
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 7
              object labOptLOOKUP: TUniLabel
                Left = 10
                Top = 11
                Width = 116
                Height = 16
                Hint = ''
                Margins.Left = 10
                AutoSize = False
                Caption = 'LOOKUP'
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderLookup: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_LookUp: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object pa008LookUpFont: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 393
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 8
              object labOptLOOKUPFONT: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Font'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderLookupEditFont: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_LookUpEditFont: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object pa009BgColor: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 869
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 9
              object labOptBG_COLOR: TUniLabel
                Left = 10
                Top = 11
                Width = 116
                Height = 29
                Hint = ''
                Margins.Left = 10
                AutoSize = False
                Caption = 'BACKGROUND'
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderBg: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_Bg: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object pa010Edits: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 427
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 10
              object labOptEDITFOCO: TUniLabel
                Left = 10
                Top = 11
                Width = 116
                Height = 29
                Hint = ''
                Margins.Left = 10
                AutoSize = False
                Caption = 'EDITs: focus '
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderEditFoco: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_EditFoco: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object pa006LookUpFontColor: TUniContainerPanel
              AlignWithMargins = True
              Left = 50
              Top = 45
              Width = 292
              Height = 6
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              Visible = False
              ParentColor = False
              Color = clWhite
              TabOrder = 11
              object UniLabel4: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 3
                Width = 158
                Height = 0
                Hint = ''
                Margins.Left = 30
                Visible = False
                AutoSize = False
                Caption = 'Font'
                Align = alLeft
                ParentFont = False
                Font.Color = clSilver
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderLookupFont: TUniPanel
                AlignWithMargins = True
                Left = 283
                Top = 10
                Width = 7
                Height = 0
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 2
                Margins.Bottom = 10
                Visible = False
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_LookUpFont: TUniContainerPanel
                AlignWithMargins = True
                Left = 237
                Top = 2
                Width = 42
                Height = 2
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Visible = False
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
              end
            end
            object UniContainerPanel11: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 291
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 12
              object UniLabel8: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Logo BG'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderMenuLogoBG: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_MenuLogoBG: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel12: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 325
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 13
              object UniLabel9: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Logo Font'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderMenuLogoFont: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_MenuLogoFont: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object paLinkColor: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 903
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 14
              object labOptCOLOR_LINK: TUniLabel
                Left = 10
                Top = 11
                Width = 116
                Height = 29
                Hint = ''
                Margins.Left = 10
                AutoSize = False
                Caption = 'LINK'
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderLink: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelCOLOR_LINK: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel15: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 937
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 15
              object UniLabel12: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Hover'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderLinkHover: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelCOLOR_LINKHOVER: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel19: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 87
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 10
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 16
              object labOptFORM: TUniLabel
                Left = 10
                Top = 11
                Width = 116
                Height = 16
                Hint = ''
                Margins.Left = 10
                Margins.Bottom = 0
                AutoSize = False
                Caption = 'LABEL FORMs'
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderFormLabel: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_FormLabel: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object paGridSel: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 665
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 17
              object labOptGRIDSELECT: TUniLabel
                Left = 10
                Top = 11
                Width = 116
                Height = 29
                Hint = ''
                Margins.Left = 10
                AutoSize = False
                Caption = 'GRID: select'
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderGridSelect: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_GridSelect: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel36: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 698
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 18
              object labOptGRIDCOLUMNBG: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Title BG'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderGridTitleBG: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_GridTitleBG: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel37: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 733
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 19
              object labOptGRIDCOLUMCOLOR: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Title Color'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderGridTitleColor: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_GridTitleColor: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel38: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 767
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 20
              object UniLabel43: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Title BG Hover'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderGridTitleColorBGOver: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_GridTitleColorBGOver: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel39: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 801
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 21
              object UniLabel44: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Title Color Over'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderGridTitleColorOver: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_GridTitleColorOver: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel40: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 835
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 22
              object UniLabel45: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Title Color Icon'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderGridTitleColorIcon: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_GridTitleColorIcon: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object pa008LookUpFontClone: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 461
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 23
              object labOptLOOKUPFONTClone: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Default Color'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderEditColor: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_EditColor: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel41: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 495
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 24
              object UniLabel48: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Default Font'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderEditColorFont: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_EditColorFont: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel42: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 529
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 25
              object UniLabel49: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'ReadOnly Color'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderEditColorReadOnly: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_EditColorReadOnly: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel43: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 563
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 26
              object UniLabel50: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'ReadOnly Font'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderEditColorFontReadOnly: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_EditColorFontReadOnly: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel42Clone: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 597
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 27
              object UniLabel49Clone: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Trigger Color'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderEditColorTrigger: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_EditColorTrigger: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel43Clone: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 631
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 28
              object UniLabel50Clone: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Trigger Font'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderEditColorFontTrigger: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_EditColorFontTrigger: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel8: TUniContainerPanel
              AlignWithMargins = True
              Left = 14
              Top = 257
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhite
              TabOrder = 29
              object UniLabel59: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Group Font'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderMenuFontGroup: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_MenuFontGroup: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
            object UniContainerPanel13: TUniContainerPanel
              AlignWithMargins = True
              Left = 302
              Top = 495
              Width = 283
              Height = 35
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              Visible = False
              ParentColor = False
              Color = clWhite
              TabOrder = 30
              object UniLabel64: TUniLabel
                AlignWithMargins = True
                Left = 30
                Top = 11
                Width = 158
                Height = 21
                Hint = ''
                Margins.Left = 30
                Margins.Top = 11
                AutoSize = False
                Caption = 'Default Border'
                Align = alLeft
                ParentFont = False
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object paBorderEditColorBorder: TUniPanel
                AlignWithMargins = True
                Left = 268
                Top = 10
                Width = 7
                Height = 15
                Hint = '[[round:all]]'
                Margins.Left = 2
                Margins.Top = 10
                Margins.Right = 8
                Margins.Bottom = 10
                Align = alRight
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = 1315860
              end
              object btnSelColor_EditColorBorder: TUniContainerPanel
                AlignWithMargins = True
                Left = 238
                Top = 8
                Width = 26
                Height = 19
                Cursor = crHandPoint
                Hint = '[[round:all|border:all ]]'
                Margins.Left = 4
                Margins.Top = 8
                Margins.Right = 2
                Margins.Bottom = 8
                ParentColor = False
                Color = clBlack
                Align = alRight
                TabOrder = 3
                OnClick = btnSelColor_LoginClick
                OnMouseDown = btnSelColor_LoginMouseDown
              end
            end
          end
          object UniContainerPanel27: TUniContainerPanel
            Left = 12
            Top = 1003
            Width = 256
            Height = 389
            Hint = ''
            ParentColor = False
            TabOrder = 1
          end
          object btnDarkMode: TUniPanel
            AlignWithMargins = True
            Left = 224
            Top = 8
            Width = 68
            Height = 25
            Cursor = crHandPoint
            Hint = '[[round:all]]'
            Margins.Left = 2
            Margins.Top = 8
            Margins.Right = 2
            Margins.Bottom = 8
            Visible = False
            ParentFont = False
            Font.Color = clSilver
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = 'Dark Mode'
            Color = 2302755
            OnClick = btnBlueClick
          end
        end
      end
      object tabLayout: TUniTabSheet
        Hint = ''
        Caption = 'Layout'
        object sboxLayout: TUniScrollBox
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 340
          Height = 1862
          Hint = ''
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          TabOrder = 0
          ScrollHeight = 1851
          ScrollWidth = 366
          object rcBlock120: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 15
            Top = 215
            Width = 308
            Height = 201
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            TabOrder = 1
            object UniContainerPanel2: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel1: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 12
                Width = 54
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'TabSheets'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object chkTabColor: TUniCheckBox
              Left = 10
              Top = 69
              Width = 119
              Height = 17
              Hint = ''
              Caption = 'Theme Full'
              TabOrder = 2
            end
            object UniLabel36: TUniLabel
              Left = 152
              Top = 130
              Width = 62
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Max Open'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 3
            end
            object edMaxOpenTabs: TUniSpinEdit
              Left = 152
              Top = 152
              Width = 58
              Height = 36
              Hint = ''
              Value = 6
              MaxValue = 25
              MinValue = 5
              TabOrder = 4
              ParentFont = False
              Font.Height = -13
            end
            object chkTabsOff: TUniCheckBox
              Left = 10
              Top = 160
              Width = 119
              Height = 17
              Hint = ''
              Caption = 'Tabs Off'
              TabOrder = 5
              OnClick = chkTabsOffClick
            end
            object chkMenuTopPanelOffMobile: TUniCheckBox
              Left = 152
              Top = 69
              Width = 119
              Height = 17
              Hint = ''
              Caption = 'Top Panel Off'
              TabOrder = 6
            end
            object chkTabsOffMobile: TUniCheckBox
              Left = 152
              Top = 92
              Width = 119
              Height = 17
              Hint = ''
              Caption = 'Tabs Off'
              TabOrder = 7
              OnClick = chkTabsOffClick
            end
            object UniLabel51: TUniLabel
              Left = 10
              Top = 48
              Width = 67
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'General'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 8
            end
            object UniLabel52: TUniLabel
              Left = 152
              Top = 48
              Width = 87
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'On Mobile'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 9
            end
            object chkTabsBtn: TUniCheckBox
              Left = 10
              Top = 137
              Width = 119
              Height = 17
              Hint = ''
              Caption = 'Tabs Button'
              TabOrder = 10
            end
            object chkTabColorThemeBorder: TUniCheckBox
              Left = 10
              Top = 92
              Width = 119
              Height = 17
              Hint = ''
              Caption = 'Theme Border'
              TabOrder = 11
            end
            object chkTabBorderBottom: TUniCheckBox
              Left = 10
              Top = 113
              Width = 119
              Height = 17
              Hint = ''
              Caption = 'Border Bottom Off'
              TabOrder = 12
            end
          end
          object rcBlock130: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 15
            Top = 418
            Width = 308
            Height = 146
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            TabOrder = 2
            object UniContainerPanel4: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel2: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 13
                Width = 108
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Component Borders'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object chkBorderRounded: TUniCheckBox
              Left = 154
              Top = 48
              Width = 117
              Height = 17
              Hint = ''
              Checked = True
              Caption = 'Controls Rounded'
              TabOrder = 2
            end
            object UniLabel33: TUniLabel
              Left = 100
              Top = 77
              Width = 87
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Form / Panel'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 5
            end
            object edPanelFactor: TUniSpinEdit
              Left = 100
              Top = 96
              Width = 89
              Height = 36
              Hint = ''
              Value = 6
              MaxValue = 25
              MinValue = 4
              TabOrder = 4
              ParentFont = False
              Font.Height = -13
            end
            object edEditFactor: TUniSpinEdit
              Left = 11
              Top = 96
              Width = 70
              Height = 36
              Hint = ''
              Value = 6
              MaxValue = 25
              MinValue = 4
              TabOrder = 3
              ParentFont = False
              Font.Height = -13
            end
            object UniLabel34: TUniLabel
              Left = 11
              Top = 79
              Width = 30
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Edit'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 6
            end
            object UniLabel35: TUniLabel
              Left = 208
              Top = 76
              Width = 36
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Button'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 7
            end
            object edBtnFactor: TUniSpinEdit
              Left = 208
              Top = 96
              Width = 70
              Height = 36
              Hint = ''
              Value = 6
              MaxValue = 25
              MinValue = 4
              TabOrder = 8
              ParentFont = False
              Font.Height = -13
            end
            object chkFormRounded: TUniCheckBox
              Left = 11
              Top = 48
              Width = 113
              Height = 17
              Hint = ''
              Checked = True
              Caption = 'Form Rounded'
              TabOrder = 9
            end
          end
          object rcBlock135: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 15
            Top = 567
            Width = 308
            Height = 109
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            TabOrder = 3
            object UniContainerPanel7: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel5: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 12
                Width = 35
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Labels'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object chkLabelWrap: TUniCheckBox
              Left = 11
              Top = 50
              Width = 122
              Height = 17
              Hint = ''
              Caption = 'Space Wrap'
              TabOrder = 2
            end
            object chkLabelsFormsDefault: TUniCheckBox
              Left = 11
              Top = 73
              Width = 122
              Height = 17
              Hint = ''
              Checked = True
              Caption = 'Forms Default'
              TabOrder = 3
            end
            object cbxLabelsFontWeight: TUniComboBox
              Left = 173
              Top = 67
              Width = 91
              Height = 30
              Hint = ''
              Text = ''
              Items.Strings = (
                '200'
                '300'
                '400'
                '500')
              ParentFont = False
              Font.Height = -13
              TabOrder = 4
              IconItems = <>
              OnChange = cbxLabelsFontWeightChange
            end
            object UniLabel47: TUniLabel
              Left = 173
              Top = 48
              Width = 91
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Font Weight'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 5
            end
          end
          object rcBlock110: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 15
            Top = 115
            Width = 308
            Height = 98
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            TabOrder = 4
            object UniLabel7: TUniLabel
              Left = 10
              Top = 63
              Width = 95
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'OffSet / Guter'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 3
            end
            object UniContainerPanel9: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel6: TUniLabel
                AlignWithMargins = True
                Left = 5
                Top = 12
                Width = 101
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Responsive Blocks'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object edOffSet: TUniSpinEdit
              Left = 96
              Top = 52
              Width = 75
              Height = 36
              Hint = ''
              Value = 20
              MaxValue = 30
              MinValue = 5
              TabOrder = 2
              ParentFont = False
              Font.Height = -13
            end
          end
          object UniContainerPanel10: TUniContainerPanel
            Left = 10
            Top = 1587
            Width = 280
            Height = 5
            Hint = ''
            ParentColor = False
            TabOrder = 5
          end
          object rcBlock195: TUniContainerPanel
            Left = 10
            Top = 1723
            Width = 256
            Height = 128
            Hint = '[[cols:12]]'
            ParentColor = False
            TabOrder = 6
          end
          object rcBlock190: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 15
            Top = 1450
            Width = 308
            Height = 271
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            TabOrder = 7
            object UniContainerPanel31: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel38: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 12
                Width = 59
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Load Mask'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object chkLoadMaskBG: TUniCheckBox
                Left = 225
                Top = 13
                Width = 69
                Height = 17
                Hint = '[['#13#10'center:parent y'#13#10']]'
                Caption = 'With BG'
                TabOrder = 2
              end
            end
            object UniLabel39: TUniLabel
              Left = 9
              Top = 52
              Width = 221
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'File( loaders folder: gif or svg )'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 2
            end
            object cbxLoadMaskFile: TUniComboBox
              Left = 9
              Top = 72
              Width = 286
              Height = 30
              Hint = 
                '[['#13#10'cbx-fill:folder:files\images\loaders filter:*.gif;*.svg |'#13#10']' +
                ']'#13#10
              Text = ''
              Items.Strings = (
                'Calibri'
                'Roboto'
                'Exo'
                'Ubuntu')
              ParentFont = False
              Font.Height = -13
              TabOrder = 3
              IconItems = <>
              OnChange = cbxLoadMaskFileChange
            end
            object paImgLoadMask: TUniContainerPanel
              AlignWithMargins = True
              Left = 68
              Top = 113
              Width = 139
              Height = 144
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ParentColor = False
              TabOrder = 4
              object imgLoadMask: TUniLabel
                AlignWithMargins = True
                Left = 3
                Top = 2
                Width = 133
                Height = 140
                Cursor = crHandPoint
                Hint = ''
                Margins.Top = 2
                Margins.Bottom = 2
                CreateOrder = 1
                Alignment = taCenter
                TextConversion = txtHTML
                AutoSize = False
                Caption = 'img-mask'
                Align = alClient
                ParentFont = False
                Font.Color = 15724527
                Font.Height = -16
                TabOrder = 1
              end
            end
          end
          object rcBlock170: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 15
            Top = 1092
            Width = 308
            Height = 123
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            TabOrder = 8
            object UniContainerPanel45: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel53: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 12
                Width = 94
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Mobile Keyboard'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object chkVirtualKeyboard: TUniCheckBox
              Left = 9
              Top = 70
              Width = 242
              Height = 17
              Hint = ''
              Caption = 'Virtual Keyboard ( kioski - mobile )[beta]'
              TabOrder = 2
              OnClick = chkVirtualKeyboardClick
            end
            object chkScrollKeyboardOffset: TUniCheckBox
              Left = 9
              Top = 92
              Width = 158
              Height = 17
              Hint = ''
              Visible = False
              Caption = 'Scroll Keyboard "offset"'
              TabOrder = 3
            end
            object chkVirtualKeyboardDesktop: TUniCheckBox
              Left = 9
              Top = 49
              Width = 248
              Height = 17
              Hint = ''
              Caption = 'Virtual Keyboard ( kioski - desktop )[beta]'
              TabOrder = 4
              OnClick = chkVirtualKeyboardClick
            end
          end
          object rcBlock115: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 58
            Top = 168
            Width = 308
            Height = 98
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            TabOrder = 9
            object paAnimEffTitle: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel66: TUniLabel
                AlignWithMargins = True
                Left = 5
                Top = 12
                Width = 95
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Animation Effects'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object chkAnimEffects: TUniCheckBox
              Left = 10
              Top = 70
              Width = 99
              Height = 17
              Hint = ''
              Checked = True
              Caption = 'Modal Forms'
              TabOrder = 2
            end
            object chkGridBlockAnim: TUniCheckBox
              Left = 10
              Top = 49
              Width = 99
              Height = 17
              Hint = ''
              Checked = True
              Caption = 'Resize Blocks'
              TabOrder = 3
            end
            object chkMenuCallAnim: TUniCheckBox
              Left = 130
              Top = 50
              Width = 121
              Height = 17
              Hint = ''
              Checked = True
              Caption = 'Menu Call Anim'
              TabOrder = 4
            end
          end
          object rcBlock140: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 38
            Top = 682
            Width = 308
            Height = 188
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            TabOrder = 10
            object UniContainerPanel14: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel10: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 12
                Width = 57
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Side Menu'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object UniLabel11: TUniLabel
              Left = 103
              Top = 50
              Width = 58
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Font Size'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 2
            end
            object edMenuFontSize: TUniSpinEdit
              Left = 103
              Top = 69
              Width = 70
              Height = 36
              Hint = ''
              Value = 12
              MaxValue = 24
              MinValue = 12
              TabOrder = 3
              ParentFont = False
              Font.Height = -13
            end
            object chkUserBG: TUniCheckBox
              Left = 200
              Top = 134
              Width = 104
              Height = 17
              Hint = ''
              Caption = 'User BG'
              TabOrder = 4
            end
            object chkMenu: TUniCheckBox
              Left = 200
              Top = 69
              Width = 104
              Height = 17
              Hint = ''
              Checked = True
              Caption = 'Live MENU'
              TabOrder = 5
              OnClick = chkMenuClick
            end
            object chkMicroMenu: TUniCheckBox
              Left = 200
              Top = 91
              Width = 104
              Height = 17
              Hint = ''
              Caption = 'Micro MENU'
              TabOrder = 6
              OnClick = chkMicroMenuClick
            end
            object chkMicroMenuAutoClose: TUniCheckBox
              Left = 200
              Top = 113
              Width = 104
              Height = 17
              Hint = ''
              Caption = 'Auto Close'
              TabOrder = 7
            end
            object edMenuWidth: TUniSpinEdit
              Left = 11
              Top = 69
              Width = 70
              Height = 36
              Hint = ''
              Value = 320
              MaxValue = 450
              MinValue = 300
              TabOrder = 8
              ParentFont = False
              Font.Height = -13
            end
            object UniLabel67: TUniLabel
              Left = 10
              Top = 50
              Width = 58
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Width'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 9
            end
            object UniLabel68: TUniLabel
              Left = 105
              Top = 119
              Width = 58
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Line Height'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 10
            end
            object edMenuLineHeight: TUniSpinEdit
              Left = 103
              Top = 138
              Width = 70
              Height = 36
              Hint = ''
              Value = 38
              MaxValue = 46
              MinValue = 32
              TabOrder = 11
              ParentFont = False
              Font.Height = -13
            end
            object UniLabel69: TUniLabel
              Left = 12
              Top = 118
              Width = 58
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Text Width'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 12
            end
            object edMenuTextWidth: TUniSpinEdit
              Left = 13
              Top = 137
              Width = 70
              Height = 36
              Hint = ''
              Value = 320
              MaxValue = 450
              MinValue = 300
              TabOrder = 13
              ParentFont = False
              Font.Height = -13
            end
          end
          object rcBlock150: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 6
            Top = 840
            Width = 308
            Height = 96
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            TabOrder = 11
            object UniContainerPanel17: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel41: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 12
                Width = 54
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Scroll Bar'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object chkScrollBarThin: TUniCheckBox
              Left = 11
              Top = 57
              Width = 97
              Height = 17
              Hint = ''
              Caption = 'Thin Bar'
              TabOrder = 2
            end
            object chkScrollBarHideMobile: TUniCheckBox
              Left = 160
              Top = 57
              Width = 97
              Height = 17
              Hint = ''
              Caption = 'Hide on MOBILE'
              TabOrder = 3
            end
            object UniLabel42: TUniLabel
              Left = 234
              Top = 77
              Width = 58
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              Visible = False
              AutoSize = False
              Caption = 'Size'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 4
            end
            object edScrollBarSize: TUniSpinEdit
              Left = 243
              Top = 60
              Width = 65
              Height = 36
              Hint = ''
              Visible = False
              Value = 8
              MaxValue = 16
              MinValue = 5
              TabOrder = 5
              ParentFont = False
              Font.Height = -13
            end
          end
          object rcBlock160: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 13
            Top = 909
            Width = 308
            Height = 194
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            TabOrder = 12
            object UniContainerPanel21: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel40: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 12
                Width = 30
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Grids'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object chkGridUpperCase: TUniCheckBox
              Left = 9
              Top = 52
              Width = 139
              Height = 17
              Hint = ''
              Caption = 'Titles:Uppercase'
              TabOrder = 2
            end
            object chkGridBold: TUniCheckBox
              Left = 9
              Top = 75
              Width = 139
              Height = 17
              Hint = ''
              Caption = 'Titles:Bold'
              TabOrder = 3
            end
            object edGridRowHeight: TUniSpinEdit
              Left = 9
              Top = 147
              Width = 62
              Height = 36
              Hint = ''
              Value = 8
              MaxValue = 60
              MinValue = 20
              TabOrder = 4
              ParentFont = False
              Font.Height = -13
            end
            object UniLabel46: TUniLabel
              Left = 11
              Top = 128
              Width = 63
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Row Height'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 8
            end
            object chkGridColumnSeparator: TUniCheckBox
              Left = 145
              Top = 52
              Width = 162
              Height = 17
              Hint = ''
              Caption = 'Column Separator'
              TabOrder = 9
            end
            object chkGridPaginator: TUniCheckBox
              Left = 145
              Top = 75
              Width = 162
              Height = 17
              Hint = ''
              Caption = 'RC Paginator'
              TabOrder = 10
            end
            object edGridTitleFontSize: TUniSpinEdit
              Left = 156
              Top = 147
              Width = 69
              Height = 36
              Hint = ''
              Value = 8
              MaxValue = 18
              MinValue = 9
              TabOrder = 6
              ParentFont = False
              Font.Height = -13
            end
            object UniLabel61: TUniLabel
              Left = 157
              Top = 128
              Width = 72
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Title Font Size'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 11
            end
            object edGridFontSize: TUniSpinEdit
              Left = 236
              Top = 146
              Width = 56
              Height = 36
              Hint = ''
              Value = 8
              MaxValue = 18
              MinValue = 9
              TabOrder = 7
              ParentFont = False
              Font.Height = -13
            end
            object UniLabel62: TUniLabel
              Left = 237
              Top = 127
              Width = 62
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Font Size'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 12
            end
            object UniLabel65: TUniLabel
              Left = 85
              Top = 128
              Width = 63
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Title Height'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 13
            end
            object edGridTitleHeight: TUniSpinEdit
              Left = 83
              Top = 147
              Width = 62
              Height = 36
              Hint = ''
              Value = 8
              MaxValue = 60
              MinValue = 20
              TabOrder = 5
              ParentFont = False
              Font.Height = -13
            end
          end
          object rcBlock180: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 13
            Top = 1214
            Width = 308
            Height = 223
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            TabOrder = 13
            object UniContainerPanel23: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel54: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 12
                Width = 67
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Login Model'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object UniLabel55: TUniLabel
              Left = 9
              Top = 50
              Width = 257
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Select a Model'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 2
            end
            object chkLoginWithImgBG: TUniCheckBox
              Left = 9
              Top = 112
              Width = 132
              Height = 17
              Hint = ''
              Checked = True
              Caption = 'Background  IMG'
              TabOrder = 3
              OnChange = chkLoginWithImgBGChange
            end
            object cbxLoginModel: TUniComboBox
              Left = 9
              Top = 69
              Width = 286
              Height = 30
              Hint = 
                '[['#13#10'cbx-fill:folder:files\images\loaders filter:*.gif;*.svg |'#13#10']' +
                ']'#13#10
              Text = ''
              Items.Strings = (
                'Full Screen - Form Data On Right'
                'Full Screen - Form Data On Left'
                'Center - Form Data On Left'
                'Center - Form Data On Right'
                'Transparent'
                'Themed - Form Data On Right'
                'Themed - Form Data On Left')
              ParentFont = False
              Font.Height = -13
              TabOrder = 4
              IconItems = <>
              OnChange = cbxLoginModelChange
            end
            object chkLoginDisable: TUniCheckBox
              Left = 145
              Top = 206
              Width = 150
              Height = 17
              Hint = ''
              Visible = False
              Caption = 'Disable Login( not work )'
              TabOrder = 5
            end
            object chkLoginWelcomeBox: TUniCheckBox
              Left = 9
              Top = 157
              Width = 132
              Height = 17
              Hint = ''
              Caption = 'Welcome Box'
              TabOrder = 6
            end
            object chkLoginLanguage: TUniCheckBox
              Left = 145
              Top = 157
              Width = 149
              Height = 17
              Hint = ''
              Caption = 'Language Select'
              TabOrder = 7
            end
            object chkLoginInvertImg: TUniCheckBox
              Left = 145
              Top = 134
              Width = 149
              Height = 17
              Hint = ''
              Caption = 'Invert BG / Gradient'
              TabOrder = 8
              OnChange = chkLoginInvertImgChange
            end
            object chkLoginWithExtraImg: TUniCheckBox
              Left = 9
              Top = 134
              Width = 132
              Height = 17
              Hint = ''
              Caption = 'Extra Image'
              TabOrder = 9
              OnChange = chkLoginWithExtraImgChange
            end
            object chkLoginWithVideoBG: TUniCheckBox
              Left = 145
              Top = 112
              Width = 149
              Height = 17
              Hint = ''
              Caption = 'Background VIDEO'
              TabOrder = 10
            end
            object chkLoginBgFixed: TUniCheckBox
              Left = 9
              Top = 180
              Width = 132
              Height = 17
              Hint = ''
              Caption = 'BG Fixed'
              TabOrder = 11
            end
            object chkLoginBgSolid: TUniCheckBox
              Left = 145
              Top = 180
              Width = 132
              Height = 17
              Hint = ''
              Caption = 'BG Solid'
              TabOrder = 12
              OnChange = chkLoginBgSolidChange
            end
          end
          object rcBlock137: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 55
            Top = 604
            Width = 308
            Height = 119
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            TabOrder = 14
            object paEditsAndButtonsTitle: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel70: TUniLabel
                AlignWithMargins = True
                Left = 5
                Top = 12
                Width = 96
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Edits and Buttons'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object chkButtonNoFocus: TUniCheckBox
              Left = 11
              Top = 89
              Width = 226
              Height = 17
              Hint = ''
              Caption = 'Focus on Button Click Disabled'
              TabOrder = 2
            end
            object chkBgThemeColorFocusActive: TUniCheckBox
              Left = 11
              Top = 47
              Width = 226
              Height = 17
              Hint = ''
              Caption = '"Edits" with Theme Color On Focus '
              TabOrder = 3
            end
            object chkBgThemedLookUp: TUniCheckBox
              Left = 11
              Top = 68
              Width = 226
              Height = 17
              Hint = ''
              Caption = 'LookUp Bg Themed Disabled'
              TabOrder = 4
            end
          end
          object rcBlock100: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 42
            Top = 1
            Width = 308
            Height = 161
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            Color = 15395562
            TabOrder = 0
            object UniContainerPanel22: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel32: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 12
                Width = 67
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Default Font'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object cbxFonts: TUniComboBox
              Left = 11
              Top = 55
              Width = 212
              Height = 38
              Hint = ''
              Text = ''
              Items.Strings = (
                'Calibri'
                'Roboto'
                'Exo'
                'Ubuntu'
                'Titillium Web'
                'Kanit'
                'Comfortaa'
                'Varela Round'
                'Mitr'
                'Outfit'
                'Khand'
                'Jura'
                'Saira Semi Condensed'
                'Bai Jamjuree'
                'Oxanium'
                'Baloo Chettan 2'
                'Glory'
                'Mina'
                'Rajdhani')
              ParentFont = False
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 2
              IconItems = <>
              OnSelect = cbxFontsSelect
            end
            object chkAllFont: TUniCheckBox
              Left = 233
              Top = 67
              Width = 57
              Height = 17
              Hint = ''
              Checked = True
              Caption = 'All'
              TabOrder = 3
            end
            object chkBSIcons: TUniCheckBox
              Left = 233
              Top = 121
              Width = 66
              Height = 17
              Hint = ''
              Checked = True
              Caption = 'BS Icons'
              TabOrder = 4
            end
            object cbxFontAwsVersion: TUniComboBox
              Left = 11
              Top = 111
              Width = 212
              Height = 38
              Hint = ''
              Text = ''
              Items.Strings = (
                'Font AweSome 5'
                'Font AweSome 6'
                'Font AweSome 7')
              ParentFont = False
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 5
              IconItems = <>
            end
          end
        end
      end
      object tabConfig: TUniTabSheet
        Hint = ''
        Caption = 'Config'
        object sboxConfig: TUniScrollBox
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 340
          Height = 1862
          Hint = ''
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          TabOrder = 0
          ScrollHeight = 1568
          ScrollWidth = 323
          object UniContainerPanel49: TUniContainerPanel
            Left = 10
            Top = 1563
            Width = 280
            Height = 5
            Hint = ''
            ParentColor = False
            TabOrder = 0
          end
          object rcBlock200: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 15
            Top = 13
            Width = 308
            Height = 157
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            Color = 15395562
            TabOrder = 1
            object UniContainerPanel18: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel13: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 12
                Width = 51
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Language'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object chkRCTranslate: TUniCheckBox
                Left = 180
                Top = 10
                Width = 94
                Height = 17
                Hint = ''
                Checked = True
                Caption = 'RC Translate'
                TabOrder = 2
              end
            end
            object cbLanguage: TUniComboBox
              Left = 11
              Top = 53
              Width = 216
              Height = 30
              Hint = ''
              Text = ''
              ParentFont = False
              Font.Height = -13
              TabOrder = 2
              IconItems = <>
              OnSelect = cbLanguageSelect
            end
            object UniBitBtn1: TUniBitBtn
              AlignWithMargins = True
              Left = 236
              Top = 53
              Width = 61
              Height = 28
              Hint = '[[cls:ButtonThemeCrud]]'
              Margins.Top = 4
              Margins.Right = 0
              Caption = 'Edit'
              ParentFont = False
              Font.Height = -16
              Font.Name = 'Calibri'
              TabOrder = 6
              OnClick = UniBitBtn1Click
            end
            object paFlag: TUniContainerPanel
              Left = 140
              Top = 56
              Width = 39
              Height = 24
              Hint = '[[round:all]]'
              ParentColor = False
              Color = clWhite
              TabOrder = 7
              object labFlag: TUniLabel
                Left = -4
                Top = 0
                Width = 46
                Height = 25
                Hint = '[[translate:]]'
                Margins.Bottom = 0
                TextConversion = txtHTML
                AutoSize = False
                Caption = ''
                ParentFont = False
                Font.Color = 15658734
                Font.Height = -16
                Font.Name = 'Calibri'
                ParentColor = False
                Color = clGray
                TabOrder = 1
              end
            end
            object edCurrencyNamePlural: TUniEdit
              Left = 162
              Top = 113
              Width = 135
              Height = 30
              Hint = ''
              Text = ''
              ParentFont = False
              Font.Height = -13
              TabOrder = 5
            end
            object UniLabel37: TUniLabel
              Left = 11
              Top = 95
              Width = 253
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Currency Symbol / Name / Plural Name'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -12
              Font.Name = 'Calibri'
              TabOrder = 8
            end
            object edCurrencySymbol: TUniEdit
              Left = 11
              Top = 113
              Width = 49
              Height = 30
              Hint = ''
              Text = ''
              ParentFont = False
              Font.Height = -13
              TabOrder = 3
            end
            object edCurrencyName: TUniEdit
              Left = 64
              Top = 113
              Width = 95
              Height = 30
              Hint = ''
              Text = ''
              ParentFont = False
              Font.Height = -13
              TabOrder = 4
            end
          end
          object rcBlock210: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 15
            Top = 434
            Width = 308
            Height = 417
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            Color = 15395562
            TabOrder = 2
            object UniContainerPanel24: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel14: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 12
                Width = 52
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Database'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object cbDatabase: TUniComboBox
              Left = 80
              Top = 56
              Width = 217
              Height = 30
              Hint = ''
              Text = ''
              Items.Strings = (
                'FIREBIRD'
                'MYSQL'
                'PGSQL'
                'SQLSERVER'
                'SQLITE')
              ParentFont = False
              Font.Height = -13
              TabOrder = 2
              IconItems = <>
            end
            object UniLabel15: TUniLabel
              Left = 10
              Top = 143
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'IP'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 3
            end
            object UniLabel16: TUniLabel
              Left = 10
              Top = 63
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'DBMS'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 4
            end
            object edIP: TUniEdit
              Left = 80
              Top = 134
              Width = 217
              Height = 30
              Hint = ''
              Text = '127.0.0.1'
              ParentFont = False
              Font.Height = -13
              TabOrder = 5
            end
            object edPort: TUniEdit
              Left = 80
              Top = 174
              Width = 217
              Height = 30
              Hint = ''
              Text = '3050'
              ParentFont = False
              Font.Height = -13
              TabOrder = 6
            end
            object UniLabel17: TUniLabel
              Left = 10
              Top = 183
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Port'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 7
            end
            object edUser: TUniEdit
              Left = 80
              Top = 214
              Width = 217
              Height = 30
              Hint = ''
              Text = 'sysdba'
              ParentFont = False
              Font.Height = -13
              TabOrder = 8
            end
            object UniLabel18: TUniLabel
              Left = 10
              Top = 223
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'User'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 9
            end
            object edPass: TUniEdit
              Left = 80
              Top = 254
              Width = 217
              Height = 30
              Hint = ''
              PasswordChar = '*'
              Text = 'masterkey'
              ParentFont = False
              Font.Height = -13
              TabOrder = 10
            end
            object UniLabel19: TUniLabel
              Left = 10
              Top = 263
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Password'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 11
            end
            object btnTestConnect: TUniBitBtn
              AlignWithMargins = True
              Left = 80
              Top = 369
              Width = 217
              Height = 32
              Hint = '[[cls:ButtonThemeCrud]]'
              Margins.Top = 4
              Margins.Right = 0
              Caption = 'Connect and Apply'
              ParentFont = False
              Font.Height = -16
              Font.Name = 'Calibri'
              TabOrder = 12
              OnClick = btnTestConnectClick
            end
            object edDatabaseName: TUniEdit
              Left = 80
              Top = 96
              Width = 217
              Height = 30
              Hint = ''
              Text = 'rc_db.fdb'
              ParentFont = False
              Font.Height = -13
              TabOrder = 13
            end
            object UniLabel20: TUniLabel
              Left = 10
              Top = 105
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Database'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 14
            end
            object chkClearData: TUniCheckBox
              Left = 80
              Top = 296
              Width = 113
              Height = 17
              Hint = ''
              Caption = 'Clear Sample Data'
              TabOrder = 15
            end
            object chkDropSecTables: TUniCheckBox
              Left = 80
              Top = 317
              Width = 157
              Height = 17
              Hint = ''
              Caption = 'Drop Secondary Tables'
              TabOrder = 16
            end
            object chkDropSecTablesUser: TUniCheckBox
              Left = 80
              Top = 338
              Width = 217
              Height = 17
              Hint = ''
              Caption = 'Drop Tables Except User Ctrl'
              TabOrder = 17
            end
          end
          object rcBlock220: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 15
            Top = 880
            Width = 308
            Height = 413
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            Color = 15395562
            TabOrder = 3
            object UniContainerPanel26: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel21: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 12
                Width = 31
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Email'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object UniLabel23: TUniLabel
              Left = 10
              Top = 61
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Email'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
            object edEmailPass: TUniEdit
              Left = 80
              Top = 172
              Width = 217
              Height = 30
              Hint = ''
              PasswordChar = '*'
              Text = '1234'
              ParentFont = False
              Font.Height = -13
              TabOrder = 3
            end
            object UniLabel26: TUniLabel
              Left = 10
              Top = 181
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Password'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 4
            end
            object btnMailTest: TUniBitBtn
              AlignWithMargins = True
              Left = 213
              Top = 365
              Width = 82
              Height = 32
              Hint = '[[cls:ButtonThemeCrud]]'
              Margins.Top = 4
              Margins.Right = 0
              Caption = 'Test'
              ParentFont = False
              Font.Height = -16
              Font.Name = 'Calibri'
              TabOrder = 5
              ClientEvents.UniEvents.Strings = (
                'ajaxRequest=function ajaxRequest(sender, url, data)'#13#10'{'#13#10#13#10'}'
                'ajaxCallback=function ajaxCallback(sender, response)'#13#10'{'#13#10#13#10'}')
              OnClick = btnMailTestClick
            end
            object edEmailHost: TUniEdit
              Left = 80
              Top = 94
              Width = 217
              Height = 30
              Hint = ''
              Text = 'gmail.com'
              ParentFont = False
              Font.Height = -13
              TabOrder = 6
            end
            object UniLabel27: TUniLabel
              Left = 10
              Top = 103
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Host'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 7
            end
            object edEmail: TUniEdit
              Left = 80
              Top = 57
              Width = 217
              Height = 30
              Hint = ''
              Text = 'mikromundo@gmail.com'
              ParentFont = False
              Font.Height = -13
              TabOrder = 8
            end
            object UniLabel22: TUniLabel
              Left = 12
              Top = 143
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'User '
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 9
            end
            object edEmailUSer: TUniEdit
              Left = 80
              Top = 132
              Width = 217
              Height = 30
              Hint = ''
              Text = 'mikromundo@gmail.com'
              ParentFont = False
              Font.Height = -13
              TabOrder = 10
            end
            object edEmailSmtpPort: TUniEdit
              Left = 80
              Top = 212
              Width = 217
              Height = 30
              Hint = ''
              Text = '587'
              ParentFont = False
              Font.Height = -13
              TabOrder = 11
            end
            object UniLabel24: TUniLabel
              Left = 10
              Top = 221
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'SMTP Port'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 12
            end
            object UniLabel28: TUniLabel
              Left = 10
              Top = 259
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'TLS'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 13
            end
            object UniLabel29: TUniLabel
              Left = 10
              Top = 319
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Html'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 14
            end
            object UniLabel30: TUniLabel
              Left = 10
              Top = 289
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'SSL'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 15
            end
            object swtEmailTLS: TUniLabel
              Left = 80
              Top = 253
              Width = 33
              Height = 24
              Hint = '[[bsswt:1]]'
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'Swt2'
              ParentFont = False
              Font.Height = -20
              Font.Name = 'Calibri'
              Font.Style = [fsUnderline]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 16
            end
            object swtEmailSSL: TUniLabel
              Left = 80
              Top = 283
              Width = 33
              Height = 24
              Hint = '[[bsswt:0]]'
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'Swt3'
              ParentFont = False
              Font.Height = -20
              Font.Name = 'Calibri'
              Font.Style = [fsUnderline]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 17
            end
            object swtEmailHtml: TUniLabel
              Left = 80
              Top = 313
              Width = 33
              Height = 24
              Hint = '[[bsswt:0]]'
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'Swt4'
              ParentFont = False
              Font.Height = -20
              Font.Name = 'Calibri'
              Font.Style = [fsUnderline]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 18
            end
            object UniLabel25: TUniLabel
              Left = 10
              Top = 347
              Width = 59
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Threaded'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 19
            end
            object swtEmailThreaded: TUniLabel
              Left = 80
              Top = 343
              Width = 33
              Height = 24
              Hint = '[[bsswt:0]]'
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'Swt1'
              ParentFont = False
              Font.Height = -20
              Font.Name = 'Calibri'
              Font.Style = [fsUnderline]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 20
            end
          end
          object rcBlock205: TUniContainerPanel
            Tag = 1
            AlignWithMargins = True
            Left = 15
            Top = 175
            Width = 308
            Height = 252
            Hint = '[[cols:12|round:no | cls:card-info-box-white]]'
            Margins.Left = 15
            Margins.Top = 15
            Margins.Right = 15
            Margins.Bottom = 10
            ParentColor = False
            TabOrder = 4
            object UniContainerPanel29: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 308
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = clSilver
              Align = alTop
              TabOrder = 1
              object UniLabel31: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 12
                Width = 140
                Height = 15
                Hint = '[[bsh6:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Caption = 'Other Application Configs'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object chkSessionLog: TUniCheckBox
              Left = 11
              Top = 167
              Width = 226
              Height = 17
              Hint = ''
              Caption = 'Generate Logs Only in Release'
              TabOrder = 2
            end
            object UniLabel63: TUniLabel
              Left = 12
              Top = 94
              Width = 129
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Session TimeOut'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 3
            end
            object edSessionTimeOut: TUniEdit
              Left = 168
              Top = 86
              Width = 129
              Height = 30
              Hint = ''
              Text = '0'
              ParentFont = False
              Font.Height = -13
              TabOrder = 4
            end
            object chkAppDataFolder: TUniCheckBox
              Left = 11
              Top = 191
              Width = 226
              Height = 17
              Hint = ''
              Caption = 'Create only APP_DATA folder'
              TabOrder = 5
            end
            object btnAppDataHelp: TUniBitBtn
              Left = 276
              Top = 189
              Width = 20
              Height = 22
              Hint = ''
              Caption = '?'
              TabOrder = 6
              OnClick = btnAppDataHelpClick
            end
            object chkRCGuideTour: TUniCheckBox
              Left = 11
              Top = 215
              Width = 226
              Height = 17
              Hint = ''
              Caption = 'Guide Tour'
              TabOrder = 7
            end
            object UniLabel71: TUniLabel
              Left = 12
              Top = 128
              Width = 129
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Ajax TimeOut'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 8
            end
            object edAjaxTimeOut: TUniEdit
              Left = 168
              Top = 120
              Width = 129
              Height = 30
              Hint = ''
              Text = '0'
              ParentFont = False
              Font.Height = -13
              TabOrder = 9
            end
            object labPort: TUniLabel
              Left = 12
              Top = 58
              Width = 129
              Height = 16
              Hint = ''
              Margins.Left = 10
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Application Port'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 10
            end
            object edAppPort: TUniEdit
              Left = 168
              Top = 50
              Width = 129
              Height = 30
              Hint = ''
              Text = '0'
              ParentFont = False
              Font.Height = -13
              TabOrder = 11
            end
          end
        end
      end
    end
    object paCmdButtons: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 350
      Height = 40
      Hint = ''
      Margins.Top = 0
      Margins.Bottom = 12
      ParentColor = False
      Align = alTop
      TabOrder = 2
      object btnExit: TUniBitBtn
        Left = 11
        Top = 5
        Width = 72
        Height = 30
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 0
        Caption = 'Close'
        ParentFont = False
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 1
        OnClick = btnExitClick
      end
      object btnDefault: TUniBitBtn
        Left = 92
        Top = 5
        Width = 134
        Height = 30
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Left = 15
        Margins.Top = 4
        Margins.Right = 10
        Caption = 'Default'
        ParentFont = False
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = btnDefaultClick
      end
      object btnOk: TUniBitBtn
        Left = 234
        Top = 5
        Width = 72
        Height = 30
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 4
        Margins.Right = 0
        Caption = 'Apply'
        ParentFont = False
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnOkClick
      end
    end
  end
  object paTitulo: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 42
    Hint = ''
    ParentColor = False
    Color = clSilver
    TabOrder = 1
    object paSearchContent1: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 350
      Height = 40
      Hint = ''
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      Color = clGray
      Align = alTop
      TabOrder = 1
      object labTitleFrm: TUniLabel
        AlignWithMargins = True
        Left = 10
        Top = 5
        Width = 122
        Height = 26
        Hint = ''
        Margins.Left = 10
        Margins.Top = 5
        Caption = 'Config Control'
        Align = alClient
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object labSelectedColor: TUniLabel
        Left = 202
        Top = 8
        Width = 3
        Height = 13
        Hint = ''
        Visible = False
        Caption = ''
        TabOrder = 2
      end
      object paActiveTheme: TUniContainerPanel
        AlignWithMargins = True
        Left = 236
        Top = 8
        Width = 103
        Height = 24
        Cursor = crHandPoint
        Hint = '[[round:all]]'
        Margins.Left = 2
        Margins.Top = 8
        Margins.Right = 2
        Margins.Bottom = 8
        ParentColor = False
        Color = 7537159
        TabOrder = 3
        object labActiveTheme: TUniLabel
          Left = 6
          Top = 5
          Width = 90
          Height = 14
          Hint = ''
          Margins.Left = 10
          Margins.Bottom = 0
          Alignment = taCenter
          AutoSize = False
          Caption = 'LIGHT THEMES'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
    end
  end
  object UniContainerPanel20: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 6
    Height = 1840
    Hint = ''
    ParentColor = False
    Color = clGray
    Align = alLeft
    TabOrder = 2
  end
  object paColorSelect: TUniContainerPanel
    Left = 199
    Top = 1736
    Width = 198
    Height = 198
    Hint = '[[round:no | cls:card-info-box-white bringtofront]]'
    Visible = False
    ParentColor = False
    TabOrder = 3
    object htmlFrame: TUniHTMLFrame
      Left = 2
      Top = 0
      Width = 195
      Height = 195
      Hint = ''
      Margins.Left = 22
      Margins.Top = 14
      Margins.Right = 23
      HTML.Strings = (
        
          '<canvas id="colorCanvas" class="color-canvas" width="180" height' +
          '="162"></canvas>'
        '<script>'
        '    var canvasEl = document.getElementById('#39'colorCanvas'#39');'
        '    var canvasContext = canvasEl.getContext('#39'2d'#39');'
        ''
        '    var image = new Image(180, 162);'
        
          '    image.onload = () => canvasContext.drawImage(image, 0, 0, im' +
          'age.width, image.height); '
        '    image.src = "files/images/colortable.jpg";'
        ''
        '    canvasEl.onclick = function(mouseEvent) '
        '    {'
        
          '      var imgData = canvasContext.getImageData(mouseEvent.offset' +
          'X, mouseEvent.offsetY, 1, 1);'
        '      var rgba = imgData.data;'
        
          '      ajaxRequest( frmTHEMES , "colorpixel", ["color="+rgba(" + ' +
          'rgba[0] + ", " + rgba[1] + ", " + rgba[2] + ", " + rgba[3] + ")"' +
          ']);'
        
          '      //alert("rgba(" + rgba[0] + ", " + rgba[1] + ", " + rgba[2' +
          '] + ", " + rgba[3] + ")");'
        '    }'
        '</script>')
      OnAjaxEvent = htmlFrameAjaxEvent
      object UniLabel57: TUniLabel
        Left = 51
        Top = 43
        Width = 125
        Height = 13
        Hint = ''
        Visible = False
        Caption = 'Do not change dimensions'
        TabOrder = 1
      end
      object labCloseColorSelect: TUniLabel
        Left = 179
        Top = 4
        Width = 7
        Height = 18
        Cursor = crHandPoint
        Hint = '[['#13#10#13#10'cls:rc-label-clear'#13#10']]'
        Margins.Left = 10
        Caption = 'x'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        TabOrder = 2
        OnClick = labCloseColorSelectClick
      end
      object edColorText: TUniEdit
        Left = 20
        Top = 4
        Width = 73
        Hint = ''
        Text = 'edColorText'
        ParentFont = False
        Font.Name = 'Consolas'
        TabOrder = 3
        OnChange = edColorTextChange
      end
      object edColor: TUniEdit
        Left = 2
        Top = 4
        Width = 18
        Hint = ''
        Text = ''
        ParentFont = False
        Font.Name = 'Consolas'
        TabOrder = 4
        ReadOnly = True
      end
    end
  end
  object paColorPicker: TUniContainerPanel
    Left = 48
    Top = 1789
    Width = 117
    Height = 27
    Hint = '[[round:no | cls:card-info-box-white bringtofront]]'
    Visible = False
    ParentColor = False
    TabOrder = 4
    DesignSize = (
      117
      27)
    object htmlFrameColorPicker: TUniHTMLFrame
      Left = -2
      Top = -2
      Width = 121
      Height = 31
      Hint = ''
      Margins.Left = 22
      Margins.Top = 14
      Margins.Right = 23
      Anchors = [akLeft, akTop, akRight, akBottom]
      object UniLabel60: TUniLabel
        Left = 51
        Top = 43
        Width = 125
        Height = 13
        Hint = ''
        Visible = False
        Caption = 'Do not change dimensions'
        TabOrder = 1
      end
    end
    object labCloseColorPicker: TUniLabel
      Left = 100
      Top = 3
      Width = 12
      Height = 20
      Cursor = crHandPoint
      Hint = '[['#13#10#13#10'cls:rc-label-clear'#13#10']]'
      Margins.Left = 10
      Alignment = taCenter
      AutoSize = False
      Caption = 'x'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TabOrder = 2
    end
  end
  object popMenuOptions: TUniPopupMenu
    Left = 292
    Top = 96
    object optCopy: TUniMenuItem
      Caption = 'Copy'
      OnClick = optCopyClick
    end
    object optPaste: TUniMenuItem
      Caption = 'Paste'
      OnClick = optPasteClick
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object optUndo: TUniMenuItem
      Caption = 'Undo'
      OnClick = optUndoClick
    end
  end
end
