unit untfrmENTREGALOTE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniEdit, uniLabel,
  uniDateTimePicker, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel,
  UniButtonEdit, Vcl.Menus, uniMainMenu;

type
  TfrmENTREGALOTE = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    UniDBGridEntrega: TUniDBGrid;
    rcBlock30: TUniContainerPanel;
    UniDateTimePickerentreganemissao: TUniDateTimePicker;
    UniLabel108: TUniLabel;
    UniContainerPanel4: TUniContainerPanel;
    UniFormattedNumberEditentregatotaldoc: TUniFormattedNumberEdit;
    UniLabel110: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    UniBitBtn12: TUniBitBtn;
    rcBlock10: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniButtonEditplote: TUniButtonEdit;
    UniContainerPanel6: TUniContainerPanel;
    UniFormattedNumberEditPESOSACO: TUniFormattedNumberEdit;
    UniLabel2: TUniLabel;
    UniContainerPanel7: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniButtonEditCODPRO: TUniButtonEdit;
    UniPopupMenulote: TUniPopupMenu;
    L1: TUniMenuItem;
    N6: TUniMenuItem;
    L2: TUniMenuItem;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniButtonEditploteButtonClick(Sender: TObject);
    procedure UniBitBtn12Click(Sender: TObject);
    procedure UniDBGridEntregaCellClick(Column: TUniDBGridColumn);
    procedure UniFormShow(Sender: TObject);
    procedure L2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure  carregaloteProducao(codigo:integer);
  procedure  IncluiItens();
  procedure  DeletaItens();
  procedure  RefreshBusca();
  procedure  RecalculaValorLote(pqtdelote:real);
  procedure  LimpaVars();
  end;

function frmENTREGALOTE: TfrmENTREGALOTE;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_procedures,
  untFrmPesquisaloteinterno, mkm_funcoes;

function frmENTREGALOTE: TfrmENTREGALOTE;
begin
  Result := TfrmENTREGALOTE(mm.GetFormInstance(TfrmENTREGALOTE));
end;

procedure TfrmENTREGALOTE.carregaloteProducao(codigo: integer);
begin

  SqlPesquisa('select * from LOTEINTERNO where codigo = ' + IntToStr(codigo));

  UniButtonEditplote.Text              := dm_rc.sqlBuscas.FindField('LOTE').AsString;
  UniButtonEditCODPRO.Text             := dm_rc.sqlBuscas.FindField('PRODUTO').AsString;
end;

procedure TfrmENTREGALOTE.DeletaItens;
begin
  try
    SqlPesquisa('select * from entrega_lote where codigo = ' + IntToStr(dm_rc.tbentregalote.FindField('CODIGO').AsInteger));
    executasql ('delete from entrega_lote   where codigo = ' + IntToStr(dm_rc.tbentregalote.FindField('CODIGO').AsInteger));

    dm_rc.sqlBuscas.first;
    while not dm_rc.sqlBuscas.Eof do
      begin
        CalculaLoteInterno (mm.varI_Code_Company,
                            dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger,
                            dm_rc.sqlBuscas.FindField('LOTE').AsString);

        dm_rc.sqlBuscas.Next;
      end;

    RefreshBusca();
  finally
    dm_rc.rc_ShowToaster( 'success', 'Lote Deletado com Sucesso' + ' !', false, 'pinItUp' );
  end;
end;

procedure TfrmENTREGALOTE.IncluiItens;
begin

  try
    TabelaEntregaLote('select * from entrega_lote where codigo = 0');

    dm_rc.fdqryentregalote.Append;
    dm_rc.fdqryentregalote.FindField('KEY').AsString         := Gera_Guid;
    dm_rc.fdqryentregalote.FindField('CODIGO').AsInteger     := Ultimo_Codigo('ENTREGA_LOTE','CODIGO',True);
    dm_rc.fdqryentregalote.FindField('MESTRE_ID').AsInteger  := mm.varCD_CODIGOENTREGA;
    dm_rc.fdqryentregalote.FindField('EMPRESA').AsInteger    := MM.varI_Code_Company;
    dm_rc.fdqryentregalote.FindField('NUMERO').AsInteger     := mm.varE_numero_entrega;
    dm_rc.fdqryentregalote.FindField('PRODUTO').AsInteger    := mm.varE_produto_entrega;
    dm_rc.fdqryentregalote.FindField('DOCUMENTO').AsInteger  := mm.varE_documento_entrega;
    dm_rc.fdqryentregalote.FindField('SEQUENCIA').AsInteger  := mm.varE_sequencia_entrega;
    dm_rc.fdqryentregalote.FindField('EMISSAO').AsDateTime   := UniDateTimePickerentreganemissao.DateTime;
    dm_rc.fdqryentregalote.FindField('QUANTIDADE').AsFloat   := UniFormattedNumberEditentregatotaldoc.Value;
    dm_rc.fdqryentregalote.FindField('LOTE').AsString        := UniButtonEditplote.Text;
    dm_rc.fdqryentregalote.FindField('PESOSACO').AsFloat     := UniFormattedNumberEditPESOSACO.Value;
    dm_rc.fdqryentregalote.Post;

    dm_rc.rc_ShowToaster( 'success', 'Gravado com Sucesso' + ' !', false, 'pinItUp' );

    CalculaLoteInterno (mm.varI_Code_Company,
                        mm.varE_produto_entrega,
                        UniButtonEditplote.Text);

    LimpaVars();
  except
    dm_rc.rc_ShowToaster( 'error', 'Erro na Gravação da Entrega' + ' !', false, 'pinItUp' );
  end;
