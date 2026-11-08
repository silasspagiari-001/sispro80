unit untFrmCONSULTACNPJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniLabel, uniImage, uniEdit, Vcl.ExtCtrls, uniScreenMask;

type
  TfrmCONSULTACNPJ = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    btnLkpClear: TUniBitBtn;
    rcBlock20: TUniContainerPanel;
    unpcaptcha: TUniContainerPanel;
    UniImage1: TUniImage;
    UniLabelCAPTCHA: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UniEditcpfcnpj: TUniEdit;
    UniLabel15: TUniLabel;
    rcBlock40: TUniContainerPanel;
    UniEditcaptcha: TUniEdit;
    UniLabel2: TUniLabel;
    rcBlock50: TUniContainerPanel;
    unbtnbusca: TUniBitBtn;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniContainerPanel6: TUniContainerPanel;
    Timer1: TTimer;
    UniEditrazao: TUniEdit;
    UniLabel3: TUniLabel;
    UniEditfantasia: TUniEdit;
    UniLabel4: TUniLabel;
    UniEditcep: TUniEdit;
    UniLabel5: TUniLabel;
    UniEditendereco: TUniEdit;
    UniLabel6: TUniLabel;
    UniEditnumero: TUniEdit;
    UniLabel7: TUniLabel;
    UniEditbairro: TUniEdit;
    UniLabel8: TUniLabel;
    UniEditcomplemento: TUniEdit;
    UniLabel9: TUniLabel;
    UniEditcidade: TUniEdit;
    UniLabel10: TUniLabel;
    UniEdituf: TUniEdit;
    UniLabel11: TUniLabel;
    rcBlock90: TUniContainerPanel;
    UniEditemail: TUniEdit;
    UniLabel12: TUniLabel;
    UniScreenMask: TUniScreenMask;
    UniEditibge: TUniEdit;
    UniLabel1: TUniLabel;
    UniBitBtn1: TUniBitBtn;
    procedure UniLabelCAPTCHAClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure Transferir(Sender: TObject);
    procedure unbtnbuscaClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;
    cFormModal         : TUniForm;
  end;

function frmCONSULTACNPJ: TfrmCONSULTACNPJ;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, Vcl.Imaging.jpeg;

function frmCONSULTACNPJ: TfrmCONSULTACNPJ;
begin
  Result := TfrmCONSULTACNPJ(mm.GetFormInstance(TfrmCONSULTACNPJ));
end;

procedure TfrmCONSULTACNPJ.Transferir(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmCONSULTACNPJ.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= False;
  UniLabelCAPTCHAClick(UniLabelCAPTCHA);
  UniEditcpfcnpj.SetFocus;
end;

procedure TfrmCONSULTACNPJ.unbtnbuscaClick(Sender: TObject);
var
  I: Integer;
begin
  if Length(UniEditcpfcnpj.Text) < 14 then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'DIGITE UM CNPJ VÁLIDO ', 'error' , false );
      abort
    end;

  if UniEditcaptcha.Text <> '' then
  begin
    DM_RC.ACBrConsultaCNPJ.PesquisarIBGE := True; // IBGE
    try
      if dm_rc.ACBrConsultaCNPJ.Consulta(
        UniEditcpfcnpj.Text,
        UniEditcaptcha.Text,
        True
      ) then
      begin
        UniEditrazao.Text       := dm_rc.ACBrConsultaCNPJ.RazaoSocial;
        UniEditfantasia.Text    := dm_rc.ACBrConsultaCNPJ.Fantasia;
        UniEditendereco.Text    := dm_rc.ACBrConsultaCNPJ.Endereco;
        UniEditnumero.Text      := dm_rc.ACBrConsultaCNPJ.Numero;
        UniEditcomplemento.Text := dm_rc.ACBrConsultaCNPJ.Complemento;
        UniEditbairro.Text      := dm_rc.ACBrConsultaCNPJ.Bairro;
        UniEditcidade.Text      := dm_rc.ACBrConsultaCNPJ.Cidade;
        UniEdituf.Text          := dm_rc.ACBrConsultaCNPJ.UF;
        UniEditcep.Text         := dm_rc.ACBrConsultaCNPJ.CEP;
        UniEditemail.Text       := dm_rc.ACBrConsultaCNPJ.EndEletronico;
        UniEditibge.Text        := dm_rc.ACBrConsultaCNPJ.IBGE_Municipio;

        UniLabelCAPTCHA.OnClick(Self);
      end;
    except
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PROBLEMA NO CAPTCHA - TENTE NOVAMENTE ', 'error' , false );
      UniLabelCAPTCHA.OnClick(Self);
    end;
  end
  else
  begin
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'INSERIRI A INFORMAÇÃO DO CAPTCHA ', 'error' , false );
    UniEditcaptcha.SetFocus;
  end;
