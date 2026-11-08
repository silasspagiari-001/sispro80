unit untFrmSUBPLANOCONTAS; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0 (form auxiliar TUniForm - não é frame CRUD)
     - executasql('delete ...')                  -> dm_rc.rc_DeleteRecord( tabela, ' where ...' )
     - Ultimo_Codigo('SUB_PLANOCONTAS','CODIGO') -> dm_rc.rc_GetNextID( mm.varB_IsNot_API, 'SUB_PLANOCONTAS', 'CODIGO', '' )
     - SqlPesquisa(...) + dm_rc.sqlBuscas        -> reaproveita dm_rc.fdqrysubplanocontas + dm_rc.rc_OpenQuery
     - gera_log(...)                             -> dm_rc.rc_ConsoleLog(...)
     - untDM_RC -> untdm_rc; mkm_procedures/str_func removidos do uses
[EN] RADCore 3.0 -> 8.0 conversion (standalone TUniForm - not a CRUD frame)
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniButton, uniBitBtn, uniLabel,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel;

type
  TFrmSUBPLANOCONTAS = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    UniDBGridEntrega: TUniDBGrid;
    rcBlock20: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    UniBitBtn12: TUniBitBtn;
    edSearchCRUDconteudo: TUniEdit;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    btnfechar: TUniBitBtn;
    procedure btnfecharClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniBitBtn12Click(Sender: TObject);
    procedure UniDBGridEntregaCellClick(Column: TUniDBGridColumn);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure Acoes(const status:string;scodigo:integer);
  procedure Buscar();
  function  Sequencia(const mestre:integer) : integer;
  end;

function FrmSUBPLANOCONTAS: TFrmSUBPLANOCONTAS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, mkm_layout, mkm_funcoes;

function FrmSUBPLANOCONTAS: TFrmSUBPLANOCONTAS;
begin
  Result := TFrmSUBPLANOCONTAS(mm.GetFormInstance(TFrmSUBPLANOCONTAS));
end;

procedure TFrmSUBPLANOCONTAS.btnfecharClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFrmSUBPLANOCONTAS.Buscar();
begin
  dm_rc.tbsubplanocontas.Close;
  dm_rc.tbsubplanocontas.Open;

  dm_rc.fdqrysubplanocontas.Close;
  dm_rc.fdqrysubplanocontas.SQL.Clear;
  dm_rc.fdqrysubplanocontas.SQL.Text := 'select * from ' + dm_rc.rc_DBSchema + 'SUB_PLANOCONTAS where mestre_id = ' + QuotedStr(mm.varcI_code_planosub) + ' order by codigo';
  dm_rc.rc_OpenQuery( dm_rc.fdqrysubplanocontas );

  dm_rc.fdqrysubplanocontas.First;
  while not dm_rc.fdqrysubplanocontas.eof do
    begin
      dm_rc.tbsubplanocontas.Append;
      dm_rc.tbsubplanocontas.FindField('CODIGO').AsInteger      := dm_rc.fdqrysubplanocontas.FindField('CODIGO').AsInteger;
      dm_rc.tbsubplanocontas.FindField('SEQUENCIA').AsInteger   := dm_rc.fdqrysubplanocontas.FindField('SEQUENCIA').AsInteger;
      dm_rc.tbsubplanocontas.FindField('DESCRICAO').AsString    := dm_rc.fdqrysubplanocontas.FindField('DESCRICAO').AsString;
      dm_rc.tbsubplanocontas.FindField('MESTRE_ID').AsString    := mm.varcI_code_planosub;
      dm_rc.tbsubplanocontas.Post;

      dm_rc.fdqrysubplanocontas.Next;
    end;

end;

