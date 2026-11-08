unit untGraphChartJS; //8.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniPanel, uniHTMLFrame, uniGUIBaseClasses, uniScrollBox, uniURLFrame, uniButton, uniBitBtn, uniLabel;

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
    rcBlock10: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniBitBtn1: TUniBitBtn;
    procedure UniFrameBeforeReady(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure rc_UpdateCharts;
  end;

implementation

{$R *.dfm}

uses untDM_RC, mkm_layout, MainModule, mkm_printfuncs;

procedure TfrmGraphCHARTJS.rc_UpdateCharts;
begin
//
//   htmlLines.HTML.Text :=
//        '  <style>' +
//        '    body {' +
//        '      margin: 0;' +
//        '      font-family: ''Inter'', sans-serif;' +
//        '      background-color: #0f172a;' +
//        '      color: #f8fafc;' +
//        '      font-size: 16px;' +
//        '    }' +
//        '    .dashboard {' +
//        '      padding: 2rem;' +
//        '      display: grid;' +
//        '      grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));' +
//        '      gap: 1.5rem;' +
//        '    }' +
//        '    .card {' +
//        '      background-color: #1e293b;' +
//        '      border-radius: 16px;' +
//        '      padding: 1.5rem;' +
//        '      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);' +
//        '      display: flex;' +
//        '      flex-direction: column;' +
//        '      justify-content: flex-start;' +
//        '      height: auto;' +
//        '    }' +
//        '    .card.centered {' +
//        '      align-items: center;' +
//        '    }' +
//        '    .card h3 {' +
//        '      margin-top: 0;' +
//        '      margin-bottom: 1rem;' +
//        '      font-size: 1.25rem;' +
//        '    }' +
//        '    .card img {' +
//        '      width: 100%;' +
//        '      border-radius: 12px;' +
//        '      margin-top: 1rem;' +
//        '    }' +
//        '    canvas {' +
//        '      width: 100%;' +
//        '      max-width: 100%;' +
//        '      height: auto;' +
//        '      aspect-ratio: 16 / 9;' +
//        '    }' +
//        '    .small-chart {' +
//        '      width: 50% !important;' +
//        '      height: auto !important;' +
//        '      aspect-ratio: 1 / 1;' +
//        '    }' +
//        '  </style>' +
//
//
//        '  <div class="dashboard">' +
//        '    <div class="card">' +
//        '      <h3>Monthly Sales</h3>' +
//        '      <canvas id="lineChart"></canvas>' +
//        '    </div>' +
//
//        '    <div class="card">' +
//        '      <h3>Revenue Comparison</h3>' +
//        '      <canvas id="barChart"></canvas>' +
//        '    </div>' +
//
//        '    <div class="card centered">' +
//        '      <h3>Product Share</h3>' +
//        '      <canvas id="pieChart" class="small-chart"></canvas>' +
//        '    </div>' +
//        '  </div>' +
//
//        '  <script>' +
//        '    const lineCtx = document.getElementById(''lineChart'').getContext(''2d'');' +
//        '    new Chart(lineCtx, {' +
//        '      type: ''line'',' +
//        '      data: {' +
//        '        labels: [''Jan'', ''Feb'', ''Mar'', ''Apr'', ''May'', ''Jun''],' +
//        '        datasets: [{' +
//        '          label: ''Sales'',' +
//        '          data: [120, 90, 130, 100, 140, 110],' +
//        '          borderColor: ''#3b82f6'',' +
//        '          backgroundColor: ''rgba(59, 130, 246, 0.2)'',' +
//        '          fill: true,' +
//        '          tension: 0.4' +
//        '        }]' +
//        '      },' +
//        '      options: { responsive: true }' +
//        '    });' +
//
//        '    const barCtx = document.getElementById(''barChart'').getContext(''2d'');' +
//        '    new Chart(barCtx, {' +
//        '      type: ''bar'',' +
//        '      data: {' +
//        '        labels: [''Q1'', ''Q2'', ''Q3'', ''Q4''],' +
//        '        datasets: [' +
//        '          {' +
//        '            label: ''2024'',' +
//        '            data: [5000, 7000, 6000, 8000],' +
//        '            backgroundColor: ''#6366f1''' +
//        '          },' +
//        '          {' +
//        '            label: ''2025'',' +
//        '            data: [6000, 8000, 7500, 9000],' +
//        '            backgroundColor: ''#e11d48''' +
//        '          }' +
//        '        ]' +
//        '      },' +
//        '      options: { responsive: true }' +
//        '    });' +
//
//        '    const pieCtx = document.getElementById(''pieChart'').getContext(''2d'');' +
//        '    new Chart(pieCtx, {' +
//        '      type: ''pie'',' +
//        '      data: {' +
//        '        labels: [''Product A'', ''Product B'', ''Product C''],' +
//        '        datasets: [{' +
//        '          label: ''Share'',' +
//        '          data: [40, 25, 35],' +
//        '          backgroundColor: [''#10b981'', ''#f59e0b'', ''#ef4444'']' +
//        '        }]' +
//        '      },' +
//        '      options: { responsive: true }' +
//        '    });' +
//        '  </script>' ;
//
//exit;
   htmlLines.HTML.Text :=
       '<canvas id="rcline-chart" class="chart-canvas" height="100%"></canvas>' +
       '<script>' +
       '    var ctxline = document.getElementById("rcline-chart").getContext("2d");' +

       '    var ctxline_gradientStroke1 = ctxline.createLinearGradient(0, 230, 0, 50);' +
       '    ctxline_gradientStroke1.addColorStop(1, ''rgba(94, 114, 228, 0.2)'');' +
       '    ctxline_gradientStroke1.addColorStop(0.2, ''rgba(72,72,176,0.0)'');' +
       '    ctxline_gradientStroke1.addColorStop(0, ''rgba(94, 114, 228,0)''); ' + ////purple colors
       '    var ctxline_gradientStroke2 = ctxline.createLinearGradient(0, 230, 0, 50);' +
       '    ctxline_gradientStroke2.addColorStop(1, ''rgba(20,23,39,0.2)'');' +
       '    ctxline_gradientStroke2.addColorStop(0.2, ''rgba(72,72,176,0.0)'');' +
       '    ctxline_gradientStroke2.addColorStop(0, ''rgba(20,23,39,0)''); ' + ////purple colors

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
       '            backgroundColor: ctxline_gradientStroke1,' +
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
       '            backgroundColor: ctxline_gradientStroke2,' +
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
       '            backgroundColor: ctxline_gradientStroke2,' +
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
        '    var ctxlineg_gradientStroke1 = ctxlineg.createLinearGradient(0, 230, 0, 50);' +
        '    ctxlineg_gradientStroke1.addColorStop(1, ''rgba(94, 114, 228, 0.2)'');' +
        '    ctxlineg_gradientStroke1.addColorStop(0.2, ''rgba(72,72,176,0.0)'');' +
        '    ctxlineg_gradientStroke1.addColorStop(0, ''rgba(94, 114, 228,0)''); ' + ////purple colors
        '    var ctxlineg_gradientStroke2 = ctxlineg.createLinearGradient(0, 230, 0, 50);' +
        '    ctxlineg_gradientStroke2.addColorStop(1, ''rgba(20,23,39,0.2)'');' +
        '    ctxlineg_gradientStroke2.addColorStop(0.2, ''rgba(72,72,176,0.0)'');' +
        '    ctxlineg_gradientStroke2.addColorStop(0, ''rgba(20,23,39,0)''); ' + ////purple colors
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
        '            backgroundColor: ctxlineg_gradientStroke1,' +
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
        '            backgroundColor: ctxlineg_gradientStroke2,' +
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

          '    var ctxmixed_gradientStroke1 = ctxline.createLinearGradient(0, 230, 0, 50);' +
          '    ctxmixed_gradientStroke1.addColorStop(1, ''rgba(94, 114, 228, 0.2)'');' +
          '    ctxmixed_gradientStroke1.addColorStop(0.2, ''rgba(72,72,176,0.0)'');' +
          '    ctxmixed_gradientStroke1.addColorStop(0, ''rgba(94, 114, 228,0)''); ' + ////purple colors
          '    var ctxmixed_gradientStroke2 = ctxline.createLinearGradient(0, 230, 0, 50);' +
          '    ctxmixed_gradientStroke2.addColorStop(1, ''rgba(20,23,39,0.2)'');' +
          '    ctxmixed_gradientStroke2.addColorStop(0.2, ''rgba(72,72,176,0.0)'');' +
          '    ctxmixed_gradientStroke2.addColorStop(0, ''rgba(20,23,39,0)''); ' + ////purple colors

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
          '            backgroundColor: ctxmixed_gradientStroke1,' +
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


procedure TfrmGraphCHARTJS.UniBitBtn1Click(Sender: TObject);
begin
     rc_PrintContainer( 'Graphic in a Container', rcBlock40 );
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


