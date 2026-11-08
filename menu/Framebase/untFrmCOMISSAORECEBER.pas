unit untFrmCOMISSAORECEBER;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, uniButton, uniBitBtn, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmCOMISSAORECEBER = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    UniDBGridEntrega: TUniDBGrid;
    tb_comissao: TFDMemTable;
    ds_comissao: TDataSource;
    tb_comissaoFUNCIONARIO: TIntegerField;
    tb_comissaoNOMEFUNCIONARIO: TStringField;
    tb_comissaoVALORATUAL: TFloatField;
    tb_comissaoPERCCOMISSAO: TFloatField;
    tb_comissaoCOMISSAOPAGA: TFloatField;
    procedure UniFormDestroy(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FrmCOMISSAORECEBER: TFrmCOMISSAORECEBER;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_procedures, mkm_relatorios, untDM_RC;

function FrmCOMISSAORECEBER: TFrmCOMISSAORECEBER;
begin
  Result := TFrmCOMISSAORECEBER(mm.GetFormInstance(TFrmCOMISSAORECEBER));
end;

procedure TFrmCOMISSAORECEBER.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFrmCOMISSAORECEBER.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TFrmCOMISSAORECEBER.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TFrmCOMISSAORECEBER.UniFormShow(Sender: TObject);
var
sql : string;
begin
  sql := ESCRITA_COMISSAORECEBER(mm.varI_Code_Company,
                                 mm.varI_Code_Numero_Documento,
                                 mm.varI_Code_Documento_sequencia);

  tb_comissao.Close;
  if SqlPesquisa(sql) then
    begin
      tb_comissao.CopyDataSet(dm_rc.sqlBuscas);
      tb_comissao.Open;
    end;

end;

end.
