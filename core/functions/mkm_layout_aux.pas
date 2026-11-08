unit mkm_layout_aux; //8.0.0.2

interface

uses
    System.SysUtils,
    System.Classes,
    uniGUIClasses,
    uniHTMLFrame,
    uniURLFrame
    ;

    function renderControl_HtmlFrame( pForm : TObject; var oBlock : TUniControl; var oHtmlFrm : TUniHtmlFrame; pName : string ) : boolean;
    procedure renderAttr_HTMLRELOAD( var oObjTemp : TUniControl );
    //8.0.0.2
    function rc_CanRender( pControl : TUniControl ) : boolean;

implementation

uses mkm_layout;

//8.5.0.0
function rc_CanRender( pControl : TUniControl ) : boolean;
begin
    Result :=  ( Copy( pControl.ClassName, 1, 3 ) <> 'TRL') and
               ( pControl.ClassName <> 'TQuickRep' ) and (Copy( pControl.ClassName, 1, 3) <> 'TQR') and
               ( Pos( 'TAction' , pControl.ClassName ) = 0 ) and
               ( Pos( 'THelp' , pControl.ClassName ) = 0 );
end;

function renderControl_HtmlFrame( pForm : TObject; var oBlock : TUniControl; var oHtmlFrm : TUniHtmlFrame; pName : string ) : boolean;
begin
   try
      oHtmlFrm := TUniHTMLFrame( TComponent(pForm).FindComponent( pName + oBlock.Name ) );
      Result   := oHtmlFrm = nil;
      if Result then
      begin
         oHtmlFrm        := TUniHTMLFrame.Create( TComponent(pForm) );
         oHtmlFrm.Parent := oBlock;
         oHtmlFrm.Name   := pName + oBlock.Name;
      end;
   except on e:exception do
      raise Exception.Create('Error On renderControl_HtmlFrame.' + sLineBreak + e.Message);
   end;
end;

procedure renderAttr_HTMLRELOAD( var oObjTemp : TUniControl );
var
   cTemp, cTemp2 : string;
   x : integer;
begin
   //7.4.0.0 reload html
   if ( oObjTemp is TUniHTMLFrame ) and
      ( Pos( 'html-reload:' , TUniHTMLFrame( oObjTemp ).Hint ) > 0 ) and
      ( Pos( 'html-reload:-1' , TUniHTMLFrame( oObjTemp ).Hint ) = 0 )then
   begin
      cTemp := rc_GetHintAttr( 'html-reload:', TUniHTMLFrame( oObjTemp ).Hint );
      if cTemp = 'once' then
         x := 7
      else
         x := StrToIntDef( cTemp, 1 );

      if ( x = 1 ) then
      begin
         cTemp2 := TUniHTMLFrame( oObjTemp ).HTML.Text;
         TUniHTMLFrame( oObjTemp ).Html.Text := cTemp2;
      end;

      if ( x >= 0 ) then
      begin
         if ( x >= 0 ) then Dec( x );
         begin
            TUniHTMLFrame( oObjTemp ).Hint := rc_AddHintAttr( '|html-reload:' + x.ToString, TUniHTMLFrame( oObjTemp ).Hint , true );
         end;
      end;
   end
   else
   if ( oObjTemp is TUniURLFrame ) and
      ( Pos( 'html-reload:' , TUniURLFrame( oObjTemp ).Hint ) > 0 ) and
      ( Pos( 'html-reload:-1' , TUniURLFrame( oObjTemp ).Hint ) = 0 )then
   begin
      cTemp := rc_GetHintAttr( 'html-reload:', TUniURLFrame( oObjTemp ).Hint );
      if cTemp = 'once' then
         x := 7
      else
         x := StrToIntDef( cTemp, 1 );

      if ( x = 1 ) then
      begin
         cTemp2 := TUniURLFrame( oObjTemp ).HTML.Text;
         TUniURLFrame( oObjTemp ).Html.Text := cTemp2;
      end;

      if ( x >= 0 ) then
      begin
         if ( x >= 0 ) then Dec( x );
         begin
            TUniURLFrame( oObjTemp ).Hint := rc_AddHintAttr( '|html-reload:' + x.ToString, TUniURLFrame( oObjTemp ).Hint , true );
         end;
      end;
   end;
end;
end.
