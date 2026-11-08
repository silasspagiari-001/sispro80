unit mkm_graphs; // 6.0.0.0


interface

uses
    System.SysUtils, System.Classes ,       System.TypInfo, JSON, DBXJSON, DBXJSONReflect, 
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics,
    UniGuiClasses, uconsts, uconsts_cfg,
    Data.DB;

// Graphics and Gauges
// para servir de modelo / to serve as a model
function rc_GraphDefaultStyle( pId:string ):string;
function rc_GraphCircleGauge( pLabel: string ; pId: string;
                              pValue: integer ; pMin: integer; pMax: integer; pWidthScale: double; pTimeAnim: integer ;
                              pLevelColor : TColor = COLOR_GREEN;
                              pGaugeColor : TColor = COLOR_HOVER_SILVER;
                              pDonut: boolean = true; pPointer : boolean = false;
                              pTitle: string = '' ): string;

// ApexChart Lines
// passar um dataset com os campos SERIE, VALUE1 e VALUE2.../ pass a dataset with the fields SERIE, VALUE1 and VALUE2...
function rc_ApexChartGraphLines( pDataSet: TDataset;
                                 pID, pNAME, pTITLE, pSUBTITLE, pValuesLabel: string;
                                 pStacked: boolean = false; pyAxes: boolean = true; pxAxes: boolean = false;
                                 pbackgroundColor1  : TColor = COLOR_BLUE;
                                 pborderColor1      : TColor = COLOR_BLUEDARK;
                                 ppointStrokeColor1 : TColor = COLOR_BLUEDARK;
                                 pbackgroundColor2  : TColor = COLOR_ORANGE;
                                 pborderColor2      : TColor = COLOR_ORANGEDARK;
                                 ppointStrokeColor2 : TColor = COLOR_ORANGEDARK ): string;

// barras
// passar um dataset com os campos SERIE, VALUE1 e VALUE2... / pass a dataset with the fields SERIE, VALUE1 and VALUE2...
function rc_GraphBars( pDataSet: TDataset; pID, pValuesLabel: string;
                       pStacked: boolean = false; pyAxes: boolean = true; pxAxes: boolean = false;
                       pbackgroundColor1  : TColor = COLOR_BLUE;
                       pborderColor1      : TColor = COLOR_BLUEDARK;
                       ppointStrokeColor1 : TColor = COLOR_BLUEDARK;
                       pbackgroundColor2  : TColor = COLOR_ORANGE;
                       pborderColor2      : TColor = COLOR_ORANGEDARK;
                       ppointStrokeColor2 : TColor = COLOR_ORANGEDARK ): string;

function rc_GraphPieDoughnut( pDataSet: TDataset; pID, pValuesLabel: string;
                              pGraphType : TRCGraphType = gtPIE;
                              pGraphColors : TRCGraphColor = gcInferno;
                              pStacked: boolean = false;
                              pyAxes: boolean = true;
                              pxAxes: boolean = false;
                              pAspectRatio : integer = 1;
                              pLabels: boolean = true;
                              pWidth : integer = 150;
                              pHeight : integer = 150 ): string;

implementation

uses str_func, mkm_func_web;

function rc_GraphDefaultStyle( pId:string ):string;
begin
     Result :=
           '<style>' +
           //'    /* clearfix */' +
           '    .rc_clear' + pId + ':before,' +
           '    .rc_clear' + pId + ':after {' +
           '        content: "";' +
           '        display: table;' +
           '    }' +
           '    .rc_clear' + pId + ':after {' +
           '        clear: both;' +
           '    }' +
           '    .rc_clear' + pId + ' {' +
           '        *zoom: 1;' +
           '    }' +
           '    .rc_wrapper' + pId + ' {' +
           '        position: absolute;' +
           '        top: 0;' +
           '        right: 0;' +
           '        bottom: 0;' +
           '        left: 0;' +
           '        margin: 0px;' +
           '        border: 0px solid #cccccc;' +
           '        padding: 10px;' +
//           '        margin: 10px;' +
           '    }' +
           '    .rc_graph' + pId + ' {' +
           '        display: block;' +
           '        float: left;' +
           '    }' +
           '    #rc_' + pId + ' {' +
           '        width: 100%;' +
           '        height: 100%;' +
           '    }' +
           '    </style>' +
           '    <div class="rc_wrapper' + pId + ' rc_clear' + pId + '">' +
           '        <div id="rc_' + pId + '" class="rc_graph' + pId + '"></div>' +
           '    </div>' ;
