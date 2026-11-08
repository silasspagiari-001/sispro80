unit untDEMO_GRIDS;//7.4.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, uniGUIApplication,
  uniGUIClasses, uniGUIFrame, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uniGUIBaseClasses, uniSweetAlert, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn, uniPanel, uniDBEdit, uniEdit, uniBasicGrid, uniDBGrid, uniPageControl, uniLabel,
  uniScrollBox, uniHTMLFrame, uniDateTimePicker, uniCheckBox, uniRadioGroup, uniMultiItem, uniComboBox;

type
  TfrmDEMO_GRIDS = class(TUniFrame)
    sqlDataQuery: TFDQuery;
    dsDataQuery: TDataSource;
    rcSweetAlert: TUniSweetAlert;
    UniScrollBox1: TUniScrollBox;
    rcBlock16: TUniContainerPanel;
    btSair: TUniLabel;
    rcBlock180: TUniContainerPanel;
    pgData: TUniPageControl;
    tabTabulator: TUniTabSheet;
    UniScrollBox3: TUniScrollBox;
    UniLabel1: TUniLabel;
    btnEdit: TUniBitBtn;
    btnSave: TUniBitBtn;
    tabDataTable: TUniTabSheet;
    UniScrollBox4: TUniScrollBox;
    rcBlock200: TUniContainerPanel;
    UniLabel2: TUniLabel;
    rcBlock210: TUniContainerPanel;
    UniLabel7Clone: TUniLabel;
    htmlTabulator: TUniHTMLFrame;
    htmlDataTable: TUniHTMLFrame;
    procedure UniFrameBeforeReady(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure dbgDataDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure dsDataQueryStateChange(Sender: TObject);
    procedure dbgDataCellClick(Column: TUniDBGridColumn);
    procedure btSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure rc_Tabulator;
    procedure rc_DataTable;

  end;

implementation

{$R *.dfm}

uses untDM_RC, mkm_layout, mkm_dbfuncs, MainModule, untModalFrameForm, mkm_func_web, uconsts_cfg;

procedure TfrmDEMO_GRIDS.btSairClick(Sender: TObject);
begin
  if Pos( 'frmModalFrameForm', self.Owner.Name ) = 0 then
  begin
     dm_rc.rc_CloseQuerys( Self , False, False );
     //[PT] este exemplo é chamado a partir do MENU PRINCIPAL( como MODAL ) e pelo frmDEMO_FORMs( não MODAL )
     //[EN] this example is called from the MAIN MENU ( as MODAL ) and by frmDEMO_FORMs ( not MODAL )
     if ( mm.oPgGeneral <> nil ) then
        mm.oPgGeneral.ActivePage.Close
  end
  else
     TfrmModalFrameForm( self.Owner ).CloseForm;
end;

procedure TfrmDEMO_GRIDS.dbgDataCellClick(Column: TUniDBGridColumn);
begin
//   dm_rc.rc_ActionBtnCellClick( self, Column.FieldName );
end;

procedure TfrmDEMO_GRIDS.dbgDataDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
     dm_rc.rc_GridDrawCell( TUniDBGrid( sender ) , ACol, ARow, Column, Attribs ) ;
end;
//[PT] "state-visible:": quando não há registros, as colunas não são renderizadas deixando um layout indesejável
//[EN] "state-visible:": When there are no records, the columns are not rendered leaving an undesirable layout
procedure TfrmDEMO_GRIDS.dsDataQueryStateChange(Sender: TObject);
begin
  inherited;
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) );
end;

