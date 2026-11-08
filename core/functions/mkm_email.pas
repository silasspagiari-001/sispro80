unit mkm_email; //8.4.0.0

interface

uses
    System.SysUtils, System.Classes , System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils,
    // feedback: Mesut from Turkey
    {$ifdef MSWINDOWS}
    Winapi.Windows,
    {$endif}
    math, System.Rtti, System.StrUtils, Vcl.Graphics, Data.Db,
    UniGuiClasses,
    //Units email
    IdComponent,
    IdTCPConnection,
    IdTCPClient,
    IdHTTP,
    IdBaseComponent,
    IdMessage,
    IdExplicitTLSClientServerBase,
    IdMessageClient,
    IdSMTPBase,
    IdSMTP,
    IdIOHandler,
    IdIOHandlerSocket,
    IdIOHandlerStack,
    IdSSL,
    IdSSLOpenSSL,
    IdAttachmentFile,
    IdText,
    IdPOP3,
    IdGlobal,
    IdUserPassProvider,
    IdSASL_CRAM_MD5,
    IdSASL_CRAM_SHA1,
    IdSASLPlain,
    IdSASLLogin,
    IdSASLSKey,
    IdSASLOTP,
    IdSASLAnonymous,
    IdSASLExternal,
    IdCoderMIME,
    IdAttachment; // SendMAIL indy;

procedure Decode2File(const base64: String; const FileName: string);
function  MyBase64Decode(const EncodedText: string): TBytes;
//7.0.0.0
function  rc_MailSend( Username, Password, Host, Port, FromName, FromEmail, ToEmail, BCCEmail, Subject : string;
                       MessageBody: TStrings;
                       pTLS : boolean = false;
                       pSSL : boolean = false;
                       pHtml : boolean = false;
                       pAttach : string = '';
                       pCCEmailPublic : boolean = false ): boolean;
function  rc_SendHtmlMail( Username, Password, Host, Port, FromName, FromEmail, ToEmail, BCCEmail, Subject : string;
                           MessageBody: TStrings;
                           pTLS : boolean;
                           pSSL : boolean;
                           pHtml : boolean;
                           pAttach : string = '';
                           pCCEmailPublic : boolean = false ): boolean;
//7.3.0.0
procedure SendMailThreaded(   //Recipients, Subject: string; MailContent: TStringList);
                            Username, Password, Host, Port, FromName, FromEmail, ToEmail, BCCEmail, Subject : string;
                            MessageBody: TStrings;
                            pTLS : boolean;
                            pSSL : boolean;
                            pHtml : boolean;
                            pAttach : string = '';
                            pCCEmailPublic : boolean = false );


function rc_EmailTemplate( pTitle, pDate, pTime, pDep, pSubject, pDescr, pName, pEmail : string ; pResposta, pHtml : boolean) : TStrings;

implementation

uses uconsts, uconsts_cfg,  untdm_rc, str_func, mkm_func_web;//7.3.0.0

function  rc_SendHtmlMail( Username, Password, Host, Port, FromName, FromEmail, ToEmail, BCCEmail, Subject : string;
                           MessageBody: TStrings;
                           pTLS : boolean;
                           pSSL : boolean;
                           pHtml : boolean;
                           pAttach : string;
                           pCCEmailPublic : boolean ): boolean;
var
  //original
  i:Integer;
  HtmPart, TxtPart: TIdText;
  BmpPart: TIdAttachment;
  Msg: TIdMessage;
  IdSMTP: TIdSMTP;
  AtchFile, sSql: String;
  sHBody: WideString;
  AtchList: TStringList;
  //added:
  sFrom                : String;
  sBccList             : String;
  sHost                : String;
  iPort                : Integer;
  sUserName            : String;
  sPassword            : String;
  sImgHeader,sImgFooter: String;
  idMsg                : TIdMessage;
  idText               : TIdText;
  //idSMTP               : TIdSMTP;
  idSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