end;

function rc_GraphBars( pDataSet: TDataset; pID, pValuesLabel: string;
                       pStacked, pyAxes , pxAxes: boolean;
                       pbackgroundColor1, pborderColor1, ppointStrokeColor1,
                       pbackgroundColor2, pborderColor2, ppointStrokeColor2: TColor): string;
var
  fValue : Double;

  i : integer;

  cValue1Label,
  cValue2Label,

//  cValue1backgroundColor,
//  cValue1borderColor,
//  cValue1pointStrokeColor,
//  cValue2backgroundColor,
//  cValue2borderColor,
//  cValue2pointStrokeColor,

  cHtml,
  cDataSets,
  cSeriesLabel : string;
  //cValuesLabel : string;
begin
     pDataSet.Open;

     cSeriesLabel := '';
     cDataSets    := '';
     cValue1Label := '';
     cValue2Label := '';

     if Pos( ';', pValuesLabel ) > 0 then
     begin
          cValue1Label := Copy( pValuesLabel, 1, Pos( ';', pValuesLabel ) - 1 );
          cValue2Label := Copy( pValuesLabel, Pos( ';', pValuesLabel ) + 1, 100 );
     end
     else
     begin
         cValue1Label := pValuesLabel;
     end;

     for I := 1 to varIIF( cValue2Label = '', 1, 2 ) do
     begin
         cDataSets := '';
         pDataset.First;

         while not pDataset.Eof do
         begin
              if  I = 1 then
                  cSeriesLabel := cSeriesLabel + '"' + pDataSet.FieldByName( 'serie' ).AsString + '"';

              fValue    := pDataset.FieldByName( 'value' + IntToStr( i ) ).AsCurrency;
              cDataSets := cDataSets + StringReplace( FloatToStr( fValue ), ',', '.', [rfReplaceAll] );

              pDataSet.Next;

              if ( not pDataSet.eof )  then
              begin
                 if ( I = 1 ) then
                    cSeriesLabel := cSeriesLabel + ',';

                 cDataSets := cDataSets + ',' ;
              end;
         end;

         cHtml := cHtml +
             '        {' +
             '          label               : ' + QuotedStr( varIIF( I = 1 , cValue1Label, cValue2Label ) ) + ',' +
             '          weight: 5,' +
             '          borderWidth: 0,' +
             '          borderRadius: 4,' +
             '          backgroundColor     : ' + QuotedStr( ColorToHtml( varIIF( I = 1 , pbackgroundColor1, pbackgroundColor2 ) ) ) + ',' +
             '          borderColor         : ' + QuotedStr( ColorToHtml( varIIF( I = 1 , pborderColor1, pborderColor2 ) ) ) + ',' +
             '          fill: false,' +
             '          maxBarThickness: 35,' +
             '          data                : [ [[pDATA]] ]' +
             '        }' ;

         cHtml := StringReplace( cHtml, '[[pDATA]]', cDataSets, [rfReplaceAll] ) ;

         if cValue2Label <> '' then
            cHtml := cHtml + ',' ;
     end;

     cDataSets := StringReplace( cHtml, '[[pDATA]]', cDataSets, [rfReplaceAll] ) ;

     chtml :=
          '<canvas id="rcbar-chart' + pID + '" class="chart-canvas" height="100%"></canvas>' +
          '<script>' +
          '    var ctxbar = document.getElementById("rcbar-chart' + pID + '").getContext("2d");' +
          '    new Chart(ctxbar, {' +
          '       type: "bar",' +
          '       data: {' +
          '       labels: [ [[pSERIES]] ],' +
          '       datasets: [ [[pDATASETS]] ]' +
          '      },' +
          '      options: {' +
          '        responsive: true,' +
          '        maintainAspectRatio: false,' +
          '        plugins: {' +
          '          legend: {' +
          '            display: false,' +
          '          }' +
          '        },' +
          '        scales: {' +
          '          y: {' +
          '            grid: {' +
          '              drawBorder: false,' +
          '              display: true,' +
          '              drawOnChartArea: true,' +
          '              drawTicks: false,' +
          '              borderDash: [5, 5]' +
          '            },' +
          '            ticks: {' +
          '              display: true,' +
          '              padding: 10,' +
          '              color: ''#9ca2b7''' +
          '            }' +
          '          },' +
          '          x: {' +
          '            grid: {' +
          '              drawBorder: false,' +
          '              display: false,' +
          '              drawOnChartArea: true,' +
          '              drawTicks: true,' +
          '            },' +
          '            ticks: {' +
          '              display: true,' +
          '              color: ''#9ca2b7'',' +
          '              padding: 10' +
          '            }' +
          '          },' +
          '        },' +
          '      },' +
          '    });' +
          '</script>';

     Result := StringReplace( cHtml , '[[pSERIES]]'   , cSeriesLabel , [rfReplaceAll] );
     Result := StringReplace( Result, '[[pDATASETS]]' , cDataSets    , [rfReplaceAll] );
