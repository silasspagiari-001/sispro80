unit uMenu_MOVEMENT; 

interface

procedure rc_BuildMenu_MOVEMENT ;

implementation

uses uconsts, uconsts_cfg,  MainModule, mkm_menus;

procedure rc_BuildMenu_MOVEMENT ;
begin
     rc_BuildMenuItem( 'M', 1, 'MOVIMENTO ico:fas-dollar-sign fld:menu_mov' );
       rc_BuildMenuItemPermission( 'M', '<A>' );
     rc_BuildMenuItem( 'M', 2, 'ENTRADAS' );
     rc_BuildMenuItem( 'M', 0, 'Compras tbl:compras' );

     //rc_BuildMenuItem( 'M', 2, 'SAÍDAS' );
     //rc_BuildMenuItem( 'M', 0, 'Ordem de Serviço tbl:oses' );
     //rc_BuildMenuItem( 'M', 0, 'PDV tbl:oses frm:PDV' );

     rc_BuildMenuItem( 'M', 2, 'FINANCEIRO' );
     rc_BuildMenuItem( 'M', 0, 'Movimento de Caixa tbl:movcaixa ico:fas-dot-circle' );

     rc_BuildMenuItem( 'M', 2, 'ADMINISTRATIVO' );
     rc_BuildMenuItem( 'M', 0, 'Recibos tbl:recibos');
end;
end.

