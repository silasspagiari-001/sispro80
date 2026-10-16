unit uconsts_cfg;


interface

uses

  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;


const

  //[PT] As constantes são usadas na formação de alguns parâmetros e mensagens
  //[EN] Constants are used in the formation of some parameters and messages

  //nome do SEU aplicativo | name of YOUR application
  APP_NAME                            = 'SISPRO';
  APP_MODEL                           = 'BRASIL'; //8.1.0.0
  APP_NAME_VERSION                    = '8.0.0.1' ;
  //porta padrao pra rodar a aplicação | default port to run the application
  APP_PORT                            = '8075';

  DB_POOLED                           = true;
  DB_SCHEMA                           = '';//6.1.0.0( in dev )
  // 6.0.0.0
  //[PT] Se vc não usar o padrão do RadCORE para nomenclatura dos "forms", use apenas "T" nas constantes abaixo
  //[EN] If you do not use the RadCORE standard for naming "forms", just use "T" in the constants below
  FRM_CLASS_PREFIX                    = 'TFRM';   // or 'T'
  FRM_CLASS_CRUD_PREFIX               = 'TFRMCAD';// or 'T'
  // 6.0.0.0
  // MENU WIDTH
  MAIN_MENU_EXPANDED                  = 350;//300//7.5.0.0 menu
  MAIN_MENU_ITEM_MAXWIDTH             = 270;//208//7.5.0.0 menu
  MAIN_MENU_MICRO                     = 44;
  // DEFAULT FONT / FONT SIZE( do not change this )
  DEFAULT_FONT_NAME                   = 'Calibri';
  DEAFULT_LABEL_FONT_SIZE             = 10;
  DEAFULT_BTN_EDT_FONT_SIZE           = 11;
  // File Extensions
  APP_FILETYPES                       = '.jpg,.png,.rar,.zip,.pdf,.txt'; // 6.0.0.0

  //[PT] Constantes básicas usadas na função "rC_PermissionVerify"
  //[EN] Basic constants used in the "rC_PermissionVerify" function
  PT_ACCESS = 1;
  PT_INSERT = 2;
  PT_EDIT   = 3;
  PT_DELETE = 4;
  //PT_HIDDEN = 5;

  //[PT] dados da SUA empresa que serão usados para exibição de mensagens etc.
  //     ao ser executado pela primeira vez o RADCORE cria TODA a estrutura de pastas
  //     para ORGANIZAR seus sistemas seguindo o modelo abaixo:
  //[EN] data from YOUR company that will be used to display messages, etc.
  //     when run for the first time, RADCORE creates the ENTIRE folder structure
  //     to ORGANIZE your systems following the model below:

  SOFTWAREHOUSE_NAME                  = 'Sispro Sistemas';
  SOFTWAREHOUSE_CNPJ                  = '08817253000164';

  SOFTWAREHOUSE_COMMERCIAL_PHONE      = '85998621405' ;
  SOFTWAREHOUSE_FINANCIAL_PHONE       = '85998621405' ;
  SOFTWAREHOUSE_SUPPORT_PHONE         = '85998621405' ;

  SOFTWAREHOUSE_COMMERCIAL_EMAIL      = 'sislite@gmail.com';
  SOFTWAREHOUSE_COMMERCIAL_EMAIL_PASS = '';
  SOFTWAREHOUSE_FINANCIAL_EMAIL       = 'sislite@gmail.com';
  SOFTWAREHOUSE_FINANCIAL_EMAIL_PASS  = '';
  SOFTWAREHOUSE_SUPPORT_EMAIL         = 'sislite@gmail.com';
  SOFTWAREHOUSE_SUPPORT_EMAIL_PASS    = '';

  SOFTWAREHOUSE_SITE                  = 'https://www.sislite.pro.br';

  //[PT] Senha MASTER para acesso aos dados e/ou estatísticas do servidor uniGUI.
  //     Gere uma nova senha em MD5 para seu projeto. Existem vários sites gratuitos que podem gerar.
  //[EN] MASTER password for accessing uniGUI server data and / or statistics.
  //     Generate a new MD5 password for your project. There are several free websites that can generate.
  USER_ADMIN_PASS                     = '08D81B2FD862B26252DCE8F23AE1A6A1'; // { created on RC WIZARD: M1kromund0R@dC0r3}

  //[PT] Os cadastros BÁSICOS são todas as telas que tenha apenas os campos CODIGO e DESCRICAO
  //[EN] BASIC registrations are all screens that only have the CODE and DESCRIPTION fields
  //ARRAY_BASICS : array [1..1] of string = ( '' ); //[PT] se não for usar "frmCadBASICS", descomente essa linha e comente as linhas abaixo
                                                    //[EN] if you are not using "frmCadBASICS", uncomment this line and comment the lines below
  //8.0.0.0 ( descontinuado.... discontinued... )
  //ARRAY_BASICS : array [1..1] of string = ( '' );
  //  ARRAY_BASICS : array [1..5] of string = ( 'grupos',      //table names
