unit uMenu_BASICS;

interface

procedure rc_BuildMenu_BASICS;

implementation

uses uconsts, uconsts_cfg,  MainModule, system.sysutils, untdm_rc, mkm_menus;

procedure rc_BuildMenu_BASICS;
begin

     //[PT] adicione suas opções e atenção ao primeiro parâmetro da função "rc_BuildMenuItem" que determina o tipo do menu
     //[EN] add your options and pay attention to the first parameter of the "rc_BuildMenuItem" function that determines the menu type
     //
     // ''  = BÁSICOS      | BASICS    - Deve ser usada na unit "rc_BuildMenu_BASICS"
     // 'M' = MOVIMENTO    | MOVEMENT  - Deve ser usada na unit "rc_BuildMenu_MOVEMENT"
     // 'R' = RELATÓRIOS   | REPORTS   - Deve ser usada na unit "rc_BuildMenu_REPORTS"
     // 'T' = FERRAMENTAS  | TOOLS     - Deve ser usada na unit "rc_BuildMenu_TOOLS"
     // 'O' = OPÇÕES       | OTHERS    - Deve ser usada na unit "rc_BuildMenu_OTHERS"

     // another menu sample
     //
//     rc_BuildMenuItem( '', 99, 'options group 1' );
//     rc_BuildMenuItem( '',  1, 'OP 1 ico:fas-sitemap' );
//     rc_BuildMenuItem( '',  1, 'OP 2 ico:fas-sitemap' );
//     rc_BuildMenuItem( '',  1, 'OP 3 ico:fas-sitemap' );
//       rc_BuildMenuItem( '',  2, 'Sub Menu 3.1' );
//         rc_BuildMenuItem( '',  0, 'Item 3.1.1' );
//         rc_BuildMenuItem( '',  0, 'Item 3.1.2' );
//         rc_BuildMenuItem( '',  0, 'Item 3.1.3' );
//         rc_BuildMenuItem( '',  0, 'Item 3.1.4' );
//       rc_BuildMenuItem( '',  2, 'Sub Menu 3.2' );
//         rc_BuildMenuItem( '',  0, 'Item 3.2.1' );
//         rc_BuildMenuItem( '',  0, 'Item 3.2.2' );
//         rc_BuildMenuItem( '',  0, 'Item 3.2.3' );
//
//         rc_BuildMenuItem( '',  3, 'Item 3.3 '  );
//         rc_BuildMenuItem( '',  3, 'Item 3.4 '  );
//         rc_BuildMenuItem( '',  3, 'Sub Menu 3.5' );
//         rc_BuildMenuItem( '',  0, 'Item 3.5.1' );
//         rc_BuildMenuItem( '',  0, 'Item 3.5.2' );
//         rc_BuildMenuItem( '',  0, 'Item 3.5.3' );
//       rc_BuildMenuItem( '',  4, 'Sub Menu 4.1' );
//         rc_BuildMenuItem( '',  0, 'Item 4.1.1' );
//         rc_BuildMenuItem( '',  0, 'Item 4.1.2' );
//
//     rc_BuildMenuItem( '',  1, 'OP 4 ico:fas-sitemap' );
//     rc_BuildMenuItem( '',  1, 'OP 5 ico:fas-sitemap' );
//     rc_BuildMenuItem( '',  1, 'OP 6 ico:fas-sitemap' );
//       rc_BuildMenuItem( '',  2, 'Sub Menu 6.1' );
//         rc_BuildMenuItem( '',  0, 'Item 6.1.1' );
//         rc_BuildMenuItem( '',  0, 'Item 6.1.2' );
//         rc_BuildMenuItem( '',  0, 'Item 6.1.3' );
//     rc_BuildMenuItem( '',  1, 'OP 7 ico:fas-sitemap' );
//     rc_BuildMenuItem( '',  1, 'OP 8 ico:fas-sitemap' );
//     rc_BuildMenuItem( '', 99, 'options group 2' );
//     rc_BuildMenuItem( '',  1, 'OP 1 ico:fas-sitemap' );
//     rc_BuildMenuItem( '',  1, 'OP 2 ico:fas-sitemap' );
//       rc_BuildMenuItem( '',  2, 'Sub Menu 2.1 ico:fas-sitemap' );
//         rc_BuildMenuItem( '',  0, 'Item 2.1.1' );
//         rc_BuildMenuItem( '',  0, 'Item 2.1.2' );
//       rc_BuildMenuItem( '',  2, 'Sub Menu 2.2 ico:fas-sitemap' );
//         rc_BuildMenuItem( '',  0, 'Item 2.2.1' );
//         rc_BuildMenuItem( '',  0, 'Item 2.2.2' );

     //rc_BuildMenuItem( '', 99, 'grupo de níveis' );
    // rc_BuildMenuItem( '', 99, '-' );
