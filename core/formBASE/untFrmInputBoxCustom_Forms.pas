unit untFrmInputBoxCustom_Forms; //8.1.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,system.Types,system.StrUtils,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniGUIBaseClasses, uniTimer, uniScrollBox, uniSpinEdit, uniMemo, uniCheckBox, uniRadioButton,
  uniButton, uniBitBtn, uniPanel, uniImage, uniLabel, uniHTMLFrame, uniEdit, uniSweetAlert, uniDateTimePicker, uniComboBox;

type
  TfrmInputBoxCustom_Forms = class(TfrmGenericModalForm)
    UniScrollBox1: TUniScrollBox;
    rcBlock4: TUniContainerPanel;
    labTitleForm: TUniLabel;
    rcBlock6: TUniContainerPanel;
    btnNo: TUniBitBtn;
    btnOk: TUniBitBtn;
    rcBlock2: TUniContainerPanel;
    imgTipo: TUniImage;
    labQuestions: TUniLabel;
    procedure btnOkClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    cMSG_APP_TERMINATED : string;
    procedure rc_Exit;
    procedure clickRadioOrCheck( sender : TObject );
  end;

function frmInputBoxCustom_Forms: TfrmInputBoxCustom_Forms;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_layout, mkm_translate, uconsts, uconsts_cfg, mkm_validate, mkm_createcomponents, untDM_RC,
  mkm_gridblock, mkm_func_web;

function frmInputBoxCustom_Forms: TfrmInputBoxCustom_Forms;
begin
  Result := TfrmInputBoxCustom_Forms(mm.GetFormInstance(TfrmInputBoxCustom_Forms));
end;

procedure TfrmInputBoxCustom_Forms.rc_Exit;
begin
      //timerClose.Enabled := true;
      //rc_AddCssClass( self, 'drop_out' );
end;
//8.1.0.0
procedure TfrmInputBoxCustom_Forms.UniFormBeforeShow(Sender: TObject);
var
   iQuestionId,iContinueIdx,i, x, y,f,p : integer;
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
   iBlockSeq    : integer;
   cAttr,
   cCompSeq     : string;
   oControl     : TUniControl;
   oScrollBox   : TUniScrollBox;
