object frmCUSTOPRODUCAO: TfrmCUSTOPRODUCAO
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Custo da Produ'#231#227'o'
  ClientHeight = 564
  ClientWidth = 935
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  OnResize = UniFormResize
  OnShow = UniFormShow
  TextHeight = 15
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 935
    Height = 564
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollWidth = 43
    object UniContainerPanel14: TUniContainerPanel
      Left = 43
      Top = 0
      Width = 890
      Height = 562
      Hint = ''
      ParentColor = False
      Align = alClient
      TabOrder = 0
      object rcBlock20: TUniContainerPanel
        Left = 1
        Top = 2
        Width = 136
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          136
          48)
        object UniLabel3: TUniLabel
          Left = 1
          Top = -1
          Width = 38
          Height = 15
          Hint = ''
          Caption = 'C'#243'digo'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edCodigo: TUniDBEdit
          Left = 1
          Top = 17
          Width = 132
          Height = 29
          Hint = ''
          DataField = 'CODIGO'
          DataSource = dsMaster
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 2
          Color = clGray
          ReadOnly = True
        end
      end
      object rcBlock30: TUniContainerPanel
        Left = 140
        Top = 2
        Width = 136
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          136
          48)
        object UniLabel1: TUniLabel
          Left = 1
          Top = -1
          Width = 95
          Height = 15
          Hint = ''
          Caption = 'Data Lan'#231'amento'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniDBDateTimePicker2: TUniDBDateTimePicker
          Left = 0
          Top = 17
          Width = 134
          Height = 29
          Hint = ''
          DataField = 'EMISSAO'
          DataSource = dsMaster
          DateTime = 44561.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
      object rcBlock40: TUniContainerPanel
        Left = 280
        Top = 1
        Width = 603
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-8'#13#10']]'
        ParentColor = False
        TabOrder = 13
        DesignSize = (
          603
          48)
        object UniLabel13: TUniLabel
          Left = 1
          Top = -1
          Width = 58
          Height = 15
          Hint = ''
          Caption = 'C'#243'digo "P"'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniDBEdit3: TUniDBEdit
          Left = 1
          Top = 18
          Width = 602
          Height = 29
          Hint = ''
          DataField = 'CODIGOP'
          DataSource = dsMaster
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ReadOnly = True
          InputType = 'text'
        end
      end
      object UniContainerPanel15: TUniContainerPanel
        Left = 2
        Top = 113
        Width = 135
        Height = 27
        Hint = ''
        ParentColor = False
        Color = clMedGray
        TabOrder = 3
        object UniLabel6: TUniLabel
          Left = 2
          Top = 3
          Width = 130
          Height = 22
          Hint = ''
          Alignment = taCenter
          AutoSize = False
          Caption = 'INFORMA'#199#195'O'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object UniContainerPanel5: TUniContainerPanel
        Left = 2
        Top = 139
        Width = 135
        Height = 401
        Hint = ''
        ParentColor = False
        Color = clSkyBlue
        TabOrder = 4
        object UniDBMemoinformacao: TUniDBMemo
          Left = 0
          Top = 0
          Width = 135
          Height = 401
          Hint = '[[cls:monoCourier |'#13#10'theme-color:off]]'
          DataField = 'PAINEL_INFO'
          DataSource = dsMaster
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Height = -9
          Font.Name = 'Courier New'
          Align = alClient
          ReadOnly = True
          TabOrder = 1
          Color = clInfoBk
        end
      end
      object UniContainerPanel6: TUniContainerPanel
        Left = 142
        Top = 113
        Width = 437
        Height = 27
        Hint = ''
        ParentColor = False
        Color = clMedGray
        TabOrder = 5
        object UniLabel8: TUniLabel
          Left = 35
          Top = 3
          Width = 388
          Height = 22
          Hint = ''
          Alignment = taCenter
          AutoSize = False
          Caption = 'RESUMO DA PRODU'#199#195'O'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object UniContainerPanel7: TUniContainerPanel
        Left = 142
        Top = 139
        Width = 437
        Height = 401
        Hint = ''
        ParentColor = False
        Color = clSkyBlue
        TabOrder = 6
        object UniDBMemoresumoproducao: TUniDBMemo
          Left = 0
          Top = 0
          Width = 437
          Height = 401
          Hint = '[[cls:monoCourier]]'
          DataField = 'PAINEL_PRODUCAO'
          DataSource = dsMaster
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Height = -9
          Font.Name = 'Courier New'
          Align = alClient
          ReadOnly = True
          TabOrder = 1
        end
      end
      object UniContainerPanel8: TUniContainerPanel
        Left = 583
        Top = 113
        Width = 300
        Height = 27
        Hint = ''
        ParentColor = False
        Color = clMedGray
        TabOrder = 7
        object UniLabel9: TUniLabel
          Left = -24
          Top = 3
          Width = 321
          Height = 22
          Hint = ''
          Alignment = taCenter
          AutoSize = False
          Caption = 'TAXAS'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object UniContainerPanel9: TUniContainerPanel
        Left = 583
        Top = 186
        Width = 300
        Height = 137
        Hint = ''
        ParentColor = False
        Color = clSkyBlue
        TabOrder = 8
        object UniDBMemotaxas: TUniDBMemo
          Left = 0
          Top = 0
          Width = 300
          Height = 137
          Hint = '[[cls:monoCourier]]'
          DataField = 'PAINEL_TAXAS'
          DataSource = dsMaster
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Height = -9
          Font.Name = 'Courier New'
          Align = alClient
          ReadOnly = True
          TabOrder = 1
        end
      end
      object UniContainerPanel10: TUniContainerPanel
        Left = 583
        Top = 324
        Width = 300
        Height = 27
        Hint = ''
        ParentColor = False
        Color = clMedGray
        TabOrder = 9
        object UniLabel10: TUniLabel
          Left = 2
          Top = 3
          Width = 303
          Height = 22
          Hint = ''
          Alignment = taCenter
          AutoSize = False
          Caption = 'VENDAS'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object UniContainerPanel11: TUniContainerPanel
        Left = 583
        Top = 400
        Width = 300
        Height = 140
        Hint = ''
        ParentColor = False
        Color = clSkyBlue
        TabOrder = 10
        object UniDBMemovendas: TUniDBMemo
          Left = 0
          Top = 0
          Width = 300
          Height = 140
          Hint = '[[cls:monoCourier]]'
          DataField = 'PAINEL_VENDAS'
          DataSource = dsMaster
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Height = -9
          Font.Name = 'Courier New'
          Align = alClient
          ReadOnly = True
          TabOrder = 1
        end
      end
      object UniContainerPanel16: TUniContainerPanel
        Left = 583
        Top = 350
        Width = 300
        Height = 48
        Hint = ''
        ParentColor = False
        TabOrder = 11
        DesignSize = (
          300
          48)
        object UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit
          AlignWithMargins = True
          Left = 0
          Top = 17
          Width = 300
          Height = 29
          Hint = '[[theme-color:off]]'
          DataField = 'PERCVENDAPRAZO'
          DataSource = dsMaster
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Color = clInfoBk
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniLabel11: TUniLabel
          Left = 0
          Top = 2
          Width = 209
          Height = 15
          Hint = ''
          AutoSize = False
          Caption = '% Venda Prazo'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object UniContainerPanel12: TUniContainerPanel
        Left = 583
        Top = 139
        Width = 300
        Height = 48
        Hint = ''
        ParentColor = False
        TabOrder = 12
        DesignSize = (
          300
          48)
        object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
          AlignWithMargins = True
          Left = 0
          Top = 17
          Width = 79
          Height = 29
          Hint = '[[theme-color:off]]'
          DataField = 'VALORFRETETONELADA'
          DataSource = dsMaster
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Color = clInfoBk
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniLabel12: TUniLabel
          Left = 0
          Top = 2
          Width = 75
          Height = 15
          Hint = ''
          AutoSize = False
          Caption = 'Frete Ton R$'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
          AlignWithMargins = True
          Left = 81
          Top = 17
          Width = 79
          Height = 29
          Hint = '[[theme-color:off]]'
          DataField = 'MARGEMLUCRO'
          DataSource = dsMaster
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Color = clInfoBk
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniLabel2: TUniLabel
          Left = 81
          Top = 2
          Width = 79
          Height = 15
          Hint = ''
          AutoSize = False
          Caption = 'Margem %'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 4
        end
        object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
          AlignWithMargins = True
          Left = 161
          Top = 17
          Width = 79
          Height = 29
          Hint = '[[theme-color:off]]'
          DataField = 'COMISSAO'
          DataSource = dsMaster
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          Color = clInfoBk
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniLabel14: TUniLabel
          Left = 161
          Top = 2
          Width = 79
          Height = 15
          Hint = ''
          AutoSize = False
          Caption = 'Comiss'#227'o %'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 6
        end
        object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
          AlignWithMargins = True
          Left = 241
          Top = 17
          Width = 57
          Height = 29
          Hint = '[[theme-color:off]]'
          DataField = 'IMPOSTO'
          DataSource = dsMaster
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 7
          Color = clInfoBk
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniLabel16: TUniLabel
          Left = 241
          Top = 2
          Width = 79
          Height = 15
          Hint = ''
          AutoSize = False
          Caption = 'Imposto %'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 8
        end
      end
      object rcBlock50: TUniContainerPanel
        Tag = 1
        Left = 18
        Top = 54
        Width = 181
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 14
        DesignSize = (
          181
          48)
        object UniLabel7: TUniLabel
          Left = 2
          Top = 1
          Width = 103
          Height = 15
          Hint = ''
          Caption = 'Custo de Produ'#231#227'o'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object edLkpCUSTO_LOTEINTERNO: TUniDBEdit
          Left = 1
          Top = 15
          Width = 178
          Height = 32
          Hint = 
            '[['#13#10'DESCRICAO CODIGO_CUSTOPRODUCAO @60 |'#13#10'lkpfilter-empty:Seleci' +
            'one a Unidade<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridatt' +
            'r: |'#13#10'valid:blank |'#13#10'valid-required:top-in |'#13#10']]'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
          InputType = 'text'
        end
      end
    end
    object paBaseButtons: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 43
      Height = 562
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
      TabOrder = 1
      ScrollHeight = 562
      ScrollWidth = 43
      object paOF: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 345
        Width = 43
        Height = 36
        Hint = ''
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 4
        ExplicitTop = 337
        object btnOptions: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 39
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-sign-out-alt rc-mirror-h | '#13#10'cls' +
            '-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '='
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnOptionsClick
        end
      end
      object paP: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 43
        Height = 48
        Hint = ''
        Margins.Top = 6
        ParentColor = False
        Align = alTop
        TabOrder = 0
        object UniImage1: TUniImage
          Left = 0
          Top = 0
          Width = 43
          Height = 48
          Hint = ''
          Center = True
          Picture.Data = {
            055449636F6E0000010002001010000000002000680400002600000020200000
            00002000A81000008E0400002800000010000000200000000100200000000000
            4004000000000000000000000000000000000000FFFFFF01FFFFFF01FFFFFF01
            BFBAC1038DA2BC47749AC4816787B89B496298C53B4C82B7383F6D8955597E35
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            9199B011648CC3E35484C6FF5280C5FF6391D0FF5A8AC9FF4A6EACFF23356FF5
            3E406C7FB7B2BB03FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            939CAA11618ABEE7638ECDFF6F9BD1FF6694D0FF6E97D2FF5984C6FF6996D3FF
            354D8DFB4F527F49FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            8EA4BF156387B0EF5984B9FF6098D5FF77ADDEFF6AA0DBFF7AABDCFF5D86C8FF
            6A97D0FF3F5A93ABFFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            BDDDF015566D87F184ADCCFF3C5E93FF5A89CEFF6AA1DFFF73A9E1FF80B5E6FF
            6591D1FF6089C1D7E9E5EA03FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            B8CECF0D819CB4D9313F56FF9BC4E2FF3F6093FF4164ACFF6093D8FF6BA5DFFF
            74ACE0FF6C9CD0D1EEEFEC03FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01ABCDDD8542546FFF3C7166FFA3D2E3FF7AA1C2FF4368A5FF5582BFFF
            71A8E0FF47689BD7E6D9DD05FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01C0CBCF0FA7CADAB14F9E75FD37A75AFF415170FF69869DFF5D85B4FF
            618DC0FF557FBBE1E3DFE30BFFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01BDCEC31740A453E14AC96FF97B93AFD77B97B2B17196BD85
            8AAFD36FA8C0D745FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF0164B5735953B263C75DC3789BB0CFAD17FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF013BA04C8F4AA55487C7D1BC0BC1CCB705FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF013B9F4A9151A65E7DFFFFFF01C8DEC50392C99539BBDCB90B
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01C0DCBA09
            C5DABC09FFFFFF015AA86357339D46D779B27D4568BA727722CA4FF949C16183
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01BFDBBB0344C4609F
            3EC35BADAFD2AD1375C6834D30A546F917982CFF23C44BFF28CE53FB5AC5745D
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01B3D7B50538C459C3
            2CD457FF2BC650F31DC142F157BF685164C77B5B4AC3668B73C7823D9CCEA703
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF016DC07E31
            4BC664AB39C55BBD53C0685FF7F0EB03FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF010000FFFF0000FFFF0000FFFF
            0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF280000002000000040000000
            01002000000000008010000000000000000000000000000000000000FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01E2E1E007
            BBC3C617A4B6CF25829BB52D8798B4338592B1596E7A978561678A8F656A907B
            727698636E71914573768F23B9B6CA0DFFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01BFBAC109939FB353
            829EBDA9779ECBCD6691BEE1658CBDE3577AB7F94163A4FF305295FF2A4483FF
            233672FF253266F3323564C73B416B8D80819B3BFFFDFF05FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF0182889B1D6B84ABC1
            6391CCFF568BCCFF4D82C5FF5284C8FF5F90D2FF6692D4FF6192D2FF5F8DCBFF
            5680BDFF3B5B9BFF1F306EFF0E1850FF222354D55B5E7F79ECE6EA0DFFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF019FA8C3217191C4CD
            578ACCFF5B8BCAFF5178BBFF4871BBFF4F7AC1FF648ECCFF6291CFFF5B8ECEFF
            5A8BCCFF6698D7FF6993D1FF4A6CACFF122A68FF191D53F557597D7FB7B2BB0D
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF0196A6B3216E91B7CD
            5688C8FF6491D1FF6896D5FF6B97D3FF638EC8FF5F8CCAFF6492D1FF6E9AD5FF
            678FCCFF4D7ABEFF5987CDFF79A8E4FF658DC9FF253C81FF24275EF166648451
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF019093A2236F87ADCF
            5888C7FF5A80BFFF6693D2FF6C9CD0FF83ABD8FF77A2D7FF5E90CCFF6691CEFF
            7EA2DAFF749BD2FF4974BAFF4A77BDFF7EACE1FF6F97D0FF1E3681FF40467ACD
            FEF2ED07FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF0180849C2764789DD9
            6699D2FF547EB3FF5079B7FF6BA9E4FF68A5D9FF82B3E2FF82B2DDFF679BD4FF
            6395D4FF7BAAD9FF81AADBFF4B72BBFF476CBAFF81AFDFFF608BC9FF182F72F9
            B3AFB937FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF019BC1DF2B6D8DACE7
            567CA1FF87BDE8FF375A91FF456CB4FF6AA6E5FF67A5DBFF72ABDDFF72ABE1FF
            6BA6E3FF6DA8DFFF81B0DEFF8DBCEAFF547DC0FF4A73BAFF7CAFDDFF3664A9FD
            6E76957DFFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01BFDDF72B809BBAE7
            2C3D5CFF97C2DEFF73A2CDFF2A477BFF3E60A6FF6B9EE1FF6BA8E2FF6CA5E0FF
            6EA5E0FF73A9E2FF7AACE3FF85B8E4FF8DBEEFFF5781C8FF5F89C8FF6191D3FF
            61759EA7E7E0E903FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01BBDEE92792B6CEDD
            253247FF5A718FFFABE0F7FF6692BFFF223D6DFF36559CFF5C8CD9FF689DE2FF
            679FDBFF6CA5DFFF73A9E1FF76ACE3FF78B2E1FF80B4E9FF5C85CCFF5E8FD3FF
            6186ADBBEAE7EB07FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01AFCECE21A0C4D5CB
            445576FF12172BFF87ADC4FFB0DFF6FF6D9BCBFF1F3B6DFF253F81FF4D70C2FF
            5D8DD7FF6399D9FF68A0DCFF70A9E4FF6BA5DDFF76AFE1FF79AFE3FF5891D6FF
            6E92B9B5EEEFEC05FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01CACFD211BCD9E697
            82A0BAFF0E1224FF1F2645FF96B4CBFFB7E2FCFF82ADDCFF385884FF203971FF
            3A5AA9FF537ECCFF6295DFFF669FDDFF6CA5DEFF6DA4DCFF75AEDFFF609FDBFD
            A3B6D191FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01DFDEE203B2CCD65D
            ABD1E5ED435073FF01031EFF253D55FF8CBEC6FFBFE7FCFF9AC6E7FF5D84ADFF
            2F4C81FF2E4B8FFF4266B7FF5889CDFF6CA5DDFF6DA7E4FF6FABE3FF5C95CEFD
            707D94A1FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01BCC2CD19
            A6C9D8AFA1CDDBFD243152FF09231EFF36A561FF74BCB7FFBDE0F2FFC7EDF8FF
            96C9E1FF608DB6FF3C6098FF3F63A2FF5076B2FF6899D2FF7EB6E9FF385B9EFF
            1D2C59C3E5D8DD0DFFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            C0CACF35A3CBD8CF9BC5D9FF3B556BFF35B34EFF3EDB67FF386D5BFF617791FF
            95BBD4FFABD3E0FFA3D3E2FF80B5E2FF648FC7FF6E98C2FF5478ABFF1B408AFF
            5177AFCDE2E0E21BFFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01C5C9D137B1D0E2BB96C1C4F73AB15BFF3FE867FF296E3EFF060525FF
            090E35FF242F4BFF324566FF3A567DFF577AA9FF6696C8FF5C8ECBFF69A3E2FF
            8EADD7B9E5DEE40FFFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01D0D1E3296FAA88BD2BAA47FF3FE264FF50A97AFF61769EFF
            506D92FF587696FF6482A3F7688CB3EB7299C2DF7BA3CCD393BBDFB59EC0DBAB
            AEB8CB4DFFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01AACBA52D4CA656C9289836FF36CE5CFF64CB85E9ADC1D0AD
            ADC5D3AFCCDFEB91ADC5D5418CB2D1278CABCB2393A9C31FB7C9D317D2D7DA15
            F2EBEE05FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01C8D5C3077ABE867F35AB4CFF81BA84D768CA84D532BF57C1BCDABA25
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF0176B57F0F52AF64CF3BAD52F784C38B539AD0A83B6CB97C9DA7C8A431
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF0180BB831B329D43F53AA247E580B67F37CFD7C305C6D0BB23BFCAB513
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01A4D0A72D2A993FFF3D9F4AD197BA912DFFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01ACD4B03329973CFF3E9E4DC3ACC8AB25FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF017EBD7F1B2F9A3DF743A052D99EC19F31FFFFFF01FFFFFF01FFFFFF01
            C8DEC5079ECB9F6988C68C77B9DBB82BF7F4EE03FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF017CB4800F49A155CB29953AF984B98863D8E2CF05D4E4D003D8DBC703
            9ECAA17D1DB443EF1ABF44F55AC071C185C58F0FFFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01E8F0DE05BAD8B41BC5DABC1DFFFFFF01FFFFFF01
            FFFFFF01D2D9C6076EAF737D199532FF38A04BFD7BB57E9B72AA757376AA7479
            41BA57E129DC5EFF29DA56FF26BE45FF9AD39F39FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01E4EBDB0381C88B3D54C36CAF4EC265B597C4963DFFFFFF01
            FFFFFF01FCF5F7036EBE825D31A747FF0D8C21FF128322FF218829FF209933FF
            2CD05DFF33D75DFF21D34EFF46C364E5A0D6A61FFFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01B6D8B40B5DC46D931CC446FF24D152FF36B44CC9A9CFA641
            FFF8FE05DAE5CD1F66C476B327BB4BFB5EA565ED179B2DFD13B937FF1CD14BFF
            22D450FF1CCA46FF33C259ED70C386699CCAA805FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01A9D2AC0D5DC873A91BC747FF37D762FF23D251FD28B847EF
            48BB62DD34B955E70FC237FB3ABD51B99EC19B3189CF967D44BF64D727B84DEB
            34C054E566C778AF94C79B439CCEA709FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01CBE0CB0765C17A7127C14CF326D150FF2ED459FF27D554FF
            18CE46FF0CCA3CFF2ABE44E76EC27C57FFF4FD03FFFFFF01E7EAD713D0DECB39
            E0EBD827FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF018DC2901B5FBE759341C45DF12BC54DFF1DC547FF
            1DC249FF3DBF57E167BB7563F7F0EB0DFFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01ABCFAB1588CA8F457FCA8A7970C97F85
            7ACC877384C98C35EEF2E505FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
            FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF0100000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000}
          Align = alClient
        end
      end
      object paNAE: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 68
        Width = 43
        Height = 82
        Hint = ''
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 2
        object btnEditReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 39
          Height = 39
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            '|'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '!'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnEditRegClick
        end
        object btnDeleteReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 45
          Width = 39
          Height = 39
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
            '|'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 0
          Caption = '#'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 2
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnDeleteRegClick
          ExplicitTop = 38
        end
      end
      object paGC: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 170
        Width = 43
        Height = 155
        Hint = ''
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 3
        ExplicitTop = 162
        object btnSaveReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 74
          Width = 39
          Height = 32
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-check | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'V'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnSaveRegClick
        end
        object btnCancelReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 38
          Width = 39
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-times | '#13#10'cls-ico:font-black|'#13#10']' +
            ']'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'X'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 2
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnCancelRegClick
        end
        object btnCalcReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 39
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-calculator | '#13#10'cls-ico:font-blac' +
            'k'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'C'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 3
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnCalcRegClick
        end
        object btnimpressao: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 110
          Width = 39
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-print | '#13#10'cls-ico:font-black'#13#10']]' +
            #13#10#13#10
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'I'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 4
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnimpressaoClick
        end
      end
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = FDQryFiltro
    Left = 139
    Top = 487
  end
  object FDQryFiltro: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'CUSTO_PRODUCAO'
    SQL.Strings = (
      'select * from CUSTO_PRODUCAO')
    Left = 81
    Top = 407
  end
  object dsMaster: TDataSource
    AutoEdit = False
    DataSet = sqlMaster
    Left = 70
    Top = 479
  end
  object sqlMaster: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'CUSTO_PRODUCAO'
    SQL.Strings = (
      'SELECT * FROM CUSTO_PRODUCAO where codigo = :codigo')
    Left = 123
    Top = 359
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlMasterKEY: TStringField
      FieldName = 'KEY'
      Origin = '"KEY"'
      Size = 38
    end
    object sqlMasterCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object sqlMasterMESTRE_ID: TIntegerField
      FieldName = 'MESTRE_ID'
      Origin = 'MESTRE_ID'
    end
    object sqlMasterEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
    end
    object sqlMasterEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object sqlMasterCODIGO_CUSTOPRODUCAO: TIntegerField
      FieldName = 'CODIGO_CUSTOPRODUCAO'
      Origin = 'CODIGO_CUSTOPRODUCAO'
    end
    object sqlMasterDESCRICAO_CUSTOPRODUCAO: TStringField
      FieldName = 'DESCRICAO_CUSTOPRODUCAO'
      Origin = 'DESCRICAO_CUSTOPRODUCAO'
      Size = 60
    end
    object sqlMasterCODIGO_CUSTOVENDA: TIntegerField
      FieldName = 'CODIGO_CUSTOVENDA'
      Origin = 'CODIGO_CUSTOVENDA'
    end
    object sqlMasterDESCRICAO_CUSTOVENDA: TStringField
      FieldName = 'DESCRICAO_CUSTOVENDA'
      Origin = 'DESCRICAO_CUSTOVENDA'
      Size = 60
    end
    object sqlMasterPAINEL_INFO: TBlobField
      FieldName = 'PAINEL_INFO'
      Origin = 'PAINEL_INFO'
    end
    object sqlMasterPAINEL_PRODUCAO: TBlobField
      FieldName = 'PAINEL_PRODUCAO'
      Origin = 'PAINEL_PRODUCAO'
    end
    object sqlMasterPAINEL_TAXAS: TBlobField
      FieldName = 'PAINEL_TAXAS'
      Origin = 'PAINEL_TAXAS'
    end
    object sqlMasterPAINEL_VENDAS: TBlobField
      FieldName = 'PAINEL_VENDAS'
      Origin = 'PAINEL_VENDAS'
    end
    object sqlMasterPERCVENDAPRAZO: TBCDField
      FieldName = 'PERCVENDAPRAZO'
      Origin = 'PERCVENDAPRAZO'
      Precision = 18
    end
    object sqlMasterVALORFRETETONELADA: TBCDField
      FieldName = 'VALORFRETETONELADA'
      Origin = 'VALORFRETETONELADA'
      Precision = 18
    end
    object sqlMasterCODIGOP: TStringField
      FieldName = 'CODIGOP'
      Origin = 'CODIGOP'
      Size = 60
    end
    object sqlMasterMARGEMLUCRO: TBCDField
      FieldName = 'MARGEMLUCRO'
      Origin = 'MARGEMLUCRO'
      Precision = 18
    end
    object sqlMasterCOMISSAO: TBCDField
      FieldName = 'COMISSAO'
      Origin = 'COMISSAO'
      Precision = 18
    end
    object sqlMasterIMPOSTO: TBCDField
      FieldName = 'IMPOSTO'
      Origin = 'IMPOSTO'
      Precision = 18
    end
  end
end
