unit untGraphAPEX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniPanel, uniHTMLFrame, uniGUIBaseClasses, uniScrollBox, uniURLFrame, uniButton;

type
  TfrmGraphAPEX = class(TUniFrame)
    UniScrollBox1: TUniScrollBox;
    rcBlock40: TUniContainerPanel;
    htmlLines: TUniHTMLFrame;
    rcBlock50: TUniContainerPanel;
    htmlAreaGradient: TUniHTMLFrame;
    rcBlock60: TUniContainerPanel;
    htmlLineColumn: TUniHTMLFrame;
    rcBlock70: TUniContainerPanel;
    htmlBarHoriz: TUniHTMLFrame;
    rcBlock80: TUniContainerPanel;
    htmlFunel: TUniHTMLFrame;
    rcBlock90: TUniContainerPanel;
    htmlPyramid: TUniHTMLFrame;
    rcBlock140: TUniContainerPanel;
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

procedure TfrmGraphAPEX.rc_UpdateCharts;
begin
     //LINES
    htmlLines.HTML.Text :=
       '<style>'+
       '#apexchart_lines {' +
       '  max-width: auto;' + ///*760px;*/
       '  margin: 20px auto;' +
       '  opacity: 0.9;' +
       '}' +
       '</style>'+
       '<div id="apexchart_lines"></div>' +
       '<script>' +
       '  var options = {' +
       '  series: [{' +
       '    name: "CURVA ABC",' +
       '    data: [ 8107.85,' +
                   '8128.0,' +
                   '8122.9,' +
                   '8165.5,' +
                   '8340.7,' +
                   '8423.7,' +
                   '8423.5,' +
                   '8514.3,' +
                   '8481.85,' +
                   '8487.7,' +
                   '8506.9,' +
                   '8626.2,' +
                   '8668.95,' +
                   '8602.3,' +
                   '8607.55,' +
                   '8512.9,' +
                   '8496.25,' +
                   '8600.65,' +
                   '8881.1,' +
                   '9340.85' +
                 ']' +
       '  }],' +
       '  chart: {' +
       '    type: ''area'',' +
       '    height: 280,' +
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
       '    text: ''Vendas totais no período'',' +
       '    align: ''left''' +
       '  },' +
       '  subtitle: {' +
       '    text: ''Evolução do Preço'',' +
       '    align: ''left''' +
       '  },' +
       '  labels: [ "13 Nov 2020",' +
                   '"14 Nov 2020",' +
                   '"15 Nov 2020",' +
                   '"16 Nov 2020",' +
                   '"17 Nov 2020",' +
                   '"20 Nov 2020",' +
                   '"21 Nov 2020",' +
                   '"22 Nov 2020",' +
                   '"23 Nov 2020",' +
                   '"24 Nov 2020",' +
                   '"27 Nov 2020",' +
                   '"28 Nov 2020",' +
                   '"29 Nov 2020",' +
                   '"30 Nov 2020",' +
                   '"01 Dec 2020",' +
                   '"04 Dec 2020",' +
                   '"05 Dec 2020",' +
                   '"06 Dec 2020",' +
                   '"07 Dec 2020",' +
                   '"08 Dec 2020"' +
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
       '  var chart = new ApexCharts(document.querySelector("#apexchart_lines"), options);' +
       '  chart.render();' +
       '</script>' ;

       // horizontal bars
    htmlBarHoriz.HTML.Text :=
       '<style>'+
       '#apexchart_horizbar {' +
       '  max-width: auto;' +
       '  margin: 20px auto;' +
       '  opacity: 0.9;' +
       '}' +
       '</style>'+
       '<div id="apexchart_horizbar"></div>' +
       '<script>' +
       'var options = {' +
       '  chart: {' +
       '    width: "100%",' +
       '    height: 280,' +
       '    type: "bar"' +
       '  },' +
       '  plotOptions: {' +
       '    bar: {' +
       '      horizontal: true' +
       '    }' +
       '  },' +
       '  dataLabels: {' +
       '    enabled: false' +
       '  },' +
       '  stroke: {' +
       '    width: 1,' +
       '    colors: ["#fff"]' +
       '  },' +
       '  series: [' +
       '    {' +
       '      data: [44, 55, 41, 64, 22, 43, 21]' +
       '    },' +
       '    {' +
       '      data: [53, 32, 33, 52, 13, 44, 32]' +
       '    }' +
       '  ],' +
       '  xaxis: {' +
       '    categories: [' +
       '      "Korea",' +
       '      "Canada",' +
       '      "Poland",' +
       '      "Italy",' +
       '      "France",' +
       '      "Japan",' +
       '      "China"' +
       '    ]' +
       '  },' +
       '  legend: {' +
       '    position: "right",' +
       '    verticalAlign: "top",' +
       '    containerMargin: {' +
       '      left: 35,' +
       '      right: 60' +
       '    }' +
       '  },' +
       '  responsive: [' +
       '    {' +
       '      breakpoint: 1000,' +
       '      options: {' +
       '        plotOptions: {' +
       '          bar: {' +
       '            horizontal: false' +
       '          }' +
       '        },' +
       '        legend: {' +
       '          position: "bottom"' +
       '        }' +
       '      }' +
       '    }' +
       '  ]' +
       '};' +
       'var chart = new ApexCharts(' +
       '  document.querySelector("#apexchart_horizbar"),' +
       '  options' +
       ');' +
       'chart.render();' +
       '</script>' ;

       // gradient area chart
    htmlAreaGradient.HTML.Text :=
       '<style>'+
       '#apexchart_gradarea {' +
       '  max-width: auto;' +
       '  margin: 20px auto;' +
       '  opacity: 0.9;' +
       '}' +
       '</style>'+
       '<div id="apexchart_gradarea"></div>' +
       '<script>' +
       'var options = {' +
       '  chart: {' +
       '    height: 280,' +
       '    type: "area"' +
       '  },' +
       '  dataLabels: {' +
       '    enabled: false' +
       '  },' +
       '  series: [' +
       '    {' +
       '      name: "Series 1",' +
       '      data: [45, 52, 38, 45, 19, 23, 2]' +
       '    }' +
       '  ],' +
       '  fill: {' +
       '    type: "gradient",' +
       '    gradient: {' +
       '      shadeIntensity: 1,' +
       '      opacityFrom: 0.7,' +
       '      opacityTo: 0.9,' +
       '      stops: [0, 90, 100]' +
       '    }' +
       '  },' +
       '  xaxis: {' +
       '    categories: [' +
       '      "01 Jan",' +
       '      "02 Jan",' +
       '      "03 Jan",' +
       '      "04 Jan",' +
       '      "05 Jan",' +
       '      "06 Jan",' +
       '      "07 Jan"' +
       '    ]' +
       '  }' +
       '};' +
       'var chart = new ApexCharts(document.querySelector("#apexchart_gradarea"), options);' +
       'chart.render();' +
       '</script>';

       // line Column
    htmlLineColumn.HTML.Text :=
       '<style>'+
       '#apexchart_linecolumn {' +
       '  max-width: auto;' +
       '  margin: 20px auto;' +
       '  opacity: 0.9;' +
       '}' +
       '</style>'+
       '<div id="apexchart_linecolumn"></div>' +
      '<script>' +
      ' var options = {' +
      '   series: [{' +
      '   name: ''Website Blog'',' +
      '   type: ''column'',' +
      '   data: [440, 505, 414, 671, 227, 413, 201, 352, 752, 320, 257, 160]' +
      ' }, {' +
      '   name: ''Social Media'',' +
      '   type: ''line'',' +
      '   data: [23, 42, 35, 27, 43, 22, 17, 31, 22, 22, 12, 16]' +
      ' }],' +
      '   chart: {' +
      '   height: 350,' +
      '   type: ''line'',' +
      ' },' +
      ' stroke: {' +
      '   width: [0, 4]' +
      ' },' +
      ' title: {' +
      '   text: ''Traffic Sources''' +
      ' },' +
      ' dataLabels: {' +
      '   enabled: true,' +
      '   enabledOnSeries: [1]' +
      ' },' +
      ' labels: [''01 Jan 2001'', ''02 Jan 2001'', ''03 Jan 2001'', ''04 Jan 2001'', ''05 Jan 2001'', ''06 Jan 2001'', ''07 Jan 2001'', ''08 Jan 2001'', ''09 Jan 2001'', ''10 Jan 2001'', ''11 Jan 2001'', ''12 Jan 2001''],' +
      ' xaxis: {' +
      '   type: ''datetime''' +
      ' },' +
      ' yaxis: [{' +
      '   title: {' +
      '     text: ''Website Blog'',' +
      '   },' +
      ' ' +
      ' }, {' +
      '   opposite: true,' +
      '   title: {' +
      '     text: ''Social Media''' +
      '   }' +
      ' }]' +
      ' };' +
      ' var chart = new ApexCharts(document.querySelector("#apexchart_linecolumn"), options);' +
      ' chart.render();' +
      '</script>';

      // funel
    htmlFunel.HTML.Text :=
       '<style>'+
       '#apexchart_funel {' +
       '  max-width: auto;' +
       '  margin: 20px auto;' +
       '  opacity: 0.9;' +
       '}' +
       '</style>'+
       '<div id="apexchart_funel"></div>' +
      '<script>' +
