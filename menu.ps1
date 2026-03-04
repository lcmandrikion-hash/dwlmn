@echo off
title Lxzinn__ - Otimizado mais brabo da neti
mode 95,30
chcp 65001 >nul
setlocal enabledelayedexpansion

:: ================= ARQUIVO DE CONFIGURACAO =================
if not exist "%APPDATA%\Lxzinn" (
    mkdir "%APPDATA%\Lxzinn" 2>nul
)

if not exist "%APPDATA%\Lxzinn\config.ini" (
    echo cor=0F > "%APPDATA%\Lxzinn\config.ini"
)

:: ================= LER COR SALVA =================
for /f "usebackq tokens=1,2 delims==" %%A in ("%APPDATA%\Lxzinn\config.ini") do (
    if /i "%%A"=="cor" set "COR_ATUAL=%%B"
)

if not defined COR_ATUAL (
    set "COR_ATUAL=0F"
    echo cor=0F > "%APPDATA%\Lxzinn\config.ini"
)

color %COR_ATUAL%

:: ================= VARIAVEIS PARA HOTKEYS =================
set "startmenu=%APPDATA%\Microsoft\Windows\Start Menu\Programs"
set "desktop=%USERPROFILE%\Desktop"
set "drivePrincipal="
set "pasta="
set "config_file_wallpaper=%appdata%\wallpaper_config.txt"

:: ================= VERIFICAR PRIMEIRA EXECUCAO HOTKEYS =================
if exist "%APPDATA%\ShortcutManager.cfg" (
    for /f "delims=" %%A in (%APPDATA%\ShortcutManager.cfg) do (
        set "drivePrincipal=%%A"
        set "pasta=%%A:\AtalhosSites"
    )
) else (
    set "primeiraExecucao=1"
)

if not exist "%pasta%" (
    mkdir "%pasta%" 2>nul
)

:: ================= MENU PRINCIPAL =================
:menu
color %COR_ATUAL%
cls
echo.
echo _______________________________________________________________
echo.
echo     ██╗     ██╗  ██╗███████╗██╗███╗   ██╗███╗   ██╗
echo     ██║     ╚██╗██╔╝╚══███╔╝██║████╗  ██║████╗  ██║                
echo     ██║      ╚███╔╝   ███╔╝ ██║██╔██╗ ██║██╔██╗ ██║                  
echo     ██║      ██╔██╗  ███╔╝  ██║██║╚██╗██║██║╚██╗██║                        
echo     ███████╗██╔╝ ██╗███████╗██║██║ ╚████║██║ ╚████║ ████████████                                                                    
echo     ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝ 
echo.
echo.
echo _______________________________________________________________
echo.
echo               (1) - OTIMIZACAO WINDOWS
echo               (2) - SOFTWARE
echo               (3) - STEAM TOOLS
echo               (4) - ATIVACAO DO WINDOWS
echo               (5) - WALLPAPERS
echo               (6) - JOGUINHOS
echo               (7) - HOTKEYS (EM BETA)
echo               (12) - CORES
echo               (0) - SAIR
echo.
echo _______________________________________________________________
set /p opcao=Escolha uma opcao:

if "%opcao%"=="1" goto menu_otimizacao
if "%opcao%"=="2" goto menu_software
if "%opcao%"=="3" goto steam_tools
if "%opcao%"=="4" goto ativacao_windows
if "%opcao%"=="5" goto menu_wallpapers_integrado
if "%opcao%"=="6" goto menu_joguinhos
if "%opcao%"=="7" goto menu_hotkeys
if "%opcao%"=="12" goto menu_cores
if "%opcao%"=="0" exit
goto menu


:: ================= SUBMENU OTIMIZACAO WINDOWS =================
:menu_otimizacao
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo            LXZINN__ - OTIMIZACAO WINDOWS
echo.
echo =============================================================
echo.
echo        (1) - INSTALAR PROGRAMAS
echo        (2) - DESINSTALAR / LIMPAR
echo        (3) - POS FORMATACAO COMPLETA
echo        (0) - VOLTAR
echo.
echo =============================================================
set /p escolha=Escolha uma opcao:

if "%escolha%"=="1" goto menu_instalar
if "%escolha%"=="2" goto menu_desinstalar
if "%escolha%"=="3" goto tudo_geral
if "%escolha%"=="0" goto menu
goto menu_otimizacao


:: ================= SUBMENU INSTALAR =================
:menu_instalar
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo                 LXZINN__ - INSTALACAO
echo.
echo =============================================================
echo.
echo        (1) - JOGOS
echo        (2) - USO PESSOAL
echo        (3) - INSTALAR TUDO
echo        (0) - VOLTAR
echo.
echo =============================================================
set /p escolha=Escolha uma opcao:

if "%escolha%"=="1" goto jogos
if "%escolha%"=="2" goto pessoal
if "%escolha%"=="3" goto tudo
if "%escolha%"=="0" goto menu_otimizacao
goto menu_instalar


:: ================= INSTALAR JOGOS =================
:jogos
color %COR_ATUAL%
cls
echo ===== INSTALANDO PACOTE JOGOS =====
echo.

winget install --id Brave.Brave -e -h --accept-package-agreements --accept-source-agreements
if errorlevel 1 goto erro_instalar

winget install --id Discord.Discord -e -h --accept-package-agreements
if errorlevel 1 goto erro_instalar

winget install --id Valve.Steam -e -h --accept-package-agreements
if errorlevel 1 goto erro_instalar

winget install --id Microsoft.VCRedist.2015+.x64 -e -h --accept-package-agreements
if errorlevel 1 goto erro_instalar

winget install --id Microsoft.DotNet.DesktopRuntime.8 -e -h --accept-package-agreements
if errorlevel 1 goto erro_instalar

winget install --id RARLab.WinRAR -e -h --accept-package-agreements
if errorlevel 1 goto erro_instalar

winget install --id MedalB.V.Medal -e -h --accept-package-agreements
if errorlevel 1 goto erro_instalar

winget install --id EpicGames.EpicGamesLauncher -e -h --accept-package-agreements
if errorlevel 1 goto erro_instalar

winget install --id RockstarGames.Launcher -e -h --accept-package-agreements
if errorlevel 1 goto erro_instalar

winget install --id pizzaboxer.Bloxstrap -e -h --accept-package-agreements
if errorlevel 1 goto erro_instalar

powershell -Command "Invoke-WebRequest -Uri 'https://runtime.fivem.net/client/FiveM.exe' -OutFile \"$env:USERPROFILE\Downloads\FiveM.exe\""
if errorlevel 1 goto erro_instalar

start "" "%USERPROFILE%\Downloads\FiveM.exe"
if errorlevel 1 goto erro_instalar

echo.
echo ===== PACOTE JOGOS INSTALADO COM SUCESSO =====
pause
goto menu_instalar


:: ================= INSTALAR USO PESSOAL =================
:pessoal
color %COR_ATUAL%
cls
echo ===== INSTALANDO PACOTE USO PESSOAL =====
echo.

winget install --id Brave.Brave -e -h --accept-package-agreements --accept-source-agreements
if errorlevel 1 goto erro_instalar

winget install --id Discord.Discord -e -h --accept-package-agreements
if errorlevel 1 goto erro_instalar

winget install --id Spotify.Spotify -e -h --accept-package-agreements
if errorlevel 1 goto erro_instalar

