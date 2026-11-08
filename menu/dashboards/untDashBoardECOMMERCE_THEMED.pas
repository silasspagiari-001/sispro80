unit untDashBoardECOMMERCE_THEMED; // 7.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, uniGUIApplication, 
  uniGUIClasses, uniGUIFrame, uniLabel, uniPanel, uniGUIBaseClasses, uniScrollBox, uniHTMLFrame, uniButton, uniBitBtn, Vcl.Imaging.pngimage, uniImage, uniTimer, uniMemo, uniPageControl, uniEdit,
  uniMultiItem, uniComboBox, uniDateTimePicker;

type
  TfrmDashboardECOMMERCE_THEMED = class(TUniFrame)
    sboxEcommerce: TUniScrollBox;
    rcBlock150: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    UniTimer1: TUniTimer;
    UniHiddenPanel1: TUniHiddenPanel;
    btnClickOnRecall: TUniButton;
    rcBlock20: TUniContainerPanel;
    labIcoNewCustomers: TUniLabel;
    labDashCustomers: TUniLabel;
    labNewCustomersTotal: TUniLabel;
    labDashNew: TUniLabel;
    rcBlock15: TUniContainerPanel;
    labIcoSales: TUniLabel;
    labSalesTotal: TUniLabel;
    labDashSales: TUniLabel;
    rcBlock25: TUniContainerPanel;
    labIcoInService: TUniLabel;
    labDashInService: TUniLabel;
    labInServiceTotal: TUniLabel;
    rcBlock30: TUniContainerPanel;
    labIcoGiveUp: TUniLabel;
    labDashGiveUp: TUniLabel;
    labGiveUpTotal: TUniLabel;
    labSales: TUniLabel;
    labCustomers: TUniLabel;
    labInService: TUniLabel;
    labGiveUP: TUniLabel;
    rcBlock50: TUniContainerPanel;
    htmlSales: TUniHTMLFrame;
    htmlNewCustomers: TUniHTMLFrame;
    paCustomerChart: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    labGraphTitle: TUniLabel;
    labRcCollapse60: TUniLabel;
    rcBlock80: TUniContainerPanel;
    htmlOthers: TUniHTMLFrame;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniTimer1Timer(Sender: TObject);
    procedure btnClickOnRecallClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure rc_UpdateCharts;

  end;

implementation

{$R *.dfm}

uses mkm_layout, untDM_RC, MainModule, mkm_graphs, uconsts;

procedure TfrmDashboardECOMMERCE_THEMED.btnClickOnRecallClick(Sender: TObject);
begin
     showmessagen( 'Click On Recall' );
end;

