unit untFrmBARCODEREADER; // v. 7.2.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Soap.EncdDecd,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniGUIBaseClasses, uniTimer, uniLabel, Vcl.Imaging.jpeg, uniImage, uniButton, uniPanel, uniHTMLFrame, uniSweetAlert, uniEdit;

type
  TfrmBARCODEREADER = class(TfrmGenericModalForm)
    paBackground: TUniContainerPanel;
    paCamera: TUniContainerPanel;
    htmlBarCode: TUniHTMLFrame;
    btnStart: TUniButton;
    paBaseTopTitle: TUniContainerPanel;
    labTitleForm: TUniLabel;
    labExit: TUniLabel;
    edBarCode: TUniEdit;
    procedure labExitClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure htmlBarCodeAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure UniFormReady(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
    MS: TMemoryStream; //Memory-/Binary-Stream
    vFileName, vDestFileName : String;
    bReadOn : boolean;
  public
    { Public declarations }
    // v. 3.3.1.0
    procedure rc_Exit;

  end;

function frmBARCODEREADER: TfrmBARCODEREADER;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_layout, untDM_RC, ServerModule, uconsts;

function frmBARCODEREADER: TfrmBARCODEREADER;
begin
  Result := TfrmBARCODEREADER(mm.GetFormInstance(TfrmBARCODEREADER));
end;

procedure TfrmBARCODEREADER.htmlBarCodeAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
Var
  SS: TStringStream; //String-Stream (base64 encoded)
  MS  : TMemoryStream;
  //PngImage : TPngImage;
  JpegImage: TJPEGImage;
begin
  inherited;
     If SameText( EventName, '_rcBarCode' ) then
     begin
          //dm_rc.rc_ShowToaster( ttySuccess, 'barcode: ' + params.values['bc'], false, ttrPinItUp, 3500 );
          edBarCode.Text := params.values['bc'];
     end;
  if (EventName = 'getResult') then //and ( bReadOn ) then //and ( Params.Values['result'] <> Trim( mResult.Text ) ) then
  begin
    //mResult.Clear;
    //mResult.Lines.Add(Params.Values['result']);
    //htmlBarCode.JSInterface.JSCall('_ael.play', []);
    mm.varC_TempFile := Params.Values['result'];
    dm_rc.rc_ShowToaster( 'info', 'BarCode Captured:' + mm.varC_TempFile , false, 'pinItUp' );
    bReadOn := false;
    //btnCamPowerClick( btnCamPower );
  end;
end;

procedure TfrmBARCODEREADER.labExitClick(Sender: TObject);
begin
  inherited;
    mm.varB_Yes                 := False;
    mm.varB_No                  := True;
    Self.ModalResult            := mrNone;
    Close;
    //rc_Exit;
end;

// v. 3.3.1.0
procedure TfrmBARCODEREADER.rc_Exit;
begin
  rc_AddCssClass( self, 'drop_out' );

  //timerClose.Enabled := true;//7.3.0.0
end;
procedure TfrmBARCODEREADER.btnStartClick(Sender: TObject);
begin
  inherited;
   //(Sender as TUniButton).JSInterface.JSCall('element.dom.click', []);
   UniSession.AddJS( 'document.getElementById("'+ btnStart.JSId +'").click();');
   //UniSession.AddJS( 'rc_start();' );

end;

procedure TfrmBARCODEREADER.UniFormReady(Sender: TObject);
begin
  inherited;
    Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
    //btnInitClick( btnInit );
end;
// v. 3.4.0.0
procedure TfrmBARCODEREADER.UniFormShow(Sender: TObject);
begin
  inherited;
  bReadOn := True;

       mm.varC_TempFile := '';
       mm.varB_Yes      := false;
end;

initialization
  RegisterClass(TfrmBARCODEREADER);

end.
