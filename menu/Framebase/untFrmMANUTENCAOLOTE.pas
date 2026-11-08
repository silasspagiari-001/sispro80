unit untFrmMANUTENCAOLOTE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniDBEdit, UniButtonDbEdit, uniLabel,
  uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn, uniMultiItem, uniComboBox,
  uniDBComboBox, uniPageControl, uniBasicGrid, uniDBGrid, UniButtonEdit,
  uniDateTimePicker, uniMemo;

type
  TfrmMANUTENCAOLOTE = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniButtonEditlote: TUniButtonEdit;
    UniLabelv1: TUniLabel;
    UniLabel1: TUniLabel;
    UniFormattedNumberEditpureza: TUniFormattedNumberEdit;
    UniLabel5: TUniLabel;
    UniEditboletim: TUniEdit;
    UniLabel4: TUniLabel;
    UniEdittermo: TUniEdit;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    cbxtipo: TUniComboBox;
    UniFormattedNumberEditqtde: TUniFormattedNumberEdit;
    UniLabel2: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    rcBlock80: TUniContainerPanel;
    eddataemissao: TUniDateTimePicker;
    UniLabel3: TUniLabel;
    rcBlock90: TUniContainerPanel;
    UniMemoobs: TUniMemo;
    UniLabel6: TUniLabel;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cFormModal         : TUniForm;
    procedure GeraSaldo();
  end;

function frmMANUTENCAOLOTE: TfrmMANUTENCAOLOTE;

implementation

{$R *.dfm}

uses
  untdm_rc, MainModule, uniGUIApplication, uconsts, mkm_layout, mkm_func_web,
  mkm_anim, mkm_procedures, mkm_funcoes;

function frmMANUTENCAOLOTE: TfrmMANUTENCAOLOTE;
begin
  Result := TfrmMANUTENCAOLOTE(mm.GetFormInstance(TfrmMANUTENCAOLOTE));
end;

procedure TfrmMANUTENCAOLOTE.btnimpressaoClick(Sender: TObject);
begin
  try
    GeraSaldo();
    dm_rc.rc_ShowSweetAlert('Ok', 'Saldo Gerado com SUCESSO!', 'success');
  except
    on E: Exception do
    begin
      gera_log(E.Message);
      dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'PROBLEMAS AO GERAR O SALDO: ' + E.Message, 'error');
    end;
  end;
end;

