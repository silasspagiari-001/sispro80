unit untCadSOLICITACAO; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0
     - TfrmCadSOLICITACAO = class(TfrmCRUDproprio) -> TfrmCadSOLICITACAO = class(TfrmCRUDproprio)
     - var global removida; uses Vcl/Winapi/System otimizados
     - scaffolding RadCore 8.0 (UniFrameCreate com fieldmasks + dbgSearchCRUDDrawColumnCell com rc_GridDrawCell)
[EN] RADCore 3.0 -> 8.0 conversion
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIApplication, uniGUIClasses, uniGUIFrame, untFrmCRUDproprio, Data.DB, uniBasicGrid, uniDBGrid,
  uniPanel, uniPageControl, uniGUIBaseClasses, uniScrollBox, uniDBEdit,
  uniMultiItem, uniComboBox, uniEdit, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniCheckBox,
  uniFieldSet, uniDBComboBox, uniDBLookupComboBox, uniSpeedButton,
  uniDBCheckBox, uniMainMenu, uniHTMLFrame, Data.FMTBcd, Data.SqlExpr,
  uniSpinEdit, uniMemo, Vcl.Menus, uniSweetAlert, uniDBNavigator,
  untFrmBaseCRUD, uniDateTimePicker, UniButtonDbEdit, uniDBDateTimePicker,Vcl.Grids;