winget install --id Microsoft.VCRedist.2015+.x64 -e -h --accept-package-agreements
if errorlevel 1 goto erro_instalar

winget install --id Microsoft.DotNet.DesktopRuntime.8 -e -h --accept-package-agreements
if errorlevel 1 goto erro_instalar

winget install --id RARLab.WinRAR -e -h --accept-package-agreements
if errorlevel 1 goto erro_instalar

echo.
echo ===== PACOTE USO PESSOAL INSTALADO COM SUCESSO =====
pause
goto menu_instalar


:: ================= INSTALAR TUDO =================
:tudo
color %COR_ATUAL%
cls
echo ===== INSTALANDO TUDO =====
call :instalacao_completa
if errorlevel 1 goto erro_instalar

echo ===== TUDO INSTALADO COM SUCESSO =====
pause
goto menu_instalar


:: ================= TRATAMENTO DE ERRO =================
:erro_instalar
color %COR_ATUAL%
cls
echo.
echo ===============================================================
echo.
echo               ERRO DETECTADO NA INSTALACAO!
echo.
echo    O aplicativo Microsoft.DesktopAppInstaller sera aberto
echo              para resolver o problema detectado.
echo.
echo ===============================================================
echo.
echo Abrindo aplicativo...
echo.
timeout /t 3 /nobreak

:: Abre o aplicativo
for %%D in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    for /f "delims=" %%F in ('dir "%%D:\*Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" /s /b 2^>nul') do (
        start "" "%%F"
        goto aguardar_instalacao
    )
)

:aguardar_instalacao
echo.
echo Instale o aplicativo e pressione qualquer tecla...
echo Depois os comandos serao executados novamente.
echo.
pause

cls
echo Tentando novamente...
echo.
timeout /t 2 /nobreak

goto menu_instalar


:: ================= SUBMENU DESINSTALAR =================
:menu_desinstalar
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo              LXZINN__ - DESINSTALAR / LIMPAR
echo.
echo =============================================================
echo.
echo        (1) - LIMPEZA PADRAO
echo        (2) - OTIMIZACAO COMPLETA
echo        (0) - VOLTAR
echo.
echo =============================================================
set /p escolha2=Escolha uma opcao:

if "%escolha2%"=="1" goto limpeza
if "%escolha2%"=="2" goto completa
if "%escolha2%"=="0" goto menu_otimizacao
goto menu_desinstalar


:: ================= LIMPEZA PADRAO =================
:limpeza
color %COR_ATUAL%
cls
echo ===== REMOVENDO APPS BASICOS =====

winget uninstall Cortana
winget uninstall xbox
winget uninstall "Xbox Game Bar"
winget uninstall "Microsoft Solitaire Collection"
winget uninstall Microsoft.OneDrive

powershell -Command "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage"

echo ===== LIMPEZA CONCLUIDA =====
pause
goto menu_desinstalar


:: ================= OTIMIZACAO COMPLETA =================
:completa
color %COR_ATUAL%
cls
echo ===== OTIMIZACAO COMPLETA =====

winget uninstall Cortana
winget uninstall xbox
winget uninstall "Xbox Game Bar"
winget uninstall "Hub de Comentários"
winget uninstall "Microsoft Solitaire Collection"
winget uninstall 9NZBF4GT040C
winget uninstall Microsoft.OneDrive

powershell -Command "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *solitaire* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *outlook* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *feedback* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *realtek* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *copilot* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *WindowsCamera* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *9WZDNCRD29V9* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *BingWeather* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *GetHelp* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Wallet* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *MixedReality.Portal* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *ZuneVideo* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *MSPaint* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *People* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *YourPhone* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *StickyNotes* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *SoundRecorder* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *ZuneMusic* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage"

echo ===== OTIMIZACAO FINALIZADA =====
pause
goto menu_desinstalar


:: ================= POS FORMATACAO COMPLETA =================
:tudo_geral
color %COR_ATUAL%
cls
echo ===== PROCESSO POS FORMATACAO COMPLETA =====

call :instalacao_completa
if errorlevel 1 goto erro_instalar

call :completa

echo ===== PROCESSO POS FORMATACAO COMPLETA FINALIZADO =====
pause
goto menu_otimizacao


:: ================= FUNCAO INSTALACAO COMPLETA =================
:instalacao_completa

winget install --id Brave.Brave -e -h --accept-package-agreements --accept-source-agreements
if errorlevel 1 exit /b 1

winget install --id Discord.Discord -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

winget install --id Valve.Steam -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

winget install --id Spotify.Spotify -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

winget install --id Microsoft.VCRedist.2015+.x64 -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

winget install --id Microsoft.DotNet.DesktopRuntime.8 -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

winget install --id Python.Python.3.12 -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

winget install --id RevoUninstaller.RevoUninstaller -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

winget install --id RARLab.WinRAR -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

winget install --id AnyDesk.AnyDesk -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

winget install --id MedalB.V.Medal -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

winget install --id pizzaboxer.Bloxstrap -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

winget install --id EpicGames.EpicGamesLauncher -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

winget install --id RockstarGames.Launcher -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

winget install --id ARP\User\X64\CitizenFX_FiveM -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

winget install --id Vendicated.Vencord -e -h --accept-package-agreements
if errorlevel 1 exit /b 1

powershell -Command "Invoke-WebRequest -Uri 'https://runtime.fivem.net/client/FiveM.exe' -OutFile \"$env:USERPROFILE\Downloads\FiveM.exe\""
if errorlevel 1 exit /b 1

start "" "%USERPROFILE%\Downloads\FiveM.exe"
if errorlevel 1 exit /b 1

exit /b 0


:: ================= ATIVACAO DO WINDOWS =================
:ativacao_windows
color %COR_ATUAL%
cls
echo ===== ATIVANDO WINDOWS =====
echo.

powershell -Command "irm https://get.activated.win | iex"

echo.
echo =============================================================
echo.
echo Windows ativado com sucesso!
echo.
echo =============================================================
pause
goto menu


:: ================= SUBMENU SOFTWARE =================
:menu_software
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo                  LXZINN__ - SOFTWARE
echo.
echo =============================================================
echo.
echo        (1) - AJAZZ AK 820 WHITE
echo        (2) - REDRAGON MOUSE COBRA
echo        (3) - ATTACK SHARK R1
echo        (4) - AMD RYZEN 5 5600 GT
echo        (0) - VOLTAR
echo.
echo =============================================================
set /p escolha_soft=Escolha uma opcao:

if "%escolha_soft%"=="1" goto ajazz_ak820
if "%escolha_soft%"=="2" goto redragon_mouse
if "%escolha_soft%"=="3" goto attack_shark
if "%escolha_soft%"=="4" goto amd_ryzen
if "%escolha_soft%"=="0" goto menu
goto menu_software


:: ================= DOWNLOAD AJAZZ AK 820 =================
:ajazz_ak820
color %COR_ATUAL%
cls
echo ===== BAIXANDO AJAZZ AK 820 WHITE =====

