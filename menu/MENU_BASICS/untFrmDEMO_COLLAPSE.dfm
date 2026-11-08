object frmDEMO_COLLAPSE: TfrmDEMO_COLLAPSE
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
    ScrollHeight = 1032
    ScrollWidth = 909
    object rcBlock1: TUniContainerPanel
      Tag = 4
      Left = 25
      Top = 19
      Width = 746
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        746
        43)
      object UniLabel35: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 655
        Height = 31
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Collapse'
        Align = alLeft
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniBitBtn1: TUniBitBtn
        AlignWithMargins = True
        Left = 708
        Top = 4
        Width = 37
        Height = 36
        Hint = 
          '[['#13#10'ico:far-times-circle | '#13#10'cls:ButtonOutline ButtonOutlineRed ' +
          '| '#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'x'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = UniBitBtn1Click
      end
      object UniBitBtn2: TUniBitBtn
        Left = 546
        Top = 4
        Width = 75
        Height = 36
        Hint = '[['#13#10'cls:ButtonOutline ButtonOutlineGray |'#13#10']]'
        Caption = 'Toggle '
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = UniBitBtn2Click
      end
      object UniBitBtn2Clone: TUniBitBtn
        Left = 628
        Top = 4
        Width = 75
        Height = 36
        Hint = '[['#13#10'cls:ButtonOutline ButtonOutlineRed |'#13#10']]'
        Caption = 'Close'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = UniBitBtn2CloneClick
      end
    end
    object rcBlock5: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 31
      Top = 77
      Width = 474
      Height = 240
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp | ' +
        #13#10'cls:card-info-box-white |'#13#10'round:no | '#13#10']]'#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      AutoScroll = True
      TabOrder = 1
      ScrollHeight = 240
      ScrollWidth = 474
      object rcBlock20: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 251
        Height = 42
        Hint = '[['#13#10'cols:12 | '#13#10'noborder-all | '#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = 14802398
        TabOrder = 1
        DesignSize = (
          251
          42)
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 56
          Height = 19
          Cursor = crHandPoint
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Collapse'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = UniLabel1Click
        end
        object labRcCollapse24: TUniLabel
          Left = 218
          Top = 6
          Width = 10
          Height = 26
          Hint = 
            '[['#13#10'collapse:rcBlock5 off-parent collapsed:mobile icons:fas-plus' +
            ' fas-minus icons-color:color-green /*color-red*/|'#13#10'center:parent' +
            ' y'#13#10']]'#13#10
          TextConversion = txtHTML
          Caption = '^'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Calibri'
          ParentColor = False
          Color = clBlack
          TabOrder = 2
        end
      end
      object rcBlock25: TUniContainerPanel
        Tag = 1
        Left = 24
        Top = 64
        Width = 70
        Height = 60
        Hint = '[[cols:xs-6 sm-6 md-2 ]]'
        ParentColor = False
        TabOrder = 2
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
      object rcBlock30: TUniContainerPanel
        Tag = 1
        Left = 107
        Top = 64
        Width = 70
        Height = 60
        Hint = '[[cols:xs-6 sm-6 md-2 ]]'#13#10
        ParentColor = False
        TabOrder = 3
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
      object rcBlock35: TUniContainerPanel
        Tag = 1
        Left = 193
        Top = 63
        Width = 270
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-8 ]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          270
          60)
        object UUUniLabel7: TUniLabel
          Left = 0
          Top = -3
          Width = 41
          Height = 18
          Hint = '[['#13#10'ico:fas-mouse|'#13#10'cls:align-label-left|'#13#10'append'#13#10']]'
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
          Width = 270
          Height = 38
          Hint = '[['#13#10'cls:rc-edit-date-trigger|'#13#10']]'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          InputMask.Mask = '99.999.999/9999-99'
        end
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 4
      Left = 28
      Top = 345
      Width = 746
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 2
      object UniLabel35Clone: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 655
        Height = 31
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Accordion'
        Align = alLeft
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock50: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 25
      Top = 421
      Width = 884
      Height = 186
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp |'#13 +
        #10'round:no | '#13#10'cls:card-info-box-white |'#13#10'/*noborder-left:mobile|' +
        '*/'#13#10'/*noborder-right:mobile|*/'#13#10']]'#13#10#13#10#13#10#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 3
      object rcBlock60: TUniContainerPanel
        Tag = 1
        Left = 11
        Top = 53
        Width = 100
        Height = 60
        Hint = '[['#13#10'cols:xs-6 sm-6 md-2 lg-2 xl-2 |'#13#10']]'#13#10#13#10#13#10
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          100
          60)
        object edCodigoClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 100
          Height = 38
          Hint = 
            '[['#13#10'state-font-color:i-[[EDIT_COLOR_READONLY]] e-[[EDIT_FONT_COL' +
            'OR]] b-[[EDIT_FONT_COLOR]] '#13#10']]'#13#10#13#10#13#10
          DataField = 'codigo'
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
        object UniLabel3Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 38
          Height = 15
          Hint = ''
          Caption = 'C'#243'digo'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock70: TUniContainerPanel
        Tag = 1
        Left = 148
        Top = 52
        Width = 100
        Height = 60
        Hint = 
          '[['#13#10'cols:xs-6 sm-6 md-2 |'#13#10'state-color:i-clinfobk e-clskyblue b-' +
          'clbtnface |'#13#10']]'#13#10
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          100
          60)
        object labDtCadClone: TUniLabel
          Left = 2
          Top = 0
          Width = 79
          Height = 15
          Hint = 
            '[['#13#10'state-font-color:i-clred e-clwhite b-clblack |'#13#10'state-captio' +
            'n:i-Data Cadastro e-Data Edi'#231#227'o b-Data |'#13#10']]'#13#10#13#10
          Caption = 'Data Cadastro'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edDtCadClone: TUniDBDateTimePicker
          Left = 0
          Top = 21
          Width = 100
          Height = 38
          Hint = '[['#13#10'mask:date |'#13#10'valid:date notblank|'#13#10']]'#13#10#13#10#13#10
          DataField = 'dtcadastro'
          DateTime = 44279.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
        end
      end
      object rcBlock80: TUniContainerPanel
        Tag = 1
        Left = 288
        Top = 53
        Width = 100
        Height = 60
        Hint = 
          '[['#13#10'cols:xs-6 sm-6 md-2 lg-2 xl-2 |'#13#10'state-cls:i-rc-obj-float ]]' +
          #13#10
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          100
          60)
        object UniLabel5Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 93
          Height = 15
          Hint = ''
          Caption = 'Data Anivers'#225'rio'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edDtBirthdayClone: TUniDBDateTimePicker
          Left = 0
          Top = 21
          Width = 100
          Height = 38
          Hint = '[['#13#10'mask:date |'#13#10'state-enable:i-true e-false b-true |'#13#10']]'
          DataField = 'DTANIVERSARIO'
          DateTime = 44279.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
        end
      end
      object rcBlock90: TUniContainerPanel
        Tag = 1
        Left = 568
        Top = 52
        Width = 100
        Height = 60
        Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          100
          60)
        object UniLabel9Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 57
          Height = 15
          Hint = ''
          Caption = 'Cpf  / Cnpj'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edCnpjCpfClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 100
          Height = 38
          Hint = '[['#13#10'valid:cpfcnpj &edTipoPessoaClone="F J" |'#13#10'mask:cnpj'#13#10']]'
          DataField = 'CNPJ_CPF'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock100: TUniContainerPanel
        Tag = 1
        Left = 428
        Top = 52
        Width = 100
        Height = 60
        Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          100
          60)
        object UniLabel10Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 43
          Height = 15
          Hint = ''
          Caption = 'PF ou PJ'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edTipoPessoaClone: TUniDBComboBox
          Left = 0
          Top = 21
          Width = 100
          Height = 38
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          DataField = 'PESSOA'
          Items.Strings = (
            'F'#237'sica|F'
            'Jur'#237'dica|J')
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
          IconItems = <>
        end
      end
      object rcBlock110: TUniContainerPanel
        Tag = 1
        Left = 708
        Top = 52
        Width = 100
        Height = 60
        Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          100
          60)
        object UniLabel11Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 42
          Height = 15
          Hint = ''
          Caption = 'RG / I.E.'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniDBEdit2Clone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 100
          Height = 38
          Hint = ''
          DataField = 'CGF_RG'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock120: TUniContainerPanel
        Tag = 1
        Left = 36
        Top = 124
        Width = 376
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-6|'#13#10']]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          376
          60)
        object UniLabel6Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 90
          Height = 15
          Hint = ''
          Caption = 'Nome / Fantasia'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edCliNameClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 375
          Height = 38
          Hint = '[['#13#10'valid:blank=Nome Cliente|'#13#10'valid-required:top-in'#13#10']]'
          DataField = 'NOME'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock130: TUniContainerPanel
        Tag = 1
        Left = 455
        Top = 121
        Width = 376
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-6]]'
        ParentColor = False
        TabOrder = 8
        DesignSize = (
          376
          60)
        object UniLabel12Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 70
          Height = 15
          Hint = ''
          Caption = 'Raz'#227'o Social'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edRazSocClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 375
          Height = 38
          Hint = ''
          DataField = 'RAZSOC'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock55: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 884
        Height = 42
        Hint = 
          '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'noborder-right' +
          ' | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
        ParentColor = False
        Color = clSilver
        TabOrder = 9
        DesignSize = (
          884
          42)
        object labClient_01: TUniLabel
          Left = 850
          Top = 8
          Width = 10
          Height = 26
          Hint = '[['#13#10'collapse:rcBlock50 off-42 '#13#10']]'#13#10
          TextConversion = txtHTML
          Caption = '^'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Height = -21
          Font.Name = 'Calibri'
          ParentColor = False
          Color = clBlack
          TabOrder = 1
        end
        object UniLabel8Clone: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 87
          Height = 19
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Dados Gerais'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
    end
    object rcBlock140: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 25
      Top = 623
      Width = 884
      Height = 192
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp | ' +
        #13#10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'#13#10#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 4
      object rcBlock150: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 884
        Height = 42
        Hint = 
          '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'noborder-right' +
          ' | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
        ParentColor = False
        Color = clSilver
        TabOrder = 8
        DesignSize = (
          884
          42)
        object UniLabel2Clone: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 60
          Height = 19
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Endere'#231'o'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object labClient_02: TUniLabel
          Left = 850
          Top = 8
          Width = 10
          Height = 26
          Hint = '[['#13#10'collapse:rcBlock140 off-42 collapsed'#13#10']]'#13#10
          TextConversion = txtHTML
          Caption = '^'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Height = -21
          Font.Name = 'Calibri'
          ParentColor = False
          Color = clBlack
          TabOrder = 2
        end
      end
      object rcBlock160: TUniContainerPanel
        Tag = 1
        Left = 133
        Top = 61
        Width = 326
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-8]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          326
          60)
        object UniLabel4Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 50
          Height = 15
          Hint = ''
          Caption = 'Endere'#231'o'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniDBEdit4Clone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 325
          Height = 38
          Hint = ''
          DataField = 'ENDERECO'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock170: TUniContainerPanel
        Tag = 1
        Left = 484
        Top = 61
        Width = 100
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          100
          60)
        object UniLabel7Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 43
          Height = 15
          Hint = ''
          Caption = 'N'#250'mero'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniDBEdit5Clone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 100
          Height = 38
          Hint = ''
          DataField = 'NUMERO'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock180: TUniContainerPanel
        Tag = 1
        Left = 19
        Top = 125
        Width = 100
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          100
          60)
        object UniLabel13Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 14
          Height = 15
          Hint = ''
          Caption = 'UF'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edLkpUFSClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 100
          Height = 38
          Hint = '[[DESCRICAO CODIUF !]]'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
          Color = clInfoBk
          ReadOnly = True
          InputType = 'text'
        end
      end
      object rcBlock190: TUniContainerPanel
        Tag = 1
        Left = 140
        Top = 124
        Width = 326
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          326
          60)
        object UniLabel14Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 38
          Height = 15
          Hint = ''
          Caption = 'Cidade'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edLkpCIDADESClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 325
          Height = 38
          Hint = 
            '[['#13#10'DESCRICAO CODICIDADE @60 ! +modal searchall |'#13#10'lkpfilter:quo' +
            'ted(uf=edLkpUFSClone<text>) | /* uf='#39'CE'#39' */'#13#10'lkpfilter-empty:Sel' +
            'ecione uma UF<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-searchf' +
            'ields:codiibge |'#13#10'lkpfilter-gridattr: |'#13#10'valid:blank |'#13#10'valid-re' +
            'quired:top-in |'#13#10#13#10']]'#13#10
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
          Color = clInfoBk
          ReadOnly = True
          InputType = 'text'
        end
      end
      object rcBlock200: TUniContainerPanel
        Tag = 1
        Left = 613
        Top = 123
        Width = 229
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          229
          60)
        object UniLabel15Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 35
          Height = 15
          Hint = ''
          Caption = 'Bairro'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniDBEdit6Clone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 229
          Height = 38
          Hint = ''
          DataField = 'BAIRRO'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock155: TUniContainerPanel
        Tag = 1
        Left = 12
        Top = 61
        Width = 100
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          100
          60)
        object UniLabel16Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 20
          Height = 15
          Hint = ''
          Caption = 'Cep'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edCepClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 100
          Height = 38
          Hint = '[[mask:cep]]'
          DataField = 'CEP'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock195: TUniContainerPanel
        Tag = 1
        Left = 495
        Top = 125
        Width = 100
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          100
          60)
        object UniLabel18Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 52
          Height = 15
          Hint = ''
          Caption = 'C'#243'd. IBGE'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edLkpCIDADES_SetDS_CODIIBGEClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 100
          Height = 38
          Hint = '[[ saveto: ]]'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
    end
    object rcBlock210: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 20
      Top = 840
      Width = 884
      Height = 192
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp | ' +
        #13#10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'#13#10#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 5
      object rcBlock220: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 884
        Height = 42
        Hint = 
          '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'noborder-right' +
          ' | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
        ParentColor = False
        Color = clSilver
        TabOrder = 8
        DesignSize = (
          884
          42)
        object UniLabel2CloneClone: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 60
          Height = 19
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Endere'#231'o'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object labClient_03: TUniLabel
          Left = 850
          Top = 8
          Width = 10
          Height = 26
          Hint = '[['#13#10'collapse:rcBlock210 off-42 collapsed'#13#10']]'#13#10
          TextConversion = txtHTML
          Caption = '^'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Height = -21
          Font.Name = 'Calibri'
          ParentColor = False
          Color = clBlack
          TabOrder = 2
        end
      end
      object rcBlock230: TUniContainerPanel
        Tag = 1
        Left = 133
        Top = 61
        Width = 326
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-8]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          326
          60)
        object UniLabel4CloneClone: TUniLabel
          Left = 0
          Top = 0
          Width = 50
          Height = 15
          Hint = ''
          Caption = 'Endere'#231'o'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniDBEdit4CloneClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 325
          Height = 38
          Hint = ''
          DataField = 'ENDERECO'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock240: TUniContainerPanel
        Tag = 1
        Left = 484
        Top = 61
        Width = 100
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          100
          60)
        object UniLabel7CloneClone: TUniLabel
          Left = 0
          Top = 0
          Width = 43
          Height = 15
          Hint = ''
          Caption = 'N'#250'mero'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniDBEdit5CloneClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 100
          Height = 38
          Hint = ''
          DataField = 'NUMERO'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock250: TUniContainerPanel
        Tag = 1
        Left = 19
        Top = 125
        Width = 100
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          100
          60)
        object UniLabel13CloneClone: TUniLabel
          Left = 0
          Top = 0
          Width = 14
          Height = 15
          Hint = ''
          Caption = 'UF'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edLkpUFSCloneClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 100
          Height = 38
          Hint = '[[DESCRICAO CODIUF !]]'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
          Color = clInfoBk
          ReadOnly = True
          InputType = 'text'
        end
      end
      object rcBlock260: TUniContainerPanel
        Tag = 1
        Left = 140
        Top = 124
        Width = 326
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          326
          60)
        object UniLabel14CloneClone: TUniLabel
          Left = 0
          Top = 0
          Width = 38
          Height = 15
          Hint = ''
          Caption = 'Cidade'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edLkpCIDADESCloneClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 325
          Height = 38
          Hint = 
            '[['#13#10'DESCRICAO CODICIDADE @60 ! +modal searchall |'#13#10'lkpfilter:quo' +
            'ted(uf=edLkpUFSCloneClone<text>) | /* uf='#39'CE'#39' */'#13#10'lkpfilter-empt' +
            'y:Selecione uma UF<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-se' +
            'archfields:codiibge |'#13#10'lkpfilter-gridattr: |'#13#10'valid:blank |'#13#10'val' +
            'id-required:top-in |'#13#10#13#10']]'#13#10
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
          Color = clInfoBk
          ReadOnly = True
          InputType = 'text'
        end
      end
      object rcBlock270: TUniContainerPanel
        Tag = 1
        Left = 613
        Top = 123
        Width = 229
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          229
          60)
        object UniLabel15CloneClone: TUniLabel
          Left = 0
          Top = 0
          Width = 35
          Height = 15
          Hint = ''
          Caption = 'Bairro'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniDBEdit6CloneClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 229
          Height = 38
          Hint = ''
          DataField = 'BAIRRO'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock225: TUniContainerPanel
        Tag = 1
        Left = 12
        Top = 61
        Width = 100
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          100
          60)
        object UniLabel16CloneClone: TUniLabel
          Left = 0
          Top = 0
          Width = 20
          Height = 15
          Hint = ''
          Caption = 'Cep'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edCepCloneClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 100
          Height = 38
          Hint = '[[mask:cep]]'
          DataField = 'CEP'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock265: TUniContainerPanel
        Tag = 1
        Left = 495
        Top = 125
        Width = 100
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          100
          60)
        object UniLabel18CloneClone: TUniLabel
          Left = 0
          Top = 0
          Width = 52
          Height = 15
          Hint = ''
          Caption = 'C'#243'd. IBGE'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edLkpCIDADES_SetDS_CODIIBGECloneClone: TUniDBEdit
          Left = 0
          Top = 21
          Width = 100
          Height = 38
          Hint = '[[ saveto: ]]'
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
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
    Left = 922
    Top = 10
  end
end
