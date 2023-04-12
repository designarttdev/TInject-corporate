program TInject;

uses
  Vcl.Forms,
  Windows,
  uTInject.ConfigCEF,
  u_principal in 'u_principal.pas' {frmPrincipal};

{$R *.res}

begin
  {##########################################################################################
  Colocar arquivos CEFLib junto a pasta bin�ria da aplica��o (Nao definir ou passar vazio)
  Caso deseja informar.. segue exemplo abaixo
  ##########################################################################################}

//  GlobalCEFApp.PathLogFile          := '';
//  GlobalCEFApp.PathFrameworkDirPath := 'C:\Componentes\WhatsApp\Comp\BIN';
//  GlobalCEFApp.PathResourcesDirPath := 'C:\Componentes\WhatsApp\Comp\BIN';
//  GlobalCEFApp.PathLocalesDirPath   := 'C:\Componentes\WhatsApp\Comp\BIN\locales';
//  GlobalCEFApp.Pathcache            := 'C:\Componentes\WhatsApp\Comp\BIN\Cache';
//  GlobalCEFApp.PathUserDataPath     := 'C:\Componentes\WhatsApp\Comp\BIN\User Data';

  //Forma 1 GlobalCEFApp.Pathxx       := '';                      //Ir� procura procurar o Arquivo PADRAO no mesmo local do EXE
  //Forma 2 GlobalCEFApp.Pathxx       := 'C:\Componentes\demo\bin'; //<-  NOME do ARQUIVO INFORMADO
  //Forma 3 GlobalCEFApp.Pathxx       := 'BIN';                     //<-  NOME do ARQUIVO INFORMADO
  //Forma 4 GlobalCEFApp.Pathx         := '..\Source\;              //<-  NOME do ARQUIVO INFORMADO
  //Exemplo se aplica para todos os PATH

  GlobalCEFApp.DisableComponentUpdate := true; //Se voc� desativar a atualiza��o do componente, ainda poder� distribuir os bin�rios Widevine mais recentes com o instalador do aplicativo para reproduzir parte do conte�do protegido. Widevine � usado para reproduzir conte�do de m�dia protegido com DRM.

  If not GlobalCEFApp.StartMainProcess then
     Exit;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;

end.
