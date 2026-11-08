unit mkm_spedfiscalefd;

interface
uses mkm_funcoes, mkm_func_web, MainModule,System.SysUtils,ACBrEFDBlocos,ACBrSpedFiscal,Data.DB,
     System.StrUtils, System.Variants, FireDAC.Comp.Client;
var
  ACBrSPEDFiscal       : TACBrSPEDFiscal;
  TMvmestre,TPessoas ,
  TOperacao,Timposto ,
  TProdutos,TEmpresas,
  TGrupos,TItensMestre : TFDQuery;
  TB_BLOCOK_0200,
  TB_MEDIDAS, TB_OPERACAOSPED,
  TB_PESSOASSPED       : TFDMemTable;
  M_NOMEARQUIVO        : string;

function  SqlTabela       (const tabela,msql:string):Boolean;
function  SpedFiscal      (const rempresa:integer;dataini,datafin:TDateTime):string;
procedure Bloco_0_Fiscal  (Const rempresa:integer;dataini,datafin:TDateTime);
procedure Bloco_C_Fiscal  (Const rempresa:integer;dataini,datafin:TDateTime);
procedure Bloco_D_Fiscal  (Const rempresa:integer;dataini,datafin:TDateTime);
procedure Bloco_E_Fiscal  (Const rempresa:integer;dataini,datafin:TDateTime);
procedure Bloco_H_Fiscal  (Const rempresa:integer;dataini,datafin:TDateTime);
procedure Bloco_K_Fiscal  (Const rempresa:integer;dataini,datafin:TDateTime);
procedure Bloco_1_Fiscal  (Const rempresa:integer;dataini,datafin:TDateTime);
procedure Gerar_TXT_Fiscal(Const rempresa:integer;dataini,datafin:TDateTime);

implementation


uses mkm_procedures, untDM_RC, mkm_func_report, ServerModule;
function SqlTabela(const tabela,msql:string):Boolean;
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
procedure Gerar_TXT_Fiscal(Const rempresa:integer;dataini,datafin:TDateTime);
begin
  SqlTabela('empresa','select * from empresas where codigo = ' + IntToStr(rempresa));
   with ACBrSpedFiscal do
    begin
      DT_INI := dataini;
      DT_FIN := datafin;
    end;

   ACBrSpedFiscal.SaveFileTXT;

   try
     dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'ARQUIVO GERADO COM SUCESSO' , 'sucess');
   except
     dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PROBLEMAS AO GERAR ARQUIVO' , 'error');
   end;
end;
procedure Bloco_1_Fiscal(Const rempresa:integer;dataini,datafin:TDateTime);
begin
  with ACBrSpedFiscal.Bloco_1 do
    begin
      SqlTabela('empresa','select * from empresas where codigo = ' + IntToStr(rempresa));
      SqlTabela('mvmestre',
                          'SELECT PESSOAS.codiibge, SUM(MVMESTRE.vlrtotal) AS TOTAL FROM PESSOAS, MVMESTRE ' +
                          'WHERE MVMESTRE.EMISSAO BETWEEN                                              ' + QuotedStr(DataPonto(DateToStr(dataini))) +
                          'AND                                                                         ' + QuotedStr(DataPonto(DateToStr(datafin))) +
                          'AND MVMESTRE.EMPRESA=                                                       ' + IntToStr(rempresa)                       +
                          'AND MVMESTRE.PESSOA = PESSOAS.CODIGO                                        ' +
                          'AND PESSOAS.TIPO    =                                                       ' + QuotedStr('Produtor Rural')     +
                          'GROUP BY 1                                                                  ');

      if StrContains('08606807000184',TEmpresas.FindField('CNPJ').AsString) and (TMvmestre.RecordCount > 0) then
        begin
          with Registro1001New do
            begin
              IND_MOV := imComDados;
              with Registro1010New do
                begin
                  IND_EXP   := 'N';
                  IND_CCRF  := 'N';
                  IND_COMB  := 'N';
                  IND_USINA := 'N';
                  IND_VA    := 'S';
                  IND_EE    := 'N';
                  IND_CART  := 'N';
                  IND_FORM  := 'N';
                  IND_AER   := 'N';
                  IND_GIAF1 := 'N';
                  IND_GIAF3 := 'N';
                  IND_GIAF4 := 'N';
                  IND_REST_RESSARC_COMPL_ICMS := 'N';
                end;
            end;

          TMvmestre.First;
          while not TMvmestre.Eof do
            begin
              with Registro1400New do
                begin
                  COD_ITEM := 'SPDIPAM11';
                  MUN      := TMvmestre.FindField('IBGE').AsString;
                  VALOR    := TMvmestre.FindField('TOTAL').AsFloat;
                end;
              TMvmestre.Next;
            end;
        end
      else
        begin
          with Registro1001New do
            begin
              IND_MOV := imComDados;
              with Registro1010New do
                begin
                  IND_EXP   := 'N';
                  IND_CCRF  := 'N';
                  IND_COMB  := 'N';
                  IND_USINA := 'N';
                  IND_VA    := 'N';
                  IND_EE    := 'N';
                  IND_CART  := 'N';
                  IND_FORM  := 'N';
                  IND_AER   := 'N';
                  IND_GIAF1 := 'N';
                  IND_GIAF3 := 'N';
                  IND_GIAF4 := 'N';
                  IND_REST_RESSARC_COMPL_ICMS := 'N';
                end;
            end;
        end;
    end;
  ACBrSpedFiscal.WriteBloco_1;
end;
procedure Bloco_K_Fiscal(Const rempresa:integer;dataini,datafin:TDateTime);
begin
 with ACBrSpedFiscal.Bloco_K do
    begin
      with RegistroK001New do
        begin
          IND_MOV := imComDados;
        end;

      with RegistroK100New do
        begin
          DT_INI := dataini;
          DT_FIN := datafin;
        end;

      TB_BLOCOK_0200.First;
      while not TB_BLOCOK_0200.Eof do
        begin
          if (TB_BLOCOK_0200.Findfield('QUANTIDADE').AsFloat > 0) then
            begin
              with RegistroK200New do
                begin
                  DT_EST   := datafin;
                  COD_ITEM := TB_BLOCOK_0200.Findfield('PRODUTO').AsString;
                  QTD      := TB_BLOCOK_0200.Findfield('QUANTIDADE').AsFloat;
                  IND_EST  := estPropInformantePoder;
                  COD_PART := '';
                end;
            end;
          TB_BLOCOK_0200.Next;
        end;
    end;
  ACBrSpedFiscal.WriteBloco_K;