procedure TfrmDEMO_GRIDS.rc_DataTable;
begin
   htmlDataTable.AutoScroll := false;
   htmlDataTable.HTML.Clear;
   htmlDataTable.HTML.Add(
     '<div id="datatable-example">' +
(*
<table id="example2" class="table table-bordered table-hover dataTable dtr-inline" aria-describedby="example2_info">
*)

//     '<table id="' + htmlDataTable.Name + 'example" class="table table-bordered table-hover table-striped" style="width:100%">' +
//     '<table id="' + htmlDataTable.Name + 'example" class="display table table-hover table-striped" style="width:100%">' +
     '<table id="' + htmlDataTable.Name + 'example" class="table table-hover table-striped" style="width:100%">' +
     '        <thead>' +
     '            <tr>' +
     '                <th>Name</th>' +
     '                <th>Position</th>' +
     '                <th>Office</th>' +
     '                <th>Age</th>' +
     '                <th>Start date</th>' +
     '                <th>Salary</th>' +
     '            </tr>' +
     '        </thead>' +
     '        <tbody>' +
     '            <tr>' +
     '                <td>Tiger Nixon</td>' +
     '                <td>System Architect</td>' +
     '                <td>Edinburgh</td>' +
     '                <td>61</td>' +
     '                <td>2011-04-25</td>' +
     '                <td>$320,800</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Garrett Winters</td>' +
     '                <td>Accountant</td>' +
     '                <td>Tokyo</td>' +
     '                <td>63</td>' +
     '                <td>2011-07-25</td>' +
     '                <td>$170,750</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Ashton Cox</td>' +
     '                <td>Junior Technical Author</td>' +
     '                <td>San Francisco</td>' +
     '                <td>66</td>' +
     '                <td>2009-01-12</td>' +
     '                <td>$86,000</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Cedric Kelly</td>' +
     '                <td>Senior Javascript Developer</td>' +
     '                <td>Edinburgh</td>' +
     '                <td>22</td>' +
     '                <td>2012-03-29</td>' +
     '                <td>$433,060</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Airi Satou</td>' +
     '                <td>Accountant</td>' +
     '                <td>Tokyo</td>' +
     '                <td>33</td>' +
     '                <td>2008-11-28</td>' +
     '                <td>$162,700</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Brielle Williamson</td>' +
     '                <td>Integration Specialist</td>' +
     '                <td>New York</td>' +
     '                <td>61</td>' +
     '                <td>2012-12-02</td>' +
     '                <td>$372,000</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Herrod Chandler</td>' +
     '                <td>Sales Assistant</td>' +
     '                <td>San Francisco</td>' +
     '                <td>59</td>' +
     '                <td>2012-08-06</td>' +
     '                <td>$137,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Rhona Davidson</td>' +
     '                <td>Integration Specialist</td>' +
     '                <td>Tokyo</td>' +
     '                <td>55</td>' +
     '                <td>2010-10-14</td>' +
     '                <td>$327,900</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Colleen Hurst</td>' +
     '                <td>Javascript Developer</td>' +
     '                <td>San Francisco</td>' +
     '                <td>39</td>' +
     '                <td>2009-09-15</td>' +
     '                <td>$205,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Sonya Frost</td>' +
     '                <td>Software Engineer</td>' +
     '                <td>Edinburgh</td>' +
     '                <td>23</td>' +
     '                <td>2008-12-13</td>' +
     '                <td>$103,600</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Jena Gaines</td>' +
     '                <td>Office Manager</td>' +
     '                <td>London</td>' +
     '                <td>30</td>' +
     '                <td>2008-12-19</td>' +
     '                <td>$90,560</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Quinn Flynn</td>' +
     '                <td>Support Lead</td>' +
     '                <td>Edinburgh</td>' +
     '                <td>22</td>' +
     '                <td>2013-03-03</td>' +
     '                <td>$342,000</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Charde Marshall</td>' +
     '                <td>Regional Director</td>' +
     '                <td>San Francisco</td>' +
     '                <td>36</td>' +
     '                <td>2008-10-16</td>' +
     '                <td>$470,600</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Haley Kennedy</td>' +
     '                <td>Senior Marketing Designer</td>' +
     '                <td>London</td>' +
     '                <td>43</td>' +
     '                <td>2012-12-18</td>' +
     '                <td>$313,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Tatyana Fitzpatrick</td>' +
     '                <td>Regional Director</td>' +
     '                <td>London</td>' +
     '                <td>19</td>' +
     '                <td>2010-03-17</td>' +
     '                <td>$385,750</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Michael Silva</td>' +
     '                <td>Marketing Designer</td>' +
     '                <td>London</td>' +
     '                <td>66</td>' +
     '                <td>2012-11-27</td>' +
     '                <td>$198,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Paul Byrd</td>' +
     '                <td>Chief Financial Officer (CFO)</td>' +
     '                <td>New York</td>' +
     '                <td>64</td>' +
     '                <td>2010-06-09</td>' +
     '                <td>$725,000</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Gloria Little</td>' +
     '                <td>Systems Administrator</td>' +
     '                <td>New York</td>' +
     '                <td>59</td>' +
     '                <td>2009-04-10</td>' +
     '                <td>$237,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Bradley Greer</td>' +
     '                <td>Software Engineer</td>' +
     '                <td>London</td>' +
     '                <td>41</td>' +
     '                <td>2012-10-13</td>' +
     '                <td>$132,000</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Dai Rios</td>' +
     '                <td>Personnel Lead</td>' +
     '                <td>Edinburgh</td>' +
     '                <td>35</td>' +
     '                <td>2012-09-26</td>' +
     '                <td>$217,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Jenette Caldwell</td>' +
     '                <td>Development Lead</td>' +
     '                <td>New York</td>' +
     '                <td>30</td>' +
     '                <td>2011-09-03</td>' +
     '                <td>$345,000</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Yuri Berry</td>' +
     '                <td>Chief Marketing Officer (CMO)</td>' +
     '                <td>New York</td>' +
     '                <td>40</td>' +
     '                <td>2009-06-25</td>' +
     '                <td>$675,000</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Caesar Vance</td>' +
     '                <td>Pre-Sales Support</td>' +
     '                <td>New York</td>' +
     '                <td>21</td>' +
     '                <td>2011-12-12</td>' +
     '                <td>$106,450</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Doris Wilder</td>' +
     '                <td>Sales Assistant</td>' +
     '                <td>Sydney</td>' +
     '                <td>23</td>' +
     '                <td>2010-09-20</td>' +
     '                <td>$85,600</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Angelica Ramos</td>' +
     '                <td>Chief Executive Officer (CEO)</td>' +
     '                <td>London</td>' +
     '                <td>47</td>' +
     '                <td>2009-10-09</td>' +
     '                <td>$1,200,000</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Gavin Joyce</td>' +
     '                <td>Developer</td>' +
     '                <td>Edinburgh</td>' +
     '                <td>42</td>' +
     '                <td>2010-12-22</td>' +
     '                <td>$92,575</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Jennifer Chang</td>' +
     '                <td>Regional Director</td>' +
     '                <td>Singapore</td>' +
     '                <td>28</td>' +
     '                <td>2010-11-14</td>' +
     '                <td>$357,650</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Brenden Wagner</td>' +
     '                <td>Software Engineer</td>' +
     '                <td>San Francisco</td>' +
     '                <td>28</td>' +
     '                <td>2011-06-07</td>' +
     '                <td>$206,850</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Fiona Green</td>' +
     '                <td>Chief Operating Officer (COO)</td>' +
     '                <td>San Francisco</td>' +
     '                <td>48</td>' +
     '                <td>2010-03-11</td>' +
     '                <td>$850,000</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Shou Itou</td>' +
     '                <td>Regional Marketing</td>' +
     '                <td>Tokyo</td>' +
     '                <td>20</td>' +
     '                <td>2011-08-14</td>' +
     '                <td>$163,000</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Michelle House</td>' +
     '                <td>Integration Specialist</td>' +
     '                <td>Sydney</td>' +
     '                <td>37</td>' +
     '                <td>2011-06-02</td>' +
     '                <td>$95,400</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Suki Burks</td>' +
     '                <td>Developer</td>' +
     '                <td>London</td>' +
     '                <td>53</td>' +
     '                <td>2009-10-22</td>' +
     '                <td>$114,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Prescott Bartlett</td>' +
     '                <td>Technical Author</td>' +
     '                <td>London</td>' +
     '                <td>27</td>' +
     '                <td>2011-05-07</td>' +
     '                <td>$145,000</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Gavin Cortez</td>' +
     '                <td>Team Leader</td>' +
     '                <td>San Francisco</td>' +
     '                <td>22</td>' +
     '                <td>2008-10-26</td>' +
     '                <td>$235,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Martena Mccray</td>' +
     '                <td>Post-Sales support</td>' +
     '                <td>Edinburgh</td>' +
     '                <td>46</td>' +
     '                <td>2011-03-09</td>' +
     '                <td>$324,050</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Unity Butler</td>' +
     '                <td>Marketing Designer</td>' +
     '                <td>San Francisco</td>' +
     '                <td>47</td>' +
     '                <td>2009-12-09</td>' +
     '                <td>$85,675</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Howard Hatfield</td>' +
     '                <td>Office Manager</td>' +
     '                <td>San Francisco</td>' +
     '                <td>51</td>' +
     '                <td>2008-12-16</td>' +
     '                <td>$164,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Hope Fuentes</td>' +
     '                <td>Secretary</td>' +
     '                <td>San Francisco</td>' +
     '                <td>41</td>' +
     '                <td>2010-02-12</td>' +
     '                <td>$109,850</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Vivian Harrell</td>' +
     '                <td>Financial Controller</td>' +
     '                <td>San Francisco</td>' +
     '                <td>62</td>' +
     '                <td>2009-02-14</td>' +
     '                <td>$452,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Timothy Mooney</td>' +
     '                <td>Office Manager</td>' +
     '                <td>London</td>' +
     '                <td>37</td>' +
     '                <td>2008-12-11</td>' +
     '                <td>$136,200</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Jackson Bradshaw</td>' +
     '                <td>Director</td>' +
     '                <td>New York</td>' +
     '                <td>65</td>' +
     '                <td>2008-09-26</td>' +
     '                <td>$645,750</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Olivia Liang</td>' +
     '                <td>Support Engineer</td>' +
     '                <td>Singapore</td>' +
     '                <td>64</td>' +
     '                <td>2011-02-03</td>' +
     '                <td>$234,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Bruno Nash</td>' +
     '                <td>Software Engineer</td>' +
     '                <td>London</td>' +
     '                <td>38</td>' +
     '                <td>2011-05-03</td>' +
     '                <td>$163,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Sakura Yamamoto</td>' +
     '                <td>Support Engineer</td>' +
     '                <td>Tokyo</td>' +
     '                <td>37</td>' +
     '                <td>2009-08-19</td>' +
     '                <td>$139,575</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Thor Walton</td>' +
     '                <td>Developer</td>' +
     '                <td>New York</td>' +
     '                <td>61</td>' +
     '                <td>2013-08-11</td>' +
     '                <td>$98,540</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Finn Camacho</td>' +
     '                <td>Support Engineer</td>' +
     '                <td>San Francisco</td>' +
     '                <td>47</td>' +
     '                <td>2009-07-07</td>' +
     '                <td>$87,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Serge Baldwin</td>' +
     '                <td>Data Coordinator</td>' +
     '                <td>Singapore</td>' +
     '                <td>64</td>' +
     '                <td>2012-04-09</td>' +
     '                <td>$138,575</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Zenaida Frank</td>' +
     '                <td>Software Engineer</td>' +
     '                <td>New York</td>' +
     '                <td>63</td>' +
     '                <td>2010-01-04</td>' +
     '                <td>$125,250</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Zorita Serrano</td>' +
     '                <td>Software Engineer</td>' +
     '                <td>San Francisco</td>' +
     '                <td>56</td>' +
     '                <td>2012-06-01</td>' +
     '                <td>$115,000</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Jennifer Acosta</td>' +
     '                <td>Junior Javascript Developer</td>' +
     '                <td>Edinburgh</td>' +
     '                <td>43</td>' +
     '                <td>2013-02-01</td>' +
     '                <td>$75,650</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Cara Stevens</td>' +
     '                <td>Sales Assistant</td>' +
     '                <td>New York</td>' +
     '                <td>46</td>' +
     '                <td>2011-12-06</td>' +
     '                <td>$145,600</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Hermione Butler</td>' +
     '                <td>Regional Director</td>' +
     '                <td>London</td>' +
     '                <td>47</td>' +
     '                <td>2011-03-21</td>' +
     '                <td>$356,250</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Lael Greer</td>' +
     '                <td>Systems Administrator</td>' +
     '                <td>London</td>' +
     '                <td>21</td>' +
     '                <td>2009-02-27</td>' +
     '                <td>$103,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Jonas Alexander</td>' +
     '                <td>Developer</td>' +
     '                <td>San Francisco</td>' +
     '                <td>30</td>' +
     '                <td>2010-07-14</td>' +
     '                <td>$86,500</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Shad Decker</td>' +
     '                <td>Regional Director</td>' +
     '                <td>Edinburgh</td>' +
     '                <td>51</td>' +
     '                <td>2008-11-13</td>' +
     '                <td>$183,000</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Michael Bruce</td>' +
     '                <td>Javascript Developer</td>' +
     '                <td>Singapore</td>' +
     '                <td>29</td>' +
     '                <td>2011-06-27</td>' +
     '                <td>$183,000</td>' +
     '            </tr>' +
     '            <tr>' +
     '                <td>Donna Snider</td>' +
     '                <td>Customer Support</td>' +
     '                <td>New York</td>' +
     '                <td>27</td>' +
     '                <td>2011-01-25</td>' +
     '                <td>$112,000</td>' +
     '            </tr>' +
     '        </tbody>' +
     '        <tfoot>' +
     '            <tr>' +
     '                <th>Name</th>' +
     '                <th>Position</th>' +
     '                <th>Office</th>' +
     '                <th>Age</th>' +
     '                <th>Start date</th>' +
     '                <th>Salary</th>' +
     '            </tr>' +
     '        </tfoot>' +
     '    </table>' +
     '</div>' +
     '<script type="text/javascript">' +
     '  $(''#' + htmlDataTable.Name + 'example'').DataTable({' +
//     '  new DataTable(''#' + htmlDataTable.Name + 'example'', {' +
     '      paging: true,' +
     '      scrollCollapse: true,' +
     '      scrollY: ''50vh''' +
     '  });' +
//events
     //     '  $(''#' + htmlDataTable.Name + 'example'').on( ''draw.dt'', function () {' +
//     '      alert( ''Table redraw'' );' +
//     '  } );' +
//events
//     '  var startTime;' +
//     '  $(''#' + htmlDataTable.Name + 'example'')' +
//     '    .on(''preDraw'', function () {' +
//     '        startTime = new Date().getTime();' +
//     '    })' +
//     '    .on(''draw.dt'', function () {' +
//     '        console.log(''Redraw took at: '' + (new Date().getTime() - startTime) + ''mS'');' +
//     '    });' +

     '</script>' );

