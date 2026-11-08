unit untFrmTELADETALHESPRODUCAODLOTE; //8.0.0.0
(*
[PT] Conversao RadCORE 3.0 -> 8.0 - modal "Preco do KG/PONTO"
     - Receita modal 8.0: Hint '[[modal:]]' + BorderStyle bsSingle +
       rc_RenderLayout(Self,false,false,false) no OnCreate e (Self,true,true) no
       BeforeShow; mm.varC_Form_Modal := nil no OnDestroy (padrao DETALHESBENEFICIAMENTO).
     - rcBlocks renomeados na sequencia visual (regra 40): rcBlock10 wrapper,
       rcBlock20 conteudo, rcBlock30 = Total Kg/Custo Kg (era UniContainerPanel2),
       rcBlock40 = Total Ponto/Custo Ponto (era rcBlock30), rcBlock50 = barra Fechar
       (era UniContainerPanel1). Kg/Ponto lado a lado: md-6 + md-6 = 12.
     - Campos nao-DB com Anchors akRight (regra 40a). OnShow alimenta dos
       mm.varV_totalkg/custokg/totalponto/custoponto (existem no MainModule 8.0).
     - Chamador 8.0: untCadPRODUCAOINTERNA (coluna calculos do grid) via
       mm.varC_Form_Modal + ShowModal; Fechar mantem ModalResult mrOK.
[EN] RadCORE 3.0 -> 8.0 conversion
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniLabel, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniPanel;

type
  TFrmTELADETALHESPRODUCAODLOTE = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniFormattedNumberEdittotalkg: TUniFormattedNumberEdit;
    UniFormattedNumberEditcustokg: TUniFormattedNumberEdit;
    UniFormattedNumberEdittotalponto: TUniFormattedNumberEdit;
    UniFormattedNumberEditcustoponto: TUniFormattedNumberEdit;
    btnLkpClear: TUniBitBtn;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure btnLkpClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FrmTELADETALHESPRODUCAODLOTE: TFrmTELADETALHESPRODUCAODLOTE;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_layout;

function FrmTELADETALHESPRODUCAODLOTE: TFrmTELADETALHESPRODUCAODLOTE;
begin
  Result := TFrmTELADETALHESPRODUCAODLOTE(mm.GetFormInstance(TFrmTELADETALHESPRODUCAODLOTE));
end;

//8.0.0.0 receita modal (padrao DETALHESBENEFICIAMENTO)
procedure TFrmTELADETALHESPRODUCAODLOTE.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
end;

procedure TFrmTELADETALHESPRODUCAODLOTE.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TFrmTELADETALHESPRODUCAODLOTE.UniFormReady(Sender: TObject);
begin
  // reservado p/ ajuste fino de geometria (padrao modal RC)
end;

procedure TFrmTELADETALHESPRODUCAODLOTE.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TFrmTELADETALHESPRODUCAODLOTE.btnLkpClearClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFrmTELADETALHESPRODUCAODLOTE.UniFormShow(Sender: TObject);
begin
  UniFormattedNumberEdittotalkg.Value    := mm.varV_totalkg;
  UniFormattedNumberEditcustokg.Value    := mm.varV_custokg;
  UniFormattedNumberEdittotalponto.Value := mm.varV_totalponto;
  UniFormattedNumberEditcustoponto.Value := mm.varV_custoponto;
end;

end.
// fim do arquivo
