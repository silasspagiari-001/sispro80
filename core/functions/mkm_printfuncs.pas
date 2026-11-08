unit mkm_printfuncs; // 7.2.0.0

interface

uses
    System.SysUtils,
    System.Classes, uniGUIClasses, uniGUIApplication, uconsts, uconsts_cfg, TypInfo;

procedure rc_PrintContainer( pHeader : String; pObj : TUniControl );


implementation
{------------------------------------------------------------------------------}

procedure rc_PrintContainer( pHeader : String; pObj : TUniControl );
begin
     UniSession.AddJS(
//     '      $(''#' + rcBlock40.JSId + ',#' + rcBlock50.JSId + ''').printThis({' +
     '      $(''#' + pObj.JSId + ''').printThis({' +
     '        importCSS: true,' +
     '        header: "<h1>' + pHeader + '</h1>",' +
//     '        base: "http://localhost:8075/"' +
     '        base: "' + UniSession.BaseURL + '"' +
     '      });'

     );
end;
end.
