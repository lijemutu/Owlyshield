; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define AppId "8C19967B-1D27-4E6A-85CD-5059912C2788"
#define AppName "Owlyshield Ransom Community"
#define AppVersion "0.1.0"
#define AppPublisher "SitInCloud"
#define AppURL "https://www.owlyshield.com/"
#define AgentName "Owlyshield Service"
#define FsFilter "OwlyshieldRansomFilter"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={#AppId}
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
DefaultDirName={commonpf64}\{#AppName}
DefaultGroupName={#AppName}
PrivilegesRequired=admin
OutputDir=.
OutputBaseFilename=owlyshield-ransom-community
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64 arm64 ia64
InfoAfterFile=README.txt

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "fr"; MessagesFile: "compiler:Languages\French.isl"

[Files]
Source: "..\owlyshield_minifilter\x64\Debug\{#FsFilter}\*"; DestDir: "{app}\{#FsFilter}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\owlyshield_predict\target\release\owlyshield_ransom.exe"; DestDir: "{app}\{#AgentName}"; Flags: ignoreversion
Source: "..\owlyshield_predict\moonfire-tflite\lib\tensorflowlite_c.dll"; DestDir: "{app}\{#AgentName}"; Flags: ignoreversion 64bit
Source: "..\rust_win_toast\target\release\RustWindowsToast.exe"; DestDir: "{app}\utils"; Flags: ignoreversion 64bit
Source: "..\owlyshield_minifilter\x64\Debug\{#FsFilter}\{#FsFilter}.sys"; DestDir: "{sys}\drivers"; Flags: ignoreversion 64bit
Source: "logo.ico"; DestDir: "{app}"; Flags: ignoreversion 64bit
Source: "exclusions.txt"; DestDir: "{app}\config"; Flags: ignoreversion 64bit
Source: "README.txt"; DestDir: "{app}"; Flags: ignoreversion 64bit

[Dirs]
Name: "{app}\debug";
Name: "{app}\utils";
Name: "{app}\config"; Flags: uninsneveruninstall;
Name: "{app}\config\threats"; Flags: uninsneveruninstall;

[Icons]
Name: "{group}\{cm:UninstallProgram,{#AppName}}"; Filename: "{uninstallexe}"
Name: "{group}\{#AppName}"; Filename: "{app}\{#AgentName}\owlyshield_ransom.exe"; IconFilename: "{app}\logo.ico"; AppUserModelID: "{#AppId}"; AppUserModelToastActivatorCLSID: "{#AppId}"

[Registry]
Root: HKLM64; Subkey: "Software\Owlyshield"; ValueType: string; ValueName: "NUM_VERSION"; ValueData: {#AppVersion}; Flags: uninsdeletekey
Root: HKLM64; Subkey: "Software\Owlyshield"; ValueType: string; ValueName: "DEBUG_PATH"; ValueData: "{app}\debug"; Flags: uninsdeletekey
Root: HKLM64; Subkey: "Software\Owlyshield"; ValueType: string; ValueName: "UTILS_PATH"; ValueData: "{app}\utils"; Flags: uninsdeletekey
Root: HKLM64; Subkey: "Software\Owlyshield"; ValueType: string; ValueName: "CONFIG_PATH"; ValueData: "{app}\config"; Flags: uninsdeletekey
Root: HKLM64; Subkey: "Software\Owlyshield"; ValueType: string; ValueName: "APP_ID"; ValueData: {#AppId}; Flags: uninsdeletekey

[Run]
Filename: "RUNDLL32.EXE"; Parameters: "SETUPAPI.DLL,InstallHinfSection DefaultInstall 132 {app}\{#FsFilter}\{#FsFilter}.inf"; Flags: runhidden
Filename: "xcopy.exe"; Parameters: """C:\Windows\SysWOW64\drivers\{#FsFilter}.sys"" ""C:\Windows\System32\drivers"" /y"; Flags: runhidden
Filename: "sc.exe"; Parameters: "create ""{#AgentName}"" binPath= ""{app}\{#AgentName}\owlyshield_ransom.exe"""; Flags: runhidden
Filename: "sc.exe"; Parameters: "config ""{#AgentName}"" depend= {#FsFilter}"; Flags: runhidden
Filename: "sc.exe"; Parameters: "config ""{#AgentName}"" start= auto"; Flags: runhidden
Filename: "sc.exe"; Parameters: "start ""{#FsFilter}"""; Flags: runhidden
Filename: "sc.exe"; Parameters: "start ""{#AgentName}"""; Flags: runhidden
Filename: "sc.exe"; Parameters: "query ""{#AgentName}"""; Flags: runhidden

[UninstallRun]
Filename: "sc.exe"; Parameters: "stop ""{#AgentName}"""
Filename: "sc.exe"; Parameters: "stop ""{#FsFilter}"""
Filename: "sc.exe"; Parameters: "delete ""{#AgentName}"""
Filename: "sc.exe"; Parameters: "delete ""{#FsFilter}"""
Filename: "del.exe"; Parameters: """C:\Windows\System32\drivers\{#FsFilter}.sys"""
