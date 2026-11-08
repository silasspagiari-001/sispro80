unit untFrmIMPRESSAOENTREGAPARCIAL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniPanel;

type
  TFrmIMPRESSAOENTREGAPARCIAL = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    UniContainerPanel1: TUniContainerPanel;
    UniDBGridEntrega: TUniDBGrid;
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniDBGridEntregaCellClick(Column: TUniDBGridColumn);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FrmIMPRESSAOENTREGAPARCIAL: TFrmIMPRESSAOENTREGAPARCIAL;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_procedures, mkm_impressao,
  unReportImpressao;

function FrmIMPRESSAOENTREGAPARCIAL: TFrmIMPRESSAOENTREGAPARCIAL;
begin
  Result := TFrmIMPRESSAOENTREGAPARCIAL(mm.GetFormInstance(TFrmIMPRESSAOENTREGAPARCIAL));
end;

procedure TFrmIMPRESSAOENTREGAPARCIAL.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFrmIMPRESSAOENTREGAPARCIAL.UniDBGridEntregaCellClick(
  Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'impressao' then
    begin
      mm.varC_caminhopdf :=   RECIBOENTREGA_impressao(mm.varI_Code_Company,
                                                      mm.varE_numero_entrega,
                                                      mm.varE_documento_entrega,
                                                      dm_rc.tbrelacaoentrega.FindField('EMISSAO').AsString,'PARCIAL');
      unfImpressao.ShowModal();
    end;
end;

procedure TFrmIMPRESSAOENTREGAPARCIAL.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TFrmIMPRESSAOENTREGAPARCIAL.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
  dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure TFrmIMPRESSAOENTREGAPARCIAL.UniFormResize(Sender: TObject);
begin
{
  FrmIMPRESSAOENTREGAPARCIAL.Height   := 372;
  FrmIMPRESSAOENTREGAPARCIAL.Width    := 563;

  with FrmIMPRESSAOENTREGAPARCIAL.Constraints do
    begin
      MaxWidth  := 563;
      MinWidth  := 563;
      MaxHeight := 372;
      MinHeight := 372;
    end;

  FrmIMPRESSAOENTREGAPARCIAL.Position := poScreenCenter;
  }
end;

procedure TFrmIMPRESSAOENTREGAPARCIAL.UniFormShow(Sender: TObject);
var
  sql:string;
begin
  sql := ' select emissao, numero from ENTREGA_PRODUTO ' +
         ' where numero    = ' + IntToStr(mm.varE_numero_entrega)     +
         ' and   documento = ' + IntToStr(mm.varE_documento_entrega)  +
         ' and   empresa   = ' + IntToStr(mm.varI_Code_Company)       +
         ' group by 1,2 ';

  SqlPesquisa(sql);

  dm_rc.tbrelacaoentrega.Close;
  dm_rc.tbrelacaoentrega.CopyDataSet(dm_rc.sqlBuscas);
  dm_rc.tbrelacaoentrega.Open;
end;

end.
