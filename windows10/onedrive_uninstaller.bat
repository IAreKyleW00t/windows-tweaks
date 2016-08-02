@ECHO OFF
title Windows 10 OneDrive Uninstaller
ECHO ===========================================
ECHO ==    Windows 10 OneDrive Uninstaller    ==
ECHO ==          By: Kyle Colantonio          ==
ECHO ===========================================
ECHO.
ECHO This script will completely remove OneDrive
ECHO from Windows 10. For more information on this,
ECHO please visit: https://goo.gl/Z8vU3W
ECHO.
ECHO For a detailed explaination on this script, please
ECHO visit: https://github.com/IAreKyleW00t/windows-tweaks
ECHO.
CHOICE /M "Are you sure you want to run this script?"
IF %ERRORLEVEL% == 2 GOTO EXIT

:: Location of OneDrive setup files for both 32-bit and 64-bit
:: machines accordingly. (These will be checked later)
SET OD32="%WINDIR%\System32\OneDriveSetup.exe"
SET OD64="%WINDIR%\SysWOW64\OneDriveSetup.exe"

:: The following section will check to make sure guest OS is Windows 10 before proceeding.
:CHK_WINVER
setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set WINVER=%%i.%%j
IF NOT "%WINVER%" == "10.0" (
	ECHO.
	ECHO This script is only for Windows 10 -- Other versions of Windows do not need this!
	GOTO EXIT
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

:: The following section will uninstall OneDrive from Windows based on the version
:: that is installed (32-bit or 64-bit).
:STEP_2
ECHO.
<NUL SET /P o="[2] Uninstalling OneDrive... "
IF EXIST %OD64% %OD64% /uninstall >NUL 2>&1
ELSE %OD32% /uninstall >NUL 2>&1
ECHO DONE!

:: The following section will remove the OneDrive section from the Explorer SidePanel
:: for both 32-bit and 64-bit versions. If the 64-bit version doesn't exist, it'll be ignored.
:STEP_3
ECHO.
<NUL SET /P o="[3] Removing OneDrive from Explorer SidePanel... "
reg delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f >NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f >NUL 2>&1
ECHO DONE!

:: The following section will remove all old files leftover by OneDrive. These are
:: unneeded at this point and will be recreated automatically if the user ever decides
:: to reinstall OneDrive.
:STEP_4
ECHO.
<NUL SET /P o="[4] Cleaning up old OneDrive files... "
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