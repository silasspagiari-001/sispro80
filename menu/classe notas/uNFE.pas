unit uNFE;

interface

procedure MontarXML(pcontrole: integer);

implementation

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn,
  uniPageControl, uniLabel, uniEdit, uniDBEdit, UniButtonDbEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniBasicGrid, uniDBGrid, uniDateTimePicker,
  uniDBDateTimePicker, uniScrollBox, uniMultiItem, uniComboBox, uniDBComboBox,
  uniImage, uniMemo, Vcl.Menus, uniMainMenu, ACBrBase, ACBrDFe, ACBrNFe,
  ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFEClass, ACBrNFeDANFEFR,ACBrDFeUtil,pcteConversaoCTe,
  uniScreenMask, mkm_procedures, untDM_RC, untDM_IMP, mkm_funcoes, mkm_func_web,
  mkm_impressao, MainModule, pcnConversaoNFe, ACBrDFe.Conversao,
  System.AnsiStrings, uniGUIDialogs;

procedure MontarXML(pcontrole: integer);
var
  M_ITENS                               : Integer;
  base0, base1, UFDestino               : Real;
  totpis, totcofins                     : Real;
  consumidor, estado, contribuinte, desc, cRegiao: string;
  Total_Imposto, Perc_Imposto           : Real;

  // Variáveis para acumular valores da Reforma Tributária
  vTotBC, vTotIBS, vTotCBS              : Double;
