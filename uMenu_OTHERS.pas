unit uMenu_OTHERS; // 6.0.0.0

interface

procedure rc_BuildMenu_OTHERS ;

implementation

uses uconsts, uconsts_cfg,  MainModule, mkm_menus;

procedure rc_BuildMenu_OTHERS ;
begin
     rc_BuildMenuItem( 'O', 1, 'OUTROS ico:fas-bars' ); // 6.0.0.0
     rc_BuildMenuItem( 'O', 2, 'Vídeos ico:fa-file-video' );
     rc_BuildMenuItem( 'O', 0, 'Treinamentos frm:link:https://youtu.be/-Gzz7wKE-r4/' );
     rc_BuildMenuItem( 'O', 2, 'SUPORTE'  );
     rc_BuildMenuItem( 'O', 0, 'Abrir Chamado frm:link:https://app.radticket.com.br' );
     //[PT] opção exclusiva se o sistema rodando atual for da sua software house
     //[EN] exclusive option if the current system is from your software house
     if mm.varC_Doc_Customer = SOFTWAREHOUSE_CNPJ then
     begin
        rc_BuildMenuItem( 'O', 2, SOFTWAREHOUSE_NAME );
     end;
end;
end.