begin
//  inherited;
    iContinueIdx := StrToIntDef( rc_GetHintAttr( 'continue:', Self.Hint ), 0 );

    f           := StrToIntDef( rc_GetHintAttr( 'questions:', Self.Hint ), 0 );//8.1.0.0
    iQuestionId := StrToInt( rc_GetHintAttr( 'questionid:', Self.Hint ) );

    labQuestions.Caption := ( iQuestionId + 1 ).ToString + ' / ' + f.ToString;

    for f := 0 to High( mm.varA_FInputBoxCustom ) do
        if mm.varA_FInputBoxCustom[ f ].QuestionID = iQuestionId then
        begin
           iContinueIdx := f;
           break;
        end;

    x := 10;
    y := 10;
    for i := iContinueIdx to High( mm.varA_FInputBoxCustom )  do
    begin
       if mm.varA_FInputBoxCustom[ i ].QuestionID <> iQuestionId then break;
       cCompSeq    := iQuestionId.ToString + '_' + i.ToString;

       if i = iContinueIdx then
       begin
          //esconde o anterior
          if iQuestionId > 0 then
          begin
             iBlockSeq    := ( 10 * iQuestionId );
             oBlock      :=  TUniContainerPanel( FindComponent( 'rcBlock' + iBlockSeq.ToString ) );
             rc_ObjectStatus( oblock, False );
          end;
          //cria o proximo
          iBlockSeq    := ( 10 * ( iQuestionId + 1 ) );
          if ( mm.varA_FInputBoxCustom[ i ].CompType = ibcRadio ) or
             ( mm.varA_FInputBoxCustom[ i ].CompType = ibcCheckBox ) then
             oBlock      := rc_CreateBlock( Self, rcBlock6, iBlockSeq, 100, 60, '[[cols:12|noborder-all|scale:parent h:100%-top ]]', true )
          else
             oBlock      := rc_CreateBlock( Self, rcBlock6, iBlockSeq, 100, 68, '[[cols:12|noborder-all ]]', true );
          rc_ObjectStatus( oblock, True );
       end;

       cAttr := mm.varA_FInputBoxCustom[ i ].CompLabelAttr;
       if Pos( 'rc-label-wrap', cAttr ) = 0 then
          cAttr := rc_SetHintAttr( 'rc-label-wrap', 'cls:', cAttr , True);

       oControl := nil;
       case mm.varA_FInputBoxCustom[ i ].CompType of
            ibcEdit     : begin
                            oLabel := rc_CreateLabel( Self, oBlock, 'ibcLabel' + cCompSeq, oBlock.Width - 20 , 20, x, y,
                                                      cAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oEdit  := rc_CreateEdit ( Self, oBlock, 'ibcEdit' + cCompSeq , oBlock.Width - 20 , 38, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            if VarToStr(mm.varA_FInputBoxCustom[ i ].CompValue)<>'' then
                               oEdit.Text := VarToStr(mm.varA_FInputBoxCustom[ i ].CompValue)
                            else
                            if VarToStr(mm.varA_FInputBoxCustom[ i ].CompDefaultValue)<>'' then
                               oEdit.Text := VarToStr(mm.varA_FInputBoxCustom[ i ].CompDefaultValue);
                            y := y + 70;
                            oControl := oEdit;
                          end;
            ibcPass     : begin
                            oLabel := rc_CreateLabel( Self, oBlock, 'ibcLabel' + cCompSeq, oBlock.Width - 20 , 20, x, y,
                                                      cAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oEdit  := rc_CreateEdit ( Self, oBlock, 'ibcEditPass' + cCompSeq , oBlock.Width - 20 , 38, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            oEdit.PasswordChar := '*';
                            if VarToStr(mm.varA_FInputBoxCustom[ i ].CompDefaultValue)<>'' then
                               oEdit.Text := VarToStr(mm.varA_FInputBoxCustom[ i ].CompDefaultValue);
                            y := y + 70;
                            oControl := oEdit;
                          end;
            ibcDate     : begin
                            oLabel := rc_CreateLabel( Self, oBlock, 'ibcLabel' + cCompSeq, oBlock.Width - 20 , 20, x, y,
                                                      cAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oEditDt  := rc_CreateDateTimePicker( Self, oBlock, 'ibcDateTimePicker' + cCompSeq , oBlock.Width - 20 , 38, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            oEditDt.DateTime := 0;
                            oEditDt.ShowBlankDate := True;
                            if VarToStr(mm.varA_FInputBoxCustom[ i ].CompDefaultValue)<>'' then
                               oEditDt.DateTime := VarToDateTime(mm.varA_FInputBoxCustom[ i ].CompDefaultValue);
                            y := y + 70;
                            oControl := oEditDt;
                          end;
            ibcNumber   : begin
                            oLabel := rc_CreateLabel( Self, oBlock, 'ibcLabel' + cCompSeq, oBlock.Width - 20 , 20, x, y,
                                                      cAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oEditNumber  := rc_CreateNumberEdit( Self, oBlock, 'ibcNumberEdit' + cCompSeq , oBlock.Width - 20 , 38, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            if VarIsNumeric(mm.varA_FInputBoxCustom[ i ].CompDefaultValue) then
                               oEditNumber.Value := StrToFloat(mm.varA_FInputBoxCustom[ i ].CompDefaultValue);

                            y := y + 70;
                            oControl := oEditNumber;
                          end;
            ibcFNumber  : begin
                            oLabel := rc_CreateLabel( Self, oBlock, 'ibcLabel' + cCompSeq, oBlock.Width - 20 , 20, x, y,
                                                      cAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oEditFNumber  := rc_CreateFormattedNumberEdit( Self, oBlock, 'ibcFormattedNumberEdit' + cCompSeq , oBlock.Width - 20 , 38, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            if VarIsNumeric(mm.varA_FInputBoxCustom[ i ].CompDefaultValue) then
                               oEditFNumber.Value := StrToFloat(mm.varA_FInputBoxCustom[ i ].CompDefaultValue);

                            y := y + 70;
                            oControl := oEditFNumber;
                          end;
            ibcMemo     : begin
                            oLabel := rc_CreateLabel( Self, oBlock, 'ibcLabel' + cCompSeq, oBlock.Width - 20 , 20, x, y,
                                                      cAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oMemo  := rc_CreateMemo ( Self, oBlock, 'ibcMemo' + cCompSeq , oBlock.Width - 20 , 55, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            y := y + 51;
                          end;
            ibcSpin     : begin
                            oLabel := rc_CreateLabel( Self, oBlock, 'ibcLabel' + cCompSeq, oBlock.Width - 20 , 20, x, y,
                                                      cAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oEditSpin  := rc_CreateSpinEdit( Self, oBlock, 'ibcSpinEdit' + cCompSeq , oBlock.Width - 20 , 38, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            oEditSpin.Value := mm.varA_FInputBoxCustom[ i ].CompDefaultValue;
                            y := y + 70;
                            oControl := oEditSpin;
                          end;
            ibcCheckBox : begin
                            oCheckBox  := rc_CreateCheckBox( Self, oBlock, 'ibcCheckBox' + cCompSeq , oBlock.Width - 20 , 29, x, y,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            oCheckBox.Caption   := '';//mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oCheckBox.Font.Size := 11;
                            oCheckBox.Checked   := mm.varA_FInputBoxCustom[ i ].CompDefaultValue;
                            oCheckBox.OnClick   := clickRadioOrCheck;

                            oLabel := rc_CreateLabel( Self, oBlock, 'ibcCheckBoxLabel' + cCompSeq, oBlock.Width - 20 , oCheckBox.Height, oCheckBox.Left + 23, oCheckBox.Top + 3,
                                                      cAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oLabel.Font.Size := 11;
                            y := y + mm.varA_FInputBoxCustom[ i ].LabelHeight; // 58; //25;//8.0.0.0
                            oControl := oCheckBox;
                          end;
            ibcRadio    : begin
                            oRadioButton  := rc_CreateRadioButton( Self, oBlock, 'ibcRadioButton' + cCompSeq , oBlock.Width - 20 , 29, x, y ,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            oRadioButton.Caption   := '';
                            oRadioButton.Font.Size := 11;
                            oRadioButton.Checked   := mm.varA_FInputBoxCustom[ i ].CompValue;
                            if not oRadioButton.Checked then
                               oRadioButton.Checked   := mm.varA_FInputBoxCustom[ i ].CompDefaultValue;
                            oRadioButton.OnClick   := clickRadioOrCheck;

                            oLabel := rc_CreateLabel( Self, oBlock, 'ibcRadioButtonLabel' + cCompSeq, oBlock.Width - 20 , oRadioButton.Height, oRadioButton.Left + 23, oRadioButton.Top + 6,
                                                      cAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oLabel.Font.Size := 11;
                            y := y + mm.varA_FInputBoxCustom[ i ].LabelHeight; // 58; //25;//8.0.0.0
                            oControl := oRadioButton;
                          end;
            ibcComboBox  : begin
                            oLabel := rc_CreateLabel( Self, oBlock, 'ibcLabel' + cCompSeq, oBlock.Width - 20 , 20, x, y,
                                                      cAttr, true, true );
                            oLabel.Caption := mm.varA_FInputBoxCustom[ i ].CompLabel;
                            oComboBox      := rc_CreateComboBox( Self, oBlock, 'ibcComboBox' + cCompSeq , oBlock.Width - 20 , 38, x, y + 20,
                                                      mm.varA_FInputBoxCustom[ i ].CompTypeAttr, true, true );
                            if VarToStr(mm.varA_FInputBoxCustom[ i ].CompDefaultValue) <> '' then
                            begin
                                 oItems := SplitString(VarToStr(mm.varA_FInputBoxCustom[ i ].CompDefaultValue),',');
                                 for f := 0 to High(oItems) do
                                    oComboBox.Items.Add(oItems[f]);
                            end;
                            y := y + 70;
                            oControl := oComboBox;
                          end;
       end;
    end;
  inherited;
    dm_rc.rc_ResizeBlocks( self );

    If oControl <> nil then
    begin
       dm_rc.rc_SetFocus( oControl );
    end;

end;

procedure TfrmInputBoxCustom_Forms.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //8.1.0.0
  if key = 27 then
  begin
     key := 0; //8.0.0.0
     mm.varB_Yes := true;
     mm.varB_No  := true;
     Close;
  end;

  inherited;

end;

procedure TfrmInputBoxCustom_Forms.UniFormReady(Sender: TObject);
begin
  inherited;
     dm_rc.rc_ApplyEditMasks( Self );
end;

procedure TfrmInputBoxCustom_Forms.UniFormShow(Sender: TObject);
begin
  inherited;

  rc_AddCssClass( imgTipo , 'rc-rotator' );
end;

procedure TfrmInputBoxCustom_Forms.btnNoClick(Sender: TObject);
var
  iQuestionId : integer;
  oBlock : TUniContainer;
begin
  inherited;
   iQuestionId := StrToInt( rc_GetHintAttr( 'questionid:', Self.Hint ) );
   oBlock      := TUniContainerPanel( FindComponent( 'rcBlock' + ( 10 * ( iQuestionId + 1 ) ).ToString ) );
   rc_ObjectStatus( oblock, False );

   mm.varB_No := True;
   Self.ModalResult := mrCancel;
end;

procedure TfrmInputBoxCustom_Forms.btnOkClick(Sender: TObject);
var
   f,i : integer;
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
   bCheckOrRadio, bSelected : boolean;
   iQuestionId  : integer;
   cCompSeq     : string;
begin
  inherited;
    mm.varB_No := False;
    bSelected  := False;
    bCheckOrRadio := False;

    iQuestionId := StrToInt( rc_GetHintAttr( 'questionid:', Self.Hint ) );

    i := -1;
    for f := 0 to High( mm.varA_FInputBoxCustom ) do
        if mm.varA_FInputBoxCustom[ f ].QuestionID = iQuestionId then
        begin
           i := f;
           break;
        end;

    if i > 0 then
       f := i
    else
       f := 0;

    for i := f to High( mm.varA_FInputBoxCustom )  do
    begin

       if mm.varA_FInputBoxCustom[ i ].QuestionID <> iQuestionId then break;

       cCompSeq    := iQuestionId.ToString + '_' + i.ToString;
       case mm.varA_FInputBoxCustom[ i ].CompType of

            ibcEdit     : begin
                            oEdit  := TUniEdit( FindComponent( 'ibcEdit' + cCompSeq ) );
                            if oEdit <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oEdit.Text;
                            end;
                          end;
            ibcPass     : begin
                            oEdit  := TUniEdit( FindComponent( 'ibcEditPass' + cCompSeq ) );
                            if oEdit <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oEdit.Text;
                            end;
                          end;
            ibcDate     : begin
                            oEditDt  := TUniDateTimePicker( FindComponent( 'ibcDateTimePicker' + cCompSeq ) );
                            if oEditDt <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oEditDt.DateTime;
                            end;
                          end;
            ibcNumber   : begin
                            oEditNumber  := TUniNumberEdit( FindComponent( 'ibcNumberEdit' + cCompSeq ) );
                            if oEditNumber <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oEditNumber.Value;
                            end;
                          end;
            ibcFNumber  : begin
                            oEditFNumber  := TUniFormattedNumberEdit( FindComponent( 'ibcFormattedNumberEdit' + cCompSeq ) );
                            if oEditFNumber <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oEditFNumber.Value;
                            end;
                          end;
            ibcMemo     : begin
                            oMemo  := TUniMemo( FindComponent( 'ibcMemo' + cCompSeq ) );
                            if oMemo <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oMemo.Text;
                            end;
                          end;
            ibcSpin     : begin
                            oEditSpin  := TUniSpinEdit( FindComponent( 'ibcSpinEdit' + cCompSeq ) );
                            if oEditSpin <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oEditSpin.Value;
                            end;
                          end;
            ibcCheckBox : begin
                            oCheckBox  := TUniCheckBox( FindComponent( 'ibcCheckBox' + cCompSeq ) );
                            if oCheckBox <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oCheckBox.Checked;
                                 //8.0.0.0
                                 bCheckOrRadio := True;
                                 if not bSelected then
                                    bSelected := oCheckBox.Checked;
                            end;
                          end;
            ibcRadio    : begin
                            oRadioButton  := TUniRadioButton( FindComponent( 'ibcRadioButton' + cCompSeq ) );
                            if oRadioButton <> nil then
                            begin
                                 mm.varA_FInputBoxCustom[ i ].CompValue := oRadioButton.Checked;
                                 //8.0.0.0
                                 bCheckOrRadio := True;
                                 if not bSelected then
                                    bSelected := oRadioButton.Checked;
                            end;
                          end;
            ibcComboBox : begin
                               oComboBox := TUniComboBox(FindComponent('ibcComboBox' + cCompSeq ) );
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

       iQuestionId := mm.varA_FInputBoxCustom[ i ].QuestionID;
    end;

    if not rc_FormValidate( Self ) then
    begin
       Abort;
    end;

    if ( bCheckOrRadio and ( not bSelected ) ) then
    begin
       dm_rc.rc_ShowSweetAlertError( mm.MSG_SELECT_AN_OPTION );
       Abort;
    end;

    Self.ModalResult := mrOk;
end;
procedure TfrmInputBoxCustom_Forms.clickRadioOrCheck(sender: TObject);
var
   i : integer;
   cNumber, cName  : string;
   oLabel : TUniLabel;
begin
     cName := '';
     if Sender is TUniCheckBox then
     begin
         cName   := TUniCheckBox( sender ).Name;
         cNumber := ReturnNumbers( cName );
         cName   := ReturnLetters( cName ) + 'Label' + cNumber;
     end
     else
     if Sender is TUniRadioButton then
     begin
         cName   := TUniRadioButton( sender ).Name;
         cNumber := ReturnNumbers( cName );
         cName   := ReturnLetters( cName ) + 'Label' + cNumber;
     end;

     if cName <> '' then
     begin
         for I := 0 to High( mm.varA_FInputBoxCustom ) do
         begin
            oLabel  := TUniLabel(  FindComponent( ReturnLetters( cName ) + i.ToString ) );
            If oLabel <> nil then
            begin
               oLabel.Caption := StringReplace( oLabel.Caption, '<b>', '', [rfReplaceAll] ) ;
               oLabel.Caption := StringReplace( oLabel.Caption, '</b>', '', [rfReplaceAll] ) ;
               if Pos( cNumber, oLabel.Name ) > 0 then
                  oLabel.Caption := '<b>' + oLabel.Caption + '</b>';
            end;
         end;
     end;
end;

end.

