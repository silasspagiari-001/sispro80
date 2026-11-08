inherited frmBARCODEREADER: TfrmBARCODEREADER
  Hint = '[['#13#10'width:360|'#13#10'height:450|'#13#10'modal:]]'
  ClientHeight = 494
  ClientWidth = 400
  Caption = 'frmBARCODEREADER'
  ExplicitWidth = 400
  ExplicitHeight = 494
  DesignSize = (
    400
    494)
  PixelsPerInch = 96
  TextHeight = 13
  object paBackground: TUniContainerPanel [0]
    AlignWithMargins = True
    Left = 4
    Top = 42
    Width = 360
    Height = 423
    Hint = '[['#13#10'anchor:off-t-42]]'
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ParentColor = False
    Color = 15987699
    TabOrder = 0
    object paCamera: TUniContainerPanel
      AlignWithMargins = True
      Left = 12
      Top = 2
      Width = 348
      Height = 340
      Hint = 
        '[['#13#10'anchor:off-t-2 off-b-4 off-l-4 off-r-4|'#13#10'/*width:360 mobile-' +
        'h-360 mobile-v-360|*/'#13#10'/*height:550 mobile-h-550 mobile-v-550|*/' +
        #13#10'center:parent x|'#13#10'round:no | cls:card-info-box-white'#13#10']]'#13#10
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 12
      Margins.Bottom = 12
      ParentColor = False
      TabOrder = 1
      object htmlBarCode: TUniHTMLFrame
        Left = 0
        Top = 1
        Width = 500
        Height = 439
        Hint = '[['#13#10'anchor:'#13#10']]'
        HTML.Strings = (
          
            '<div id="qr-reader" style="border:0px !important;width:auto"></d' +
            'iv>'
          '<div style="display:none;" id="qr-reader-results"></div>'
          ''
          '<script>'
          
            'var resultContainer = document.getElementById('#39'qr-reader-results' +
            #39');'
          'var lastResult, countResults = 0;'
          ''
          'function onScanSuccess(decodedText, decodedResult) {'
          '    if (decodedText !== lastResult) {'
          '        ++countResults;'
          '        lastResult = decodedText;'
          '        // Handle on success condition with the decoded message.'
          
            '        console.log(`Scan result ${decodedText}`, decodedResult)' +
            ';'
          
            '        ajaxRequest(frmBARCODEREADER.htmlBarCode, "_rcBarCode", ' +
            '["bc="+decodedText]);'
          '    }'
          '}'
          ''
          'var html5QrcodeScanner = new Html5QrcodeScanner('
          '    "qr-reader", { fps: 10, qrbox: 250 });'
          'html5QrcodeScanner.render(onScanSuccess);'
          '</script>')
        AutoScroll = True
        OnAjaxEvent = htmlBarCodeAjaxEvent
        ScrollHeight = 439
        ScrollWidth = 500
      end
    end
    object btnStart: TUniButton
      Left = 19
      Top = 424
      Width = 60
      Height = 31
      Hint = 
        '[['#13#10'cls:ButtonGreen |'#13#10'ico:fas-exchange-alt |'#13#10'hint:Switch cams ' +
        'c:info-light w:200 d:10000 |'#13#10']]'
      Visible = False
      Caption = 'Start'
      TabOrder = 2
      OnClick = btnStartClick
    end
    object edBarCode: TUniEdit
      Left = 66
      Top = 365
      Width = 271
      Height = 38
      Hint = '[['#13#10'align:paCamera b:-46 |'#13#10'center:parent x'#13#10']]'
      Alignment = taCenter
      Text = ''
      TabOrder = 3
      ClearButton = True
    end
  end
  object paBaseTopTitle: TUniContainerPanel [1]
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 395
    Height = 36
    Hint = '[['#13#10'round:t'#13#10']]'
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 0
    Margins.Bottom = 0
    ParentColor = False
    Color = 2763306
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    object labTitleForm: TUniLabel
      AlignWithMargins = True
      Left = 50
      Top = 3
      Width = 200
      Height = 29
      Hint = 'bsLabel_fa-camera'
      Margins.Left = 10
      Margins.Bottom = 8
      TextConversion = txtHTML
      AutoSize = False
      Caption = 'QrCODE/BarCODE Reader'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Calibri Light'
      ParentColor = False
      Color = clSilver
      TabOrder = 1
    end
    object labExit: TUniLabel
      AlignWithMargins = True
      Left = 8
      Top = 3
      Width = 33
      Height = 25
      Cursor = crHandPoint
      Hint = '[[ico:fas-sign-out-alt rc-mirror-h]]'
      Margins.Left = 8
      Margins.Bottom = 8
      Alignment = taCenter
      TextConversion = txtHTML
      AutoSize = False
      Caption = '<'
      Align = alLeft
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Calibri Light'
      ParentColor = False
      Color = clSilver
      TabOrder = 2
      OnClick = labExitClick
    end
  end
end
