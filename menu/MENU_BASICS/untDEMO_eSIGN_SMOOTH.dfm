object frmDEMO_eSIGN_SMOOTH: TfrmDEMO_eSIGN_SMOOTH
  Left = 0
  Top = 0
  Width = 728
  Height = 518
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 728
    Height = 518
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollHeight = 367
    ScrollWidth = 587
    object rcBlock10: TUniContainerPanel
      Tag = 4
      Left = 14
      Top = 21
      Width = 533
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 521
        Height = 31
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'E-Signature( smooth )'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock30: TUniContainerPanel
      Left = 14
      Top = 91
      Width = 573
      Height = 276
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'max-width:900|'#13#10'center:parent x |'#13#10 +
        ']]'#13#10
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        573
        276)
      object paSign: TUniContainerPanel
        Left = 9
        Top = 3
        Width = 310
        Height = 158
        Hint = 
          '[['#13#10'pos-l:4 |'#13#10'pos-t:4|'#13#10'center:parent x |'#13#10'cls:rc-dashed-block ' +
          #13#10']]'
        ParentColor = False
        TabOrder = 1
        object UniCanvas: TUniCanvas
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 304
          Height = 152
          Hint = ''
          Visible = False
          Editable = True
          Align = alClient
          Color = clWhite
          AfterSubmit = UniCanvasAfterSubmit
        end
        object htmlSign: TUniHTMLFrame
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 300
          Height = 150
          Hint = ''
          HTML.Strings = (
            '  <div id="signature-pad" class="signature-pad">'
            '    <div id="canvas-wrapper" class="signature-pad--body">'
            '      <canvas></canvas>'
            '    </div>'
            '    <div class="signature-pad--footer">'
            '      <!--<div class="description">Sign above</div>-->'
            ''
            '      <div class="signature-pad--actions">'
            '        <div class="column">'
            
              '          <button id="btnclear" type="button" class="button clea' +
              'r" data-action="clear">Clear</button>'
            
              '          <button id="btnundo" type="button" class="button" data' +
              '-action="undo" title="Ctrl-Z">Undo</button>'
            
              '          <button id="btnredo" type="button" class="button" data' +
              '-action="redo" title="Ctrl-Y">Redo</button>'
            
              '          <button id="btnsavepng" type="button" class="button sa' +
              've" data-action="save-png">Save as PNG</button>'
            '          <!--'
            '          <br/>'
            
              '          <button type="button" class="button" data-action="chan' +
              'ge-color">Change color</button>'
            
              '          <button type="button" class="button" data-action="chan' +
              'ge-width">Change width</button>'
            
              '          <button type="button" class="button" data-action="chan' +
              'ge-background-color">Change background color</button>'
            '          -->'
            '        </div>'
            '        <!--'
            '        <div class="column">'
            
              '          <button id="btnsavepng" type="button" class="button sa' +
              've" data-action="save-png">Save as PNG</button>          '
            
              '          <button type="button" class="button save" data-action=' +
              '"save-jpg">Save as JPG</button>'
            
              '          <button type="button" class="button save" data-action=' +
              '"save-svg">Save as SVG</button>'
            
              '          <button type="button" class="button save" data-action=' +
              '"save-svg-with-background">Save as SVG with'
            '            background</button>          '
            '        </div>'
            '        -->'
            '      </div>'
            '      <!--'
            '      <div>'
            
              '        <button type="button" class="button" data-action="open-i' +
              'n-window">Open in Window</button>'
            '      </div>'
            '      -->'
            '    </div>'
            '  </div>'
            '<!--'
            
              '  <script src="files/js/signature-pad/signature_pad.umd.min.js">' +
              '</script>'
            '-->  '
            '  <script src="files/js/signature-pad/app.js"></script>'
            '')
        end
      end
      object btnClear: TUniButton
        Left = 9
        Top = 185
        Width = 60
        Height = 29
        Hint = '[['#13#10'align:paSign b:10 l:0|'#13#10'cls:ButtonCrud'#13#10']]'
        Margins.Bottom = 42
        Caption = 'Clear'
        Anchors = [akTop, akRight]
        TabOrder = 2
        OnClick = btnClearClick
      end
      object btnSave: TUniButton
        Left = 259
        Top = 183
        Width = 60
        Height = 29
        Hint = '[['#13#10'align:paSign b:10 r:-w|'#13#10'cls:ButtonCrud'#13#10']]'
        Caption = 'Save'
        Anchors = [akTop, akRight]
        TabOrder = 3
        OnClick = btnSaveClick
      end
      object btnUndo: TUniButton
        Left = 78
        Top = 175
        Width = 60
        Height = 29
        Hint = '[['#13#10'align:btnClear t:0 r:4|'#13#10'cls:ButtonCrud'#13#10']]'
        Margins.Bottom = 42
        Caption = 'Undo'
        Anchors = [akTop, akRight]
        TabOrder = 4
        OnClick = btnUndoClick
      end
      object btnRedo: TUniButton
        Left = 144
        Top = 185
        Width = 60
        Height = 29
        Hint = '[['#13#10'align:btnUndo t:0 r:4|'#13#10'cls:ButtonCrud'#13#10']]'
        Margins.Bottom = 42
        Caption = 'Redo'
        Anchors = [akTop, akRight]
        TabOrder = 5
        OnClick = btnRedoClick
      end
    end
  end
  object cdsSign: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 500
    Top = 94
    object cdsSignimg_date: TDateTimeField
      FieldName = 'img_date'
    end
    object cdsSignimg: TBlobField
      FieldName = 'img'
    end
  end
  object dsSign: TDataSource
    DataSet = cdsSign
    Left = 500
    Top = 150
  end
end