//     rc_BuildMenuItem( '',  1, 'Menu L1 ico:fas-sitemap' );
//     rc_BuildMenuItem( '',  0, 'Item 1.1' );
//     rc_BuildMenuItem( '',  2, 'Menu L2' );
//     rc_BuildMenuItem( '',  0, 'Item 2.1' );
//     rc_BuildMenuItem( '',  0, 'Item 2.2' );
//     rc_BuildMenuItem( '',  3, 'Menu L3' );
//     rc_BuildMenuItem( '',  0, 'Item 3.1' );
//     rc_BuildMenuItem( '',  4, 'Menu L4' );
//     rc_BuildMenuItem( '',  0, 'Item 4.1' );
     //[PT] para criar a proxima opção sem ser um submenu
     //[EN] to create the next option without being a submenu
//     rc_BuildMenuItem( '', -1 );
//     rc_BuildMenuItem( '',  0, 'Menu ico:fas-sitemap' );
//     rc_BuildMenuItem( '',  0, 'Menu  ico:fas-sitemap' );
//     rc_BuildMenuItem( '',  1, 'Menu L1' );
//     rc_BuildMenuItem( '',  0, 'Item 1.1' );
//     rc_BuildMenuItem( '',  0, 'Item 1.2' );

   //[PT] para criar a proxima opção sem ser um submenu
   //[EN] to create the next option without being a submenu
