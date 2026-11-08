unit untCadCAMPO; //8.0.0.0
(*
[PT] Conversão RadCORE 3.0 -> 8.0
     - TfrmcadCAMPO = class(TfrmCRUDPROPRIO) -> TfrmCadCAMPO = class(TfrmCRUDproprio)
       (⚠️ se o cadastro de menus referenciar por NOME, atualizar frmcadCAMPO -> frmCadCAMPO)
     - MESTRE-DETALHE: CAMPO (talhoes) + CAMPOITENS no tbdetalhes herdado (grid
       UniDBGridbeneficiamento, edicao inline: btnNew/btnEdit ligam dgEditing como na 3.0).
     - Carga/persistencia dos itens: GANCHOS DA BASE (carregacampoitens no EDIT e
       gravacampoitens no SAVE — confirmados na base 8.0 do usuario em 8.0.0.3; a copia
       v8 do repositorio NAO os tem, nao usar como referencia p/ isso). O form NAO
       reimplementa (gravaria em dobro). Deps base-side: dm_rc.fdqrycampoitens +
       mkm_procedures.TabelaCampoitens.
     - COOPERANTE: UniButtonDbEditcodigopessoas (Seta_Busca+UniFfrmPesquisa) ->
       edLkpPESSOAS declarativo (regra 38, hint display=NOME destino=COOPERANTE) +
       OnExit gravando COOPERANTE+NOME via rc_GetLookUpField (padrao denormalizado
       LOTEINTERNO/ESPECIE; substitui UniButtonDbEditcodigopessoasExit que consultava
       PESSOAS na mao).
     - Grid detalhes: colunas busca/exclui (icones FA via OnGetText) preservadas c/
       ReadOnly=True no dfm (regra 44.1); CellClick: exclui -> rc_ShowYesNo SINCRONA
       (8.0 retorna boolean) + Delete; busca -> PesquisarCadastro('PRODUTOS', callback)
       — NOVO PADRAO DE PESQUISA do untFrmNOTAELETRONICA 8.0 (regra 44.2) ->
       carregacultivar (produtos+saldos, varI_Code_Company) + StartEditor (TNotaGridAccess)
       na coluna seguinte.
     - rc_ShowSweetAlert 4 -> 3 params (carregacultivar).
     - FDQryCad -> sqlMaster; dscrud -> dsMaster; dsdetalhes herdado segue no grid.
     - Grid search: 4 colunas (CODIGO/COOPERANTE/NOME/DESCRICAOSAFRA) = 4 persistent
       fields FDQryFiltro* no sqlSearchMaster (regra 41c; tamanhos presumidos — tipos
       Integer/String confirmam-se no 1o open, regra 43h).
     - UniFrameCreate: template COMPLETO do sqlMaster + hint model-crud:2 (regra 43i).
[EN] RadCORE 3.0 -> 8.0 conversion
*)


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIApplication, uniGUIClasses, uniGUIFrame, untFrmCRUDproprio, Data.DB,
  uniBasicGrid, uniDBGrid, uniPanel, uniPageControl, uniGUIBaseClasses,
  uniScrollBox, uniDBEdit, uniMultiItem, uniComboBox, uniEdit, uniLabel,
  uniButton, uniBitBtn, uniCheckBox, uniDBCheckBox,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniDateTimePicker, uniDBDateTimePicker,
  untFrmBaseCRUD, Vcl.Menus, uniMainMenu, uniSweetAlert, uniHTMLFrame;

type
  TfrmCadCAMPO = class(TfrmCRUDproprio)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock515: TUniContainerPanel;
    rcBlock2: TUniContainerPanel;
    rcBlock3: TUniContainerPanel;
    labRcCollapseGeneral: TUniLabel;
    labTitleCardGeral: TUniLabel;
    rcBlock10: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    rcBlock20: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    rcBlock30: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock40: TUniContainerPanel;
    UniLabel14: TUniLabel;
    edLkpPESSOAS: TUniDBEdit;
    rcBlock50: TUniContainerPanel;
    UniLabel49: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel6: TUniLabel;
    rcBlock70: TUniContainerPanel;
    UniDBGridbeneficiamento: TUniDBGrid;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroCOOPERANTE: TIntegerField;
    FDQryFiltroNOME: TStringField;
    FDQryFiltroDESCRICAOSAFRA: TStringField;
    tbdetalhesNUMERO: TIntegerField;
    tbdetalhesPRODUTO: TIntegerField;
    tbdetalhesCULTIVAR: TStringField;
    tbdetalhesCAMPO: TStringField;
    tbdetalhesDATA: TDateField;
    tbdetalhesLATITUDE: TStringField;
    tbdetalhesLONGITUDE: TStringField;
    tbdetalhesAREA: TFloatField;
    tbdetalhesPRODUCAO: TFloatField;
    tbdetalhesSAFRACAMPO: TStringField;
    tbdetalhesbusca: TStringField;
    tbdetalhesexclui: TStringField;
    tbdetalhesCOOPERANTE: TIntegerField;
    procedure UniFrameCreate(Sender: TObject);
    procedure edLkpPESSOASExit(Sender: TObject);
    procedure tbdetalhesbuscaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tbdetalhesexcluiGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniDBGridbeneficiamentoCellClick(Column: TUniDBGridColumn);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure UniDBGridbeneficiamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FPesquisaProdutoAberta: Boolean; //8.0.0.0 regra 44.2: anti-reentrada da pesquisa no grid
    panEditoresGrid: TUniHiddenPanel; //8.0.0.0 regra 44.5: container dos editores do grid
    edGridDATA: TUniDateTimePicker;   //8.0.0.0 regra 44.5: calendario da coluna DATA
  public
    { Public declarations }
  procedure carregacultivar(const ccodigo:integer);
  procedure PesquisarProdutoGrid; //8.0.0.0 regra 44.2 (padrao untFrmNOTAELETRONICA 8.0)
  end;

