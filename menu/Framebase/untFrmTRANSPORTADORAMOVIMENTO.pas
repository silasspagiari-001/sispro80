unit untFrmTRANSPORTADORAMOVIMENTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn,
  uniEdit, UniButtonEdit, uniLabel, uniMultiItem, uniComboBox;

type
  TfrmTRANPORTADORAMOVIMENTO = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    UniButtonEditcodtransportadora: TUniButtonEdit;
    UniEditdescricaotransportadora: TUniEdit;
    UniButtonEditcepentrega: TUniButtonEdit;
    UniButtonEditibgeentrega: TUniButtonEdit;
    UniLabelc1: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniEditenderecoentrega: TUniEdit;
    UniLabel4: TUniLabel;
    UniEditnumeroresidencia: TUniEdit;
    UniLabel5: TUniLabel;
    UniEditbairroentrega: TUniEdit;
    UniEditcidadeentrega: TUniEdit;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    cbxufentrega: TUniComboBox;
    UniLabel8: TUniLabel;
    rcBlock120: TUniContainerPanel;
    UniComboBoxtipoemitente: TUniComboBox;
    UniLabel9: TUniLabel;
    procedure btnimpressaoClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniButtonEditcodtransportadoraButtonClick(Sender: TObject);
    procedure UniButtonEditcodtransportadoraExit(Sender: TObject);
    procedure UniButtonEditcepentregaButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cFormModal         : TUniForm;
  end;

function frmTRANPORTADORAMOVIMENTO: TfrmTRANPORTADORAMOVIMENTO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untFrmPesquisa, mkm_func_web, mkm_funcoes,
  mkm_procedures, untDM_RC;

function frmTRANPORTADORAMOVIMENTO: TfrmTRANPORTADORAMOVIMENTO;
begin
  Result := TfrmTRANPORTADORAMOVIMENTO(mm.GetFormInstance(TfrmTRANPORTADORAMOVIMENTO));
end;

procedure TfrmTRANPORTADORAMOVIMENTO.btnimpressaoClick(Sender: TObject);
begin
  mm.varT_code_transportadora      := StrToInt(UniButtonEditcodtransportadora.Text);
  mm.varT_code_nome_transportadora := UniEditdescricaotransportadora.Text;
  mm.varT_code_tipo_transportadora := IntToStr(UniComboBoxtipoemitente.ItemIndex);
  mm.varT_code_cep_entrega         := UniButtonEditcepentrega.Text;
  mm.varT_code_ibge_entrega        := UniButtonEditibgeentrega.Text;
  mm.varT_code_endereco_entrega    := UniEditenderecoentrega.Text;
  mm.varT_code_numero_entrega      := UniEditnumeroresidencia.Text;
  mm.varT_code_bairro_entrega      := UniEditbairroentrega.Text;
  mm.varT_code_cidade_entrega      := UniEditcidadeentrega.Text;
  mm.varT_code_estado_entrega      := cbxufentrega.Text;

  ModalResult := mrOK;
end;

procedure TfrmTRANPORTADORAMOVIMENTO.UniButtonEditcepentregaButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('CEP');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditcepentrega.Text := MM.varC_codigo_busca;
       if (UniButtonEditcepentrega.Text <> '') and (UniButtonEditcepentrega.Text <> '0') then
         begin
           SqlPesquisa('select DESCRICAO, UF, CODIIBGE from cidades where cep = ' + QuotedStr(UniButtonEditcepentrega.Text));
             UniEditcidadeentrega.Text     := dm_rc.sqlBuscas.Findfield('DESCRICAO').asstring;
             cbxufentrega.Text             := dm_rc.sqlBuscas.Findfield('UF').asstring;
             UniButtonEditibgeentrega.Text := dm_rc.sqlBuscas.Findfield('CODIIBGE').asstring;
         end;
     end;
   end);
end;

procedure TfrmTRANPORTADORAMOVIMENTO.UniButtonEditcodtransportadoraButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('TRANSPORTES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditcodtransportadora.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmTRANPORTADORAMOVIMENTO.UniButtonEditcodtransportadoraExit(
  Sender: TObject);
begin
  UniEditdescricaotransportadora.Text := Acha_Item('TRANSPORTES',UniButtonEditcodtransportadora.Text);
end;

procedure TfrmTRANPORTADORAMOVIMENTO.UniFormCreate(Sender: TObject);
begin
  cFormModal := mm.varC_Form_Modal;
end;

procedure TfrmTRANPORTADORAMOVIMENTO.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal          := nil;
end;

procedure TfrmTRANPORTADORAMOVIMENTO.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TfrmTRANPORTADORAMOVIMENTO.UniFormShow(Sender: TObject);
begin
  UniButtonEditcodtransportadora.Text := IntToStr(mm.varT_code_transportadora);
  UniEditdescricaotransportadora.Text := mm.varT_code_nome_transportadora;
  UniComboBoxtipoemitente.ItemIndex   := StrToInt(mm.varT_code_tipo_transportadora);
  UniButtonEditcepentrega.Text        := mm.varT_code_cep_entrega;
  UniButtonEditibgeentrega.Text       := mm.varT_code_ibge_entrega;
  UniEditenderecoentrega.Text         := mm.varT_code_endereco_entrega;
  UniEditnumeroresidencia.Text        := mm.varT_code_numero_entrega;
  UniEditbairroentrega.Text           := mm.varT_code_bairro_entrega;
  UniEditcidadeentrega.Text           := mm.varT_code_cidade_entrega;
  cbxufentrega.Text                   := mm.varT_code_estado_entrega;
end;

end.
