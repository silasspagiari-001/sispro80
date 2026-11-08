unit untFrmInputBoxCustom; //8.1.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,system.Types,system.StrUtils,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniGUIBaseClasses, uniTimer, uniScrollBox, uniSpinEdit, uniMemo, uniCheckBox, uniRadioButton,
  uniButton, uniBitBtn, uniPanel, uniImage, uniLabel, uniHTMLFrame, uniEdit, uniSweetAlert, uniDateTimePicker, uniComboBox;

type
  TfrmInputBoxCustom = class(TfrmGenericModalForm)
    UniScrollBox1: TUniScrollBox;
    rcBlock4: TUniContainerPanel;
    labTitleForm: TUniLabel;
    rcBlock6: TUniContainerPanel;
    btnNo: TUniBitBtn;
    btnOk: TUniBitBtn;
    rcBlock2: TUniContainerPanel;
    imgTipo: TUniImage;
    sboxForm: TUniScrollBox;
    procedure btnOkClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cMSG_APP_TERMINATED : string;
    procedure rc_Exit;
  end;

function frmInputBoxCustom: TfrmInputBoxCustom;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_layout, mkm_translate, uconsts, uconsts_cfg, mkm_validate, mkm_createcomponents, untDM_RC,
  mkm_gridblock;

function frmInputBoxCustom: TfrmInputBoxCustom;
begin
  Result := TfrmInputBoxCustom(mm.GetFormInstance(TfrmInputBoxCustom));
end;

procedure TfrmInputBoxCustom.rc_Exit;
begin
      //timerClose.Enabled := true;
      //rc_AddCssClass( self, 'drop_out' );
end;
//7.0.0.0
procedure TfrmInputBoxCustom.UniFormBeforeShow(Sender: TObject);
var
   iContinueIdx,i, x, y,p : integer;
   oLabel       : TUniLabel;
   oEdit        : TUniEdit;
   oEditDt      : TUniDateTimePicker;
   oEditNumber  : TUniNumberEdit;
   oEditFNumber : TUniFormattedNumberEdit;
   oEditSpin    : TUniSpinEdit;
   oMemo        : TUniMemo;
   oCheckBox    : TUniCheckBox;
   oRadioButton : TUniRadioButton;
   oComboBox    : TUniComboBox;
   oItems       : TStringdynArray;
   oBlock       : TUniContainerPanel;
