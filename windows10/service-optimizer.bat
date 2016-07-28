@ECHO OFF
title Windows 10 Service Optimizier
ECHO ========================================
ECHO ==    Windows 10 Service Optimizer    ==
ECHO ==         By Kyle Colantonio         ==
ECHO ========================================
ECHO.
ECHO This script will optimize the services in
ECHO Windows 10 to help improve overall performance.
ECHO For more information, please visit: http://goo.gl/xbvmpU
ECHO.
ECHO For a detailed explaination on this script, please
ECHO visit: https://github.com/IAreKyleW00t/windows-tweaks
ECHO.
CHOICE /M "Are you sure you want to run this script?"
IF %ERRORLEVEL% == 2 GOTO EXIT

:: The following section will check to make sure guest OS is Windows 10 before proceeding.
:: Other versions of Windows should download their respective version of this script.
:CHK_WINVER
setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set WINVER=%%i.%%j
IF NOT "%WINVER%" == "10.0" (
	ECHO.
	ECHO This script is only for Windows 10 -- Please use the one for your version of Windows
	ECHO https://github.com/IAreKyleW00t/windows-tweaks
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

:: The following section will prompt the user to choose which level of optimizations
:: they want applied to their system. All of these are safe and should work without any issues.
:: DEFAULT will restore all services to Windows default values.
:START
ECHO.
ECHO Please choose one of the following service optimizations...
ECHO    DEFAULT = Default settings within Windows 10
ECHO    SAFE = Safely optimized services (Recommended)
ECHO    TWEAKED = More optimized services (Advanced Users)
ECHO.
CHOICE /C DST /M "DEFAULT (D), SAFE (S), or TWEAKED (T)"
IF %ERRORLEVEL% == 1 GOTO DEFAULT
IF %ERRORLEVEL% == 2 GOTO SAFE
IF %ERRORLEVEL% == 3 GOTO TWEAKED

:: The following section will restore all Windows services to their
:: known default startup values. This will remove any problems that might occur.
:DEFAULT
ECHO.
ECHO Now applying DEFAULT service optimizations -- This shouldn't take long...
ECHO    ^> AxInstSV set to DEMAND & sc config AxInstSV start=demand >NUL 2>&1
ECHO    ^> AJRouter set to DEMAND & sc config AJRouter start=demand >NUL 2>&1
ECHO    ^> AppReadiness set to DEMAND & sc config AppReadiness start=demand >NUL 2>&1
ECHO    ^> AppHostSvc set to DISABLED & sc config AppHostSvc start=disabled >NUL 2>&1
ECHO    ^> AppIDSvc set to DEMAND & sc config AppIDSvc start=demand >NUL 2>&1
ECHO    ^> Appinfo set to DEMAND & sc config Appinfo start=demand >NUL 2>&1
ECHO    ^> ALG set to DEMAND & sc config ALG start=demand >NUL 2>&1
ECHO    ^> AppMgmt set to DEMAND & sc config AppMgmt start=demand >NUL 2>&1
ECHO    ^> AppXSVC set to DEMAND & sc config AppXSVC start=demand >NUL 2>&1
ECHO    ^> aspnet_state set to DISABLED & sc config aspnet_state start=disabled >NUL 2>&1
ECHO    ^> BITS set to DELAYED-AUTO & sc config BITS start=delayed-auto >NUL 2>&1
ECHO    ^> BrokerInfrastructure set to AUTO & sc config BrokerInfrastructure start=auto >NUL 2>&1
ECHO    ^> BFE set to AUTO & sc config BFE start=auto >NUL 2>&1
ECHO    ^> BDESVC set to DEMAND & sc config BDESVC start=demand >NUL 2>&1
ECHO    ^> wbengine set to DEMAND & sc config wbengine start=demand >NUL 2>&1
ECHO    ^> BthHFSrv set to DEMAND & sc config BthHFSrv start=demand >NUL 2>&1
ECHO    ^> bthserv set to DEMAND & sc config bthserv start=demand >NUL 2>&1
ECHO    ^> PeerDistSvc set to DEMAND & sc config PeerDistSvc start=demand >NUL 2>&1
ECHO    ^> CDPSvc set to DEMAND & sc config CDPSvc start=demand >NUL 2>&1
ECHO    ^> CertPropSvc set to DEMAND & sc config CertPropSvc start=demand >NUL 2>&1
ECHO    ^> c2wts set to DEMAND & sc config c2wts start=demand >NUL 2>&1
ECHO    ^> NfsClnt set to DISABLED & sc config NfsClnt start=disabled >NUL 2>&1
ECHO    ^> ClipSVC set to DEMAND & sc config ClipSVC start=demand >NUL 2>&1
ECHO    ^> KeyIso set to DEMAND & sc config KeyIso start=demand >NUL 2>&1
ECHO    ^> EventSystem set to AUTO & sc config EventSystem start=auto >NUL 2>&1
ECHO    ^> COMSysApp set to DEMAND & sc config COMSysApp start=demand >NUL 2>&1
ECHO    ^> Browser set to DEMAND & sc config Browser start=demand >NUL 2>&1
ECHO    ^> CoreUIRegistrar set to AUTO & sc config CoreUIRegistrar start=auto >NUL 2>&1
ECHO    ^> VaultSvc set to DEMAND & sc config VaultSvc start=demand >NUL 2>&1
ECHO    ^> CryptSvc set to AUTO & sc config CryptSvc start=auto >NUL 2>&1
ECHO    ^> DsSvc set to DEMAND & sc config DsSvc start=demand >NUL 2>&1
ECHO    ^> DcpSvc set to DEMAND & sc config DcpSvc start=demand >NUL 2>&1
ECHO    ^> DcomLaunch set to AUTO & sc config DcomLaunch start=auto >NUL 2>&1
ECHO    ^> DoSvc set to DELAYED-AUTO & sc config DoSvc start=delayed-auto >NUL 2>&1
ECHO    ^> DeviceAssociationService set to DEMAND & sc config DeviceAssociationService start=demand >NUL 2>&1
ECHO    ^> DeviceInstall set to DEMAND & sc config DeviceInstall start=demand >NUL 2>&1
ECHO    ^> DmEnrollmentSvc set to DEMAND & sc config DmEnrollmentSvc start=demand >NUL 2>&1
ECHO    ^> DsmSVC set to DEMAND & sc config DsmSVC start=demand >NUL 2>&1
ECHO    ^> DevQueryBroker set to DEMAND & sc config DevQueryBroker start=demand >NUL 2>&1
ECHO    ^> Dhcp set to AUTO & sc config Dhcp start=auto >NUL 2>&1
ECHO    ^> DPS set to AUTO & sc config DPS start=auto >NUL 2>&1
ECHO    ^> WdiServiceHost set to DEMAND & sc config WdiServiceHost start=demand >NUL 2>&1
ECHO    ^> WdiSystemHost set to DEMAND & sc config WdiSystemHost start=demand >NUL 2>&1
ECHO    ^> DiagTrack set to AUTO & sc config DiagTrack start=auto >NUL 2>&1
ECHO    ^> TrkWks set to AUTO & sc config TrkWks start=auto >NUL 2>&1
ECHO    ^> MSDTC set to DEMAND & sc config MSDTC start=demand >NUL 2>&1
ECHO    ^> dmwappushsvc set to DELAYED-AUTO & sc config dmwappushsvc start=delayed-auto >NUL 2>&1
ECHO    ^> Dnscache set to AUTO & sc config Dnscache start=auto >NUL 2>&1
ECHO    ^> MapsBroker set to DELAYED-AUTO & sc config MapsBroker start=delayed-auto >NUL 2>&1
ECHO    ^> DsRoleSvc set to DISABLED & sc config DsRoleSvc start=disabled >NUL 2>&1
ECHO    ^> embeddedmode set to DEMAND & sc config embeddedmode start=demand >NUL 2>&1
ECHO    ^> EFS set to DEMAND & sc config EFS start=demand >NUL 2>&1
ECHO    ^> EntAppSvc set to DEMAND & sc config EntAppSvc start=demand >NUL 2>&1
ECHO    ^> EapHost set to DEMAND & sc config EapHost start=demand >NUL 2>&1
ECHO    ^> Fax set to DEMAND & sc config Fax start=demand >NUL 2>&1
ECHO    ^> fhsvc set to DEMAND & sc config fhsvc start=demand >NUL 2>&1
ECHO    ^> fdPHost set to DEMAND & sc config fdPHost start=demand >NUL 2>&1
ECHO    ^> FDResPub set to DEMAND & sc config FDResPub start=demand >NUL 2>&1
ECHO    ^> fsvc set to DEMAND & sc config fsvc start=demand >NUL 2>&1
ECHO    ^> gpsvc set to AUTO & sc config gpsvc start=auto >NUL 2>&1
ECHO    ^> hkmsvc set to DEMAND & sc config hkmsvc start=demand >NUL 2>&1
ECHO    ^> HomeGroupListener set to DEMAND & sc config HomeGroupListener start=demand >NUL 2>&1
ECHO    ^> HomeGroupProvider set to DEMAND & sc config HomeGroupProvider start=demand >NUL 2>&1
ECHO    ^> hidserv set to DEMAND & sc config hidserv start=demand >NUL 2>&1
ECHO    ^> vmickvpexchange set to DEMAND & sc config vmickvpexchange start=demand >NUL 2>&1
ECHO    ^> vmicguestinterface set to DEMAND & sc config vmicguestinterface start=demand >NUL 2>&1
ECHO    ^> vmicshutdown set to DEMAND & sc config vmicshutdown start=demand >NUL 2>&1
ECHO    ^> vmicheartbeat set to DEMAND & sc config vmicheartbeat start=demand >NUL 2>&1
ECHO    ^> vmicrdv set to DEMAND & sc config vmicrdv start=demand >NUL 2>&1
ECHO    ^> vmictimesync set to DEMAND & sc config vmictimesync start=demand >NUL 2>&1
ECHO    ^> vmicvmsession set to DEMAND & sc config vmicvmsession start=demand >NUL 2>&1
ECHO    ^> vmicvss set to DEMAND & sc config vmicvss start=demand >NUL 2>&1
ECHO    ^> IISADMIN set to DISABLED & sc config IISADMIN start=disabled >NUL 2>&1
ECHO    ^> IKEEXT set to DEMAND & sc config IKEEXT start=demand >NUL 2>&1
ECHO    ^> cphs set to DISABLED & sc config cphs start=disabled >NUL 2>&1
ECHO    ^> UI0Detect set to DEMAND & sc config UI0Detect start=demand >NUL 2>&1
ECHO    ^> SharedAccess set to DEMAND & sc config SharedAccess start=demand >NUL 2>&1
ECHO    ^> IEEtwCollectorService set to DEMAND & sc config IEEtwCollectorService start=demand >NUL 2>&1
ECHO    ^> iphlpsvc set to AUTO & sc config iphlpsvc start=auto >NUL 2>&1
ECHO    ^> PolicyAgent set to DEMAND & sc config PolicyAgent start=demand >NUL 2>&1
ECHO    ^> KtmRm set to DEMAND & sc config KtmRm start=demand >NUL 2>&1
ECHO    ^> lltdsvc set to DEMAND & sc config lltdsvc start=demand >NUL 2>&1
ECHO    ^> LSM set to AUTO & sc config LSM start=auto >NUL 2>&1
ECHO    ^> LPDSVC set to DISABLED & sc config LPDSVC start=disabled >NUL 2>&1
ECHO    ^> MSMQ set to DISABLED & sc config MSMQ start=disabled >NUL 2>&1
ECHO    ^> MSMQTriggers set to DISABLED & sc config MSMQTriggers start=disabled >NUL 2>&1
ECHO    ^> diagnosticshub.standardcollector.service set to DEMAND & sc config diagnosticshub.standardcollector.service start=demand >NUL 2>&1
ECHO    ^> wlidsvc set to DEMAND & sc config wlidsvc start=demand >NUL 2>&1
ECHO    ^> ftpsvc set to DISABLED & sc config ftpsvc start=disabled >NUL 2>&1
ECHO    ^> MSiSCSI set to DEMAND & sc config MSiSCSI start=demand >NUL 2>&1
ECHO    ^> NgcSvc set to DEMAND & sc config NgcSvc start=demand >NUL 2>&1
ECHO    ^> NgcCtnrSvc set to DEMAND & sc config NgcCtnrSvc start=demand >NUL 2>&1
ECHO    ^> swprv set to DEMAND & sc config swprv start=demand >NUL 2>&1
ECHO    ^> smphost set to DEMAND & sc config smphost start=demand >NUL 2>&1
ECHO    ^> SmsRouter set to DEMAND & sc config SmsRouter start=demand >NUL 2>&1
ECHO    ^> NetMsmqActivator set to DISABLED & sc config NetMsmqActivator start=disabled >NUL 2>&1
ECHO    ^> NetPipeActivator set to DISABLED & sc config NetPipeActivator start=disabled >NUL 2>&1
ECHO    ^> NetTcpActivator set to DISABLED & sc config NetTcpActivator start=disabled >NUL 2>&1
ECHO    ^> NetTcpPortSharing set to DISABLED & sc config NetTcpPortSharing start=disabled >NUL 2>&1
ECHO    ^> Netlogon set to DEMAND & sc config Netlogon start=demand >NUL 2>&1
ECHO    ^> NcdAutoSetup set to DEMAND & sc config NcdAutoSetup start=demand >NUL 2>&1
ECHO    ^> NcbService set to DEMAND & sc config NcbService start=demand >NUL 2>&1
ECHO    ^> Netman set to DEMAND & sc config Netman start=demand >NUL 2>&1
ECHO    ^> NcaSVC set to DEMAND & sc config NcaSVC start=demand >NUL 2>&1
ECHO    ^> netprofm set to DEMAND & sc config netprofm start=demand >NUL 2>&1
ECHO    ^> NlaSvc set to AUTO & sc config NlaSvc start=auto >NUL 2>&1
ECHO    ^> NetSetupSvc set to DEMAND & sc config NetSetupSvc start=demand >NUL 2>&1
ECHO    ^> nsi set to AUTO & sc config nsi start=auto >NUL 2>&1
ECHO    ^> CscService set to DEMAND & sc config CscService start=demand >NUL 2>&1
ECHO    ^> defragsvc set to DEMAND & sc config defragsvc start=demand >NUL 2>&1
ECHO    ^> PNRPsvc set to DEMAND & sc config PNRPsvc start=demand >NUL 2>&1
ECHO    ^> p2psvc set to DEMAND & sc config p2psvc start=demand >NUL 2>&1
ECHO    ^> p2pimsvc set to DEMAND & sc config p2pimsvc start=demand >NUL 2>&1
ECHO    ^> pla set to DEMAND & sc config pla start=demand >NUL 2>&1
ECHO    ^> PlugPlay set to DEMAND & sc config PlugPlay start=demand >NUL 2>&1
ECHO    ^> PNRPAutoReg set to DEMAND & sc config PNRPAutoReg start=demand >NUL 2>&1
ECHO    ^> WPDBusEnum set to DEMAND & sc config WPDBusEnum start=demand >NUL 2>&1
ECHO    ^> Power set to AUTO & sc config Power start=auto >NUL 2>&1
ECHO    ^> Spooler set to AUTO & sc config Spooler start=auto >NUL 2>&1
ECHO    ^> PrintNotify set to DEMAND & sc config PrintNotify start=demand >NUL 2>&1
ECHO    ^> wercplsupport set to DEMAND & sc config wercplsupport start=demand >NUL 2>&1
ECHO    ^> PcaSvc set to DEMAND & sc config PcaSvc start=demand >NUL 2>&1
ECHO    ^> QWAVE set to DEMAND & sc config QWAVE start=demand >NUL 2>&1
ECHO    ^> RasAuto set to DEMAND & sc config RasAuto start=demand >NUL 2>&1
ECHO    ^> RasMan set to DEMAND & sc config RasMan start=demand >NUL 2>&1
ECHO    ^> SessionEnv set to DEMAND & sc config SessionEnv start=demand >NUL 2>&1
ECHO    ^> TermService set to DEMAND & sc config TermService start=demand >NUL 2>&1
ECHO    ^> UmRdpService set to DEMAND & sc config UmRdpService start=demand >NUL 2>&1
ECHO    ^> RpcSs set to AUTO & sc config RpcSs start=auto >NUL 2>&1
ECHO    ^> RpcLocator set to DEMAND & sc config RpcLocator start=demand >NUL 2>&1
ECHO    ^> RemoteRegistry set to DISABLED & sc config RemoteRegistry start=disabled >NUL 2>&1
ECHO    ^> RetailDemo set to DEMAND & sc config RetailDemo start=demand >NUL 2>&1
ECHO    ^> iprip set to DISABLED & sc config iprip start=disabled >NUL 2>&1
ECHO    ^> RemoteAccess set to DISABLED & sc config RemoteAccess start=disabled >NUL 2>&1
ECHO    ^> RpcEptMapper set to AUTO & sc config RpcEptMapper start=auto >NUL 2>&1
ECHO    ^> seclogon set to DEMAND & sc config seclogon start=demand >NUL 2>&1
ECHO    ^> SstpSvc set to DEMAND & sc config SstpSvc start=demand >NUL 2>&1
ECHO    ^> SamSs set to AUTO & sc config SamSs start=auto >NUL 2>&1
ECHO    ^> wscsvc set to DELAYED-AUTO & sc config wscsvc start=delayed-auto >NUL 2>&1
ECHO    ^> SensorDataService set to DEMAND & sc config SensorDataService start=demand >NUL 2>&1
ECHO    ^> SensrSvc set to DEMAND & sc config SensrSvc start=demand >NUL 2>&1
ECHO    ^> SensorService set to DEMAND & sc config SensorService start=demand >NUL 2>&1
ECHO    ^> LanmanServer set to AUTO & sc config LanmanServer start=auto >NUL 2>&1
ECHO    ^> ShellHWDetection set to AUTO & sc config ShellHWDetection start=auto >NUL 2>&1
ECHO    ^> simptcp set to DISABLED & sc config simptcp start=disabled >NUL 2>&1
ECHO    ^> SCardSvr set to DISABLED & sc config SCardSvr start=disabled >NUL 2>&1
ECHO    ^> ScDeviceEnum set to DEMAND & sc config ScDeviceEnum start=demand >NUL 2>&1
ECHO    ^> SCPolicySvc set to DEMAND & sc config SCPolicySvc start=demand >NUL 2>&1
ECHO    ^> SNMP set to DISABLED & sc config SNMP start=disabled >NUL 2>&1
ECHO    ^> SNMPTRAP set to DEMAND & sc config SNMPTRAP start=demand >NUL 2>&1
ECHO    ^> sppsvc set to DELAYED-AUTO & sc config sppsvc start=delayed-auto >NUL 2>&1
ECHO    ^> svsvc set to DEMAND & sc config svsvc start=demand >NUL 2>&1
ECHO    ^> SSDPSRV set to DEMAND & sc config SSDPSRV start=demand >NUL 2>&1
ECHO    ^> StateRepository set to DEMAND & sc config StateRepository start=demand >NUL 2>&1
ECHO    ^> WiaRpc set to DEMAND & sc config WiaRpc start=demand >NUL 2>&1
ECHO    ^> StorSvc set to DEMAND & sc config StorSvc start=demand >NUL 2>&1
ECHO    ^> SysMain set to AUTO & sc config SysMain start=auto >NUL 2>&1
ECHO    ^> SENS set to AUTO & sc config SENS start=auto >NUL 2>&1
ECHO    ^> SystemEventsBroker set to AUTO & sc config SystemEventsBroker start=auto >NUL 2>&1
ECHO    ^> Schedule set to AUTO & sc config Schedule start=auto >NUL 2>&1
ECHO    ^> lmhosts set to DEMAND & sc config lmhosts start=demand >NUL 2>&1
ECHO    ^> TapiSrv set to DEMAND & sc config TapiSrv start=demand >NUL 2>&1
ECHO    ^> Themes set to AUTO & sc config Themes start=auto >NUL 2>&1
ECHO    ^> tiledatamodelsvc set to AUTO & sc config tiledatamodelsvc start=auto >NUL 2>&1
ECHO    ^> TimeBroker set to DEMAND & sc config TimeBroker start=demand >NUL 2>&1
ECHO    ^> TabletInputService set to DEMAND & sc config TabletInputService start=demand >NUL 2>&1
ECHO    ^> UsoSvc set to DEMAND & sc config UsoSvc start=demand >NUL 2>&1
ECHO    ^> upnphost set to DEMAND & sc config upnphost start=demand >NUL 2>&1
ECHO    ^> UserManager set to AUTO & sc config UserManager start=auto >NUL 2>&1
ECHO    ^> ProfSvc set to AUTO & sc config ProfSvc start=auto >NUL 2>&1
ECHO    ^> vds set to DEMAND & sc config vds start=demand >NUL 2>&1
ECHO    ^> VSS set to DEMAND & sc config VSS start=demand >NUL 2>&1
ECHO    ^> W3LOGSVC set to DISABLED & sc config W3LOGSVC start=disabled >NUL 2>&1
ECHO    ^> WalletService set to DEMAND & sc config WalletService start=demand >NUL 2>&1
ECHO    ^> WMSVC set to DISABLED & sc config WMSVC start=disabled >NUL 2>&1
ECHO    ^> WebClient set to DEMAND & sc config WebClient start=demand >NUL 2>&1
ECHO    ^> AudioSrv set to AUTO & sc config AudioSrv start=auto >NUL 2>&1
ECHO    ^> AudioEndpointBuilder set to AUTO & sc config AudioEndpointBuilder start=auto >NUL 2>&1
ECHO    ^> SDRSVC set to DEMAND & sc config SDRSVC start=demand >NUL 2>&1
ECHO    ^> WbioSrvc set to DEMAND & sc config WbioSrvc start=demand >NUL 2>&1
ECHO    ^> WcsPlugInService set to DEMAND & sc config WcsPlugInService start=demand >NUL 2>&1
ECHO    ^> wcncsvc set to DEMAND & sc config wcncsvc start=demand >NUL 2>&1
ECHO    ^> Wcmsvc set to AUTO & sc config Wcmsvc start=auto >NUL 2>&1
ECHO    ^> WdNisSvc set to DEMAND & sc config WdNisSvc start=demand >NUL 2>&1
ECHO    ^> WinDefend set to AUTO & sc config WinDefend start=auto >NUL 2>&1
ECHO    ^> wudfsvc set to DEMAND & sc config wudfsvc start=demand >NUL 2>&1
ECHO    ^> WEPHOSTSVC set to DEMAND & sc config WEPHOSTSVC start=demand >NUL 2>&1
ECHO    ^> WerSvc set to DEMAND & sc config WerSvc start=demand >NUL 2>&1
ECHO    ^> Wecsvc set to DEMAND & sc config Wecsvc start=demand >NUL 2>&1
ECHO    ^> EventLog set to AUTO & sc config EventLog start=auto >NUL 2>&1
ECHO    ^> MpsSvc set to AUTO & sc config MpsSvc start=auto >NUL 2>&1
ECHO    ^> FontCache set to AUTO & sc config FontCache start=auto >NUL 2>&1
ECHO    ^> StiSvc set to DEMAND & sc config StiSvc start=demand >NUL 2>&1
ECHO    ^> msiserver set to DEMAND & sc config msiserver start=demand >NUL 2>&1
ECHO    ^> LicenseManager set to DEMAND & sc config LicenseManager start=demand >NUL 2>&1
ECHO    ^> Winmgmt set to AUTO & sc config Winmgmt start=auto >NUL 2>&1
ECHO    ^> WMPNetworkSvc set to DEMAND & sc config WMPNetworkSvc start=demand >NUL 2>&1
ECHO    ^> icssvc set to DEMAND & sc config icssvc start=demand >NUL 2>&1
ECHO    ^> TrustedInstaller set to DEMAND & sc config TrustedInstaller start=demand >NUL 2>&1
ECHO    ^> Wms set to AUTO & sc config Wms start=auto >NUL 2>&1
ECHO    ^> WmsRepair set to AUTO & sc config WmsRepair start=auto >NUL 2>&1
ECHO    ^> FontCache3.0.0.0 set to DISABLED & sc config FontCache3.0.0.0 start=disabled >NUL 2>&1
ECHO    ^> WAS set to DISABLED & sc config WAS start=disabled >NUL 2>&1
ECHO    ^> WpnService set to DEMAND & sc config WpnService start=demand >NUL 2>&1
ECHO    ^> WinRM set to AUTO & sc config WinRM start=auto >NUL 2>&1
ECHO    ^> WSearch set to DELAYED-AUTO & sc config WSearch start=delayed-auto >NUL 2>&1
ECHO    ^> WSService set to DEMAND & sc config WSService start=demand >NUL 2>&1
ECHO    ^> W32Time set to DEMAND & sc config W32Time start=demand >NUL 2>&1
ECHO    ^> wuauserv set to DEMAND & sc config wuauserv start=demand >NUL 2>&1
ECHO    ^> WinHttpAutoProxySvc set to DEMAND & sc config WinHttpAutoProxySvc start=demand >NUL 2>&1
ECHO    ^> dot3svc set to DEMAND & sc config dot3svc start=demand >NUL 2>&1
ECHO    ^> WlanSvc set to DEMAND & sc config WlanSvc start=demand >NUL 2>&1
ECHO    ^> wmiApSrv set to DEMAND & sc config wmiApSrv start=demand >NUL 2>&1
ECHO    ^> workfolderssvc set to DEMAND & sc config workfolderssvc start=demand >NUL 2>&1
ECHO    ^> LanmanWorkstation set to AUTO & sc config LanmanWorkstation start=auto >NUL 2>&1
ECHO    ^> W3SVC set to DISABLED & sc config W3SVC start=disabled >NUL 2>&1
ECHO    ^> WwanSvc set to DEMAND & sc config WwanSvc start=demand >NUL 2>&1
ECHO    ^> XblAuthManager set to DEMAND & sc config XblAuthManager start=demand >NUL 2>&1
ECHO    ^> XblGameSave set to DEMAND & sc config XblGameSave start=demand >NUL 2>&1
ECHO    ^> XboxNetApiSvc set to DEMAND & sc config XboxNetApiSvc start=demand >NUL 2>&1
GOTO WIFI

:: The following section will apply "safe" optimizations to the Windows services.
:: These are known to be safe for all users and should not cause issues.
:SAFE
ECHO.
ECHO Now applying SAFE service optimizations -- This shouldn't take long...
ECHO    ^> AxInstSV set to DEMAND & sc config AxInstSV start=demand >NUL 2>&1
ECHO    ^> AJRouter set to DEMAND & sc config AJRouter start=demand >NUL 2>&1
ECHO    ^> AppReadiness set to DEMAND & sc config AppReadiness start=demand >NUL 2>&1
ECHO    ^> AppHostSvc set to DISABLED & sc config AppHostSvc start=disabled >NUL 2>&1
ECHO    ^> AppIDSvc set to DEMAND & sc config AppIDSvc start=demand >NUL 2>&1
ECHO    ^> Appinfo set to DEMAND & sc config Appinfo start=demand >NUL 2>&1
ECHO    ^> ALG set to DEMAND & sc config ALG start=demand >NUL 2>&1
ECHO    ^> AppMgmt set to DEMAND & sc config AppMgmt start=demand >NUL 2>&1
ECHO    ^> AppXSVC set to DEMAND & sc config AppXSVC start=demand >NUL 2>&1
ECHO    ^> aspnet_state set to DISABLED & sc config aspnet_state start=disabled >NUL 2>&1
ECHO    ^> BITS set to DELAYED-AUTO & sc config BITS start=delayed-auto >NUL 2>&1
ECHO    ^> BrokerInfrastructure set to AUTO & sc config BrokerInfrastructure start=auto >NUL 2>&1
ECHO    ^> BFE set to AUTO & sc config BFE start=auto >NUL 2>&1
ECHO    ^> BDESVC set to DEMAND & sc config BDESVC start=demand >NUL 2>&1
ECHO    ^> wbengine set to DEMAND & sc config wbengine start=demand >NUL 2>&1
ECHO    ^> BthHFSrv set to DEMAND & sc config BthHFSrv start=demand >NUL 2>&1
ECHO    ^> bthserv set to DEMAND & sc config bthserv start=demand >NUL 2>&1
ECHO    ^> PeerDistSvc set to DISABLED & sc config PeerDistSvc start=disabled >NUL 2>&1
ECHO    ^> CDPSvc set to DEMAND & sc config CDPSvc start=demand >NUL 2>&1
ECHO    ^> CertPropSvc set to DEMAND & sc config CertPropSvc start=demand >NUL 2>&1
ECHO    ^> c2wts set to DEMAND & sc config c2wts start=demand >NUL 2>&1
ECHO    ^> NfsClnt set to DISABLED & sc config NfsClnt start=disabled >NUL 2>&1
ECHO    ^> ClipSVC set to DEMAND & sc config ClipSVC start=demand >NUL 2>&1
ECHO    ^> KeyIso set to DEMAND & sc config KeyIso start=demand >NUL 2>&1
ECHO    ^> EventSystem set to AUTO & sc config EventSystem start=auto >NUL 2>&1
ECHO    ^> COMSysApp set to DEMAND & sc config COMSysApp start=demand >NUL 2>&1
ECHO    ^> Browser set to DEMAND & sc config Browser start=demand >NUL 2>&1
ECHO    ^> CoreUIRegistrar set to AUTO & sc config CoreUIRegistrar start=auto >NUL 2>&1
ECHO    ^> VaultSvc set to DEMAND & sc config VaultSvc start=demand >NUL 2>&1
ECHO    ^> CryptSvc set to AUTO & sc config CryptSvc start=auto >NUL 2>&1
ECHO    ^> DsSvc set to DEMAND & sc config DsSvc start=demand >NUL 2>&1
ECHO    ^> DcpSvc set to DEMAND & sc config DcpSvc start=demand >NUL 2>&1
ECHO    ^> DcomLaunch set to AUTO & sc config DcomLaunch start=auto >NUL 2>&1
ECHO    ^> DoSvc set to DELAYED-AUTO & sc config DoSvc start=delayed-auto >NUL 2>&1
ECHO    ^> DeviceAssociationService set to DEMAND & sc config DeviceAssociationService start=demand >NUL 2>&1
ECHO    ^> DeviceInstall set to DEMAND & sc config DeviceInstall start=demand >NUL 2>&1
ECHO    ^> DmEnrollmentSvc set to DEMAND & sc config DmEnrollmentSvc start=demand >NUL 2>&1
ECHO    ^> DsmSVC set to DEMAND & sc config DsmSVC start=demand >NUL 2>&1
ECHO    ^> DevQueryBroker set to DEMAND & sc config DevQueryBroker start=demand >NUL 2>&1
ECHO    ^> Dhcp set to AUTO & sc config Dhcp start=auto >NUL 2>&1
ECHO    ^> DPS set to AUTO & sc config DPS start=auto >NUL 2>&1
ECHO    ^> WdiServiceHost set to DEMAND & sc config WdiServiceHost start=demand >NUL 2>&1
ECHO    ^> WdiSystemHost set to DEMAND & sc config WdiSystemHost start=demand >NUL 2>&1
ECHO    ^> DiagTrack set to AUTO & sc config DiagTrack start=auto >NUL 2>&1
ECHO    ^> TrkWks set to AUTO & sc config TrkWks start=auto >NUL 2>&1
ECHO    ^> MSDTC set to DEMAND & sc config MSDTC start=demand >NUL 2>&1
ECHO    ^> dmwappushsvc set to DISABLED & sc config dmwappushsvc start=disabled >NUL 2>&1
ECHO    ^> Dnscache set to AUTO & sc config Dnscache start=auto >NUL 2>&1
ECHO    ^> MapsBroker set to DELAYED-AUTO & sc config MapsBroker start=delayed-auto >NUL 2>&1
ECHO    ^> DsRoleSvc set to DISABLED & sc config DsRoleSvc start=disabled >NUL 2>&1
ECHO    ^> embeddedmode set to DEMAND & sc config embeddedmode start=demand >NUL 2>&1
ECHO    ^> EFS set to DEMAND & sc config EFS start=demand >NUL 2>&1
ECHO    ^> EntAppSvc set to DISABLED & sc config EntAppSvc start=disabled >NUL 2>&1
ECHO    ^> EapHost set to DEMAND & sc config EapHost start=demand >NUL 2>&1
ECHO    ^> Fax set to DISABLED & sc config Fax start=disabled >NUL 2>&1
ECHO    ^> fhsvc set to DEMAND & sc config fhsvc start=demand >NUL 2>&1
ECHO    ^> fdPHost set to DEMAND & sc config fdPHost start=demand >NUL 2>&1
ECHO    ^> FDResPub set to DEMAND & sc config FDResPub start=demand >NUL 2>&1
ECHO    ^> fsvc set to DISABLED & sc config fsvc start=disabled >NUL 2>&1
ECHO    ^> gpsvc set to AUTO & sc config gpsvc start=auto >NUL 2>&1
ECHO    ^> hkmsvc set to DEMAND & sc config hkmsvc start=demand >NUL 2>&1
ECHO    ^> HomeGroupListener set to DEMAND & sc config HomeGroupListener start=demand >NUL 2>&1
ECHO    ^> HomeGroupProvider set to DEMAND & sc config HomeGroupProvider start=demand >NUL 2>&1
ECHO    ^> hidserv set to DEMAND & sc config hidserv start=demand >NUL 2>&1
ECHO    ^> vmickvpexchange set to DISABLED & sc config vmickvpexchange start=disabled >NUL 2>&1
ECHO    ^> vmicguestinterface set to DISABLED & sc config vmicguestinterface start=disabled >NUL 2>&1
ECHO    ^> vmicshutdown set to DISABLED & sc config vmicshutdown start=disabled >NUL 2>&1
ECHO    ^> vmicheartbeat set to DISABLED & sc config vmicheartbeat start=disabled >NUL 2>&1
ECHO    ^> vmicrdv set to DISABLED & sc config vmicrdv start=disabled >NUL 2>&1
ECHO    ^> vmictimesync set to DISABLED & sc config vmictimesync start=disabled >NUL 2>&1
ECHO    ^> vmicvmsession set to DISABLED & sc config vmicvmsession start=disabled >NUL 2>&1
ECHO    ^> vmicvss set to DISABLED & sc config vmicvss start=disabled >NUL 2>&1
ECHO    ^> IISADMIN set to DISABLED & sc config IISADMIN start=disabled >NUL 2>&1
ECHO    ^> IKEEXT set to DEMAND & sc config IKEEXT start=demand >NUL 2>&1
ECHO    ^> cphs set to DEMAND & sc config cphs start=demand >NUL 2>&1
ECHO    ^> UI0Detect set to DEMAND & sc config UI0Detect start=demand >NUL 2>&1
ECHO    ^> SharedAccess set to DISABLED & sc config SharedAccess start=disabled >NUL 2>&1
ECHO    ^> IEEtwCollectorService set to DEMAND & sc config IEEtwCollectorService start=demand >NUL 2>&1
ECHO    ^> iphlpsvc set to AUTO & sc config iphlpsvc start=auto >NUL 2>&1
ECHO    ^> PolicyAgent set to DEMAND & sc config PolicyAgent start=demand >NUL 2>&1
ECHO    ^> KtmRm set to DEMAND & sc config KtmRm start=demand >NUL 2>&1
ECHO    ^> lltdsvc set to DEMAND & sc config lltdsvc start=demand >NUL 2>&1
ECHO    ^> LSM set to AUTO & sc config LSM start=auto >NUL 2>&1
ECHO    ^> LPDSVC set to DISABLED & sc config LPDSVC start=disabled >NUL 2>&1
ECHO    ^> MSMQ set to DISABLED & sc config MSMQ start=disabled >NUL 2>&1
ECHO    ^> MSMQTriggers set to DISABLED & sc config MSMQTriggers start=disabled >NUL 2>&1
ECHO    ^> diagnosticshub.standardcollector.service set to DEMAND & sc config diagnosticshub.standardcollector.service start=demand >NUL 2>&1
ECHO    ^> wlidsvc set to DEMAND & sc config wlidsvc start=demand >NUL 2>&1
ECHO    ^> ftpsvc set to DISABLED & sc config ftpsvc start=disabled >NUL 2>&1
ECHO    ^> MSiSCSI set to DISABLED & sc config MSiSCSI start=disabled >NUL 2>&1
ECHO    ^> NgcSvc set to DEMAND & sc config NgcSvc start=demand >NUL 2>&1
ECHO    ^> NgcCtnrSvc set to DEMAND & sc config NgcCtnrSvc start=demand >NUL 2>&1
ECHO    ^> swprv set to DEMAND & sc config swprv start=demand >NUL 2>&1
ECHO    ^> smphost set to DEMAND & sc config smphost start=demand >NUL 2>&1
ECHO    ^> SmsRouter set to DISABLED & sc config SmsRouter start=disabled >NUL 2>&1
ECHO    ^> NetMsmqActivator set to DISABLED & sc config NetMsmqActivator start=disabled >NUL 2>&1
ECHO    ^> NetPipeActivator set to DISABLED & sc config NetPipeActivator start=disabled >NUL 2>&1
ECHO    ^> NetTcpActivator set to DISABLED & sc config NetTcpActivator start=disabled >NUL 2>&1
ECHO    ^> NetTcpPortSharing set to DISABLED & sc config NetTcpPortSharing start=disabled >NUL 2>&1
ECHO    ^> Netlogon set to DEMAND & sc config Netlogon start=demand >NUL 2>&1
ECHO    ^> NcdAutoSetup set to DEMAND & sc config NcdAutoSetup start=demand >NUL 2>&1
ECHO    ^> NcbService set to DEMAND & sc config NcbService start=demand >NUL 2>&1
ECHO    ^> Netman set to DEMAND & sc config Netman start=demand >NUL 2>&1
ECHO    ^> NcaSVC set to DEMAND & sc config NcaSVC start=demand >NUL 2>&1
ECHO    ^> netprofm set to DEMAND & sc config netprofm start=demand >NUL 2>&1
ECHO    ^> NlaSvc set to AUTO & sc config NlaSvc start=auto >NUL 2>&1
ECHO    ^> NetSetupSvc set to DEMAND & sc config NetSetupSvc start=demand >NUL 2>&1
ECHO    ^> nsi set to AUTO & sc config nsi start=auto >NUL 2>&1
ECHO    ^> CscService set to DEMAND & sc config CscService start=demand >NUL 2>&1
ECHO    ^> defragsvc set to DEMAND & sc config defragsvc start=demand >NUL 2>&1
ECHO    ^> PNRPsvc set to DEMAND & sc config PNRPsvc start=demand >NUL 2>&1
ECHO    ^> p2psvc set to DEMAND & sc config p2psvc start=demand >NUL 2>&1
ECHO    ^> p2pimsvc set to DEMAND & sc config p2pimsvc start=demand >NUL 2>&1
ECHO    ^> pla set to DEMAND & sc config pla start=demand >NUL 2>&1
ECHO    ^> PlugPlay set to DEMAND & sc config PlugPlay start=demand >NUL 2>&1
ECHO    ^> PNRPAutoReg set to DEMAND & sc config PNRPAutoReg start=demand >NUL 2>&1
ECHO    ^> WPDBusEnum set to DEMAND & sc config WPDBusEnum start=demand >NUL 2>&1
ECHO    ^> Power set to AUTO & sc config Power start=auto >NUL 2>&1
ECHO    ^> Spooler set to AUTO & sc config Spooler start=auto >NUL 2>&1
ECHO    ^> PrintNotify set to DEMAND & sc config PrintNotify start=demand >NUL 2>&1
ECHO    ^> wercplsupport set to DEMAND & sc config wercplsupport start=demand >NUL 2>&1
ECHO    ^> PcaSvc set to DEMAND & sc config PcaSvc start=demand >NUL 2>&1
ECHO    ^> QWAVE set to DEMAND & sc config QWAVE start=demand >NUL 2>&1
ECHO    ^> RasAuto set to DEMAND & sc config RasAuto start=demand >NUL 2>&1
ECHO    ^> RasMan set to DEMAND & sc config RasMan start=demand >NUL 2>&1
ECHO    ^> SessionEnv set to DEMAND & sc config SessionEnv start=demand >NUL 2>&1
ECHO    ^> TermService set to DEMAND & sc config TermService start=demand >NUL 2>&1
ECHO    ^> UmRdpService set to DEMAND & sc config UmRdpService start=demand >NUL 2>&1
ECHO    ^> RpcSs set to AUTO & sc config RpcSs start=auto >NUL 2>&1
ECHO    ^> RpcLocator set to DISABLED & sc config RpcLocator start=disabled >NUL 2>&1
ECHO    ^> RemoteRegistry set to DISABLED & sc config RemoteRegistry start=disabled >NUL 2>&1
ECHO    ^> RetailDemo set to DISABLED & sc config RetailDemo start=disabled >NUL 2>&1
ECHO    ^> iprip set to DISABLED & sc config iprip start=disabled >NUL 2>&1
ECHO    ^> RemoteAccess set to DISABLED & sc config RemoteAccess start=disabled >NUL 2>&1
ECHO    ^> RpcEptMapper set to AUTO & sc config RpcEptMapper start=auto >NUL 2>&1
ECHO    ^> seclogon set to DEMAND & sc config seclogon start=demand >NUL 2>&1
ECHO    ^> SstpSvc set to DEMAND & sc config SstpSvc start=demand >NUL 2>&1
ECHO    ^> SamSs set to AUTO & sc config SamSs start=auto >NUL 2>&1
ECHO    ^> wscsvc set to DELAYED-AUTO & sc config wscsvc start=delayed-auto >NUL 2>&1
ECHO    ^> SensorDataService set to DISABLED & sc config SensorDataService start=disabled >NUL 2>&1
ECHO    ^> SensrSvc set to DISABLED & sc config SensrSvc start=disabled >NUL 2>&1
ECHO    ^> SensorService set to DISABLED & sc config SensorService start=disabled >NUL 2>&1
ECHO    ^> LanmanServer set to AUTO & sc config LanmanServer start=auto >NUL 2>&1
ECHO    ^> ShellHWDetection set to AUTO & sc config ShellHWDetection start=auto >NUL 2>&1
ECHO    ^> simptcp set to DISABLED & sc config simptcp start=disabled >NUL 2>&1
ECHO    ^> SCardSvr set to DISABLED & sc config SCardSvr start=disabled >NUL 2>&1
ECHO    ^> ScDeviceEnum set to DISABLED & sc config ScDeviceEnum start=disabled >NUL 2>&1
ECHO    ^> SCPolicySvc set to DISABLED & sc config SCPolicySvc start=disabled >NUL 2>&1
ECHO    ^> SNMP set to DISABLED & sc config SNMP start=disabled >NUL 2>&1
ECHO    ^> SNMPTRAP set to DISABLED & sc config SNMPTRAP start=disabled >NUL 2>&1
ECHO    ^> sppsvc set to DELAYED-AUTO & sc config sppsvc start=delayed-auto >NUL 2>&1
ECHO    ^> svsvc set to DEMAND & sc config svsvc start=demand >NUL 2>&1
ECHO    ^> SSDPSRV set to DEMAND & sc config SSDPSRV start=demand >NUL 2>&1
ECHO    ^> StateRepository set to DEMAND & sc config StateRepository start=demand >NUL 2>&1
ECHO    ^> WiaRpc set to DEMAND & sc config WiaRpc start=demand >NUL 2>&1
ECHO    ^> StorSvc set to DEMAND & sc config StorSvc start=demand >NUL 2>&1
ECHO    ^> SysMain set to AUTO & sc config SysMain start=auto >NUL 2>&1
ECHO    ^> SENS set to AUTO & sc config SENS start=auto >NUL 2>&1
ECHO    ^> SystemEventsBroker set to AUTO & sc config SystemEventsBroker start=auto >NUL 2>&1
ECHO    ^> Schedule set to AUTO & sc config Schedule start=auto >NUL 2>&1
ECHO    ^> lmhosts set to DEMAND & sc config lmhosts start=demand >NUL 2>&1
ECHO    ^> TapiSrv set to DEMAND & sc config TapiSrv start=demand >NUL 2>&1
ECHO    ^> Themes set to AUTO & sc config Themes start=auto >NUL 2>&1
ECHO    ^> tiledatamodelsvc set to AUTO & sc config tiledatamodelsvc start=auto >NUL 2>&1
ECHO    ^> TimeBroker set to DEMAND & sc config TimeBroker start=demand >NUL 2>&1
ECHO    ^> TabletInputService set to DEMAND & sc config TabletInputService start=demand >NUL 2>&1
ECHO    ^> UsoSvc set to DEMAND & sc config UsoSvc start=demand >NUL 2>&1
ECHO    ^> upnphost set to DEMAND & sc config upnphost start=demand >NUL 2>&1
ECHO    ^> UserManager set to AUTO & sc config UserManager start=auto >NUL 2>&1
ECHO    ^> ProfSvc set to AUTO & sc config ProfSvc start=auto >NUL 2>&1
ECHO    ^> vds set to DEMAND & sc config vds start=demand >NUL 2>&1
ECHO    ^> VSS set to DEMAND & sc config VSS start=demand >NUL 2>&1
ECHO    ^> W3LOGSVC set to DISABLED & sc config W3LOGSVC start=disabled >NUL 2>&1
ECHO    ^> WalletService set to DEMAND & sc config WalletService start=demand >NUL 2>&1
ECHO    ^> WMSVC set to DISABLED & sc config WMSVC start=disabled >NUL 2>&1
ECHO    ^> WebClient set to DEMAND & sc config WebClient start=demand >NUL 2>&1
ECHO    ^> AudioSrv set to AUTO & sc config AudioSrv start=auto >NUL 2>&1
ECHO    ^> AudioEndpointBuilder set to AUTO & sc config AudioEndpointBuilder start=auto >NUL 2>&1
ECHO    ^> SDRSVC set to DEMAND & sc config SDRSVC start=demand >NUL 2>&1
ECHO    ^> WbioSrvc set to DEMAND & sc config WbioSrvc start=demand >NUL 2>&1
ECHO    ^> WcsPlugInService set to DEMAND & sc config WcsPlugInService start=demand >NUL 2>&1
ECHO    ^> wcncsvc set to DEMAND & sc config wcncsvc start=demand >NUL 2>&1
ECHO    ^> Wcmsvc set to AUTO & sc config Wcmsvc start=auto >NUL 2>&1
ECHO    ^> WdNisSvc set to DEMAND & sc config WdNisSvc start=demand >NUL 2>&1
ECHO    ^> WinDefend set to AUTO & sc config WinDefend start=auto >NUL 2>&1
ECHO    ^> wudfsvc set to DEMAND & sc config wudfsvc start=demand >NUL 2>&1
ECHO    ^> WEPHOSTSVC set to DEMAND & sc config WEPHOSTSVC start=demand >NUL 2>&1
ECHO    ^> WerSvc set to DEMAND & sc config WerSvc start=demand >NUL 2>&1
ECHO    ^> Wecsvc set to DEMAND & sc config Wecsvc start=demand >NUL 2>&1
ECHO    ^> EventLog set to AUTO & sc config EventLog start=auto >NUL 2>&1
ECHO    ^> MpsSvc set to AUTO & sc config MpsSvc start=auto >NUL 2>&1
ECHO    ^> FontCache set to AUTO & sc config FontCache start=auto >NUL 2>&1
ECHO    ^> StiSvc set to DEMAND & sc config StiSvc start=demand >NUL 2>&1
ECHO    ^> msiserver set to DEMAND & sc config msiserver start=demand >NUL 2>&1
ECHO    ^> LicenseManager set to DEMAND & sc config LicenseManager start=demand >NUL 2>&1
ECHO    ^> Winmgmt set to AUTO & sc config Winmgmt start=auto >NUL 2>&1
ECHO    ^> WMPNetworkSvc set to DISABLED & sc config WMPNetworkSvc start=disabled >NUL 2>&1
ECHO    ^> icssvc set to DISABLED & sc config icssvc start=disabled >NUL 2>&1
ECHO    ^> TrustedInstaller set to DEMAND & sc config TrustedInstaller start=demand >NUL 2>&1
ECHO    ^> Wms set to AUTO & sc config Wms start=auto >NUL 2>&1
ECHO    ^> WmsRepair set to AUTO & sc config WmsRepair start=auto >NUL 2>&1
ECHO    ^> FontCache3.0.0.0 set to DISABLED & sc config FontCache3.0.0.0 start=disabled >NUL 2>&1
ECHO    ^> WAS set to DISABLED & sc config WAS start=disabled >NUL 2>&1
ECHO    ^> WpnService set to DEMAND & sc config WpnService start=demand >NUL 2>&1
ECHO    ^> WinRM set to DISABLED & sc config WinRM start=disabled >NUL 2>&1
ECHO    ^> WSearch set to DELAYED-AUTO & sc config WSearch start=delayed-auto >NUL 2>&1
ECHO    ^> WSService set to DEMAND & sc config WSService start=demand >NUL 2>&1
ECHO    ^> W32Time set to DEMAND & sc config W32Time start=demand >NUL 2>&1
ECHO    ^> wuauserv set to DEMAND & sc config wuauserv start=demand >NUL 2>&1
ECHO    ^> WinHttpAutoProxySvc set to DEMAND & sc config WinHttpAutoProxySvc start=demand >NUL 2>&1
ECHO    ^> dot3svc set to DEMAND & sc config dot3svc start=demand >NUL 2>&1
ECHO    ^> WlanSvc set to DEMAND & sc config WlanSvc start=demand >NUL 2>&1
ECHO    ^> wmiApSrv set to DEMAND & sc config wmiApSrv start=demand >NUL 2>&1
ECHO    ^> workfolderssvc set to DISABLED & sc config workfolderssvc start=disabled >NUL 2>&1
ECHO    ^> LanmanWorkstation set to AUTO & sc config LanmanWorkstation start=auto >NUL 2>&1
ECHO    ^> W3SVC set to DISABLED & sc config W3SVC start=disabled >NUL 2>&1
ECHO    ^> WwanSvc set to DEMAND & sc config WwanSvc start=demand >NUL 2>&1
ECHO    ^> XblAuthManager set to DISABLED & sc config XblAuthManager start=disabled >NUL 2>&1
ECHO    ^> XblGameSave set to DISABLED & sc config XblGameSave start=disabled >NUL 2>&1
ECHO    ^> XboxNetApiSvc set to DISABLED & sc config XboxNetApiSvc start=disabled >NUL 2>&1
GOTO WIFI

:: The following section will apply "tweaked" optimizations to the Windows services.
:: These should be safe for all users, but there's a small chance that problems could occur
:: depending on the users average workload.
:TWEAKED
ECHO.
ECHO Now applying TWEAKED service optimizations -- This shouldn't take long...
ECHO    ^> AxInstSV set to DEMAND & sc config AxInstSV start=demand >NUL 2>&1
ECHO    ^> AJRouter set to DISABLED & sc config AJRouter start=disabled >NUL 2>&1
ECHO    ^> AppReadiness set to DEMAND & sc config AppReadiness start=demand >NUL 2>&1
ECHO    ^> AppHostSvc set to DISABLED & sc config AppHostSvc start=disabled >NUL 2>&1
ECHO    ^> AppIDSvc set to DEMAND & sc config AppIDSvc start=demand >NUL 2>&1
ECHO    ^> Appinfo set to DEMAND & sc config Appinfo start=demand >NUL 2>&1
ECHO    ^> ALG set to DISABLED & sc config ALG start=disabled >NUL 2>&1
ECHO    ^> AppMgmt set to DEMAND & sc config AppMgmt start=demand >NUL 2>&1
ECHO    ^> AppXSVC set to DEMAND & sc config AppXSVC start=demand >NUL 2>&1
ECHO    ^> aspnet_state set to DISABLED & sc config aspnet_state start=disabled >NUL 2>&1
ECHO    ^> BITS set to DELAYED-AUTO & sc config BITS start=delayed-auto >NUL 2>&1
ECHO    ^> BrokerInfrastructure set to AUTO & sc config BrokerInfrastructure start=auto >NUL 2>&1
ECHO    ^> BFE set to AUTO & sc config BFE start=auto >NUL 2>&1
ECHO    ^> BDESVC set to DEMAND & sc config BDESVC start=demand >NUL 2>&1
ECHO    ^> wbengine set to DEMAND & sc config wbengine start=demand >NUL 2>&1
ECHO    ^> BthHFSrv set to DEMAND & sc config BthHFSrv start=demand >NUL 2>&1
ECHO    ^> bthserv set to DISABLED & sc config bthserv start=disabled >NUL 2>&1
ECHO    ^> PeerDistSvc set to DISABLED & sc config PeerDistSvc start=disabled >NUL 2>&1
ECHO    ^> CDPSvc set to DEMAND & sc config CDPSvc start=demand >NUL 2>&1
ECHO    ^> CertPropSvc set to DISABLED & sc config CertPropSvc start=disabled >NUL 2>&1
ECHO    ^> c2wts set to DEMAND & sc config c2wts start=demand >NUL 2>&1
ECHO    ^> NfsClnt set to DISABLED & sc config NfsClnt start=disabled >NUL 2>&1
ECHO    ^> ClipSVC set to DEMAND & sc config ClipSVC start=demand >NUL 2>&1
ECHO    ^> KeyIso set to DEMAND & sc config KeyIso start=demand >NUL 2>&1
ECHO    ^> EventSystem set to AUTO & sc config EventSystem start=auto >NUL 2>&1
ECHO    ^> COMSysApp set to DEMAND & sc config COMSysApp start=demand >NUL 2>&1
ECHO    ^> Browser set to DEMAND & sc config Browser start=demand >NUL 2>&1
ECHO    ^> CoreUIRegistrar set to AUTO & sc config CoreUIRegistrar start=auto >NUL 2>&1
ECHO    ^> VaultSvc set to DEMAND & sc config VaultSvc start=demand >NUL 2>&1
ECHO    ^> CryptSvc set to AUTO & sc config CryptSvc start=auto >NUL 2>&1
ECHO    ^> DsSvc set to DEMAND & sc config DsSvc start=demand >NUL 2>&1
ECHO    ^> DcpSvc set to DEMAND & sc config DcpSvc start=demand >NUL 2>&1
ECHO    ^> DcomLaunch set to AUTO & sc config DcomLaunch start=auto >NUL 2>&1
ECHO    ^> DoSvc set to DELAYED-AUTO & sc config DoSvc start=delayed-auto >NUL 2>&1
ECHO    ^> DeviceAssociationService set to DEMAND & sc config DeviceAssociationService start=demand >NUL 2>&1
ECHO    ^> DeviceInstall set to DEMAND & sc config DeviceInstall start=demand >NUL 2>&1
ECHO    ^> DmEnrollmentSvc set to DEMAND & sc config DmEnrollmentSvc start=demand >NUL 2>&1
ECHO    ^> DsmSVC set to DEMAND & sc config DsmSVC start=demand >NUL 2>&1
ECHO    ^> DevQueryBroker set to DEMAND & sc config DevQueryBroker start=demand >NUL 2>&1
ECHO    ^> Dhcp set to AUTO & sc config Dhcp start=auto >NUL 2>&1
ECHO    ^> DPS set to AUTO & sc config DPS start=auto >NUL 2>&1
ECHO    ^> WdiServiceHost set to DEMAND & sc config WdiServiceHost start=demand >NUL 2>&1
ECHO    ^> WdiSystemHost set to DEMAND & sc config WdiSystemHost start=demand >NUL 2>&1
ECHO    ^> DiagTrack set to AUTO & sc config DiagTrack start=auto >NUL 2>&1
ECHO    ^> TrkWks set to DISABLED & sc config TrkWks start=disabled >NUL 2>&1
ECHO    ^> MSDTC set to DEMAND & sc config MSDTC start=demand >NUL 2>&1
ECHO    ^> dmwappushsvc set to DISABLED & sc config dmwappushsvc start=disabled >NUL 2>&1
ECHO    ^> Dnscache set to AUTO & sc config Dnscache start=auto >NUL 2>&1
ECHO    ^> MapsBroker set to DISABLED & sc config MapsBroker start=disabled >NUL 2>&1
ECHO    ^> DsRoleSvc set to DISABLED & sc config DsRoleSvc start=disabled >NUL 2>&1
ECHO    ^> embeddedmode set to DEMAND & sc config embeddedmode start=demand >NUL 2>&1
ECHO    ^> EFS set to DEMAND & sc config EFS start=demand >NUL 2>&1
ECHO    ^> EntAppSvc set to DISABLED & sc config EntAppSvc start=disabled >NUL 2>&1
ECHO    ^> EapHost set to DEMAND & sc config EapHost start=demand >NUL 2>&1
ECHO    ^> Fax set to DISABLED & sc config Fax start=disabled >NUL 2>&1
ECHO    ^> fhsvc set to DEMAND & sc config fhsvc start=demand >NUL 2>&1
ECHO    ^> fdPHost set to DEMAND & sc config fdPHost start=demand >NUL 2>&1
ECHO    ^> FDResPub set to DEMAND & sc config FDResPub start=demand >NUL 2>&1
ECHO    ^> fsvc set to DISABLED & sc config fsvc start=disabled >NUL 2>&1
ECHO    ^> gpsvc set to AUTO & sc config gpsvc start=auto >NUL 2>&1
ECHO    ^> hkmsvc set to DISABLED & sc config hkmsvc start=disabled >NUL 2>&1
ECHO    ^> HomeGroupListener set to DEMAND & sc config HomeGroupListener start=demand >NUL 2>&1
ECHO    ^> HomeGroupProvider set to DEMAND & sc config HomeGroupProvider start=demand >NUL 2>&1
ECHO    ^> hidserv set to DEMAND & sc config hidserv start=demand >NUL 2>&1
ECHO    ^> vmickvpexchange set to DISABLED & sc config vmickvpexchange start=disabled >NUL 2>&1
ECHO    ^> vmicguestinterface set to DISABLED & sc config vmicguestinterface start=disabled >NUL 2>&1
ECHO    ^> vmicshutdown set to DISABLED & sc config vmicshutdown start=disabled >NUL 2>&1
ECHO    ^> vmicheartbeat set to DISABLED & sc config vmicheartbeat start=disabled >NUL 2>&1
ECHO    ^> vmicrdv set to DISABLED & sc config vmicrdv start=disabled >NUL 2>&1
ECHO    ^> vmictimesync set to DISABLED & sc config vmictimesync start=disabled >NUL 2>&1
ECHO    ^> vmicvmsession set to DISABLED & sc config vmicvmsession start=disabled >NUL 2>&1
ECHO    ^> vmicvss set to DISABLED & sc config vmicvss start=disabled >NUL 2>&1
ECHO    ^> IISADMIN set to DISABLED & sc config IISADMIN start=disabled >NUL 2>&1
ECHO    ^> IKEEXT set to DEMAND & sc config IKEEXT start=demand >NUL 2>&1
ECHO    ^> cphs set to DEMAND & sc config cphs start=demand >NUL 2>&1
ECHO    ^> UI0Detect set to DEMAND & sc config UI0Detect start=demand >NUL 2>&1
ECHO    ^> SharedAccess set to DISABLED & sc config SharedAccess start=disabled >NUL 2>&1
ECHO    ^> IEEtwCollectorService set to DISABLED & sc config IEEtwCollectorService start=disabled >NUL 2>&1
ECHO    ^> iphlpsvc set to DISABLED & sc config iphlpsvc start=disabled >NUL 2>&1
ECHO    ^> PolicyAgent set to DEMAND & sc config PolicyAgent start=demand >NUL 2>&1
ECHO    ^> KtmRm set to DEMAND & sc config KtmRm start=demand >NUL 2>&1
ECHO    ^> lltdsvc set to DEMAND & sc config lltdsvc start=demand >NUL 2>&1
ECHO    ^> LSM set to AUTO & sc config LSM start=auto >NUL 2>&1
ECHO    ^> LPDSVC set to DISABLED & sc config LPDSVC start=disabled >NUL 2>&1
ECHO    ^> MSMQ set to DISABLED & sc config MSMQ start=disabled >NUL 2>&1
ECHO    ^> MSMQTriggers set to DISABLED & sc config MSMQTriggers start=disabled >NUL 2>&1
ECHO    ^> diagnosticshub.standardcollector.service set to DISABLED & sc config diagnosticshub.standardcollector.service start=disabled >NUL 2>&1
ECHO    ^> wlidsvc set to DEMAND & sc config wlidsvc start=demand >NUL 2>&1
ECHO    ^> ftpsvc set to DISABLED & sc config ftpsvc start=disabled >NUL 2>&1
ECHO    ^> MSiSCSI set to DISABLED & sc config MSiSCSI start=disabled >NUL 2>&1
ECHO    ^> NgcSvc set to DEMAND & sc config NgcSvc start=demand >NUL 2>&1
ECHO    ^> NgcCtnrSvc set to DEMAND & sc config NgcCtnrSvc start=demand >NUL 2>&1
ECHO    ^> swprv set to DEMAND & sc config swprv start=demand >NUL 2>&1
ECHO    ^> smphost set to DEMAND & sc config smphost start=demand >NUL 2>&1
ECHO    ^> SmsRouter set to DISABLED & sc config SmsRouter start=disabled >NUL 2>&1
ECHO    ^> NetMsmqActivator set to DISABLED & sc config NetMsmqActivator start=disabled >NUL 2>&1
ECHO    ^> NetPipeActivator set to DISABLED & sc config NetPipeActivator start=disabled >NUL 2>&1
ECHO    ^> NetTcpActivator set to DISABLED & sc config NetTcpActivator start=disabled >NUL 2>&1
ECHO    ^> NetTcpPortSharing set to DISABLED & sc config NetTcpPortSharing start=disabled >NUL 2>&1
ECHO    ^> Netlogon set to DISABLED & sc config Netlogon start=disabled >NUL 2>&1
ECHO    ^> NcdAutoSetup set to DEMAND & sc config NcdAutoSetup start=demand >NUL 2>&1
ECHO    ^> NcbService set to DEMAND & sc config NcbService start=demand >NUL 2>&1
ECHO    ^> Netman set to DEMAND & sc config Netman start=demand >NUL 2>&1
ECHO    ^> NcaSVC set to DEMAND & sc config NcaSVC start=demand >NUL 2>&1
ECHO    ^> netprofm set to DEMAND & sc config netprofm start=demand >NUL 2>&1
ECHO    ^> NlaSvc set to AUTO & sc config NlaSvc start=auto >NUL 2>&1
ECHO    ^> NetSetupSvc set to DEMAND & sc config NetSetupSvc start=demand >NUL 2>&1
ECHO    ^> nsi set to AUTO & sc config nsi start=auto >NUL 2>&1
ECHO    ^> CscService set to DISABLED & sc config CscService start=disabled >NUL 2>&1
ECHO    ^> defragsvc set to DEMAND & sc config defragsvc start=demand >NUL 2>&1
ECHO    ^> PNRPsvc set to DEMAND & sc config PNRPsvc start=demand >NUL 2>&1
ECHO    ^> p2psvc set to DEMAND & sc config p2psvc start=demand >NUL 2>&1
ECHO    ^> p2pimsvc set to DEMAND & sc config p2pimsvc start=demand >NUL 2>&1
ECHO    ^> pla set to DEMAND & sc config pla start=demand >NUL 2>&1
ECHO    ^> PlugPlay set to DEMAND & sc config PlugPlay start=demand >NUL 2>&1
ECHO    ^> PNRPAutoReg set to DEMAND & sc config PNRPAutoReg start=demand >NUL 2>&1
ECHO    ^> WPDBusEnum set to DEMAND & sc config WPDBusEnum start=demand >NUL 2>&1
ECHO    ^> Power set to AUTO & sc config Power start=auto >NUL 2>&1
ECHO    ^> Spooler set to AUTO & sc config Spooler start=auto >NUL 2>&1
ECHO    ^> PrintNotify set to DEMAND & sc config PrintNotify start=demand >NUL 2>&1
ECHO    ^> wercplsupport set to DEMAND & sc config wercplsupport start=demand >NUL 2>&1
ECHO    ^> PcaSvc set to DEMAND & sc config PcaSvc start=demand >NUL 2>&1
ECHO    ^> QWAVE set to DEMAND & sc config QWAVE start=demand >NUL 2>&1
ECHO    ^> RasAuto set to DEMAND & sc config RasAuto start=demand >NUL 2>&1
ECHO    ^> RasMan set to DEMAND & sc config RasMan start=demand >NUL 2>&1
ECHO    ^> SessionEnv set to DEMAND & sc config SessionEnv start=demand >NUL 2>&1
ECHO    ^> TermService set to DEMAND & sc config TermService start=demand >NUL 2>&1
ECHO    ^> UmRdpService set to DEMAND & sc config UmRdpService start=demand >NUL 2>&1
ECHO    ^> RpcSs set to AUTO & sc config RpcSs start=auto >NUL 2>&1
ECHO    ^> RpcLocator set to DISABLED & sc config RpcLocator start=disabled >NUL 2>&1
ECHO    ^> RemoteRegistry set to DISABLED & sc config RemoteRegistry start=disabled >NUL 2>&1
ECHO    ^> RetailDemo set to DISABLED & sc config RetailDemo start=disabled >NUL 2>&1
ECHO    ^> iprip set to DISABLED & sc config iprip start=disabled >NUL 2>&1
ECHO    ^> RemoteAccess set to DISABLED & sc config RemoteAccess start=disabled >NUL 2>&1
ECHO    ^> RpcEptMapper set to AUTO & sc config RpcEptMapper start=auto >NUL 2>&1
ECHO    ^> seclogon set to DEMAND & sc config seclogon start=demand >NUL 2>&1
ECHO    ^> SstpSvc set to DEMAND & sc config SstpSvc start=demand >NUL 2>&1
ECHO    ^> SamSs set to AUTO & sc config SamSs start=auto >NUL 2>&1
ECHO    ^> wscsvc set to DELAYED-AUTO & sc config wscsvc start=delayed-auto >NUL 2>&1
ECHO    ^> SensorDataService set to DISABLED & sc config SensorDataService start=disabled >NUL 2>&1
ECHO    ^> SensrSvc set to DISABLED & sc config SensrSvc start=disabled >NUL 2>&1
ECHO    ^> SensorService set to DISABLED & sc config SensorService start=disabled >NUL 2>&1
ECHO    ^> LanmanServer set to AUTO & sc config LanmanServer start=auto >NUL 2>&1
ECHO    ^> ShellHWDetection set to AUTO & sc config ShellHWDetection start=auto >NUL 2>&1
ECHO    ^> simptcp set to DISABLED & sc config simptcp start=disabled >NUL 2>&1
ECHO    ^> SCardSvr set to DISABLED & sc config SCardSvr start=disabled >NUL 2>&1
ECHO    ^> ScDeviceEnum set to DISABLED & sc config ScDeviceEnum start=disabled >NUL 2>&1
ECHO    ^> SCPolicySvc set to DISABLED & sc config SCPolicySvc start=disabled >NUL 2>&1
ECHO    ^> SNMP set to DISABLED & sc config SNMP start=disabled >NUL 2>&1
ECHO    ^> SNMPTRAP set to DISABLED & sc config SNMPTRAP start=disabled >NUL 2>&1
ECHO    ^> sppsvc set to DELAYED-AUTO & sc config sppsvc start=delayed-auto >NUL 2>&1
ECHO    ^> svsvc set to DEMAND & sc config svsvc start=demand >NUL 2>&1
ECHO    ^> SSDPSRV set to DEMAND & sc config SSDPSRV start=demand >NUL 2>&1
ECHO    ^> StateRepository set to DEMAND & sc config StateRepository start=demand >NUL 2>&1
ECHO    ^> WiaRpc set to DEMAND & sc config WiaRpc start=demand >NUL 2>&1
ECHO    ^> StorSvc set to DISABLED & sc config StorSvc start=disabled >NUL 2>&1
ECHO    ^> SysMain set to AUTO & sc config SysMain start=auto >NUL 2>&1
ECHO    ^> SENS set to AUTO & sc config SENS start=auto >NUL 2>&1
ECHO    ^> SystemEventsBroker set to AUTO & sc config SystemEventsBroker start=auto >NUL 2>&1
ECHO    ^> Schedule set to AUTO & sc config Schedule start=auto >NUL 2>&1
ECHO    ^> lmhosts set to DEMAND & sc config lmhosts start=demand >NUL 2>&1
ECHO    ^> TapiSrv set to DEMAND & sc config TapiSrv start=demand >NUL 2>&1
ECHO    ^> Themes set to AUTO & sc config Themes start=auto >NUL 2>&1
ECHO    ^> tiledatamodelsvc set to AUTO & sc config tiledatamodelsvc start=auto >NUL 2>&1
ECHO    ^> TimeBroker set to DEMAND & sc config TimeBroker start=demand >NUL 2>&1
ECHO    ^> TabletInputService set to DISABLED & sc config TabletInputService start=disabled >NUL 2>&1
ECHO    ^> UsoSvc set to DEMAND & sc config UsoSvc start=demand >NUL 2>&1
ECHO    ^> upnphost set to DEMAND & sc config upnphost start=demand >NUL 2>&1
ECHO    ^> UserManager set to AUTO & sc config UserManager start=auto >NUL 2>&1
ECHO    ^> ProfSvc set to AUTO & sc config ProfSvc start=auto >NUL 2>&1
ECHO    ^> vds set to DEMAND & sc config vds start=demand >NUL 2>&1
ECHO    ^> VSS set to DEMAND & sc config VSS start=demand >NUL 2>&1
ECHO    ^> W3LOGSVC set to DISABLED & sc config W3LOGSVC start=disabled >NUL 2>&1
ECHO    ^> WalletService set to DEMAND & sc config WalletService start=demand >NUL 2>&1
ECHO    ^> WMSVC set to DISABLED & sc config WMSVC start=disabled >NUL 2>&1
ECHO    ^> WebClient set to DEMAND & sc config WebClient start=demand >NUL 2>&1
ECHO    ^> AudioSrv set to AUTO & sc config AudioSrv start=auto >NUL 2>&1
ECHO    ^> AudioEndpointBuilder set to AUTO & sc config AudioEndpointBuilder start=auto >NUL 2>&1
ECHO    ^> SDRSVC set to DEMAND & sc config SDRSVC start=demand >NUL 2>&1
ECHO    ^> WbioSrvc set to DISABLED & sc config WbioSrvc start=disabled >NUL 2>&1
ECHO    ^> WcsPlugInService set to DEMAND & sc config WcsPlugInService start=demand >NUL 2>&1
ECHO    ^> wcncsvc set to DISABLED & sc config wcncsvc start=disabled >NUL 2>&1
ECHO    ^> Wcmsvc set to AUTO & sc config Wcmsvc start=auto >NUL 2>&1
ECHO    ^> WdNisSvc set to DEMAND & sc config WdNisSvc start=demand >NUL 2>&1
ECHO    ^> WinDefend set to AUTO & sc config WinDefend start=auto >NUL 2>&1
ECHO    ^> wudfsvc set to DEMAND & sc config wudfsvc start=demand >NUL 2>&1
ECHO    ^> WEPHOSTSVC set to DEMAND & sc config WEPHOSTSVC start=demand >NUL 2>&1
ECHO    ^> WerSvc set to DEMAND & sc config WerSvc start=demand >NUL 2>&1
ECHO    ^> Wecsvc set to DEMAND & sc config Wecsvc start=demand >NUL 2>&1
ECHO    ^> EventLog set to AUTO & sc config EventLog start=auto >NUL 2>&1
ECHO    ^> MpsSvc set to AUTO & sc config MpsSvc start=auto >NUL 2>&1
ECHO    ^> FontCache set to AUTO & sc config FontCache start=auto >NUL 2>&1
ECHO    ^> StiSvc set to DEMAND & sc config StiSvc start=demand >NUL 2>&1
ECHO    ^> msiserver set to DEMAND & sc config msiserver start=demand >NUL 2>&1
ECHO    ^> LicenseManager set to DEMAND & sc config LicenseManager start=demand >NUL 2>&1
ECHO    ^> Winmgmt set to AUTO & sc config Winmgmt start=auto >NUL 2>&1
ECHO    ^> WMPNetworkSvc set to DISABLED & sc config WMPNetworkSvc start=disabled >NUL 2>&1
ECHO    ^> icssvc set to DISABLED & sc config icssvc start=disabled >NUL 2>&1
ECHO    ^> TrustedInstaller set to DEMAND & sc config TrustedInstaller start=demand >NUL 2>&1
ECHO    ^> Wms set to DISABLED & sc config Wms start=disabled >NUL 2>&1
ECHO    ^> WmsRepair set to DISABLED & sc config WmsRepair start=disabled >NUL 2>&1
ECHO    ^> FontCache3.0.0.0 set to DISABLED & sc config FontCache3.0.0.0 start=disabled >NUL 2>&1
ECHO    ^> WAS set to DISABLED & sc config WAS start=disabled >NUL 2>&1
ECHO    ^> WpnService set to DEMAND & sc config WpnService start=demand >NUL 2>&1
ECHO    ^> WinRM set to DISABLED & sc config WinRM start=disabled >NUL 2>&1
ECHO    ^> WSearch set to DELAYED-AUTO & sc config WSearch start=delayed-auto >NUL 2>&1
ECHO    ^> WSService set to DEMAND & sc config WSService start=demand >NUL 2>&1
ECHO    ^> W32Time set to DEMAND & sc config W32Time start=demand >NUL 2>&1
ECHO    ^> wuauserv set to DEMAND & sc config wuauserv start=demand >NUL 2>&1
ECHO    ^> WinHttpAutoProxySvc set to DEMAND & sc config WinHttpAutoProxySvc start=demand >NUL 2>&1
ECHO    ^> dot3svc set to DEMAND & sc config dot3svc start=demand >NUL 2>&1
ECHO    ^> WlanSvc set to DEMAND & sc config WlanSvc start=demand >NUL 2>&1
ECHO    ^> wmiApSrv set to DEMAND & sc config wmiApSrv start=demand >NUL 2>&1
ECHO    ^> workfolderssvc set to DISABLED & sc config workfolderssvc start=disabled >NUL 2>&1
ECHO    ^> LanmanWorkstation set to AUTO & sc config LanmanWorkstation start=auto >NUL 2>&1
ECHO    ^> W3SVC set to DISABLED & sc config W3SVC start=disabled >NUL 2>&1
ECHO    ^> WwanSvc set to DEMAND & sc config WwanSvc start=demand >NUL 2>&1
ECHO    ^> XblAuthManager set to DISABLED & sc config XblAuthManager start=disabled >NUL 2>&1
ECHO    ^> XblGameSave set to DISABLED & sc config XblGameSave start=disabled >NUL 2>&1
ECHO    ^> XboxNetApiSvc set to DISABLED & sc config XboxNetApiSvc start=disabled >NUL 2>&1
GOTO WIFI

:: The following section will ask the user if they use WiFi. In most cases this will be YES,
:: but in case the user is connected to the Internet via LAN then it is safe to disable the WLAN service.
:WIFI
ECHO.
CHOICE /M "Do you use a Wireless connection?"
IF %ERRORLEVEL% == 1 ECHO    ^> WlanSvc set to AUTO & sc config WlanSvc start=auto >NUL 2>&1
IF %ERRORLEVEL% == 2 ECHO    ^> WlanSvc set to DISABLED & sc config WlanSvc start=disabled >NUL 2>&1

:END
ECHO.
ECHO Your system has been optimized successfully!
GOTO EXIT

:EXIT
PAUSE & EXIT