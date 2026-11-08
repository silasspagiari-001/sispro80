unit untFrmDEMO_MESSAGES;//8.3.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmDEMO_MESSAGES = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    UniLabel35: TUniLabel;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1000: TUniContainerPanel;
    rcBlock128: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    rcBlock126: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    btnToastSucces: TUniBitBtn;
    btnToastWarning: TUniBitBtn;
    btnToastError: TUniBitBtn;
    btnToastInfo: TUniBitBtn;
    chkSound: TUniLabel;
    UniLabel4: TUniLabel;
    rcBlock124: TUniContainerPanel;
    paSweetHeader: TUniContainerPanel;
    btnSweetSuccess: TUniBitBtn;
    btnSweetWarning: TUniBitBtn;
    btnSweetError: TUniBitBtn;
    btnSweetInfo: TUniBitBtn;
    rcBlock122: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    btnSuccess1: TUniBitBtn;
    btnShowMsgInfo: TUniBitBtn;
    btnShowWarning: TUniBitBtn;
    btnSweetQuestion: TUniBitBtn;
    UniContainerPanel4: TUniContainerPanel;
    chkPassword: TUniLabel;
    UniLabel2: TUniLabel;
    chkPeriod: TUniLabel;
    Period: TUniLabel;
    rcBlock200: TUniContainerPanel;
    UniContainerPanel3Clone: TUniContainerPanel;
    UniBitBtn1Clone: TUniBitBtn;
    btnSuccess1Clone: TUniBitBtn;
    btnShowMsgInfoClone: TUniBitBtn;
    btnShowWarningClone: TUniBitBtn;
    rcBlock195: TUniContainerPanel;
    UniContainerPanel6: TUniContainerPanel;
    UniBitBtn2: TUniBitBtn;
    UniBitBtn3: TUniBitBtn;
    UniBitBtn4: TUniBitBtn;
    UniBitBtn5: TUniBitBtn;
    rcBlock150: TUniContainerPanel;
    rcBlock151: TUniContainerPanel;
    rcBlock152: TUniContainerPanel;
    btnCloseClone: TUniBitBtn;
    rcBlock153: TUniContainerPanel;
    btnRedClone: TUniBitBtn;
    rcBlock154: TUniContainerPanel;
    btnGreenClone: TUniBitBtn;
    rcBlock184: TUniContainerPanel;
    btnGrayClone: TUniBitBtn;
    rcBlock186: TUniContainerPanel;
    btnSilverClone: TUniBitBtn;
    rcBlock188: TUniContainerPanel;
    btnCrudClone: TUniBitBtn;
    rcBlock164: TUniContainerPanel;
    btnOrangeClone: TUniBitBtn;
    rcBlock168: TUniContainerPanel;
    btnBlueClone: TUniBitBtn;
    rcBlock170: TUniContainerPanel;
    btnDarkClone: TUniBitBtn;
    rcBlock172: TUniContainerPanel;
    UniBitBtn6: TUniBitBtn;
    rcBloc: TUniContainerPanel;
    rcBlock156: TUniContainerPanel;
    UniBitBtn8: TUniBitBtn;
    btnComboBox: TUniBitBtn;
    paPanelOptions: TUniContainerPanel;
    rcBlock2000: TUniContainerPanel;
    UniLabel9: TUniLabel;
    labClosePanelOptions: TUniLabel;
    Label5: TUniLabel;
    UniLabel10: TUniLabel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    edIni: TUniNumberEdit;
    edEnd: TUniNumberEdit;
    rcBlock175: TUniContainerPanel;
    UniContainerPanel8: TUniContainerPanel;
    UniBitBtn7: TUniBitBtn;
    btnObject: TUniBitBtn;
    paPanelOpt2: TUniContainerPanel;
    rcBlock2200: TUniContainerPanel;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniBitBtn9: TUniBitBtn;
    UniBitBtn10: TUniBitBtn;
    UniNumberEdit1: TUniNumberEdit;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    UniLabel20: TUniLabel;
    UniLabel21: TUniLabel;
    UniLabel22: TUniLabel;
    btnQuestionInput: TUniBitBtn;
    btnInputShow: TUniBitBtn;
    UniBitBtn11: TUniBitBtn;
    paLottie: TUniContainerPanel;
    swtAnims: TUniLabel;
    UniLabel1: TUniLabel;
    edLottieFile: TUniEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSuccess1Click(Sender: TObject);
    procedure btnShowMsgInfoClick(Sender: TObject);
    procedure btnShowWarningClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnSweetSuccessClick(Sender: TObject);
    procedure btnSweetInfoClick(Sender: TObject);
    procedure btnSweetWarningClick(Sender: TObject);
    procedure btnSweetErrorClick(Sender: TObject);
    procedure btnToastSuccesClick(Sender: TObject);
    procedure btnToastInfoClick(Sender: TObject);
    procedure btnToastWarningClick(Sender: TObject);
    procedure btnToastErrorClick(Sender: TObject);
    procedure btnQuestionInputClick(Sender: TObject);
    procedure btnInputShowClick(Sender: TObject);
    procedure btnSweetQuestionClick(Sender: TObject);
    procedure btnSuccess1CloneClick(Sender: TObject);
    procedure btnShowMsgInfoCloneClick(Sender: TObject);
    procedure btnShowWarningCloneClick(Sender: TObject);
    procedure UniBitBtn1CloneClick(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
    procedure UniBitBtn4Click(Sender: TObject);
    procedure UniBitBtn5Click(Sender: TObject);
    procedure UniBitBtn3Click(Sender: TObject);
    procedure btnCloseCloneClick(Sender: TObject);
    procedure btnRedCloneClick(Sender: TObject);
    procedure btnGreenCloneClick(Sender: TObject);
    procedure btnDarkCloneClick(Sender: TObject);
    procedure btnGrayCloneClick(Sender: TObject);
    procedure btnOrangeCloneClick(Sender: TObject);
    procedure btnSilverCloneClick(Sender: TObject);
    procedure btnCrudCloneClick(Sender: TObject);
    procedure btnBlueCloneClick(Sender: TObject);
    procedure btnComboBoxClick(Sender: TObject);
    procedure UniBitBtn8Click(Sender: TObject);
    procedure UniBitBtn6Click(Sender: TObject);
    procedure labClosePanelOptionsClick(Sender: TObject);
    procedure UniBitBtn7Click(Sender: TObject);
    procedure btnObjectClick(Sender: TObject);
    procedure UniLabel13Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure UniBitBtn9Click(Sender: TObject);
    procedure UniBitBtn11Click(Sender: TObject);

  private
    { Private declarations }
    procedure sweetAlertCallBack( Sender: TObject );//8.0.0.0
    procedure sweetAlertConfirmCallBack( Sender: TObject );
    procedure sweetAlertCancelCallBack( Sender: TObject; const Reason: TDismissType);
  public
    { Public declarations }

    iSlides, iSlideCount : integer;

    pObj : TUniControl;

  end;

implementation

{$R *.dfm}

uses Main, ServerModule, MainModule, mkm_gridblock,
  mkm_layout, uconsts, uconsts_cfg, mkm_anim, untDM_RC, mkm_translate, mkm_func_web, str_func, untFrmInputBoxCustom;

  //8.0.0.0
procedure TfrmDEMO_MESSAGES.sweetAlertCallBack(Sender: TObject);
begin
//
end;

procedure TfrmDEMO_MESSAGES.btnBlueCloneClick(Sender: TObject);
begin
    dm_rc.rc_AddToInputBoxCustom( true , ibcMemo, '' , 'What is you wish ?' , '', '', '' );

    dm_rc.rc_ShowInputBoxCustom( 'Form Test' );
    // se nao clicou em cancelar | if do not click on cancel button
    if not mm.varB_No then
       dm_rc.rc_ShowSweetAlertSimple( 'Your wish is:' + dm_rc.rc_GetInputBoxCustomValue );
end;

procedure TfrmDEMO_MESSAGES.btnCloseClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmDEMO_MESSAGES.btnCloseCloneClick(Sender: TObject);
begin
    dm_rc.rc_AddToInputBoxCustom( true , ibcEdit, '[[valid:blank=Name]]' , 'What is your name ?'  , '', '', '' );
    dm_rc.rc_AddToInputBoxCustom( false, ibcEdit, '[[valid:blank=Email]]', 'What is your email ?' , '', '', '' );
    dm_rc.rc_ShowInputBoxCustom( 'Form Test' );
    // se nao clicou em cancelar | if do not click on cancel button
    if not mm.varB_No then
       dm_rc.rc_ShowSweetAlertSimple( 'Your name is:' + dm_rc.rc_GetInputBoxCustomValue ) ;
end;
//soon
procedure TfrmDEMO_MESSAGES.btnComboBoxClick(Sender: TObject);
begin
dm_rc.rc_ShowSweetAlertSimple( 'Soon...Em Breve ' );
//    SetLength( mm.varA_FInputBoxCustom, 3);
//    mm.varA_FInputBoxCustom[ 00 ].CompLabel    := 'Soccer';
//    mm.varA_FInputBoxCustom[ 00 ].CompType     := ibcComboBox;
//    mm.varA_FInputBoxCustom[ 00 ].CompValue    := -1;
//    mm.varA_FInputBoxCustom[ 00 ].CompDefaultValue := 0;
//
//    //mm.varA_FInputBoxCustom[ 00 ].CompTypeAttr := '[[mask:password|]]';
//    dm_rc.rc_ShowInputBoxCustom( 'What is your favorite sport ?', mm.varA_FInputBoxCustom );
//    // pegar resposta
//    // get answer
//    cItems   := '';
//    cAnswers := '';
//    for i := 0 to High( mm.varA_FInputBoxCustom )  do
//    begin
//         if mm.varA_FInputBoxCustom[ i ].CompValue then
//         begin
//            cItems := cItems + i.ToString;
//            cAnswers := cAnswers + mm.varA_FInputBoxCustom[ i ].CompLabel + '|';
//         end;
//    end;
//    if cItems <> '' then
//       dm_rc.rc_ShowSweetAlertSimple( 'Your(s) pet(s): ' + cAnswers );
end;

procedure TfrmDEMO_MESSAGES.btnCrudCloneClick(Sender: TObject);
begin
    dm_rc.rc_AddToInputBoxCustom( true , ibcFNumber, '' , 'How much is your app?' , '', 0, 0 );

    dm_rc.rc_ShowInputBoxCustom( 'Form Test' );
    // se nao clicou em cancelar | if do not click on cancel button
    if not mm.varB_No then
       dm_rc.rc_ShowSweetAlertSimple( 'Your app price is:' + FloatToStrF ( dm_rc.rc_GetInputBoxCustomValue, ffNumber, 10, 2 ) );
end;

procedure TfrmDEMO_MESSAGES.btnDarkCloneClick(Sender: TObject);
begin
    dm_rc.rc_AddToInputBoxCustom( true , ibcCheckBox, '' , 'Cat'  , '', False, False );
    dm_rc.rc_AddToInputBoxCustom( false, ibcCheckBox, '' , 'Dog'  , '', False, False );
    dm_rc.rc_AddToInputBoxCustom( false, ibcCheckBox, '' , 'Bird' , '', False, False );
    dm_rc.rc_AddToInputBoxCustom( false, ibcCheckBox, '' , 'Fish' , '', False, False );

    dm_rc.rc_ShowInputBoxCustom( 'What is/are your(s) favorite(s) pet ?' );
    // se nao clicou em cancelar | if do not click on cancel button
    if not mm.varB_No then
       dm_rc.rc_ShowSweetAlertSimple( 'Your pet(s): ' + dm_rc.rc_GetInputBoxCustomAnswer( false ) + #13#10 +
                                      'Item: ' + dm_rc.rc_GetInputBoxCustomAnswer );
end;

procedure TfrmDEMO_MESSAGES.btnGrayCloneClick(Sender: TObject);
begin
    dm_rc.rc_AddToInputBoxCustom( true , ibcRadio, '' , 'Red'    , '', False, True );
    dm_rc.rc_AddToInputBoxCustom( false, ibcRadio, '' , 'Blue'   , '', False, False );
    dm_rc.rc_AddToInputBoxCustom( false, ibcRadio, '' , 'Yellow' , '', False, False );

    dm_rc.rc_ShowInputBoxCustom( 'What is your favorite color ?' );
    // se nao clicou em cancelar | if do not click on cancel button
    if not mm.varB_No then
       dm_rc.rc_ShowSweetAlertSimple( 'Your Colors: ' + dm_rc.rc_GetInputBoxCustomAnswer( false ) + #13#10 +
                                      'Item: ' + dm_rc.rc_GetInputBoxCustomAnswer );
end;

procedure TfrmDEMO_MESSAGES.btnGreenCloneClick(Sender: TObject);
begin
    dm_rc.rc_AddToInputBoxCustom( true , ibcDate, '' , 'What is your birthday ?' , '', '', '' );

    dm_rc.rc_ShowInputBoxCustom( 'Form Test' );
    // se nao clicou em cancelar | if do not click on cancel button
    if not mm.varB_No then
       dm_rc.rc_ShowSweetAlertSimple( 'Your date is:' + DateToStr( dm_rc.rc_GetInputBoxCustomValue ) );
end;

procedure TfrmDEMO_MESSAGES.btnInputShowClick(Sender: TObject);
begin
     if chkPeriod.tag = 1 then
        dm_rc.rc_ShowInputBox( 'Report Period' , 'Start' , '', 'End', '', false, true, true )
     else
     begin
       dm_rc.rc_ShowInputBox( 'Admin required' , 'Enter info1' , '', 'Enter info2', '', ( chkPassword.tag = 1 ) );

       dm_rc.rc_ShowSweetAlert( 'Sucess!', 'Field 1:' + mm.varC_InputBox_Result1 + sLineBreak +
                                             'Field 2:' + mm.varC_InputBox_Result2 , swtSuccess  )
     end;
end;

procedure TfrmDEMO_MESSAGES.btnOrangeCloneClick(Sender: TObject);
begin
    dm_rc.rc_AddToInputBoxCustom( true , ibcSpin, '' , 'How many customers do you need ?' , '', 2, 0 );

    dm_rc.rc_ShowInputBoxCustom( 'Form Test' );
    // se nao clicou em cancelar | if do not click on cancel button
    if not mm.varB_No then
       dm_rc.rc_ShowSweetAlertSimple( 'Your need ' + IntToStr( dm_rc.rc_GetInputBoxCustomValue ) + ' customers.' );
end;

procedure TfrmDEMO_MESSAGES.btnQuestionInputClick(Sender: TObject);
begin
  //if mm.varB_Yes then
  if dm_rc.rc_ShowYesNo( 'Confirm ?' ) then
  begin
     dm_rc.rc_ShowYesNo( 'Really yes ?' );
     //dm_rc.rc_ShowMessage( 'confirmed' );
     dm_rc.rc_ShowSweetAlert( 'Sucess!', 'Clicked YES', swtSuccess  ) ;
     //dm_rc.rc_ShowSweetAlertError('falha...' );
     //dm_rc.rc_ShowError( 'teste de erro' );
  end
  else
  begin
     dm_rc.rc_ShowYesNo( 'Really No ?' );
     //dm_rc.rc_ShowMessage( 'bye' );
     dm_rc.rc_ShowSweetAlert( 'Warning!', 'Clicked NO', swtWarning  );
  end;
end;
procedure TfrmDEMO_MESSAGES.btnRedCloneClick(Sender: TObject);
begin
    dm_rc.rc_AddToInputBoxCustom( true , ibcPass, '' , 'What is your password ?' , '', '', '' );

    dm_rc.rc_ShowInputBoxCustom( 'Form Test' );
    // se nao clicou em cancelar | if do not click on cancel button
    if not mm.varB_No then
       dm_rc.rc_ShowSweetAlertSimple( 'Your pass is:' + dm_rc.rc_GetInputBoxCustomValue );
end;

//
procedure TfrmDEMO_MESSAGES.btnShowMsgInfoClick(Sender: TObject);
begin
     dm_rc.rc_ShowMessage( 'You Win!!!' , 'info' );
     //dm_rc.rc_ShowInfo( 'You Win!!!' );
end;

procedure TfrmDEMO_MESSAGES.btnShowMsgInfoCloneClick(Sender: TObject);
begin
     dm_rc.rc_ShowMessage( 'Processed!!!<br>Aligned On Right with 40px offset' , 'info' , 360, 360, '[[frm-align:right off-right:40 off-top:40]]');
end;

procedure TfrmDEMO_MESSAGES.btnShowWarningClick(Sender: TObject);
begin
     dm_rc.rc_ShowMessage( 'Invalid Input' , 'warning' );
     //dm_rc.rc_ShowWarning( 'You Win!!!' );
end;

procedure TfrmDEMO_MESSAGES.btnShowWarningCloneClick(Sender: TObject);
begin
     dm_rc.rc_ShowMessage( 'Processed!!!<br>Aligned On Left with 40px offset' , 'warning' , 360, 360, '[[frm-align:left off-left:40 off-top:40]]');
end;
procedure TfrmDEMO_MESSAGES.btnSilverCloneClick(Sender: TObject);
begin
    dm_rc.rc_AddToInputBoxCustom( true , ibcNumber, '' , 'What is your age ?' , '', 0, 0 );

    dm_rc.rc_ShowInputBoxCustom( 'Form Test' );
    // se nao clicou em cancelar | if do not click on cancel button
    if not mm.varB_No then
       dm_rc.rc_ShowSweetAlertSimple( 'Your age is:' + IntToStr( dm_rc.rc_GetInputBoxCustomValue ) );
end;


procedure TfrmDEMO_MESSAGES.btnSuccess1Click(Sender: TObject);
begin
     if swtAnims.Tag = 1 then
       dm_rc.rc_ShowMessage( 'Processed!!!' , 'success', 360, 360, '', '142473-online-payment.json' )
     else
       dm_rc.rc_ShowMessage( 'Processed!!!' , 'success', 360, 360, '', '' );
end;

procedure TfrmDEMO_MESSAGES.btnSuccess1CloneClick(Sender: TObject);
begin
     dm_rc.rc_ShowMessage( 'Processed!!!<br>Aligned On Top with 40px offset' , 'success' , 360, 360, '[[frm-align:top off-top:40 ]]');
end;

procedure TfrmDEMO_MESSAGES.UniBitBtn1CloneClick(Sender: TObject);
begin
     dm_rc.rc_ShowMessage( 'Processed!!!<br>Aligned On Bottom with 40px offset Right' , 'error' , 360, 360, '[[frm-anim:bt | frm-align:bottom off-right:40 off-bottom:40 ]]'); // 6.0.0.0
end;
//[PT] não criei uma função específica pois a quantidade de parâmetros é muito grande.
//[EN] I didn't create a specific function because the number of parameters is too large.
// mais informações sobre os parâmetros | more info about parameters
//
// https://catc.github.io/iGrowl/
procedure TfrmDEMO_MESSAGES.UniBitBtn2Click(Sender: TObject);
begin
  UniSession.AddJS(
  '$.iGrowl({' +
   ' title: ''Having issues?'',' +
   ' delay: 50000,' +
   ' message: ''Chat with a technician for support'',' +
   ' icon: ''vicons-support''' +
   '})	' );
end;

procedure TfrmDEMO_MESSAGES.UniBitBtn3Click(Sender: TObject);
begin
UniSession.AddJS(
   '$.iGrowl({' +
   ' type: ''notice'',' +
   ' message: ''The item has been added to your cart'',' +
   ' icon: ''vicons-cart'',' +
   ' placement : {' +
   '  x: 	''center''' +
   ' },' +
   ' animShow: ''fadeInLeftBig'',' +
   ' animHide: ''fadeOutDown''' +
   //' onHidden: function(){' +
   //'  alert(''alert is now hidden!'')' +
   //' }' +
   '})	' );

end;

procedure TfrmDEMO_MESSAGES.UniBitBtn4Click(Sender: TObject);
begin
UniSession.AddJS(
   '$.iGrowl({' +
   ' type: ''error'',' +
   ' title: ''Uh oh - something went wrong!'',' +
   ' icon: ''linecons-fire'',' +
   ' placement : {' +
   '  x: 	''center'',' +
   '  y: 	''bottom''' +
   ' }' +
   '})	' );

end;

procedure TfrmDEMO_MESSAGES.UniBitBtn5Click(Sender: TObject);
begin
UniSession.AddJS(
   '$.iGrowl({' +
   ' type: ''notice'',' +
   ' delay: 5000,' +
   ' title: ''New friend request'',' +
   ' message: ''Greg Jackson has sent you a friend invite!'',' +
   ' image: {' +
   '  src: ''./files/images/avatars/avatar_8.png'',' +
   '  class: ''example-image''' +
   ' }' +
   '})	' );

end;
//8.1.0.0
procedure TfrmDEMO_MESSAGES.UniBitBtn6Click(Sender: TObject);
const
     iQuestions = 4;  //definir o total de formulários de perguntas
var
   aAnswers : Array[0..iQuestions-1] of string;
   //aAnswers : Array[1..iQuestions] of string;
   aOptions : Array[0..4] of String; //A B C D E
   aLabels  : Array[0..4] of String;
   iSeq, iOption  : integer;
   bClose, bFinished : boolean;//8.1.0.0
   cAnswer : string;

   //chamada final para revisão das respostas
   procedure review;
   var
      cMsg : string;
      i    : integer;
   begin
      cMsg := '';
      for i := 0 to iQuestions-1 do
          cMsg := cMsg + 'Question ' + i.ToString + ': Option ' + aAnswers[ i ] + #13#10 + #13#10 ;

      dm_rc.rc_ShowYesNo( cMsg );
   end;
   //primeira pergunta
   procedure question_1 ( pFormSeq : integer );
   var
      i    : integer;
      bSelected : boolean;
   begin
       dm_rc.rc_AddToInputBoxCustom( false, //true ,//8.1.0.0
                                     ibcEdit,
                                     '[[valid:blank=Name]]' ,
                                     'What is your name ?'  ,
                                     '',
                                     aAnswers[ pFormSeq ] , //array com as possiveis respostas para controle de retorno a questão anterior
                                     '',
                                     30,
                                     pFormSeq );

       dm_rc.rc_ShowInputBoxCustom( '<b>1 - Identificação</b>',
                                    False,
                                    '',//'[[cls:ButtonThemeCrud|center:parent x:-95]]',
                                    '[[cls:ButtonThemeCrud|center:parent x]]',
                                    '', 'Próxima',
                                    False,
                                    True,
                                    '[[height:480|width:700|questions:' + iQuestions.ToString +']]' ,
                                    pFormSeq);
   end;
   //segunda pergunta
   procedure question_2 ( pFormSeq : integer );
   var
      i    : integer;
      bSelected : boolean;
   begin
       dm_rc.rc_AddToInputBoxCustom( false, //true ,//8.1.0.0
                                     ibcEdit, '[[valid:blank=Email]]', 'What is your email ?' , '', aAnswers[ pFormSeq ] , '', 30, pFormSeq );

       dm_rc.rc_ShowInputBoxCustom( '<b>2 - Contato</b>',
                                    true,
                                    '[[cls:ButtonThemeCrud|center:parent x:-95]]',
                                    '[[cls:ButtonThemeCrud|align:btnNo r:10]]',
                                    'Anterior', 'Próxima',
                                    False, //continue...
                                    True, '[[height:480|width:700|questions:' + iQuestions.ToString +']]' ,
                                    pFormSeq );
   end;
   //terceira pergunta
   procedure question_3 ( pFormSeq : integer );
   var
      i    : integer;
      bSelected : boolean;
   begin
       aLabels [ 00 ] := 'A) Sempre cumpre as normas e deveres, além de contribuir para a manutenção da ordem no ambiente de trabalho.';
       aLabels [ 01 ] := 'B) Mantém um comportamento satisfatório , atendendo as normas e deveres da unidade.';
       aLabels [ 02 ] := 'C) Mantém um comportamento satisfatório , mas não atende as normas e deveres da unidade.';
       aLabels [ 03 ] := 'D) Eventualmente descumpre as determinações que lhe são atribuídas e tem um comportamento instável no grupo.';
       aLabels [ 04 ] := 'E) Mostra-se resistente a cumprir normas e deveres e sempre influencia negativamente no comportamento do grupo.';

       for i := 0 to High( aLabels ) do // 4 do
       begin
            bSelected := aAnswers[ pFormSeq ] = aOptions[ i ]; //possivel resposta para controle de retorno a questão anterior
            if bSelected then
               aLabels [ i ] := '<b>' + aLabels [ i ] + '</b>';
            dm_rc.rc_AddToInputBoxCustom( false, //i = 0 ,//8.1.0.0
                                          ibcRadio, '' , aLabels [ i ]  , '', bSelected, bSelected, 64, pFormSeq );
       end;

       dm_rc.rc_ShowInputBoxCustom( '<b>3 -  ?</b>',
                                    true,
                                    '[[cls:ButtonThemeCrud|center:parent x:-95]]',
                                    '[[cls:ButtonThemeCrud|align:btnNo r:10]]',
                                    'Anterior', 'Próxima',
                                    False, //continue...
                                    True, '[[height:580|width:900|questions:' + iQuestions.ToString +']]' ,
                                    pFormSeq );

   end;
   //quarta pergunta
   procedure question_4 ( pFormSeq : integer );
   var
      i    : integer;
      bSelected : boolean;
   begin
       aLabels [ 00 ] := 'A) Tem facilidade em buscar soluções para situações imprevistas do trabalho, quando solicitado.';
       aLabels [ 01 ] := 'B) Esforça-se para solucionar algumas situações imprevistas na execução do trabalho.';
       aLabels [ 02 ] := 'C) Eventualmente apresenta soluções para situações imprevistas do trabalho, quando solicitado.';
       aLabels [ 03 ] := 'D) Mostra pouco interesse em solucionar problemas decorrentes de situações imprevistas na execução do trabalho.';
       aLabels [ 04 ] := 'E) Deixa de solucionar problemas decorrentes de situações imprevistas na execução do trabalho.';

       for i := 0 to High( aLabels ) do // 4 do
       begin
            bSelected := aAnswers[ pFormSeq ] = aOptions[ i ];
            if bSelected then
               aLabels [ i ] := '<b>' + aLabels [ i ] + '</b>';
            //8.1.0.0
            //dm_rc.rc_AddToInputBoxCustom( i = 0 , ibcRadio, '' , aLabels [ i ]  , '', bSelected, bSelected, 64, pFormSeq );
            dm_rc.rc_AddToInputBoxCustom( false , ibcRadio, '' , aLabels [ i ]  , '', bSelected, bSelected, 64, pFormSeq );
       end;

       dm_rc.rc_ShowInputBoxCustom( '<b>4 - INICIATIVA: Observa sistematicamente os regulamentos e as normas emanadas das autoridades competentes.?</b>',
                                    true,
                                    '[[cls:ButtonThemeCrud|center:parent x:-95]]',
                                    '[[cls:ButtonThemeCrud|align:btnNo r:10]]',
                                    'Anterior', 'Encerrar',
                                    False, //continue...
                                    True, '[[height:580|width:900|questions:' + iQuestions.ToString +']]' ,
                                    pFormSeq );
   end;
begin
   SetLength( mm.varA_FInputBoxCustom, 0 );

   //definicao do numero de alternativas padrão para questionário de multipla escolha
   aOptions[0] := 'A';
   aOptions[1] := 'B';
   aOptions[2] := 'C';
   aOptions[3] := 'D';
   aOptions[4] := 'E';

   bFinished  := False;
   iSeq       := 0;

   Repeat

      case iSeq of

         0: question_1( iSeq );

         1: question_2( iSeq );

         2: question_3( iSeq );

         3: question_4( iSeq );

         //4: question_5( iSeq );
         //5: question_6( iSeq );

      end;

      //clicou em "PROXIMA PERGUNTA ou ENCERRAR?( são os títulos padrões )
      if not mm.varB_No then
      begin
          case mm.varA_FInputBoxCustom[ iSeq ].CompType of

               ibcEdit,
               ibcPass,
               ibcDate,
               ibcNumber,
               ibcFNumber,
               ibcMemo,
               ibcComboBox,
               ibcSpin : aAnswers[ iSeq ] := dm_rc.rc_GetInputBoxCustomValue; //Conteudo do campo

               ibcCheckBox,
               ibcRadio    : begin
                               iOption := StrToIntDef( dm_rc.rc_GetInputBoxCustomAnswer( True, iSeq ), -1 );
                               if iOption >= 0 then
                                  aAnswers[ iSeq ] := aOptions[ iOption ]; //A B C D E
                             end;
          end;

         Inc( iSeq );
      end
      else
      begin
         Dec( iSeq ); //voltar pro formulario anterior...
         If iSeq < 0 then
            iSeq := 0;  // fixar no primeiro form
      end;

      //8.1.0.0
      bClose := ( mm.varB_No ) and (  mm.varB_Yes );

      bFinished := ( iSeq + 1 ) > iQuestions;
      //8.1.0.0
      If ( not bClose ) and ( bFinished ) then
      begin
         review;
         bFinished := mm.varB_Yes;
      end;

   Until ( bFinished ) or ( bClose );//8.1.0.0

end;


procedure TfrmDEMO_MESSAGES.UniBitBtn7Click(Sender: TObject);
begin
     dm_rc.rc_ShowHideObject( self,
                              paPanelOptions,
                              0,
                              0,
                              1,
                              false,
                              ( paPanelOptions.Tag = 0 ),
                              true );
end;

procedure TfrmDEMO_MESSAGES.UniBitBtn8Click(Sender: TObject);
begin
    dm_rc.rc_AddToInputBoxCustom( true , ibcRadio, '' , 'Red'    , '', False, True );
    dm_rc.rc_AddToInputBoxCustom( false, ibcRadio, '' , 'Blue'   , '', False, False );
    dm_rc.rc_AddToInputBoxCustom( false, ibcRadio, '' , 'Yellow' , '', False, False );

    dm_rc.rc_ShowInputBoxCustom( 'What is your favorite color ?', false );
    // se nao clicou em cancelar | if do not click on cancel button
    if not mm.varB_No then
       dm_rc.rc_ShowSweetAlertSimple( 'Your color is ' + dm_rc.rc_GetInputBoxCustomAnswer( false ) + #13#10 +
                                      'Item: ' + dm_rc.rc_GetInputBoxCustomAnswer );
end;
procedure TfrmDEMO_MESSAGES.UniBitBtn9Click(Sender: TObject);
begin

end;

// 6.0.0.0 - ajustar alin. com object
procedure TfrmDEMO_MESSAGES.btnObjectClick(Sender: TObject);
begin

     dm_rc.rc_ShowHideObject( rcBlock175,
                              paPanelOptions,
                              //rcBlock175.left + btnObject.Left + 60,
                              rcBlock175.left ,
                              rcBlock175.Top,
                              1,
                              false,
                              ( paPanelOptions.Tag = 0 ),
                              false );
end;

procedure TfrmDEMO_MESSAGES.btnOkClick(Sender: TObject);
begin
     dm_rc.rc_ShowHideObject( self,
                              paPanelOpt2,
                              0,
                              0,
                              1,
                              false,
                              ( paPanelOpt2.Tag = 0 ),
                              true );
end;

procedure TfrmDEMO_MESSAGES.btnSweetErrorClick(Sender: TObject);
begin
     dm_rc.rc_ShowSweetAlert( 'Error!', 'Sorry...', swtError );
end;

procedure TfrmDEMO_MESSAGES.btnSweetInfoClick(Sender: TObject);
begin
     dm_rc.rc_ShowSweetAlert( 'Info!', 'Use Masks.', swtInfo );
end;

procedure TfrmDEMO_MESSAGES.btnSweetQuestionClick(Sender: TObject);
begin
    dm_rc.rc_ShowSweetAlertQuestion( 'Are you enjoying RadCORE?', self , sweetAlertConfirmCallBack, sweetAlertCancelCallBack  );
end;
//8.0.0.0
procedure TfrmDEMO_MESSAGES.btnSweetSuccessClick(Sender: TObject);
begin
    dm_rc.rc_ShowSweetAlert( 'Sucess!', 'Use Masks.', swtSuccess , self, 'edLottieFile', '' );//edLottieFile é o nome do edit q vai receber o foco
end;

procedure TfrmDEMO_MESSAGES.btnSweetWarningClick(Sender: TObject);
begin
     dm_rc.rc_ShowSweetAlert( 'Alert!', 'Use Masks.', swtWarning );
end;

procedure TfrmDEMO_MESSAGES.btnToastErrorClick(Sender: TObject);
begin
     //dm_rc.rc_ShowToaster( 'error', 'RadCORE helps you !', (chkSound.tag = 1), 'pinItUp' );
     dm_rc.rc_ShowToaster( ttyError, 'Come back.. Come to RadCORE !' , (chkSound.tag = 1), ttrPinItUp ); //7.4.0.0
end;

procedure TfrmDEMO_MESSAGES.btnToastInfoClick(Sender: TObject);
begin
     //dm_rc.rc_ShowToaster( 'info', 'RadCORE it´s nice !', (chkSound.tag = 1), 'pinItUp' ); //slideLeftRightFade
     dm_rc.rc_ShowToaster( ttyInfo, 'RadCORE helps your application to be responsive!' , (chkSound.tag = 1));
end;

procedure TfrmDEMO_MESSAGES.btnToastSuccesClick(Sender: TObject);
begin
     //dm_rc.rc_ShowToaster( 'success', 'RadCORE helps [[ico:fas-check]] you !', (chkSound.tag = 1), 'pinItUp' );
     //dm_rc.rc_ShowToaster( 'success', 'RadCORE helps you !', (chkSound.tag = 1), 'pinItUp' );
     dm_rc.rc_ShowToaster( ttySuccess, 'RadCORE helps your application to be responsive!' , (chkSound.tag = 1) );
end;

procedure TfrmDEMO_MESSAGES.btnToastWarningClick(Sender: TObject);
begin
     //dm_rc.rc_ShowToaster( 'warning', 'Do not choose another. Choose RadCORE !', (chkSound.tag = 1), 'slideLeftRightFade' );
     dm_rc.rc_ShowToaster( ttyWarning, 'Choose the original. Choose RadCORE !' , (chkSound.tag = 1), ttrSlideLeftRightFade );
end;
procedure TfrmDEMO_MESSAGES.labClosePanelOptionsClick(Sender: TObject);
begin
     dm_rc.rc_ShowHideObject( self,
                              paPanelOptions,
                              0,
                              0,
                              1,
                              false,
                              ( paPanelOptions.Tag = 0 ),
                              true );
end;


procedure TfrmDEMO_MESSAGES.sweetAlertCancelCallBack(Sender: TObject; const Reason: TDismissType);
begin
  case Reason of
    dtOverlay : ShowMessageN('Dismiss Overlay');
    dtCancel  : ShowMessageN('Dismiss Cancel');
    dtClose   : ShowMessageN('Dismiss Close');
    dtESC     : ShowMessageN('Dismiss ESC');
    dtTimer   : ShowMessageN('Dismiss Timer');
  end;
end;
// 6.0.0.0
procedure TfrmDEMO_MESSAGES.sweetAlertConfirmCallBack(Sender: TObject);
begin
   dm_rc.rc_ShowToaster( ttyInfo, 'Put your SWEET ALERT CONFIRM procecure here...' );
   edLottieFile.SetFocus;
end;
//7.0.0.0
procedure TfrmDEMO_MESSAGES.UniBitBtn11Click(Sender: TObject);
begin
   if dm_rc.rc_ShowYesNo('Run ?', 360, 360, '[[modal]]', true) then
   begin
      try
          //[PT] isso de deve esta estar no inicio do processamento...
          //[EN] this must be at the beginning of processing...
          MainForm.ShowMask( 'working...' );
          UniSession.Synchronize();

          //[PT]simula um processo...
          //[EN]simulates a process...
          try
             sleep(2000);
          except
             //error msg
          end;

      finally
          //[PT] final do processo
          //[EN] end of process
          MainForm.HideMask;
          dm_rc.rc_ShowSweetAlert( 'Sucess!', 'Done!', swtSuccess, self, edLottieFile.Name  );
      end;
   end;
end;

procedure TfrmDEMO_MESSAGES.UniBitBtn1Click(Sender: TObject);
begin
     dm_rc.rc_ShowMessage( 'Oh No!!!' , 'error' );
     //dm_rc.rc_ShowError('Oh No !!!');
end;

procedure TfrmDEMO_MESSAGES.UniFrameCreate(Sender: TObject);
begin

     Self.Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

     iSlides     := 1;
     iSlideCount := 3;

     //hfChat.HTML.Clear;

     dm_rc.rc_ShowSweetAlert( 'RadCORE' , 'Do More. Better and Fast!' , swtInfo );

     //if mm.CONFIG_LANGUAGE = 'pt_BR' then
     //   btnLink.Hint := rc_SetHintAttr( 'https://radcore.pro.br/web/atualizacoes/' , 'link:', btnLink.Hint )
     //else
     //   btnLink.Hint := rc_SetHintAttr( 'https://radcore.pro.br/web/updates/' , 'link:', btnLink.Hint );

     // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
     rc_RenderLayout( Self, false, false );

end;

procedure TfrmDEMO_MESSAGES.UniFrameReady(Sender: TObject);
begin
     // adjust edit masks
     dm_rc.rc_ApplyEditMasks( Self );

     mm.varDW_LastTick := GetTickCount;
     // ShowMessage(  'Tempo( sem RDW ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
     dm_rc.rc_ResizeBlocks( Self, true, true );
     //ShowMessageN(  'Tempo( StringReplace default ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
     // in development
     rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
end;

procedure TfrmDEMO_MESSAGES.UniLabel13Click(Sender: TObject);
begin
     dm_rc.rc_ShowHideObject( self,
                              paPanelOpt2,
                              0,
                              0,
                              1,
                              false,
                              ( paPanelOpt2.Tag = 0 ),
                              true );
end;

initialization
  RegisterClass(TfrmDEMO_MESSAGES);

end.
