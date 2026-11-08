unit untFrmBAIXATITULOS;

interface

uses
  System.SysUtils, System.Classes, System.Math, Data.DB, Vcl.Controls,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniLabel,
  uniTimer, uniButton, uniBasicGrid, uniDBGrid, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Vcl.Forms, uniScrollBox, uniMemo, uniDBMemo, uniEdit,
  uniMultiItem, uniComboBox, uniDBEdit, uniDateTimePicker, uniDBDateTimePicker,
  FireDAC.Stan.Async, FireDAC.DApt,mkm_layout, uniSweetAlert;

type
  TfrmBAIXATITULO = class(TUniForm)
    memParcelas: TFDMemTable;
    dsParcelas: TDataSource;
    UniScrollBox1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    paCabecalho: TUniPanel;
    labTitulo: TUniLabel;
    dsMaster: TDataSource;
    sqlMaster: TFDQuery;
    memObs: TUniDBMemo;
    rcB2: TUniContainerPanel;
    UniLabel6: TUniLabel;
    dtpPagamento: TUniDateTimePicker;
    UniLabel7: TUniLabel;
    dtpBaixa: TUniDateTimePicker;
    UniLabel8: TUniLabel;
    edJuros: TUniFormattedNumberEdit;
    UniLabel9: TUniLabel;
    edPercTaxas: TUniFormattedNumberEdit;
    UniLabel10: TUniLabel;
    edTaxas: TUniFormattedNumberEdit;
    UniLabel11: TUniLabel;
    edDesconto: TUniFormattedNumberEdit;
    rcBlab: TUniContainerPanel;
    UniLabel2: TUniLabel;
    cbxTotalParcial: TUniComboBox;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel3: TUniLabel;
    cbxTipo: TUniComboBox;
    UniLabel4: TUniLabel;
    rcSweetAlert: TUniSweetAlert;
    btnSair: TUniButton;
    btnGravar: TUniButton;
    UniLabel1: TUniLabel;
    edLkpPORTADORES: TUniDBEdit;
    edValor: TUniFormattedNumberEdit;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    FTotalNota, FTotalParcelas: Currency;
    FCarregando: Boolean;
    fiCodigo : Integer;
    fiTabela : string;
  public
    procedure PreparaBaixa( ACodigo: Integer; ATabela:string );
  end;

function frmBAIXATITULO: TfrmBAIXATITULO;

implementation

uses MainModule, untDM_RC, uniGUIDialogs, uniGUITypes;

{$R *.dfm}

function frmBAIXATITULO: TfrmBAIXATITULO;
begin
  Result:=TfrmBAIXATITULO(mm.GetFormInstance(TfrmBAIXATITULO));
end;


procedure TfrmBAIXATITULO.btnSairClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmBAIXATITULO.PreparaBaixa( ACodigo: Integer; ATabela:string );
begin
  fiCodigo := ACodigo;
  fiTabela := ATabela;
end;


procedure TfrmBAIXATITULO.btnGravarClick(Sender: TObject);
var
  cLog, cTipo : string;
  fValor, fAtual : Double;
