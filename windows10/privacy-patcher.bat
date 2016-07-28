@ECHO OFF
title Windows 10 Privacy Patcher
ECHO ======================================
ECHO ==    Windows 10 Privacy Patcher    ==
ECHO ==        By Kyle Colantonio        ==
ECHO ======================================
ECHO.
ECHO This script will patch Windows 10 to block all
ECHO data harvesting requests to Microsoft. For more
ECHO information, please visit: https://goo.gl/s4LO8h
ECHO.
ECHO For a detailed explaination on this script, please
ECHO visit: https://github.com/IAreKyleW00t/windows-tweaks
ECHO.
CHOICE /M "Are you sure you want to run this script?"
IF %ERRORLEVEL% == 2 GOTO EXIT

:: The following section will check to make sure guest OS is Windows 10 before proceeding.
:: Previous versions of Windows do not need this patch.
:CHK_WINVER
setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set WINVER=%%i.%%j
IF NOT "%WINVER%" == "10.0" (
	ECHO.
	ECHO This script is only for Windows 10 -- Other versions of Windows are safe already!
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
ECHO Beginning system patch -- This shouldn't take long...

:: The following section will update the Windows hosts file to null-route
:: all known data harvesting hostnames. To prevent any issues, an empty line is
:: appending before we beginning adding all of the hostnames. This is done for
:: both IPv4 and IPv6.
:STEP_1
ECHO.
<NUL SET /P o="[1] Updating Windows hosts file... "
ECHO. >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 a-0001.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 a-0002.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 a-0003.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 a-0004.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 a-0005.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 a-0006.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 a-0007.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 a-0008.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 a-0009.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 a.ads1.msn.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 a.ads2.msn.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 ad.doubleclick.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 adnexus.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 adnxs.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 ads.msn.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 ads1.msads.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 ads1.msn.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 az361816.vo.msecnd.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 az512334.vo.msecnd.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 choice.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 choice.microsoft.com.nsatc.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 compatexchange.cloudapp.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 corp.sts.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 corpext.msitadfs.glbdns2.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 cs1.wpc.v0cdn.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 df.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 diagnostics.support.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 fe1.update.microsoft.com.akadns.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 fe2.update.microsoft.com.akadns.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 feedback.microsoft-hohm.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 feedback.search.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 feedback.windows.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 i1.services.social.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 i1.services.social.microsoft.com.nsatc.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 oca.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 oca.telemetry.microsoft.com.nsatc.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 pre.footprintpredict.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 preview.msn.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 rad.msn.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 redir.metaservices.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 reports.wes.df.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 services.wes.df.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 settings-sandbox.data.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 sls.update.microsoft.com.akadns.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 sqm.df.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 sqm.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 sqm.telemetry.microsoft.com.nsatc.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 statsfe1.update.microsoft.com.akadns.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 statsfe1.ws.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 statsfe2.update.microsoft.com.akadns.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 statsfe2.ws.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 survey.watson.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 telecommand.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 telecommand.telemetry.microsoft.com.nsatc.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 telemetry.appex.bing.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 telemetry.appex.bing.net:443 >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 telemetry.urs.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 vortex-sandbox.data.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 vortex-win.data.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 vortex.data.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 watson.live.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 watson.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 watson.ppe.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 watson.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 watson.telemetry.microsoft.com.nsatc.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 wes.df.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO 0.0.0.0 www.msftncsi.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: a-0001.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: a-0002.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: a-0003.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: a-0004.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: a-0005.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: a-0006.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: a-0007.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: a-0008.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: a-0009.a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: a-msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: a.ads1.msn.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: a.ads2.msn.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: ad.doubleclick.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: adnexus.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: adnxs.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: ads.msn.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: ads1.msads.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: ads1.msn.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: az361816.vo.msecnd.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: az512334.vo.msecnd.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: choice.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: choice.microsoft.com.nsatc.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: compatexchange.cloudapp.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: corp.sts.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: corpext.msitadfs.glbdns2.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: cs1.wpc.v0cdn.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: df.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: diagnostics.support.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: fe1.update.microsoft.com.akadns.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: fe2.update.microsoft.com.akadns.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: feedback.microsoft-hohm.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: feedback.search.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: feedback.windows.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: i1.services.social.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: i1.services.social.microsoft.com.nsatc.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: msedge.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: oca.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: oca.telemetry.microsoft.com.nsatc.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: pre.footprintpredict.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: preview.msn.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: rad.msn.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: redir.metaservices.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: reports.wes.df.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: services.wes.df.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: settings-sandbox.data.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: sls.update.microsoft.com.akadns.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: sqm.df.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: sqm.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: sqm.telemetry.microsoft.com.nsatc.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: statsfe1.update.microsoft.com.akadns.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: statsfe1.ws.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: statsfe2.update.microsoft.com.akadns.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: statsfe2.ws.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: survey.watson.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: telecommand.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: telecommand.telemetry.microsoft.com.nsatc.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: telemetry.appex.bing.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: telemetry.appex.bing.net:443 >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: telemetry.urs.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: vortex-sandbox.data.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: vortex-win.data.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: vortex.data.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: watson.live.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: watson.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: watson.ppe.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: watson.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: watson.telemetry.microsoft.com.nsatc.net >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: wes.df.telemetry.microsoft.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO :: www.msftncsi.com >> %WINDIR%/System32/drivers/etc/hosts
ECHO DONE!

:: The following section will update Windows firewall to block multiple IP's that
:: are known to harvest/request user data from within Windows 10. These IP's belong
:: to Akamai, United States Superior Edgar Rental Corp., and Microsoft itself.
:: This will block any requests from these IP's on any protocol.
:STEP_2
ECHO.
<NUL SET /P o="[2] Updating Windows Firewall... "
netsh advfirewall firewall add rule name="Block Microsoft IP (Akamai)" dir=out protocol=any remoteip="2.22.61.43" profile=any action=block >NUL 2>&1
netsh advfirewall firewall add rule name="Block Microsoft IP (Akamai)" dir=out protocol=any remoteip="2.22.61.66" profile=any action=block >NUL 2>&1
netsh advfirewall firewall add rule name="Block Microsoft IP (Akamai)" dir=out protocol=any remoteip="23.218.212.69" profile=any action=block >NUL 2>&1
netsh advfirewall firewall add rule name="Block Microsoft IP (SEC)" dir=out protocol=any remoteip="65.39.117.230" profile=any action=block >NUL 2>&1
netsh advfirewall firewall add rule name="Block Microsoft IP" dir=out protocol=any remoteip="65.55.108.23" profile=any action=block >NUL 2>&1
netsh advfirewall firewall add rule name="Block Microsoft IP" dir=out protocol=any remoteip="134.170.30.202" profile=any action=block >NUL 2>&1
netsh advfirewall firewall add rule name="Block Microsoft IP" dir=out protocol=any remoteip="137.116.81.24" profile=any action=block >NUL 2>&1
netsh advfirewall firewall add rule name="Block Microsoft IP" dir=out protocol=any remoteip="157.56.106.189" profile=any action=block >NUL 2>&1
netsh advfirewall firewall add rule name="Block Microsoft IP" dir=out protocol=any remoteip="204.79.197.200" profile=any action=block >NUL 2>&1
ECHO DONE!

:: The following section will diable Telemetry within Windows via the registry.
:: Even if this wasn't disabled, blocking the hostnames and IP's would prevent any
:: information from being sent.
:STEP_3
ECHO.
<NUL SET /P o="[3] Disabling Telemetry... "
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /f /v "AllowTelemetry" /t REG_DWORD /d 0 >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\DataCollection" /f /v "AllowTelemetry" /t REG_DWORD /d 0 >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack" /f /v "Start" /t REG_DWORD /d 4 >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\dmwappushservice" /f /v "Start" /t REG_DWORD /d 4 >NUL 2>&1
ECHO DONE!

:: The following section will disable any services that are soley for collecting data.
:: To be safe, we disable instead of deleting them.
:STEP_4
ECHO.
<NUL SET /P o="[4] Disabling Data Collecting Services... "
net stop DiagTrack >NUL 2>&1
net stop dmwappushservice >NUL 2>&1
net stop Wecsvc >NUL 2>&1
sc config dmwappushservice start= disabled >NUL 2>&1
sc config diagtrack start= disabled >NUL 2>&1
sc config Wecsvc start= disabled >NUL 2>&1
ECHO DONE!

:: The following section will block the SYSTEM from modifying the DiagTrack Log
:: file and then clears the file entirely.
:STEP_5
ECHO.
<NUL SET /P o="[5] Disabling and Clearing DiagTrack Log... "
takeown /f %PROGRAMDATA%\Microsoft\Diagnosis\ETLLogs\Autologger\Autologger-Diagtrack-Listener.etl >NUL 2>&1
icacls %PROGRAMDATA%\Microsoft\Diagnosis\ETLLogs\Autologger\Autologger-Diagtrack-Listener.etl /grant administrators:F >NUL 2>&1
ECHO Y|cacls %PROGRAMDATA%\Microsoft\Diagnosis\ETLLogs\Autologger\Autologger-Diagtrack-Listener.etl /d SYSTEM >NUL 2>&1
BREAK>%PROGRAMDATA%\Microsoft\Diagnosis\ETLLogs\Autologger\Autologger-Diagtrack-Listener.etl
ECHO DONE!

:END
ECHO.
ECHO Your system has been patched successfully!
GOTO EXIT

:EXIT
PAUSE & EXIT