type
  TfrmCadSOLICITACAO = class(TfrmCRUDproprio)
    UniPageControlcadastros: TUniPageControl;
    UniTabSheetCRUD: TUniTabSheet;
    UniScrollBox2: TUniScrollBox;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroEMPRESA: TIntegerField;
    FDQryFiltroLABORATORIO: TIntegerField;
    FDQryFiltroNOME_LABORATORIO: TStringField;
    FDQryFiltroFINALIDADE: TStringField;
    FDQryFiltroASSINADO: TStringField;
    FDQryFiltroCAMINHO: TStringField;
    rcBlock10: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniLabel13: TUniLabel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniButtonDbEdit3: TUniButtonDbEdit;
    UniLabel11: TUniLabel;
    UniButtonDbEdit4: TUniButtonDbEdit;
    UniLabel12: TUniLabel;
    UniDBComboBox2: TUniDBComboBox;
    UniDBComboBox3: TUniDBComboBox;
    UniLabel14: TUniLabel;
    UniDBComboBox4: TUniDBComboBox;
    UniLabel15: TUniLabel;
    rcBlock150: TUniContainerPanel;
    UniDBCheckBox2: TUniDBCheckBox;
    UniDBCheckBox3: TUniDBCheckBox;
    UniDBCheckBox4: TUniDBCheckBox;
    UniDBCheckBox5: TUniDBCheckBox;
    UniDBCheckBox6: TUniDBCheckBox;
    UniDBCheckBox7: TUniDBCheckBox;
    rcBlock160: TUniContainerPanel;
    UniDBGridsolicitacao: TUniDBGrid;
    tbdetalhesESPECIE: TStringField;
    tbdetalhesCULTIVAR: TStringField;
    tbdetalhesSAFRA: TStringField;
    tbdetalhesCODIGO_LOTE: TIntegerField;
    tbdetalhesLOTE: TStringField;
    tbdetalhesCATEGORIA: TStringField;
    tbdetalhesREPRESENTATIVIDADE: TStringField;
    tbdetalhesIBGE: TIntegerField;
    tbdetalhesPROCEDENCIA: TStringField;
    tbdetalhesESTADO: TStringField;
    tbdetalhesDATA_AMOSTRAGEM: TDateField;
    tbdetalhesPESOAMOSTRA: TFloatField;
    tbdetalhesAMOSTRA: TStringField;
    tbdetalhesexclui: TStringField;
    tbdetalhesbusca_cidade: TStringField;
    tbdetalhesbusca_lote: TStringField;
    UniDBCheckBox8: TUniDBCheckBox;
    UniDBCheckBox9: TUniDBCheckBox;
    UniDBCheckBox11: TUniDBCheckBox;
    FDQryFiltroKEY: TStringField;
    UniPopupMenudetalhes: TUniPopupMenu;
    O1: TUniMenuItem;
    C1: TUniMenuItem;
    I1: TUniMenuItem;
    c2: TUniMenuItem;
    N2: TUniMenuItem;
    N3: TUniMenuItem;
    d1: TUniMenuItem;
    UniButtonDbEdit2: TUniButtonDbEdit;
    UniLabel7: TUniLabel;
    FDQryFiltroSTATUS: TStringField;
    S1: TUniMenuItem;
    O2: TUniMenuItem;
    N5: TUniMenuItem;
    C3: TUniMenuItem;
    N6: TUniMenuItem;
    FDQryFiltroRESPONSAVEL: TIntegerField;
    FDQryFiltroEMISSAO: TDateField;
    G1: TUniMenuItem;
    tbdetalhesPENEIRA: TStringField;
    N1_detalhes: TUniMenuItem;
    N7: TUniMenuItem;
    L1: TUniMenuItem;
    N4: TUniMenuItem;
    I2: TUniMenuItem;
    FDQryFiltroNUMERO_TERMO: TStringField;
    UniDBCheckBox10: TUniDBCheckBox;
    sqlSearchMasterCODIGO: TIntegerField;
    sqlSearchMasterSTATUS: TStringField;
    sqlSearchMasterASSINADO: TStringField;
    sqlSearchMasterEMISSAO: TDateField;
    sqlSearchMasterLABORATORIO: TIntegerField;
    sqlSearchMasterNOME_LABORATORIO: TStringField;
    sqlSearchMasterFINALIDADE: TStringField;
    sqlSearchMasterNUMERO_TERMO: TStringField;
    sqlSearchMasterKEY: TStringField;
    edLkpLABORATORIO: TUniDBEdit;
    rcBlock15: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    procedure UniFrameCreate(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure FDQryFiltroFINALIDADEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDQryFiltroSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDQryFiltroASSINADOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniButtonDbEdit1ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit1Exit(Sender: TObject);
    procedure UniButtonDbEdit4ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit3ButtonClick(Sender: TObject);
    procedure tbdetalhesbusca_loteGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tbdetalhesbusca_cidadeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tbdetalhesexcluiGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniDBGridsolicitacaoCellClick(Column: TUniDBGridColumn);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure FDQryFiltroKEYGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure I1Click(Sender: TObject);
    procedure UniButtonDbEdit2ButtonClick(Sender: TObject);
    procedure tbdetalhesAfterPost(DataSet: TDataSet);
    procedure S1Click(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure I2Click(Sender: TObject);
    procedure sqlSearchMasterSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure sqlSearchMasterASSINADOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure sqlSearchMasterFINALIDADEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure sqlSearchMasterKEYGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
  procedure carregalote(const    idlote:integer);
  procedure carregaespecie();
  procedure carregacultivar();
  procedure categoria();
  procedure peneira();
  procedure validasolicitacao();
  end;



implementation

uses untdm_rc, MainModule, untFrmLookUp, Main,
  untFrmMessage, uconsts, uconsts_cfg,
  mkm_func_web, mkm_layout, mkm_restfuncs, mkm_crudfuncs, untFrmPesquisa,
  mkm_procedures, untfrmPesquisalote, unReportImpressao,
  mkm_impressao, mkm_funcoes, mkm_regrasnegocio, untFrmTERMOCOLETA;

{$R *.dfm}

procedure TfrmCadSOLICITACAO.UniFrameCreate(Sender: TObject);
begin
  sqlMaster.SQL.Text := ' SELECT [[fields]] ' +
                        ' FROM [[table]] tab ' +
                        ' WHERE tab.[[pk]] = :table_pk ' +
                        ' [grid] ' +
                        ' SELECT tab.key, tab.codigo, tab.status, tab.assinado, ' +
                        '        tab.finalidade, tab.emissao, tab.laboratorio, ' +
                        '        tab.nome_laboratorio, tab.numero_termo ' +
                        ' FROM solicitacao tab ';

//  dbgSearchCRUD.Hint := '[[' +
//                        'fieldmasks:' +
//                        'grid-resize|' +
//                        'model-crud:2|' +
//                        'grid-paginator:center|' +
//                        ']]';

  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:' +
                        'grid-resize|' +
                        'model-crud:2|' +
                        'grid-paginator:center|' +

                        'KEY[[width:1%|visible:false mobile]];' +

                        ']]';

  inherited;
end;

procedure TfrmCadSOLICITACAO.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell(dbgSearchCRUD, ACol, ARow, Column, Attribs);
end;

procedure TfrmCadSOLICITACAO.btnEditRegClick(Sender: TObject);
begin

  if FDQryFiltroASSINADO.AsString = 'S' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'DOCUMENTO JA FOI GERADO E ASSINADO -  NÃO PERMITIDO ALTERAR SOLICITAÇÃO' , 'error'  );
      Abort
    end;

  tbdetalhes.AfterPost := nil;

  carregaespecie();
  carregacultivar();
  categoria();
  peneira();

  inherited;

  tbdetalhes.AfterPost := tbdetalhesAfterPost;


  UniDBGridsolicitacao.Options          := UniDBGridsolicitacao.Options - [dgRowSelect];
  UniDBGridsolicitacao.Options          := UniDBGridsolicitacao.Options + [dgEditing];
end;

procedure TfrmCadSOLICITACAO.btnNewRegClick(Sender: TObject);
begin
  tbdetalhes.AfterPost := nil;

  carregaespecie();
  carregacultivar();
  categoria();
  peneira();

  inherited;

  tbdetalhes.AfterPost := tbdetalhesAfterPost;

  UniDBGridsolicitacao.Options          := UniDBGridsolicitacao.Options - [dgRowSelect];
  UniDBGridsolicitacao.Options          := UniDBGridsolicitacao.Options + [dgEditing];
end;

procedure TfrmCadSOLICITACAO.btnSaveRegClick(Sender: TObject);
begin
  inherited;
  UniDBGridsolicitacao.Options          := UniDBGridsolicitacao.Options - [dgEditing];
end;

procedure TfrmCadSOLICITACAO.C3Click(Sender: TObject);
begin
  inherited;
  if FDQryFiltroASSINADO.AsString = 'A' then
    begin
      if AssinaturaResponsavel(FDQryFiltroCODIGO.AsInteger,
                               FDQryFiltroRESPONSAVEL.AsInteger,
                               mm.varI_Code_Company,
                               'SOLICITACAO',
                               'DELETE') = True then
      begin
        executasql(' update solicitacao set assinado = ' + QuotedStr('N') +
                   ' where codigo                    = ' + IntToStr(FDQryFiltroCODIGO.AsInteger));
        FDQryFiltro.Refresh;
        dm_rc.rc_ShowSweetAlert( 'OK', 'SOLICITAÇÃO DA ASSINATURA CANCELADA' , 'sucess'  );
      end
      else
        begin
          FDQryFiltro.Refresh;
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI CANCELAR A SOLICITAÇÃO DA ASSINATURA' , 'error'  )
        end;
    end;
end;

procedure TfrmCadSOLICITACAO.carregacultivar;
begin
  SqlPesquisa('select * from cultivar where ativo = ' + QuotedStr('T') + ' order by CULTIVAR');
  UniDBGridsolicitacao.Columns[4].PickList.Clear;
  UniDBGridsolicitacao.Columns[4].PickList.Add('');
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      UniDBGridsolicitacao.Columns[4].PickList.Add(dm_rc.sqlBuscas.FindField('CULTIVAR').AsString);
      dm_rc.sqlBuscas.Next;
    end;
end;

procedure TfrmCadSOLICITACAO.carregaespecie;
begin
  SqlPesquisa('select * from especie where ativo = ' + QuotedStr('T') + ' order by SEMENTENOME');
  UniDBGridsolicitacao.Columns[3].PickList.Clear;
  UniDBGridsolicitacao.Columns[3].PickList.Add('');
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      UniDBGridsolicitacao.Columns[3].PickList.Add(dm_rc.sqlBuscas.FindField('SEMENTENOME').AsString);
      dm_rc.sqlBuscas.Next;
    end;
end;

procedure TfrmCadSOLICITACAO.carregalote(const idlote: integer);
begin
  if FDQryCad.State in [dsInsert,dsEdit] then
    begin
      SqlPesquisa   ('select * from sementes where codigo = ' + IntToStr(idlote));
      TabelaProdutos('select * from produtos where codigo = ' + IntToStr(dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger));

      tbdetalhes.Edit;
      tbdetalhes.FindField('LOTE').AsString           :=  dm_rc.sqlBuscas.FindField('LOTE').AsString;
      tbdetalhes.FindField('CULTIVAR').AsString       :=  dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;
      tbdetalhes.FindField('CATEGORIA').AsString      :=  dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
      tbdetalhes.FindField('ESPECIE').AsString        :=  dm_rc.FDQryProdutos.FindField('SEMENTENOME').AsString;
      tbdetalhes.FindField('SAFRA').AsString          :=  dm_rc.sqlBuscas.FindField('SAFRAVALIDA').AsString;
      tbdetalhes.FindField('CODIGO_LOTE').AsInteger   :=  idlote;
    end;
end;

procedure TfrmCadSOLICITACAO.categoria;
begin
  SqlPesquisa('select * from categoria where ativo = ' + QuotedStr('T') + ' order by codigo');
  UniDBGridsolicitacao.Columns[6].PickList.Clear;
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      UniDBGridsolicitacao.Columns[6].PickList.Add(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString);
      dm_rc.sqlBuscas.Next;
    end;
end;

procedure TfrmCadSOLICITACAO.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
  inherited;
   Linha  := TStringGrid(dbgSearchCRUD).Row;
   Coluna := dbgSearchCRUD.CurrCol;

  if Column.FieldName = 'KEY' then
    begin
      if FDQryFiltroASSINADO.AsString = 'S' then
        begin
          G1.Caption    := 'Cancelar Assinatura';
          G1.ImageIndex := 33;
        end
      else
        begin
          G1.Caption    := 'Gerar Assinatura Automática';
          G1.ImageIndex := 128;
        end;

      UniPopupMenudetalhes.Popup(posicao_x-25,posicao_y, dbgSearchCRUD);
    end;

end;

procedure TfrmCadSOLICITACAO.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmCadSOLICITACAO.FDQryFiltroASSINADOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if FDQryFiltroASSINADO.AsString = 'N' then
        Text := '<span class="badge badge-danger">NÃO</span>'
      else
      if FDQryFiltroASSINADO.AsString = 'S' then
        Text := '<span class="badge badge-success">SIM</span>'
      else
      if FDQryFiltroASSINADO.AsString = 'A' then
        Text := '<span class="badge badge-warning">Aguarde</span>';
    end;
end;

procedure TfrmCadSOLICITACAO.FDQryFiltroFINALIDADEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if FDQryFiltroFINALIDADE.AsString = 'BAS' then
        Text := '<span class="badge badge-info">'+FDQryFiltroFINALIDADE.AsString+'</span>'
      else
      if FDQryFiltroFINALIDADE.AsString = 'IR' then
        Text := '<span class="badge badge-dark">'+FDQryFiltroFINALIDADE.AsString+'</span>';
    end;
end;

procedure TfrmCadSOLICITACAO.FDQryFiltroKEYGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmCadSOLICITACAO.FDQryFiltroSTATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if StrAllTrim(FDQryFiltroSTATUS.AsString) = 'Andamento' then
        Text := '<span class="badge badge-warning">Andamento</span>'
      else
      if StrAllTrim(FDQryFiltroSTATUS.AsString) = 'Enviado' then
        Text := '<span class="badge badge-secundary">Enviado</span>'
      else
      if StrAllTrim(FDQryFiltroSTATUS.AsString) = 'Retornado' then
        Text := '<span class="badge badge-success">Retornado</span>';
    end;
end;

procedure TfrmCadSOLICITACAO.G1Click(Sender: TObject);
begin
  inherited;
  if FDQryFiltroASSINADO.AsString = 'N' then
    begin
      if VerificaExisteAssinatura(FDQryFiltroRESPONSAVEL.AsInteger) = False then
        begin
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'RESPONSAVEL TÉCNICO NÃO POSSUI ASSINATURA NO SISTEMA' , 'error'  );
          Abort
        end
      else
        begin
          try
            mm.varC_caminhopdf := IMPRESSAO_solicitacao(mm.varI_Code_Company,
                                                        FDQryFiltro.FindField('CODIGO').AsInteger,
                                                        True,'R');

            executasql(' update solicitacao set assinado = ' + QuotedStr('S') + ',' +
                       ' datahora_assinado               = ' + QuotedStr(DateToStr(date) + ' ' + TimeToStr(time)) +
                       ' where codigo                    = ' + IntToStr(FDQryFiltroCODIGO.AsInteger));

            FDQryFiltro.Refresh;

            dm_rc.rc_ShowSweetAlert( 'OK', 'DOCUMENTO ASSINADO COM SUCESSO' , 'sucess'  );
          except
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI GERAR A ASSINATURA' , 'error'  );
          end;
        end;
    end
  else
    if FDQryFiltroASSINADO.AsString = 'S' then
      begin
        DeleteFile(FDQryFiltroCAMINHO.AsString);
        executasql(' update solicitacao set assinado = ' + QuotedStr('N') + ',' +
                   ' caminho = null                    ' + ',' +
                   ' datahora_assinado = null          ' +
                   ' where codigo                    = ' + IntToStr(FDQryFiltroCODIGO.AsInteger));

        FDQryFiltro.Refresh;

        dm_rc.rc_ShowSweetAlert( 'OK', 'DOCUMENTO REMOVIDO COM SUCESSO!' , 'sucess'  );
      end;
