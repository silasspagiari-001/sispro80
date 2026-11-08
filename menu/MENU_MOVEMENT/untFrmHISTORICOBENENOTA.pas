unit untFrmHISTORICOBENENOTA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniBasicGrid, uniDBGrid, uniEdit, UniButtonEdit, uniLabel, uniScrollBox,
  uniPageControl, uniButton, uniBitBtn, uniScreenMask;

type
  TfrmHISTORICOBENENOTA = class(TfrmBase)
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
    UniButtonEditpnota: TUniButtonEdit;
    paSearchOp1: TUniContainerPanel;
    UniEditserie: TUniEdit;
    UniLabel1: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel4: TUniLabel;
    dbgSearchCRUD: TUniDBGrid;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniEditsequencia: TUniEdit;
    UniEditproduto: TUniEdit;
    tbbenenota: TFDMemTable;
    dsbenenota: TDataSource;
    tbbenenotaNUMERO: TStringField;
    tbbenenotaSERIE: TStringField;
    tbbenenotaSEQUENCIA: TIntegerField;
    tbbenenotaDESCRICAO: TStringField;
    tbbenenotaQUANTIDADE: TFloatField;
    tbbenenotaPUREZA: TFloatField;
    tbbenenotaGERMINACAO: TFloatField;
    tbbenenotaVALORCULTURAL: TFloatField;
    tbbenenotaDESCARTE: TFloatField;
    tbbenenotaLOTEDESTINO: TStringField;
    tbbenenotaBOLETIMDESTINO: TStringField;
    tbbenenotaEMISSAO: TDateField;
    tbbenenotadetalhes: TStringField;
    labTitleForm: TUniLabel;
    labExit: TUniLabel;
    tbbenenotaPRODUTO: TIntegerField;
    UniScreenMask: TUniScreenMask;
    procedure btnSearchClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure tbbenenotadetalhesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniButtonEditpnotaButtonClick(Sender: TObject);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure carreganota(const cccodigo:integer);
  end;

var
  frmHISTORICOBENENOTA: TfrmHISTORICOBENENOTA;

implementation

{$R *.dfm}

uses MainModule, mkm_funcoes, mkm_func_web, mkm_procedures, mkm_relatorios,
  untDM_RC, untFrmPesquisaItensestoque, untFrmTELAGENERICA;

procedure TfrmHISTORICOBENENOTA.btnSearchClick(Sender: TObject);
begin
  inherited;
  if not ( dsbenenota.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;
procedure TfrmHISTORICOBENENOTA.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;

  if UniButtonEditpnota.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque a nota antes!' , 'warning' , false );
      abort
    end;


  SqlPesquisa(ESCRITA_HISTORICOBENENOTA(mm.varI_Code_Company,StrToInt(UniEditproduto.Text),StrToInt(UniEditsequencia.Text),UniButtonEditpnota.Text,UniEditserie.Text));

  tbbenenota.Close;
  tbbenenota.CopyDataSet(dm_rc.sqlBuscas);
  tbbenenota.Open;

end;

procedure TfrmHISTORICOBENENOTA.carreganota(const cccodigo: integer);
begin
  if cccodigo > 0 then
    begin
      if SqlPesquisa('select * from mvitens where codigo = ' + IntToStr(cccodigo)) then
        begin
          UniButtonEditpnota.Text := dm_rc.sqlBuscas.FindField('NUMERO').AsString;
          UniEditserie.Text       := dm_rc.sqlBuscas.FindField('SERIE').AsString;
          UniEditsequencia.Text   := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsString;
          UniEditproduto.Text     := dm_rc.sqlBuscas.FindField('PRODUTO').AsString;
        end;
    end;
end;

procedure TfrmHISTORICOBENENOTA.dbgSearchCRUDCellClick(
  Column: TUniDBGridColumn);
begin
  inherited;
  if Column.FieldName = 'detalhes' then
    begin
      UniScreenMask.Enabled  :=  True;
      mm.varB_BENEPRODUTO    :=  tbbenenota.FindField('PRODUTO').AsString;
      mm.varB_BENELOTE       :=  tbbenenota.FindField('LOTEDESTINO').AsString;
      mm.varB_BENEBOLETIM    :=  tbbenenota.FindField('BOLETIMDESTINO').AsString;
      mm.varB_BENEPUREZA     :=  tbbenenota.FindField('PUREZA').AsFloat;
      mm.varB_BENEGERMINACAO :=  tbbenenota.FindField('GERMINACAO').AsFloat;
      mm.varB_BENEVC         :=  tbbenenota.FindField('VALORCULTURAL').AsFloat;

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

procedure TfrmHISTORICOBENENOTA.tbbenenotadetalhesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Lote de Saida" class="fa fa-lg fas fa-th-list fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmHISTORICOBENENOTA.UniButtonEditpnotaButtonClick(Sender: TObject);
begin
  inherited;
  frmpesquisaitensestoque.showmodal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       carreganota(StrToInt(MM.varC_codigo_busca));
     end;
   end);
end;

initialization
  RegisterClass(TfrmHISTORICOBENENOTA);
end.