procedure TFrmSUBPLANOCONTAS.Acoes(const status: string; scodigo: integer);
begin
  if status = 'inclui' then
    begin
      dm_rc.fdqrysubplanocontas.Close;
      dm_rc.fdqrysubplanocontas.SQL.Clear;
      dm_rc.fdqrysubplanocontas.SQL.Text := 'select * from ' + dm_rc.rc_DBSchema + 'SUB_PLANOCONTAS where codigo = 0';
      dm_rc.rc_OpenQuery( dm_rc.fdqrysubplanocontas );

      dm_rc.fdqrysubplanocontas.Append;
      dm_rc.fdqrysubplanocontas.FindField('KEY').AsString        := Gera_Guid;
      dm_rc.fdqrysubplanocontas.FindField('CODIGO').AsInteger    := dm_rc.rc_GetNextID( mm.varB_IsNot_API, 'SUB_PLANOCONTAS', 'CODIGO', '' ); //8.0.0.0
      dm_rc.fdqrysubplanocontas.FindField('MESTRE_ID').AsString  := mm.varcI_code_planosub;
      dm_rc.fdqrysubplanocontas.FindField('DESCRICAO').AsString  := edSearchCRUDconteudo.Text;
      dm_rc.fdqrysubplanocontas.FindField('SEQUENCIA').AsInteger := Sequencia(StrToInt(mm.varcI_code_planosub));
      dm_rc.fdqrysubplanocontas.Post;

      edSearchCRUDconteudo.Text := '';

      Buscar();
    end;

  if status = 'exclui' then
    begin
      //8.0.0.0
      if not dm_rc.rc_DeleteRecord( 'SUB_PLANOCONTAS', ' where codigo = ' + IntToStr(scodigo) ) then
         dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
      Buscar();
    end;
end;

function TFrmSUBPLANOCONTAS.Sequencia(const mestre:integer): integer;
begin
  //8.0.0.0 - sem SqlPesquisa/sqlBuscas: reaproveita fdqrysubplanocontas
  //(o Acoes('inclui') reabre o dataset e o Buscar() restaura a lista em seguida)
  dm_rc.fdqrysubplanocontas.Close;
  dm_rc.fdqrysubplanocontas.SQL.Clear;
  dm_rc.fdqrysubplanocontas.SQL.Text := 'select COUNT(coalesce(CODIGO,1)) + 1 as sequencia from ' + dm_rc.rc_DBSchema + 'sub_planocontas where mestre_id = ' + IntToStr(mestre);
  dm_rc.rc_OpenQuery( dm_rc.fdqrysubplanocontas );
  Result := dm_rc.fdqrysubplanocontas.FindField('sequencia').AsInteger;
end;

procedure TFrmSUBPLANOCONTAS.UniBitBtn12Click(Sender: TObject);
begin
  try
    Acoes('inclui',0);
  except
    on e: exception do dm_rc.rc_ConsoleLog('CRUD SUBPLANO ' + e.message); //8.0.0.0
  end;
end;

procedure TFrmSUBPLANOCONTAS.UniDBGridEntregaCellClick(
  Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'exclui' then
    begin
      Acoes('exclui',dm_rc.tbsubplanocontas.FindField('CODIGO').AsInteger);
    end;
end;

procedure TFrmSUBPLANOCONTAS.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true, true );
end;

procedure TFrmSUBPLANOCONTAS.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TFrmSUBPLANOCONTAS.UniFormResize(Sender: TObject);
begin
  FrmSUBPLANOCONTAS.Height   := 372;
  FrmSUBPLANOCONTAS.Width    := 563;

  with FrmSUBPLANOCONTAS.Constraints do
    begin
      MaxWidth  := 563;
      MinWidth  := 563;
      MaxHeight := 372;
      MinHeight := 372;
    end;

  FrmSUBPLANOCONTAS.Position := poScreenCenter;
end;

procedure TFrmSUBPLANOCONTAS.UniFormShow(Sender: TObject);
begin
  Buscar();
end;

initialization
  RegisterClass(TFrmSUBPLANOCONTAS);

end.