end;

function rc_GraphCircleGauge( pLabel: string ; pId: string;
                              pValue: integer ; pMin: integer; pMax: integer; pWidthScale: double; pTimeAnim: integer ;
                              pLevelColor : TColor ;
                              pGaugeColor : TColor ;
                              pDonut: boolean ; pPointer : boolean ;
                              pTitle: string  ): string;
begin
     Result := rc_GraphDefaultStyle( pID ) +
           '    <script>' +
           '        var g1, g2, g3;' +
           '        var g1 = new JustGage({' +
           '            id: "rc_' + pId + '",' +
           '            value: ' + pValue.ToString + ',' +
           '            min: ' + pMin.ToString + ',' +
           '            max: ' + pMax.ToString + ',' + // 100
           '            title: "' + pTitle + '",'+
           '            label: "' + pLabel + '",'+
           '            gaugeWidthScale: ' + StringReplace( FloatToStr( pWidthScale ), ',', '.', [rfReplaceAll] ) + ','+
           '            pointer: ' + varIIF( pPointer, 'true', 'false' ) + ',' +
           '            startAnimationTime: ' + pTimeAnim.ToString + ',' +
           '            startAnimationType: ">",' +
           '            refreshAnimationTime: 400,' +
           '            refreshAnimationType: "bounce",' +
           '            gaugeColor: "' + ColorToHtml( pGaugeColor ) + '",'+
           '            levelColors: ["' + ColorToHtml( pLevelColor ) + '"],'+
           '            relativeGaugeSize: true,' +
           '            donut: ' + varIIF( pDonut, 'true', 'false' ) + '' +
           '        });' +
           '    </script>        ' ;
end;

function rc_GraphPieDoughnut( pDataSet: TDataset; pID, pValuesLabel: string;
                              pGraphType : TRCGraphType; pGraphColors : TRCGraphColor;
                              pStacked, pyAxes , pxAxes: boolean; pAspectRatio : integer; pLabels: boolean;
                              pWidth : integer ;
                              pHeight : integer ): string;
var
  fValue : Double;

  i,f,p,c : integer;

  cValue1Label,
  cValue2Label,

//  cValue1backgroundColor,
//  cValue1borderColor,
//  cValue1pointStrokeColor,
//  cValue2backgroundColor,
//  cValue2borderColor,
//  cValue2pointStrokeColor,

  cHtml,
  cType,
  cDataSets,
  cSeriesLabel, cColors : string;
//  cValuesLabel : string;
begin
     cType := varIIF( pGraphType = gtPIE, 'pie', 'doughnut' ) ;

     pDataSet.Open;

     cSeriesLabel := '';
     cDataSets    := '';
     cValue1Label := '';
     cValue2Label := '';
     cColors      := '';

     if Pos( ';', pValuesLabel ) > 0 then
     begin
          cValue1Label := Copy( pValuesLabel, 1, Pos( ';', pValuesLabel ) - 1 );
          cValue2Label := Copy( pValuesLabel, Pos( ';', pValuesLabel ) + 1, 100 );
     end
     else
     begin
         cValue1Label := pValuesLabel;
     end;

     I := 1;
     f := 0;
     begin
         cDataSets := '';
         pDataset.First;
         while not pDataset.Eof do
         begin
              Inc( f );

              case pGraphColors of
                 gcRainbow: cColors := cColors + QuotedStr(ARRAY_COLORS1[ ( Length( ARRAY_COLORS1 ) -1 ) - f ] ); 
                 gcInferno: cColors := cColors + QuotedStr(ARRAY_COLORS2[ ( Length( ARRAY_COLORS1 ) -1 ) - f ] ); 
                 gcMagma  : cColors := cColors + QuotedStr(ARRAY_COLORS3[ ( Length( ARRAY_COLORS1 ) -1 ) - f ] ); 
                 gcGreens : cColors := cColors + QuotedStr(ARRAY_COLORS4[ ( Length( ARRAY_COLORS1 ) -1 ) - f ] ); 
                 gcPurples: cColors := cColors + QuotedStr(ARRAY_COLORS5[ ( Length( ARRAY_COLORS1 ) -1 ) - f ] ); 
                 gcReds   : cColors := cColors + QuotedStr(ARRAY_COLORS6[ ( Length( ARRAY_COLORS1 ) -1 ) - f ] ); 