powershell -Command "Invoke-WebRequest -Uri 'https://download1349.mediafire.com/hgw9jjut0ubg4rLtyI9eWXN8SGHRHofJBEnjVtcX4OyVSAi_-csuC6-o7AhqczA4amTr7FM9Jg_C5EgxIRJA7l8sEPyNBJBRBH3RhPF0aTFQMz1kCr7yaRRoL5RhbjUAszy-OTLAsNcNh3cLJtlufr2kx4wzdMXoE-5-sp8oky7R/zrll6ti21sp50ax/AJAZZ_AK820+%C3%8B%C3%B0%C2%A4%C2%AF%C2%A6%C3%8E%C2%A6%C3%94_%2B%C2%B3%2B%C2%A6%C3%83%C2%B2%C3%82%C2%BB_V1.0.exe' -OutFile '%USERPROFILE%\Downloads\AJAZZ_AK820_driver.exe'"

echo.
echo Download concluido verifcar em downloads
pause
goto menu_software


:: ================= DOWNLOAD REDRAGON MOUSE COBRA =================
:redragon_mouse
color %COR_ATUAL%
cls
echo ===== BAIXANDO REDRAGON MOUSE COBRA =====

powershell -Command "Invoke-WebRequest -Uri 'https://download1348.mediafire.com/a401e222onbgHSZ6MkDdJ6om3Wa05GaARuUl06mhBPYWqIIQuLSNonPNnYZFfKN6IzYZz4tOzh2TODmwQYmLwi9syMeswSg_IubsUz574-xSfNO1gPG3JeASD5dQo381lcYT3BVn95j8Wn14pN9oIVzd74twP7de6TbNucbN_GlI/ab92ukk1w5nmd4t/REDRAGON+Gaming+Mouse.exe' -OutFile '%USERPROFILE%\Downloads\REDRAGON Gaming Mouse.exe'"

echo.
echo Download concluido verifcar em downloads
pause
goto menu_software


:: ================= DOWNLOAD ATTACK SHARK R1 =================
:attack_shark
color %COR_ATUAL%
cls
echo ===== BAIXANDO ATTACK SHARK R1 =====

powershell -Command "Invoke-WebRequest -Uri 'https://download853.mediafire.com/blw5dsme97bgYyaOKjJv4lskD3Xybq7w-1UIdFnLDI7RZ-jpgPg4gIs1WNxR-vtukHtWeb8a9Xu5jKlc5EUR3Pw-sg7UNeueFiSLewm4rAgiPCPJJFBhe1te2ad9bylBHSjOLE7lVT8qVOH0gMDrgZ5_yo97GEyuJ_RbB3tB1MXK/foox4e2s7rjv462/ATTACK+SHARK+R1+SOFT.exe' -OutFile '%USERPROFILE%\Downloads\ATTACK SHARK R1 SOFT.exe'"

echo.
echo Download concluido verifcar em downloads
pause
goto menu_software


:: ================= DOWNLOAD AMD RYZEN 5 5600 GT =================
:amd_ryzen
color %COR_ATUAL%
cls
echo ===== BAIXANDO AMD RYZEN 5 5600 GT =====

powershell -Command "Invoke-WebRequest -Uri 'https://download1528.mediafire.com/brdea92xa8kgTM64Biz3R_OmQ0QaqefXVmVMJblSESzi1qhzHq2bCIzuodV_kIVn2WD2Du4MVPxBLW6QvOkeSBO9fbwZzDVrxT2XD0tYEEdyyoRo5qcgwiuvWWNxWMmpE2tDZDh4crTFfpzoujsuQ91Y0gwyhSR8r4bmZ_LmkNhx/6vghi3gt0kdcqwm/amd-software-adrenalin-edition-26.1.1-minimalsetup-260119_web.exe' -OutFile '%USERPROFILE%\Downloads\amd-software-adrenalin-edition-26.1.1-minimalsetup-260119_web.exe'"

echo.
echo Download concluido verifcar em downloads
pause
goto menu_software


:: ================= MENU INTEGRADO WALLPAPERS =================
:menu_wallpapers_integrado
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo                    LXZINN__ - WALLPAPERS
echo.
echo =============================================================
echo.
echo        (1) - WALLPAPERS DO SISTEMA
echo        (2) - WALLPAPERS AUTOMATIZADO
echo        (001) - VOLTAR PARA O MENU
echo.
echo =============================================================
set /p opcao_wallpaper=Escolha uma opcao:

if "%opcao_wallpaper%"=="1" goto wallpapers
if "%opcao_wallpaper%"=="2" goto buscar_wallpaper
if "%opcao_wallpaper%"=="001" goto menu
goto menu_wallpapers_integrado


:: ================= WALLPAPERS DO SISTEMA (ORIGINAL) =================
:wallpapers
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo                   LXZINN__ - WALLPAPERS
echo.
echo =============================================================
echo.
echo        (1) - CLEAN
echo        (2) - BLACK
echo        (3) - WHITE
echo        (4) - ZUERA
echo        (5) - XIT
echo        (6) - MIDIA
echo        (7) - DEUS
echo        (8) - SAFADINHO
echo        (001) - VOLTAR
echo.
echo =============================================================
set /p op_wallpaper=Escolha uma opcao:

if "%op_wallpaper%"=="1" goto clean
if "%op_wallpaper%"=="2" goto black
if "%op_wallpaper%"=="3" goto white
if "%op_wallpaper%"=="4" goto zuera
if "%op_wallpaper%"=="5" goto xit
if "%op_wallpaper%"=="6" goto midia
if "%op_wallpaper%"=="7" goto deus
if "%op_wallpaper%"=="8" goto safadinho
if "%op_wallpaper%"=="001" goto menu_wallpapers_integrado
goto wallpapers


:: ================= SUBMENU CLEAN =================
:clean
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo                   LXZINN__ - CLEAN
echo.
echo =============================================================
echo.
echo        (1) - CLEAN 1
echo        (2) - CLEAN 2
echo        (3) - CAVERA
echo        (4) - KOREIA
echo        (001) - VOLTAR
echo.
echo =============================================================
set /p op_clean=Escolha uma opcao:

if "%op_clean%"=="1" goto clean_1
if "%op_clean%"=="2" goto clean_2
if "%op_clean%"=="3" goto cavera_1
if "%op_clean%"=="4" goto koreia_1
if "%op_clean%"=="001" goto wallpapers
goto clean


:clean_1
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER CLEAN 1 =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\clean.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto clean


:clean_2
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER CLEAN 2 =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\clean2.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto clean


:cavera_1
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER CAVERA =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\cavera.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto clean


:koreia_1
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER KOREIA =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\koreia.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto clean


:: ================= SUBMENU BLACK =================
:black
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo                   LXZINN__ - BLACK
echo.
echo =============================================================
echo.
echo        (1) - BLACK
echo        (2) - BLACK 2
echo        (3) - BLACK LIQUID
echo        (001) - VOLTAR
echo.
echo =============================================================
set /p op_black=Escolha uma opcao:

if "%op_black%"=="1" goto black_1
if "%op_black%"=="2" goto black_2
if "%op_black%"=="3" goto black_3
if "%op_black%"=="001" goto wallpapers
goto black


:black_1
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER BLACK =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\black.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto black


:black_2
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER BLACK 2 =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\black2.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto black


:black_3
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER BLACK 2 =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\blackliquid.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto black


:: ================= WALLPAPER WHITE =================
:white
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER WHITE =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\white.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto wallpapers


:: ================= SUBMENU ZUERA =================
:zuera
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo                   LXZINN__ - ZUERA
echo.
echo =============================================================
echo.
echo        (1) - VEIA
echo        (2) - PAPA
echo        (3) - PAULINHO O LOKO
echo        (001) - VOLTAR
echo.
echo =============================================================
set /p op_zuera=Escolha uma opcao:

if "%op_zuera%"=="1" goto zuera_veia
if "%op_zuera%"=="2" goto zuera_papa
if "%op_zuera%"=="3" goto zuera_paulinho
if "%op_zuera%"=="001" goto wallpapers
goto zuera


:zuera_veia
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER VEIA =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\veia.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto zuera


:zuera_papa
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER PAPA =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\zuera.jpg',3)"
echo Wallpaper alterado com sucesso!
pause
goto zuera


:zuera_paulinho
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER PAULINHO O LOKO =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\zuera2.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto zuera


:: ================= SUBMENU XIT =================
:xit
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo                   LXZINN__ - XIT
echo.
echo =============================================================
echo.
echo        (1) - XIT DA NEGA 1
echo        (2) - XIT DA NEGA 2
echo        (3) - XIT DA LOIRA
echo        (4) - XIT DO KAKA
echo        (001) - VOLTAR
echo.
echo =============================================================
set /p op_xit=Escolha uma opcao:

if "%op_xit%"=="1" goto xit_nega1
if "%op_xit%"=="2" goto xit_nega2
if "%op_xit%"=="3" goto xit_loira
if "%op_xit%"=="4" goto xit_kaka
if "%op_xit%"=="001" goto wallpapers
goto xit


:xit_nega1
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER XIT DA NEGA 1 =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\xit fivem.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto xit


:xit_nega2
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER XIT DA NEGA 2 =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\xit 2.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto xit


:xit_loira
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER XIT DA LOIRA =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\xit loira.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto xit


:xit_kaka
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER XIT DO KAKA =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\xitkaka.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto xit


:: ================= SUBMENU MIDIA =================
:midia
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo                   LXZINN__ - MIDIA
echo.
echo =============================================================
echo.
echo        (1) - DROGADAO
echo        (2) - COMEDOR DE PUTA
echo        (3) - MOTO
echo        (001) - VOLTAR
echo.
echo =============================================================
set /p op_midia=Escolha uma opcao:

if "%op_midia%"=="1" goto midia_drogadao
if "%op_midia%"=="2" goto midia_comedor
if "%op_midia%"=="3" goto midia_moto
if "%op_midia%"=="001" goto wallpapers
goto midia


:midia_drogadao
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER DROGADAO =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\drogadao.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto midia


:midia_comedor
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER COMEDOR DE PUTA =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\comedo de puta.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto midia


:midia_moto
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER MOTO =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\midia.jpg',3)"
echo Wallpaper alterado com sucesso!
pause
goto midia


:: ================= WALLPAPER DEUS =================
:deus
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER DEUS =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\Deus.jpg',3)"
echo Wallpaper alterado com sucesso!
pause
goto wallpapers


:: ================= SUBMENU SAFADINHO =================
:safadinho
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo                 LXZINN__ - SAFADINHO
echo.
echo =============================================================
echo.
echo        (1) - MAIS CORRE
echo        (2) - MCRYAN
echo        (3) - ASDUJOB
echo        (4) - CAMISA DE TIME
echo        (5) - MIA KALIFA
echo        (6) - VARIAS
echo        (7) - 150
echo        (001) - VOLTAR
echo.
echo =============================================================
set /p op_safadinho=Escolha uma opcao:

if "%op_safadinho%"=="1" goto safadinho_corre
if "%op_safadinho%"=="2" goto safadinho_mcryan
if "%op_safadinho%"=="3" goto safadinho_asdujob
if "%op_safadinho%"=="4" goto safadinho_camisa
if "%op_safadinho%"=="5" goto safadinho_miakalifa
if "%op_safadinho%"=="6" goto safadinho_varias
if "%op_safadinho%"=="7" goto safadinho_150
if "%op_safadinho%"=="001" goto wallpapers
goto safadinho


:safadinho_corre
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER MAIS CORRE =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\maiscorre.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto safadinho


:safadinho_mcryan
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER MCRYAN =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\mryan.jpg',3)"
echo Wallpaper alterado com sucesso!
pause
goto safadinho


:safadinho_asdujob
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER ASDUJOB =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\asdujob.jpg',3)"
echo Wallpaper alterado com sucesso!
pause
goto safadinho


:safadinho_camisa
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER CAMISA DE TIME =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\camisadetime.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto safadinho


:safadinho_miakalifa
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER MIA KALIFA =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\miakalifa.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto safadinho


:safadinho_varias
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER VARIAS =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\varias.png',3)"
echo Wallpaper alterado com sucesso!
pause
goto safadinho


:safadinho_150
color %COR_ATUAL%
cls
echo ===== DEFININDO WALLPAPER VARIAS =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'D:\lz 2\imagens aleatorioas\imagens para wallperes\150.jpg',3)"
echo Wallpaper alterado com sucesso!
pause
goto safadinho


:: ================= WALLPAPERS AUTOMATIZADO (MENU BUSCAR) =================
:buscar_wallpaper
color %COR_ATUAL%
cls
echo.
echo _______________________________________________________________
echo.
echo     ██╗     ██╗  ██╗███████╗██╗███╗   ██╗███╗   ██╗
echo     ██║     ╚██╗██╔╝╚══███╔╝██║████╗  ██║████╗  ██║                
echo     ██║      ╚███╔╝   ███╔╝ ██║██╔██╗ ██║██╔██╗ ██║                  
echo     ██║      ██╔██╗  ███╔╝  ██║██║╚██╗██║██║╚██╗██║                        
echo     ███████╗██╔╝ ██╗███████╗██║██║ ╚████║██║ ╚████║ ████████████                                                                    
echo     ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝ 
echo.
echo.
echo _______________________________________________________________
echo.
echo PROCURAR E TROCAR WALLPAPER
echo.

REM ===== DETECTAR DISCOS =====
set "count=0"
echo [*] Detectando discos disponíveis...
echo.

for %%A in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%A:\ (
        set /a count+=1
        set "disco!count!=%%A"
        echo  !count! - %%A:
    )
)

echo.
if %count% equ 0 (
    echo [✗] Nenhum disco encontrado!
    pause
    goto menu_wallpapers_integrado
)

REM ===== ESCOLHER DISCO =====
set /p "disco_escolhido=Digite o número do disco (1-%count%) ou 001 para voltar: "

if "!disco_escolhido!"=="001" goto menu_wallpapers_integrado

if not defined disco_escolhido (
    echo [✗] Entrada inválida!
    pause
    goto buscar_wallpaper
)

set "letra_disco="
for /L %%i in (1,1,%count%) do (
    if "!disco_escolhido!"=="%%i" (
        set "letra_disco=!disco%%i!"
    )
)

if not defined letra_disco (
    echo [✗] Disco inválido!
    pause
    goto buscar_wallpaper
)

echo.
echo [✓] Disco selecionado: !letra_disco!:
echo.

REM ===== DIGITAR NOME DA IMAGEM =====
set /p "nome_imagem=Digite o nome da imagem (ex: paisagem.jpg): "

if not defined nome_imagem (
    echo [✗] Nenhum nome fornecido!
    pause
    goto buscar_wallpaper
)

