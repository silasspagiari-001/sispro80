unit mkm_createcomponents; //8.3.0.0

interface

uses
    System.SysUtils, System.Classes ,       System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics,
    Controls,
    // feedback: Mesut from Turkey
    {$ifdef LINUX}
    System.UIConsts,
    {$endif}
    uconsts, uconsts_cfg,
    uniGUIBaseClasses, uniGUIClasses, uniGUITypes, uniGUIJSUtils, Vcl.forms,
    uniComboBox, uniDBComboBox,uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker,  uniListBox, uniDBGrid,
    uniBitBtn, uniButton, uniEdit, UniDBEdit, UniSpeedButton, uniGUIFrame, uniGUIForm,  uniGUIDialogs, Messages, uniMenuButton,
    uniGUIAbstractClasses,  uniGUIApplication, uniPanel, IniFiles, UniImage, uniLabel,  Unipagecontrol,
    uniMemo, uniDBMemo, uniGUIRegClasses, uniDBNavigator, uniScrollBox,
    uniHTMLMemo,
    UniDBRadioGroup, uniRadioButton, uniCheckBox, uniSpinEdit, //
    uniDBCheckBox, uniDBImage, uniDBText, uniHTMLFrame, uniURLFrame;

    procedure rc_ClearBlocks( pForm : TObject; pObj : TUniControl = nil; p1 : integer = 0; p2 : integer = 0);
    function rc_CreateBlock( pForm:TObject;
                             pParent:TuniControl;
                             pNum:integer;
                             pW:integer=100;
                             pH:integer=30;
                             pHint:string = '[[cols:12]]' ;
                             pNil : boolean = false ):TUniContainerPanel;
    function rc_CreateContainer( pForm:TObject;
                                 pParent:TuniControl;
                                 pName:string;
                                 pW:integer=100;
                                 pH:integer=30;
                                 pX:integer=0;
                                 pY:integer=0;
                                 pHint:string = '' ;
                                 pNil : boolean = false ;
                                 pDefinedName : boolean = false ):TUniContainerPanel;
    function rc_CreatePanel( pForm:TObject;
                             pParent:TuniControl;
                             pName:string;
                             pW:integer=100;
                             pH:integer=30;
                             pX:integer=0;
                             pY:integer=0;
                             pHint:string = '' ;
                             pNil : boolean = false ;
                             pDefinedName : boolean = false):TUniPanel;
    function rc_CreateLabel( pForm:TObject;
                             pParent:TuniControl;
                             pName:string;
                             pW:integer=100;
                             pH:integer=30;
                             pX:integer=0;
                             pY:integer=0;
                             pHint:string = '' ;
                             pNil : boolean = false ;
                             pDefinedName : boolean = false):TUniLabel; overload;
    function rc_CreateEdit( pForm:TObject;
                            pParent:TuniControl;
                            pName:string;
                            pW:integer=100;
                            pH:integer=30;
                            pX:integer=0;
                            pY:integer=0;
                            pHint:string = '' ;
                            pNil : boolean = false ;
                            pDefinedName : boolean = false):TUniEdit;
    function rc_CreateDBText( pForm:TObject;
                              pParent:TuniControl;
                              pName:string;
                              pDatasource:TDataSource;
                              pDatafield:string;
                              pW:integer=100;
                              pH:integer=30;
                              pX:integer=0;
                              pY:integer=0;
                              pHint:string = '' ;
                              pNil : boolean = false ;
                              pDefinedName : boolean = false):TUniDBText;
    function rc_CreateDBEdit( pForm:TObject;
                              pParent:TuniControl;
                              pName:string;
                              pDatasource:TDataSource;
                              pDatafield:string;
                              pW:integer=100;
                              pH:integer=30;
                              pX:integer=0;
                              pY:integer=0;
                              pHint:string = '' ;
                              pNil : boolean = false ;
                              pDefinedName : boolean = false):TUniDBEdit;
    function rc_CreateDateTimePicker( pForm:TObject;
                            pParent:TuniControl;
                            pName:string;
                            pW:integer=100;
                            pH:integer=30;
                            pX:integer=0;
                            pY:integer=0;
                            pHint:string = '' ;
                            pNil : boolean = false ;
                            pDefinedName : boolean = false):TUniDateTimePicker;
    function rc_CreateDBDateTimePicker( pForm:TObject;
                              pParent:TuniControl;
                              pName:string;
                              pDatasource:TDataSource;
                              pDatafield:string;
                              pW:integer=100;
                              pH:integer=30;
                              pX:integer=0;
                              pY:integer=0;
                              pHint:string = '' ;
                              pNil : boolean = false ;
                              pDefinedName : boolean = false):TUniDBDateTimePicker;
    function rc_CreateNumberEdit( pForm:TObject;
                            pParent:TuniControl;
                            pName:string;
                            pW:integer=100;
                            pH:integer=30;
                            pX:integer=0;
                            pY:integer=0;
                            pHint:string = '' ;
                            pNil : boolean = false ;
                            pDefinedName : boolean = false):TUniNumberEdit;
    function rc_CreateDBNumberEdit( pForm:TObject;
                              pParent:TuniControl;
                              pName:string;
                              pDatasource:TDataSource;
                              pDatafield:string;
                              pW:integer=100;
                              pH:integer=30;
                              pX:integer=0;
                              pY:integer=0;
                              pHint:string = '' ;
                              pNil : boolean = false ;
                              pDefinedName : boolean = false):TUniDBNumberEdit;
    function rc_CreateFormattedNumberEdit( pForm:TObject;
                            pParent:TuniControl;
                            pName:string;
                            pW:integer=100;
                            pH:integer=30;
                            pX:integer=0;
                            pY:integer=0;
                            pHint:string = '' ;
                            pNil : boolean = false ;
                            pDefinedName : boolean = false):TUniFormattedNumberEdit;
    function rc_CreateDBFormattedNumberEdit( pForm:TObject;
                              pParent:TuniControl;
                              pName:string;
                              pDatasource:TDataSource;
                              pDatafield:string;
                              pW:integer=100;
                              pH:integer=30;
                              pX:integer=0;
                              pY:integer=0;
                              pHint:string = '' ;
                              pNil : boolean = false ;
                              pDefinedName : boolean = false):TUniDBFormattedNumberEdit;
    function rc_CreateSpinEdit( pForm:TObject;
                            pParent:TuniControl;
                            pName:string;
                            pW:integer=100;
                            pH:integer=30;
                            pX:integer=0;
                            pY:integer=0;
                            pHint:string = '' ;
                            pNil : boolean = false ;
                            pDefinedName : boolean = false):TUniSpinEdit;
    function rc_CreateCheckBox( pForm:TObject;
                            pParent:TuniControl;
                            pName:string;
                            pW:integer=100;
                            pH:integer=30;
                            pX:integer=0;
                            pY:integer=0;
                            pHint:string = '' ;
                            pNil : boolean = false ;
                            pDefinedName : boolean = false):TUniCheckBox;
    function rc_CreateDBCheckBox( pForm:TObject;
                              pParent:TuniControl;
                              pName:string;
                              pDatasource:TDataSource;
                              pDatafield:string;
                              pW:integer=100;
                              pH:integer=30;
                              pX:integer=0;
                              pY:integer=0;
                              pHint:string = '' ;
                              pNil : boolean = false ;
                              pDefinedName : boolean = false):TUniDBCheckBox;
    function rc_CreateRadioButton( pForm:TObject;
                            pParent:TuniControl;
                            pName:string;
                            pW:integer=100;
                            pH:integer=30;
                            pX:integer=0;
                            pY:integer=0;
                            pHint:string = '' ;
                            pNil : boolean = false ;
                            pDefinedName : boolean = false):TUniRadioButton;
    function rc_CreateDBRadioGroup( pForm:TObject;
                              pParent:TuniControl;
                              pName:string;
                              pDatasource:TDataSource;
                              pDatafield:string;
                              pW:integer=100;
                              pH:integer=30;
                              pX:integer=0;
                              pY:integer=0;
                              pHint:string = '' ;
                              pNil : boolean = false ;
                              pDefinedName : boolean = false):TUniDBRadioGroup;
    function rc_CreateComboBox( pForm:TObject;
                            pParent:TuniControl;
                            pName:string;
                            pW:integer=100;
                            pH:integer=30;
                            pX:integer=0;
                            pY:integer=0;
                            pHint:string = '' ;
                            pNil : boolean = false ;
                            pDefinedName : boolean = false):TUniComboBox;
    function rc_CreateDBComboBox( pForm:TObject;
                              pParent:TuniControl;
                              pName:string;
                              pDatasource:TDataSource;
                              pDatafield:string;
                              pW:integer=100;
                              pH:integer=30;
                              pX:integer=0;
                              pY:integer=0;
                              pHint:string = '' ;
                              pNil : boolean = false ;
                              pDefinedName : boolean = false):TUniDBComboBox;
    function rc_CreateMemo( pForm:TObject;
                            pParent:TuniControl;
                            pName:string;
                            pW:integer=100;
                            pH:integer=30;
                            pX:integer=0;
                            pY:integer=0;
                            pHint:string = '' ;
                            pNil : boolean = false ;
                            pDefinedName : boolean = false):TUniMemo;
    function rc_CreateDBMemo( pForm:TObject;
                              pParent:TuniControl;
                              pName:string;
                              pDatasource:TDataSource;
                              pDatafield:string;
                              pW:integer=100;
                              pH:integer=30;
                              pX:integer=0;
                              pY:integer=0;
                              pHint:string = '' ;
                              pNil : boolean = false ;
                              pDefinedName : boolean = false):TUniDBMemo;
    function rc_CreateHtmlMemo( pForm:TObject;
                                pParent:TuniControl;
                                pName:string;
                                pW:integer=100;
                                pH:integer=30;
                                pX:integer=0;
                                pY:integer=0;
                                pHint:string = '' ;
                                pNil : boolean = false ;
                                pDefinedName : boolean = false):TUniHtmlMemo;
    //8.3.0.0
    function rc_CreateHtmlFrame( pForm:TObject;
                                pParent:TuniControl;
                                pName:string;
                                pW:integer=100;
                                pH:integer=30;
                                pX:integer=0;
                                pY:integer=0;
                                pHint:string = '' ;
                                pNil : boolean = false ;
                                pDefinedName : boolean = false):TUniHTMLFrame;
    function rc_CreateScrollBox( pForm:TObject;
                                 pParent:TuniControl;
                                 pName:string;
                                 pW:integer=100;
                                 pH:integer=30;
                                 pX:integer=0;
                                 pY:integer=0;
                                 pHint:string = '' ;
                                 pNil : boolean = false ;
                                 pDefinedName : boolean = false):TUniScrollBox;
    function rc_CreateImage( pForm:TObject;
                             pParent:TuniControl;
                             pName:string;
                             pW:integer=100;
                             pH:integer=30;
                             pX:integer=0;
                             pY:integer=0;
                             pHint:string = '' ;
                             pNil : boolean = false ;
                             pDefinedName : boolean = false):TUniImage;
    function rc_CreateBitBtn( pForm:TObject;
                              pParent:TuniControl;
                              pName:string;
                              pW:integer=100;
                              pH:integer=30;
                              pX:integer=0;
                              pY:integer=0;
                              pHint:string = '' ;
                              pNil : boolean = false ;
                              pDefinedName : boolean = false):TUniBitBtn;
    //7.0.0.0
    function rc_CreateDBGrid( pForm:TObject;
                              pParent:TuniControl;
                              pName:string;
                              pDatasource:TDataSource;
                              pW:integer=100;
                              pH:integer=30;
                              pX:integer=0;
                              pY:integer=0;
                              pHint:string = '' ;
                              pNil : boolean = false ;
                              pDefinedName : boolean = false):TUniDBGrid;


