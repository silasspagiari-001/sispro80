unit untDEMO_WIZARD; //8.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniSweetAlert, uniGUIBaseClasses, uniTimer, uniButton, uniBitBtn, uniEdit, uniPanel, uniPageControl, uniLabel, uniScrollBox;

type
  TfrmDEMO_WIZARD = class(TfrmGenericModalForm)
    sboxGridBlock: TUniScrollBox;
    rcBlock5: TUniContainerPanel;
    UniScrollBox1: TUniScrollBox;
    rcBlock50: TUniContainerPanel;
    pgWizard: TUniPageControl;
    tabWizardStep0: TUniTabSheet;
    sboxWizardStep0: TUniScrollBox;
    rcBlock60: TUniContainerPanel;
    rcLabel60: TUniLabel;
    rcEdit60: TUniEdit;
    tabWizardStep1: TUniTabSheet;
    sboxWizardStep1: TUniScrollBox;
    rcBlock70: TUniContainerPanel;
    rcLabel70: TUniLabel;
    rcEdit70: TUniEdit;
    tabWizardStep2: TUniTabSheet;
    sboxWizardStep2: TUniScrollBox;
    rcBlock80: TUniContainerPanel;
    rcLabel80: TUniLabel;
    rcEdit80: TUniEdit;
    tabWizardStep3: TUniTabSheet;
    sboxWizardStep3: TUniScrollBox;
    rcBlock90: TUniContainerPanel;
    rcLabel90: TUniLabel;
    rcEdit90: TUniEdit;
    rcBlock100: TUniContainerPanel;
    btnWizardPrevious: TUniBitBtn;
    btnWizardNext: TUniBitBtn;
    rcBlock10: TUniContainerPanel;
    paWizardStepTrack0: TUniContainerPanel;
    paWizardStep0: TUniContainerPanel;
    labWizardIcon0: TUniLabel;
    UniLabel1: TUniLabel;
    rcBlock20: TUniContainerPanel;
    paWizardStepTrack1_right: TUniContainerPanel;
    paWizardStepTrack1_left: TUniContainerPanel;
    paWizardStep1: TUniContainerPanel;
    labWizardIcon1: TUniLabel;
    UniLabel2: TUniLabel;
    rcBlock30: TUniContainerPanel;
    paWizardStepTrack2_left: TUniContainerPanel;
    paWizardStepTrack2_right: TUniContainerPanel;
    paWizardStep2: TUniContainerPanel;
    labWizardIcon2: TUniLabel;
    UniLabel3: TUniLabel;
    rcBlock40: TUniContainerPanel;
    paWizardStepTrack3: TUniContainerPanel;
    paWizardStep3: TUniContainerPanel;
    labWizardIcon3: TUniLabel;
    UniLabel4: TUniLabel;
    UniBitBtn1: TUniBitBtn;
    procedure btnWizardNextClick(Sender: TObject);
    procedure btnWizardPreviousClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmDEMO_WIZARD: TfrmDEMO_WIZARD;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_layout, mkm_validate;

function frmDEMO_WIZARD: TfrmDEMO_WIZARD;
begin
  Result := TfrmDEMO_WIZARD(mm.GetFormInstance(TfrmDEMO_WIZARD));
end;

procedure TfrmDEMO_WIZARD.btnWizardNextClick(Sender: TObject);

var
   oObj : TUniControl;
   cObj : string;
begin
  inherited;
     //validate tab...
     cObj := 'sboxWizardStep' + pgWizard.ActivePageIndex.ToString;
     oObj := rc_FindControl( cObj, self );
     if not rc_FormValidate( Self, oObj ) then
     begin
        cObj := 'paWizardStep' + pgWizard.ActivePageIndex.ToString;
        oObj := rc_FindControl( cObj, self );
        if oObj <> nil then
           rc_AddCssClass( oObj, 'rc-wizard-valid' );
        Abort;
     end
     else
     begin
        cObj := 'paWizardStep' + pgWizard.ActivePageIndex.ToString;
        oObj := rc_FindControl( cObj, self );
        rc_RemoveCssClass( oObj, 'rc-wizard-valid' );
     end;

     if (pgWizard.ActivePageIndex) < pgWizard.PageCount-1 then
     begin
        //[PT] se vc não desejar usar a barra de evolução, comente o bloco abaixo( paWizardStepTrack )
        //[EN] if you do not wish to use the evolution bar, comment the block below( paWizardStepTrack )
        if pgWizard.ActivePageIndex = 0 then
        begin
           cObj := 'paWizardStepTrack' + pgWizard.ActivePageIndex.ToString;
           oObj := rc_FindControl( cObj, self );
           if oObj <> nil then
              rc_AddCssClass( oObj, 'rc-fade-in rc-wizard-track-active' );
        end
        else
        begin
           cObj := 'paWizardStepTrack' + pgWizard.ActivePageIndex.ToString + '_right';
           oObj := rc_FindControl( cObj, self );
           if oObj <> nil then
              rc_AddCssClass( oObj, 'rc-fade-in rc-wizard-track-active' );
        end;

        pgWizard.ActivePageIndex := pgWizard.ActivePageIndex + 1;

        //last ?
        //[PT] se vc não desejar usar a barra de evolução, comente o bloco abaixo( paWizardStepTrack )
        //[EN] if you do not wish to use the evolution bar, comment the block below( paWizardStepTrack )
        cObj := 'paWizardStepTrack' + pgWizard.ActivePageIndex.ToString + '_left';
        oObj := rc_FindControl( cObj, self );
        if oObj <> nil then
           rc_AddCssClass( oObj, 'rc-fade-in rc-wizard-track-active' );
        if (pgWizard.ActivePageIndex + 1) = pgWizard.PageCount then
        begin
           cObj := 'paWizardStepTrack' + (pgWizard.ActivePageIndex).ToString;
           oObj := rc_FindControl( cObj, self );
           if oObj <> nil then
              rc_AddCssClass( oObj, 'rc-fade-in rc-wizard-track-active' );
        end;

        cObj := 'paWizardStep' + pgWizard.ActivePageIndex.ToString;
        oObj := rc_FindControl( cObj, self );
        if oObj <> nil then
           rc_AddCssClass( oObj, 'rc-fade-in rc-wizard-active' );

        cObj := 'tabWizardStep' + pgWizard.ActivePageIndex.ToString;
        oObj := TUniTabSheet( rc_FindControl( cObj, self ) );
        if oObj <> nil then
        begin
           rc_AddCssClass ( oObj , 'rc-fade-in' );
        end;
     end
     else
        dm_rc.rc_ShowMessage( 'Processed!!!' , 'success', 360, 360, '', '142473-online-payment.json' );
