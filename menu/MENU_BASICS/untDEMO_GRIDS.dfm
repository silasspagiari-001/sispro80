object frmDEMO_GRIDS: TfrmDEMO_GRIDS
  Left = 0
  Top = 0
  Width = 705
  Height = 574
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 705
    Height = 574
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollHeight = 541
    ScrollWidth = 681
    object rcBlock16: TUniContainerPanel
      Left = 3
      Top = 2
      Width = 674
      Height = 46
      Hint = 
        '[['#13#10'cols:12 |'#13#10'/* scale:parent w:100%| */'#13#10'/* noborder-all */ | ' +
        #13#10'round:t | '#13#10'cls:card-light |'#13#10']]'#13#10#13#10#13#10
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        674
        46)
      object btSair: TUniLabel
        Left = 4
        Top = 1
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent y|'#13#10'ico:fas-sign-out-alt rc-mirror-h |'#13#10']]'
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
        OnClick = btSairClick
      end
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 41
        Top = 6
        Width = 48
        Height = 23
        Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'align:btSair r:6'#13#10']]'
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = 'GRIDs'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 2
      end
      object btnEdit: TUniBitBtn
        Left = 491
        Top = 6
        Width = 85
        Height = 34
        Hint = 
          '[['#13#10'ico:fas-pencil-alt|'#13#10'cls:ButtonBlue|'#13#10'center:parent y |'#13#10'app' +
          'end'#13#10']]'#13#10
        Visible = False
        Caption = 'Edit'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        TabOrder = 3
      end
      object btnSave: TUniBitBtn
        Left = 582
        Top = 3
        Width = 85
        Height = 34
        Hint = 
          '[['#13#10'ico:fas-save |'#13#10'cls:ButtonBlue|'#13#10'center:parent y |'#13#10'append'#13#10 +
          ']]'#13#10
        Visible = False
        Caption = 'Save'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        TabOrder = 4
      end
    end
    object rcBlock180: TUniContainerPanel
      Tag = 1
      Left = 12
      Top = 54
      Width = 669
      Height = 487
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'scale:parent h:100%-top off:default' +
        '-offset |'#13#10'min-height:200 mobile-220| '#13#10'round:no|'#13#10'cls:card-info' +
        '-box-white |'#13#10'noborder-top'#13#10']]'
      ParentColor = False
      TabOrder = 1
      object pgData: TUniPageControl
        Left = 8
        Top = 10
        Width = 623
        Height = 461
        Hint = '[['#13#10'anchor:'#13#10']]'
        ActivePage = tabTabulator
        TabOrder = 1
        object tabTabulator: TUniTabSheet
          Hint = ''
          Caption = 'Tabulator'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 256
          ExplicitHeight = 128
          object UniScrollBox3: TUniScrollBox
            Left = 0
            Top = 0
            Width = 615
            Height = 433
            Hint = ''
            Align = alClient
            TabOrder = 0
            object rcBlock200: TUniContainerPanel
              Left = 35
              Top = 15
              Width = 449
              Height = 345
              Hint = 
                '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'border:border-round|'#13#10'/*cls:card-i' +
                'nfo-box-white | */'#13#10'//scrollbar:show-v*/|'#13#10'/*scale:parent h:100%' +
                '-top off:default-offset |*/'#13#10#13#10#13#10']]'
              ParentColor = False
              TabOrder = 0
              object UniLabel2: TUniLabel
                Left = 0
                Top = 0
                Width = 423
                Height = 13
                Hint = ''
                Visible = False
                AutoSize = False
                Caption = 'TABULATOR: n'#227'o pode ter AUTOSCROLL no HTMLFRAME'
                TabOrder = 1
              end
              object htmlTabulator: TUniHTMLFrame
                Left = 31
                Top = 67
                Width = 256
                Height = 128
                Hint = '[['#13#10'anchor:|'#13#10#13#10'/*html-reload:|*/'#13#10']]'
              end
            end
          end
        end
        object tabDataTable: TUniTabSheet
          Hint = ''
          Caption = 'DataTable'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 256
          ExplicitHeight = 128
          object UniScrollBox4: TUniScrollBox
            Left = 0
            Top = 0
            Width = 615
            Height = 433
            Hint = ''
            Align = alClient
            TabOrder = 0
            object rcBlock210: TUniContainerPanel
              Left = 11
              Top = 7
              Width = 470
              Height = 320
              Hint = 
                '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10#13#10'/*cls:card-info-box-white | */'#13#10 +
                '/*scrollbar:show-v*/|'#13#10#13#10'scale:parent h:100%-top off:default-off' +
                'set |'#13#10#13#10#13#10']]'
              ParentColor = False
              TabOrder = 0
              object UniLabel7Clone: TUniLabel
                Left = 0
                Top = 0
                Width = 341
                Height = 13
                Hint = ''
                Visible = False
                AutoSize = False
                Caption = 'DATATABLE: n'#227'o pode ter AUTOSCROLL no HTMLFRAME'
                TabOrder = 1
              end
              object htmlDataTable: TUniHTMLFrame
                Left = 8
                Top = 12
                Width = 453
                Height = 301
                Hint = 
                  '[['#13#10'anchor:|'#13#10'/*scrollbar:show-h not-refresh-scroll*/'#13#10'html-relo' +
                  'ad:once|'#13#10']]'
                HTML.Strings = (
                  '<div id="datatables-example">'
                  ''
                  
                    '<table id="example" class="table table-striped" style="width:100' +
                    '%">'
                  '        <thead>'
                  '            <tr>'
                  '                <th>Name</th>'
                  '                <th>Position</th>'
                  '                <th>Office</th>'
                  '                <th>Age</th>'
                  '                <th>Start date</th>'
                  '                <th>Salary</th>'
                  '            </tr>'
                  '        </thead>'
                  '        <tbody>'
                  '            <tr>'
                  '                <td>Tiger Nixon</td>'
                  '                <td>System Architect</td>'
                  '                <td>Edinburgh</td>'
                  '                <td>61</td>'
                  '                <td>2011-04-25</td>'
                  '                <td>$320,800</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Garrett Winters</td>'
                  '                <td>Accountant</td>'
                  '                <td>Tokyo</td>'
                  '                <td>63</td>'
                  '                <td>2011-07-25</td>'
                  '                <td>$170,750</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Ashton Cox</td>'
                  '                <td>Junior Technical Author</td>'
                  '                <td>San Francisco</td>'
                  '                <td>66</td>'
                  '                <td>2009-01-12</td>'
                  '                <td>$86,000</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Cedric Kelly</td>'
                  '                <td>Senior Javascript Developer</td>'
                  '                <td>Edinburgh</td>'
                  '                <td>22</td>'
                  '                <td>2012-03-29</td>'
                  '                <td>$433,060</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Airi Satou</td>'
                  '                <td>Accountant</td>'
                  '                <td>Tokyo</td>'
                  '                <td>33</td>'
                  '                <td>2008-11-28</td>'
                  '                <td>$162,700</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Brielle Williamson</td>'
                  '                <td>Integration Specialist</td>'
                  '                <td>New York</td>'
                  '                <td>61</td>'
                  '                <td>2012-12-02</td>'
                  '                <td>$372,000</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Herrod Chandler</td>'
                  '                <td>Sales Assistant</td>'
                  '                <td>San Francisco</td>'
                  '                <td>59</td>'
                  '                <td>2012-08-06</td>'
                  '                <td>$137,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Rhona Davidson</td>'
                  '                <td>Integration Specialist</td>'
                  '                <td>Tokyo</td>'
                  '                <td>55</td>'
                  '                <td>2010-10-14</td>'
                  '                <td>$327,900</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Colleen Hurst</td>'
                  '                <td>Javascript Developer</td>'
                  '                <td>San Francisco</td>'
                  '                <td>39</td>'
                  '                <td>2009-09-15</td>'
                  '                <td>$205,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Sonya Frost</td>'
                  '                <td>Software Engineer</td>'
                  '                <td>Edinburgh</td>'
                  '                <td>23</td>'
                  '                <td>2008-12-13</td>'
                  '                <td>$103,600</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Jena Gaines</td>'
                  '                <td>Office Manager</td>'
                  '                <td>London</td>'
                  '                <td>30</td>'
                  '                <td>2008-12-19</td>'
                  '                <td>$90,560</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Quinn Flynn</td>'
                  '                <td>Support Lead</td>'
                  '                <td>Edinburgh</td>'
                  '                <td>22</td>'
                  '                <td>2013-03-03</td>'
                  '                <td>$342,000</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Charde Marshall</td>'
                  '                <td>Regional Director</td>'
                  '                <td>San Francisco</td>'
                  '                <td>36</td>'
                  '                <td>2008-10-16</td>'
                  '                <td>$470,600</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Haley Kennedy</td>'
                  '                <td>Senior Marketing Designer</td>'
                  '                <td>London</td>'
                  '                <td>43</td>'
                  '                <td>2012-12-18</td>'
                  '                <td>$313,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Tatyana Fitzpatrick</td>'
                  '                <td>Regional Director</td>'
                  '                <td>London</td>'
                  '                <td>19</td>'
                  '                <td>2010-03-17</td>'
                  '                <td>$385,750</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Michael Silva</td>'
                  '                <td>Marketing Designer</td>'
                  '                <td>London</td>'
                  '                <td>66</td>'
                  '                <td>2012-11-27</td>'
                  '                <td>$198,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Paul Byrd</td>'
                  '                <td>Chief Financial Officer (CFO)</td>'
                  '                <td>New York</td>'
                  '                <td>64</td>'
                  '                <td>2010-06-09</td>'
                  '                <td>$725,000</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Gloria Little</td>'
                  '                <td>Systems Administrator</td>'
                  '                <td>New York</td>'
                  '                <td>59</td>'
                  '                <td>2009-04-10</td>'
                  '                <td>$237,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Bradley Greer</td>'
                  '                <td>Software Engineer</td>'
                  '                <td>London</td>'
                  '                <td>41</td>'
                  '                <td>2012-10-13</td>'
                  '                <td>$132,000</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Dai Rios</td>'
                  '                <td>Personnel Lead</td>'
                  '                <td>Edinburgh</td>'
                  '                <td>35</td>'
                  '                <td>2012-09-26</td>'
                  '                <td>$217,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Jenette Caldwell</td>'
                  '                <td>Development Lead</td>'
                  '                <td>New York</td>'
                  '                <td>30</td>'
                  '                <td>2011-09-03</td>'
                  '                <td>$345,000</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Yuri Berry</td>'
                  '                <td>Chief Marketing Officer (CMO)</td>'
                  '                <td>New York</td>'
                  '                <td>40</td>'
                  '                <td>2009-06-25</td>'
                  '                <td>$675,000</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Caesar Vance</td>'
                  '                <td>Pre-Sales Support</td>'
                  '                <td>New York</td>'
                  '                <td>21</td>'
                  '                <td>2011-12-12</td>'
                  '                <td>$106,450</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Doris Wilder</td>'
                  '                <td>Sales Assistant</td>'
                  '                <td>Sydney</td>'
                  '                <td>23</td>'
                  '                <td>2010-09-20</td>'
                  '                <td>$85,600</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Angelica Ramos</td>'
                  '                <td>Chief Executive Officer (CEO)</td>'
                  '                <td>London</td>'
                  '                <td>47</td>'
                  '                <td>2009-10-09</td>'
                  '                <td>$1,200,000</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Gavin Joyce</td>'
                  '                <td>Developer</td>'
                  '                <td>Edinburgh</td>'
                  '                <td>42</td>'
                  '                <td>2010-12-22</td>'
                  '                <td>$92,575</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Jennifer Chang</td>'
                  '                <td>Regional Director</td>'
                  '                <td>Singapore</td>'
                  '                <td>28</td>'
                  '                <td>2010-11-14</td>'
                  '                <td>$357,650</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Brenden Wagner</td>'
                  '                <td>Software Engineer</td>'
                  '                <td>San Francisco</td>'
                  '                <td>28</td>'
                  '                <td>2011-06-07</td>'
                  '                <td>$206,850</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Fiona Green</td>'
                  '                <td>Chief Operating Officer (COO)</td>'
                  '                <td>San Francisco</td>'
                  '                <td>48</td>'
                  '                <td>2010-03-11</td>'
                  '                <td>$850,000</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Shou Itou</td>'
                  '                <td>Regional Marketing</td>'
                  '                <td>Tokyo</td>'
                  '                <td>20</td>'
                  '                <td>2011-08-14</td>'
                  '                <td>$163,000</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Michelle House</td>'
                  '                <td>Integration Specialist</td>'
                  '                <td>Sydney</td>'
                  '                <td>37</td>'
                  '                <td>2011-06-02</td>'
                  '                <td>$95,400</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Suki Burks</td>'
                  '                <td>Developer</td>'
                  '                <td>London</td>'
                  '                <td>53</td>'
                  '                <td>2009-10-22</td>'
                  '                <td>$114,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Prescott Bartlett</td>'
                  '                <td>Technical Author</td>'
                  '                <td>London</td>'
                  '                <td>27</td>'
                  '                <td>2011-05-07</td>'
                  '                <td>$145,000</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Gavin Cortez</td>'
                  '                <td>Team Leader</td>'
                  '                <td>San Francisco</td>'
                  '                <td>22</td>'
                  '                <td>2008-10-26</td>'
                  '                <td>$235,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Martena Mccray</td>'
                  '                <td>Post-Sales support</td>'
                  '                <td>Edinburgh</td>'
                  '                <td>46</td>'
                  '                <td>2011-03-09</td>'
                  '                <td>$324,050</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Unity Butler</td>'
                  '                <td>Marketing Designer</td>'
                  '                <td>San Francisco</td>'
                  '                <td>47</td>'
                  '                <td>2009-12-09</td>'
                  '                <td>$85,675</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Howard Hatfield</td>'
                  '                <td>Office Manager</td>'
                  '                <td>San Francisco</td>'
                  '                <td>51</td>'
                  '                <td>2008-12-16</td>'
                  '                <td>$164,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Hope Fuentes</td>'
                  '                <td>Secretary</td>'
                  '                <td>San Francisco</td>'
                  '                <td>41</td>'
                  '                <td>2010-02-12</td>'
                  '                <td>$109,850</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Vivian Harrell</td>'
                  '                <td>Financial Controller</td>'
                  '                <td>San Francisco</td>'
                  '                <td>62</td>'
                  '                <td>2009-02-14</td>'
                  '                <td>$452,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Timothy Mooney</td>'
                  '                <td>Office Manager</td>'
                  '                <td>London</td>'
                  '                <td>37</td>'
                  '                <td>2008-12-11</td>'
                  '                <td>$136,200</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Jackson Bradshaw</td>'
                  '                <td>Director</td>'
                  '                <td>New York</td>'
                  '                <td>65</td>'
                  '                <td>2008-09-26</td>'
                  '                <td>$645,750</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Olivia Liang</td>'
                  '                <td>Support Engineer</td>'
                  '                <td>Singapore</td>'
                  '                <td>64</td>'
                  '                <td>2011-02-03</td>'
                  '                <td>$234,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Bruno Nash</td>'
                  '                <td>Software Engineer</td>'
                  '                <td>London</td>'
                  '                <td>38</td>'
                  '                <td>2011-05-03</td>'
                  '                <td>$163,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Sakura Yamamoto</td>'
                  '                <td>Support Engineer</td>'
                  '                <td>Tokyo</td>'
                  '                <td>37</td>'
                  '                <td>2009-08-19</td>'
                  '                <td>$139,575</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Thor Walton</td>'
                  '                <td>Developer</td>'
                  '                <td>New York</td>'
                  '                <td>61</td>'
                  '                <td>2013-08-11</td>'
                  '                <td>$98,540</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Finn Camacho</td>'
                  '                <td>Support Engineer</td>'
                  '                <td>San Francisco</td>'
                  '                <td>47</td>'
                  '                <td>2009-07-07</td>'
                  '                <td>$87,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Serge Baldwin</td>'
                  '                <td>Data Coordinator</td>'
                  '                <td>Singapore</td>'
                  '                <td>64</td>'
                  '                <td>2012-04-09</td>'
                  '                <td>$138,575</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Zenaida Frank</td>'
                  '                <td>Software Engineer</td>'
                  '                <td>New York</td>'
                  '                <td>63</td>'
                  '                <td>2010-01-04</td>'
                  '                <td>$125,250</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Zorita Serrano</td>'
                  '                <td>Software Engineer</td>'
                  '                <td>San Francisco</td>'
                  '                <td>56</td>'
                  '                <td>2012-06-01</td>'
                  '                <td>$115,000</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Jennifer Acosta</td>'
                  '                <td>Junior Javascript Developer</td>'
                  '                <td>Edinburgh</td>'
                  '                <td>43</td>'
                  '                <td>2013-02-01</td>'
                  '                <td>$75,650</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Cara Stevens</td>'
                  '                <td>Sales Assistant</td>'
                  '                <td>New York</td>'
                  '                <td>46</td>'
                  '                <td>2011-12-06</td>'
                  '                <td>$145,600</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Hermione Butler</td>'
                  '                <td>Regional Director</td>'
                  '                <td>London</td>'
                  '                <td>47</td>'
                  '                <td>2011-03-21</td>'
                  '                <td>$356,250</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Lael Greer</td>'
                  '                <td>Systems Administrator</td>'
                  '                <td>London</td>'
                  '                <td>21</td>'
                  '                <td>2009-02-27</td>'
                  '                <td>$103,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Jonas Alexander</td>'
                  '                <td>Developer</td>'
                  '                <td>San Francisco</td>'
                  '                <td>30</td>'
                  '                <td>2010-07-14</td>'
                  '                <td>$86,500</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Shad Decker</td>'
                  '                <td>Regional Director</td>'
                  '                <td>Edinburgh</td>'
                  '                <td>51</td>'
                  '                <td>2008-11-13</td>'
                  '                <td>$183,000</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Michael Bruce</td>'
                  '                <td>Javascript Developer</td>'
                  '                <td>Singapore</td>'
                  '                <td>29</td>'
                  '                <td>2011-06-27</td>'
                  '                <td>$183,000</td>'
                  '            </tr>'
                  '            <tr>'
                  '                <td>Donna Snider</td>'
                  '                <td>Customer Support</td>'
                  '                <td>New York</td>'
                  '                <td>27</td>'
                  '                <td>2011-01-25</td>'
                  '                <td>$112,000</td>'
                  '            </tr>'
                  '        </tbody>'
                  '        <tfoot>'
                  '            <tr>'
                  '                <th>Name</th>'
                  '                <th>Position</th>'
                  '                <th>Office</th>'
                  '                <th>Age</th>'
                  '                <th>Start date</th>'
                  '                <th>Salary</th>'
                  '            </tr>'
                  '        </tfoot>'
                  '    </table>'
                  ''
                  '</div>'
                  ''
                  '<script type="text/javascript">'
                  ''
                  ''
                  'new DataTable('#39'#example'#39', {'
                  '    paging: true,'
                  '    scrollCollapse: true,'
                  '    scrollY: '#39'50vh'#39
                  '});'
                  ''
                  '</script>')
                AutoScroll = True
                ScrollHeight = 301
                ScrollWidth = 453
              end
            end
          end
        end
      end
    end
  end
  object sqlDataQuery: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'select * '
      'from clientes'
      'where 1<>1'
      '')
    Left = 576
    Top = 36
  end
  object dsDataQuery: TDataSource
    AutoEdit = False
    DataSet = sqlDataQuery
    OnStateChange = dsDataQueryStateChange
    Left = 576
    Top = 84
  end
  object rcSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ImageIndex = 0
    Padding = 20
    FocusCancel = True
    Left = 250
    Top = 4
  end
end