begin
  // Carrega as tabelas necessárias
  TabelaMvmestre  (' select * from mvmestre where codigo      = ' + IntToStr(pcontrole));
  TabelaEmpresas  (' select * from empresas where codigo      = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger));
  TabelaPessoas   (' select * from pessoas  where codigo      = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));
  TabelaTransporte(' select * from transportes where codigo   = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('TRANSPORTADORA').AsInteger));
  TabelaOperacao  (' select * from operacoes where codigo     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('OPERACAO').AsInteger));
  Tabelaescritas  (' select * from escritas where codigo      = ' + IntToStr(dm_rc.FDQryoperacoes.FindField('ESCRITA').AsInteger));
  TabelaTitulos   (' select * from                              ' + variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'receber','pagar')+
                   ' where numero                             = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger) +
                   ' and                         documento    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                   ' and                         empresa      = ' + IntToStr(mm.varI_Code_Company)                                 +
                   ' order by sequencia                         ');
  TabelaMvitens   (' select * from mvitens  where numero      = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                   ' and                         documento    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                   ' and                         empresa      = ' + IntToStr(mm.varI_Code_Company)                                 +
                   ' order by sequencia                      ');
  // Inicializa acumuladores
  base0     := 0;
  base1     := 0;
  UFDestino := 0;
  totpis    := 0;
  totcofins := 0;

  // Inicializa totais da Reforma Tributária
  vTotBC    := 0;
  vTotIBS   := 0;
  vTotCBS   := 0;
  dm_rc.ACBrNFe.NotasFiscais.Clear;
  with dm_rc.ACBrNFe.NotasFiscais.Add.NFe do
    begin
      //************************************************************************
      // DADOS GERAIS DA NOTA (IDE)
      //************************************************************************
      infRespTec.CNPJ     := '13308121000147';
      infRespTec.xContato := 'DIOGENES HENRIQUE DA FONSECA SILVA';
      infRespTec.email    := 'contato@sislite.com.br';
      infRespTec.fone     := '18996573931';
      Ide.natOp           := dm_rc.FDQryoperacoes.FindField('DESCRICAO').AsString;
      Ide.nNF             := dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger;
      Ide.cNF             := StrToIntDef(StrZeros(IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger) + copy(DateToStr(dm_rc.FDQryMvmestre.FindField('EMISSAO').AsDateTime), 1, 2), 9), 0);
      Ide.serie           := dm_rc.tbempresas.FindField('SERIE').AsInteger;
      Ide.modelo          := 55;
      if dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar' then
        begin
          Ide.finNFe           := fnComplementar;
          Ide.NFref.Add.refNFe := dm_rc.FDQryMvmestre.FindField('CODIGOBARRASCOMPLEMENTO').AsString;
        end
      else
      if dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Devolucao' then
        begin
          Ide.finNFe           := fnDevolucao;
          Ide.NFref.Add.refNFe := dm_rc.FDQryMvmestre.FindField('CODIGOBARRASCOMPLEMENTO').AsString;
        end
      else
        Ide.finNFe  := fnNormal;
      Ide.dEmi      := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsDateTime;
      Ide.dSaiEnt   := dm_rc.FDQryMvmestre.FindField('RECEPCAODESPACHO').AsDateTime;
      Ide.hSaiEnt   := Now;
      if dm_rc.tbempresas.FindField('TIPO_AMBIENTE').AsString = 'Produção' then
        Ide.tpAmb     := taProducao
      else
        Ide.tpAmb     := taHomologacao;
      Ide.tpImp     := tiRetrato;
      Ide.verProc   := 'Sisgrãos 2.0.0';
      Ide.cUF       := StrToIntDef(Copy(dm_rc.tbempresas .FindField('IBGE').AsString,1,2), 35);
      Ide.cMunFG    := StrToIntDef(dm_rc.tbempresas .FindField('IBGE').AsString, 0);
      Ide.indFinal  := cfNao;
      if dm_rc.FDQryoperacoes.FindField('ENTRADA_SAIDA').AsInteger = 1 then
        Ide.tpNF      := tnSaida     else  Ide.tpNF      := tnEntrada;
      if StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString) then
        Ide.indPag    := ipOutras
      else
        begin
          if dm_rc.FDQryMvmestre.FindField('CONDICAO').AsInteger < 3 then
             Ide.indPag    := ipVista
          else
          if dm_rc.FDQryMvmestre.FindField('CONDICAO').AsInteger > 9 then
            Ide.indPag    := ipPrazo   else  Ide.indPag    := ipOutras;
        end;

      if dm_rc.FDQryPessoas.FindField('ESTADO').AsString = 'EX' then
        begin
          Ide.idDest := doExterior;
          cRegiao := '3';  // 3 exterior
        end
      else
      if dm_rc.tbempresas.FindField('ESTADO').AsString = dm_rc.FDQryPessoas.FindField('ESTADO').AsString then
        begin
          Ide.idDest := doInterna;
          cRegiao := '0';  // 0 local
        end
      else
        if dm_rc.tbempresas.FindField('ESTADO').AsString <> dm_rc.FDQryPessoas.FindField('ESTADO').AsString then
          begin
            Ide.idDest := doInterestadual;
            if MatchText(dm_rc.FDQryPessoas.FieldByName('ESTADO').AsString,['PR', 'SC', 'RS', 'MG', 'RJ']) then
              cRegiao := '2'
            else
              cRegiao := '1';
          end;

//      else

//        if dm_rc.FDQryPessoas.FindField('ESTADO').AsString = 'EX' then
//          Ide.idDest := doExterior;

      //********************************************************************************************************************************
      // EMITENTE
      //********************************************************************************************************************************
      Emit.CNPJCPF            := StrAllTrim(dm_rc.tbempresas.FindField('CNPJ').AsString);
      Emit.IE                 := RemoverEspeciais(dm_rc.tbempresas.FindField('INSCRICAO').AsString);
      Emit.xNome              := RemoverEspeciais(dm_rc.tbempresas.FindField('NOME').AsString);
      Emit.xFant              := RemoverEspeciais(dm_rc.tbempresas.FindField('NOME').AsString);
      Emit.EnderEmit.fone     := RemoverEspeciais(dm_rc.tbempresas.FindField('TELEFONE').AsString);
      Emit.EnderEmit.CEP      := StrToIntDef(dm_rc.tbempresas.FindField('CEP').AsString, 0);
      Emit.EnderEmit.xLgr     := RemoverEspeciais(dm_rc.tbempresas.FindField('ENDERECO').AsString);
      Emit.EnderEmit.nro      := RemoverEspeciais(dm_rc.tbempresas.FindField('NUMERO').AsString);
      Emit.EnderEmit.xBairro  := RemoverEspeciais(dm_rc.tbempresas.FindField('BAIRRO').AsString);
      Emit.EnderEmit.cMun     := StrToIntDef(dm_rc.tbempresas.FindField('IBGE').AsString, 0);
      Emit.EnderEmit.xMun     := RemoverEspeciais(dm_rc.tbempresas.FindField('CIDADE').AsString);
      Emit.EnderEmit.UF       := dm_rc.tbempresas.FindField('ESTADO').AsString;
      Emit.enderEmit.cPais    := 1058;
      Emit.enderEmit.xPais    := 'BRASIL';
      if StrContains('Lucro Real/Presumido#Normal',dm_rc.tbempresas.FindField('TIPO').AsString) then
        Emit.CRT              := crtRegimeNormal
      else
        Emit.CRT              := crtSimplesNacional;
      Emit.CNAE               := '';
      Emit.IM                 := '';
      //************************************************************************
      // DESTINATÁRIO
      //************************************************************************
      if dm_rc.FDQryPessoas.FindField('ESTADO').AsString = 'EX' then
        begin
          Dest.CNPJCPF                := StrAllTrim(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          Dest.xNome                  := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('NOME').AsString);
          Dest.EnderDest.xLgr         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('ENDERECO').AsString);
          Dest.EnderDest.nro          := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('NUMERO').AsString);
          Dest.EnderDest.CEP          := StrToIntDef(dm_rc.FDQryPessoas.FindField('CEP').AsString, 0);
          Dest.EnderDest.cMun         := dm_rc.FDQryPessoas.FindField('IBGE').AsInteger;
          Dest.EnderDest.xMun         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('CIDADE').AsString);
          Dest.EnderDest.UF           := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          Dest.EnderDest.Fone         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('TELEFONE').AsString);
          Dest.EnderDest.xBairro      := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('BAIRRO').AsString);
          Dest.EnderDest.cPais        := dm_rc.FDQryPessoas.FindField('IBGE').AsInteger;
          Dest.EnderDest.xPais        := dm_rc.FDQryPessoas.FindField('PAIS').AsString;
          exporta.UFSaidaPais         := dm_rc.FDQryPessoas.FindField('ESTADOEXPORTACAO').AsString;
          exporta.xLocExporta         := dm_rc.FDQryPessoas.FindField('LOCALEXPORTACAO').AsString;
        end
      else
        begin
          Dest.CNPJCPF                := StrAllTrim(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          Dest.xNome                  := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          Dest.EnderDest.xLgr         := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString;
          Dest.EnderDest.nro          := variif(dm_rc.FDQryPessoas.FindField('NUMERO').AsString = '','S/N',dm_rc.FDQryPessoas.FindField('NUMERO').AsString);
          Dest.EnderDest.CEP          := StrToIntDef(dm_rc.FDQryPessoas.FindField('CEP').AsString, 0);
          Dest.EnderDest.cMun         := dm_rc.FDQryPessoas.FindField('CODIIBGE').AsInteger;
          Dest.EnderDest.xMun         := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
          Dest.EnderDest.UF           := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          Dest.EnderDest.Fone         := variif(dm_rc.FDQryPessoas.FindField('TELEFONE').AsString <> '',dm_rc.FDQryPessoas.FindField('TELEFONE').AsString,dm_rc.FDQryPessoas.FindField('CELULAR').AsString);
          Dest.ISUF                   := dm_rc.FDQryPessoas.FindField('SUFRAMA').AsString;
          if not StrEmpty(dm_rc.FDQryPessoas.FindField('BAIRRO').AsString) then
            Dest.EnderDest.xBairro    := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString
          else
            Dest.EnderDest.xBairro    := 'RURAL';
          Dest.EnderDest.cPais        := 1058;
          Dest.EnderDest.xPais        := 'BRASIL';

          if StrContains('48628426000110#48628426000200',dm_rc.tbempresas.FindField('CNPJ').AsString) then
            begin
              if dm_rc.FDQryPessoas.FindField('CEPENTREGA').AsString <> '' then
                begin
                  Entrega.xNome   := dm_rc.FDQryPessoas.FindField('NOME').AsString;
                  Entrega.IE      := '';
                  Entrega.CNPJCPF := StrAllTrim(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
                  Entrega.xLgr    := (dm_rc.FDQryPessoas.FindField('ENDERECOENTREGA').AsString);
                  Entrega.nro     := variif(dm_rc.FDQryPessoas.FindField('NUMEROENTREGA').AsString = '','S/N',(dm_rc.FDQryPessoas.FindField('NUMEROENTREGA').AsString));
                  Entrega.xCpl    := '';
                  Entrega.xBairro := (dm_rc.FDQryPessoas.FindField('BAIRROENTREGA').AsString);
                  Entrega.cMun    := dm_rc.FDQryPessoas.FindField('IBGEENTREGA').AsInteger;
                  Entrega.xMun    := (dm_rc.FDQryPessoas.FindField('CIDADEENTREGA').AsString);
                  Entrega.UF      := dm_rc.FDQryPessoas.FindField('ESTADOENTREGA').AsString;
                  Entrega.CEP     := StrToIntDef(dm_rc.FDQryPessoas.FindField('CEPENTREGA').AsString, 0);
                  Entrega.fone    := dm_rc.FDQryPessoas.FindField('CELULAR').AsString;
                end;
            end
          else
          if StrContains('52070356000103',dm_rc.tbempresas.FindField('CNPJ').AsString) then
            begin
              if dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString <> '' then
                begin
                  Entrega.xNome   := dm_rc.FDQryPessoas.FindField('NOME').AsString;
                  Entrega.IE      := variif(StrAllTrim(dm_rc.FDQryPessoas.FindField('INSCRICAOENTREGA').AsString) <> '',(dm_rc.FDQryPessoas.FindField('INSCRICAOENTREGA').AsString), '');
                  Entrega.CNPJCPF := StrAllTrim(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
                  Entrega.xLgr    := (dm_rc.FDQryMvmestre.FindField('ENTREGA_ENDERECO').AsString);
                  Entrega.nro     := variif(dm_rc.FDQryMvmestre.FindField('ENTREGA_NUMERO').AsString = '','S/N',(dm_rc.FDQryMvmestre.FindField('ENTREGA_NUMERO').AsString));
                  Entrega.xCpl    := StrAllTrim(dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString);
                  Entrega.xBairro := (dm_rc.FDQryMvmestre.FindField('ENTREGA_BAIRRO').AsString);
                  Entrega.cMun    := dm_rc.FDQryMvmestre.FindField('ENTREGA_IBGE').AsInteger;
                  Entrega.xMun    := (dm_rc.FDQryMvmestre.FindField('ENTREGA_CIDADE').AsString);
                  Entrega.UF      := dm_rc.FDQryMvmestre.FindField('ENTREGA_ESTADO').AsString;
                  Entrega.CEP     := StrToInt(dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString);
                  Entrega.fone    := dm_rc.FDQryPessoas.FindField('CELULAR').AsString;
                end;
            end;
        end;
      if StrContains('EX',dm_rc.FDQryPessoas.FindField('ESTADO').AsString) then
        begin
          Dest.indIEDest  := inNaoContribuinte;
          Ide.indFinal    := cfConsumidorFinal;
        end
      else
        begin
          if dm_rc.FDQryPessoas.FindField('SITUACAO').AsString = 'Nao Contribuinte' then
            begin
              Dest.indIEDest  := inNaoContribuinte;
              Ide.indFinal    := cfConsumidorFinal;
            end;
          if (dm_rc.FDQryPessoas.FindField('SITUACAO').AsString  = 'Isento') or
             (dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString = 'ISENTO') then
            begin
              Dest.indIEDest  := inIsento;
              Ide.indFinal    := cfConsumidorFinal;
            end;
          if dm_rc.FDQryPessoas.FindField('SITUACAO').AsString = 'Consumidor' then
            begin
              Dest.IE         := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
              Dest.indIEDest  := inContribuinte;
              Ide.indFinal    := cfNao;
            end;
          if dm_rc.FDQryPessoas.FindField('SITUACAO').AsString = 'Contribuinte' then
            begin
              Dest.IE         := variif(dm_rc.FDQryPessoas.FindField('PRODUTOR').AsString <> '',RemoverEspeciais(dm_rc.FDQryPessoas.FindField('PRODUTOR').AsString),RemoverEspeciais(dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString));
              Dest.indIEDest  := inContribuinte;
              Ide.indFinal    := cfNao;
            end;
          if dm_rc.FDQryPessoas.FindField('SITUACAO').AsString = '' then
            begin
              Dest.IE         := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
              Dest.indIEDest  := inContribuinte;
              Ide.indFinal    := cfNao;
            end;
        end;

      //******************************************************************************************************************************//
      //TRANSPORTADOR
      //******************************************************************************************************************************//
      if dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsInteger = 0 then
        Transp.modFrete := mfSemFrete
      else
        if dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsInteger = 1 then
          Transp.modFrete := mfContaEmitente
        else
          if dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsInteger = 2 then
            Transp.modFrete := mfContaDestinatario
          else
            if dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsInteger = 3 then
              Transp.modFrete := mfContaTerceiros;

      with Transp.Vol.New do
        begin
          qVol    := StrToIntDef(FloatToStr(dm_rc.FDQryMVmestre.FindField('TRAQUANTIDADE').AsInteger), 0);
          esp     := dm_rc.FDQryMVmestre.FindField('TRAESPECIE').AsString;
          marca   := dm_rc.FDQryMVmestre.FindField('TRAMARCA').AsString;
          nVol    := dm_rc.FDQryMVmestre.FindField('TRANUMERONOTA').AsString;
          pesoL   := dm_rc.FDQryMVmestre.FindField('TRAPESOLIQUIDO').AsFloat;
          pesoB   := dm_rc.FDQryMVmestre.FindField('TRAPESOBRUTO').AsFloat;
        end;

      if dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsInteger <> 0 then
        begin
          with Transp do
            begin
              Transporta.xNome        := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('NOME').AsString);
              if not StrEmpty(dm_rc.FDQryTransportes.FindField('CPFCNPJ').AsString) then
                Transporta.CNPJCPF    := StrAllTrim(dm_rc.FDQryTransportes.FindField('CPFCNPJ').AsString);
              if not StrEmpty(dm_rc.FDQryTransportes.FindField('INSCRICAO').AsString) then
                Transporta.IE         := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('INSCRICAO').AsString);
              Transporta.xEnder       := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('ENDERECO').AsString);
              Transporta.xMun         := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('CIDADE').AsString);
              Transporta.UF           := dm_rc.FDQryTransportes.FindField('ESTADO').AsString;

              if not StrEmpty(dm_rc.FDQryTransportes.FindField('PLACA').AsString) then
                veicTransp.placa  := StrAllTrim(dm_rc.FDQryTransportes.FindField('PLACA').AsString);

              if not StrEmpty(dm_rc.FDQryTransportes.FindField('PLACAESTADO').AsString) then
                veicTransp.UF  := StrAllTrim(dm_rc.FDQryTransportes.FindField('PLACAESTADO').AsString);

              if not StrEmpty(dm_rc.FDQryTransportes.FindField('RNTC').AsString) then
                veicTransp.RNTC  := StrAllTrim(dm_rc.FDQryTransportes.FindField('RNTC').AsString);
            end;
        end;
      //************************************************************************
      // ITENS (DET) E IMPOSTOS
      //************************************************************************
      Total_Imposto := 0;
      dm_rc.tbmvitens.First;
      M_ITENS := 0;
      while not dm_rc.tbmvitens.Eof do
        begin
          if dm_rc.tbmvitens.FindField('PRODUTO').AsInteger > 0 then
            begin
              with Det.New do
                begin
                  Inc(M_ITENS);
                  Prod.nItem    := M_ITENS;
                  //**********************************************************//
                  //ADICIONA INFORMAÇÕES ADC DO PRODUTO
                  //**********************************************************//
                  if dm_rc.tbmvitens.FindField('OBSPRODUTO').AsString <> '' then
                   begin
                     infAdProd     := 'Obs Adicional..: ' + dm_rc.tbmvitens.FindField('OBSPRODUTO').AsString;
                   end;
                  //**********************************************************//
                  //VERIFICA ENTREGA FUTURA
                  //**********************************************************//
                  if (IntToStr(dm_rc.tbmvitens.FindField('CODVEF').AsInteger) <> '0') and
                     (IntToStr(dm_rc.tbmvitens.FindField('CODVEF').AsInteger) <> '') then
                   begin
                     SqlPesquisa('SELECT * FROM ENTREGA_FUTURA WHERE CODIGO = ' + IntToStr(dm_rc.tbmvitens.FindField('CODVEF').AsInteger));
                     infAdProd     := variif(dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat = dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat,
                                      ' Remessa Total    | ',
                                      ' Remessa Parcial  | ') +
                                      ' Nota de Referência Nº '+ StrZeroS(dm_rc.sqlBuscas.FindField('NUMERO').AsString,5)             + '   ' +
                                      ' Emitida dia: '         + dm_rc.sqlBuscas.FindField('EMISSAO').AsString                        + ' | ' +
                                      ' Quant. Emitida : '     + formatfloat('#,##0',dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat) + '   ' +
                                      ' Quant. Entregue: '     + formatfloat('#,##0',dm_rc.sqlBuscas.FindField('ENTREGUE').AsFloat)   + '   ' +
                                      ' Saldo p/ Entrega: '    + formatfloat('#,##0',dm_rc.sqlBuscas.FindField('SALDO').AsFloat)      + ' | ';
                   end;
                  if dm_rc.tbmvitens.FindField('PEDIDOOR').AsString <> '' then
                   begin
                     Prod.xPed     := dm_rc.tbmvitens.FindField('PEDIDOOR').AsString;
                     Prod.nItemPed := dm_rc.tbmvitens.FindField('PEDIDOITEMOR').AsString;
                     infAdProd     := 'Pedido nº ' + dm_rc.tbmvitens.FindField('PEDIDOOR').AsString + ' - ' +
                                      ' Item nº ' + dm_rc.tbmvitens.FindField('PEDIDOITEMOR').AsString;
                   end;

                  TabelaProdutos( ' SELECT * FROM PRODUTOS, SALDOS WHERE PRODUTOS.CODIGO = SALDOS.PRODUTO AND PRODUTOS.CODIGO   = ' + IntToStr(dm_rc.tbmvitens.FindField('PRODUTO').AsInteger) +
                                  ' AND SALDOS.EMPRESA                                                                          = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger));
                  if dm_rc.tbmvitens.FindField('LOTESEMENTE').AsString <> '' then
                    begin
                      Prod.xProd  := variif(dm_rc.tbmvitens.FindField('DESCRICAO_NOTA').AsString <> '',
                                            dm_rc.tbmvitens.FindField('DESCRICAO_NOTA').AsString,
                                            dm_rc.tbmvitens.FindField('DESCRICAO').AsString);
                    end
                  else
                    Prod.xProd := RemoverEspeciais(dm_rc.tbmvitens.FindField('DESCRICAO').AsString);

                  Prod.CFOP     := copy(dm_rc.tbmvitens.FindField('OPERACAO').AsString,1,4);
                  Prod.cProd    := IntToStr(dm_rc.tbmvitens.FindField('PRODUTO').AsInteger);
                  Prod.NCM      := RemoverEspeciais(dm_rc.FDQryProdutos.FindField('NUMERONCM').AsString);
                  Prod.vFrete   := MRound(dm_rc.tbmvitens.FindField('FRETE').AsFloat,4);
                  Prod.vSeg     := MRound(dm_rc.tbmvitens.FindField('SEGURO').AsFloat,4);
                  Prod.vOutro   := MRound(dm_rc.tbmvitens.FindField('DESPESAS').AsFloat,4);
                  Prod.qCom     := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
                  Prod.qTrib    := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
                  if dm_rc.tbmvitens.FindField('DESCONTO').AsFloat > 0 then
                    begin
                      Prod.vDesc    := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar',0,MRound(dm_rc.tbmvitens.FindField('DESCONTO').AsFloat,2));
                      Prod.vUnCom   := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar',0,MRound(dm_rc.tbmvitens.FindField('PRECO').AsFloat,4));
                      Prod.vUnTrib  := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar',0,MRound(dm_rc.tbmvitens.FindField('PRECO').AsFloat,4));
                      Prod.vProd    := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar',0,MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat,4));
                    end
                  else
                    begin
                      Prod.vUnCom   := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar',0,MRound(dm_rc.tbmvitens.FindField('PRECO').AsFloat,4));
                      Prod.vUnTrib  := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar',0,MRound(dm_rc.tbmvitens.FindField('PRECO').AsFloat,4));
                      Prod.vProd    := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar',0,MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat,4));
                    end;
                  Prod.cEAN     := 'SEM GTIN';
                  Prod.cEANTrib := 'SEM GTIN';
                  if StrEmpty(dm_rc.FDQryProdutos.FindField('UNIDADE').AsString) then
                    Prod.uCom   := 'KG'  else  Prod.uCom    := UpperCase(dm_rc.FDQryProdutos.FindField('UNIDADE').AsString);
                  if StrEmpty(dm_rc.FDQryProdutos.FindField('UNIDADE').AsString) then
                    Prod.uTrib   := 'KG' else  Prod.uTrib   := UpperCase(dm_rc.FDQryProdutos.FindField('UNIDADE').AsString);

// AGORA O CODIGO DO BENEFICIO JA FICA DIRETO NA TABELA DE SALDOS

//                  if TabelaCBNEF('SELECT * FROM CBNEF WHERE CODCBNEF = ' + QuotedStr(dm_rc.FDQryProdutos.FindField('CBNEF').AsString)) then
//                    begin
//                      if StrContains(dm_rc.fdqrycbnef.FindField('CST').AsString,dm_rc.tbmvitens.FindField('CST').AsString) or
//                         StrContains('050',dm_rc.tbmvitens.FindField('CST').AsString) or (dm_rc.tbmvitens.FindField('CST').AsString <> '090') then
//                        prod.cBenef := dm_rc.FDQryProdutos.FindField('CBNEF').AsString
//                      else
//                        if dm_rc.tbmvitens.FindField('CST').AsString = '090' then
//                          prod.cBenef :=  'SP099999';
//                    end
//                  else
//                    prod.cBenef :=  'SP099999';

                  with Imposto do
                    begin
                       if dm_rc.FDQryProdutos.FindField('TIPOTRIB').AsString <> 'CMP' then
                       begin
                        // ============================================
                        // REFORMA TRIBUTÁRIA (IBS/CBS) - CORRIGIDO
                        // ============================================

                        with Imposto.IBSCBS do
                        begin
                          // ============================================
                          // 1. Definição do CST
                          // ============================================
                          if (dm_rc.FDQryProdutos.FindField('TIPOTRIB').AsString = '200') then
                            CST := cst200
                          else if (dm_rc.FDQryProdutos.FindField('TIPOTRIB').AsString = '400') then
                            CST := cst400
                          else if (dm_rc.FDQryProdutos.FindField('TIPOTRIB').AsString = '410') then
                            CST := cst410
                          else if (dm_rc.FDQryProdutos.FindField('TIPOTRIB').AsString = '011') then
                            CST := cst011
                          else
                            CST := cst000;
                          // ============================================
                          // 2. Definição do cClassTrib
                          // ============================================
                          if dm_rc.FDQryProdutos.FindField('CLASSTRIB').AsString <> '' then
                             cClassTrib := dm_rc.FDQryProdutos.FindField('CLASSTRIB').AsString
                          else
                             cClassTrib := dm_rc.FDQryProdutos.FindField('CLASSTRIB').AsString; // Default correto
                          // ============================================
                          // 3. Preenchimento do gIBSCBS
                          // ============================================
                          if CST in [cst000, cst011, cst200] then
                          begin
                              with gIBSCBS do
                              begin
                                  vBC := dm_rc.tbmvitens.FindField('TOTAL').AsFloat;
                                  vTotBC := vTotBC + vBC;

                                  // -----------------------------------------------------------------
                                  // A) IBS ESTADUAL (UF)
                                  // -----------------------------------------------------------------
                                  with gIBSUF do
                                  begin
                                     pIBSUF := 0.1; // Alíquota de referência (fase teste 2026)

                                     // CST 200 com cClassTrib específico de máquinas agrícolas
                                     if (CST = cst200) and (dm_rc.FDQryProdutos.FindField('BASE1').AsInteger = 0) then
                                     begin
                                        gRed.pRedAliq  := 100.0000; // 100% redução
                                        gRed.pAliqEfet := 0.0000;
                                        vIBSUF         := 0.00;
                                     end
                                     // CST 200 com outras classificações ou CST 011
                                     else if CST in [cst200, cst011] then
                                     begin
                                        gRed.pRedAliq  := 60.0; // Redução padrão 60%
                                        gRed.pAliqEfet := pIBSUF * (1 - (gRed.pRedAliq / 100));
                                        vIBSUF         := MRound(vBC * (gRed.pAliqEfet / 100), 2);
                                     end
                                     // CST 000 - Tributação Normal (sem redução)
                                     else
                                     begin
                                        vIBSUF := MRound(vBC * (pIBSUF / 100), 2);
                                        // Não preenche gRed
                                     end;
                                  end;
                                  // -----------------------------------------------------------------
                                  // B) IBS MUNICIPAL (Mun)
                                  // -----------------------------------------------------------------
                                  with gIBSMun do
                                  begin
                                     pIBSMun := 0.0; // Normalmente zero na fase teste

                                     if (CST = cst200) and (cClassTrib = '200002') then
                                     begin
                                        gRed.pRedAliq  := 100.0000;
                                        gRed.pAliqEfet := 0.0000;
                                        vIBSMun        := 0.00;
                                     end
                                     else if CST in [cst200, cst011] then
                                     begin
                                        gRed.pRedAliq  := 60.0;
                                        gRed.pAliqEfet := 0.0; // pIBSMun é 0, então resultado é 0
                                        vIBSMun        := 0.00;
                                     end
                                     else
                                     begin
                                        vIBSMun := 0.00;
                                     end;
                                  end;

                                  vIBS    := gIBSUF.vIBSUF + gIBSMun.vIBSMun;
                                  vTotIBS := vTotIBS + vIBS;

                                  // -----------------------------------------------------------------
                                  // C) CBS FEDERAL
                                  // -----------------------------------------------------------------
                                  with gCBS do
                                  begin
                                     pCBS := 0.9; // Alíquota de referência (fase teste 2026)

                                     if (CST = cst200) and (cClassTrib = '200002') then
                                     begin
                                        gRed.pRedAliq  := 100.0000; // 100% redução
                                        gRed.pAliqEfet := 0.0000;
                                        vCBS           := 0.00;
                                     end
                                     else if CST in [cst200, cst011] then
                                     begin
                                        gRed.pRedAliq  := 60.0; // Redução padrão 60%
                                        gRed.pAliqEfet := pCBS * (1 - (gRed.pRedAliq / 100));
                                        vCBS           := MRound(vBC * (gRed.pAliqEfet / 100), 2);
                                     end
                                     else
                                     begin
                                        vCBS := MRound(vBC * (pCBS / 100), 2);
                                     end;
                                  end;

                                  vTotCBS := vTotCBS + gCBS.vCBS;
                              end;
                          end;
                          // CST 400 (Imunidade) não preenche gIBSCBS
                        end;
                       end;

                      if dm_rc.tbmvitens.FindField('PERCIPI').AsFloat > 0 then
                        begin
                          with IPI do
                            begin
                              clEnq     := '';
                              CNPJProd  := '';
                              cSelo     := '';
                              qSelo     := 0;
                              cEnq      := '999';
                              CST       := ipi50;
                              vBC       := dm_rc.tbmvitens.FindField('TOTAL').AsFloat;
                              pIPI      := dm_rc.tbmvitens.FindField('PERCIPI').AsFloat;
                              vIPI      := dm_rc.tbmvitens.FindField('VALORIPI').AsFloat;
                              vUnid     := 0;
                              qUnid     := 0;
                            end;
                        end;

                      with ICMS do
                        begin
                          ICMS.orig   := oeNacional;

                          if dm_rc.FDQryProdutos.FindField('ORIGEM').AsString = 'Nacional' then
                            ICMS.orig   := oeNacional;
                          if dm_rc.FDQryProdutos.FindField('ORIGEM').AsString = 'Importacao' then
                            ICMS.orig   := oeEstrangeiraImportacaoDireta;
                          if dm_rc.FDQryProdutos.FindField('ORIGEM').AsString = 'Interno' then
                            ICMS.orig   := oeEstrangeiraAdquiridaBrasil;
                          if dm_rc.FDQryProdutos.FindField('ORIGEM').AsString = '560' then
                            ICMS.orig   := oeNacionalConteudoImportacaoInferiorIgual40;


                          if dm_rc.tbmvitens.FindField('CST').AsString = '0101' then
                            begin
                              CSOSN       := csosn101;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;

                          if dm_rc.tbmvitens.FindField('CST').AsString = '0103' then
                            begin
                              CSOSN       := csosn103;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;

                          if dm_rc.tbmvitens.FindField('CST').AsString = '0900' then
                            begin
                              CSOSN       := csosn900;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;

                          if dm_rc.tbmvitens.FindField('CST').AsString = '0500' then
                            begin
                              CSOSN       := csosn500;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;

                          if dm_rc.tbmvitens.FindField('CST').AsString = '100' then
                            begin
                              CST         := cst10;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;
                          if dm_rc.tbmvitens.FindField('CST').AsString = '000' then
                            begin
                              CST              := cst00;
                              ICMS.modBC       := dbiValorOperacao;
                              ICMS.pICMS       := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS       := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC         := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;
                          if dm_rc.tbmvitens.FindField('CST').AsString = '010' then
                            begin
                              CST         := cst10;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;
                          if dm_rc.tbmvitens.FindField('CST').AsString = '020' then
                             begin
                               if cRegiao = '0' then
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIOLC').AsString
                               else if cRegiao = '1' then
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIO01').AsString
                               else if cRegiao = '2' then
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIO02').AsString
                               else if cRegiao = '3' then  // exterior
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIOEX').AsString;

                               CST         := cst20;
                               ICMS.modBC  := dbiValorOperacao;
                               ICMS.pRedBC := dm_rc.tbmvitens.FindField('PERCREDUCAO').AsFloat;
                               ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                               ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                               ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                               vICMSDeson  := dm_rc.tbmvitens.FindField('VLRICMSDESONERACAO').AsFloat;
                               motDesICMS  := mdiProdutorAgropecuario;
                             end;
                          if dm_rc.tbmvitens.FindField('CST').AsString = '030' then
                            begin
                              CST         := cst30;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;
                          if dm_rc.tbmvitens.FindField('CST').AsString = '040' then
                            begin
                               if cRegiao = '0' then
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIOLC').AsString
                               else if cRegiao = '1' then
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIO01').AsString
                               else if cRegiao = '2' then
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIO02').AsString
                               else if cRegiao = '3' then  // exterior
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIOEX').AsString;

                              CST              := cst40;
                              ICMS.modBC       := dbiValorOperacao;
                              ICMS.pICMS       := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS       := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC         := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                              vICMSDeson       := dm_rc.tbmvitens.FindField('VLRICMSDESONERACAO').AsFloat;
                              motDesICMS       := mdiProdutorAgropecuario;

                            end;
                          if dm_rc.tbmvitens.FindField('CST').AsString = '041' then
                            begin
                               if cRegiao = '0' then
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIOLC').AsString
                               else if cRegiao = '1' then
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIO01').AsString
                               else if cRegiao = '2' then
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIO02').AsString
                               else if cRegiao = '3' then  // exterior
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIOEX').AsString;

                              CST         := cst41;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := 0;
                              ICMS.vICMS  := 0;
                              ICMS.vBC    := 0;
                            end;
                          if dm_rc.tbmvitens.FindField('CST').AsString = '050' then
                            begin
                               if cRegiao = '0' then
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIOLC').AsString
                               else if cRegiao = '1' then
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIO01').AsString
                               else if cRegiao = '2' then
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIO02').AsString
                               else if cRegiao = '3' then  // exterior
                                  prod.cBenef :=  dm_rc.FDQryProdutos.FindField('BENEFICIOEX').AsString;

                              CST         := cst50;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;
                          if dm_rc.tbmvitens.FindField('CST').AsString = '051' then
                            begin
                              CST         := cst51;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;
                          if dm_rc.tbmvitens.FindField('CST').AsString = '060' then
                            begin
                               CST         := cst60;
                               ICMS.modBC  := dbiValorOperacao;
                               ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                               ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                               ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                             end;
                          if dm_rc.tbmvitens.FindField('CST').AsString = '070' then
                            begin
                              CST         := cst70;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;
                          if dm_rc.tbmvitens.FindField('CST').AsString = '700' then
                            begin
                              CST         := cst70;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;
                          if dm_rc.tbmvitens.FindField('CST').AsString = '090' then
                            begin

                              if dm_rc.FDQryProdutos.FindField('BENEFICIO90').AsString <> 'SEM CBENEF' then
                                 prod.cBenef := dm_rc.FDQryProdutos.FindField('BENEFICIO90').AsString;

                              CST         := cst90;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                              vICMSDeson  := dm_rc.tbmvitens.FindField('VLRICMSDESONERACAO').AsFloat;
                              motDesICMS  := mdiProdutorAgropecuario;

                            end;
                        end;

                      if not StrContains('5923#6923',dm_rc.tbmvitens.FindField('OPERACAO').AsString) then
                        vTotTrib := MRound((dm_rc.tbmvitens.FindField('TOTAL').AsFloat * 13.45) / 100,2)
                      else
                        vTotTrib := 0;
                      Total_Imposto := Total_Imposto + vTotTrib;

                      with PIS do
                        begin
                           case AnsiIndexStr(dm_rc.tbmvitens.FindField('PIS').AsString,['01','02','03','04','05','06','07','08','09','49']) of
                             0 : CST := pis01;    //01
                             1 : CST := pis02;    //02
                             2 : CST := pis03;    //03
                             3 : CST := pis04;    //04
                             4 : CST := pis05;    //05
                             5 : CST := pis06;    //06
                             6 : CST := pis07;    //07
                             7 : CST := pis08;    //08
                             8 : CST := pis09;    //09
                             9 : CST := pis49;    //49
                            10 : CST := pis50;    //50
                            11 : CST := pis51;    //51
                            12 : CST := pis52;    //52
                            13 : CST := pis53;    //53
                            14 : CST := pis54;    //54
                            15 : CST := pis55;    //55
                            16 : CST := pis56;    //56
                            17 : CST := pis60;    //60
                            18 : CST := pis61;    //61
                            19 : CST := pis62;    //62
                            20 : CST := pis63;    //63
                            21 : CST := pis64;    //64
                            22 : CST := pis65;    //65
                            23 : CST := pis66;    //66
                            24 : CST := pis67;    //67
                            25 : CST := pis70;    //70
                            26 : CST := pis71;    //71
                            27 : CST := pis72;    //72
                            28 : CST := pis73;    //73
                            29 : CST := pis74;    //74
                            30 : CST := pis75;    //75
                            31 : CST := pis98;    //98
                            32 : CST := pis99;    //99
                           end;
                          vBC       := 0;
                          pPIS      := 0;
                          vPIS      := 0;
                          vBC       := variif(dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat > 0,dm_rc.tbmvitens.FindField('TOTAL').AsFloat     ,0);
                          pPIS      := variif(dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat > 0,dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat,0);
                          vPIS      := variif(dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat > 0,MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat * dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat / 100,2),0);

                          if dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat > 0 then
                            totpis  := totpis + MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat * dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat /100,2)
                          else
                            totpis  := totpis;
                        end;
                      with COFINS do
                        begin
                           case AnsiIndexStr(dm_rc.tbmvitens.FindField('COFINS').AsString,['01','02','03','04','05','06','07','08','09','49','50','51','52','53','54','55','56','60','61','62','63','64','65','66','67','70','71','72','73','74','75','98','99']) of
                             0 : CST := cof01;    //01
                             1 : CST := cof02;    //02
                             2 : CST := cof03;    //03
                             3 : CST := cof04;    //04
                             4 : CST := cof05;    //05
                             5 : CST := cof06;    //06
                             6 : CST := cof07;    //07
                             7 : CST := cof08;    //08
                             8 : CST := cof09;    //09
                             9 : CST := cof49;    //49
                            10 : CST := cof50;    //50
                            11 : CST := cof51;    //51
                            12 : CST := cof52;    //52
                            13 : CST := cof53;    //53
                            14 : CST := cof54;    //54
                            15 : CST := cof55;    //55
                            16 : CST := cof56;    //56
                            17 : CST := cof60;    //60
                            18 : CST := cof61;    //61
                            19 : CST := cof62;    //62
                            20 : CST := cof63;    //63
                            21 : CST := cof64;    //64
                            22 : CST := cof65;    //65
                            23 : CST := cof66;    //66
                            24 : CST := cof67;    //67
                            25 : CST := cof70;    //70
                            26 : CST := cof71;    //71
                            27 : CST := cof72;    //72
                            28 : CST := cof73;    //73
                            29 : CST := cof74;    //74
                            30 : CST := cof75;    //75
                            31 : CST := cof98;    //98
                            32 : CST := cof99;    //99
                           end;
                          vBC        := 0;
                          pCOFINS    := 0;
                          vCOFINS    := 0;
                          vBC        := variif(dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat > 0,dm_rc.tbmvitens.FindField('TOTAL').AsFloat        ,0);
                          pCOFINS    := variif(dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat > 0,dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat,0);
                          vCOFINS    := variif(dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat > 0,MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat * dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat / 100,2),0);
                          if dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat > 0 then
                            totcofins  := totcofins + MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat * dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat /100,2)
                          else
                            totcofins  := totcofins;
                        end;

