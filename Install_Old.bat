@echo off
chcp 65001 > nul
:welcome

color 3
echo:      ___  _____                                                   _=====_                               _=====_
echo:    .'/,-Y'     '~-.                                              / _____ \                             / _____ \
echo:    l.Y             ^.                                           +.-'_____'-.--------------------------.-' _____'-.+
echo:    /\               _\_       Script: Package-Installer       /   ^|     ^|  '.        S O N Y        .'  ^|  _  ^|   \
echo:   i            ___/'   '\         Author: N.Kovalev          / ___^| /^|\ ^|___ \                     / ___^| /_\ ^|___ \
echo:   ^|          /'   '\   o ^|        Version: Alpha 0.0.1      / ^|      ^|      ^| ;   __          _   ; ^| _         _ ^| ;
echo:   l         ^|     o ^|__./                                   ^| ^| ^<---   ---^> ^| ^|  ^|__^|        ^|_:^> ^| ^|^|_^|       (_)^| ^|
echo:    \ _  _    \.___./    '~\                                 ^| ^|___   ^|   ___^| ; SELECT      ^START ; ^|___       ___^| ;
echo:     X \/ \            ___./                                 ^|\    ^| \^|/ ^|    /  _     ___      _   \    ^| (X) ^|    /^|
echo:    ( \ ___.   _..--~~'   ~`-.                               ^| \   ^|_____^|  .','" "', ^|___^|  ,'" "', '.  ^|_____^|  .' ^|
echo:     ` Z,--   /               \                              ^|  '-.______.-' /       \ANALOG/       \  '-._____.-'   ^|
echo:       \__.  (   /       ______)                             ^|               ^|       ^|------^|       ^|                ^|
echo:         \   l  /-----~~' /                                  ^|              /\       /      \       /\               ^|
echo:          Y   \          /                                   ^|             /  '.___.'        '.___.'  \              ^|
echo:          ^|   \x_______.                                     ^|            /                            \             ^|
echo:          ^|           \                                       \          /                              \           /
echo:          j            Y                                       \________/                                \_________/  
goto start

:start
echo Hello!
echo ---------------------------------------------------------------------------------------------------------------
echo This is my Install-Script!
echo Wählen Sie unten die Option, welchen Sie ausführen möchten. Um zu bestätigen drücken Sie danach Enter!
echo ---------------------------------------------------------------------------------------------------------------
echo:
echo 1. = VS-Code mit Erweiterungen installieren
echo 2. = Windows nach Apps Updates prüfen und installieren
echo 3. = Andere Apps installieren die man gerne möchte.
echo 4. = Script beenden
echo:
echo:
set /p option=Option auswählen:
echo:
if %option% == 1 (
  cls
  echo Bitte warten der Prozess ist aktiviert...
  goto winget
) else if %option% == 2 (
  cls
  goto winget
) else if %option% == 3 (
  cls
  goto nwpgs ::NewPrograms
) else if %option% == 4 (
  goto stop
) else (
  cls
  echo Falsche Option ausgewählt!!
  echo Drücken Sie Enter um zurück auf die Option zugreifen!
  pause > nul
  cls
  goto welcome
)

:winget
set "winGet=%ProgramFiles%\WindowsApps\Microsoft.DesktopAppInstaller_*"
if exist "%winGet%" (
  echo WinGet found, skipping installation.
  timeout /t 2 /nobreak > nul
  if %option% == 1 (
    goto vs
  ) else if %option% == 2 (
    goto winget_update
  ) else if %option% == 3 (
    goto ::::::::::::::::::::::::::::::::
  )
) else (
  echo WinGet not found, installing...
  timeout /t 2 /nobreak
  powershell.exe -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -OutFile C:\Users\%username%\WinGet.msixbundle"
  powershell.exe -ExecutionPolicy Bypass -Command "Add-AppxPackage C:\Users\%username%\WinGet.msixbundle"
  if errorlevel neq 0 (
    echo Error_Code: "0x6001a2"
    Install.bat > log.txt 2>&1 || start cmd /k "type log.txt && pause"
    goto error
  )
)
timeout /t 2 /nobreak
if %option% == 1 (
    goto vs
) else if %option% == 2 (
    goto winget_update
)

:winget_update
winget list
echo:
echo:
set /p continue=Sollen wir fortfahren? (j / n)
if /i "%continue%" neq "j" goto stop
winget update --all
echo Glückwunsch, es wurde alles installiert ohne Fehler
pause > nul
exit





:nwpgs
for /l %%f in (0 1 100) do (
    call :drawProgressBar %%f "Loading..."
)
for /l %%f in (100 1 100) do (
    echo.
    echo Finish
    pause > nul
)

rem Clean all after use
call :finalizeProgressBar 1

exit /b

pause > nul
exit







:vs
echo Lösche das Installation-Packet des WinGet
del "C:\Users\%username%\WinGet.msixbundle"
cls
echo Installiere VS Code...
winget install --id=Microsoft.VisualStudioCode -e
echo Es geht weiter...
timeout /t 2 /nobreak > nul
goto vs_check

:vs_check
if exist "C:\Users\%username%\AppData\Local\Programs\Microsoft VS Code\Code.exe" (
  echo VS Code ist installiert.
  echo:
  echo Es geht weiter mit Erweiterungen für das VS Code...
  timeout /t 2 /nobreak > nul
  goto vs_exten
) else (
  echo VS Code wurde nicht installiert.
  echo:
  echo Error_Code: "0x6001a2"
  goto error
)

::Extension for VS Code
:vs_exten
cls
echo.
echo.
echo Installing VS Code Extensions...
call code --install-extension aaron-bond.better-comments --force
call code --install-extension streetsidesoftware.code-spell-checker --force
call code --install-extension MS-CEINTL.vscode-language-pack-de --force
call code --install-extension silofy.hackthebox --force
call code --install-extension oderwat.indent-rainbow --force
call code --install-extension yandeu.five-server --force
call code --install-extension PKief.material-icon-theme --force
call code --install-extension leonardotrevisan.lang-code-support --force
echo Done.
cls
echo:
goto open_vs

:open_vs
echo Glückwunsch es wurde alles einwandfrei installiert und konfiguriert.
set /p answer=Wollen Sie das VS Code starten, welches installiert wurde? (j / n):
if /i "%answer%" neq "j" goto ok
echo Bitte warten das Programm wird gestartet...
timeout /t 2 /nobreak > nul
start "" "C:\Users\nikas\AppData\Local\Programs\Microsoft VS Code\Code.exe"
exit

:stop
echo Sie haben Nein ausgewählt, das Install-Script wird somit beendet!!!
pause
exit

:ok
echo OK!!!
pause
exit

:error
cls
echo Das Programm hat einen Fehler erkannt, führen Sie bitte den Install-Script erneut aus!!!
set /p answer=Möchtest du den Script erneut ausführen? (j / n) 
if /i "%answer%" neq "j" goto stop
goto installer

if errorlevel neq 0 (
  echo Es ist ein Fehler aufgetreten. Fehlercode: %errorlevel%
  pause
)


setlocal enableextensions disabledelayedexpansion
:drawProgressBar value [text]
    if "%~1"=="" goto :eof
    if not defined pb.barArea call :initProgressBar
    setlocal enableextensions enabledelayedexpansion
    set /a "pb.value=%~1 %% 101", "pb.filled=pb.value*pb.barArea/100", "pb.dotted=pb.barArea-pb.filled", "pb.pct=1000+pb.value"
    set "pb.pct=%pb.pct:~-3%"
    if "%~2"=="" ( set "pb.text=" ) else ( 
        set "pb.text=%~2%pb.back%" 
        set "pb.text=!pb.text:~0,%pb.textArea%!"
    )
    setlocal enabledelayedexpansion
    set "output="
    for /l %%i in (1, 2, %pb.barArea%) do (
        if %%i LEQ !pb.filled! (
            set "output=!output!#!"
        ) else (
            set "output=!output! "
        )
    )
    <nul set /p "pb.prompt=[!output!][ %pb.pct% ] %pb.text%!pb.cr!"
    endlocal
    endlocal
    goto :eof

:initProgressBar [fillChar] [dotChar]
    if defined pb.cr call :finalizeProgressBar
    for /f %%a in ('copy "%~f0" nul /z') do set "pb.cr=%%a"
    if "%~1"=="" ( set "pb.fillChar=#" ) else ( set "pb.fillChar=%~1" )
    if "%~2"=="" ( set "pb.dotChar=." ) else ( set "pb.dotChar=%~2" )
    set "pb.console.columns="
    for /f "tokens=2 skip=4" %%f in ('mode con') do if not defined pb.console.columns set "pb.console.columns=%%f"
    set /a "pb.barArea=pb.console.columns/2-2", "pb.textArea=pb.barArea-9"
    setlocal enableextensions enabledelayedexpansion
    set "pb.fill="
    for /l %%p in (1 1 %pb.barArea%) do set "pb.fill=!pb.fill!%pb.fillChar%"
    set "pb.dots=!pb.fill:%pb.fillChar%=%pb.dotChar%!"
    set "pb.back=!pb.fill:~0,%pb.textArea%!
    set "pb.back=!pb.back:%pb.fillChar%= !"
    endlocal & set "pb.fill=%pb.fill%" & set "pb.dots=%pb.dots%" & set "pb.back=%pb.back%"
    goto :eof

:finalizeProgressBar [erase]
    if defined pb.cr (
        if not "%~1"=="" (
            setlocal enabledelayedexpansion
            set "pb.back="
            for /l %%p in (1 1 %pb.console.columns%) do set "pb.back=!pb.back! "
            <nul set /p "pb.prompt=!pb.cr!!pb.back:~1!!pb.cr!"
            endlocal
        )
    )
    for /f "tokens=1 delims==" %%v in ('set pb.') do set "%%v="
    goto :eof