procedure TfrmDashboardECOMMERCE_THEMED.rc_UpdateCharts;
begin

    htmlSales.HTML.Text :=
      '<canvas id="line-chart-gradient" class="chart-canvas" height="100%"></canvas>' +
      '<script>' +
      '        var ctx2 = document.getElementById("line-chart-gradient").getContext("2d");' +

      '        var gradientStroke1 = ctx2.createLinearGradient(0, 230, 0, 50);' +

      '        gradientStroke1.addColorStop(1, ''rgba(94, 114, 228, 0.2)'');' +
      '        gradientStroke1.addColorStop(0.2, ''rgba(72,72,176,0.0)'');' +
      '        gradientStroke1.addColorStop(0, ''rgba(94, 114, 228,0)''); ' + ////purple colors

      '        var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);' +

      '        gradientStroke2.addColorStop(1, ''rgba(20,23,39,0.2)'');' +
      '        gradientStroke2.addColorStop(0.2, ''rgba(72,72,176,0.0)'');' +
      '        gradientStroke2.addColorStop(0, ''rgba(20,23,39,0)''); ' + ////purple colors

      '        new Chart(ctx2, {' +
      '          type: "line",' +
      '          data: {' +
      '            labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],' +
      '            datasets: [{' +
      '                label: "Mobile apps",' +
      '                tension: 0.4,' + // 0.0 smooth off( default 0.4 )
      '                borderWidth: 0,' +
      '                pointRadius: 0,' +
      '                borderColor: "#5e72e4",' +
      '                borderWidth: 3,' +
      '                backgroundColor: gradientStroke1,' +
      '                fill: true,' +
      '                data: [50, 40, 300, 220, 500, 250, 400, 230, 500],' +
      '                maxBarThickness: 6' +

      '              },' +
      '              {' +
      '                label: "Websites",' +
      '                tension: 0.4,' + // 0.0 smooth off( default 0.4 )
      '                borderWidth: 0,' +
      '                pointRadius: 0,' +
      '                borderColor: "#3A416F",' +
      '                borderWidth: 3,' +
      '                backgroundColor: gradientStroke2,' +
      '                fill: true,' +
      '                data: [30, 90, 40, 140, 290, 290, 340, 230, 400],' +
      '                maxBarThickness: 6' +
      '              },' +
      '            ],' +
      '          },' +
      '          options: {' +
      '            responsive: true,' +
      '            maintainAspectRatio: false,' +
      '            plugins: {' +
      '              legend: {' +
      '                display: true,' +
      '              }' +
      '            },' +
      '            interaction: {' +
      '              intersect: false,' +
      '              mode: ''index'',' +
      '            },' +
      '            scales: {' +
      '              y: {' +
      '                grid: {' +
      '                  drawBorder: false,' +
      '                  display: true,' +
      '                  drawOnChartArea: true,' +
      '                  drawTicks: false,' +
      '                  borderDash: [5, 5]' +
      '                },' +
      '                ticks: {' +
      '                  display: true,' +
      '                  padding: 10,' +
      '                  color: ''#b2b9bf'',' +
      '                  font: {' +
      '                    size: 11,' +
      '                    family: "Open Sans",' +
      '                    style: ''normal'',' +
      '                    lineHeight: 2' +
      '                  },' +
      '                }' +
      '              },' +
      '              x: {' +
      '                grid: {' +
      '                  drawBorder: false,' +
      '                  display: false,' +
      '                  drawOnChartArea: false,' +
      '                  drawTicks: false,' +
      '                  borderDash: [5, 5]' +
      '                },' +
      '                ticks: {' +
      '                  display: true,' +
      '                  color: ''#b2b9bf'',' +
      '                  padding: 10,' +
      '                  font: {' +
      '                    size: 11,' +
      '                    family: "Open Sans",' +
      '                    style: ''normal'',' +
      '                    lineHeight: 2' +
      '                  },' +
      '                }' +
      '              },' +
      '            },' +
      '          },' +
      '        });' +
      '</script>' ;


    htmlNewCustomers.HTML.Text :=
      '<canvas id="newcustomer-chart" class="chart-canvas" height="100%"></canvas>' +
      '<script>' +
      '        var newcustomer = document.getElementById("newcustomer-chart").getContext("2d");' +

      '        var gradientStroke1 = newcustomer.createLinearGradient(0, 230, 0, 50);' +

      '        gradientStroke1.addColorStop(1, ''rgba(94, 114, 228, 0.2)'');' +
      '        gradientStroke1.addColorStop(0.2, ''rgba(72,72,176,0.0)'');' +
      '        gradientStroke1.addColorStop(0, ''rgba(94, 114, 228,0)''); ' + ////purple colors

      '        var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);' +

      '        gradientStroke2.addColorStop(1, ''rgba(20,23,39,0.2)'');' +
      '        gradientStroke2.addColorStop(0.2, ''rgba(72,72,176,0.0)'');' +
      '        gradientStroke2.addColorStop(0, ''rgba(20,23,39,0)''); ' + ////purple colors

      '        new Chart(newcustomer, {' +
      '          type: "line",' +
      '          data: {' +
      '            labels: ["Mon", "Tue", "Wed", "Thu", "Fri"],' +
      '            datasets: [{' +
      '                label: "Mobile apps",' +
      '                tension: 0.0,' + // smooth off( default 0.4 )
      '                borderWidth: 0,' +
      '                pointRadius: 0,' +
      '                borderColor: "#5e72e4",' +
      '                borderWidth: 3,' +
      '                backgroundColor: gradientStroke1,' +
      '                fill: true,' +
      '                data: [13, 9, 22, 18, 26],' + //[PT] os valores vão ter co-relação com o height do gráfico já que esse modelo é bem pequeno.
                                                     //[EN] the values will be correlated with the height of the graph since this model is very small.
      '                maxBarThickness: 6' +

      '              },' +
