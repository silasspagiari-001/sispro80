unit untFrmCARDASSINATURART;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, Vcl.Menus, uniMainMenu, uniButton, uniBitBtn,
  uniLabel, uniGUIBaseClasses, uniPanel;

type
  TfrmCARDASSINATURART = class(TUniFrame)
    rcBlock10: TUniContainerPanel;
    labNUMEROSOLICITACAO: TUniLabel;
    labSERVICO: TUniLabel;
    labSTATUS: TUniLabel;
    btnCalcReg: TUniBitBtn;
    UniLabelcodigo: TUniLabel;
    labIcoSales380: TUniLabel;
    UniPopupMenuopcoes: TUniPopupMenu;
    H1: TUniMenuItem;
    N2: TUniMenuItem;
    A1: TUniMenuItem;
    UniLabelassinado: TUniLabel;
    labDATAHORA: TUniLabel;
    labLABORATORIO: TUniLabel;
    procedure btnCalcRegClick(Sender: TObject);
    procedure H1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untDM_RC, MainModule, mkm_procedures, unReportImpressao, mkm_impressao;



procedure TfrmCARDASSINATURART.btnCalcRegClick(Sender: TObject);
begin
  UniPopupMenuopcoes.PopupBy( TUniButton( sender ) );
end;

procedure TfrmCARDASSINATURART.H1Click(Sender: TObject);
begin
  mm.varC_caminhopdf :=  IMPRESSAO_solicitacao(mm.varI_Code_Company,StrToInt(UniLabelcodigo.Caption),False,'R');
  unfImpressao.ShowModal();
end;

end.
