#!/bin/bash
# Made by wondR - for NBP
# Last update: Oct 2022
# OS: kali linux 2022.3
# Run as ROOT && turn off your screen saver!

ROOT_DIR=/root

apt-get install lolcat -y
clear

lolcat -a <<"EOF"

=================== / The Capacity To Learn Is A Gift /

======== / The Ability To Learn Is A Skill /

========================= / The Willingness To Learn Is A Choice /

  ____     U _____ u    _        _____                                    _        __   __ 
 / __"| u  \| ___"|/   |"|      |" ___|                  __        __ U  /"\  u    \ \ / / 
<\___ \/    |  _|"   U | | u   U| |_  u      U  u        \"\      /"/  \/ _ \/      \ V /  
 u___) |    | |___    \| |/__  \|  _|/       /___\       /\ \ /\ / /\  / ___ \     U_|"|_u 
 |____/>>   |_____|    |_____|  |_|         |__"__|     U  \ V  V /  U/_/   \_\      |_|   
  )(  (__)  <<   >>    //  \\   )(\\,-                  .-,_\ /\ /_,-. \\    >>  .-,//|(_  
 (__)      (__) (__)  (_")("_) (__)(_/                   \_)-'  '-(_/ (__)  (__)  \_) (__) 

.
└── =====\\ Dedicated for NBP // made by wondR //
                                
EOF


current_date=$(date)
echo "Starting at $current_date"

# check if we are ROOT
if [ $EUID -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

# enable command aliasing
shopt -s expand_aliases

# skip prompts in apt-upgrade...
export DEBIAN_FRONTEND=noninteractive
alias apt-get='yes "" | apt-get -o Dpkg::Options::="--force-confdef" -y'
apt-get update

# fix bashrc
cp /root/.bashrc /root/.bashrc.bak
cp "/home/$(grep -F 1000:1000 /etc/passwd | cut -d: -f1)/.bashrc" /root/.bashrc
. /root/.bashrc


echo "Adding sources list.."
echo "deb https://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list
echo "deb-src https://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee -a /etc/apt/sources.list

# upgrade distro
apt-get dist-upgrade -y


echo "--------------------------------------------------\n"
echo "{+}-- Installing Packages \n"
echo "--------------------------------------------------\n"

# general 
apt install -y git wget apt-rdepends sipcalc unbound gnupg2 build-essential cron-apt binutils-dev vim unzip libssl-dev autoconf automake libtool npm graphviz golang konsole xclip freerdp2-x11 powershell gcc rustc fpc gdc ldc ca-certificates lsb-release gem software-properties-common debian-keyring cargo geany gdebi tmux libffi-dev docker.io aptitude libunwind-dev awscli sidguesser sqlitebrowser sqsh 

# python 
apt -y install python3-venv python3-xlrd python-xlrd-docs python3-pip python3-wheel 

# anonymity 
apt -y install tor haproxy psad nghttp2 nghttp2-proxy node-configurable-http-proxy node-http-proxy macchanger ufw torsocks iptables bleachbit selektor nyx i2p-router i2p secure-delete proxycheck makepasswd

# cracking 
apt install -y cewl crunch hashcat john medusa ophcrack wordlists seclists chntpw crackle fcrackzip hashid hash-identifier samdump2 hydra patator thc-pptp-bruter mimikatz passing-the-hash rsmangler pdfcrack

# ddos 
apt install -y t50 goldeneye 

# dorking 
apt -y install bed doona ohrwurm siparmyknife  

# exploitation 
apt install -y ibombshell htshells evil-winrm powershell-empire msfpc exploitdb shellnoob termineter beef-xss merlin-agent merlin-server koadic kerberoast routersploit payloadsallthethings upx-ucl linux-exploit-suggester weevely websploit themole shellfire poshc2 phpsploit pacu 

# Forensics / Anti-forensics 
apt install -y secure-delete tcpxtract time-decode unhide-gui forensics-extra forensics-extra-gui forensics-full forensics-samples-all grr-client-templates autopsy binwalk mat2 wipe bulk-extractor chkrootkit foremost hashdeep rkhunter yara extundelete magicrescue recoverjpeg safecopy scalpel scrounge-ntfs guymager pdfid pdf-parser python3-pdfminer metacam

# Fuzzing 
apt -y install dotdotpwn ffuf libfuzzer-14-dev sfuzz zzuf

# post-exploitation 
apt install -y kali-tools-post-exploitation

# recon 
apt -y install ike-scan walldns legion cloud-enum httprint maltego netdiscover nmap p0f recon-ng spiderfoot dnsenum dnsmap dnsrecon dnstracer dnswalk fierce urlcrazy firewalk lbd wafw00f arping fping hping3 masscan zmap ncat thc-ipv6 unicornscan theharvester netmask enum4linux polenum nbtscan nbtscan-unixwiz smbmap smtp-user-enum swaks braa onesixtyone snmp ssldump sslh sslscan sslyze fragrouter ftester arp-scan t50 ipv6-toolkit uniscan xsser knockpy urlextractor pompem dirsearch oscanner  

# reversing 
apt install -y ferret miller rizin rizin-cutter apktool bytecode-viewer clang dex2jar edb-debugger javasnoop ollydbg radare2 radare2-cutter metacam

# social-engineering 
apt install -y set king-phisher wifiphisher

# sniffing 
apt install -y bettercap sniffit bettercap-caplets bettercap-ui ettercap-common ettercap-graphical mitmproxy netsniff-ng responder wireshark dnschef hexinject tcpflow isr-evilgrade fiked rebind sslsplit tcpreplay

# vulnerability 
apt install -y lynis tlssled nikto pocsuite3 nuclei unix-privesc-check windows-privesc-check yersinia iaxflood inviteflood siege thc-ssl-dos rtpbreak rtpflood rtpinsertsound sctpscan sipp sipsak sipvicious cisco-auditing-tool cisco-global-exploiter cisco-ocs cisco-torch copy-router-config perl-cisco-copyconfig

# webapp 
apt install -y burpsuite webscarab watobo commix skipfish sqlmap wpscan zaproxy cutycapt dirb dirbuster cadaver davtest whatweb sublist3r gobuster apache-users hurl jboss-autopwn jsql jsql-injection

# wireless 
apt install -y ostinato aircrack-ng chirp cowpatty fern-wifi-cracker kismet mfoc mfterm pixiewps reaver wifite bully wifi-honey bluelog btscanner redfang spooftooph ubertooth ubertooth-firmware gnuradio gqrx-sdr rfcat rfdump rtlsdr-scanner

echo "{+}----Done \n\n\n"


cd $ROOT_DIR

#---------------------
# install some needs
#---------------------

echo "--------------------------------------------------\n"
echo "{+}--Installing Python3 \n"
echo "--------------------------------------------------\n"
python3 -m pip install pipenv
pip3 install pyReadline habu getips virtualenvwrapper uncompyle6 git-filter-repo python-whois colorama bs4 virtualenv wheel boto3 botocore termcolor requests pycryptodome 
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Installation & Configuration of GO \n"
echo "--------------------------------------------------\n"
cd $ROOT_DIR/
wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Install Rustscan \n"
echo "--------------------------------------------------\n"
cargo install rustscan
apt-get update -y
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Installing gem, will take a while \n"
echo "--------------------------------------------------\n"
gem install bundler && bundle config set --locale without test
gem install rubygems-update
apt full-upgrade
gem install wpscan
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Docker / Docker-compose\n"
echo "--------------------------------------------------\n"
# docker
systemctl stop docker &>/dev/null
echo '{"bip":"172.16.199.1/24"}' >/etc/docker/daemon.json
systemctl enable docker --now

# docker-compose
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

apt update -y

curl -L "https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Installation of Metasploit-framework \n"
echo "--------------------------------------------------\n"
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb >msfinstall &&
    chmod 755 msfinstall &&
    ./msfinstall

# to avoide issue with apt-key 
echo 'deb http://apt.metasploit.com/ lucid main' > /etc/apt/sources.list.d/metasploit-framework.list
wget -nc http://apt.metasploit.com/metasploit-framework.gpg.key
cat metasploit-framework.gpg.key | gpg --dearmor  > metasploit-framework.gpg
install -o root -g root -m 644 metasploit-framework.gpg /etc/apt/trusted.gpg.d/
apt-get update

# Initializing Metasploit Database
systemctl start postgresql
systemctl enable postgresql
msfdb init
echo "{+}----Done \n\n\n"

# starting service
service postgresql start
service tor start
service mysql start
/etc/init.d/apache2 start

echo "
Starting services.. 
======================
-PostgreSQL
-Tor
-Apache
-Mysql
...
"
echo "{+}----Done \n\n\n"

# Glow
mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
apt update && sudo apt install glow


lolcat -a <<"EOF"

   \O/# O/ |_O_|'\   /`\O/  |_O  |_O    \O/  O/'\   /`   '\   /`\O/ \O/|_O  |_O_|
.___Y  <|   _|    \ /   Y_   _|>  _|>.___Y  <|   \ /       \ /  _Y  _Y  _|>  _|  
    |  / \_|  \    X   /  |_|  \_|  \    |  / \   Y   ---   X _| |_| |_|  \_|  \ 
    |__| |_   |_  /O\./   |_   |_   |_   |__| |_ /O        /O\#  |_  |_   |_   |_

EOF


echo "--------------------------------------------------\n"
echo "{+}----Anonymity \n"
echo "--------------------------------------------------\n"
mkdir /opt/anonymity/ && \
git clone https://github.com/84KaliPleXon3/GitHackTools-TorghostNG /opt/anonymity/TorghostNG/ && \
git clone https://github.com/stamparm/fetch-some-proxies /opt/anonymity/fetch-some-proxies/ && \
git clone https://github.com/sundowndev/covermyass.git /opt/anonymity/covermyass/ && \
git clone https://github.com/keeganjk/kali-anonymous.git /opt/anonymity/kali-anonymous/
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Armitage \n"
echo "--------------------------------------------------\n"
git clone https://github.com/r00t0v3rr1d3/armitage.git /opt
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Cracking \n"
echo "--------------------------------------------------\n"
mkdir /opt/cracking/ && \
git clone https://github.com/fuzzdb-project/fuzzdb.git /opt/cracking/fuzzdb/ && \
git clone https://github.com/danielmiessler/SecLists.git /opt/cracking/SecLists/ && \
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git /opt/cracking/PayloadsAllTheThings/ && \
git clone https://github.com/1N3/IntruderPayloads /opt/cracking/IntruderPayloads/ && \
git clone https://github.com/vanhauser-thc/thc-hydra.git /opt/cracking/thc-hydra/
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Ddos \n"
echo "--------------------------------------------------\n"
mkdir /opt/ddos/ && \
git clone https://github.com/NeverWonderLand/Impulse.git /opt/ddos/Impulse/ && \
git clone https://github.com/kamorin/DHCPig /opt/ddos/DHCPig/ && \
git clone https://github.com/shekyan/slowhttptest /opt/ddos/slowhttptest/ && \
git clone https://github.com/gkbrk/slowloris /opt/ddos/slowloris/ && \
git clone https://github.com/jseidl/GoldenEye /opt/ddos/GoldenEye/ && \
git clone https://github.com/7zx/overload.git /opt/ddos/overload/ && \
git clone https://github.com/H1R0GH057/Anonymous.git /opt/ddos/Anonymous/ && \
git clone https://github.com/firstapostle/Blood /opt/ddos/Blood/ && \
git clone https://github.com/UBISOFT-1/AnonymousPAK-DDoS /opt/ddos/AnonymousPAK-DDoS/
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Dorking \n"
echo "--------------------------------------------------\n\n"
mkdir /opt/dorking/ && \
git clone https://github.com/FrancescoDiSalesGithub/dorker /opt/dorking/dorker/ && \
git clone https://github.com/GerbenJavado/LinkFinder.git /opt/dorking/LinkFinder/ && \
git clone https://github.com/humblelad/Shodan-Dorks /opt/dorking/Shodan-Dorks/ && \
git clone https://github.com/s0md3v/Photon.git /opt/dorking/Photon/
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Exploitation \n"
echo "--------------------------------------------------\n"
mkdir /opt/exploitation/ && \
git clone https://github.com/Kevin-Robertson/Inveigh /opt/exploitation/Inveigh/ && \
git clone https://github.com/bettercap/bettercap.git /opt/exploitation/bettercap/ && \
git clone https://github.com/ropnop/kerbrute /opt/exploitation/kerbrute/ && \
git clone https://github.com/brianb/mdbtools /opt/exploitation/mdbtools/ && \
git clone https://github.com/1N3/Findsploit /opt/exploitation/Findsploit/ 
# shell
mkdir /opt/exploitation/shell/ && \
git clone https://github.com/machine1337/mafiahacks.git /opt/exploitation/shell/mafiahacks/ && \
git clone https://github.com/BlackArch/webshells.git /opt/exploitation/shell/webshells/ && \
git clone https://github.com/t0thkr1s/revshellgen.git /opt/exploitation/shell/revshellgen/ && \
git clone https://github.com/nil0x42/phpsploit /opt/exploitation/shell/phpsploit/
# pwncat
python3 -m venv /opt/exploitation/pwncat
/opt/exploitation/pwncat/bin/pip install 'git+https://github.com/calebstewart/pwncat'
ln -s /opt/exploitation/pwncat/bin/pwncat /usr/local/bin
git clone https://github.com/calebstewart/pwncat.git /opt/exploitation/pwncat/ 
# putty
mkdir /opt/exploitation/putty/ && \
wget https://the.earth.li/~sgtatham/putty/latest/w64/putty.zip -O /opt/exploitation/putty/putty64.zip && \
wget https://the.earth.li/~sgtatham/putty/latest/w32/putty.zip -O /opt/exploitation/putty/putty32.zip && \
wget https://the.earth.li/~sgtatham/putty/latest/wa64/putty.zip -O /opt/exploitation/putty/puttywa64.zip && \
wget https://the.earth.li/~sgtatham/putty/latest/wa32/putty.zip -O /opt/exploitation/putty/puttywa32.zip && \
unzip /opt/Putty/putty32.zip -d /opt/exploitation/putty/x64/ && \
unzip /opt/Putty/putty64.zip -d /opt/exploitation/putty/x86/ && \
unzip /opt/Putty/puttywa32.zip -d /opt/exploitation/putty/ARM-32 && \
unzip /opt/Putty/puttywa64.zip -d /opt/exploitation/putty/ARM-64
# Sys Internal Suite Windows
mkdir /opt/exploitation/windows-sys/ && \
wget https://download.sysinternals.com/files/SysinternalsSuite.zip -O /opt/exploitation/windows-sys/SysinternalsSuite.zip && \
wget https://download.sysinternals.com/files/SysinternalsSuite-Nano.zip -O /opt/exploitation/windows-sys/SysinternalsSuite-Nano.zip && \
wget https://download.sysinternals.com/files/SysinternalsSuite-ARM64.zip -O /opt/exploitation/windows-sys/SysinternalsSuite-ARM64.zip && \
wget https://eternallybored.org/misc/netcat/netcat-win32-1.12.zip -O /opt/exploitation/windows-sys/netcat-win32-1.12.zip && \
unzip /opt/exploitation/windows-sys/SysinternalsSuite.zip -d /opt/exploitation/windows-sys//x64_x86 && \
unzip /opt/exploitation/windows-sys/SysinternalsSuite-Nano.zip -d /opt/exploitation/windows-sys/NANO/ && \
unzip /opt/exploitation/windows-sys/SysinternalsSuite-ARM64.zip -d /opt/exploitation/windows-sys/ARM-64/ && \
unzip /opt/exploitation/windows-sys/binaries/netcat-win32-1.12.zip -d /opt/exploitation/windows-sys/binaries/nc/
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Forensics / Anti-Forensics \n"
echo "--------------------------------------------------\n"
mkdir /opt/forensics/ && \
git clone https://github.com/Neo23x0/Fenrir.git /opt/forensics/Fenrir/ && \
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Fuzzing \n"
echo "--------------------------------------------------\n\n"
mkdir /opt/fuzzing/ && \
git clone https://github.com/ffuf/ffuf.git /opt/fuzzing/ffuf/ && \
git clone http://www.aldeid.com/wiki/Bed /opt/fuzzing/Bed/ && \
git clone https://github.com/wireghoul/dotdotpwn.git /opt/fuzzing/dotdotpwn/ && \
git clone https://github.com/tlsfuzzer/tlsfuzzer.git /opt/fuzzing/tlsfuzzer/
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----katoolin3 \n"
echo "--------------------------------------------------\n"
git clone https://github.com/s-h-3-l-l/katoolin3 /opt/katoolin3
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Industrial Control System \n"
echo "--------------------------------------------------\n"
mkdir /opt/ics/ && \
git clone https://gitlab.com/jhcastel/attkfinder.git /opt/ics/attkfinder/ && \
git clone https://github.com/digitalbond/Redpoint.git /opt/ics/Redpoint/ && \
git clone https://github.com/dark-lbp/isf/ /opt/ics/isf/ && \
git clone https://github.com/dhondta/dronesploit /opt/ics/dronesploit/ && \
git clone https://github.com/0x0mar/smod.git /opt/ics/smod/ && \
git clone https://github.com/klsecservices/s7scan.git /opt/ics/s7scan/
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Lateral Movement \n"
echo "--------------------------------------------------\n"
mkdir /opt/lateral/ && \
git clone https://github.com/byt3bl33d3r/CrackMapExec /opt/lateral/CrackMapExec/ && \
git clone https://github.com/byt3bl33d3r/DeathStar /opt/lateral/DeathStar/ && \
git clone https://github.com/SpiderLabs/portia /opt/lateral/portia/ && \
git clone https://github.com/DanMcInerney/icebreaker /opt/lateral/icebreaker/ && \
git clone https://github.com/360-Linton-Lab/WMIHACKER /opt/lateral/WMIHACKER/ && \
git clone https://github.com/Hackndo/WebclientServiceScanner /opt/lateral/WebclientServiceScanner/ && \
git clone https://github.com/anthemtotheego/SharpExec /opt/lateral/SharpExec/ && \
git clone https://github.com/juliourena/SharpNoPSExec /opt/lateral/SharpNoPSExec
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Pivot \n"
echo "--------------------------------------------------\n"
mkdir /opt/pivot/ && \
git clone https://github.com/p3nt4/Invoke-SocksProxy /opt/pivot/Invoke-SocksProxy/ && \
git clone https://github.com/sensepost/reGeorg /opt/pivot/reGeorg/ && \
git clone https://github.com/vincentcox/bypass-firewalls-by-DNS-history /opt/pivot/bypass-firewalls-by-DNS-history/ && \
git clone https://github.com/sysdream/ligolo /opt/pivot/ligolo/ && \
git clone https://github.com/klsecservices/rpivot /opt/pivot
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----PrivEsc \n"
echo "--------------------------------------------------\n"
mkdir /opt/privesc/ && \
mkdir /opt/privesc/windows/ && \
git clone https://github.com/GhostPack/SharpUp /opt/privesc/windows/SharpUp/ && \
git clone https://github.com/GhostPack/Seatbelt /opt/privesc/windows/Seatbelt/ && \
git clone https://github.com/jmhickman/Fetters /opt/privesc/windows/Fetters/ && \
git clone https://github.com/gladiatx0r/Powerless /opt/privesc/windows/Powerless/ && \
git clone https://github.com/pentestmonkey/windows-privesc-check /opt/privesc/windows/windows-privesc-check/ && \
git clone https://github.com/bitsadmin/wesng /opt/privesc/windows/wesng/ && \
git clone https://github.com/absolomb/WindowsEnum /opt/privesc/windows/WindowsEnum/ && \
git clone https://github.com/rootm0s/WinPwnage /opt/privesc/windows/WinPwnage/ && \
git clone https://github.com/411Hall/JAWS /opt/privesc/windows/JAWS/ && \
git clone https://github.com/SecWiki/windows-kernel-exploits /opt/privesc/windows/windows-kernel-exploits/
mkdir /opt/privesc/linux/ && \
git clone https://github.com/redcode-labs/Bashark /opt/privesc/linux/Bashark/ && \
git clone https://github.com/linted/linuxprivchecker.git /opt/privesc/linux/linuxprivchecker/ && \
git clone https://github.com/pentestmonkey/unix-privesc-check /opt/privesc/linux/unix-privesc-check/ && \
git clone https://github.com/initstring/uptux /opt/privesc/linux/uptux/ && \
git clone https://github.com/SecWiki/linux-kernel-exploits /opt/privesc/linux/linux-kernel-exploits/ && \
git clone https://github.com/nccgroup/GTFOBLookup /opt/privesc/linux/GTFOBLookup/ && \
git clone https://github.com/t0thkr1s/gtfo /opt/privesc/linux/gtfo/ && \
git clone https://github.com/DominicBreuker/pspy /opt/privesc/linux/pspy/ && \
git clone https://github.com/twelvesec/rootend /opt/privesc/linux/rootend/ && \
git clone https://github.com/liamg/traitor /opt/privesc/linux/traitor/
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----OSINT \n"
echo "--------------------------------------------------\n"
mkdir /opt/osint/ && \
git clone https://github.com/laramies/theHarvester /opt/osint/theHarvester/ && \
git clone https://github.com/lanmaster53/recon-ng /opt/osint/recon-ng/ && \
git clone https://github.com/m4ll0k/Infoga /opt/osint/Infoga/ && \
git clone https://github.com/sundowndev/PhoneInfoga /opt/osint/PhoneInfoga/ && \
git clone https://github.com/smicallef/spiderfoot /opt/osint/spiderfoot/ && \
git clone https://github.com/DataSploit/datasploit /opt/osint/datasploit/ && \
git clone https://github.com/sherlock-project/sherlock /opt/osint/sherlock/ && \
git clone https://github.com/evilsocket/xray /opt/osint/xray/ && \
git clone https://github.com/SimplySecurity/SimplyEmail /opt/osint/SimplyEmail/ && \
git clone https://github.com/thewhiteh4t/FinalRecon /opt/osint/FinalRecon/ && \
git clone https://github.com/hmaverickadams/breach-parse /opt/osint/breach-parse/ && \
git clone https://github.com/khast3x/h8mail /opt/osint/h8mail/ && \
git clone https://github.com/qeeqbox/social-analyzer /opt/osint/social-analyzer/ && \
git clone https://github.com/projectdiscovery/uncover /opt/osint/uncover/ && \
git clone https://github.com/BLINKING-IDIOT/Aliens_eye /opt/osint/Aliens_eye/
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Post-Exploitation \n"
echo "--------------------------------------------------\n"
mkdir /opt/post-exploit/ && \
git clone --recurse-submodules https://github.com/cobbr/Covenant /opt/post-exploit/Covenant && \
git clone https://github.com/n1nj4sec/pupy/ /opt/post-exploit/pupy/ && \
git clone https://github.com/SafeBreach-Labs/SirepRAT /opt/post-exploit/SirepRAT/ && \
git clone https://github.com/bohops/SharpRDPHijack /opt/post-exploit/SharpRDPHijack/ && \
git clone https://github.com/klsecservices/Invoke-Vnc /opt/post-exploit/Invoke-Vnc/ && \
git clone https://github.com/GhostPack/Lockless /opt/post-exploit/Lockless/ && \
git clone https://github.com/swisskyrepo/SharpLAPS /opt/post-exploit/SharpLAPS/ && \
git clone https://github.com/n00py/LAPSDumper /opt/post-exploit/LAPSDumper/ && \
git clone https://github.com/Mr-Un1k0d3r/SCShell /opt/post-exploit/SCShell/ && \
git clone https://github.com/gentilkiwi/mimikatz /opt/post-exploit/mimikatz/ && \
git clone https://github.com/djhohnstein/SharpWeb /opt/post-exploit/SharpWeb/ && \
git clone https://github.com/aas-n/spraykatz /opt/post-exploit/spraykatz/ && \
git clone https://github.com/BC-SECURITY/Starkiller /opt/post-exploit/Starkiller/ && \
git clone https://github.com/BishopFox/sliver /opt/post-exploit/sliver/ && \
git clone https://github.com/offsecginger/koadic /opt/post-exploit/ && \
git clone https://github.com/d4rk007/RedGhost /opt/post-exploit/RedGhost/ && \
git clone https://github.com/PowerShellMafia/PowerSploit.git/
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Recon \n"
echo "--------------------------------------------------\n\n"
mkdir /opt/recon/ && \
git clone https://github.com/Tuhinshubhra/RED_HAWK /opt/recon/RED_HAWK/ && \
git clone https://github.com/mschwager/fierce /opt/recon/fierce/ && \
git clone https://github.com/projectdiscovery/shuffledns /opt/recon/shuffledns/ && \
git clone https://github.com/projectdiscovery/dnsx /opt/recon/dnsx/ && \
git clone https://github.com/SecureAuthCorp/impacket /opt/recon/impacket/ && \
git clone https://github.com/BloodHoundAD/BloodHound /opt/recon/BloodHound/ && \
git clone https://github.com/nyxgeek/ntlmscan /opt/recon/ntlmscan/ && \
git clone https://github.com/phackt/Invoke-Recon /opt/recon/Invoke-Recon/ && \
git clone https://github.com/cytopia/smtp-user-enum /opt/recon/smtp-user-enum/ && \
git clone https://github.com/DinoTools/sslscan /opt/recon/sslscan/ && \
git clone https://github.com/angryip/ipscan /opt/recon/ipscan/ && \
git clone https://github.com/diyan/pywinrm /opt/recon/pywinrm/ && \
git clone https://github.com/gitnepal/isup /opt/recon/isup/ && \
git clone https://github.com/AlgoSecure/iotmap /opt/recon/iotmap/ && \
git clone https://github.com/UltimateHackers/Striker /opt/recon/Striker/ && \
git clone https://github.com/Wh1t3Fox/polenum /opt/recon/polenum/ && \
git clone https://github.com/dafthack/HostRecon /opt/recon/HostRecon/ && \
git clone https://github.com/ropnop/kerbrute /opt/recon/kerbrute/ && \
git clone https://github.com/royhills/arp-scan /opt/recon/arp-scan/ && \
git clone https://github.com/Zapotek/cdpsnarf /opt/recon/cdpsnarf/ && \
git clone https://github.com/yakuza8/peniot /opt/recon/peniot/ && \
git clone https://github.com/m0rtem/CloudFail /opt/recon/CloudFail/ && \
git clone https://github.com/1N3/BlackWidow /opt/recon/BlackWidow/ && \
git clone https://github.com/projectdiscovery/naabu /opt/recon/naabu/ && \
git clone https://github.com/portcullislabs/udp-proto-scanner.git /opt/recon/udp-proto-scanner/ && \
git clone https://github.com/AlisamTechnology/ATSCAN.git /opt/recon/ATSCAN/ && \
git clone https://github.com/tahmed11/DeepScan.git /opt/recon/DeepScan/ && \
git clone https://github.com/kakawome/Lethe.git /opt/recon/Lethe/ && \
git clone https://github.com/NeverWonderLand/tellme.git /opt/recon/tellme/ && \
git clone https://github.com/carlospolop/PEASS-ng /opt/recon/PEASS-ng/ && \
git clone https://github.com/rebootuser/LinEnum.git /opt/recon/LinEnum/ && \
git clone https://github.com/diego-treitos/linux-smart-enumeration.git /opt/recon/linux-smart-enumeration && \
git clone https://github.com/linted/linuxprivchecker.git /opt/recon/linuxprivchecker && \
git clone https://github.com/mostaphabahadou/postenum.git /opt/recon/postenum/ && \
git clone https://github.com/bitsadmin/wesng /opt/recon/wesng/ && \
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Reporting \n"
echo "--------------------------------------------------\n"
mkdir /opt/reporting/ && \
apt install -y dradis eyewitness faraday pipal metagoofil
git clone https://github.com/SabyasachiRana/WebMap.git /opt/reporting/WebMap/ && \
git clone https://github.com/pwndoc/pwndoc.git /opt/reporting/pwndoc/ && \
# envizon
git clone https://github.com/evait-security/envizon
cd envizon/docker/envizon_local
echo SECRET_KEY_BASE="$(echo $(openssl rand -hex 64) | tr -d '\n')" > .envizon_secret.env
sudo docker-compose up
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Reversing \n"
echo "--------------------------------------------------\n"
mkdir /opt/reversing/ && \
git clone https://github.com/gchq/CyberChef.git /opt/reversing/CyberChef/ && \
git clone https://github.com/m4b/bingrep.git /opt/reversing/bingrep/
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----S-E \n"
echo "--------------------------------------------------\n"
mkdir /opt/se/ && \
git clone https://github.com/trustedsec/social-engineer-toolkit.git /opt/se/social-engineer-toolkit/ && \
git clone https://github.com/Ignitetch/AdvPhishing.git /opt/se/AdvPhishing/ && \
git clone https://github.com/rsmusllp/king-phisher /opt/se/king-phisher/ && \
git clone https://github.com/TheKevinWang/MacroPhishing /opt/se/MacroPhishing/ && \
git clone https://github.com/ring0lab/catphish /opt/se/catphish/ && \
git clone https://github.com/Raikia/FiercePhish /opt/se/FiercePhish/ && \
git clone https://github.com/drk1wi/Modlishka /opt/se/Modlishka/ && \
git clone https://github.com/vpn/SMSSpoof /opt/se/SMSSpoof/ && \
git clone https://github.com/ustayready/CredSniper /opt/se/CredSniper/ && \
git clone https://github.com/ryhanson/phishery /opt/se/phishery/ && \
git clone https://github.com/Open-Security-Group-OSG/HiddenEyeReborn /opt/se/HiddenEyeReborn/ && \
git clone https://github.com/curi0usJack/luckystrike /opt/se/luckystrike/
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Sniffing \n"
echo "--------------------------------------------------\n"
mkdir /opt/sniffing/ && \
git clone https://github.com/DanMcInerney/net-creds.git /opt/sniffing/net-creds/ && \
git clone https://github.com/kpcyrd/sniffglue.git /opt/sniffing/sniffglue/
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Vulnerability \n"
echo "--------------------------------------------------\n"
mkdir /opt/vulns/ && \
git clone https://github.com/OWASP/Nettacker.git /opt/vulns/Nettacker/ && \
git clone https://github.com/greenbone/openvas /opt/vulns/openvas/ && \
git clone https://github.com/Sneakysecdoggo/Wynis /opt/vulns/Wynis/ && \
git clone https://github.com/ra1nb0rn/avain /opt/vulns/avain/ && \
git clone https://github.com/ZupIT/horusec /opt/vulns/horusec/ && \
git clone https://github.com/1N3/Sn1per /opt/vulns/Sn1per/ && \
git clone https://github.com/BlackArch/sploitctl /opt/vulns/sploitctl/ && \
git clone https://github.com/golismero/golismero /opt/vulns/golismero/ && \
git clone https://github.com/AlessandroZ/BeRoot /opt/vulns/BeRoot/ && \
git clone https://github.com/littl3field/Audix /opt/vulns/Audix/ && \
git clone https://github.com/tomac/yersinia /opt/vulns/yersinia/ && \
git clone https://github.com/OWASP/joomscan.git /opt/vulns/joomscan/ && \
git clone https://github.com/almandin/fuxploider.git /opt/vulns/fuxploider/ && \
git clone https://github.com/machine1337/fast-scan.git /opt/vulns/fast-scan/ && \
git clone https://github.com/hausec/ADAPE-Script /opt/vulns/ADAPE-Script/ && \
git clone https://github.com/Hypnoze57/RDPChecker /opt/vulns/RDPChecker/ && \
git clone https://github.com/projectdiscovery/nuclei.git /opt/vulns/nuclei/ && \
git clone https://github.com/projectdiscovery/nuclei-templates.git /opt/vulns/nuclei-templates/ && \
git clone https://github.com/Moham3dRiahi/XAttacker.git /opt/vulns/XAttacker/ && \
git clone https://github.com/s0md3v/Silver.git /opt/vulns/Silver/ && \
git clone https://github.com/whickey-r7/grab_beacon_config /opt/vulns/grab_beacon_config/ && \
git clone https://github.com/jondonas/linux-exploit-suggester-2.git /opt/vulns/linux-exploit-suggester-2/ && \
git clone https://github.com/rebootuser/LinEnum.git /opt/vulns/LinEnum/ && \
git clone https://github.com/diego-treitos/linux-smart-enumeration.git /opt/vulns/linux-smart-enumeration && \
git clone https://github.com/linuz/Sticky-Keys-Slayer /opt/vulns/Sticky-Keys-Slayer/ && \
git clone https://github.com/jondonas/linux-exploit-suggester-2.git /opt/vulns/linux-exploit-suggester-2/ && \
git clone https://github.com/M4DM0e/BadMod.git /opt/vulns/BadMod/
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----WebApp \n"
echo "--------------------------------------------------\n"
mkdir /opt/webapp/ && \
git clone https://github.com/cyberblackhole/domain-to-webapp.git /opt/webapp/domain-to-webapp/ && \
git clone https://github.com/sqlmapproject/sqlmap.git /opt/webapp/sqlmap/ && \
git clone https://github.com/s0md3v/Corsy.git /opt/webapp/Corsy/ && \
git clone https://github.com/R0X4R/Garud.git /opt/webapp/Garud/ && \
git clone https://github.com/websploit /opt/webapp/websploit/ && \
git clone https://github.com/Tuhinshubhra/CMSeeK /opt/webapp/CMSeek/ && \
git clone https://github.com/Dionach/CMSmap /opt/webapp/CMSmap/ && \
git clone http://www.github.com/Cvar1984/sqlscan /opt/webapp/sqlscan/ && \
git clone https://github.com/wpscanteam/wpscan /opt/webapp/wpscan/ && \
git clone https://github.com/ron190/jsql-injection /opt/webapp/jsql-injection/ && \
git clone https://github.com/FSecureLABS/N1QLMap /opt/webapp/N1QLMap/ && \
git clone https://github.com/Charlie-belmer/nosqli /opt/webapp/nosqli/ && \
git clone https://github.com/Ekultek/WhatWaf /opt/webapp/WhatWaf
echo "{+}----Done \n\n\n"


echo "--------------------------------------------------\n"
echo "{+}----Wireless \n"
echo "--------------------------------------------------\n"
mkdir /opt/wireless/ && \
git clone https://github.com/aircrack-ng/aircrack-ng.git /opt/wireless/aircrack-ng/ && \
git clone https://github.com/wifiphisher/wifiphisher /opt/wireless/wifiphisher/ && \
git clone https://github.com/reverse-shell/routersploit /opt/wireless/routersploit/ && \
git clone https://github.com/t6x/reaver-wps-fork-t6x.git /opt/wireless/reaver-wps-fork-t6x/ && \
# Install reaver
cd /opt/wireless/reaver-wps-fork-t6x*
cd src
./configure
make
make install
echo "{+}----Done \n\n\n"

cd $ROOT_DIR


# -------------------------------------------------------
# Settings
# -------------------------------------------------------

echo "Updating..."
apt-get update
apt-get upgrade

echo "--------------------------------------------------\n"
echo "{+}----Configuration of tmux... \n"
echo "--------------------------------------------------\n"
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

echo "{+}----Done \n\n\n"

# =======================================================

echo "--------------------------------------------------\n"
echo "{+}----Enabling bash session logging \n"
echo "--------------------------------------------------\n"
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

echo "{+}----Done \n\n\n"


echo "Cleaning Up..."
apt-get autoremove -y
apt-get autoclean -y
updatedb

echo "--------------------------------------------------\n"
echo "{+}----Setup some iptables rules... \n"
echo "--------------------------------------------------\n"
iptables -L -v
iptables -L
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport ssh -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables-save 
echo "{+}----Done \n\n\n"

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

-----> Installation Completed !

EOF

sed -i -r "s:~/:$ROOT_DIR/:" $ROOT_DIR/.bashrc
