unit mkm_spedpiscofins;

interface
uses mkm_funcoes, mkm_func_web, MainModule,System.SysUtils,ACBrEFDBlocos,ACBrSpedFiscal,Data.DB,
     System.StrUtils, System.Variants, FireDAC.Comp.Client,ACBrSpedPisCofins;
var
  ACBrSpedPisCofins    : TACBrSPEDPisCofins;
  TMvmestre,TPessoas ,
  TOperacao,Timposto ,
  TProdutos,TEmpresas,
  TGrupos,TItensMestre : TFDQuery;
  TB_BLOCOK_0200,
  TB_MEDIDAS,
  TB_OPERACAOSPED,
  TB_PESSOASSPED       : TFDMemTable;
  M_NOMEARQUIVO        : string;


function  SqlTabela       (const tabela,msql:string):Boolean;
function  SpedFiscal      (const rempresa,rempresaserv:integer;dataini,datafin:TDateTime):string;
procedure Bloco_0_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
procedure Bloco_1_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
procedure Bloco_A_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
procedure Bloco_C_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
procedure Bloco_D_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
procedure Bloco_F_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
procedure Bloco_I_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
procedure Bloco_P_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
procedure Bloco_9_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
procedure Bloco_M_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
procedure Gerar_TXT_Fiscal(Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);

implementation

uses untDM_RC, ACBrEPCBlocos, mkm_procedures, ServerModule;



function  SqlTabela       (const tabela,msql:string):Boolean;
begin
  if tabela = 'imposto' then
    begin

      with Timposto do
        begin
          Close;
          UnPrepare;
          Sql.Clear;
          sql.Text := msql;
          Prepare;
          Open;
        end;

      if Timposto.IsEmpty then
        result := False
      else
        result := True;
    end;

  if tabela = 'operacao' then
    begin

      with TOperacao do
        begin
          Close;
          UnPrepare;
          Sql.Clear;
          sql.Text := msql;
          Prepare;
          Open;
        end;

      if TOperacao.IsEmpty then
        result := False
      else
        result := True;
    end;

  if tabela = 'itemmestre' then
    begin

      with TItensMestre do
        begin
          Close;
          UnPrepare;
          Sql.Clear;
          sql.Text := msql;
          Prepare;
          Open;
        end;

      if TItensMestre.IsEmpty then
        result := False
      else
        result := True;
    end;

  if tabela = 'grupo' then
    begin

      with TGrupos do
        begin
          Close;
          UnPrepare;
          Sql.Clear;
          sql.Text := msql;
          Prepare;
          Open;
        end;

      if TGrupos.IsEmpty then
        result := False
      else
        result := True;
    end;

  if tabela = 'empresa' then
    begin

      with TEmpresas do
        begin
          Close;
          UnPrepare;
          Sql.Clear;
          sql.Text := msql;
          Prepare;
          Open;
        end;

      if TEmpresas.IsEmpty then
        result := False
      else
        result := True;
    end;

  if tabela = 'mvmestre' then
    begin
      with TMvmestre do
        begin
          Close;
          UnPrepare;
          Sql.Clear;
          sql.Text := msql;
          Prepare;
          Open;
        end;

      if TMvmestre.IsEmpty then
        result := False
      else
        result := True;
    end;

  if tabela = 'pessoa' then
    begin

      with TPessoas do
        begin
          Close;
          UnPrepare;
          Sql.Clear;
          sql.Text := msql;
          Prepare;
          Open;
        end;

      if TPessoas.IsEmpty then
        result := False
      else
        result := True;
    end;

  if tabela = 'produto' then
    begin

      with TProdutos do
        begin
          Close;
          UnPrepare;
          Sql.Clear;
          sql.Text := msql;
          Prepare;
          Open;
        end;

      if TProdutos.IsEmpty then
        result := False
      else
        result := True;
    end;
end;
function SpedFiscal(const rempresa,rempresaserv:integer;dataini,datafin:TDateTime):string;
begin
  TItensMestre     := TFDQuery.Create(nil); TItensMestre.Connection :=  mm.SQLConn;
  TGrupos          := TFDQuery.Create(nil); TGrupos.Connection      :=  mm.SQLConn;
  TEmpresas        := TFDQuery.Create(nil); TEmpresas.Connection    :=  mm.SQLConn;
  TMvmestre        := TFDQuery.Create(nil); TMvmestre.Connection    :=  mm.SQLConn;
  TPessoas         := TFDQuery.Create(nil); TPessoas.Connection     :=  mm.SQLConn;
  TProdutos        := TFDQuery.Create(nil); TProdutos.Connection    :=  mm.SQLConn;
  TOperacao        := TFDQuery.Create(nil); TOperacao.Connection    :=  mm.SQLConn;
  Timposto         := TFDQuery.Create(nil); Timposto.Connection     :=  mm.SQLConn;

  TB_BLOCOK_0200   := TFDMemTable.Create(nil);
  TB_MEDIDAS       := TFDMemTable.Create(nil);
  TB_OPERACAOSPED  := TFDMemTable.Create(nil);
  TB_PESSOASSPED   := TFDMemTable.Create(nil);

  ACBrSpedPisCofins := TACBrSPEDPisCofins.Create(nil);

  with TB_BLOCOK_0200.FieldDefs do
    begin
      Add('PRODUTO'      , ftInteger);
      Add('DESCRICAO'    , ftString,200, False);
      Add('NUMERONCM'    , ftString,020, False);
      Add('UNIDADE'      , ftString,015, False);
      Add('ATIVO'        , ftString,001, False);
      Add('TIPO'         , ftString,030, False);
      Add('QUANTIDADE'   , ftFloat);
      Add('CUSTO'        , ftFloat);
      Add('ICMS0'        , ftFloat);
    end;

  with TB_MEDIDAS.FieldDefs do
    begin
      Add('DESCRICAO'    , ftString,200, False);
      Add('UNIDADE'      , ftString,015, False);
    end;

  with TB_OPERACAOSPED.FieldDefs do
    begin
      Add('CODIGO'       , ftInteger);
      Add('DESCRICAO'    , ftString,200, False);
    end;

  with TB_PESSOASSPED.FieldDefs do
    begin
      Add('CONTROLE'     , ftInteger);
      Add('CODIGO'       , ftString,010, False);
      Add('DESCRICAO'    , ftString,200, False);
    end;


  TB_BLOCOK_0200.Close;
  TB_BLOCOK_0200.CopyDataSet(dm_rc.TB_BLOCOK_0200);
  TB_BLOCOK_0200.Open;

  TB_MEDIDAS.Close;
  TB_MEDIDAS.CopyDataSet(dm_rc.TB_MEDIDAS);
  TB_MEDIDAS.Open;

  TB_OPERACAOSPED.Close;
  TB_OPERACAOSPED.CopyDataSet(dm_rc.TB_OPERACAOSPED);
  TB_OPERACAOSPED.Open;

  TB_PESSOASSPED.Close;
  TB_PESSOASSPED.CopyDataSet(dm_rc.tb_pessoassped);
  TB_PESSOASSPED.Open;

  Bloco_0_Fiscal(rempresa,rempresaserv,dataini,datafin);
  Bloco_A_Fiscal(rempresa,rempresaserv,dataini,datafin);
  Bloco_C_Fiscal(rempresa,rempresaserv,dataini,datafin);
  Bloco_1_Fiscal(rempresa,rempresaserv,dataini,datafin);
  Bloco_9_Fiscal(rempresa,rempresaserv,dataini,datafin);
  Bloco_D_Fiscal(rempresa,rempresaserv,dataini,datafin);
  Bloco_F_Fiscal(rempresa,rempresaserv,dataini,datafin);
  Bloco_I_Fiscal(rempresa,rempresaserv,dataini,datafin);
  Bloco_P_Fiscal(rempresa,rempresaserv,dataini,datafin);
  Bloco_M_Fiscal(rempresa,rempresaserv,dataini,datafin);

  Gerar_TXT_Fiscal(rempresa,rempresaserv,dataini,datafin);

  TItensMestre     .Free;
  TGrupos          .Free;
  TEmpresas        .Free;
  TMvmestre        .Free;
  TPessoas         .Free;
  TProdutos        .Free;
  TOperacao        .Free;

  TB_BLOCOK_0200   .Free;
  TB_MEDIDAS       .Free;
  TB_OPERACAOSPED  .Free;
  TB_PESSOASSPED   .Free;

  ACBrSpedPisCofins   .Free;

  Result := M_NOMEARQUIVO;
