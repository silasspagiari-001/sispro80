unit untFrmLIXEIRA; //8.0.0.0

// =====================================================================
// untFrmLIXEIRA — conversão 3.0 -> 8.0 (MODAL §45 — sem redesign §45.1:
// modal de CONSULTA com grid; layout 3.0 preservado verbatim)
// - RECEITA MODAL 3 PATAS (§45): (1) menu: rc_BuildMenuItem( '', 0,
//   'Reciclagem de Registro frm:lixeira modal:' );  (2) pas:
//   class(TfrmGenericModalForm) + untGenericModalForm no uses +
//   UniFormResize re-forçando 514x895 + poScreenCenter + OnReady vazio;
//   (3) dfm: Hint [[modal:]] + biSystemMenu (BorderStyle bsSingle já havia).
//   Par de medidas: design 895x514 <-> runtime 895x514 (identidade — o 3.0
//   já era modal bsSingle 895x514; +42 do molde só vale p/ remoção de aba).
// - Fluxo: UniFormShow já dispara btnSearch (abre filtros) e btnSearchCRUD
//   (select * from lixeira da empresa -> FDQryFiltro -> tbbusca.CopyDataSet;
//   ordem: data/hora/dados; filtro status E/R/Todos — verbatim).
// - Recuperação: coluna marcador (thumbtack) + status 'E' -> popup
//   UniPopupMenudetalhes -> V1Click -> transfere (JsonToDataset do blob
//   DADOS -> append na tabela original por UpdateTableName) + update
//   status='R' + re-query + SweetAlert. OBS verbatim 3.0: o SweetAlert de
//   sucesso dispara fora do if transfere=True (comportamento preservado).
// - §44.1: ReadOnly=True nas colunas HTML (marcador, STATUS com badge,
//   opcoes); §41b badges badge-* -> text-bg-*; rc_ShowSweetAlert 4->3 (x2).
// - UniFormCreate captura cFormModal := mm.varC_Form_Modal (verbatim);
//   Destroy limpa varC_Form_Modal (verbatim). rc_RenderLayout substitui o
//   rc_ResizeBlocks do OnReady 3.0 (receita §45).
// =====================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn,
  uniMultiItem, uniComboBox, uniEdit, uniLabel, uniScrollBox, uniPanel,
  uniPageControl, uniGUIBaseClasses, Vcl.Menus, uniMainMenu,
  untGenericModalForm;   //8.0: ancestral que governa o tamanho do modal

type
  TfrmLIXEIRA = class(TfrmGenericModalForm)
    UniContainerPanel1: TUniContainerPanel;
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    tblixeira: TFDMemTable;
    dslixeira: TDataSource;
    tblixeiraDADOS: TBlobField;
    tblixeiraTABELA: TStringField;
    tblixeiraDATA: TDateField;
    tblixeiraHORA: TTimeField;
    tblixeiraUSUARIO: TStringField;
    tblixeiraSTATUS: TStringField;
    paBaseButtons: TUniContainerPanel;
    tblixeiraCODIGO: TIntegerField;
    tblixeiraopcoes: TStringField;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    paSearchFilter1: TUniContainerPanel;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    edSearchCRUDconteudo: TUniEdit;
    paSearchOp1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    cbxSearchCRUDordem: TUniComboBox;
    UniLabel1: TUniLabel;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniComboBoxCRUDordem: TUniComboBox;
    UniLabel2: TUniLabel;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    dbgSearchCRUD: TUniDBGrid;
    tblixeiramarcador: TStringField;
    UniPopupMenudetalhes: TUniPopupMenu;
    V1: TUniMenuItem;
    dsfdqrycad: TDataSource;
    memtable: TFDMemTable;
    btnSearch: TUniBitBtn;
    btnCloseForm: TUniBitBtn;
    procedure tblixeiraSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure btnCloseFormClick(Sender: TObject);
    procedure tblixeiramarcadorGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tblixeiraopcoesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure V1Click(Sender: TObject);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;
    cFormModal         : TUniForm;

    function transfere() :Boolean;
  end;

function frmLIXEIRA: TfrmLIXEIRA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_layout, mkm_func_web,
  mkm_procedures, mkm_funcoes;

function frmLIXEIRA: TfrmLIXEIRA;
begin
  Result := TfrmLIXEIRA(mm.GetFormInstance(TfrmLIXEIRA));
end;

procedure TfrmLIXEIRA.btnCloseFormClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmLIXEIRA.btnSearchClick(Sender: TObject);
begin
  if not ( dsfiltro.State in [dsEdit, dsInsert ] ) then
  begin
     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;

procedure TfrmLIXEIRA.btnSearchCRUDClick(Sender: TObject);
var
  ordem,
  filtro, select,
  strand          : string;
  M_STR           : TStringList;