end;
procedure Bloco_E_Fiscal(Const rempresa:integer;dataini,datafin:TDateTime);
var
  M_TOTNFS,M_TOTNFE, M_SALDONF: Real;
  M_DATA : string;
begin
   with ACBrSpedFiscal.Bloco_E do
   begin
      // Abertura do Bloco E
      with RegistroE001New do
      begin
        IND_MOV := imComDados;

        with RegistroE100New do
          begin
            DT_INI := dataini;
            DT_FIN := datafin;
          end;

        M_TOTNFS := 0;
        M_TOTNFE := 0;
        M_SALDONF:= 0;
        //**********************************//
        // SOMA OS TOTAIS DA NOTA DE SAIDA
        //**********************************//
        SqlTabela('mvmestre',
                      ' SELECT SUM(VLRICMS) AS TOTAL FROM SPED_SAIDAS          ' +
                      ' WHERE EMISSAO BETWEEN                                  ' + QuotedStr(DataPonto(DateToStr(dataini))) +
                      ' AND                                                    ' + QuotedStr(DataPonto(DateToStr(datafin))) +
                      ' AND CANCELADA =                                        ' + QuotedStr('A') +
                      ' AND EMPRESA                       =                    ' + IntToStr(rempresa));
            M_TOTNFS := TMvmestre.FindField('TOTAL').AsFloat;

        //**********************************//
        // SOMA OS TOTAIS DA NOTA DE ENTRADA
        //**********************************//
        SqlTabela('mvmestre',
                        'SELECT * FROM MVITENS I, MVMESTRE M, OPERACOES O            ' +
                        ' WHERE I.EMISSAO BETWEEN                                    ' + QuotedStr(DataPonto(DateToStr(dataini))) +
                        ' AND                                                        ' + QuotedStr(DataPonto(DateToStr(datafin))) +
                        ' AND M.NUMERO          = I.NUMERO                           ' +
                        ' AND M.DOCUMENTO       = I.DOCUMENTO                        ' +
                        ' AND O.CODIGO          = I.OPERACAO                         ' +
                        ' AND O.GERA_SPED       = 1                                  ' +
                        ' AND O.ENTRADA_SAIDA   = 0                                  ' +
                        ' AND I.EMPRESA                       =                      ' + IntToStr(rempresa));


        TMvmestre.First;
        while not TMvmestre.Eof do
          begin
            if TMvmestre.FindField('VLRICMS').AsFloat > 0 then
              M_TOTNFE := M_TOTNFE + TMvmestre.FindField('VALORICMS').AsFloat;

            TMvmestre.Next;
          end;

        M_SALDONF:= Abs(M_TOTNFE-M_TOTNFS);

        with RegistroE116New do
          begin
            COD_OR     := '000';
            VL_OR      := Abs(M_TOTNFE-M_TOTNFS);
            DT_VCTO    := datafin;
            COD_REC    := '046-2';
            NUM_PROC   := '';
            IND_PROC   := opNenhum;
            PROC       := '';
            TXT_COMPL  := '';
            M_DATA     := Copy(DateToStr(dataini),4,2)+Copy(DateToStr(datafin),7,4);
            MES_REF    := M_DATA;
          end;
   //       1    2    3     4      5       6    7    8        9   10    11   12    13     14   15
   //    |E110|0,00|0,00|810,62|30,00|1181,00|0,00|205,00|100,00|0,00|0,00|100,00|0,00|745,38|0,00|
        with RegistroE110New do                           //1
          begin
            VL_TOT_DEBITOS                 := M_TOTNFS;   //2
            VL_AJ_DEBITOS                  := 0;          //3
            VL_TOT_AJ_DEBITOS              := 0;          //4
            VL_ESTORNOS_CRED               := 0;          //5
            VL_TOT_CREDITOS                := M_TOTNFE;   //6
            VL_AJ_CREDITOS                 := 0;          //7
            VL_TOT_AJ_CREDITOS             := 0;          //8
            VL_ESTORNOS_DEB                := 0;          //9
            VL_SLD_CREDOR_ANT              := 0;          //10
            VL_TOT_DED                     := 0;          //11
            DEB_ESP                        := 0;          //12
            VL_SLD_APURADO                 := M_SALDONF;  //13

            if M_SALDONF > 0 then
              begin
                VL_ICMS_RECOLHER           := M_SALDONF; //14
                VL_SLD_CREDOR_TRANSPORTAR  := 0; //15
              end
            else
              begin
                VL_ICMS_RECOLHER           := 0;
                VL_SLD_CREDOR_TRANSPORTAR  := M_SALDONF;
              end;
          end;
      end;
   end;
  ACBrSpedFiscal.WriteBloco_E;
end;
procedure Bloco_D_Fiscal(Const rempresa:integer;dataini,datafin:TDateTime);
var
  M_MESTRE    : Integer;
  M_ITENS     : Integer;
