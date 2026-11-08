unit untFrmDEMO_TOUCH; //7.4.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDBEdit, uniCheckBox, uniDBCheckBox, uniButton,
  uniBitBtn, uniSpeedButton, uniEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniPanel, uniScrollBox,
  uniPageControl, uniGUIBaseClasses, uniBasicGrid, uniDBGrid, uniListBox, uniDBLookupComboBox, uniImage, Vcl.Imaging.pngimage, uniImageList, uniHTMLFrame, uniMemo;

type
  TfrmDEMO_TOUCH = class(TUniFrame)
    UniScrollBox1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    htmlSwipe: TUniHTMLFrame;
    rcBlock2: TUniContainerPanel;
    btSair: TUniLabel;
    UniLabel1: TUniLabel;
    paSwipe: TUniContainerPanel;
    labLeft: TUniLabel;
    labRight: TUniLabel;
    labUp: TUniLabel;
    labDown: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure htmlSwipeAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, Main, mkm_layout, uconsts;

procedure TfrmDEMO_TOUCH.btnCancelClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;
procedure TfrmDEMO_TOUCH.htmlSwipeAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
begin
     if EventName = '_rcSwipe' then
     begin
        If Params.Values['swipeTo'] = 'left' then
        begin
           dm_rc.rc_ShowToaster( ttyInfo, 'left', false, ttrPinItUp, 3500 );
           labLeft.Caption := ( StrToIntDef( labLeft.Caption, 0 ) + 1 ).ToString;
        end
        else
        If Params.Values['swipeTo'] = 'right' then
        begin
           dm_rc.rc_ShowToaster( ttySuccess, 'right', false, ttrPinItUp, 3500 );
           labRight.Caption := ( StrToIntDef( labRight.Caption, 0 ) + 1 ).ToString;
        end
        else
        If Params.Values['swipeTo'] = 'up' then
        begin
           dm_rc.rc_ShowToaster( ttyWarning, 'up', false, ttrPinItUp, 3500 );
           labUp.Caption := ( StrToIntDef( labUp.Caption, 0 ) + 1 ).ToString;
        end
        else
        If Params.Values['swipeTo'] = 'down' then
        begin
           dm_rc.rc_ShowToaster( ttyError, 'down', false, ttrPinItUp, 3500 );
           labDown.Caption := ( StrToIntDef( labDown.Caption, 0 ) + 1 ).ToString;
        end
        else
        If Params.Values['swipeTo'] = 'hold' then
        begin
           dm_rc.rc_ShowToaster( ttyError, 'hold', false, ttrPinItUp, 3500 );
        end;
     end;
end;

procedure TfrmDEMO_TOUCH.UniFrameCreate(Sender: TObject);
begin
  Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

  htmlSwipe.HTML.Add(
  '	<script>' +

'				$(function() {			' +
'					$("#' + paSwipe.JSId + '").swipe( {' +
'      threshold:0,' +
//'						//Single swipe handler for left swipes' +
'						swipeLeft:function(event, direction, distance, duration, fingerCount) {' +
//'							$(this).text("You swiped " + direction + " " + ++count + " times " );	' +
//  '				console.log("left...");' +
  '    ajaxRequest( ' + Self.htmlSwipe.JSName + ', "_rcSwipe" ,["swipeTo=left"]);' +
'						},' +
'						swipeRight:function(event, direction, distance, duration, fingerCount) {' +
//'							$(this).text("You swiped " + direction + " " + ++count + " times " );	' +
//  '				console.log("right...");' +
  '    ajaxRequest( ' + Self.htmlSwipe.JSName + ', "_rcSwipe" ,["swipeTo=right"]);' +
'						},' +
'						swipeUp:function(event, direction, distance, duration, fingerCount) {' +
//'							$(this).text("You swiped " + direction + " " + ++count + " times " );	' +
//  '				console.log("up...");' +
  '    ajaxRequest( ' + Self.htmlSwipe.JSName + ', "_rcSwipe" ,["swipeTo=up"]);' +
'						},' +
'						swipeDown:function(event, direction, distance, duration, fingerCount) {' +
//'							$(this).text("You swiped " + direction + " " + ++count + " times " );	' +
//  '				console.log("down...");' +
  '    ajaxRequest( ' + Self.htmlSwipe.JSName + ', "_rcSwipe" ,["swipeTo=down"]);' +
'						},' +
//'						//Default is 75px, set to 0 for demo so any distance triggers swipe' +
//'						threshold:0' +
'						hold:function(event, direction, distance, duration, fingerCount) {' +
//'							$(this).text("You swiped " + direction + " " + ++count + " times " );	' +
//  '				console.log("down...");' +
  '    ajaxRequest( ' + Self.htmlSwipe.JSName + ', "_rcSwipe" ,["swipeTo=hold"]);' +
'						},' +
'						threshold:50' +
'					});' +
'				});' +

  '	</script>'
  );

  // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
  rc_RenderLayout( Self, false, false );


  //rc_AddCssClass( unipanel1, 'rc-border-color-red'  );

  //rc_AddCssClass( rcBlock680, 'rc-border-color-red'  );

  //UniPanel1.JSInterface.JSCode('var me='#1'; if (me.body.hasCls("rc-border-color-red")) {me.removeBodyCls("rc-border-color-red")} else {me.addBodyCls("rc-border-color-red")};');

end;

procedure TfrmDEMO_TOUCH.UniFrameReady(Sender: TObject);
begin

     dm_rc.rc_ResizeBlocks( Self, true, true );
     //rc_RenderLayout( Self, true, true, true );

end;

initialization

  RegisterClass( TfrmDEMO_TOUCH );

end.
