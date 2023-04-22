OSINT, or Open Source Intelligence, refers to the collection and analysis of publicly available information to gather intelligence about a target during the reconnaissance phase of an ethical hacking or penetration testing engagement. This information can help security professionals and ethical hackers understand the target's environment, identify potential vulnerabilities, and plan their attack strategies more effectively.

OSINT sources can include a wide range of publicly accessible resources, such as:

• Websites: Corporate websites, blogs, and forums can provide valuable information about a target organization, its infrastructure, and employees.

• Search engines: Google, Bing, and other search engines can help uncover information related to the target, such as indexed web pages, cached content, and file downloads.

• Social media platforms: Facebook, LinkedIn, Twitter, and other social media platforms can provide insights into an organization's activities, employee profiles, and potential weaknesses.

• WHOIS databases: These databases contain information about domain registration, including the registrant's name, contact details, and registration dates.

• DNS records: DNS records can reveal information about an organization's domain, such as IP addresses, mail servers, and subdomains.

• Online databases and archives: Publicly accessible databases and archives, such as the Wayback Machine, can provide historical snapshots of websites and other valuable information.

• Government records: Public records, such as business registrations, patents, and legal documents, can offer insights into a company's operations and partnerships.

• GeoIP databases: These databases can help determine the physical location of IP addresses, providing geographical context for a target's infrastructure.

• Job postings: Job postings can reveal information about an organization's technology stack, internal processes, and potential weaknesses.

• Public code repositories: GitHub, GitLab, and other code repositories can provide insight into an organization's software development practices and potential vulnerabilities in their code.

The goal of OSINT in reconnaissance is to gather as much information as possible without actively engaging with the target system or network. This passive approach helps reduce the risk of detection while still providing valuable insights that can be used to plan further attacks or improve an organization's security posture.


# OSINT

### Passive Discovery

- Amass - https://github.com/OWASP/Amass (Attack Surface Mapping)

- Metabigor - https://github.com/j3ssie/metabigor (Non-API OSINT)

- AsINT_Collection - https://start.me/p/b5Aow7/asint_collection (Massive OSINT Collection)

- Email --> Phone# - https://github.com/iansangaji/email2phonenumber

- MFASweep - https://github.com/dafthack/MFASweep (MFA Check for Microsoft endpoints)

- Fast-Google-Dorks-Scan - https://github.com/IvanGlinkin/Fast-Google-Dorks-Scan?mc_cid=70cff8af7c&mc_eid=eff0f218d6 (Google Dork)

### Target User Population Collection

- Linkedin UserEnum - https://github.com/bigb0sss/LinkedinMama

- US Staff UserEnum - https://github.com/bigb0sss/USStaffMama

- NameSpi - https://github.com/waffl3ss/NameSpi

### Public Site Lookup (Github, Gitlab, etc.)

- Gitrob - https://github.com/michenriksen/gitrob/ (Github Search)

- truffleHog - https://github.com/dxa4481/truffleHog (Github Regex Search)

### Cloud Recon

- Cloud_Security_Wiki - https://cloudsecwiki.com/azure_cloud.html (Awesome cloud resources)

- cloud_enum - https://github.com/initstring/cloud_enum

- MicroBurst - https://github.com/NetSPI/MicroBurst (AZURE)

- pacu - https://github.com/RhinoSecurityLabs/pacu (AWS)

- FestIn - https://github.com/cr0hn/festin (AWS)

- s3viewer - https://github.com/SharonBrizinov/s3viewer (AWS)

- Cloud_Pentest_Cheatsheet - https://github.com/dafthack/CloudPentestCheatsheets

- endgame - https://github.com/salesforce/endgame (AWS)

### Microsoft / Windows

#### Active Discovery

- ZGrab - https://github.com/zmap/zgrab (Banner grabber)

- Hardenize - https://www.hardenize.com/ (Domain Lookup) 

#### ADFS

- ADFSpoof - https://github.com/fireeye/ADFSpoof (Forge ADFS security tokens)

### Web App

- Wordpress-Exploit-Framework - https://github.com/rastating/wordpress-exploit-framework

- Awesome-Web-Security - https://github.com/qazbnm456/awesome-web-security

- Java Deserialization - https://github.com/frohoff/ysoserial

- PHP Deserialization - https://github.com/ambionics/phpggc

- Kubernetes - https://github.com/loodse/kubectl-hacking

- SSRF - https://github.com/jdonsec/AllThingsSSRF

- Skf-labs - https://owasp-skf.gitbook.io/asvs-write-ups/ (Great Write-ups)

  <br />

## Phishing

### Phishing Techniques - https://blog.sublimesecurity.com/

#### Microsfot 365 Device Code Phishing

- devicePhish - https://github.com/bigb0sss/Microsoft365_devicePhish

- TokenTactics - https://github.com/rvrsh3ll/TokenTactics

  <br />

## 2FA bypass

- Evilnginx2 - https://github.com/kgretzky/evilginx2

- EvilnoVNC - https://github.com/JoelGMSec/EvilnoVNC

## Password Spray

### Tools

- MSOLSpray - https://github.com/dafthack/MSOLSpray

- o365enum.py - https://github.com/gremwell/o365enum (Microsoft ActiveSync)

- goPassGen - https://github.com/bigb0sss/goPassGen (PasswordSpray List Generator)

- go365 - https://github.com/optiv/Go365 (Microsoft SOAP API endpoint on login.microsoftonline.com)

- Okta - https://github.com/Rhynorater/Okta-Password-Sprayer

- o365Spray - https://github.com/0xZDH/o365spray

- Spray365 - https://github.com/MarkoH17/Spray365 (Microsoft365 / Azure AD)

### IP Rotators

- Burp IPRotate - https://github.com/PortSwigger/ip-rotate (Utilizes AWS IP Gateway)

- ProxyCannon-NG - https://github.com/proxycannon/proxycannon-ng

- Cloud-proxy - https://github.com/tomsteele/cloud-proxy

- Proxy-NG - https://github.com/jamesbcook/proxy-ng

- Mubeng - https://github.com/kitabisa/mubeng#proxy-ip-rotator

### Default Password Check

- CIRT - https://cirt.net/passwords

- DefaultCreds-cheat-sheet - https://github.com/ihebski/DefaultCreds-cheat-sheet
