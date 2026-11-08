unit untFrmHISTORICOCAMPO; //8.0.0.0

// =====================================================================
// untFrmHISTORICOCAMPO — conversão 3.0 -> 8.0 (tela de CONSULTA)
// - Mantém class(TfrmBase): não é CRUD (sem sqlMaster/FDQryCad) — §43i não se aplica.
// - FDMemTable tbbenecampo local; SqlPesquisa(ESCRITA_HISTORICOCAMPO(...)) —
//   ganchos 3.0 vivos na base 8.0 (SqlPesquisa/sqlBuscas: idem 8 forms convertidos).
// - rc_ShowSweetAlert 3 params (8.0); ATENÇÃO corrigido do cp1252.
// - Filtro via Seta_Busca/untFrmPesquisa: botão de MESTRE, padrão antigo (§44.2 não se aplica).
// - Coluna-ícone "detalhes": ReadOnly=True no dfm (§44.1).
// - Modal TELAGENERICA (VarC_Atelagenerica="HISTORICOBENEPONTO") preservado;
//   varB_BENE* e VarC_Atelagenerica existem no MainModule 8.0 (l.727/878).
// =====================================================================

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniEdit,
  UniButtonEdit, uniScrollBox, uniPageControl, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniSweetAlert;

type
  TfrmHISTORICOCAMPO = class(TfrmBase)
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
    UniButtonEditpcampo: TUniButtonEdit;
    paSearchOp1: TUniContainerPanel;
    UniEditsafracampo: TUniEdit;
    UniLabel1: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniEditscultivar: TUniEdit;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniEditproduto: TUniEdit;
    dbgSearchCRUD: TUniDBGrid;
    tbbenecampo: TFDMemTable;
    dsbenecampo: TDataSource;
    tbbenecampoNUMERO: TIntegerField;
    tbbenecampoNOTA: TStringField;
    tbbenecampoSERIE: TStringField;
    tbbenecampoPRODUTO: TIntegerField;
    tbbenecampoLOTEORIGEM: TStringField;
    tbbenecampoQTENOTA: TFloatField;
    tbbenecampoQUANTIDADE: TFloatField;
    tbbenecampoLOTEDESTINO: TStringField;
    tbbenecampoBOLETIMDESTINO: TStringField;
    tbbenecampoANALISEPURA: TFloatField;
    tbbenecampoTETRAZOLIO: TFloatField;
    tbbenecampoPESOEMBALAGEM: TFloatField;
    tbbenecampodetalhes: TStringField;
    tbbenecampoEMISSAO: TDateField;
    tbbenecampoVALORCULTURAL: TFloatField;
    procedure btnSearchClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure UniButtonEditpcampoButtonClick(Sender: TObject);
    procedure tbbenecampodetalhesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHISTORICOCAMPO: TfrmHISTORICOCAMPO;

implementation

{$R *.dfm}

uses MainModule, mkm_func_web, untDM_RC, mkm_procedures, mkm_relatorios,
  untFrmPesquisa, untFrmTELAGENERICA;

procedure TfrmHISTORICOCAMPO.btnSearchClick(Sender: TObject);
begin
  inherited;
  if not ( dsbenecampo.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;

procedure TfrmHISTORICOCAMPO.btnSearchCRUDClick(Sender: TObject);
var
  sql : string;
begin
  inherited;


  if UniButtonEditpcampo.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque a nota antes!' , 'warning' );
      abort
    end;


  SqlPesquisa(ESCRITA_HISTORICOCAMPO(mm.varI_Code_Company,
                                     StrToInt(UniEditproduto.Text),
                                     UniButtonEditpcampo.Text,
                                     UniEditsafracampo.Text
                                     ));

  tbbenecampo.Close;
  tbbenecampo.CopyDataSet(dm_rc.sqlBuscas);
  tbbenecampo.Open;
end;

procedure TfrmHISTORICOCAMPO.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  if Column.FieldName = 'detalhes' then
    begin
      mm.varB_BENEPRODUTO    :=  tbbenecampo.FindField('PRODUTO').AsString;
      mm.varB_BENELOTE       :=  tbbenecampo.FindField('LOTEDESTINO').AsString;
      mm.varB_BENEBOLETIM    :=  tbbenecampo.FindField('BOLETIMDESTINO').AsString;
      mm.varB_BENEPUREZA     :=  tbbenecampo.FindField('ANALISEPURA').AsFloat;
      mm.varB_BENEGERMINACAO :=  tbbenecampo.FindField('TETRAZOLIO').AsFloat;
      mm.varB_BENEVC         :=  tbbenecampo.FindField('VALORCULTURAL').AsFloat;

      mm.VarC_Atelagenerica            := 'HISTORICOBENEPONTO';
      frmTELAGENERICA.ShowModal();

      mm.varB_BENEPRODUTO    :=  '';
      mm.varB_BENELOTE       :=  '';
      mm.varB_BENEBOLETIM    :=  '';
      mm.varB_BENEPUREZA     :=  0;
      mm.varB_BENEGERMINACAO :=  0;
      mm.varB_BENEVC         :=  0;
    end;
end;

procedure TfrmHISTORICOCAMPO.tbbenecampodetalhesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Lote de Saida" class="fa fa-lg fas fa-th-list fa-lg" style="color:blue; cursor:pointer;"></i>';

end;

procedure TfrmHISTORICOCAMPO.UniButtonEditpcampoButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CAMPO');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditpcampo.Text :=  mm.varC_CAMPO;
       UniEditsafracampo.Text   :=  mm.varC_SAFRACAMPO;
       UniEditproduto.Text      :=  IntToStr(mm.varC_PRODUTO);
       UniEditscultivar.Text    :=  mm.varC_CULTIVAR;
     end;
   end);
end;
initialization
  RegisterClass(TfrmHISTORICOCAMPO);
end.