begin
   try
     try
      sFrom                            := FromEmail;
      sBccList                         := BCCEmail;
      sHost                            := Host;
      iPort                            := Port.ToInteger;
      sUserName                        := Username;
      sPassword                        := Password;
      // Configura os parâmetros necessários para SSL / Configures the parameters required for SSL
      IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create( nil); //TComponent( sender )
      //IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Method      := sslvTLSv1_2;
      IdSSLIOHandlerSocket.SSLOptions.Mode        := sslmClient;
      IdSSLIOHandlerSocket.SSLOptions.VerifyMode  := [];
      IdSSLIOHandlerSocket.SSLOptions.VerifyDepth := 0;
      //original
      sHBody:='';
      AtchList:= TStringList.Create;

      idMsg := TIdMessage.Create(nil);
      idMsg.From.address              := FromEmail;
      idMsg.From.Name                 := FromName;
      idMsg.Recipients.EMailAddresses := ToEmail;
//      idMsg.CCList.EMailAddresses     := '';
//      idMsg.BccList.EMailAddresses    := BCCEmail;
      if not pCCEmailPublic then
      begin
         idMsg.CCList.EMailAddresses     := sBccList;
         idMsg.BccList.EMailAddresses    := '';
      end
      else
      begin
         idMsg.CCList.EMailAddresses     := '';
         idMsg.BccList.EMailAddresses    := sBccList;;
      end;

      idMsg.Subject                   := Subject;
      idMsg.ContentType               := 'multipart/alternative';
      idMsg.Priority                  := mpHigh;

      TxtPart := TIdText.Create(idMsg.MessageParts);
      TxtPart.ContentType := 'text/plain';
      TxtPart := TIdText.Create(idMsg.MessageParts);
      TxtPart.ContentType := 'multipart/related; type="text/html"';

      HtmPart := TIdText.Create(idMsg.MessageParts, nil);
      HtmPart.ContentType := 'text/html';
      HtmPart.Body.Add( MessageBody.Text );
      HtmPart.ParentPart := 1;

      sImgHeader := 'files/images/header-ticket.jpg';
      sImgFooter := 'files/images/footer-ticket.jpg';
      //7.4.0.0 thanks BugTracker Fabio Oliveira
      AtchFile := pAttach;
      if AtchFile <> '' then
      begin
         If RightStr( pAttach, 1 ) <> ';' then
            pAttach := pAttach + ';';
         while Pos( ';', pAttach ) > 0 do
         begin
            AtchFile := rc_GetSubstr( pAttach, ';' );
            if FileExists( AtchFile ) then
               TIdAttachmentFile.Create( idMsg.MessageParts, AtchFile );
            pAttach := StringReplace( pAttach, AtchFile + ';', '', [rfReplaceAll] );
         end;
      end;

      if Pos( ':AppHeaderImg', MessageBody.Text ) > 0 then
      begin
         BmpPart := TIdAttachmentFile.Create(idMsg.MessageParts, pchar(sImgHeader));
         BmpPart.ContentType := 'image/jpeg';
         BmpPart.ContentDisposition := 'inline';
         BmpPart.Headers.Add('Content-ID:<AppHeaderImg>');
         BmpPart.ParentPart := 1;
         AtchList.Add(sImgHeader);
      end;
      if Pos( ':AppFooterImg', MessageBody.Text ) > 0 then
      begin
         BmpPart := TIdAttachmentFile.Create(idMsg.MessageParts, pchar(sImgFooter));
         BmpPart.ContentType := 'image/jpeg';
         BmpPart.ContentDisposition := 'inline';
         BmpPart.Headers.Add('Content-ID:<AppFooterImg>');
         BmpPart.ParentPart := 1;
         AtchList.Add(sImgFooter);
      end;
      //end;
      idMsg.ContentType := 'multipart/mixed';

      for i:=0 to AtchList.Count-1 do
      begin
         if AtchList[i] <> EmptyStr then
           if FileExists( AtchList[i] ) then
             TIdAttachmentFile.Create( idMsg.MessageParts, pchar(AtchList[i]) );
      end;
      //added:Prepara o Servidor / Prepare Server
      idSMTP                           := TIdSMTP.Create( nil );  //TComponent( sender )
      idSMTP.IOHandler                 := IdSSLIOHandlerSocket;

      //idSMTP.UseTLS                    := utUseRequireTLS;//  utUseImplicitTLS; //utNoTLSSupport;//
      //