echo.
echo [*] Procurando por "!nome_imagem!" em !letra_disco!:\
echo [*] Por favor, aguarde...
echo.

REM ===== BUSCAR ARQUIVO =====
set "temp_file=%temp%\busca_wallpaper_%random%.txt"
set "encontrados=0"

dir /s /b "!letra_disco!:\*!nome_imagem!*" > "!temp_file!" 2>nul

REM Contar quantos arquivos encontrou
for /F "delims=" %%A in ('type "!temp_file!"') do (
    set /a encontrados+=1
)

if !encontrados! equ 0 (
    echo [✗] Arquivo não encontrado!
    del "!temp_file!" 2>nul
    echo.
    pause
    goto buscar_wallpaper
)

echo [✓] Encontrado !encontrados! arquivo^(s^)!
echo.

REM ===== SE ENCONTROU MÚLTIPLOS, LISTAR =====
if !encontrados! gtr 1 (
    echo Selecione qual imagem deseja:
    echo.
    
    set "opcao=0"
    for /F "delims=" %%A in ('type "!temp_file!"') do (
        set /a opcao+=1
        echo  !opcao! - %%A
        set "arquivo!opcao!=%%A"
    )
    
    echo.
    set /p "escolha=Digite o número: "
    
    if not defined escolha (
        echo [✗] Opção inválida!
        del "!temp_file!" 2>nul
        pause
        goto buscar_wallpaper
    )
    
    REM Expandir a variável corretamente
    for /F "tokens=1,2 delims==" %%X in ('set arquivo') do (
        if "%%X"=="arquivo!escolha!" (
            set "caminho_final=%%Y"
        )
    )
    
    if not defined caminho_final (
        echo [✗] Número inválido!
        del "!temp_file!" 2>nul
        pause
        goto buscar_wallpaper
    )
    
) else (
    REM Se encontrou apenas 1, pegar direto
    for /F "delims=" %%A in ('type "!temp_file!"') do (
        set "caminho_final=%%A"
    )
)

echo [✓] Imagem selecionada:
echo    !caminho_final!
echo.

REM ===== CONFIRMAR =====
set /p "confirmar=Trocar papel de parede? (S/N): "

if /i not "!confirmar!"=="S" (
    echo [*] Cancelado.
    del "!temp_file!" 2>nul
    pause
    goto buscar_wallpaper
)

echo.
echo [*] Aplicando...
echo.

REM ===== TROCAR WALLPAPER =====
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'!caminho_final!',3)"

timeout /t 1 >nul

echo [✓] Feito!
echo [✓] Papel de parede trocado para:
echo    !caminho_final!
echo.

REM ===== SALVAR NO HISTÓRICO (SEM DUPLICATAS) =====
echo [*] Salvando wallpaper...

REM Verificar se já existe no arquivo (caso sensível)
findstr /X "!caminho_final!" "!config_file_wallpaper!" >nul 2>&1

if errorlevel 1 (
    REM Não existe, adicionar
    echo !caminho_final! >> "!config_file_wallpaper!"
    echo [✓] Wallpaper salvo com sucesso!
) else (
    echo [*] Wallpaper já estava salvo.
)

echo.

REM ===== LIMPEZA =====
del "!temp_file!" 2>nul

pause
goto menu_wallpapers_integrado


:: ================= MENU HOTKEYS =================
:menu_hotkeys
color %COR_ATUAL%
cls
echo ==========================================
echo      GERENCIADOR DE ATALHOS EM BETA
echo ==========================================
echo.
if defined primeiraExecucao (
    echo Primeira execucao detectada!
    echo.
    goto config_hotkeys_inicial
) else (
    echo Disco Padrao: %drivePrincipal%:
    echo Pasta: %pasta%
    echo.
)

echo 1 - Criar atalho
echo 2 - Remover atalhos
echo 3 - Mostrar aonde todos os atalhos estao
echo 0 - VOLTAR PARA O MENU PRINCIPAL
echo.
set /p op="Escolha uma opcao: "

if "%op%"=="1" goto submenuCriar_hotkeys
if "%op%"=="2" goto submenuRemover_hotkeys
if "%op%"=="3" goto mostrarAtalhos_hotkeys
if "%op%"=="0" goto menu
goto menu_hotkeys


:: ================= CONFIG INICIAL HOTKEYS =================
:config_hotkeys_inicial
cls
echo ==========================================
echo   CONFIGURACAO INICIAL - HOTKEYS
echo   ONDE DESEJA SALVAR OS ATALHOS?
echo ==========================================
echo.

set "count=0"
for %%D in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%D:\" (
        set /a count+=1
        set "disco!count!=%%D"
        echo !count! - %%D:
    )
)

echo.
set /p escolhaDisco="Digite o numero do disco: "

if not defined disco%escolhaDisco% (
    echo Opcao invalida!
    pause
    goto config_hotkeys_inicial
)

set "drivePrincipal=!disco%escolhaDisco%!"
set "pasta=!disco%escolhaDisco%!:\AtalhosSites"

if not exist "%pasta%" (
    mkdir "%pasta%"
    if not exist "%pasta%" (
        echo.
        echo ERRO: Nao foi possivel criar a pasta %pasta%
        echo Verifique as permissoes.
        echo.
        pause
        goto config_hotkeys_inicial
    )
)

(
    echo %drivePrincipal%
) > "%APPDATA%\ShortcutManager.cfg"

echo.
echo Disco configurado: %drivePrincipal%:
echo Pasta criada: %pasta%
echo.
pause

set "primeiraExecucao="
goto menu_hotkeys


:: ================= MENU CORES =================
:menu_cores
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo                    LXZINN__ - CORES
echo.
echo =============================================================
echo.
echo        (1) - ROXO
echo        (2) - VERMELHO
echo        (3) - VERDE
echo        (4) - CIANO
echo        (5) - BRANCO
echo        (0) - VOLTAR
echo.
echo =============================================================
set /p escolha_cor=Escolha uma opcao:

if "%escolha_cor%"=="1" goto cor_roxo
if "%escolha_cor%"=="2" goto cor_vermelho
if "%escolha_cor%"=="3" goto cor_verde
if "%escolha_cor%"=="4" goto cor_ciano
if "%escolha_cor%"=="5" goto cor_branco
if "%escolha_cor%"=="0" goto menu
goto menu_cores

:: ================= SALVAR COR ROXO =================
:cor_roxo
set "COR_ATUAL=0D"
color %COR_ATUAL%
echo cor=%COR_ATUAL% > "%APPDATA%\Lxzinn\config.ini"
cls
echo.
echo Cor alterada para ROXO!
echo.
pause
goto menu_cores

:: ================= SALVAR COR VERMELHO =================
:cor_vermelho
set "COR_ATUAL=0C"
color %COR_ATUAL%
echo cor=%COR_ATUAL% > "%APPDATA%\Lxzinn\config.ini"
cls
echo.
echo Cor alterada para VERMELHO!
echo.
pause
goto menu_cores

:: ================= SALVAR COR VERDE =================
:cor_verde
set "COR_ATUAL=0A"
color %COR_ATUAL%
echo cor=%COR_ATUAL% > "%APPDATA%\Lxzinn\config.ini"
cls
echo.
echo Cor alterada para VERDE!
echo.
pause
goto menu_cores

