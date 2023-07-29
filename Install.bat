@echo off
chcp 65001 > nul
REM Überprüfen der Administratorrechte
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM Überprüfen der Administratorrechte
if %errorlevel% neq 0 (
    echo Das Skript erfordert Administratorrechte.
    echo Bitte starte das Skript als Administrator.
    pause
    exit /b
)

setlocal enabledelayedexpansion
REM Deutsch
set "D[1]=Hallo!"
set "D[2]=Das ist mein Installation-Script"
set "D[3]=Wählen Sie unten die Option, welchen Sie ausführen möchten."
set "D[4]=VS-Code mit Erweiterungen installieren"
set "D[5]=Windows nach Apps Updates prüfen und installieren"
set "D[6]=Andere Apps installieren die man gerne möchte."
set "D[7]=Script beenden"
set "D[8]=Bitte warten der Prozess ist aktiviert..."
set "D[9]=Sie haben Nein ausgewählt, das Install-Script wird somit beendet!!!"
set "D[10]=Bitte warten das Programm wird gestartet..."
set "D[11]=Wollen Sie das VS Code starten, welches gerade installiert wurde?"
set "D[12]=Glückwunsch es wurde alles einwandfrei installiert und konfiguriert."
set "D[13]=VS Code wurde nicht installiert."
set "D[14]=Es geht weiter mit Erweiterungen für das VS Code..."
set "D[15]=VS Code ist installiert."
set "D[16]=Installiere VS Code..."
set "D[17]=Lösche das Installation-Packet des WinGet"
set "D[18]=Glückwunsch, es wurde alles installiert - Fehlerfrei!"
set "D[19]=Sollen wir fortfahren?"
set "D[20]=Falsche Option ausgewählt!!"
set "D[21]=Drücken Sie Enter um zurück auf die Option zugreifen!"
set "D[22]=Das Programm hat einen Fehler erkannt, führen Sie bitte den Install-Script erneut aus!!!"
set "D[23]=Möchtest du den Script erneut ausführen?"
set "D[24]=(y / n)"
set "D[25]=Es ist ein Fehler aufgetreten. Fehlercode:"
set "D[26]=Es geht weiter..."
set "D[27]=VS-Codeerweiterungen werden installiert..."

REM English
set "E[1]=Hello!"
set "E[2]=This is my installation script"
set "E[3]=Select below which one you want to run."
set "E[4]=Install VS Code with extensions"
set "E[5]=Check Windows for apps updates and install"
set "E[6]=Install other apps you want."
set "E[7]=End Script"
set "E[8]=Please wait the process is activated..."
set "E[9]=You have selected No, so the install script will be terminated!!!"
set "E[10]=Please wait, the program is starting..."
set "E[11]=Do you want to start the VS Code that was just installed?"
set "E[12]=Congratulations, everything was installed and configured correctly."
set "E[13]=VS Code was not installed."
set "E[14]=Continue with enhancements for VS Code..."
set "E[15]=VS Code is installed."
set "E[16]=Installing VS Code..."
set "E[17]=Delete the WinGet installation package"
set "E[18]=Congratulations, everything was installed - no errors!"
set "E[19]=Shall we continue?"
set "E[20]=Wrong option selected!!"
set "E[21]=Press Enter to access the option back!"
set "E[22]=The program has detected an error, please run the install script again!!!"
set "E[23]=Do you want to run the script again?"
set "E[24]=(y / n)"
set "E[25]=There has been an error. Error code:"
set "E[26]=It goes on..."
set "E[27]=Installing VS Code Extensions..."

REm Russisch
set "R[1]=Привет!"
set "R[2]=Это мой скрипт установки"
set "R[3]=Выберите ниже, какой из них вы хотите запустить."
set "R[4]=Установить код VS c расширениями"
set "R[5]=Проверить Windows на наличие обновлений приложений и установить"
set "R[6]=Установите другие приложения, которые вы хотите."
set "R[7]=Конец сценария"
set "R[8]=Пожалуйста, подождите, процесс активируется..."
set "R[9]=Вы выбрали Нет, поэтому сценарий установки будет прерван!!!"
set "R[10]=Подождите, программа запускается..."
set "R[11]=Вы хотите запустить только что установленный код VS?"
set "R[12]=Поздравляем, все установлено и настроено правильно."
set "R[13]=VS Code не был установлен"
set "R[14]=Продолжить с улучшениями для VS Code..."
set "R[15]=VS Code установлен"
set "R[16]=Установка кода VS..."
set "R[17]=Удалить установочный пакет WinGet"
set "R[18]=Поздравляем, все установилось - ошибок нет!"
set "R[19]=Давайте продолжим?"
set "R[20]=Выбран неверный вариант!!"
set "R[21]=Нажмите Enter, чтобы вернуться к опции!"
set "R[22]=Программа обнаружила ошибку, запустите скрипт установки еще раз!!!"
set "R[23]=Вы хотите снова запустить скрипт?"
set "R[24]=(y / n)"
set "R[25]=Там была ошибка. Код ошибки:"
set "R[26]=Итак, продолжим..."
set "R[27]=Установка расширений VS Code..."

