object frmDEMO_LABEL_ROLLING: TfrmDEMO_LABEL_ROLLING
  Left = 0
  Top = 0
  Width = 902
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
    Width = 902
    Height = 677
    Cursor = crHandPoint
    Hint = ''
    Align = alClient
    Color = 15395562
    TabOrder = 0
    ScrollHeight = 621
    ScrollWidth = 759
    object rcBlock200: TUniContainerPanel
      Tag = 4
      Left = 20
      Top = 25
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
      object UniLabel2: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 717
        Height = 31
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Rolling #1'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock220: TUniContainerPanel
      Tag = 4
      Left = 30
      Top = 349
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 3
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 717
        Height = 31
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Rolling #2'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock210: TUniContainerPanel
      Left = 66
      Top = 70
      Width = 685
      Height = 281
      Hint = '[[cols:xs-12 sm-12 md-12 lg-12 xl-12 4k-12 8k-12 ]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        685
        281)
      object UniHTMLFrame1: TUniHTMLFrame
        Left = 2
        Top = 2
        Width = 681
        Height = 277
        Hint = ''
        HTML.Strings = (
          '<style>'
          'body {'
          '  height: 100vh;'
          '  display: flex;'
          '  align-items: center;'
          '  justify-content: center;'
          '}'
          ''
          '.scrolling-words-container {'
          '  display: flex;'
          '  align-items: center;'
          '  font-size: 2rem;'
          '  font-weight: 600;'
          '}'
          ''
          '.scrolling-words-box {'
          '  height: 3rem;'
          '  margin: auto;'
          '  overflow: hidden;'
          '}'
          '.scrolling-words-box ul {'
          '  margin: 0 0.625rem;'
          '  padding: 0;'
          '  animation: scrollUp 4s infinite;'
          '}'
          '.scrolling-words-box ul li {'
          '  display: flex;'
          '  align-items: center;'
          '  justify-content: flex-end;'
          '  height: 3rem;'
          '  list-style: none;'
          '}'
          ''
          '@keyframes scrollUp {'
          '  15%, 25% {'
          '    transform: translateY(-20%);'
          '  }'
          '  40%, 50% {'
          '    transform: translateY(-40%);'
          '  }'
          '  65%, 75% {'
          '    transform: translateY(-60%);'
          '  }'
          '  90%, 100% {'
          '    transform: translateY(-80%);'
          '  }'
          '}'
          '</style>'
          ''
          '<div class="scrolling-words-container">'
          '  <div class="scrolling-words-box">'
          '    <ul>'
          '      <li style="color: #ea4335">Code</li>'
          '      <li style="color: #4285f4">Build</li>'
          '      <li style="color: #34a853">Create</li>'
          '      <li style="color: #fbbc04">Design</li>'
          '      <li style="color: #ea4335">Code</li>'
          '    </ul>'
          '  </div>'
          '  <span style="color: #5f6368">for everyone</span>'
          '</div>'
          '<script>'
          ''
          '</script>')
        Anchors = [akLeft, akTop, akRight, akBottom]
      end
    end
    object rcBlock230: TUniContainerPanel
      Left = 20
      Top = 410
      Width = 685
      Height = 211
      Hint = '[[cols:xs-12 sm-12 md-12 lg-12 xl-12 4k-12 8k-12 ]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        685
        211)
      object UniHTMLFrame2: TUniHTMLFrame
        Left = 2
        Top = 2
        Width = 681
        Height = 207
        Hint = ''
        HTML.Strings = (
          '<style>'
          #9'body {'
          #9'  margin: 0 auto;'
          #9'  text-align: center;'
          #9'  font-family: sans-serif;'
          #9'  font-weight: 600;'
          #9'  color: #ffffff;'
          #9'  overflow: hidden;'
          #9'  background: #000000;'
          #9'}'
          #9
          #9'header {'
          #9'  margin: 6.25em auto;'
          #9'  height: 2.6em;'
          #9'  overflow: hidden;'
          #9'  width: 100%;'
          #9'}'
          #9'.rc-label-rolling2 '
          #9'ul,'
          #9'li {'
          #9'  height: 13.5em;'
          #9'  margin: 0px;'
          #9'  padding: 0px;'
          #9'  width: 100%;'
          #9'}'
          #9
          '  .rc-label-rolling2 li {'
          #9'  list-style-type: none;'
          #9'  margin: 0px 0 1px 0;'
          #9'  height: 1em !important;'
          #9'  padding: 0px 0 0px 0;'
          #9'  font-size: 3em;'
          #9'  text-transform: uppercase;'
          #9'  width: 100%;'
          #9'}'
          #9
          #9'.t {'
          #9'  animation-name: titleflip;'
          #9'  animation: titleflip 5s ease-in-out infinite;'
          #9#9'}'
          #9
          #9'@-webkit-keyframes titleflip {'
          #9'  0%, 20% {'
          #9'  transform: translate(0px, -12.50em);'
          #9'  }'
          #9'  20%,'
          #9'  40% {'
          #9' transform: translate(0px, -9.375em);'
          #9'  }'
          #9'  40%,'
          #9'  60% {'
          #9'    -webkit-transform: translate(0px, -6.44em);'
          #9'  }'
          #9'  60%,'
          #9'  80% {'
          #9'  transform: translate(0px, -3.44em);'
          #9'  }'
          #9'  80%,'
          #9'  100% {'
          #9'  transform: translate(0px, -0.315em);'
          #9'  }'
          #9'  100%,'
          #9'  0% {'
          #9'    transform: translate(0px, -12.50em);'
          #9'  }'
          #9'}'
          '</style>'
          ''
          '<header>'
          '<ul class="rc-label-rolling2 t">'
          '<li>repeat.</li>'
          '<li>Develop.</li>'
          '<li>design.</li>'
          '<li>Sketch.</li>'
          '<li>Imagine.</li>'
          '    </ul>'
          '</header>'
          '<script>'
          ''
          '</script>')
        Anchors = [akLeft, akTop, akRight, akBottom]
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
    Left = 894
    Top = 46
  end
end
