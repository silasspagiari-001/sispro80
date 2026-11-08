unit untFrmBLOQUEIOPESSOA; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0 — formulário modal auxiliar (aviso de pessoa bloqueada)
     - Form standalone (TUniForm) sem datasets: layout informativo + botão "Fechar"
     - layout modal 8.0 (doc LayoutRender): rc_RenderLayout em OnBeforeShow +
       rc_ResizeBlocks em OnReady (3.0) — mesmo padrão de MOVIMENTOVENDEDOR
     - mantidos: ModalResult := mrOK no Fechar, mm.varC_Form_Modal := nil no Destroy,
       centralização Self.Top no Ready; imagem e blocos preservados no DFM
     - usado por untFrmMOVIMENTOMESTRE (btnSaveRegClick e codigopessoasExit)
       via verificastatuspessoa + frmBLOQUEIOPESSOA.ShowModal
[EN] RADCore 3.0 -> 8.0 conversion
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniLabel, uniImage,
  uniGUIBaseClasses, uniPanel;

type
  TfrmBLOQUEIOPESSOA = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    UniImage1: TUniImage;
    rcBlock40: TUniContainerPanel;
    UniLabel1: TUniLabel;
    btnLkpClear: TUniBitBtn;
    procedure btnLkpClearClick(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmBLOQUEIOPESSOA: TfrmBLOQUEIOPESSOA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC,mkm_layout;

function frmBLOQUEIOPESSOA: TfrmBLOQUEIOPESSOA;
begin
  Result := TfrmBLOQUEIOPESSOA(mm.GetFormInstance(TfrmBLOQUEIOPESSOA));
end;

procedure TfrmBLOQUEIOPESSOA.btnLkpClearClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmBLOQUEIOPESSOA.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true, true );
end;

procedure TfrmBLOQUEIOPESSOA.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmBLOQUEIOPESSOA.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
  dm_rc.rc_ResizeBlocks( Self, true, true );
end;

end.
