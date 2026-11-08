unit mkm_clonecomponents; //8.0.0.0

interface

uses
    System.SysUtils, System.Classes ,       System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics,
    Controls,
    // feedback: Mesut from Turkey
    {$ifdef LINUX}
    System.UIConsts,
    {$endif}
    uconsts, uconsts_cfg,
    uniGUIBaseClasses, uniGUIClasses, uniGUITypes, uniGUIJSUtils, Vcl.forms,
    uniComboBox, uniDBComboBox,uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker,  uniListBox, uniDBGrid,
    uniBitBtn, uniButton, uniEdit, UniDBEdit, UniSpeedButton, uniGUIFrame, uniGUIForm,  uniGUIDialogs, Messages, uniMenuButton,
    uniGUIAbstractClasses,  uniGUIApplication, uniPanel, IniFiles, UniImage, uniLabel,  Unipagecontrol,
    uniMemo, uniDBMemo, uniGUIRegClasses, uniDBNavigator, uniScrollBox,
    uniHTMLMemo,
    UniDBRadioGroup, uniRadioButton, uniCheckBox, uniSpinEdit, //
    uniDBCheckBox, uniDBImage, uniDBText, uniHTMLFrame, uniURLFrame;

    procedure rc_CloneVCLComponents(AParent: TWinControl; ASource, ATarget: TComponent);
    procedure rc_CloneUniComponents(pFrame : TObject; ASource: TUniControl; APrefix: string = '');
    procedure rc_NewCloneName( pFrame : TObject; ASource, ANew: TUniControl );
    //
    procedure rc_ComponentVCLToClipboard( AComponent : TComponent );
    function rc_ComponentVCLFromClipboard( Owner :TComponent ) : TComponent;

    procedure rc_ComponentUNIToClipboard( AComponent : TUniControl );
    function rc_ComponentUNIFromClipboard(Owner: TComponent; Parent: TUniControl): TUniControl; overload;
    function rc_HasUniComponentInClipboard: Boolean;

implementation

uses untdm_rc, str_func, mkm_func_web, MainModule, Main, mkm_gridblock, mkm_layout,
  Winapi.Windows;

  // Função para verificar se há um componente UniGUI no clipboard
function rc_HasUniComponentInClipboard: Boolean;
var
  Format: Word;
begin
  Format := RegisterClipboardFormat('UniGUI.Component');
  Result := IsClipboardFormatAvailable(Format);
end;

procedure rc_ComponentUNIToClipboard( AComponent : TUniControl );
var
  Stream: TMemoryStream;
  Format: Word;
  Data: THandle;
  DataPtr: Pointer;
begin
  Stream := TMemoryStream.Create;
  try
    // Desabilitar atualização durante o streaming
    AComponent.BeginUpdate;
    try
      // Salvar o componente em um stream
      Stream.WriteComponent(AComponent);
      Stream.Position := 0;
    finally
      AComponent.EndUpdate;
    end;

    // Registrar um formato personalizado para o clipboard
    Format := RegisterClipboardFormat('UniGUI.Component');

    // Alocar memória global para o stream
    Data := GlobalAlloc(GMEM_MOVEABLE or GMEM_DDESHARE, Stream.Size);
    if Data <> 0 then
    begin
      DataPtr := GlobalLock(Data);
      if DataPtr <> nil then
      begin
        try
          // Copiar o stream para a memória global
          Move(Stream.Memory^, DataPtr^, Stream.Size);

          // Abrir o clipboard e limpar o conteúdo atual
          if OpenClipboard(0) then
          begin
            try
              EmptyClipboard;
              SetClipboardData(Format, Data);
            finally
              CloseClipboard;
            end;
          end
          else
          begin
            GlobalFree(Data);
            raise Exception.Create('Não foi possível abrir o clipboard');
          end;
        finally
          GlobalUnlock(Data);
        end;
      end
      else
      begin
        GlobalFree(Data);
        raise Exception.Create('Não foi possível bloquear a memória global');
      end;
    end
    else
      raise Exception.Create('Não foi possível alocar memória para o clipboard');
  finally
    Stream.Free;
  end;
end;

function rc_ComponentUNIFromClipboard(Owner: TComponent; Parent: TUniControl): TUniControl;
var
  Stream: TMemoryStream;
  Format: Word;
  Data: THandle;
  DataPtr: Pointer;
  Size: Integer;
  Reader: TReader;
  Component: TComponent;
  UniControl: TUniControl;
