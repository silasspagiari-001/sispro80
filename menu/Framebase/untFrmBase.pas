unit untFrmBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,  strutils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniEdit, uniLabel, uniGUIBaseClasses, uniScrollBox,  uniButton,
  uniDBEdit, uniSpeedButton, uniPanel, uniPageControl,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniHTMLFrame;

type
  TfrmBase = class(TUniFrame)
    paBaseTop: TUniContainerPanel;
    paBaseBackGround: TUniContainerPanel;
    htmlFrame: TUniHTMLFrame;
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
    //// para frames, não precisa efetuar o ResizeBlocks
    rc_RenderLayout( Self, false, false, true, false );
end;

procedure TfrmBase.UniFrameReady(Sender: TObject);
begin
     dm_rc.rc_ResizeBlocks( Self, true, true );
end;

initialization
  RegisterClass(TfrmBase);

end.