begin
   with ACBrSpedFiscal.Bloco_D do
     begin
       if not SqlTabela('mvmestre',
                        ' SELECT * FROM SPED_TRANSPORTES WHERE    ' +
                        ' EMISSAO BETWEEN                          ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
                        ' AND                                      ' + QuotedStr(DataPonto(DateToStr(datafin)))  +
                        ' AND EMPRESA =                            ' + IntToStr(rempresa)) then
         begin
           with RegistroD001New do
             begin
               IND_MOV := imSemDados;
             end;
         end
       else
         begin
          with RegistroD001New do
            begin
              SqlTabela('mvmestre',
                                 ' SELECT * FROM SPED_TRANSPORTES WHERE     ' +
                                 ' EMISSAO BETWEEN                          ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
                                 ' AND                                      ' + QuotedStr(DataPonto(DateToStr(datafin)))  +
                                 ' AND EMPRESA =                            ' + IntToStr(rempresa));
              IND_MOV := imComDados;

              if TMvmestre.RecordCount > 0 then
                begin

                   SqlTabela('pessoa' ,'SELECT * FROM PESSOAS  WHERE CODIGO = ' + IntToStr(TMvmestre.FindField('PESSOA').AsInteger));
                   SqlTabela('empresa','SELECT * FROM EMPRESAS WHERE CODIGO = ' + IntToStr(rempresa));

                   TMvmestre.First;
                   M_MESTRE := TMvmestre.RecordCount;
                   while not TMvmestre.Eof do
                    begin
                      with RegistroD100New do
                         begin
                          IND_OPER      := variif(rempresa = 1,tpEntradaAquisicao,tpSaidaPrestacao) ;
                          IND_EMIT      := variif(rempresa = 1,edTerceiros,edEmissaoPropria);

                          if TB_PESSOASSPED.Locate('CONTROLE',TMvmestre.FindField('PESSOA').AsInteger,[]) then
                            COD_PART      := TB_PESSOASSPED.FindField('CODIGO').AsString;

                          if StrEmpty(TMvmestre.FindField('CODIGOBARRAS').AsString) then
                            COD_MOD     := '08'
                          else
                            COD_MOD     := '57';

                          COD_SIT       :=  sdRegular;
                          if TMvmestre.FindField('SERIE').AsString = 'U' then
                            SER         := TMvmestre.FindField('SERIE').AsString
                          else
                            SER         := variif(TMvmestre.FindField('CODIGOBARRAS').AsString = '','001',Copy(TMvmestre.FindField('CODIGOBARRAS').AsString,23,3));;

                          SUB           := '';
                          NUM_DOC       := TMvmestre.FindField('NUMERO').AsString;
                          CHV_CTE       := StrAllTrim(TMvmestre.FindField('CODIGOBARRAS').AsString);
                          DT_DOC        := StrToDate(TMvmestre.FindField('EMISSAO').AsString);
                          DT_A_P        := StrToDate(TMvmestre.FindField('EMISSAO').AsString);
                          TP_CT_e       := variif(rempresa = 1,'',0);
                          CHV_CTE_REF   := '';
                          VL_DOC        := TMvmestre.FindField('VLRTOTAL').AsFloat;
                          VL_DESC       := Abs(TMvmestre.FindField('VLRDESCONTOS').AsFloat);
                          IND_FRT       := tfPorContaDestinatario;
                          VL_SERV       := 0;
                          VL_BC_ICMS    := TMvmestre.FindField('VLRBASEICMS').AsFloat;
                          VL_ICMS       := TMvmestre.FindField('VLRICMS').AsFloat;
                          VL_NT         := 0;
                          COD_INF       := '';
                          COD_CTA       := TEmpresas.FindField('EMPPLACONTAS').AsString;
                          COD_MUN_ORIG  := TEmpresas.FindField('IBGE').AsString;
                          COD_MUN_DEST  := variif(TPessoas.FindField('IBGE').AsString = '',TEmpresas.FindField('IBGE').AsString,TEmpresas.FindField('IBGE').AsString);
                        end;

                      SqlTabela('itemmestre',
                                            'SELECT * FROM MVITENS                         ' +
                                            ' WHERE EMPRESA =                              ' + IntToStr(rempresa) +
                                            ' AND NUMERO    =                              ' + QuotedStr(TMvmestre.FindField('NUMERO').AsString)   +
                                            ' AND SERIE     =                              ' + QuotedStr(TMvmestre.FindField('SERIE').AsString)    +
                                            ' AND OPERACAO  =                              ' + QuotedStr(TMvmestre.FindField('OPERACAO').AsString) +
                                            ' AND PESSOA    =                              ' + QuotedStr(TMvmestre.FindField('PESSOA').AsString));


                      M_ITENS := TItensMestre.RecordCount;
                      TItensMestre.First;
                      while not TItensMestre.Eof do
                        begin
                          with RegistroD190New do
                            begin
                              SqlTabela('pessoa' ,'SELECT * FROM PESSOAS  WHERE CODIGO = ' + IntToStr(TItensMestre.FindField('PESSOA').AsInteger));

                              if TPessoas.FindField('ESTADO').AsString = TEmpresas.FindField('ESTADO').AsString then
                                begin
                                  CST_ICMS      := TItensMestre.FindField('CST').AsString;
                                  CFOP          := copy(TItensMestre.FindField('OPERACAO').AsString,1,4);
                                  ALIQ_ICMS     := TItensMestre.Findfield('PERCICMS').AsFloat;
                                  VL_OPR        := TItensMestre.Findfield('TOTAL').AsFloat;
                                  VL_BC_ICMS    := TItensMestre.Findfield('BASEICMS').AsFloat;
                                  VL_ICMS       := TItensMestre.Findfield('VALORICMS').AsFloat;
                                  VL_RED_BC     := 0;
                                  COD_OBS       := '';
                                end
                              else
                                begin
                                  CST_ICMS      := TItensMestre.FindField('CST').AsString;
                                  CFOP          := copy(TItensMestre.FindField('OPERACAO').AsString,1,4);
                                  ALIQ_ICMS     := TItensMestre.Findfield('PERCICMS').AsFloat;
                                  VL_OPR        := TItensMestre.Findfield('TOTAL').AsFloat;
                                  VL_BC_ICMS    := TItensMestre.Findfield('BASEICMS').AsFloat;
                                  VL_ICMS       := TItensMestre.Findfield('VALORICMS').AsFloat;
                                  VL_RED_BC     := 0;
                                  COD_OBS       := '';
                                end;
                            end;
                          TItensMestre.Next;
                        end;
                      TMvmestre.Next;
                    end;
                end;
            end;
         end;
     end;
  ACBrSpedFiscal.WriteBloco_D;
end;
procedure Bloco_H_Fiscal(Const rempresa:integer;dataini,datafin:TDateTime);
var
  M_VLRTOTA: Real;
begin
  with ACBrSpedFiscal.Bloco_H do
   begin
     with RegistroH001New do
       begin
         IND_MOV := imComDados;
         with RegistroH005New do
           begin
             M_VLRTOTA := 0;
             DT_INV    := datafin;

             TB_BLOCOK_0200.First;
             while not TB_BLOCOK_0200.Eof do
               begin
                 with RegistroH010New do
                   begin
                     COD_ITEM   := TB_BLOCOK_0200.FindField('PRODUTO').AsString;
                     UNID       := TB_BLOCOK_0200.FindField('UNIDADE').AsString;
                     QTD        := TB_BLOCOK_0200.FindField('QUANTIDADE').AsFloat;
                     VL_UNIT    := TB_BLOCOK_0200.FindField('CUSTO').AsFloat;
                     VL_ITEM    := TB_BLOCOK_0200.FindField('QUANTIDADE').AsFloat * TB_BLOCOK_0200.FindField('CUSTO').AsFloat;
                     IND_PROP   := piInformante;
                     VL_ITEM_IR := TB_BLOCOK_0200.FindField('CUSTO').AsFloat;
                     COD_CTA    := '1.1.5.01.005';
                   end;
                 M_VLRTOTA:= M_VLRTOTA + (TB_BLOCOK_0200.FindField('QUANTIDADE').AsFloat * TB_BLOCOK_0200.FindField('CUSTO').AsFloat);
                 TB_BLOCOK_0200.Next;
               end;
             VL_INV := M_VLRTOTA;
           end;
       end;
   end;
  ACBrSpedFiscal.WriteBloco_H;