end;
procedure Bloco_0_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
begin
  SqlTabela('empresa','select * from empresas where codigo = ' + IntToStr(rempresa));

  M_NOMEARQUIVO             := 'PISCOFINS_'+ TEmpresas.FindField('FANTASIA').AsString +'_' + RemoverEspeciais(DateToStr(datafin)) + '_' + RemoverEspeciais(TimeToStr(Time)) +  '.txt';
  ACBrSpedPisCofins.Path    := sm.LocalCachePath;
  ACBrSpedPisCofins.Arquivo := M_NOMEARQUIVO;


   with ACBrSPEDPisCofins do
     begin
       DT_INI := dataini;
       DT_FIN := datafin;
       IniciaGeracao;
     end;


  with ACBrSPEDPisCofins.Bloco_0 do
   begin
    with Registro0000New do
      begin
        TIPO_ESCRIT      := tpEscrRetificadora;
        IND_SIT_ESP      := indSitAbertura;
        COD_VER          := vlVersao320;
        TIPO_ESCRIT      := tpEscrOriginal;
        IND_SIT_ESP      := indSitAbertura;
        NUM_REC_ANTERIOR := '';
        NOME             := TEmpresas.FindField('NOME').AsString;
        CNPJ             := TEmpresas.FindField('CNPJ').AsString;
        UF               := TEmpresas.FindField('ESTADO').AsString;
        COD_MUN          := TEmpresas.FindField('IBGE').AsInteger;
        SUFRAMA          := '';
        IND_NAT_PJ       := indNatPJSocEmpresariaGeral;
        IND_ATIV         := indAtivComercio;

        with Registro0001New do
          begin
             IND_MOV := imComDados;
            if StrContains('12462038000165#06269946000134#06269946000215#08606807000184',TEmpresas.FindField('CNPJ').AsString) then
              begin
                with Registro0100New do
                  begin
                    NOME       := 'VALDIR GUARIENTO';
                    CPF        := '78021812834';
                    CRC        := '1SP097577/O-1';
                    CNPJ       := '16810760000102';
                    CEP        := '19360000';
                    ENDERECO   := 'PRACA ATALIBA LEONEL';
                    NUM        := '254';
                    COMPL      := '';
                    BAIRRO     := 'CENTRO';
                    FONE       := '1832631093';
                    FAX        := '1832631093';
                    EMAIL      := 'band@commtat.com.br';
                    COD_MUN    := 3547700;
                  end;
              end
            else
             if StrContains('11600296000106', TEmpresas.FindField('CNPJ').AsString) then
               begin
                 // FILHO - Dados do contador.
                with Registro0100New do
                   begin
                      NOME       := 'ANTONIO CARLOS PEDRO';
                      CPF        := '03620386862';
                      CRC        := '1SP222594/O-0';
                      CNPJ       := '';
                      CEP        := '17920000';
                      ENDERECO   := 'Rua Amazonas';
                      NUM        := '660';
                      COMPL      := '';
                      BAIRRO     := 'CENTRO';
                      FONE       := '1838721165';
                      FAX        := '';
                      EMAIL      := '';
                      COD_MUN    := 3534807;
                   end;
               end
             else
               begin
                 // FILHO - Dados do contador.
                 with Registro0100New do
                   begin
                      NOME       := 'ANTONIO CARLOS PEDRO';
                      CPF        := '03620386862';
                      CRC        := '1SP222594/O-0';
                      CNPJ       := '';
                      CEP        := '17920000';
                      ENDERECO   := 'Rua Amazonas';
                      NUM        := '660';
                      COMPL      := '';
                      BAIRRO     := 'CENTRO';
                      FONE       := '1838721165';
                      FAX        := '';
                      EMAIL      := '';
                      COD_MUN    := 3534807;
                   end;
               end;

             with Registro0110New do
               begin
                 COD_INC_TRIB  := codEscrOpIncCumulativo;
                 COD_TIPO_CONT := codIndTipoConExclAliqBasica;
                 IND_REG_CUM   := codRegimeCompetEscritDetalhada;
               end;

             //0140 - Tabela de Cadastro de Estabelecimento
             // FILHO
            with Registro0140New do
             begin
                 COD_EST := TEmpresas.FindField('CODIGO').AsString;;
                 NOME    := TEmpresas.FindField('NOME').AsString;
                 CNPJ    := RemoverEspeciais(TEmpresas.FindField('CNPJ').AsString);
                 UF      := TEmpresas.FindField('ESTADO').AsString;
                 IE      := RemoverEspeciais(TEmpresas.FindField('INSCRICAO').AsString);
                 COD_MUN := TEmpresas.FindField('IBGE').AsInteger;
                 IM      := '';
                 SUFRAMA := '';

              //*************************************************************************//
              //  BUSCA PESSOAS
              //*************************************************************************//
               TB_PESSOASSPED.First;
               while not TB_PESSOASSPED.Eof do
                 begin
                   with Registro0150New do
                     begin
                       SqlTabela('pessoa','SELECT * FROM PESSOAS WHERE CODIGO = ' + QuotedStr(TB_PESSOASSPED.FindField('CONTROLE').AsString));

                       COD_PART := TB_PESSOASSPED.FindField('CODIGO').AsString;
                       NOME     := StrAllTrim(TPessoas.FindField('NOME').AsString);
                       COD_PAIS := variif(TPessoas.FindField('ESTADO').AsString = 'EX','0','1058') ;

                       if Length(StrAllTrim(RemoverEspacos(RemoverEspeciais(TPessoas.FindField('CPFCNPJ').AsString)))) = 11 then
                         CPF      := StrAllTrim(RemoverEspacos(RemoverEspeciais(TPessoas.FindField('CPFCNPJ').AsString)))
                       else
                         CNPJ     := StrAllTrim(RemoverEspacos(RemoverEspeciais(TPessoas.FindField('CPFCNPJ').AsString)));

                         IE       := StrAllTrim(RemoverEspeciais(TPessoas.FindField('INSCRICAO').AsString)) ;

                       if not StrEmpty(TPessoas.FindField('CODIIBGE').AsString) then
                         COD_MUN  := StrToInt(TPessoas.FindField('CODIIBGE').AsString)
                       else
                         COD_MUN  := 0;
                       SUFRAMA    := '';
                       ENDERECO   := StrAllTrim(TPessoas.FindField('ENDERECO').AsString);
                       NUM        := StrAllTrim(TPessoas.FindField('NUMERO').AsString);
                       COMPL      := '';
                       BAIRRO     := StrAllTrim(TPessoas.FindField('BAIRRO').AsString);
                     end;
                   TB_PESSOASSPED.Next;
                 end;

                //*****************************************************************************//
                //                                    UNIDADES                                 //
                //*****************************************************************************//

                TB_MEDIDAS.First;
                while not TB_MEDIDAS.eof do
                 begin
                   with Registro0190New do
                     begin
                       UNID    := TB_MEDIDAS.findfield('UNIDADE').AsString;
                       DESCR   := TB_MEDIDAS.findfield('DESCRICAO').AsString;
                     end;
                   TB_MEDIDAS.Next;
                 end;


               //****************************************************************************//
               //                                   PRODUTOS                                 //
               //                                   0200 MOV ESTOQUE                         //
               //****************************************************************************//
                 TB_BLOCOK_0200.First;
                 while not TB_BLOCOK_0200.Eof do
                   begin
                     with Registro0200New do
                       begin

                         COD_ITEM     := TB_BLOCOK_0200.FindField('PRODUTO').AsString;
                         DESCR_ITEM   := StrAllTrim(TB_BLOCOK_0200.FindField('DESCRICAO').AsString);
                         COD_BARRA    := '';
                         COD_ANT_ITEM := '';
                         UNID_INV     := variif(TB_BLOCOK_0200.FindField('UNIDADE').AsString = '','KG',TB_BLOCOK_0200.FindField('UNIDADE').AsString);

                         case AnsiIndexStr(TB_BLOCOK_0200.FindField('TIPO').AsString,[ '00 - Mercadoria para Revenda',
                                                                                       '01 - Matéria-Prima',
                                                                                       '02 - Embalagem',
                                                                                       '03 - Produto em Processo',
                                                                                       '04 - Produto Acabado',
                                                                                       '05 - Subproduto',
                                                                                       '06 - Produto Intermediário',
                                                                                       '07 - Material de Uso e Consumo',
                                                                                       '08 - Ativo Imobilizado',
                                                                                       '09 - Serviços',
                                                                                       '10 - Outros Insumos',
                                                                                       '99 - Outros']) of
                           0 : TIPO_ITEM    := tiMercadoriaRevenda;
                           1 : TIPO_ITEM    := tiMateriaPrima;
                           2 : TIPO_ITEM    := tiEmbalagem;
                           3 : TIPO_ITEM    := tiProdutoProcesso;
                           4 : TIPO_ITEM    := tiProdutoAcabado;
                           5 : TIPO_ITEM    := tiSubproduto;
                           6 : TIPO_ITEM    := tiProdutoIntermediario;
                           7 : TIPO_ITEM    := tiMaterialConsumo;
                           8 : TIPO_ITEM    := tiAtivoImobilizado;
                           9 : TIPO_ITEM    := tiServicos;
                           10: TIPO_ITEM    := tiOutrosInsumos;
                           11: TIPO_ITEM    := tiOutras;
                         end;

                         if TB_BLOCOK_0200.FindField('NUMERONCM').AsString = '99999999' then
                           COD_NCM      := ''
                         else
                           COD_NCM      := TB_BLOCOK_0200.FindField('NUMERONCM').AsString;

                         EX_IPI       := '';
                         COD_GEN      := '';
                         COD_LST      := '';
                         ALIQ_ICMS    := TB_BLOCOK_0200.FindField('ICMS0').AsInteger;
                       end;
                     TB_BLOCOK_0200.Next;
                   end;

               //****************************************************************************//
               //                                 TRIBUTAÇÃO
               //****************************************************************************//
               //*****************************************************************************//
               //BUSCA TRIBUTACAO NFE  - OPERACAO
               //****************************************************************************//
               TB_OPERACAOSPED.First;
               while not TB_OPERACAOSPED.Eof do
                 begin
                   with Registro0400New do
                     begin
                       COD_NAT    := IntToStr(TB_OPERACAOSPED.FindField('CODIGO').AsInteger);
                       DESCR_NAT  := StrAllTrim(TB_OPERACAOSPED.FindField('DESCRICAO').AsString);
                     end;
                   TB_OPERACAOSPED.Next;
                 end;

              //*****************************************************************************//
              //BUSCA EMPRESAS PRESTADORA DE SERVICOS - BLOCO 140
              //*****************************************************************************//
              SqlTabela('empresa','select * from empresas where codigo = ' + IntToStr(rempresaserv));
              //*****************************************************************************//
              if TEmpresas.RecordCount > 0 then
                begin
                  with Registro0140New do
                     begin
                       COD_EST := TEmpresas.FindField('CODIGO').AsString;;
                       NOME    := TEmpresas.FindField('NOME').AsString;
                       CNPJ    := RemoverEspeciais(TEmpresas.FindField('CNPJ').AsString);
                       UF      := TEmpresas.FindField('ESTADO').AsString;
                       IE      := RemoverEspeciais(TEmpresas.FindField('INSCRICAO').AsString);
                       COD_MUN := TEmpresas.FindField('IBGE').AsInteger;
                       IM      := '';
                       SUFRAMA := '';

                       //*****************************************************************************//
                       //BUSCA CLIENTES E FORNECEDORES - BLOCO 150
                       //*****************************************************************************//
                       SqlTabela('mvmestre',' SELECT PESSOA FROM MVMESTRE WHERE EMISSAO                 ' +
                                          ' BETWEEN                                                   ' + QuotedStr(DataPonto(DateToStr(dataini))) +
                                          ' AND                                                       ' + QuotedStr(DataPonto(DateToStr(datafin))) +
                                          ' AND  EMPRESA =                                            ' + IntToStr(rempresaserv)                   +
                                          ' AND ((DOCUMENTO = 2) OR (DOCUMENTO = 1))                  ' +
                                          ' group BY PESSOA');


                       //*****************************************************************************//
                      TMvmestre.First;
                      while not TMvmestre.Eof do
                        begin
                          with Registro0150New do
                            begin
                              SqlTabela('pessoa','SELECT * FROM PESSOAS WHERE CODIGO = ' + IntToStr(TMvmestre.FindField('PESSOA').AsInteger));

                              COD_PART := IntToStr(TPessoas.FindField('PESSOA').AsInteger) ;
                              NOME     := TPessoas.FindField('NOME').AsString;
                              COD_PAIS := TPessoas.FindField('IBGEENTREGA').AsString;

                              if Length(TPessoas.FindField('CPFCNPJ').AsString) = 14 then
                                CNPJ   := TPessoas.FindField('CPFCNPJ').AsString
                              else
                                CPF    := TPessoas.FindField('CPFCNPJ').AsString;

                              IE       := varIIF(StrContains('ISENTO#ISENTA',TPessoas.FindField('INSCRICAO').AsString),'', RemoverEspeciais(TPessoas.FindField('INSCRICAO').AsString));
                              COD_MUN  := TPessoas.FindField('CODIIBGE').AsInteger;


                              SUFRAMA  := '';
                              ENDERECO := TPessoas.FindField('ENDERECO').AsString;
                              NUM      := TPessoas.FindField('NUMERO').AsString ;
                              COMPL    := 'COMPLEMENTO';
                              BAIRRO   := TPessoas.FindField('BAIRRO').AsString;
                            end;
                          TMvmestre.Next;
                        end;
                     end;
                end;

              //*****************************************************************************//
              //BUSCA EMPRESAS REGISTRO 0500: PLANO DE CONTAS CONTÁBEIS - BLOCO 0500
              //*****************************************************************************//
              SqlTabela('mestre',' SELECT * FROM EMPRESAS WHERE ATIVO = ' + QuotedStr('T') + ' ORDER BY CODIGO');
              //*****************************************************************************//
              TEmpresas.First;
              while not TEmpresas.Eof do
                begin
                  with Registro0500New do
                    begin
                      DT_ALT      := dataini;
                      COD_NAT_CC  := ncgResultado;
                      IND_CTA     := indCTASintetica;
                      NIVEL       := '0';
                      COD_CTA     := TEmpresas.FindField('EMPPLACONTAS').AsString;
                      NOME_CTA    := Acha_Item('PLANOCONTAS',TEmpresas.FindField('EMPPLACONTAS').AsString);
                      COD_CTA_REF := '0';
                      CNPJ_EST    := '16810760000102';
                    end;
                  TEmpresas.Next;
                end;
             end;
         end;
      end;
   end;