REM Japanisch
set "J[1]=こんにちは!」を設定します。"
set "J[2]=これは私のインストール スクリプトです"
set "J[3]=実行するものを選択してください。"
set "J[4]=拡張機能付きの VS Code をインストールする"
set "J[5]=Windows でアプリのアップデートを確認してインストールする"
set "J[6]=必要な他のアプリをインストールします。"
set "J[7]=スクリプト終了"
set "J[8]=プロセスがアクティブになるまでお待ちください..."
set "J[9]=いいえを選択したため、インストール スクリプトは終了します!!!"
set "J[10]=お待ちください、プログラムが開始中です..."
set "J[11]=インストールしたばかりの VS Code を起動しますか?"
set "J[12]=おめでとうございます。すべてが正しくインストールされ、構成されました。"
set "J[13]=VS コードがインストールされていません。"
set "J[14]=VS Code の拡張を続行..."
set "J[15]=VS コードがインストールされています。"
set "J[16]=VS Code をインストール中..."
set "J[17]=WinGet インストール パッケージを削除する"
set "J[18]=おめでとうございます。すべてがインストールされました - エラーはありません!"
set "J[19]=続けましょうか?"
set "J[20]=選択されたオプションが間違っています!!"
set "J[21]=戻るオプションにアクセスするには Enter を押してください!"
set "J[22]=プログラムがエラーを検出しました。インストール スクリプトをもう一度実行してください!!!"
set "J[23]=スクリプトを再度実行しますか?"
set "J[24]=( y | n )"
set "J[25]=エラーが発生しました。 エラーコード："
set "J[26]=それは続きます..."
set "J[27]=VS Code 拡張機能をインストールしています..."

REM Indonesisch
set "I[1]=Halo!"
set "I[2]=Ini skrip instalasi saya"
set "I[3]=Pilih di bawah mana yang ingin Anda jalankan."
set "I[4]=Instal Kode VS dengan ekstensi"
set "I[5]=Periksa Windows untuk pembaruan aplikasi dan instal"
set "I[6]=Instal aplikasi lain yang Anda inginkan."
set "I[7]=Akhiri Skrip"
set "I[8]=Harap tunggu proses diaktifkan..."
set "I[9]=Anda telah memilih Tidak, jadi skrip pemasangan akan dihentikan!!!"
set "I[10]=Harap tunggu, program sedang dimulai..."
set "I[11]=Apakah Anda ingin memulai Kode VS yang baru saja diinstal?"
set "I[12]=Selamat, semuanya telah diinstal dan dikonfigurasi dengan benar."
set "I[13]=Kode VS tidak diinstal."
set "I[14]=Lanjutkan dengan penyempurnaan untuk Kode VS..."
set "I[15]=Kode VS diinstal."
set "I[16]=Memasang Kode VS..."
set "I[17]=Hapus paket instalasi WinGet"
set "I[18]=Selamat, semuanya telah terpasang - tidak ada kesalahan!"
set "I[19]=Haruskah kita melanjutkan?"
set "I[20]=Pilihan salah dipilih!!"
set "I[21]=Tekan Enter untuk mengakses opsi kembali!"
set "I[22]=Program telah mendeteksi kesalahan, harap jalankan skrip instal lagi!!!"
set "I[23]=Apakah Anda ingin menjalankan skrip lagi?"
set "I[24]=(y / n)"
set "I[25]=Telah terjadi kesalahan. kode kesalahan:"
set "I[26]=Ini berlanjut..."
set "I[27]=Memasang Ekstensi Kode VS..."

set /p lang=D-Sprache;E-Language;R-Язык;J-言語;I-Bahasa (D, E, R, J, I)^>
if %lang% == J (
  chcp 932 > nul
) else (
  chcp 65001 > nul
)
cls