end;

procedure TfrmCadSOLICITACAO.I1Click(Sender: TObject);
begin
  inherited;

  dm_rc.rc_ShowYesNo( 'ESTA SOLICITAÇÃO É DO AMOSTRADOR?' );
  if mm.varB_Yes then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_solicitacao(mm.varI_Code_Company,
                                                   FDQryFiltro.FindField('CODIGO').AsInteger,False,'A');
    end
  else
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_solicitacao(mm.varI_Code_Company,
                                                   FDQryFiltro.FindField('CODIGO').AsInteger,False,'R');

    end;

  unfImpressao.ShowModal();
end;

procedure TfrmCadSOLICITACAO.I2Click(Sender: TObject);
begin
  inherited;
  if FDQryFiltroNUMERO_TERMO.AsString <> '' then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_termocoleta(mm.varI_Code_Company,
                                                   FDQryFiltro.FindField('CODIGO').AsInteger);
      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO INCLUIDO NENHUM TERMO DE COLETA' , 'error'  );
end;

procedure TfrmCadSOLICITACAO.L1Click(Sender: TObject);
begin
  inherited;
  mm.varI_Code_Documento_Controle := FDQryFiltroCODIGO.AsInteger;
  frmTERMOCOLETA.ShowModal();
  FDQryFiltro.Refresh;