begin
  Result := nil;
  Stream := TMemoryStream.Create;
  try
    // Obter o formato personalizado do clipboard
    Format := RegisterClipboardFormat('UniGUI.Component');

    // Verificar se o clipboard contém dados no formato esperado
    if OpenClipboard(0) then
    begin
      try
        Data := GetClipboardData(Format);
        if Data <> 0 then
        begin
          Size := GlobalSize(Data);
          if Size > 0 then
          begin
            DataPtr := GlobalLock(Data);
            if DataPtr <> nil then
            begin
              try
                // Redimensionar o stream e copiar os dados
                Stream.SetSize(Size);
                Move(DataPtr^, Stream.Memory^, Size);
                Stream.Position := 0;

                // Criar um novo componente do mesmo tipo
                Reader := TReader.Create(Stream, 4096);
                try
                  // Ler o tipo do componente
                  Reader.ReadRootComponent(nil);
                  Stream.Position := 0;

                  // Ler o componente do stream
                  Component := Reader.ReadRootComponent(nil);

                  // Verificar se é um controle UniGUI
                  if Component is TUniControl then
                  begin
                    UniControl := TUniControl(Component);

                    // Definir o proprietário e o parent
                    //UniControl.Owner := Owner;

                    // Gerar um nome único
                    UniControl.Name := Copy(UniControl.Name, 1,
                      Length(UniControl.Name) - 4) + IntToStr(Random(10000));

                    // Definir o parent (isso vai recriar o controle no lado do cliente)
                    if Parent is TUniContainerPanel then
                      UniControl.Parent := TUniContainerPanel( Parent )
                    else
                    if Parent is TUniScrollBox then
                       UniControl.Parent := TUniScrollBox( Parent );

                    // Definir a posição (geralmente mais baixo que o original)
                    UniControl.Top := UniControl.Top + UniControl.Height + 10;

                    Result := UniControl;
                  end
                  else
                  begin
                    // Se não for um controle UniGUI, liberar o componente
                    Component.Free;
                  end;
                finally
                  Reader.Free;
                end;
              finally
                GlobalUnlock(Data);
              end;
            end;
          end;
        end;
      finally
        CloseClipboard;
      end;
    end;
  finally
    Stream.Free;
  end;
end;

//VCL
function rc_ComponentVCLFromClipboard(Owner: TComponent): TComponent;
var
  Stream: TMemoryStream;
  Format: Word;
  Data: THandle;
  DataPtr: Pointer;
  Size: Integer;
begin
  Result := nil;
  Stream := TMemoryStream.Create;
  try
    // Obter o formato personalizado do clipboard
    Format := RegisterClipboardFormat('Delphi.Component');

    // Verificar se o clipboard contém dados no formato esperado
    if OpenClipboard(0) then
    begin
      try
        Data := GetClipboardData(Format);
        if Data <> 0 then
        begin
          Size := GlobalSize(Data);
          if Size > 0 then
          begin
            DataPtr := GlobalLock(Data);
            if DataPtr <> nil then
            begin
              try
                // Redimensionar o stream e copiar os dados
                Stream.SetSize(Size);
                Move(DataPtr^, Stream.Memory^, Size);
                Stream.Position := 0;

                // Ler o componente do stream
                Result := Stream.ReadComponent(nil);

                // Definir o proprietário do componente
//                if Result <> nil then
//                  Result.Owner := Owner;
              finally
                GlobalUnlock(Data);
              end;
            end;
          end;
        end;
      finally
        CloseClipboard;
      end;
    end;
  finally
    Stream.Free;
  end;
end;

procedure rc_ComponentVCLToClipboard(AComponent: TComponent);
var
  Stream: TMemoryStream;
  Format: Word;
  Data: THandle;
  DataPtr: Pointer;
