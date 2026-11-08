unit mkm_crudfuncs; // 7.0.0.0

interface

uses
    uniDBComboBox, uniGUIFrame, uniGUIForm, System.SysUtils, vcl.Graphics, vcl.menus, // 6.0.0.0
    System.Classes, uniGUIClasses, uconsts, uconsts_cfg, TypInfo, Data.DB, //System.JSON,( future implementation ) //6.0.0.0

    uniDateTimePicker, uniDBDateTimePicker, uniDBCheckBox, uniCheckBox, uniComboBox, uniRadioGroup, uniRadioButton,
    uniDBListBox, uniDBLookupComboBox, uniStringGrid, uniMemo, uniDBMemo,
    uniEdit, uniDBEdit, uniLabel, uniPanel, uniDBGrid;

//7.0.0.0 frmBaseCRUD_2
procedure rc_SearchFilterExecute( pForm : TObject; pFilter : string );
//7.0.0.0
procedure rc_AddSearchField( pObj : TUniControl; pField : string );


implementation
{------------------------------------------------------------------------------}

uses mkm_layout, untDM_RC, str_func, mkm_func_web;

//7.0.0.0
procedure rc_SearchFilterExecute( pForm : TObject; pFilter : string );
var
   oEdit : TUniEdit;
begin
     if pForm <> nil then
     begin
        oEdit := TUniEdit ( rc_FindObject( 'edSearchFilter' , pForm ) );
        oEdit.Text := pFilter;
     end
     else
        dm_rc.rc_ShowSweetAlertSimple( 'rc_SearchFilterExecute: I Can not find the frame/form or component' );
end;
//7.0.0.0 frmBaseCRUD_2 only
procedure rc_AddSearchField( pObj : TUniControl; pField : string );
begin
   pObj.Hint := rc_AddHintAttr( 'search-field:' + pField, pObj.Hint , true );
end;
end.
