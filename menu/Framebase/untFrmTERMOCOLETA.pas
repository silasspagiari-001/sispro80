unit untFrmTERMOCOLETA; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0
     - TfrmTERMOCOLETA (Modal Form)
     - uses otimizados para versão 8.0
     - SweetAlerts, layout e inicialização ajustados
[EN] RADCore 3.0 -> 8.0 conversion
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniEdit, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniPanel, uniCheckBox, uniSweetAlert,mkm_procedures;

type
  TfrmTERMOCOLETA = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    rcBlock20: TUniContainerPanel;
    Ubtngeratseqtermo: TUniButton;
    UniEdittermocoleta: TUniEdit;
    UniLabel6: TUniLabel;
    rcBlock30: TUniContainerPanel;
    uchcertificador: TUniCheckBox;
    uchprodutor: TUniCheckBox;
    uchreembalador: TUniCheckBox;
    UniContainerPanel2: TUniContainerPanel;
    uchpureza: TUniCheckBox;
    uchgerminacao: TUniCheckBox;
    uchviabilidade: TUniCheckBox;
    uchpercpeneira: TUniCheckBox;
    UniContainerPanel4: TUniContainerPanel;
    uchpms: TUniCheckBox;
    uchgerenveprecoce: TUniCheckBox;
    uchnocivas: TUniCheckBox;
    rcBlock550: TUniContainerPanel;
    ubtnEXCLUI: TUniBitBtn;
    ubtnINCLUI: TUniBitBtn;
    ubtnGRAVA: TUniBitBtn;
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UbtngeratseqtermoClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure ubtnINCLUIClick(Sender: TObject);
    procedure UniBitBtn5Click(Sender: TObject);
    procedure ubtnEXCLUIClick(Sender: TObject);
  private
    { Private declarations }
    vars_DATAEMISSAO: TDateTime;
  public
    { Public declarations }
    procedure habilita(leitura: string);
    procedure carregadados();
    procedure gravadados();
    procedure exclui();
    procedure Botoes(acao: string);
    procedure PromptCallBack(Sender: TComponent; AResult: Integer; AText: string);
  end;

function frmTERMOCOLETA: TfrmTERMOCOLETA;

implementation

{$R *.dfm}

uses
  MainModule, untDM_RC, mkm_funcoes, mkm_func_web, mkm_layout, mkm_regrasnegocio;

function frmTERMOCOLETA: TfrmTERMOCOLETA;
begin
  Result := TfrmTERMOCOLETA(mm.GetFormInstance(TfrmTERMOCOLETA));
end;

procedure TfrmTERMOCOLETA.Botoes(acao: string);
begin
  if acao = 'inclui' then
  begin
    ubtnINCLUI.Enabled := False;
    ubtnGRAVA.Enabled := True;
    ubtnEXCLUI.Enabled := False;
  end
  else if acao = 'grava' then
  begin
    ubtnINCLUI.Enabled := True;
    ubtnGRAVA.Enabled := False;
    ubtnEXCLUI.Enabled := True;
  end;
end;

procedure TfrmTERMOCOLETA.carregadados;
begin
  TabelaSolicitacao('SELECT * FROM SOLICITACAO WHERE CODIGO = ' + IntToStr(mm.varI_Code_Documento_Controle));

  uchcertificador.Checked := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_CERTIFICADOR').AsString = 'T', True, False);
  uchprodutor.Checked := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_PRODUTOR').AsString = 'T', True, False);
  uchreembalador.Checked := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_REEMBLADOR').AsString = 'T', True, False);

  uchpureza.Checked := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_PUREZA').AsString = 'T', True, False);
  uchgerminacao.Checked := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_GERMINACAO').AsString = 'T', True, False);
  uchviabilidade.Checked := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_VIABILIDADE').AsString = 'T', True, False);
  uchpercpeneira.Checked := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_PERCRET').AsString = 'T', True, False);
  uchpms.Checked := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_PMS').AsString = 'T', True, False);
  uchgerenveprecoce.Checked := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_GERENV').AsString = 'T', True, False);
  uchnocivas.Checked := varIIF(dm_rc.fdqrysolicitacao.FindField('TERMO_NOCIVAS').AsString = 'T', True, False);

  UniEdittermocoleta.Text := dm_rc.fdqrysolicitacao.FindField('NUMERO_TERMO').AsString;
  mm.vars_TERMO_SEQTERMO := dm_rc.fdqrysolicitacao.FindField('SEQTERMO').AsInteger;
  vars_DATAEMISSAO := dm_rc.fdqrysolicitacao.FindField('EMISSAO').AsDateTime;