//      if pTLS then
         idSMTP.UseTLS                    := utUseRequireTLS; //  utUseImplicitTLS; //utNoTLSSupport;//
//      else
//         idSMTP.UseTLS                    := utNoTLSSupport;
      idSMTP.AuthType                  := satDefault;
      idSMTP.Host                      := sHost;
      idSMTP.Port                      := iPort;
      idSMTP.Username                  := sUserName;
      idSMTP.Password                  := sPassword;
      //added:Conecta e Autentica / Conect and authenticate
      try
         idSMTP.Connect;
         idSMTP.Authenticate;
      except on E:Exception do
        begin
          Result := False;
          dm_rc.rc_ShowSweetAlert( 'Envio de Email', 'Falha no envio: ' + E.Message, swtError ); //7.4.0.0
        end;
      end;
      //[PT] added:Se a conexão foi bem sucedida, envia a mensagem
      //[EN] added:If the connection was successful, send the message
      if idSMTP.Connected then
      begin
        try
          IdSMTP.Send(idMsg);
        except on E:Exception do
          begin
            Result := False;
            dm_rc.rc_ShowSweetAlert( 'Envio de Email', 'Falha no envio: ' + E.Message, swtError ); //7.4.0.0
          end;
        end;
      end;
      //desconecta do servidor SMTP / disconect from the SMTP server
      if idSMTP.Connected then
      begin
        Result := True;
        idSMTP.Disconnect;
      end;
    finally
      UnLoadOpenSSLLibrary;
      FreeAndNil(AtchList);
      FreeAndNil(idMsg);
      FreeAndNil(idSSLIOHandlerSocket);
      FreeAndNil(idSMTP);
    end;
  except on e:Exception do
    begin
      Result := False;
    end;
  end;
end;

function rc_MailSend( Username, Password, Host, Port, FromName, FromEmail, ToEmail, BCCEmail, Subject : string;
                      MessageBody: TStrings;
                      pTLS : boolean;
                      pSSL : boolean;
                      pHtml : boolean;
                      pAttach : string;
                      pCCEmailPublic : boolean ): boolean;
var
  sFrom                : String;
  sBccList             : String;
  sHost                : String;
  iPort                : Integer;
  sUserName            : String;
  sPassword            : String;
  AtchFile             : String; //7.3.0.0
  idMsg                : TIdMessage;
  idText               : TIdText;
  idSMTP               : TIdSMTP;
  idSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
