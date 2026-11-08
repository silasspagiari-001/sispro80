inherited frmCadCAMPO: TfrmCadCAMPO
  Font.Height = -15
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      inherited paBaseTopTitle: TUniContainerPanel
        inherited labCancel: TUniLabel [0]
        end
        inherited labTitleForm: TUniLabel [1]
          Top = 8
          Hint = '[['#13#10'caption-dots:mobile-v-16 |'#13#10'caption-id'#13#10']]'#13#10#13#10
          ExplicitTop = 8
        end
        inherited labExit: TUniLabel [2]
        end
        inherited labSave: TUniLabel [3]
        end
        inherited btnQuickSearch: TUniBitBtn [4]
          ScreenMask.Target = Owner
        end
        inherited labState: TUniLabel [5]
        end
        inherited labOptions: TUniLabel [6]
          OnClick = btnOptionsClick
        end
        inherited edQuickSearch: TUniEdit [7]
        end
        inherited labEdit: TUniLabel [8]
        end
        inherited labDelete: TUniLabel [9]
        end
        inherited labNew: TUniLabel [10]
        end
      end
    end
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 988
      ScrollWidth = 37
      inherited paNAE: TUniContainerPanel
        inherited btnEditReg: TUniBitBtn
          ScreenMask.Target = Owner
        end
      end
      inherited paGC: TUniContainerPanel
        inherited btnSaveReg: TUniBitBtn
          ScreenMask.Target = Owner
        end
        inherited btnCancelReg: TUniBitBtn
          ScreenMask.Target = Owner
        end
      end
    end
    inherited paBaseCadControl: TUniContainerPanel
      inherited pgBaseCadControl: TUniPageControl
        ActivePage = tabRegister
        inherited tabSearch: TUniTabSheet
          ExplicitTop = 24
          ExplicitHeight = 965
          inherited paBaseRegSearch: TUniContainerPanel
            Height = 965
            ExplicitHeight = 965
            inherited paGridOffset: TUniContainerPanel
              Height = 957
              ExplicitHeight = 957
              inherited dbgSearchCRUD: TUniDBGrid
                Height = 957
                Columns = <
                  item
                    FieldName = 'CODIGO'
                    Title.Caption = 'CODIGO'
                    Width = 74
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'COOPERANTE'
                    Title.Caption = 'COOPERANTE'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'NOME'
                    Title.Caption = 'NOME'
                    Width = 270
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'DESCRICAOSAFRA'
                    Title.Caption = 'SAFRA'
                    Width = 100
                    Font.Name = 'Calibri'
                  end>
              end
              inherited paNotFound_dbgSearchCRUD: TUniContainerPanel
                inherited imgNoRecords_dbgSearchCRUD: TUniLabel
                  Anchors = [akLeft, akTop, akBottom]
                end
              end
            end
          end
        end
        inherited tabRegister: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 1315
          ExplicitHeight = 965
          inherited paBaseRegData1: TUniContainerPanel
            ScrollHeight = 965
            ScrollWidth = 1315
            object pgComplementData: TUniPageControl
              Left = 0
              Top = 0
              Width = 1315
              Height = 965
              Hint = ''
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              ActivePage = tabGeral
              Align = alClient
              TabOrder = 1
              object tabGeral: TUniTabSheet
                Hint = ''
                Caption = 'Geral'
                object sboxGridBlockTab1: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1307
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 560
                  ScrollWidth = 947
                  object rcBlock515: TUniContainerPanel
                    Tag = 4
                    Left = 81
                    Top = 538
                    Width = 729
                    Height = 22
                    Hint = '[[cols:12 | round:all]]'
                    ParentColor = False
                    TabOrder = 0
                  end
                  object rcBlock2: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 15
                    Top = 5
                    Width = 932
                    Height = 492
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
                      'ite |'#13#10']]'
                    Margins.Left = 15
                    Margins.Top = 15
                    Margins.Right = 15
                    Margins.Bottom = 10
                    ParentColor = False
                    TabOrder = 1
                    object rcBlock3: TUniContainerPanel
                      Left = -1
                      Top = 0
                      Width = 933
                      Height = 36
                      Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 0
                      DesignSize = (
                        933
                        36)
                      object labRcCollapseGeneral: TUniLabel
                        Left = 899
                        Top = 8
                        Width = 10
                        Height = 26
                        Hint = '[['#13#10'collapse:rcBlock2 off-42 '#13#10']]'#13#10
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
                      object labTitleCardGeral: TUniLabel
                        Left = 8
                        Top = 8
                        Width = 138
                        Height = 19
                        Hint = ''
                        Caption = 'Cadastro de Campos'
                        ParentFont = False
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 2
                      end
                    end
                    object rcBlock10: TUniContainerPanel
                      Tag = 1
                      Left = 0
                      Top = 3
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 1
                      DesignSize = (
                        150
                        48)
                      object UniLabel3: TUniLabel
                        Left = 0
                        Top = 0
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
                        Left = 0
                        Top = 18
                        Width = 144
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
                    object rcBlock20: TUniContainerPanel
                      Tag = 1
                      Left = 193
                      Top = 3
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 2
                      object UniLabel4: TUniLabel
                        Left = 8
                        Top = 0
                        Width = 27
                        Height = 15
                        Hint = ''
                        Caption = 'Ativo'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBCheckBox1: TUniDBCheckBox
                        Left = 19
                        Top = 25
                        Width = 14
                        Height = 17
                        Hint = ''
                        DataField = 'ATIVO'
                        DataSource = dsMaster
                        ValueChecked = 'T'
                        ValueUnchecked = 'F'
                        Caption = ''
                        TabOrder = 2
                        ParentColor = False
                        Color = clBtnFace
                      end
                    end
                    object rcBlock30: TUniContainerPanel
                      Tag = 1
                      Left = 379
                      Top = 3
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        150
                        48)
                      object UniLabel5: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 46
                        Height = 15
                        Hint = ''
                        Caption = 'Emiss'#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBDateTimePicker1: TUniDBDateTimePicker
                        AlignWithMargins = True
                        Left = 3
                        Top = 18
                        Width = 145
                        Height = 29
                        Hint = ''
                        DataField = 'DATA'
                        DataSource = dsMaster
                        DateTime = 44561.000000000000000000
                        DateFormat = 'dd/MM/yyyy'
                        TimeFormat = 'HH:mm:ss'
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                      end
                    end
                    object rcBlock40: TUniContainerPanel
                      Tag = 1
                      Left = 0
                      Top = 61
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        150
                        48)
                      object UniLabel14: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 63
                        Height = 15
                        Hint = ''
                        Caption = 'Cooperante'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpPESSOAS: TUniDBEdit
                        Left = 0
                        Top = 18
                        Width = 144
                        Height = 29
                        Hint = 
                          '[['#13#10'NOME COOPERANTE @60 |'#13#10'lkpfilter-empty:Selecione o Cooperant' +
                          'e<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:' +
                          'blank |'#13#10']]'
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        ReadOnly = True
                        OnExit = edLkpPESSOASExit
                      end
                    end
                    object rcBlock50: TUniContainerPanel
                      Tag = 1
                      Left = 193
                      Top = 61
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 5
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
                        Top = 18
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'NOME'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        ReadOnly = True
                      end
                    end
                    object rcBlock60: TUniContainerPanel
                      Tag = 1
                      Left = 379
                      Top = 61
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        150
                        48)
                      object UniDBEdit1: TUniDBEdit
                        Tag = 1
                        Left = 3
                        Top = 18
                        Width = 145
                        Height = 29
                        Hint = ''
                        DataField = 'DESCRICAOSAFRA'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                      end
                      object UniLabel6: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 29
                        Height = 15
                        Hint = ''
                        Caption = 'Safra'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock70: TUniContainerPanel
                      Tag = 1
                      Left = 0
                      Top = 126
                      Width = 962
                      Height = 371
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                      ParentColor = False
                      TabOrder = 7
                      object UniDBGridbeneficiamento: TUniDBGrid
                        Left = 0
                        Top = 0
                        Width = 962
                        Height = 371
                        Hint = ''
                        ClientEvents.ExtEvents.Strings = (
                          
                            'afterrender=function afterrender(sender, eOpts) {    var grid = ' +
                            'sender;    if (grid._enterNavCleanup) grid._enterNavCleanup();  ' +
                            '  function onEnter(event) {        if (grid.destroyed || event.i' +
                            'sComposing || (event.key !== '#39'Enter'#39' && event.keyCode !== 13)) r' +
                            'eturn;        var plugin = grid.getPlugin('#39'uniGridEditor'#39') || gr' +
                            'id.findPlugin('#39'cellediting'#39');        var editor = plugin && plug' +
                            'in.getActiveEditor();        var insideGrid = grid.el && grid.el' +
                            '.dom.contains(event.target);        var insideEditor = editor &&' +
                            ' editor.editing && editor.el && editor.el.dom.contains(event.tar' +
                            'get);        if (!insideGrid && !insideEditor) return;        ev' +
                            'ent.preventDefault();        event.stopImmediatePropagation();  ' +
                            '      if (event.type !== '#39'keydown'#39' || event.repeat) return;     ' +
                            '   var dfield = dateEditor(event);        if (dfield) {         ' +
                            '   var din = dfield.inputEl.dom;            var ddg = din.value.' +
                            'replace(/\D/g, "");            if (ddg.length > 0) {            ' +
                            '    var curYear = String((new Date()).getFullYear());           ' +
                            '     if (ddg.length <= 4) ddg = ddg + curYear;                el' +
                            'se if (ddg.length <= 6) ddg = ddg + '#39'20'#39';                var ok ' +
                            '= false;                if (ddg.length === 8) {                 ' +
                            '   var ddp = parseInt(ddg.slice(0, 2), 10);                    v' +
                            'ar mmp = parseInt(ddg.slice(2, 4), 10);                    var a' +
                            'ap = parseInt(ddg.slice(4, 8), 10);                    var dtp =' +
                            ' new Date(aap, mmp - 1, ddp);                    ok = mmp >= 1 &' +
                            '& mmp <= 12 && dtp.getFullYear() === aap && dtp.getMonth() === m' +
                            'mp - 1 && dtp.getDate() === ddp;                }               ' +
                            ' if (!ok) return;                writeDate(dfield, ddg);        ' +
                            '    }        }        event.target.dispatchEvent(new KeyboardEve' +
                            'nt('#39'keydown'#39', {            key: '#39'Tab'#39', code: '#39'Tab'#39', keyCode: 9, ' +
                            'which: 9, bubbles: true, cancelable: true, composed: true, shift' +
                            'Key: event.shiftKey        }));    }    var events = ['#39'keydown'#39',' +
                            ' '#39'keypress'#39', '#39'keyup'#39'];    events.forEach(function(name) { window' +
                            '.addEventListener(name, onEnter, true); });    grid._enterNavCle' +
                            'anup = function() {        events.forEach(function(name) { windo' +
                            'w.removeEventListener(name, onEnter, true); });    };    grid.on' +
                            '('#39'destroy'#39', grid._enterNavCleanup);    function dateEditor(event' +
                            ') {        var plugin = grid.getPlugin('#39'uniGridEditor'#39') || grid.' +
                            'findPlugin('#39'cellediting'#39');        var editor = plugin && plugin.' +
                            'getActiveEditor();        if (!editor || !editor.editing || !edi' +
                            'tor.field || !editor.field.inputEl || event.target !== editor.fi' +
                            'eld.inputEl.dom) return null;        var ctx = plugin.context;  ' +
                            '      var fieldName = ctx ? String(ctx.field).toUpperCase() : '#39#39 +
                            ';        if (fieldName.indexOf('#39'DATA'#39') !== -1 || fieldName.index' +
                            'Of('#39'DT'#39') !== -1 || editor.field.isDatePicker === true || editor.' +
                            'field.xtype === '#39'datefield'#39') return editor.field;        return ' +
                            'null;    }    function writeDate(field, digits) {        if (dig' +
                            'its.length > 8) digits = digits.slice(0, 8);        var out = di' +
                            'gits;        if (digits.length > 4) out = digits.slice(0,2) + '#39'/' +
                            #39' + digits.slice(2,4) + '#39'/'#39' + digits.slice(4);        else if (d' +
                            'igits.length > 2) out = digits.slice(0,2) + '#39'/'#39' + digits.slice(2' +
                            ');        field.setValue(out);        field.setRawValue(out);   ' +
                            '     var input = field.inputEl.dom;        input.setSelectionRan' +
                            'ge(out.length, out.length);    }    function dateKey(event) {   ' +
                            '     if (event.isComposing || event.ctrlKey || event.metaKey || ' +
                            'event.altKey) return;        var field = dateEditor(event);     ' +
                            '   if (!field) return;        var digit = /^[0-9]$/.test(event.k' +
                            'ey);        if (!digit && event.key !== '#39'Backspace'#39' && event.key' +
                            ' !== '#39'Delete'#39') return;        event.preventDefault();        eve' +
                            'nt.stopImmediatePropagation();        var input = field.inputEl.' +
                            'dom;        var digits = input.value.replace(/\D/g, "");        ' +
                            'var selectedAll = input.selectionStart === 0 && input.selectionE' +
                            'nd === input.value.length;        if (selectedAll) digits = ""; ' +
                            '       if (digit) digits = digits + event.key;        else if (e' +
                            'vent.key === '#39'Backspace'#39') digits = digits.slice(0, -1);        e' +
                            'lse digits = "";        writeDate(field, digits);    }    functi' +
                            'on datePaste(event) {        var field = dateEditor(event);     ' +
                            '   if (!field) return;        var text = event.clipboardData.get' +
                            'Data('#39'text'#39');        event.preventDefault();        event.stopIm' +
                            'mediatePropagation();        var digits = String(text).replace(/' +
                            '\D/g, "");        if (digits.length) writeDate(field, digits);  ' +
                            '  }    window.addEventListener('#39'keydown'#39', dateKey, true);    win' +
                            'dow.addEventListener('#39'paste'#39', datePaste, true);    grid.on('#39'dest' +
                            'roy'#39', function() {        window.removeEventListener('#39'keydown'#39', ' +
                            'dateKey, true);        window.removeEventListener('#39'paste'#39', dateP' +
                            'aste, true);    });}')
                        DataSource = dsdetalhes
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
                        WebOptions.Paged = False
                        LoadMask.Message = 'Carregando Item(s)...'
                        ForceFit = True
                        Align = alClient
                        Font.Color = clBlack
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        ParentFont = False
                        TabOrder = 1
                        Summary.Enabled = True
                        OnKeyDown = UniDBGridbeneficiamentoKeyDown
                        OnCellClick = UniDBGridbeneficiamentoCellClick
                        Columns = <
                          item
                            FieldName = 'busca'
                            Title.Caption = ' '
                            Width = 30
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                            Alignment = taCenter
                            ReadOnly = True
                          end
                          item
                            FieldName = 'PRODUTO'
                            Title.Caption = 'PRODUTO'
                            Width = 74
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'CULTIVAR'
                            Title.Caption = 'CULTIVAR'
                            Width = 180
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'CAMPO'
                            Title.Caption = 'CAMPO'
                            Width = 100
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'DATA'
                            Title.Caption = 'DATA'
                            Width = 80
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'LATITUDE'
                            Title.Caption = 'LATITUDE'
                            Width = 120
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'LONGITUDE'
                            Title.Caption = 'LONGITUDE'
                            Width = 120
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'AREA'
                            Title.Caption = 'AREA'
                            Width = 74
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'PRODUCAO'
                            Title.Caption = 'PRODU'#199#195'O'
                            Width = 100
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'SAFRACAMPO'
                            Title.Caption = 'SAFRACAMPO'
                            Width = 144
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'exclui'
                            Title.Caption = ' '
                            Width = 30
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                            Alignment = taCenter
                            ReadOnly = True
                          end>
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
      inherited paSearchFiltersCustom: TUniPanel
        inherited sboxSearchFiltersCustom: TUniScrollBox
          ScrollHeight = 33
        end
      end
    end
  end
  inherited rcSweetAlert: TUniSweetAlert
    Left = 960
    Top = 26
  end
  inherited dsMaster: TDataSource
    Left = 938
    Top = 251
  end
  inherited dsSearchMaster: TDataSource
    Left = 1210
    Top = 413
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'select * from CAMPO')
    Left = 921
    Top = 355
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object FDQryFiltroCOOPERANTE: TIntegerField
      FieldName = 'COOPERANTE'
      Origin = 'COOPERANTE'
    end
    object FDQryFiltroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object FDQryFiltroDESCRICAOSAFRA: TStringField
      FieldName = 'DESCRICAOSAFRA'
      Origin = 'DESCRICAOSAFRA'
      Size = 30
    end
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'CAMPO'
    SQL.Strings = (
      'SELECT * FROM CAMPO WHERE CODIGO = :CODIGO')
    Left = 835
    Top = 257
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 418
    Top = 16
  end
  inherited FDSchemaAdapter1: TFDSchemaAdapter
    Left = 822
    Top = 390
  end
  inherited FDQryCad: TFDQuery
    Left = 1193
    Top = 166
  end
  inherited dscrud: TDataSource
    Left = 1115
    Top = 174
  end
  inherited FDQryFiltro: TFDQuery
    Left = 1121
    Top = 326
  end
  inherited FDQryCaddetails: TFDQuery
    Left = 785
    Top = 31
  end
  inherited dscruddetails: TDataSource
    Left = 883
    Top = 23
  end
  inherited tbdetalhes: TFDMemTable
    Left = 860
    Top = 470
    object tbdetalhesNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object tbdetalhesPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object tbdetalhesCULTIVAR: TStringField
      FieldName = 'CULTIVAR'
      Size = 60
    end
    object tbdetalhesCAMPO: TStringField
      FieldName = 'CAMPO'
    end
    object tbdetalhesDATA: TDateField
      FieldName = 'DATA'
    end
    object tbdetalhesLATITUDE: TStringField
      FieldName = 'LATITUDE'
    end
    object tbdetalhesLONGITUDE: TStringField
      FieldName = 'LONGITUDE'
    end
    object tbdetalhesAREA: TFloatField
      FieldName = 'AREA'
    end
    object tbdetalhesPRODUCAO: TFloatField
      FieldName = 'PRODUCAO'
    end
    object tbdetalhesSAFRACAMPO: TStringField
      FieldName = 'SAFRACAMPO'
    end
    object tbdetalhesbusca: TStringField
      FieldName = 'busca'
      ReadOnly = True
      OnGetText = tbdetalhesbuscaGetText
      Size = 1
    end
    object tbdetalhesexclui: TStringField
      FieldName = 'exclui'
      ReadOnly = True
      OnGetText = tbdetalhesexcluiGetText
    end
    object tbdetalhesCOOPERANTE: TIntegerField
      FieldName = 'COOPERANTE'
    end
  end
end
