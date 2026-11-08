unit untDashBoardECOMMERCE; // 6.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, uniGUIApplication, 
  uniGUIClasses, uniGUIFrame, uniLabel, uniPanel, uniGUIBaseClasses, uniScrollBox, uniHTMLFrame, uniButton, uniBitBtn, Vcl.Imaging.pngimage, uniImage, uniTimer, uniMemo, uniPageControl, uniEdit,
  uniMultiItem, uniComboBox, uniDateTimePicker;

type
  TfrmDashboardECOMMERCE = class(TUniFrame)
    sboxEcommerce: TUniScrollBox;
    rcBlock20: TUniContainerPanel;
    rcBlock10Label: TUniLabel;
    labDashCustomers: TUniLabel;
    labNewCustomers: TUniLabel;
    UniLabel2: TUniLabel;
    rcBlock150: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    htmlSales: TUniHTMLFrame;
    rcBlock18: TUniContainerPanel;
    rcBlock5Label: TUniLabel;
    labSales: TUniLabel;
    labDashGreen: TUniLabel;
    rcBlock22: TUniContainerPanel;
    rcBlock15Label: TUniLabel;
    labDashPurple: TUniLabel;
    labInService: TUniLabel;
    rcBlock25: TUniContainerPanel;
    rcBlock20Label: TUniLabel;
    labDashRed: TUniLabel;
    labGivUp: TUniLabel;
    rcBlock40: TUniContainerPanel;
    htmlSalesLines: TUniHTMLFrame;
    rcBlock30: TUniContainerPanel;
    htmlOthers: TUniHTMLFrame;
    rcBlock35: TUniContainerPanel;
    UniLabel1: TUniLabel;
    labRcCollapse60: TUniLabel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    imgProd170: TUniImage;
    rcBlock100: TUniContainerPanel;
    labProdPrice190: TUniLabel;
    rcBlock90: TUniContainerPanel;
    labProdName175: TUniLabel;
    rcBlock110: TUniContainerPanel;
    labProdPriceOld190: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    rcBlock37: TUniContainerPanel;
    UniTimer1: TUniTimer;
    rcBlock2: TUniContainerPanel;
    rcBlock4: TUniContainerPanel;
    labFilterDash: TUniLabel;
    rcBlock6: TUniContainerPanel;
    labPeriod: TUniLabel;
    cbxPeriod: TUniComboBox;
    rcBlock8: TUniContainerPanel;
    labDtIni: TUniLabel;
    rcBlock10: TUniContainerPanel;
    labDtFim: TUniLabel;
    rcBlock12: TUniContainerPanel;
    btnUpdate: TUniBitBtn;
    rcBlock27: TUniContainerPanel;
    labIcoNewCustomers170: TUniLabel;
    labDashCustomers170: TUniLabel;
    labNewCustomersTotal: TUniLabel;
    UniLabel6: TUniLabel;
    rcBlock26: TUniContainerPanel;
    labIcoSales160: TUniLabel;
    labSalesTotal: TUniLabel;
    labDashSales160: TUniLabel;
    rcBlock28: TUniContainerPanel;
    labIcoInService180: TUniLabel;
    labDashInService180: TUniLabel;
    labInServiceTotal: TUniLabel;
    rcBlock29: TUniContainerPanel;
    labIcoGiveUp190: TUniLabel;
    labDashGiveUp190: TUniLabel;
    labGiveUpTotal: TUniLabel;
    edDtIni: TUniDateTimePicker;
    edDtEnd: TUniDateTimePicker;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniTimer1Timer(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure cbxPeriodChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure rc_UpdateCharts;

  end;

implementation

{$R *.dfm}

uses mkm_layout, untDM_RC, MainModule, mkm_graphs, uconsts;

procedure TfrmDashboardECOMMERCE.btnUpdateClick(Sender: TObject);
begin
     Randomize;
     labSales.Caption             := IntToStr( Random( 199 ) + 1);
     labNewCustomers.Caption      := IntToStr( Random( 199 ) + 1);
     labInService.Caption         := IntToStr( Random( 59 ) + 1);
     labGivUp.Caption             := IntToStr( Random( 29 ) + 1);

     labSalesTotal.Caption        := '$ ' + FloatToStrF( Random( 63199 ) + 1, ffNumber, 10, 2 );
     labNewCustomersTotal.Caption := '$ ' + FloatToStrF( Random( 63199 ) + 1, ffNumber, 10, 2 );
     labInServiceTotal.Caption    := '$ ' + FloatToStrF( Random( 63199 ) + 1, ffNumber, 10, 2 );
     labGiveUpTotal.Caption       := '$ ' + FloatToStrF( Random( 63199 ) + 1, ffNumber, 10, 2 );
end;

procedure TfrmDashboardECOMMERCE.cbxPeriodChange(Sender: TObject);
begin
  dm_rc.rc_ReportDateInterval( cbxPeriod.Text );

  edDtIni.Text := DateToStr( mm.varD_DtIni );
  edDtEnd.Text := DateToStr( mm.varD_DtEnd );
end;

procedure TfrmDashboardECOMMERCE.rc_UpdateCharts;
begin
    edDtIni.Text := DateToStr( date );
    edDtEnd.Text := DateToStr( date );
    btnUpdateClick( self );
    // basta passar uma query:
    //    Campos( ou Alias ): SERIE, VALUE1, VALUE2
    //    ValuesLabels      : Produtos;Serviços ( exemplo usado )
    //    Cores
    dm_rc.sqlDS.SQL.Text := 'select * from tb_graphs';

    htmlOthers.HTML.Text := rc_GraphBars(
                              dm_rc.sqlDS,
                              'vendas_ps_db',
                              'Produtos;Serviços');

    htmlSales.HTML.Text :=
    '            <div class="card">' +
    '              <div class="card-header border-0">' +
    '                <h3 class="card-title">Produtos em Destaque</h3>' +
//    '                <div class="card-tools">' +
//    '                  <a href="#" class="btn btn-tool btn-sm">' +
//    '                    <i class="fa fa-download"></i>' +
//    '                  </a>' +
//    '                  <a href="#" class="btn btn-tool btn-sm">' +
//    '                    <i class="fa fa-bars"></i>' +
//    '                  </a>' +
//    '                </div>' +
    '              </div>' +
    '              <div class="card-body pr-0">' +
    '                <table class="table table-striped table-valign-middle">' +
    '                  <thead>' +
    '                  <tr>' +
    '                    <th>Produto</th>' +
    '                    <th>Preço</th>' +
    '                    <th>Vendas</th>' +
    '                    <th>Mais</th>' +
    '                  </tr>' +
    '                  </thead>' +
    '                  <tbody>' +
    '                  <tr>' +
    '                    <td>' +
    '                      <img src="files/images/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">' +
    '                      Produto 1' +
    '                    </td>' +
    '                    <td>' + PFmtSettings.CurrencyString + ' 15,00</td>' + 
    '                    <td style="text-align:right;">1.000' +
    '                      <small class="text-success mr-1">' +
    '                        <i class="fa fa-arrow-up"></i>' +
    '                        12%' +
    '                      </small>' +
    '                      ' +
    '                    </td>' +
    '                    <td>' +
    '                      <a href="#" onclick="ajaxRequest( MainForm.htmlFrame , ''_dashboard'', [''item=prod1'']);" class="text-muted">' +
    '                        <i class="fa fa-search"></i>' +
    '                      </a>' +
    '                    </td>' +
    '                  </tr>' +
    '                  <tr>' +
    '                    <td>' +
    '                      <img src="files/images/default-150x150.png" alt="Product 2" class="img-circle img-size-32 mr-2">' +
    '                      Produto 1' +
    '                    </td>' +
    '                    <td>' + PFmtSettings.CurrencyString + ' 19,00</td>' + 
    '                    <td style="text-align:right;">123' +
    '                      <small class="text-warning mr-1">' +
    '                        <i class="fa fa-arrow-down"></i>' +
    '                        0.5%' +
    '                      </small>' +
    '                      ' +
    '                    </td>' +
    '                    <td>' +
    '                      <a href="#" onclick="ajaxRequest( MainForm.htmlFrame , ''_dashboard'', [''item=prod2'']);" class="text-muted">' +
    '                        <i class="fa fa-search"></i>' +
    '                      </a>' +
    '                    </td>' +
    '                  </tr>' +
    '                  <tr>' +
    '                    <td>' +
    '                      <img src="files/images/default-150x150.png" alt="Product 3" class="img-circle img-size-32 mr-2">' +
    '                      Produto 1' +
    '                    </td>' +
    '                    <td>' + PFmtSettings.CurrencyString + ' 35,00</td>' + //v. 
    '                    <td style="text-align:right;">198' +
    '                      <small class="text-danger mr-1">' +
    '                        <i class="fa fa-arrow-down"></i>' +
    '                        3%' +
    '                      </small>' +
    '                      ' +
    '                    </td>' +
    '                    <td>' +
    '                      <a href="#" onclick="ajaxRequest( MainForm.htmlFrame , ''_dashboard'', [''item=prod3'']);" class="text-muted">' +
    '                        <i class="fa fa-search"></i>' +
    '                      </a>' +
    '                    </td>' +
    '                  </tr>' +
    '                  <tr>' +
    '                    <td>' +
    '                      <img src="files/images/default-150x150.png" alt="Product 4" class="img-circle img-size-32 mr-2">' +
    '                      Produto 1' +
    '                      <span class="badge bg-danger">novo</span>' +
    '                    </td>' +
    '                    <td>' + PFmtSettings.CurrencyString + ' 28,00</td>' + //v. 
    '                    <td style="text-align:right;">87' +
    '                      <small class="text-success mr-1">' +
    '                        <i class="fa fa-arrow-up"></i>' +
    '                        63%' +
    '                      </small>' +
    '                      ' +
    '                    </td>' +
    '                    <td>' +
    '                      <a href="#" onclick="ajaxRequest( MainForm.htmlFrame , ''_dashboard'', [''item=prod4'']);" class="text-muted">' +
    '                        <i class="fa fa-search"></i>' +
    '                      </a>' +
    '                    </td>' +
    '                  </tr>' +
    '                  </tbody>' +
    '                </table>' +
    '              </div>' +
    '            </div>' ;//+


    dm_rc.sqlDS.SQL.Text := 'select * from tb_graphs';

    htmlSalesLines.HTML.Text :=
       '<style>'+
       '#chart {' +
       '  max-width: auto;' + ///*760px;*/
       '  margin: 20px auto;' +
       '  opacity: 0.9;' +
       '}' +
       '</style>'+
       '<div id="chart_db"></div>' +
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
       '  var chart = new ApexCharts(document.querySelector("#chart_db"), options);' +
       '  chart.render();' +
       '</script>' ;
end;

procedure TfrmDashboardECOMMERCE.UniFrameCreate(Sender: TObject);
begin
    dm_rc.rc_TranslatePeriodOptions( cbxPeriod );
    // translate messages
    case mm.varLT_Lang of

         ltpt_BR, ltpt_PT : begin
                     labFilterDash.Caption := 'Filtrar por Período';
                     labPeriod.caption     := 'Período';
                     labDtIni.caption      := 'Data Inicial';
                     labDtFim.caption      := 'Data Final';
                     btnUpdate.Caption     := 'Atualizar';
                   end;
         lten_US, lten_GB   : begin
                     labFilterDash.Caption := 'Filter by Period';
                     labPeriod.caption     := 'Period';
                     labDtIni.caption      := 'Start Date';
                     labDtFim.caption      := 'Final Date';
                     btnUpdate.Caption     := 'Update';
                   end;
         ltes_ES   : begin
                     labFilterDash.Caption := 'Filter by Period';
                     labPeriod.caption     := 'Period';
                     labDtIni.caption      := 'Start Date';
                     labDtFim.caption      := 'Final Date';
                     btnUpdate.Caption     := 'Update';
                   end;
         ltfr_FR   : begin
                     labFilterDash.Caption := 'Filter by Period';
                     labPeriod.caption     := 'Period';
                     labDtIni.caption      := 'Start Date';
                     labDtFim.caption      := 'Final Date';
                     btnUpdate.Caption     := 'Update';
                   end;
         ltde_DE   : begin
                     labFilterDash.Caption := 'Filter by Period';
                     labPeriod.caption     := 'Period';
                     labDtIni.caption      := 'Start Date';
                     labDtFim.caption      := 'Final Date';
                     btnUpdate.Caption     := 'Update';
                   end;
         ltit_IT   : begin
                     labFilterDash.Caption := 'Filter by Period';
                     labPeriod.caption     := 'Period';
                     labDtIni.caption      := 'Start Date';
                     labDtFim.caption      := 'Final Date';
                     btnUpdate.Caption     := 'Update';
                   end;
         lttr_TR    : begin
                     labFilterDash.Caption := 'Filter by Period';
                     labPeriod.caption     := 'Period';
                     labDtIni.caption      := 'Start Date';
                     labDtFim.caption      := 'Final Date';
                     btnUpdate.Caption     := 'Update';
                   end;
         ltru_RU    : begin
                     labFilterDash.Caption := 'Filter by Period';
                     labPeriod.caption     := 'Period';
                     labDtIni.caption      := 'Start Date';
                     labDtFim.caption      := 'Final Date';
                     btnUpdate.Caption     := 'Update';
                   end;
         ltzn_CH : begin
                     labFilterDash.Caption := 'Filter by Period';
                     labPeriod.caption     := 'Period';
                     labDtIni.caption      := 'Start Date';
                     labDtFim.caption      := 'Final Date';
                     btnUpdate.Caption     := 'Update';
                   end;
         ltin_ID : begin
                     labFilterDash.Caption := 'Filter by Period';
                     labPeriod.caption     := 'Period';
                     labDtIni.caption      := 'Start Date';
                     labDtFim.caption      := 'Final Date';
                     btnUpdate.Caption     := 'Update';
                   end;
         ltth_TH : begin
                     labFilterDash.Caption := 'Filter by Period';
                     labPeriod.caption     := 'Period';
                     labDtIni.caption      := 'Start Date';
                     labDtFim.caption      := 'Final Date';
                     btnUpdate.Caption     := 'Update';
                   end;
         lthi_IN : begin
                     labFilterDash.Caption := 'Filter by Period';
                     labPeriod.caption     := 'Period';
                     labDtIni.caption      := 'Start Date';
                     labDtFim.caption      := 'Final Date';
                     btnUpdate.Caption     := 'Update';
                   end;
         ltar_SA    : begin
                     labFilterDash.Caption := 'Filter by Period';
                     labPeriod.caption     := 'Period';
                     labDtIni.caption      := 'Start Date';
                     labDtFim.caption      := 'Final Date';
                     btnUpdate.Caption     := 'Update';
                   end;
    end;

    rc_RenderLayout( Self, false, false );
end;

procedure TfrmDashboardECOMMERCE.UniFrameReady(Sender: TObject);
begin
     dm_rc.rc_ApplyEditMasks( Self );
     dm_rc.rc_ResizeBlocks( Self, true, true );
     rc_UpdateCharts;
     //UniTimer1.Enabled := true;
end;

procedure TfrmDashboardECOMMERCE.UniTimer1Timer(Sender: TObject);
begin
     UniTimer1.Enabled := false;
     rc_UpdateCharts;
end;

Initialization
   RegisterClass( TfrmDashboardECOMMERCE );

end.
