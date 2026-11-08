unit untFrmBase;
(*
[PT] adicionado "rcSweetAlert" para compatibilizar com o novo recurso de por o foco em um componente
[EN] added "rcSweetAlert" to support the new feature of focusing on a component
*)
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,  strutils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniEdit, uniLabel, uniGUIBaseClasses, uniScrollBox,  uniButton,
  uniDBEdit, uniSpeedButton, uniPanel, uniPageControl,
  uniHTMLFrame, uniSweetAlert;

type
  TfrmBase = class(TUniFrame)
    paBaseTop: TUniContainerPanel;
    paBaseBackGround: TUniContainerPanel;
    htmlFrame: TUniHTMLFrame;
    rcSweetAlert: TUniSweetAlert;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses MainModule, mkm_func_web, untdm_rc, mkm_layout;

{ TfrmBase }
procedure TfrmBase.UniFrameCreate(Sender: TObject);
begin
    //8.5.0.0
    rc_BackgroundThemedColor( self );

    // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
    rc_RenderLayout( Self, false, false, true, false );
end;

procedure TfrmBase.UniFrameReady(Sender: TObject);
begin

     //dm_rc.rc_DBGridUpdateAll( Self, false, true );
     dm_rc.rc_ResizeBlocks( Self, true, true );
end;

initialization
  RegisterClass(TfrmBase);

end.