begin
  Stream := TMemoryStream.Create;
  try
    // Salvar o componente em um stream
    Stream.WriteComponent(AComponent);
    Stream.Position := 0;

    // Registrar um formato personalizado para o clipboard
    Format := RegisterClipboardFormat('Delphi.Component');

    // Alocar memória global para o stream
    Data := GlobalAlloc(GMEM_MOVEABLE or GMEM_DDESHARE, Stream.Size);
    if Data <> 0 then
    begin
      DataPtr := GlobalLock(Data);
      if DataPtr <> nil then
      begin
        try
          // Copiar o stream para a memória global
          Move(Stream.Memory^, DataPtr^, Stream.Size);

          // Abrir o clipboard e limpar o conteúdo atual
          if OpenClipboard(0) then
          begin
            try
              EmptyClipboard;
              SetClipboardData(Format, Data);
            finally
              CloseClipboard;
            end;
          end
          else
          begin
            // Se falhar ao abrir o clipboard, liberar a memória alocada
            GlobalFree(Data);
            raise Exception.Create('Não foi possível abrir o clipboard');
          end;
        finally
          GlobalUnlock(Data);
        end;
      end
      else
      begin
        // Se falhar ao bloquear a memória, liberar a memória alocada
        GlobalFree(Data);
        raise Exception.Create('Não foi possível bloquear a memória global');
      end;
    end
    else
      raise Exception.Create('Não foi possível alocar memória para o clipboard');
  finally
    Stream.Free;
  end;
end;

procedure rc_NewCloneName( pFrame : TObject; ASource, ANew: TUniControl );
begin
   if rc_IsBlock( ASource ) then
   begin
     if pFrame.InheritsFrom(TUniFrame) then
        ANew.Name := 'rcBlock' + ( rc_GetLastBlockSeq( ASource.OwnerWebForm ) + 10 ).ToString
     else
        ANew.Name := 'rcBlock' + ( rc_GetLastBlockSeq( ASource.OwnerForm ) + 10 ).ToString;
   end
   else
     ANew.Name := ASource.Name;
end;

procedure rc_CloneUniComponents(pFrame : TObject; ASource: TUniControl; APrefix: string );
var
  i, j: Integer;
  NewComponent: TUniControl;
  SourceParent: TUniContainer;
  PropList: PPropList;
  PropCount: Integer;
  PropInfo: PPropInfo;
  SourceMethod, TargetMethod: TMethod;
  UniPropName: string;
  ChildControl: TUniControl;
  ChildComponents: TList;
  ClonedChild: TUniControl;
  OriginalName: string;