//   rc_BuildMenuItem( '', -1 );
//   // Opção de nível 0...
//   // Level 0 option...
//   rc_BuildMenuItem( '', 0, 'Forms( close btn off ) frm:Demo_Forms ico:fas-dot-circle' );

     //[PT] este recurso ainda é experimental. Ainda não obtive sucesso para evitar que esta opção recebe o HOVER/CLICK
     //[EN] this feature is still experimental. I haven't been successful yet to prevent this option from receiving HOVER/CLICK
     rc_BuildMenuItem( '', 99, 'Menu Principal' );
     // 6.0.0.0
     rc_BuildMenuItem( '',  1, 'ADMINISTRAÇÃO ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  2, 'CADASTROS' );
     rc_BuildMenuItem( '',  0, 'Pessoas frm:PESSOAS tbl:pessoas' );// //7.3.0.0
     rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Produtos tbl:produtos' );
  //   rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Transportes tbl:transportes' );
  //   rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Funcionários tbl:funcionarios' );
  //   rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Responsável Técnico tbl:responsavel' );
 //    rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'L.A.Q.S tbl:laboratorio' );
//     rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Empresa tbl:empresas' );
 //    rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  2, 'TABELAS ico:fas-tachometer-alt' );
     rc_BuildMenuItem( '',  0, 'Condições de Pagamento  tbl:condicoes' );
 //    rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Instituição Bancária tbl:portadores' );
  //   rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Plano de Contas tbl:planocontas' );
 //    rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Histórico tbl:historico' );
  //   rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Cidades tbl:cidades' );
  //   rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Carteira tbl:carteira' );
 //    rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'CFOP - Cadastro tbl:operacoes' );
  //   rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Convênios ICMS tbl:escritas' );
 //    rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Parâmetros CFOP tbl:parametrosoperacao' );
  //   rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Centro Custo tbl:centrocusto' );
 //    rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Documentos tbl:documentos' );
 //    rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Aplicações tbl:aplicacao' );
  //   rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Região tbl:regiao' );
  //   rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Unidades de Medida tbl:medidas' );
 //    rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Marcas tbl:marca' );
  //   rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Espécie tbl:especie' );
 //    rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Cultivar tbl:cultivar' );
 //    rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Nocivas tbl:pragas' );
     rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Peneira tbl:peneira' );
 //    rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Categoria tbl:categoria' );

     rc_BuildMenuItem( '',  0, 'CRM frm:DashboardCrm ico:fas-dot-circle' );     //

     //[PT] este é o dashboard padrão carregado na tela principal, por isso está comentado
     //[EN] this is the default dashboard loaded on the main screen, so it's commented out

     rc_BuildMenuItem( '',  0, 'E-Commerce frm:DashboardEcommerce ico:fas-dot-circle' );     //
     //rc_BuildMenuItem( '',  0, 'e-Commerce Themed frm:DashboardEcommerce_Themed ico:fas-dot-circle' );

     rc_BuildMenuItem( '',  0, 'Hospital frm:DashboardHospital ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Hospital BG  frm:DashboardHospital_BG ico:fas-dot-circle' ); //7.0.0.0
     rc_BuildMenuItem( '',  0, 'Escola frm:DashboardSchool ico:fas-dot-circle' );

     rc_BuildMenuItem( '',  1, 'MOVIMENTOS ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Nota Eletrônica frm:notaeletronica' );
     rc_BuildMenuItem( '',  0, 'Orçamento frm:orcamento' );
     rc_BuildMenuItem( '',  0, 'Manifesto Eletrônico frm:manifesto' );
     rc_BuildMenuItem( '', 0, 'Nota - piloto frm:notapiloto');
     rc_BuildMenuItem( '', 0, 'Orcamento - piloto frm:orcamentopiloto');

     rc_BuildMenuItem( '', 1, 'FINANCEIRO ico:fas-dot-circle' );
     rc_BuildMenuItem( '', 0, 'Contas a Receber tbl:RECEBER' );
     rc_BuildMenuItem( '', 0, 'Contas a Pagar tbl:PAGAR' );

     rc_BuildMenuItem( '', 1, 'U.B.S ico:fas-dot-circle' );
     rc_BuildMenuItem( '', 0, 'Termo de Amostragem tbl:solicitacao');
     rc_BuildMenuItem( '', 0, 'Cadastro Lote/Boletim tbl:SEMENTES' );
     rc_BuildMenuItem( '', 0, 'Controle de Pontos tbl:PONTOS' );
     rc_BuildMenuItem( '', 0, 'Beneficiamento por Nota tbl:beneficiamento' );

     rc_BuildMenuItem( '', 1, 'BARRACÃO ico:fas-dot-circle' );
     rc_BuildMenuItem( '', 0, 'Cadastro de Barracão tbl:barracao' );
     rc_BuildMenuItem( '', 0, 'Custo Lote Interno tbl:custo_loteinterno' );
     rc_BuildMenuItem( '', 0, 'Lote Controle Interno tbl:loteinterno' );
     rc_BuildMenuItem( '', 0, 'Produção do Lote tbl:producaointerna');
     rc_BuildMenuItem( '', 0, 'manutencaolote_interno tbl:manutencaolote_interno');

     rc_BuildMenuItem( '', 1, 'CAMPO PRODUÇÃO ico:fas-dot-circle' );
     rc_BuildMenuItem( '', 0, 'Cadastro de Campo tbl:campo' );
     rc_BuildMenuItem( '', 0, 'Historico do Campo frm:historicocampo' );

     rc_BuildMenuItem( '', 1, 'GRÁFICOS ico:fas-dot-circle' );
     rc_BuildMenuItem( '', 0, 'Comparativo Mensal Fat. frm:grafico_comparativofat' );
     rc_BuildMenuItem( '', 0, 'Comparativo Anual Fat. frm:grafico_comparativoanualfat' );

     rc_BuildMenuItem( '', 1, 'RELATÓRIOS ico:fas-dot-circle' );
     rc_BuildMenuItem( '', 2, 'FATURAMENTO ico:fas-tachometer-alt' );
     rc_BuildMenuItem( '', 0, 'Notas Emitidas frm:relatorios modal:' );
     rc_BuildMenuItem( '', 0, 'Apuração de I.C.M.S frm:relatorio_impostocontabilidade modal:' );
     rc_BuildMenuItem( '', 0, 'Curva ABC Pessoa frm:CURVAABCPESSOA' );
     rc_BuildMenuItem( '', 0, 'Curva ABC Produtos frm:CURVAABCPRODUTOS' );
     rc_BuildMenuItem( '', 0, '% de Crescimento frm:crescimentofatempresa modal:' );
     rc_BuildMenuItem( '', 0, 'Vendas por Vendedor frm:relatoriovenvendedor modal:' );

     rc_BuildMenuItem( '', 2, 'ESTOQUE VENDAS ico:fas-tachometer-alt' );
     rc_BuildMenuItem( '', 0, 'Lotes/BAS frm:relatorio_lote modal:' );
     rc_BuildMenuItem( '', 0, 'Lote Sintético frm:relatoriohistoricosementesintetico modal:' );
     rc_BuildMenuItem( '', 0, 'Histórico da Semente frm:relatorio_historicosemente modal:' );
     rc_BuildMenuItem( '', 0, 'Saldo Beneficiamento frm:saldobeneficiamento modal:' );
     rc_BuildMenuItem( '', 0, 'Relação de Entregas frm:relacaoentregas modal:' );


     rc_BuildMenuItem( '', 2, 'VENDAS ico:fas-tachometer-alt' );
     rc_BuildMenuItem( '', 0, 'Vendas Detalhadas frm:relatorio_vendasdetalhada modal:' );     // FALTA
     rc_BuildMenuItem( '', 0, 'Controle E.F./E.P. frm:relatoriocontroleitensef modal:' );
     rc_BuildMenuItem( '', 0, 'Saldo Itens E.F./E.P. frm:relatoriosaldoefep modal:' );
     rc_BuildMenuItem( '', 0, 'Venda de Produtos frm:relatorioperiodoproduto modal:' );

     rc_BuildMenuItem( '', 2, 'COMPRAS ico:fas-tachometer-alt' );
     rc_BuildMenuItem( '', 0, 'Compras de Produtos frm:relatorioperiodoproduto modal:' );     // FALTA

     rc_BuildMenuItem( '', 2, 'VENDEDORES ico:fas-tachometer-alt' );
     rc_BuildMenuItem( '', 0, 'Comissão por Baixa frm:comissaobaixaefetuada modal:' );     // FALTA
     rc_BuildMenuItem( '', 0, 'Previsão de Comissão frm:previsaocomissao modal:' );     // FALTA


     rc_BuildMenuItem( '', 1, 'CONTABILIDADE ico:fas-tachometer-alt' );
     rc_BuildMenuItem( '', 0, 'Apuração de I.C.M.S frm:relatorio_impostocontabilidade modal:' );     // FALTA
     rc_BuildMenuItem( '', 0, 'Sped EFD ICMS IPI frm:spedefd' );     // FALTA
     rc_BuildMenuItem( '', 0, 'Sped PIS/COFINS frm:spedpiscofins' );     // FALTA
     rc_BuildMenuItem( '', 0, 'Arquivo(s) XML frm:arquivoxml' );     // FALTA
     rc_BuildMenuItem( '', 0, 'Saldo de Produtos Nota frm:saldoprodutonotas modal:' );     // FALTA



     rc_BuildMenuItem( '', 1, 'LIXEIRA ico:fas-tachometer-alt' );
     rc_BuildMenuItem( '', 0, 'Reciclagem de Registro frm:lixeira' );     // FALTA

     rc_BuildMenuItem( '',  1, 'MEGA DEMO ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Relatorios frm:BaseReportMenu ico:fas-dot-circle' ); //7.5.0.0

     // 6.0.0.0
     rc_BuildMenuItem( '',  2, 'EXEMPLOS DIVERSOS ico:fas-bars' );
     rc_BuildMenuItem( '',  0, 'Voice DEMO frm:DEMO_VOICE ico:fas-dot-circle' ); //7.5.0.0
     rc_BuildMenuItem( '',  0, 'Touch Demo frm:Demo_Touch ico:fas-dot-circle' ); //7.4.0.0
     rc_BuildMenuItem( '',  0, 'Bar Rating frm:DEMO_BAR_RATING ico:fas-dot-circle' ); //7.4.0.0
     rc_BuildMenuItem( '',  0, 'Editor HTML frm:Demo_HtmlEditor ico:fas-dot-circle' ); //7.4.0.0
     rc_BuildMenuItem( '',  0, 'Assin. Eletrônica frm:Demo_eSIGN ico:fas-dot-circle' ); //7.4.0.0
     rc_BuildMenuItem( '',  0, 'Assin. Eletrônica( suave ) frm:Demo_eSIGN_Smooth ico:fas-dot-circle' ); //7.4.0.0
     rc_BuildMenuItem( '',  0, 'Envio de Arquivos frm:Demo_Upload ico:fas-dot-circle' ); //7.4.0.0
     rc_BuildMenuItem( '',  0, 'Calendário frm:Demo_Calendar ico:fas-dot-circle' ); //7.2.0.0
     rc_BuildMenuItem( '',  0, 'Botões frm:Demo_Buttons ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Collapse e Accordion frm:Demo_Collapse ico:fas-dot-circle' ); //7.0.0.0
     rc_BuildMenuItem( '',  0, 'Para Formulários frm:Demo_Forms ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Input Add-On frm:Demo_INPUTADDON ico:fas-dot-circle' ); //7.0.0.0
     rc_BuildMenuItem( '',  0, 'Button Types badge:New frm:Demo_BtnTypes ico:fas-dot-circle' );//8.0.0.0
     rc_BuildMenuItem( '',  0, 'Demo Wizard frm:Demo_Wizard ico:fas-dot-circle modal:' );
     rc_BuildMenuItem( '',  0, 'bsPill / bsTabs frm:Demo_Tabs ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Mensages / Alin.Dinâmico frm:Demo_Messages ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Tool Tips frm:Demo_Tooltips ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Badges frm:Demo_Badges badge:8.2.0.0 ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'BootStrap Icons frm:Demo_BS_Icons badge:8.2.0.0 ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'CallOut frm:Demo_CallOut ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Panels / Cards frm:Demo_Panels ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Video / Cam / Image frm:Demo_VideoImg ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Extras frm:Demo_Extras ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Carrosséis frm:DEMO_CAROUSEL ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'RC Blocks frm:RcBlocks ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'COLS-GRID frm:Demo_Grid_Cols ico:fas-dot-circle' ); //7.0.0.0
     rc_BuildMenuItem( '',  0, 'COLS-GRID "debug-mode" frm:Demo_Grid_Cols_Debug ico:fas-dot-circle' ); //7.0.0.0
     rc_BuildMenuItem( '',  0, 'COLS-OFFSET frm:Demo_Cols_Offset ico:fas-dot-circle' ); //7.0.0.0
     rc_BuildMenuItem( '',  0, 'Fish Fact frm:FISHFACT ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'RC Racing frm:RCRacing master:'); //6.0.0.0
        rc_BuildMenuItemPermission( '', '<A>' );
     rc_BuildMenuItem( '',  2, 'GRÁFICOS ico:fas-bars' );
     rc_BuildMenuItem( '',  0, 'Exemplos ChartJS frm:GraphChartJS ico:fas-dot-circle' );     //
     rc_BuildMenuItem( '',  0, 'Exemplos APEX frm:GraphAPEX ico:fas-dot-circle' );     //
     rc_BuildMenuItem( '',  0, 'Exemplos GOOGLE frm:GraphGOOGLE ico:fas-dot-circle' );     //7.3.0.0
     //7.3.0.0
     rc_BuildMenuItem( '',  2, 'MENUS ALTERNATIVOS ico:fas-bars' );
     rc_BuildMenuItem( '',  0, 'Menu #1 frm:DEMO_ALT_MENU ico:fas-dot-circle' );     //
     // 6.0.0.0
     // demonstração de FORM MODAL e NÃO MODAL | FORM MODAL and NON MODAL DEMO
     rc_BuildMenuItem( '',  2, 'LAYOUTS( com dados ) ico:fas-table' ); // 6.0.0.0
     rc_BuildMenuItem( '',  0, 'ListView com Paginação ( Sem CRUD ) frm:DEMO_GRIDPAGINATIONMODAL ico:fas-dot-circle modal:'  ); // 6.0.0.0
     rc_BuildMenuItem( '',  0, 'Cad. Contatos Dinâmico frm:DEMO_ADD_CONTACTS ico:fas-dot-circle modal:'  ); // 6.0.0.0
     rc_BuildMenuItem( '',  0, 'LookUps ( Sem CRUD ) frm:DEMO_LOOKUPMODAL ico:fas-dot-circle modal:'  ); // 6.0.0.0
     rc_BuildMenuItem( '',  0, 'Form - Action Buttons ( Non CRUD ) frm:DEMO_ACTIONSMODAL ico:fas-dot-circle modal:'  ); // 6.0.0.0
     //rc_BuildMenuItem( '',  0, 'Form - Dynamic BIND frm:DEMO_ACTIONSMODAL_BIND ico:fas-dot-circle modal:'  ); // 6.0.0.0
     //rc_BuildMenuItem( '',  0, 'Frame - Dynamic ACTION BTN BIND frm:DEMOACTIONS_BIND ico:fas-dot-circle '  ); // 6.0.0.0
     rc_BuildMenuItem( '',  0, 'HTML GRIDs frm:DEMO_GRIDS ico:fas-dot-circle '  ); //7.4.0.0
     rc_BuildMenuItem( '',  0, 'BIND de Dados Dinâmico frm:DEMO_DYNAMIC_BIND ico:fas-dot-circle tag-form:S'  ); // 6.0.0.0
     rc_BuildMenuItem( '',  0, 'Time Line frm:DEMO_TIMELINE ico:fas-dot-circle tag-form:1'  ); // 7.0.0.0
     rc_BuildMenuItem( '',  0, 'Time Line( ZigZag ) frm:DEMO_TIMELINE ico:fas-dot-circle tag-form:2'  ); // 7.0.0.0

     rc_BuildMenuItem( '',  2, 'LAYOUTS( sem dados ) ico:fas-table' ); // 6.0.0.0
     rc_BuildMenuItem( '',  0, 'Form ( em aba ) frm:DEMOWITHFORM ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Form ( Show MODAL ) frm:DEMOWITHFORMModal ico:fas-dot-circle modal:'  );
     rc_BuildMenuItem( '',  2, 'LAYOUTS COMPLEXOS ico:fas-table' ); // 6.0.0.0
     rc_BuildMenuItem( '',  0, 'Layout #1 frm:Demo_Form_Layout_1 ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Layout #2 frm:Demo_Form_Layout_2 ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Layout #3 PDV frm:Demo_Form_Layout_3 ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Layout #4 PDV( modal ) frm:Demo_Pdv_Modal ico:fas-dot-circle modal:' );
     rc_BuildMenuItem( '',  0, 'Layout #5 PinPAD frm:Demo_Form_Layout_4 ico:fas-dot-circle' );
     rc_BuildMenuItem( '',  0, 'Layout #6 LOGIN frm:Demo_Login ico:fas-dot-circle' ); //7.0.0.0
     rc_BuildMenuItem( '',  0, 'Layout #7 FORMS SAMPLES frm:Demo_Form_Layout_7 ico:fas-dot-circle' ); //7.0.0.0
     rc_BuildMenuItem( '',  0, 'Layout #8 5 COLS SAMPLE frm:Demo_Form_Layout_8 ico:fas-dot-circle' ); //7.0.0.0
     rc_BuildMenuItem( '',  0, 'Layout #9 NO BORDERS SAMPLE frm:Demo_Form_Layout_10 ico:fas-dot-circle' ); //7.0.0.0

     rc_BuildMenuItem( '',  1, 'BÁSICOS ico:fas-sitemap' ); // 6.0.0.0
     rc_BuildMenuItem( '',  2, 'Cad. Básicos ico:fas-table' ); // 6.0.0.0
     rc_BuildMenuItem( '',  0, 'Estados tbl:UFS basic-crud:' );//8.0.0.0
     rc_BuildMenuItem( '',  0, 'Cidades tbl:cidades genid-off:' ); // 6.0.0.0 "genid-off:" sample
     rc_BuildMenuItem( '',  0, 'Feriados tbl:feriados' );
     //[PT] exemplo de tabela que a PK é ALFANUMÉRICA e com ZEROS A ESQUERDA( em uconsts.pas ajuste TABLE_PK_WITH_LEFT_ZEROS )
     //[EN] table example that the PK is ALPHANUMERIC and with LEFT ZEROS (in uconsts.pas adjust TABLE_PK_WITH_LEFT_ZEROS)
     rc_BuildMenuItem( '',  0, 'Tabela alfanumérica tbl:T040001 ico:fas-barcode zerosleft:' ); // 6.0.0.0
     // 6.0.0.0
     rc_BuildMenuItem( '', 0, 'Tabela com PK secundária frm:TB_TEST tbl:TB_TEST ico:fas-dot-circle tag-form:A getpk:idprod' );

     // exemplo de tabela com chave primária composta | example table with composite primary key
     rc_BuildMenuItem( '',  0, 'Exemplo PK Composta tbl:TB_COMPOUNDPK ico:fas-table' ); // 6.0.0.0

     //opcoes vinculadas a uma ÁREA DE ATUACAO ESPECÍFICA | options linked to a SPECIFIC AREA OF ACTION
     if mm.CONFIG_APP_TYPE = 'DISTRIB' then
     begin
          //rc_BuildMenuItem( '',  0, 'yout option ico:fas-table' );
     end;
     //[PT] opção exclusiva se o sistema rodando atual for da sua software house
     //[EN] exclusive option if the current system is from your software house
     if mm.varC_Doc_Customer = SOFTWAREHOUSE_CNPJ then
     begin
          //rc_BuildMenuItem( '',  0, 'Sistemas tbl:tb_sistemas' );
     end;
     //[PT] opção exclusiva vinculado a empresa selecionada no login
     //[EN] exclusive option linked to the company selected at login
     if mm.varI_Code_Company = 1 then
     begin
          //rc_BuildMenuItem( '',  0, 'Sistemas tbl:tb_sistemas' );
     end;

     rc_BuildMenuItem( '',  2, 'Pessoas / Entidades ico:fas-male' ); // 6.0.0.0


     //rc_BuildMenuItem( '',  0, 'Clientes tbl:clientes' );
     //[PT] o "hidemaskoff:" é uma tentativa de manter o "showmask" do click do menu principal ativo até que processamentos que vão ocorrer
     //     no form/frame chamado, se completem. Nesse momento, o controle pra fechar o showmask( hide ) deve ser totalmente manual.
     //[EN] "hidemaskoff:" is an attempt to keep the "showmask" of the main menu click active until further processing takes place
     //     in the called form/frame, complete each other. At this moment, the control to close the showmask (hide) must be completely manual.
     //
     rc_BuildMenuItem( '',  0, 'Clientes tbl:clientes hidemaskoff:' );// // 6.0.0.0 menu mask
        //permissions
        rc_BuildMenuItemPermission( '', '<AIED>' );
        rc_BuildMenuItemPermission( '', 'Licence Tab' );
     // //7.3.0.0
//     rc_BuildMenuItem( '',  0, 'Clientes ( search custom ) frm:CLIENTES_SEARCHCUSTOM tbl:clientes' );// //7.3.0.0



        //permissions
        rc_BuildMenuItemPermission( '', '<AIED>' );
        rc_BuildMenuItemPermission( '', 'Licence Tab' );

     rc_BuildMenuItem( '',  0, 'Marcas ( crud 2 - theme colors ) tbl:marcas frm:marcas_crud2 ico:fas-cogs' );  // 6.0.0.0
     rc_BuildMenuItem( '',  0, 'Clientes ( crud 2 - theme colors ) tbl:clientes frm:clientes_crud2 ico:fas-users' );  // 6.0.0.0
     rc_BuildMenuItem( '',  0, 'Clientes ( crud 2 - actions ) tbl:clientes frm:clientes_crud2_actions ico:fas-users' );  // 6.0.0.0

     //permissions DETAILS de frmCadCLIENTES
     rc_BuildMenuItem( '',  0, 'Revisões Clientes tbl:clientes_revisoes notshow:' );
        //permissions
        rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  0, 'Fornecedores tbl:fornecedores' );
        //permissions
        rc_BuildMenuItemPermission( '', '<AIED>' );

     rc_BuildMenuItem( '',  2, 'Estoque / Serviço ico:fas-barcode' ); // 6.0.0.0
     rc_BuildMenuItem( '',  0, 'Grupos tbl:grupos basic-crud:' );//8.0.0.0
     rc_BuildMenuItem( '',  0, 'Marcas tbl:marcas basic-crud:' );//8.0.0.0

     //[PT] adicione a linha abaixo na unit uMenu_BASICS de seu(s) projetos
     //[EN] add the line below in the uMenu_BASICS unit of your project(s)
     //RC ELEMENTS New Options - do not change the position or remove this line.
end;
end.