end;

procedure TfrmCadSOLICITACAO.peneira;
begin
  SqlPesquisa('select * from peneira where ativo = ' + QuotedStr('T') + ' order by codigo');
  UniDBGridsolicitacao.Columns[8].PickList.Clear;
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      UniDBGridsolicitacao.Columns[8].PickList.Add(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString);
      dm_rc.sqlBuscas.Next;
    end;
end;

procedure TfrmCadSOLICITACAO.S1Click(Sender: TObject);
begin
  inherited;
  if FDQryFiltroASSINADO.AsString = 'N' then
    begin
      if AssinaturaResponsavel(FDQryFiltroCODIGO.AsInteger,
                               FDQryFiltroRESPONSAVEL.AsInteger,
                               mm.varI_Code_Company,
                               'SOLICITACAO',
                               'INCLUI') = True then
      begin
        executasql(' update solicitacao set assinado = ' + QuotedStr('A') +
                   ' where codigo                    = ' + IntToStr(FDQryFiltroCODIGO.AsInteger));
        FDQryFiltro.Refresh;
        dm_rc.rc_ShowSweetAlert( 'OK', 'SOLICITAÇÃO ENVIADA AO RESPONSÁVEL TÉCNICO' , 'sucess'  );
      end
      else
        begin
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI ENVIAR A SOLICITAÇÃO DA ASSINATURA' , 'error'  );
        end;
    end;
