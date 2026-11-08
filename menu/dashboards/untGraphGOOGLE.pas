unit untGraphGOOGLE;//7.3.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniPanel, uniHTMLFrame, uniGUIBaseClasses, uniScrollBox, uniURLFrame, uniButton,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmGraphGOOGLE = class(TUniFrame)
    UniScrollBox1: TUniScrollBox;
    rcBlock40: TUniContainerPanel;
    htmlMapBR: TUniHTMLFrame;
    rcBlock140: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    htmlMapWORLD: TUniHTMLFrame;
    memWorld: TFDMemTable;
    dsMemWorld: TDataSource;
    procedure UniFrameBeforeReady(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure rc_UpdateCharts;
  end;

implementation

{$R *.dfm}

uses untDM_RC, mkm_layout, MainModule;

procedure TfrmGraphGOOGLE.rc_UpdateCharts;
var
  JSONData: TStringList;
  JSArray: string;

  i: Integer;
begin

  //BRAZIL
  JSONData := TStringList.Create;
  try

    dm_rc.memTemp.Close;

    dm_rc.memTemp.Data := dm_rc.rc_GetRecord(
                             mm.varB_IsNot_API ,
                             True,
                             ' select trim(upper(''BR-'' || upper( trim( UF ) ) ) ) UF, count(*) CLIENTES ' +
                             ' from ' + dm_rc.rc_DBSchema + 'clientes ' +
                             ' group by 1 ' );
    if mm.varC_LastErrorMsg <> '' then
    begin
        dm_rc.rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' );
        Exit;
    end;

    JSONData.Add('["Estado", "Clientes"]');

    while not dm_rc.memTemp.Eof do
    begin
      JSONData.Add(Format('["%s", %d]',
        [ dm_rc.memTemp.FieldByName('UF').AsString,
          dm_rc.memTemp.FieldByName('CLIENTES').AsInteger
        ] ) );
      dm_rc.memTemp.Next;
    end;

    JSArray := '[';
    for i := 0 to JSONData.Count - 1 do
    begin
      if i > 0 then
         JSArray := JSArray + ', ';
      JSArray := JSArray + JSONData[i];
    end;
    JSArray := JSArray + ']';

    with htmlMapBR.HTML do //7.3.0.1
    begin
       Clear;
       Add('<style>');
       Add('  body { background-color: transparent; margin: 0; padding: 0; }');
       Add('  #mapchart { width: 100%; height: 100%; }');
       Add('</style>');
       Add('<script type="text/javascript">');
       Add('  google.charts.load("current", {"packages":["geochart"]});');
       Add('  google.charts.setOnLoadCallback(function() { drawChart(' + JSArray + '); });');
       Add('  function drawChart(dataArray) {');
       Add('    var data = google.visualization.arrayToDataTable(dataArray);');
       Add('    var options = { region: "BR", displayMode: "regions", resolution: "provinces",');
       Add('                    colorAxis: { colors: ["#87CEEB", "#00008B"] } };');
       Add('    var chart = new google.visualization.GeoChart(document.getElementById("mapchart"));');
       Add('    chart.draw(data, options);');
       Add('  }');
       Add('  window.onresize = function() { drawChart(' + JSArray + '); };');
       Add('</script>');
       Add('<div id="mapchart"></div>');
    end;
  finally
    JSONData.Free;
    dm_rc.memTemp.Close;
  end;

  //WORLD
  memWorld.Close;
  memWorld.LogChanges := false;
  memWorld.FieldDefs.Add('country'    , ftString ,  50 , False);
  memWorld.FieldDefs.Add('users' , ftInteger  );
  memWorld.CreateDataSet;

  // Append data
  memWorld.Open;
  memWorld.AppendRecord( [ 'SOUTH AFRICA' , 003 ] );
  memWorld.AppendRecord( [ 'GERMANY' , 008 ] );
  memWorld.AppendRecord( [ 'ALGERIA' , 001 ] );
  memWorld.AppendRecord( [ 'ANGOLA' , 002 ] );
  memWorld.AppendRecord( [ 'SAUDI ARABIA' , 003 ] );
  memWorld.AppendRecord( [ 'ARGENTINA' , 005 ] );
  memWorld.AppendRecord( [ 'AUSTRALIA' , 001 ] );
  memWorld.AppendRecord( [ 'AUSTRIA' , 002 ] );
  memWorld.AppendRecord( [ 'BELGIUM' , 001 ] );
  memWorld.AppendRecord( [ 'BELARUS' , 001 ] );
  memWorld.AppendRecord( [ 'BOLIVIA' , 002 ] );
  memWorld.AppendRecord( [ 'Brazil' , 400 ] );
  memWorld.AppendRecord( [ 'CHINA' , 001 ] );
  memWorld.AppendRecord( [ 'CANADA' , 001 ] );
  memWorld.AppendRecord( [ 'CAMEROON' , 001 ] );
  memWorld.AppendRecord( [ 'COLOMBIA' , 002 ] );
  memWorld.AppendRecord( [ 'CONGO' , 001 ] );
  memWorld.AppendRecord( [ 'SOUTH KOREA' , 002 ] );
  memWorld.AppendRecord( [ 'USA' , 006 ] );
  memWorld.AppendRecord( [ 'SPAIN' , 017 ] );
  memWorld.AppendRecord( [ 'SLOVAKIA' , 001 ] );
  memWorld.AppendRecord( [ 'ECUADOR' , 001 ] );
  memWorld.AppendRecord( [ 'FRANCE' , 001 ] );
  memWorld.AppendRecord( [ 'GREECE' , 001 ] );
  memWorld.AppendRecord( [ 'NETHERLANDS' , 006 ] );
  memWorld.AppendRecord( [ 'HUNGARY' , 001 ] );
  memWorld.AppendRecord( [ 'ITALY' , 010 ] );
  memWorld.AppendRecord( [ 'ISRAEL' , 001 ] );
  memWorld.AppendRecord( [ 'INDONESIA' , 007 ] );
  memWorld.AppendRecord( [ 'INDIA' , 001 ] );
  memWorld.AppendRecord( [ 'IRAN' , 002 ] );
  memWorld.AppendRecord( [ 'ISRAEL' , 001 ] );
  memWorld.AppendRecord( [ 'JORDAN' , 001 ] );
  memWorld.AppendRecord( [ 'KWAIT' , 001 ] );
  memWorld.AppendRecord( [ 'KASAKHSTAN' , 001 ] );
  memWorld.AppendRecord( [ 'KIRGYZSTAN' , 001 ] );
  memWorld.AppendRecord( [ 'LITHUANIA' , 001 ] );
  memWorld.AppendRecord( [ 'MACEDONIA' , 001 ] );
  memWorld.AppendRecord( [ 'MOROCCO' , 001 ] );
  memWorld.AppendRecord( [ 'MALAYSIA' , 001 ] );
  memWorld.AppendRecord( [ 'MALTA' , 001 ] );
  memWorld.AppendRecord( [ 'MEXICO' , 007 ] );
  memWorld.AppendRecord( [ 'NEPAL' , 001 ] );
  memWorld.AppendRecord( [ 'NIGERIA' , 001 ] );
  memWorld.AppendRecord( [ 'NORWAY' , 001 ] );
  memWorld.AppendRecord( [ 'UNITED KINGDOM' , 001 ] );
  memWorld.AppendRecord( [ 'PANAMA' , 001 ] );
  memWorld.AppendRecord( [ 'PARAGUAY' , 001 ] );
  memWorld.AppendRecord( [ 'PORTUGAL' , 002 ] );
  memWorld.AppendRecord( [ 'POLAND' , 001 ] );
  memWorld.AppendRecord( [ 'PERU' , 001 ] );
  memWorld.AppendRecord( [ 'DOMINICAN REPUBLIC' , 003 ] );
  memWorld.AppendRecord( [ 'ROMANIA' , 001 ] );
  memWorld.AppendRecord( [ 'RUSSIA' , 001 ] );
  memWorld.AppendRecord( [ 'SINGAPORE' , 001 ] );
  memWorld.AppendRecord( [ 'THAILAND' , 004 ] );
  memWorld.AppendRecord( [ 'TAIWAN' , 002 ] );
  memWorld.AppendRecord( [ 'Türkiye' , 016 ] );
  memWorld.AppendRecord( [ 'URUGUAY' , 001 ] );
  memWorld.AppendRecord( [ 'UKRAINE' , 001 ] );
  memWorld.AppendRecord( [ 'VIETNAM' , 001 ] );

  JSONData := TStringList.Create;
  try

    //dm_rc.memTemp.Close;

//    dm_rc.memTemp.Data := dm_rc.rc_GetRecord(
//                             mm.varB_IsNot_API ,
//                             True,
//                             ' select trim(upper(''BR-'' || upper( trim( UF ) ) ) ) UF, count(*) CLIENTES ' +
//                             ' from ' + dm_rc.rc_DBSchema + 'clientes ' +
//                             ' group by 1 ' );
//    if mm.varC_LastErrorMsg <> '' then
//    begin
//        dm_rc.rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' );
//        Exit;
//    end;

    JSONData.Add('["País", "Usuários RC"]');

    memWorld.First;
    while not memWorld.Eof do
    begin
      JSONData.Add(Format('["%s", %d]',
        [ memWorld.FieldByName('country').AsString,
          memWorld.FieldByName('users').AsInteger
        ] ) );
      memWorld.Next;
    end;

    JSArray := '[';
    for i := 0 to JSONData.Count - 1 do
    begin
      if i > 0 then
         JSArray := JSArray + ', ';
      JSArray := JSArray + JSONData[i];
    end;
    JSArray := JSArray + ']';

    with htmlMapWORLD.HTML do //7.3.0.1
    begin
       Clear;
       Add('<style>');
       Add('  body { background-color: transparent; margin: 0; padding: 0; }');
       Add('  #mapchartWorld { width: 100%; height: 100%; }');
       Add('</style>');
       Add('<script type="text/javascript">');
       Add('  google.charts.load("current", {"packages":["geochart"]});');
       Add('  google.charts.setOnLoadCallback(function() { drawChartWorld(' + JSArray + '); });');
       Add('  function drawChartWorld(dataArrayWorld) {');
       Add('    var data = google.visualization.arrayToDataTable(dataArrayWorld);');
       Add('    var options = {};');
       Add('    var chart = new google.visualization.GeoChart(document.getElementById("mapchartWorld"));');
       Add('    chart.draw(data, options);');
       Add('  }');
       Add('  window.onresize = function() { drawChartWorld(' + JSArray + '); };');
       Add('</script>');
       Add('<div id="mapchartWorld"></div>');
    end;
  finally
    JSONData.Free;
    memWorld.Close;
  end;
end;
// RC_CORE
//[PT] Descomente. O uso do "scale:" ou "hr:" em blocos responsivos "dentro de frames" precisa desse processo adicionar para renderizar corretamente
//[EN] Uncomment. The use of "scale:" or "hr:"  in responsive blocks "within frames" needs this process added to render correctly
procedure TfrmGraphGOOGLE.UniFrameBeforeReady(Sender: TObject);
begin
   // dm_rc.rc_ResizeBlocks( Self, false, false );
end;
// RC_CORE
// Doc Link [PT] https://radcore.pro.br/web/help/pt/RenderizandooLayout.html
//          [EN] https://radcore.pro.br/web/help/en/LayoutRender.html
procedure TfrmGraphGOOGLE.UniFrameCreate(Sender: TObject);
begin
   rc_RenderLayout( Self, false, false, true, false );
end;

procedure TfrmGraphGOOGLE.UniFrameReady(Sender: TObject);
begin
   dm_rc.rc_ResizeBlocks( Self, true, true );

   rc_UpdateCharts;

end;
// -------------------------------------------------------------------------
initialization
   RegisterClass( TfrmGraphGOOGLE );

end.

