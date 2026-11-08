object frmTranslate: TfrmTranslate
  Left = 0
  Top = 0
  Hint = '[['#13#10'frm-align:right |'#13#10'height:max |'#13#10'width:fix'#13#10']]'
  ClientHeight = 695
  ClientWidth = 447
  Caption = 'Translate'
  Color = 2763306
  OnShow = UniFormShow
  BorderStyle = bsNone
  Position = poDefaultPosOnly
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  Font.Color = clWhite
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  TextHeight = 15
  object UniContainerPanel16: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 695
    Hint = ''
    ParentColor = False
    Color = clSilver
    Align = alClient
    TabOrder = 0
    object UniScrollBox1: TUniScrollBox
      AlignWithMargins = True
      Left = 1
      Top = 1
      Width = 445
      Height = 693
      Hint = ''
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Align = alClient
      Color = 15395562
      TabOrder = 1
      DesignSize = (
        443
        691)
      object paGridB: TUniContainerPanel
        Tag = 1
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 435
        Height = 680
        Hint = '[['#13#10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'
        Margins.Left = 15
        Margins.Top = 15
        Margins.Right = 15
        Margins.Bottom = 10
        ParentColor = False
        Color = 15395562
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        DesignSize = (
          435
          680)
        object UniContainerPanel22: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 435
          Height = 42
          Hint = '[[round:t | cls:card-light]]'
          ParentColor = False
          Color = clSilver
          Align = alTop
          TabOrder = 1
          DesignSize = (
            435
            42)
          object labTitleFrm: TUniLabel
            AlignWithMargins = True
            Left = 10
            Top = 5
            Width = 422
            Height = 34
            Hint = ''
            Margins.Left = 10
            Margins.Top = 5
            AutoSize = False
            Caption = 'RC Translate'
            Align = alClient
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object btnExit: TUniBitBtn
            AlignWithMargins = True
            Left = 358
            Top = 7
            Width = 63
            Height = 28
            Hint = '[[cls:ButtonThemeCrud]]'
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Caption = 'Close'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 2
            OnClick = btnExitClick
          end
        end
        object mmContent: TUniMemo
          Left = 10
          Top = 532
          Width = 415
          Height = 94
          Hint = ''
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 2
        end
        object cbForm: TUniComboBox
          Left = 92
          Top = 96
          Width = 260
          Height = 30
          Hint = ''
          Text = ''
          Items.Strings = (
            'Portuguese - Brazilian ( pt_BR )'
            'English ( en )'
            'Spanish ( es )')
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          TabOrder = 3
          IconItems = <>
          OnChange = cbFormChange
        end
        object btnSave: TUniBitBtn
          AlignWithMargins = True
          Left = 362
          Top = 636
          Width = 63
          Height = 32
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Left = 0
          Margins.Top = 4
          Margins.Right = 0
          Caption = 'Save'
          Anchors = [akRight, akBottom]
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 4
          OnClick = btnSaveClick
        end
        object bntCancel: TUniBitBtn
          AlignWithMargins = True
          Left = 290
          Top = 636
          Width = 63
          Height = 32
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Left = 0
          Margins.Top = 4
          Margins.Right = 0
          Caption = 'Cancel'
          Anchors = [akRight, akBottom]
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 5
          OnClick = bntCancelClick
        end
        object btnDelForm: TUniBitBtn
          AlignWithMargins = True
          Left = 358
          Top = 96
          Width = 63
          Height = 30
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Top = 4
          Margins.Right = 0
          Caption = 'Del'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 6
          OnClick = btnDelFormClick
        end
        object cbLanguage: TUniComboBox
          Left = 92
          Top = 51
          Width = 329
          Height = 30
          Hint = ''
          Text = ''
          Items.Strings = (
            
              '<a><span class="flag-icon flag-icon-br"></span> Portuguese ( pt_' +
              'BR )</a> '
            
              '<a><span class="flag-icon flag-icon-us"></span> English ( en )</' +
              'a> '
            
              '<a><span class="flag-icon flag-icon-es"></span> English ( es )</' +
              'a> '
            
              '<a><span class="flag-icon flag-icon-fr"></span> Fran'#231'ais( fr )</' +
              'a> '
            
              '<a><span class="flag-icon flag-icon-de"></span> Deutsch ( de )</' +
              'a> ')
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          TabOrder = 7
          IconItems = <>
          OnChange = cbLanguageChange
        end
        object UniLabel1: TUniLabel
          Left = 10
          Top = 59
          Width = 59
          Height = 16
          Hint = ''
          Margins.Left = 10
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Language'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 8
        end
        object UniLabel2: TUniLabel
          Left = 10
          Top = 101
          Width = 59
          Height = 16
          Hint = ''
          Margins.Left = 10
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Forms List'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 9
        end
        object paOptions: TUniContainerPanel
          Left = 10
          Top = 144
          Width = 415
          Height = 376
          Hint = '[['#13#10'round:no | cls:card-info-box-white'#13#10']]'
          ParentColor = False
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 10
          object pgTranslateOptions: TUniPageControl
            Left = 0
            Top = 0
            Width = 415
            Height = 376
            Hint = ''
            ActivePage = tabMenus
            Align = alClient
            TabOrder = 1
            OnChange = pgTranslateOptionsChange
            object tabMenus: TUniTabSheet
              Hint = ''
              Caption = 'Menus'
              object sgMenus: TUniStringGrid
                Left = 0
                Top = 0
                Width = 407
                Height = 348
                Hint = ''
                FixedCols = 0
                FixedRows = 0
                ColCount = 4
                Options = [goVertLine, goHorzLine, goColSizing, goRowSelect]
                ShowColumnTitles = True
                Columns = <
                  item
                    Title.Caption = 'Property'
                    Title.Font.Name = 'Calibri'
                    Width = 0
                  end
                  item
                    Title.Caption = 'Content'
                    Title.Font.Name = 'Calibri'
                    Width = 400
                  end
                  item
                    Width = 0
                  end
                  item
                    Width = 0
                  end>
                OnSelectCell = sgPropsSelectCell
                Align = alClient
                TabOrder = 0
                ParentFont = False
              end
            end
            object tabForms: TUniTabSheet
              Hint = ''
              Caption = 'Forms'
              object sgProps: TUniStringGrid
                Left = 0
                Top = 0
                Width = 407
                Height = 348
                Hint = ''
                FixedCols = 0
                FixedRows = 0
                ColCount = 4
                Options = [goVertLine, goHorzLine, goColSizing, goRowSelect]
                ShowColumnTitles = True
                Columns = <
                  item
                    Title.Caption = 'Property'
                    Title.Font.Name = 'Calibri'
                    Width = 180
                  end
                  item
                    Title.Caption = 'Content'
                    Title.Font.Name = 'Calibri'
                    Width = 215
                  end
                  item
                    Width = 0
                  end
                  item
                    Width = 0
                  end>
                OnSelectCell = sgPropsSelectCell
                Align = alClient
                TabOrder = 0
                ParentFont = False
              end
            end
          end
        end
      end
    end
  end
end