end;
procedure Bloco_A_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
begin
  //******************************************************************//
  // SPED SAIDAS
  //******************************************************************//
  SqlTabela('empresa' ,'SELECT * FROM EMPRESAS WHERE CODIGO = ' + IntToStr(rempresaserv));
  SqlTabela('mvmestre',
                    ' SELECT * FROM SPED_SAIDAS WHERE          ' +
                    ' EMISSAO BETWEEN                          ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
                    ' AND                                      ' + QuotedStr(DataPonto(DateToStr(datafin)))  +
                    ' AND CODIGOBARRAS IS NOT NULL             ' +
                    ' AND EMPRESA =                            ' + IntToStr(rempresaserv));

  if TMvmestre.RecordCount = 0 then
    begin
      with ACBrSpedPisCofins.Bloco_A do
         begin
           with RegistroA001New do
             begin
               IND_MOV := imSemDados;
             end;
         end;
    end
  else
    begin
      with ACBrSpedPisCofins.Bloco_A do
       begin
          with RegistroA001New do
          begin
            IND_MOV := imComDados;
            with RegistroA010New do
              begin
                CNPJ := TEmpresas.FindField('CNPJ').AsString;
                TMvmestre.First;
                while not TMvmestre.Eof do
                  begin
                    with RegistroA100New do
                      begin
                        IND_OPER      := itoContratado;
                        IND_EMIT      := iedfProprio;
                        COD_PART      := '2';
                        COD_SIT       := sdfRegular;
                        SER           := varIIF(TMvmestre.FindField('CODIGOBARRAS').AsString = '','001',Copy(TMvmestre.FindField('CODIGOBARRAS').AsString,23,3));
                        SUB           := '';
                        NUM_DOC       := TMvmestre.FindField('NUMERO').AsString;
                        CHV_NFSE      := TMvmestre.FindField('CODIGOBARRAS').AsString;
                        DT_DOC        := TMvmestre.FindField('EMISSAO').AsDateTime;
                        DT_EXE_SERV   := TMvmestre.FindField('RECEPCAODESPACHO').AsDateTime;
                        VL_DOC        := MRound(TMvmestre.FindField('VLRTOTAL').AsFloat,2);

                        if (TMvmestre.FindField('CONDICAO').AsString = '00001') then
                          IND_PGTO    := tpVista
                        else
                          IND_PGTO    := tpPrazo;

                        VL_DESC       := TMvmestre.FindField('VLRDESCONTOS').AsFloat;
                        VL_BC_PIS     := 0;
                        VL_PIS        := 0;
                        VL_BC_COFINS  := 0;
                        VL_COFINS     := 0;
                        VL_PIS_RET    := 0;
                        VL_COFINS_RET := 0;
                        VL_ISS        := 0;
                      end;

                    //*****************************************************************************//
                    // BUSCA MOVIMENTO ITENS
                    //*****************************************************************************//
                    SqlTabela('itemmestre',
                                           ' SELECT * FROM MVITENS WHERE EMPRESA = ' + IntToStr (TMvmestre.findfield('EMPRESA').AsInteger) +
                                           ' AND NUMERO                          = ' + IntToStr (TMvmestre.findfield('NUMERO').AsInteger)  +
                                           ' AND SERIE                           = ' + QuotedStr(TMvmestre.findfield('SERIE').AsString)    +
                                           ' AND PESSOA                          = ' + IntToStr (TMvmestre.findfield('PESSOA').AsInteger)  +
                                           ' AND DOCUMENTO                       = ' + IntToStr (TMvmestre.findfield('DOCUMENTO').AsInteger));

                    TItensMestre.First;
                    while not TItensMestre.Eof do
                      begin
                        SqlTabela('produto',
                                           ' select * from produtos p inner join saldos s on (p.codigo = s.produto) ' +
                                           ' where s.empresa                                                    =   ' + IntToStr(rempresaserv)+
                                           ' and   p.codigo                                                     =   ' + IntToStr(TItensMestre.FindField('PRODUTO').AsInteger));

                       with RegistroA170New do
                         begin
                           NUM_ITEM         := StrToInt(StrZeros(TItensMestre.FindField('SEQUENCIA').AsString,3));
                           COD_ITEM         := TItensMestre.FindField('PRODUTO').AsString;
                           DESCR_COMPL      := TItensMestre.FindField('DESCRICAO').AsString;
                           VL_ITEM          := MRound(TItensMestre.FindField('TOTAL').AsFloat,2);;
                           VL_DESC          := TItensMestre.FindField('DESCONTO').AsFloat;
                           NAT_BC_CRED      := bccOutrasOpeComDirCredito;
                           IND_ORIG_CRED    := opcMercadoInterno;
                           CST_PIS          := stpisOutrasOperacoes;
                           VL_BC_PIS        := MRound(TItensMestre.FindField('TOTAL').AsFloat - TItensMestre.FindField('DESCONTO').AsFloat,2);
                           ALIQ_PIS         := 0;
                           VL_PIS           := 0;
                           CST_COFINS       := stcofinsOutrasOperacoes;
                           VL_BC_COFINS     := 0;
                           ALIQ_COFINS      := 0;
                           VL_COFINS        := 0;
                           COD_CTA          := TEmpresas.FindField('EMPPLACONTAS').AsString;;
                           COD_CCUS         := '';
                         end;
                        TItensMestre.Next;
                      end;
                    TMvmestre.Next;
                  end;
              end;
          end;
       end;

    end;

