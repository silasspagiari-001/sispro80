unit untFrmCADCHEQUES_HISTORICO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniBasicGrid, uniDBGrid, uniLabel, uniEdit, uniDateTimePicker, uniMultiItem,
  uniComboBox;

type
  Tfrmcadcheques_historico = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    UniDBGridEntrega: TUniDBGrid;
    UniEditobs: TUniEdit;
    UniLabel108: TUniLabel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniDateTimePickedata: TUniDateTimePicker;
    cbxSearchCRUDField2: TUniComboBox;
    UniLabel2: TUniLabel;
    UniBitBtn12: TUniBitBtn;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniFormattedNumberEditvlr: TUniFormattedNumberEdit;
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniBitBtn12Click(Sender: TObject);
    procedure UniDBGridEntregaCellClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshBusca();
    procedure IncluiItens();
    procedure DeletaItens();
    procedure AtualizatabelaMestre(mestre:integer);
    function  ultimoChq(mestre:integer):integer;
  end;

function frmcadcheques_historico: Tfrmcadcheques_historico;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_procedures, mkm_funcoes,
  mkm_func_web;

function frmcadcheques_historico: Tfrmcadcheques_historico;
begin
  Result := Tfrmcadcheques_historico(mm.GetFormInstance(Tfrmcadcheques_historico));
end;

procedure Tfrmcadcheques_historico.AtualizatabelaMestre(mestre: integer);
var
  logalteracao : string;
begin
  logalteracao := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);

  SqlPesquisa('select first 1 * from CHEQUES_HISTORICO where mestre_id = ' + IntToStr(mestre) + ' order by sequencia desc');

  if dm_rc.sqlBuscas.RecordCount > 0 then
    begin
      if dm_rc.sqlBuscas.FindField('STATUS').AsString = 'Compensado' then
        begin
          executasql('update cheques set baixa = ' + QuotedStr(DataPonto(DateToStr(dm_rc.sqlBuscas.FindField('DATA').AsDateTime)))  +
                     ',                 status = ' + QuotedStr(dm_rc.sqlBuscas.FindField('STATUS').AsString)                        +
                     ',           logalteracao = ' + QuotedStr(logalteracao)                                                        +
                     'where             codigo = ' + IntToStr(mestre));
        end
      else
        begin
          executasql('update cheques set status = ' + QuotedStr(dm_rc.sqlBuscas.FindField('STATUS').AsString)                        +
                     ',            logalteracao = ' + QuotedStr(logalteracao)                                                        +
                     'where              codigo = ' + IntToStr(mestre));
        end;
    end
  else
    begin
      executasql('update cheques set baixa = null ' +
                 ',                 status = ' + QuotedStr('Aberto')                                                            +
                 ',           logalteracao = ' + QuotedStr(logalteracao)                                                        +
                 'where             codigo = ' + IntToStr(mestre));
    end;
end;

procedure Tfrmcadcheques_historico.DeletaItens;
begin
  executasql('DELETE FROM CHEQUES_HISTORICO WHERE CODIGO = ' + IntToStr(DM_RC.tbhistoricocheque.FindField('CODIGO').AsInteger));
  RefreshBusca();
end;

