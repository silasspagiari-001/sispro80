unit mkm_layout_aux_scrollbar; //8.0.0.0

interface

uses
    System.SysUtils,
    System.TypInfo,
    System.Classes,
    Vcl.Controls,
    uniGUIClasses,
    uniGUIApplication,
    uniGUITypes,
    uniScrollBox,
    uniGUIForm,
    uniGUIFrame,
    uconsts
    ;

    procedure renderAttr_SCROLLBAR_COLOR( var oControl : TUniControl; var cHint : string );
    procedure renderAttr_SCROLLBAR_SHOW_HIDE( var oControl : TUniControl; var cHint : string );
    procedure renderAttr_SCROLLBAR_NOT_REFRESH( pForm : TObject; var oControl : TUniControl; var cHint : string );
    function  renderAttr_SCROLLBAR( var oControl : TUniControl ) : boolean;


implementation

uses mkm_layout;

function renderAttr_SCROLLBAR( var oControl : TUniControl ) : boolean;
begin
   try
     Result := ( Pos( 'TUniMenuItem' , oControl.ClassName ) = 0 ) ;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_SCROLLBAR.' + sLineBreak + e.Message);
   end;
end;
//8.5.0.0
procedure renderAttr_SCROLLBAR_COLOR( var oControl : TUniControl; var cHint : string );
var
   cClass,cCaption : string;
   bRender : boolean;
begin
   try
      if not oControl.InheritsFrom( TUniControl ) then
         bRender := true
      else
         bRender := ( RenderAttr_SCROLLBAR( oControl ) ) and ( oControl.Visible );

      if bRender then      
      begin
         cClass := rc_GetHintAttr( 'scrollbar-color:' , cHint );
         if cClass <> '' then
         begin
            If Pos( ' thin', cClass ) > 0 then
            begin
                 cClass := StringReplace( cClass, ' thin', '', [rfReplaceAll] );
                 cCaption:= 'scrollbar-width: thin; ';
            end;
            if oControl.ClassName = 'TUniTreeMenu' then
               rc_CreateCssClass( oControl, '.x-treelist-nav { ' + CCaption + 'scrollbar-color: ' + cClass + ' !important}' )
            else
            begin
               rc_CreateCssClass( oControl, '.x-scroller { ' + CCaption + 'scrollbar-color: ' + cClass + ' !important}' );
            end;
         end;
      end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_SCROLLBAR_COLOR.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_SCROLLBAR_SHOW_HIDE( var oControl : TUniControl; var cHint : string );
var
   cClass,cCaption : string;
begin
   try
     // ---------------------------------------------------------------------------------------------------------------------
     //[EN] in unigui old versions, maybe need to comment this lines below( ScrollDirection was introduced in .1546 version )
     //[PT] em versões antigas do unigui, comente as linhas abaixo( ScrollDirection foi introduzida na versão .1546 )
     // ---------------------------------------------------------------------------------------------------------------------
     //[PT] Isto resolve um problema que não consegui entender o que causa.
     //      Principalmente em MOBILE, quando usamos o atributo "noborder" a barra de scroll horizontal é exibida.
     //[EN] This solves a problem that I couldn't understand what causes.
     //      Mainly on MOBILE, when we use the "noborder" attribute the horizontal scroll bar is displayed.
     //8.0.0.0
     if ( RenderAttr_SCROLLBAR( oControl ) ) then
     begin
        if ( Pos( 'scrollbar:hide' , TUniScrollBox( oControl ).Hint ) > 0 ) then
        begin
           TUniScrollBox( oControl ).ScrollDirection := sdNone;
           rc_AddCssClass( TUniScrollBox( oControl ), 'rc-scrollbar-hidden' );
        end
        else
        if ( Pos( 'scrollbar:show-h' , TUniScrollBox( oControl ).Hint ) > 0 ) then //and ( TUniScrollBox( oControl ).ScrollDirection <> sdHorizontal ) then // 6.0.0.0
           TUniScrollBox( oControl ).ScrollDirection := sdHorizontal
        else
        if ( Pos( 'scrollbar:show-both' , TUniScrollBox( oControl ).Hint ) > 0 ) then
        begin
           TUniScrollBox( oControl ).ScrollDirection := sdBoth;
        end
        else
           TUniScrollBox( oControl ).ScrollDirection := sdVertical;

        if rc_AttrExists( 'cls:', cHint ) then//8.0.0.0
        begin
             cClass := rc_GetHintAttr( 'cls:' , cHint );
        end;
        if cClass <> '' then
           rc_AddCssClass( TUniControl( oControl ), cClass );
     end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_SCROLLBAR_SHOW_HIDE.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_SCROLLBAR_NOT_REFRESH( pForm : TObject; var oControl : TUniControl; var cHint : string );
var
   cClass,cCaption : string;
begin
   try
      if( oControl is TUniScrollBox ) and
         ( TUniScrollBox( oControl ).Visible ) and
         ( TUniScrollBox( oControl ).Enabled ) and
         ( Pos( 'not-refresh-scroll' , cHint ) = 0 ) then
      begin
         TUniScrollBox( oControl ).SelectFirst;//7.3.0.0
         //TUniScrollBox( oControl ).ScrollTo(0,0);//8.0.0.0
         TUniScrollBox( oControl ).DoAlignControls;
      end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_SCROLLBAR_NOT_REFRESH.' + sLineBreak + e.Message);
   end;
end;

end.
