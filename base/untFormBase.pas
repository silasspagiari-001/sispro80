unit untFormBase; // v. 3.2.0.7
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid, uniSpeedButton,
  uniDBGrid, uniEdit, uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn, uniTimer,
  uniMemo, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox;

type
  TformBase = class(TUniForm)
    timerClose: TUniTimer;
    paBackground: TUniContainerPanel;
    paBaseTopTitle: TUniContainerPanel;
    labTitleForm: TUniLabel;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFormCreate(Sender: TObject);
    procedure timerCloseTimer(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

    procedure rc_Exit;
  end;


function formBase: TformBase;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, str_func,
  uconsts, Main, mkm_layout, mkm_translate, mkm_anim;

function formBase: TformBase;
begin
  Result := TformBase(mm.GetFormInstance(TformBase));
end;

procedure TformBase.rc_Exit;
begin
      // para NAO atualizar o RETORNO
      mm.varC_Lookup_Code := '_ESC_';
      mm.varC_SelectedItem_LookUp := '';
      dm_rc.sqlLookUpSearch.Close;

      timerClose.Enabled := true;
      rc_AddCssClass( self, 'drop_out' );
end;

procedure TformBase.timerCloseTimer(Sender: TObject);
begin
     timerClose.Enabled := false;
     close;
end;

procedure TformBase.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
     rc_Exit;
end;

procedure TformBase.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 27 then
     begin
        mm.varB_Yes                 := False;
        mm.varB_No                  := True;
        Self.ModalResult            := mrNone;

        rc_Exit;
     end;
end;

procedure TformBase.UniFormCreate(Sender: TObject);
begin
    //if UniApplication.FindComponent('MainForm' ) <> nil then
    begin
       // para formulários, deve-se efetuar o ResizeBlocks
       rc_RenderLayout( Self, true, true, true );
       rc_AlignLabel( labTitleForm, 'left-center' );
    end;
end;

procedure TformBase.UniFormReady(Sender: TObject);
begin
    Self.Top := ( UniSession.UniApplication.ScreenHeight div 2 ) - ( self.Height div 2  );
    rc_AddCssClass( self, 'drop_in' );
    //if UniApplication.FindComponent('MainForm' ) <> nil then
    begin
      // in development
      rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
    end;

    dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure TformBase.UniFormDestroy(Sender: TObject);
begin
    // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
    // que estiver "abaixo" do MODAL
    mm.varC_Form_Modal := nil;
end;

procedure TformBase.UniFormShow(Sender: TObject);
begin

  inherited;

     if Self.Tag = 0 then
     begin
         Self.Visible := True;
         Self.Top  := 0;

//         rc_MoveAnimationForm( self,
//                               self.left,
//                               self.left,
//                               self.top,
//                               ( mm.varI_ScreenHeight  div 2 ) - ( self.Height div 2  ),
//                               120,
//                               1 ) ;
     end
     else
     begin
       Self.Visible := False;
       Self.Top  := -1000;
     end;
end;
end.
