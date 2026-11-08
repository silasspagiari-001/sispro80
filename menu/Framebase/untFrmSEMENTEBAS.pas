unit untFrmSEMENTEBAS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniLabel, uniEdit, uniDBEdit, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniDateTimePicker,
  uniDBDateTimePicker, uniMemo, uniDBMemo;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros);
  TfrmSEMENTEBAS = class(TUniForm)
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paNAE: TUniContainerPanel;
    btnNewReg: TUniBitBtn;
    btnEditReg: TUniBitBtn;
    btnDeleteReg: TUniBitBtn;
    paGC: TUniContainerPanel;
    btnSaveReg: TUniBitBtn;
    btnCancelReg: TUniBitBtn;
    UniContainerPanel1: TUniContainerPanel;
    UniPageControl: TUniPageControl;
    UniTabSheetdadosbas: TUniTabSheet;
    FDQryFiltro: TFDQuery;
    dsfiltro: TDataSource;
    dscrud: TDataSource;
    FDQryCad: TFDQuery;
    RCprin: TUniContainerPanel;
    RC1: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel18: TUniLabel;
    RC5: TUniContainerPanel;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniLabel1: TUniLabel;
    RC6: TUniContainerPanel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniLabel4: TUniLabel;
    RC7: TUniContainerPanel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel2: TUniLabel;
    RC8: TUniContainerPanel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel5: TUniLabel;
    RC9: TUniContainerPanel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel6: TUniLabel;
    RC10: TUniContainerPanel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniLabel7: TUniLabel;
    RC11: TUniContainerPanel;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniLabel8: TUniLabel;
    UniContainerPanel9: TUniContainerPanel;
    UniLabel9: TUniLabel;
    RC12: TUniContainerPanel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    UniLabel10: TUniLabel;
    RC15: TUniContainerPanel;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    UniLabel11: TUniLabel;
    RC16: TUniContainerPanel;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniLabel12: TUniLabel;
    RC17: TUniContainerPanel;
    UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit;
    UniLabel13: TUniLabel;
    RC13: TUniContainerPanel;
    UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit;
    UniLabel14: TUniLabel;
    RC14: TUniContainerPanel;
    UniDBFormattedNumberEdit11: TUniDBFormattedNumberEdit;
    UniLabel15: TUniLabel;
    UniContainerPanel16: TUniContainerPanel;
    UniDBFormattedNumberEdit12: TUniDBFormattedNumberEdit;
    UniLabel16: TUniLabel;
    UniContainerPanel17: TUniContainerPanel;
    UniDBFormattedNumberEdit13: TUniDBFormattedNumberEdit;
    UniLabel17: TUniLabel;
    UniContainerPanel18: TUniContainerPanel;
    UniDBFormattedNumberEdit14: TUniDBFormattedNumberEdit;
    UniLabel19: TUniLabel;
    UniContainerPanel19: TUniContainerPanel;
    UniDBFormattedNumberEdit15: TUniDBFormattedNumberEdit;
    UniLabel20: TUniLabel;
    UniContainerPanel20: TUniContainerPanel;
    UniLabel21: TUniLabel;
    RC2: TUniContainerPanel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel22: TUniLabel;
    RC3: TUniContainerPanel;
    UniDBEdit12: TUniDBEdit;
    RC4: TUniContainerPanel;
    UniDBDateTimePicker3: TUniDBDateTimePicker;
    UniLabel23: TUniLabel;
    UniLabel24: TUniLabel;
    UniTabSheet1: TUniTabSheet;
    UniContainerPanel23: TUniContainerPanel;
    UniDBMemoobs: TUniDBMemo;
    UniTabSheetinfestantes: TUniTabSheet;
    UniContainerPanel24: TUniContainerPanel;
    UniDBMemo1: TUniDBMemo;
    UniDBMemo2: TUniDBMemo;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel27: TUniLabel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel26: TUniLabel;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel25: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure btnCloseFormClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;
    cFormModal         : TUniForm;

  procedure SetBut(Acao: TAcaoCrud);

  end;

function frmSEMENTEBAS: TfrmSEMENTEBAS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, System.TypInfo, mkm_funcoes,
  mkm_func_web, mkm_procedures;

function frmSEMENTEBAS: TfrmSEMENTEBAS;
begin
  Result := TfrmSEMENTEBAS(mm.GetFormInstance(TfrmSEMENTEBAS));
end;

procedure TfrmSEMENTEBAS.btnCancelRegClick(Sender: TObject);
begin
  UniPageControl.ActivePage := UniTabSheetdadosbas;
  FDQryFiltro.Close;

  if  FDQryFiltro.IsEmpty then
      SetBut(tpListaVazia)
  else
      SetBut(tpListacomRegistros);

   FDQryCad.Close ;
end;

