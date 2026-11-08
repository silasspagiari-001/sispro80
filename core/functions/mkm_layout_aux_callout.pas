unit mkm_layout_aux_callout; //8.0.0.0

interface

uses
    System.SysUtils,
    System.TypInfo,
    uniGUIClasses,
    uniGUIApplication,
    uconsts
    ;

    procedure rc_CallOut( pText : string ;
                          pTargetObj : TUniControl;
                          pTheme : TRCCalloutTheme = ctDefault;
                          pArrowLocation : TRCCalloutArrow = carTop;
                          pRelativeOffsets : string = '0,10';
                          pRelativePos : TRCCalloutRelPos = crpT_B;
                          pFadeInDuration : integer = 200;
                          pFadeOutDuration : integer = 200;
                          pDismissDelay : integer = 5000;
                          pWidth : integer = 200 );

implementation

//uses mkm_layout;


procedure rc_CallOut( pText : string ;
                      pTargetObj : TUniControl;
                      pTheme : TRCCalloutTheme;
                      pArrowLocation : TRCCalloutArrow;
                      pRelativeOffsets : string;
                      pRelativePos : TRCCalloutRelPos;
                      pFadeInDuration : integer;
                      pFadeOutDuration : integer;
                      pDismissDelay : integer;
                      pWidth : integer );
var
   cTheme, cArrowLoc, cRelPos : string;
begin
   try
       cTheme    := lowercase( Copy( GetEnumName( typeInfo( TRCCalloutTheme ), Ord(pTheme)), 3 ) );
       cArrowLoc := StringReplace( lowercase( Copy( GetEnumName( typeInfo( TRCCalloutArrow ), Ord(pArrowLocation)), 4 ) ), '_', '-', [rfReplaceAll] );
       cRelPos   := StringReplace( lowercase( Copy( GetEnumName( typeInfo( TRCCalloutRelPos ), Ord(pRelativePos)), 4 ) ), '_', '-', [rfReplaceAll] );
       UniSession.AddJS(
       'Ext.widget(''callout'', {' +
       '  cls: "' + cTheme + '",'+
       '  width: ' + IntToStr(pWidth) + ','+
       '  html: "' + pText + '",'+
       '  calloutArrowLocation: "' + cArrowLoc + '",' +
       '  target: "#' + pTargetObj.JSId + '",'+//'  target: "#' + pTargetObj.JSName + '_id",'+ //8.0.0.0
       '	relativePosition: ' + QuotedStr( cRelPos ) + ',' + //   ''t-b'',' +
       '	relativeOffsets: [' + pRelativeOffsets + '],' +//   [0,10],' +
       '	fadeInDuration: ' + IntToStr(pFadeInDuration) + ','+
       '	fadeOutDuration: ' + IntToStr(pFadeOutDuration) + ','+
       '	dismissDelay: ' + IntToStr(pDismissDelay) + ','+
       '}).show();'
       );
   except on e:exception do
      raise Exception.Create('Error On rc_CallOut.' + sLineBreak + e.Message);
   end;
end;

end.
