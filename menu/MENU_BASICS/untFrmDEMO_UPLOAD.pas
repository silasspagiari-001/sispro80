unit untFrmDEMO_UPLOAD; //8.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, uniFileUpload,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDBEdit, uniCheckBox, uniDBCheckBox, uniButton,
  uniBitBtn, uniSpeedButton, uniEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniPanel, uniScrollBox,
  uniPageControl, uniGUIBaseClasses, uniBasicGrid, uniDBGrid, uniListBox, uniDBLookupComboBox, uniImage, Vcl.Imaging.pngimage, uniImageList, uniHTMLFrame, uniMemo;

type
  TfrmDEMO_UPLOAD = class(TUniFrame)
    BlockTitle: TUniContainerPanel;
    btSair: TUniLabel;
    UniLabel1: TUniLabel;
    UniScrollBox1: TUniScrollBox;
    rcBlock3: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    UniLabel2: TUniLabel;
    edSearchFile: TUniEdit;
    btnSearch60: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    labFileUploaded: TUniLabel;
    rcBlock40: TUniContainerPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btnSearch60Click(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btSairClick(Sender: TObject);
  private
    { Private declarations }
    oFileUpload : TUniFileUpload;
  public
    { Public declarations }
    procedure OnUploadComplete( Sender: TObject; AStream: TFileStream);
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, Main, mkm_layout, uconsts, mkm_layout_aux_pdf,
  mkm_layout_aux_img;

procedure TfrmDEMO_UPLOAD.btnSearch60Click(Sender: TObject);
begin
  try
     try
        oFileUpload              := TUniFileUpload.Create(self);
        oFileUpload.Title        := 'Enviar Arquivo(s)';
        oFileUpload.Messages.BrowseText  := 'Localizar';
        oFileUpload.Messages.Cancel      := 'Cancelar';
        oFileUpload.Messages.Upload      := 'Enviar';
        oFileUpload.Messages.NoFileError := 'Selecione um arquivo';
        oFileUpload.Messages.UploadError := 'Erro no envio';
        oFileUpload.MaxFiles     := 1000; //default
        oFileUpload.Filter       := '*.pdf';
        oFileUpload.TargetFolder := 'files\pdf';
        oFileUpload.Overwrite    := true;
        oFileUpload.ReleaseCacheFile( true );
        oFileUpload.OnCompleted  := OnUploadComplete;
        oFileUpload.Execute;
     except on e:exception do
       begin
            oFileUpload.Free;
            ShowMessage( 'Upload fail...' + e.Message );
       end;
     end;
  finally
     oFileUpload.Free;
  end;
end;

procedure TfrmDEMO_UPLOAD.btSairClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmDEMO_UPLOAD.OnUploadComplete(Sender: TObject; AStream: TFileStream);
var
   DestFolder, DestName,
   cFile, cFileType  : string;
begin
  edSearchFile.Text := AStream.FileName;

  cFileType := ExtractFileExt( ( Sender as TUniFileUpload).FileName );
  labFileUploaded.Caption := 'File: ' + ExtractFileName( ( Sender as TUniFileUpload).FileName );

  if lowercase(cFileType) = '.pdf' then
     rcBlock40.Hint := rc_AddHintAttr( '|pdf:' + (Sender as TUniFileUpload).TargetFolder + mm.BACKSLASH +
                                                     ExtractFileName( ( Sender as TUniFileUpload).FileName ),
                                                     rcBlock40.Hint , true )
  else
  if Pos( lowercase(cFileType) , '.jpg .png .bmp' ) > 0 then
     rcBlock40.Hint := rc_AddHintAttr( '|img:' + (Sender as TUniFileUpload).TargetFolder + mm.BACKSLASH +
                                                     ExtractFileName( ( Sender as TUniFileUpload).FileName ) +
                                           '|img-cls:img-responsive-h-auto' ,
                                           rcBlock40.Hint , true );

//[[
//cols:12 |
//h-auto:mobile-off |
//img:files/images/nature/2.jpg |
//img-cls:img-responsive-h-auto
//]]

  rc_RenderControlsExecute( self, '', rcBlock40 );
  //dm_rc.rc_BootStrapRender( self, false,rcBlock40 );
  dm_rc.rc_ResizeBlocks( self , true, true, false );
//  rc_BootStrapRenderExecute( self, false, 0, 0, mm.varB_Mobile_Screen, mm.varB_Screen_LandScape, rcBlock40 );

//  (Sender as TUniFileUpload).Free;

  Exit;


  cFile           := ExtractFileName( AStream.FileName );
  // sherzod tip
  DestFolder := (Sender as TUniFileUpload).TargetFolder;
  DestName   := DestFolder + '\' + ExtractFileName((Sender as TUniFileUpload).FileName);
  DestName   := DestFolder + '\' + ExtractFileName( (Sender as TUniFileUpload).Files[0].OriginalFileName );

  edSearchFile.Text := 'File Name: ' + AStream.FileName;

  labFileUploaded.Caption := 'PDF: ' + AStream.FileName;

  //pdf:files\pdf\Bem_Vindo_ao_Trunk2.pdf


  //verificar se o arq. ja existe pois o unifileupload vai criar uma copia renomeando com uma numeracao
  //Ex: Se ja existe Arq.pdf e subir novamente, ficará Arq1.pdf
  if FileExists( PChar(DestName) ) then
     DeleteFile( PChar(DestName) );

  CopyFile( PChar(AStream.FileName), PChar(DestName), False);
  (Sender as TUniFileUpload).Files[0].Stream := Nil;

  (Sender as TUniFileUpload).Free;

end;

procedure TfrmDEMO_UPLOAD.UniBitBtn1Click(Sender: TObject);
var
   cHint : string;
begin
  if Pos( '.pdf', edSearchFile.Text ) > 0 then
     rc_ClearPDF( self, rcBlock40 )
  else
  if Pos( ExtractFileExt( edSearchFile.Text ) , '.jpg .png' ) > 0 then
     rc_ClearIMG( self, rcBlock40 );

  edSearchFile.Text := '';
  labFileUploaded.Text := 'Select a file:';
end;

procedure TfrmDEMO_UPLOAD.UniFrameCreate(Sender: TObject);
begin
  Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

  // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
  rc_RenderLayout( Self, false, false );


  //rc_AddCssClass( unipanel1, 'rc-border-color-red'  );
  //rc_AddCssClass( rcBlock680, 'rc-border-color-red'  );
  //UniPanel1.JSInterface.JSCode('var me='#1'; if (me.body.hasCls("rc-border-color-red")) {me.removeBodyCls("rc-border-color-red")} else {me.addBodyCls("rc-border-color-red")};');
end;

procedure TfrmDEMO_UPLOAD.UniFrameReady(Sender: TObject);
begin

     dm_rc.rc_ResizeBlocks( Self, true, true );
     //rc_RenderLayout( Self, true, true, true );

end;

initialization

  RegisterClass( TfrmDEMO_UPLOAD );

end.
