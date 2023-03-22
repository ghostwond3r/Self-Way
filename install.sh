#!/bin/bash
# Made by wondR 
# v2.0
# Last update: March 2023
# OS: kali linux 2023.1
# Run as ROOT && turn off your screen saver!

ROOT_DIR=/root

# wondR Rainbow
red=$'\e[1;31m'
green=$'\e[1;32m'
blue=$'\e[1;34m'
cyan=$'\e[1;36m'

apt-get install lolcat -y
clear

lolcat -a <<"EOF"

============== / The Capacity To Learn Is A Gift /

======== / The Ability To Learn Is A Skill /

============== / The Willingness To Learn Is A Choice /
          ____    _____   _      __         
         / __/__ / / _/__| | /| / /__ ___ __
        _\ \/ -_) / _/___/ |/ |/ / _ `/ // /
       /___/\__/_/_/     |__/|__/\_,_/\_, / 
                                     /___/                                   
                ._____. ._____.                  
                | ._. | | ._. |
                | !_| |_|_|_! |
                !___| |_______!
                .___|_|_| |___.
                | ._____| |_. |
                | !_! | | !_! |
                !_____! !_____!       

└── =========\\ v2.0 // by Wonder //
                                
EOF


current_date=$(date)
echo -e "\n  $blue Starting at $current_date \n"

# check if we are ROOT
if [ $EUID -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

# enable command aliasing
shopt -s expand_aliases

# skip prompts in apt-upgrade...
export DEBIAN_FRONTEND=noninteractive
alias apt='yes "" | apt -o Dpkg::Options::="--force-confdef" -y'
apt update

# fix bashrc
cp /root/.bashrc /root/.bashrc.bak
cp "/home/$(grep -F 1000:1000 /etc/passwd | cut -d: -f1)/.bashrc" /root/.bashrc
. /root/.bashrc


echo -e "\n $red [x] Adding sources list..\n" 
echo "deb https://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list
echo "deb-src https://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb https://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list
echo "deb-src https://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
echo "deb http://deb.debian.org/debian bullseye main contrib non-free" | sudo tee /etc/apt/sources.list.d/debian.list
echo "deb-src http://deb.debian.org/debian bullseye main contrib non-free" | sudo tee -a /etc/apt/sources.list.d/debian.list

echo -e "\n $red [x] Updating..\n" 
apt clean -y
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt full-upgrade -y
apt autoremove -y

echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----- Installing Packages \n"
echo -e "\n $cyan --------------------------------------------------\n"

# general 
apt install -y git wget sipcalc unbound snapd gnupg2 build-essential cron-apt binutils-dev vim unzip libssl-dev autoconf automake libtool npm graphviz golang konsole xclip freerdp2-x11 powershell gcc rustc fpc gdc ldc ca-certificates lsb-release gem software-properties-common debian-keyring cargo geany gdebi tmux libffi-dev docker.io aptitude libunwind-dev awscli 
# python 
apt -y install python3-venv python3-xlrd python-xlrd-docs python3-pip python3-wheel 
# anonymity 
apt -y install tor torbrowser-launcher macchanger ufw torsocks iptables bleachbit secure-delete proxycheck makepasswd
# cracking 
apt install -y cewl crunch hashcat john medusa ophcrack wordlists seclists hashid hydra patator thc-pptp-bruter mimikatz passing-the-hash
# exploitation 
apt install -y ibombshell htshells evil-winrm powershell-empire msfpc exploitdb shellnoob termineter beef-xss koadic kerberoast routersploit payloadsallthethings linux-exploit-suggester weevely websploit shellfire phpsploit
# Forensics / Anti-forensics 
apt install -y tcpxtract time-decode unhide-gui autopsy binwalk wipe bulk-extractor chkrootkit foremost rkhunter yara magicrescue safecopy scalpel scrounge-ntfs guymager pdf-parser python3-pdfminer
# recon 
apt -y install ike-scan dotdotpwn ffuf libfuzzer-14-dev sfuzz zzuf bed king-phisher wifiphisher doona ohrwurm siparmyknife walldns legion cloud-enum httprint maltego netdiscover nmap p0f recon-ng spiderfoot dnsenum dnsmap dnsrecon dnstracer dnswalk fierce urlcrazy firewalk lbd wafw00f arping fping hping3 masscan zmap ncat thc-ipv6 unicornscan theharvester netmask enum4linux polenum nbtscan nbtscan-unixwiz smbmap smtp-user-enum swaks braa onesixtyone snmp ssldump sslh sslscan sslyze fragrouter ftester arp-scan t50 ipv6-toolkit uniscan xsser knockpy urlextractor pompem dirsearch oscanner  
# reversing 
apt install -y ferret miller rizin apktool bytecode-viewer clang dex2jar edb-debugger radare2 radare2-cutter
# sniffing 
apt install -y bettercap bettercap-caplets bettercap-ui ettercap-common ettercap-graphical responder wireshark rebind tcpreplay
# vulnerability 
apt install -y lynis tlssled nikto pocsuite3 nuclei unix-privesc-check windows-privesc-check yersinia siege thc-ssl-dos rtpflood 
# webapp 
apt install -y burpsuite webscarab watobo commix skipfish sqlmap wpscan zaproxy dirb dirbuster cadaver davtest whatweb sublist3r gobuster hurl jboss-autopwn jsql jsql-injection
# wireless 
apt install -y aircrack-ng kismet reaver wifite
# Metapackages
apt install kali-desktop-xfce -y
apt install kali-tweaks -y
apt install kali-tools-gpu -y
apt install kali-tools-hardware -y
apt install kali-tools-crypto-stego -y
apt install kali-tools-fuzzing -y
apt install kali-tools-802-11 -y
apt install kali-tools-windows-resources -y
apt install kali-linux-labs -y
apt install kali-tools-information-gathering -y
apt install kali-tools-vulnerability -y
apt install kali-tools-web -y
apt install kali-tools-database -y
apt install kali-tools-passwords -y
apt install kali-tools-wireless -y
apt install kali-tools-reverse-engineering -y
apt install kali-tools-exploitation -y
apt install kali-tools-social-engineering -y
apt install kali-tools-sniffing-spoofing -y
apt install kali-tools-post-exploitation -y
apt install kali-tools-forensics -y
apt install kali-tools-reporting -y
apt install kali-linux-default -y


apt update && apt upgrade -y
apt autoremove -y

echo -e "\n $blue {+}----Done \n\n\n"


cd $ROOT_DIR

#---------------------
# install some needs
#---------------------

echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Installing Python3 \n"
echo -e "\n $cyan --------------------------------------------------\n"
python3 -m pip install pipenv
pip3 install impacket==0.9.23 neo4j==4.1.1 pylnk3==0.3.0 xmltodict==0.12.0 pyReadline habu getips virtualenvwrapper uncompyle6 git-filter-repo python-whois colorama bs4 virtualenv wheel boto3 botocore termcolor requests pycryptodome 
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Installation & Configuration of GO \n"
echo -e "\n $cyan --------------------------------------------------\n"
cd $ROOT_DIR
wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Install Rustscan \n"
echo -e "\n $cyan --------------------------------------------------\n"
cargo install rustscan
apt update -y
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Installing gem, will take a while \n"
echo -e "\n $cyan --------------------------------------------------\n"
gem install bundler && bundle config set --locale without test
gem install rubygems-update
apt full-upgrade
gem install wpscan
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Docker\n"
echo -e "\n $cyan --------------------------------------------------\n"
systemctl stop docker &>/dev/null
echo '{"bip":"172.16.199.1/24"}' >/etc/docker/daemon.json
systemctl enable docker --now
apt update
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Installation of Metasploit-framework \n"
echo -e "\n $cyan --------------------------------------------------\n"
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall

# to avoide issue with apt-key 
echo 'deb http://apt.metasploit.com/ kali main' > /etc/apt/sources.list.d/metasploit-framework.list
wget -nc http://apt.metasploit.com/metasploit-framework.gpg.key
cat metasploit-framework.gpg.key | gpg --dearmor  > metasploit-framework.gpg
install -o root -g root -m 644 metasploit-framework.gpg /etc/apt/trusted.gpg.d/
apt update

# Initializing Metasploit Database
systemctl start postgresql
systemctl enable postgresql
msfdb init

# starting service
service postgresql start
service tor start
service mysql start
/etc/init.d/apache2 start

echo -e "\n $blue {+}----Done \n\n\n"

lolcat -a <<"EOF"

 ______   ______     ______     __         ______    
/\__  _\ /\  __ \   /\  __ \   /\ \       /\  ___\   
\/_/\ \/ \ \ \/\ \  \ \ \/\ \  \ \ \____  \ \___  \  
   \ \_\  \ \_____\  \ \_____\  \ \_____\  \/\_____\ 
    \/_/   \/_____/   \/_____/   \/_____/   \/_____/                                                                                                                                   

\\ PROCEEDING TO THE INSTALLATION... 

EOF

cd $ROOT_DIR

echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Anonymity \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/anonymity/ && \
git clone https://github.com/84KaliPleXon3/GitHackTools-TorghostNG.git /opt/anonymity/TorghostNG/ && \
python3 /opt/anonymity/TorghostNG/install.py
git clone https://github.com/keeganjk/kali-anonymous.git /opt/anonymity/kali-anonymous/ && \
git clone https://github.com/narkhedesam/Proxy-List-Scrapper /opt/anonymity/Proxy-List-Scrapper/ && \
git clone https://github.com/Und3rf10w/kali-anonsurf.git /opt/anonymity/kali-anonsurf/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Armitage \n"
echo -e "\n $cyan --------------------------------------------------\n"
git clone https://github.com/r00t0v3rr1d3/armitage.git /opt/armitage
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Cracking \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/cracking/ && \
git clone https://github.com/fuzzdb-project/fuzzdb.git /opt/cracking/fuzzdb/ && \
git clone https://github.com/danielmiessler/SecLists.git /opt/cracking/SecLists/ && \
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git /opt/cracking/PayloadsAllTheThings/ && \
git clone https://github.com/1N3/IntruderPayloads.git /opt/cracking/IntruderPayloads/ && \
git clone https://github.com/vanhauser-thc/thc-hydra.git /opt/cracking/thc-hydra/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Crawl \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/crawl/ && \
git clone https://github.com/dadoonet/fscrawler.git /opt/crawl/fscrawler/ && \
git clone https://github.com/s0md3v/Photon.git /opt/crawl/Photon/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Ddos \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/ddos/ && \
git clone https://github.com/shekyan/slowhttptest.git /opt/ddos/slowhttptest/ && \
git clone https://github.com/7zx/overload.git /opt/ddos/overload/ && \
git clone https://github.com/H1R0GH057/Anonymous.git /opt/ddos/Anonymous/ && \
git clone https://github.com/UBISOFT-1/AnonymousPAK-DDoS.git /opt/ddos/AnonymousPAK-DDoS/ && \
git clone https://github.com/alexnest-ua/MHDDoS.git /opt/ddos/MHDDoS/ && \
git clone https://github.com/quitten/doser.py.git /opt/ddos/doser.py/ && \
git clone https://github.com/D4Vinci/PyFlooder.git /opt/ddos/PyFlooder/ && \
git clone https://github.com/Tmpertor/Raven-Storm.git /opt/ddos/Raven-Storm/ && \
git clone https://github.com/HyukIsBack/KARMA-DDoS.git /opt/ddos/KARMA-DDoS/ && \
git clone https://github.com/CruelDev69/DDoS-Attacker.git /opt/ddos/DDoS-Attacker/ && \
git clone https://github.com/HC133/Pummel.git /opt/ddos/Pummel/ && \
git clone https://github.com/swagkarna/Annon-DOS.git /opt/ddos/Annon-DOS/ && \
git clone https://github.com/Leeon123/CC-attack.git /opt/ddos/CC-attack/ && \
git clone https://github.com/Leeon123/golang-httpflood.git /opt/ddos/golang-httpflood/ && \
git clone https://github.com/Leeon123/Simple-SYN-Flood.git /opt/ddos/Simple-SYN-Flood/ && \
git clone https://github.com/sepehrdaddev/Xerxes.git /opt/ddos/Xerxes/ && \
git clone https://github.com/EmreOvunc/Python-SYN-Flood-Attack-Tool.git /opt/ddos/Python-SYN-Flood-Attack-Tool/ && \
git clone https://github.com/lilmond/sudos.git /opt/ddos/sudos/ && \
git clone https://github.com/electr0lulz/madkatty.git /opt/ddos/madkatty/ && \
git clone https://github.com/iamaamir/ihulk.py.git /opt/ddos/ihulk.py/ && \
git clone https://github.com/JPLeoRX/tor-flood-attack.git /opt/ddos/tor-flood-attack/ && \
git clone https://github.com/1x019/DDoS-Japan-v3.0-Src.git /opt/ddos/DDoS-Japan-v3.0-Src/ && \
git clone https://github.com/bjarneo/rip.git /opt/ddos/rip/ && \
git clone https://github.com/merkjinx/saddam-plus-plus.git /opt/ddos/saddam-plus-plus/ && \
git clone https://github.com/Hyperclaw79/HULK-v3.git /opt/ddos/HULK-v3/ && \
git clone https://github.com/bjarneo/rip.git /opt/ddos/rip/ && \
git clone https://github.com/merkjinx/saddam-plus-plus.git /opt/ddos/saddam-plus-plus/ && \ 
git clone https://github.com/R3tr074/Burn-Byte.git /opt/ddos/Burn-Byte/ && \
git clone https://github.com/lucthienphong1120/5xDDoS.git /opt/ddos/5xDDoS/ && \
git clone https://github.com/epsylon/ufonet.git /opt/ddos/ufonet/ && \
git clone https://github.com/mytechnotalent/turbo-attack.git /opt/ddos/turbo-attack/ && \
git clone https://github.com/palahsu/DDoS-Ripper.git /opt/ddos/DDoS-Ripper/ && \
git clone https://github.com/ebankoff/Beast_Bomber.git /opt/ddos/Beast_Bomber/ && \
git clone https://github.com/hoaan1995/ZxCDDoS.git /opt/ddos/ZxCDDoS/ && \
git clone https://github.com/sahilchaddha/rudyjs.git /opt/ddos/rudyjs/ && \
git clone https://github.com/Red-company/RDDoS_Tool.git /opt/ddos/RDDoS_Tool/ && \
git clone https://github.com/DrizzleRisk/NTPDoser.git /opt/ddos/NTPDoser/ && \
git clone https://github.com/billythegoat356/Rufus.git /opt/ddos/Rufus/ 
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Dorking \n"
echo -e "\n $cyan --------------------------------------------------\n\n"
mkdir /opt/dorking/ && \
git clone https://github.com/FrancescoDiSalesGithub/dorker.git /opt/dorking/dorker/ && \
git clone https://github.com/GerbenJavado/LinkFinder.git /opt/dorking/LinkFinder/ && \
git clone https://github.com/humblelad/Shodan-Dorks.git /opt/dorking/Shodan-Dorks/ && \
git clone https://github.com/obheda12/GitDorker.git /opt/dorking/GitDorker/ && \
git clone https://github.com/IvanGlinkin/Fast-Google-Dorks-Scan.git /opt/dorking/Fast-Google-Dorks-Scan/ && \
git clone https://github.com/powerexploit/Ashok.git /opt/dorking/Ashok/ && \
git clone https://github.com/dwisiswant0/go-dork.git /opt/dorking/go-dork/ && \
git clone https://github.com/BullsEye0/dorks-eye.git /opt/dorking/dorks-eye/ && \
git clone https://github.com/six2dez/dorks_hunter.git /opt/dorking/dorks_hunter/
mkdir /opt/dorking/list && cd /opt/dorking/list
wget https://raw.githubusercontent.com/rootac355/SQL-injection-dorks-list/master/google%20dorks%20for%20sql%20injection.txt
wget https://raw.githubusercontent.com/blaCCkHatHacEEkr/PENTESTING-BIBLE/master/1-part-100-article/google/Shodan%20Queries.txt
wget https://raw.githubusercontent.com/unexpectedBy/SQLi-Dork-Repository/master/WordpressThemes.txt
wget https://raw.githubusercontent.com/unexpectedBy/SQLi-Dork-Repository/master/hosting.txt
wget https://raw.githubusercontent.com/unexpectedBy/SQLi-Dork-Repository/master/randon.txt
wget https://raw.githubusercontent.com/unexpectedBy/SQLi-Dork-Repository/master/shopping.txt
wget https://raw.githubusercontent.com/unexpectedBy/SQLi-Dork-Repository/master/wordpress.txt
wget https://raw.githubusercontent.com/cipher387/Dorks-collections-list/main/cctv.txt
wget https://raw.githubusercontent.com/cyberm0n/admin-panel-dorks/main/dorks.txt
wget https://raw.githubusercontent.com/readloud/Google-Hacking-Database-GHDB/main/sql_gov_dorks.txt
echo -e "\n $blue {+}----Done \n\n\n"

cd $ROOT_DIR

echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Exploitation \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/exploitation/ && \
git clone https://github.com/Kevin-Robertson/Inveigh.git /opt/exploitation/Inveigh/ && \
git clone https://github.com/bettercap/bettercap.git /opt/exploitation/bettercap/ && \
git clone https://github.com/ropnop/kerbrute.git /opt/exploitation/kerbrute/ && \
git clone https://github.com/brianb/mdbtools.git /opt/exploitation/mdbtools/ && \
git clone https://github.com/1N3/Findsploit.git /opt/exploitation/Findsploit/ 
# shell
mkdir /opt/exploitation/shell/ && \
git clone https://github.com/machine1337/mafiahacks.git /opt/exploitation/shell/mafiahacks/ && \
git clone https://github.com/BlackArch/webshells.git /opt/exploitation/shell/webshells/ && \
git clone https://github.com/t0thkr1s/revshellgen.git /opt/exploitation/shell/revshellgen/ && \
git clone https://github.com/nil0x42/phpsploit.git /opt/exploitation/shell/phpsploit/
# pwncat
mkdir /opt/exploitation/pwncat/ && \
git clone https://github.com/calebstewart/pwncat.git /opt/exploitation/pwncat/ 
# putty
mkdir /opt/exploitation/putty/ && \
wget https://the.earth.li/~sgtatham/putty/latest/w64/putty.zip -O /opt/exploitation/putty/ && \
wget https://the.earth.li/~sgtatham/putty/latest/w32/putty.zip -O /opt/exploitation/putty/ && \
wget https://the.earth.li/~sgtatham/putty/latest/wa64/putty.zip -O /opt/exploitation/putty/ && \
wget https://the.earth.li/~sgtatham/putty/latest/wa32/putty.zip -O /opt/exploitation/putty/ && \
unzip /opt/Putty/putty32.zip -d /opt/exploitation/putty/x64/ && \
unzip /opt/Putty/putty64.zip -d /opt/exploitation/putty/x86/ && \
unzip /opt/Putty/puttywa32.zip -d /opt/exploitation/putty/ARM-32/ && \
unzip /opt/Putty/puttywa64.zip -d /opt/exploitation/putty/ARM-64/
# Sys Internal Suite Windows
mkdir /opt/exploitation/windows-sys/ && \
wget https://download.sysinternals.com/files/SysinternalsSuite.zip -O /opt/exploitation/windows-sys/ && \
wget https://download.sysinternals.com/files/SysinternalsSuite-Nano.zip -O /opt/exploitation/windows-sys/ && \
wget https://download.sysinternals.com/files/SysinternalsSuite-ARM64.zip -O /opt/exploitation/windows-sys/ && \
wget https://eternallybored.org/misc/netcat/netcat-win32-1.12.zip -O /opt/exploitation/windows-sys/binaries/ && \
unzip /opt/exploitation/windows-sys/SysinternalsSuite.zip -d /opt/exploitation/windows-sys/x64_x86/ && \
unzip /opt/exploitation/windows-sys/SysinternalsSuite-Nano.zip -d /opt/exploitation/windows-sys/NANO/ && \
unzip /opt/exploitation/windows-sys/SysinternalsSuite-ARM64.zip -d /opt/exploitation/windows-sys/ARM-64/ && \
unzip /opt/exploitation/windows-sys/netcat-win32-1.12.zip -d /opt/exploitation/windows-sys/nc/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Forensics / Anti-Forensics \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/forensics/ && \
git clone https://github.com/Neo23x0/Fenrir.git /opt/forensics/Fenrir/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Fuzzing \n"
echo -e "\n $cyan --------------------------------------------------\n\n"
mkdir /opt/fuzzing/ && \
git clone https://github.com/ffuf/ffuf.git /opt/fuzzing/ffuf/ && \
git clone https://github.com/wireghoul/dotdotpwn.git /opt/fuzzing/dotdotpwn/ && \
git clone https://github.com/tlsfuzzer/tlsfuzzer.git /opt/fuzzing/tlsfuzzer/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Industrial Control System \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/ics/ && \
git clone https://gitlab.com/jhcastel/attkfinder.git /opt/ics/attkfinder/ && \
git clone https://github.com/digitalbond/Redpoint.git /opt/ics/Redpoint/ && \
git clone https://github.com/dark-lbp/isf.git /opt/ics/isf/ && \
git clone https://github.com/dhondta/dronesploit.git /opt/ics/dronesploit/ && \
git clone https://github.com/0x0mar/smod.git /opt/ics/smod/ && \
git clone https://github.com/klsecservices/s7scan.git /opt/ics/s7scan/ && \
git clone https://github.com/sourceperl/mbtget.git /opt/ics/mbtget/ && \
git clone https://github.com/atimorin/scada-tools /opt/ics/scada-tools/ && \
git clone https://github.com/arnaudsoullie/modbus-scanner /opt/ics/modbus-scanner/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Lateral Movement \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/lateral/ && \
git clone https://github.com/byt3bl33d3r/CrackMapExec.git /opt/lateral/CrackMapExec/ && \
git clone https://github.com/byt3bl33d3r/DeathStar.git /opt/lateral/DeathStar/ && \
git clone https://github.com/SpiderLabs/portia.git /opt/lateral/portia/ && \
git clone https://github.com/DanMcInerney/icebreaker.git /opt/lateral/icebreaker/ && \
git clone https://github.com/360-Linton-Lab/WMIHACKER.git /opt/lateral/WMIHACKER/ && \
git clone https://github.com/Hackndo/WebclientServiceScanner.git /opt/lateral/WebclientServiceScanner/ && \
git clone https://github.com/anthemtotheego/SharpExec.git /opt/lateral/SharpExec/ && \
git clone https://github.com/juliourena/SharpNoPSExec.git /opt/lateral/SharpNoPSExec/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Pivot \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/pivot/ && \
git clone https://github.com/p3nt4/Invoke-SocksProxy.git /opt/pivot/Invoke-SocksProxy/ && \
git clone https://github.com/sensepost/reGeorg.git /opt/pivot/reGeorg/ && \
git clone https://github.com/vincentcox/bypass-firewalls-by-DNS-history.git /opt/pivot/bypass-firewalls-by-DNS-history/ && \
git clone https://github.com/sysdream/ligolo.git /opt/pivot/ligolo/ && \
git clone https://github.com/klsecservices/rpivot.git /opt/pivot/rpivot/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Post-Exploitation \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/post-exploit/ && \
git clone --recurse-submodules https://github.com/cobbr/Covenant /opt/post-exploit/Covenant && \
git clone https://github.com/n1nj4sec/pupy.git /opt/post-exploit/pupy/ && \
git clone https://github.com/SafeBreach-Labs/SirepRAT.git /opt/post-exploit/SirepRAT/ && \
git clone https://github.com/bohops/SharpRDPHijack.git /opt/post-exploit/SharpRDPHijack/ && \
git clone https://github.com/klsecservices/Invoke-Vnc.git /opt/post-exploit/Invoke-Vnc/ && \
git clone https://github.com/GhostPack/Lockless.git /opt/post-exploit/Lockless/ && \
git clone https://github.com/swisskyrepo/SharpLAPS.git /opt/post-exploit/SharpLAPS/ && \
git clone https://github.com/n00py/LAPSDumper.git /opt/post-exploit/LAPSDumper/ && \
git clone https://github.com/Mr-Un1k0d3r/SCShell.git /opt/post-exploit/SCShell/ && \
git clone https://github.com/gentilkiwi/mimikatz.git /opt/post-exploit/mimikatz/ && \
git clone https://github.com/djhohnstein/SharpWeb.git /opt/post-exploit/SharpWeb/ && \
git clone https://github.com/aas-n/spraykatz.git /opt/post-exploit/spraykatz/ && \
git clone https://github.com/BC-SECURITY/Starkiller.git /opt/post-exploit/Starkiller/ && \
git clone https://github.com/BishopFox/sliver.git /opt/post-exploit/sliver/ && \
git clone https://github.com/offsecginger/koadic.git /opt/post-exploit/koadic/ && \
git clone https://github.com/d4rk007/RedGhost.git /opt/post-exploit/RedGhost/ && \
git clone https://github.com/PowerShellMafia/PowerSploit.git /opt/post-exploit/PowerSploit/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----PrivEsc \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/privesc/ && \
mkdir /opt/privesc/windows/ && \
git clone https://github.com/GhostPack/SharpUp.git /opt/privesc/windows/SharpUp/ && \
git clone https://github.com/GhostPack/Seatbelt.git /opt/privesc/windows/Seatbelt/ && \
git clone https://github.com/jmhickman/Fetters.git /opt/privesc/windows/Fetters/ && \
git clone https://github.com/gladiatx0r/Powerless.git /opt/privesc/windows/Powerless/ && \
git clone https://github.com/pentestmonkey/windows-privesc-check.git /opt/privesc/windows/windows-privesc-check/ && \
git clone https://github.com/bitsadmin/wesng.git /opt/privesc/windows/wesng/ && \
git clone https://github.com/absolomb/WindowsEnum.git /opt/privesc/windows/WindowsEnum/ && \
git clone https://github.com/rootm0s/WinPwnage.git /opt/privesc/windows/WinPwnage/ && \
git clone https://github.com/411Hall/JAWS.git /opt/privesc/windows/JAWS/ && \
git clone https://github.com/SecWiki/windows-kernel-exploits.git /opt/privesc/windows/windows-kernel-exploits/
mkdir /opt/privesc/linux/ && \
git clone https://github.com/redcode-labs/Bashark.git /opt/privesc/linux/Bashark/ && \
git clone https://github.com/linted/linuxprivchecker.git /opt/privesc/linux/linuxprivchecker/ && \
git clone https://github.com/pentestmonkey/unix-privesc-check.git /opt/privesc/linux/unix-privesc-check/ && \
git clone https://github.com/initstring/uptux.git /opt/privesc/linux/uptux/ && \
git clone https://github.com/SecWiki/linux-kernel-exploits.git /opt/privesc/linux/linux-kernel-exploits/ && \
git clone https://github.com/nccgroup/GTFOBLookup.git /opt/privesc/linux/GTFOBLookup/ && \
git clone https://github.com/t0thkr1s/gtfo.git /opt/privesc/linux/gtfo/ && \
git clone https://github.com/DominicBreuker/pspy.git /opt/privesc/linux/pspy/ && \
git clone https://github.com/twelvesec/rootend.git /opt/privesc/linux/rootend/ && \
git clone https://github.com/liamg/traitor.git /opt/privesc/linux/traitor/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----OSINT \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/osint/ && \
git clone https://github.com/laramies/theHarvester.git /opt/osint/theHarvester/ && \
git clone https://github.com/lanmaster53/recon-ng.git /opt/osint/recon-ng/ && \
git clone https://github.com/m4ll0k/Infoga.git /opt/osint/Infoga/ && \
git clone https://github.com/sundowndev/PhoneInfoga.git /opt/osint/PhoneInfoga/ && \
git clone https://github.com/smicallef/spiderfoot.git /opt/osint/spiderfoot/ && \
git clone https://github.com/DataSploit/datasploit.git /opt/osint/datasploit/ && \
git clone https://github.com/sherlock-project/sherlock.git /opt/osint/sherlock/ && \
git clone https://github.com/evilsocket/xray.git /opt/osint/xray/ && \
git clone https://github.com/SimplySecurity/SimplyEmail.git /opt/osint/SimplyEmail/ && \
git clone https://github.com/thewhiteh4t/FinalRecon.git /opt/osint/FinalRecon/ && \
git clone https://github.com/hmaverickadams/breach-parse.git /opt/osint/breach-parse/ && \
git clone https://github.com/khast3x/h8mail.git /opt/osint/h8mail/ && \
git clone https://github.com/qeeqbox/social-analyzer.git /opt/osint/social-analyzer/ && \
git clone https://github.com/projectdiscovery/uncover.git /opt/osint/uncover/ && \
git clone https://github.com/BLINKING-IDIOT/Aliens_eye.git /opt/osint/Aliens_eye/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Recon \n"
echo -e "\n $cyan --------------------------------------------------\n\n"
mkdir /opt/recon/ && \
git clone https://github.com/Tuhinshubhra/RED_HAWK.git /opt/recon/RED_HAWK/ && \
git clone https://github.com/mschwager/fierce.git /opt/recon/fierce/ && \
git clone https://github.com/projectdiscovery/dnsx.git /opt/recon/dnsx/ && \
git clone https://github.com/SecureAuthCorp/impacket.git /opt/recon/impacket/ && \
git clone https://github.com/BloodHoundAD/BloodHound.git /opt/recon/BloodHound/ && \
git clone https://github.com/cytopia/smtp-user-enum.git /opt/recon/smtp-user-enum/ && \
git clone https://github.com/UltimateHackers/Striker.git /opt/recon/Striker/ && \
git clone https://github.com/m0rtem/CloudFail.git /opt/recon/CloudFail/ && \
git clone https://github.com/1N3/BlackWidow.git /opt/recon/BlackWidow/ && \
git clone https://github.com/projectdiscovery/naabu.git /opt/recon/naabu/ && \
git clone https://github.com/AlisamTechnology/ATSCAN.git /opt/recon/ATSCAN/ && \
git clone https://github.com/tahmed11/DeepScan.git /opt/recon/DeepScan/ && \
git clone https://github.com/kakawome/Lethe.git /opt/recon/Lethe/ && \
git clone https://github.com/NeverWonderLand/tellme.git /opt/recon/tellme/ && \
git clone https://github.com/diego-treitos/linux-smart-enumeration.git /opt/recon/linux-smart-enumeration && \
git clone https://github.com/mostaphabahadou/postenum.git /opt/recon/postenum/ && \
git clone https://github.com/s0md3v/Arjun.git /opt/recon/Arjun/ ; ln -s /opt/recon/arjun/arjun.py /usr/local/bin/arjun

echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Reporting \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/reporting/ && \
apt install -y dradis faraday pipal metagoofil
git clone https://github.com/SabyasachiRana/WebMap.git /opt/reporting/WebMap/ && \
git clone https://github.com/pwndoc/pwndoc.git /opt/reporting/pwndoc/ && \
git clone https://github.com/evait-security/envizon.git /opt/reporting/envizon/ && \
git clone https://github.com/FortyNorthSecurity/EyeWitness.git /opt/reporting/eyewitness/ ; ln -s /opt/reporting/eyewitness/eyewitness.py /usr/local/bin/eyewitness
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Reversing \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/reversing/ && \
git clone https://github.com/gchq/CyberChef.git /opt/reversing/CyberChef/ && \
git clone https://github.com/m4b/bingrep.git /opt/reversing/bingrep/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----S-E \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/se/ && \
git clone https://github.com/trustedsec/social-engineer-toolkit.git /opt/se/social-engineer-toolkit/ && \
git clone https://github.com/Ignitetch/AdvPhishing.git /opt/se/AdvPhishing/ && \
git clone https://github.com/rsmusllp/king-phisher.git /opt/se/king-phisher/ && \
git clone https://github.com/TheKevinWang/MacroPhishing.git /opt/se/MacroPhishing/ && \
git clone https://github.com/ring0lab/catphish.git /opt/se/catphish/ && \
git clone https://github.com/Raikia/FiercePhish.git /opt/se/FiercePhish/ && \
git clone https://github.com/drk1wi/Modlishka.git /opt/se/Modlishka/ && \
git clone https://github.com/vpn/SMSSpoof.git /opt/se/SMSSpoof/ && \
git clone https://github.com/ustayready/CredSniper.git /opt/se/CredSniper/ && \
git clone https://github.com/ryhanson/phishery.git /opt/se/phishery/ && \
git clone https://github.com/Open-Security-Group-OSG/HiddenEyeReborn.git /opt/se/HiddenEyeReborn/ && \
git clone https://github.com/curi0usJack/luckystrike.git /opt/se/luckystrike/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Sniffing \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/sniffing/ && \
git clone https://github.com/DanMcInerney/net-creds.git /opt/sniffing/net-creds/ && \
git clone https://github.com/kpcyrd/sniffglue.git /opt/sniffing/sniffglue/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Utilities \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/util/ && \
git clone https://github.com/gitnepal/isup.git /opt/util/isup/ && \
git clone https://github.com/NeverWonderLand/urlparse.git /opt/util/urlparse/ && \
git clone https://github.com/Dewalt-arch/pimpmykali.git /opt/util/pimpmykali/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Vulnerability \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/vulns/ && \
git clone https://github.com/OWASP/Nettacker.git /opt/vulns/Nettacker/ && \
git clone https://github.com/greenbone/openvas.git /opt/vulns/openvas/ && \
git clone https://github.com/s0md3v/XSStrike.git /opt/vulns/xsstrike/ ; ln -s /opt/vulns/xsstrike/xsstrike.py /usr/local/bin/xsstrike && \
git clone https://github.com/Sneakysecdoggo/Wynis.git /opt/vulns/Wynis/ && \
git clone https://github.com/faizann24/XssPy.git /opt/vulns/XssPy/ && \
git clone https://github.com/ra1nb0rn/avain.git /opt/vulns/avain/ && \
git clone https://github.com/ZupIT/horusec.git /opt/vulns/horusec/ && \
git clone https://github.com/1N3/Sn1per.git /opt/vulns/Sn1per/ && \
git clone https://github.com/BlackArch/sploitctl.git /opt/vulns/sploitctl/ && \
git clone https://github.com/golismero/golismero.git /opt/vulns/golismero/ && \
git clone https://github.com/AlessandroZ/BeRoot.git /opt/vulns/BeRoot/ && \
git clone https://github.com/littl3field/Audix.git /opt/vulns/Audix/ && \
git clone https://github.com/tomac/yersinia.git /opt/vulns/yersinia/ && \
git clone https://github.com/OWASP/joomscan.git /opt/vulns/joomscan/ && \
git clone https://github.com/almandin/fuxploider.git /opt/vulns/fuxploider/ && \
git clone https://github.com/machine1337/fast-scan.git /opt/vulns/fast-scan/ && \
git clone https://github.com/Hypnoze57/RDPChecker.git /opt/vulns/RDPChecker/ && \
git clone https://github.com/projectdiscovery/nuclei.git /opt/vulns/nuclei/ && \
git clone https://github.com/projectdiscovery/nuclei-templates.git /opt/vulns/nuclei-templates/ && \
git clone https://github.com/Moham3dRiahi/XAttacker.git /opt/vulns/XAttacker/ && \
git clone https://github.com/s0md3v/Silver.git /opt/vulns/Silver/ && \
git clone https://github.com/whickey-r7/grab_beacon_config.git /opt/vulns/grab_beacon_config/ && \
git clone https://github.com/rebootuser/LinEnum.git /opt/vulns/LinEnum/ && \
git clone https://github.com/diego-treitos/linux-smart-enumeration.git /opt/vulns/linux-smart-enumeration && \
git clone https://github.com/linuz/Sticky-Keys-Slayer.git /opt/vulns/Sticky-Keys-Slayer/ && \
git clone https://github.com/jondonas/linux-exploit-suggester-2.git /opt/vulns/linux-exploit-suggester-2/ && \
git clone https://github.com/M4DM0e/BadMod.git /opt/vulns/BadMod/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----WebApp \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/webapp/ && \
git clone https://github.com/cyberblackhole/domain-to-webapp.git /opt/webapp/domain-to-webapp/ && \
git clone https://github.com/sqlmapproject/sqlmap.git /opt/webapp/sqlmap/ && \
git clone https://github.com/s0md3v/Corsy.git /opt/webapp/Corsy/ && \
git clone https://github.com/R0X4R/Garud.git /opt/webapp/Garud/ && \
git clone https://github.com/Tuhinshubhra/CMSeeK.git /opt/webapp/CMSeek/ && \
git clone https://github.com/Dionach/CMSmap.git /opt/webapp/CMSmap/ && \
git clone http://www.github.com/Cvar1984/sqlscan.git /opt/webapp/sqlscan/ && \
git clone https://github.com/wpscanteam/wpscan.git /opt/webapp/wpscan/ && \
git clone https://github.com/ron190/jsql-injection.git /opt/webapp/jsql-injection/ && \
git clone https://github.com/FSecureLABS/N1QLMap.git /opt/webapp/N1QLMap/ && \
git clone https://github.com/Charlie-belmer/nosqli.git /opt/webapp/nosqli/ && \
git clone https://github.com/Ekultek/WhatWaf.git /opt/webapp/WhatWaf/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Wireless \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/wireless/ && \
git clone https://github.com/aircrack-ng/aircrack-ng.git /opt/wireless/aircrack-ng/ && \
git clone https://github.com/wifiphisher/wifiphisher.git /opt/wireless/wifiphisher/ && \
git clone https://github.com/reverse-shell/routersploit.git /opt/wireless/routersploit/ && \
git clone https://github.com/t6x/reaver-wps-fork-t6x.git /opt/wireless/reaver-wps-fork-t6x/ 
echo -e "\n $blue {+}----Done \n\n\n"


# -------------------------------------------------------
# Settings
# -------------------------------------------------------

echo -e "\n $red Updating...\n"
apt update
apt upgrade

echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Configuration of tmux... \n"
echo -e "\n $cyan --------------------------------------------------\n"
# default tmux config
cat <<EOF >$HOME/.tmux.conf
    set -g mouse on
    set -g history-limit 50000
    set -g prefix2 C-a
    bind C-a send-prefix 
    unbind C-b
    set-window-option -g mode-keys vi

    run-shell /opt/tmux-logging/logging.tmux

    # List of plugins
    set -g @plugin 'tmux-plugins/tmux-logging'

    # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
    run '~/.tmux/plugins/tpm/tpm'
EOF

echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Enabling bash session logging \n"
echo -e "\n $cyan --------------------------------------------------\n"
grep -q 'UNDER_SCRIPT' ~/.bashrc || echo "if [[ -z "$UNDER_SCRIPT" && -z "$TMUX" && ! -z "$PS1" ]]; then
    logdir=$HOME/Logs 
    if [ ! -d $logdir ]; then
            mkdir $logdir
    fi
    #gzip -q $logdir/*.log &>/dev/null
    logfile=$logdir/$(date +%F_%H_%M_%S).$$.log
    export UNDER_SCRIPT=$logfile
    script -f -q $logfile
    exit
fi" >>~/.bashrc

echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $red Cleaning Up...\n"
apt autoremove
updatedb

echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Setup some iptables rules... \n"
echo -e "\n $cyan --------------------------------------------------\n"
iptables -L -v
iptables -L
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport ssh -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables-save 
echo -e "\n $blue {+}----Done \n\n\n"

#--------------------------------------------------

# ENVIRONMENT VARIABLES
PROMPT_CHAR=$(if [ "$(whoami)" == "root" ]; then echo "#"; else echo "$"; fi)
HOST_COLOR=$(if [ "$(whoami)" == "root" ]; then echo "6"; else echo "1"; fi)
export PS1="\[\e[0;3${HOST_COLOR}m\]\H\[\e[0;37m\]|\[\e[0;32m\]\A\[\e[0;37m\]|\[\e[0;33m\]\w\[\e[0;3${HOST_COLOR}m\] ${PROMPT_CHAR} \[\e[1;0m\]"
export PATH="$PATH:$HOME/.cargo/bin"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export MSF_DATABASE_CONFIG=~/.msf4/database.yml

# =======================================================

# OTHER TWEAKS & HACKS
export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTSIZE=100000                  # big big history
export HISTFILESIZE=100000              # big big history
shopt -s histappend                     # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# =======================================================

lolcat -a <<"EOF"

╦┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┌─┐┌┬┐┬┌─┐┌┐┌
║│││└─┐ │ ├─┤│  │  ├─┤ │ ││ ││││
╩┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘┴ ┴ ┴ ┴└─┘┘└┘
╔═╗┌─┐┌┬┐┌─┐┬  ┌─┐┌┬┐┌─┐┌┬┐     
║  │ ││││├─┘│  ├┤  │ ├┤  ││     
╚═╝└─┘┴ ┴┴  ┴─┘└─┘ ┴ └─┘─┴┘     

[x] Enable the root user with:
    ~$ sudo passwd

Info: 
      Please note that the password prompt will not display output as you are typing in the password, 
      but it will still register the keystrokes.


[x] Enable the root for SSH:
    ~$ grep PermitRootLogin /etc/ssh/sshd_config
    ~$ man sshd_config | grep -C 1 prohibit-password
    ~$ sudo systemctl restart ssh

EOF

sed -i -r "s:~/:$ROOT_DIR/:" $ROOT_DIR/.bashrc