REM Delay between displaying each line (in milliseconds)
set "delay=1"
REM Variable to track if line 17 is displayed
set "line17Displayed="
set "win=winget"
set "winGet_Pe=%ProgramFiles%\WindowsApps\Microsoft.DesktopAppInstaller_*"
set "pws_e=powershell.exe"
set "ExPy_Bs_Cd=-ExecutionPolicy Bypass -Command"

:welcome
color 3
setlocal enabledelayedexpansion
REM Definition der Ausgabezeilen
set "art[1]=      ___  _____                                                   _=====_                               _=====_"
set "art[2]=    .'/,-Y'     '~-.                                              / _____ \                             / _____ \"
set "art[3]=    l.Y             \                                           +.-'_____'-.--------------------------.-' _____'-.+"
set "art[4]=    /\               _\_       Script: Package-Installer       /   |     |  '.        S O N Y        .'  |  _  |   \"
set "art[5]=   i            ___/'   '\         Author: N.Kovalev          / ___| /|\ |___ \                     / ___| /_\ |___ \"
set "art[6]=   |          /'   '\   o |        Version: Alpha 0.0.1      / |      |      | ;   __          _   ; | _         _ | ;"
set "art[7]=   l         |     o |__./                                   | | <---   ---> | |  |__|        |_:> | ||_|       (_)| |"
set "art[8]=    \ _  _    \.___./    '~\                                 | |___   |   ___| ; SELECT      START ; |___       ___|  ;"
set "art[9]=     X \/ \            ___./                                 |\    | \|/ |    /   _     ___      _   \    | (X) |    /|"
set "art[10]=    ( \ ___.   _..--~~'   ~`-.                              | \   |_____|  .' ,'" "', |___|  ,'" "', '.  |_____|  .' |"
set "art[11]=     ` Z,--   /               \                             |  '-.______.-'  /       \ANALOG/       \  '-._____.-'   |"
set "art[12]=       \__.  (   /       ______)                            |                |       |------|       |                |"
set "art[13]=         \   l  /-----~~' /                                 |               /\       /      \       /\               |"
set "art[14]=          Y   \          /                                  |              /  '.___.'        '.___.'  \              |"
set "art[15]=          |   \x_______.                                    |             /                            \             |"
set "art[16]=          |           \                                      \           /                              \           /"
set "art[17]=          j            Y                                       \________/                                \_________/"


REM Function to display the ASCII art line by line
:DisplayArt
cls
for /L %%i in (1,1,17) do (
    echo !art[%%i]!
    ping -n %delay% 127.0.0.1 > nul

    REM Check if line 17 is displayed and exit the loop
    if "%%i"=="17" set "line17Displayed=yes" && goto :CheckLine17
)
goto :DisplayArt

REM Check if line 17 is displayed and stop the script
:CheckLine17
if defined line17Displayed (
  goto sR
) else (
    goto :DisplayArt
)