end;

procedure TfrmCONSULTACNPJ.UniBitBtn1Click(Sender: TObject);
begin
  mm.varCNPJ_NOME        := UniEditrazao.Text;
  mm.varCNPJ_FANTASIA    := UniEditfantasia.Text;
  mm.varCNPJ_CEP         := UniEditcep.Text;
  mm.varCNPJ_ENDERECO    := UniEditendereco.Text;
  mm.varCNPJ_NUMERO      := UniEditnumero.Text;
  mm.varCNPJ_BAIRRO      := UniEditbairro.Text;
  mm.varCNPJ_COMPLEMENTO := UniEditcomplemento.Text;
  mm.varCNPJ_CIDADE      := UniEditcidade.Text;
  mm.varCNPJ_IBGE        := UniEditibge.Text;
  mm.varCNPJ_UF          := UniEdituf.Text;
  mm.varCNPJ_EMAIL       := UniEditemail.Text;
  mm.varCNPJ_CNPJ        := UniEditcpfcnpj.Text;
  mm.varCNPJ_SN          := 'S';

  btnLkpClear.OnClick(Self);
end;

procedure TfrmCONSULTACNPJ.UniFormCreate(Sender: TObject);
begin
  cFormModal := mm.varC_Form_Modal;
end;

procedure TfrmCONSULTACNPJ.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmCONSULTACNPJ.UniFormShow(Sender: TObject);
begin
  Timer1.Enabled:= True;
  UniLabelCAPTCHA.OnClick(Self);
end;

procedure TfrmCONSULTACNPJ.UniLabelCAPTCHAClick(Sender: TObject);
var
  Stream: TMemoryStream;
  Jpg   : TJPEGImage;
{$IFDEF DELPHI2009_UP}
//  png: TPngImage;
{$ELSE}
  ImgArq: String;
{$ENDIF}
begin
  {$IFNDEF SUPPORT_PNG}
//    ShowMessage('Atenção: Seu Delphi não dá suporte nativo a imagens PNG. Queira verificar o código fonte deste exemplo para saber como proceder.');
//    Exit;
    // COMO PROCEDER:
    //
    // 1) Caso o site da receita esteja utilizando uma imagem do tipo JPG, você pode utilizar o código comentado abaixo.
    //    * Comente ou apague o código que trabalha com PNG, incluindo o IFDEF/ENDIF;
    //    * descomente a declaração da variável jpg
    //    * descomente o código abaixo;
    // 2) Caso o site da receita esteja utilizando uma imagem do tipo PNG, você terá que utilizar uma biblioteca de terceiros para
    //conseguir trabalhar com imagens PNG.
    //  Neste caso, recomendamos verificar o manual da biblioteca em como fazer a implementação. Algumas sugestões:
    //    * Procure no Fórum do ACBr sobre os erros que estiver recebendo. Uma das maneiras mais simples está no link abaixo:
    //      - http://www.projetoacbr.com.br/forum/topic/20087-imagem-png-delphi-7/
    //    * O exemplo acima utiliza a biblioteca GraphicEX. Mas existem outras bibliotecas, caso prefira:
    //      - http://synopse.info/forum/viewtopic.php?id=115
    //      - http://graphics32.org/wiki/
    //      - http://cc.embarcadero.com/Item/25631
    //      - Várias outras: http://torry.net/quicksearchd.php?String=png&Title=Yes
  {$ENDIF}

  Stream:= TMemoryStream.Create;
  try
    dm_rc.ACBrConsultaCNPJ.Captcha(Stream);

   {$IFDEF DELPHI2009_UP}
   {
    //Use esse código quando a imagem do site for do tipo PNG
    png:= TPngImage.Create;
    try
      png.LoadFromStream(Stream);
      Image1.Picture.Assign(png);
    finally
      png.Free;
    end;
    }
     //Use esse código quando a imagem do site for do tipo JPG
      Jpg:= TJPEGImage.Create;
      try
        Jpg.LoadFromStream(Stream);
        Image1.Picture.Assign(Jpg);
      finally
        Jpg.Free;
      end;

   {$ELSE}
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    UniImage1.Picture.LoadFromFile( ImgArq );
   {$ENDIF}

    UniEditcaptcha.Clear;
    UniEditcaptcha.SetFocus;
  finally
    Stream.Free;
  end;
end;

end.