begin
  if not btnGravar.Enabled then
    Exit;

  if edValor.Value <= 0 then
  begin
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Informe um VALOR maior que zero para a baixa!', 'warning' );
    edValor.SetFocus;
    Exit;
  end;

  fValor := edValor.Value;
  fAtual := sqlMaster.FieldByName( 'VALORATUAL' ).AsFloat;

  if ( cbxTotalParcial.Text = 'Total' ) and ( fValor > fAtual ) then
  begin
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO',
      'Na baixa TOTAL o valor não pode ser maior que o Valor Atual (' +
      FormatFloat( '#,##0.00', fAtual ) + ')!', 'warning' );
    edValor.SetFocus;
    Exit;
  end;

  dm_rc.rc_ShowYesNo( 'CONFIRMA A BAIXA (' + cbxTotalParcial.Text + ') DESTE TÍTULO?' );
  if not mm.varB_Yes then
    Exit;

  if not ( sqlMaster.State in [ dsEdit, dsInsert ] ) then
    sqlMaster.Edit;

  // valores da baixa
  if cbxTotalParcial.Text = 'Total' then
    sqlMaster.FieldByName( 'VALORPAGO' ).AsFloat := fValor
  else
    sqlMaster.FieldByName( 'VALORPAGO' ).AsFloat :=
      sqlMaster.FieldByName( 'VALORPAGO' ).AsFloat + fValor;

  // JUROS/TAXAS/DESCONTO/PAGAMENTO: edits NÃO-DB -> gravação explicita
  sqlMaster.FieldByName( 'VALORJUROS' ).AsFloat     := edJuros.Value;
  sqlMaster.FieldByName( 'VALORTAXAS' ).AsFloat     := edTaxas.Value;
  sqlMaster.FieldByName( 'VALORDESCONTOS' ).AsFloat := edDesconto.Value;
  if dtpPagamento.DateTime > 0 then
    sqlMaster.FieldByName( 'PAGAMENTO' ).AsDateTime := dtpPagamento.DateTime
  else
    sqlMaster.FieldByName( 'PAGAMENTO' ).AsDateTime := dtpBaixa.DateTime;
  // PORTADOR/OBSERVACOES ficam por conta do lookup (hint) e do memo DB.

  // log padrao: data/hora + empresa (ajustar p/ incluir login do usuario se desejar)
  cLog  := FormatDateTime( 'dd/mm/yyyy hh:nn', Now ) + ' EMP ' + IntToStr( mm.varI_Code_Company );
  cTipo := 'D';
  if cbxTipo.Text = 'Crédito' then
    cTipo := 'C';

  if cbxTotalParcial.Text = 'Total' then
  begin
    sqlMaster.FieldByName( 'SITUACAO' ).AsString   := 'Pago';
    sqlMaster.FieldByName( 'VALORATUAL' ).AsFloat  := 0;
    sqlMaster.FieldByName( 'LOGBAIXA' ).AsString   :=
      Copy( 'BAIXA TOTAL [' + cTipo + '] ' + cLog, 1,
            sqlMaster.FieldByName( 'LOGBAIXA' ).Size );
  end
  else
  begin
    sqlMaster.FieldByName( 'VALORATUAL' ).AsFloat  := fAtual - fValor;
    sqlMaster.FieldByName( 'LOGPARCIAL' ).AsString :=
      Copy( 'BAIXA PARCIAL [' + cTipo + '] VALOR ' + FormatFloat( '#,##0.00', fValor ) +
            ' ' + cLog, 1, sqlMaster.FieldByName( 'LOGPARCIAL' ).Size );
  end;

  sqlMaster.Post;
  if sqlMaster.ApplyUpdates( -1 ) > 0 then
  begin
    sqlMaster.CancelUpdates;
    dm_rc.rc_ShowSweetAlert( 'ERRO', 'Não foi possível gravar a baixa! Operação cancelada.', 'error' );
    Exit;
  end;
  sqlMaster.CommitUpdates;

  dm_rc.rc_ShowToaster( 'success', 'Baixa efetuada com sucesso!', false, 'slideLeftRightFade' );
  ModalResult := mrOK;
end;

procedure TfrmBAIXATITULO.UniFormBeforeShow(Sender: TObject);
begin

  // defaults
  cbxTotalParcial.ItemIndex := 0;
  cbxTipo.ItemIndex         := 0;
  dtpBaixa.DateTime         := Date;
  btnGravar.Enabled         := True;

  sqlMaster.Close;
  sqlMaster.SQL.Text := 'SELECT * FROM ' + fiTabela + ' WHERE CODIGO = :CODIGO';
  sqlMaster.ParamByName( 'CODIGO' ).AsInteger := fiCodigo;

  if not dm_rc.rc_OpenQuery( sqlMaster ) then
  begin
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não foi possível abrir o título para baixa!', 'warning' );
    btnGravar.Enabled := False;
    Exit;
  end;

  // título já baixado não baixa de novo
  if sqlMaster.FieldByName( 'SITUACAO' ).AsString = 'Pago' then
  begin
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Este título JÁ ESTÁ BAIXADO (Situacao = Pago)!', 'warning' );
    btnGravar.Enabled := False;
    Exit;
  end;

  sqlMaster.Edit;

  // lookup do portador (mecanismo nativo do framework)
  dm_rc.rc_RenderLookUpControls( Self );
  dm_rc.rc_LookUpUpdateData( Self, nil, false );

  // valor sugerido = valor atual do título
  edValor.Value := sqlMaster.FieldByName( 'VALORATUAL' ).AsFloat;

  // data de pagamento: mostra a do título ou hoje (edit NÃO-DB, grava via código)
  if not sqlMaster.FieldByName( 'PAGAMENTO' ).IsNull then
    dtpPagamento.DateTime := sqlMaster.FieldByName( 'PAGAMENTO' ).AsDateTime
  else
    dtpPagamento.DateTime := Date;

  rc_RenderLayout( Self, true, true, true );

end;

procedure TfrmBAIXATITULO.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false, false );
  cbxTotalParcial.ItemIndex := 0;
  cbxTipo.ItemIndex         := 0;
end;

procedure TfrmBAIXATITULO.UniFormDestroy(Sender: TObject);
begin
    mm.varC_Form_Modal := nil;
end;

procedure TfrmBAIXATITULO.UniFormReady(Sender: TObject);
begin
//  Self.Width  := 717;
//  Self.Height := 458;
//  Self.Left   := ( UniSession.UniApplication.ScreenWidth  div 2 ) - ( Self.Width  div 2 );
//  Self.Top    := ( UniSession.UniApplication.ScreenHeight div 2 ) - ( Self.Height div 2 );
end;

procedure TfrmBAIXATITULO.UniFormResize(Sender: TObject);
begin
//   dm_rc.rc_ResizeBlocks( self );
end;

end.