implementation

uses untdm_rc, str_func, mkm_func_web, MainModule, Main, mkm_gridblock, mkm_layout;

procedure rc_ClearBlocks( pForm : TObject; pObj : TUniControl; p1 : integer; p2 : integer );
var
   i : integer;
   pComp : TUniContainerPanel;
begin
   if pObj <> nil then
   begin
       pObj.Visible := False;
       pObj.Enabled := False;
       FreeAndNil( pObj );
   end
   else
   begin
      if p1 = 0 then p1 := 1;
      if p2 = 0 then p2 := 1000;
      for I := p1 to p2 do
      begin
           pComp := TUniContainerPanel( TComponent( pForm ).FindComponent( 'rcBlock' + ( i ).tostring ) );
           if pComp <> nil then
           begin
              pComp.Visible := False;
              pComp.Enabled := False;
              FreeAndNil( pComp );
           end;
      end;
   end;
end;

function rc_CreateBlock( pForm:TObject; pParent:TuniControl; pNum:integer; pW:integer; pH:integer; pHint:string ; pNil : boolean ):TUniContainerPanel;
var
   i : integer;
   pComp : TUniContainerPanel;
begin
   i := pNum;
   Result := nil;
   try
      pComp := TUniContainerPanel( TComponent( pForm ).FindComponent( 'rcBlock' + ( i ).tostring ) );
      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp        := TUniContainerPanel.Create( TComponent(pForm) );
         pComp.name   := 'rcBlock' + i.ToString;
      end;
      pComp.AlignmentControl := uniAlignmentClient;
      pComp.Parent := pParent;
      pComp.Visible:= True;
      pComp.Enabled:= True;
      pComp.Width  := pW;
      pComp.Height := pH;
      pComp.Color  := clBtnFace;
      pComp.Hint   := pHint;
      Result       := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateBlock Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateContainer( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string; pNil : boolean; pDefinedName : boolean ):TUniContainerPanel;
