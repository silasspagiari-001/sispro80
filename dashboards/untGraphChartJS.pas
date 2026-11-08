unit untGraphChartJS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniPanel, uniHTMLFrame, uniGUIBaseClasses, uniScrollBox, uniURLFrame;

type
  TfrmGraphCHARTJS = class(TUniFrame)
    UniScrollBox1: TUniScrollBox;
    rcBlock40: TUniContainerPanel;
    htmlLines: TUniHTMLFrame;
    rcBlock50: TUniContainerPanel;
    htmlLinesGradient: TUniHTMLFrame;
    rcBlock60: TUniContainerPanel;
    htmlBar: TUniHTMLFrame;
    rcBlock70: TUniContainerPanel;
    htmlBarHoriz: TUniHTMLFrame;
    rcBlock80: TUniContainerPanel;
    htmlBubble: TUniHTMLFrame;
    rcBlock90: TUniContainerPanel;
    htmlMixed: TUniHTMLFrame;
    rcBlock100: TUniContainerPanel;
    htmlDoughnut: TUniHTMLFrame;
    rcBlock110: TUniContainerPanel;
    htmlPie: TUniHTMLFrame;
    rcBlock120: TUniContainerPanel;
    htmlRadar: TUniHTMLFrame;
    rcBlock130: TUniContainerPanel;
    htmlPolar: TUniHTMLFrame;
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

procedure TfrmGraphCHARTJS.rc_UpdateCharts;
begin

   htmlLines.HTML.Text :=
      // '<div class="chart-container" style="position: relative; height:100vh; width:100vw">' +
       '  <canvas id="rcline-chart" class="chart-canvas" height="100%"></canvas>' +
      // '</div>' +
       '<script>' +
       '    var ctxline = document.getElementById("rcline-chart").getContext("2d");' +
       '    new Chart(ctxline, {' +
       '      type: "line",' +
       '      data: {' +
       '        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],' +
       '        datasets: [{' +
       '            label: "Organic Search",' +
       '            tension: 0.4,' +
       '            borderWidth: 0,' +
       '            pointRadius: 2,' +
       '            pointBackgroundColor: "#5e72e4",' +
       '            borderColor: "#5e72e4",' +
       '            borderWidth: 3,' +
       '            backgroundColor: gradientStroke1,' +
       '            data: [50, 40, 300, 220, 500, 250, 400, 230, 500],' +
       '            maxBarThickness: 6' +
       '          },' +
       '          {' +
       '            label: "Referral",' +
       '            tension: 0.4,' +
       '            borderWidth: 0,' +
       '            pointRadius: 2,' +
       '            pointBackgroundColor: "#3A416F",' +
       '            borderColor: "#3A416F",' +
       '            borderWidth: 3,' +
       '            backgroundColor: gradientStroke2,' +
       '            data: [30, 90, 40, 140, 290, 290, 340, 230, 400],' +
       '            maxBarThickness: 6' +
       '          },' +
       '          {' +
       '            label: "Direct",' +
       '            tension: 0.4,' +
       '            borderWidth: 0,' +
       '            pointRadius: 2,' +
       '            pointBackgroundColor: "#17c1e8",' +
       '            borderColor: "#17c1e8",' +
       '            borderWidth: 3,' +
       '            backgroundColor: gradientStroke2,' +
       '            data: [40, 80, 70, 90, 30, 90, 140, 130, 200],' +
       '            maxBarThickness: 6' +
       '          },' +
       '        ],' +
       '      },' +
       '      options: {' +
       '        responsive: true,' +
       '        maintainAspectRatio: false,' +
  //     '        aspectRatio: 1, ' +
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
       '              display: true,' +
       '              drawOnChartArea: true,' +
       '              drawTicks: false,' +
       '              borderDash: [5, 5]' +
       '            },' +
       '            ticks: {' +
       '              display: true,' +
       '              padding: 10,' +
       '              color: ''#b2b9bf'',' +
       '              font: {' +
       '                size: 11,' +
       '                family: "Open Sans",' +
       '                style: ''normal'',' +
       '                lineHeight: 2' +
       '              },' +
       '            }' +
       '          },' +
       '          x: {' +
       '            grid: {' +
       '              drawBorder: false,' +
       '              display: true,' +
       '              drawOnChartArea: true,' +
       '              drawTicks: true,' +
       '              borderDash: [5, 5]' +
       '            },' +
       '            ticks: {' +
       '              display: true,' +
       '              color: ''#b2b9bf'',' +
       '              padding: 10,' +
       '              font: {' +
       '                size: 11,' +
       '                family: "Open Sans",' +
       '                style: ''normal'',' +
       '                lineHeight: 2' +
       '              },' +
       '            }' +
       '          },' +
       '        },' +
       '      },' +
       '    });' +
       '</script>    ' ;

   htmlLinesGradient.HTML.Text :=
        //'<div class="chart">' +
        '<canvas id="rcline-chart-gradient" class="chart-canvas" height="100%"></canvas>' +
        //'</div>' +
        '<script>' +
        '    var ctxlineg = document.getElementById("rcline-chart-gradient").getContext("2d");' +
        '    var gradientStroke1 = ctxlineg.createLinearGradient(0, 230, 0, 50);' +
        '    gradientStroke1.addColorStop(1, ''rgba(94, 114, 228, 0.2)'');' +
        '    gradientStroke1.addColorStop(0.2, ''rgba(72,72,176,0.0)'');' +
        '    gradientStroke1.addColorStop(0, ''rgba(94, 114, 228,0)''); ' + ////purple colors
        '    var gradientStroke2 = ctxlineg.createLinearGradient(0, 230, 0, 50);' +
        '    gradientStroke2.addColorStop(1, ''rgba(20,23,39,0.2)'');' +
        '    gradientStroke2.addColorStop(0.2, ''rgba(72,72,176,0.0)'');' +
        '    gradientStroke2.addColorStop(0, ''rgba(20,23,39,0)''); ' + ////purple colors
        '    new Chart(ctxlineg, {' +
        '      type: "line",' +
        '      data: {' +
        '        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],' +
        '        datasets: [{' +
        '            label: "Mobile apps",' +
        '            tension: 0.4,' +
        '            borderWidth: 0,' +
        '            pointRadius: 0,' +
        '            borderColor: "#5e72e4",' +
        '            borderWidth: 3,' +
        '            backgroundColor: gradientStroke1,' +
        '            fill: true,' +
        '            data: [50, 40, 300, 220, 500, 250, 400, 230, 500],' +
        '            maxBarThickness: 6' +
        '          },' +
        '          {' +
        '            label: "Websites",' +
        '            tension: 0.4,' +
        '            borderWidth: 0,' +
        '            pointRadius: 0,' +
        '            borderColor: "#3A416F",' +
        '            borderWidth: 3,' +
        '            backgroundColor: gradientStroke2,' +
        '            fill: true,' +
        '            data: [30, 90, 40, 140, 290, 290, 340, 230, 400],' +
        '            maxBarThickness: 6' +
        '          },' +
        '        ],' +
        '      },' +
        '      options: {' +
        '        responsive: true,' +
        '        maintainAspectRatio: false,' +