begin
  Result := False;
  try
    try
      sFrom                            := FromEmail;
      sBccList                         := BCCEmail;
      sHost                            := Host;
      iPort                            := Port.ToInteger;
      sUserName                        := Username;
      sPassword                        := Password;
      //Configura os parâmetros necessários para SSL / Configures the parameters required for SSL
      IdSSLIOHandlerSocket                        := TIdSSLIOHandlerSocketOpenSSL.Create( nil); //TComponent( sender )
      IdSSLIOHandlerSocket.SSLOptions.Method      := sslvTLSv1_2;
      IdSSLIOHandlerSocket.SSLOptions.Mode        := sslmClient;
      IdSSLIOHandlerSocket.SSLOptions.VerifyMode  := [];
      IdSSLIOHandlerSocket.SSLOptions.VerifyDepth := 0;
      //Variável referente a mensagem / Variable referring to the message
      idMsg                            := TIdMessage.Create( nil );  //TComponent( sender )
      idMsg.CharSet                    := 'utf-8';
      idMsg.Encoding                   := meMIME;
      idMsg.From.Name                  := FromName;//SOFTWAREHOUSE_NAME;
      idMsg.From.Address               := sFrom;
      idMsg.Priority                   := mpNormal;
      idMsg.Subject                    := Subject;
      //Add Destinatário(s)
      idMsg.Recipients.Add;
      idMsg.Recipients.EMailAddresses := ToEmail;

      if not pCCEmailPublic then
      begin
         idMsg.CCList.EMailAddresses     := sBccList;
         idMsg.BccList.EMailAddresses    := '';
      end
      else
      begin
         idMsg.CCList.EMailAddresses     := '';
         idMsg.BccList.EMailAddresses    := sBccList;;
      end;
      //idMsg.BccList.EMailAddresses    := 'teste@teste.com.br'; //Cópia Oculta
      idText := TIdText.Create( idMsg.MessageParts );
      idText.Body.Add( MessageBody.Text );
      if pHtml then
         idText.ContentType := 'text/html; charset=UTF-8'
      else
         idText.ContentType := 'text/plain; charset=UTF-8';

      //Prepara o Servidor / prepare the server
      idSMTP                           := TIdSMTP.Create( nil );  //TComponent( sender )
      idSMTP.IOHandler                 := IdSSLIOHandlerSocket;
      idSMTP.UseTLS                    := utUseExplicitTLS;//  utUseImplicitTLS; //utNoTLSSupport;//
      //
//      if pTLS then
//         idSMTP.UseTLS                    := utUseRequireTLS //  utUseImplicitTLS; //utNoTLSSupport;//
//      else
//         idSMTP.UseTLS                    := utNoTLSSupport;
      idSMTP.AuthType                  := satDefault;
      idSMTP.Host                      := sHost;
      idSMTP.AuthType                  := satDefault;
      idSMTP.Port                      := iPort;
      idSMTP.Username                  := sUserName;
      idSMTP.Password                  := sPassword;

      //7.4.0.0 thanks BugTracker Fabio Oliveira
      AtchFile := pAttach;
      if AtchFile <> '' then
      begin
         If RightStr( pAttach, 1 ) <> ';' then
            pAttach := pAttach + ';';
         while Pos( ';', pAttach ) > 0 do
         begin
            AtchFile := rc_GetSubstr( pAttach, ';' );
            if FileExists( AtchFile ) then
               TIdAttachmentFile.Create( idMsg.MessageParts, AtchFile );
            pAttach := StringReplace( pAttach, AtchFile + ';', '', [rfReplaceAll] );
         end;
      end;

      //Conecta e Autentica / connect and authenticate
      idSMTP.Connect;

      //Se a conexão foi bem sucedida, envia a mensagem
      //If the connection was successful, send the message
      if idSMTP.Connected then
      begin
        try
          IdSMTP.Send(idMsg);
        except on E:Exception do
          begin
            Result := False;
            dm_rc.rc_ShowSweetAlert( 'Email Connect Error', 'Fail On Sent: ' + E.Message, swtError ); //7.4.0.0
          end;
        end;
      end;
      //desconecta do servidor SMTP
      //disconnect from the SMTP server
      if idSMTP.Connected then
      begin
        Result := True;
        idSMTP.Disconnect;
      end;

    finally
      idSMTP.Disconnect;
      UnLoadOpenSSLLibrary;
      FreeAndNil(idMsg);
      FreeAndNil(idSSLIOHandlerSocket);
      FreeAndNil(idSMTP);
    end;
  except on e:Exception do
    begin
      //MessageDlg('Email Connect Error: ' + E.Message, mtWarning, [mbOK], 0);
      dm_rc.rc_ShowSweetAlert( 'Email Connect Error', E.Message, swtError );
      Result := False;
    end;
  end;
end;

procedure Decode2File(const base64, FileName: string);
var
  stream: TFileStream;
  bytes: TBytes;
begin

  bytes := MyBase64Decode(base64);
  stream := TFileStream.Create(FileName, fmCreate);

  try
    if bytes<>nil then
      stream.Write(bytes[0], Length(Bytes));
  finally
    stream.Free;
  end;

end;