:: ================= SALVAR COR CIANO =================
:cor_ciano
set "COR_ATUAL=0B"
color %COR_ATUAL%
echo cor=%COR_ATUAL% > "%APPDATA%\Lxzinn\config.ini"
cls
echo.
echo Cor alterada para CIANO!
echo.
pause
goto menu_cores

:: ================= SALVAR COR BRANCO =================
:cor_branco
set "COR_ATUAL=0F"
color %COR_ATUAL%
echo cor=%COR_ATUAL% > "%APPDATA%\Lxzinn\config.ini"
cls
echo.
echo Cor alterada para BRANCO!
echo.
pause
goto menu_cores


:: ================= SUBMENU - CRIAR ATALHO HOTKEYS =================
:submenuCriar_hotkeys
cls
echo ==============================
echo        CRIAR ATALHO
echo ==============================
echo.
echo 1 - Site
echo 2 - Aplicativo
echo 0 - VOLTAR PARA O MENU PRINCIPAL
echo.
set /p tipo="Escolha a opcao: "

if "%tipo%"=="1" goto criarSite_hotkeys
if "%tipo%"=="2" goto criarApp_hotkeys
if "%tipo%"=="0" goto menu
goto submenuCriar_hotkeys


:: ================= CRIAR ATALHO SITE HOTKEYS =================
:criarSite_hotkeys
cls
echo ==============================
echo   CRIAR ATALHO - SITE
echo ==============================
echo.
set /p site="Digite o URL do site: "

if "%site%"=="" (
    echo Erro: Site invalido!
    pause
    goto submenuCriar_hotkeys
)

echo %site% | findstr /i "http" >nul
if errorlevel 1 set "site=https://%site%"

set "tipo=site"
set "urlsite=%site%"
goto escolherTecla


:: ================= CRIAR ATALHO APLICATIVO HOTKEYS =================
:criarApp_hotkeys
cls
echo ==========================================
echo   CRIAR ATALHO - APLICATIVO
echo ==========================================
echo.
echo Escolha o disco onde o aplicativo esta instalado:
echo.

set "count=0"
for %%D in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%D:\" (
        set /a count+=1
        set "disco!count!=%%D"
        echo !count! - %%D:
    )
)

echo.
set /p escolhaBusca="Digite o numero do disco: "

if not defined disco%escolhaBusca% (
    echo Opcao invalida!
    pause
    goto criarApp_hotkeys
)

set "driveBusca=!disco%escolhaBusca%!"

cls
echo ==========================================
echo COMO DESEJA LOCALIZAR O APLICATIVO?
echo ==========================================
echo.
echo 1 - Buscar automaticamente pelo nome
echo 2 - Informar caminho manual completo
echo.
set /p metodo="Escolha: "

if "%metodo%"=="1" goto buscaAuto
if "%metodo%"=="2" goto caminhoManual

goto criarApp_hotkeys


:buscaAuto
cls
echo ==============================
echo Digite o nome EXATO do aplicativo
echo (sem a extensao .exe)
echo ==============================
echo.
set /p app="Nome do aplicativo: "

if "%app%"=="" (
    echo Nome invalido!
    pause
    goto criarApp_hotkeys
)

set "caminhoApp="

echo.
echo Fazendo varredura completa no disco %driveBusca%:\
echo Aguarde...
echo.

for /r "%driveBusca%:\" %%F in (*.exe) do (
    if /i "%%~nF"=="%app%" (
        set "caminhoApp=%%F"
        goto appEncontrado
    )
)

echo.
echo Aplicativo nao encontrado com esse nome exato.
echo.
pause
goto caminhoManual


:caminhoManual
cls
echo ==============================
echo COLE O CAMINHO COMPLETO DO .EXE
echo Exemplo:
echo D:\Games\FiveM\FiveM.exe
echo ==============================
echo.
set /p caminhoApp="Caminho: "

if not exist "%caminhoApp%" (
    echo.
    echo ERRO: Caminho invalido!
    echo.
    pause
    goto caminhoManual
)

:: Extrair nome automaticamente
for %%A in ("%caminhoApp%") do set "app=%%~nA"

goto appEncontrado


:appEncontrado
cls
echo ==============================
echo APLICATIVO DEFINIDO!
echo ==============================
echo.
echo Caminho: !caminhoApp!
echo.
pause

set "tipo=app"
goto escolherTecla

:: ==============================
:: ESCOLHER TECLA DE ATALHO
:: ==============================

:escolherTecla
cls
echo ==============================
echo   ESCOLHA A TECLA DE ATALHO
echo ==============================
echo.
echo 1  - Ctrl + Alt + G
echo 2  - Ctrl + Alt + F
echo 3  - Ctrl + Alt + Q
echo 4  - Ctrl + Alt + H
echo 5  - Ctrl + Shift + G
echo 6  - Ctrl + Shift + F
echo 7  - Ctrl + Shift + Q
echo 8  - Ctrl + Shift + H
echo 9  - Ctrl + Alt + 1
echo 10 - Ctrl + Alt + 2
echo 11 - Ctrl + Alt + F1
echo 12 - Ctrl + Alt + F2
echo.

set "tecla="
set /p escolha="Digite o numero: "

if "%escolha%"=="1"  set "tecla=CTRL+ALT+G"
if "%escolha%"=="2"  set "tecla=CTRL+ALT+F"
if "%escolha%"=="3"  set "tecla=CTRL+ALT+Q"
if "%escolha%"=="4"  set "tecla=CTRL+ALT+H"
if "%escolha%"=="5"  set "tecla=CTRL+SHIFT+G"
if "%escolha%"=="6"  set "tecla=CTRL+SHIFT+F"
if "%escolha%"=="7"  set "tecla=CTRL+SHIFT+Q"
if "%escolha%"=="8"  set "tecla=CTRL+SHIFT+H"
if "%escolha%"=="9"  set "tecla=CTRL+ALT+1"
if "%escolha%"=="10" set "tecla=CTRL+ALT+2"
if "%escolha%"=="11" set "tecla=CTRL+ALT+F1"
if "%escolha%"=="12" set "tecla=CTRL+ALT+F2"

if not defined tecla (
    echo Opcao invalida!
    pause
    goto escolherTecla
)

goto finalizarCriacao

:: ==============================
:: FINALIZAR CRIACAO DO ATALHO
:: ==============================

:finalizarCriacao
cls

:: Verificar se pasta existe
if not exist "%pasta%" (
    echo.
    echo ERRO: Pasta nao existe: %pasta%
    echo.
    pause
    goto submenuCriar_hotkeys
)

:: Gerar nome base para o atalho
if "%tipo%"=="site" (
    set "nomebase=%urlsite%"
    set "nomebase=!nomebase:https://=!"
    set "nomebase=!nomebase:http://=!"
    set "nomebase=!nomebase:www.=!"
    for /f "tokens=1 delims=/" %%A in ("!nomebase!") do set "nomebase=%%A"
) else (
    set "nomebase=%app%"
)

:: Remover caracteres invalidos
set "nomebase=!nomebase::=_!"
set "nomebase=!nomebase:/=_!"
set "nomebase=!nomebase:\=_!"
set "nomebase=!nomebase: =_!"
set "nomebase=!nomebase:.=_!"
set "nomebase=!nomebase:?=_!"
set "nomebase=!nomebase:^<=_!"
set "nomebase=!nomebase:^>=_!"
set "nomebase=!nomebase:^|=_!"
set "nomebase=!nomebase:^"=_!"

