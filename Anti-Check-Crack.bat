@echo off
cls
powershell -command "Remove-Item (Get-PSReadLineOption).HistorySavePath -ErrorAction SilentlyContinue"
color 0A
echo +========================================================+
echo ^|               POWERSHELL SECURITY CONTROL            ^|
echo +========================================================+
echo ^|                                                        ^|
echo ^|  [0] Block PowerShell (Constrained Language Mode)    ^|
echo ^|  [1] Unblock PowerShell (Restore Default Mode)       ^|
echo ^|                                                        ^|
echo +========================================================+
echo.
set /p userinput= ^> Nhap lua chon cua ban (0 hoac 1): 

if "%userinput%"=="0" goto op_block
if "%userinput%"=="1" goto op_unblock
exit

:op_block
setx /M __PSLockdownPolicy 4
echo.
pause
exit

:op_unblock
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v __PSLockdownPolicy /f
echo.
pause
exit