procedure TfrmSEMENTEBAS.btnCloseFormClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmSEMENTEBAS.btnDeleteRegClick(Sender: TObject);
begin
  FDQryCad.Delete;

  if  FDQryFiltro.Active then
    FDQryFiltro.Refresh;
end;

procedure TfrmSEMENTEBAS.btnEditRegClick(Sender: TObject);
  var i : integer; Cmp:String;
    S, R: Integer;
begin
  UniPageControl.ActivePage := UniTabSheetdadosbas;
  SetBut(tpAlterar);
  mm.FDTransaction.StartTransaction;
  Try
    FDQryCad.Close;
   for i := 0 to  FDQryCad.Params.Count - 1 do
   begin
      Cmp :=  FDQryCad.Params[i].Name;
      FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
   end;
    FDQryCad.Open;

    FDQryCad.Edit;

  Except
   Abort ;
  End ;
end;

procedure TfrmSEMENTEBAS.btnNewRegClick(Sender: TObject);
  var i : integer; Cmp:String;
    S, R: Integer;
begin

  //pgBaseCadControl.ActivePage := tabRegister;

  SetBut(tpIncluir);
  mm.FDTransaction.StartTransaction;
  try
    FDQryCad.Close ;
    for i := 0 to  FDQryCad.Params.Count - 1 do
    begin
      Cmp :=  FDQryCad.Params[i].Name;
       FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
    end;
     FDQryCad.Open;
  Except
     FDQryCad.Params[0].AsInteger := -1 ;
     FDQryCad.Open;
  End;


  if not( FDQryCad.Active) then
      FDQryCad.Open;

  FDQryCad.Insert;
  FDQryCad.FindField('CODIGO').AsInteger    := 0;
  FDQryCad.FindField('EMISSAO').AsDateTime  := Date;

end;

procedure TfrmSEMENTEBAS.btnSaveRegClick(Sender: TObject);
begin
  UniPageControl.ActivePage := UniTabSheetdadosbas;
  if FDQryCad.State in [dsInsert,dsEdit] then
   Begin
     if FDQryCad.State in [dsInsert] then
       begin
         FDQryCad.FindField('MESTRE_ID').AsInteger := mm.varI_Code_Codigo_Semente;
         FDQryCad.FindField('EMPRESA').AsInteger   := mm.varI_Code_Company;
         FDQryCad.FindField('CODIGO').AsInteger    := Ultimo_Codigo(FDQryCad.UpdateOptions.UpdateTableName,'CODIGO',True);
         FDQryCad.FindField('KEY').AsString        := Gera_Guid;
       end;

     FDQryCad.Post;

     mm.FDTransaction.CommitRetaining;
     MM.FDTransaction.Commit;


     try
       dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success' , false );
     except
       dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE!' , 'error' , false );
     end;

   End;

  if  FDQryFiltro.Active then
    FDQryFiltro.Refresh;

  if  FDQryFiltro.IsEmpty then
   SetBut(tpListaVazia)
  Else
   SetBut(tpListacomRegistros);

end;

procedure TfrmSEMENTEBAS.SetBut(Acao: TAcaoCrud);
var s:string ;
begin
  s := GetEnumName(TypeInfo(TAcaoCrud),integer(Acao));

  // Controle dos botoes
  if acao in [tpIncluir,tpAlterar,tpExcluir] then
     begin
       btnNewReg.Visible     := false;
       btnEditReg.Visible    := false;
       btnDeleteReg.Visible  := false;
       btnCancelReg.Visible  := true;
       btnSaveReg.Visible    := true;
     end
   else if acao in [tpListaVazia] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
      end
    else if acao in [tpListacomRegistros] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := true;
        btnDeleteReg.Visible  := true;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
       end;
end;

procedure TfrmSEMENTEBAS.UniFormCreate(Sender: TObject);
begin
  cFormModal := mm.varC_Form_Modal;
end;

procedure TfrmSEMENTEBAS.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmSEMENTEBAS.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
  dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure TfrmSEMENTEBAS.UniFormShow(Sender: TObject);
  var i : integer; Cmp:String;
begin
  UniPageControl.ActivePage := UniTabSheetdadosbas;

  FDQryFiltro.Close;
  FDQryFiltro.sql.Clear;
  FDQryFiltro.SQL.Text := 'SELECT * FROM SEMENTES_BAS WHERE MESTRE_ID = ' + IntToStr(mm.varI_Code_Codigo_Semente);
  FDQryFiltro.Open;

  try
    FDQryCad.Close ;
    for i := 0 to  FDQryCad.Params.Count - 1 do
    begin
      Cmp :=  FDQryCad.Params[i].Name;
       FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
    end;
     FDQryCad.Open;
  Except
     FDQryCad.Params[0].AsInteger := -1 ;
     FDQryCad.Open;
  End;

  if not( FDQryCad.Active) then
    begin
      FDQryCad.Open;
    end;

  setbut(tpListacomRegistros);

end;

end.