function MyBase64Decode(const EncodedText: string): TBytes;
var
  DecodedStm: TBytesStream;
  Decoder: TIdDecoderMIME;
begin

  Decoder := TIdDecoderMIME.Create(nil);
  try

    DecodedStm := TBytesStream.Create;

    try
      Decoder.DecodeBegin(DecodedStm);
      Decoder.Decode(EncodedText);
      Decoder.DecodeEnd;
      Result := DecodedStm.Bytes;
      SetLength(Result, DecodedStm.Size);
    finally
      DecodedStm.Free;
    end;

  finally
    Decoder.Free;
  end;

end;

function rc_EmailTemplate( pTitle, pDate, pTime, pDep, pSubject, pDescr, pName, pEmail : string ; pResposta, pHtml : boolean) : TStrings;

var
   pSL : TStringList;
begin
    Result := TstringList.Create;

    if pHtml then
    begin
       Result.Add( '<!DOCTYPE html>' ) ;
       Result.Add( '<html>' ) ;
       Result.Add( '<head>' ) ;
       Result.Add( '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' ) ;
       Result.Add( '<meta name="viewport" content="width=device-width, initial-scale=1.0">' ) ;
       Result.Add( '<title>' + pTitle + ' Email</title>' ) ;
       Result.Add( '<style type="text/css">' ) ;
       Result.Add( '@media(max-width:480px){' ) ;
       Result.Add( '  table[class=main_table],table[class=layout_table]{width:300px !important;}' ) ;
       Result.Add( '  table[class=layout_table] tbody tr td.header_image img{width:300px !important;height:auto !important;}' ) ;
       Result.Add( '}' ) ;
       Result.Add( 'a{color:#37aadc}' ) ;
       Result.Add( '</style>' ) ;
       Result.Add( '</head>' ) ;
       Result.Add( '<body>' ) ;
       Result.Add( '<table border="0" cellpadding="0" cellspacing="0" width="100%">' ) ;
       Result.Add( '<tbody>' ) ;
       Result.Add( '<tr>' ) ;
       Result.Add( '<td align="center" valign="top">' ) ;
       Result.Add( '<!--  M A I N T A B L E  S T A R T  -->' ) ;
       Result.Add( '<table border="0" cellpadding="0" cellspacing="0" class="main_table" width="600">' ) ;
       Result.Add( '    <tbody>' ) ;
       Result.Add( '    <tr>' ) ;
       Result.Add( '    <td>' ) ;
       Result.Add( '      <!--  L A Y O U T _ T A B L E  S T A R T  -->' ) ;
       Result.Add( '    <table border="0" cellpadding="0" cellspacing="0" class="layout_table" style="border-collapse:collapse;border:1px solid #CCCCCC;" width="100%" >' ) ;
       Result.Add( '      <tbody>' ) ;
       Result.Add( '      <!--  H E A D E R R O W  S T A R T  -->' ) ;
       Result.Add( '      <tr>' ) ;
       Result.Add( '      <td align="left" class="header_image"><img height="120" width="600" <img src="cid:AppHeaderImg" style="border:0;display:block;"></td>' ) ;
       Result.Add( '      </tr>' ) ;
       Result.Add( '      <!--  H E A D E R R O W  E N D  -->' ) ;
       Result.Add( '      <tr><td style="font-size:13px;line-height:13px;margin:0;padding:0;">&nbsp;</td></tr>' ) ;
       Result.Add( '      <!--  B O D Y R O W  S T A R T  -->' ) ;
       Result.Add( '      <tr>' ) ;
       Result.Add( '      <td align="center" valign="top">' ) ;
       Result.Add( '        <table align="center" border="0" cellpadding="0" cellspacing="0" width="85%">' ) ;
       Result.Add( '          <tbody>' ) ;
       Result.Add( '          <tr>' ) ;

       Result.Add( '          <td align="center">' ) ;
       Result.Add( '            <p style="font-family:Calibri, Arial, Helvetica, sans-serif;font-size:14px;line-height:22px;">' ) ;

       Result.Add( '             <p><strong>Hora / Data:</strong><br>' );
       Result.Add(               pTime + ' do dia ' + pDate + '</p>' );

       if pResposta then
          Result.Add( '             <p><strong>Atendente:</strong><br>' )
       else
          Result.Add( '             <p><strong>Departamento:/strong><br>' );

       Result.Add(               pDep + '</p>' );

       Result.Add( '             <p><strong>Assunto:</strong><br>' );
       Result.Add(               pSubject + '</p>' );

       if pResposta then
          Result.Add( '             <p><strong>Resposta:</strong><br>' )
       else
          Result.Add( '             <p><strong>Solicitação:</strong><br>' );

       Result.Add(               pDescr + '</p>' );

       Result.Add( '             <p><strong>Solicitante:</strong><br>' );
       Result.Add( '             ' + pName + '<br>' );
       Result.Add( '             ' + pEmail + '</p>' );

       Result.Add( '             <p>' + '<strong>Atenciosamente,</strong>' + '<br>' );
       Result.Add(               SOFTWAREHOUSE_NAME + '<br>' );
       Result.Add( '             FONE: ' + SOFTWAREHOUSE_COMMERCIAL_PHONE + '<br>' );
       Result.Add( '             </p>' );
       Result.Add( '             <p><strong>Não responda esse email<strong>' + '</p>' );

       Result.Add( '            </p>' ) ;
       Result.Add( '          </td>' ) ;

       Result.Add( '          </tr>' ) ;
       Result.Add( '          </tbody>' ) ;
       Result.Add( '        </table>' ) ;
       Result.Add( '      </td>' ) ;
       Result.Add( '      </tr>' ) ;
       Result.Add( '      <!--  B O D Y R O W  E N D  -->' ) ;
       Result.Add( '      <tr><td style="font-size:13px;line-height:13px;margin:0;padding:0;">&nbsp;</td></tr>' ) ;
       Result.Add( '      <!--  F O O T E R R O W  S T A R T  -->' ) ;
       Result.Add( '      <tr>' ) ;
       Result.Add( '      <td align="left" class="header_image"><a href="#"><img src="cid:AppFooterImg" height="60" width="600" style="border:0;display:block;" alt="Sent by RadTICKET"></a></td>' ) ;
       Result.Add( '      </tr>' ) ;
       Result.Add( '      <!--  F O O T E R R O W  E N D  -->' ) ;
       Result.Add( '      </tbody>' ) ;
       Result.Add( '    </table>' ) ;
       Result.Add( '    <!--  L A Y O U T _ T A B L E  E N D  -->' ) ;
       Result.Add( '    </td>' ) ;
       Result.Add( '    </tr>' ) ;
       Result.Add( '    </tbody>' ) ;
       Result.Add( '</table>' ) ;
       Result.Add( '<!--  M A I N _ T A B L E  E N D  -->' ) ;
       Result.Add( '</td>' ) ;
       Result.Add( '</tr>' ) ;
       Result.Add( '</tbody>' ) ;
       Result.Add( '</table>' ) ;
       Result.Add( '</body>' ) ;
       Result.Add( '</html>' ) ;
    end
    else
    begin
       Result := TstringList.Create;

       Result.Add( StringOfChar( '-' , 50 ) );
       Result.Add( '[' + APP_NAME + '] NEW TICKET' );
       Result.Add( StringOfChar( '-' , 50 ) );
       Result.Add( pTime + ' do dia ' + pDate ) ;
       Result.Add( StringOfChar( '-' , 50 ) );

       Result.Add( '' );
       if pResposta then
          Result.Add( 'Atendente:' )
       else
          Result.Add( 'Departamento:' );

       Result.Add( pDep  );
       Result.Add( '' );

       Result.Add( 'Assunto:' );
       Result.Add( pSubject );
       Result.Add( '' );

       if pResposta then
          Result.Add( 'Resposta:' )
       else
          Result.Add( 'Solicitação:' );

       Result.Add( pDescr );
       Result.Add( '' );

       Result.Add( 'Solicitante:' );
       Result.Add( pName  );
       Result.Add( pEmail );
       Result.Add( '' );

       Result.Add( 'Atenciosamente,' );
       Result.Add( '' );
       Result.Add( SOFTWAREHOUSE_NAME );
       Result.Add( '' );
       Result.Add( 'FONE:' + SOFTWAREHOUSE_COMMERCIAL_PHONE );
       Result.Add( StringOfChar( '-' , 50 ) );
       Result.Add( 'Não responda esse email' );
       Result.Add( StringOfChar( '-' , 50 ) );
    end;