implementation

{$R *.dfm}

uses
  untDM_RC, mkm_procedures, MainModule,
  untPesquisaGenerica; //8.0.0.0 regra 44.2: PesquisarCadastro (unit da BASE, enviada pelo usuario)

type
  //8.0.0.0 regra 44.2: cracker class p/ StartEditor protected (mesmo recurso do
  //untFrmNOTAELETRONICA 8.0 - TNotaGridAccess)
  TNotaGridAccess = class(TUniDBGrid);

//8.0.0.0 padrao model-crud:2 (regra 43i): template COMPLETO do sqlMaster
//(override inerte) + hint do grid
procedure TfrmCadCAMPO.UniFrameCreate(Sender: TObject);
var
  I: Integer;
begin
  sqlMaster.SQL.Text := ' SELECT [[fields]]   ' +
                        ' FROM [[table]] tab ' +
                        ' [[pk-show]] ' +
                        ' WHERE tab.[[pk]] = :table_pk ' +  //[PT] Apenas cadastro MESTRE é necessário o WHERE
                        ' FROM  [[table]] tab ' ;

  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:2|'+
                        'grid-paginator:center|' +
                        ']]';

  inherited;


  //8.0.0.0 regra 44.5: editor-calendario na coluna DATA do grid de detalhes
  //(evita digitar qualquer coisa; padrao uniGUI: grid.HiddenPanel + Column.Editor;
  // criado AQUI, antes do render = equivale a ligacao de design-time)
  panEditoresGrid := TUniHiddenPanel.Create(Self);
  panEditoresGrid.Name := 'panEditoresGrid';
  panEditoresGrid.Parent := Self;
  UniDBGridbeneficiamento.HiddenPanel := panEditoresGrid;

  edGridDATA := TUniDateTimePicker.Create(Self);
  edGridDATA.Name := 'edGridDATA';
  edGridDATA.Parent := panEditoresGrid;
  edGridDATA.DateFormat := 'dd/MM/yyyy';
  edGridDATA.UseStrict := True; //nao deixa o dia "rolar" pro mes seguinte se invalido

  for I := 0 to UniDBGridbeneficiamento.Columns.Count - 1 do
    if SameText(UniDBGridbeneficiamento.Columns[I].FieldName, 'DATA') then
    begin
      UniDBGridbeneficiamento.Columns[I].Editor := edGridDATA;
      Break;
    end;

  //8.0.0.0 regras 44.6/44.7 (ENTER avanca + mascara DATA): ClientEvents no DFM
  //(ClientEvents.ExtEvents.Strings do UniDBGridbeneficiamento), forma do dfm
  //canonico da NOTAELETRONICA. A inclusao via codigo (UniFrameCreate) NAO
  //registrou no client (o valor chegava cru no editor) — manter no DFM.

end;

procedure TfrmCadCAMPO.btnEditRegClick(Sender: TObject);
begin
  inherited;
  UniDBGridbeneficiamento.Options          := UniDBGridbeneficiamento.Options - [dgRowSelect];
  UniDBGridbeneficiamento.Options          := UniDBGridbeneficiamento.Options + [dgEditing];
  UniDBGridbeneficiamento.ClicksToEdit     := 1;
  UniDBGridbeneficiamento.TabKeyBehavior   := tkNextColumn;
end;

procedure TfrmCadCAMPO.btnNewRegClick(Sender: TObject);
begin
  inherited;
  UniDBGridbeneficiamento.Options          := UniDBGridbeneficiamento.Options - [dgRowSelect];
  UniDBGridbeneficiamento.Options          := UniDBGridbeneficiamento.Options + [dgEditing];
  UniDBGridbeneficiamento.ClicksToEdit     := 1;
  UniDBGridbeneficiamento.TabKeyBehavior   := tkNextColumn;