'        var options = {' +
'          series: [' +
'          {' +
'            name: "Funnel Series",' +
'            data: [1380, 1100, 990, 880, 740, 548, 330, 200],' +
'          },' +
'        ],' +
'          chart: {' +
'          type: ''bar'',' +
'          height: 350,' +
'        },' +
'        plotOptions: {' +
'          bar: {' +
'            borderRadius: 0,' +
'            horizontal: true,' +
'            barHeight: ''80%'',' +
'            isFunnel: true,' +
'          },' +
'        },' +
'        dataLabels: {' +
'          enabled: true,' +
'          formatter: function (val, opt) {' +
'            return opt.w.globals.labels[opt.dataPointIndex] + '':  '' + val' +
'          },' +
'          dropShadow: {' +
'            enabled: true,' +
'          },' +
'        },' +
'        title: {' +
'          text: ''Recruitment Funnel'',' +
'          align: ''middle'',' +
'        },' +
'        xaxis: {' +
'          categories: [' +
'            ''Sourced'',' +
'            ''Screened'',' +
'            ''Assessed'',' +
'            ''HR Interview'',' +
'            ''Technical'',' +
'            ''Verify'',' +
'            ''Offered'',' +
'            ''Hired'',' +
'          ],' +
'        },' +
'        legend: {' +
'          show: false,' +
'        },' +
'        };' +
'        var chart = new ApexCharts(document.querySelector("#apexchart_funel"), options);' +
'        chart.render();' +
      '</script>';

      //pyramid
    htmlPyramid.HTML.Text :=
       '<style>'+
       '#apexchart_pyramid {' +
       '  max-width: auto;' +
       '  margin: 20px auto;' +
       '  opacity: 0.9;' +
       '}' +
       '</style>'+
       '<div id="apexchart_pyramid"></div>' +
      '<script>' +