procedure TfrmMANUTENCAOLOTE.GeraSaldo;
begin
  TabelaPontos('SELECT * FROM pontos WHERE codigo = 999999999');
  TabelaSementes('SELECT * FROM sementes WHERE codigo = ' + IntToStr(mm.varI_Code_Codigo_Semente));

  dm_rc.fdqrypontos.Append;
  dm_rc.fdqrypontos.FindField('EMPRESA').AsInteger    := mm.varI_Code_Company;
  dm_rc.fdqrypontos.FindField('CODIGO').AsInteger     := Ultimo_Codigo('PONTOS', 'CODIGO', False);
  dm_rc.fdqrypontos.FindField('KEY').AsString         := Gera_Guid();
  dm_rc.fdqrypontos.FindField('DOCUMENTO').AsInteger  := 300;
  dm_rc.fdqrypontos.FindField('OPERACAO').AsInteger   := varIIF(cbxtipo.ItemIndex = 0, 8888, 7777);
  dm_rc.fdqrypontos.FindField('PESSOA').AsInteger     := 99999;
  dm_rc.fdqrypontos.FindField('SEQUENCIA').AsInteger  := 1;
  dm_rc.fdqrypontos.FindField('TIPO').AsString        := cbxtipo.Text;
  dm_rc.fdqrypontos.FindField('CANCELADA').AsString   := 'P';
  dm_rc.fdqrypontos.FindField('NUMERO').AsInteger     := Ultimo_Codigo('PONTOS', 'CODIGO', False);
  dm_rc.fdqrypontos.FindField('SERIE').AsString       := 'PRD';
  dm_rc.fdqrypontos.FindField('DATA').AsDateTime      := eddataemissao.DateTime;
  dm_rc.fdqrypontos.FindField('OBSERVACOES').AsString := UniMemoobs.Text;
  dm_rc.fdqrypontos.FindField('PRODUTO').AsInteger    := dm_rc.fdqrysementes.FindField('PRODUTO').AsInteger;
  dm_rc.fdqrypontos.FindField('DESCRICAO').AsString   := dm_rc.fdqrysementes.FindField('NOME').AsString;
  dm_rc.fdqrypontos.FindField('CATEGORIA').AsString   := dm_rc.fdqrysementes.FindField('CATEGORIA').AsString;
  dm_rc.fdqrypontos.FindField('TERMO').AsString       := dm_rc.fdqrysementes.FindField('TERMO').AsString;
  dm_rc.fdqrypontos.FindField('BOLETIM').AsString     := dm_rc.fdqrysementes.FindField('BOLETIM').AsString;
  dm_rc.fdqrypontos.FindField('PESOSACO').AsString    := dm_rc.fdqrysementes.FindField('PESOEMBALAGEM').AsString;
  dm_rc.fdqrypontos.FindField('LOTESEMENTE').AsString := dm_rc.fdqrysementes.FindField('LOTE').AsString;
  dm_rc.fdqrypontos.FindField('QUANTIDADE').AsFloat   := UniFormattedNumberEditqtde.Value;
  dm_rc.fdqrypontos.FindField('PUREZA').AsFloat       := dm_rc.fdqrysementes.FindField('ANALISEPURA').AsFloat;
  dm_rc.fdqrypontos.FindField('PONTOS').AsFloat       := UniFormattedNumberEditqtde.Value * dm_rc.fdqrysementes.FindField('ANALISEPURA').AsFloat;
  dm_rc.fdqrypontos.Findfield('QTEPESO').AsFloat      := UniFormattedNumberEditqtde.Value * dm_rc.fdqrysementes.FindField('PESOEMBALAGEM').AsFloat;
  dm_rc.fdqrypontos.Post;

  Calcula_Lote(mm.varI_Code_Company,
               dm_rc.fdqrysementes.FindField('PRODUTO').AsInteger,
               dm_rc.fdqrysementes.FindField('LOTE').AsString,
               dm_rc.fdqrysementes.FindField('BOLETIM').AsString,
               dm_rc.fdqrysementes.FindField('TERMO').AsString,
               mm.M_TIPOPESO);
end;

procedure TfrmMANUTENCAOLOTE.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmMANUTENCAOLOTE.UniFormCreate(Sender: TObject);
begin
  cFormModal := mm.varC_Form_Modal;
end;

procedure TfrmMANUTENCAOLOTE.UniFormDestroy(Sender: TObject);
begin
  mm.varI_Code_Codigo_Semente := 0;
  mm.varC_Form_Modal          := nil;
end;

procedure TfrmMANUTENCAOLOTE.UniFormReady(Sender: TObject);
begin
  Self.Top := (UniSession.UniApplication.ScreenHeight div 2) - (Self.Height div 2);
end;

procedure TfrmMANUTENCAOLOTE.UniFormResize(Sender: TObject);
begin
  frmMANUTENCAOLOTE.Height := 375;
  frmMANUTENCAOLOTE.Width  := 619;

  with frmMANUTENCAOLOTE.Constraints do
  begin
    MaxWidth  := 619;
    MinWidth  := 619;
    MaxHeight := 375;
    MinHeight := 375;
  end;

  frmMANUTENCAOLOTE.Position := poScreenCenter;
end;

procedure TfrmMANUTENCAOLOTE.UniFormShow(Sender: TObject);
begin
  TabelaSementes('SELECT * FROM sementes WHERE codigo = ' + IntToStr(mm.varI_Code_Codigo_Semente));
  UniButtonEditlote.Text             := dm_rc.fdqrysementes.FindField('LOTE').AsString;
  UniEditboletim.Text                := dm_rc.fdqrysementes.FindField('BOLETIM').AsString;
  UniEdittermo.Text                  := dm_rc.fdqrysementes.FindField('TERMO').AsString;
  UniFormattedNumberEditpureza.Value := dm_rc.fdqrysementes.FindField('ANALISEPURA').AsFloat;
  cbxtipo.ItemIndex                  := 0;
  eddataemissao.DateTime             := Date;
end;

end.
