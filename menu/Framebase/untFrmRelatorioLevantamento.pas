unit untFrmRelatorioLevantamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniBasicGrid, uniDBGrid,
  uniEdit, uniDateTimePicker, uniGUIClasses, UniButtonEdit, uniScrollBox,
  uniPanel, uniPageControl, uniLabel, uniButton, uniBitBtn, uniHTMLFrame,
  uniGUIBaseClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,Math;

type
  TFrmRelatorioLevantamento = class(TfrmBase)
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    paGC: TUniContainerPanel;
    labTitleForm: TUniLabel;
    labExit: TUniLabel;
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    paSearchFilter1: TUniContainerPanel;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    UniContainerPanel3: TUniContainerPanel;
    dbgSearchCRUD: TUniDBGrid;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniDateTimePickerreferente: TUniDateTimePicker;
    UniLabelc1: TUniLabel;
    UniButtonEditcodresponsavel: TUniButtonEdit;
    TB_LEVANTAMENTO: TFDMemTable;
    TB_LEVANTAMENTOUFAMOSTRA: TStringField;
    TB_LEVANTAMENTOSAFRAAMOSTRA: TStringField;
    TB_LEVANTAMENTOESPECIEAMOSTRA: TStringField;
    TB_LEVANTAMENTOSILVESTREESPECIE: TStringField;
    TB_LEVANTAMENTOSILVESTREAMOSTRA: TStringField;
    TB_LEVANTAMENTOSILVESTREMAXIMO: TStringField;
    TB_LEVANTAMENTONOCIVAESPECIE: TStringField;
    TB_LEVANTAMENTONOCIVAAMOSTRA: TStringField;
    TB_LEVANTAMENTONOCIVAMINIMO: TStringField;
    TB_LEVANTAMENTONOCIVAMAXIMO: TStringField;
    TB_LEVANTAMENTOQTE_AMOSTRA: TStringField;
    TB_LEVANTAMENTOESPECIE_CODIGO: TIntegerField;
    TB_LEVANTAMENTOPRAGA_CODIGO: TIntegerField;
    TB_LEVANTAMENTOOCUPADO: TIntegerField;
    TB_LEVANTAMENTOSILVESTREMINIMO: TStringField;
    TB_LEVANTAMENTONOCIVA_TO: TIntegerField;
    dsdemo: TDataSource;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edSearchCRUDDtIniExit(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure UniButtonEditcodresponsavelButtonClick(Sender: TObject);
    procedure labExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BuscaLevantamento();
    procedure ativabusca();

  end;

var
  FrmRelatorioLevantamento: TFrmRelatorioLevantamento;

implementation

uses
  System.DateUtils, mkm_func_web, mkm_procedures, untDM_RC, MainModule,
  mkm_impressao, unReportImpressao, untFrmPesquisa;

{$R *.dfm}
procedure TFrmRelatorioLevantamento.ativabusca;
begin
  if not ( dsdemo.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;

procedure TFrmRelatorioLevantamento.btnOptionsClick(Sender: TObject);
begin
  inherited;
  if TB_LEVANTAMENTO.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  LABORATORIO_Levantamento(edSearchCRUDDtIni.Text,
                                                      edSearchCRUDDtEnd.Text,
                                                      UniDateTimePickerreferente.Text,
                                                      mm.varI_Code_Company,
                                                      StrToInt(UniButtonEditcodresponsavel.Text),TB_LEVANTAMENTO);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' , false );

end;

procedure TFrmRelatorioLevantamento.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TFrmRelatorioLevantamento.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;
  BuscaLevantamento();
end;

procedure TFrmRelatorioLevantamento.BuscaLevantamento;
var
  M_REPRESENTATIVIDADE  : Real;
  M_REGISTRO            : Integer;
  M_SQL                 : string;
  AMOSTRA, M_ESPECIE    : Integer;
  M_VALOR, M_VALOR1, M_VALOR2, M_MINIMO, M_MAXIMO :Integer;
begin
  TB_LEVANTAMENTO.Close;
  TB_LEVANTAMENTO.Open;

  M_SQL := ' select protocolo.estado_procedencia, protocolo.safravalida, protocolo.especie_codigo, count(protocolo.codigo) as amostras from protocolo ' +
           ' where protocolo.dataemissao between      ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
           ' and                                      ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text)) +
           ' and protocolo.empresa  =                 ' + IntToStr(mm.varI_Code_Company)                         +
           ' and protocolo.boletim <>                 ' + QuotedStr('')                               +
           ' group by 1,2,3 order by 1                ';

  if SqlPesquisa(M_SQL) then
    begin
      M_REGISTRO := dm_rc.sqlBuscas.RecordCount;

      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          TB_LEVANTAMENTO.Append;
          TB_LEVANTAMENTO.FindField('UFAMOSTRA').AsString         := dm_rc.sqlBuscas.FindField('ESTADO_PROCEDENCIA').AsString;
          TB_LEVANTAMENTO.FindField('SAFRAAMOSTRA').AsString      := dm_rc.sqlBuscas.FindField('SAFRAVALIDA').AsString;
          TB_LEVANTAMENTO.FindField('ESPECIEAMOSTRA').AsString    := Acha_Item('ESPECIE',dm_rc.sqlBuscas.FindField('ESPECIE_CODIGO').AsString);
          TB_LEVANTAMENTO.FindField('QTE_AMOSTRA').AsString       := dm_rc.sqlBuscas.FindField('AMOSTRAS').AsString;
          TB_LEVANTAMENTO.FindField('ESPECIE_CODIGO').AsString    := dm_rc.sqlBuscas.FindField('ESPECIE_CODIGO').AsString;

          TB_LEVANTAMENTO.FindField('SILVESTREESPECIE').AsString  := '-0-';
          TB_LEVANTAMENTO.FindField('SILVESTREAMOSTRA').AsString  := '-0-';
          TB_LEVANTAMENTO.FindField('SILVESTREMINIMO').AsString   := '-0-';
          TB_LEVANTAMENTO.FindField('SILVESTREMAXIMO').AsString   := '-0-';

          TB_LEVANTAMENTO.FindField('NOCIVAAMOSTRA').AsString     := '-0-';
          TB_LEVANTAMENTO.FindField('NOCIVAESPECIE').AsString     := '-0-';
          TB_LEVANTAMENTO.FindField('NOCIVAMINIMO').AsString      := '-0-';
          TB_LEVANTAMENTO.FindField('NOCIVAMAXIMO').AsString      := '-0-';
          TB_LEVANTAMENTO.Post;

          M_SQL := 'SELECT P.estado_procedencia, P.safravalida, P.especie_codigo, I.produto,' +
                   'sum(A.total_ss) as silvestres, count(p.especie_codigo) as amostras,     ' +
                   'min(i.quantidade) as minimo, max(i.quantidade) as maximo                ' +
                   'FROM PROTOCOLO P, ANALISE A, analise_itens I                            ' +
                   'WHERE A.protocolo = P.codigo AND                                        ' +
                   'I.mestre_id = A.codigo AND                                              ' +
                   'I.TIPO =                                                                ' + QuotedStr('SS') +
                   'and p.dataemissao between                                               ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
                   'and                                                                     ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text)) +
                   'and p.estado_procedencia =                                              ' + QuotedStr(dm_rc.sqlBuscas.FindField('ESTADO_PROCEDENCIA').AsString) +
                   'and p.safravalida        =                                              ' + QuotedStr(dm_rc.sqlBuscas.FindField('SAFRAVALIDA').AsString)        +
                   'and p.especie_codigo     =                                              ' + QuotedStr(dm_rc.sqlBuscas.FindField('ESPECIE_CODIGO').AsString)     +
                   ' and p.empresa           =                                              ' + IntToStr(mm.varI_Code_Company)                         +
                   ' and p.boletim <>                                                       ' + QuotedStr('')                               +
                   'group by 1,2,3,4 order by 1';

          if TabelaAnaliseItens(M_SQL) then
            begin
              dm_rc.FDQryAnaliseitens.First;
              while not dm_rc.FDQryAnaliseitens.Eof do
                begin
                    if  TB_LEVANTAMENTO.Locate('UFAMOSTRA;SAFRAAMOSTRA;ESPECIE_CODIGO', VarArrayOf([dm_rc.FDQryAnaliseitens.FindField('ESTADO_PROCEDENCIA').AsString,
                                                                                                                       dm_rc.FDQryAnaliseitens.FindField('SAFRAVALIDA').AsString,
                                                                                                                       dm_rc.FDQryAnaliseitens.FindField('ESPECIE_CODIGO').AsString]),[]) then
                    begin
                      //*****************************************************************************************************//
                      // ESTOQUE MINIMO E MAXIMO
                      //*****************************************************************************************************//
                      AMOSTRA   := 0;
                      M_ESPECIE := 0;

                      M_SQL := 'SELECT P.estado_procedencia, P.safravalida, P.especie_codigo, I.produto, ' +
                               ' min(i.quantidade) as minimo, max(i.quantidade) as maximo                ' +
                               ' FROM PROTOCOLO P, ANALISE A, analise_itens I                            ' +
                               ' WHERE A.protocolo = P.codigo AND                                        ' +
                               ' I.mestre_id = A.codigo and                                              ' +
                               ' i.tipo      =                                                           ' + QuotedStr('SS') +
                               ' and p.dataemissao between                                               ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
                               ' and                                                                     ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text)) +
                               ' and p.estado_procedencia =                                              ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('ESTADO_PROCEDENCIA').AsString) +
                               ' and p.safravalida        =                                              ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('SAFRAVALIDA').AsString)        +
                               ' and i.produto            =                                              ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('PRODUTO').AsString)            +
                               ' and P.especie_codigo     =                                              ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('ESPECIE_CODIGO').AsString)     +
                               ' and p.empresa            =                                              ' + IntToStr(mm.varI_Code_Company)                         +
                               'and p.boletim is not null                                                ' +
                               ' group by                                                                ' +
                               ' 1,2,3,4                                                                 ' +
                               ' order by 1                                                              ';

                      SqlPesquisaPrimeira(M_SQL);
                      //*****************************************************************************************************//

                      //*****************************************************************************************************//
                      // QTD DE NOVICAS COM A MESMA SAFRA/ESTADO/ESPECIE
                      //*****************************************************************************************************//
                      M_SQL := ' SELECT *                                          '                   +
                               ' FROM PROTOCOLO P, ANALISE A, analise_itens I      '                   +
                               ' WHERE A.protocolo = P.codigo AND                  '                   +
                               ' I.mestre_id = A.codigo and                        '                   +
                               ' i.tipo      =                                     ' + QuotedStr('SS') +
                               ' and p.dataemissao between                         ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
                               ' and                                               ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text)) +
                               ' and p.estado_procedencia =                        ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('ESTADO_PROCEDENCIA').AsString) +
                               ' and p.safravalida        =                        ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('SAFRAVALIDA').AsString)        +
                               ' and i.produto            =                        ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('PRODUTO').AsString)            +
                               ' and P.especie_codigo     =                        ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('ESPECIE_CODIGO').AsString)     +
                               ' and p.empresa            =                        ' + IntToStr(mm.varI_Code_Company)                         +
                               ' and p.boletim is not null                         ' +
                               ' order by 1                                        ';

                      SqlPesquisaSecundaria(M_SQL);

                      AMOSTRA := dm_rc.sqlpesquisasecundaria.RecordCount;
                      //*****************************************************************************************************//

                      if TB_LEVANTAMENTO.FindField('OCUPADO').AsInteger <> 1 then
                        begin
                          TB_LEVANTAMENTO.Edit;
                          TB_LEVANTAMENTO.FindField('SILVESTREESPECIE').AsString := Acha_Item('PRAGAS',dm_rc.FDQryAnaliseitens.FindField('PRODUTO').AsString);
                          TB_LEVANTAMENTO.FindField('SILVESTREAMOSTRA').AsString := IntToStr(AMOSTRA);
                          TB_LEVANTAMENTO.FindField('SILVESTREMINIMO').AsString  := dm_rc.sqlpesquisaprimaria.FindField('MINIMO').AsString;
                          TB_LEVANTAMENTO.FindField('SILVESTREMAXIMO').AsString  := dm_rc.sqlpesquisaprimaria.FindField('MAXIMO').AsString;
                          TB_LEVANTAMENTO.FindField('OCUPADO').AsInteger         := 1;
                          TB_LEVANTAMENTO.Post;
                        end
                      else
                        begin
                          TB_LEVANTAMENTO.append;
                          TB_LEVANTAMENTO.FindField('UFAMOSTRA').AsString        := ' - ';
                          TB_LEVANTAMENTO.FindField('SAFRAAMOSTRA').AsString     := ' - ';
                          TB_LEVANTAMENTO.FindField('ESPECIEAMOSTRA').AsString   := ' - ';
                          TB_LEVANTAMENTO.FindField('QTE_AMOSTRA').AsString      := ' - ';
                          TB_LEVANTAMENTO.FindField('NOCIVAESPECIE').AsString    := ' -0- ';
                          TB_LEVANTAMENTO.FindField('NOCIVAAMOSTRA').AsString    := ' -0- ';
                          TB_LEVANTAMENTO.FindField('NOCIVAMINIMO').AsString     := ' -0- ';
                          TB_LEVANTAMENTO.FindField('NOCIVAMAXIMO').AsString     := ' -0- ';

                          TB_LEVANTAMENTO.FindField('SILVESTREESPECIE').AsString := Acha_Item('PRAGAS',dm_rc.FDQryAnaliseitens.FindField('PRODUTO').AsString);
                          TB_LEVANTAMENTO.FindField('SILVESTREAMOSTRA').AsString := IntToStr(AMOSTRA);
                          TB_LEVANTAMENTO.FindField('PRAGA_CODIGO').AsString     := dm_rc.FDQryAnaliseitens.FindField('PRODUTO').AsString;
                          TB_LEVANTAMENTO.FindField('SILVESTREMINIMO').AsString  := dm_rc.sqlpesquisaprimaria.FindField('MINIMO').AsString;
                          TB_LEVANTAMENTO.FindField('SILVESTREMAXIMO').AsString  := dm_rc.sqlpesquisaprimaria.FindField('MAXIMO').AsString;
                          TB_LEVANTAMENTO.Post;
                        end;
                    end;
                  dm_rc.FDQryAnaliseitens.Next;
                end;
            end;


          M_SQL := 'SELECT P.estado_procedencia, P.safravalida, P.especie_codigo, I.produto,' +
                   'sum(A.total_to) as silvestres, count(p.especie_codigo) as amostras,     ' +
                   'min(a.total_to) as minimo, max(a.total_to) as maximo                    ' +
                   'FROM PROTOCOLO P, ANALISE A, analise_itens I                            ' +
                   'WHERE A.protocolo = P.codigo AND                                        ' +
                   'I.mestre_id = A.codigo AND                                              ' +
                   'I.TIPO =                                                                ' + QuotedStr('NT') +
                   'and p.dataemissao between                                               ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
                   'and                                                                     ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text)) +
                   'and p.estado_procedencia =                                              ' + QuotedStr(dm_rc.sqlBuscas.FindField('ESTADO_PROCEDENCIA').AsString) +
                   'and p.safravalida        =                                              ' + QuotedStr(dm_rc.sqlBuscas.FindField('SAFRAVALIDA').AsString)        +
                   'and p.especie_codigo     =                                              ' + QuotedStr(dm_rc.sqlBuscas.FindField('ESPECIE_CODIGO').AsString)     +
                   ' and p.empresa           =                                              ' + IntToStr(mm.varI_Code_Company)                         +
                   'and p.boletim is not null                                               ' +
                   'group by 1,2,3,4';

          if TabelaAnaliseItens(M_SQL) then
            begin
              dm_rc.FDQryAnaliseitens.First;
              while not dm_rc.FDQryAnaliseitens.Eof do
                begin
                    if TB_LEVANTAMENTO.Locate('UFAMOSTRA;SAFRAAMOSTRA;ESPECIE_CODIGO', VarArrayOf([dm_rc.FDQryAnaliseitens.FindField('ESTADO_PROCEDENCIA').AsString,
                                                                                                                       dm_rc.FDQryAnaliseitens.FindField('SAFRAVALIDA').AsString,
                                                                                                                       dm_rc.FDQryAnaliseitens.FindField('ESPECIE_CODIGO').AsString]),[]) then
                    begin
                      //*****************************************************************************************************//
                      // ESTOQUE MINIMO E MAXIMO
                      //*****************************************************************************************************//
                      AMOSTRA   := 0;
                      M_ESPECIE := 0;

                      M_SQL := ' SELECT p.amostra, P.estado_procedencia, P.safravalida, P.especie_codigo, I.produto, ' +
                               ' sum(i.quantidade) as quantidade                                         ' +
                               ' FROM PROTOCOLO P, ANALISE A, analise_itens I                            ' +
                               ' WHERE A.protocolo = P.codigo AND                                        ' +
                               ' I.mestre_id = A.codigo and                                              ' +
                               ' i.tipo      =                                                           ' + QuotedStr('NT') +
                               ' and p.dataemissao between                                               ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
                               ' and                                                                     ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text)) +
                               ' and p.estado_procedencia =                                              ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('ESTADO_PROCEDENCIA').AsString) +
                               ' and p.safravalida        =                                              ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('SAFRAVALIDA').AsString)        +
                               ' and i.produto            =                                              ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('PRODUTO').AsString)            +
                               ' and P.especie_codigo     =                                              ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('ESPECIE_CODIGO').AsString)     +
                               ' and p.empresa            =                                              ' + IntToStr(mm.varI_Code_Company)                         +
                               ' and p.boletim is not null                                               ' +
                               ' group by 1,2,3,4,5                                                      ' +
                               ' order by sum(i.quantidade)';

                      if SqlPesquisaPrimeira(M_SQL) then;
                        begin
                          M_VALOR  := 0;
                          M_VALOR1 := 0;
                          M_VALOR2 := 0;
                          M_MINIMO := 0;
                          M_MAXIMO := 0;

                          if dm_rc.sqlBuscas.RecordCount = 1 then
                            begin
                              inc(AMOSTRA);
                              M_MINIMO := dm_rc.sqlpesquisaprimaria.FindField('QUANTIDADE').AsInteger;
                              M_MAXIMO := dm_rc.sqlpesquisaprimaria.FindField('QUANTIDADE').AsInteger;
                            end
                          else
                          if dm_rc.sqlpesquisaprimaria.RecordCount > 1 then
                            begin
                              dm_rc.sqlpesquisaprimaria.First;
                              while not dm_rc.sqlpesquisaprimaria.Eof do
                                begin
                                  inc(AMOSTRA);

                                  if M_VALOR1 = 0 then
                                    M_MINIMO := dm_rc.sqlpesquisaprimaria.FindField('QUANTIDADE').AsInteger
                                  else
                                    M_MAXIMO := dm_rc.sqlpesquisaprimaria.FindField('QUANTIDADE').AsInteger;

                                  Inc(M_VALOR1);

                                  dm_rc.sqlpesquisaprimaria.Next;
                                end;
                            end;
                        end;

                      //*****************************************************************************************************//

                      //*****************************************************************************************************//
                      // QTD DE NOVICAS COM A MESMA SAFRA/ESTADO/ESPECIE
                      //*****************************************************************************************************//
                      M_SQL := ' SELECT *                                          '                   +
                               ' FROM PROTOCOLO P, ANALISE A, analise_itens I      '                   +
                               ' WHERE A.protocolo = P.codigo AND                  '                   +
                               ' I.mestre_id = A.codigo and                        '                   +
                               ' i.tipo      =                                     ' + QuotedStr('NT') +
                               ' and p.dataemissao between                         ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
                               ' and                                               ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text)) +
                               ' and p.estado_procedencia =                        ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('ESTADO_PROCEDENCIA').AsString) +
                               ' and p.safravalida        =                        ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('SAFRAVALIDA').AsString)        +
                               ' and i.produto            =                        ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('PRODUTO').AsString)            +
                               ' and P.especie_codigo     =                        ' + QuotedStr(dm_rc.FDQryAnaliseitens.FindField('ESPECIE_CODIGO').AsString)            +
                               ' and p.empresa            =                        ' + IntToStr(mm.varI_Code_Company)                         +
                               ' and p.boletim is not null                         ' +
                               ' order by 1                                        ';

                      SqlPesquisaSecundaria(M_SQL);
                      //*****************************************************************************************************//

                      if TB_LEVANTAMENTO.FindField('NOCIVA_TO').AsInteger <> 1 then
                        begin
                          TB_LEVANTAMENTO.Edit;
                          TB_LEVANTAMENTO.FindField('NOCIVAESPECIE').AsString    := Acha_Item('PRAGAS',dm_rc.FDQryAnaliseitens.FindField('PRODUTO').AsString);
                          TB_LEVANTAMENTO.FindField('NOCIVAAMOSTRA').AsString    := IntToStr(AMOSTRA);
                          TB_LEVANTAMENTO.FindField('NOCIVAMINIMO').AsString     := IntToStr(M_MINIMO);
                          TB_LEVANTAMENTO.FindField('NOCIVAMAXIMO').AsString     := IntToStr(M_MAXIMO);
                          TB_LEVANTAMENTO.FindField('NOCIVA_TO').AsInteger       := 1;
                          TB_LEVANTAMENTO.Post;
                        end
                      else
                        begin
                          TB_LEVANTAMENTO.Append;

                          if TB_LEVANTAMENTO.FindField('UFAMOSTRA').AsString = '' then
                            begin
                              TB_LEVANTAMENTO.FindField('UFAMOSTRA').AsString        := ' - ';
                              TB_LEVANTAMENTO.FindField('SAFRAAMOSTRA').AsString     := ' - ';
                              TB_LEVANTAMENTO.FindField('ESPECIEAMOSTRA').AsString   := ' - ';
                              TB_LEVANTAMENTO.FindField('QTE_AMOSTRA').AsString      := ' - ';
                            end;

                          if TB_LEVANTAMENTO.FindField('NOCIVAESPECIE').AsString = '' then
                            begin
                              TB_LEVANTAMENTO.FindField('SILVESTREESPECIE').AsString := '-0-';
                              TB_LEVANTAMENTO.FindField('SILVESTREAMOSTRA').AsString := '-0-';
                              TB_LEVANTAMENTO.FindField('SILVESTREMINIMO').AsString  := '-0-';
                              TB_LEVANTAMENTO.FindField('SILVESTREMAXIMO').AsString  := '-0-';
                            end;


                          TB_LEVANTAMENTO.FindField('NOCIVAESPECIE').AsString := Acha_Item('PRAGAS',dm_rc.FDQryAnaliseitens.FindField('PRODUTO').AsString);
                          TB_LEVANTAMENTO.FindField('NOCIVAAMOSTRA').AsString := IntToStr(AMOSTRA);
                          TB_LEVANTAMENTO.FindField('PRAGA_CODIGO').AsString  := dm_rc.FDQryAnaliseitens.FindField('PRODUTO').AsString;
                          TB_LEVANTAMENTO.FindField('NOCIVAMINIMO').AsString  := IntToStr(M_MINIMO);
                          TB_LEVANTAMENTO.FindField('NOCIVAMAXIMO').AsString  := IntToStr(M_MAXIMO);
                          TB_LEVANTAMENTO.Post;
                        end;
                    end;
                  dm_rc.FDQryAnaliseitens.Next;
                end;
            end;
          dm_rc.sqlBuscas.Next;
        end;
    end;
end;

procedure TFrmRelatorioLevantamento.edSearchCRUDDtIniExit(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtEnd.Text := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
end;

procedure TFrmRelatorioLevantamento.labExitClick(Sender: TObject);
var
   I, F : integer;

begin

  inherited;

  if mm.oPgGeneral <> nil then
    mm.oPgGeneral.ActivePage.Close;
end;

procedure TFrmRelatorioLevantamento.UniButtonEditcodresponsavelButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('RESPONSAVEL');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditcodresponsavel.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TFrmRelatorioLevantamento.UniFrameCreate(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtIni.Text          := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text          := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
  UniDateTimePickerreferente.Text := DateToStr(StartOfTheMonth(date));

  ativabusca();
  btnSearchCRUD.OnClick(Self);
end;

initialization
  RegisterClass(TFrmRelatorioLevantamento);
end.
