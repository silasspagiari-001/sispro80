unit untCadSEMENTES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIApplication, uniGUIClasses, uniGUIFrame, untFrmCRUDproprio, Data.DB, uniBasicGrid, uniDBGrid,
  uniPanel, uniPageControl, uniGUIBaseClasses, uniScrollBox, uniDBEdit,
  uniMultiItem, uniComboBox, uniEdit, uniLabel, uniButton, uniBitBtn,
  uniDateTimePicker, uniDBDateTimePicker, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniCheckBox, uniFieldSet,
  uniDBComboBox, uniDBLookupComboBox, uniSpeedButton, uniDBCheckBox,
  uniMainMenu, uniHTMLFrame, Data.FMTBcd, Data.SqlExpr, uniSpinEdit, uniMemo,
  Vcl.Menus, uniSweetAlert, uniDBNavigator, uniDBMemo,
  mkm_funcoes,mkm_impressao;

type
  TfrmCADSEMENTES = class(TfrmCRUDproprio)
    UniPopupMenuopcoes: TUniPopupMenu;
    I1: TUniMenuItem;
    T1: TUniMenuItem;
    H1: TUniMenuItem;
    A1: TUniMenuItem;
    N3: TUniMenuItem;
    I2: TUniMenuItem;
    N4: TUniMenuItem;
    t2: TUniMenuItem;
    N2: TUniMenuItem;
    I3: TUniMenuItem;
    N6: TUniMenuItem;
    R1: TUniMenuItem;
    N5: TUniMenuItem;
    UniDBDateTimePicker3: TUniDBDateTimePicker;
    rcBlock2: TUniContainerPanel;
    rcBlock3: TUniContainerPanel;
    labRcCollapseGeneral: TUniLabel;
    UniLabel1: TUniLabel;
    rcBlock10: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    rcBlock30: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBCheckBox2: TUniDBCheckBox;
    rcBlock40: TUniContainerPanel;
    UniLabel10: TUniLabel;
    edLkpPRODUTOS: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBComboBoxcultivar: TUniDBComboBox;
    rcBlock70: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBComboBoxcategoria: TUniDBComboBox;
    rcBlock80: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniDBComboBox2: TUniDBComboBox;
    rcBlock90: TUniContainerPanel;
    UniLabel9: TUniLabel;
    edLkpEMPRESAS: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    UniLabel12: TUniLabel;
    edLkpRESPONSAVEL: TUniDBEdit;
    rcBlock110: TUniContainerPanel;
    UniLabel13: TUniLabel;
    edLkpLABORATORIO: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    rcBlock5: TUniContainerPanel;
    rcBlock6: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniLabel11: TUniLabel;
    rcBlock140: TUniContainerPanel;
    UniLabel15: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    rcBlock150: TUniContainerPanel;
    UniLabel16: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    rcBlock160: TUniContainerPanel;
    UniLabel17: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    Ubtngeratseqtermo: TUniButton;
    rcBlock170: TUniContainerPanel;
    UniLabel19: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    rcBlock180: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    rcBlock190: TUniContainerPanel;
    UniLabel21: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock200: TUniContainerPanel;
    UniLabel22: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    rcBlock210: TUniContainerPanel;
    UniLabel23: TUniLabel;
    UniDBFormattedNumberEditpureza: TUniDBFormattedNumberEdit;
    rcBlock220: TUniContainerPanel;
    UniLabel24: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    rcBlock255: TUniContainerPanel;
    UniLabel25: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    rcBlock205: TUniContainerPanel;
    UniLabel26: TUniLabel;
    UniDBComboBoxpeneira: TUniDBComboBox;
    rcBlock225: TUniContainerPanel;
    UniLabel27: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    rcBlock235: TUniContainerPanel;
    UniLabel28: TUniLabel;
    UniDBFormattedNumberEditgerminacao: TUniDBFormattedNumberEdit;
    rcBlock245: TUniContainerPanel;
    UniLabel29: TUniLabel;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    rcBlock265: TUniContainerPanel;
    UniLabel30: TUniLabel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    rcBlock285: TUniContainerPanel;
    UniLabel31: TUniLabel;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    rcBlock300: TUniContainerPanel;
    UniBitBtn6: TUniBitBtn;
    UniLabel32: TUniLabel;
    UniDBMemo1: TUniDBMemo;
    rcBlock275: TUniContainerPanel;
    UniLabel18: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure H1Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure UniBitBtn6Click(Sender: TObject);
    procedure I2Click(Sender: TObject);
    procedure t2Click(Sender: TObject);
    procedure UbtngeratseqtermoClick(Sender: TObject);
    procedure I3Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure UniDBFormattedNumberEditgerminacaoExit(Sender: TObject);
    procedure UniDBFormattedNumberEdit5Exit(Sender: TObject);
    procedure edLkpPRODUTOSExit(Sender: TObject);
    procedure edLkpLABORATORIOExit(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
    ntermo: string;
  public
    { Public declarations }
    procedure carregacultivar;
    procedure carregacategoria;
    procedure carregapeneira;
    procedure PromptCallBack(Sender: TComponent; AResult: Integer; AText: string);
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, Main,
  untFrmMessage, uconsts, uconsts_cfg,
  mkm_func_web, mkm_layout, mkm_restfuncs, mkm_crudfuncs, mkm_procedures;

procedure TfrmCADSEMENTES.UniFrameCreate(Sender: TObject);
begin
  sqlMaster.SQL.Text := ' SELECT [[fields]] ' +
                        ' FROM [[table]] tab ' +
                        ' WHERE tab.[[pk]] = :table_pk ' +
                        ' [grid] ' +
                        ' SELECT tab.codigo, tab.tipo, tab.produto, tab.cultivar, ' +
                        '        tab.lote, tab.boletim, tab.termo, tab.categoria, tab.disponivel ' +
                        ' FROM sementes tab ';

  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:' +
                        'grid-resize|' +
                        'model-crud:2|' +
                        'grid-paginator:center|' +
                        ']]';

  carregacultivar;
  carregacategoria;
  carregapeneira;

  inherited;
end;

procedure TfrmCADSEMENTES.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell(dbgSearchCRUD, ACol, ARow, Column, Attribs);
end;

procedure TfrmCADSEMENTES.btnNewRegClick(Sender: TObject);
begin
  inherited;
  carregacultivar;
  carregacategoria;
  carregapeneira;
  ntermo := '';
end;

procedure TfrmCADSEMENTES.btnEditRegClick(Sender: TObject);
begin
  inherited;
  carregacultivar;
  carregacategoria;
  carregapeneira;
  ntermo := '';
end;

procedure TfrmCADSEMENTES.btnSaveRegClick(Sender: TObject);
begin
  if sqlMaster.State in [dsEdit, dsInsert] then
  begin
    sqlMaster.FieldByName('VENCIMENTO').AsDateTime := sqlMaster.FieldByName('VALIDADE').AsDateTime;
  end;
  inherited;
end;

procedure TfrmCADSEMENTES.carregacategoria;
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

procedure TfrmCADSEMENTES.carregacultivar;
begin
  UniDBComboBoxcultivar.Clear;
  TabelaCultivar('SELECT cultivar FROM CULTIVAR WHERE ATIVO = ' + QuotedStr('T') + ' ORDER BY CULTIVAR');
  dm_rc.FDQryCultivar.First;
  while not dm_rc.FDQryCultivar.Eof do
  begin
    UniDBComboBoxcultivar.Items.Add(dm_rc.FDQryCultivar.FindField('CULTIVAR').AsString);
    dm_rc.FDQryCultivar.Next;
  end;
end;

procedure TfrmCADSEMENTES.carregapeneira;
begin
  UniDBComboBoxpeneira.Clear;
  Tabelapeneira('SELECT descricao FROM peneira WHERE ATIVO = ' + QuotedStr('T') + ' ORDER BY codigo');
  dm_rc.fdqrypeneira.First;
  while not dm_rc.fdqrypeneira.Eof do
  begin
    UniDBComboBoxpeneira.Items.Add(dm_rc.fdqrypeneira.FindField('DESCRICAO').AsString);
    dm_rc.fdqrypeneira.Next;
  end;
end;

procedure TfrmCADSEMENTES.edLkpPRODUTOSExit(Sender: TObject);
begin
  inherited;
{
  if sqlMaster.State in [dsEdit, dsInsert] then
  begin
    if edLkpPRODUTOS.Text <> '' then
    begin
      SqlPesquisa('SELECT sementenome, cultivar FROM produtos WHERE codigo = ' + QuotedStr(edLkpPRODUTOS.Text));
      if not dm_rc.sqlBuscas.IsEmpty then
      begin
        sqlMaster.FieldByName('NOME').AsString := dm_rc.sqlBuscas.FieldByName('SEMENTENOME').AsString;
        sqlMaster.FieldByName('CULTIVAR').AsString := dm_rc.sqlBuscas.FieldByName('CULTIVAR').AsString;
      end;
    end;
  end;
  }

end;

procedure TfrmCADSEMENTES.edLkpLABORATORIOExit(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
  begin
    sqlMaster.FieldByName('NOMELABORATORIO').AsString := edLkpLABORATORIO.Text; //dm_rc.rc_GetLookUpField(Self, TUniDBEdit(Sender), 'RAZSOC');
  end;
end;

procedure TfrmCADSEMENTES.UniDBFormattedNumberEdit5Exit(Sender: TObject);
var
  cv: Real;
begin
  inherited;
  if (UniDBFormattedNumberEditgerminacao.Value > 0) and (UniDBFormattedNumberEditpureza.Value > 0) then
  begin
    cv := (UniDBFormattedNumberEditgerminacao.Value * UniDBFormattedNumberEditpureza.Value) / 100;
    sqlMaster.FieldByName('VALORCULTURAL').AsFloat := cv;
  end;
end;

procedure TfrmCADSEMENTES.UniDBFormattedNumberEditgerminacaoExit(Sender: TObject);
var
  cv: Real;
begin
  inherited;
  if (UniDBFormattedNumberEditgerminacao.Value > 0) and (UniDBFormattedNumberEditpureza.Value > 0) then
  begin
    cv := (UniDBFormattedNumberEditgerminacao.Value * UniDBFormattedNumberEditpureza.Value) / 100;
    sqlMaster.FieldByName('VALORCULTURAL').AsFloat := cv;
  end;
end;

procedure TfrmCADSEMENTES.UbtngeratseqtermoClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_ShowYesNo('POSSO GERAR O Nº DO TERMO SEQUENCIAL?');
  if mm.varB_Yes then
  begin
    ntermo := Numero_Termo(mm.varI_Code_Company, FormatDateTime('yyyy', sqlMaster.FieldByName('RECEBIDA').AsDateTime));
    Prompt('Sequência do termo está CORRETO? ', ntermo, mtInformation, mbOKCancel, PromptCallBack);
  end;
end;

procedure TfrmCADSEMENTES.PromptCallBack(Sender: TComponent; AResult: Integer; AText: string);
begin
  if AResult = mrOK then
  begin
    sqlMaster.FieldByName('TERMO').AsString := StrZeroS(AText, 5) + '/' + FormatDateTime('yyyy', sqlMaster.FieldByName('RECEBIDA').AsDateTime);
    sqlMaster.FieldByName('SEQTERMO').AsString := AText;
  end;
end;

procedure TfrmCADSEMENTES.UniBitBtn6Click(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
  begin
    sqlMaster.FieldByName('OBSERVACOES').AsString := 'A Amostra de sementes entregue ao Laboratório apresenta-se incrustada.';
  end;
end;

procedure TfrmCADSEMENTES.A1Click(Sender: TObject);
begin
  inherited;
  mm.varI_Code_Codigo_Semente := sqlMaster.FieldByName('CODIGO').AsInteger;
  // Abertura da tela de manutenção mantida
end;

procedure TfrmCADSEMENTES.H1Click(Sender: TObject);
begin
  inherited;
  mm.varI_Code_Lote_Lotesemente := sqlMaster.FieldByName('LOTE').AsString;
  mm.varI_Code_Lote_Boletimsemente := sqlMaster.FieldByName('BOLETIM').AsString;
  mm.varI_Code_Lote_Produto := sqlMaster.FieldByName('PRODUTO').AsInteger;
  mm.VarC_Atelagenerica := 'HISTORICOVENDALOTE';
end;

procedure TfrmCADSEMENTES.I2Click(Sender: TObject);
begin
  inherited;
  if sqlMaster.FieldByName('OP_TERMO').AsInteger = 1 then
  begin
    dm_rc.rc_ShowYesNo('POSSO IMPRIMIR COM ASSINATURA?');
    if mm.varB_Yes then
    begin
      try
        mm.varC_caminhopdf := SEMENTES_Termo(mm.varI_Code_Company,
                                              sqlMaster.FieldByName('CODIGO').AsInteger,
                                              1, 'S', sqlMaster.FieldByName('TERMO').AsString);
      except
        on e: Exception do
        begin
          gera_log(e.Message);
          dm_rc.rc_ShowSweetAlert('ATENÇÃO', e.Message, 'error');
        end;
      end;
    end
    else
    begin
      try
        mm.varC_caminhopdf := SEMENTES_Termo(mm.varI_Code_Company,
                                              sqlMaster.FieldByName('CODIGO').AsInteger,
                                              0, 'S', sqlMaster.FieldByName('TERMO').AsString);
      except
        on e: Exception do
        begin
          gera_log(e.Message);
          dm_rc.rc_ShowSweetAlert('ATENÇÃO', e.Message, 'error');
        end;
      end;
    end;
  end
  else
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'OPÇÃO DE TERMO ADITIVO NÃO MARCADO', 'error');
end;

procedure TfrmCADSEMENTES.I3Click(Sender: TObject);
begin
  inherited;
  mm.varI_Code_Codigo_Semente := sqlMaster.FieldByName('CODIGO').AsInteger;
end;

procedure TfrmCADSEMENTES.R1Click(Sender: TObject);
begin
  inherited;
  try
    Calcula_Lote(mm.varI_Code_Company,
                 sqlMaster.FieldByName('PRODUTO').AsInteger,
                 sqlMaster.FieldByName('LOTE').AsString,
                 sqlMaster.FieldByName('BOLETIM').AsString,
                 sqlMaster.FieldByName('TERMO').AsString,
                 mm.M_TIPOPESO);

    sqlMaster.Refresh;
    dm_rc.rc_ShowSweetAlert('OK', 'RECALCULADO COM SUCESSO!', 'sucess');
  except
    on e: Exception do
    begin
      gera_log(e.Message);
      dm_rc.rc_ShowSweetAlert('ATENÇÃO', e.Message, 'error');
    end;
  end;
end;

procedure TfrmCADSEMENTES.T1Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_ShowYesNo('POSSO IMPRIMIR COM ASSINATURA?');
  if mm.varB_Yes then
  begin
    try
      mm.varC_caminhopdf := SEMENTES_Termo(mm.varI_Code_Company,
                                            sqlMaster.FieldByName('CODIGO').AsInteger,
                                            1, 'N', sqlMaster.FieldByName('TERMO').AsString);
    except
      on e: Exception do
      begin
        gera_log(e.Message);
        dm_rc.rc_ShowSweetAlert('ATENÇÃO', e.Message, 'error');
      end;
    end;
  end
  else
  begin
    try
      mm.varC_caminhopdf := SEMENTES_Termo(mm.varI_Code_Company,
                                            sqlMaster.FieldByName('CODIGO').AsInteger,
                                            0, 'N', sqlMaster.FieldByName('TERMO').AsString);
    except
      on e: Exception do
      begin
        gera_log(e.Message);
        dm_rc.rc_ShowSweetAlert('ATENÇÃO', e.Message, 'error');
      end;
    end;
  end;
end;

procedure TfrmCADSEMENTES.t2Click(Sender: TObject);
begin
  inherited;
  mm.varI_Code_Codigo_Semente := sqlMaster.FieldByName('CODIGO').AsInteger;
end;

initialization
  RegisterClass(TfrmCADSEMENTES);

end.
