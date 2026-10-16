unit uMenu_REPORTS; // 6.0.0.0

interface

procedure rc_BuildMenu_REPORTS ;

implementation

uses uconsts, uconsts_cfg,  MainModule, mkm_menus;

procedure rc_BuildMenu_REPORTS ;
begin
     //rc_BuildMenuItem( 'R', 1, 'RELATÓRIOS ico:fas-print' ); // 6.0.0.0
     //rc_BuildMenuItem( 'R', 2, 'BÁSICOS' );
     //rc_BuildMenuItem( 'R', 0, 'Rel. Clientes frm:reportMenuClientes' );
        //[PT] permissions: campo 'reportMenuClientes' deve existir na tabela USUARIOS_RESTRICOES
        //[EN] permissions: field 'reportMenuClientes' must exist in the USUARIOS_RESTRICOES table
        //rc_BuildMenuItemPermission( 'R', '<A>' );
        //rc_BuildMenuItemPermission( 'R', 'Clientes - Simples' );
        //rc_BuildMenuItemPermission( 'R', 'Clientes - Completo' );

     //rc_BuildMenuItem( mm.varA_MenuReport, iSeqMenu, 0, 'Rel. Clientes( RC PRINT )'     , '', '', 'relMenuClientes_API', '' );
end;
end.
