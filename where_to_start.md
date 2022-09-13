| **Take your time, it's faster**

So now you are probably wondering what the hell to do ? Where to start ? Well if you follow the instructions and take the time to understand them (I mean REALLY understand), then everything will be alright! But, if you try to skip some step, be aware that things can go very bad... not only for your computer but also your real life.

* To read a guide, use the command `md` <FILE.MD> (where <FILE.MD> is the name of the guide you want to read). This is an alias that have been created during the installation and it stand for the tool `md2term` designed to read Markdown language from the command line.

</br>

**PART A - Environment:** here you will learn first how to work with Linux.

**PART B - Anonymity:** before jumping to any kind of attack you need to understand how to protect yourself from yourself.

**PART C - Getting start:** where to start with your first target.

**PART D - Index of guide:** which guide are avalaible.

- Anonymity 
- Cracking
- Ddos
- Dorking
- Exploitation
- Forensics / anti
- Fuzzing
- Payload
- Recon / info gathering
- Shell
- Social engineering
- Utilities
- Vulnerability
- Web application
- Wireless 


</br>

# PART A - Environment

### Terminal 

A terminal is simply a text-based interface to the computer. In a terminal, you can:
* type commands
* manipulate files
* execute programs
* open documents

When working in a terminal, the current directory is called your working directory. A terminal will usually start in the top-level directory of your account. Directories are separated by a backslash `/`. The topmost directory is indicated by a single backslash. The total directory tree is all relative to the top level directory.

In Kali Linux, the package manager is `apt`. So whatever is related to package will work with it (install, uninstall, search, repair, etc).

To see the importants files in Linux, read here:
```
md /opt/utilities/important_files.md
```

To see the basics commands, read here:
```
md /opt/utilities/term_basics.md
```

The first thing to do each day is to update your Linux:
```
sudo apt-get update && apt-get upgrade -y
```

* Tips: `-y` stand for "yes" so it mean you won't be prompt to ask if you accept to update.

Now time to practice, read and answer the questions:
```
md /opt/utilities/practice_term.md
```

### Editor

**NANO**

**VIM**

</br>

# PART B - Anonymity

To setup your network security, refer to the appropriate section here:

**VPN**
```
md /opt/anonymity/CS_anonymity/install_Mullvad_Kali.md
```
**PROXYCHAINS4**
```
md /opt/anonymity/CS_anonymity/setup_proxychains4.md
```
**TOR**

Tor is use to hide your network in linux and you can simply start it:
```
service tor start
```
to stop:
```
service tor stop
```
to restart:
```
service tor restart
```
| Note: if you connect to Tor before connecting to your VPN, then your VPN will cover the fact that you are using Tor. This can be useful while browsing on Internet, since some website block IP behind Tor.

**If you have some issues with your connection**

1. make sure you have follow the step in the guide of Kali installation in VirtualBox (https://github.com/NeverWonderLand/kali-inst-guide)
2. restart your network: `service NetworkManager restart`
3. reboot your kali: `reboot`

**Topics: Anons**

Take the time to read:
```
md /opt/anonymity/CS_anonymity/Masked_Man.md
```

</br>

# PART C - Getting start

**The phases of an attack**  
1. Reconnaissance Information gathering, physical and social engineering, locate network range  
2. Scanning - Enumerating Live hosts, access points, accounts and policies, vulnerability assessment  
3. Gaining Access Breech systems, plant malicious code, backdoors  
4. Maintaining Access Rootkits, unpatched systems  
5. Clearing Tracks IDS evasion, log manipulation, decoy traffic

**Information Gathering**  
1. Unearth initial information What/ Who is the target?  
2. Locate the network range What is the attack surface?  
3. Ascertain active machines What hosts are alive?  
4. Open ports / access points How can they be accessed?  
5. Detect operating systems What platform are they?  
6. Uncover services on ports What software can be attacked?  
7. Map the network Tie it all together, document, and form a strategy.

</br>

# PART D - Guide avalaible

| To read guide ending with .md : use the command `md`
| To read guide ending with .txt : use the command `cat`

### Anonymity

```
Directory:
cd /opt/anonymity/CS_anonymity

Guide:
* Get_Your_External_IP.md
* gpg_command.md
* install_Mullvad_Kali.md
* Masked_Man.md
* setup_proxychains4.md
```

### Cracking

```
Directory:
cd /opt/cracking/CS_cracking

Guide:
* Bruteforce.md
* Hash_Examples.txt
* Password_Harvesting.md
```

### Ddos

```
Directory:
cd /opt/ddos/CS_ddos

Guide:
* DNS_Amplification.md
* Hping3.md
* OSI_attacks_by_layer.md
```

### Dorking

```
Directory:
cd /opt/recon/dorking/CS_dorking

Guide:
* Google_Dork_operators.md
```

### Exploitation

```
Directory:
cd /opt/exploitation/CS_exploitation

Guide:
* Compiling_Exploits.md
* Exploit_Research.md
* Exploitation.md
* Linux_privilege_escalation_cheatsheet.md
* log4j.md
* Meterpreter.md
```

### Forensics / Anti

```
Directory:
cd /opt/forensics/CS_forensics

Guide:
* Forensic_Response_Windows.md
```

### Fuzzing

```
Directory:
cd /opt/recon/fuzzing/CS_fuzzing

Guide:
* ffuf.md
```

### Payload

```
Directory:
cd /opt/Payload_List

List:
* dom_payload.txt
* union_sql_payload.txt
* xss_1.txt
* xss_2.txt
```

### Recon / Info gathering

```
Directory:
cd /opt/recon/CS_recon

Guide:
* Avoid_Scanning.md
* Evading_Firewalls.md
* footprinting_checklist.md
* ICS_SCADA_scan.md
* InfoGathering.md
* IP_Classes.txt
* NMAP_types_of_scan.md
* port_list.txt
* SHODAN_QUERY.md
```

### Shell

```
Directory:
cd /opt/Shell

Shell:
* alfa-v4.1.zip
* evil.zip
* IndoXploitv3.zip
* marijuana.zip
* reverse_shell.md
* TTY_Shells.md
* wzo.zip
```

### Social engineering

```
Directory:
cd /opt/se/CS_social_engineering

Guide:
* Ressources.md
```

### Utilities

```
Directory:
cd /opt/Utilities

Guide:
* aliases.txt
* ASCII_Table.txt
* bash.md
* covenant_install.md
* github-git-advanced-cheat-sheet.md
* important_files.md
```

### Vulnerability

```
Directory:
cd /opt/vuln/CS_vulns

Guide:
* Vulnerability.md
```

### Web application

```
Directory:
cd /opt/vuln/webapp/CS_webapp

Guide:
* WebApp.md
```

### Wireless

```
Directory:
cd /opt/wireless/CS_wireless

Guide:
* Wifi_Hacking.md
* Wireless.md
```