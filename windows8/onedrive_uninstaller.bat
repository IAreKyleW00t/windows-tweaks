@ECHO OFF
title Windows 8/8.1 OneDrive Uninstaller
ECHO ==============================================
ECHO ==    Windows 8/8.1 OneDrive Uninstaller    ==
ECHO ==            By Kyle Colantonio            ==
ECHO ==============================================
ECHO.
ECHO This script will completely remove OneDrive
ECHO from Windows 8/8.1. For more information on
ECHO this, please visit: https://goo.gl/Z8vU3W
ECHO.
ECHO For a detailed explaination on this script, please
ECHO visit: https://github.com/IAreKyleW00t/windows-tweaks
ECHO.
CHOICE /M "Are you sure you want to run this script?"
IF %ERRORLEVEL% == 2 GOTO EXIT

:: The following section will check to make sure guest OS is Windows 8/8.1 before proceeding.
:CHK_WINVER
setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set WINVER=%%i.%%j
IF NOT "%WINVER%" == "6.3" (
	IF NOT "%WINVER%" == "6.2" (
		ECHO.
		ECHO This script is only for Windows 8/8.1 -- Other versions of Windows do not need this!
		GOTO EXIT
	) ELSE GOTO CHK_PRIV 
) ELSE GOTO CHK_PRIV 
endlocal

:: The following section will make sure we running this script as admin. This is required
:: since we will be making changes to the OS itself and cannot do this otherwise.
:CHK_PRIV
NET SESSION >NUL 2>&1
IF NOT %ERRORLEVEL% == 0 (
	ECHO.
	ECHO This script must be ran as administrator -- https://goo.gl/O7ATnm
	GOTO EXIT
) ELSE GOTO START

:START
ECHO.
ECHO Uninstalling OneDrive -- This shouldn't take long...

:: The following section will kill any OneDrive process that may be running in the
:: background. Without this, we would not be able to uninstall it later.
:STEP_1
ECHO.
<NUL SET /P o="[1] Killing OneDrive process... "
taskkill /f /im OneDrive.exe >NUL 2>&1
ping 127.0.0.1 -n 5 >NUL 2>&1
ECHO DONE!

:: The following section will remove the OneDrive section from the Explorer SidePanel.
:STEP_2
ECHO.
<NUL SET /P o="[2] Removing OneDrive from Explorer SidePanel... "
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Skydrive" /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Skydrive" /v DisableFileSync /t REG_DWORD /d 1 /f >NUL 2>&1
ECHO DONE!

:: The following section will remove all old files leftover by OneDrive. These are
:: unneeded at this point and will be recreated automatically if the user ever decides
:: to reinstall OneDrive.
:STEP_3
ECHO.
<NUL SET /P o="[3] Cleaning up old OneDrive files... "
RD "%USERPROFILE%\OneDrive" /Q /S >NUL 2>&1
RD "C:\OneDriveTemp" /Q /S >NUL 2>&1
RD "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S >NUL 2>&1
RD "%PROGRAMDATA%\Microsoft OneDrive" /Q /S >NUL 2>&1
ECHO DONE!

:END
ECHO.
ECHO OneDrive has been uninstalled successfully!
GOTO EXIT

:EXIT
PAUSE & EXIT