end;
//7.3.0.0 ( original function by FELIPE )
procedure SendMailThreaded( //Recipients, Subject: string; MailContent: TStringList);
                            Username, Password, Host, Port, FromName, FromEmail, ToEmail, BCCEmail, Subject : string;
                            MessageBody: TStrings;
                            pTLS : boolean;
                            pSSL : boolean;
                            pHtml : boolean;
                            pAttach : string;
                            pCCEmailPublic : boolean );
var
  SendMailThread: TThread;
begin
  SendMailThread := TThread.CreateAnonymousThread(
    procedure
    var
      email: TIdMessage;
      idText: TIdText;
      idMsg                : TIdMessage; //7.3.0.0
      AtchFile             : String; //7.3.0.0
      sBccList             : String;
      IdSMTP1: TIdSMTP;
      IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    begin
      email := TIdMessage.Create(nil);
      try
        email.From.Text := FromEmail;
        email.Recipients.EMailAddresses := ToEmail;
        email.Subject := Subject;

        if not pCCEmailPublic then
        begin
           email.CCList.EMailAddresses     := sBccList;
           email.BccList.EMailAddresses    := '';
        end
        else
        begin
           email.CCList.EMailAddresses     := '';
           email.BccList.EMailAddresses    := sBccList;;
        end;

        idText := TIdText.Create(email.MessageParts);
        try
          idText.ContentType := 'text/html; charset=iso-8859-1';
          idText.Body.Add( MessageBody.Text );

          IdSMTP1 := TIdSMTP.Create(nil);
          IdSSLIOHandlerSocketOpenSSL1 := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
          try
            //IdSSLIOHandlerSocketOpenSSL1.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
            IdSSLIOHandlerSocketOpenSSL1.SSLOptions.SSLVersions := [sslvTLSv1_2];
            IdSMTP1.IOHandler                                   := IdSSLIOHandlerSocketOpenSSL1;
            IdSMTP1.AuthType                                    := satDefault;
            IdSMTP1.Host                                        := Host;
            IdSMTP1.Port                                        := Port.ToInteger;
            IdSMTP1.Username                                    := Username;
            IdSMTP1.Password                                    := Password;
            IdSMTP1.UseTLS                                      := utUseExplicitTLS;

            //7.4.0.0 thanks BugTracker Fabio Oliveira
            AtchFile := pAttach;
            if AtchFile <> '' then
            begin
               If RightStr( pAttach, 1 ) <> ';' then
                  pAttach := pAttach + ';';
               while Pos( ';', pAttach ) > 0 do
               begin
                  AtchFile := rc_GetSubstr( pAttach, ';' );
                  if FileExists( AtchFile ) then
                     TIdAttachmentFile.Create( idMsg.MessageParts, AtchFile );
                  pAttach := StringReplace( pAttach, AtchFile + ';', '', [rfReplaceAll] );
               end;
            end;

            IdSMTP1.Connect();
            try
              IdSMTP1.Authenticate;
              IdSMTP1.Send(email);
            finally
              IdSMTP1.Disconnect();
            end;
          finally
            IdSSLIOHandlerSocketOpenSSL1.Free;
            IdSMTP1.Free;
          end;
        finally
          idText.Free;
        end;
      finally
        email.Free;
        MessageBody.Free;
      end;
    end
  );

  SendMailThread.FreeOnTerminate := True;
  SendMailThread.Start;
end;

end.
