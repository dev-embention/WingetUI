; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "WingetUI"
#define MyAppVersion "1.1"
#define MyAppPublisher "SomePythonThings"
#define MyAppURL "https://www.somepythonthings.tk/"
#define MyAppExeName "WingetUI.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{889610CC-4337-4BDB-AC3B-4F21806C0BDD}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName="{autopf}\WingetUI"
DisableProgramGroupPage=yes     
CloseApplications=no
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
OutputBaseFilename=WingetUI Installer
SetupIconFile=Y:\WinGetUI-Store\wingetui\icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=classic      
WizardImageFile=Y:\WingetUI-Store\INSTALLER.BMP
DisableWelcomePage=no


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
[Code]
procedure InitializeWizard;
begin
  WizardForm.Bevel.Visible := False;
  WizardForm.Bevel1.Visible := True;
end;

procedure TaskKill(FileName: String);
var
  ResultCode: Integer;
begin
    Exec('taskkill.exe', '/f /im ' + '"' + FileName + '"', '', SW_HIDE,
     ewWaitUntilTerminated, ResultCode);
end;
[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "Y:\WinGetUI-Store\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion; BeforeInstall: TaskKill('WingetUI Store.exe')
Source: "Y:\WinGetUI-Store\remove-old.cmd"; DestDir: "{app}"; Flags: deleteafterinstall                                                 
Source: "Y:\WinGetUI-Store\install_scoop.cmd"; DestDir: "{app}"; Flags: deleteafterinstall  
Source: "Y:\WinGetUI-Store\vcredist.exe"; DestDir: "{app}"; Flags: deleteafterinstall
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\remove-old.cmd"; Flags: runhidden   
Filename: "{app}\install_scoop.cmd"; Flags: runhidden
Filename: "{app}\vcredist.exe"; Flags: runhidden; Parameters: "/install /passive /norestart"
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall

