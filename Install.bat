@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
for /F %%z in ('echo prompt $E ^| cmd') do (
  set "ESC=%%z"
)
set "delay=1"
REM Variable to track if line 17 is displayed
set "art17Displayed="
set "line7Displayed="
set "win=winget"
set "winGet_Pe=%ProgramFiles%\WindowsApps\Microsoft.DesktopAppInstaller_*"
set "pws_e=powershell.exe"
set "ExPy_Bs_Cd=-ExecutionPolicy Bypass -Command"
set "sleep=timeout /t 2 /nobreak > nul"
set "log=False"
set "dt_Co=!ESC![0m"
set "ef_bo=!ESC![1m"
set "ef_it=!ESC![3m"
set "rd_Co_f=!ESC![31m"
set "gr_Co_f=!ESC![32m"
set "ye_Co_f=!ESC![33m"
set "bl_Co_f=!ESC![34m"
set "ma_Co_f=!ESC![35m"
set "cy_Co_f=!ESC![36m"


@REM REM Überprüfen der Administratorrechte
@REM >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
@REM REM Überprüfen der Administratorrechte
@REM if %errorlevel% neq 0 (
@REM     echo Das Skript erfordert Administratorrechte.
@REM     echo Bitte starte das Skript als Administrator.
@REM     pause
@REM     exit /b
@REM )


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
set "R[14]=Продолжить c улучшениями для VS Code..."
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
set "J[1]=こんにちは!"
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
if /i %lang% == J (
  chcp 932 > nul
) else (
  chcp 65001 > nul
)
cls

:welcome
set "art[1]=      %ye_Co_f%___  _____                                        "
set "art[2]=    %ye_Co_f%.'/,-Y'     '~-.                                    "
set "art[3]=    %ye_Co_f%l.Y             \                                   "
set "art[4]=    %ye_Co_f%/\               _\_       %ma_Co_f%Script: Package-Installer%dt_Co%"
set "art[5]=   %ye_Co_f%i            ___/'   '\         %gr_Co_f%Author: %ESC%[1;36mN.Kovalev%dt_Co%    "
set "art[6]=   %ye_Co_f%|          /'   '\   %dt_Co%o %ye_Co_f%|        %gr_Co_f%Version: Alpha 0.0.3%dt_Co% "
set "art[7]=   %ye_Co_f%l         |     %dt_Co%o %ye_Co_f%|__./                              "
set "art[8]=    %ye_Co_f%\ _  _    \.___./    '~\                            "
set "art[9]=     %ye_Co_f%X \/ \            ___./                            "
set "art[10]=    %ye_Co_f%( \ ___.   %ESC%[38;2;255;218;186m_..--~~'   ~`-.                         "
set "art[11]=     %ye_Co_f%` Z,--   %ESC%[38;2;255;218;186m/               \                        "
set "art[12]=       %ye_Co_f%\__.  %ESC%[38;2;255;218;186m(   %dt_Co%/       ______%ESC%[38;2;255;218;186m)                       "
set "art[13]=         %ye_Co_f%\   %ESC%[38;2;255;218;186ml  %dt_Co%/-----~~' %ESC%[38;2;255;218;186m/                            "
set "art[14]=          %ye_Co_f%Y   %ESC%[38;2;255;218;186m\          /                             "
set "art[15]=          %ye_Co_f%|   %ESC%[38;2;255;218;186m\x_______.                               "
set "art[16]=          %ye_Co_f%|           \                                "
set "art[17]=          %ye_Co_f%j            Y%dt_Co%                               "

REM Function to display the ASCII art line by line
:DisplayArt
cls
for /L %%i in (1,1,17) do (
    echo !art[%%i]!
    ping -n %delay% 127.0.0.1 > nul
    REM Check if line 17 is displayed and exit the loop
    if "%%i"=="17" set "art17Displayed=yes" && goto :CheckLine17
)
goto :DisplayArt
REM Check if line 17 is displayed and stop the script
:CheckLine17
if defined art17Displayed (
  goto sR
) else (
    goto :DisplayArt
)