end;

procedure Bloco_0_Fiscal(Const rempresa:integer;dataini,datafin:TDateTime);
begin
  SqlTabela('empresa','select * from empresas where codigo = ' + IntToStr(rempresa));

  M_NOMEARQUIVO          := 'SPED_'+ TEmpresas.FindField('FANTASIA').AsString +'_' + RemoverEspeciais(DateToStr(datafin)) + '_' + RemoverEspeciais(TimeToStr(Time)) +  '.txt';
  ACBrSpedFiscal.Path    := sm.LocalCachePath;
  ACBrSpedFiscal.Arquivo := M_NOMEARQUIVO;


  with ACBrSpedFiscal do
    begin
      DT_INI := dataini;
      DT_FIN := datafin;
      IniciaGeracao;
    end;

  with ACBrSpedFiscal.Bloco_0 do
   begin
     with Registro0000New do
       begin
         COD_VER    := vlVersao115;
         COD_FIN    := raOriginal;
         NOME       := StrAllTrim(TEmpresas.FindField('NOME').AsString);
         CNPJ       := TEmpresas.FindField('CNPJ').AsString;
         CPF        := '';
         UF         := TEmpresas.FindField('ESTADO').AsString;
         IE         := RemoverEspeciais(TEmpresas.FindField('INSCRICAO').AsString);
         COD_MUN    := valor(TEmpresas.FindField('IBGE').AsString);
         IM         := '';
         SUFRAMA    := '';
         IND_PERFIL := pfPerfilA;
         IND_ATIV   := atOutros;
       end;

     with Registro0001New do
       begin
         IND_MOV := imComDados;
         with Registro0005New do
           begin
             FANTASIA   := TEmpresas.FindField('FANTASIA').AsString;
             CEP        := TEmpresas.FindField('CEP').AsString;
             ENDERECO   := StrAllTrim(TEmpresas.FindField('ENDERECO').AsString);
             NUM        := TEmpresas.FindField('NUMERO').AsString;
             COMPL      := '';
             BAIRRO     := StrAllTrim(TEmpresas.FindField('BAIRRO').AsString);
             FONE       := RemoverEspeciais(TEmpresas.FindField('TELEFONE').AsString);
             FAX        := '';
             EMAIL      := StrAllTrim(TEmpresas.FindField('EMAIL').AsString);
           end;

         //*****************************************************************************//
         //DADOS DO CONTADOR
         //*****************************************************************************//
          with Registro0100New do
            begin
              NOME       := 'VALDIR GUARIENTO';
              CPF        := '78021812834'; // Deve ser uma informação valida
              CRC        := '1SP097577/O-1';
              CNPJ       := '02150992000169';
              CEP        := '19015240 ';
              ENDERECO   := 'PRACA ATALIBA LEONEL';
              NUM        := '254';
              COMPL      := '';
              BAIRRO     := 'CENTRO';
              FONE       := '1832631093';
              FAX        := '1832631093';
              EMAIL      := 'band@commtat.com.br';
              COD_MUN    := 3547700;
            end;

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
         //BUSCA UNIDADES
         //****************************************************************************//
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
       end;
   end;
end;
procedure Bloco_C_Fiscal(Const rempresa:integer;dataini,datafin:TDateTime);
var
  M_MESTRE      : Integer;
  M_ITENS,I     : Integer;