begin
  M_STR  := Explode('TABELA;USUARIO;DADOS',';');
  strand := ' and dados like ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%');

  case cbxSearchCRUDordem.ItemIndex of
    0: ordem := ' order by data desc , hora  desc '  ;
    1: ordem := ' order by hora desc , data  desc '  ;
    2: ordem := ' order by dados desc             '  ;
  end;

  case UniComboBoxCRUDordem.ItemIndex of
    0: filtro := ' and status = ' + QuotedStr('E')  ;
    1: filtro := ' and status = ' + QuotedStr('R')  ;
    2: filtro := '';
  end;

  select := 'select * from lixeira where empresa = ' + IntToStr(mm.varI_Code_Company);

  FDQryFiltro.Close;
  FDQryFiltro.SQL.Clear;
  FDQryFiltro.SQL.Text := select+filtro + varIIF(cbxSearchCRUDordem.ItemIndex = 2,strand,'') + ordem;
  FDQryFiltro.Open();

  FDQryFiltro.First;

  tblixeira.Close;
  tblixeira.CopyDataSet(FDQryFiltro);
  tblixeira.Open;

  tblixeira.First;
end;

procedure TfrmLIXEIRA.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
begin
  if tblixeiraSTATUS.AsString = 'E' then
   begin
     if Column.FieldName = 'marcador' then
       begin
         UniPopupMenudetalhes.Popup(posicao_x-20,posicao_y, dbgSearchCRUD);
       end;
   end;
end;

procedure TfrmLIXEIRA.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmLIXEIRA.tblixeiramarcadorGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text :=
    '<i title="detalhes" class="fa fa-lg fas fa-thumbtack fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmLIXEIRA.tblixeiraopcoesGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
    Text :=
    '<i title="dados" class="fas fa-file-alt" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmLIXEIRA.tblixeiraSTATUSGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    begin
      if tblixeiraSTATUS.AsString = 'R' then
        Text := '<span class="badge text-bg-success">Recuperado</span>'
      else
      if tblixeiraSTATUS.AsString = 'E' then
        Text := '<span class="badge text-bg-danger">Deletado</span>';
    end;
end;
function TfrmLIXEIRA.transfere: Boolean;
var
  Field      : TField;
  fdqrycad   : TFDQuery;
begin
  try
    fdqrycad                               := TFDQuery.Create(nil);
    fdqrycad.Connection                    := mm.SQLConn;
    fdqrycad.UpdateOptions.UpdateTableName := tblixeiraTABELA.AsString;

    fdqrycad.Close;
    fdqrycad.SQL.Clear;
    fdqrycad.SQL.Text := 'select * from ' + tblixeiraTABELA.AsString + ' where codigo = 0';
    fdqrycad.Open;

    memtable.Close;
    JsonToDataset(memtable,tblixeiraDADOS.AsString);

    memtable.First;
    while not memtable.Eof do
    begin
      fdqrycad.Append;

      for Field in memtable.Fields do
        fdqrycad.Fields[Field.Index].Value := Field.Value;

      fdqrycad.Post;

      memtable.Next;
    end;
    Result := True;
  except
    Result := False;
  end;
    fdqrycad.Free;
end;

procedure TfrmLIXEIRA.UniFormCreate(Sender: TObject);
begin
  cFormModal := mm.varC_Form_Modal;
  rc_RenderLayout( Self, false, false, false );
end;

procedure TfrmLIXEIRA.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmLIXEIRA.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmLIXEIRA.UniFormReady(Sender: TObject);
begin
  // 3.0 centralizava por Top e chamava rc_ResizeBlocks aqui — no 8.0 o
  // poScreenCenter da receita §45 + rc_RenderLayout (Create/BeforeShow)
  // suprem. Reservado p/ ajuste fino de geometria.
end;

procedure TfrmLIXEIRA.UniFormShow(Sender: TObject);
begin
  cbxSearchCRUDordem.ItemIndex   := 0;
  UniComboBoxCRUDordem.ItemIndex := 0;
  btnSearch.OnClick(Self);
  btnSearchCRUD.OnClick(Self);
end;

procedure TfrmLIXEIRA.V1Click(Sender: TObject);
begin

  try
    if transfere = True then
      begin
        executasql(' update lixeira set lixeira.status = ' + QuotedStr('R') +
                   ' where lixeira.codigo              = ' + IntToStr(tblixeiraCODIGO.AsInteger));
      end;

    btnSearchCRUD.OnClick(Self);
    dm_rc.rc_ShowSweetAlert( 'Ok', 'REGISTRO RECUPERADO COM SUCESSO' , 'success' );
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui excluir, chame o SUPORTE!' , 'error' );
  end;
end;

initialization
  RegisterClass(TfrmLIXEIRA);
end.