end;

procedure TfrmENTREGALOTE.L2Click(Sender: TObject);
begin
  MM.varBPI_TIPOBUSCA := 'BPA';
  FrmPesquisaloteinterno.showmodal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
        carregaloteProducao(StrToInt(mm.varC_codigo_busca_lote));
     end;
   end);
end;

procedure TfrmENTREGALOTE.LimpaVars;
begin
  UniFormattedNumberEditentregatotaldoc.Value := 0;
  UniButtonEditplote.Text                     := '';
  UniFormattedNumberEditPESOSACO.Value        := 0;
  UniButtonEditCODPRO.Text                    := '';
end;

procedure TfrmENTREGALOTE.RecalculaValorLote(pqtdelote: real);
var
  sql   :string;
  total,
  entregue : real;
begin
  total   := 0;
  entregue:= 0;

  // busca pela entrega do produto
  sql := 'select entregue from entrega_produto where codigo = ' + IntToStr(mm.varCD_CODIGOENTREGA);
  if SqlPesquisa(sql) then
    total := dm_rc.sqlBuscas.FindField('ENTREGUE').AsFloat;
  // busca pelo entrega do lote
  sql := 'select sum(quantidade) as quantidade from entrega_lote where mestre_id = ' + IntToStr(mm.varCD_CODIGOENTREGA);
  if SqlPesquisa(sql) then
    entregue := dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;

  if (entregue > total) then
    begin
      dm_rc.rc_ShowToaster( 'error', 'Quantidade do lote excede da Quantidade entregue' + ' !', false, 'pinItUp' );
      Abort;
    end
  else
    if ((pqtdelote + entregue) > total) then
      begin
        dm_rc.rc_ShowToaster( 'error', 'Quantidade informada maior que a quantidade ja entregue' + ' !', false, 'pinItUp' );
        Abort;
      end;
end;

procedure TfrmENTREGALOTE.RefreshBusca;
var
  SQL : string;
begin
  SQL := ' select * from ENTREGA_LOTE ' +
         ' where mestre_id          = ' + IntToStr(mm.varCD_CODIGOENTREGA)    +
         ' order by emissao';

  SqlPesquisa(SQL);

  dm_rc.tbentregalote.Close;
  dm_rc.tbentregalote.CopyDataSet(dm_rc.sqlBuscas);
  dm_rc.tbentregalote.Open;
end;

procedure TfrmENTREGALOTE.UniBitBtn12Click(Sender: TObject);
begin
  if UniFormattedNumberEditentregatotaldoc.Value = 0 then
    begin
      dm_rc.rc_ShowToaster( 'error', 'Por favor, Informar um valor na QUANTIDADE do Lote' + ' !', false, 'pinItUp' );
      abort
    end;

  if UniFormattedNumberEditPESOSACO.Value = 0 then
    begin
      dm_rc.rc_ShowToaster( 'error', 'Por favor, Informar um valor no PESO do Lote' + ' !', false, 'pinItUp' );
      abort
    end;

  if UniButtonEditplote.Text = '' then
    begin
      dm_rc.rc_ShowToaster( 'error', 'Por favor, Informar um LOTE' + ' !', false, 'pinItUp' );
      abort
    end;

  RecalculaValorLote(UniFormattedNumberEditentregatotaldoc.Value);

  IncluiItens();
  RefreshBusca();
end;

procedure TfrmENTREGALOTE.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmENTREGALOTE.UniButtonEditploteButtonClick(Sender: TObject);
begin
  UniPopupMenulote.PopupBy( TUniButton( sender ) );
end;

procedure TfrmENTREGALOTE.UniDBGridEntregaCellClick(Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'exclui' then
    begin
      DeletaItens();
    end;
end;

procedure TfrmENTREGALOTE.UniFormResize(Sender: TObject);
begin
  frmENTREGALOTE.Height   := 372;
  frmENTREGALOTE.Width    := 563;

  with frmENTREGALOTE.Constraints do
    begin
      MaxWidth  := 563;
      MinWidth  := 563;
      MaxHeight := 372;
      MinHeight := 372;
    end;

  frmENTREGALOTE.Position := poScreenCenter;
end;

procedure TfrmENTREGALOTE.UniFormShow(Sender: TObject);
begin
  RefreshBusca();
  UniDateTimePickerentreganemissao.DateTime := Date;
end;

end.
