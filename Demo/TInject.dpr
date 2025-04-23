program TInject;

uses
  Vcl.Forms,
  Windows,
  uTInject.ConfigCEF,
  u_principal in 'u_principal.pas', System.IniFiles, System.SysUtils {frmPrincipal};

{$R *.res}

var
  vCaminhoBin : String;
  aIni: TInifile;
begin
  {##########################################################################################
  Colocar arquivos CEFLib junto a pasta binária da aplicação (Nao definir ou passar vazio)
  Caso deseja informar.. segue exemplo abaixo
  ##########################################################################################}

//  vCaminhoBin := 'D:\FontesSVN\Diversos\TInject-corporate\Demo\BIN\CEF';
//
//  GlobalCEFApp.PathLogFile          := '';
//  GlobalCEFApp.PathFrameworkDirPath := vCaminhoBin;
//  GlobalCEFApp.PathResourcesDirPath := vCaminhoBin;
//  GlobalCEFApp.PathLocalesDirPath   := vCaminhoBin + '\CEF\locales';
//  GlobalCEFApp.Pathcache            := vCaminhoBin + '\CEF\Cache';
//  GlobalCEFApp.PathUserDataPath     := vCaminhoBin + '\User Data';

  //Forma 1 GlobalCEFApp.Pathxx       := '';                      //Irá procura procurar o Arquivo PADRAO no mesmo local do EXE
  //Forma 2 GlobalCEFApp.Pathxx       := 'C:\Componentes\demo\bin'; //<-  NOME do ARQUIVO INFORMADO
  //Forma 3 GlobalCEFApp.Pathxx       := 'BIN';                     //<-  NOME do ARQUIVO INFORMADO
  //Forma 4 GlobalCEFApp.Pathx         := '..\Source\;              //<-  NOME do ARQUIVO INFORMADO
  //Exemplo se aplica para todos os PATH

  try
    aIni  := Tinifile.Create(ExtractFilePath(Application.ExeName) + 'ConfTInject.ini');

    aIni.WriteString('Path Defines', 'FrameWork', ExtractFilePath(Application.ExeName) + 'CEF');
    aIni.WriteString('Path Defines', 'Binary', ExtractFilePath(Application.ExeName) + 'CEF');
    aIni.WriteString('Path Defines', 'Locales', ExtractFilePath(Application.ExeName) + 'CEF\locales');
    aIni.WriteString('Path Defines', 'Cache', ExtractFilePath(Application.ExeName) + 'CEF\cache');
    aIni.WriteString('Path Defines', 'Data User', ExtractFilePath(Application.ExeName) + 'CEF\User Data');
    aIni.WriteString('Path Defines', 'Log Console', ExtractFilePath(Application.ExeName) + 'CEF\LogTinject\');
    aIni.WriteString('Path Defines', 'Log File', ExtractFilePath(Application.ExeName) + 'CEF');
    aIni.WriteString('Path Defines', 'Auto Receiver attached Path', ExtractFilePath(Application.ExeName) + 'CEF');

  finally
    aIni.Free;
  end;

  GlobalCEFApp.DisableComponentUpdate := true; //Se você desativar a atualização do componente, ainda poderá distribuir os binários Widevine mais recentes com o instalador do aplicativo para reproduzir parte do conteúdo protegido. Widevine é usado para reproduzir conteúdo de mídia protegido com DRM.

  If not GlobalCEFApp.StartMainProcess then
     Exit;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;

end.
