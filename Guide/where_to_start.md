# Where to start

| **Take your time, it's faster**

So now you are probably wondering what the hell to do ? Where to start ? Well if you follow the instructions and take the time to understand them (I mean REALLY understand), then everything will be alright! But, if you try to skip some step, be aware that things can go very bad... not only for your computer but also your real life.

</br>

**PART A - Your Terminal:** Here you will learn first how to work with the command line.

**PART B - Anonymity:** Before jumping to any kind of attack you need to understand how to protect yourself from yourself.

**PART C - Getting start:** Where to start with your first target.

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

**First questions to answer when starting with a new objective**

1. Unearth initial information: What/ Who is the target ?  
2. Locate the network range: What is the attack surface ?  
3. Ascertain active machines: What hosts are alive ?  
4. Open ports / access points: How can they be accessed ?  
5. Detect operating systems: What platform are they ?  
6. Uncover services on ports: What software can be attacked ?  
7. Map the network Tie it all together, document, and form a strategy.

**The phases of an attack (of course it can be more than this, but thats the more often use)**

1. Information gathering

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

    * Database
    * Researching Exploit
    * Gaining Access (Shell)
    * Breech systems
    * Malicious code
    * Backdoors

4. Password Attacks

    * Local Attacks
    * Offline Attacks
    * Online Attacks
    * Password Profiling & Wordlists

5. Maintaining Access

    * Rootkits
    * Unpatched systems
    * AV Evasion
    * OS Backdoors
    * Tunneling & Exfiltration
    * Web Backdoors

6. Post Exploitation

    * Pass-The-Hash Attack
    * Hash & Password Dump
    * Command and Control (C2)
    * Linux Post Exploitation
    * Windows Post Exploitation

7. Clearing Tracks

    * IDS evasion
    * log manipulation
    * decoy traffic