end;

procedure TfrmTERMOCOLETA.exclui;
begin
  TabelaSolicitacao('SELECT * FROM SOLICITACAO WHERE CODIGO = ' + IntToStr(mm.varI_Code_Documento_Controle));

  dm_rc.fdqrysolicitacao.Edit;
  dm_rc.fdqrysolicitacao.FindField('TERMO_CERTIFICADOR').AsString := '';
  dm_rc.fdqrysolicitacao.FindField('TERMO_PRODUTOR').AsString := '';
  dm_rc.fdqrysolicitacao.FindField('TERMO_REEMBLADOR').AsString := '';

  dm_rc.fdqrysolicitacao.FindField('TERMO_PUREZA').AsString := '';
  dm_rc.fdqrysolicitacao.FindField('TERMO_GERMINACAO').AsString := '';
  dm_rc.fdqrysolicitacao.FindField('TERMO_VIABILIDADE').AsString := '';
  dm_rc.fdqrysolicitacao.FindField('TERMO_PERCRET').AsString := '';
  dm_rc.fdqrysolicitacao.FindField('TERMO_PMS').AsString := '';
  dm_rc.fdqrysolicitacao.FindField('TERMO_GERENV').AsString := '';
  dm_rc.fdqrysolicitacao.FindField('TERMO_NOCIVAS').AsString := '';
  dm_rc.fdqrysolicitacao.FindField('NUMERO_TERMO').AsString := '';
  dm_rc.fdqrysolicitacao.FindField('SEQTERMO').AsInteger := 0;
  dm_rc.fdqrysolicitacao.Post;
end;

procedure TfrmTERMOCOLETA.gravadados;
begin
  TabelaSolicitacao('SELECT * FROM SOLICITACAO WHERE CODIGO = ' + IntToStr(mm.varI_Code_Documento_Controle));

  dm_rc.fdqrysolicitacao.Edit;
  dm_rc.fdqrysolicitacao.FindField('TERMO_CERTIFICADOR').AsString := varIIF(uchcertificador.Checked, 'T', 'F');
  dm_rc.fdqrysolicitacao.FindField('TERMO_PRODUTOR').AsString := varIIF(uchprodutor.Checked, 'T', 'F');
  dm_rc.fdqrysolicitacao.FindField('TERMO_REEMBLADOR').AsString := varIIF(uchreembalador.Checked, 'T', 'F');

  dm_rc.fdqrysolicitacao.FindField('TERMO_PUREZA').AsString := varIIF(uchpureza.Checked, 'T', 'F');
  dm_rc.fdqrysolicitacao.FindField('TERMO_GERMINACAO').AsString := varIIF(uchgerminacao.Checked, 'T', 'F');
  dm_rc.fdqrysolicitacao.FindField('TERMO_VIABILIDADE').AsString := varIIF(uchviabilidade.Checked, 'T', 'F');
  dm_rc.fdqrysolicitacao.FindField('TERMO_PERCRET').AsString := varIIF(uchpercpeneira.Checked, 'T', 'F');
  dm_rc.fdqrysolicitacao.FindField('TERMO_PMS').AsString := varIIF(uchpms.Checked, 'T', 'F');
  dm_rc.fdqrysolicitacao.FindField('TERMO_GERENV').AsString := varIIF(uchgerenveprecoce.Checked, 'T', 'F');
  dm_rc.fdqrysolicitacao.FindField('TERMO_NOCIVAS').AsString := varIIF(uchnocivas.Checked, 'T', 'F');
  dm_rc.fdqrysolicitacao.FindField('NUMERO_TERMO').AsString := UniEdittermocoleta.Text;
  dm_rc.fdqrysolicitacao.FindField('SEQTERMO').AsInteger := mm.vars_TERMO_SEQTERMO;
  dm_rc.fdqrysolicitacao.Post;