//        '        aspectRatio: 1, ' +
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
        '              display: true,' +
        '              drawOnChartArea: true,' +
        '              drawTicks: false,' +
        '              borderDash: [5, 5]' +
        '            },' +
        '            ticks: {' +
        '              display: true,' +
        '              padding: 10,' +
        '              color: ''#b2b9bf'',' +
        '              font: {' +
        '                size: 11,' +
        '                family: "Open Sans",' +
        '                style: ''normal'',' +
        '                lineHeight: 2' +
        '              },' +
        '            }' +
        '          },' +
        '          x: {' +
        '            grid: {' +
        '              drawBorder: false,' +
        '              display: false,' +
        '              drawOnChartArea: false,' +
        '              drawTicks: false,' +
        '              borderDash: [5, 5]' +
        '            },' +
        '            ticks: {' +
        '              display: true,' +
        '              color: ''#b2b9bf'',' +
        '              padding: 10,' +
        '              font: {' +
        '                size: 11,' +
        '                family: "Open Sans",' +
        '                style: ''normal'',' +
        '                lineHeight: 2' +
        '              },' +
        '            }' +
        '          },' +
        '        },' +
        '      },' +
        '    });' +
        '</script>' ;

   htmlBar.HTML.Text :=
          '<canvas id="rcbar-chart" class="chart-canvas" height="100%"></canvas>' +
          '<script>' +
          '    var ctxbar = document.getElementById("rcbar-chart").getContext("2d");' +
          '    new Chart(ctxbar, {' +
          '      type: "bar",' +
          '      data: {' +
          '        labels: [''16-20'', ''21-25'', ''26-30'', ''31-36'', ''36-42'', ''42+''],' +
          '        datasets: [{' +
          '          label: "Sales by age",' +
          '          weight: 5,' +
          '          borderWidth: 0,' +
          '          borderRadius: 4,' +
          '          backgroundColor: ''#3A416F'',' +
          '          data: [15, 20, 12, 60, 20, 15],' +
          '          fill: false,' +
          '          maxBarThickness: 35' +
          '        }],' +
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

   htmlBarHoriz.HTML.Text :=
          '<canvas id="rcbar-chart-horizontal" class="chart-canvas" height="100%"></canvas>' +
          '<script>' +
          '    var ctxbarhor = document.getElementById("rcbar-chart-horizontal").getContext("2d");' +
          '    new Chart(ctxbarhor, {' +
          '      type: "bar",' +
          '      data: {' +
          '        labels: [''16-20'', ''21-25'', ''26-30'', ''31-36'', ''36-42'', ''42+''],' +
          '        datasets: [{' +
          '          label: "Sales by age",' +
          '          weight: 5,' +
          '          borderWidth: 0,' +
          '          borderRadius: 4,' +
          '          backgroundColor: ''#3A416F'',' +
          '          data: [15, 20, 12, 60, 20, 15],' +
          '          fill: false' +
          '        },' +
          '        {' +
          '          label: "Sales by age",' +
          '          weight: 5,' +
          '          borderWidth: 0,' +
          '          borderRadius: 4,' +
          '          backgroundColor: ''#0dcaf0'',' +
          '          data: [5, 10, 22, 40, 55, 35],' +
          '          fill: false' +
          '        },' +
          '      ]},' +

          '      options: {' +
          '        indexAxis: ''y'',' +
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
          '</script>' ;

   htmlBubble.HTML.Text :=
          '<canvas id="rcbubble-chart" class="chart-canvas" height="100%"></canvas>' +
          '<script>' +
          '    var ctx8 = document.getElementById("rcbubble-chart").getContext("2d");' +
          '    new Chart(ctx8, {' +
          '      type: "bubble",' +
          '      data: {' +
          '        labels: [''0'', ''10'', ''20'', ''30'', ''40'', ''50'', ''60'', ''70'', ''80'', ''90''],' +
          '        datasets: [{' +
          '            label: ''Dataset 1'',' +
          '            data: [{' +
          '              x: 100,' +
          '              y: 0,' +
          '              r: 10' +
          '            }, {' +
          '              x: 60,' +
          '              y: 30,' +
          '              r: 20' +
          '            }, {' +
          '              x: 40,' +
          '              y: 350,' +
          '              r: 10' +
          '            }, {' +
          '              x: 80,' +
          '              y: 80,' +
          '              r: 10' +
          '            }, {' +
          '              x: 20,' +
          '              y: 30,' +
          '              r: 15' +
          '            }, {' +
          '              x: 0,' +
          '              y: 100,' +
          '              r: 5' +
          '            }],' +
          '            backgroundColor: ''#5e72e4'',' +
          '          },' +
          '          {' +
          '            label: ''Dataset 2'',' +
          '            data: [{' +
          '              x: 70,' +
          '              y: 40,' +
          '              r: 10' +
          '            }, {' +
          '              x: 30,' +
          '              y: 60,' +
          '              r: 20' +
          '            }, {' +
          '              x: 10,' +
          '              y: 300,' +
          '              r: 25' +
          '            }, {' +
          '              x: 60,' +
          '              y: 200,' +
          '              r: 10' +
          '            }, {' +
          '              x: 50,' +
          '              y: 300,' +
          '              r: 15' +
          '            }, {' +
          '              x: 20,' +
          '              y: 350,' +
          '              r: 5' +
          '            }],' +
          '            backgroundColor: ''#3A416F'',' +
          '          }' +
          '        ]' +
          '      },' +
          '      options: {' +
          '        responsive: true,' +
          '        maintainAspectRatio: false,' +
          '        plugins: {' +
          '          legend: {' +
          '            display: false' +
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
          '              color: ''#b2b9bf'',' +
          '              font: {' +
          '                size: 11,' +
          '                family: "Open Sans",' +
          '                style: ''normal'',' +
          '                lineHeight: 2' +
          '              },' +
          '            }' +
          '          },' +
          '          x: {' +
          '            grid: {' +
          '              drawBorder: false,' +
          '              display: true,' +
          '              drawOnChartArea: true,' +
          '              drawTicks: false,' +
          '              borderDash: [5, 5]' +
          '            },' +
          '            ticks: {' +
          '              display: true,' +
          '              color: ''#b2b9bf'',' +
          '              padding: 10,' +
          '              font: {' +
          '                size: 11,' +
          '                family: "Open Sans",' +
          '                style: ''normal'',' +
          '                lineHeight: 2' +
          '              },' +
          '            }' +
          '          },' +
          '        },' +
          '      },' +
          '    });' +
          '</script>' ;

   htmlMixed.HTML.Text :=
          '<canvas id="rcmixed-chart" class="chart-canvas" height="100%" ></canvas>' +
          '<script>' +
          '    var ctxmixed = document.getElementById("rcmixed-chart").getContext("2d");' +
          '    new Chart(ctxmixed, {' +
          '      data: {' +
          '        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],' +
          '        datasets: [{' +
          '            type: "bar",' +
          '            label: "Organic Search",' +
          '            weight: 5,' +
          '            tension: 0.4,' +
          '            borderWidth: 0,' +
          '            pointBackgroundColor: "#3A416F",' +
          '            borderColor: "#3A416F",' +
          '            backgroundColor: ''#3A416F'',' +
          '            borderRadius: 4,' +
          '            borderSkipped: false,' +
          '            data: [50, 40, 300, 220, 500, 250, 400, 230, 500],' +
          '            maxBarThickness: 10,' +
          '          },' +
          '          {' +
          '            type: "line",' +
          '            label: "Referral",' +
          '            tension: 0.4,' +
          '            borderWidth: 0,' +
          '            pointRadius: 0,' +
          '            pointBackgroundColor: "#5e72e4",' +
          '            borderColor: "#5e72e4",' +
          '            borderWidth: 3,' +
          '            backgroundColor: gradientStroke1,' +
          '            data: [30, 90, 40, 140, 290, 290, 340, 230, 400],' +
          '            fill: true,' +
          '          }' +
          '        ],' +
          '      },' +
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
          '              display: true,' +
          '              drawOnChartArea: true,' +
          '              drawTicks: false,' +
          '              borderDash: [5, 5]' +
          '            },' +
          '            ticks: {' +
          '              display: true,' +
          '              padding: 10,' +
          '              color: ''#b2b9bf'',' +
          '              font: {' +
          '                size: 11,' +
          '                family: "Open Sans",' +
          '                style: ''normal'',' +
          '                lineHeight: 2' +
          '              },' +
          '            }' +
          '          },' +
          '          x: {' +
          '            grid: {' +
          '              drawBorder: false,' +
          '              display: true,' +
          '              drawOnChartArea: true,' +
          '              drawTicks: true,' +
          '              borderDash: [5, 5]' +
          '            },' +
          '            ticks: {' +
          '              display: true,' +
          '              color: ''#b2b9bf'',' +
          '              padding: 10,' +
          '              font: {' +
          '                size: 11,' +
          '                family: "Open Sans",' +
          '                style: ''normal'',' +
          '                lineHeight: 2' +
          '              },' +
          '            }' +
          '          },' +
          '        },' +
          '      },' +
          '    });' +
          '</script>' ;

   htmlDoughnut.HTML.text :=
          '<canvas id="rcdoughnut-chart" class="chart-canvas" height="100%" ></canvas>' +
          '<script>' +
          '    var ctxdoug = document.getElementById("rcdoughnut-chart").getContext("2d");' +
          '    new Chart(ctxdoug, {' +
          '      type: "doughnut",' +
          '      data: {' +
          '        labels: [''Creative Tim'', ''Github'', ''Bootsnipp'', ''Dev.to'', ''Codeinwp''],' +
          '        datasets: [{' +
          '          label: "Projects",' +
          '          weight: 9,' +
          '          cutout: 60,' +
          '          tension: 0.9,' +
          '          pointRadius: 2,' +
          '          borderWidth: 2,' +
          '          backgroundColor: [''#2152ff'', ''#3A416F'', ''#f53939'', ''#a8b8d8'', ''#5e72e4''],' +
          '          data: [15, 20, 12, 60, 20],' +
          '          fill: false' +
          '        }],' +
          '      },' +
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

   htmlPie.HTML.Text :=
          '<canvas id="rcpie-chart" class="chart-canvas" height="100%" ></canvas>' +
          '<script>' +
          '    var ctxpie = document.getElementById("rcpie-chart").getContext("2d");' +
          '    new Chart(ctxpie, {' +
          '      type: "pie",' +
          '      data: {' +
          '        labels: [''Facebook'', ''Direct'', ''Organic'', ''Referral''],' +
          '        datasets: [{' +
          '          label: "Projects",' +
          '          weight: 9,' +
          '          cutout: 0,' +
          '          tension: 0.9,' +
          '          pointRadius: 2,' +
          '          borderWidth: 2,' +
          '          backgroundColor: [''#17c1e8'', ''#5e72e4'', ''#3A416F'', ''#a8b8d8''],' +
          '          data: [15, 20, 12, 60],' +
          '          fill: false' +
          '        }],' +
          '      },' +
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

   htmlRadar.HTML.Text :=
          '<canvas id="rcradar-chart" class="chart-canvas" height="100%"></canvas>' +
          '<script>' +
          '    var ctxradar = document.getElementById("rcradar-chart").getContext("2d");' +
          '    new Chart(ctxradar, {' +
          '      type: "radar",' +
          '      data: {' +
          '        labels: ["English", "Maths", "Physics", "Chemistry", "Biology", "History"],' +
          '        datasets: [{' +
          '          label: "Student A",' +
          '          backgroundColor: "rgba(58,65,111,0.2)",' +
          '          data: [65, 75, 70, 80, 60, 80],' +
          '          borderDash: [5, 5],' +
          '        }, {' +
          '          label: "Student B",' +
          '          backgroundColor: "rgba(203,12,159,0.2)",' +
          '          data: [54, 65, 60, 70, 70, 75]' +
          '        }]' +
          '      },' +
          '      options: {' +
          '        responsive: true,' +
          '        maintainAspectRatio: false,' +
          '        plugins: {' +
          '          legend: {' +
          '            display: false,' +
          '          }' +
          '        }' +
          '      }' +
          '    });' +
          '</script>';

   htmlPolar.HTML.Text :=
          '<canvas id="rcpolar-chart" class="chart-canvas" height="100%" ></canvas>' +
          '<script>' +
          '    var ctxpolar = document.getElementById("rcpolar-chart").getContext("2d");' +
          '    new Chart(ctxpolar, {' +
          '      type: "polarArea",' +
          '      data: {' +
          '        labels: [' +
          '          ''Red'',' +
          '          ''Green'',' +
          '          ''Yellow'',' +
          '          ''Grey'',' +
          '          ''Blue''' +
          '        ],' +
          '        datasets: [{' +
          '          label: ''My First Dataset'',' +
          '          data: [11, 16, 7, 3, 14],' +
          '          backgroundColor: [''#17c1e8'', ''#5e72e4'', ''#3A416F'', ''#a8b8d8'', ''#82d616''],' +
          '        }]' +
          '      },' +
          '      options: {' +
          '        responsive: true,' +
          '        maintainAspectRatio: false,' +
          '        plugins: {' +
          '          legend: {' +
          '            display: false,' +
          '          }' +
          '        }' +
          '      }' +
          '    });' +
          '</script>'


end;

procedure TfrmGraphCHARTJS.UniFrameBeforeReady(Sender: TObject);
begin
   // dm_rc.rc_ResizeBlocks( Self, false, false );
end;
// RC_CORE
// Doc Link [PT] https://radcore.pro.br/web/help/pt/RenderizandooLayout.html
//          [EN] https://radcore.pro.br/web/help/en/LayoutRender.html
procedure TfrmGraphCHARTJS.UniFrameCreate(Sender: TObject);
begin
   rc_RenderLayout( Self, false, false, true, false );
end;

procedure TfrmGraphCHARTJS.UniFrameReady(Sender: TObject);
begin
   dm_rc.rc_ResizeBlocks( Self, true, true );

   rc_UpdateCharts;

end;
// -------------------------------------------------------------------------
initialization
   RegisterClass( TfrmGraphCHARTJS );

end.


