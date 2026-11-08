unit mkm_layout_aux_tabs; //8.0.0.0

interface

uses
    System.SysUtils,
    System.Classes,
    Vcl.Controls,
    vcl.Graphics,
    uniGUIClasses,
    uniGUITypes,
    uniPageControl,
    uniLabel,
    uniPanel
    ;

    procedure renderControl_RCTABS( pForm : TObject; var cHint : string; var cTemp2 : string; var oControl : TUniControl );
    procedure renderControl_RCTABSLIDE( pForm : TObject; var cHint : string; var cTemp2 : string; var oControl : TUniControl );

implementation

uses untdm_rc, mkm_layout;


procedure renderControl_RCTABS( pForm : TObject; var cHint : string; var cTemp2 : string; var oControl : TUniControl );
var
   oPageControl : TUniPageControl;
   oTabPanel : TUniContainerPanel;
   oTabLabel : TUniLabel;
   oTabPanelClick : TUniContainerPanel;
   oTabPanelActive: TUniContainerPanel;
   iWidth, r : integer;
begin
   try
     oPageControl := TUniPageControl( TComponent( pForm ).FindComponent( cTemp2 ) );
     If oPageControl <> nil then
     begin
        oPageControl.TabBarVisible := false;
        iWidth := 6;
        for r := 0 to Pred( oPageControl.PageCount ) do
        begin
              //tabPanel
              oTabPanel := TUniContainerPanel( TComponent(pForm).FindComponent( 'rcTabPanel' + oPageControl.Pages[r].Name ) );
              if oTabPanel = nil then
              begin
                 oTabPanel        := TUniContainerPanel.Create( TComponent(pForm) );
                 oTabPanel.Parent := oControl;
                 oTabPanel.Name   := 'rcTabPanel' + oPageControl.Pages[r].Name;
              end;
              if oTabPanel <> nil then
              begin
                 oTabPanel.Left := iWidth;
                 oTabPanel.Top    := 0;
                 oTabPanel.Hint   := '[[center:parent y]]';
                 oTabPanel.Height := 38;
                 oTabPanel.Width  := ( Length( oPageControl.Pages[r].Caption ) * oPageControl.Pages[r].Font.Size ) + 2;// 18 ;
                 if ( Pos( 'ico:' , oPageControl.Pages[r].Hint ) > 0 ) and
                    ( Pos( 'append' , oPageControl.Pages[r].Hint ) > 0 ) then
                    oTabPanel.Width  := oTabPanel.Width + 15;
                 iWidth := iWidth + oTabPanel.Width;
              end;
              //tabLabel
              oTabLabel := TUniLabel( TComponent(pForm).FindComponent( 'rcTabPanel' + oPageControl.Pages[r].Name + 'Label' )  );
              if oTabLabel = nil then
              begin
                 oTabLabel        := TUniLabel.Create( TComponent(pForm) );
                 oTabLabel.Parent := oTabPanel;
                 oTabLabel.Name   := 'rcTabPanel' + oPageControl.Pages[r].Name + 'Label';
              end;
              if oTabLabel <> nil then
              begin
                 oTabLabel.Left     := 0;
                 oTabLabel.Top      := ( oTabPanel.Height div 2 ) - ( oTabLabel.Height div 2 ) ;
                 oTabLabel.Height   := 15;
                 oTabLabel.AutoSize := false;
                 oTabLabel.Caption  := oPageControl.Pages[r].Caption;
                 oTabLabel.Alignment:= taCenter;
                 oTabLabel.TextConversion := txtHTML;
                 oTabLabel.Hint     := oPageControl.Pages[r].Hint;
              end;
              //tabPanelActive
              oTabPanelActive := TUniContainerPanel( TComponent(pForm).FindComponent( 'rcTabPanel' + oPageControl.Pages[r].Name + 'Active' )  );
              if oTabPanelActive = nil then
              begin
                 oTabPanelActive        := TUniContainerPanel.Create( TComponent(pForm) );
                 oTabPanelActive.Parent := oTabPanel;
                 oTabPanelActive.Name   := 'rcTabPanel' + oPageControl.Pages[r].Name + 'Active';
              end;
              if oTabPanelActive <> nil then
              begin
                 oTabPanelActive.Left   := 0;
                 oTabPanelActive.Top    := 0;
                 oTabPanelActive.Height := 2;
                 oTabPanelActive.Width  := 15;
                 oTabPanelActive.Align  := alBottom;
                 oTabPanelActive.Hint   := '[[cls:bg-themecrud]]';
                 oTabPanelActive.Visible:= oPageControl.ActivePage.PageIndex = r;
              end;
              //tabPanelClick
              oTabPanelClick := TUniContainerPanel( TComponent(pForm).FindComponent( 'rcTabPanel' + oPageControl.Pages[r].Name + 'Click' )  );
              if oTabPanelClick = nil then
              begin
                 oTabPanelClick        := TUniContainerPanel.Create( TComponent(pForm) );
                 oTabPanelClick.Parent := oTabPanel;
                 oTabPanelClick.Name   := 'rcTabPanel' + oPageControl.Pages[r].Name + 'Click';
              end;
              if oTabPanelClick <> nil then
              begin
                 oTabPanelClick.Cursor := crHandPoint;
                 oTabPanelClick.Left   := 0;
                 oTabPanelClick.color := clBtnFace;
                 oTabPanelClick.Top    := 0;
                 oTabPanelClick.Height := 15;
                 oTabPanelClick.Width  := 15;
                 oTabPanelClick.BringToFront;
                 oTabPanelClick.Hint   := '[[anchor:|rctabdata:' + oPageControl.owner.name + ' ' + oPageControl.Name + ']]';
                 oTabPanelClick.OnClick := dm_rc.DynamicRcTabsClick;
              end;
        end;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderControl_RCTABS.' + sLineBreak + e.Message);
   end;
