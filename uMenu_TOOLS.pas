unit uMenu_TOOLS; // 6.0.0.0

interface

procedure rc_BuildMenu_TOOLS ;

implementation

uses uconsts, uconsts_cfg,  MainModule, mkm_menus;

procedure rc_BuildMenu_TOOLS ;
begin
     rc_BuildMenuItem( 'T', 1, 'FERRAMENTAS ico:fas-wrench' ); // 6.0.0.0
     rc_BuildMenuItem( 'T', 2, 'CONFIGURAÇÕES ico:fas-cog' );
     //rc_BuildMenuItem( 'T', 0, 'Parâmetros do Sistema tbl:parametros');
     rc_BuildMenuItem( 'T', 0, 'USUÁRIOS tbl:usuarios ico:fas-user-cog asknew: ' );   // parametro do GUS
         rc_BuildMenuItemPermission( 'T', '<AIED>' );
         rc_BuildMenuItemPermission( 'T', 'Cfg.Permis.: MASTER' );
         rc_BuildMenuItemPermission( 'T', 'Cfg.Permis.: ALL' );

     // se você precisar por permissionamento por usuário ao invés somente do acesso por ADMIN...
     // if you need to apply permossion verify do "frmTHEMES" rather than only ADMIN ACCESS...
     //rc_BuildMenuItem( 'T', 0, 'System Config fld:system_config' );
     //   rc_BuildMenuItemPermission( 'T', '<A>' );

     rc_BuildMenuItem( 'T', 2, 'LOG DE VERSÕES ico:fas-code-branch' );
     rc_BuildMenuItem( 'T', 0, 'LINK DO LOG frm:link:https://radcore.pro.br/web/atualizacoes/' );
end;
end.