'        var options = {' +
'          series: [' +
'          {' +
'            name: "",' +
'            data: [200, 330, 548, 740, 880, 990, 1100, 1380],' +
'          },' +
'        ],' +
'          chart: {' +
'          type: ''bar'',' +
'          height: 350,' +
'        },' +
'        plotOptions: {' +
'          bar: {' +
'            borderRadius: 0,' +
'            horizontal: true,' +
'            distributed: true,' +
'            barHeight: ''80%'',' +
'            isFunnel: true,' +
'          },' +
'        },' +
'        colors: [' +
'          ''#F44F5E'',' +
'          ''#E55A89'',' +
'          ''#D863B1'',' +
'          ''#CA6CD8'',' +
'          ''#B57BED'',' +
'          ''#8D95EB'',' +
'          ''#62ACEA'',' +
'          ''#4BC3E6'',' +
'        ],' +
'        dataLabels: {' +
'          enabled: true,' +
'          formatter: function (val, opt) {' +
'            return opt.w.globals.labels[opt.dataPointIndex] ' +
'          },' +
'          dropShadow: {' +
'            enabled: true,' +
'          },' +
'        },' +
'        title: {' +
'          text: ''Pyramid Chart'',' +
'          align: ''middle'',' +
'        },' +
'        xaxis: {' +
'          categories: [''Sweets'', ''Processed Foods'', ''Healthy Fats'', ''Meat'', ''Beans & Legumes'', ''Dairy'', ''Fruits & Vegetables'', ''Grains''],' +
'        },' +
'        legend: {' +
'          show: false,' +
'        },' +
'        };' +
'        var chart = new ApexCharts(document.querySelector("#apexchart_pyramid"), options);' +
'        chart.render();' +
'        </script>';


end;
// RC_CORE
//[PT] Descomente. O uso do "scale:" ou "hr:" em blocos responsivos "dentro de frames" precisa desse processo adicionar para renderizar corretamente
//[EN] Uncomment. The use of "scale:" or "hr:"  in responsive blocks "within frames" needs this process added to render correctly
procedure TfrmGraphAPEX.UniFrameBeforeReady(Sender: TObject);
begin
   // dm_rc.rc_ResizeBlocks( Self, false, false );
end;
// RC_CORE
// Doc Link [PT] https://radcore.pro.br/web/help/pt/RenderizandooLayout.html
//          [EN] https://radcore.pro.br/web/help/en/LayoutRender.html
procedure TfrmGraphAPEX.UniFrameCreate(Sender: TObject);
begin
   rc_RenderLayout( Self, false, false, true, false );
end;

procedure TfrmGraphAPEX.UniFrameReady(Sender: TObject);
begin
   dm_rc.rc_ResizeBlocks( Self, true, true );

   rc_UpdateCharts;

end;
// -------------------------------------------------------------------------
initialization
   RegisterClass( TfrmGraphAPEX );

end.

