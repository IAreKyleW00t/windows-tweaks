Windows Tweaks
==============
A small collection of useful scripts for optimizing, cleaning, and tweaking the Windows OS (XP and newer).  
:exclamation::exclamation: **WARNING**: These scripts *may* come up as false-positives by your AV. :exclamation::exclamation:

**This repo is designed for inexperience users**. I will not be including unsafe or "dangerous" tweaks that may negatively effect the average user. Even with that said, it is still advised to **proceed with caution** -- I am not perfect; mistakes can happen.

To help users understand what is being done, informative ouput will be logged to the console and explained in more detail below. Knowledge is power when it comes to your PC.

---
### */service-optimizer
Most of the optimizations used when tweaking Windows services come from [Black Viper](http://www.blackviper.com/); a well-known user who provides many useful tweaks to Windows. The scripts in this repo will take these optimizations and break them down into 3 levels.

**DEFAULT** - Will set all Windows services back to their original startup values.  
**SAFE** - Will set all Windows services to a "safe" level of optimization that is good for all users. (Recommended)  
**TWEAKED** - Will set all Windows services to a slightly higher level of optimization that *should* be good for all users.

Both `SAFE` and `TWEAKED` are safe for the average user, but there is a very slightly chance that `TWEAKED` will disable some key services depending on how the users PC is configured/used. If you're unsure, use `SAFE`; the difference in performance is negligible at best.

### windows10/privacy-patcher
#### HOSTS
The [`hosts`](https://en.wikipedia.org/wiki/Hosts_(file)) file in Windows is located in `C:\Windows\System32\drivers\etc` and is used to map hostnames to an IP address. The script in this repo will append to the end of this file all known hostnames that are used by Microsoft to track/collect user data and null-route them for both IPv4 and IPv6. **This will not break Windows updates.**

#### FIREWALL
The [firewall](https://en.wikipedia.org/wiki/Windows_Firewall) in Windows is a utility that allows a user to control the network traffic that comes in and out of their PC. The script in this repo will update the firewall to include multiple rules that block all outbound requests to known IP's that used to track/collect user data on all protocols. **This will not break Windows updates.**

#### TELEMETRY
[Telemetry](https://en.wikipedia.org/wiki/Telemetry) is an automated communications process by which measurements and other data are collected at remote or inaccessible points and transmitted to receiving equipment for monitoring. This script in this repo will disable this "feature" to prevent any user data from being sent to Microsoft.

#### SERVICES
[Services](https://en.wikipedia.org/wiki/Windows_service) in Windows are small programs that run in the background that assist other larger programs. The script in this repo will stop and disable the `dmwappushservice`, `diagtrack`, and `Wecsvc` services to prevent any user data from being sent to Microsoft. Users who wish to completely remove these services can use the `sc delete` command.

#### DIAGTRACK LOG
Diagnostic information is logged to a file named `Autologger-Diagtrack-Listener.etl` that is located in `C:\ProgramData\Microsoft\Diagnosis\ETLLogs\Autologger`. This information is sent to Microsoft to collect information about their users. In addition to disabling the service(s) that control this function, the script in this repo will lock down said file to prevent the system from accessing it and then clear the entire file.

---
Website: http://k.yle.sh/  
Author: Kyle Colantonio ![email](http://i.imgur.com/pUOz6mM.png)  