@REM echo:      ___  _____                                                   _=====_                               _=====_
@REM echo:    .'/,-Y'     '~-.                                              / _____ \                             / _____ \
@REM echo:    l.Y             ^.                                           +.-'_____'-.--------------------------.-' _____'-.+
@REM echo:    /\               _\_       Script: Package-Installer       /   ^|     ^|  '.        S O N Y        .'  ^|  _  ^|   \
@REM echo:   i            ___/'   '\         Author: N.Kovalev          / ___^| /^|\ ^|___ \                     / ___^| /_\ ^|___ \
@REM echo:   ^|          /'   '\   o ^|        Version: Alpha 0.0.1      / ^|      ^|      ^| ;   __          _   ; ^| _         _ ^| ;
@REM echo:   l         ^|     o ^|__./                                   ^| ^| ^<---   ---^> ^| ^|  ^|__^|        ^|_:^> ^| ^|^|_^|       (_)^| ^|
@REM echo:    \ _  _    \.___./    '~\                                 ^| ^|___   ^|   ___^| ; SELECT      ^START ; ^|___       ___^| ;
@REM echo:     X \/ \            ___./                                 ^|\    ^| \^|/ ^|    /  _     ___      _   \    ^| (X) ^|    /^|
@REM echo:    ( \ ___.   _..--~~'   ~`-.                               ^| \   ^|_____^|  .','" "', ^|___^|  ,'" "', '.  ^|_____^|  .' ^|
@REM echo:     ` Z,--   /               \                              ^|  '-.______.-' /       \ANALOG/       \  '-._____.-'   ^|
@REM echo:       \__.  (   /       ______)                             ^|               ^|       ^|------^|       ^|                ^|
@REM echo:         \   l  /-----~~' /                                  ^|              /\       /      \       /\               ^|
@REM echo:          Y   \          /                                   ^|             /  '.___.'        '.___.'  \              ^|
@REM echo:          ^|   \x_______.                                     ^|            /                            \             ^|
@REM echo:          ^|           \                                       \          /                              \           /
@REM echo:          j            Y                                       \________/                                \_________/  
@REM goto start
pause
:sR
setlocal enabledelayedexpansion
echo !%lang%[1]!
echo ---------------------------------------------------------------------------------------------------------------------------
echo !%lang%[2]!
echo !%lang%[3]!
echo ---------------------------------------------------------------------------------------------------------------------------
echo:
echo %gr_Co_f%[1]%dt_Co% - !%lang%[4]!
echo %gr_Co_f%[2]%dt_Co% - !%lang%[5]!
echo %gr_Co_f%[3]%dt_Co% - !%lang%[6]!                        ^< Unavailable
echo %gr_Co_f%[4]%dt_Co% - !%lang%[]!                       ^< Unavailable
echo %gr_Co_f%[5]%dt_Co% - !%lang%[]!                       ^< Unavailable
echo %gr_Co_f%[6]%dt_Co% - !%lang%[7]!
echo:
echo:
choice /c 123456 /n
set "option=%errorlevel%"
echo:
if %option% == 1 (
  cls
  goto winget
) else if %option% == 2 (
  cls
  goto winget
) else if %option% == 3 (
  cls
  pause
) else if %option% == 4 (
  cls
  goto w_m_i_c
) else if %option% == 5 (
  cls
  goto php_in
) else if %option% == 6 (
  cls
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
  echo %gr_Co_f%WinGet found, skipping installation.%dt_Co%
  %sleep%
  if %option% == 1 (
    echo !%lang%[17]!
    del "C:\Users\%username%\WinGet.msixbundle"
    cls
    echo !%lang%[16]!
    %win% install --id=Microsoft.VisualStudioCode -e
    echo !%lang%[26]!
    %sleep%
    if exist "C:\Users\%username%\AppData\Local\Programs\Microsoft VS Code\Code.exe" (
      echo !%lang%[15]!
      echo:
      echo !%lang%[14]!
      %sleep%
      goto vs_exten
    ) else (
      echo !%lang%[13]!
      echo:
      echo Error_Code: "0x6001a2"
      goto error
    )
  ) else if %option% == 2 (
    %win% list
    echo:
    echo:
    set /p continue=!%lang%[19]! !%lang%[24]!
    if /i "%continue%" neq "y" goto stop
      %win% update --all
      echo !%lang%[18]!
      pause > nul
    exit
  ) else if %option% == 3 (
    goto ::::::::::::::::::::::::::::::::
  )
) else (
  echo %rd_Co_f%WinGet not found, installing...%dt_Co%
  timeout /t 2 /nobreak
  %pws_e% %ExPy_Bs_Cd% "Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -OutFile C:\Users\%username%\WinGet.msixbundle"
  %pws_e% %ExPy_Bs_Cd% "Add-AppxPackage C:\Users\%username%\WinGet.msixbundle"
  if errorlevel neq 0 (
    echo Error_Code: "0x6001a2"
    Install.bat > log.txt 2>&1 || start cmd /k "type log.txt && pause"
    goto error
  )
  goto winget
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
echo !%lang%[12]!
set /p answer=!%lang%[11]! !%lang%[24]!:
if /i "%answer%" neq "y" goto ok
echo !%lang%[10]!
%sleep%
start "" "C:\Users\nikas\AppData\Local\Programs\Microsoft VS Code\Code.exe"
@REM goto :eof

:w_m_i_c
if "%log%" == "False" (
    set "log_A=!rd_Co_f!%log%!dt_Co!"
) else (
    set "log_A=!gr_Co_f!%log%!dt_Co!"
)
set "line[1]=%gr_Co_f%    :::       :::%rd_Co_f%      :::   :::%bl_Co_f%      :::::::::::%ye_Co_f%    ::::::::  %dt_Co%"
set "line[2]=%gr_Co_f%   :+:       :+:%rd_Co_f%     :+:+: :+:+:%bl_Co_f%         :+:%ye_Co_f%       :+:    :+:  %dt_Co%" 
set "line[3]=%gr_Co_f%  +:+       +:+%rd_Co_f%    +:+ +:+:+ +:+%bl_Co_f%        +:+%ye_Co_f%       +:+          %dt_Co%"
set "line[4]=%gr_Co_f% +#+  +:+  +#+%rd_Co_f%    +#+  +:+  +#+%bl_Co_f%        +#+%ye_Co_f%       +#+           %dt_Co%"
set "line[5]=%gr_Co_f%+#+ +#+#+ +#+%rd_Co_f%    +#+       +#+%bl_Co_f%        +#+%ye_Co_f%       +#+            %dt_Co%"
set "line[6]=%gr_Co_f%#+#+# #+#+#%rd_Co_f%     #+#       #+#%bl_Co_f%        #+#%ye_Co_f%       #+#    #+#      %dt_Co%" 
set "line[7]=%gr_Co_f%###   ###%rd_Co_f%      ###       ###%bl_Co_f%    ###########%ye_Co_f%    ########        %dt_Co%"
REM Function to display the ASCII art line by line
:w_m_i_c-ART
cls
for /L %%j in (1,1,7) do (
    echo !line[%%j]!
    ping -n %delay% 127.0.0.1 > nul
    REM Check if line 17 is displayed and exit the loop
    if "%%j"=="7" set "line7Displayed=yes" && goto :CheckLine7
)
goto :w_m_i_c-ART
REM Check if line 17 is displayed and stop the script
:CheckLine7
if defined line7Displayed (
  goto menu
) else (
    goto :w_m_i_c-ART
)
:menu
echo.
echo ============================================
echo.
REM Wähle die Option um Windows Parametern zu untersuchen oder sie sich auf Log zu speichern.
echo !%lang%[46]!
echo.
echo ============================================
echo.
echo.
echo %gr_Co_f%[1]%dt_Co% - !%lang%[30]!                                ^|     %gr_Co_f%[9]%dt_Co% - !%lang%[38]!
echo.
echo %gr_Co_f%[2]%dt_Co% - !%lang%[31]!                                ^|     %gr_Co_f%[A]%dt_Co% - !%lang%[39]!
echo.
echo %gr_Co_f%[3]%dt_Co% - !%lang%[32]!                                ^|     %gr_Co_f%[B]%dt_Co% - !%lang%[40]!
echo.
echo %gr_Co_f%[4]%dt_Co% - !%lang%[33]!                                ^|     %gr_Co_f%[C]%dt_Co% - !%lang%[41]!
echo.
echo %gr_Co_f%[5]%dt_Co% - !%lang%[34]!                                ^|     %gr_Co_f%[D]%dt_Co% - !%lang%[42]!
echo.
echo %gr_Co_f%[6]%dt_Co% - !%lang%[35]!                                ^|     %gr_Co_f%[E]%dt_Co% - !%lang%[43]!
echo.
echo %gr_Co_f%[7]%dt_Co% - !%lang%[36]!                                ^|     %gr_Co_f%[F]%dt_Co% - !%lang%[44]!
echo.
echo %gr_Co_f%[8]%dt_Co% - !%lang%[37]!                                ^|     %gr_Co_f%[G]%dt_Co% - !%lang%[45]!
echo.
echo.
echo %gr_Co_f%[L]%dt_Co% - Logs (Activated: !log_A!)


choice /C 123456789ABCDEFGLX /N /M "Take your opininion =>"
set "choice=%errorlevel%"
if !choice! == 1 (
    echo Hello World
) else if !choice! == 2 (
    echo Hello World
) else if !choice! == 3 (
    echo Hello World
) else if !choice! == 4 (
    echo Hello World
) else if !choice! == 5 (
    echo Hello World
) else if !choice! == 6 (
    echo Hello World
) else if !choice! == 7 (
    echo Hello World
) else if !choice! == 8 (
    echo Hello World
) else if !choice! == 9 (
    echo Hello World
) else if !choice! == 10 (
    echo Hello World
) else if !choice! == 11 (
    echo Hello World
) else if !choice! == 12 (
    echo Hello World
) else if !choice! == 13 (
    echo Hello World
) else if !choice! == 14 (
    echo Hello World
) else if !choice! == 15 (
    echo Hello World
) else if !choice! == 16 (
    goto welcome
) else if !choice! == 17 (
    if "!log!" == "True" (
        set "log=False"
    ) else (
        set "log=True"
    )
    cls
    goto w_m_i_c
) else if !choice! == 18 (
    exit /b
) else (
    echo Ungültige Eingabe. Bitte eine gültige Option auswählen.
    pause
)

:php_in




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

:stop
echo !%lang%[9]!
pause
exit