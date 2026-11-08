unit untFrmTELAMOVIMENTOBOLETOS; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0 — formulário modal auxiliar (emissão de boletos do movimento)
     - Form standalone (TUniForm) sem datasets locais: grid amarrado a dm_rc.dsboletos
     - rc_ShowSweetAlert 4 args -> 3 args
     - dm_rc.tbboletos.Open mantido (.Open) pois tbboletos é TFDMemTable — rc_OpenQuery só aceita TFDQuery (E2010)
     - mantidos: ConfirmarBoleto/GerarBoletoPDF (mkm_regrasnegocio), unfImpressao
       (unReportImpressao), ShowModal com callback (untFrmPesquisa), mm.Seta_Busca
     - botões gerar/imprimir ganham ScreenMask.Target = Owner no DFM
[EN] RADCore 3.0 -> 8.0 conversion
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniBasicGrid, uniDBGrid, uniEdit, UniButtonEdit, uniLabel;

type
  TfrmTELAMOVIMENTOBOLETOS = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    UniDBGridEntrega: TUniDBGrid;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditpbancos: TUniButtonEdit;
    paSearchOp1: TUniContainerPanel;
    UniEditdescricaobanco: TUniEdit;
    UniLabel1: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    btngerar: TUniBitBtn;
    UniContainerPanel1: TUniContainerPanel;
    btnimprimir: TUniBitBtn;
    procedure UniButtonEditpbancosButtonClick(Sender: TObject);
    procedure UniButtonEditpbancosExit(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure UniDBGridEntregaDblClick(Sender: TObject);
    procedure btngerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure carregatitulos(pempresa,pnumero:integer;pserie:string);
  end;

function frmTELAMOVIMENTOBOLETOS: TfrmTELAMOVIMENTOBOLETOS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_funcoes, mkm_procedures, untFrmPesquisa,
  untDM_RC, mkm_regrasnegocio, unReportImpressao;

function frmTELAMOVIMENTOBOLETOS: TfrmTELAMOVIMENTOBOLETOS;
begin
  Result := TfrmTELAMOVIMENTOBOLETOS(mm.GetFormInstance(TfrmTELAMOVIMENTOBOLETOS));
end;

procedure TfrmTELAMOVIMENTOBOLETOS.carregatitulos(pempresa,pnumero:integer;pserie:string);
begin
  if SqlPesquisa('select * from receber where empresa = ' + IntToStr(pempresa) +
                 'and numero    =                       ' + IntToStr(pnumero)  +
                 'and serie     =                       ' + QuotedStr(pserie)  +
                 'order by sequencia asc') then
  begin
    dm_rc.tbboletos.Close;
    dm_rc.tbboletos.Open; //tbboletos é TFDMemTable (preenchido por Append/Post) — rc_OpenQuery só aceita TFDQuery (E2010)

    dm_rc.sqlBuscas.First;
    while not dm_rc.sqlBuscas.Eof do
      begin

        dm_rc.tbboletos.append;
        dm_rc.tbboletos.FindField('NOME').AsString         := Acha_Item('PESSOAS',dm_rc.sqlBuscas.FindField('PESSOA').AsString) ;
        dm_rc.tbboletos.FindField('NUMERO').AsInteger      := dm_rc.sqlBuscas.FindField('NUMERO').AsInteger;
        dm_rc.tbboletos.FindField('SEQUENCIA').AsInteger   := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsInteger;
        dm_rc.tbboletos.FindField('SERIE').AsString        := dm_rc.sqlBuscas.FindField('SERIE').AsString;
        dm_rc.tbboletos.FindField('VENCIMENTO').AsDateTime := dm_rc.sqlBuscas.FindField('VENCIMENTO').AsDateTime;
        dm_rc.tbboletos.FindField('VALOR').AsFloat         := dm_rc.sqlBuscas.FindField('VALORATUAL').AsFloat;
        dm_rc.tbboletos.post;

        dm_rc.sqlBuscas.Next;
      end;
    dm_rc.tbboletos.First;
  end;

end;

procedure TfrmTELAMOVIMENTOBOLETOS.btngerarClick(Sender: TObject);
begin
  if (UniButtonEditpbancos.Text = '0') or
     (UniButtonEditpbancos.Text = '') then
  begin
    dm_rc.rc_ShowSweetAlert( 'Ok', 'INFORMAR UMA CONTA VÁLIDA' , 'error' );
    abort
  end
 else
   begin
     if ConfirmarBoleto (mm.varI_Code_Company,
                         mm.varI_Code_Numero_Documento,
                         1,
                         0,
                         StrToInt(UniButtonEditpbancos.Text)) = True then
     begin
       btngerar.Enabled              := False;
       btnimprimir.Enabled           := True;
       UniButtonEditpbancos.ReadOnly := True;
       UniEditdescricaobanco.ReadOnly:= True;

       dm_rc.rc_ShowSweetAlert( 'Ok', 'BOLETO LANÇADO COM SUCESSO!' , 'success' );
     end;

   end;
end;

procedure TfrmTELAMOVIMENTOBOLETOS.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmTELAMOVIMENTOBOLETOS.btnimprimirClick(Sender: TObject);
var
  caminhopdf:string;
begin
  mm.varC_caminhopdf := GerarBoletoPDF (mm.varI_Code_Company,
                                        mm.varI_Code_Numero_Documento,
                                        1,
                                        0,
                                        StrToInt(UniButtonEditpbancos.Text));
  unfImpressao.ShowModal();
end;

procedure TfrmTELAMOVIMENTOBOLETOS.UniButtonEditpbancosButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('PORTADORES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditpbancos.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmTELAMOVIMENTOBOLETOS.UniButtonEditpbancosExit(Sender: TObject);
begin
  UniEditdescricaobanco.Text := Acha_Item('PORTADORES'  ,UniButtonEditpbancos.Text);
end;

procedure TfrmTELAMOVIMENTOBOLETOS.UniDBGridEntregaDblClick(Sender: TObject);
begin
  mm.varC_caminhopdf := GerarBoletoPDF (mm.varI_Code_Company,
                                        dm_rc.tbboletosNUMERO.AsInteger,
                                        1,
                                        dm_rc.tbboletosSEQUENCIA.AsInteger,
                                        StrToInt(UniButtonEditpbancos.Text));
  unfImpressao.ShowModal();
end;

procedure TfrmTELAMOVIMENTOBOLETOS.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmTELAMOVIMENTOBOLETOS.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TfrmTELAMOVIMENTOBOLETOS.UniFormShow(Sender: TObject);
begin
  if SqlPesquisa('select * from receber where empresa = ' + IntToStr(mm.varI_Code_Company)           +
                 'and numero    =                       ' + IntToStr(mm.varI_Code_Numero_Documento)  +
                 'and documento =                       ' + IntToStr(1)        +
                 'and confirmaboleto                  = ' + QuotedStr('T')     +
                 'order by sequencia asc') then
  begin
    UniButtonEditpbancos.Text     := dm_rc.sqlBuscas.FindField('PORTADOR').AsString;
    UniEditdescricaobanco.Text    := Acha_Item('PORTADORES',dm_rc.sqlBuscas.FindField('PORTADOR').AsString);

    btngerar.Enabled              := False;
    btnimprimir.Enabled           := True;
    UniButtonEditpbancos.ReadOnly := True;
    UniEditdescricaobanco.ReadOnly:= True;
  end;

  carregatitulos(mm.varI_Code_Company,
                 mm.varI_Code_Numero_Documento,
                 mm.varI_Code_documento_serie);
end;

end.