begin
  // Obter o parent do componente original
  SourceParent := TUniContainer(ASource.Parent);

  if not Assigned(SourceParent) then
  begin
    // Se não tiver parent, não é possível clonar
    Exit;
  end;

  // Prefixo para nome, se não informado, gerar um aleatório
  if APrefix = '' then
    APrefix := 'Clone' + IntToStr(Random(10000)) + '_';

  // Guardar o nome original
  OriginalName := ASource.Name;

  // Criar um novo componente do mesmo tipo
  NewComponent := TUniControlClass(ASource.ClassType).Create(SourceParent);

  try
    // Desabilitar atualização da UI durante a clonagem
    NewComponent.BeginUpdate;

    // Copiar propriedades básicas (exceto Nome, JSName, etc.)
    PropCount := GetPropList(ASource.ClassInfo, tkProperties, nil);
    GetMem(PropList, PropCount * SizeOf(PPropInfo));
    try
      try
         GetPropList(ASource.ClassInfo, tkProperties, PropList);
         for i := 0 to PropCount - 1 do
         begin
           PropInfo := PropList^[i];
           UniPropName := String(PropInfo^.Name);

           // Pular propriedades que não devem ser copiadas
           if (CompareText(UniPropName, 'Name') <> 0) and
              (CompareText(UniPropName, 'JSName') <> 0) and
              (CompareText(UniPropName, 'JSId') <> 0) and
              (CompareText(UniPropName, 'UniParent') <> 0) and
              (CompareText(UniPropName, 'Parent') <> 0) and
              (CompareText(UniPropName, 'Owner') <> 0) then
           begin
             // Copiar a propriedade
             case PropInfo^.PropType^.Kind of
               tkMethod: ; // Pular eventos por enquanto
               tkClass: begin
                 // Cuidado com propriedades de classe para evitar referências cruzadas
                 if not ((GetObjectProp(ASource, PropInfo) is TComponent) and
                        (TComponent(GetObjectProp(ASource, PropInfo)).Owner = ASource)) then
                   SetObjectProp(NewComponent, UniPropName, GetObjectProp(ASource, PropInfo));
               end;
             else
               SetPropValue(NewComponent, UniPropName, GetPropValue(ASource, UniPropName));
             end;
           end;
         end;
      except on e:exception do
  //         begin
  //             ShowMessageN( 'Error: <br>' + 'Source: ' + ASource.Name + '<br>Prop:' + UniPropName + '<br><br>' + e.Message );
  //         end;
      end;
    finally
      FreeMem(PropList);
    end;

    // Gerar nome único para o componente
    rc_NewCloneName( pFrame, ASource, NewComponent );
    //NewComponent.Name := APrefix + OriginalName;

    // Copiar eventos
    PropCount := GetPropList(ASource.ClassInfo, [tkMethod], nil);
    GetMem(PropList, PropCount * SizeOf(PPropInfo));
    try
      try
         GetPropList(ASource.ClassInfo, [tkMethod], PropList);
         for i := 0 to PropCount - 1 do
         begin
           PropInfo := PropList^[i];
           SourceMethod := GetMethodProp(ASource, PropInfo^.Name);
           // Verificar se o evento está atribuído
           if (SourceMethod.Code <> nil) and (SourceMethod.Data <> nil) then
           begin
             // Copiar o evento
             TargetMethod := SourceMethod;
             SetMethodProp(NewComponent, PropInfo^.Name, TargetMethod);
           end;
         end;
      except on e:exception do
  //         begin
  //             ShowMessageN( 'Error: <br>' + 'Source: ' + ASource.Name + '<br>Prop:' + UniPropName + '<br><br>' + e.Message );
  //         end;
      end;
    finally
      FreeMem(PropList);
    end;

    // Posicionar o componente (mesmo left, mas abaixo do original)
    NewComponent.Left := ASource.Left;
    NewComponent.Top := ASource.Top + ASource.Height + 5;
    NewComponent.Parent := SourceParent;

    // Se o componente é um container, verificar e clonar componentes filhos
    if ASource is TUniContainer then
    begin
      // Criar uma lista temporária dos componentes filhos originais
      ChildComponents := TList.Create;
      try
        // Primeiro, coletar todos os componentes filhos
        for i := 0 to TUniContainer(ASource).ControlCount - 1 do
        begin
          ChildControl := TUniControl(TUniContainer(ASource).Controls[i]);
          if ChildControl is TUniControl then
            ChildComponents.Add(ChildControl);
        end;

        // Agora clonar cada filho e configurar seu novo parent
        for i := 0 to ChildComponents.Count - 1 do
        begin
          ChildControl := TUniControl(ChildComponents[i]);

          // Criar uma cópia temporária
          ClonedChild := TUniControlClass(ChildControl.ClassType).Create(TUniContainer(NewComponent));

          // Copiar propriedades do filho
          PropCount := GetPropList(ChildControl.ClassInfo, tkProperties, nil);
          GetMem(PropList, PropCount * SizeOf(PPropInfo));
          try
            try
               GetPropList(ChildControl.ClassInfo, tkProperties, PropList);
               for j := 0 to PropCount - 1 do
               begin
                 PropInfo := PropList^[j];
                 UniPropName := String(PropInfo^.Name);

                 // Pular propriedades que não devem ser copiadas
                 if (CompareText(UniPropName, 'Name') <> 0) and
                    (CompareText(UniPropName, 'JSName') <> 0) and
                    (CompareText(UniPropName, 'JSId') <> 0) and
                    (CompareText(UniPropName, 'UniParent') <> 0) and
                    (CompareText(UniPropName, 'Parent') <> 0) and
                    (CompareText(UniPropName, 'Owner') <> 0) then
                 begin
                   // Copiar a propriedade
                   case PropInfo^.PropType^.Kind of
                     tkMethod: ; // Pular eventos por enquanto
                     tkClass: begin
                       // Cuidado com propriedades de classe
                       if not ((GetObjectProp(ChildControl, PropInfo) is TComponent) and
                              (TComponent(GetObjectProp(ChildControl, PropInfo)).Owner = ChildControl)) then
                         SetObjectProp(ClonedChild, UniPropName, GetObjectProp(ChildControl, PropInfo));
                     end;
                   else
                     SetPropValue(ClonedChild, UniPropName, GetPropValue(ChildControl, UniPropName));
                   end;
                 end;
               end;
            except on e:exception do
        //         begin
        //             ShowMessageN( 'Error: <br>' + 'Source: ' + ASource.Name + '<br>Prop:' + UniPropName + '<br><br>' + e.Message );
        //         end;
            end;
          finally
            FreeMem(PropList);
          end;

          // Nome único para o filho
          ClonedChild.Name := APrefix + ChildControl.Name;

          // Copiar eventos do filho
          PropCount := GetPropList(ChildControl.ClassInfo, [tkMethod], nil);
          GetMem(PropList, PropCount * SizeOf(PPropInfo));
          try
            GetPropList(ChildControl.ClassInfo, [tkMethod], PropList);
            for j := 0 to PropCount - 1 do
            begin
              PropInfo := PropList^[j];
              SourceMethod := GetMethodProp(ChildControl, PropInfo^.Name);
              // Verificar se o evento está atribuído
              if (SourceMethod.Code <> nil) and (SourceMethod.Data <> nil) then
              begin
                // Copiar o evento
                TargetMethod := SourceMethod;
                SetMethodProp(ClonedChild, PropInfo^.Name, TargetMethod);
              end;
            end;
          finally
            FreeMem(PropList);
          end;

          // Definir o pai do componente clonado
          ClonedChild.Parent := TUniContainer(NewComponent);

          // Se o filho for um container, fazer chamada recursiva
          if ChildControl is TUniContainer then
          begin
            // Recursivamente clonar os filhos deste container
            for j := 0 to TUniContainer(ChildControl).ControlCount - 1 do
            begin
              if TUniContainer(ChildControl).Controls[j] is TUniControl then
              begin
                // Aqui só precisamos do prefixo, pois já copiamos a estrutura básica
                rc_CloneUniComponents( pFrame, TUniControl( TUniContainer( ChildControl ).Controls[j] ), APrefix );
              end;
            end;
          end;
        end;
      finally
        ChildComponents.Free;
      end;
    end;

  finally
    // Reativar atualização da UI
    NewComponent.EndUpdate;
  end;
