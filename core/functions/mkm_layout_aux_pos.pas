unit mkm_layout_aux_pos; //8.0.0.0

interface

uses
    System.SysUtils,
    System.Classes,
    uniGUIClasses
    ;

    procedure renderAttr_POS( var oObjTemp : TUniControl; var cTemp : string ) ;


implementation

uses mkm_func_web, mkm_layout;

procedure renderAttr_POS( var oObjTemp : TUniControl; var cTemp : string ) ;
var
   cTemp3 : string;
   oObjTemp2 : TUniControl;
   n, x, y : integer;
begin
   try
      cTemp3 := rc_GetHintAttr( 'pos-l-t:', cTemp ) ;
      if cTemp3 <> '' then
      begin
           cTemp := StringReplace( cTemp, 'pos-l-t:' + cTemp3, 'pos-l:' + cTemp3 + '|' + 'pos-t:' + cTemp3, [rfReplaceAll] );
           cTemp3 := '';
      end;

      //pos-l:5%
      if Pos( 'pos-l:', cTemp ) > 0 then
      begin
         // on linux have problems without .HasParent
         if oObjTemp.HasParent then
           oObjTemp2 := TUniControl( oObjTemp.GetParentComponent )
         else
           oObjTemp2 := nil;

         n := StrToIntDef( ReturnNumbers( cTemp ), 0 );

         if Pos( '%', cTemp ) > 0 then
            x := Trunc(( n / 100 ) * ( oObjTemp2.Width ))
         else
            x := n;

         oObjTemp.Left := x;
      end;

      //pos-r:5%
      if Pos( 'pos-r:', cTemp ) > 0 then
      begin
         // on linux have problems without .HasParent
         if oObjTemp.HasParent then
           oObjTemp2 := TUniControl( oObjTemp.GetParentComponent )
         else
           oObjTemp2 := nil;

         n := StrToIntDef( ReturnNumbers( cTemp ), 0 );

         if Pos( '%', cTemp ) > 0 then
            x := Trunc(( n / 100 ) * ( oObjTemp2.Width ))
         else
            x := n;

         oObjTemp.Left := oObjTemp2.Width - x;
      end;

      //pos-t:5%
      if Pos( 'pos-t:', cTemp ) > 0 then
      begin
         // on linux have problems without .HasParent
         if oObjTemp.HasParent then
           oObjTemp2 := TUniControl( oObjTemp.GetParentComponent )
         else
           oObjTemp2 := nil;

         n := StrToIntDef( ReturnNumbers( cTemp ), 0 );

         if Pos( '%', cTemp ) > 0 then
            x := Trunc(( n / 100 ) * ( oObjTemp2.Height ))
         else
            x := n;

         oObjTemp.Top := x;
      end;

      //pos-bottom:5%
      if Pos( 'pos-b:', cTemp ) > 0 then
      begin
         // on linux have problems without .HasParent
         if oObjTemp.HasParent then
           oObjTemp2 := TUniControl( oObjTemp.GetParentComponent )
         else
           oObjTemp2 := nil;

         n := StrToIntDef( ReturnNumbers( cTemp ), 0 );

         if Pos( '%', cTemp ) > 0 then
            x := Trunc(( n / 100 ) * ( oObjTemp2.Height ))
         else
            x := n;

         oObjTemp.Top := oObjTemp2.Height - x;
      end;
   except on e:exception do
      raise Exception.Create('Error On renderAttr_POS.' + sLineBreak + e.Message);
   end;
end;

end.
