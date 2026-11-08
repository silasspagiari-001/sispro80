unit untFrmMSGPMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn,
  uniMemo, uniLabel, uniEdit;

type
  TfrmMSGPMS = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    btnLkpClear: TUniBitBtn;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    UniMemomsgpms: TUniMemo;
    UniFormattedNumberEditCV: TUniFormattedNumberEdit;
    UniFormattedNumberEditPMS: TUniFormattedNumberEdit;
    UniFormattedNumberEditMEDIA: TUniFormattedNumberEdit;
    UniLabel16: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    procedure btnLkpClearClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cFormModal         : TUniForm;
  end;

function frmMSGPMS: TfrmMSGPMS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web, untDM_RC;

function frmMSGPMS: TfrmMSGPMS;
begin
  Result := TfrmMSGPMS(mm.GetFormInstance(TfrmMSGPMS));
end;

procedure TfrmMSGPMS.btnLkpClearClick(Sender: TObject);
begin
  ModalResult := mrOK;
//  Close;
end;

procedure TfrmMSGPMS.UniFormCreate(Sender: TObject);
begin
//  cFormModal := mm.varC_Form_Modal;
end;

procedure TfrmMSGPMS.UniFormDestroy(Sender: TObject);
begin
//  mm.varC_Form_Modal := nil;
end;

procedure TfrmMSGPMS.UniFormReady(Sender: TObject);
begin
//  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TfrmMSGPMS.UniFormShow(Sender: TObject);
var
  pmsvalido,
  pmsvalidoate,
  dosnvalido,
  dosnvalidoate,
  amostravalida,
  amostravalidaate : Extended;
begin
  try
    //*****************************************************//
    //  CABEÇALHO
    //*****************************************************//
    UniMemomsgpms.Clear;
    UniFormattedNumberEditCV.Value    :=  mm.varCVPMS;
    UniFormattedNumberEditPMS.Value   :=  mm.varPMSPMS;
    UniFormattedNumberEditMEDIA.value :=  mm.varPMSMEDIA;
    //*****************************************************//
    pmsvalido    := 0;
    pmsvalidoate := 0;
    pmsvalido    := MRound((UniFormattedNumberEditPMS.Value * 2.5),3);
    pmsvalidoate := MRound((pmsvalido * 1.03),3);
    //*****************************************************//
    dosnvalido   := 0;
    dosnvalidoate:= 0;
    dosnvalido   := MRound((UniFormattedNumberEditPMS.Value * variif(mm.varTIPOREVESTIMENTO = 'Pelotizada',7.5,25)),3);
    dosnvalidoate:= MRound((dosnvalido * 1.03),3);
    //*****************************************************//
    amostravalida   := 0;
    amostravalidaate:= 0;
    amostravalida   := MRound((pmsvalido         * 3),3);
    amostravalidaate:= MRound((UniFormattedNumberEditPMS.Value  * variif(mm.varTIPOREVESTIMENTO = 'Pelotizada',10,25)),3);
    //*****************************************************//
    UniMemomsgpms.Clear;
    UniMemomsgpms.Lines.Add('-----------------------------------------------------');
    UniMemomsgpms.Lines.Add('Amostra de Trabalho de pureza ' + FloatToStr(pmsvalido)     + ' Até ' + FloatToStr(pmsvalidoate));
    UniMemomsgpms.Lines.Add('Amostra de Trabalho de DOSN   ' + FloatToStr(dosnvalido)    + ' Até ' + FloatToStr(dosnvalidoate));
    UniMemomsgpms.Lines.Add('Amostra Média Pureza/DOSN     ' + FloatToStr(amostravalida) + '  /  ' + FloatToStr(amostravalidaate));
    UniMemomsgpms.Lines.Add('-----------------------------------------------------');
    //*****************************************************//
    mm.varAMOPUR_INI     := pmsvalido;
    mm.varAMOPUR_FIN     := pmsvalidoate;
    mm.varAMODOSN_INI    := dosnvalido;
    mm.varAMODOSN_FIN    := dosnvalidoate;
    mm.varAMOMEDIAPD_INI := amostravalida;
    mm.varAMOMEDIAPD_FIN := amostravalidaate;
    //*****************************************************//
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI CALCULAR, FECHE A JANELA E LANCE PMS NOVAMENTE' , 'error' , false );
  end;
end;

end.