//                      with PIS do
//                        begin
//                           case AnsiIndexStr(dm_rc.tbmvitens.FindField('PIS').AsString,['01','02','03','04','05','06','07','08','09','49']) of
//                             0 : CST := pis01;    //01
//                             1 : CST := pis02;    //02
//                             2 : CST := pis03;    //03
//                             3 : CST := pis04;    //04
//                             4 : CST := pis05;    //05
//                             5 : CST := pis06;    //06
//                             6 : CST := pis07;    //07
//                             7 : CST := pis08;    //08
//                             8 : CST := pis09;    //09
//                             9 : CST := pis49;    //49
//                            10 : CST := pis50;    //50
//                            11 : CST := pis51;    //51
//                            12 : CST := pis52;    //52
//                            13 : CST := pis53;    //53
//                            14 : CST := pis54;    //54
//                            15 : CST := pis55;    //55
//                            16 : CST := pis56;    //56
//                            17 : CST := pis60;    //60
//                            18 : CST := pis61;    //61
//                            19 : CST := pis62;    //62
//                            20 : CST := pis63;    //63
//                            21 : CST := pis64;    //64
//                            22 : CST := pis65;    //65
//                            23 : CST := pis66;    //66
//                            24 : CST := pis67;    //67
//                            25 : CST := pis70;    //70
//                            26 : CST := pis71;    //71
//                            27 : CST := pis72;    //72
//                            28 : CST := pis73;    //73
//                            29 : CST := pis74;    //74
//                            30 : CST := pis75;    //75
//                            31 : CST := pis98;    //98
//                            32 : CST := pis99;    //99
//                           end;
//                          vBC       := 0;
//                          pPIS      := 0;
//                          vPIS      := 0;
//                          vBC       := 0;
//                          pPIS      := 0;
//                          vPIS      := 0;
//                        end;
//                      with COFINS do
//                        begin
//                           case AnsiIndexStr(dm_rc.tbmvitens.FindField('COFINS').AsString,['01','02','03','04','05','06','07','08','09','49','50','51','52','53','54','55','56','60','61','62','63','64','65','66','67','70','71','72','73','74','75','98','99']) of
//                             0 : CST := cof01;    //01
//                             1 : CST := cof02;    //02
//                             2 : CST := cof03;    //03
//                             3 : CST := cof04;    //04
//                             4 : CST := cof05;    //05
//                             5 : CST := cof06;    //06
//                             6 : CST := cof07;    //07
//                             7 : CST := cof08;    //08
//                             8 : CST := cof09;    //09
//                             9 : CST := cof49;    //49
//                            10 : CST := cof50;    //50
//                            11 : CST := cof51;    //51
//                            12 : CST := cof52;    //52
//                            13 : CST := cof53;    //53
//                            14 : CST := cof54;    //54
//                            15 : CST := cof55;    //55
//                            16 : CST := cof56;    //56
//                            17 : CST := cof60;    //60
//                            18 : CST := cof61;    //61
//                            19 : CST := cof62;    //62
//                            20 : CST := cof63;    //63
//                            21 : CST := cof64;    //64
//                            22 : CST := cof65;    //65
//                            23 : CST := cof66;    //66
//                            24 : CST := cof67;    //67
//                            25 : CST := cof70;    //70
//                            26 : CST := cof71;    //71
//                            27 : CST := cof72;    //72
//                            28 : CST := cof73;    //73
//                            29 : CST := cof74;    //74
//                            30 : CST := cof75;    //75
//                            31 : CST := cof98;    //98
//                            32 : CST := cof99;    //99
//                           end;
//                          vBC        := 0;
//                          pCOFINS    := 0;
//                          vCOFINS    := 0;
//                          vBC        := 0;
//                          pCOFINS    := 0;
//                          vCOFINS    := 0;
//                        end;

                      if (dm_rc.FDQryPessoas.FindField('SITUACAO').AsString = 'Nao Contribuinte') and
                         (not StrContains('7102#',dm_rc.tbmvitens.FindField('OPERACAO').AsString)) and
                         (dm_rc.tbempresas.FindField('ESTADO').AsString <> dm_rc.FDQryPessoas.FindField('ESTADO').AsString)  and
                         (Length(RemoverEspeciais(DM_RC.FDQryPessoas.FindField('CPFCNPJ').AsString)) >= 11) then
                        begin
                          with ICMSUFDest do
                            begin
                              vBCUFDest       := dm_rc.tbmvitens.FindField('TOTAL').AsFloat;
                              vBCFCPUFDest    := dm_rc.tbmvitens.FindField('TOTAL').AsFloat;
                              pFCPUFDest      := 2;
                              pICMSInterPart  := 100;
                              pICMSUFDest     := variif(StrContains('PR#SC#RJ#MG#RS',DM_RC.FDQryPessoas.FindField('ESTADO').AsString),12,7);

                              if StrContains('PR#SC#RS#SP#RJ#MG', DM_RC.FDQryPessoas.FindField('ESTADO').AsString) then
                              begin
                                pICMSInter := 12;
                              end
                              else
                              begin
                                pICMSInter := 7;
                              end;