end;

procedure TfrmCadCAMPO.carregacultivar(const ccodigo: integer);
var
  sql:string;
begin
  sql := ' select *                                         ' +
         ' from produtos P                                  ' +
         ' inner join saldos on (p.codigo = saldos.produto) ' +
         ' where P.codigo                                =  ' + IntToStr(ccodigo) +
         ' and saldos.empresa                            =  ' + IntToStr(mm.varI_Code_Company);

  if not SqlPesquisa(sql) then
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não encontrei esse Produto' , 'warning' )
  else
    begin
      tbdetalhes.Edit;
      tbdetalhes.FindField('PRODUTO').AsInteger        := ccodigo;
      tbdetalhes.FindField('CULTIVAR').AsString        := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;
    end;

end;

//8.0.0.0 regra 44.2: pesquisa de produto na coluna-acao do grid de detalhes
//(substitui Seta_Busca+UniFfrmPesquisa; padrao untFrmNOTAELETRONICA 8.0)
procedure TfrmCadCAMPO.PesquisarProdutoGrid;
var
  RegistroItem, LinhaGrid: Integer;
begin
  if FPesquisaProdutoAberta or
     not (sqlMaster.State in [dsInsert, dsEdit]) or
     not tbdetalhes.Active or tbdetalhes.IsEmpty then Exit;

  RegistroItem := tbdetalhes.RecNo;
  LinhaGrid := UniDBGridbeneficiamento.CurrRow;
  FPesquisaProdutoAberta := True;
  try
    PesquisarCadastro('PRODUTOS',
      procedure(const Codigo: string; Selecionou: Boolean)
      var I: Integer;
      begin
        FPesquisaProdutoAberta := False;
        if not Selecionou then Exit;
        if not (sqlMaster.State in [dsInsert, dsEdit]) or
           not tbdetalhes.Active or tbdetalhes.IsEmpty then Exit;
        if tbdetalhes.RecNo <> RegistroItem then
        begin
          dm_rc.rc_ShowSweetAlert('ATENCAO',
            'O item mudou durante a pesquisa. Selecione o produto novamente.', 'warning');
          Exit;
        end;

        carregacultivar(StrToInt(Codigo));
        UniDBGridbeneficiamento.SetFocus;
        for I := 0 to UniDBGridbeneficiamento.Columns.Count - 1 do
          if SameText(UniDBGridbeneficiamento.Columns[I].FieldName, 'CAMPO') then
          begin
            UniDBGridbeneficiamento.CurrRow := LinhaGrid;
            UniDBGridbeneficiamento.CurrCol := I;
            TNotaGridAccess(UniDBGridbeneficiamento).StartEditor(LinhaGrid, I);
            Break;
          end;
      end);
  except
    FPesquisaProdutoAberta := False;
    raise;
  end;
end;

procedure TfrmCadCAMPO.tbdetalhesbuscaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Produtos" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmCadCAMPO.tbdetalhesexcluiGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';
end;

//8.0.0.0 lookup declarativo (regra 38): chave -> COOPERANTE, denormalizado -> NOME
procedure TfrmCadCAMPO.edLkpPESSOASExit(Sender: TObject);
begin
  inherited;
  if ( sqlMaster.State in [dsEdit, dsInsert] ) then
    begin
      if ( edLkpPESSOAS.Text <> '' ) and ( edLkpPESSOAS.Text <> '0' ) then
        begin
          sqlMaster.FieldByName('COOPERANTE').AsInteger := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
          sqlMaster.FieldByName('NOME').AsString        := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'NOME' );
        end;
    end;
end;

procedure TfrmCadCAMPO.UniDBGridbeneficiamentoCellClick(
  Column: TUniDBGridColumn);
begin
  inherited;
  if sqlMaster.State in [dsInsert,dsEdit] then
    begin
      if Column.FieldName = 'exclui' then
        begin
          //8.0.0.0 rc_ShowYesNo sincrona (retorna boolean)
          if dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' ) then
            begin
              tbdetalhes.Delete;
            end
        end;

      if Column.FieldName = 'busca' then
        PesquisarProdutoGrid; //8.0.0.0 regra 44.2
    end;
end;

procedure TfrmCadCAMPO.UniDBGridbeneficiamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
  begin
    if (UniDBGridbeneficiamento.Columns.Count > 0) and
       (UniDBGridbeneficiamento.CurrCol >= 0) and
       (SameText(UniDBGridbeneficiamento.Columns[UniDBGridbeneficiamento.CurrCol].FieldName, 'produto')) then
    begin
      Key := 0; // Zera a tecla para evitar atalhos do navegador/uniGUI
      PesquisarProdutoGrid; // 8.0.0.0 regra 44.2
    end;
  end;
end;

initialization
  RegisterClass(TfrmCadCAMPO);
end.