end;

procedure renderControl_RCTABSLIDE( pForm : TObject; var cHint : string; var cTemp2 : string; var oControl : TUniControl );
var
   oPageControl : TUniPageControl;
   oTabPanel : TUniContainerPanel;
   oTabLabel : TUniLabel;
   oTabPanelClick : TUniContainerPanel;
   oTabPanelActive: TUniContainerPanel;
   iWidth, r : integer;
begin
   try
     cTemp2 := Copy( cTemp2 + ' ', 1, Pos( ' ', cTemp2 + ' ' ) - 1 );
     oPageControl := TUniPageControl( TComponent( pForm ).FindComponent( cTemp2 ) );
     If oPageControl <> nil then
     begin
        oPageControl.TabBarVisible := false;
        iWidth := 6;
        //tabPanel LEFT
        oTabPanel := TUniContainerPanel( TComponent(pForm).FindComponent( 'rcTabPanelLeft' + oPageControl.Name ) );
        if oTabPanel = nil then
        begin
           oTabPanel        := TUniContainerPanel.Create( TComponent(pForm) );
           oTabPanel.Parent := oControl;
           oTabPanel.Name   := 'rcTabPanelLeft' + oPageControl.Name;
        end;
        if oTabPanel <> nil then
        begin
           oTabPanel.Left   := iWidth;
           oTabPanel.Top    := 0;
           oTabPanel.Hint   := '[[align:parent l:10|cls:bringtofront rc-circle-crud-32|center:parent y]]';
           oTabPanel.Height := 36;
           oTabPanel.Width  := 36;
           iWidth := iWidth + oTabPanel.Width;
        end;

        //tabLabel ARROW LEFT
        oTabLabel := TUniLabel( TComponent(pForm).FindComponent( 'rcTabPanelLeft' + oPageControl.Name + 'Label' )  );
        if oTabLabel = nil then
        begin
           oTabLabel        := TUniLabel.Create( TComponent(pForm) );
           oTabLabel.Parent := oTabPanel;
           oTabLabel.Name   := 'rcTabPanelLeft' + oPageControl.Name + 'Label';
        end;
        if oTabLabel <> nil then
        begin
           oTabLabel.Left     := 0;
           oTabLabel.Top      := ( oTabPanel.Height div 2 ) - ( oTabLabel.Height div 2 ) ;
           oTabLabel.Height   := 15;
           oTabLabel.Width    := 36;
           oTabLabel.AutoSize := false;
           oTabLabel.Caption  := '<';
           oTabLabel.Font.Color := clWhite;
           oTabLabel.Alignment:= taCenter;
           oTabLabel.Cursor   := crHandPoint;
           oTabLabel.TextConversion := txtHTML;
           oTabLabel.Hint     := '[[' ;
           if ( Pos( 'transition:', oControl.Hint ) = 0 ) or ( Pos( 'transition:slide', oControl.Hint ) > 0 ) then
              oTabLabel.Hint     := oTabLabel.Hint + 'center:parent xy|ico:fas-arrow-left|rctabdata-left:' + oPageControl.owner.name + ' ' + oPageControl.Name
           else
           if ( Pos( 'transition:drop', oControl.Hint ) > 0 ) then
              oTabLabel.Hint     := oTabLabel.Hint + 'center:parent xy|ico:fas-arrow-up|rctabdata-left:' + oPageControl.owner.name + ' ' + oPageControl.Name ;
           oTabLabel.Hint     := oTabLabel.Hint + ']]' ;
           oTabLabel.OnClick := dm_rc.DynamicRcTabsClick;
        end;

        //tabLabel CAPTION TAB
        oTabLabel := TUniLabel( TComponent(pForm).FindComponent( 'rcTabCaption' + oPageControl.Name )  );
        if oTabLabel = nil then
        begin
           oTabLabel        := TUniLabel.Create( TComponent(pForm) );
           oTabLabel.Parent := oControl;//oTabPanel;
           oTabLabel.Name   := 'rcTabCaption' + oPageControl.Name;
        end;
        if oTabLabel <> nil then
        begin
           oTabLabel.Left     := 45;
           oTabLabel.Top      := ( oTabPanel.Height div 2 ) - ( oTabLabel.Height div 2 ) ;
           oTabLabel.Height   := 15;
           oTabLabel.AutoSize := false;
           oTabLabel.Caption  := oPageControl.Pages[0].Caption;
           oTabLabel.Font.Color := clGray;
           oTabLabel.TextConversion := txtHTML;
           //labels centralizados
           oTabLabel.Hint     := '[[anchor:|cls:align-label-center-center]]';
        end;
        //tabPanel RIGHT
        oTabPanel := TUniContainerPanel( TComponent(pForm).FindComponent( 'rcTabPanelRight' + oPageControl.Name ) );
        if oTabPanel = nil then
        begin
           oTabPanel        := TUniContainerPanel.Create( TComponent(pForm) );
           oTabPanel.Parent := oControl;
           oTabPanel.Name   := 'rcTabPanelRight' + oPageControl.Name;
        end;
        if oTabPanel <> nil then
        begin
           oTabPanel.Left   := iWidth;
           oTabPanel.Top    := 0;
           oTabPanel.Hint   := '[[align:parent r:-w-10|cls:bringtofront rc-circle-crud-32|center:parent y]]';
           oTabPanel.Height := 36;
           oTabPanel.Width  := 36;
           iWidth := iWidth + oTabPanel.Width;
        end;
        //tabLabel ARROW RIGHT
        oTabLabel := TUniLabel( TComponent(pForm).FindComponent( 'rcTabPanelRight' + oPageControl.Name + 'Label' )  );
        if oTabLabel = nil then
        begin
           oTabLabel        := TUniLabel.Create( TComponent(pForm) );
           oTabLabel.Parent := oTabPanel;
           oTabLabel.Name   := 'rcTabPanelRight' + oPageControl.Name + 'Label';
        end;
        if oTabLabel <> nil then
        begin
           oTabLabel.Left     := 0;
           oTabLabel.Top      := ( oTabPanel.Height div 2 ) - ( oTabLabel.Height div 2 ) ;
           oTabLabel.Height   := 15;
           oTabLabel.Width    := 36;
           oTabLabel.Cursor   := crHandPoint;
           oTabLabel.AutoSize := false;
           oTabLabel.Caption  := '>';
           oTabLabel.Font.Color := clWhite;
           oTabLabel.Alignment:= taCenter;
           oTabLabel.TextConversion := txtHTML;
           oTabLabel.Hint     := '[[' ;
           if ( Pos( 'transition:', oControl.Hint ) = 0 ) or ( Pos( 'transition:slide', oControl.Hint ) > 0 ) then
              oTabLabel.Hint     := oTabLabel.Hint + 'center:parent xy|ico:fas-arrow-right|rctabdata-right:' + oPageControl.owner.name + ' ' + oPageControl.Name
           else
           if ( Pos( 'transition:drop', oControl.Hint ) > 0 ) then
              oTabLabel.Hint     := oTabLabel.Hint + 'center:parent xy|ico:fas-arrow-down|rctabdata-right:' + oPageControl.owner.name + ' ' + oPageControl.Name;
           oTabLabel.Hint     := oTabLabel.Hint + ']]' ;
           oTabLabel.OnClick := dm_rc.DynamicRcTabsClick;
        end;
     end;
   except on e:exception do
      raise Exception.Create('Error On renderControl_RCTABSLIDE.' + sLineBreak + e.Message);
   end;
end;

end.
