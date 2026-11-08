unit untFrmTransfereImportacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniMultiItem, uniComboBox,
  uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn, uniDateTimePicker, uniEdit,
  uniBasicGrid, uniDBGrid,mkm_funcoes;

type
  TfrmTransfereImportacao = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    cbxSearchCRUDFieldordem: TUniComboBox;
    UniLabelv1: TUniLabel;
    edSearchCRUDconteudo: TUniEdit;
    UniLabel1: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    UniLabel3: TUniLabel;
    btnLkpSearch: TUniBitBtn;
    UniContainerPanel1: TUniContainerPanel;
    dbgSearchCRUD: TUniDBGrid;
    paTotreg: TUniContainerPanel;
    labTotReg: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnLkpSearchClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;
    cFormModal         : TUniForm;
    procedure Seta_Grid(F_DATASOURCE:TDataSource;F_CAMPOS:array of String);
  end;

function frmTransfereImportacao: TfrmTransfereImportacao;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_anim, System.DateUtils,
  mkm_func_web;

function frmTransfereImportacao: TfrmTransfereImportacao;
begin
  Result := TfrmTransfereImportacao(mm.GetFormInstance(TfrmTransfereImportacao));
end;

procedure TfrmTransfereImportacao.btnLkpSearchClick(Sender: TObject);
var
  SQL: string;
  Documento: Integer;
begin
  case cbxSearchCRUDFieldordem.ItemIndex of
    0: Documento := 4;
    1: Documento := 3;
    2: Documento := 1;
  else
    Exit;
  end;

  SQL := 'SELECT M.CODIGO, M.NUMERO, M.SERIE, M.EMISSAO, M.PESSOA, ' +
         '       P.NOME, M.VLRTOTAL ' +
         'FROM MVMESTRE M ' +
         'INNER JOIN PESSOAS P ON P.CODIGO = M.PESSOA ' +
         'WHERE M.EMPRESA = :EMPRESA ' +
         '  AND M.EMISSAO BETWEEN :DATA_INICIAL AND :DATA_FINAL ' +
         '  AND M.DOCUMENTO = :DOCUMENTO ';

  if Trim(edSearchCRUDconteudo.Text) <> '' then
    SQL := SQL + ' AND M.NUMERO = :NUMERO ';

  SQL := SQL + ' ORDER BY M.NUMERO ';

  dm_rc.sqlPesquisa.Close;
  dm_rc.sqlPesquisa.SQL.Clear;
  dm_rc.sqlPesquisa.SQL.Add(SQL);
  dm_rc.sqlPesquisa.ParamByName('EMPRESA').AsInteger := mm.varI_Code_Company;
  dm_rc.sqlPesquisa.ParamByName('DATA_INICIAL').AsDate :=
    StrToDate(edSearchCRUDDtIni.Text);
  dm_rc.sqlPesquisa.ParamByName('DATA_FINAL').AsDate :=
    StrToDate(edSearchCRUDDtEnd.Text);
  dm_rc.sqlPesquisa.ParamByName('DOCUMENTO').AsInteger := Documento;

  if Trim(edSearchCRUDconteudo.Text) <> '' then
    dm_rc.sqlPesquisa.ParamByName('NUMERO').AsInteger :=
      StrToIntDef(Trim(edSearchCRUDconteudo.Text), 0);

  dm_rc.sqlPesquisa.Open;

  dbgSearchCRUD.Columns.Clear;
  Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGO|Código|50','1|NUMERO|NUMERO|100','2|SERIE|SER|50','3|EMISSAO|EMISSAO|100','4|PESSOA|PESSOA|50','5|NOME|NOME|200','6|VLRTOTAL|Total|100']);

  if not dm_rc.sqlPesquisa.IsEmpty then
    dm_rc.sqlPesquisa.Last;

  labTotReg.Caption := IntToStr(dm_rc.sqlpesquisa.RecordCount) +
    ' Registro(s) Encontrado(s).';

end;

procedure TfrmTransfereImportacao.dbgSearchCRUDDblClick(Sender: TObject);
begin
  mm.varI_Code_Documento_Controle := dm_rc.sqlPesquisa.FindField('CODIGO').AsInteger;
  ModalResult                     := mrOK;
end;

procedure TfrmTransfereImportacao.Seta_Grid(F_DATASOURCE: TDataSource;
  F_CAMPOS: array of String);
var
  M_PARAMS:TStringList;
  R       :Integer;
begin
  try
    dbgSearchCRUD.DataSource := F_DATASOURCE;
    for R:=0 to High(F_CAMPOS) do
      begin
        M_PARAMS := Explode(F_CAMPOS[R],'|');
        dbgSearchCRUD.Columns.Add;
        dbgSearchCRUD.Columns[StrToInt(M_PARAMS[0])].Visible         := True;
        dbgSearchCRUD.Columns[StrToInt(M_PARAMS[0])].FieldName       := M_PARAMS[1];
        dbgSearchCRUD.Columns[StrToInt(M_PARAMS[0])].Title.Caption   := M_PARAMS[2];
        dbgSearchCRUD.Columns[StrToInt(M_PARAMS[0])].Width           := StrToInt(M_PARAMS[3]);

        FreeAndNil(M_PARAMS);
      end;
  finally
    FreeAndNil(M_PARAMS);
  end;
end;

procedure TfrmTransfereImportacao.UniFormCreate(Sender: TObject);
begin
  cFormModal                         := mm.varC_Form_Modal;
  mm.varI_Code_Documento_Controle    := 0;
  cbxSearchCRUDFieldordem.ItemIndex  := 0;
  edSearchCRUDDtIni.Text             := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text             := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
end;

procedure TfrmTransfereImportacao.UniFormDestroy(Sender: TObject);
begin
  dm_rc.sqlPesquisa.Close;
    mm.varC_Form_Modal := nil;
end;

procedure TfrmTransfereImportacao.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TfrmTransfereImportacao.UniFormShow(Sender: TObject);
begin
  if Self.Tag = 0 then
  begin
      Self.Visible := True;
      Self.Top  := 0;

      rc_MoveAnimationForm( self,
                            self.left,
                            self.left,
                            self.top,
                            ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  ),
                            400,
                            1 ) ;
  end
  else
  begin
    Self.Visible := False;
    Self.Top  := -1000;
  end;
  Self.Visible := True;
end;

end.
