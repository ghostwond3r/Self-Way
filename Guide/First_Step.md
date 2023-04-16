# First Step

| **Take your time, it's faster**

Starting out in cybersecurity can be daunting, but taking your time to learn the fundamentals can actually speed up your progress in the long run. It's important to follow the instructions and take the time to truly understand them, rather than skipping steps or taking shortcuts. Doing so can not only cause problems with your computer, but potentially impact your personal life as well.

To help you get started, this guide is divided into three main parts. In Part A, you will learn the basics of working with the command line in your terminal. In Part B, you will learn about anonymity and how to protect yourself before conducting any kind of attack. Finally, in Part C, you will be given guidance on where to start with your first target.

> Once you finish with this file, you can go to 'how_to_use_tools.md'

</br>

# PART A

### Terminal 

A terminal is simply a text-based interface to the computer. In a terminal, you can:
* type command
* manipulate files
* execute programs
* open documents

When working in a terminal, the current directory is called your working directory. A terminal will usually start in the top-level directory of your account. Directories are separated by a backslash `/`. The topmost directory is indicated by a single backslash. The total directory tree is all relative to the top level directory.

In Kali Linux, the package manager is `apt`. So whatever is related to package will work with it:
```
autoclean     
build-dep     
depends       
download      
full-upgrade  
list          
purge         
reinstall     
search        
showsrc       
update      
autoremove    
changelog     
dist-upgrade  
edit-sources  
install       
policy        
rdepends      
remove        
show          
source        
upgrade 
```

To see the importants files in Linux, read here: `/Utilities/important_files.md`

To see the basics commands, read here: `/Utilities/term_basics.md`

The first thing to do each day is to update your Linux:
```
sudo apt-get update && apt-get upgrade -y
```

* Tips: `-y` stand for "yes" so it mean you won't be prompt to ask if you accept to update.

Now time to practice here: `/Utilities/practice_term.md`

</br>

### Editor **NANO**

You can access the cheatsheet here: `/Utilities/NANO.md`

### Editor **VIM**

You can access the cheatsheet here: `/Utilities/VIM.md`

</br>

# PART B

To setup your network, refer to the appropriate section here:

**VPN** `/Anonymity/install_Mullvad_Kali.md`

> Whatever the VPN you use, the process of the installation will be very similar. Just look on the website provider for the installation process on Linux.

**PROXYCHAINS4** `/Anonymity/setup_proxychains4.md`

</br>

**Tor** is use to hide your IP address, and you can:

start it:
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

</br>

**If you have some issues with your connection**

1. Make sure you have follow the step in the guide of Kali installation in VirtualBox (https://github.com/NeverWonderLand/kali-inst-guide)
2. restart your network: `service NetworkManager restart`
3. reboot your kali: `reboot`

### Topics: Anonymous - the good behavior

* Take the time to read: `/Anonymity/Masked_Man.md`

</br>

# PART C
When starting with a new objective, there are several key questions you should answer to guide your efforts:

1. What/Who is the target? Unearth initial information to identify your target.
2. What is the attack surface? Locate the network range to determine the scope of your attack.
3. What hosts are alive? Ascertain which machines are active to identify potential targets.
4. How can they be accessed? Identify open ports/access points to understand how to gain entry.
5. What platform are they? Detect operating systems to understand the technology you'll be dealing with.
6. What software can be attacked? Uncover services on ports to identify specific software vulnerabilities.
7. How do all these pieces fit together? Map the network to fully understand the infrastructure.

By answering these questions, you'll be able to tie everything together, document your findings, and form a comprehensive strategy for your attack.

**The phases of an attack (of course it can be more than this, but thats the more often use)**

1. Information gathering: 
> Before even starting the attack, reconnaissance is often done to gather information about the target's infrastructure, employees, vendors, and other relevant information.
   
    * DNS Analysis
    * IDS/IPS Identification
    * Live Host Identification
    * Network & Port Scanners
    * CMS & Framework Identification
    * OSINT Analysis
    * Route Analysis
    * SMB Analysis
    * SMTP Analysis
    * SNMP Analysis
    * SSL Analysis

2. Vulnerability Assessment
> analysis of the target to identify potential weaknesses, such as outdated software, misconfigured settings, or insecure coding practices.

    * enumerating Live hosts
    * access points
    * accounts and policies
    * Social Engineering
    * Fuzzing
    * Stress Testing
    * VoIP
    * Privilege Escalation
    * Web Application Proxies
    * Web Crawlers & Directory Bruteforce
    * Web Vulnerability Scanners

3. Exploitation
> This involves finding and exploiting a vulnerability to gain a foothold on the target's system.

    * Database
    * Researching Exploit
    * Gaining Access (Shell)
    * Breech systems
    * Malicious code
    * Backdoors

4. Password Attacks
> If attackers are successful in obtaining sensitive information, they will attempt to exfiltrate it from the target's network.

    * Local Attacks
    * Offline Attacks
    * Online Attacks
    * Password Profiling & Wordlists

5. Maintaining Access
> Once access has been obtained, attackers may try to move laterally through the network to reach more valuable systems and data.

    * Rootkits
    * Unpatched systems
    * AV Evasion
    * OS Backdoors
    * Tunneling & Exfiltration
    * Web Backdoors

6. Post Exploitation
> Involves further reconnaissance, lateral movement through the network, and exploitation of additional vulnerabilities to achieve the attacker's goals.

    * Pass-The-Hash Attack
    * Hash & Password Dump
    * Command and Control (C2)
    * Linux Post Exploitation
    * Windows Post Exploitation

7. Clearing Tracks
> leave no trace of the attack and ensure that the attacker cannot be identified or traced back to their actions.

    * IDS evasion
    * log manipulation
    * decoy traffic