procedure Tfrmcadcheques_historico.IncluiItens;
begin
  TabelaChequeHistorico('select * from cheques_historico where codigo = 0');

  dm_rc.fdqrychequeshistorico.Append;
  dm_rc.fdqrychequeshistorico.FindField('KEY').AsString          := Gera_Guid;
  dm_rc.fdqrychequeshistorico.FindField('EMPRESA').AsInteger     := MM.varI_Code_Company;
  dm_rc.fdqrychequeshistorico.FindField('MESTRE_ID').AsInteger   := MM.varC_cheques_codigo;
  dm_rc.fdqrychequeshistorico.FindField('CODIGO').AsInteger      := Ultimo_Codigo('CHEQUES_HISTORICO','CODIGO',True);
  dm_rc.fdqrychequeshistorico.FindField('STATUS').AsString       := cbxSearchCRUDField2.Text;
  dm_rc.fdqrychequeshistorico.FindField('OBSERVACAO').AsString   := UniEditobs.Text;
  dm_rc.fdqrychequeshistorico.FindField('DATA').AsDateTime       := UniDateTimePickedata.DateTime;
  dm_rc.fdqrychequeshistorico.FindField('SEQUENCIA').AsInteger   := ultimoChq(MM.varC_cheques_codigo);
  dm_rc.fdqrychequeshistorico.FindField('VALOR').AsFloat         := UniFormattedNumberEditvlr.Value;
  dm_rc.fdqrychequeshistorico.Post;

  if cbxSearchCRUDField2.Text = 'Compensado' then
    begin
      executasql(' UPDATE CHEQUES SET STATUS = ' + QuotedStr(cbxSearchCRUDField2.Text)              + ',' +
                 ' BAIXA                     = ' + QuotedStr(DataPonto(DateToStr(UniDateTimePickedata.DateTime)))  +
                 ' WHERE CODIGO              = ' + IntToStr(MM.varC_cheques_codigo));
    end
  else
    executasql('UPDATE CHEQUES SET STATUS = ' + QuotedStr(cbxSearchCRUDField2.Text) + ' WHERE CODIGO = ' + IntToStr(MM.varC_cheques_codigo));


  UniEditobs.Text               := '';
  UniDateTimePickedata.DateTime := Date;
  cbxSearchCRUDField2.Text      := '';

  RefreshBusca();
end;

procedure Tfrmcadcheques_historico.RefreshBusca;
var
  SQL : string;
begin
  SQL := ' select codigo, data, observacao, status, sequencia, valor from CHEQUES_HISTORICO '+
         ' where mestre_id   = ' + IntToStr(mm.varC_cheques_codigo)        +
         ' and   empresa     = ' + IntToStr(mm.varI_Code_Company)          +
         ' order by data, sequencia';

  SqlPesquisa(SQL);

  dm_rc.tbhistoricocheque.Close;
  dm_rc.tbhistoricocheque.CopyDataSet(dm_rc.sqlBuscas);
  dm_rc.tbhistoricocheque.Open;

end;

function Tfrmcadcheques_historico.ultimoChq(mestre:integer): integer;
begin
  SqlPesquisa('select coalesce(count(sequencia),0) + 1 contagem from cheques_historico where mestre_id = ' + IntToStr(mestre));
  Result :=  dm_rc.sqlBuscas.FindField('contagem').AsInteger;
end;

procedure Tfrmcadcheques_historico.UniBitBtn12Click(Sender: TObject);
begin
  if UniFormattedNumberEditvlr.Value = 0 then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATEN플O', 'INFORME UM VALOR PARA CONFIRMA플O' , 'warning' , false );
      abort;
    end;

  if UniEditobs.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATEN플O', 'INFORME UMA OBSERVA플O' , 'warning' , false );
      abort;
    end;

  if cbxSearchCRUDField2.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATEN플O', 'INFORME O STATUS DO CHEQUE' , 'warning' , false );
      abort;
    end;
  IncluiItens();
end;

procedure Tfrmcadcheques_historico.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrmcadcheques_historico.UniDBGridEntregaCellClick(
  Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'exclui' then
    begin
      DeletaItens();
      AtualizatabelaMestre(mm.varC_cheques_codigo);
    end;
end;

procedure Tfrmcadcheques_historico.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure Tfrmcadcheques_historico.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
  dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure Tfrmcadcheques_historico.UniFormShow(Sender: TObject);
begin
  RefreshBusca();
  UniEditobs.Text               := '';
  UniDateTimePickedata.DateTime := Date;
  cbxSearchCRUDField2.Text      := '';
end;

end.