end;

procedure TfrmCadSOLICITACAO.sqlSearchMasterASSINADOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    if not DisplayText then
    Exit;

    if sqlSearchMasterASSINADO.AsString = 'N' then
      Text := '<span class="badge text-bg-danger">NÃO</span>'
    else
    if sqlSearchMasterASSINADO.AsString = 'S' then
      Text := '<span class="badge text-bg-success">SIM</span>'
    else
    if sqlSearchMasterASSINADO.AsString = 'A' then
      Text := '<span class="badge text-bg-warning">Aguarde</span>';

end;

procedure TfrmCadSOLICITACAO.sqlSearchMasterFINALIDADEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    if not DisplayText then
    Exit;

    if sqlSearchMasterFINALIDADE.AsString = 'BAS' then
      Text := '<span class="badge text-bg-info">'+sqlSearchMasterFINALIDADE.AsString+'</span>'
    else
    if sqlSearchMasterFINALIDADE.AsString = 'IR' then
      Text := '<span class="badge text-bg-dark">'+sqlSearchMasterFINALIDADE.AsString+'</span>';

end;

procedure TfrmCadSOLICITACAO.sqlSearchMasterKEYGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmCadSOLICITACAO.sqlSearchMasterSTATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    if not DisplayText then
    Exit;

    if StrAllTrim(sqlSearchMasterSTATUS.AsString) = 'Andamento' then
      Text := '<span class="badge text-bg-warning">Andamento</span>'
    else
    if StrAllTrim(sqlSearchMasterSTATUS.AsString) = 'Enviado' then
      Text := '<span class="badge text-bg-secundary">Enviado</span>'
    else
    if StrAllTrim(sqlSearchMasterSTATUS.AsString) = 'Retornado' then
      Text := '<span class="badge text-bg-success">Retornado</span>';