begin
  with ACBrSpedFiscal.Bloco_C do
    begin
      SqlTabela('empresa',
                'select * from empresas where codigo = ' + IntToStr(rempresa));

      with RegistroC001New do
        begin
          IND_MOV := imComDados;
          //******************************************************************//
          // SPED ENTRADAS
          //******************************************************************//
          SqlTabela('mvmestre',
                    ' SELECT * FROM SPED_ENTRADAS WHERE        ' +
                    ' EMISSAO BETWEEN                          ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
                    ' AND                                      ' + QuotedStr(DataPonto(DateToStr(datafin)))  +
                    ' AND EMPRESA =                            ' + IntToStr(rempresa));

          TMvmestre.First;
          while not TMvmestre.Eof do
            begin
              SqlTabela('pessoa'  ,'select * from pessoas   where codigo = ' + IntToStr(TMvmestre.FindField('PESSOA').AsInteger));
              SqlTabela('operacao','select * from operacoes where codigo = ' + IntToStr(TMvmestre.FindField('OPERACAO').AsInteger));

              with RegistroC100New do
                begin
                  if TB_PESSOASSPED.Locate('CONTROLE',TMvmestre.FindField('PESSOA').AsInteger,[]) then
                    COD_PART      := TB_PESSOASSPED.FindField('CODIGO').AsString;

                  IND_EMIT      := varIIF(TOperacao.FindField('ENTRADA_SAIDA').AsInteger = 0,edTerceiros,edEmissaoPropria);
                  IND_OPER      := varIIF(TOperacao.FindField('ENTRADA_SAIDA').AsInteger = 0,tpEntradaAquisicao,tpSaidaPrestacao);

                  if not StrEmpty(StrAllTrim(TMvmestre.FindField('CODIGOBARRAS').AsString)) then
                    begin
                      if SituacaoFicalChave(TMvmestre.FindField('CODIGOBARRAS').AsString) = '08' then
                        begin
                          COD_MOD  :=  '55';
                          COD_SIT  := sdRegimeEspecNEsp;
                        end
                      else
                        begin
                          COD_MOD  := '55';
                          COD_SIT  := sdRegular;
                        end;
                    end
                  else
                    begin
                      if TMvmestre.FindField('CODIGOBARRAS').AsString <> '' then
                        if (ValidarChaveNFe(TMvmestre.FindField('CODIGOBARRAS').AsString)) = false then
                          COD_MOD       := '01';
                          COD_SIT       := sdRegular;
                    end;


                  SER           := variif(TMvmestre.FindField('CODIGOBARRAS').AsString = '','001',Copy(TMvmestre.FindField('CODIGOBARRAS').AsString,23,3));
                  NUM_DOC       := TMvmestre.FindField('NUMERO').AsString;
                  CHV_NFE       := StrAllTrim(TMvmestre.FindField('CODIGOBARRAS').AsString);
                  DT_DOC        := StrToDate(TMvmestre.FindField('EMISSAO').AsString);
                  DT_E_S        := StrToDate(TMvmestre.FindField('EMISSAO').AsString);
                  VL_DOC        := TMvmestre.FindField('VLRTOTAL').AsFloat;

                  if (TMvmestre.FindField('CONDICAO').AsString = '1') then
                    IND_PGTO      := tpVista
                  else
                    IND_PGTO      := tpPrazo;

                   VL_DESC       := Abs(TMvmestre.FindField('VLRDESCONTOS').AsFloat);
                  VL_ABAT_NT    := 0;
                  VL_MERC       := TMvmestre.FindField('VLRPRODUTOS').AsFloat;

                  if TMvmestre.FindField('VLRDSPTRIBUTADA').AsFloat > 0 then
                    begin
                      if TMvmestre.FindField('TRAFRETE').AsInteger = 1 then
                        IND_FRT       := tfPorContaEmitente;

                       if TMvmestre.FindField('TRAFRETE').AsInteger = 2 then
                        IND_FRT       := tfPorContaDestinatario;
                    end
                  else
                    IND_FRT     := tfSemCobrancaFrete;

                  VL_FRT        := variif(TMvmestre.FindField('VLRDSPTRIBUTADA').AsFloat > 0,TMvmestre.FindField('VLRDSPTRIBUTADA').AsFloat,0);
                  VL_SEG        := 0;
                  VL_OUT_DA     := 0;
                  VL_BC_ICMS    := TMvmestre.FindField('VLRBASEICMS').AsFloat;
                  VL_ICMS       := TMvmestre.FindField('VLRICMS').AsFloat;
                  VL_BC_ICMS_ST := 0;
                  VL_ICMS_ST    := 0;
                  VL_IPI        := TMvmestre.FindField('VLRIPI').AsFloat;
                  VL_PIS        := 0;
                  VL_COFINS     := 0;
                  VL_PIS_ST     := 0;
                  VL_COFINS_ST  := 0;

                  //********************************************************//
                  // MOVIMENTO ITENS
                  //********************************************************//
                  SqlTabela('itemmestre' ,
                                    'SELECT * FROM MVITENS                        ' +
                                    ' WHERE EMPRESA =                             ' + IntToStr(rempresa) +
                                    ' AND NUMERO    =                             ' + QuotedStr(TMvmestre.FindField('NUMERO').AsString)   +
                                    ' AND SERIE     =                             ' + QuotedStr(TMvmestre.FindField('SERIE').AsString)    +
                                    ' AND DOCUMENTO =                             ' + IntToStr(TMvmestre.FindField('DOCUMENTO').AsInteger)    +
                                    ' AND PESSOA    =                             ' + QuotedStr(TMvmestre.FindField('PESSOA').AsString));

                  TItensMestre.Open;
                  M_ITENS := TItensMestre.RecordCount;
                  TItensMestre.First;
                  while not TItensMestre.Eof do
                    begin
                      with RegistroC170New do   //Inicio Adicionar os Itens:  AQUI
                         begin
                           SqlTabela('produto','select * from produtos where codigo = ' + QuotedStr(TItensMestre.FindField('PRODUTO').AsString));
                           NUM_ITEM      := TItensMestre.FindField('SEQUENCIA').AsString;
                           COD_ITEM      := TItensMestre.FindField('PRODUTO').AsString;
                           DESCR_COMPL   := StrAllTrim(TItensMestre.FindField('DESCRICAO').AsString);
                           QTD           := TItensMestre.FindField('QUANTIDADE').AsFloat;
                           UNID          := TProdutos.FindField('UNIDADE').AsString; //Acha_Item_Unidade(TItensMestre.FindField('UNIDADE').AsString);//IIF(TItensMestre.FindField('UNIDADE').AsString = '','KG',TItensMestre.FindField('UNIDADE').AsString);
                           VL_ITEM       := TItensMestre.FindField('TOTAL').AsFloat;
                           VL_DESC       := Abs(TItensMestre.FindField('DESCONTO').AsFloat);
                           IND_MOV       := mfNao;
                           CST_ICMS      := TItensMestre.FindField('CST').AsString;
                           CFOP          := copy(TItensMestre.FindField('OPERACAO').AsString,1,4);
                           COD_NAT       := copy(TItensMestre.FindField('OPERACAO').AsString,1,4);
                           ALIQ_ICMS     := TItensMestre.FindField('PERCICMS').AsFloat;
                           VL_BC_ICMS    := variif(TMvmestre.FindField('VLRBASEICMS').AsFloat > 0,TItensMestre.FindField('BASEICMS').AsFloat,0);
                           VL_ICMS       := variif(TMvmestre.FindField('VLRICMS').AsFloat     > 0,Abs(TItensMestre.FindField('VALORICMS').AsFloat),0);
                           VL_BC_ICMS_ST := 0;
                           VL_ICMS_ST    := 0;
                           ALIQ_ST       := 0;
                           COD_ENQ       := '';
                           VL_BC_IPI     := TItensMestre.FindField('TOTAL').AsFloat;
                           ALIQ_IPI      := TItensMestre.FindField('PERCIPI').AsFloat;
                           VL_IPI        := variif(TMvmestre.FindField('VLRIPI').AsFloat > 0,TItensMestre.FindField('VALORIPI').AsFloat,0);
                        end; //Fim dos Itens;
                      TItensMestre .Next;
                    end;

                  SqlTabela('imposto' ,
                                  ' SELECT  operacao, cst, percicms, SUM(total) + SUM(despesas) - SUM(desconto) AS TOTAL,              ' +
                                  ' SUM(baseicms)AS BASEICMS, SUM(valoricms) AS VALORICMS, SUM(VALORIPI) as VALORIPI FROM sped_ENTRADAS_itens      ' +
                                  ' WHERE numero  =             ' + QuotedStr(TMvmestre.FindField('NUMERO').AsString)     +
                                  ' AND SERIE     =             ' + QuotedStr(TMvmestre.FindField('SERIE').AsString)      +
                                  ' AND DOCUMENTO =             ' + QuotedStr(TMvmestre.FindField('DOCUMENTO').AsString)  +
                                  ' AND PESSOA   =              ' + QuotedStr(TMvmestre.FindField('PESSOA').AsString)     +
                                  ' group by 1,2,3              ');

                  M_ITENS := Timposto.RecordCount;
                  Timposto.First;
                  while not Timposto.Eof do
                    begin
                    if StrContains('020#070',Timposto.FindField('CST').AsString) then
                      begin
                        with RegistroC190New do
                          begin
                            CST_ICMS        := Timposto.FindField('CST').AsString;
                            CFOP            := copy(Timposto.FindField('OPERACAO').AsString,1,4);
                            ALIQ_ICMS       := Timposto.FindField('PERCICMS').AsFloat;
                            VL_BC_ICMS      := variif(TMvmestre.FindField('VLRBASEICMS').AsFloat > 0,Timposto.FindField('BASEICMS').AsFloat,0);
                            VL_ICMS         := variif(TMvmestre.FindField('VLRICMS').AsFloat     > 0,Abs(Timposto.FindField('VALORICMS').AsFloat),0);
                            VL_BC_ICMS_ST   := 0;
                            VL_ICMS_ST      := 0;
                            VL_RED_BC       := Timposto.Findfield('TOTAL').AsFloat;
                            VL_IPI          := variif(TMvmestre.FindField('VLRIPI').AsFloat > 0,Abs(Timposto.FindField('VALORIPI').AsFloat),0);
                            COD_OBS         := '';
                            VL_OPR          := Timposto.Findfield('TOTAL').AsFloat;
                          end;
                      end
                    else
                      if StrContains('000',Timposto.FindField('CST').AsString) then
                        begin
                          with RegistroC190New do
                            begin
                              CST_ICMS        := Timposto.FindField('CST').AsString;
                              CFOP            := copy(TMvmestre.FindField('OPERACAO').AsString,1,4);
                              ALIQ_ICMS       := Timposto.FindField('PERCICMS').AsFloat;
                              VL_BC_ICMS      := variif(TMvmestre.FindField('VLRBASEICMS').AsFloat > 0,Timposto.FindField('BASEICMS').AsFloat,0);
                              VL_ICMS         := variif(TMvmestre.FindField('VLRICMS').AsFloat     > 0,Abs(Timposto.FindField('VALORICMS').AsFloat),0);
                              VL_BC_ICMS_ST   := 0;
                              VL_ICMS_ST      := 0;
                              VL_RED_BC       := 0;
                              VL_IPI          := variif(TMvmestre.FindField('VLRIPI').AsFloat > 0,Abs(Timposto.FindField('VALORIPI').AsFloat),0);
                              COD_OBS         := '';
                              VL_OPR          := Timposto.Findfield('TOTAL').AsFloat;
                            end;
                        end
                      else
                        begin
                          with RegistroC190New do
                            begin
                              CST_ICMS        := Timposto.FindField('CST').AsString;
                              CFOP            := copy(TMvmestre.FindField('OPERACAO').AsString,1,4);
                              ALIQ_ICMS       := Timposto.FindField('PERCICMS').AsFloat;
                              VL_BC_ICMS      := variif(TMvmestre.FindField('VLRBASEICMS').AsFloat > 0,Timposto.FindField('BASEICMS').AsFloat,0);
                              VL_ICMS         := variif(TMvmestre.FindField('VLRICMS').AsFloat     > 0,Abs(Timposto.FindField('VALORICMS').AsFloat),0);
                              VL_BC_ICMS_ST   := 0;
                              VL_ICMS_ST      := 0;
                              VL_RED_BC       := 0;
                              VL_IPI          := variif(TMvmestre.FindField('VLRIPI').AsFloat > 0,Abs(Timposto.FindField('VALORIPI').AsFloat),0);
                              COD_OBS         := '';
                              VL_OPR          := Timposto.Findfield('TOTAL').AsFloat;
                            end;
                        end;
                     Timposto.Next;
                   end;
                end;
              TMvmestre.Next;
            end;

          //******************************************************************//
          // SPED SAIDAS
          //******************************************************************//
          SqlTabela('mvmestre',
                             ' SELECT * FROM SPED_SAIDAS WHERE          ' +
                             ' EMISSAO BETWEEN                          ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
                             ' AND                                      ' + QuotedStr(DataPonto(DateToStr(datafin)))  +
                             ' AND CODIGOBARRAS IS NOT NULL             ' +
                             ' AND EMPRESA =                            ' + IntToStr(rempresa));

          TMvmestre.Open;
          M_MESTRE := TMvmestre.RecordCount;
          TMvmestre.First;
          while not TMvmestre.Eof do
            begin
              with RegistroC100New do
                begin
                  if TMvmestre.FindField('CANCELADA').AsString = 'C'  then
                    begin
                      NUM_DOC       := TMvmestre.FindField('NUMERO').AsString;
                      IND_EMIT      := edEmissaoPropria;
                      IND_OPER      := tpSaidaPrestacao;
                      COD_MOD       := '55';
                      COD_SIT       := sdCancelado;
                      CHV_NFE       := TMvmestre.FindField('CODIGOBARRAS').AsString;
                      IND_PGTO      := tpNenhum;
                      IND_FRT       := tfNenhum;
                    end
                  else
                    if TMvmestre.FindField('CODIGOBARRASCOMPLEMENTO').AsString <> '' then
                      begin
                        if TB_PESSOASSPED.Locate('CONTROLE',TMvmestre.FindField('PESSOA').AsInteger,[]) then
                          COD_PART      := TB_PESSOASSPED.FindField('CODIGO').AsString;

                        IND_EMIT      := edEmissaoPropria;
                        IND_OPER      := tpSaidaPrestacao;
                        if not StrEmpty(TMvmestre.FindField('CODIGOBARRAS').AsString) then
                          begin
                            COD_MOD   := '55';
                            SER       := '01';
                          end
                        else
                          begin
                            COD_MOD   := '01';
                            SER       := '02';
                          end;
                        COD_SIT       := sdFiscalCompl;
                        NUM_DOC       := TMvmestre.FindField('NUMERO').AsString;
                        CHV_NFE       := TMvmestre.FindField('CODIGOBARRAS').AsString; //complemento
                        DT_DOC        := StrToDate(TMvmestre.FindField('EMISSAO').AsString);
                        DT_E_S        := StrToDate(TMvmestre.FindField('EMISSAO').AsString);
                        VL_DOC        := 0;
                        VL_MERC       := 0;

                        if (TMvmestre.FindField('CONDICAO').AsString = '1') then
                          IND_PGTO    := tpVista
                        else
                          IND_PGTO    := tpPrazo;

                        VL_DESC       := Abs(TMvmestre.FindField('VLRDESCONTOS').AsFloat);
                        VL_ABAT_NT    := 0;

                       if TMvmestre.FindField('VLRDSPTRIBUTADA').AsFloat > 0 then
                         begin
                           if TMvmestre.FindField('TRAFRETE').AsInteger = 0 then
                             IND_FRT       := tfPorContaEmitente;

                           if TMvmestre.FindField('TRAFRETE').AsInteger = 1 then
                             IND_FRT       := tfPorContaDestinatario;
                         end
                       else
                        IND_FRT       := tfSemCobrancaFrete;
                        VL_FRT        := TMvmestre.FindField('VLRDSPTRIBUTADA').AsFloat;
                        VL_SEG        := 0;
                        VL_OUT_DA     := 0;
                        VL_BC_ICMS    := TMvmestre.FindField('VLRBASEICMS').AsFloat;
                        VL_ICMS       := TMvmestre.FindField('VLRICMS').AsFloat;
                        VL_BC_ICMS_ST := 0;
                        VL_ICMS_ST    := 0;
                        VL_IPI        := TMvmestre.FindField('VLRIPI').AsFloat;
                        VL_PIS        := 0;
                        VL_COFINS     := 0;
                        VL_PIS_ST     := 0;
                        VL_COFINS_ST  := 0;
                      end
                    else
                      begin
                        if TB_PESSOASSPED.Locate('CONTROLE',TMvmestre.FindField('PESSOA').AsInteger,[]) then
                          COD_PART      := TB_PESSOASSPED.FindField('CODIGO').AsString;

                        IND_EMIT      := edEmissaoPropria;
                        IND_OPER      := tpSaidaPrestacao;
                        if not StrEmpty(TMvmestre.FindField('CODIGOBARRAS').AsString) then
                          begin
                            COD_MOD   := '55';
                            SER       := '01';
                          end
                        else
                          begin
                            COD_MOD   := '01';
                            SER       := '02';
                          end;
                        COD_SIT       := sdRegular;
                        NUM_DOC       := TMvmestre.FindField('NUMERO').AsString;
                        CHV_NFE       := TMvmestre.FindField('CODIGOBARRAS').AsString;
                        DT_DOC        := StrToDate(TMvmestre.FindField('EMISSAO').AsString);
                        DT_E_S        := StrToDate(TMvmestre.FindField('EMISSAO').AsString);
                        VL_DOC        := TMvmestre.FindField('VLRTOTAL').AsFloat;
                        VL_MERC       := TMvmestre.FindField('VLRPRODUTOS').AsFloat;

                        if (TMvmestre.FindField('CONDICAO').AsString = '1') then
                          IND_PGTO    := tpVista
                        else
                          IND_PGTO    := tpPrazo;

                        VL_DESC       := Abs(TMvmestre.FindField('VLRDESCONTOS').AsFloat);
                        VL_ABAT_NT    := 0;

                       if TMvmestre.FindField('VLRDSPTRIBUTADA').AsFloat > 0 then
                         begin
                           if TMvmestre.FindField('TRAFRETE').AsInteger = 0 then
                             IND_FRT       := tfPorContaEmitente;

                           if TMvmestre.FindField('TRAFRETE').AsInteger = 1 then
                             IND_FRT       := tfPorContaDestinatario;
                         end
                       else
                        IND_FRT       := tfSemCobrancaFrete;
                        VL_FRT        := variif(TMvmestre.FindField('VLRDSPTRIBUTADA').AsFloat > 0,TMvmestre.FindField('VLRDSPTRIBUTADA').AsFloat,0);
                        VL_SEG        := 0;
                        VL_OUT_DA     := 0;
                        VL_BC_ICMS    := TMvmestre.FindField('VLRBASEICMS').AsFloat;
                        VL_ICMS       := TMvmestre.FindField('VLRICMS').AsFloat;
                        VL_BC_ICMS_ST := 0;
                        VL_ICMS_ST    := 0;
                        VL_IPI        := TMvmestre.FindField('VLRDSPTRIBUTADA').AsFloat;
                        VL_PIS        := 0;
                        VL_COFINS     := 0;
                        VL_PIS_ST     := 0;
                        VL_COFINS_ST  := 0;
                      end;
                end;

              if TMvmestre.FindField('CANCELADA').asstring <> 'C' then
                begin
                  SqlTabela('imposto' ,
                                  ' SELECT  operacao, cst, percicms, SUM(total) + SUM(despesas) - SUM(desconto) AS TOTAL,                        ' +
                                  ' SUM(baseicms)AS BASEICMS, SUM(valoricms) AS VALORICMS, SUM(VALORIPI) as VALORIPI FROM sped_SAIDAS_itens      ' +
                                  ' WHERE numero  =             ' + QuotedStr(TMvmestre.FindField('NUMERO').AsString)     +
                                  ' AND SERIE     =             ' + QuotedStr(TMvmestre.FindField('SERIE').AsString)      +
                                  ' AND DOCUMENTO =             ' + QuotedStr(TMvmestre.FindField('DOCUMENTO').AsString)  +
                                  ' group by 1,2,3              ');

                  M_ITENS := Timposto.RecordCount;
                  Timposto.First;
                  while not Timposto.Eof do
                    begin
                      with RegistroC190New do
                        begin
                          if TMvmestre.Findfield('CODIGOBARRASCOMPLEMENTO').ASstring <> '' then
                            begin
                              if Timposto.Findfield('VALORICMS').AsFloat > 0 then
                                begin
                                  if StrContains('020#070',Timposto.Findfield('CST').AsString) then
                                    begin
                                      CST_ICMS        := Timposto.Findfield('CST').AsString;
                                      CFOP            := copy(Timposto.FindField('OPERACAO').AsString,1,4);
                                      ALIQ_ICMS       := Timposto.Findfield('PERCICMS').AsFloat;
                                      VL_BC_ICMS      := Timposto.Findfield('BASEICMS').AsFloat;
                                      VL_ICMS         := Timposto.Findfield('VALORICMS').AsFloat;
                                      VL_BC_ICMS_ST   := 0;
                                      VL_ICMS_ST      := 0;
                                      VL_IPI          := 0;
                                      VL_RED_BC       := 0;
                                      COD_OBS         := '';
                                      VL_OPR          := 0;
                                    end
                                  else
                                    if StrContains('000',Timposto.Findfield('CST').AsString) then
                                      begin
                                        CST_ICMS        := Timposto.Findfield('CST').AsString;
                                        CFOP            := copy(Timposto.FindField('OPERACAO').AsString,1,4);
                                        ALIQ_ICMS       := Timposto.Findfield('PERCICMS').AsFloat;
                                        VL_BC_ICMS      := Timposto.Findfield('BASEICMS').AsFloat;
                                        VL_ICMS         := Timposto.Findfield('VALORICMS').AsFloat;
                                        VL_BC_ICMS_ST   := 0;
                                        VL_ICMS_ST      := 0;
                                        VL_IPI          := 0;
                                        VL_RED_BC       := 0;
                                        COD_OBS         := '';
                                        VL_OPR          := 0;
                                      end
                                    else
                                      begin
                                        CST_ICMS        := Timposto.Findfield('CST').AsString;
                                        CFOP            := copy(Timposto.FindField('OPERACAO').AsString,1,4);
                                        ALIQ_ICMS       := 0;
                                        VL_BC_ICMS      := 0;
                                        VL_ICMS         := 0;
                                        VL_BC_ICMS_ST   := 0;
                                        VL_ICMS_ST      := 0;
                                        VL_IPI          := 0;
                                        VL_RED_BC       := 0;
                                        COD_OBS         := '';
                                        VL_OPR          := 0;
                                      end;
                                end
                              else
                                begin
                                  CST_ICMS        := Timposto.Findfield('CST').AsString;
                                  CFOP            := copy(Timposto.FindField('OPERACAO').AsString,1,4);
                                  ALIQ_ICMS       := 0;
                                  VL_BC_ICMS      := 0;
                                  VL_ICMS         := 0;
                                  VL_BC_ICMS_ST   := 0;
                                  VL_ICMS_ST      := 0;
                                  VL_RED_BC       := 0;
                                  VL_IPI          := 0;
                                  COD_OBS         := '';
                                  VL_OPR          := 0;
                                end;
                            end
                          else
                            begin
                              if Timposto.Findfield('VALORICMS').AsFloat > 0 then
                                begin
                                  if StrContains('020#070',Timposto.Findfield('CST').AsString) then
                                    begin
                                      CST_ICMS        := Timposto.Findfield('CST').AsString;
                                      CFOP            := copy(Timposto.FindField('OPERACAO').AsString,1,4);
                                      ALIQ_ICMS       := Timposto.Findfield('PERCICMS').AsFloat;
                                      VL_BC_ICMS      := Timposto.Findfield('BASEICMS').AsFloat;
                                      VL_ICMS         := Timposto.Findfield('VALORICMS').AsFloat;
                                      VL_BC_ICMS_ST   := 0;
                                      VL_ICMS_ST      := 0;
                                      VL_IPI          := 0;
                                      VL_RED_BC       := Timposto.Findfield('TOTAL').AsFloat;
                                      COD_OBS         := '';
                                      VL_OPR          := Timposto.Findfield('TOTAL').AsFloat;
                                    end
                                  else
                                    if StrContains('000',Timposto.Findfield('CST').AsString) then
                                      begin
                                        CST_ICMS        := Timposto.Findfield('CST').AsString;
                                        CFOP            := copy(Timposto.FindField('OPERACAO').AsString,1,4);
                                        ALIQ_ICMS       := Timposto.Findfield('PERCICMS').AsFloat;
                                        VL_BC_ICMS      := Timposto.Findfield('BASEICMS').AsFloat;
                                        VL_ICMS         := Timposto.Findfield('VALORICMS').AsFloat;
                                        VL_BC_ICMS_ST   := 0;
                                        VL_ICMS_ST      := 0;
                                        VL_IPI          := 0;
                                        VL_RED_BC       := 0;
                                        COD_OBS         := '';
                                        VL_OPR          := Timposto.Findfield('TOTAL').AsFloat;
                                      end
                                    else
                                      begin
                                        CST_ICMS        := Timposto.Findfield('CST').AsString;
                                        CFOP            := copy(Timposto.FindField('OPERACAO').AsString,1,4);
                                        ALIQ_ICMS       := 0;
                                        VL_BC_ICMS      := 0;
                                        VL_ICMS         := 0;
                                        VL_BC_ICMS_ST   := 0;
                                        VL_ICMS_ST      := 0;
                                        VL_IPI          := 0;
                                        VL_RED_BC       := 0;
                                        COD_OBS         := '';
                                        VL_OPR          := Timposto.Findfield('TOTAL').AsFloat;
                                      end;
                                end
                              else
                                begin
                                  CST_ICMS        := Timposto.Findfield('CST').AsString;
                                  CFOP            := copy(Timposto.FindField('OPERACAO').AsString,1,4);
                                  ALIQ_ICMS       := 0;
                                  VL_BC_ICMS      := 0;
                                  VL_ICMS         := 0;
                                  VL_BC_ICMS_ST   := 0;
                                  VL_ICMS_ST      := 0;
                                  VL_RED_BC       := 0;
                                  VL_IPI          := 0;
                                  COD_OBS         := '';
                                  VL_OPR          := Timposto.Findfield('TOTAL').AsFloat;
                                end;

                              if StrContains('020#070',Timposto.Findfield('CST').AsString) then
                                begin
                                  CST_ICMS        := Timposto.Findfield('CST').AsString;
                                  CFOP            := copy(Timposto.FindField('OPERACAO').AsString,1,4);
                                  ALIQ_ICMS       := Timposto.Findfield('PERCICMS').AsFloat;
                                  VL_BC_ICMS      := Timposto.Findfield('BASEICMS').AsFloat;
                                  VL_ICMS         := Timposto.Findfield('VALORICMS').AsFloat;
                                  VL_BC_ICMS_ST   := 0;
                                  VL_ICMS_ST      := 0;
                                  VL_IPI          := 0;
                                  VL_RED_BC       := Timposto.Findfield('TOTAL').AsFloat;
                                  COD_OBS         := '';
                                  VL_OPR          := Timposto.Findfield('TOTAL').AsFloat;
                                end;
                            end;
                        end;
                      Timposto.Next;
                    end;
                end;
              TMvmestre.Next;
            end;
        end;
    end;
  ACBrSpedFiscal.WriteBloco_C(False);
end;
function SpedFiscal(const rempresa:integer;dataini,datafin:TDateTime):string;
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

  ACBrSPEDFiscal   := TACBrSPEDFiscal.Create(nil);

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

  Bloco_0_Fiscal  (rempresa,dataini,datafin);
  Bloco_C_Fiscal  (rempresa,dataini,datafin);
  Bloco_D_Fiscal  (rempresa,dataini,datafin);
  Bloco_E_Fiscal  (rempresa,dataini,datafin);
  Bloco_H_Fiscal  (rempresa,dataini,datafin);
  Bloco_K_Fiscal  (rempresa,dataini,datafin);
  Bloco_1_Fiscal  (rempresa,dataini,datafin);
  Gerar_TXT_Fiscal(rempresa,dataini,datafin);

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

  ACBrSPEDFiscal   .Free;

  Result := M_NOMEARQUIVO;
end;

end.
