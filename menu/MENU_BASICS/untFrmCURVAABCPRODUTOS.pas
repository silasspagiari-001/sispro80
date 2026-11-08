unit untFrmCURVAABCPRODUTOS; //8.0.0.0

// =====================================================================
// untFrmCURVAABCPRODUTOS — conversão 3.0 -> 8.0 (receita CONSULTA: TfrmBase
// MANTIDO; §43i só para CRUD). Espelho do CURVAABCPESSOA, agregado por
// PRODUTO (memtable CODIGO/DESCRICAO/VALOR_PRODUTO/PERC/CLASSE/detalhes).
// Ganchos 3.0 preservados: ESCRITA_CURVA_ABC_PRODUTOS (mkm_relatorios),
// RELATORIO_CURVAABCPRODUTOS (mkm_impressao; recebe memabc) + unfImpressao.
// AJUSTES 8.0: marcador //8.0.0.0; rc_ShowSweetAlert 4 -> 3 params.
// =====================================================================

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniLabel, uniButton, uniBitBtn,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniEdit, UniButtonEdit,
  uniScrollBox, uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniSweetAlert;

type
  TFrmCURVAABCPRODUTOS = class(TfrmBase)
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    paGC: TUniContainerPanel;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
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
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditanobase: TUniButtonEdit;
    cbxtipo: TUniComboBox;
    dbgSearchCRUD: TUniDBGrid;
    memabc: TFDMemTable;
    memabcPERC: TFloatField;
    memabcCLASSE: TStringField;
    memabcdetalhes: TStringField;
    dsmemabc: TDataSource;
    memabcCODIGO: TIntegerField;
    memabcDESCRICAO: TStringField;
    memabcVALOR_PRODUTO: TFloatField;
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCURVAABCPRODUTOS: TFrmCURVAABCPRODUTOS;

implementation

{$R *.dfm}

uses MainModule, mkm_relatorios, mkm_impressao, unReportImpressao, untDM_RC;

procedure TFrmCURVAABCPRODUTOS.btnOptionsClick(Sender: TObject);
begin
  inherited;
  if memabc.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  RELATORIO_CURVAABCPRODUTOS(mm.varI_Code_Company,
                                                        cbxtipo.ItemIndex,
                                                        UniButtonEditanobase.Text,
                                                        memabc);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' );
end;

procedure TFrmCURVAABCPRODUTOS.btnSearchCRUDClick(Sender: TObject);
var
  QueryPesquisa : TfdQuery;
begin
  inherited;
  QueryPesquisa            := TFDQuery.Create(nil);
  QueryPesquisa.Connection := mm.SQLConn;

  with QueryPesquisa do
    begin
      Close;
      Unprepare;
      SQL.Clear;
      sql.Text   := ESCRITA_CURVA_ABC_PRODUTOS(mm.varI_Code_Company,cbxtipo.ItemIndex,UniButtonEditanobase.Text);
      Prepare;
      Open();
    end;

  memabc.Close;
  memabc.CopyDataSet(QueryPesquisa);
  memabc.Open;

//  QueryPesquisa.Free;

end;
procedure TFrmCURVAABCPRODUTOS.UniFrameCreate(Sender: TObject);
begin
  inherited;
  UniButtonEditanobase.Text := FormatDateTime('yyyy',Date);
end;

initialization
  RegisterClass(TFrmCURVAABCPRODUTOS);
end.