end;
procedure Bloco_9_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
begin
  with ACBrSPEDPisCofins.Bloco_9 do
     begin
      with Registro9001 do
        begin
          IND_MOV := imComDados;
        end;
     end;
end;
procedure Bloco_D_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
begin
  with ACBrSPEDPisCofins.Bloco_D do
    begin
     with RegistroD001New do
       begin
         IND_MOV := imSemDados;
       end;
    end;
end;
procedure Bloco_F_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
begin
   with ACBrSPEDPisCofins.Bloco_F do
     begin
        with RegistroF001New do
        begin
          IND_MOV := imSemDados;
        end;
     end;
end;
procedure Bloco_I_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
begin
  with ACBrSPEDPisCofins.Bloco_I do
   begin
      with RegistroI001New do
      begin
        IND_MOV := imSemDados;
      end;
   end;
end;
procedure Bloco_P_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
begin
   with ACBrSPEDPisCofins.Bloco_P do
     begin
        with RegistroP001New do
        begin
          IND_MOV := imSemDados;
        end;
     end;
end;
procedure Gerar_TXT_Fiscal(Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
begin
  SqlTabela('empresa','select * from empresas where codigo = ' + IntToStr(rempresa));

   with ACBrSPEDPisCofins do
    begin
      DT_INI := dataini;
      DT_FIN := datafin;
    end;

   ACBrSPEDPisCofins.SaveFileTXT;

   try
     dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'ARQUIVO GERADO COM SUCESSO' , 'sucess');
   except
     dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PROBLEMAS AO GERAR ARQUIVO' , 'error');
   end;
