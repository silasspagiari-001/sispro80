unit untFrmCURVAABCPESSOA; //8.0.0.0

// =====================================================================
// untFrmCURVAABCPESSOA — conversão 3.0 -> 8.0 (receita CONSULTA: TfrmBase
// MANTIDO; §43i só para CRUD). Form de consulta CURVA ABC por PESSOA:
// grid em FDMemTable (CopyDataSet), sem SQL master/sqlSearchMaster.
// Ganchos 3.0 preservados: ESCRITA_CURVA_ABC_PESSOAS (mkm_relatorios),
// RELATORIO_CURVAABCPESSOA (mkm_impressao; recebe memabc) + unfImpressao.
// AJUSTES 8.0: marcador //8.0.0.0; rc_ShowSweetAlert 4 -> 3 params.
// =====================================================================

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniEdit,
  UniButtonEdit, uniLabel, uniScrollBox, uniPageControl, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniMultiItem, uniComboBox,
  uniSweetAlert;

type
  TfrmCURVAABCPESSOA = class(TfrmBase)
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    paGC: TUniContainerPanel;
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
    dbgSearchCRUD: TUniDBGrid;
    memabc: TFDMemTable;
    dsmemabc: TDataSource;
    memabcPESSOA: TIntegerField;
    memabcNOME: TStringField;
    memabcPERC: TFloatField;
    memabcCLASSE: TStringField;
    memabcdetalhes: TStringField;
    memabcVALOR_PESSOA: TFloatField;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    cbxtipo: TUniComboBox;
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCURVAABCPESSOA: TfrmCURVAABCPESSOA;

implementation

{$R *.dfm}

uses MainModule, mkm_relatorios, mkm_func_web, mkm_impressao, unReportImpressao,
  untDM_RC;

procedure TfrmCURVAABCPESSOA.btnOptionsClick(Sender: TObject);
begin
  inherited;

  if memabc.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  RELATORIO_CURVAABCPESSOA(mm.varI_Code_Company,
                                                      cbxtipo.ItemIndex,
                                                      UniButtonEditanobase.Text,
                                                      memabc);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' );
end;

procedure TfrmCURVAABCPESSOA.btnSearchClick(Sender: TObject);
begin
  inherited;
  if not ( dsmemabc.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;

procedure TfrmCURVAABCPESSOA.btnSearchCRUDClick(Sender: TObject);
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
      sql.Text   := ESCRITA_CURVA_ABC_PESSOAS(mm.varI_Code_Company,cbxtipo.ItemIndex,UniButtonEditanobase.Text);
      Prepare;
      Open();
    end;

  memabc.Close;
  memabc.CopyDataSet(QueryPesquisa);
  memabc.Open;

//  QueryPesquisa.Free;
end;

procedure TfrmCURVAABCPESSOA.UniFrameCreate(Sender: TObject);
begin
  inherited;
  UniButtonEditanobase.Text := FormatDateTime('yyyy',Date);
end;
initialization
  RegisterClass(TfrmCURVAABCPESSOA);
end.
