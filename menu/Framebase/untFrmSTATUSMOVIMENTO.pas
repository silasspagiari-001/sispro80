unit untFrmSTATUSMOVIMENTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn,
  uniLabel, uniDateTimePicker, uniMultiItem, uniComboBox, uniMemo;

type
  TfrmSTATUSMOVIMENTO = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    cbxstatus: TUniComboBox;
    edSearchCRUDDfechamento: TUniDateTimePicker;
    UniLabelDtIni: TUniLabel;
    UniLabel1: TUniLabel;
    UniBitBtn2: TUniBitBtn;
    UniLabel2: TUniLabel;
    UniMemoobs: TUniMemo;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;
    cFormModal         : TUniForm;
  procedure LimpaVars();
  procedure carregadados  (const numero,documento,empresa:integer);
  procedure gravamovimento(const numero,documento,empresa:integer);
  end;

function frmSTATUSMOVIMENTO: TfrmSTATUSMOVIMENTO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_procedures, mkm_func_web,
  Vcl.Clipbrd, uconsts;

function frmSTATUSMOVIMENTO: TfrmSTATUSMOVIMENTO;
begin
  Result := TfrmSTATUSMOVIMENTO(mm.GetFormInstance(TfrmSTATUSMOVIMENTO));
end;

procedure TfrmSTATUSMOVIMENTO.carregadados(const numero,documento,empresa:integer);
begin
  LimpaVars();
  if SqlPesquisa(' select * from mvmestre where numero = ' + IntToStr(numero)   +
                 ' and documento                       = ' + IntToStr(documento)+
                 ' and empresa                         = ' + IntToStr(empresa)) then
    begin
      UniMemoobs.Text                  := dm_rc.sqlBuscas.FindField('FECHAMENTO_OBS').AsString;
      cbxstatus.Text                   := dm_rc.sqlBuscas.FindField('FECHAMENTO_STATUS').AsString;
      edSearchCRUDDfechamento.DateTime := dm_rc.sqlBuscas.FindField('FECHAMENTO_DATA').AsDateTime;
    end;
end;

procedure TfrmSTATUSMOVIMENTO.gravamovimento(const numero,documento,empresa:integer);
begin
  try
    TabelaMvmestre(' select * from mvmestre where numero = ' + IntToStr(numero)     +
                   ' and documento                       = ' + IntToStr(documento)  +
                   ' and empresa                         = ' + IntToStr(empresa));

    dm_rc.FDQryMvmestre.Edit;
    dm_rc.FDQryMvmestre.FindField('FECHAMENTO_DATA').AsDateTime := edSearchCRUDDfechamento.DateTime;
    dm_rc.FDQryMvmestre.FindField('FECHAMENTO_STATUS').AsString := cbxstatus.Text;
    dm_rc.FDQryMvmestre.FindField('FECHAMENTO_OBS').AsString    := UniMemoobs.Text;
    dm_rc.FDQryMvmestre.Post;

    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'GRAVADO COM SUCESSO!' , 'sucess' , false );
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI GRAVAR' , 'warning' , false );
  end;
end;

procedure TfrmSTATUSMOVIMENTO.LimpaVars;
begin
  UniMemoobs.Clear;
  cbxstatus.ItemIndex              := 0;
  edSearchCRUDDfechamento.DateTime := Date;
end;

procedure TfrmSTATUSMOVIMENTO.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmSTATUSMOVIMENTO.UniBitBtn2Click(Sender: TObject);
begin
  gravamovimento(mm.varE_numero_entrega,
                 mm.varE_documento_entrega,
                 mm.varI_Code_Company);
end;

procedure TfrmSTATUSMOVIMENTO.UniFormCreate(Sender: TObject);
begin
  cFormModal   := mm.varC_Form_Modal;
end;

procedure TfrmSTATUSMOVIMENTO.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmSTATUSMOVIMENTO.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
  dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure TfrmSTATUSMOVIMENTO.UniFormShow(Sender: TObject);
begin
  carregadados(mm.varE_numero_entrega,
               mm.varE_documento_entrega,
               mm.varI_Code_Company)
end;

end.