end;

procedure TfrmTERMOCOLETA.habilita(leitura: string);
begin
  if leitura = 'L' then
  begin
    Ubtngeratseqtermo.Enabled := False;
    uchcertificador.ReadOnly := True;
    uchprodutor.ReadOnly := True;
    uchreembalador.ReadOnly := True;

    uchpureza.ReadOnly := True;
    uchgerminacao.ReadOnly := True;
    uchviabilidade.ReadOnly := True;
    uchpercpeneira.ReadOnly := True;
    uchpms.ReadOnly := True;
    uchgerenveprecoce.ReadOnly := True;
    uchnocivas.ReadOnly := True;
  end
  else if leitura = 'E' then
  begin
    Ubtngeratseqtermo.Enabled := True;
    uchcertificador.ReadOnly := False;
    uchprodutor.ReadOnly := False;
    uchreembalador.ReadOnly := False;

    uchpureza.ReadOnly := False;
    uchgerminacao.ReadOnly := False;
    uchviabilidade.ReadOnly := False;
    uchpercpeneira.ReadOnly := False;
    uchpms.ReadOnly := False;
    uchgerenveprecoce.ReadOnly := False;
    uchnocivas.ReadOnly := False;
  end;
end;

procedure TfrmTERMOCOLETA.PromptCallBack(Sender: TComponent; AResult: Integer;
  AText: string);
begin
  if AResult = mrOK then
  begin
    UniEdittermocoleta.Text := StrZeroS(AText, 5) + '/' + FormatDateTime('yyyy', vars_DATAEMISSAO);
    mm.vars_TERMO_SEQTERMO := StrToInt(AText);
  end;
end;

procedure TfrmTERMOCOLETA.ubtnEXCLUIClick(Sender: TObject);
begin
  try
    exclui();
    habilita('L');
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'TERMO DE COLETA EXCLUÍDO COM SUCESSO!', 'error' );
    ModalResult := mrOK;
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI EXCLUIR', 'error' );
  end;
end;

procedure TfrmTERMOCOLETA.UbtngeratseqtermoClick(Sender: TObject);
var
  ntermo: string;
begin
  ntermo := Numero_TermoColeta(MM.varI_Code_Company, FormatDateTime('yyyy', vars_DATAEMISSAO));
  Prompt('Sequência do termo está CORRETO?', ntermo, mtInformation, mbOKCancel, PromptCallBack);
end;

procedure TfrmTERMOCOLETA.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmTERMOCOLETA.UniBitBtn5Click(Sender: TObject);
begin
  if UniEdittermocoleta.Text = '' then
  begin
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'GERAR UM NÚMERO DE TERMO DE COLETA!', 'error' );
    abort;
  end;

  try
    gravadados;
    habilita('L');
    Botoes('grava');
    dm_rc.rc_ShowSweetAlert( 'OK', 'TERMO DE COLETA INCLUÍDO COM SUCESSO!', 'success' );
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI GRAVAR', 'error' );
  end;
end;

procedure TfrmTERMOCOLETA.ubtnINCLUIClick(Sender: TObject);
begin
  habilita('E');
  Botoes('inclui');
end;

procedure TfrmTERMOCOLETA.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmTERMOCOLETA.UniFormReady(Sender: TObject);
begin
  Self.Top := (UniSession.UniApplication.ScreenHeight div 2) - (Self.Height div 2);
  dm_rc.rc_ResizeBlocks(Self, true, true);
end;

procedure TfrmTERMOCOLETA.UniFormShow(Sender: TObject);
begin
  carregadados();
  habilita('L');
end;

initialization
  RegisterClass(TfrmTERMOCOLETA);
end.