begin
//  inherited;
    iContinueIdx := StrToIntDef( rc_GetHintAttr( 'continue:', Self.Hint ), 0 );
    //remove last controls( if exists )
    for i := 0 to High( mm.varA_FInputBoxCustom )  do
    begin
       oLabel  := TUniLabel( FindComponent( 'ibcLabel' + i.ToString ) );
       case mm.varA_FInputBoxCustom[ i ].CompType of

            ibcEdit     : begin
                          end;
            ibcPass     : begin
                          end;
            ibcDate     : begin
                          end;
            ibcNumber   : begin
                          end;
            ibcFNumber  : begin
                          end;
            ibcMemo     : begin
                          end;
            ibcSpin     : begin
                          end;
            ibcCheckBox : begin
                          end;
            ibcRadio    : begin
                             oRadioButton  := TUniRadioButton( FindComponent( 'ibcRadioButton' + i.ToString ) );
                             sboxForm.RemoveControl( oRadioButton );
                          end;
            ibcComboBox  : begin
                          end;
       end;
       if oLabel <> nil then sboxForm.RemoveControl( oLabel );
    end;
    //sboxForm.CleanupInstance;

    x := 10;
    y := 10;
    for i := iContinueIdx to High( mm.varA_FInputBoxCustom )  do
    begin
       case mm.varA_FInputBoxCustom[ i ].CompType of
            ibcEdit     : begin
                            oLabel := rc_CreateLabel( Self, sboxForm, 'ibcLabel' + i.ToString, sboxForm.Width - 20 , 20, x, y,
                                                      mm.varA_FInputBoxCustom[ i ].CompLabelAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oEdit  := rc_CreateEdit ( Self, sboxForm, 'ibcEdit' + i.ToString , sboxForm.Width - 20 , 38, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            if VarToStr(mm.varA_FInputBoxCustom[ i ].CompDefaultValue)<>'' then
                               oEdit.Text := VarToStr(mm.varA_FInputBoxCustom[ i ].CompDefaultValue);
                            y := y + 70;
                          end;
            ibcPass     : begin
                            oLabel := rc_CreateLabel( Self, sboxForm, 'ibcLabel' + i.ToString, sboxForm.Width - 20 , 20, x, y,
                                                      mm.varA_FInputBoxCustom[ i ].CompLabelAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oEdit  := rc_CreateEdit ( Self, sboxForm, 'ibcEditPass' + i.ToString , sboxForm.Width - 20 , 38, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            oEdit.PasswordChar := '*';
                            if VarToStr(mm.varA_FInputBoxCustom[ i ].CompDefaultValue)<>'' then
                               oEdit.Text := VarToStr(mm.varA_FInputBoxCustom[ i ].CompDefaultValue);
                            y := y + 70;
                          end;
            ibcDate     : begin
                            oLabel := rc_CreateLabel( Self, sboxForm, 'ibcLabel' + i.ToString, sboxForm.Width - 20 , 20, x, y,
                                                      mm.varA_FInputBoxCustom[ i ].CompLabelAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oEditDt  := rc_CreateDateTimePicker( Self, sboxForm, 'ibcDateTimePicker' + i.ToString , sboxForm.Width - 20 , 38, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            oEditDt.DateTime := 0;
                            oEditDt.ShowBlankDate := True;
                            if VarToStr(mm.varA_FInputBoxCustom[ i ].CompDefaultValue)<>'' then
                               oEditDt.DateTime := VarToDateTime(mm.varA_FInputBoxCustom[ i ].CompDefaultValue);
                            y := y + 70;
                          end;
            ibcNumber   : begin
                            oLabel := rc_CreateLabel( Self, sboxForm, 'ibcLabel' + i.ToString, sboxForm.Width - 20 , 20, x, y,
                                                      mm.varA_FInputBoxCustom[ i ].CompLabelAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oEditNumber  := rc_CreateNumberEdit( Self, sboxForm, 'ibcNumberEdit' + i.ToString , sboxForm.Width - 20 , 38, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            if VarIsNumeric(mm.varA_FInputBoxCustom[ i ].CompDefaultValue) then
                               oEditNumber.Value := StrToFloat(mm.varA_FInputBoxCustom[ i ].CompDefaultValue);

                            y := y + 70;
                          end;
            ibcFNumber  : begin
                            oLabel := rc_CreateLabel( Self, sboxForm, 'ibcLabel' + i.ToString, sboxForm.Width - 20 , 20, x, y,
                                                      mm.varA_FInputBoxCustom[ i ].CompLabelAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oEditFNumber  := rc_CreateFormattedNumberEdit( Self, sboxForm, 'ibcFormattedNumberEdit' + i.ToString , sboxForm.Width - 20 , 38, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            if VarIsNumeric(mm.varA_FInputBoxCustom[ i ].CompDefaultValue) then
                               oEditFNumber.Value := StrToFloat(mm.varA_FInputBoxCustom[ i ].CompDefaultValue);

                            y := y + 70;
                          end;
            ibcMemo     : begin
                            oLabel := rc_CreateLabel( Self, sboxForm, 'ibcLabel' + i.ToString, sboxForm.Width - 20 , 20, x, y,
                                                      mm.varA_FInputBoxCustom[ i ].CompLabelAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oMemo  := rc_CreateMemo ( Self, sboxForm, 'ibcMemo' + i.ToString , sboxForm.Width - 20 , 55, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            y := y + 51;
                          end;
            ibcSpin     : begin
                            oLabel := rc_CreateLabel( Self, sboxForm, 'ibcLabel' + i.ToString, sboxForm.Width - 20 , 20, x, y,
                                                      mm.varA_FInputBoxCustom[ i ].CompLabelAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oEditSpin  := rc_CreateSpinEdit( Self, sboxForm, 'ibcSpinEdit' + i.ToString , sboxForm.Width - 20 , 38, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            oEditSpin.Value := mm.varA_FInputBoxCustom[ i ].CompDefaultValue;
                            y := y + 70;
                          end;
            ibcCheckBox : begin
                            oCheckBox  := rc_CreateCheckBox( Self, sboxForm, 'ibcCheckBox' + i.ToString , sboxForm.Width - 20 , 29, x, y,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            oCheckBox.Caption   := '';//mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oCheckBox.Font.Size := 11;
                            oCheckBox.Checked   := mm.varA_FInputBoxCustom[ i ].CompDefaultValue;
                            oLabel := rc_CreateLabel( Self, sboxForm, 'ibcLabel' + i.ToString, sboxForm.Width - 20 , oCheckBox.Height, oCheckBox.Left + 20, oCheckBox.Top + 3,
                                                      mm.varA_FInputBoxCustom[ i ].CompLabelAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oLabel.Font.Size := 11;
                            y := y + 25;
                          end;
            ibcRadio    : begin
                            oRadioButton  := rc_CreateRadioButton( Self, sboxForm, 'ibcRadioButton' + i.ToString , sboxForm.Width - 20 , 29, x, y ,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            oRadioButton.Caption   := '';//mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oRadioButton.Font.Size := 11;
                            oRadioButton.Checked   := mm.varA_FInputBoxCustom[ i ].CompDefaultValue;
                            oLabel := rc_CreateLabel( Self, sboxForm, 'ibcLabel' + i.ToString, sboxForm.Width - 20 , oRadioButton.Height, oRadioButton.Left + 21, oRadioButton.Top + 6,
                                                      mm.varA_FInputBoxCustom[ i ].CompLabelAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oLabel.Font.Size := 10;
                            y := y + 22;
                          end;
            ibcComboBox  : begin
                            oLabel := rc_CreateLabel( Self, sboxForm, 'ibcLabel' + i.ToString, sboxForm.Width - 20 , 20, x, y,
                                                      mm.varA_FInputBoxCustom[ i ].CompLabelAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oComboBox      := rc_CreateComboBox( Self, sboxForm, 'ibcComboBox' + i.ToString , sboxForm.Width - 20 , 38, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            if VarToStr(mm.varA_FInputBoxCustom[ i ].CompDefaultValue) <> '' then
                            begin
                                 oItems := SplitString(VarToStr(mm.varA_FInputBoxCustom[ i ].CompDefaultValue),',');
                                 for p := 0 to High(oItems) do
                                    oComboBox.Items.Add(oItems[p]);
                            end;
                            y := y + 70;
                          end;
       end;
    end;

  inherited;
    dm_rc.rc_ResizeBlocks( self );
end;

procedure TfrmInputBoxCustom.UniFormReady(Sender: TObject);
begin
  inherited;
     dm_rc.rc_ApplyEditMasks( Self );
end;

procedure TfrmInputBoxCustom.UniFormShow(Sender: TObject);
begin
  inherited;

  rc_AddCssClass( imgTipo , 'rc-rotator' );
end;

procedure TfrmInputBoxCustom.btnNoClick(Sender: TObject);
begin
  inherited;
   mm.varB_No := True;
   Self.ModalResult := mrCancel;
end;

procedure TfrmInputBoxCustom.btnOkClick(Sender: TObject);
var
   i : integer;
   oLabel : TUniLabel;
   oEdit  : TUniEdit;
   oEditDt  : TUniDateTimePicker;
   oEditNumber  : TUniNumberEdit;
   oEditFNumber : TUniFormattedNumberEdit;
   oMemo        : TUniMemo;
   oEditSpin    : TUniSpinEdit;
   oCheckBox    : TUniCheckBox;
   oRadioButton : TUniRadioButton;
   oComboBox    : TUniComboBox;
   oItems:TStringdynArray;
   sHints:string;
begin
  inherited;
    mm.varB_No := False;
    for i := 0 to High( mm.varA_FInputBoxCustom )  do
    begin
       case mm.varA_FInputBoxCustom[ i ].CompType of

            ibcEdit     : begin
                            oEdit  := TUniEdit( FindComponent( 'ibcEdit' + i.ToString ) );
                            if oEdit <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oEdit.Text;
                            end;
                          end;
            ibcPass     : begin
                            oEdit  := TUniEdit( FindComponent( 'ibcEditPass' + i.ToString ) );
                            if oEdit <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oEdit.Text;
                            end;
                          end;
            ibcDate     : begin
                            oEditDt  := TUniDateTimePicker( FindComponent( 'ibcDateTimePicker' + i.ToString ) );
                            if oEditDt <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oEditDt.DateTime;
                            end;
                          end;
            ibcNumber   : begin
                            oEditNumber  := TUniNumberEdit( FindComponent( 'ibcNumberEdit' + i.ToString ) );
                            if oEditNumber <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oEditNumber.Value;
                            end;
                          end;
            ibcFNumber  : begin
                            oEditFNumber  := TUniFormattedNumberEdit( FindComponent( 'ibcFormattedNumberEdit' + i.ToString ) );
                            if oEditFNumber <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oEditFNumber.Value;
                            end;
                          end;
            ibcMemo     : begin
                            oMemo  := TUniMemo( FindComponent( 'ibcMemo' + i.ToString ) );
                            if oMemo <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oMemo.Text;
                            end;
                          end;
            ibcSpin     : begin
                            oEditSpin  := TUniSpinEdit( FindComponent( 'ibcSpinEdit' + i.ToString ) );
                            if oEditSpin <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oEditSpin.Value;
                            end;
                          end;
            ibcCheckBox : begin
                            oCheckBox  := TUniCheckBox( FindComponent( 'ibcCheckBox' + i.ToString ) );
                            if oCheckBox <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oCheckBox.Checked;
                            end;
                          end;
            ibcRadio    : begin
                            oRadioButton  := TUniRadioButton( FindComponent( 'ibcRadioButton' + i.ToString ) );
                            if oRadioButton <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oRadioButton.Checked;
                            end;
                          end;
            ibcComboBox : begin
                               oComboBox := TUniComboBox(FindComponent('ibcComboBox' + i.ToString ) );
                               if oComboBox <> nil then
                               begin
                                    if oComboBox.ItemIndex <> -1 then
                                    begin
                                         if pos('cbbx:{',oComboBox.Hint) > 0 then
                                         begin
                                              sHints := rc_GetHintAttr('cbbx:',oComboBox.Hint);
                                              sHints := StringReplace(sHints,'{','',[]);
                                              sHints := StringReplace(sHints,'}','',[]);
                                              oItems := SplitString(sHints,',');
                                              if (length(oItems) >= oComboBox.ItemIndex) then
                                                 mm.varA_FInputBoxCustom[ i ].CompValue := oItems[oComboBox.ItemIndex];
                                         end else
                                         mm.varA_FInputBoxCustom[ i ].CompValue := oComboBox.Items[oComboBox.ItemIndex];
                                    end;
                               end;
                          end;

       end;
    end;

    if not rc_FormValidate( Self ) then
    begin
       Abort;
    end;
    Self.ModalResult := mrOk;
end;
end.