//                                            'marcas',
//                                            'montadoras' ,
//                                            'carros',
//                                            'ufs'  );

  // -----------------------------------------------------------------
  // Configurações para controle de geração de novos cadastros | Settings to control the generation of new registrations
  // -----------------------------------------------------------------
  // Tabelas que a PK não é um código sequencial | Tables that PK is not a sequential code
  // -----------------------------------------------------------------
  // Exemplo: DATAS, CNPJ...
  ARRAY_PK_NO_INC : array [1..1] of string = ( '' ) ; //table name

  //[PT] Tabelas que a PK não recebe ZEROS a ESQUERDA se a CONSTANTE de PREENCIMENTO DE ZEROS( TABLE_PK_WITH_LEFT_ZEROS ) estiver definida com valor > 0
  //[EN] Tables that the PK does not receive LEFT ZERO if the ZERO FILLING CONSTANT (TABLE_PK_WITH_LEFT_ZEROS) is defined with value> 0
  //
  // Exemplo: CNPJ...
  //
  ARRAY_PK_NO_ZERO : array [1..1] of string = ( '' ) ;

  //[PT] CONSTANTE de PREENCIMENTO DE ZEROS a ESQUERDA para chaves primárias( PK ) strings
  //[EN] LEFT ZERO FILLING CONSTANT for primary keys (PK) strings
  TABLE_PK_WITH_LEFT_ZEROS = 5;   //[PT] se for > 0 indica que o campo codigo é STRING e associa 'n' zeros a esquerda
                                  //     de acordo com o SIZE do CAMPO ( chave primária STRING )
                                  //     veja "frmT040001" como exemplo
                                  //[EN] if > 0 indicates that the code field is STRING and associates 'n' zeros to the left
                                  //     according to the FIELD SIZE (primary key STRING)
                                  //     see "frmT040001" as an example

  //[PT Tabelas que a PK precisa ser reposicionada( em algumas situações, a ordem dos campos não é mantida )( deprecated )
  //[EN] Tables that the PK needs to be repositioned ( in some situations, the order of fields is not maintained ) )( deprecated )
  //
  // Exemplo: planocontas
  //
  ARRAY_PK_PRIOR : array [1..1] of string = ( 'planocontas' ) ;

  //7.0.0.0
  //[PT] Caso a aplicação gerada com o RadCORE seja para atender uma área específica onde determinados recursos podem
  //     ser ocultos/exibidos de acordo com essa seleção.
  //[EN] If the application generated with RadCORE is to serve a specific area where certain resources can
  //     be hidden/displayed according to this selection.
  // default  - DEFAULT
  // ofc      - CENTRO AUTOMOTIVO | AUTOMOTIVE CENTER
  // otc      - ÓTICAS | OPTICS
  // confec   - CONFECÇÕES | CLOTHES STORE
  // pet      - PET SHOP
  // distrib  - DISTRIBUIDORAS | DISTRIBUTORS
  // glp      - REVENDAS DE GLP/ÁGUA  | LPG/WATER RESALE
  // body     - CLÍNICA DE ESTÉTICA | AESTHETIC CLINIC
  // food     - BAR E RESTAURANTE | BAR AND RESTAURANT
  // info     - INFORMÁTICA / ASSIST. TÉCNICA  | COMPUTER TECHNOLOGY / SERVICES
  // hair     - SALÃO DE BELEZA | BEAUTY SALON
  // educa    - EDUCAÇÃO | EDUCATION
  // hospital - HOSPITAL | HOSPITAL
  ARRAY_COMPANY_TYPE : Array [1 .. 13] of String = ( 'DEFAULT',
                                                     'OFC',
                                                     'OTC',
                                                     'CONFEC',
                                                     'PET',
                                                     'GLP',
                                                     'HAIR',
                                                     'BODY',
                                                     'DISTRIB',
                                                     'INFO',
                                                     'CONSERT',
                                                     'EDUCA',
                                                     'HOSPITAL'
                                                     );

  //[PT] caso em suas tabelas existam campos de controle interno que não devem ser mostrados nos grids, basta adicioná-los no array abaixo
  //[EN] if in your tables there are internal control fields that should not be shown in the grids, just add them to the array below
  ARRAY_DO_NOT_SHOW_DBGRID : Array [1 .. 3] of String = ( 'date_update'          ,
                                                          'date_access'          ,
                                                          'hour_access'          );

implementation

end.

