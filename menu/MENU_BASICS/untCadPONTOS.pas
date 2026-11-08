unit untCadPONTOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit,
  uniDBComboBox, uniMemo, uniDBMemo, uniScreenMask, untFrmBaseCRUD, Vcl.Menus,
  uniMainMenu, uniSweetAlert, uniCheckBox,uniGUITypes;


type
  TfrmcadPONTOS = class(TfrmCRUDproprio)

    rcBlock2: TUniContainerPanel;
    rcBlock3: TUniContainerPanel;
    labRcCollapseGeneral: TUniLabel;
    UniLabel1: TUniLabel;

    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;

    rcBlock20: TUniContainerPanel;
    UniLabel15: TUniLabel;
    edLkpPRODUTOS: TUniDBEdit;

    rcBlock40: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;

    rcBlock50: TUniContainerPanel;
    UniLabel4: TUniLabel;
    edLkpOPERACOES: TUniDBEdit;

    rcBlock60: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;

    rcBlock70: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBComboBox2: TUniDBComboBox;

    rcBlock80: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniDBEdit3: TUniDBEdit;

    rcBlock90: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;

    rcBlock5: TUniContainerPanel;
    rcBlock6: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniLabel11: TUniLabel;

    rcBlock100: TUniContainerPanel;
    UniLabel10: TUniLabel;
    edLkpSEMENTES: TUniDBEdit;

    rcBlock110: TUniContainerPanel;
    UniLabel111: TUniLabel;
    UniDBEdit2: TUniDBEdit;

    rcBlock120: TUniContainerPanel;
    UniLabel12: TUniLabel;
    UniDBEdit4: TUniDBEdit;

    rcBlock130: TUniContainerPanel;
    UniLabel13: TUniLabel;
    UniDBComboBoxcategoria: TUniDBComboBox;

    rcBlock140: TUniContainerPanel;
    UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit;
    UniLabel14: TUniLabel;

    rcBlock150: TUniContainerPanel;
    UniLabel17: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;

    rcBlock160: TUniContainerPanel;
    UniLabel18: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;

    rcBlock170: TUniContainerPanel;
    UniLabel19: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;

    rcBlock180: TUniContainerPanel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniLabel20: TUniLabel;

    rcBlock260: TUniContainerPanel;
    UniLabel28: TUniLabel;
    UniDBMemo1: TUniDBMemo;
    FDQryFiltroKEY: TStringField;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroDATA: TDateField;
    FDQryFiltroCANCELADA: TStringField;
    FDQryFiltroEMPRESA: TIntegerField;
    FDQryFiltroDOCUMENTO: TIntegerField;
    FDQryFiltroNUMERO: TIntegerField;
    FDQryFiltroSERIE: TStringField;
    FDQryFiltroSEQUENCIA: TIntegerField;
    FDQryFiltroOPERACAO: TIntegerField;
    FDQryFiltroMATERIAPRIMA: TStringField;
    FDQryFiltroCOMPOSICAO: TStringField;
    FDQryFiltroTIPO: TStringField;
    FDQryFiltroPRODUTO: TIntegerField;
    FDQryFiltroDESCRICAO: TStringField;
    FDQryFiltroPESSOA: TIntegerField;
    FDQryFiltroQUANTIDADE: TFMTBCDField;
    FDQryFiltroDESCARTE: TFMTBCDField;
    FDQryFiltroPUREZA: TFMTBCDField;
    FDQryFiltroGERMINACAO: TFMTBCDField;
    FDQryFiltroPONTOS: TFMTBCDField;
    FDQryFiltroVALORCULTURAL: TFMTBCDField;
    FDQryFiltroFICHA: TIntegerField;
    FDQryFiltroOBSERVACOES: TStringField;
    FDQryFiltroMAQUINA: TStringField;
    FDQryFiltroSAFRA: TIntegerField;
    FDQryFiltroSEQLOTE: TIntegerField;
    FDQryFiltroLOTESEMENTE: TStringField;
    FDQryFiltroBOLETIM: TStringField;
    FDQryFiltroTERMO: TStringField;
    FDQryFiltroCATEGORIA: TStringField;
    FDQryFiltroCAMPO: TStringField;
    FDQryFiltroCOOPERANTE: TIntegerField;
    FDQryFiltroSAFRACAMPO: TStringField;
    FDQryFiltroUF: TStringField;
    FDQryFiltroLOTEENTRADA: TStringField;
    FDQryFiltroPROPORCAO: TFMTBCDField;
    FDQryFiltroPESOSACO: TFMTBCDField;
    FDQryFiltroSAFRAVALIDA: TStringField;
    FDQryFiltroVALOR_PONTO: TFMTBCDField;
    FDQryFiltroBATIDA: TStringField;
    FDQryFiltroPENEIRA: TStringField;
    FDQryFiltroQTEPESO: TFMTBCDField;
    FDQryFiltroPUREZAENTRADA: TFMTBCDField;
    FDQryFiltroVCENTRADA: TFMTBCDField;
    FDQryFiltroGERMINACAOENTRADA: TFMTBCDField;
    UniDBEditLOTESEMENTE: TUniDBEdit;
    UniDBEditDESCRICAO: TUniDBEdit;

    procedure UniFrameCreate(Sender: TObject);
    procedure FDQryFiltroTIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure edLkpPRODUTOSExit(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure edLkpOPERACOESExit(Sender: TObject);
    procedure UniDBFormattedNumberEdit1Exit(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure edLkpSEMENTESClick(Sender: TObject);
    procedure edLkpSEMENTESExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure carregacategoria;
    procedure carregalote(const F_LOTE: string);
    function  CalculaPonto(vrpur, vrqtde: Real): Real;

  end;

implementation

{$R *.dfm}

uses MainModule, untFrmPesquisa, mkm_procedures, untdm_rc, mkm_funcoes,
  mkm_func_web, mkm_layout, mkm_crudfuncs,untPesquisaGenerica;


procedure TfrmcadPONTOS.UniFrameCreate(Sender: TObject);
begin
  sqlMaster.SQL.Text := ' SELECT [[fields]] ' +
                        ' FROM [[table]] tab ' +
                        ' WHERE tab.[[pk]] = :table_pk ' +
                        ' [grid] ' +
                        ' SELECT tab.key, tab.codigo, tab.tipo, tab.data, tab.numero, ' +
                        '        tab.serie, tab.lotesemente, tab.boletim, tab.termo, ' +
                        '        tab.pureza, tab.produto, tab.quantidade ' +
                        ' FROM pontos tab ';

  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:' +
                        'grid-resize|' +
                        'model-crud:2|' +
                        'grid-paginator:center|' +
                        ']]';

  carregacategoria;
  inherited;

end;

procedure TfrmcadPONTOS.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell(dbgSearchCRUD, ACol, ARow, Column, Attribs);
end;

procedure TfrmcadPONTOS.btnEditRegClick(Sender: TObject);
begin
  carregacategoria;
  inherited;
end;

procedure TfrmcadPONTOS.btnNewRegClick(Sender: TObject);
begin
  carregacategoria;
  inherited;
end;

procedure TfrmcadPONTOS.dbgSearchCRUDDblClick(Sender: TObject);
begin
  carregacategoria;
  inherited;
  edLkpSEMENTES.Text := sqlMaster.FindField('LOTESEMENTE').AsString;
end;

function TfrmcadPONTOS.CalculaPonto(vrpur, vrqtde: Real): Real;
var
  totpontos: Real;
begin
  totpontos := vrqtde * vrpur;
  Result := totpontos;
end;

procedure TfrmcadPONTOS.carregacategoria;
begin
  UniDBComboBoxcategoria.Clear;
  TabelaCategoria('SELECT descricao FROM categoria WHERE ATIVO = ' + QuotedStr('T') + ' ORDER BY codigo');
  dm_rc.FDQryCategoria.First;
  while not dm_rc.FDQryCategoria.Eof do
  begin
    UniDBComboBoxcategoria.Items.Add(dm_rc.FDQryCategoria.FindField('DESCRICAO').AsString);
    dm_rc.FDQryCategoria.Next;
  end;

end;

procedure TfrmcadPONTOS.carregalote(const F_LOTE: string);
begin
  if SqlPesquisa('SELECT codigo, produto, lote, boletim, termo, categoria, ' +
  ' analisepura, gernormais, valorcultural FROM sementes WHERE LOTE = ' + QuotedStr(F_LOTE)) then
  begin
    sqlMaster.FindField('PRODUTO').AsString       := dm_rc.sqlBuscas.FindField('PRODUTO').AsString;
    sqlMaster.FindField('LOTESEMENTE').AsString   := dm_rc.sqlBuscas.FindField('LOTE').AsString;
    sqlMaster.FindField('BOLETIM').AsString       := dm_rc.sqlBuscas.FindField('BOLETIM').AsString;
    sqlMaster.FindField('TERMO').AsString         := dm_rc.sqlBuscas.FindField('TERMO').AsString;
    sqlMaster.FindField('CATEGORIA').AsString     := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
    sqlMaster.FindField('PUREZA').AsFloat         := dm_rc.sqlBuscas.FindField('ANALISEPURA').AsFloat;
    sqlMaster.FindField('GERMINACAO').AsFloat     := dm_rc.sqlBuscas.FindField('GERNORMAIS').AsFloat;
    sqlMaster.FindField('VALORCULTURAL').AsFloat  := dm_rc.sqlBuscas.FindField('VALORCULTURAL').AsFloat;

    edLkpPRODUTOSExit(Self);
  end;

end;

procedure TfrmcadPONTOS.FDQryFiltroTIPOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
  begin
    if FDQryFiltroTIPO.AsString = 'ENTRADA' then
      Text := '<span class="badge badge-success">Entrada</span>'
    else if FDQryFiltroTIPO.AsString = 'SAIDA' then
      Text := '<span class="badge badge-danger">Saida</span>'
    else
      Text := '<span class="badge badge-warning">Nulo</span>';
  end;
end;

procedure TfrmcadPONTOS.edLkpSEMENTESClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_LookUpSearchFilter( Sender, '', '', 'NOME;PRODUTO;BOLETIM;TERMO;DISPONIVEL' );
  edLkpSEMENTES.Text  := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'LOTE' )  ;
end;

procedure TfrmcadPONTOS.edLkpSEMENTESExit(Sender: TObject);
begin
  if ( sqlMaster.State in [dsEdit, dsInsert ] ) then
    begin
      if (edLkpSEMENTES.Text <> '') and (edLkpSEMENTES.Text <> '0') then
        begin
          carregalote(edLkpSEMENTES.Text);
        end;
    end;
end;

procedure TfrmcadPONTOS.edLkpOPERACOESExit(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
  begin
    if (edLkpOPERACOES.Text <> '') and (edLkpOPERACOES.Text <> '0') then
    begin
      if SqlPesquisa('SELECT CODIGO, ENTRADA_SAIDA FROM OPERACOES WHERE CODIGO = ' + QuotedStr(edLkpOPERACOES.Text)) then
      begin
        sqlMaster.FindField('TIPO').AsString := variif(dm_rc.sqlBuscas.FindField('ENTRADA_SAIDA').AsInteger = 0, 'ENTRADA', 'SAIDA');
      end;
    end;
  end;
end;

procedure TfrmcadPONTOS.edLkpPRODUTOSExit(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
  begin
    if (edLkpPRODUTOS.Text <> '') and (edLkpPRODUTOS.Text <> '0') then
    begin
      sqlMaster.FindField('DESCRICAO').AsString := Acha_Item('PRODUTOS', sqlMaster.FindField('PRODUTO').AsString);
    end;
  end;
end;

procedure TfrmcadPONTOS.UniDBFormattedNumberEdit1Exit(Sender: TObject);
begin
  inherited;
  sqlMaster.FindField('PONTOS').AsFloat := CalculaPonto(sqlMaster.FindField('PUREZA').AsFloat,
                                                       sqlMaster.FindField('QUANTIDADE').AsFloat);
end;

initialization
  RegisterClass(TfrmcadPONTOS);

end.
