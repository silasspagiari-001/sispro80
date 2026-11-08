inherited frmBaseCRUD: TfrmBaseCRUD
  Width = 1446
  Height = 1100
  OnDestroy = UniFrameDestroy
  ParentColor = False
  ParentBackground = False
  ExplicitWidth = 1446
  ExplicitHeight = 1100
  inherited paBaseBackGround: TUniContainerPanel
    AlignWithMargins = True
    Left = 15
    Width = 1416
    Height = 1085
    Hint = '[['#13#10'round:all |'#13#10']]'
    Margins.Left = 15
    Margins.Top = 0
    Margins.Right = 15
    Margins.Bottom = 15
    Color = clWhite
    ExplicitLeft = 15
    ExplicitWidth = 1416
    ExplicitHeight = 1085
    inherited paBaseTop: TUniContainerPanel
      AlignWithMargins = True
      Width = 1416
      Height = 90
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 2
      ExplicitWidth = 1416
      ExplicitHeight = 90
      object paBaseTopTitle: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 1416
        Height = 90
        Hint = '[['#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Align = alClient
        TabOrder = 1
        DesignSize = (
          1416
          90)
        object labState: TUniLabel
          AlignWithMargins = True
          Left = 1288
          Top = 14
          Width = 118
          Height = 70
          Hint = '[[hide:mobile-v]]'
          Margins.Left = 8
          Margins.Top = 14
          Margins.Right = 12
          Margins.Bottom = 6
          Alignment = taRightJustify
          TextConversion = txtHTML
          AutoSize = False
          Caption = '[ browsing ]'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          ParentColor = False
          Color = clWhite
          TabOrder = 6
        end
        object labOptions: TUniLabel
          Left = 1277
          Top = 55
          Width = 33
          Height = 26
          Cursor = crHandPoint
          Hint = '[[ico:fas-bars]]'
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 4
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = '='
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri Light'
          ParentColor = False
          Color = clSilver
          TabOrder = 8
          OnClick = labOptionsClick
        end
        object labCancel: TUniLabel
          Left = 1376
          Top = 55
          Width = 33
          Height = 26
          Cursor = crHandPoint
          Hint = '[[ico:fas-times]]'
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 4
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'X'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri Light'
          ParentColor = False
          Color = clSilver
          TabOrder = 4
          OnClick = btnCancelRegClick
        end
        object labTitleForm: TUniLabel
          Left = 45
          Top = 9
          Width = 37
          Height = 26
          Hint = '[['#13#10'caption-dots:mobile-v-16 '#13#10']]'#13#10#13#10
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 4
          TextConversion = txtHTML
          Caption = 'Title'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -21
          Font.Name = 'Calibri Light'
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
        object labExit: TUniLabel
          Left = 4
          Top = 8
          Width = 33
          Height = 26
          Cursor = crHandPoint
          Hint = '[['#13#10'ico:fas-sign-out-alt rc-mirror-h |'#13#10']]'
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
          TabOrder = 2
          OnClick = btnCloseFormClick
        end
        object labSave: TUniLabel
          Left = 1343
          Top = 55
          Width = 33
          Height = 26
          Cursor = crHandPoint
          Hint = '[[ico:fas-check]]'
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 4
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'V'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri Light'
          ParentColor = False
          Color = clSilver
          TabOrder = 5
          OnClick = btnSaveRegClick
        end
        object edQuickSearch: TUniEdit
          AlignWithMargins = True
          Left = 11
          Top = 47
          Width = 151
          Height = 33
          Hint = 
            '[['#13#10'cls:rc-edit-no-border-right rc-clear-btn-no-border-right'#13#10']]' +
            #13#10
          Margins.Right = 5
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 7
          TabStop = False
          EmptyText = 'Pesquisar por...'
          ClearButton = True
        end
        object labDelete: TUniLabel
          Left = 1310
          Top = 55
          Width = 33
          Height = 26
          Cursor = crHandPoint
          Hint = '[['#13#10'ico:fas-trash-alt'#13#10']]'
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 4
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = '#'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri Light'
          ParentColor = False
          Color = clSilver
          TabOrder = 10
          OnClick = btnDeleteRegClick
        end
        object btnQuickSearch: TUniBitBtn
          AlignWithMargins = True
          Left = 158
          Top = 47
          Width = 32
          Height = 33
          Hint = '[[cls:ButtonThemeCrud-no-border-left |ico:fas-search |]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = '@'
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 11
          ScreenMask.Enabled = True
          ScreenMask.Target = Owner
          OnClick = btnQuickSearchClick
        end
        object labNew: TUniLabel
          Left = 1376
          Top = 55
          Width = 33
          Height = 26
          Cursor = crHandPoint
          Hint = '[[ico:fas-plus]]'
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 4
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = '+'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri Light'
          ParentColor = False
          Color = clSilver
          TabOrder = 3
          OnClick = btnNewRegClick
        end
        object labEdit: TUniLabel
          Left = 1343
          Top = 55
          Width = 33
          Height = 26
          Cursor = crHandPoint
          Hint = '[[ico:fas-pencil-alt]]'
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 4
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = '!'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri Light'
          ParentColor = False
          Color = clSilver
          TabOrder = 9
          OnClick = btnEditRegClick
        end
        object hpMaster: TUniHiddenPanel
          Left = 263
          Top = 0
          Width = 176
          Height = 82
          Hint = ''
          Visible = True
        end
      end
    end
    object paBaseButtons: TUniContainerPanel
      AlignWithMargins = True
      Left = 4
      Top = 94
      Width = 37
      Height = 988
      Hint = ''
      Margins.Left = 4
      Margins.Top = 2
      Margins.Right = 6
      ParentColor = False
      Color = clWhite
      Align = alLeft
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      AutoScroll = True
      TabOrder = 2
      ScrollHeight = 988
      ScrollWidth = 37
      object paOF: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 282
        Width = 37
        Height = 89
        Hint = ''
        Margins.Left = 12
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 1
        object btnCloseForm: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 56
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-sign-out-alt rc-mirror-h | '#13#10'cls' +
            '-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 20
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '<'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          OnClick = btnCloseFormClick
        end
        object btnOptions: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 33
          Height = 32
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-bars | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '='
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 2
          ScaleButton = False
          OnClick = btnOptionsClick
        end
      end
      object paP: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 37
        Height = 37
        Hint = ''
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 2
        object btnSearch: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-search | '#13#10'cls-ico:font-black |'#13#10 +
            'hint:show / hide search dialog t:search c:info-light w:200 d:100' +
            '00 '#13#10']]'#13#10
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '@'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          OnClick = btnSearchClick
        end
      end
      object paNAE: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 59
        Width = 37
        Height = 116
        Hint = ''
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 3
        object btnNewReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 33
          Height = 32
          Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
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
          OnClick = btnNewRegClick
        end
        object btnEditReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 38
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            '|'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '!'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 2
          ScaleButton = False
          ScreenMask.Enabled = True
          ScreenMask.Target = Owner
          OnClick = btnEditRegClick
        end
        object btnDeleteReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 74
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
            '|'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '#'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 3
          ScaleButton = False
          OnClick = btnDeleteRegClick
        end
      end
      object paGC: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 189
        Width = 37
        Height = 77
        Hint = ''
        Margins.Left = 14
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 4
        object btnSaveReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-check | '#13#10'cls-ico:font-black|'#13#10']' +
            ']'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'V'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          ScreenMask.Enabled = True
          ScreenMask.Target = Owner
          OnClick = btnSaveRegClick
        end
        object btnCancelReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 38
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-times | '#13#10'cls-ico:font-black|'#13#10']' +
            ']'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'X'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 2
          ScaleButton = False
          ScreenMask.Enabled = True
          ScreenMask.Target = Owner
          OnClick = btnCancelRegClick
        end
      end
    end
    object paBaseCadControl: TUniContainerPanel
      Left = 47
      Top = 92
      Width = 1369
      Height = 993
      Hint = ''
      ParentColor = False
      Align = alClient
      TabOrder = 3
      object pgBaseCadControl: TUniPageControl
        Left = 0
        Top = 0
        Width = 1369
        Height = 993
        Hint = '[[anchor:]]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 9
        Margins.Bottom = 8
        ActivePage = tabSearch
        Align = alClient
        TabOrder = 1
        OnChangeValue = pgBaseCadControlChangeValue
        object tabSearch: TUniTabSheet
          Hint = ''
          Caption = 'Pesquisa'
          Font.Height = -13
          Font.Name = 'Calibri'
          ParentFont = False
          object paBaseRegSearch: TUniContainerPanel
            Left = 0
            Top = 0
            Width = 1361
            Height = 965
            Hint = ''
            ParentColor = False
            Align = alClient
            TabOrder = 0
            object paGridOffset: TUniContainerPanel
              AlignWithMargins = True
              Left = 3
              Top = 5
              Width = 1355
              Height = 957
              Hint = '[['#13#10'cls:card-info-box-white |'#13#10'round:no |'#13#10']]'
              Margins.Top = 5
              ParentColor = False
              Align = alClient
              TabOrder = 1
              object dbgSearchCRUD: TUniDBGrid
                Left = 0
                Top = 0
                Width = 1355
                Height = 957
                Hint = ''
                TitleFont.Height = -15
                TitleFont.Name = 'Calibri'
                DataSource = dsSearchMaster
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
                WebOptions.PageSize = 19
                WebOptions.FetchAll = True
                LoadMask.Message = 'Loading data...'
                Align = alClient
                Font.Height = -15
                Font.Name = 'Calibri'
                ParentFont = False
                TabOrder = 1
                Exporter.Enabled = True
                OnMouseDown = dbgSearchCRUDMouseDown
                OnCellClick = dbgSearchCRUDCellClick
                OnColumnSort = dbgSearchCRUDColumnSort
                OnDblClick = dbgSearchCRUDDblClick
                OnDrawColumnCell = dbgSearchCRUDDrawColumnCell
                OnColumnFilter = dbgSearchCRUDColumnFilter
              end
              object paNotFound_dbgSearchCRUD: TUniContainerPanel
                Left = 375
                Top = 7
                Width = 262
                Height = 252
                Hint = 
                  '[['#13#10'center:parent xy |'#13#10'state-visible:empty-true ds:dsSearchMast' +
                  'er|'#13#10']]'#13#10
                ParentColor = False
                TabOrder = 2
                DesignSize = (
                  262
                  252)
                object imgNoRecords_dbgSearchCRUD: TUniLabel
                  Left = 22
                  Top = 0
                  Width = 200
                  Height = 200
                  Hint = '[['#13#10'center:parent xy'#13#10']]'#13#10
                  TextConversion = txtHTML
                  AutoSize = False
                  Caption = 
                    '<img id="norecimg" style="width:100%;height:100%;" class="img-re' +
                    'sponsive" src="files/images/not-found.jpg" alt="NoRec Img">'
                  Anchors = [akLeft, akRight, akBottom]
                  ParentFont = False
                  Font.Height = -27
                  Font.Name = 'Calibri'
                  Font.Style = [fsBold]
                  TabOrder = 1
                end
                object labNotFound_dbgSearchCRUD: TUniLabel
                  Left = 10
                  Top = 219
                  Width = 243
                  Height = 30
                  Hint = '[['#13#10'hide:mobile'#13#10']]'
                  Alignment = taCenter
                  TextConversion = txtHTML
                  AutoSize = False
                  Caption = 'No Records Found'
                  Anchors = [akLeft, akRight, akBottom]
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
        object tabRegister: TUniTabSheet
          Hint = ''
          Caption = 'Cadastro'
          Font.Height = -13
          Font.Name = 'Calibri'
          ParentFont = False
          object paBaseRegData1: TUniContainerPanel
            Left = 0
            Top = 0
            Width = 1361
            Height = 965
            Hint = ''
            ParentColor = False
            Align = alClient
            AutoScroll = True
            TabOrder = 0
            ScrollHeight = 965
            ScrollWidth = 1361
          end
        end
      end
      object paSearchFilters: TUniPanel
        Left = 1002
        Top = 4
        Width = 325
        Height = 433
        Hint = '[['#13#10'cls:shadow-obj-right'#13#10']]'
        Margins.Top = 0
        Margins.Right = 0
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        BorderStyle = ubsNone
        Title = 'Filtros da Pesquisa'
        Caption = ''
        CollapseDirection = cdLeft
        object UniScrollBox1: TUniScrollBox
          Left = 0
          Top = 4
          Width = 325
          Height = 433
          Hint = '[[anchor:]]'
          Margins.Left = 0
          Margins.Right = 0
          Color = 15724527
          TabOrder = 1
          ScrollDirection = sdVertical
          DesignSize = (
            306
            431)
          ScrollHeight = 746
          ScrollWidth = 164
          object paSearchFilterDate: TUniContainerPanel
            AlignWithMargins = True
            Left = 12
            Top = 567
            Width = 275
            Height = 60
            Hint = ''
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            ParentColor = False
            Color = 15724527
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DesignSize = (
              275
              60)
            object UniLabelFd1: TUniLabel
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 114
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'Filtrar Campo Data...'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object cbxSearchCRUDFieldDate: TUniComboBox
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 269
              Height = 29
              Hint = ''
              Margins.Right = 5
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
              IconItems = <>
              OnChange = cbxSearchCRUDFieldDateChange
            end
            object cbxSearchCRUDFieldDate_Fields: TUniComboBox
              AlignWithMargins = True
              Left = 42
              Top = 6
              Width = 145
              Height = 23
              Hint = ''
              Visible = False
              Text = ''
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 3
              IconItems = <>
            end
          end
          object paSearchFilter1: TUniContainerPanel
            AlignWithMargins = True
            Left = 12
            Top = 49
            Width = 275
            Height = 120
            Hint = ''
            Margins.Left = 10
            Margins.Top = 6
            Margins.Right = 0
            Margins.Bottom = 0
            ParentColor = False
            Color = 15724527
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            DesignSize = (
              275
              120)
            object paSearchOp1: TUniContainerPanel
              AlignWithMargins = True
              Left = 0
              Top = 59
              Width = 275
              Height = 60
              Hint = ''
              Margins.Left = 0
              Margins.Top = 8
              Margins.Bottom = 0
              ParentColor = False
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              DesignSize = (
                275
                60)
              object UniLabelp1: TUniLabel
                AlignWithMargins = True
                Left = 3
                Top = 1
                Width = 53
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Operador'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object cbxSearchCRUDOpt1: TUniComboBox
                AlignWithMargins = True
                Left = 3
                Top = 21
                Width = 269
                Height = 29
                Hint = ''
                Margins.Left = 5
                Margins.Right = 4
                Text = ''
                Items.Strings = (
                  'Maior que'
                  'Menor que'
                  'Maior ou igual a'
                  'Menor ou igual a'
                  'Come'#231'a com'
                  'Termina com'
                  'Cont'#233'm'
                  'Igual a')
                ItemIndex = 6
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
                IconItems = <>
              end
            end
            object paSearchField1: TUniContainerPanel
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 275
              Height = 60
              Hint = ''
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              ParentColor = False
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              DesignSize = (
                275
                60)
              object cbxSearchCRUDField1: TUniComboBox
                AlignWithMargins = True
                Left = 3
                Top = 22
                Width = 269
                Height = 29
                Hint = ''
                Margins.Right = 5
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
                IconItems = <>
                OnChange = cbxSearchCRUDField1Change
              end
              object cbxSearchCRUDField1_Fields: TUniComboBox
                AlignWithMargins = True
                Left = 68
                Top = 10
                Width = 76
                Height = 23
                Hint = ''
                Visible = False
                Text = ''
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
                IconItems = <>
              end
              object UniLabelc1: TUniLabel
                AlignWithMargins = True
                Left = 3
                Top = 1
                Width = 107
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Campo de pesquisa'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 3
              end
            end
          end
          object paSearchContent1: TUniContainerPanel
            AlignWithMargins = True
            Left = 12
            Top = 169
            Width = 275
            Height = 60
            Hint = ''
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            ParentColor = False
            Color = 15724527
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            DesignSize = (
              275
              60)
            object UniLabelv1: TUniLabel
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 122
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'Conte'#250'do da Pesquisa'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object edSearchCRUD1: TUniEdit
              AlignWithMargins = True
              Left = 2
              Top = 21
              Width = 269
              Height = 29
              Hint = ''
              Margins.Right = 5
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              ClearButton = True
            end
          end
          object paSearchFilter2: TUniContainerPanel
            AlignWithMargins = True
            Left = 11
            Top = 327
            Width = 275
            Height = 121
            Hint = ''
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            ParentColor = False
            Color = 15724527
            AlignmentControl = uniAlignmentClient
            ParentAlignmentControl = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            DesignSize = (
              275
              121)
            object paSearchField2: TUniContainerPanel
              AlignWithMargins = True
              Left = 3
              Top = 0
              Width = 275
              Height = 60
              Hint = ''
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              ParentColor = False
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              DesignSize = (
                275
                60)
              object UniLabelc2: TUniLabel
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 107
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Campo de pesquisa'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object cbxSearchCRUDField2: TUniComboBox
                AlignWithMargins = True
                Left = 0
                Top = 22
                Width = 269
                Height = 29
                Hint = ''
                Margins.Right = 5
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
                IconItems = <>
                OnChange = cbxSearchCRUDField2Change
              end
              object cbxSearchCRUDField2_Fields: TUniComboBox
                AlignWithMargins = True
                Left = 65
                Top = 3
                Width = 76
                Height = 23
                Hint = ''
                Visible = False
                Text = ''
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 3
                IconItems = <>
              end
            end
            object paSearchOp2: TUniContainerPanel
              AlignWithMargins = True
              Left = 0
              Top = 60
              Width = 275
              Height = 60
              Hint = ''
              Margins.Left = 0
              Margins.Top = 8
              Margins.Bottom = 0
              ParentColor = False
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              DesignSize = (
                275
                60)
              object UniLabelp2: TUniLabel
                AlignWithMargins = True
                Left = 3
                Top = 1
                Width = 53
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Operador'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object cbxSearchCRUDOpt2: TUniComboBox
                AlignWithMargins = True
                Left = 3
                Top = 22
                Width = 269
                Height = 29
                Hint = ''
                Margins.Right = 4
                Text = ''
                Items.Strings = (
                  'Maior que'
                  'Menor que'
                  'Maior ou igual a'
                  'Menor ou igual a'
                  'Come'#231'a com'
                  'Termina com'
                  'Cont'#233'm'
                  'Igual a')
                ItemIndex = 6
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
                IconItems = <>
              end
            end
          end
          object paSearchContent2: TUniContainerPanel
            AlignWithMargins = True
            Left = 11
            Top = 448
            Width = 275
            Height = 60
            Hint = ''
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            ParentColor = False
            Color = 15724527
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            DesignSize = (
              275
              60)
            object UniLabelv2: TUniLabel
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 122
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'Conte'#250'do da Pesquisa'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object edSearchCRUD2: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 23
              Width = 269
              Height = 29
              Hint = ''
              Margins.Right = 5
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              ClearButton = True
            end
          end
          object paSearchFilterAndOr: TUniContainerPanel
            AlignWithMargins = True
            Left = 12
            Top = 267
            Width = 275
            Height = 60
            Hint = ''
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            ParentColor = False
            Color = 15724527
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            object paSearchFilterDescendent: TUniContainerPanel
              AlignWithMargins = True
              Left = 3
              Top = 0
              Width = 269
              Height = 60
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Align = alClient
              TabOrder = 1
              object cbxAndOr: TUniCheckBox
                Left = 0
                Top = 20
                Width = 156
                Height = 21
                Hint = ''
                Margins.Left = 4
                Caption = 'Condi'#231#227'o OU ...'
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 1
                OnChange = cbxAndOrChange
              end
            end
          end
          object labTitleSearch: TUniLabel
            AlignWithMargins = True
            Left = 14
            Top = 10
            Width = 292
            Height = 23
            Hint = ''
            Margins.Left = 14
            Margins.Top = 10
            Margins.Right = 0
            Margins.Bottom = 10
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Pesquisar Registro(s)'
            Align = alTop
            ParentFont = False
            Font.Color = clGray
            Font.Height = -19
            Font.Name = 'Calibri Light'
            ParentColor = False
            Color = clSilver
            TabOrder = 6
          end
          object paSearchFilterPeriod: TUniContainerPanel
            AlignWithMargins = True
            Left = 11
            Top = 509
            Width = 275
            Height = 60
            Hint = ''
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            ParentColor = False
            Color = 15724527
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
            DesignSize = (
              275
              60)
            object UniLabelPd1: TUniLabel
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 113
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'Per'#237'odo Pr'#233'-Definido'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object cbxSearchCRUDPeriod: TUniComboBox
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 269
              Height = 29
              Hint = ''
              Margins.Right = 5
              Text = ''
              Items.Strings = (
                ''
                'Hoje'
                'Ontem'
                'Antes de Ontem'
                'Amanh'#227
                'Depois de Amanh'#227
                'Essa Semana'
                'Semana Passada'
                'Pr'#243'xima Semana'
                'Essa Quinzena'
                'Quinzena Passada'
                'Pr'#243'xima Quinzena'
                'Esse M'#234's'
                'M'#234's Passado'
                'Pr'#243'ximo M'#234's'
                'Nesse Bimestre'
                'Nesse Trimestre'
                'Nesse Semestre'
                'Nesse Ano'
                'Ano Passado'
                'Processar Tudo'
                'Processar Tudo: At'#233' Hoje')
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
              IconItems = <>
              OnChange = cbxSearchCRUDPeriodChange
            end
          end
          object paSearchFilterPeriodSelect: TUniContainerPanel
            AlignWithMargins = True
            Left = 11
            Top = 630
            Width = 275
            Height = 60
            Hint = ''
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            ParentColor = False
            Color = 15724527
            AlignmentControl = uniAlignmentClient
            ParentAlignmentControl = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
            DesignSize = (
              275
              60)
            object paSearchFilterDtIni: TUniContainerPanel
              AlignWithMargins = True
              Left = 3
              Top = 0
              Width = 135
              Height = 60
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              TabOrder = 1
              object UniLabelDtIni: TUniLabel
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 65
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Data Inicial'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object edSearchCRUDDtIni: TUniDateTimePicker
                AlignWithMargins = True
                Left = 0
                Top = 22
                Width = 130
                Height = 29
                Hint = ''
                Margins.Right = 5
                DateTime = 43597.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                TabOrder = 2
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
              end
            end
            object paSearchFilterDtEnd: TUniContainerPanel
              AlignWithMargins = True
              Left = 139
              Top = 0
              Width = 135
              Height = 60
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Anchors = [akTop, akRight]
              TabOrder = 2
              object UniLabelDtEnd: TUniLabel
                AlignWithMargins = True
                Left = 3
                Top = 1
                Width = 57
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Data Final'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object edSearchCRUDDtEnd: TUniDateTimePicker
                AlignWithMargins = True
                Left = 3
                Top = 22
                Width = 130
                Height = 29
                Hint = ''
                Margins.Right = 5
                DateTime = 43597.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                TabOrder = 2
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
              end
            end
          end
          object paSearchBtn: TUniContainerPanel
            AlignWithMargins = True
            Left = 36
            Top = 710
            Width = 128
            Height = 36
            Hint = '[[center:parent x]]'
            Margins.Left = 10
            Margins.Top = 12
            Margins.Right = 0
            Margins.Bottom = 0
            ParentColor = False
            Color = 15724527
            TabOrder = 9
            object btnSearchCRUD: TUniBitBtn
              AlignWithMargins = True
              Left = 64
              Top = 2
              Width = 62
              Height = 30
              Hint = '[['#13#10'cls:ButtonThemeCrud-no-border-left |'#13#10'ico:fas-search |'#13#10']]'
              Margins.Left = 6
              Margins.Top = 4
              Margins.Right = 6
              Margins.Bottom = 4
              Caption = '@'
              ParentFont = False
              Font.Height = -16
              Font.Name = 'Calibri'
              TabOrder = 1
              ScreenMask.Enabled = True
              ScreenMask.Target = Owner
              OnClick = btnSearchCRUDClick
            end
            object btnSearchMoreFilters: TUniBitBtn
              AlignWithMargins = True
              Left = 1
              Top = 2
              Width = 62
              Height = 30
              Hint = '[['#13#10'ico:fas-filter |'#13#10'cls:ButtonThemeCrud-no-border-right'#13#10']]'
              Margins.Left = 6
              Margins.Top = 4
              Margins.Right = 6
              Margins.Bottom = 4
              Caption = '+ ...'
              ParentFont = False
              Font.Height = -16
              Font.Name = 'Calibri'
              TabOrder = 2
              OnClick = btnSearchMoreFiltersClick
            end
          end
        end
      end
      object paSearchFiltersCustom: TUniPanel
        Left = 1002
        Top = 457
        Width = 325
        Height = 433
        Hint = '[['#13#10'cls:shadow-obj-right'#13#10']]'
        Margins.Top = 0
        Margins.Right = 0
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        BorderStyle = ubsNone
        Title = 'Filtros da Pesquisa'
        Caption = ''
        CollapseDirection = cdLeft
        object sboxSearchFiltersCustom: TUniScrollBox
          AlignWithMargins = True
          Left = 0
          Top = 3
          Width = 325
          Height = 383
          Hint = '[[anchor:]]'
          Margins.Left = 0
          Margins.Right = 0
          Align = alClient
          Color = 15724527
          TabOrder = 1
          ScrollDirection = sdVertical
          ScrollHeight = 33
          object labTitleSearchCustom: TUniLabel
            AlignWithMargins = True
            Left = 14
            Top = 10
            Width = 309
            Height = 23
            Hint = ''
            Margins.Left = 14
            Margins.Top = 10
            Margins.Right = 0
            Margins.Bottom = 10
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Pesquisar Registro(s)'
            Align = alTop
            ParentFont = False
            Font.Color = clGray
            Font.Height = -19
            Font.Name = 'Calibri Light'
            ParentColor = False
            Color = clSilver
            TabOrder = 0
          end
        end
        object paSearchBtnCustom: TUniContainerPanel
          Left = 0
          Top = 389
          Width = 325
          Height = 44
          Hint = '[[center:parent x]]'
          Margins.Left = 10
          Margins.Top = 12
          Margins.Right = 0
          Margins.Bottom = 0
          ParentColor = False
          Color = 15724527
          Align = alBottom
          TabOrder = 2
          object btnSearchCRUDCustom: TUniBitBtn
            AlignWithMargins = True
            Left = 204
            Top = 1
            Width = 50
            Height = 30
            Hint = '[['#13#10'cls:ButtonThemeCrud-no-border-right |'#13#10'ico:fas-search |'#13#10']]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = '@'
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 1
            OnClick = btnSearchCRUDCustomClick
          end
          object labAndOrSearch: TUniLabel
            Left = 70
            Top = 7
            Width = 31
            Height = 15
            Hint = ''
            Caption = ' AND '
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 2
          end
          object labSwtAndOr: TUniLabel
            Left = 21
            Top = 0
            Width = 33
            Height = 24
            Hint = '[[bsswt:0]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Opt1'
            ParentFont = False
            Font.Height = -20
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 3
            OnClick = labSwtAndOrClick
          end
          object btnSearchCRUDCustomClear: TUniBitBtn
            AlignWithMargins = True
            Left = 251
            Top = 1
            Width = 50
            Height = 30
            Hint = '[['#13#10'cls:ButtonThemeCrud-no-border-left |'#13#10'ico:fas-times |'#13#10']]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = 'X'
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 4
            OnClick = btnSearchCRUDCustomClearClick
          end
        end
      end
    end
  end
  inherited htmlFrame: TUniHTMLFrame
    Left = 11
    Top = 3
    Width = 15
    ExplicitLeft = 11
    ExplicitTop = 3
    ExplicitWidth = 15
  end
  object ed_Table_ItemSel: TUniEdit [2]
    Left = 3
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 2
  end
  object ed_FormOrigin: TUniEdit [3]
    Left = 20
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 3
  end
  object ed_FormOrigin_Tab: TUniEdit [4]
    Left = 36
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 4
  end
  object ed_Table_Status: TUniEdit [5]
    Left = 53
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 5
  end
  object ed_Order_Search: TUniEdit [6]
    Left = 70
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 6
  end
  object ed_Where_Search: TUniEdit [7]
    Left = 86
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 7
  end
  object ed_CodMaster: TUniEdit [8]
    Left = 100
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 8
  end
  object ed_PK: TUniEdit [9]
    Left = 114
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 9
  end
  object ed_FieldMasks: TUniEdit [10]
    Left = 127
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 10
  end
  object ed_OldPKValue: TUniEdit [11]
    Left = 142
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 11
  end
  object ed_Table_Status_OLD: TUniEdit [12]
    Left = 155
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 12
  end
  object ed_GenNextID_OnNew: TUniEdit [13]
    Left = 169
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 14
  end
  object ed_AskNewRec_AfterPost: TUniEdit [14]
    Left = 182
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 13
  end
  object dbgExport: TUniDBGrid [15]
    Left = 197
    Top = -2
    Width = 15
    Height = 22
    Hint = ''
    DataSource = dsSearchMaster
    WebOptions.Paged = False
    WebOptions.PageSize = 10000
    WebOptions.FetchAll = True
    LoadMask.ShowMessage = False
    LoadMask.Message = 'Loading data...'
    TabOrder = 15
    Exporter.Enabled = True
  end
  object ed_PKS: TUniEdit [16]
    Left = 212
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 16
  end
  object ed_OLDPKS: TUniEdit [17]
    Left = 224
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 17
  end
  object ed_Table_Deleted_Field: TUniEdit [18]
    Left = 238
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 18
  end
  object ed_GroupBy_Search: TUniEdit [19]
    Left = 250
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 19
  end
  object ed_Having_Search: TUniEdit [20]
    Left = 264
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 20
  end
  object hpForActionBtns: TUniHiddenPanel [21]
    Left = 470
    Top = 0
    Width = 176
    Height = 82
    Hint = ''
    Visible = True
  end
  object ed_NoGenID: TUniEdit [22]
    Left = 173
    Top = 0
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 22
  end
  object ed_PK_ZerosLeft: TUniEdit [23]
    Left = 175
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 23
  end
  object ed_HideMaskOff: TUniEdit [24]
    Left = 278
    Top = -2
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 24
  end
  object edSearchFilter: TUniEdit [25]
    Left = 280
    Top = -16
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 25
  end
  object dsMaster: TDataSource
    AutoEdit = False
    DataSet = sqlMaster
    OnStateChange = dsMasterStateChange
    OnDataChange = dsMasterDataChange
    Left = 924
    Top = 351
  end
  object dsSearchMaster: TDataSource
    AutoEdit = False
    DataSet = sqlSearchMaster
    OnStateChange = dsSearchMasterStateChange
    Left = 924
    Top = 495
  end
  object sqlSearchMaster: TFDQuery
    BeforeDelete = sqlSearchMasterBeforeDelete
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evItems, evRowsetSize, evRecordCountMode, evUnidirectional, evCursorKind]
    FetchOptions.RowsetSize = 25
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime, fvFmtDisplayDate, fvFmtDisplayNumeric, fvStrsTrim2Len]
    OnError = sqlSearchMasterError
    SQL.Strings = (
      '')
    Left = 927
    Top = 449
  end
  object sqlMaster: TFDQuery
    BeforePost = sqlMasterBeforePost
    BeforeDelete = sqlMasterBeforeDelete
    CachedUpdates = True
    Connection = mm.SQLConn
    SchemaAdapter = FDSchemaAdapter1
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    OnError = sqlMasterError
    Left = 929
    Top = 303
  end
  object popMenuOptions: TUniPopupMenu
    Left = 922
    Top = 258
    object ExportarpraEXCEL1: TUniMenuItem
      Caption = 'Exportar Dados'
      object Excel1: TUniMenuItem
        Caption = 'Excel'
        OnClick = Excel1Click
      end
      object Excel2: TUniMenuItem
        Tag = 1
        Caption = 'Html'
        OnClick = Excel2Click
      end
      object Xml1: TUniMenuItem
        Tag = 2
        Caption = 'Xml'
        OnClick = Xml1Click
      end
      object Csv1: TUniMenuItem
        Caption = 'Csv'
        OnClick = Csv1Click
      end
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
  end
  object FDSchemaAdapter1: TFDSchemaAdapter
    AfterApplyUpdate = FDSchemaAdapter1AfterApplyUpdate
    Left = 926
    Top = 558
  end
end