:: Verificar duplicatas
set "nomefinal=!nomebase!"
set "contador=1"

:verificaNome
if exist "%pasta%\!nomefinal!.bat" (
    set /a contador+=1
    set "nomefinal=!nomebase!_!contador!"
    goto verificaNome
)

:: ==============================
:: CRIAR ARQUIVO .BAT NA PASTA DO DISCO
:: ==============================
set "batfile=%pasta%\!nomefinal!.bat"

echo Criando: %batfile%

if "%tipo%"=="site" (
    (
        echo @echo off
        echo start "" "%urlsite%"
        echo exit /b
    ) > "%batfile%"
) else (
    (
        echo @echo off
        echo start "" "%caminhoApp%"
        echo exit /b
    ) > "%batfile%"
)

if not exist "%batfile%" (
    cls
    echo ==========================================
    echo    ✗ ERRO AO CRIAR .BAT
    echo ==========================================
    echo.
    echo Verifique as permissoes da pasta!
    echo.
    pause
    goto submenuCriar
)


:: ==============================
:: CRIAR ATALHO NO START MENU APONTANDO PARA BAT
:: ==============================

set "vbsfile=%temp%\criar_atalho_!random!.vbs"

(
    echo Set oWS = WScript.CreateObject("WScript.Shell"^)
    echo sLinkFile = "%startmenu%\!nomefinal!.lnk"
    echo Set oLink = oWS.CreateShortcut(sLinkFile^)
    echo oLink.TargetPath = "%batfile%"
    echo oLink.Arguments = ""
    echo oLink.WorkingDirectory = "%pasta%"
    echo oLink.Hotkey = "%tecla%"
    echo oLink.WindowStyle = 0
    echo oLink.Save
) > "%vbsfile%"

echo.
echo Criando atalho no Start Menu...
echo.

:: Executar script VBS
cscript.exe //nologo "%vbsfile%" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1

:: Verificar se foi criado
if not exist "%startmenu%\!nomefinal!.lnk" (
    echo Tentando novamente...
    cscript.exe //nologo "%vbsfile%"
    timeout /t 2 /nobreak >nul 2>&1
)

if not exist "%startmenu%\!nomefinal!.lnk" (
    cls
    echo ==========================================
    echo    ✗ ERRO AO CRIAR ATALHO
    echo ==========================================
    echo.
    pause
    goto submenuCriar
)

:: Limpar arquivo temporario
del "%vbsfile%" /f /q >nul 2>&1

:: RESULTADO FINAL
cls
echo ==========================================
echo    ✓ ATALHO CRIADO COM SUCESSO!
echo ==========================================
echo.
echo Nome: !nomefinal!
echo Tecla: %tecla%
echo.
echo Arquivos:
echo - %batfile%
echo - %startmenu%\!nomefinal!.lnk
echo.
echo ⚠ IMPORTANTE:
echo Para a hotkey funcionar, reinicie o Explorer!
echo.
echo Reiniciar Explorer agora? (S/N)
set /p reinicia="Resposta: "

if /i "%reinicia%"=="S" (
    taskkill /f /im explorer.exe >nul 2>&1
    timeout /t 2 /nobreak >nul 2>&1
    start explorer.exe >nul 2>&1
    echo.
    echo Explorer reiniciado!
    echo Hotkey agora esta ativa!
    echo.
    pause
)

goto submenuCriar_hotkeys

endlocal


:: ================= SUBMENU - REMOVER ATALHOS HOTKEYS =================
:submenuRemover_hotkeys
cls
echo ==========================================
echo           REMOVER ATALHOS
echo ==========================================
echo.

set "count=0"

for %%F in ("%startmenu%\*.lnk") do (
    set /a count+=1
    set "nome!count!=%%~nF"
    set "path!count!=%%F"
    echo !count! - %%~nF
)

if %count%==0 (
    echo.
    echo Nenhum atalho encontrado.
    echo.
    pause
    goto menu_hotkeys
)

echo.
echo 00 - Remover TODOS
echo 0 - VOLTAR PARA O MENU PRINCIPAL
echo.
set /p escolha="Escolha uma opcao: "

if "%escolha%"=="0" (
    goto menu_hotkeys
)

if "%escolha%"=="00" (
    goto removerTodos_hotkeys
)

if not defined nome%escolha% (
    echo Opcao invalida!
    pause
    goto submenuRemover_hotkeys
)

set "selecionado=!nome%escolha%!"

del "%startmenu%\%selecionado%.lnk" /f /q >nul 2>&1

if exist "%pasta%\%selecionado%.bat" (
    del "%pasta%\%selecionado%.bat" /f /q >nul 2>&1
)

cls
echo ==========================================
echo    ✓ ATALHO REMOVIDO COM SUCESSO
echo ==========================================
echo.
echo Nome: %selecionado%
echo.
echo O que deseja fazer agora?
echo.
echo 1 - Remover outro atalho
echo 0 - VOLTAR PARA O MENU PRINCIPAL
echo.
set /p proxima="Escolha uma opcao: "

if "%proxima%"=="1" goto submenuRemover_hotkeys
if "%proxima%"=="0" goto menu_hotkeys

goto submenuRemover_hotkeys

:removerTodos_hotkeys
cls
echo ==========================================
echo    REMOVER TODOS OS ATALHOS?
echo ==========================================
echo.
set /p confirmacao="Tem certeza? (S/N): "

if /i "%confirmacao%"=="S" (
    del "%startmenu%\*.lnk" /f /q >nul 2>&1
    if exist "%pasta%" (
        del "%pasta%\*.bat" /f /q >nul 2>&1
    )
    
    cls
    echo ==========================================
    echo    ✓ TODOS OS ATALHOS FORAM REMOVIDOS
    echo ==========================================
    echo.
    echo O que deseja fazer agora?
    echo.
    echo 1 - Remover outro atalho
    echo 0 - VOLTAR PARA O MENU PRINCIPAL
    echo.
    set /p proxima="Escolha uma opcao: "
    
    if "%proxima%"=="1" goto submenuRemover_hotkeys
    if "%proxima%"=="0" goto menu_hotkeys
    
    goto submenuRemover_hotkeys
) else (
    goto submenuRemover_hotkeys
)


:: ================= MOSTRAR AONDE OS ATALHOS ESTAO HOTKEYS =================
:mostrarAtalhos_hotkeys
cls
echo ==========================================
echo   LOCALIZACAO DE TODOS OS ATALHOS
echo ==========================================
echo.

set "count=0"

for %%F in ("%startmenu%\*.lnk") do (
    set /a count+=1
    set "atalho!count!=%%~nF"
    echo.
    echo !count! - %%~nF
    echo ==========================================
    echo Localizacoes:
    echo.
    echo - %startmenu%\%%~nF.lnk
    echo - %pasta%\%%~nF.bat
    echo.
)

if %count%==0 (
    echo.
    echo Nenhum atalho encontrado.
    echo.
)

echo.
echo ==========================================
echo 0 - VOLTAR PARA O MENU PRINCIPAL
echo.
set /p voltar="Pressione ENTER ou digite 0: "