end;
procedure Bloco_C_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
var
  M_TOTALPIS, M_TOTALCOFINS : Real;
begin
  SqlTabela('empresa','select * from empresas where codigo = ' + IntToStr(rempresa));
  with ACBrSPEDPisCofins.Bloco_C do
   begin
      with RegistroC001New do
      begin
         IND_MOV := imComDados;
         with RegistroC010New do
         begin
           CNPJ      := TEmpresas.FindField('CNPJ').AsString;
           IND_ESCRI := IndEscriConsolidado;
           //******************************************************************//
           // SPED SAIDAS
           //******************************************************************//
           SqlTabela('mvmestre',
                              ' SELECT * FROM SPED_SAIDAS WHERE          ' +
                              ' EMISSAO BETWEEN                          ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
                              ' AND                                      ' + QuotedStr(DataPonto(DateToStr(datafin)))  +
                              ' AND CODIGOBARRAS IS NOT NULL             ' +
                              ' AND EMPRESA =                            ' + IntToStr(rempresa));
           TMvmestre.First;
           while not TMvmestre.Eof do
             begin
               SqlTabela('pessoa' ,'select * from pessoas where codigo = ' + IntToStr(TMvmestre.FindField('PESSOA').AsInteger));
               SqlTabela('imposto',
                                    ' SELECT * FROM MVITENS WHERE EMPRESA = ' + IntToStr (TMvmestre.findfield('EMPRESA').AsInteger) +
                                    ' AND NUMERO                          = ' + IntToStr (TMvmestre.findfield('NUMERO').AsInteger)  +
                                    ' AND SERIE                           = ' + QuotedStr(TMvmestre.findfield('SERIE').AsString)    +
                                    ' AND PESSOA                          = ' + IntToStr (TMvmestre.findfield('PESSOA').AsInteger)  +
                                    ' AND DOCUMENTO                       = ' + IntToStr (TMvmestre.findfield('DOCUMENTO').AsInteger));

               if Timposto.RecordCount > 0 then
                 begin
                   M_TOTALPIS    := 0;
                   M_TOTALCOFINS := 0;
                   Timposto.First;
                   while not Timposto.Eof do
                     begin
                      if Timposto.FindField('PIS').AsString = '01' then
                        begin
                          M_TOTALPIS    := M_TOTALPIS    + MRound(Timposto.FindField('TOTAL').AsFloat * 0.65 / 100,2);
                          M_TOTALCOFINS := M_TOTALCOFINS + MRound(Timposto.FindField('TOTAL').AsFloat * 3    / 100,2);
                        end;
                       Timposto.Next;
                     end;
                 end;

              with RegistroC100New do
                begin
                  CNPJ          := TEmpresas.Findfield('CNPJ').AsString;

                  if TB_PESSOASSPED.Locate('CONTROLE',TMvmestre.FindField('PESSOA').AsInteger,[]) then
                    COD_PART      := TB_PESSOASSPED.FindField('CODIGO').AsString;

                  IND_EMIT      := edEmissaoPropria;
                  IND_OPER      := tpSaidaPrestacao;
                  COD_MOD       := '55';
                  COD_SIT       := sdRegular;
                  SER           := varIIF(TMvmestre.FindField('CODIGOBARRAS').AsString = '','001',Copy(TMvmestre.FindField('CODIGOBARRAS').AsString,23,3));
                  NUM_DOC       := TMvmestre.FindField('NUMERO').AsString;
                  CHV_NFE       := TMvmestre.FindField('CODIGOBARRAS').AsString;
                  DT_DOC        := TMvmestre.FindField('EMISSAO').AsDateTime;
                  DT_E_S        := TMvmestre.FindField('RECEPCAODESPACHO').AsDateTime;
                  VL_DOC        := MRound(TMvmestre.FindField('VLRTOTAL').AsFloat,2);

                  if (TMvmestre.FindField('CONDICAO').AsString = '00001') then
                    IND_PGTO    := tpVista
                  else
                    IND_PGTO    := tpPrazo;

                  VL_DESC       := TMvmestre.FindField('VLRDESCONTOS').AsFloat;
                  VL_ABAT_NT    := 0;
                  VL_MERC       := TMvmestre.FindField('VLRPRODUTOS').AsFloat;
                  IND_FRT       := tfSemCobrancaFrete;
                  VL_SEG        := 0;
                  VL_OUT_DA     := 0;
                  VL_BC_ICMS    := TMvmestre.FindField('VLRBASEICMS').AsFloat;
                  VL_ICMS       := TMvmestre.FindField('VLRICMS').AsFloat;
                  VL_BC_ICMS_ST := 0;//TMvmestre.FindField('VLRBASESUBSTITUICAO').AsFloat;
                  VL_ICMS_ST    := 0;//TMvmestre.FindField('VLRSUBSTITUICAO').AsFloat;
                  VL_IPI        := TMvmestre.FindField('VLRIPI').AsFloat;
                  VL_PIS        := M_TOTALPIS;
                  VL_COFINS     := M_TOTALCOFINS;
                  VL_PIS_ST     := 0;
                  VL_COFINS_ST  := 0;
                end;
               //*****************************************************************************//
               // BUSCA MOVIMENTO ITENS
               //*****************************************************************************//
               SqlTabela('itemmestre',
                                      ' SELECT * FROM MVITENS WHERE EMPRESA = ' + IntToStr (TMvmestre.findfield('EMPRESA').AsInteger) +
                                      ' AND NUMERO                          = ' + IntToStr (TMvmestre.findfield('NUMERO').AsInteger)  +
                                      ' AND SERIE                           = ' + QuotedStr(TMvmestre.findfield('SERIE').AsString)    +
                                      ' AND PESSOA                          = ' + IntToStr (TMvmestre.findfield('PESSOA').AsInteger)  +
                                      ' AND DOCUMENTO                       = ' + IntToStr (TMvmestre.findfield('DOCUMENTO').AsInteger));

               TItensMestre.First;
               while not TItensMestre.Eof do
                 begin
                   SqlTabela('produto',
                                      ' select * from produtos p inner join saldos s on (p.codigo = s.produto) ' +
                                      ' where s.empresa                                                    =   ' + IntToStr(rempresa)+
                                      ' and   p.codigo                                                     =   ' + IntToStr(TItensMestre.FindField('PRODUTO').AsInteger));

                  with RegistroC170New do
                    begin
                      CNPJ := TEmpresas.Findfield('CNPJ').AsString;

                      NUM_ITEM         := StrZeros(TItensMestre.FindField('SEQUENCIA').AsString,3);
                      COD_ITEM         := TItensMestre.FindField('PRODUTO').AsString;
                      DESCR_COMPL      := TItensMestre.FindField('DESCRICAO').AsString;
                      QTD              := TItensMestre.FindField('QUANTIDADE').AsFloat;
                      UNID             := TItensMestre.findField('UNIDADE').AsString;
                      VL_ITEM          := MRound(TItensMestre.FindField('TOTAL').AsFloat,2);
                      VL_DESC          := TItensMestre.FindField('DESCONTO').AsFloat;
                      IND_MOV          := mfSim;
                      CFOP             := TItensMestre.FindField('OPERACAO').AsString;
                      COD_NAT          := TItensMestre.FindField('OPERACAO').AsString;
                      VL_BC_ICMS       := TItensMestre.FindField('BASEICMS').AsFloat;
                      ALIQ_ICMS        := TItensMestre.FindField('PERCICMS').AsFloat;
                      VL_ICMS          := TItensMestre.FindField('VALORICMS').AsFloat;
                      CST_IPI          := stipiVazio;
                      VL_BC_PIS        := MRound(TItensMestre.FindField('TOTAL').AsFloat - TItensMestre.FindField('DESCONTO').AsFloat,2);
                      ALIQ_PIS_PERC    := variif(TItensMestre.FindField('PIS').AsString = '01',0.65,Null);
                      QUANT_BC_PIS     := Null;
                      ALIQ_PIS_R       := Null;
                      VL_PIS           := variif(TItensMestre.FindField('PIS').AsString = '01',MRound((TItensMestre.FindField('TOTAL').AsFloat - TItensMestre.FindField('DESCONTO').AsFloat) * 0.65 / 100,2),0);;

                      VL_BC_COFINS     := MRound(TItensMestre.FindField('TOTAL').AsFloat - TItensMestre.FindField('DESCONTO').AsFloat,2);
                      ALIQ_COFINS_PERC := variif(TItensMestre.FindField('PIS').AsString = '01',3,Null);
                      QUANT_BC_COFINS  := Null;
                      ALIQ_COFINS_R    := null;
                      VL_COFINS        := variif(TItensMestre.FindField('PIS').AsString = '01',MRound((TItensMestre.FindField('TOTAL').AsFloat - TItensMestre.FindField('DESCONTO').AsFloat) * 3 / 100,2),0);;;
                      COD_CTA          := TEmpresas.FindField('EMPPLACONTAS').AsString;

                      case AnsiIndexStr(variif(TPessoas.FindField('ESTADO').AsString = 'SP', TProdutos.FindField('SITUACAOLOCAL').AsString, TProdutos.FindField('SITUACAOOUTRAS').AsString) ,['000','010','020','030','040','041','050','051','060','070','090']) of
                        0 : CST_ICMS      := sticmsTributadaIntegralmente;
                        1 : CST_ICMS      := sticmsTributadaComCobracaPorST;
                        2 : CST_ICMS      := sticmsComReducao;
                        3 : CST_ICMS      := sticmsIsentaComCobracaPorST;
                        4 : CST_ICMS      := sticmsIsenta;
                        5 : CST_ICMS      := sticmsNaoTributada;
                        6 : CST_ICMS      := sticmsSuspensao;
                        7 : CST_ICMS      := sticmsDiferimento;
                        8 : CST_ICMS      := sticmsCobradoAnteriormentePorST;
                        9 : CST_ICMS      := sticmsComReducaoPorST;
                        10: CST_ICMS      := sticmsOutros;
                      end;

                      if TItensMestre.FindField('PIS').AsString = '' then
                        CST_PIS := stpisAliquotaZero
                      else
                        begin
                          case AnsiIndexStr(TItensMestre.FindField('PIS').AsString,['01','02','03','04','05','06','07','08','09','49','50','51','52','53','54','55','56','60','61','62','63','64','65','66','67','70','71','72','73','74','75','98','99']) of
                            0 : CST_PIS := stpisValorAliquotaNormal;                           //01
                            1 : CST_PIS := stpisValorAliquotaDiferenciada;                     //02
                            2 : CST_PIS := stpisQtdeAliquotaUnidade;                           //03
                            3 : CST_PIS := stpisMonofaticaAliquotaZero;                        //04
                            4 : CST_PIS := stpisValorAliquotaPorST;                            //05
                            5 : CST_PIS := stpisAliquotaZero;                                  //06
                            6 : CST_PIS := stpisIsentaContribuicao;                            //07
                            7 : CST_PIS := stpisSemIncidenciaContribuicao;                     //08
                            8 : CST_PIS := stpisSuspensaoContribuicao;                         //09
                            9 : CST_PIS := stpisOutrasOperacoesSaida;                          //49
                            10: CST_PIS := stpisOperCredExcRecTribMercInt;                     //50
                            11: CST_PIS := stpisOperCredExcRecNaoTribMercInt;                  //51
                            12: CST_PIS := stpisOperCredExcRecExportacao;                      //52
                            13: CST_PIS := stpisOperCredRecTribNaoTribMercInt;                 //53
                            14: CST_PIS := stpisOperCredRecTribMercIntEExportacao;             //54
                            15: CST_PIS := stpisOperCredRecNaoTribMercIntEExportacao;          //55
                            16: CST_PIS := stpisOperCredRecTribENaoTribMercIntEExportacao;     //56
                            17: CST_PIS := stpisCredPresAquiExcRecTribMercInt;                 //60
                            18: CST_PIS := stpisCredPresAquiExcRecNaoTribMercInt;              //61
                            19: CST_PIS := stpisCredPresAquiExcExcRecExportacao;               //62
                            20: CST_PIS := stpisCredPresAquiRecTribNaoTribMercInt;             //63
                            21: CST_PIS := stpisCredPresAquiRecTribMercIntEExportacao;         //64
                            22: CST_PIS := stpisCredPresAquiRecNaoTribMercIntEExportacao;      //65
                            23: CST_PIS := stpisCredPresAquiRecTribENaoTribMercIntEExportacao; //66
                            24: CST_PIS := stpisOutrasOperacoes_CredPresumido;                 //67
                            25: CST_PIS := stpisOperAquiSemDirCredito;                         //70
                            26: CST_PIS := stpisOperAquiComIsensao;                            //71
                            27: CST_PIS := stpisOperAquiComSuspensao;                          //72
                            28: CST_PIS := stpisOperAquiAliquotaZero;                          //73
                            29: CST_PIS := stpisOperAqui_SemIncidenciaContribuicao;            //74
                            30: CST_PIS := stpisOperAquiPorST;                                 //75
                            31: CST_PIS := stpisOutrasOperacoesEntrada;                        //98
                            32: CST_PIS := stpisOutrasOperacoes;                               //99
                          end;
                        end;

                      if TItensMestre.FindField('COFINS').AsString = '' then
                        CST_COFINS := stcofinsAliquotaZero
                      else
                        begin
                          case AnsiIndexStr(TItensMestre.FindField('COFINS').AsString,['01','02','03','04','05','06','07','08','09','49','50','51','52','53','54','55','56','60','61','62','63','64','65','66','67','70','71','72','73','74','75','98','99']) of
                            0 : CST_COFINS := stcofinsValorAliquotaNormal;                          //01
                            1 : CST_COFINS := stcofinsValorAliquotaDiferenciada;                    //02
                            2 : CST_COFINS := stcofinsQtdeAliquotaUnidade;                          //03
                            3 : CST_COFINS := stcofinsMonofaticaAliquotaZero;                       //04
                            4 : CST_COFINS := stcofinsValorAliquotaPorST;                           //05
                            5 : CST_COFINS := stcofinsAliquotaZero;                                 //06
                            6 : CST_COFINS := stcofinsIsentaContribuicao;                           //07
                            7 : CST_COFINS := stcofinsSemIncidenciaContribuicao;                    //08
                            8 : CST_COFINS := stcofinsSuspensaoContribuicao;                        //09
                            9 : CST_COFINS := stcofinsOutrasOperacoesSaida;                         //49
                            10: CST_COFINS := stcofinsOperCredExcRecTribMercInt;                    //50
                            11: CST_COFINS := stcofinsOperCredExcRecNaoTribMercInt;                 //51
                            12: CST_COFINS := stcofinsOperCredExcRecExportacao;                     //52
                            13: CST_COFINS := stcofinsOperCredRecTribNaoTribMercInt;                //53
                            14: CST_COFINS := stcofinsOperCredRecTribMercIntEExportacao;            //54
                            15: CST_COFINS := stcofinsOperCredRecNaoTribMercIntEExportacao;         //55
                            16: CST_COFINS := stcofinsOperCredRecTribENaoTribMercIntEExportacao;    //56
                            17: CST_COFINS := stcofinsCredPresAquiExcRecTribMercInt;                //60
                            18: CST_COFINS := stcofinsCredPresAquiExcRecNaoTribMercInt;             //61
                            19: CST_COFINS := stcofinsCredPresAquiExcExcRecExportacao;              //62
                            20: CST_COFINS := stcofinsCredPresAquiRecTribNaoTribMercInt;            //63
                            21: CST_COFINS := stcofinsCredPresAquiRecTribMercIntEExportacao;        //64
                            22: CST_COFINS := stcofinsCredPresAquiRecNaoTribMercIntEExportacao;     //65
                            23: CST_COFINS := stcofinsCredPresAquiRecTribENaoTribMercIntEExportacao;//66
                            24: CST_COFINS := stcofinsOutrasOperacoes_CredPresumido;                //67
                            25: CST_COFINS := stcofinsOperAquiSemDirCredito;                        //70
                            26: CST_COFINS := stcofinsOperAquiComIsensao;                           //71
                            27: CST_COFINS := stcofinsOperAquiComSuspensao;                         //72
                            28: CST_COFINS := stcofinsOperAquiAliquotaZero;                         //73
                            29: CST_COFINS := stcofinsOperAqui_SemIncidenciaContribuicao;           //74
                            30: CST_COFINS := stcofinsOperAquiPorST;                                //75
                            31: CST_COFINS := stcofinsOutrasOperacoesEntrada;                       //98
                            32: CST_COFINS := stcofinsOutrasOperacoes;                              //99
                          end;
                        end;
                    end; // Fim dos Itens;

                  with RegistroC180New do
                    begin
                      CNPJ := TEmpresas.Findfield('CNPJ').AsString;

                      COD_MOD     := '55';
                      DT_DOC_INI  := dataini;
                      DT_DOC_FIN  := datafin;
                      COD_ITEM    := TProdutos.FindField('PRODUTO').AsString; //Código do item (campo 02 do Registro 0200)
                      COD_NCM     := TProdutos.FindField('NUMERONCM').AsString;
                      EX_IPI      := '';
                      VL_TOT_ITEM := 0;

                      //Registros C181 e C185
                      with RegistroC181New do
                        begin
                          CNPJ           := TEmpresas.Findfield('CNPJ').AsString;
                          CST_PIS        := variif(TItensMestre.FindField('PIS').AsString = '01',stpisValorAliquotaNormal,stpisAliquotaZero);
                          CFOP           := TItensMestre.FindField('OPERACAO').AsString;;
                          VL_ITEM        := MRound(TItensMestre.FindField('TOTAL').AsFloat - TItensMestre.FindField('DESCONTO').AsFloat,2);
                          VL_DESC        := TItensMestre.FindField('DESCONTO').AsFloat;
                          VL_BC_PIS      := MRound(TItensMestre.FindField('TOTAL').AsFloat - TItensMestre.FindField('DESCONTO').AsFloat,2);
                          ALIQ_PIS       := variif(TItensMestre.FindField('PIS').AsString = '01',0.65,Null);
                          QUANT_BC_PIS   := Null;
                          ALIQ_PIS_QUANT := Null;
                          VL_PIS         := variif(TItensMestre.FindField('PIS').AsString = '01',MRound((TItensMestre.FindField('TOTAL').AsFloat - TItensMestre.FindField('DESCONTO').AsFloat)* 0.65 / 100,2),Null);
                          COD_CTA        := TEmpresas.FindField('EMPPLACONTAS').AsString;
                        end;

                      with RegistroC185New do
                        begin
                          CNPJ              := TEmpresas.Findfield('CNPJ').AsString;
                          CST_COFINS        := variif(TItensMestre.FindField('COFINS').AsString = '01',stcofinsValorAliquotaNormal,stcofinsAliquotaZero);
                          CFOP              := TItensMestre.FindField('OPERACAO').AsString;
                          VL_ITEM           := MRound(TItensMestre.FindField('TOTAL').AsFloat - TItensMestre.FindField('DESCONTO').AsFloat,2);
                          VL_DESC           := TItensMestre.FindField('DESCONTO').AsFloat;
                          VL_BC_COFINS      := MRound(TItensMestre.FindField('TOTAL').AsFloat - TItensMestre.FindField('DESCONTO').AsFloat,2);
                          ALIQ_COFINS       := variif(TItensMestre.FindField('COFINS').AsString = '01',3,Null);;
                          QUANT_BC_COFINS   := Null;
                          ALIQ_COFINS_QUANT := Null;
                          VL_COFINS         := variif(TItensMestre.FindField('COFINS').AsString = '01',MRound((TItensMestre.FindField('TOTAL').AsFloat - TItensMestre.FindField('DESCONTO').AsFloat)* 3 / 100,2),Null);;
                          COD_CTA           := TEmpresas.FindField('EMPPLACONTAS').AsString;
                        end;
                    end;
                   TItensMestre.next;
                 end;
               TMvmestre.next;
             end;
         end;
      end;
   end;