//      '              {' +
//      '                label: "Websites",' +
//      '                tension: 0.0,' + // smooth off( default 0.4 )
//      '                borderWidth: 0,' +
//      '                pointRadius: 0,' +
//      '                borderColor: "#3A416F",' +
//      '                borderWidth: 3,' +
//      '                backgroundColor: gradientStroke2,' +
//      '                fill: true,' +
//      '                data: [30, 90, 40, 140, 290, 290, 340, 230, 400],' +
//      '                maxBarThickness: 6' +
//      '              },' +
      '            ],' +
      '          },' +
      '          options: {' +
      '            responsive: true,' +
      '            maintainAspectRatio: false,' +
      '            plugins: {' +
      '              legend: {' +
      '                display: false,' +
      '              }' +
      '            },' +
      '            interaction: {' +
      '              intersect: false,' +
      '              mode: ''index'',' +
      '            },' +
      '            scales: {' +
      '              y: {' +
      '                grid: {' +
      '                  drawBorder: false,' +
      '                  display: false,' +
      '                  drawOnChartArea: true,' +
      '                  drawTicks: false,' +
      '                  borderDash: [5, 5]' +
      '                },' +
      '                ticks: {' +
      '                  display: false,' +
      '                  padding: 10,' +
      '                  color: ''#b2b9bf'',' +
      '                  font: {' +
      '                    size: 11,' +
      '                    family: "Open Sans",' +
      '                    style: ''normal'',' +
      '                    lineHeight: 2' +
      '                  },' +
      '                }' +
      '              },' +
      '              x: {' +
      '                grid: {' +
      '                  drawBorder: false,' +
      '                  display: false,' +
      '                  drawOnChartArea: false,' +
      '                  drawTicks: false,' +
      '                  borderDash: [5, 5]' +
      '                },' +
      '                ticks: {' +
      '                  display: false,' +
      '                  color: ''#b2b9bf'',' +
      '                  padding: 10,' +
      '                  font: {' +
      '                    size: 11,' +
      '                    family: "Open Sans",' +
      '                    style: ''normal'',' +
      '                    lineHeight: 2' +
      '                  },' +
      '                }' +
      '              },' +
      '            },' +
      '          },' +
      '        });' +
      '</script>' ;

      htmlOthers.HTML.Text :=
      '<canvas id="myBarChartSales" width="100%"></canvas>' +
      '<script>' +
      'const ctxSales = document.getElementById(''myBarChartSales'').getContext(''2d'');' +
      'const myChart = new Chart(ctxSales, {' +
      '    type: ''bar'',' +
      '    data: {' +
      '        labels: [''Jan'', ''Feb'', ''Mar'', ''Apr'', ''May'', ''Jun''],' +
      '        datasets: [{' +
//      '            label: ''# of Procedures'',' +
      '            data: [25, 39, 43, 35, 39, 63],' +
      '            backgroundColor: [' +
      '                ''rgba(255, 99, 132, 0.2)'',' +
      '                ''rgba(54, 162, 235, 0.2)'',' +
      '                ''rgba(255, 206, 86, 0.2)'',' +
      '                ''rgba(75, 192, 192, 0.2)'',' +
      '                ''rgba(153, 102, 255, 0.2)'',' +
      '                ''rgba(255, 159, 64, 0.2)''' +
      '            ],' +
      '            borderColor: [' +
      '                ''rgba(255, 99, 132, 1)'',' +
      '                ''rgba(54, 162, 235, 1)'',' +
      '                ''rgba(255, 206, 86, 1)'',' +
      '                ''rgba(75, 192, 192, 1)'',' +
      '                ''rgba(153, 102, 255, 1)'',' +
      '                ''rgba(255, 159, 64, 1)''' +
      '            ],' +
      '            borderWidth: 1' +
      '        }]' +
      '    },' +
      '    options: {' +
      '        responsive: true, ' +
      '        maintainAspectRatio: false, ' +
      '        aspectRatio: 1, ' +
      '        plugins: {' +
      '           legend: {' +
      '              display: false,' +
      '           }' +
      '        },' +
      '        scales: {' +
      '            y: {' +
      '                beginAtZero: true' +
      '            }' +
      '        }' +
      '    }' +
      '});' +
      '</script>' ;

end;
// 6.0.0.0
procedure TfrmDashboardECOMMERCE_THEMED.UniFrameCreate(Sender: TObject);
begin
     labSales.Caption     := rc_SpanText( 'text-danger' , ' -4.25%', 'text-muted', ' Last Month' );
     labCustomers.Caption := rc_SpanText( 'text-success', ' +6.60%', 'text-muted', ' Last Month' );
     labInService.Caption := rc_SpanText( 'text-warning', ' +0.00%', 'text-muted', ' Last Month' );
     labGiveUP.Caption    := rc_SpanText( 'text-info'   , ' +0.00%', 'text-muted', ' Last Month' );

     rc_RenderLayout( Self, false, false );
end;

procedure TfrmDashboardECOMMERCE_THEMED.UniFrameReady(Sender: TObject);
begin
     dm_rc.rc_ApplyEditMasks( Self );
     dm_rc.rc_ResizeBlocks( Self, true, true );
     rc_UpdateCharts;
     //UniTimer1.Enabled := true;
end;

procedure TfrmDashboardECOMMERCE_THEMED.UniTimer1Timer(Sender: TObject);
begin
     //UniTimer1.Enabled := false;
     //rc_UpdateCharts;
end;

Initialization
   RegisterClass( TfrmDashboardECOMMERCE_THEMED );

end.