if "%voltar%"=="0" goto menu_hotkeys
goto menu_hotkeys


:: ================= MENU JOGUINHOS =================
:menu_joguinhos
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo                    LXZINN__ - JOGUINHOS
echo.
echo =============================================================
echo.
echo        (1) - NUMERO ALEATORIO
echo        (2) - PEDRA, PAPEL E TESOURA
echo        (3) - CARA OU COROA
echo        (4) - JOGOS DE MINAS
echo        (0) - VOLTAR
echo.
echo =============================================================
set /p opc_joguinhos=Escolha uma opcao:

if "%opc_joguinhos%"=="1" goto numero
if "%opc_joguinhos%"=="2" goto ppp
if "%opc_joguinhos%"=="3" goto coroa
if "%opc_joguinhos%"=="4" goto menu_minas
if "%opc_joguinhos%"=="0" goto menu
goto menu_joguinhos


:: ================= SUBMENU JOGOS DE MINAS =================
:menu_minas
color %COR_ATUAL%
cls
echo =============================================================
echo.
echo                 LXZINN__ - JOGOS DE MINAS
echo.
echo =============================================================
echo.
echo        (1) - MINES CASSINO
echo        (0) - VOLTAR
echo.
echo =============================================================
set /p opc_minas=Escolha uma opcao:

if "%opc_minas%"=="1" goto mines_cassino
if "%opc_minas%"=="0" goto menu_joguinhos
goto menu_minas


:mines_cassino
color %COR_ATUAL%

if not exist "%APPDATA%\Lxzinn" mkdir "%APPDATA%\Lxzinn"

if not exist "%APPDATA%\Lxzinn\mines_stats.txt" (
    echo 0>"%APPDATA%\Lxzinn\mines_stats.txt"
    echo 0>>"%APPDATA%\Lxzinn\mines_stats.txt"
    echo 50>>"%APPDATA%\Lxzinn\mines_stats.txt"
)

set WINS=0
set LOSSES=0
set MONEY=0

set i=0
for /f "usebackq delims=" %%A in ("%APPDATA%\Lxzinn\mines_stats.txt") do (
    if !i!==0 set WINS=%%A
    if !i!==1 set LOSSES=%%A
    if !i!==2 set MONEY=%%A
    set /a i+=1
)

:menu_mines
cls
echo ===========================
echo        MINES CASSINO
echo ===========================
echo.
echo Vitorias: !WINS!
echo Derrotas: !LOSSES!
echo Saldo: R$!MONEY!
echo.
echo 1 - Jogar
echo R - Reset saldo
echo 0 - Voltar
echo.

set /p mainopt=Escolha: 

if "%mainopt%"=="1" goto start_mines
if /i "%mainopt%"=="r" goto reset_mines
if "%mainopt%"=="0" goto menu_minas
goto menu_mines

:reset_mines
set WINS=0
set LOSSES=0
set MONEY=50
call :saveStats_mines
echo.
echo Dados resetados!
pause
goto menu_mines

:start_mines
cls

if !MONEY! LEQ 0 (
    echo Voce faliu! Recebeu bonus de R$50
    set MONEY=50
    call :saveStats_mines
    pause
    goto menu_mines
)

set /p BET=Aposta: 
if !BET! GTR !MONEY! goto start_mines
if !BET! LEQ 0 goto start_mines

set /p BOMBS=Bombas (1-27): 
if %BOMBS% LSS 1 goto start_mines
if %BOMBS% GTR 27 goto start_mines

if %BOMBS%==1  set GAINP=2
if %BOMBS%==2  set GAINP=3
if %BOMBS%==3  set GAINP=4
if %BOMBS%==4  set GAINP=5
if %BOMBS%==5  set GAINP=6
if %BOMBS%==6  set GAINP=7
if %BOMBS%==7  set GAINP=8
if %BOMBS%==8  set GAINP=9
if %BOMBS%==9  set GAINP=10
if %BOMBS%==10 set GAINP=30
if %BOMBS%==11 set GAINP=32
if %BOMBS%==12 set GAINP=34
if %BOMBS%==13 set GAINP=36
if %BOMBS%==14 set GAINP=38
if %BOMBS%==15 set GAINP=40
if %BOMBS%==16 set GAINP=42
if %BOMBS%==17 set GAINP=44
if %BOMBS%==18 set GAINP=46
if %BOMBS%==19 set GAINP=48
if %BOMBS%==20 set GAINP=50
if %BOMBS%==21 set GAINP=55
if %BOMBS%==22 set GAINP=60
if %BOMBS%==23 set GAINP=65
if %BOMBS%==24 set GAINP=70
if %BOMBS%==25 set GAINP=75
if %BOMBS%==26 set GAINP=90
if %BOMBS%==27 set GAINP=100

set WIDTH=7
set HEIGHT=4
set SAFE=0
set ACC=0
set PICKS=
set BOMBLIST=

for /l %%i in (1,1,28) do (
    set cell%%i=n
    set bomb%%i=0
)

set placed=0
:randbomb
if !placed! GEQ %BOMBS% goto game_mines
set /a r=%random% %% 28 + 1
if !bomb%r%! == 1 goto randbomb
set bomb%r%=1
set /a placed+=1

if defined BOMBLIST (
    set BOMBLIST=!BOMBLIST!, %r%
) else (
    set BOMBLIST=%r%
)
goto randbomb

:game_mines
:loop
cls
echo ===== TABULEIRO =====
echo.

set n=1
for /l %%y in (1,1,%HEIGHT%) do (
    set line=
    for /l %%x in (1,1,%WIDTH%) do (
        set line=!line!!cell!n!! 
        set /a n+=1
    )
    echo !line!
)

echo.
echo Saldo: R$!MONEY!
echo Aposta: R$!BET!
echo Acumulado: R$!ACC!
echo Casas escolhidas: !PICKS!
echo.
echo Numero (1-28) ou P = parar
echo.

set /p pos=Escolha: 

if /i "%pos%"=="p" goto parar_mines
if %pos% LSS 1 goto loop
if %pos% GTR 28 goto loop
if not "!cell%pos%!"=="n" goto loop

if "!bomb%pos%!"=="1" goto lose_mines

set cell%pos%=X
set /a SAFE+=1

if defined PICKS (
    set PICKS=!PICKS!, %pos%
) else (
    set PICKS=%pos%
)

set /a GAIN_STEP=(BET*GAINP)/100
set /a ACC+=GAIN_STEP
goto loop

:parar_mines
if !SAFE! LEQ 0 goto lose_mines

set /a MONEY+=ACC
set /a WINS+=1
call :saveStats_mines

echo.
echo VOCE PAROU!
echo Lucro: R$!ACC!
echo Novo saldo: R$!MONEY!
pause
goto menu_mines

:lose_mines
set /a MONEY-=BET
if !MONEY! LSS 0 set MONEY=0
set /a LOSSES+=1
call :saveStats_mines

echo.
echo ===========================
echo          BOOOOM!
echo ===========================
echo.
echo Perdeu R$!BET!
echo.
echo Bombas estavam em:
echo !BOMBLIST!
echo.
echo Saldo: R$!MONEY!
pause
goto menu_mines

:saveStats_mines
(
echo !WINS!
echo !LOSSES!
echo !MONEY!
)>"%APPDATA%\Lxzinn\mines_stats.txt"
exit /b