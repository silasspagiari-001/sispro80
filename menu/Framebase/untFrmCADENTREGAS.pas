unit untFrmCADENTREGAS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniBasicGrid, uniDBGrid, uniLabel, uniDateTimePicker, uniEdit;

type
  TfrmCADENTREGAS = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    UniContainerPanel1: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniDBGridEntrega: TUniDBGrid;
    UniDateTimePickerentreganemissao: TUniDateTimePicker;
    UniLabel108: TUniLabel;
    UniFormattedNumberEditentregatotaldoc: TUniFormattedNumberEdit;
    UniLabel110: TUniLabel;
    UniBitBtn12: TUniBitBtn;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniDBGridEntregaCellClick(Column: TUniDBGridColumn);
    procedure UniBitBtn12Click(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;
    cFormModal         : TUniForm;

    procedure RefreshBusca();
    procedure DeletaItens();
    procedure IncluiItens();
  end;

function frmCADENTREGAS: TfrmCADENTREGAS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_procedures, mkm_funcoes,
  untFrmIMPRESSAOENTREGAPARCIAL, untfrmENTREGALOTE;

function frmCADENTREGAS: TfrmCADENTREGAS;
begin
  Result := TfrmCADENTREGAS(mm.GetFormInstance(TfrmCADENTREGAS));
end;

procedure TfrmCADENTREGAS.DeletaItens;
var
  SQL : string;
begin
  try
    SqlPesquisa(' select * from entrega_lote    where mestre_id = ' + IntToStr(dm_rc.tbrelacaoentrega.FindField('CODIGO').AsInteger));

    executasql (' delete from entrega_produto where codigo    = ' + IntToStr(dm_rc.tbrelacaoentrega.FindField('CODIGO').AsInteger));
    executasql (' delete from entrega_lote    where mestre_id = ' + IntToStr(dm_rc.tbrelacaoentrega.FindField('CODIGO').AsInteger));

    dm_rc.sqlBuscas.First;
    while not dm_rc.sqlBuscas.Eof do
      begin
        CalculaLoteInterno (mm.varI_Code_Company,
                            dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger,
                            dm_rc.sqlBuscas.FindField('LOTE').AsString);

        dm_rc.sqlBuscas.Next;
      end;

    RefreshBusca();
  finally
    CalculaEntregaItens(mm.varI_Code_Company,mm.varE_numero_entrega,mm.varE_sequencia_entrega,mm.varE_documento_entrega,mm.varE_produto_entrega);
  end;
end;

procedure TfrmCADENTREGAS.IncluiItens;
begin
  try
    TabelaEntregaProduto('select * from entrega_produto where codigo = 0');

    dm_rc.fdqryentregaproduto.Append;
    dm_rc.fdqryentregaproduto.FindField('KEY').AsString         := Gera_Guid;
    dm_rc.fdqryentregaproduto.FindField('CODIGO').AsInteger     := Ultimo_Codigo('ENTREGA_PRODUTO','CODIGO',True);
    dm_rc.fdqryentregaproduto.FindField('EMPRESA').AsInteger    := MM.varI_Code_Company;
    dm_rc.fdqryentregaproduto.FindField('NUMERO').AsInteger     := mm.varE_numero_entrega;
    dm_rc.fdqryentregaproduto.FindField('PRODUTO').AsInteger    := mm.varE_produto_entrega;
    dm_rc.fdqryentregaproduto.FindField('DESCRICAO').AsString   := Acha_Item('PRODUTOS',IntToStr(mm.varE_produto_entrega));
    dm_rc.fdqryentregaproduto.FindField('DOCUMENTO').AsInteger  := mm.varE_documento_entrega;
    dm_rc.fdqryentregaproduto.FindField('SEQUENCIA').AsInteger  := mm.varE_sequencia_entrega;
    dm_rc.fdqryentregaproduto.FindField('EMISSAO').AsDateTime   := UniDateTimePickerentreganemissao.DateTime;
    dm_rc.fdqryentregaproduto.FindField('ENTREGUE').AsFloat     := UniFormattedNumberEditentregatotaldoc.Value;
    dm_rc.fdqryentregaproduto.FindField('LOTE').AsString        := mm.varI_Code_Lote_Lotesemente;
    dm_rc.fdqryentregaproduto.FindField('BOLETIM').AsString     := mm.varI_Code_Lote_Boletimsemente;
    dm_rc.fdqryentregaproduto.FindField('TERMO').AsString       := mm.varI_Code_Lote_Termosemente;
    dm_rc.fdqryentregaproduto.FindField('PESOSACO').AsFloat     := dm_rc.tbitensmoventrega.FindField('PESOSACO').AsFloat;
    dm_rc.fdqryentregaproduto.FindField('NOTA').AsString        := dm_rc.tbitensmoventrega.FindField('NUMERO').AsString;
    dm_rc.fdqryentregaproduto.Post;

    CalculaEntregaItens(mm.varI_Code_Company,mm.varE_numero_entrega,mm.varE_sequencia_entrega,mm.varE_documento_entrega,mm.varE_produto_entrega);
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI GRAVAR ' , 'error');
  end;
end;

procedure TfrmCADENTREGAS.RefreshBusca;
var
  SQL : string;
begin
  SQL := ' select codigo,emissao, numero, sequencia, produto, descricao, entregue, pesosaco, nota from ENTREGA_PRODUTO ' +
         ' where produto   = ' + IntToStr(mm.varE_produto_entrega)    +
         ' and   numero    = ' + IntToStr(mm.varE_numero_entrega)     +
         ' and   documento = ' + IntToStr(mm.varE_documento_entrega)  +
         ' and   sequencia = ' + IntToStr(mm.varE_sequencia_entrega)  +
         ' and   empresa   = ' + IntToStr(mm.varI_Code_Company)       +
         ' order by emissao';

  SqlPesquisa(SQL);

  dm_rc.tbrelacaoentrega.Close;
  dm_rc.tbrelacaoentrega.CopyDataSet(dm_rc.sqlBuscas);
  dm_rc.tbrelacaoentrega.Open;

end;

procedure TfrmCADENTREGAS.UniBitBtn12Click(Sender: TObject);
begin
  IncluiItens();
  RefreshBusca();
end;

procedure TfrmCADENTREGAS.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmCADENTREGAS.UniDBGridEntregaCellClick(Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'exclui' then
    begin
      DeletaItens();
    end;

  if Column.FieldName = 'opcoes' then
    begin
      mm.varCD_PRODUTOENTREGA:= dm_rc.tbrelacaoentrega.FindField('PRODUTO').AsInteger;
      mm.varCD_CODIGOENTREGA := dm_rc.tbrelacaoentrega.FindField('CODIGO').AsInteger;
      frmENTREGALOTE.showmodal();

      mm.varCD_CODIGOENTREGA := 0;
      mm.varCD_PRODUTOENTREGA:= 0;
    end;
end;

procedure TfrmCADENTREGAS.UniFormCreate(Sender: TObject);
begin
//  cFormModal := mm.varC_Form_Modal;
end;

procedure TfrmCADENTREGAS.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmCADENTREGAS.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
  dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure TfrmCADENTREGAS.UniFormResize(Sender: TObject);
begin
  frmCADENTREGAS.Height   := 372;
  frmCADENTREGAS.Width    := 563;

  with frmCADENTREGAS.Constraints do
    begin
      MaxWidth  := 563;
      MinWidth  := 563;
      MaxHeight := 372;
      MinHeight := 372;
    end;

  frmCADENTREGAS.Position := poScreenCenter;
end;

procedure TfrmCADENTREGAS.UniFormShow(Sender: TObject);
begin
  RefreshBusca();
  UniDateTimePickerentreganemissao.DateTime   := date;
  UniFormattedNumberEditentregatotaldoc.Value := 0;
end;

end.