end;

//VCL
procedure rc_CloneVCLComponents(AParent: TWinControl; ASource, ATarget: TComponent);
var
  i: Integer;
  NewComponent: TComponent;
  PropList: PPropList;
  PropCount: Integer;
  PropInfo: PPropInfo;
  SourceMethod, TargetMethod: TMethod;
begin
  // Criar um novo componente do mesmo tipo
  NewComponent := TComponentClass(ASource.ClassType).Create(AParent);

  // Copiar propriedades básicas (exceto Name)
  PropCount := GetPropList(ASource.ClassInfo, tkProperties, nil);
  GetMem(PropList, PropCount * SizeOf(PPropInfo));
  try
    try
       GetPropList(ASource.ClassInfo, tkProperties, PropList);
       for i := 0 to PropCount - 1 do
       begin
         PropInfo := PropList^[i];
         // Pular a propriedade Name para evitar conflitos
         if ( CompareText(PropInfo^.Name, 'Name') <> 0 ) then
         begin
           // Copiar a propriedade
           case PropInfo^.PropType^.Kind of
             tkMethod: ; // Pular eventos por enquanto
           else
             SetPropValue(NewComponent, PropInfo^.Name, GetPropValue(ASource, PropInfo^.Name));
           end;
         end;
       end;
    except on e:exception do
//         begin
//             ShowMessageN( 'Error: <br>' + 'Source: ' + ASource.Name + '<br>Prop:' + UniPropName + '<br><br>' + e.Message );
//         end;
    end;
  finally
    FreeMem(PropList);
  end;

  // Gerar um nome único
  NewComponent.Name := ASource.Name + IntToStr(Random(1000));

  // Copiar eventos
  PropCount := GetPropList(ASource.ClassInfo, [tkMethod], nil);
  GetMem(PropList, PropCount * SizeOf(PPropInfo));
  try
    try
       GetPropList(ASource.ClassInfo, [tkMethod], PropList);
       for i := 0 to PropCount - 1 do
       begin
         PropInfo := PropList^[i];
         SourceMethod := GetMethodProp(ASource, PropInfo^.Name);
         // Verificar se o evento está atribuído
         if (SourceMethod.Code <> nil) and (SourceMethod.Data <> nil) then
         begin
           // Copiar o evento
           TargetMethod := SourceMethod;
           SetMethodProp(NewComponent, PropInfo^.Name, TargetMethod);
         end;
       end;
    except on e:exception do
//         begin
//             ShowMessageN( 'Error: <br>' + 'Source: ' + ASource.Name + '<br>Prop:' + UniPropName + '<br><br>' + e.Message );
//         end;
    end;
  finally
    FreeMem(PropList);
  end;

  // Posicionar o componente
  if NewComponent is TUniControl then
  begin
    TUniControl(NewComponent).Left := TUniControl(ASource).Left;
    TUniControl(NewComponent).Top := TUniControl(ASource).Top + TUniControl(ASource).Height + 5;
    TUniControl(NewComponent).Parent := AParent;
  end;
end;

end.