end;

procedure TfrmDEMO_GRIDS.rc_Tabulator;
begin
   htmlTabulator.AutoScroll := false;
   htmlTabulator.HTML.Clear;
   htmlTabulator.HTML.Add(
 //  '<div class="row">' +
 //  '  <div class="col-lg-12">'+
   '    <div id="tabulator-example" style="height:100%;width:100%;"></div>' +
 //  '  </div>'+
 //  '</div>'+
   '<script type="text/javascript">' +

   '	var tabledata = [' +
   '	{id:1, name:"Oli Bob", progress:12, gender:"male", rating:1, col:"red", dob:"19/02/1984", car:1},' +
   '	{id:2, name:"Mary May", progress:1, gender:"female", rating:2, col:"blue", dob:"14/05/1982", car:true},' +
   '	{id:3, name:"Christine Lobowski", progress:42, gender:"female", rating:0, col:"green", dob:"22/05/1982", car:"true"},' +
   '	{id:4, name:"Brendon Philips", progress:100, gender:"male", rating:1, col:"orange", dob:"01/08/1980"},' +
   '	{id:5, name:"Margret Marmajuke", progress:16, gender:"female", rating:5, col:"yellow", dob:"31/01/1999"},' +
   '	{id:6, name:"Frank Harbours", progress:38, gender:"male", rating:4, col:"red", dob:"12/05/1966", car:1},' +
   '	{id:7, name:"Jamie Newhart", progress:23, gender:"male", rating:3, col:"green", dob:"14/05/1985", car:true},' +
   '	{id:8, name:"Gemma Jane", progress:60, gender:"female", rating:0, col:"red", dob:"22/05/1982", car:"true"},' +
   '	{id:9, name:"Emily Sykes", progress:42, gender:"female", rating:1, col:"maroon", dob:"11/11/1970"},' +
   '	{id:10, name:"James Newman", progress:73, gender:"male", rating:5, col:"red", dob:"22/03/1998"},' +
   '	{id:11, name:"Martin Barryman", progress:20, gender:"male", rating:5, col:"violet", dob:"04/04/2001"},' +
   '	{id:12, name:"Jenny Green", progress:56, gender:"female", rating:4, col:"indigo", dob:"12/11/1998", car:true},' +
   '	{id:13, name:"Alan Francis", progress:90, gender:"male", rating:3, col:"blue", dob:"07/08/1972", car:true},' +
   '	{id:14, name:"John Phillips", progress:80, gender:"male", rating:1, col:"green", dob:"24/09/1950", car:true},' +
   '	{id:15, name:"Ed White", progress:70, gender:"male", rating:0, col:"yellow", dob:"19/06/1976"},' +
   '	{id:16, name:"Paul Branderson", progress:60, gender:"male", rating:5, col:"orange", dob:"01/01/1982"},' +
   '	{id:18, name:"Emma Netwon", progress:40, gender:"female", rating:4, col:"brown", dob:"07/10/1963", car:true},' +
   '	{id:19, name:"Hannah Farnsworth", progress:30, gender:"female", rating:1, col:"pink", dob:"11/02/1991"},' +
   '	{id:20, name:"Victoria Bath", progress:20, gender:"female", rating:2, col:"purple", dob:"22/03/1986"},' +
   '	];' +

   'var table = new Tabulator("#tabulator-example", {' +
   '    data:tabledata,           ' +//load row data from array
   '    height:"100%",' +
 //  '    height:"auto",' +
 //  '    height:"' + rcBlock10.Height.ToString + 'px",' +
   '    layout:"fitColumns",' +
 //  '    responsiveLayout:"hide",  ' + //hide columns that don''t fit on the table
   '    responsiveLayout:true, ' +
   '    pagination:"local",' +
   '    paginationSize:10,' +
 //  '    paginationSizeSelector:[3, 6, 8, 10],' +
   '    movableColumns:true,' +
   '    paginationCounter:"rows",' +
   '    columnDefaults:{' +
   '        tooltip:true,         ' + //show tool tips on cells
   '    },    ' +
 //  '    persistence:{' +  //ativando perde a "responsividade" das colunas
 //  '      sort:true,' +
 //  '      filter:true,' +
 //  '      columns:true,' +
 //  '    },' +
 //  '    persistenceID:"' + htmlTabulator.Name + '_gridCfg",' +
   '    columns:[' +
   '        {title:"Name", field:"name", width:200},' +
   '        {title:"Progress", field:"progress", formatter:"progress", sorter:"number"},' +
   '        {title:"Gender", field:"gender"},' +
   '        {title:"Rating", field:"rating", formatter:"star", hozAlign:"center", width:100},' +
   '        {title:"Favourite Color", field:"col"},' +
   '        {title:"Date Of Birth", field:"dob", hozAlign:"center", sorter:"date"},' +
   '        {title:"Driver", field:"car", hozAlign:"center", formatter:"tickCross"},' +
   '    ]' +
   '});' +

   'table.on("rowClick", function(e, row){' +
   '  alert( "Row " + row.getData().id + " Clicked!" );' +
   '});' +

   '</script>' );

   //pgData.TabBarVisible := false;