//                 gcRainbow: cColors := cColors + QuotedStr(ARRAY_COLORS1[ f ] ); 
//                 gcInferno: cColors := cColors + QuotedStr(ARRAY_COLORS2[ f ] ); 
//                 gcMagma  : cColors := cColors + QuotedStr(ARRAY_COLORS3[ f ] ); 
//                 gcGreens : cColors := cColors + QuotedStr(ARRAY_COLORS4[ f ] ); 
//                 gcPurples: cColors := cColors + QuotedStr(ARRAY_COLORS5[ f ] ); 
//                 gcReds   : cColors := cColors + QuotedStr(ARRAY_COLORS6[ f ] ); 
                 gcRandom : begin
                                 p := Random( 5 ) + 1;
                                 c := Random( 11 ) + 1;

                                 case p of
                                     1: cColors := cColors + QuotedStr(ARRAY_COLORS1[ c ] );
                                     2: cColors := cColors + QuotedStr(ARRAY_COLORS2[ c ] );
                                     3: cColors := cColors + QuotedStr(ARRAY_COLORS3[ c ] );
                                     4: cColors := cColors + QuotedStr(ARRAY_COLORS4[ c ] );
                                     5: cColors := cColors + QuotedStr(ARRAY_COLORS5[ c ] );
                                     6: cColors := cColors + QuotedStr(ARRAY_COLORS6[ c ] );
                                 end;
                            end;
              end;

              cSeriesLabel := cSeriesLabel + '"' + pDataSet.FieldByName( 'serie' ).AsString + '"';

              fValue    := pDataset.FieldByName( 'value' + IntToStr( i ) ).AsCurrency;
              cDataSets := cDataSets + StringReplace( FloatToStr( fValue ), ',', '.', [rfReplaceAll] );

              pDataSet.Next;

              if ( not pDataSet.eof )  then
              begin
                 cSeriesLabel := cSeriesLabel + ',';

                 cDataSets := cDataSets + ',' ;
                 cColors   := cColors + ', ';
              end;
         end;
     end;

     chtml :=
              //'<div id="canvas-' + cType + pID + '">'+
                  //'  <canvas id="chart-' + cType + pID + '" style="width:' + pWidth.ToString + 'px;height:' + pHeight.toString + 'px;"></canvas>' +
                  '<canvas id="rc-chart-' + cType + pID + '" class="chart-canvas" height="100%"></canvas>' +
              //'</div>' +

             '<script>'+

               'var xValues = [ [[pSERIES]] ];' +
               'var yValues = [ [[pDATA]] ];' +
               'var barColors = [ [[pCOLORS]] ' +

               '];' +
               '' +
               'new Chart("rc-chart-' + cType + pID + '", {' +
               '  type: "doughnut",' +
               '  data: {' +
               '    labels: xValues,' +
               '    datasets: [{' +
               '      backgroundColor: barColors,' +
               '      data: yValues' +
               '    }]' +
               '  },' +

               '      options: {' +
               '        responsive: true,' +
               '        maintainAspectRatio: false,' +
               '        plugins: {' +
               '          legend: {' +
               '            display: false,' +
               '          }' +
               '        },' +
               '        interaction: {' +
               '          intersect: false,' +
               '          mode: ''index'',' +
               '        },' +
               '        scales: {' +
               '          y: {' +
               '            grid: {' +
               '              drawBorder: false,' +
               '              display: false,' +
               '              drawOnChartArea: false,' +
               '              drawTicks: false,' +
               '            },' +
               '            ticks: {' +
               '              display: false' +
               '            }' +
               '          },' +
               '          x: {' +
               '            grid: {' +
               '              drawBorder: false,' +
               '              display: false,' +
               '              drawOnChartArea: false,' +
               '              drawTicks: false,' +
               '            },' +
               '            ticks: {' +
               '              display: false,' +
               '            }' +
               '          },' +
               '        },' +
               '      },' +
               '    });' +
               '</script>' ;

     Result := StringReplace( cHtml , '[[pSERIES]]' , cSeriesLabel , [rfReplaceAll] );
     Result := StringReplace( Result, '[[pDATA]]'   , cDataSets    , [rfReplaceAll] );
     Result := StringReplace( Result, '[[pCOLORS]]' , cColors      , [rfReplaceAll] );