var
   i : integer;
   pComp : TUniContainerPanel;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniContainerPanel( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniContainerPanel( TComponent( pForm ).FindComponent( 'rcContainer_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp        := TUniContainerPanel.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name   := pName
         else
            pComp.name   := 'rcContainer_' + pName;
      end;
      pComp.AlignmentControl := uniAlignmentClient;
      pComp.Parent := pParent;
      pComp.Width  := pW;
      pComp.Height := pH;
      pComp.Left   := pX;
      pComp.Top    := pY;
      pComp.Color  := clBtnFace;
      pComp.Hint   := pHint;
      Result        := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateContainer Error: ' + e.Message);
          end;
   end;
end;

function rc_CreatePanel( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniPanel;
var
   i : integer;
   pComp : TUniPanel;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniPanel( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniPanel( TComponent( pForm ).FindComponent( 'rcPanel_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp        := TUniPanel.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name   := 'rcPanel_' + pName;
      end;
      pComp.AlignmentControl := uniAlignmentClient;
      pComp.Parent := pParent;
      pComp.Width  := pW;
      pComp.Height := pH;
      pComp.Left   := pX;
      pComp.Top    := pY;
      pComp.Color  := clBtnFace;
      pComp.Hint   := pHint;
      Result        := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreatePanel Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateLabel( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniLabel;
var
   i : integer;
   pComp : TUniLabel;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniLabel( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniLabel( TComponent( pForm ).FindComponent( 'rcLabel_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp        := TUniLabel.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name   := 'rcLabel_' + pName;
      end;
      pComp.Parent := pParent;
      pComp.Width  := pW;
      pComp.Height := pH;
      pComp.Left   := pX;
      pComp.Top    := pY;
      pComp.Hint   := pHint;
      Result       := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateLabel Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateDBText( pForm:TObject; pParent:TuniControl; pName:string; pDatasource:TDataSource; pDatafield:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniDBText;
var
   i : integer;
   pComp : TUniDBText;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniDBText( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniDBText( TComponent( pForm ).FindComponent( 'rcDBText_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniDBText.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcDBText_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.DataSource := pDatasource;
      pComp.DataField  := pDatafield;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateDBText Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateEdit( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniEdit;
var
   i : integer;
   pComp : TUniEdit;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniEdit( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniEdit( TComponent( pForm ).FindComponent( 'rcEdit_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniEdit.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcEdit_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      pComp.Anchors    := [akTop,akLeft,akRight]; //7.0.0.0
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateEdit Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateDBEdit( pForm:TObject; pParent:TuniControl; pName:string; pDatasource:TDataSource; pDatafield:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniDBEdit;
var
   i : integer;
   pComp : TUniDBEdit;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniDBEdit( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniDBEdit( TComponent( pForm ).FindComponent( 'rcDBEdit_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniDBEdit.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcDBEdit_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.DataSource := pDatasource;
      pComp.DataField  := pDatafield;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      pComp.Anchors    := [akTop,akLeft,akRight]; //7.0.0.0
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateDBEdit Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateDateTimePicker( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniDateTimePicker;
var
   i : integer;
   pComp : TUniDateTimePicker;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniDateTimePicker( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniDateTimePicker( TComponent( pForm ).FindComponent( 'rcDateTimePicker_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniDateTimePicker.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcDateTimePicker_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      pComp.Anchors    := [akTop,akLeft,akRight]; //7.0.0.0
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rcCreateDateTimePicker Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateDBDateTimePicker( pForm:TObject; pParent:TuniControl; pName:string; pDatasource:TDataSource; pDatafield:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniDBDateTimePicker;
var
   i : integer;
   pComp : TUniDBDateTimePicker;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniDBDateTimePicker( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniDBDateTimePicker( TComponent( pForm ).FindComponent( 'rcDBDateTimePicker_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniDBDateTimePicker.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcDBDateTimePicker_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.DataSource := pDatasource;
      pComp.DataField  := pDatafield;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      pComp.Anchors    := [akTop,akLeft,akRight]; //7.0.0.0
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rcCreateDBDateTimePicker Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateNumberEdit( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniNumberEdit;
var
   i : integer;
   pComp : TUniNumberEdit;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniNumberEdit( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniNumberEdit( TComponent( pForm ).FindComponent( 'rcNumberEdit_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniNumberEdit.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcNumberEdit_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      pComp.Anchors    := [akTop,akLeft,akRight]; //7.0.0.0
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rcCreateNumberEdit Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateDBNumberEdit( pForm:TObject; pParent:TuniControl; pName:string; pDatasource:TDataSource; pDatafield:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniDBNumberEdit;
var
   i : integer;
   pComp : TUniDBNumberEdit;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniDBNumberEdit( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniDBNumberEdit( TComponent( pForm ).FindComponent( 'rcDBNumberEdit_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniDBNumberEdit.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcDBNumberEdit_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.DataSource := pDatasource;
      pComp.DataField  := pDatafield;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      pComp.Anchors    := [akTop,akLeft,akRight]; //7.0.0.0
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rcCreateDBNumberEdit Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateFormattedNumberEdit( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniFormattedNumberEdit;
var
   i : integer;
   pComp : TUniFormattedNumberEdit;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniFormattedNumberEdit( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniFormattedNumberEdit( TComponent( pForm ).FindComponent( 'rcFormattedNumberEdit_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniFormattedNumberEdit.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcFormattedNumberEdit_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      pComp.Anchors    := [akTop,akLeft,akRight]; //7.0.0.0
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rcCreateFormattedNumberEdit Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateDBFormattedNumberEdit( pForm:TObject; pParent:TuniControl; pName:string; pDatasource:TDataSource; pDatafield:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniDBFormattedNumberEdit;
var
   i : integer;
   pComp : TUniDBFormattedNumberEdit;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniDBFormattedNumberEdit( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniDBFormattedNumberEdit( TComponent( pForm ).FindComponent( 'rcDBFormattedNumberEdit_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniDBFormattedNumberEdit.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcDBFormattedNumberEdit_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.DataSource := pDatasource;
      pComp.DataField  := pDatafield;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      pComp.Anchors    := [akTop,akLeft,akRight]; //7.0.0.0
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rcCreateDBFormattedNumberEdit Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateCheckBox( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniCheckBox;
var
   i : integer;
   pComp : TUniCheckBox;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniCheckBox( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniCheckBox( TComponent( pForm ).FindComponent( 'rcCheckBox_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniCheckBox.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcCheckBox_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rcCreateCheckBox Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateDBCheckBox( pForm:TObject; pParent:TuniControl; pName:string; pDatasource:TDataSource; pDatafield:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniDBCheckBox;
var
   i : integer;
   pComp : TUniDBCheckBox;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniDBCheckBox( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniDBCheckBox( TComponent( pForm ).FindComponent( 'rcDBCheckBox_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniDBCheckBox.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcDBCheckBox_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.DataSource := pDatasource;
      pComp.DataField  := pDatafield;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rcCreateDBCheckBox Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateRadioButton( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniRadioButton;
var
   i : integer;
   pComp : TUniRadioButton;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniRadioButton( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniRadioButton( TComponent( pForm ).FindComponent( 'rcRadioButton_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniRadioButton.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcRadioButton_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rcCreateRadioButton Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateDBRadioGroup( pForm:TObject; pParent:TuniControl; pName:string; pDatasource:TDataSource; pDatafield:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniDBRadioGroup;
var
   i : integer;
   pComp : TUniDBRadioGroup;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniDBRadioGroup( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniDBRadioGroup( TComponent( pForm ).FindComponent( 'rcDBRadioGroup_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniDBRadioGroup.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcDBRadioGroup_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.DataSource := pDatasource;
      pComp.DataField  := pDatafield;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rcCreateDBRadioGroup Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateSpinEdit( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniSpinEdit;
var
   i : integer;
   pComp : TUniSpinEdit;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniSpinEdit( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniSpinEdit( TComponent( pForm ).FindComponent( 'rcSpinEdit_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniSpinEdit.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcSpinEdit_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      pComp.Anchors    := [akTop,akLeft,akRight]; //7.0.0.0
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rcCreateSpinEdit Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateComboBox( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniComboBox;
var
   i : integer;
   pComp : TUniComboBox;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniComboBox( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniComboBox( TComponent( pForm ).FindComponent( 'rcComboBox_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniComboBox.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcComboBox_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      pComp.Anchors    := [akTop,akLeft,akRight]; //7.0.0.0
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rcCreateComboBox Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateDBComboBox( pForm:TObject; pParent:TuniControl; pName:string; pDatasource:TDataSource; pDatafield:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniDBComboBox;
var
   i : integer;
   pComp : TUniDBComboBox;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniDBComboBox( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniDBComboBox( TComponent( pForm ).FindComponent( 'rcDBComboBox_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniDBComboBox.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcDBComboBox_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.DataSource := pDatasource;
      pComp.DataField  := pDatafield;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      pComp.Anchors    := [akTop,akLeft,akRight]; //7.0.0.0
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rcCreateDBComboBox_ Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateMemo( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniMemo;
var
   i : integer;
   pComp : TUniMemo;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniMemo( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniMemo( TComponent( pForm ).FindComponent( 'rcMemo_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniMemo.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcMemo_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      pComp.Anchors    := [akTop,akBottom,akLeft,akRight]; //7.0.0.0
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateMemo Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateDBMemo( pForm:TObject; pParent:TuniControl; pName:string; pDatasource:TDataSource; pDatafield:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniDBMemo;
var
   i : integer;
   pComp : TUniDBMemo;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniDBMemo( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniDBMemo( TComponent( pForm ).FindComponent( 'rcDBMemo_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniDBMemo.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcDBMemo_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.DataSource := pDatasource;
      pComp.DataField  := pDatafield;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      pComp.Anchors    := [akTop,akBottom,akLeft,akRight]; //7.0.0.0
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateDBMemo Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateHtmlMemo( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniHtmlMemo;
var
   i : integer;
   pComp : TUniHtmlMemo;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniHtmlMemo( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniHtmlMemo( TComponent( pForm ).FindComponent( 'rcHtmlMemo_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniHtmlMemo.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcHtmlMemo_' + pName;  //8.3.0.0
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateHtmlMemo Error: ' + e.Message);
          end;
   end;
end;
//8.3.0.0
function rc_CreateHtmlFrame( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniHTMLFrame;
var
   i : integer;
   pComp : TUniHTMLFrame;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniHTMLFrame( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniHTMLFrame( TComponent( pForm ).FindComponent( 'rcHtmlFrame_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniHTMLFrame.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcHtmlFrame_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateHtmlFrame Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateScrollBox( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniScrollBox;
var
   i : integer;
   pComp : TUniScrollBox;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniScrollBox( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniScrollBox( TComponent( pForm ).FindComponent( 'rcSbox_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniScrollBox.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcSBox_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateScrollBox Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateImage( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniImage;
var
   i : integer;
   pComp : TUniImage;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniImage( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniImage( TComponent( pForm ).FindComponent( 'rcImg_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniImage.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcImg_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateImage Error: ' + e.Message);
          end;
   end;
end;
function rc_CreateBitBtn( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniBitBtn;
var
   i : integer;
   pComp : TUniBitBtn;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniBitBtn( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniBitBtn( TComponent( pForm ).FindComponent( 'rcBitBtn_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniBitBtn.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcBitBtn_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateBitBtn Error: ' + e.Message);
          end;
   end;
end;
//7.0.0.0
function rc_CreateDBGrid( pForm:TObject; pParent:TuniControl; pName:string; pDatasource:TDataSource; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ; pNil : boolean; pDefinedName : boolean ):TUniDBGrid;
var
   i : integer;
   pComp : TUniDBGrid;
begin
   Result := nil;
   try
      if pDefinedName then
         pComp := TUniDBGrid( TComponent( pForm ).FindComponent( pName) )
      else
         pComp := TUniDBGrid( TComponent( pForm ).FindComponent( 'rcDBGrid_' + pName) );

      if pComp <> nil then
         if pNil then
            FreeAndNil( pComp );

      if pComp = nil then
      begin
         pComp            := TUniDBGrid.Create( TComponent(pForm) );
         if pDefinedName then
            pComp.name       := pName
         else
            pComp.name       := 'rcDBGrid_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.DataSource := pDatasource;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateDBGrid Error: ' + e.Message);
          end;
   end;
end;


end.
