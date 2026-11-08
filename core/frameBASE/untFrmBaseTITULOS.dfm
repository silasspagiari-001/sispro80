inherited frmBaseTITULOS: TfrmBaseTITULOS
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
        ActivePage = tabRegister
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
            object UniDBFormattedNumberEdit5: TUniDBEdit
              Left = 146
              Top = 433
              Width = 83
              Height = 29
              Hint = ''
              Visible = False
              DataField = 'KEY'
              DataSource = dsMaster
              TabOrder = 1
            end
            object rcBlock1: TUniContainerPanel
              Tag = 1
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 1361
              Height = 965
              Hint = 
                '[['#13#10'cols:12 | '#13#10'round:no | '#13#10'cls:card-info-box-white '#13#10'/* rc-no-' +
                'scrollbar-maincontainer */'#13#10']]'
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              ParentColor = False
              Color = clWhitesmoke
              Align = alClient
              TabOrder = 2
              object rcBlock2: TUniContainerPanel
                Left = 0
                Top = 0
                Width = 1361
                Height = 529
                Hint = '[[cols:xs-12 sm-12 md-12]]'
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                ParentColor = False
                Color = clWhitesmoke
                AlignmentControl = uniAlignmentClient
                ParentAlignmentControl = False
                TabOrder = 1
                DesignSize = (
                  1361
                  529)
                object rcBlock54: TUniContainerPanel
                  Tag = 1
                  Left = 706
                  Top = 15
                  Width = 112
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    112
                    48)
                  object rcDBComboBox50: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 19
                    Width = 106
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'SERIE'
                    DataSource = dsMaster
                    Style = csDropDownList
                    Items.Strings = (
                      'NFE'
                      'PED'
                      'NOC'
                      'CAR'
                      'DUP'
                      'PEC')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel7: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 27
                    Height = 15
                    Hint = ''
                    Caption = 'S'#233'rie'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock34: TUniContainerPanel
                  Tag = 1
                  Left = 463
                  Top = 15
                  Width = 142
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    142
                    48)
                  object UniDBEditnumero: TUniDBEdit
                    Tag = 1
                    Left = 2
                    Top = 19
                    Width = 139
                    Height = 29
                    Hint = ''
                    DataField = 'NUMERO'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    TabOrder = 1
                    Color = clSkyBlue
                  end
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 70
                    Height = 15
                    Hint = ''
                    Caption = 'Numero Doc.'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock4: TUniContainerPanel
                  Tag = 1
                  Left = 11
                  Top = 19
                  Width = 202
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    202
                    48)
                  object UniLabel8: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 39
                    Height = 15
                    Hint = ''
                    Caption = 'Pessoa'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpPESSOAS: TUniDBEdit
                    Left = 3
                    Top = 16
                    Width = 196
                    Height = 29
                    Hint = 
                      '[['#13#10'NOME PESSOA |'#13#10'lkpfilter-empty:Selecione uma Pessoa<translat' +
                      'e>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:blank |'#13#10'v' +
                      'alid-required:top-in |'#13#10']]'#13#10#13#10
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    InputType = 'text'
                  end
                end
                object rcBlock14: TUniContainerPanel
                  Tag = 1
                  Left = 224
                  Top = 16
                  Width = 121
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    121
                    48)
                  object UniEditCNPJ: TUniEdit
                    AlignWithMargins = True
                    Left = 2
                    Top = 18
                    Width = 114
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    Enabled = False
                    CharCase = ecUpperCase
                    Text = ''
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    TabStop = False
                    ReadOnly = True
                  end
                  object UniLabel10: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 48
                    Height = 15
                    Hint = ''
                    Caption = 'Cpf/Cnpj'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock24: TUniContainerPanel
                  Tag = 1
                  Left = 351
                  Top = 16
                  Width = 106
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    106
                    48)
                  object UniEditFONE: TUniEdit
                    AlignWithMargins = True
                    Left = 2
                    Top = 19
                    Width = 99
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    Enabled = False
                    CharCase = ecUpperCase
                    Text = ''
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    TabStop = False
                    ReadOnly = True
                  end
                  object UniLabel11: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 37
                    Height = 15
                    Hint = ''
                    Caption = 'Tel/Cel'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock84: TUniContainerPanel
                  Tag = 1
                  Left = 440
                  Top = 69
                  Width = 200
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    200
                    48)
                  object UniLabel18: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 40
                    Height = 15
                    Hint = ''
                    Caption = 'Bancos'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 0
                  end
                  object edLkpPORTADORES: TUniDBEdit
                    Left = 4
                    Top = 19
                    Width = 194
                    Height = 29
                    Hint = 
                      '[['#13#10'DESCRICAO PORTADOR|'#13#10'lkpfilter-empty:Selecione um Portador<t' +
                      'ranslate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:bla' +
                      'nk |'#13#10'valid-required:top-in |'#13#10']]'#13#10#13#10
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    InputType = 'text'
                  end
                end
                object rcBlock74: TUniContainerPanel
                  Tag = 1
                  Left = 226
                  Top = 70
                  Width = 200
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    200
                    48)
                  object UniLabel19: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 89
                    Height = 15
                    Hint = ''
                    Caption = 'Plano de Contas'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 0
                  end
                  object edLkpPLANOCONTAS: TUniDBEdit
                    Left = 1
                    Top = 18
                    Width = 196
                    Height = 29
                    Hint = 
                      '[['#13#10'DESCRICAO PLANOCONTAS |'#13#10'lkpfilter-empty:Selecione uma Plano' +
                      ' de Contas<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: ' +
                      '|'#13#10'valid:blank |'#13#10'valid-required:top-in |'#13#10']]'#13#10#13#10
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    InputType = 'text'
                  end
                end
                object rcBlock64: TUniContainerPanel
                  Tag = 1
                  Left = 14
                  Top = 73
                  Width = 200
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    200
                    48)
                  object UniLabel20: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 51
                    Height = 15
                    Hint = ''
                    Caption = 'Vendedor'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 0
                  end
                  object edLkpFUNCIONARIOS: TUniDBEdit
                    Left = 3
                    Top = 16
                    Width = 196
                    Height = 29
                    Hint = 
                      '[['#13#10'NOME FUNCIONARIO |'#13#10'lkpfilter-empty:Selecione uma Pessoa<tra' +
                      'nslate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:blank' +
                      ' |'#13#10'valid-required:top-in |'#13#10']]'#13#10#13#10
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    InputType = 'text'
                  end
                end
                object rcBlock88: TUniContainerPanel
                  Tag = 1
                  Left = 877
                  Top = 70
                  Width = 115
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    115
                    48)
                  object UniDBEdit6: TUniDBEdit
                    Left = 2
                    Top = 16
                    Width = 111
                    Height = 29
                    Hint = ''
                    DataField = 'PEDIDO'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel12: TUniLabel
                    Left = 6
                    Top = -1
                    Width = 38
                    Height = 15
                    Hint = ''
                    Caption = 'Pedido'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock106: TUniContainerPanel
                  Tag = 1
                  Left = 17
                  Top = 127
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    150
                    48)
                  object UniDBDateTimePicker1: TUniDBDateTimePicker
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 120
                    Height = 29
                    Hint = ''
                    DataField = 'EMISSAO'
                    DataSource = dsMaster
                    DateTime = 44554.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ClientEvents.ExtEvents.Strings = (
                      
                        'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                        '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                        '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                        ':"  /  /   "});'#13#10'}')
                  end
                  object UniLabel13: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 46
                    Height = 15
                    Hint = ''
                    Caption = 'Emiss'#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock126: TUniContainerPanel
                  Tag = 1
                  Left = 184
                  Top = 124
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 11
                  DesignSize = (
                    150
                    48)
                  object UniDBDateTimePicker2: TUniDBDateTimePicker
                    Left = 2
                    Top = 18
                    Width = 147
                    Height = 29
                    Hint = ''
                    DataField = 'VENCIMENTO'
                    DataSource = dsMaster
                    DateTime = 44554.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ClientEvents.ExtEvents.Strings = (
                      
                        'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                        '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                        '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                        ':"  /  /   "});'#13#10'}')
                  end
                  object UniLabel14: TUniLabel
                    Left = 6
                    Top = 1
                    Width = 63
                    Height = 15
                    Hint = ''
                    Caption = 'Vencimento'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock136: TUniContainerPanel
                  Tag = 1
                  Left = 364
                  Top = 123
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 12
                  DesignSize = (
                    150
                    48)
                  object UniDBDateTimePicker3: TUniDBDateTimePicker
                    Left = 2
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'PAGAMENTO'
                    DataSource = dsMaster
                    DateTime = 44554.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    ReadOnly = True
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clGray
                    ClientEvents.ExtEvents.Strings = (
                      
                        'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                        '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                        '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                        ':"  /  /   "});'#13#10'}')
                  end
                  object UniLabel15: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 61
                    Height = 15
                    Hint = ''
                    Caption = 'Pagamento'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock146: TUniContainerPanel
                  Tag = 1
                  Left = 749
                  Top = 123
                  Width = 90
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 13
                  DesignSize = (
                    90
                    48)
                  object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
                    Left = 2
                    Top = 18
                    Width = 83
                    Height = 29
                    Hint = ''
                    DataField = 'VALORORIGINAL'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel24: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 78
                    Height = 15
                    Hint = ''
                    Caption = 'Valor Original'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock58: TUniContainerPanel
                  Tag = 1
                  Left = 824
                  Top = 15
                  Width = 102
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 14
                  DesignSize = (
                    102
                    48)
                  object ContainerSituacao: TUniContainerPanel
                    Left = 1
                    Top = 19
                    Width = 99
                    Height = 29
                    Hint = '[[round:all]]'
                    ParentColor = False
                    Color = 13078040
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    object lbSituacao: TUniLabel
                      Left = 68
                      Top = 1
                      Width = 87
                      Height = 15
                      Hint = ''
                      Alignment = taCenter
                      AutoSize = False
                      Caption = 'All Rounded'
                      ParentFont = False
                      Font.Color = clWhite
                      Font.Height = -19
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                  end
                end
                object rcBlock44: TUniContainerPanel
                  Tag = 1
                  Left = 611
                  Top = 15
                  Width = 89
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 15
                  DesignSize = (
                    89
                    48)
                  object UniDBEdit3: TUniDBEdit
                    Tag = 1
                    Left = 3
                    Top = 16
                    Width = 84
                    Height = 29
                    Hint = ''
                    DataField = 'SEQUENCIA'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    TabOrder = 1
                    Color = clSkyBlue
                  end
                  object UniLabel2: TUniLabel
                    Left = 4
                    Top = -1
                    Width = 56
                    Height = 15
                    Hint = ''
                    Caption = 'Sequ'#234'ncia'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object edCodigo: TUniDBEdit
                  Left = 66
                  Top = 476
                  Width = 121
                  Height = 29
                  Hint = ''
                  Visible = False
                  DataField = 'CODIGO'
                  DataSource = dsMaster
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Color = clWhite
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  Font.Style = [fsBold]
                  TabOrder = 16
                  Color = clGray
                  ReadOnly = True
                end
                object rcBlock156: TUniContainerPanel
                  Tag = 1
                  Left = 902
                  Top = 124
                  Width = 86
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 17
                  DesignSize = (
                    86
                    48)
                  object UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 16
                    Width = 83
                    Height = 29
                    Hint = ''
                    DataField = 'VALORATUAL'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel3: TUniLabel
                    Left = 3
                    Top = 3
                    Width = 61
                    Height = 15
                    Hint = ''
                    Caption = 'Valor Atual'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock166: TUniContainerPanel
                  Tag = 1
                  Left = 11
                  Top = 201
                  Width = 952
                  Height = 124
                  Hint = '[[cols:xs-12 sm-12 md-12]]'
                  ParentColor = False
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 18
                  object rcBlock186: TUniContainerPanel
                    Tag = 1
                    Left = 545
                    Top = 3
                    Width = 406
                    Height = 114
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      406
                      114)
                    object rcBlock196: TUniContainerPanel
                      Tag = 1
                      Left = 14
                      Top = 3
                      Width = 107
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      DesignSize = (
                        107
                        48)
                      object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 15
                        Width = 102
                        Height = 29
                        Hint = ''
                        DataField = 'VALORDESCONTOS'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel21: TUniLabel
                        Left = 2
                        Top = -3
                        Width = 57
                        Height = 15
                        Hint = ''
                        Caption = 'Descontos'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock198: TUniContainerPanel
                      Tag = 1
                      Left = 255
                      Top = 3
                      Width = 148
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      DesignSize = (
                        148
                        48)
                      object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 18
                        Width = 143
                        Height = 29
                        Hint = ''
                        DataField = 'VALORJUROS'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel4: TUniLabel
                        Left = 7
                        Top = -3
                        Width = 29
                        Height = 15
                        Hint = ''
                        Caption = 'Juros'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock200: TUniContainerPanel
                      Tag = 1
                      Left = 60
                      Top = 57
                      Width = 343
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-12]]'
                      ParentColor = False
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 3
                      DesignSize = (
                        343
                        48)
                      object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                        Left = 2
                        Top = 19
                        Width = 340
                        Height = 29
                        Hint = ''
                        DataField = 'VALORPAGO'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        Color = clGray
                        ReadOnly = True
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel16: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 62
                        Height = 15
                        Hint = ''
                        Caption = 'Valor PAGO'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                  end
                  object rcBlock176: TUniContainerPanel
                    Tag = 1
                    Left = 1
                    Top = 3
                    Width = 534
                    Height = 114
                    Hint = '[[cols:xs-12 sm-12 md-8]]'
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      534
                      114)
                    object UniDBMemoobs: TUniDBMemo
                      AlignWithMargins = True
                      Left = 1
                      Top = 18
                      Width = 531
                      Height = 91
                      Hint = ''
                      DataField = 'OBSERVACOES'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel5: TUniLabel
                      Left = 10
                      Top = 0
                      Width = 71
                      Height = 15
                      Hint = ''
                      Caption = 'Observa'#231#245'es'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                end
                object rcBlock86: TUniContainerPanel
                  Tag = 1
                  Left = 749
                  Top = 69
                  Width = 91
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 19
                  DesignSize = (
                    91
                    48)
                  object UniLabel1: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 66
                    Height = 15
                    Hint = ''
                    Caption = '% Comiss'#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 19
                    Width = 90
                    Height = 29
                    Hint = ''
                    DataField = 'PERCCOMISSAO'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object UniDBEdit2: TUniDBEdit
                  Left = 283
                  Top = 450
                  Width = 96
                  Height = 29
                  Hint = ''
                  Visible = False
                  DataField = 'SITUACAO'
                  DataSource = dsMaster
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Color = clRed
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  Font.Style = [fsBold]
                  TabOrder = 20
                  Color = clGray
                  ReadOnly = True
                end
              end
            end
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
          ScrollHeight = 1061
          ScrollWidth = 164
          ScrollY = 315
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
            Top = -305
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
  inherited rcSweetAlert: TUniSweetAlert
    Left = 1204
    Top = 588
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
    AfterOpen = sqlMasterAfterOpen
    BeforePost = sqlMasterBeforePost
    BeforeDelete = sqlMasterBeforeDelete
    CachedUpdates = True
    Connection = mm.SQLConn
    SchemaAdapter = FDSchemaAdapter1
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    OnError = sqlMasterError
    SQL.Strings = (
      ''
      '')
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