end;

procedure TfrmDEMO_GRIDS.UniFrameBeforeReady(Sender: TObject);
begin
   // dm_rc.rc_ResizeBlocks( Self, false, false );
end;
// RC_CORE
// Doc Link [PT] https://radcore.pro.br/web/help/pt/RenderizandooLayout.html
//          [EN] https://radcore.pro.br/web/help/en/LayoutRender.html
procedure TfrmDEMO_GRIDS.UniFrameCreate(Sender: TObject);
var
 cTagString : string;
begin


//   pgData.ActivePage := tabUniDBGrid;

//   // configurar lookups...mascaras...etc.. preparar query [[fields]]...
//   // adjust the lookup tables according to the query name
//   dm_rc.rc_RenderLookUpControls( Self );
//   // atualizar todos os LOOKUPs dinamicamente
//   mm.varC_Lookup_Code := '';
//   //dm_rc.rc_LookUpUpdateData(  self  );

   sqlDataQuery.SQL.Text :=
     ' select ' +
//
//     //rc_DynamicBindFields +
//     ' codigo, cnpj_cpf, fone1, codiemp, nome, dtcadastro, valor_contrato, ativo, pessoa, codiuf ' +
//
//     ' from ' + dm_rc.rc_DBSchema + 'clientes ' + //6.1.0.0
//
////     ' where codigo <= 1' +
//
//     ' order by codigo ';
     //' [[firstshow:20]] ' +
     '   tab.codigo as "CÓDIGO", tab.nome, tab.cnpj_cpf ,' +
     '   tab.Fone1 , ' +
     '   tab.cep , ' +
     '   tab.endereco , tab.numero , tab.complemento , ' +
     '   cidades.descricao as cidade , ' +
     '   ufs.descricao as uf , ' +
     '   tab.valor_contrato, ' +  //,
     '   tab.dtcadastro, ' +     //( If need to search by date only not a period )
     '   tab.dtaniversario ' +  //( If need to search by date only not a period )

     ' FROM  clientes tab ' +

     ' LEFT JOIN ' + dm_rc.rc_DBSchema + 'ufs ufs ON ufs.codigo = tab.codiuf ' + //6.1.0.0
     ' LEFT JOIN ' + dm_rc.rc_DBSchema + 'cidades cidades ON cidades.codigo = tab.codicidade ' +

     ' where 1=1 ' +

     ' order by tab.codigo';

  dm_rc.rc_OpenQuery( sqlDataQuery );


  mm.varC_Table_Search := 'clientes';

   // contar quantos campos tem pra ativar ou nao o FORCEFIT
   // FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
   dm_rc.rc_DBGridUpdateAll( Self , false, false, false );

//   // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks

   rc_Tabulator;
   rc_Datatable;

   rc_RenderLayout( Self, false, false, true, false );

end;

procedure TfrmDEMO_GRIDS.UniFrameReady(Sender: TObject);
begin

   dm_rc.rc_ResizeBlocks( Self, true, true );

   // contar quantos campos tem pra ativar ou nao o FORCEFIT
   // FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
   //dm_rc.rc_DBGridUpdateAll( Self , false, false, true);

end;
// -------------------------------------------------------------------------
initialization
   RegisterClass( TfrmDEMO_GRIDS );

end.


