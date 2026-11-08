object frmBaseCRUD_2: TfrmBaseCRUD_2
  Left = 0
  Top = 0
  Width = 907
  Height = 689
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  Font.Height = -15
  Font.Name = 'Calibri'
  TabOrder = 0
  object paBaseBackGround: TUniContainerPanel
    Left = 3
    Top = 9
    Width = 899
    Height = 677
    Hint = '[['#13#10'round:all|'#13#10']]'
    ParentColor = False
    TabOrder = 23
    object paBaseTop: TUniContainerPanel
      Left = 5
      Top = 3
      Width = 847
      Height = 48
      Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'scale:parent w:100% |'#13#10']]'
      ParentColor = False
      TabOrder = 1
      object labExit: TUniLabel
        Left = 4
        Top = 8
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-sign-out-alt rc-mirror-h |'#13#10'center:parent y'#13#10']]'
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
        OnClick = labExitClick
      end
      object labTitleForm: TUniLabel
        Left = 45
        Top = 8
        Width = 87
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-26 |'#13#10'center:parent y'#13#10']]'#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        Caption = 'Title Form'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 2
      end
    end
    object sboxPg: TUniScrollBox
      Left = 5
      Top = 54
      Width = 891
      Height = 623
      Hint = 
        '[['#13#10'scrollbox:reset-off|'#13#10'align:paBaseTop b:0 l:0|'#13#10'scale:parent' +
        ' w:100% |'#13#10'scale:parent h:100%-top |'#13#10']]'
      TabOrder = 2
      ScrollHeight = 618
      ScrollWidth = 886
      object pgBaseCadControl: TUniPageControl
        Left = 6
        Top = 7
        Width = 880
        Height = 611
        Hint = '[[anchor:]]'
        ActivePage = tabRegister
        TabOrder = 0
        OnChangeValue = pgBaseCadControlChangeValue
        object tabSearch: TUniTabSheet
          Hint = ''
          Caption = 'tabSearch'
          object sboxTabSearch: TUniScrollBox
            Left = 0
            Top = 0
            Width = 872
            Height = 583
            Hint = ''
            Align = alClient
            TabOrder = 0
            ScrollHeight = 873
            ScrollWidth = 839
            object rcBlock5: TUniContainerPanel
              Left = 6
              Top = 12
              Width = 79
              Height = 40
              Hint = 
                '[['#13#10'cols-offset:15|'#13#10'cols:xs-3 sm-3 md-2|'#13#10'caption-hide:mobile|'#13 +
                #10']]'
              ParentColor = False
              TabOrder = 0
              DesignSize = (
                79
                40)
              object btnAddRec: TUniBitBtn
                AlignWithMargins = True
                Left = 3
                Top = 1
                Width = 76
                Height = 38
                Hint = 
                  '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'ico:fas-plus-circle | '#13#10'cls:ButtonBlue |' +
                  ' '#13#10'append |'#13#10'caption-hide:mobile'#13#10']]'#13#10#13#10
                Margins.Left = 6
                Margins.Top = 4
                Margins.Right = 6
                Margins.Bottom = 4
                Caption = 'Novo'
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 1
                OnClick = btnAddRecClick
              end
            end
            object rcBlock20: TUniContainerPanel
              Left = 274
              Top = 12
              Width = 96
              Height = 40
              Hint = 
                '[['#13#10'cols-offset:15|'#13#10'cols:xs-3 sm-3 md-2|'#13#10'caption-hide:mobile|'#13 +
                #10']]'
              ParentColor = False
              TabOrder = 1
              DesignSize = (
                96
                40)
              object btnMenuOptions: TUniMenuButton
                Left = 0
                Top = 1
                Width = 93
                Height = 38
                Hint = 
                  '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'ico:fas-cogs | '#13#10'cls:ButtonGreen rc-btn-' +
                  'menu-border-off rc-btn-menu-no-padding rc-btn-menu-border-focus-' +
                  'off| '#13#10'append |'#13#10'caption-hide:mobile'#13#10']]'#13#10#13#10
                Caption = 'Mais'
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 1
                OnClick = btnMenuOptionsClick
                ArrowClick = btnMenuOptionsClick
              end
            end
            object rcBlock30: TUniContainerPanel
              Left = 376
              Top = 12
              Width = 453
              Height = 40
              Hint = '[['#13#10'cols:xs-12 sm-12 md-4'#13#10']]'
              ParentColor = False
              TabOrder = 2
              DesignSize = (
                453
                40)
              object edQuickSearch: TUniEdit
                AlignWithMargins = True
                Left = 3
                Top = 1
                Width = 379
                Height = 38
                Hint = 
                  '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'cls:rc-edit-no-border-right rc-clear-btn' +
                  '-no-border-right|'#13#10']]'#13#10
                Margins.Right = 5
                CharCase = ecUpperCase
                Text = ''
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                TabStop = False
                EmptyText = 'Pesquisar Por...'
                ClearButton = True
              end
              object btnQuickSearch: TUniBitBtn
                AlignWithMargins = True
                Left = 382
                Top = 1
                Width = 37
                Height = 38
                Hint = 
                  '[['#13#10'align:edQuickSearch r:-3 t:0|'#13#10'cls:ButtonThemeCrud-no-border' +
                  '-left-right |'#13#10'ico:fas-search |'#13#10']]'
                Margins.Left = 6
                Margins.Top = 4
                Margins.Right = 6
                Margins.Bottom = 4
                Caption = '@'
                Anchors = [akTop, akRight]
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 2
                ScreenMask.Enabled = True
                ScreenMask.Target = Owner
                OnClick = btnQuickSearchClick
              end
              object btnAdvanceSearch: TUniBitBtn
                AlignWithMargins = True
                Left = 417
                Top = 1
                Width = 36
                Height = 38
                Hint = 
                  '[['#13#10'align:btnQuickSearch r:-2 t:0|'#13#10'cls:ButtonThemeCrud-no-borde' +
                  'r-left |'#13#10'ico:fas-search-plus |'#13#10']]'#13#10
                Margins.Left = 6
                Margins.Top = 4
                Margins.Right = 6
                Margins.Bottom = 4
                Caption = '@'
                Anchors = [akTop, akRight]
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 3
                OnClick = btnAdvanceSearchClick
              end
            end
            object rcBlock300: TUniContainerPanel
              Left = 6
              Top = 204
              Width = 252
              Height = 359
              Hint = 
                '[['#13#10'cols-offset:15|'#13#10'cols:xs-12 sm-12 md-2|'#13#10'state-visible:empty' +
                '-true ds:dsSearchMaster |'#13#10'hide:mobile disable'#13#10']]'
              ParentColor = False
              TabOrder = 3
              object rcBlock301: TUniContainerPanel
                Left = 3
                Top = 26
                Width = 240
                Height = 200
                Hint = '[['#13#10'cols:12|'#13#10'noborder-all|'#13#10'center:parent x'#13#10']]'
                ParentColor = False
                TabOrder = 1
                object labCrudIcon: TUniLabel
                  AlignWithMargins = True
                  Left = 3
                  Top = 5
                  Width = 234
                  Height = 192
                  Hint = 
                    '[['#13#10'/* cls:rc-label-clear| */'#13#10'/* ico:fas-users 2x| */'#13#10'ico-stac' +
                    'k:fas-users cls:color-silver size:1x |'#13#10'center:parent x|'#13#10#13#10']]'#13#10 +
                    #13#10#13#10#13#10
                  Margins.Top = 5
                  Alignment = taCenter
                  TextConversion = txtHTML
                  AutoSize = False
                  Caption = 'Users'
                  Align = alClient
                  ParentFont = False
                  Font.Color = clSilver
                  Font.Height = -48
                  Font.Name = 'Calibri'
                  Font.Style = [fsBold]
                  TabOrder = 1
                end
              end
            end
            object rcBlock310: TUniContainerPanel
              Left = 269
              Top = 204
              Width = 562
              Height = 359
              Hint = 
                '[['#13#10'cols-offset:15|'#13#10'cols:xs-12 sm-12 md-10|'#13#10'hr-childs:xs-exp s' +
                'm-exp md-exp |'#13#10'h-replicate:rcBlock300|'#13#10'state-visible:empty-tru' +
                'e ds:dsSearchMaster|'#13#10']]'#13#10
              ParentColor = False
              TabOrder = 4
              object rcBlock320: TUniContainerPanel
                Left = 8
                Top = 8
                Width = 122
                Height = 36
                Hint = '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'noborder-all'#13#10']]'
                ParentColor = False
                TabOrder = 1
                object labCrudTitleDetails: TUniLabel
                  Left = 6
                  Top = 4
                  Width = 87
                  Height = 26
                  Hint = 
                    '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'caption-dots:mobile-v-31 |'#13#10'center:paren' +
                    't y'#13#10']]'#13#10#13#10
                  Margins.Left = 8
                  Margins.Top = 8
                  Margins.Right = 0
                  Margins.Bottom = 4
                  TextConversion = txtHTML
                  Caption = 'Title Form'
                  ParentFont = False
                  Font.Color = clGray
                  Font.Height = -21
                  Font.Name = 'Calibri Light'
                  ParentColor = False
                  Color = clBtnFace
                  TabOrder = 1
                end
              end
              object rcBlock330: TUniContainerPanel
                Left = 8
                Top = 57
                Width = 525
                Height = 80
                Hint = 
                  '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'hr:65 off:0 mobile-v-125 mobile-h-7' +
                  '5 |'#13#10'noborder-left|'#13#10'noborder-right|'#13#10']]'#13#10
                ParentColor = False
                TabOrder = 2
                object labCrudAlertDetails: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 525
                  Height = 80
                  Hint = 
                    '[[ '#13#10'/* bsalert:info */'#13#10'rcalert:info alert-ico:fas-exclamation-' +
                    'circle '#13#10']]'#13#10
                  TextConversion = txtHTML
                  AutoSize = False
                  Caption = 
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ' +
                    'eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut e' +
                    'nim ad minim veniam, quis nostrud exercitation ullamco laboris n' +
                    'isi ut aliquip ex ea commodo consequat.'
                  Align = alClient
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  Font.Style = [fsBold]
                  TabOrder = 1
                end
              end
              object rcBlock340: TUniContainerPanel
                Left = 9
                Top = 152
                Width = 350
                Height = 36
                Hint = 
                  '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'noborder-left|'#13#10'noborder-right|'#13#10']' +
                  ']'
                ParentColor = False
                TabOrder = 3
                object labCrudTitleAddingDetails: TUniLabel
                  Left = 6
                  Top = 4
                  Width = 357
                  Height = 26
                  Hint = 
                    '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'caption-dots:mobile-v-31 |'#13#10'center:paren' +
                    't y'#13#10']]'#13#10#13#10
                  Margins.Left = 8
                  Margins.Top = 8
                  Margins.Right = 0
                  Margins.Bottom = 4
                  TextConversion = txtHTML
                  Caption = 'Adicionando Clientes voc'#234' ser'#225' capaz de...'
                  ParentFont = False
                  Font.Color = clGray
                  Font.Height = -21
                  Font.Name = 'Calibri Light'
                  ParentColor = False
                  Color = clBtnFace
                  TabOrder = 1
                end
              end
              object rcBlock350: TUniContainerPanel
                Left = 9
                Top = 205
                Width = 525
                Height = 85
                Hint = 
                  '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'hr:110 off:0 mobile-v-110 mobile-h-' +
                  '110 |'#13#10'noborder-left|'#13#10'noborder-right|'#13#10']]'
                ParentColor = False
                TabOrder = 4
                DesignSize = (
                  525
                  85)
                object labCrudAddingListDetails: TUniLabel
                  Left = 6
                  Top = 3
                  Width = 513
                  Height = 76
                  Hint = ''
                  TextConversion = txtHTML
                  AutoSize = False
                  Caption = 
                    '<span class="rc-dot bg-gray"></span>You will can be...;<br><br>'#13 +
                    #10'<span class="rc-dot bg-gray"></span>You will can be...;<br><br>' +
                    #13#10'<span class="rc-dot bg-gray"></span>You will can be...;<br><br' +
                    '>'#13#10'<span class="rc-dot bg-gray"></span>You will can be...;<br><b' +
                    'r>'#13#10
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  ParentFont = False
                  Font.Color = clGray
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  Font.Style = [fsBold]
                  TabOrder = 1
                end
              end
              object rcBlock360: TUniContainerPanel
                Left = 8
                Top = 308
                Width = 122
                Height = 40
                Hint = '[['#13#10'cols:xs-4 sm-4 md-3 |'#13#10'noborder-left|'#13#10'noborder-right'#13#10']]'
                ParentColor = False
                TabOrder = 5
                DesignSize = (
                  122
                  40)
                object btnCrudTutorial: TUniBitBtn
                  AlignWithMargins = True
                  Left = 0
                  Top = 1
                  Width = 119
                  Height = 38
                  Hint = 
                    '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'ico:fas-play-circle | '#13#10'cls:ButtonPurple' +
                    ' | '#13#10'append |'#13#10'caption-hide:mobile'#13#10']]'#13#10#13#10
                  Margins.Left = 6
                  Margins.Top = 4
                  Margins.Right = 6
                  Margins.Bottom = 4
                  Caption = 'Tutorial'
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
              end
              object rcBlock370: TUniContainerPanel
                Left = 137
                Top = 307
                Width = 122
                Height = 40
                Hint = 
                  '[['#13#10'cols:xs-4 sm-4 md-3 |'#13#10'state-visible:empty-true ds:dsIsEmpty' +
                  ' |'#13#10'noborder-left:mobile|'#13#10'noborder-right:mobile'#13#10']]'
                ParentColor = False
                TabOrder = 6
                DesignSize = (
                  122
                  40)
                object btnCrudAddFirst: TUniBitBtn
                  AlignWithMargins = True
                  Left = 1
                  Top = 1
                  Width = 119
                  Height = 38
                  Hint = 
                    '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'ico:fas-plus-circle | '#13#10'cls:ButtonGreen ' +
                    '| '#13#10'append |'#13#10'caption-hide:mobile'#13#10']]'#13#10#13#10
                  Margins.Left = 6
                  Margins.Top = 4
                  Margins.Right = 6
                  Margins.Bottom = 4
                  Caption = 'Cad. Primeiro'
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  TabOrder = 1
                  OnClick = btnAddRecClick
                end
              end
              object rcBlock380: TUniContainerPanel
                Left = 267
                Top = 305
                Width = 122
                Height = 40
                Hint = 
                  '[['#13#10'cols:xs-4 sm-4 md-3 |'#13#10'noborder-left:mobile|'#13#10'noborder-right' +
                  ':mobile|'#13#10']]'#13#10
                ParentColor = False
                TabOrder = 7
                DesignSize = (
                  122
                  40)
                object btnCrudImport: TUniBitBtn
                  AlignWithMargins = True
                  Left = 1
                  Top = 1
                  Width = 119
                  Height = 38
                  Hint = 
                    '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'ico:fas-cloud-upload-alt | '#13#10'cls:ButtonT' +
                    'hemeCrud | '#13#10'append |'#13#10'caption-hide:mobile'#13#10']]'#13#10#13#10
                  Margins.Left = 6
                  Margins.Top = 4
                  Margins.Right = 6
                  Margins.Bottom = 4
                  Caption = 'Importar'
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
              end
              object rcBlock390: TUniContainerPanel
                Left = 412
                Top = 302
                Width = 122
                Height = 40
                Hint = '[['#13#10'cols:xs-0 sm-0 md-3|'#13#10']]'
                ParentColor = False
                TabOrder = 8
              end
            end
            object rcBlock40: TUniContainerPanel
              Left = 6
              Top = 71
              Width = 825
              Height = 123
              Hint = 
                '[['#13#10'cols-offset:15|'#13#10'cols:xs-12 sm-12 md-12|'#13#10'cls:card-info-box-' +
                'white |'#13#10'round:no | '#13#10'hr-childs:xs-exp sm-exp md-exp |'#13#10']]'
              Enabled = False
              Visible = False
              ParentColor = False
              TabOrder = 5
              object rcBlock294: TUniContainerPanel
                Tag = 1
                Left = 8
                Top = 69
                Width = 122
                Height = 40
                Hint = '[['#13#10'cols:xs-3 sm-3 md-2|'#13#10'caption-hide:mobile'#13#10']]'
                ParentColor = False
                TabOrder = 1
                DesignSize = (
                  122
                  40)
                object btnSearchAdv: TUniBitBtn
                  AlignWithMargins = True
                  Left = 3
                  Top = 2
                  Width = 119
                  Height = 38
                  Hint = 
                    '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'ico:fas-search| '#13#10'cls:ButtonBlue rc-btn-' +
                    'font-14| '#13#10'caption-hide:mobile|'#13#10'append '#13#10']]'#13#10#13#10
                  Margins.Left = 6
                  Margins.Top = 4
                  Margins.Right = 6
                  Margins.Bottom = 4
                  Caption = 'Pesquisa'
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  TabOrder = 1
                  ScreenMask.Enabled = True
                  ScreenMask.Target = Owner
                  OnClick = btnSearchAdvClick
                end
              end
              object rcBlock296: TUniContainerPanel
                Left = 139
                Top = 70
                Width = 122
                Height = 40
                Hint = '[['#13#10'cols:xs-3 sm-3 md-2|'#13#10'caption-hide:mobile'#13#10']]'
                ParentColor = False
                TabOrder = 2
                DesignSize = (
                  122
                  40)
                object btnClearSearchAdv: TUniBitBtn
                  AlignWithMargins = True
                  Left = 3
                  Top = 2
                  Width = 119
                  Height = 38
                  Hint = 
                    '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'ico:fas-times | '#13#10'cls:ButtonOrange rc-bt' +
                    'n-font-14| '#13#10'caption-hide:mobile|'#13#10'append '#13#10']]'#13#10#13#10
                  Margins.Left = 6
                  Margins.Top = 4
                  Margins.Right = 6
                  Margins.Bottom = 4
                  Caption = 'Limpar'
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  TabOrder = 1
                  OnClick = btnClearSearchAdvClick
                end
              end
              object rcBlock297: TUniContainerPanel
                Left = 268
                Top = 70
                Width = 122
                Height = 40
                Hint = '[['#13#10'cols:xs-3 sm-3 md-3|'#13#10']]'
                ParentColor = False
                TabOrder = 3
                object labSwtAndOr: TUniLabel
                  Left = 3
                  Top = 8
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
                  TabOrder = 1
                  OnClick = labSwtAndOrClick
                end
                object labAndOrSearch: TUniLabel
                  Left = 54
                  Top = 13
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
              end
              object rcBlock298: TUniContainerPanel
                Left = 402
                Top = 72
                Width = 122
                Height = 40
                Hint = '[['#13#10'cols:xs-3 sm-3 md-5|'#13#10'hide:mobile disable'#13#10']]'
                ParentColor = False
                TabOrder = 4
              end
            end
            object rcBlock420: TUniContainerPanel
              Left = 7
              Top = 575
              Width = 832
              Height = 298
              Hint = 
                '[['#13#10'cols-offset:15|'#13#10'cols:xs-12 sm-12 md-12|'#13#10'cls:card-info-box-' +
                'white |'#13#10'state-visible:empty-false ds:dsSearchMaster|'#13#10'hr:parent' +
                '-top off:15 off-mobile-v-15 off-mobile-h-15 |'#13#10'min-height:270|'#13#10 +
                ']]'
              ParentColor = False
              TabOrder = 6
              object dbgSearchCRUD: TUniDBGrid
                Left = 18
                Top = 18
                Width = 327
                Height = 202
                Hint = ''
                DataSource = dsSearchMaster
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
                WebOptions.PageSize = 19
                WebOptions.FetchAll = True
                LoadMask.Message = 'Loading data...'
                Font.Height = -13
                Font.Name = 'Calibri'
                ParentFont = False
                TabOrder = 1
                Exporter.Enabled = True
                OnMouseDown = dbgSearchCRUDMouseDown
                OnCellClick = dbgSearchCRUDCellClick
                OnColumnSort = dbgSearchCRUDColumnSort
                OnDblClick = dbgSearchCRUDDblClick
                OnDrawColumnCell = dbgSearchCRUDDrawColumnCell
              end
            end
            object rcBlock10: TUniContainerPanel
              Left = 96
              Top = 12
              Width = 79
              Height = 40
              Hint = 
                '[['#13#10'cols-offset:15|'#13#10'cols:xs-3 sm-3 md-2|'#13#10'caption-hide:mobile|'#13 +
                #10']]'
              ParentColor = False
              TabOrder = 7
              DesignSize = (
                79
                40)
              object btnEditRec: TUniBitBtn
                AlignWithMargins = True
                Left = 1
                Top = 1
                Width = 76
                Height = 38
                Hint = 
                  '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'ico:fas-edit | '#13#10'cls:ButtonOrange | '#13#10'ap' +
                  'pend |'#13#10'state-enable:empty-false ds:dsSearchMaster |'#13#10'caption-hi' +
                  'de:mobile'#13#10']]'#13#10#13#10
                Margins.Left = 6
                Margins.Top = 4
                Margins.Right = 6
                Margins.Bottom = 4
                Caption = 'Editar'
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 1
                ScreenMask.Enabled = True
                ScreenMask.Target = Owner
                OnClick = btnEditRegClick
              end
            end
            object rcBlock15: TUniContainerPanel
              Left = 182
              Top = 12
              Width = 79
              Height = 40
              Hint = 
                '[['#13#10'cols-offset:15|'#13#10'cols:xs-3 sm-3 md-2|'#13#10'caption-hide:mobile|'#13 +
                #10']]'
              ParentColor = False
              TabOrder = 8
              DesignSize = (
                79
                40)
              object btnDelRec: TUniBitBtn
                AlignWithMargins = True
                Left = 1
                Top = 1
                Width = 76
                Height = 38
                Hint = 
                  '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'ico:fas-minus-circle | '#13#10'cls:ButtonRed |' +
                  ' '#13#10'append |'#13#10'state-enable:empty-false ds:dsSearchMaster |'#13#10'capti' +
                  'on-hide:mobile'#13#10']]'#13#10#13#10
                Margins.Left = 6
                Margins.Top = 4
                Margins.Right = 6
                Margins.Bottom = 4
                Caption = 'Excluir'
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 1
                OnClick = btnDeleteRegClick
              end
            end
          end
        end
        object tabRegister: TUniTabSheet
          Hint = ''
          Caption = 'tabRegister'
          object sboxTabReg: TUniScrollBox
            Left = 3
            Top = 69
            Width = 866
            Height = 502
            Hint = 
              '[['#13#10'scrollbox:reset-off|'#13#10'align:paBaseSaveCancel b:0 l:0|'#13#10'scale' +
              ':parent w:100% |'#13#10'scale:parent h:100%-top |'#13#10']]'
            TabOrder = 0
          end
          object paBaseSaveCancel: TUniContainerPanel
            Left = 0
            Top = 0
            Width = 872
            Height = 63
            Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'scale:parent w:100% |'#13#10']]'
            ParentColor = False
            TabOrder = 1
            object rcBlock430: TUniContainerPanel
              Tag = 1
              Left = 8
              Top = 13
              Width = 122
              Height = 40
              Hint = '[['#13#10'cols:xs-6 sm-6 md-2|'#13#10'caption-hide:mobile'#13#10']]'
              ParentColor = False
              TabOrder = 1
              DesignSize = (
                122
                40)
              object btnSaveRec: TUniBitBtn
                AlignWithMargins = True
                Left = 1
                Top = 1
                Width = 119
                Height = 38
                Hint = 
                  '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'ico:fas-check| '#13#10'cls:ButtonGreen rc-btn-' +
                  'font-14| '#13#10'append |'#13#10'state-enable:e-true i-true ds:dsMaster |'#13#10']' +
                  ']'#13#10#13#10#13#10#13#10
                Margins.Left = 6
                Margins.Top = 4
                Margins.Right = 6
                Margins.Bottom = 4
                Caption = 'Salvar'
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 1
                ScreenMask.Enabled = True
                ScreenMask.Target = Owner
                OnClick = btnSaveRegClick
              end
            end
            object rcBlock440: TUniContainerPanel
              Left = 139
              Top = 13
              Width = 122
              Height = 40
              Hint = '[['#13#10'cols:xs-6 sm-6 md-2|'#13#10'caption-hide:mobile'#13#10']]'
              ParentColor = False
              TabOrder = 2
              DesignSize = (
                122
                40)
              object btnCancelRec: TUniBitBtn
                AlignWithMargins = True
                Left = 1
                Top = 1
                Width = 119
                Height = 38
                Hint = 
                  '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'ico:fas-times | '#13#10'cls:ButtonOrange rc-bt' +
                  'n-font-14| '#13#10'append |'#13#10'state-enable:e-true i-true ds:dsMaster |'#13 +
                  #10']]'#13#10#13#10#13#10
                Margins.Left = 6
                Margins.Top = 4
                Margins.Right = 6
                Margins.Bottom = 4
                Caption = 'Cancelar'
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 1
                ScreenMask.Enabled = True
                ScreenMask.Target = Owner
                OnClick = btnCancelRegClick
              end
            end
          end
        end
      end
    end
  end
  object hpForActionBtns: TUniHiddenPanel
    Left = 15
    Top = 517
    Width = 176
    Height = 162
    Hint = ''
    Visible = True
    object btnDeleteReg: TUniBitBtn
      AlignWithMargins = True
      Left = 81
      Top = 4
      Width = 30
      Height = 30
      Hint = 
        '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
        #13#10']]'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '#'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 1
      ScaleButton = False
      OnClick = btnDeleteRegClick
    end
    object btnEditReg: TUniBitBtn
      AlignWithMargins = True
      Left = 44
      Top = 4
      Width = 30
      Height = 30
      Hint = 
        '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
        #13#10']]'
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
      OnClick = btnEditRegClick
    end
    object btnNewReg: TUniBitBtn
      AlignWithMargins = True
      Left = 7
      Top = 4
      Width = 30
      Height = 30
      Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '+'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 3
      ScaleButton = False
      OnClick = btnNewRegClick
    end
    object btnSaveReg: TUniBitBtn
      AlignWithMargins = True
      Left = 122
      Top = 2
      Width = 30
      Height = 30
      Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-check | '#13#10'cls-ico:font-black'#13#10']]'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'V'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 4
      ScaleButton = False
      OnClick = btnSaveRegClick
    end
    object btnCancelReg: TUniBitBtn
      AlignWithMargins = True
      Left = 120
      Top = 40
      Width = 30
      Height = 30
      Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-times | '#13#10'cls-ico:font-black'#13#10']]'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'X'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 5
      ScaleButton = False
      OnClick = btnCancelRegClick
    end
    object btnOptions: TUniBitBtn
      AlignWithMargins = True
      Left = 83
      Top = 40
      Width = 30
      Height = 30
      Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-bars | '#13#10'cls-ico:font-black'#13#10']]'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '='
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 6
      ScaleButton = False
    end
    object btnCloseForm: TUniBitBtn
      AlignWithMargins = True
      Left = 122
      Top = 76
      Width = 30
      Height = 30
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
      TabOrder = 7
      ScaleButton = False
    end
    object btnSearchCRUD: TUniBitBtn
      AlignWithMargins = True
      Left = 6
      Top = 40
      Width = 30
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
      TabOrder = 8
      OnClick = btnSearchCRUDClick
    end
    object btnSearch: TUniBitBtn
      AlignWithMargins = True
      Left = 44
      Top = 40
      Width = 30
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
      TabOrder = 9
      OnClick = btnSearchClick
    end
  end
  object ed_Table_ItemSel: TUniEdit
    Left = 3
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 0
  end
  object ed_FormOrigin: TUniEdit
    Left = 20
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 1
  end
  object ed_FormOrigin_Tab: TUniEdit
    Left = 36
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 2
  end
  object ed_Table_Status: TUniEdit
    Left = 53
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 3
  end
  object ed_Order_Search: TUniEdit
    Left = 70
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 4
  end
  object ed_Where_Search: TUniEdit
    Left = 86
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 5
  end
  object ed_CodMaster: TUniEdit
    Left = 100
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 6
  end
  object ed_PK: TUniEdit
    Left = 114
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 7
  end
  object ed_FieldMasks: TUniEdit
    Left = 127
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 8
  end
  object ed_OldPKValue: TUniEdit
    Left = 142
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 9
  end
  object ed_Table_Status_OLD: TUniEdit
    Left = 155
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 10
  end
  object ed_GenNextID_OnNew: TUniEdit
    Left = 169
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 11
  end
  object ed_AskNewRec_AfterPost: TUniEdit
    Left = 182
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 12
  end
  object dbgExport: TUniDBGrid
    Left = 197
    Top = -13
    Width = 15
    Height = 22
    Hint = ''
    DataSource = dsSearchMaster
    WebOptions.Paged = False
    WebOptions.PageSize = 10000
    WebOptions.FetchAll = True
    LoadMask.ShowMessage = False
    LoadMask.Message = 'Loading data...'
    TabOrder = 13
    Exporter.Enabled = True
  end
  object ed_PKS: TUniEdit
    Left = 212
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 14
  end
  object ed_OLDPKS: TUniEdit
    Left = 224
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 15
  end
  object ed_Table_Deleted_Field: TUniEdit
    Left = 238
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 16
  end
  object ed_GroupBy_Search: TUniEdit
    Left = 250
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 17
  end
  object ed_Having_Search: TUniEdit
    Left = 264
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 18
  end
  object ed_NoGenID: TUniEdit
    Left = 173
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 19
  end
  object ed_PK_ZerosLeft: TUniEdit
    Left = 175
    Top = -13
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 20
  end
  object ed_HideMaskOff: TUniEdit
    Left = 278
    Top = -18
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 21
  end
  object edSearchFilter: TUniEdit
    Left = 280
    Top = -16
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 24
  end
  object htmlFrame: TUniHTMLFrame
    Left = 3
    Top = -3
    Width = 15
    Height = 39
    Hint = ''
    Visible = False
  end
  object rcSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ImageIndex = 0
    Padding = 20
    FocusCancel = True
    Left = 507
    Top = 8
  end
  object popMenuOptions: TUniPopupMenu
    Left = 569
    Top = 4
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
    Left = 633
    Top = 7
  end
  object dsMaster: TDataSource
    AutoEdit = False
    DataSet = sqlMaster
    OnStateChange = dsMasterStateChange
    OnDataChange = dsMasterDataChange
    Left = 673
    Top = 9
  end
  object sqlSearchMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evItems, evRowsetSize, evRecordCountMode, evUnidirectional, evCursorKind]
    FetchOptions.RowsetSize = 25
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime, fvFmtDisplayDate, fvFmtDisplayNumeric, fvStrsTrim2Len]
    SQL.Strings = (
      '')
    Left = 741
    Top = 9
  end
  object dsSearchMaster: TDataSource
    AutoEdit = False
    DataSet = sqlSearchMaster
    OnStateChange = dsSearchMasterStateChange
    Left = 799
    Top = 11
  end
  object FDSchemaAdapter1: TFDSchemaAdapter
    AfterApplyUpdate = FDSchemaAdapter1AfterApplyUpdate
    Left = 865
    Top = 8
  end
  object sqlIsEmpty: TFDQuery
    BeforePost = sqlMasterBeforePost
    BeforeDelete = sqlMasterBeforeDelete
    CachedUpdates = True
    Connection = mm.SQLConn
    SchemaAdapter = FDSchemaAdapter1
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    OnError = sqlMasterError
    Left = 295
    Top = 11
  end
  object dsIsEmpty: TDataSource
    AutoEdit = False
    DataSet = sqlIsEmpty
    OnStateChange = dsMasterStateChange
    OnDataChange = dsMasterDataChange
    Left = 335
    Top = 13
  end
end