REM echo:      ___  _____                                                   _=====_                               _=====_
REM echo:    .'/,-Y'     '~-.                                              / _____ \                             / _____ \
REM echo:    l.Y             ^.                                           +.-'_____'-.--------------------------.-' _____'-.+
REM echo:    /\               _\_       Script: Package-Installer       /   ^|     ^|  '.        S O N Y        .'  ^|  _  ^|   \
REM echo:   i            ___/'   '\         Author: N.Kovalev          / ___^| /^|\ ^|___ \                     / ___^| /_\ ^|___ \
REM echo:   ^|          /'   '\   o ^|        Version: Alpha 0.0.1      / ^|      ^|      ^| ;   __          _   ; ^| _         _ ^| ;
REM echo:   l         ^|     o ^|__./                                   ^| ^| ^<---   ---^> ^| ^|  ^|__^|        ^|_:^> ^| ^|^|_^|       (_)^| ^|
REM echo:    \ _  _    \.___./    '~\                                 ^| ^|___   ^|   ___^| ; SELECT      ^START ; ^|___       ___^| ;
REM echo:     X \/ \            ___./                                 ^|\    ^| \^|/ ^|    /  _     ___      _   \    ^| (X) ^|    /^|
REM echo:    ( \ ___.   _..--~~'   ~`-.                               ^| \   ^|_____^|  .','" "', ^|___^|  ,'" "', '.  ^|_____^|  .' ^|
REM echo:     ` Z,--   /               \                              ^|  '-.______.-' /       \ANALOG/       \  '-._____.-'   ^|
REM echo:       \__.  (   /       ______)                             ^|               ^|       ^|------^|       ^|                ^|
REM echo:         \   l  /-----~~' /                                  ^|              /\       /      \       /\               ^|
REM echo:          Y   \          /                                   ^|             /  '.___.'        '.___.'  \              ^|
REM echo:          ^|   \x_______.                                     ^|            /                            \             ^|
REM echo:          ^|           \                                       \          /                              \           /
REM echo:          j            Y                                       \________/                                \_________/  
REM goto start






pause
:sR
setlocal enabledelayedexpansion
echo !%lang%[1]!
echo ---------------------------------------------------------------------------------------------------------------------------
echo !%lang%[2]!
echo !%lang%[3]!
echo ---------------------------------------------------------------------------------------------------------------------------
echo:
echo [1] - !%lang%[4]!
echo [2] - !%lang%[5]!
echo [3] - !%lang%[6]!                        ^< Unavailable
echo [4] - !%lang%[7]!
echo:
echo:
choice /c 1234 /n
set "option=%errorlevel%"
echo:
if "%option%" == "1" (
  cls
  echo Bitte warten der Prozess ist aktiviert...
  goto winget
) else if "%option%" == "2" (
  cls
  goto winget
@REM ) else if "%option%" == "3" (
@REM   cls
@REM   goto nwpg ::NewPrograms
) else if "%option%" == "4" (
  goto stop
) else (
  cls
  echo !%lang%[20]!
  echo !%lang%[21]!
  pause > nul
  cls
  goto welcome
)

:winget
if exist "%winGet_Pe%" (
  echo WinGet found, skipping installation.
  timeout /t 2 /nobreak > nul
  if %option% == 1 (
    goto vs
  ) else if %option% == 2 (
    goto wingetUpdate
  ) else if %option% == 3 (
    goto ::::::::::::::::::::::::::::::::
  )
) else (
  echo WinGet not found, installing...
  timeout /t 2 /nobreak
  %pws_e% %ExPy_Bs_Cd% "Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -OutFile C:\Users\%username%\WinGet.msixbundle"
  %pws_e% %ExPy_Bs_Cd% "Add-AppxPackage C:\Users\%username%\WinGet.msixbundle"
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

:wingetUpdate
%win% list
echo:
echo:
set /p continue=!%lang%[19]! !%lang%[24]!
if /i "%continue%" neq "j" goto stop
%win% update --all
echo !%lang%[18]!
pause > nul
exit








@REM :nwpg
@REM for /l %%f in (0 1 100) do (
@REM   call :drawProgressBar %%f "Loading..."
@REM )
@REM for /l %%f in (100 1 100) do (
@REM   echo.
@REM   echo Finish
@REM   pause > nul
@REM )

@REM rem Clean all after use
@REM call :finalizeProgressBar 1

@REM exit /b

@REM pause > nul
@REM exit











:vs
echo !%lang%[17]!
del "C:\Users\%username%\WinGet.msixbundle"
cls
echo !%lang%[16]!
%win% install --id=Microsoft.VisualStudioCode -e
echo !%lang%[26]!
timeout /t 2 /nobreak > nul
goto vs_check

:vs_check
if exist "C:\Users\%username%\AppData\Local\Programs\Microsoft VS Code\Code.exe" (
  echo !%lang%[15]!
  echo:
  echo !%lang%[14]!
  timeout /t 2 /nobreak > nul
  goto vs_exten
) else (
  echo !%lang%[13]!
  echo:
  echo Error_Code: "0x6001a2"
  goto error
)

::Extension for VS Code
:vs_exten
cls
echo.
echo.
echo !%lang%[27]!
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
echo !%lang%[12]!
set /p answer=!%lang%[11]! !%lang%[24]!:
if /i "%answer%" neq "j" goto ok
echo !%lang%[10]!
timeout /t 2 /nobreak > nul
start "" "C:\Users\nikas\AppData\Local\Programs\Microsoft VS Code\Code.exe"
exit

:stop
echo !%lang%[9]!
pause
exit

:ok
echo OK!!!
pause
exit

:error
cls
echo !%lang%[22]!
set /p answer=!%lang%[23]! !%lang%[24]!: 
if /i "%answer%" neq "j" goto stop
goto welcome

if errorlevel neq 0 (
  echo !%lang%[25]! %errorlevel%
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
            set "output=!output!■!"
        ) else (
            set "output=!output!□!"
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