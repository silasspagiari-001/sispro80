unit mkm_func_web_localstorage; //8.0.0.0

interface

uses
    uniGUIApplication;

//8.0.0.0
procedure rc_LocalStorageSet( pField, pData : string );
function rc_LocalStorageGet( pField : string ) : string;
function rc_LocalStorageRemove( pField : string ) : string;

implementation

uses str_func, untDM_RC, MainModule;
//8.0.0.0
procedure rc_LocalStorageSet( pField, pData : string );
begin
   UniSession.JSCode( 'localStorage.setItem("' + pField + '", "' + pData + '")' );
end;
//8.0.0.0
function rc_LocalStorageGet( pField : string ) : string;
begin
   UniSession.JSCode( 'var field=localStorage.getItem("' + pField + '")' );
   dm_rc.rc_AjaxRequest( '', '_LocalStorageGet', '"item="+field"' );
end;
//8.0.0.0
function rc_LocalStorageRemove( pField : string ) : string;
begin
   UniSession.JSCode( 'localStorage.removeItem("' + pField + '")' );
end;


end.