end;


procedure TfrmCadSOLICITACAO.tbdetalhesAfterPost(DataSet: TDataSet);
begin
  inherited;
  validasolicitacao();
end;

procedure TfrmCadSOLICITACAO.tbdetalhesbusca_cidadeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Busca Cidade" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmCadSOLICITACAO.tbdetalhesbusca_loteGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Busca Lote" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmCadSOLICITACAO.tbdetalhesexcluiGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';
end;

procedure TfrmCadSOLICITACAO.UniButtonDbEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('LABORATORIO');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('LABORATORIO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCadSOLICITACAO.UniButtonDbEdit1Exit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
//      if UniButtonDbEdit1.Text <> '' then
        FDQryCad.FindField('NOME_LABORATORIO').AsString := Acha_Item('LABORATORIO'  ,FDQryCad.FindField('LABORATORIO').AsString);
    end;
end;

procedure TfrmCadSOLICITACAO.UniButtonDbEdit2ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('RESPONSAVEL');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('AMOSTRADOR').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCadSOLICITACAO.UniButtonDbEdit3ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('EMPRESAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('REMETENTE').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCadSOLICITACAO.UniButtonDbEdit4ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('RESPONSAVEL');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('RESPONSAVEL').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCadSOLICITACAO.UniDBGridsolicitacaoCellClick(
  Column: TUniDBGridColumn);
begin
  inherited;
  if FDQryCad.State in [dsInsert,dsEdit] then
    begin
      if Column.FieldName = 'exclui' then
        begin
          dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
          if mm.varB_Yes then
            begin
              tbdetalhes.Delete;
            end
        end;

      if Column.FieldName = 'busca_lote' then
        begin
          MM.varC_referencia_busca := 'BENEFICIAMENTO';
          frmpesquisalote.showmodal(
          procedure(Sender: TComponent; AResult: Integer)
           begin
             if AResult = mrOK then
             begin
               carregalote(StrToInt(MM.varC_codigo_busca_lote));
             end;
           end);
        end;

      if Column.FieldName = 'busca_cidade' then
        begin
          mm.Seta_Busca('CIDADES');
          UniFfrmPesquisa.ShowModal(
          procedure(Sender: TComponent; AResult: Integer)
           begin
             if AResult = mrOK then
             begin
               tbdetalhes.Edit;
               tbdetalhes.FindField('IBGE').AsString := MM.varC_codigo_busca;

               if SqlPesquisa('SELECT * FROM CIDADES WHERE CODIIBGE = ' + QuotedStr(MM.varC_codigo_busca)) then
                 begin
                   tbdetalhes.FindField('PROCEDENCIA').AsString := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
                   tbdetalhes.FindField('ESTADO').AsString      := dm_rc.sqlBuscas.FindField('UF').AsString;
                 end;
             end;
           end);
        end;
    end;
end;

procedure TfrmCadSOLICITACAO.validasolicitacao;
begin
  if tbdetalhesESPECIE.AsString = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PREENCHER O CAMPO ESPÉCIE' , 'error'  );
      abort;
    end;
  if tbdetalhesCULTIVAR.AsString = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PREENCHER O CAMPO CULTIVAR' , 'error'  );
      abort;
    end;
  if tbdetalhesSAFRA.AsString = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PREENCHER O CAMPO SAFRA' , 'error'  );
      abort;
    end;
  if tbdetalhesLOTE.AsString = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PREENCHER O CAMPO LOTE' , 'error'  );
      abort;
    end;
  if tbdetalhesCATEGORIA.AsString = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PREENCHER O CAMPO CATEGORIA' , 'error'  );
      abort;
    end;
  if tbdetalhesREPRESENTATIVIDADE.AsString = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PREENCHER O CAMPO REPRESENTATIVIDADE' , 'error'  );
      abort;
    end;
  if tbdetalhesPROCEDENCIA.AsString = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PREENCHER O CAMPO PROCEDÊNCIA' , 'error'  );
      abort;
    end;
end;

initialization
  RegisterClass(TfrmCadSOLICITACAO);
end.