//                            pICMSInter      := variif(StrContains('PR#SC#RJ#MG#RS',DM_RC.FDQryPessoas.FindField('ESTADO').AsString),12,7);

                              vICMSUFDest     := MRound((DM_RC.tbmvitens.FindField('BASEICMS').AsFloat * pICMSUFDest) / 100,2);
                              vICMSUFRemet    := MRound((DM_RC.tbmvitens.FindField('BASEICMS').AsFloat * pICMSUFDest) / 100,2);
                              vFCPUFDest      := MRound((DM_RC.tbmvitens.FindField('TOTAL').AsFloat * pFCPUFDest) / 100 ,2);
                              base0           := base0 + vICMSUFDest;
                              base1           := base1 + vICMSUFRemet;
                              UFDestino       := UFDestino + vFCPUFDest;
                            end;
                        end
                      else
                        begin
                          with ICMSUFDest do
                            begin
                              vBCUFDest      := 0.00;
                              pFCPUFDest     := 0.00;
                              pICMSUFDest    := 0.00;
                              pICMSInter     := 0.00;
                              pICMSInterPart := 0.00;
                              vICMSUFDest    := 0.00;
                              vICMSUFRemet   := 0.00;
                              base0          := base0 + vICMSUFDest;
                              base1          := base1 + vICMSUFRemet;
                            end;
                        end;
                    end;
                end;
            end;
          dm_rc.tbmvitens.Next;
        end;
      if (dm_rc.fdqrytitulos.RecordCount                          > 0) and
         (dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger <> 2) then
        begin
          with Cobr.Fat do
            begin
              if not StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString) then
                begin
                  nFat  := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;   // NUMERO DA NOTA
                  vOrig := dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat;  // VALOR DA NOTA
                  vLiq  := dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat;  // VALOR DA NOTA
                  vDesc := 0.00;                                           // VALOR DESCONTO
                  //***********************************************************//
                  // INFORMANDO O FINANCEIRO NO XML
                  //***********************************************************//
                  if dm_rc.fdqrytitulos.RecordCount > 0 then
                    begin
                      dm_rc.fdqrytitulos.First;
                      while not dm_rc.fdqrytitulos.Eof  do
                        begin
                          with Cobr.Dup.Add do
                            begin
                              nFat  := dm_rc.fdqrytitulos.FindField('NUMERO').AsString;
                              nDup  := StrZeros(dm_rc.fdqrytitulos.FindField('SEQUENCIA').AsString,3);
                              dVenc := dm_rc.fdqrytitulos.FindField('VENCIMENTO').AsDateTime;
                              vDup  := dm_rc.fdqrytitulos.FindField('VALORATUAL').AsFloat;
                            end;
                          dm_rc.fdqrytitulos.Next;
                        end;
                    end;
                end;
              //***********************************************************//
              // INFORMANDO O TIPO DE PAGAMENTO
              //***********************************************************//
              with pag.new do
               begin
                 if dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 2 then
                   tPag := fpOutro
                 else
                   tPag := variif(StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString),fpOutro,fpDuplicataMercantil);
                 vPag := variif(StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString),fpSemPagamento,dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat);
               end;
            end;
        end
      else
        begin
          with pag.new do
           begin
             tPag := variif(StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString),fpSemPagamento,fpOutro);
             vPag := variif(StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString),0.00,dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat);
           end;
        end;
      InfAdic.infCpl := variif(StrEmpty(dm_rc.FDQryMvmestre.FindField('OBSERVACOES').AsString),'',dm_rc.FDQryMvmestre.FindField('OBSERVACOES').AsString + #10) +
                        variif(StrEmpty(dm_rc.fdqryescritas.FindField('DESCRICAO').AsString),'',dm_rc.fdqryescritas.FindField('DESCRICAO').AsString + #10) +
                        variif(dm_rc.FDQryMvmestre.FindField('VLRICMSDESONERACAO').AsFloat > 0,'VALOR TOTAL DA MERCADORIA COM ICMS R$ ' + FormatFloat('###,###,##0.00',dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat) + #10,'') +
                        variif(dm_rc.FDQryMvmestre.FindField('VLRICMSDESONERACAO').AsFloat > 0,'VALOR DO ABATIMENTO (DEDUÇÃO DO ICMS) INFORMADO NO CAMPO "VICMSDESON" (VALOR ICMS DESONERADO) R$ ' + FormatFloat('###,###,##0.00',dm_rc.FDQryMvmestre.FindField('VLRICMSDESONERACAO').AsFloat) + #10,'') +
                        variif(dm_rc.FDQryPessoas.FindField('PRODUTOR').AsString <> '','Inscrição de Produtor do Cliente : ' + RemoverEspeciais(dm_rc.FDQryPessoas.FindField('PRODUTOR').AsString) + #10,'') +
                        variif(dm_rc.tbempresas.FindField('RENASEM').AsString <> '','RENASEM Nº ' + dm_rc.tbempresas.FindField('RENASEM').AsString + #10,'');

      if vTotBC > 0 then
         begin
           //************************************************************************
           // TOTAL FINAL ACUMULADO DA REFORMA (IBSCBSTot)
           //************************************************************************
           with Total.IBSCBSTot do
             begin
               vBCIBSCBS := vTotBC; // Total da Base de Cálculo
               // ---------------------------------------------
               // TOTAL IBS (Agrupado)
               // ---------------------------------------------
               with gIBS do
               begin
                   // 1. Total da UF (Estado)
                   with gIBSUFTot do
                   begin
                      // Se você não tem uma variável acumuladora vTotIBS_UF,
                      // e sabendo que o Mun é 0.00, então UF é igual ao Total.
                      // Mas o ideal é ter acumulado item a item.
                      vIBSUF := vTotIBS;
                   end;
                   // 2. Total do Município
                   with gIBSMunTot do
                   begin
                      vIBSMun := 0.00; // Como no item foi 0.00, aqui segue 0.00
                   end;
                   // 3. Total Geral do IBS (Soma UF + Mun)
                   vIBS := vTotIBS;
               end;
               // ---------------------------------------------
               // TOTAL CBS (Federal)
               // ---------------------------------------------
               with gCBS do
                 begin
                   vCBS := vTotCBS; // Valor Total da CBS
                 end;
             end;
         end;

      Total.ICMSTot.vST         := dm_rc.FDQryMvmestre.FindField('VLRSUBSTITUICAO').AsFloat;
      Total.ICMSTot.vBCST       := dm_rc.FDQryMvmestre.FindField('VLRBASESUBSTITUICAO').AsFloat;
      Total.ICMSTot.vBC         := dm_rc.FDQryMvmestre.FindField('VLRBASEICMS').AsFloat;
      Total.ICMSTot.vICMS       := dm_rc.FDQryMvmestre.FindField('VLRICMS').AsFloat;
      Total.ICMSTot.vFrete      := dm_rc.FDQryMvmestre.FindField('VLRDSPNTRIBUTADA').AsFloat;
      Total.ICMSTot.vSeg        := 0;
      Total.ICMSTot.vDesc       := MRound(dm_rc.FDQryMvmestre.FindField('VLRDESCONTOS').AsFloat,2);
      Total.ICMSTot.vOutro      := MRound(dm_rc.FDQryMvmestre.FindField('VLRDESPESAS').AsFloat,2);
      Total.ICMSTot.vIPI        := dm_rc.FDQryMvmestre.FindField('VLRIPI').AsFloat;
      Total.ICMSTot.vProd       := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar', 0, dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat);
      Total.ICMSTot.vNF         := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar', 0, dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat);
      Total.ICMSTot.vICMSDeson  := dm_rc.FDQryMvmestre.FindField('VLRICMSDESONERACAO').AsFloat;
      Total.ICMSTot.vFCPUFDest  := UFDestino;
      Total.ICMSTot.vICMSUFDest := base0;
      Total.ICMSTot.vICMSUFRemet:= base1;
      Total.ICMSTot.vPIS        := totpis;
      Total.ICMSTot.vCOFINS     := totcofins;
      Total.ICMSTot.vTotTrib    := Total_Imposto;
    end;
end;

end.



