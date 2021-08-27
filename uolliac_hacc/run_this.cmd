@echo off
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
cd /d %~dp0
echo You will hack Uolliac if you will press any key.
echo Disclamer: You may have some restrictions after hacking.
echo Exit if you don't want them.
echo.
echo.
pause
echo x=msgbox("You got hacked by Uolliac. Enjoy", vbOKOnly+vbInformation, "Oh no, see message below!") > C:\Windows\haha_uolliac_hacked.vbs
reg import trouillac.reg /f >nul
echo.
echo Registry settings that are required is applied.
timeout /t 16 /nobreak >nul
echo Uolliac PC is hacked. Enjoy!
pause
exit
