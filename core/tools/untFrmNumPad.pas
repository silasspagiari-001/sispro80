unit untFrmNumPad;//8.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniSweetAlert, uniGUIBaseClasses, uniTimer,
  uniEdit, uniLabel, uniButton, uniBitBtn, uniPanel;

type
  TfrmNumPad = class(TfrmGenericModalForm)
    paNumPad: TUniContainerPanel;
    btnPay7: TUniBitBtn;
    btnPay8: TUniBitBtn;
    btnPay9: TUniBitBtn;
    btnPay1: TUniBitBtn;
    btnPay2: TUniBitBtn;
    btnPay3: TUniBitBtn;
    btnPay4: TUniBitBtn;
    btnPay5: TUniBitBtn;
    btnPay0: TUniBitBtn;
    btnPay6: TUniBitBtn;
    btnPayComma: TUniBitBtn;
    paDisplay: TUniContainerPanel;
    labPayDisplay: TUniLabel;
    edNumberTyped: TUniFormattedNumberEdit;
    btnPayClear: TUniBitBtn;
    btnPayCancel: TUniBitBtn;
    btnPayEnter: TUniBitBtn;
    procedure btnPay7Click(Sender: TObject);
    procedure UniFormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetDisplayData : string;
    procedure SetDisplayData( sender : TObject );
    procedure ClearDisplayData;
  end;

function frmNumPad: TfrmNumPad;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmNumPad: TfrmNumPad;
begin
  Result := TfrmNumPad(mm.GetFormInstance(TfrmNumPad));
end;

{ TfrmNumPad }

procedure TfrmNumPad.btnPay7Click(Sender: TObject);
begin
  inherited;
     mm.varF_TempFloat1 := edNumberTyped.Value;
     if Length( FloatToStrF( edNumberTyped.Value, ffNumber, 15, 2 ) ) <= 16 then
        SetDisplayData( sender );
end;

procedure TfrmNumPad.ClearDisplayData;
begin
     labPayDisplay.Caption := '';
end;

function TfrmNumPad.GetDisplayData: string;
begin
     Result := labPayDisplay.Caption;
end;

procedure TfrmNumPad.SetDisplayData(sender: TObject);
var
   cSender, c : string;
begin
     c := IntToStr( TUniBitBtn( sender ).Tag );

     cSender := c;
     if c = '20' then
        c := PFmtSettings.DecimalSeparator
     else
     if ( c = '30') then
     begin
        c := '';
        //dm_rc.rc_ShowToaster( 'success', 'Payment of $ ' + labPayDisplay.Caption + ' Done !', false, 'slideLeftRightFade' );
        ClearDisplayData;
     end
     else
     if ( c = '40') then
     begin
        ClearDisplayData;
        c := '';
        //dm_rc.rc_ShowToaster( 'error', 'Payment Cancelled !', false, 'slideLeftRightFade' );
     end
     else
     if ( c = '50') then
     begin
        c := GetDisplayData;
        c := Copy( c, 1, Length( c ) - 1 );
        //edPayDisplay.Text := c;
        labPayDisplay.Caption := c;
     end;

     if ( cSender <> '50') then
     begin
        labPayDisplay.Caption := labPayDisplay.Caption + c;
     end;
     edNumberTyped.Value := StrToFloatDef( labPayDisplay.Caption , 0.00 );
end;

procedure TfrmNumPad.UniFormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  oBtn : TUniBitBtn;
  cKey : String;
begin
  inherited;
  If ( ( Key >= 48 ) and ( Key <= 57 ) ) or
     ( ( Key >= 96 ) and ( Key <= 105 ) ) then
  begin
     If Key >= 96 then
        cKey := Chr( Key - 48 )
     else
        cKey := Chr( Key );
     if Pos( cKey, '0 1 2 3 4 5 6 7 8 9' ) > 0  then
        oBtn := TUniBitBtn( FindComponent( 'btnPay' + cKey  ) )
     else
     begin
        oBtn := TUniBitBtn( FindComponent( 'btnPay' + cKey  ) );
     end;
     if oBtn <> nil then
        oBtn.Click;
  end
  else
  If Key = 13 then
     btnPayEnter.Click
  else
  If Key = 8 then
     btnPayClear.Click
  else
  If Key = 27 then
     btnPayCancel.Click;
end;

initialization
   RegisterClass( TfrmNumPad ) ;

end.