end;
procedure Bloco_1_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
begin
   with ACBrSPEDPisCofins.Bloco_1 do
     begin
        with Registro1001New do
        begin
           IND_MOV := imSemDados;
        end;
     end;
end;
procedure Bloco_M_Fiscal  (Const rempresa,rempresaserv:integer;dataini,datafin:TDateTime);
var
  M_CST06, M_CST01, M_COFINS01 :Real;
begin
  with ACBrSPEDPisCofins.Bloco_M do
   begin
      with RegistroM001New do
      begin
        IND_MOV := imComDados;
        with ACBrSPEDPisCofins.Bloco_M do
          begin
            M_CST06    := 0;
            M_CST01    := 0;
            M_COFINS01 := 0;

            //******************************************************************//
            // SPED SAIDAS
            //******************************************************************//
            SqlTabela('mvmestre',
                               ' SELECT * FROM SPED_SAIDAS WHERE          ' +
                               ' EMISSAO BETWEEN                          ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
                               ' AND                                      ' + QuotedStr(DataPonto(DateToStr(datafin)))  +
                               ' AND CODIGOBARRAS IS NOT NULL             ' +
                               ' AND EMPRESA =                            ' + IntToStr(rempresa));
            TMvmestre.First;
            while not TMvmestre.Eof do
              begin
                SqlTabela('itemmestre',
                                      ' SELECT * FROM MVITENS WHERE EMPRESA = ' + IntToStr (TMvmestre.findfield('EMPRESA').AsInteger) +
                                      ' AND NUMERO                          = ' + IntToStr (TMvmestre.findfield('NUMERO').AsInteger)  +
                                      ' AND SERIE                           = ' + QuotedStr(TMvmestre.findfield('SERIE').AsString)    +
                                      ' AND PESSOA                          = ' + IntToStr (TMvmestre.findfield('PESSOA').AsInteger)  +
                                      ' AND DOCUMENTO                       = ' + IntToStr (TMvmestre.findfield('DOCUMENTO').AsInteger));

                if TItensMestre.RecordCount > 0 then
                  begin
                    TItensMestre.First;
                    while not TItensMestre.eof do
                      begin
                        if (TItensMestre.FindField('PIS').AsString = '06') or (TItensMestre.FindField('PIS').AsString = '') then
                          begin
                            M_CST06 := M_CST06 + MRound(TItensMestre.FindField('TOTAL').AsFloat - TItensMestre.FindField('DESCONTO').AsFloat,2);
                          end;

                        if TItensMestre.FindField('PIS').AsString = '01' then
                          begin
                            M_CST01    := M_CST01    + MRound((TItensMestre.FindField('TOTAL').AsFloat - TItensMestre.FindField('DESCONTO').AsFloat) * 0.65 / 100,2);
                            M_COFINS01 := M_COFINS01 + MRound((TItensMestre.FindField('TOTAL').AsFloat - TItensMestre.FindField('DESCONTO').AsFloat),2);
                          end;
                        TItensMestre.Next;
                      end;
                  end;
                TMvmestre.Next;
              end;

            with RegistroM001New do
              begin
                with RegistroM200New do
                  begin
                    VL_TOT_CONT_NC_PER   := 0;
                    VL_TOT_CRED_DESC     := 0;
                    VL_TOT_CRED_DESC_ANT := 0;
                    VL_TOT_CONT_NC_DEV   := 0;
                    VL_RET_NC            := 0;
                    VL_OUT_DED_NC        := 0;
                    VL_CONT_NC_REC       := 0;
                    VL_TOT_CONT_CUM_PER  := M_CST01;
                    VL_RET_CUM           := 0;
                    VL_OUT_DED_CUM       := 0;
                    VL_CONT_CUM_REC      := M_CST01;
                    VL_TOT_CONT_REC      := M_CST01;

                    if M_CST01 > 0 then
                      begin
                        with RegistroM205New do
                          begin
                            NUM_CAMPO := '12';
                            COD_REC   := '810902';
                            VL_DEBITO := M_CST01;
                          end;

                        with RegistroM210New do
                          begin
                            COD_CONT          := ccAcumAliqBasica;
                            VL_REC_BRT        := M_COFINS01;
                            VL_BC_CONT        := M_COFINS01;
                            ALIQ_PIS          := 0.65;
                            QUANT_BC_PIS      := Null;
                            ALIQ_PIS_QUANT    := Null;
                            VL_CONT_APUR      := M_CST01;
                            VL_AJUS_ACRES     := 0;
                            VL_AJUS_REDUC     := 0;
                            VL_CONT_DIFER     := Null;
                            VL_CONT_DIFER_ANT := Null;
                            VL_CONT_PER       := M_CST01;
                          end;
                      end;
                  end;

                //*****************************************************************************//
                // BUSCA MOVIMENTO MESTRE
                //*****************************************************************************//
                SqlTabela('empresa','select * from empresas where ativo = ' + QuotedStr('T') + ' ORDER BY CODIGO');

                TEmpresas.First;
                while not TEmpresas.Eof do
                  begin
                    with RegistroM400New do
                      begin
                        CST_PIS    := cstpis06;
                        VL_TOT_REC := M_CST06;
                        COD_CTA    := TEmpresas.FindField('EMPPLACONTAS').AsString;
                        DESC_COMPL := '';//Acha_Item('PLANOCONTAS',TEmpresas.FindField('EMPPLACONTAS').AsString);

                        with RegistroM410New do
                          begin
                            NAT_REC    := '103';
                            VL_REC     := M_CST06;
                            COD_CTA    := TEmpresas.FindField('EMPPLACONTAS').AsString;
                            DESC_COMPL := '';//Acha_Item('PLANOCONTAS',TEmpresas.FindField('EMPPLACONTAS').AsString);
                          end;
                      end;

                    with RegistroM800New do
                      begin
                        CST_COFINS := cstcofins06;
                        VL_TOT_REC := M_CST06;
                        COD_CTA    := TEmpresas.FindField('EMPPLACONTAS').AsString;
                        DESC_COMPL := '';//Acha_Item('PLANOCONTAS',TEmpresas.FindField('EMPPLACONTAS').AsString);

                        with RegistroM810New do
                          begin
                            NAT_REC    := '103';
                            VL_REC     := M_CST06;
                            COD_CTA    := TEmpresas.FindField('EMPPLACONTAS').AsString;
                            DESC_COMPL := '';//Acha_Item('PLANOCONTAS',TEmpresas.FindField('EMPPLACONTAS').AsString);
                          end
                      end;
                    TEmpresas.Next;
                  end;


                with RegistroM600New do
                  begin
                    VL_TOT_CONT_NC_PER   := 0;
                    VL_TOT_CRED_DESC     := 0;
                    VL_TOT_CRED_DESC_ANT := 0;
                    VL_TOT_CONT_NC_DEV   := 0;
                    VL_RET_NC            := 0;
                    VL_OUT_DED_NC        := 0;
                    VL_CONT_NC_REC       := 0;
                    VL_TOT_CONT_CUM_PER  := MRound(M_COFINS01 * 3/100,2);;
                    VL_RET_CUM           := 0;
                    VL_OUT_DED_CUM       := 0;
                    VL_CONT_CUM_REC      := MRound(M_COFINS01 * 3/100,2);;
                    VL_TOT_CONT_REC      := MRound(M_COFINS01 * 3/100,2);;

                    if M_COFINS01 > 0 then
                      begin
                        with RegistroM605New do
                          begin
                            NUM_CAMPO := '12';
                            COD_REC   := '217201';
                            VL_DEBITO := MRound(M_COFINS01 * 3/100,2);
                          end;

                        with RegistroM610New do
                          begin
                            COD_CONT          := ccAcumAliqBasica;
                            VL_REC_BRT        := M_COFINS01;
                            VL_BC_CONT        := M_COFINS01;
                            ALIQ_COFINS       := 3;
                            QUANT_BC_COFINS   := Null;
                            ALIQ_COFINS_QUANT := Null;
                            VL_CONT_APUR      := MRound(M_COFINS01 * 3/100,2);
                            VL_AJUS_ACRES     := 0;
                            VL_AJUS_REDUC     := 0;
                            VL_CONT_DIFER     := Null;
                            VL_CONT_DIFER_ANT := Null;
                            VL_CONT_PER       := MRound(M_COFINS01 * 3/100,2);
                          end;
                      end
                  end;
              end;
          end;
      end;
   end;
end;
end.
