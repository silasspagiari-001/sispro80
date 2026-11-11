inherited frmNOTAELETRONICA: TfrmNOTAELETRONICA
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      inherited paBaseTopTitle: TUniContainerPanel
        TabOrder = 2
        inherited btnQuickSearch: TUniBitBtn
          ScreenMask.Target = Owner
        end
      end
      object UniMemolog: TUniMemo
        Left = 978
        Top = 3
        Width = 29
        Height = 22
        Hint = ''
        Visible = False
        Lines.Strings = (
          'UniMemolog')
        TabOrder = 1
      end
    end
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 988
      ScrollWidth = 37
      inherited paOF: TUniContainerPanel
        AlignWithMargins = False
        Top = 278
        TabOrder = 4
        ExplicitTop = 278
        inherited btnCloseForm: TUniBitBtn
          Visible = False
          Align = alTop
          TabOrder = 2
          LayoutConfig.Padding = '0 2 0 0'
        end
        inherited btnOptions: TUniBitBtn
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-cog | '#13#10'cls-ico:font-black'#13#10']]'
          Align = alTop
          TabOrder = 1
          LayoutConfig.Padding = '0 2 0 0'
        end
      end
      inherited paP: TUniContainerPanel
        TabOrder = 0
        inherited btnSearch: TUniBitBtn
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-search | '#13#10'cls-ico:font-black |'#13#10 +
            'hint:Abre para Pesquisas t:Busca(s) w:200 d:10000 c:rc-bg-info'#13#10 +
            ']]'#13#10
          Align = alTop
          LayoutConfig.Padding = '0 2 0 0'
        end
      end
      inherited paNAE: TUniContainerPanel
        TabOrder = 2
        inherited btnNewReg: TUniBitBtn
          Align = alTop
          LayoutConfig.Padding = '0 2 0 0'
        end
        inherited btnEditReg: TUniBitBtn
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
          Align = alTop
          ScreenMask.Target = Owner
          LayoutConfig.Padding = '0 2 0 0'
        end
        inherited btnDeleteReg: TUniBitBtn
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
        end
      end
      inherited paGC: TUniContainerPanel
        TabOrder = 3
        inherited btnSaveReg: TUniBitBtn
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-save | '#13#10'cls-ico:font-black'#13#10']]'
          ScreenMask.Target = Owner
        end
        inherited btnCancelReg: TUniBitBtn
          Top = 40
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-times | '#13#10'cls-ico:font-black'#13#10']]'
          ScreenMask.Target = Owner
          LayoutConfig.Padding = '0 2 0 0'
          ExplicitTop = 40
        end
      end
      inherited paAcoesNota: TUniContainerPanel
        Top = 384
        Height = 116
        ExplicitTop = 384
        ExplicitHeight = 116
        inherited btnCalcReg: TUniBitBtn
          OnClick = btnCalcReg2Click
        end
      end
    end
    inherited paBaseCadControl: TUniContainerPanel
      inherited pgBaseCadControl: TUniPageControl
        ActivePage = tabRegister
        inherited tabSearch: TUniTabSheet
          ExplicitLeft = 0
          ExplicitTop = 24
          ExplicitWidth = 256
          ExplicitHeight = 965
          inherited paBaseRegSearch: TUniContainerPanel
            Height = 965
            ExplicitHeight = 965
            inherited paGridOffset: TUniContainerPanel
              Height = 957
              ExplicitHeight = 957
              inherited dbgSearchCRUD: TUniDBGrid
                Height = 957
                ForceFit = True
                Font.Height = -13
                Columns = <
                  item
                    Flex = 50
                    FieldName = 'opcoes'
                    Title.Caption = ' '
                    Width = 50
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    Flex = 100
                    FieldName = 'status'
                    Title.Caption = 'Status'
                    Width = 24
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    Flex = 100
                    FieldName = 'NUMERO'
                    Title.Caption = 'NUMERO'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    Flex = 120
                    FieldName = 'EMISSAO'
                    Title.Caption = 'EMISSAO'
                    Width = 120
                    Font.Name = 'Calibri'
                  end
                  item
                    Flex = 100
                    FieldName = 'PESSOA'
                    Title.Caption = 'PESSOA'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    Flex = 800
                    FieldName = 'NOME'
                    Title.Caption = 'NOME'
                    Width = 250
                    Font.Name = 'Calibri'
                    ReadOnly = True
                  end
                  item
                    Flex = 800
                    FieldName = 'CIDADE'
                    Title.Caption = 'CIDADE'
                    Width = 250
                    Font.Name = 'Calibri'
                    ReadOnly = True
                  end
                  item
                    Flex = 50
                    FieldName = 'ESTADO'
                    Title.Caption = 'U.F.'
                    Width = 50
                    Font.Name = 'Calibri'
                    ReadOnly = True
                  end
                  item
                    Flex = 200
                    FieldName = 'VLRTOTAL'
                    Title.Caption = 'TOTAL'
                    Width = 150
                    Font.Name = 'Calibri'
                  end>
              end
            end
          end
        end
        inherited tabRegister: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 1361
          ExplicitHeight = 965
          inherited paBaseRegData1: TUniContainerPanel
            Height = 963
            ScrollHeight = 963
            ScrollWidth = 1361
            object UniScrollBox2: TUniScrollBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 1355
              Height = 957
              Hint = ''
              Align = alClient
              TabOrder = 0
              ExplicitHeight = 959
              object UniPageControlnota: TUniPageControl
                Left = 0
                Top = 0
                Width = 1353
                Height = 955
                Hint = ''
                ActivePage = UniTabSheetgeral
                Align = alClient
                TabOrder = 0
                ExplicitHeight = 957
                object UniTabSheetgeral: TUniTabSheet
                  Hint = ''
                  Caption = 'Geral'
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 256
                  ExplicitHeight = 128
                  object UniScrollBox3: TUniScrollBox
                    Left = 0
                    Top = 0
                    Width = 1345
                    Height = 925
                    Hint = ''
                    Align = alClient
                    TabOrder = 0
                    ExplicitHeight = 929
                    ScrollHeight = 847
                    ScrollWidth = 976
                    object rcBlock400: TUniContainerPanel
                      Tag = 1
                      Left = 17
                      Top = 479
                      Width = 947
                      Height = 368
                      Hint = '[[cols:xs-12 sm-12 md-12]]'
                      ParentColor = False
                      TabOrder = 0
                      object UniPageControlprodutos: TUniPageControl
                        Left = 0
                        Top = 0
                        Width = 947
                        Height = 368
                        Hint = ''
                        ActivePage = UniTabSheetProdutos
                        Align = alClient
                        TabOrder = 1
                        object UniTabSheetProdutos: TUniTabSheet
                          Hint = ''
                          Caption = 'Produtos'
                          ExplicitLeft = 0
                          ExplicitTop = 0
                          ExplicitWidth = 256
                          ExplicitHeight = 128
                          object UniDBGridprodutos: TUniDBGrid
                            Left = 0
                            Top = 0
                            Width = 939
                            Height = 340
                            Hint = ''
                            ClientEvents.ExtEvents.Strings = (
                              
                                'afterrender=function afterrender(sender, eOpts) {'#13#10'    var grid ' +
                                '= sender;'#13#10'    if (grid._notaEnterCleanup) grid._notaEnterCleanu' +
                                'p();'#13#10#13#10'    function onEnter(event) {'#13#10'        if (grid.destroye' +
                                'd || event.isComposing ||'#13#10'            (event.key !== '#39'Enter'#39' &&' +
                                ' event.keyCode !== 13)) return;'#13#10#13#10'        var plugin = grid.get' +
                                'Plugin('#39'uniGridEditor'#39') || grid.findPlugin('#39'cellediting'#39');'#13#10'    ' +
                                '    var editor = plugin && plugin.getActiveEditor();'#13#10'        va' +
                                'r insideGrid = grid.el && grid.el.dom.contains(event.target);'#13#10' ' +
                                '       var insideEditor = editor && editor.editing && editor.el ' +
                                '&&'#13#10'            editor.el.dom.contains(event.target);'#13#10'        i' +
                                'f (!insideGrid && !insideEditor) return;'#13#10#13#10'        // Impede o ' +
                                'Enter de concluir a edicao ou navegar pelo formulario.'#13#10'        ' +
                                'event.preventDefault();'#13#10'        event.stopImmediatePropagation(' +
                                ');'#13#10'        if (event.type !== '#39'keydown'#39' || event.repeat) return' +
                                ';'#13#10#13#10'        // Entrega Tab ao proprio editor: ExtJS/uniGUI vali' +
                                'da, conclui e avanca.'#13#10'        // Nao escolhe colunas nem chama ' +
                                'completeEdit/startEdit manualmente.'#13#10'        event.target.dispat' +
                                'chEvent(new KeyboardEvent('#39'keydown'#39', {'#13#10'            key: '#39'Tab'#39', ' +
                                'code: '#39'Tab'#39', keyCode: 9, which: 9,'#13#10'            bubbles: true, c' +
                                'ancelable: true, composed: true,'#13#10'            shiftKey: event.sh' +
                                'iftKey'#13#10'        }));'#13#10'    }'#13#10#13#10'    var events = ['#39'keydown'#39', '#39'key' +
                                'press'#39', '#39'keyup'#39'];'#13#10'    events.forEach(function(name) { window.ad' +
                                'dEventListener(name, onEnter, true); });'#13#10'    grid._notaEnterCle' +
                                'anup = function() {'#13#10'        events.forEach(function(name) { win' +
                                'dow.removeEventListener(name, onEnter, true); });'#13#10'    };'#13#10'    g' +
                                'rid.on('#39'destroy'#39', grid._notaEnterCleanup);'#13#10#13#10'    // O uniGUI id' +
                                'entifica PRECO pelo dataIndex/nome do editor (7 neste DFM).'#13#10'   ' +
                                ' // Nao guardar objetos de coluna no afterrender: podem ser recr' +
                                'iados.'#13#10'    function priceEditor(event) {'#13#10'        var plugin = ' +
                                'grid.getPlugin('#39'uniGridEditor'#39') || grid.findPlugin('#39'cellediting'#39 +
                                ');'#13#10'        var editor = plugin && plugin.getActiveEditor();'#13#10'  ' +
                                '      if (!editor || !editor.editing || !editor.field || !editor' +
                                '.field.inputEl ||'#13#10'            event.target !== editor.field.inp' +
                                'utEl.dom) return null;'#13#10'        if (String(editor.field.inputEl.' +
                                'dom.name) !== '#39'7'#39') return null;'#13#10'        return editor.field;'#13#10' ' +
                                '   }'#13#10'    function writeCents(field, cents) {'#13#10'        if (!Numb' +
                                'er.isSafeInteger(cents) || cents < 0) return;'#13#10'        var value' +
                                ' = cents / 100;'#13#10'        field.setValue(value);'#13#10'        field.s' +
                                'etRawValue(value.toFixed(2).replace('#39'.'#39', field.decimalSeparator ' +
                                '|| '#39'.'#39'));'#13#10'        var input = field.inputEl.dom;'#13#10'        input' +
                                '.setSelectionRange(input.value.length, input.value.length);'#13#10'   ' +
                                ' }'#13#10'    function priceKey(event) {'#13#10'        if (event.isComposin' +
                                'g || event.ctrlKey || event.metaKey || event.altKey) return;'#13#10'  ' +
                                '      var field = priceEditor(event);'#13#10'        if (!field) retur' +
                                'n;'#13#10'        var digit = /^[0-9]$/.test(event.key);'#13#10'        if (' +
                                '!digit && event.key !== '#39'Backspace'#39' && event.key !== '#39'Delete'#39' &&' +
                                #13#10'            event.key !== '#39','#39' && event.key !== '#39'.'#39') return;'#13#10' ' +
                                '       event.preventDefault();'#13#10'        event.stopImmediatePropa' +
                                'gation();'#13#10'        if (event.key === '#39','#39' || event.key === '#39'.'#39') r' +
                                'eturn;'#13#10'        var input = field.inputEl.dom;'#13#10'        var sele' +
                                'ctedAll = input.selectionStart === 0 && input.selectionEnd === i' +
                                'nput.value.length;'#13#10'        var cents = selectedAll ? 0 : Math.r' +
                                'ound((Number(field.getValue()) || 0) * 100);'#13#10'        if (digit)' +
                                ' cents = cents * 10 + Number(event.key);'#13#10'        else if (event' +
                                '.key === '#39'Backspace'#39') cents = Math.floor(cents / 10);'#13#10'        e' +
                                'lse cents = 0;'#13#10'        writeCents(field, cents);'#13#10'    }'#13#10'    fu' +
                                'nction pricePaste(event) {'#13#10'        var field = priceEditor(even' +
                                't);'#13#10'        if (!field) return;'#13#10'        var text = event.clipb' +
                                'oardData.getData('#39'text'#39').trim();'#13#10'        event.preventDefault()' +
                                ';'#13#10'        event.stopImmediatePropagation();'#13#10'        // Colagem' +
                                ' sem separador: centavos. Com separador: valor decimal.'#13#10'       ' +
                                ' if (/^\d+$/.test(text)) writeCents(field, Number(text));'#13#10'     ' +
                                '   else if (/^\d+[.,]\d{1,2}$/.test(text))'#13#10'            writeCen' +
                                'ts(field, Math.round(Number(text.replace('#39','#39', '#39'.'#39')) * 100));'#13#10'  ' +
                                '  }'#13#10'    window.addEventListener('#39'keydown'#39', priceKey, true);'#13#10'  ' +
                                '  window.addEventListener('#39'paste'#39', pricePaste, true);'#13#10'    grid.' +
                                'on('#39'destroy'#39', function() {'#13#10'        window.removeEventListener('#39 +
                                'keydown'#39', priceKey, true);'#13#10'        window.removeEventListener('#39 +
                                'paste'#39', pricePaste, true);'#13#10'    });'#13#10#13#10'}')
                            DataSource = dsprodutos
                            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
                            WebOptions.Paged = False
                            LoadMask.Message = 'Carregando Item(s)...'
                            ForceFit = True
                            Align = alClient
                            Font.Color = clBlack
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            ParentFont = False
                            TabOrder = 0
                            Summary.Enabled = True
                            OnCellClick = UniDBGridprodutosCellClick
                            Columns = <
                              item
                                FieldName = 'opcoes'
                                Title.Caption = ' '
                                Width = 30
                                Font.Color = clBlack
                                Font.Name = 'Calibri'
                                Alignment = taCenter
                                ReadOnly = True
                              end
                              item
                                FieldName = 'PRODUTO'
                                Title.Caption = 'Produtos'
                                Width = 100
                                Font.Color = clBlack
                                Font.Name = 'Calibri'
                              end
                              item
                                FieldName = 'buscaproduto'
                                Title.Caption = ' '
                                Width = 50
                                Font.Color = clBlack
                                Font.Name = 'Calibri'
                                Alignment = taCenter
                                ReadOnly = True
                              end
                              item
                                FieldName = 'DESCRICAO'
                                Title.Caption = 'Descri'#231#227'o do Item'
                                Width = 300
                                Font.Color = clBlack
                                Font.Name = 'Calibri'
                                ReadOnly = True
                              end
                              item
                                FieldName = 'buscalote'
                                Title.Caption = ' '
                                Width = 50
                                Font.Color = clBlack
                                Font.Name = 'Calibri'
                                Alignment = taCenter
                                ReadOnly = True
                              end
                              item
                                FieldName = 'LOTESEMENTE'
                                Title.Caption = 'Lote'
                                Width = 120
                                Font.Color = clBlack
                                Font.Name = 'Calibri'
                              end
                              item
                                FieldName = 'QUANTIDADE'
                                Title.Caption = 'Qtde'
                                Width = 74
                                Font.Color = clBlack
                                Font.Name = 'Calibri'
                              end
                              item
                                FieldName = 'PRECO'
                                Title.Caption = 'Pre'#231'o R$'
                                Width = 100
                                Font.Color = clBlack
                                Font.Name = 'Calibri'
                              end
                              item
                                FieldName = 'PERCICMS'
                                Title.Caption = 'PERCICMS'
                                Width = 74
                                Font.Color = clBlack
                                Font.Name = 'Calibri'
                                ReadOnly = True
                              end
                              item
                                FieldName = 'BASEICMS'
                                Title.Caption = 'BASEICMS'
                                Width = 74
                                Font.Color = clBlack
                                Font.Name = 'Calibri'
                                ReadOnly = True
                              end
                              item
                                FieldName = 'VALORICMS'
                                Title.Caption = 'VALORICMS'
                                Width = 74
                                Font.Color = clBlack
                                Font.Name = 'Calibri'
                                ReadOnly = True
                              end
                              item
                                FieldName = 'TOTAL'
                                Title.Caption = 'R$ Total'
                                Width = 100
                                Font.Color = clBlack
                                Font.Name = 'Calibri'
                                ReadOnly = True
                              end
                              item
                                FieldName = 'exclui'
                                Title.Caption = ' '
                                Width = 50
                                Font.Color = clBlack
                                Font.Name = 'Calibri'
                                Alignment = taCenter
                                ReadOnly = True
                              end>
                          end
                        end
                        object UniTabSheettransporte: TUniTabSheet
                          Hint = ''
                          Caption = 'Transporte'
                          ExplicitLeft = 0
                          ExplicitTop = 0
                          ExplicitWidth = 256
                          ExplicitHeight = 128
                          object rcBlock270: TUniContainerPanel
                            Left = -9
                            Top = 3
                            Width = 845
                            Height = 25
                            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                            ParentColor = False
                            Color = clSkyBlue
                            TabOrder = 0
                            object UniLabel20: TUniLabel
                              AlignWithMargins = True
                              Left = 10
                              Top = 2
                              Width = 251
                              Height = 19
                              Hint = '[[cols:12 | round:all]]'
                              Margins.Left = 6
                              Margins.Top = 6
                              Margins.Right = 6
                              Margins.Bottom = 6
                              AutoSize = False
                              Caption = 'TRANSPORTADORA'
                              ParentFont = False
                              Font.Color = clGray
                              Font.Height = -15
                              Font.Name = 'Calibri'
                              TabOrder = 1
                            end
                          end
                          object rcBlock890: TUniContainerPanel
                            Tag = 1
                            Left = 3
                            Top = 37
                            Width = 336
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-5]]'
                            ParentColor = False
                            TabOrder = 1
                            DesignSize = (
                              336
                              48)
                            object UniLabel35: TUniLabel
                              Left = 2
                              Top = -3
                              Width = 86
                              Height = 15
                              Hint = ''
                              Caption = 'Transportadora'
                              ParentFont = False
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              TabOrder = 1
                            end
                            object edLkpTRANSPORTES: TUniDBEdit
                              Left = 4
                              Top = 19
                              Width = 330
                              Height = 29
                              Hint = 
                                '[['#13#10'NOME TRANSPORTADORA |'#13#10'lkpfilter-empty:Selecione um Transpor' +
                                'te<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-searchfields:CPFCN' +
                                'PJ|'#13#10'lkpfilter-gridattr: |'#13#10'valid:blank |'#13#10'valid-required:top-in' +
                                ' |'#13#10']]'#13#10#13#10
                              CharCase = ecUpperCase
                              Anchors = [akLeft, akTop, akRight]
                              ParentFont = False
                              Font.Height = -15
                              Font.Name = 'Calibri'
                              TabOrder = 2
                              Color = clInfoBk
                              ReadOnly = True
                              InputType = 'text'
                              OnExit = edLkpTRANSPORTESExit
                            end
                          end
                          object rcBlock900: TUniContainerPanel
                            Tag = 1
                            Left = 364
                            Top = 37
                            Width = 150
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-2]]'
                            ParentColor = False
                            TabOrder = 2
                            DesignSize = (
                              150
                              48)
                            object edLkpTRANSPORTES_SetDS_CPFCNPJ: TUniDBEdit
                              AlignWithMargins = True
                              Left = 1
                              Top = 19
                              Width = 144
                              Height = 29
                              Hint = ''
                              DataField = 'TRACPFCNPJ'
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 1
                              ReadOnly = True
                            end
                            object UniLabel37: TUniLabel
                              Left = 2
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
                          object rcBlock910: TUniContainerPanel
                            Tag = 1
                            Left = 528
                            Top = 37
                            Width = 144
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-2]]'
                            ParentColor = False
                            TabOrder = 3
                            DesignSize = (
                              144
                              48)
                            object UniDBEdit5: TUniDBEdit
                              AlignWithMargins = True
                              Left = 3
                              Top = 19
                              Width = 133
                              Height = 29
                              Hint = ''
                              DataField = 'TRANUMERO'
                              DataSource = dsMaster
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 1
                            end
                            object UniLabel38: TUniLabel
                              Left = 2
                              Top = 0
                              Width = 99
                              Height = 15
                              Hint = ''
                              Caption = 'N'#186' IDENTIFICA'#199#195'O'
                              ParentFont = False
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              TabOrder = 2
                            end
                          end
                          object rcBlock920: TUniContainerPanel
                            Tag = 1
                            Left = 686
                            Top = 37
                            Width = 150
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-3]]'
                            ParentColor = False
                            TabOrder = 4
                            DesignSize = (
                              150
                              48)
                            object UniLabel47: TUniLabel
                              Left = 2
                              Top = 0
                              Width = 74
                              Height = 15
                              Hint = ''
                              Caption = 'Tipo Emitente'
                              ParentFont = False
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              TabOrder = 1
                            end
                            object UniComboBoxtrafrete: TUniComboBox
                              AlignWithMargins = True
                              Left = 3
                              Top = 19
                              Width = 144
                              Height = 29
                              Hint = ''
                              Style = csDropDownList
                              Text = ''
                              Items.Strings = (
                                'Livre'
                                'Emitente'
                                'Destinatario'
                                'Outras'
                                '')
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 2
                              IconItems = <>
                            end
                          end
                          object rcBlock930: TUniContainerPanel
                            Tag = 1
                            Left = 31
                            Top = 96
                            Width = 150
                            Height = 49
                            Hint = '[[cols:xs-12 sm-12 md-3]]'
                            ParentColor = False
                            TabOrder = 5
                            DesignSize = (
                              150
                              49)
                            object UniLabel28: TUniLabel
                              Left = 2
                              Top = 2
                              Width = 41
                              Height = 15
                              Hint = ''
                              Caption = 'Esp'#233'cie'
                              ParentFont = False
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              TabOrder = 1
                            end
                            object UniDBComboBoxESPECIE: TUniDBComboBox
                              Tag = 1
                              AlignWithMargins = True
                              Left = 3
                              Top = 20
                              Width = 144
                              Height = 29
                              Hint = ''
                              Anchors = [akLeft, akTop, akRight]
                              DataField = 'TRAESPECIE'
                              DataSource = dsMaster
                              Style = csDropDownList
                              Items.Strings = (
                                'SACO(s)'
                                'KILO(s)'
                                'PE'#199'A(s)'
                                'UNIDADE(s)')
                              TabOrder = 2
                              IconItems = <>
                            end
                          end
                          object rcBlock940: TUniContainerPanel
                            Tag = 1
                            Left = 196
                            Top = 97
                            Width = 150
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-3]]'
                            ParentColor = False
                            TabOrder = 6
                            DesignSize = (
                              150
                              48)
                            object UniDBEdit2: TUniDBEdit
                              AlignWithMargins = True
                              Left = 2
                              Top = 19
                              Width = 144
                              Height = 29
                              Hint = ''
                              DataField = 'TRAMARCA'
                              DataSource = dsMaster
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 1
                            end
                            object UniLabel29: TUniLabel
                              Left = 2
                              Top = 0
                              Width = 36
                              Height = 15
                              Hint = ''
                              Caption = 'Marca'
                              ParentFont = False
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              TabOrder = 2
                            end
                          end
                          object rcBlock950: TUniContainerPanel
                            Tag = 1
                            Left = 382
                            Top = 97
                            Width = 150
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-3]]'
                            ParentColor = False
                            TabOrder = 7
                            DesignSize = (
                              150
                              48)
                            object UniDBFormattedNumberEditpesobruto: TUniDBFormattedNumberEdit
                              Tag = 1
                              AlignWithMargins = True
                              Left = 3
                              Top = 19
                              Width = 144
                              Height = 29
                              Hint = ''
                              DataField = 'TRAPESOBRUTO'
                              DataSource = dsMaster
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 1
                              DecimalSeparator = ','
                              ThousandSeparator = '.'
                            end
                            object UniLabel33: TUniLabel
                              Left = 3
                              Top = 0
                              Width = 59
                              Height = 15
                              Hint = ''
                              Caption = 'Peso Bruto'
                              ParentFont = False
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              TabOrder = 2
                            end
                          end
                          object rcBlock960: TUniContainerPanel
                            Tag = 1
                            Left = 558
                            Top = 96
                            Width = 150
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-3]]'
                            ParentColor = False
                            TabOrder = 8
                            DesignSize = (
                              150
                              48)
                            object UniDBFormattedNumberEditpesoliquido: TUniDBFormattedNumberEdit
                              Tag = 1
                              AlignWithMargins = True
                              Left = 0
                              Top = 19
                              Width = 147
                              Height = 29
                              Hint = ''
                              DataField = 'TRAPESOLIQUIDO'
                              DataSource = dsMaster
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 1
                              DecimalSeparator = ','
                              ThousandSeparator = '.'
                            end
                            object UniLabel34: TUniLabel
                              Left = 0
                              Top = 1
                              Width = 70
                              Height = 15
                              Hint = ''
                              Caption = 'Peso Liquido'
                              ParentFont = False
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              TabOrder = 2
                            end
                          end
                          object rcBlock970: TUniContainerPanel
                            Tag = 1
                            Left = 202
                            Top = 151
                            Width = 150
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-3]]'
                            ParentColor = False
                            TabOrder = 9
                            DesignSize = (
                              150
                              48)
                            object UniLabel72: TUniLabel
                              Left = 3
                              Top = 2
                              Width = 64
                              Height = 15
                              Hint = ''
                              Caption = 'Quantidade'
                              ParentFont = False
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              TabOrder = 1
                            end
                            object UniDBFormattedNumberEditQUANTIDADE: TUniDBFormattedNumberEdit
                              Tag = 1
                              Left = 3
                              Top = 17
                              Width = 146
                              Height = 29
                              Hint = ''
                              DataField = 'TRAQUANTIDADE'
                              DataSource = dsMaster
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 2
                              DecimalSeparator = ','
                              ThousandSeparator = '.'
                            end
                          end
                          object rcBlock965: TUniContainerPanel
                            Tag = 1
                            Left = 29
                            Top = 151
                            Width = 150
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-3]]'
                            ParentColor = False
                            TabOrder = 10
                            DesignSize = (
                              150
                              48)
                            object UniLabel78: TUniLabel
                              Left = 3
                              Top = 3
                              Width = 36
                              Height = 15
                              Hint = ''
                              Caption = 'Marca'
                              ParentFont = False
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              TabOrder = 1
                            end
                            object UniDBComboBoxMARCA: TUniDBComboBox
                              Tag = 1
                              AlignWithMargins = True
                              Left = 3
                              Top = 18
                              Width = 144
                              Height = 29
                              Hint = ''
                              Anchors = [akLeft, akTop, akRight]
                              DataField = 'MARCA'
                              DataSource = dsprodutos
                              Style = csDropDownList
                              TabOrder = 2
                              IconItems = <>
                            end
                          end
                          object rcBlock990: TUniContainerPanel
                            Tag = 1
                            Left = 380
                            Top = 161
                            Width = 150
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-3]]'
                            ParentColor = False
                            TabOrder = 11
                          end
                          object rcBlock1000: TUniContainerPanel
                            Tag = 1
                            Left = 556
                            Top = 160
                            Width = 150
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-3]]'
                            ParentColor = False
                            TabOrder = 12
                          end
                        end
                        object UniTabSheetreferencia: TUniTabSheet
                          Hint = ''
                          Caption = 'Refer'#234'ncia'
                          ExplicitLeft = 0
                          ExplicitTop = 0
                          ExplicitWidth = 256
                          ExplicitHeight = 128
                          DesignSize = (
                            939
                            338)
                          object rcBlock860: TUniContainerPanel
                            Left = 3
                            Top = 3
                            Width = 498
                            Height = 25
                            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                            ParentColor = False
                            Color = clSkyBlue
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 0
                            object UniLabel45: TUniLabel
                              AlignWithMargins = True
                              Left = 0
                              Top = 4
                              Width = 251
                              Height = 19
                              Hint = '[[cols:12 | round:all]]'
                              Margins.Left = 6
                              Margins.Top = 6
                              Margins.Right = 6
                              Margins.Bottom = 6
                              AutoSize = False
                              Caption = 'REFER'#202'NCIA DE NOTA'
                              ParentFont = False
                              Font.Color = clGray
                              Font.Height = -15
                              Font.Name = 'Calibri'
                              TabOrder = 1
                            end
                          end
                          object rcBlock870: TUniContainerPanel
                            Left = 3
                            Top = 81
                            Width = 830
                            Height = 48
                            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                            ParentColor = False
                            TabOrder = 1
                            DesignSize = (
                              830
                              48)
                            object UniDBEditdevolucao: TUniDBEdit
                              AlignWithMargins = True
                              Left = 3
                              Top = 19
                              Width = 824
                              Height = 29
                              Hint = ''
                              DataField = 'CODIGOBARRASCOMPLEMENTO'
                              DataSource = dsMaster
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 1
                            end
                            object UniLabel46: TUniLabel
                              Left = 3
                              Top = 0
                              Width = 212
                              Height = 15
                              Hint = ''
                              Caption = 'Codigo de Barras da nota refer'#234'nciada'
                              ParentFont = False
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              TabOrder = 2
                            end
                          end
                        end
                        object UniTabSheetdetalhesnota: TUniTabSheet
                          Hint = ''
                          Caption = 'Detalhes Nota'
                          ExplicitLeft = 0
                          ExplicitTop = 0
                          ExplicitWidth = 256
                          ExplicitHeight = 128
                          DesignSize = (
                            939
                            338)
                          object rcBlock370: TUniContainerPanel
                            Left = -4
                            Top = 6
                            Width = 498
                            Height = 25
                            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                            ParentColor = False
                            Color = clSkyBlue
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 0
                            object UniLabel41: TUniLabel
                              AlignWithMargins = True
                              Left = 3
                              Top = 2
                              Width = 251
                              Height = 19
                              Hint = '[[cols:12 | round:all]]'
                              Margins.Left = 6
                              Margins.Top = 6
                              Margins.Right = 6
                              Margins.Bottom = 6
                              AutoSize = False
                              Caption = 'RETORNO NOTA ELETR'#212'NICA'
                              ParentFont = False
                              Font.Color = clGray
                              Font.Height = -15
                              Font.Name = 'Calibri'
                              TabOrder = 1
                            end
                          end
                          object rcBlock820: TUniContainerPanel
                            Tag = 1
                            Left = 544
                            Top = 98
                            Width = 150
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-1]]'
                            ParentColor = False
                            TabOrder = 1
                            DesignSize = (
                              150
                              48)
                            object UniDBEdit8: TUniDBEdit
                              AlignWithMargins = True
                              Left = 4
                              Top = 19
                              Width = 144
                              Height = 29
                              Hint = ''
                              DataField = 'CANCELADA'
                              DataSource = dsMaster
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 1
                              ReadOnly = True
                            end
                            object UniLabel44: TUniLabel
                              Left = 2
                              Top = 0
                              Width = 26
                              Height = 15
                              Hint = ''
                              Caption = 'TIPO'
                              ParentFont = False
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              TabOrder = 2
                            end
                          end
                          object rcBlock830: TUniContainerPanel
                            Tag = 1
                            Left = 3
                            Top = 91
                            Width = 150
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-3]]'
                            ParentColor = False
                            TabOrder = 2
                            DesignSize = (
                              150
                              48)
                            object UniDBEdit13: TUniDBEdit
                              AlignWithMargins = True
                              Left = 4
                              Top = 19
                              Width = 144
                              Height = 29
                              Hint = ''
                              DataField = 'PEDIDO'
                              DataSource = dsMaster
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 1
                              OnExit = UniDBEdit13Exit
                            end
                            object UniLabel70: TUniLabel
                              Left = 2
                              Top = 0
                              Width = 54
                              Height = 15
                              Hint = ''
                              Caption = 'N'#186' Pedido'
                              ParentFont = False
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              TabOrder = 2
                            end
                          end
                          object rcBlock831: TUniContainerPanel
                            Tag = 1
                            Left = 196
                            Top = 91
                            Width = 150
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-3]]'
                            ParentColor = False
                            TabOrder = 5
                            DesignSize = (
                              150
                              48)
                            object UniComboBoxtipoorigem: TUniComboBox
                              AlignWithMargins = True
                              Left = 4
                              Top = 19
                              Width = 144
                              Height = 29
                              Hint = ''
                              Style = csDropDownList
                              Text = ''
                              Items.Strings = (
                                ''
                                'Pedido'
                                'Or'#195#167'amento'
                                'Requisi'#195#167#195#163'o')
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 1
                              IconItems = <>
                              OnChange = UniComboBoxtipoorigemChange
                            end
                            object UniLabel79: TUniLabel
                              Left = 2
                              Top = 0
                              Width = 80
                              Height = 15
                              Hint = ''
                              Caption = 'Tipo Emiss'#195#163'o'
                              ParentFont = False
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              TabOrder = 2
                            end
                          end
                          object rcBlock840: TUniContainerPanel
                            Tag = 1
                            Left = 196
                            Top = 91
                            Width = 150
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-3]]'
                            ParentColor = False
                            TabOrder = 3
                            DesignSize = (
                              150
                              48)
                            object UniDBEdit22: TUniDBEdit
                              AlignWithMargins = True
                              Left = 4
                              Top = 19
                              Width = 144
                              Height = 29
                              Hint = ''
                              DataField = 'CODIGO'
                              DataSource = dsMaster
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 1
                              ReadOnly = True
                            end
                            object UniLabel71: TUniLabel
                              Left = 2
                              Top = 0
                              Width = 93
                              Height = 15
                              Hint = ''
                              Caption = 'Controle Sistema'
                              ParentFont = False
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              TabOrder = 2
                            end
                          end
                          object rcBlock850: TUniContainerPanel
                            Tag = 1
                            Left = 372
                            Top = 91
                            Width = 150
                            Height = 48
                            Hint = '[[cols:xs-12 sm-12 md-3]]'
                            ParentColor = False
                            TabOrder = 4
                          end
                        end
                        object UniTabSheet1: TUniTabSheet
                          Hint = ''
                          Caption = 'Duplicatas'
                          ExplicitLeft = 0
                          ExplicitTop = 0
                          ExplicitWidth = 256
                          ExplicitHeight = 128
                          object rcBlock800: TUniContainerPanel
                            Tag = 1
                            Left = 124
                            Top = 60
                            Width = 538
                            Height = 179
                            Hint = '[[cols:xs-12 sm-12 md-12]]'
                            ParentColor = False
                            TabOrder = 0
                            object dbgTITULOS: TUniDBGrid
                              AlignWithMargins = True
                              Left = 3
                              Top = 3
                              Width = 532
                              Height = 173
                              Hint = ''
                              ClientEvents.UniEvents.Strings = (
                                
                                  'store.afterCreate=function store.afterCreate(sender)'#13#10'{'#13#10'  sende' +
                                  'r.setRemoteSort(false);'#13#10'}')
                              TitleFont.Name = 'Calibri'
                              TitleFont.Style = [fsBold]
                              DataSource = dstitulos
                              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
                              WebOptions.Paged = False
                              LoadMask.Message = 'Loading data...'
                              ForceFit = True
                              BorderStyle = ubsNone
                              Align = alClient
                              Anchors = [akLeft, akTop, akRight]
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              ParentFont = False
                              TabOrder = 1
                              ParentColor = False
                              Color = 15395562
                              TabKeyBehavior = tkNextComponent
                              Columns = <
                                item
                                  FieldName = 'PARCELA'
                                  Title.Caption = 'Seq.'
                                  Width = 30
                                  Font.Name = 'Calibri'
                                end
                                item
                                  FieldName = 'VENCIMENTO'
                                  Title.Caption = 'VENCIMENTO'
                                  Width = 130
                                  Font.Name = 'Calibri'
                                end
                                item
                                  FieldName = 'VALOR'
                                  Title.Caption = 'VALOR'
                                  Width = 100
                                  Font.Name = 'Calibri'
                                end>
                            end
                          end
                        end
                      end
                    end
                    object rcBlock242: TUniContainerPanel
                      Tag = 1
                      Left = 12
                      Top = 324
                      Width = 957
                      Height = 134
                      Hint = 
                        '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
                        'ite |'#13#10']]'#13#10#13#10#13#10
                      ParentColor = False
                      TabOrder = 1
                      object rcBlock243: TUniContainerPanel
                        Left = -4
                        Top = 1
                        Width = 961
                        Height = 25
                        Hint = 
                          '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'noborder-right' +
                          ' | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                        ParentColor = False
                        Color = clSilver
                        TabOrder = 1
                        DesignSize = (
                          961
                          25)
                        object UniLabel1: TUniLabel
                          Left = 927
                          Top = 3
                          Width = 10
                          Height = 26
                          Hint = '[['#13#10'collapse:rcBlock242 off-28 ]]'#13#10
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
                      end
                      object rcBlock254: TUniContainerPanel
                        Tag = 1
                        Left = -1
                        Top = 83
                        Width = 86
                        Height = 43
                        Hint = '[[cols:xs-12 sm-12 md-1]]'
                        ParentColor = False
                        TabOrder = 2
                        DesignSize = (
                          86
                          43)
                        object UniLabel4: TUniLabel
                          Left = 0
                          Top = -3
                          Width = 57
                          Height = 15
                          Hint = ''
                          Caption = 'Base ICMS'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                          Left = 0
                          Top = 13
                          Width = 81
                          Height = 29
                          Hint = ''
                          DataField = 'VLRBASEICMS'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                          ReadOnly = True
                          DecimalSeparator = ','
                          ThousandSeparator = '.'
                        end
                      end
                      object rcBlock262: TUniContainerPanel
                        Tag = 1
                        Left = 90
                        Top = 83
                        Width = 77
                        Height = 43
                        Hint = '[[cols:xs-12 sm-12 md-1]]'
                        ParentColor = False
                        TabOrder = 3
                        DesignSize = (
                          77
                          43)
                        object UniLabel23: TUniLabel
                          Left = 0
                          Top = -3
                          Width = 60
                          Height = 15
                          Hint = ''
                          Caption = 'Valor ICMS'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                          Left = 0
                          Top = 13
                          Width = 74
                          Height = 29
                          Hint = ''
                          DataField = 'VLRICMS'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                          ReadOnly = True
                          DecimalSeparator = ','
                          ThousandSeparator = '.'
                        end
                      end
                      object rcBlock272: TUniContainerPanel
                        Tag = 1
                        Left = 173
                        Top = 83
                        Width = 81
                        Height = 43
                        Hint = '[[cols:xs-12 sm-12 md-1]]'
                        ParentColor = False
                        TabOrder = 4
                        DesignSize = (
                          81
                          43)
                        object UniLabel7: TUniLabel
                          Left = 0
                          Top = -3
                          Width = 71
                          Height = 15
                          Hint = ''
                          Caption = 'Base IBS/CBS'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
                          Left = 0
                          Top = 13
                          Width = 79
                          Height = 29
                          Hint = ''
                          DataField = 'VLRDESPESAS'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                          DecimalSeparator = ','
                          ThousandSeparator = '.'
                          OnExit = UniDBFormattedNumberEditvlrdespesasExit
                        end
                      end
                      object rcBlock282: TUniContainerPanel
                        Tag = 1
                        Left = 260
                        Top = 83
                        Width = 96
                        Height = 43
                        Hint = '[[cols:xs-12 sm-12 md-1]]'
                        ParentColor = False
                        TabOrder = 5
                        DesignSize = (
                          96
                          43)
                        object UniLabel10: TUniLabel
                          Left = 0
                          Top = -3
                          Width = 49
                          Height = 15
                          Hint = ''
                          Caption = 'Valor IBS'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
                          AlignWithMargins = True
                          Left = 0
                          Top = 13
                          Width = 90
                          Height = 29
                          Hint = ''
                          DataField = 'VLRTOTAL'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          ParentFont = False
                          Font.Color = clBlue
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          Font.Style = [fsBold, fsItalic]
                          TabOrder = 2
                          ReadOnly = True
                          DecimalSeparator = ','
                          ThousandSeparator = '.'
                        end
                      end
                      object rcBlock292: TUniContainerPanel
                        Tag = 1
                        Left = 359
                        Top = 83
                        Width = 72
                        Height = 43
                        Hint = '[[cols:xs-12 sm-12 md-1]]'
                        ParentColor = False
                        TabOrder = 6
                        DesignSize = (
                          72
                          43)
                        object UniLabel12: TUniLabel
                          Left = 0
                          Top = -3
                          Width = 52
                          Height = 15
                          Hint = ''
                          Caption = 'Valor CBS'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
                          Left = 0
                          Top = 13
                          Width = 68
                          Height = 29
                          Hint = ''
                          DataField = 'VLRDESCONTOS'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          ParentFont = False
                          Font.Color = clRed
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                          DecimalSeparator = ','
                          ThousandSeparator = '.'
                          OnExit = UniDBFormattedNumberEditdescontosExit
                        end
                      end
                      object rcBlock302: TUniContainerPanel
                        Tag = 1
                        Left = 435
                        Top = 83
                        Width = 75
                        Height = 43
                        Hint = '[[cols:xs-12 sm-12 md-1]]'
                        ParentColor = False
                        TabOrder = 7
                        DesignSize = (
                          75
                          43)
                        object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
                          AlignWithMargins = True
                          Left = 0
                          Top = 13
                          Width = 74
                          Height = 29
                          Hint = ''
                          DataField = 'VLRPRODUTOS'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                          ReadOnly = True
                          DecimalSeparator = ','
                          ThousandSeparator = '.'
                        end
                        object UniLabel5: TUniLabel
                          Left = 0
                          Top = -3
                          Width = 41
                          Height = 15
                          Hint = ''
                          Caption = 'Base ST'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock312: TUniContainerPanel
                        Tag = 1
                        Left = 516
                        Top = 83
                        Width = 84
                        Height = 43
                        Hint = '[[cols:xs-12 sm-12 md-1]]'
                        ParentColor = False
                        TabOrder = 8
                        DesignSize = (
                          84
                          43)
                        object UniLabel21: TUniLabel
                          Left = 0
                          Top = -3
                          Width = 44
                          Height = 15
                          Hint = ''
                          Caption = 'Valor ST'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit
                          Left = 0
                          Top = 13
                          Width = 82
                          Height = 29
                          Hint = ''
                          DataField = 'VLRDESPESAS'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                          DecimalSeparator = ','
                          ThousandSeparator = '.'
                          OnExit = UniDBFormattedNumberEditvlrdespesasExit
                        end
                      end
                      object rcBlock322: TUniContainerPanel
                        Tag = 1
                        Left = 606
                        Top = 83
                        Width = 83
                        Height = 43
                        Hint = '[[cols:xs-12 sm-12 md-1]]'
                        ParentColor = False
                        TabOrder = 9
                        DesignSize = (
                          83
                          43)
                        object UniLabel13: TUniLabel
                          Left = 0
                          Top = -3
                          Width = 47
                          Height = 15
                          Hint = ''
                          Caption = 'Valor IPI'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                          Left = 0
                          Top = 13
                          Width = 82
                          Height = 29
                          Hint = ''
                          DataField = 'VLRDESPESAS'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                          DecimalSeparator = ','
                          ThousandSeparator = '.'
                          OnExit = UniDBFormattedNumberEditvlrdespesasExit
                        end
                      end
                      object rcBlock245: TUniContainerPanel
                        Tag = 1
                        Left = 15
                        Top = 31
                        Width = 248
                        Height = 43
                        Hint = '[[cols:xs-12 sm-12 md-8]]'
                        ParentColor = False
                        TabOrder = 10
                        DesignSize = (
                          248
                          43)
                        object UniLabel6: TUniLabel
                          Left = 0
                          Top = -3
                          Width = 54
                          Height = 15
                          Hint = ''
                          Caption = 'Opera'#231#227'o'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object edLkpOPERACOES: TUniDBEdit
                          Left = 0
                          Top = 13
                          Width = 248
                          Height = 29
                          Hint = 
                            '[['#13#10'DESCRICAO OPERACAO @ ds:dsmaster |'#13#10'lkpfilter-empty:Selecion' +
                            'e uma Opera'#231#227'o<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridat' +
                            'tr: |'#13#10'valid:blank |'#13#10'valid-required:top-in |'#13#10']]'#13#10#13#10
                          CharCase = ecUpperCase
                          Anchors = [akLeft, akTop, akRight]
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                          Color = clInfoBk
                          ReadOnly = True
                          InputType = 'text'
                          OnClick = edLkpOPERACOESClick
                        end
                      end
                      object rcBlock335: TUniContainerPanel
                        Tag = 1
                        Left = 708
                        Top = 83
                        Width = 150
                        Height = 43
                        Hint = '[[cols:xs-12 sm-12 md-4]]'
                        ParentColor = False
                        TabOrder = 11
                        DesignSize = (
                          150
                          43)
                        object UniDBEdit7: TUniDBEdit
                          AlignWithMargins = True
                          Left = 0
                          Top = 13
                          Width = 144
                          Height = 29
                          Hint = ''
                          DataField = 'PROTOCOLO'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                          ReadOnly = True
                        end
                        object UniLabel43: TUniLabel
                          Left = 0
                          Top = -3
                          Width = 54
                          Height = 15
                          Hint = ''
                          Caption = 'Protocolo'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock247: TUniContainerPanel
                        Tag = 1
                        Left = 282
                        Top = 32
                        Width = 150
                        Height = 43
                        Hint = '[[cols:xs-12 sm-12 md-4]]'
                        ParentColor = False
                        TabOrder = 12
                        DesignSize = (
                          150
                          43)
                        object UniDBEdit3: TUniDBEdit
                          AlignWithMargins = True
                          Left = 0
                          Top = 13
                          Width = 153
                          Height = 29
                          Hint = ''
                          DataField = 'CODIGOBARRAS'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                          ReadOnly = True
                        end
                        object UniLabel31: TUniLabel
                          Left = 0
                          Top = -3
                          Width = 54
                          Height = 15
                          Hint = ''
                          Caption = 'Protocolo'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                    end
                    object rcBlock107: TUniContainerPanel
                      Tag = 1
                      AlignWithMargins = True
                      Left = 11
                      Top = 8
                      Width = 963
                      Height = 155
                      Hint = 
                        '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
                        'ite |'#13#10'/*noborder-left:mobile|*/'#13#10'/*noborder-right:mobile|*/'#13#10']]' +
                        #13#10#13#10#13#10#13#10
                      Margins.Left = 15
                      Margins.Top = 15
                      Margins.Right = 15
                      Margins.Bottom = 10
                      ParentColor = False
                      TabOrder = 2
                      object rcBlock108: TUniContainerPanel
                        Left = 0
                        Top = 1
                        Width = 961
                        Height = 25
                        Hint = 
                          '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'noborder-right' +
                          ' | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                        ParentColor = False
                        Color = clSilver
                        TabOrder = 1
                        DesignSize = (
                          961
                          25)
                        object labRcCollapse01: TUniLabel
                          Left = 927
                          Top = 2
                          Width = 10
                          Height = 26
                          Hint = '[['#13#10'collapse:rcBlock107 off-28'#13#10' ]]'#13#10
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
                      end
                      object rcBlock111: TUniContainerPanel
                        Tag = 1
                        Left = 3
                        Top = 41
                        Width = 522
                        Height = 102
                        Hint = '[[cols:xs-12 sm-12 md-8]]'
                        ParentColor = False
                        TabOrder = 2
                        object rcBlock120: TUniContainerPanel
                          Tag = 1
                          Left = 0
                          Top = 5
                          Width = 136
                          Height = 43
                          Hint = '[[cols:xs-10 sm-10 md-6]]'
                          ParentColor = False
                          TabOrder = 1
                          DesignSize = (
                            136
                            43)
                          object UniLabel14: TUniLabel
                            Left = 0
                            Top = -3
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
                            Left = 0
                            Top = 13
                            Width = 136
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
                            OnClick = edLkpPESSOASClick
                            OnExit = edLkpPESSOASExit
                          end
                        end
                        object rcBlock140: TUniContainerPanel
                          Tag = 1
                          Left = 3
                          Top = 52
                          Width = 138
                          Height = 43
                          Hint = '[[cols:xs-10 sm-12 md-6]]'
                          ParentColor = False
                          TabOrder = 2
                          DesignSize = (
                            138
                            43)
                          object UniLabel11: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 51
                            Height = 15
                            Hint = ''
                            Caption = 'Vendedor'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 1
                          end
                          object edLkpFUNCIONARIOS: TUniDBEdit
                            Left = 0
                            Top = 13
                            Width = 133
                            Height = 29
                            Hint = 
                              '[['#13#10'NOME FUNCIONARIO COMISSAOFUNCIONARIO=COMISSAO|'#13#10'lkpfilter-em' +
                              'pty:Selecione um Vendedor<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfi' +
                              'lter-gridattr: |'#13#10'valid:blank |'#13#10'valid-required:top-in |'#13#10']]'#13#10#13#10
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
                        object rcBlock125: TUniContainerPanel
                          Tag = 1
                          Left = 158
                          Top = 5
                          Width = 103
                          Height = 43
                          Hint = '[[cols:xs-10 sm-10 md-2]]'
                          ParentColor = False
                          TabOrder = 3
                          DesignSize = (
                            103
                            43)
                          object UniEditcpfcnpj: TUniEdit
                            AlignWithMargins = True
                            Left = 0
                            Top = 13
                            Width = 98
                            Height = 29
                            Hint = ''
                            Margins.Right = 5
                            CharCase = ecUpperCase
                            BorderStyle = ubsSolid
                            Text = ''
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 1
                            ReadOnly = True
                          end
                          object UniLabel16: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 50
                            Height = 15
                            Hint = ''
                            Caption = 'CPF/CNPJ'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 2
                          end
                        end
                        object rcBlock1145: TUniContainerPanel
                          Tag = 1
                          Left = 142
                          Top = 52
                          Width = 104
                          Height = 43
                          Hint = '[[cols:xs-10 sm-12 md-3]]'
                          ParentColor = False
                          TabOrder = 4
                          DesignSize = (
                            104
                            43)
                          object UniLabel9: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 79
                            Height = 15
                            Hint = ''
                            Caption = 'Condi'#231#227'o Pgto'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 1
                          end
                          object edLkpCONDICOES: TUniDBEdit
                            Left = 0
                            Top = 13
                            Width = 98
                            Height = 29
                            Hint = 
                              '[['#13#10'DESCRICAO CONDICAO |'#13#10'lkpfilter-empty:Selecione um Pagamento' +
                              '<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:b' +
                              'lank |'#13#10'valid-required:top-in |'#13#10']]'#13#10#13#10
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
                        object rcBlock130: TUniContainerPanel
                          Tag = 1
                          Left = 280
                          Top = 5
                          Width = 113
                          Height = 43
                          Hint = '[[cols:xs-10 sm-10 md-2]]'
                          ParentColor = False
                          TabOrder = 5
                          DesignSize = (
                            113
                            43)
                          object UniEditinscricao: TUniEdit
                            AlignWithMargins = True
                            Left = 0
                            Top = 13
                            Width = 108
                            Height = 29
                            Hint = ''
                            Margins.Right = 5
                            CharCase = ecUpperCase
                            Text = ''
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 1
                            ReadOnly = True
                          end
                          object UniLabel17: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 79
                            Height = 15
                            Hint = ''
                            Caption = 'RG/INSCRI'#199#195'O'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 2
                          end
                        end
                        object rcBlock150: TUniContainerPanel
                          Tag = 1
                          Left = 249
                          Top = 52
                          Width = 222
                          Height = 43
                          Hint = '[[cols:xs-10 sm-10 md-3]]'
                          ParentColor = False
                          TabOrder = 6
                          DesignSize = (
                            222
                            43)
                          object UniComboBoxparaop: TUniComboBox
                            AlignWithMargins = True
                            Left = 0
                            Top = 13
                            Width = 217
                            Height = 29
                            Hint = ''
                            Style = csDropDownList
                            Text = ''
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 1
                            IconItems = <>
                          end
                          object UniLabel8: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 81
                            Height = 15
                            Hint = ''
                            Caption = 'Tipo Opera'#231#227'o'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 2
                          end
                        end
                        object rcBlock135: TUniContainerPanel
                          Tag = 1
                          Left = 412
                          Top = 5
                          Width = 107
                          Height = 43
                          Hint = '[[cols:xs-10 sm-10 md-2]]'
                          ParentColor = False
                          TabOrder = 7
                          DesignSize = (
                            107
                            43)
                          object UniEditrenasem: TUniEdit
                            AlignWithMargins = True
                            Left = 0
                            Top = 13
                            Width = 102
                            Height = 29
                            Hint = ''
                            Margins.Right = 5
                            CharCase = ecUpperCase
                            Text = ''
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 1
                            ReadOnly = True
                          end
                          object UniLabel19: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 51
                            Height = 15
                            Hint = ''
                            Caption = 'RENASEM'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 2
                          end
                        end
                      end
                      object rcBlock112: TUniContainerPanel
                        Tag = 1
                        Left = 547
                        Top = 41
                        Width = 413
                        Height = 102
                        Hint = '[[cols:xs-12 sm-12 md-4]]'
                        ParentColor = False
                        TabOrder = 3
                        object rcBlock160: TUniContainerPanel
                          Tag = 1
                          Left = 147
                          Top = 3
                          Width = 120
                          Height = 43
                          Hint = '[[cols:xs-12 sm-12 md-4]]'
                          ParentColor = False
                          TabOrder = 1
                          DesignSize = (
                            120
                            43)
                          object UniDBEdit9: TUniDBEdit
                            AlignWithMargins = True
                            Left = 0
                            Top = 13
                            Width = 117
                            Height = 29
                            Hint = ''
                            DataField = 'NUMERO'
                            DataSource = dsMaster
                            Anchors = [akLeft, akTop, akRight]
                            ParentFont = False
                            Font.Color = clWhite
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            Font.Style = [fsBold]
                            TabOrder = 1
                            Color = clGray
                            ReadOnly = True
                          end
                          object UniLabel76: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 72
                            Height = 15
                            Hint = ''
                            Caption = 'Numero Nota'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 2
                          end
                        end
                        object rcBlock165: TUniContainerPanel
                          Tag = 1
                          Left = 295
                          Top = 5
                          Width = 105
                          Height = 43
                          Hint = '[[cols:xs-12 sm-12 md-4]]'
                          ParentColor = False
                          TabOrder = 2
                          DesignSize = (
                            105
                            43)
                          object UniDBDateTimePicker3: TUniDBDateTimePicker
                            AlignWithMargins = True
                            Left = 3
                            Top = 13
                            Width = 100
                            Height = 29
                            Hint = ''
                            DataField = 'EMISSAO'
                            DataSource = dsMaster
                            DateTime = 44561.000000000000000000
                            DateFormat = 'dd/MM/yyyy'
                            TimeFormat = 'HH:mm:ss'
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 1
                          end
                          object UniLabel74: TUniLabel
                            Left = 0
                            Top = -3
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
                        object rcBlock170: TUniContainerPanel
                          Tag = 1
                          Left = 160
                          Top = 49
                          Width = 107
                          Height = 43
                          Hint = '[[cols:xs-12 sm-12 md-4]]'
                          ParentColor = False
                          TabOrder = 3
                          DesignSize = (
                            107
                            43)
                          object UniEdit3: TUniEdit
                            AlignWithMargins = True
                            Left = 2
                            Top = 13
                            Width = 102
                            Height = 29
                            Hint = ''
                            Margins.Right = 5
                            CharCase = ecUpperCase
                            Text = ''
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 1
                            ReadOnly = True
                          end
                          object UniLabel18: TUniLabel
                            Left = 2
                            Top = -3
                            Width = 51
                            Height = 15
                            Hint = ''
                            Caption = 'RENASEM'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 2
                          end
                        end
                        object rcBlock175: TUniContainerPanel
                          Tag = 1
                          Left = 295
                          Top = 51
                          Width = 108
                          Height = 43
                          Hint = '[[cols:xs-12 sm-12 md-6]]'
                          ParentColor = False
                          TabOrder = 4
                          DesignSize = (
                            108
                            43)
                          object UniDBDateTimePicker4: TUniDBDateTimePicker
                            AlignWithMargins = True
                            Left = 3
                            Top = 13
                            Width = 103
                            Height = 29
                            Hint = ''
                            DataField = 'RECEPCAODESPACHO'
                            DataSource = dsMaster
                            DateTime = 44561.000000000000000000
                            DateFormat = 'dd/MM/yyyy'
                            TimeFormat = 'HH:mm:ss'
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 1
                          end
                          object UniLabel75: TUniLabel
                            Left = 2
                            Top = -3
                            Width = 31
                            Height = 15
                            Hint = ''
                            Caption = 'Saida'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 2
                          end
                        end
                        object rcBlock155: TUniContainerPanel
                          Tag = 1
                          Left = 13
                          Top = 3
                          Width = 120
                          Height = 43
                          Hint = '[[cols:xs-12 sm-12 md-4]]'
                          ParentColor = False
                          TabOrder = 5
                          DesignSize = (
                            120
                            43)
                          object UniDBEdit1: TUniDBEdit
                            AlignWithMargins = True
                            Left = 0
                            Top = 13
                            Width = 117
                            Height = 29
                            Hint = ''
                            DataField = 'CANCELADA'
                            DataSource = dsMaster
                            Anchors = [akLeft, akTop, akRight]
                            ParentFont = False
                            Font.Color = clGreen
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            Font.Style = [fsBold]
                            TabOrder = 1
                            Color = clWhite
                            ReadOnly = True
                          end
                          object UniLabel2: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 34
                            Height = 15
                            Hint = ''
                            Caption = 'Status'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 2
                          end
                        end
                      end
                    end
                    object rcBlock180: TUniContainerPanel
                      Tag = 1
                      AlignWithMargins = True
                      Left = 13
                      Top = 172
                      Width = 963
                      Height = 144
                      Hint = 
                        '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
                        'ite |'#13#10']]'#13#10#13#10#13#10#13#10
                      Margins.Left = 15
                      Margins.Top = 15
                      Margins.Right = 15
                      Margins.Bottom = 10
                      ParentColor = False
                      TabOrder = 3
                      object rcBlock181: TUniContainerPanel
                        Left = 0
                        Top = 1
                        Width = 961
                        Height = 25
                        Hint = 
                          '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'noborder-right' +
                          ' | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                        ParentColor = False
                        Color = clSilver
                        TabOrder = 1
                        DesignSize = (
                          961
                          25)
                        object UniLabel3: TUniLabel
                          Left = 927
                          Top = 3
                          Width = 10
                          Height = 26
                          Hint = '[['#13#10'collapse:rcBlock180 off-28 ]]'#13#10
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
                      end
                      object rcBlock200: TUniContainerPanel
                        Tag = 1
                        Left = 438
                        Top = 37
                        Width = 522
                        Height = 102
                        Hint = '[[cols:xs-12 sm-12 md-4]]'
                        ParentColor = False
                        TabOrder = 2
                        DesignSize = (
                          522
                          102)
                        object rcBlock220: TUniContainerPanel
                          Tag = 1
                          Left = 122
                          Top = 2
                          Width = 117
                          Height = 43
                          Hint = '[[cols:xs-12 sm-12 md-3]]'
                          ParentColor = False
                          TabOrder = 1
                          DesignSize = (
                            117
                            43)
                          object UniLabel24: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 51
                            Height = 15
                            Hint = ''
                            Caption = 'Desconto'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 1
                          end
                          object UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit
                            Left = 0
                            Top = 13
                            Width = 113
                            Height = 29
                            Hint = ''
                            DataField = 'VLRDESCONTOS'
                            DataSource = dsMaster
                            Anchors = [akLeft, akTop, akRight]
                            ParentFont = False
                            Font.Color = clRed
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 2
                            DecimalSeparator = ','
                            ThousandSeparator = '.'
                            OnExit = UniDBFormattedNumberEditdescontosExit
                          end
                        end
                        object rcBlock210: TUniContainerPanel
                          Tag = 1
                          Left = 9
                          Top = 3
                          Width = 107
                          Height = 43
                          Hint = '[[cols:xs-12 sm-12 md-3]]'
                          ParentColor = False
                          TabOrder = 2
                          DesignSize = (
                            107
                            43)
                          object UniLabel25: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 69
                            Height = 15
                            Hint = ''
                            Caption = 'Vlr Produtos'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 1
                          end
                          object UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit
                            AlignWithMargins = True
                            Left = 0
                            Top = 13
                            Width = 104
                            Height = 29
                            Hint = ''
                            DataField = 'VLRPRODUTOS'
                            DataSource = dsMaster
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 2
                            ReadOnly = True
                            DecimalSeparator = ','
                            ThousandSeparator = '.'
                          end
                        end
                        object rcBlock230: TUniContainerPanel
                          Tag = 1
                          Left = 245
                          Top = 3
                          Width = 129
                          Height = 43
                          Hint = '[[cols:xs-12 sm-12 md-3]]'
                          ParentColor = False
                          TabOrder = 3
                          DesignSize = (
                            129
                            43)
                          object UniLabel27: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 52
                            Height = 15
                            Hint = ''
                            Caption = 'Despesas'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 1
                          end
                          object UniDBFormattedNumberEditvlrdespesas: TUniDBFormattedNumberEdit
                            Left = 0
                            Top = 13
                            Width = 127
                            Height = 29
                            Hint = ''
                            DataField = 'VLRDESPESAS'
                            DataSource = dsMaster
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 2
                            DecimalSeparator = ','
                            ThousandSeparator = '.'
                            OnExit = UniDBFormattedNumberEditvlrdespesasExit
                          end
                        end
                        object rcBlock240: TUniContainerPanel
                          Tag = 1
                          Left = 389
                          Top = 3
                          Width = 132
                          Height = 43
                          Hint = '[[cols:xs-12 sm-12 md-3]]'
                          ParentColor = False
                          TabOrder = 4
                          DesignSize = (
                            132
                            43)
                          object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
                            AlignWithMargins = True
                            Left = 0
                            Top = 13
                            Width = 128
                            Height = 29
                            Hint = ''
                            DataField = 'VLRPRODUTOS'
                            DataSource = dsMaster
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 1
                            ReadOnly = True
                            DecimalSeparator = ','
                            ThousandSeparator = '.'
                          end
                          object UniLabel15: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 69
                            Height = 15
                            Hint = ''
                            Caption = 'Vlr Produtos'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 2
                          end
                        end
                        object rcBlock250: TUniContainerPanel
                          Tag = 1
                          Left = 10
                          Top = 50
                          Width = 129
                          Height = 43
                          Hint = '[[cols:xs-12 sm-12 md-3]]'
                          ParentColor = False
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 5
                          DesignSize = (
                            129
                            43)
                          object UniLabel30: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 27
                            Height = 15
                            Hint = ''
                            Caption = 'Frete'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 1
                          end
                          object UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit
                            Left = 0
                            Top = 13
                            Width = 124
                            Height = 29
                            Hint = ''
                            DataField = 'VLRDSPNTRIBUTADA'
                            DataSource = dsMaster
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 2
                            ReadOnly = True
                            DecimalSeparator = ','
                            ThousandSeparator = '.'
                          end
                        end
                        object rcBlock265: TUniContainerPanel
                          Tag = 1
                          Left = 278
                          Top = 51
                          Width = 105
                          Height = 86
                          Hint = '[[cols:xs-12 sm-12 md-3]]'
                          ParentColor = False
                          TabOrder = 6
                          DesignSize = (
                            105
                            86)
                          object UniLabel77: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 72
                            Height = 15
                            Hint = ''
                            Caption = 'Desonera'#231#227'o'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 3
                          end
                          object UniComboBoxDesoneracao: TUniComboBox
                            AlignWithMargins = True
                            Left = 0
                            Top = 13
                            Width = 101
                            Height = 29
                            Hint = ''
                            Style = csDropDownList
                            Text = 'Nao'
                            Items.Strings = (
                              'Nao'
                              'Sim')
                            ItemIndex = 0
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 1
                            IconItems = <>
                          end
                          object UniDBFormattedNumberEditVLRICMSDESONERACAO: TUniDBFormattedNumberEdit
                            Left = 0
                            Top = 44
                            Width = 101
                            Height = 29
                            Hint = ''
                            DataField = 'VLRICMSDESONERACAO'
                            DataSource = dsMaster
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 2
                            ReadOnly = True
                            DecimalSeparator = ','
                            ThousandSeparator = '.'
                          end
                        end
                        object rcBlock269: TUniContainerPanel
                          Tag = 1
                          Left = 392
                          Top = 51
                          Width = 105
                          Height = 43
                          Hint = '[[cols:xs-12 sm-12 md-3]]'
                          ParentColor = False
                          TabOrder = 7
                          DesignSize = (
                            105
                            43)
                          object UniLabel26: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 46
                            Height = 15
                            Hint = ''
                            Caption = 'Vlr Total'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 1
                          end
                          object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
                            AlignWithMargins = True
                            Left = 0
                            Top = 13
                            Width = 102
                            Height = 29
                            Hint = ''
                            DataField = 'VLRTOTAL'
                            DataSource = dsMaster
                            Anchors = [akLeft, akTop, akRight]
                            ParentFont = False
                            Font.Color = clBlue
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            Font.Style = [fsBold, fsItalic]
                            TabOrder = 2
                            ReadOnly = True
                            DecimalSeparator = ','
                            ThousandSeparator = '.'
                          end
                        end
                        object rcBlock255: TUniContainerPanel
                          Tag = 1
                          Left = 145
                          Top = 51
                          Width = 129
                          Height = 43
                          Hint = '[[cols:xs-12 sm-12 md-3]]'
                          ParentColor = False
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 8
                          DesignSize = (
                            129
                            43)
                          object UniLabel22: TUniLabel
                            Left = 0
                            Top = -3
                            Width = 66
                            Height = 15
                            Hint = ''
                            Caption = '% Comiss'#227'o'
                            ParentFont = False
                            Font.Height = -13
                            Font.Name = 'Calibri'
                            TabOrder = 1
                          end
                          object UniDBFormattedNumberEdit11: TUniDBFormattedNumberEdit
                            Left = 0
                            Top = 13
                            Width = 124
                            Height = 29
                            Hint = ''
                            DataField = 'COMISSAOFUNCIONARIO'
                            DataSource = dsMaster
                            Anchors = [akLeft, akTop, akRight]
                            TabOrder = 2
                            ReadOnly = True
                            DecimalSeparator = ','
                            ThousandSeparator = '.'
                          end
                        end
                      end
                      object rcBlock190: TUniContainerPanel
                        Tag = 1
                        Left = 3
                        Top = 37
                        Width = 413
                        Height = 102
                        Hint = '[[cols:xs-12 sm-12 md-8]]'
                        ParentColor = False
                        TabOrder = 3
                        object UniDBMemoobs: TUniDBMemo
                          AlignWithMargins = True
                          Left = 3
                          Top = 3
                          Width = 407
                          Height = 96
                          Hint = ''
                          DataField = 'OBSERVACOES'
                          DataSource = dsMaster
                          Align = alClient
                          TabOrder = 1
                        end
                      end
                    end
                  end
                end
                object UniTabSheetfaturamento: TUniTabSheet
                  Hint = ''
                  Caption = 'Faturamento'
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 256
                  ExplicitHeight = 128
                  object UniScrollBox5: TUniScrollBox
                    Left = 0
                    Top = 0
                    Width = 1345
                    Height = 929
                    Hint = ''
                    Align = alClient
                    TabOrder = 0
                    DesignSize = (
                      1343
                      923)
                    ScrollHeight = 386
                    ScrollWidth = 847
                    object rcBlock430: TUniContainerPanel
                      Left = 2
                      Top = 3
                      Width = 1252
                      Height = 25
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                      ParentColor = False
                      Color = clSkyBlue
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 0
                      object UniLabel48: TUniLabel
                        AlignWithMargins = True
                        Left = 2
                        Top = 4
                        Width = 251
                        Height = 19
                        Hint = '[[cols:12 | round:all]]'
                        Margins.Left = 6
                        Margins.Top = 6
                        Margins.Right = 6
                        Margins.Bottom = 6
                        AutoSize = False
                        Caption = 'DADOS PARA FATURAMENTO'
                        ParentFont = False
                        Font.Color = clGray
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                    end
                    object rcBlock440: TUniContainerPanel
                      Left = 88
                      Top = 32
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 1
                      DesignSize = (
                        150
                        48)
                      object UniLabel49: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 31
                        Height = 15
                        Hint = ''
                        Caption = 'Nome'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit10: TUniDBEdit
                        Left = 1
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'NOME'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        ReadOnly = True
                      end
                    end
                    object rcBlock450: TUniContainerPanel
                      Left = 281
                      Top = 32
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 2
                      DesignSize = (
                        150
                        48)
                      object UniLabel50: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 48
                        Height = 15
                        Hint = ''
                        Caption = 'Fantasia'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit11: TUniDBEdit
                        Left = 0
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'FANTASIA'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        ReadOnly = True
                      end
                    end
                    object rcBlock460: TUniContainerPanel
                      Tag = 1
                      Left = 3
                      Top = 85
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        150
                        48)
                      object UniLabel51: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 48
                        Height = 15
                        Hint = ''
                        Caption = 'Cpf/Cnpj'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit12: TUniDBEdit
                        Left = 2
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'CPFCNPJ'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        ReadOnly = True
                      end
                    end
                    object rcBlock470: TUniContainerPanel
                      Tag = 1
                      Left = 196
                      Top = 85
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        150
                        48)
                      object UniLabel52: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 70
                        Height = 15
                        Hint = ''
                        Caption = 'Rg/Inscri'#231#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEditinscricao: TUniDBEdit
                        Left = 2
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'INSCRICAO'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        ReadOnly = True
                      end
                    end
                    object rcBlock480: TUniContainerPanel
                      Tag = 1
                      Left = 372
                      Top = 85
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        150
                        48)
                      object UniLabel53: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 70
                        Height = 15
                        Hint = ''
                        Caption = 'Rg/Inscri'#231#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit14: TUniDBEdit
                        Left = 1
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'INSCRICAO'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        ReadOnly = True
                      end
                    end
                    object rcBlock490: TUniContainerPanel
                      Tag = 1
                      Left = 542
                      Top = 85
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        150
                        48)
                      object UniDBEdit15: TUniDBEdit
                        Left = 4
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'RENASEM'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel54: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 51
                        Height = 15
                        Hint = ''
                        Caption = 'RENASEM'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock500: TUniContainerPanel
                      Tag = 1
                      Left = 697
                      Top = 85
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        150
                        48)
                      object UniDBEdit16: TUniDBEdit
                        Left = 4
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'PRODUTOR'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel55: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 65
                        Height = 15
                        Hint = ''
                        Caption = 'N'#186' Produtor'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock510: TUniContainerPanel
                      Tag = 1
                      Left = 3
                      Top = 143
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 8
                      DesignSize = (
                        150
                        48)
                      object UniDBEdit17: TUniDBEdit
                        Left = 2
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'CEP'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel56: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 20
                        Height = 15
                        Hint = ''
                        Caption = 'Cep'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock520: TUniContainerPanel
                      Tag = 1
                      Left = 196
                      Top = 143
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 9
                      DesignSize = (
                        150
                        48)
                      object UniDBEdit18: TUniDBEdit
                        Left = 2
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'ENDERECO'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel57: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 50
                        Height = 15
                        Hint = ''
                        Caption = 'Endere'#231'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock530: TUniContainerPanel
                      Tag = 1
                      Left = 382
                      Top = 143
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 10
                      DesignSize = (
                        150
                        48)
                      object UniDBEdit19: TUniDBEdit
                        Left = 0
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'NUMERO'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel58: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 43
                        Height = 15
                        Hint = ''
                        Caption = 'Numero'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock540: TUniContainerPanel
                      Tag = 1
                      Left = 558
                      Top = 142
                      Width = 557
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 11
                      DesignSize = (
                        557
                        48)
                      object UniDBEdit20: TUniDBEdit
                        Left = 3
                        Top = 20
                        Width = 553
                        Height = 29
                        Hint = ''
                        DataField = 'BAIRRO'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel59: TUniLabel
                        Left = 2
                        Top = 1
                        Width = 35
                        Height = 15
                        Hint = ''
                        Caption = 'Bairro'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock550: TUniContainerPanel
                      Tag = 1
                      Left = 3
                      Top = 198
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-9]]'
                      ParentColor = False
                      TabOrder = 12
                      DesignSize = (
                        150
                        48)
                      object UniDBEdit21: TUniDBEdit
                        Left = 1
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'CIDADE'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel60: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 38
                        Height = 15
                        Hint = ''
                        Caption = 'Cidade'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock560: TUniContainerPanel
                      Tag = 1
                      Left = 196
                      Top = 198
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-1]]'
                      ParentColor = False
                      TabOrder = 13
                      DesignSize = (
                        150
                        48)
                      object UniDBEditestado: TUniDBEdit
                        Left = 2
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'ESTADO'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel61: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 37
                        Height = 15
                        Hint = ''
                        Caption = 'Estado'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock570: TUniContainerPanel
                      Tag = 1
                      Left = 372
                      Top = 198
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 14
                      DesignSize = (
                        150
                        48)
                      object UniDBEdit23: TUniDBEdit
                        Left = 2
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'CODIIBGE'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel62: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 25
                        Height = 15
                        Hint = ''
                        Caption = 'IBGE'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock580: TUniContainerPanel
                      Left = 3
                      Top = 249
                      Width = 1252
                      Height = 25
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                      ParentColor = False
                      Color = clSkyBlue
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 15
                      object UniLabel63: TUniLabel
                        AlignWithMargins = True
                        Left = 2
                        Top = 3
                        Width = 251
                        Height = 19
                        Hint = '[[cols:12 | round:all]]'
                        Margins.Left = 6
                        Margins.Top = 6
                        Margins.Right = 6
                        Margins.Bottom = 6
                        AutoSize = False
                        Caption = 'DADOS PARA COBRAN'#199'A'
                        ParentFont = False
                        Font.Color = clGray
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                    end
                    object rcBlock590: TUniContainerPanel
                      Tag = 1
                      Left = 3
                      Top = 278
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 16
                      DesignSize = (
                        150
                        48)
                      object UniDBEdit24: TUniDBEdit
                        Left = 1
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'CEPCOBRANCA'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel64: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 76
                        Height = 15
                        Hint = ''
                        Caption = 'Cep Cobran'#231'a'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock600: TUniContainerPanel
                      Tag = 1
                      Left = 196
                      Top = 278
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 17
                      DesignSize = (
                        150
                        48)
                      object UniDBEdit25: TUniDBEdit
                        Left = 2
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'ENDERECOCOBRANCA'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel65: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 106
                        Height = 15
                        Hint = ''
                        Caption = 'Endere'#231'o Cobran'#231'a'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock610: TUniContainerPanel
                      Tag = 1
                      Left = 382
                      Top = 278
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 18
                      DesignSize = (
                        150
                        48)
                      object UniDBEdit26: TUniDBEdit
                        Left = 2
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'NUMEROCOBRANCA'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel66: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 99
                        Height = 15
                        Hint = ''
                        Caption = 'Numero Cobran'#231'a'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock620: TUniContainerPanel
                      Tag = 1
                      Left = 558
                      Top = 277
                      Width = 557
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 19
                      DesignSize = (
                        557
                        48)
                      object UniDBEdit27: TUniDBEdit
                        Left = 4
                        Top = 19
                        Width = 553
                        Height = 29
                        Hint = ''
                        DataField = 'NUMEROCOBRANCA'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel67: TUniLabel
                        Left = 2
                        Top = 1
                        Width = 91
                        Height = 15
                        Hint = ''
                        Caption = 'Bairro Cobran'#231'a'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock630: TUniContainerPanel
                      Left = 88
                      Top = 335
                      Width = 150
                      Height = 51
                      Hint = '[[cols:xs-12 sm-12 md-10]]'
                      ParentColor = False
                      TabOrder = 20
                      DesignSize = (
                        150
                        51)
                      object UniDBEdit28: TUniDBEdit
                        Left = 1
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'CIDADECOBRANCA'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel68: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 38
                        Height = 15
                        Hint = ''
                        Caption = 'Cidade'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock640: TUniContainerPanel
                      Left = 281
                      Top = 335
                      Width = 150
                      Height = 51
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 21
                      DesignSize = (
                        150
                        51)
                      object UniDBEdit29: TUniDBEdit
                        Left = 0
                        Top = 19
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'ESTADOCOBRANCA'
                        DataSource = dspessoas
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel69: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 37
                        Height = 15
                        Hint = ''
                        Caption = 'Estado'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      inherited paSearchFilters: TUniPanel
        inherited UniScrollBox1: TUniScrollBox
          ScrollHeight = 746
          ScrollWidth = 164
          inherited paSearchBtn: TUniContainerPanel
            inherited btnSearchCRUD: TUniBitBtn
              ScreenMask.Target = Owner
            end
          end
        end
      end
    end
  end
  inherited rcSweetAlert: TUniSweetAlert
    Left = 1276
    Top = 132
  end
  inherited dsMaster: TDataSource
    Left = 1123
    Top = 607
  end
  inherited dsSearchMaster: TDataSource
    Left = 1243
    Top = 687
  end
  inherited sqlSearchMaster: TFDQuery
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      
        ' SELECT           M.CODIGO, M.NUMERO,M.EMISSAO,M.SERIE,M.CANCELA' +
        'DA,M.PESSOA,P.CIDADE,P.ESTADO,P.NOME, M.CODIGOBARRAS, M.VLRTOTAL' +
        '  FROM'
      ' MVMESTRE  M INNER JOIN PESSOAS P ON (M.PESSOA = P.CODIGO)')
    Left = 833
    Top = 487
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object FDQryFiltroNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object FDQryFiltroSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 3
    end
    object FDQryFiltroCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      Size = 1
    end
    object FDQryFiltroPESSOA: TIntegerField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
    end
    object FDQryFiltroCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FDQryFiltroESTADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object FDQryFiltroCODIGOBARRAS: TStringField
      FieldName = 'CODIGOBARRAS'
      Origin = 'CODIGOBARRAS'
      Size = 45
    end
    object FDQryFiltroNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object FDQryFiltroVLRTOTAL: TFMTBCDField
      FieldName = 'VLRTOTAL'
      Origin = 'VLRTOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object FDQryFiltrostatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'status'
      OnGetText = FDQryFiltrostatusGetText
      Calculated = True
    end
    object FDQryFiltroopcoes: TStringField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'opcoes'
      OnGetText = FDQryFiltroopcoesGetText
      FixedChar = True
      Calculated = True
    end
    object FDQryFiltroEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object sqlSearchMasterKEY: TStringField
      FieldName = 'KEY'
      Size = 38
    end
    object sqlSearchMasterEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object sqlSearchMasterDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
    end
  end
  inherited sqlMaster: TFDQuery
    AfterOpen = sqlMasterAfterOpen
    UpdateOptions.UpdateTableName = 'MVMESTRE'
    UpdateOptions.KeyFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM MVMESTRE WHERE CODIGO = :table_pk')
    Left = 873
    Top = 367
    ParamData = <
      item
        Name = 'TABLE_PK'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object sqlMasterKEY: TStringField
      FieldName = 'KEY'
      Origin = '"KEY"'
      Required = True
      Size = 38
    end
    object sqlMasterCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlMasterDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
    end
    object sqlMasterCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      OnGetText = sqlMasterCANCELADAGetText
      Size = 1
    end
    object sqlMasterOPERACAO: TIntegerField
      FieldName = 'OPERACAO'
      Origin = 'OPERACAO'
    end
    object sqlMasterEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
    end
    object sqlMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object sqlMasterSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 3
    end
    object sqlMasterPESSOA: TIntegerField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
    end
    object sqlMasterCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Origin = 'CPFCNPJ'
      Size = 15
    end
    object sqlMasterFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Origin = 'FUNCIONARIO'
    end
    object sqlMasterEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object sqlMasterRECEPCAODESPACHO: TDateField
      FieldName = 'RECEPCAODESPACHO'
      Origin = 'RECEPCAODESPACHO'
    end
    object sqlMasterOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object sqlMasterCODIGOBARRAS: TStringField
      FieldName = 'CODIGOBARRAS'
      Origin = 'CODIGOBARRAS'
      Size = 45
    end
    object sqlMasterPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
      Size = 25
    end
    object sqlMasterVLRDSPTRIBUTADA: TFMTBCDField
      FieldName = 'VLRDSPTRIBUTADA'
      Origin = 'VLRDSPTRIBUTADA'
      Precision = 18
      Size = 2
    end
    object sqlMasterVLRDSPNTRIBUTADA: TFMTBCDField
      FieldName = 'VLRDSPNTRIBUTADA'
      Origin = 'VLRDSPNTRIBUTADA'
      Precision = 18
      Size = 2
    end
    object sqlMasterVLRBASEICMS: TFMTBCDField
      FieldName = 'VLRBASEICMS'
      Origin = 'VLRBASEICMS'
      Precision = 18
      Size = 2
    end
    object sqlMasterVLRICMS: TFMTBCDField
      FieldName = 'VLRICMS'
      Origin = 'VLRICMS'
      Precision = 18
      Size = 2
    end
    object sqlMasterVLRBASESUBSTITUICAO: TFMTBCDField
      FieldName = 'VLRBASESUBSTITUICAO'
      Origin = 'VLRBASESUBSTITUICAO'
      Precision = 18
      Size = 2
    end
    object sqlMasterVLRSUBSTITUICAO: TFMTBCDField
      FieldName = 'VLRSUBSTITUICAO'
      Origin = 'VLRSUBSTITUICAO'
      Precision = 18
      Size = 2
    end
    object sqlMasterVLRIPI: TFMTBCDField
      FieldName = 'VLRIPI'
      Origin = 'VLRIPI'
      Precision = 18
      Size = 2
    end
    object sqlMasterVLRSERVICOS: TFMTBCDField
      FieldName = 'VLRSERVICOS'
      Origin = 'VLRSERVICOS'
      Precision = 18
      Size = 2
    end
    object sqlMasterVLRDESCONTOS: TFMTBCDField
      FieldName = 'VLRDESCONTOS'
      Origin = 'VLRDESCONTOS'
      Precision = 18
      Size = 2
    end
    object sqlMasterVLRPRODUTOS: TFMTBCDField
      FieldName = 'VLRPRODUTOS'
      Origin = 'VLRPRODUTOS'
      Precision = 18
      Size = 2
    end
    object sqlMasterVLRTOTAL: TFMTBCDField
      FieldName = 'VLRTOTAL'
      Origin = 'VLRTOTAL'
      Precision = 18
      Size = 2
    end
    object sqlMasterVLRENTRADA: TFMTBCDField
      FieldName = 'VLRENTRADA'
      Origin = 'VLRENTRADA'
      Precision = 18
      Size = 2
    end
    object sqlMasterVLRDESPESAS: TFMTBCDField
      FieldName = 'VLRDESPESAS'
      Origin = 'VLRDESPESAS'
      Precision = 18
      Size = 2
    end
    object sqlMasterVLRIMPOSTO: TFMTBCDField
      FieldName = 'VLRIMPOSTO'
      Origin = 'VLRIMPOSTO'
      Precision = 18
      Size = 2
    end
    object sqlMasterCONDICAO: TIntegerField
      FieldName = 'CONDICAO'
      Origin = 'CONDICAO'
    end
    object sqlMasterCOMISSAOFUNCIONARIO: TFMTBCDField
      FieldName = 'COMISSAOFUNCIONARIO'
      Origin = 'COMISSAOFUNCIONARIO'
      Precision = 18
      Size = 2
    end
    object sqlMasterTRANSPORTADORA: TIntegerField
      FieldName = 'TRANSPORTADORA'
      Origin = 'TRANSPORTADORA'
    end
    object sqlMasterTRAFRETE: TStringField
      FieldName = 'TRAFRETE'
      Origin = 'TRAFRETE'
      Size = 15
    end
    object sqlMasterTRAESPECIE: TStringField
      FieldName = 'TRAESPECIE'
      Origin = 'TRAESPECIE'
    end
    object sqlMasterTRAMARCA: TStringField
      FieldName = 'TRAMARCA'
      Origin = 'TRAMARCA'
    end
    object sqlMasterTRAPESOBRUTO: TFMTBCDField
      FieldName = 'TRAPESOBRUTO'
      Origin = 'TRAPESOBRUTO'
      Precision = 18
      Size = 2
    end
    object sqlMasterTRAPESOLIQUIDO: TFMTBCDField
      FieldName = 'TRAPESOLIQUIDO'
      Origin = 'TRAPESOLIQUIDO'
      Precision = 18
      Size = 2
    end
    object sqlMasterTRAQUANTIDADE: TFMTBCDField
      FieldName = 'TRAQUANTIDADE'
      Origin = 'TRAQUANTIDADE'
      Precision = 18
      Size = 2
    end
    object sqlMasterNUMEROPEDIDO: TStringField
      FieldName = 'NUMEROPEDIDO'
      Origin = 'NUMEROPEDIDO'
      Size = 10
    end
    object sqlMasterSIGLAPAIS: TStringField
      FieldName = 'SIGLAPAIS'
      Origin = 'SIGLAPAIS'
      Size = 7
    end
    object sqlMasterPORTADOR: TIntegerField
      FieldName = 'PORTADOR'
      Origin = 'PORTADOR'
    end
    object sqlMasterAPLICACAO: TIntegerField
      FieldName = 'APLICACAO'
      Origin = 'APLICACAO'
    end
    object sqlMasterPLANOCONTAS: TIntegerField
      FieldName = 'PLANOCONTAS'
      Origin = 'PLANOCONTAS'
    end
    object sqlMasterLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 60
    end
    object sqlMasterSAFRA: TIntegerField
      FieldName = 'SAFRA'
      Origin = 'SAFRA'
    end
    object sqlMasterCODIGOBARRASCOMPLEMENTO: TStringField
      FieldName = 'CODIGOBARRASCOMPLEMENTO'
      Origin = 'CODIGOBARRASCOMPLEMENTO'
      Size = 50
    end
    object sqlMasterLOGINCLUSAO: TStringField
      FieldName = 'LOGINCLUSAO'
      Origin = 'LOGINCLUSAO'
      Size = 60
    end
    object sqlMasterLOGALTERACAO: TStringField
      FieldName = 'LOGALTERACAO'
      Origin = 'LOGALTERACAO'
      Size = 60
    end
    object sqlMasterLOGTITULOS: TStringField
      FieldName = 'LOGTITULOS'
      Origin = 'LOGTITULOS'
      Size = 60
    end
    object sqlMasterLOGENVIO: TStringField
      FieldName = 'LOGENVIO'
      Origin = 'LOGENVIO'
      Size = 60
    end
    object sqlMasterLOGCANCELA: TStringField
      FieldName = 'LOGCANCELA'
      Origin = 'LOGCANCELA'
      Size = 60
    end
    object sqlMasterLOGCARTA: TStringField
      FieldName = 'LOGCARTA'
      Origin = 'LOGCARTA'
      Size = 60
    end
    object sqlMasterCARTACORRECAO: TStringField
      FieldName = 'CARTACORRECAO'
      Origin = 'CARTACORRECAO'
      Size = 200
    end
    object sqlMasterDATACARTA: TDateField
      FieldName = 'DATACARTA'
      Origin = 'DATACARTA'
    end
    object sqlMasterBARRASCORRECAO: TStringField
      FieldName = 'BARRASCORRECAO'
      Origin = 'BARRASCORRECAO'
      Size = 50
    end
    object sqlMasterPROTOCOLOCORRECAO: TStringField
      FieldName = 'PROTOCOLOCORRECAO'
      Origin = 'PROTOCOLOCORRECAO'
      Size = 25
    end
    object sqlMasterDATANOTA: TDateField
      FieldName = 'DATANOTA'
      Origin = 'DATANOTA'
    end
    object sqlMasterHORANOTA: TTimeField
      FieldName = 'HORANOTA'
      Origin = 'HORANOTA'
    end
    object sqlMasterIMPORTAR: TStringField
      FieldName = 'IMPORTAR'
      Origin = 'IMPORTAR'
      Size = 1
    end
    object sqlMasterOBSPEDIDO: TStringField
      FieldName = 'OBSPEDIDO'
      Origin = 'OBSPEDIDO'
      Size = 900
    end
    object sqlMasterPEDIDO: TStringField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      Size = 10
    end
    object sqlMasterPEDIDO_SERIE: TStringField
      FieldName = 'PEDIDO_SERIE'
      Origin = 'PEDIDO_SERIE'
      Size = 5
    end
    object sqlMasterPEDIDO_DOCUMENTO: TStringField
      FieldName = 'PEDIDO_DOCUMENTO'
      Origin = 'PEDIDO_DOCUMENTO'
      Size = 1
    end
    object sqlMasterPARAMETROOPERACAO: TStringField
      FieldName = 'PARAMETROOPERACAO'
      Origin = 'PARAMETROOPERACAO'
    end
    object sqlMasterENTREGA_IBGE: TStringField
      FieldName = 'ENTREGA_IBGE'
      Origin = 'ENTREGA_IBGE'
      Size = 15
    end
    object sqlMasterENTREGA_ENDERECO: TStringField
      FieldName = 'ENTREGA_ENDERECO'
      Origin = 'ENTREGA_ENDERECO'
      Size = 100
    end
    object sqlMasterENTREGA_NUMERO: TStringField
      FieldName = 'ENTREGA_NUMERO'
      Origin = 'ENTREGA_NUMERO'
      Size = 15
    end
    object sqlMasterENTREGA_CEP: TStringField
      FieldName = 'ENTREGA_CEP'
      Origin = 'ENTREGA_CEP'
      Size = 10
    end
    object sqlMasterENTREGA_BAIRRO: TStringField
      FieldName = 'ENTREGA_BAIRRO'
      Origin = 'ENTREGA_BAIRRO'
      Size = 50
    end
    object sqlMasterENTREGA_CIDADE: TStringField
      FieldName = 'ENTREGA_CIDADE'
      Origin = 'ENTREGA_CIDADE'
      Size = 60
    end
    object sqlMasterENTREGA_ESTADO: TStringField
      FieldName = 'ENTREGA_ESTADO'
      Origin = 'ENTREGA_ESTADO'
      Size = 2
    end
    object sqlMasterCHAVEACESSO: TBlobField
      FieldName = 'CHAVEACESSO'
      Origin = 'CHAVEACESSO'
    end
    object sqlMasterFECHAMENTO_DATA: TDateField
      FieldName = 'FECHAMENTO_DATA'
      Origin = 'FECHAMENTO_DATA'
    end
    object sqlMasterFECHAMENTO_OBS: TStringField
      FieldName = 'FECHAMENTO_OBS'
      Origin = 'FECHAMENTO_OBS'
      Size = 300
    end
    object sqlMasterFECHAMENTO_STATUS: TStringField
      FieldName = 'FECHAMENTO_STATUS'
      Origin = 'FECHAMENTO_STATUS'
      Size = 15
    end
    object sqlMasterTIPOLOTE: TStringField
      FieldName = 'TIPOLOTE'
      Origin = 'TIPOLOTE'
      FixedChar = True
      Size = 1
    end
    object sqlMasterVLRICMSDESONERACAO: TFMTBCDField
      FieldName = 'VLRICMSDESONERACAO'
      Origin = 'VLRICMSDESONERACAO'
      Precision = 18
      Size = 2
    end
    object sqlMasterTRANUMERO: TStringField
      FieldName = 'TRANUMERO'
      Origin = 'TRANUMERO'
      Size = 5
    end
  end
  inherited popMenuOptions: TUniPopupMenu
    Top = 226
  end
  inherited FDSchemaAdapter1: TFDSchemaAdapter
    Left = 1166
    Top = 670
  end
  object dstitulos: TDataSource
    AutoEdit = False
    DataSet = tbtitulos
    Left = 1051
    Top = 23
  end
  object tbtitulos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1137
    Top = 751
    object tbtitulosPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object tbtitulosVALOR: TFloatField
      FieldName = 'VALOR'
      currency = True
    end
    object tbtitulosVENCIMENTO: TDateTimeField
      FieldName = 'VENCIMENTO'
    end
  end
  object memprodutos: TFDMemTable
    BeforePost = memprodutosBeforePost
    AfterPost = memprodutosAfterPost
    BeforeDelete = memprodutosBeforeDelete
    AfterDelete = memprodutosAfterDelete
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 1208
    Top = 599
    object IntegerField1: TIntegerField
      FieldName = 'PRODUTO'
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object memprodutosPRECO: TFloatField
      FieldName = 'PRECO'
      DisplayFormat = '##,###,##0.0000'
      EditFormat = '##,###,##0.0000'
      currency = True
    end
    object memprodutosTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '##,###,##0.00'
      EditFormat = '##,###,##0.00'
      currency = True
    end
    object memprodutosQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object memprodutosBASEICMS: TFloatField
      FieldName = 'BASEICMS'
      currency = True
    end
    object memprodutosVALORICMS: TFloatField
      FieldName = 'VALORICMS'
      currency = True
    end
    object memprodutosPERCICMS: TFloatField
      FieldName = 'PERCICMS'
    end
    object memprodutosCST: TStringField
      FieldName = 'CST'
    end
    object memprodutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
    end
    object memprodutosPIS: TStringField
      FieldName = 'PIS'
    end
    object memprodutosCOFINS: TStringField
      FieldName = 'COFINS'
    end
    object memprodutosICM0: TFloatField
      FieldName = 'ICM0'
    end
    object memprodutosICM1: TFloatField
      FieldName = 'ICM1'
    end
    object memprodutosICM2: TFloatField
      FieldName = 'ICM2'
    end
    object memprodutosBAS0: TFloatField
      FieldName = 'BAS0'
    end
    object memprodutosBAS1: TFloatField
      FieldName = 'BAS1'
    end
    object memprodutosBAS2: TFloatField
      FieldName = 'BAS2'
    end
    object memprodutosSITUACAOLOCAL: TStringField
      FieldName = 'SITUACAOLOCAL'
    end
    object memprodutosSITUACAOOUTRAS: TStringField
      FieldName = 'SITUACAOOUTRAS'
    end
    object memprodutosDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object memprodutosDESPESAS: TFloatField
      FieldName = 'DESPESAS'
    end
    object memprodutosNUMERONCM: TStringField
      FieldName = 'NUMERONCM'
      Size = 0
    end
    object memprodutosSERIE: TStringField
      FieldName = 'SERIE'
    end
    object memprodutosSAFRA: TIntegerField
      FieldName = 'SAFRA'
    end
    object memprodutosNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object memprodutosEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object memprodutosSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object memprodutosUF: TStringField
      FieldName = 'UF'
    end
    object memprodutosPESSOA: TIntegerField
      FieldName = 'PESSOA'
    end
    object memprodutosMARGEM: TFloatField
      FieldName = 'MARGEM'
    end
    object memprodutosCOMPRA: TFloatField
      FieldName = 'COMPRA'
    end
    object memprodutosNCM: TStringField
      FieldName = 'NCM'
    end
    object memprodutosGRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object memprodutosPERCIPI: TFloatField
      FieldName = 'PERCIPI'
    end
    object memprodutosLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object memprodutosVALORIPI: TFloatField
      FieldName = 'VALORIPI'
    end
    object memprodutosOPERACAO: TIntegerField
      FieldName = 'OPERACAO'
    end
    object memprodutosPUREZA: TFloatField
      FieldName = 'PUREZA'
    end
    object memprodutosSALDOPONTO: TFloatField
      FieldName = 'SALDOPONTO'
    end
    object memprodutosTERMOSEMENTE: TStringField
      FieldName = 'TERMOSEMENTE'
    end
    object memprodutosBOLETIMSEMENTE: TStringField
      FieldName = 'BOLETIMSEMENTE'
    end
    object memprodutosVALORCULTURAL: TFloatField
      FieldName = 'VALORCULTURAL'
    end
    object memprodutosLOTESEMENTE: TStringField
      FieldName = 'LOTESEMENTE'
    end
    object memprodutosLOTEORIGEM: TStringField
      FieldName = 'LOTEORIGEM'
    end
    object memprodutosSAFRACAMPO: TStringField
      FieldName = 'SAFRACAMPO'
    end
    object memprodutosCAMPO: TStringField
      FieldName = 'CAMPO'
    end
    object memprodutosCOOPERANTE: TIntegerField
      FieldName = 'COOPERANTE'
    end
    object memprodutosGERMINACAO: TFloatField
      FieldName = 'GERMINACAO'
    end
    object memprodutosSAFRAVALIDA: TStringField
      FieldName = 'SAFRAVALIDA'
    end
    object memprodutosLOTEENTRADA: TStringField
      FieldName = 'LOTEENTRADA'
    end
    object memprodutosCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
    end
    object memprodutosCUSTOPONTO: TFloatField
      FieldName = 'CUSTOPONTO'
    end
    object memprodutosTOTALPONTO: TFloatField
      FieldName = 'TOTALPONTO'
    end
    object memprodutosPERCREDUCAO: TFloatField
      FieldName = 'PERCREDUCAO'
    end
    object memprodutosexclui: TStringField
      FieldName = 'exclui'
      OnGetText = memprodutosexcluiGetText
    end
    object memprodutosbuscaproduto: TStringField
      FieldName = 'buscaproduto'
      OnGetText = memprodutosbuscaprodutoGetText
    end
    object memprodutosbuscalote: TStringField
      FieldName = 'buscalote'
      OnGetText = memprodutosbuscaloteGetText
    end
    object memprodutosDESCRICAO_NOTA: TStringField
      FieldName = 'DESCRICAO_NOTA'
      Size = 150
    end
    object memprodutosCULTIVAR: TStringField
      FieldName = 'CULTIVAR'
      Size = 50
    end
    object memprodutosCANCELADA: TStringField
      FieldName = 'CANCELADA'
    end
    object memprodutosESTADO: TStringField
      FieldName = 'ESTADO'
    end
    object memprodutosCONTRATO: TIntegerField
      FieldName = 'CONTRATO'
    end
    object memprodutosDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
    end
    object memprodutosFRETE: TFloatField
      FieldName = 'FRETE'
    end
    object memprodutosPESOLIQUIDO: TFloatField
      FieldName = 'PESOLIQUIDO'
    end
    object memprodutosPESOBRUTO: TFloatField
      FieldName = 'PESOBRUTO'
    end
    object memprodutosEMISSAO: TStringField
      FieldName = 'EMISSAO'
      Size = 15
    end
    object memprodutosCUSTO: TFloatField
      FieldName = 'CUSTO'
    end
    object memprodutosPESOSACO: TFloatField
      FieldName = 'PESOSACO'
    end
    object memprodutosVALIDADE: TStringField
      FieldName = 'VALIDADE'
      Size = 10
    end
    object memprodutosTOTALPIS: TFloatField
      FieldName = 'TOTALPIS'
    end
    object memprodutosTOTALCOFINS: TFloatField
      FieldName = 'TOTALCOFINS'
    end
    object memprodutosVLRPIS: TFloatField
      FieldName = 'VLRPIS'
    end
    object memprodutosVLRCOFINS: TFloatField
      FieldName = 'VLRCOFINS'
    end
    object memprodutosPERCCOMISSAO: TFloatField
      FieldName = 'PERCCOMISSAO'
    end
    object memprodutosSEGURO: TFloatField
      FieldName = 'SEGURO'
    end
    object memprodutosDESPESA: TFloatField
      FieldName = 'DESPESA'
    end
    object memprodutoserro: TStringField
      Alignment = taCenter
      FieldName = 'erro'
    end
    object memprodutosopcoes: TStringField
      FieldName = 'opcoes'
      OnGetText = memprodutosopcoesGetText
    end
    object memprodutosENTREGUE: TFloatField
      FieldName = 'ENTREGUE'
    end
    object memprodutosSEMENTENOME: TStringField
      FieldName = 'SEMENTENOME'
      Size = 100
    end
    object memprodutosPERCCOFINS: TFloatField
      FieldName = 'PERCCOFINS'
    end
    object memprodutosPERCPIS: TFloatField
      FieldName = 'PERCPIS'
    end
    object memprodutosVLRICMSDESONERACAO: TFloatField
      FieldName = 'VLRICMSDESONERACAO'
    end
    object memprodutosPEDIDOOR: TStringField
      FieldName = 'PEDIDOOR'
      Size = 10
    end
    object memprodutosPEDIDOITEMOR: TStringField
      FieldName = 'PEDIDOITEMOR'
      Size = 10
    end
    object memprodutosFORNECEDORCODIGO: TStringField
      FieldName = 'FORNECEDORCODIGO'
    end
    object memprodutosCFOPENTRADA: TStringField
      FieldName = 'CFOPENTRADA'
    end
    object memprodutosVALORST: TFloatField
      FieldName = 'VALORST'
    end
    object memprodutosBASEST: TFloatField
      FieldName = 'BASEST'
    end
    object memprodutosbuscaentrada: TStringField
      FieldName = 'buscaentrada'
    end
    object memprodutosPUREZAENTRADA: TFloatField
      FieldName = 'PUREZAENTRADA'
    end
    object memprodutosVCENTRADA: TFloatField
      FieldName = 'VCENTRADA'
    end
    object memprodutosGERMINACAOENTRADA: TFloatField
      FieldName = 'GERMINACAOENTRADA'
    end
    object memprodutosTETRAZOLIO: TFloatField
      FieldName = 'TETRAZOLIO'
    end
    object memprodutosCODVEF: TIntegerField
      FieldName = 'CODVEF'
    end
    object memprodutosOBSPRODUTO: TStringField
      FieldName = 'OBSPRODUTO'
      Size = 200
    end
    object memprodutosMARCA: TStringField
      FieldName = 'MARCA'
      Size = 50
    end
  end
  object dsprodutos: TDataSource
    DataSet = memprodutos
    Left = 1284
    Top = 327
  end
  object UniPopupMenudetalhes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 663
    Top = 6
    object D1: TUniMenuItem
      Caption = 'Duplicata Mercantil'
      ImageIndex = 10
      OnClick = D1Click
    end
    object N9: TUniMenuItem
      Caption = '-'
    end
    object C1: TUniMenuItem
      Caption = 'Contrato de Transporte'
      ImageIndex = 52
      OnClick = C1Click
    end
    object N4: TUniMenuItem
      Caption = '-'
    end
    object C2: TUniMenuItem
      Caption = 'Controle de Etiqueta'
      ImageIndex = 36
      OnClick = C2Click
    end
    object N5: TUniMenuItem
      Caption = '-'
    end
    object A1: TUniMenuItem
      Caption = 'Autoriza'#231#227'o de Reembalo'
      ImageIndex = 101
      OnClick = A1Click
    end
    object N7: TUniMenuItem
      Caption = '-'
    end
    object R1: TUniMenuItem
      Caption = 'Recibo de Retirada'
      ImageIndex = 139
      OnClick = R1Click
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object d2: TUniMenuItem
      Caption = 'Declara'#231#227'o de Retirada'
      ImageIndex = 68
      OnClick = d2Click
    end
    object N8: TUniMenuItem
      Caption = '-'
    end
    object L1: TUniMenuItem
      Caption = 'Log do Movimento'
      ImageIndex = 27
      OnClick = L1Click
    end
    object N6: TUniMenuItem
      Caption = '-'
    end
    object B1: TUniMenuItem
      Caption = 'Baixar XML da Nota'
      ImageIndex = 14
      OnClick = B1Click
    end
    object N11: TUniMenuItem
      Caption = '-'
    end
    object t1: TUniMenuItem
      Caption = 'Termo de Responsabilidade'
      ImageIndex = 148
      OnClick = t1Click
    end
    object N12: TUniMenuItem
      Caption = '-'
    end
    object EntregadosItenss1: TUniMenuItem
      Caption = 'Entrega dos Itens'
      ImageIndex = 139
      OnClick = EntregadosItenss1Click
    end
    object N13: TUniMenuItem
      Caption = '-'
    end
    object A2: TUniMenuItem
      Caption = 'Cheques do Movimento'
      ImageIndex = 52
      OnClick = A2Click
    end
    object N14: TUniMenuItem
      Caption = '-'
    end
    object E2: TUniMenuItem
      Caption = 'Envio por E-mail'
      ImageIndex = 24
      OnClick = E2Click
    end
    object N15: TUniMenuItem
      Caption = '-'
    end
    object BoletoBancrio1: TUniMenuItem
      Caption = 'Boletos do Movimento'
      ImageIndex = 19
      OnClick = BoletoBancrio1Click
    end
    object N17: TUniMenuItem
      Caption = '-'
    end
    object RecibodeRetirada1: TUniMenuItem
      Caption = 'Recibo de Retirada (Volumes)'
      ImageIndex = 139
      OnClick = RecibodeRetirada1Click
    end
  end
  object dspessoas: TDataSource
    AutoEdit = False
    DataSet = FDQrypessoas
    Left = 1299
    Top = 751
  end
  object FDQrypessoas: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'select * from pessoas where codigo = :pessoa')
    Left = 1209
    Top = 319
    ParamData = <
      item
        Name = 'PESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 695
    Top = 6
    object I1: TUniMenuItem
      Caption = 'Importar Documento'
      ImageIndex = 112
      OnClick = I1Click
    end
    object N1Nota: TUniMenuItem
      Caption = '-'
    end
    object I2: TUniMenuItem
      Caption = 'Imposto Diferenciado'
      ImageIndex = 26
      OnClick = I2Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object E1: TUniMenuItem
      Caption = 'Envio Eletr'#244'nico'
      ImageIndex = 24
      OnClick = E1Click
    end
    object N10: TUniMenuItem
      Caption = '-'
    end
    object B2: TUniMenuItem
      Caption = 'Lan'#231'amentos financeiros'
      ImageIndex = 19
      OnClick = B2Click
    end
  end
  object UniPopupMenudetalhesnota: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 727
    Top = 6
    object UniMenuItem1: TUniMenuItem
      Caption = 'Editar Detalhes Simples da Nota'
      ImageIndex = 112
      OnClick = UniMenuItem1Click
    end
  end
  object UniPopupMenuopcaoprodutos: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 759
    Top = 6
    object D4: TUniMenuItem
      Caption = 'Detalhes do Item'
      ImageIndex = 112
      OnClick = D4Click
    end
    object N16: TUniMenuItem
      Caption = '-'
    end
    object V2: TUniMenuItem
      Caption = 'Anexar Entrega Futura'
      ImageIndex = 139
      OnClick = V2Click
    end
  end
end