end;

procedure TfrmDEMO_WIZARD.btnWizardPreviousClick(Sender: TObject);
var
   oObj : TUniControl;
   cObj : string;
begin
  inherited;
     if pgWizard.ActivePageIndex > 0 then
     begin
        cObj := 'paWizardStep' + pgWizard.ActivePageIndex.ToString;
        oObj := rc_FindControl( cObj, self );
        if oObj <> nil then
        begin
           rc_RemoveCssClass( oObj, 'rc-fade-in rc-wizard-active' );
        end;
        //[PT] se vc não desejar usar a barra de evolução, comente o bloco abaixo( paWizardStepTrack )
        //[EN] if you do not wish to use the evolution bar, comment the block below( paWizardStepTrack )
        if pgWizard.ActivePageIndex = pgWizard.PageCount - 1 then
        begin
           cObj := 'paWizardStepTrack' + pgWizard.ActivePageIndex.ToString;
           oObj := rc_FindControl( cObj, self );
           if oObj <> nil then
              rc_RemoveCssClass( oObj, 'rc-fade-in rc-wizard-track-active' );
        end
        else
        begin
           cObj := 'paWizardStepTrack' + pgWizard.ActivePageIndex.ToString + '_left';
           oObj := rc_FindControl( cObj, self );
           if oObj <> nil then
              rc_RemoveCssClass( oObj, 'rc-fade-in rc-wizard-track-active' );
        end;

        cObj := 'tabWizardStep' + pgWizard.ActivePageIndex.ToString;
        oObj := TUniTabSheet( rc_FindControl( cObj, self ) );
        if oObj <> nil then
        begin
           rc_RemoveCssClass ( oObj , 'rc-fade-in' );
        end;

        pgWizard.ActivePageIndex := pgWizard.ActivePageIndex - 1;

        //last ?
        //[PT] se vc não desejar usar a barra de evolução, comente o bloco abaixo( paWizardStepTrack )
        //[EN] if you do not wish to use the evolution bar, comment the block below( paWizardStepTrack )
        cObj := 'paWizardStepTrack' + pgWizard.ActivePageIndex.ToString + '_right';
        oObj := rc_FindControl( cObj, self );
        if oObj <> nil then
           rc_RemoveCssClass( oObj, 'rc-fade-in rc-wizard-track-active' );
        if (pgWizard.ActivePageIndex ) = 0 then
        begin
           cObj := 'paWizardStepTrack' + (pgWizard.ActivePageIndex).ToString;
           oObj := rc_FindControl( cObj, self );
           if oObj <> nil then
              rc_RemoveCssClass( oObj, 'rc-fade-in rc-wizard-track-active' );
        end;

        cObj := 'paWizardStep' + pgWizard.ActivePageIndex.ToString;
        oObj := rc_FindControl( cObj, self ) ;
        if oObj <> nil then
        begin
           rc_AddCssClass ( oObj , 'rc-fade-in' );
        end;

        cObj := 'tabWizardStep' + pgWizard.ActivePageIndex.ToString;
        oObj := TUniTabSheet( rc_FindControl( cObj, self ) );
        if oObj <> nil then
        begin
           rc_AddCssClass ( oObj , 'rc-fade-in' );
        end;
     end;
end;

procedure TfrmDEMO_WIZARD.UniBitBtn1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

initialization
   RegisterClass( TfrmDEMO_WIZARD ) ;

end.