end;
 // in development
// ApexCharts
// Lines
function rc_ApexChartGraphLines( pDataSet: TDataset;
                                 pID, pNAME, pTITLE, pSUBTITLE, pValuesLabel: string;
                                 pStacked, pyAxes , pxAxes: boolean;
                                 pbackgroundColor1, pborderColor1, ppointStrokeColor1,
                                 pbackgroundColor2, pborderColor2, ppointStrokeColor2: TColor): string;
var
  fValue : Double;

  i : integer;

  cValue1Label,
  cValue2Label,

//  cValue1backgroundColor,
//  cValue1borderColor,
//  cValue1pointStrokeColor,
//  cValue2backgroundColor,
//  cValue2borderColor,
//  cValue2pointStrokeColor,

  cHtml,
  cDataSets,
  cSeriesLabel : string;
  //cValuesLabel : string;
begin
     pDataSet.Open;

     cSeriesLabel := '';
     cDataSets    := '';
     cValue1Label := '';
     cValue2Label := '';

     if Pos( ';', pValuesLabel ) > 0 then
     begin
          cValue1Label := Copy( pValuesLabel, 1, Pos( ';', pValuesLabel ) - 1 );
          cValue2Label := Copy( pValuesLabel, Pos( ';', pValuesLabel ) + 1, 100 );
     end
     else
     begin
         cValue1Label := pValuesLabel;
     end;

     for I := 1 to 1 do //varIIF( cValue2Label = '', 1, 2 ) do
     begin
         cDataSets := '';
         pDataset.First;

         while not pDataset.Eof do
         begin
              if  I = 1 then
                  //cSeriesLabel := cSeriesLabel + '"' + pDataSet.FieldByName( 'serie' ).AsString + '"';
                  cSeriesLabel := cSeriesLabel + '"' + DateToStr( pDataSet.FieldByName( 'date_ref' ).AsDateTime ) + '"';

              fValue    := pDataset.FieldByName( 'value' + IntToStr( i ) ).AsCurrency;
              cDataSets := cDataSets + StringReplace( FloatToStr( fValue ), ',', '.', [rfReplaceAll] );

              pDataSet.Next;

              if ( not pDataSet.eof )  then
              begin
                 if ( I = 1 ) then
                    cSeriesLabel := cSeriesLabel + ',';

                 cDataSets := cDataSets + ',' ;
              end;
         end;
     end;

     cHtml :=
              '<div id="' + pID + '"></div>' +
              '<script>' +
              '  var options = {' +
              '  series: [{' +
              '    name: "' + pNAME + '",' +
              '    data: [ ' + cDataSets +
                        ']' +
              '  }],' +
              '  chart: {' +
              '    type: ''area'',' +
              '    height: 350,' +
              '    zoom: {' +
              '      enabled: false' +
              '    }' +
              '  },' +
              '  theme: {' +
              '    mode: ''light'',' +
              '    palette: ''palette1'',' +
              '    monochrome: {' +
              '      enabled: false,' +
              '      color: ''#255aee'',' +
              '      shadeTo: ''light'',' +
              '      shadeIntensity: 0.65' +
              '      },' +
              '    },' +
              '    dataLabels: {' +
              '    enabled: false' +
              '  },' +
              '  stroke: {' +
              '    curve: ''straight''' +
              '  },' +
              '  title: {' +
              '    text: ''' + pTITLE + ''',' +
              '    align: ''left''' +
              '  },' +
              '  subtitle: {' +
              '    text: ''' + pSUBTITLE + ''',' +
              '    align: ''left''' +
              '  },' +
              '  labels: [ ' + cSeriesLabel +
                        '],' +
              '  xaxis: {' +
              '    type: ''datetime'',' +
              '  },' +
              '  yaxis: {' +
              '    opposite: true' +
              '  },' +
              '  legend: {' +
              '    horizontalAlign: ''left''' +
              '  }' +
              '  };' +
              '  var chart = new ApexCharts(document.querySelector("#' + pID + '"), options);' +
              '  chart.render();' +
              '</script>' ;

     Result := cHtml;
end;

end.
