#!/bin/bash
# Made by wond3r 
# v2.0
# Last update: November 2023
# OS: kali linux 2023.3
# Run as ROOT && turn off your screen saver!

ROOT_DIR=/root

# wond3r Rainbow
red=$'\e[1;31m'
green=$'\e[1;32m'
blue=$'\e[1;34m'
cyan=$'\e[1;36m'

apt-get install lolcat -y
clear

lolcat -a <<"EOF"

=================== / The Capacity To Learn Is A Gift /

=========== / The Ability To Learn Is A Skill /

================== / The Willingness To Learn Is A Choice /

          ____    _____   _      __         
         / __/__ / / _/__| | /| / /__ ___ __
        _\ \/ -_) / _/___/ |/ |/ / _ `/ // /
       /___/\__/_/_/     |__/|__/\_,_/\_, / 
                                     /___/                                       

└── =========\\ v2.0 // by Wond3r //
                                
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
echo "deb https://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list
echo "deb-src https://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list

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
pip3 install aardwolf==0.2.2 absl-py==1.4.0 adblockparser==0.7 aesedb==0.1.3 aiocmd==0.1.2 aioconsole==0.3.3 aiodns==3.0.0 aiofiles==23.2.1 aiohttp==3.8.6 aiomultiprocess==0.9.0 aioquic==0.9.21 aioquic-mitmproxy==0.9.21.1 aioredis==1.3.1 aioresponses==0.7.5 aiosignal==1.3.1 aiosmb==0.4.4 aiosqlite==0.17.0 aiowinreg==0.0.7 ajpy==0.0.4 alembic==1.8.1.dev0 aliyun-python-sdk-core==2.13.36 aliyun-python-sdk-eci==1.2.5 altgraph==0.17.4 aniso8601==9.0.1 anyio==3.7.0 anyio-serial==0.2.2 apispec==6.3.0 apispec-webframeworks==0.5.2 appdirs==1.4.4 APScheduler==3.9.1 arc4==0.3.0 argcomplete==3.1.4 arjun==2.2.1 arrow==1.2.3 artifacts==20230723 asciitree==0.3.3 asgiref==3.7.2 asn1crypto==1.5.1 asn1tools==0.164.0 asttokens==2.2.1 asyauth==0.0.9 async-lru==2.0.4 async-timeout==4.0.3 asyncclick==8.1.3.4 asyncscope==0.8.5 asysocks==0.2.2 attrs==23.1.0 autobahn==22.7.1 autocommand==2.2.2 Automat==22.10.0 awscli==2.12.0 awscrt==0.16.16 Babel==2.10.3 backcall==0.2.0 backdoor-factory==0.0.0 backoff==2.2.1 base58==1.0.3 bcrypt==3.2.2 beautifulsoup4==4.11.2 bencode.py==4.0.0 beniget==0.4.1 bidict==0.22.1 binwalk==2.3.3 bitstruct==8.15.1 bleach==6.1.0 blinker==1.6.3 bluepy==1.3.0 boto3==1.28.20 botocore==1.31.20 bottle==0.12.25 Bottleneck==1.3.5 Brlapi==0.8.5 Brotli==1.0.9 bs4==0.0.1 cachetools==5.3.1 cairocffi==1.6.1 capstone==5.0.1 catfish==4.16.4 cattrs==23.1.2 cbor==1.0.0 censys==2.2.8 certifi==2023.7.22 certipy-ad==4.7.0 cffi==1.16.0 cfscrape==2.1.1 chardet==5.2.0 charset-normalizer==3.3.0 cheroot==10.0.0+ds1 CherryPy==18.8.0 cherrypy-cors==1.6 chirp==20231027 cli-helpers==2.3.0 click==7.1.2 click-plugins==1.1.1 cloudscraper==1.2.71 cmake==3.27.2 cmd2==2.4.3+ds colorama==0.4.4 colored-traceback==0.3.0 coloredlogs==15.0.1 colorlog==6.7.0 commentjson==0.9.0 configobj==5.0.8 ConsoleMenu==1.0.1 constantly==15.1.0 contextlib2==0.6.0.post1 contourpy==1.0.7 cookies==2.2.1 crackmapexec==5.4.0 crcelk==1.3 crit==3.17.1 cryptography==38.0.0 ctmodbus==0.5.3 ctui==0.7.6 cupshelpers==1.0 custom-logger-xzf8971==1.1.0 cvss==2.4 cycler==0.11.0 Cython==0.29.36 dataclasses-json==0.6.1 dbus-python==1.3.2 debtags==2.1 decorator==5.1.1 defusedxml==0.7.1 Deprecated==1.2.14 dfdatetime==20220131 dfvfs==20211228 dfwinreg==20211207 dhcpig==0.0.0 dicttoxml==1.7.15 dirsearch==0.4.3 diskcache==5.4.0 distlib==0.3.7 distorm3==3.5.2 distro==1.8.0 Django==3.2.21 dnslib==0.9.23 dnspython==2.4.2 docker==5.0.3 docker-compose==1.29.2 dockerpty==0.4.1 docopt==0.6.2 docutils==0.19 donut-shellcode==0.9.3 dropbox==11.36.2 dsinternals==1.2.4 dtfabric==20230520 EasyProcess==1.1 ecdsa==0.18.0 EditorConfig==0.12.3 elasticsearch==7.17.6 email-validator==1.3.0 et-xmlfile==1.0.1 evdev==1.6.1 exceptiongroup==1.1.3 executing==1.2.0 ExifRead==3.0.0 exrex==0.11.0 ExtProxy==1.0.2 Faker==0.9.3 faraday-agent-dispatcher==2.4.0 faraday-agent-parameters-types==1.2.0 faraday-cli==2.1.8 faraday-plugins==1.14.0 faradaysec==4.6.2 fastapi==0.101.0 feedparser==6.0.10 fierce==1.5.0 filedepot==0.5.2 filelock==3.12.4 filteralchemy==0.1.0 flasgger==0.9.5 Flask==2.2.5 Flask-Classful==0.15.0.dev1 Flask-Cors==3.0.10 Flask-KVSession-fork==0.6.4 Flask-Limiter==3.3.1 Flask-Login==0.6.2 Flask-Mail==0.9.1 Flask-Principal==0.4.0 Flask-RESTful==0.3.9 Flask-SocketIO==5.3.2 Flask-SQLAlchemy==3.0.3 Flask-WTF==1.1.1 flatbuffers==2.0.8+dfsg1 fonttools==4.38.0 frozenlist==1.4.0 fs==2.4.16 funcy==1.18 future==0.18.2 fuzzywuzzy==0.18.0 gast==0.5.2 GDAL==3.7.3 GeoIP==1.3.2 geoip2==2.9.0 getips==0.1.2 git-filter-repo==2.38.0 gitdb==4.0.9 GitPython==3.1.37 google==2.0.3 google-auth==2.22.0 google-auth-oauthlib==1.0.0 gpg==1.18.0 gpt4all==2.0.0 greenbone-feed-sync==23.10.0 greenlet==2.0.1 grokevt==0.5 grpcio==1.57.0 gvm-tools==23.9.0 gyp==0.1 h11==0.14.0 h2==4.1.0 habu==0.1.39 hashID==3.1.4 hiredis==1.0.1 holehe==1.61 hpack==4.0.0 html2text==2020.1.16 html5lib==1.0.1 httpagentparser==1.9.1 httpcore==0.16.3 httplib2==0.20.4 httpretty==1.1.4 httpx==0.23.3 humanfriendly==10.0 humanize==0.0.0 hupper==1.10.3 hyperframe==6.0.0 hyperlink==21.0.0 idna==3.3 imageio==2.31.5 impacket==0.9.23 importlib-metadata==4.12.0 importlib-resources==6.0.1 incremental==21.3.0 inflect==7.0.0 iniconfig==1.1.1 intelhex==2.3.0 intervaltree==3.0.2 invoke==2.0.0 ipdb==0.13.13 ipp==1.7 ipwhois==1.2.0 IPy==1.1 ipython==8.14.0 itsdangerous==2.1.2 jaraco.classes==3.2.1 jaraco.collections==4.2.0 jaraco.context==4.3.0 jaraco.functools==3.7.0 jaraco.text==3.11.1 jedi==0.18.2 jeepney==0.8.0 Jinja2==3.1.2 jmespath==0.10.0 jq==1.2.1 jsbeautifier==1.14.9 jsonpatch==1.33 jsonpointer==2.3 jsonschema==4.10.3 kaitaistruct==0.10 kali-tweaks==2023.3.2 keyring==23.0.0 KismetCaptureBtGeiger==2021.7.1 KismetCaptureFreaklabsZigbee==2018.7.0 KismetCaptureRtl433==2020.10.1 KismetCaptureRtladsb==2020.10.1 KismetCaptureRtlamr==2020.10.1 kiwisolver==0.0.0 knockpy==6.1.0 langchain==0.0.319 langsmith==0.0.47 lark-parser==0.7.8 launchpadlib==1.11.0 lazr.restfulclient==0.14.5 lazr.uri==1.0.6 ldap3==2.9.1 ldapdomaindump==0.9.4 leakcheck==1.0.2 libbde-python==20221031 libcreg-python==20221022 libesedb-python==20230318 libevt-python==20221022 libevtx-python==20221101 libewf-python==20230212 libfsapfs-python==20230617 libfsext-python==20230603 libfshfs-python==20220831 libfsntfs-python==20230606 libfsxfs-python==20220829 libfvde-python==20220915 libfwnt-python==20220922 libfwsi-python==20230710 liblnk-python==20230716 libluksde-python==20221103 libmodi-python==20221023 libmsiecf-python==20221024 libolecf-python==20221024 libqcow-python==20221124 libregf-python==20230319 libscca-python==20230716 libsigscan-python==20230109 libsmdev-python==20221028 libsmraw-python==20230320 libvhdi-python==20221124 libvmdk-python==20221124 libvsgpt-python==20221029 libvshadow-python==20221030 libvslvm-python==20221025 lightdm-gtk-greeter-settings==1.2.2 limits==3.6.0 lit==16.0.6 llvmlite==0.41.1 lml==0.1.0 log-symbols==0.0.14 loguru==0.7.2 louis==3.27.0 lsassy==3.1.6 luddite==1.0.3 lxml==4.9.3 lz4==4.0.2+dfsg macholib==1.16.3 Mako==1.2.4.dev0 Markdown==3.4.4 markdown-it-py==2.2.0 MarkupSafe==2.1.3 marshmallow==3.20.1 marshmallow-sqlalchemy==0.29.0 masky==0.1.1 matplotlib==3.6.3 matplotlib-inline==0.1.6 maxminddb==2.5.1 mdurl==0.1.2 mechanize==0.4.2 minidump==0.0.21 minikerberos==0.3.5 minimalmodbus==2.0.1 mistune0==0.8.4 mitmproxy==10.1.5 mitmproxy_rs==0.4.1 mmh3==4.0.1 mnemonic==0.19 moat-modbus==0.6.2 moat-util==0.35.0 mock==4.0.3 modbus==3.2 modbus-configuretools-xzf8971==1.6.0 more-itertools==10.1.0 mpmath==0.0.0 msgpack==1.0.3 msldap==0.4.7 multidict==6.0.4 mydumper==0.1 mypy-extensions==1.0.0 mysqlclient==1.4.6 nassl==5.0.1 natkit==1.7 ndjson==0.3.1 neo4j==4.1.1 neobolt==1.7.17 neotime==1.7.4 netaddr==0.8.0 netifaces==0.11.0 networkx==2.8.8 nose==1.3.7 notus-scanner==22.6.0 nplusone==1.0.0 ntlm-auth==1.4.0 ntpsec==1.2.2 numba==0.57.1 numexpr==2.8.7 numpy==1.24.2 nvidia-cublas-cu11==11.10.3.66 nvidia-cuda-cupti-cu11==11.7.101 nvidia-cuda-nvrtc-cu11==11.7.99 nvidia-cuda-runtime-cu11==11.7.99 nvidia-cudnn-cu11==8.5.0.96 nvidia-cufft-cu11==10.9.0.58 nvidia-curand-cu11==10.2.10.91 nvidia-cusolver-cu11==11.4.0.1 nvidia-cusparse-cu11==11.7.4.91 nvidia-nccl-cu11==2.14.3 nvidia-nvtx-cu11==11.7.91 oauthlib==3.2.2 odfpy==1.4.2 olefile==0.46 onboard==1.4.1 one-lin3r==2.1 openai==0.27.8 opencv-python==4.8.0.76 openpyxl==3.1.2 opensearch-py==2.3.1 ordered-set==4.1.0 oscrypto==1.3.0 ospd-openvas==22.6.1 osrframework==0.20.1 outcome==1.2.0 packaging==23.1 paho-mqtt==1.6.1 pandas==1.5.3 paramiko==2.12.0 parso==0.8.3 passlib==1.7.4 Paste==3.7.1 PasteDeploy==3.0.1 PasteScript==3.2.1 patator==1.0 pathspec==0.11.2 pathspider==2.0.1 pbr==5.11.1 pcapy==0.11.5.dev0 pdfminer.six==20221105 pefile==2023.2.7 pendulum==2.1.2 pexpect==4.8.0 pgcli==4.0.1 pgspecial==2.0.1 phonenumbers==8.12.57 phpserialize==1.3 pickleshare==0.7.5 Pillow==10.0.0 pipenv==2023.7.23 plaso==20211229 plaster==1.0 plaster-pastedeploy==0.5 platformdirs==3.9.1 playwright==1.28.0 pldns==1.7 plt==1.7 pluggy==1.3.0 pluginbase==1.0.1 plumbum==1.8.2 ply==3.11 pocsuite3==1.9.6 portend==3.1.0 postfix-mta-sts-resolver==1.1.2 prettytable==3.6.0 project-generator==0.11.3 project-generator-definitions==0.2.45 prompt-toolkit==3.0.30 protobuf==4.21.12 psutil==5.9.5 psycopg==3.1.12 psycopg2==2.9.6 psycopg2-binary==2.9.9 ptyprocess==0.7.0 publicsuffix2==2.20191221 publicsuffixlist==0.9.3 pure-eval==0.0.0 pwn==1.0 pwntools==4.10.0 py==1.11.0 py-cpuinfo==9.0.0 py-sneakers==1.0.1 py-ubjson==0.16.1 pyasn1==0.4.8 pyasn1-modules==0.2.8 pycairo==1.24.0 pycares==4.3.0 pycocotools==2.0.7 pycparser==2.21 pycryptodome==3.18.0 pycryptodomex==3.11.0 pycups==2.0.1 pycurl==7.45.2 pydantic==1.10.4 PyDispatcher==2.0.5 pydot==1.4.2 pyee==9.0.4 pyelftools==0.30 pyenchant==3.2.2 pyexcel==0.5.14 pyexcel-io==0.5.18 pyexcel-ods==0.5.6 pyexcel-text==0.2.7.1 pyexcel-xls==0.5.8 pyexcel-xlsx==0.5.5 pyExploitDb==0.2.6 pyfiglet==1.0.2 pygame==2.5.2 pygccxml==2.2.1 pygeoip==0.3.2 pygexf==0.2.2 Pygments==2.15.1 PyGObject==3.46.0 pygraphviz==1.7 PyHamcrest==2.0.3 pyinotify==0.9.6 PyInstaller==3.5+498e6ee058 PyJWT==2.7.0 pylnk3==0.4.2 pylsqpack==0.3.17 pymodbus==2.5.3 pymssql==2.2.2 PyMySQL==1.0.2 PyNaCl==1.5.0 pynput==1.7.5 pyocd==0.0.0 PyOpenGL==3.1.6 pyOpenSSL==23.2.0 pyotp==2.9.0 pyparsing==3.1.1 PyPDF2==2.12.1 pyperclip==1.8.2 pypng==0.20231004.0 pyppeteer==1.0.1 pypsrp==0.7.0 pypykatz==0.6.6 PyQRCode==1.2.1 PyQt-Qwt==1.2.2 PyQt5==5.15.10 PyQt5-sip==12.13.0 PyQt6==6.5.2 PyQt6-sip==13.6.0 pyqtgraph==0.13.3 pyramid==2.0 pyreadline==2.1 pyregfi==1.0.1.0 pyroute2==0.7.7 pyroxy==0.1 pyrsistent==0.18.1 pyrtlsdr==0.2.91 PySecretSOCKS==0.9.1 pyserial==3.5 pyserial-asyncio==0.6 pyShodan==0.2.6 pysmbc==1.0.23 pysmi==0.3.2 pysnmp==4.4.12 PySocks==1.7.1 pyspnego==0.8.0 pytest==7.4.3 python-apt==2.6.0 python-dateutil==2.8.2 python-debian==0.1.49 python-docx==1.0.1 python-dotenv==1.0.0 python-emailahoy3==0.1.3 python-engineio==4.3.4 python-gitlab==3.15.0 python-gnupg==0.5.1 python-gvm==23.5.1 python-jose==3.3.0 python-Levenshtein==0.12.2 python-magic==0.4.27 python-magic-ahupp==0.4.13 python-multipart==0.0.5 python-owasp-zap-v2.4==0.0.20 python-pam==2.0.2 python-pptx==0.6.18 python-slugify==6.1.2 python-snappy==0.5.3 python-socketio==5.7.2 python-status==1.0.1 python-Wappalyzer==0.3.1 python-whois==0.8.0 python-xlib==0.33 pythran==0.14.0 PyTrie==0.4.0 pytsk3==20211111 pytz==2023.3.post1 pytzdata==2020.1 pyusb==1.2.1.post2 PyVirtualDisplay==2.2 pyVNC==0.1 pywerview==0.3.3 pyxattr==0.8.1 pyxdg==0.28 PyYAML==6.0 pyzmq==24.0.1 qrcode==7.4.2 Quamash==0.6.1 redis==4.5.0 regex==2023.6.3 repoze.lru==0.7 requests==2.31.0 requests-cache==1.1.0 requests-file==1.5.1 requests-futures==1.0.1 requests-ntlm==1.1.0 requests-oauthlib==1.3.1 requests-toolbelt==1.0.0 retrying==1.3.3 rfc3986==1.3.0 rfc3987==1.3.8 rfcat==2.0.1 rich==13.3.1 rjsmin==1.2.0 roman==3.3 ROPGadget==7.4 routersploit==3.4.0 Routes==2.5.1 rpyc==5.3.1 rq==1.15.0 rsa==4.8 rtlsdr-scanner==1.3.2 ruamel.yaml==0.17.21 ruamel.yaml.clib==0.2.7 ruyaml==0.91.0 s3transfer==0.6.1 scapy==2.5.0 scapy-python3==0.26 schema==0.7.5 scipy==1.10.1 scrape-search-engine==0.2.2 seaborn==0.12.2 SecretStorage==3.3.3 secure==0.3.0 selenium==4.14.0 service-identity==23.1.0 setproctitle==1.3.3 sgmllib3k==1.0.0 shellfire==0.11b0 shodan==1.30.0 shtab==1.5.5 simple-rest-client==1.1.3 simpleeval==0.9.13 simplejson==3.19.2 simplekv==0.14.1 six==1.16.0 slowapi==0.1.4 smbmap==1.9.2 smmap==5.0.0 smoke-zephyr==2.0.1 sniffio==1.3.0 sortedcontainers==2.4.0 soupsieve==2.5 spark-parser==1.8.9 specan==0.0.0 spinners==0.0.24 SQLAlchemy==1.4.47 sqlalchemy-schemadisplay==1.3 SQLAlchemy-Utc==0.14.0 sqlmap==1.7.10 sqlparse==0.4.2 sslyze==5.2.0 stack-data==0.6.2 starlette==0.27.0 stem==1.8.2 stevedore==5.1.0 stone==3.3.1 straight.plugin==1.4.1 Sublist3r==1.0 sympy==1.12 syslog-rfc5424-formatter==1.2.3 tables==3.7.0 tabulate==0.8.9 temperature-sensor-reader-xzf8971==2.0.0 Tempita==0.5.2 tempora==5.5.0 tenacity==8.2.3 tensorboard==2.14.0 tensorboard-data-server==0.7.1 termcolor==1.1.0 terminaltables==3.1.10 termineter==1.0.4 text-unidecode==1.3 texttable==1.6.7 theHarvester==4.4.4 thop==0.1.1.post2209072238 thrift==0.19.0 tiktoken==0.5.1 time-decode==4.2 tinycss2==1.2.1 tinydb==4.8.0 tld==0.11.11 tldextract==3.4.4 tls-parser==1.2.2 toml==0.10.2 tomli==2.0.1 torbrowser-launcher==0.3.6 torch==2.0.1 torchvision==0.15.2 tornado==6.3.2 torrequest==0.1.0 tqdm==4.64.1 traitlets==5.5.0 translationstring==1.4 trio==0.22.2 trio-websocket==0.11.1 triton==2.0.0 tweepy==4.14.0 Twisted==22.4.0 txaio==23.1.1 typing-inspect==0.9.0 typing_extensions==4.7.1 tzlocal==5.2 u-msgpack-python==2.3.0 ufoLib2==0.16.0 ufw==0.36.2 ujson==5.8.0 ultralytics==8.0.168 uncompyle6==3.7.4 unicodecsv==0.14.1 unicorn==2.0.1.post1 unicrypto==0.0.10 Unidecode==1.3.7 uritemplate==4.1.1 url-normalize==1.4.3 urllib3==1.26.18 urwid==2.1.2 urwid-mitmproxy==2.1.2.1 uvicorn==0.24.0 uvloop==0.19.0 validators==0.20.0 venusian==3.0.0 vinetto==0.8.0 virtualenv==20.24.6+ds virtualenv-clone==0.5.7 virtualenvwrapper==4.8.4 visvis==1.13.0 wadllib==1.3.6 wafw00f==2.2.0 wapiti3==3.0.4 wcwidth==0.2.5 webargs==8.0.1 webcolors==1.11.1 webencodings==0.5.1 WebOb==1.8.6 websocket-client==1.2.3 websockets==10.4 websockify==0.10.0 websploit==4.0.4 Werkzeug==2.2.2 wfuzz==3.1.0 wget==3.2 whois==0.8 wifite==2.7.0 winacl==0.1.7 wrapt==1.15.0 wsaccel==0.6.3 wsproto==1.2.0 WTForms==3.0.1 wxPython==4.2.1 xcffib==0.11.1 xdg==5 xdis==5.0.13 xlrd==1.2.0 XlsxWriter==3.0.2 xlutils==2.0.0 xlwt==1.3.0 xmltodict==0.12.0 yara-python==4.3.1 yarl==1.8.2 yaswfp==0.9.3 yattag==1.15.1 zc.lockfile==2.0 zipp==1.0.0 zlib-wrapper==0.1.3 zope.deprecation==4.4.0 zope.interface==5.5.2 zstandard==0.21.0
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
git clone https://github.com/keeganjk/kali-anonymous.git /opt/anonymity/kali-anonymous/ && \
git clone https://github.com/narkhedesam/Proxy-List-Scrapper /opt/anonymity/Proxy-List-Scrapper/ && \
git clone https://github.com/Und3rf10w/kali-anonsurf.git /opt/anonymity/kali-anonsurf/
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Cracking \n"
echo -e "\n $cyan --------------------------------------------------\n"
mkdir /opt/cracking/ && \
git clone https://github.com/fuzzdb-project/fuzzdb.git /opt/cracking/fuzzdb/ && \
git clone https://github.com/danielmiessler/SecLists.git /opt/cracking/SecLists/ && \
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git /opt/cracking/PayloadsAllTheThings/ && \
git clone https://github.com/1N3/IntruderPayloads.git /opt/cracking/IntruderPayloads/ && \
git clone https://github.com/vanhauser-thc/thc-hydra.git /opt/cracking/thc-hydra/ && \
git clone https://github.com/c0dejump/CredzCheckr.git /opt/cracking/CredzCheckr/
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
git clone https://github.com/Tmpertor/Raven-Storm.git /opt/ddos/Raven-Storm/ && \
git clone https://github.com/HyukIsBack/KARMA-DDoS.git /opt/ddos/KARMA-DDoS/ && \
git clone https://github.com/Leeon123/golang-httpflood.git /opt/ddos/golang-httpflood/ && \
git clone https://github.com/Leeon123/Simple-SYN-Flood.git /opt/ddos/Simple-SYN-Flood/ && \
git clone https://github.com/sepehrdaddev/Xerxes.git /opt/ddos/Xerxes/ && \
git clone https://github.com/lilmond/sudos.git /opt/ddos/sudos/ && \
git clone https://github.com/JPLeoRX/tor-flood-attack.git /opt/ddos/tor-flood-attack/ && \
git clone https://github.com/Hyperclaw79/HULK-v3.git /opt/ddos/HULK-v3/ && \
git clone https://github.com/palahsu/DDoS-Ripper.git /opt/ddos/DDoS-Ripper/ && \
echo -e "\n $blue {+}----Done \n\n\n"


echo -e "\n $cyan --------------------------------------------------\n"
echo -e "\n $green {+}----Dorking \n"
echo -e "\n $cyan --------------------------------------------------\n\n"
mkdir /opt/dorking/ && \
git clone https://github.com/FrancescoDiSalesGithub/dorker.git /opt/dorking/dorker/ && \
git clone https://github.com/GerbenJavado/LinkFinder.git /opt/dorking/LinkFinder/ && \
git clone https://github.com/humblelad/Shodan-Dorks.git /opt/dorking/Shodan-Dorks/ && \
git clone https://github.com/obheda12/GitDorker.git /opt/dorking/GitDorker/ && \
git clone https://github.com/BullsEye0/dorks-eye.git /opt/dorking/dorks-eye/ && \
git clone https://github.com/six2dez/dorks_hunter.git /opt/dorking/dorks_hunter/
mkdir /opt/dorking/list && cd /opt/dorking/list
wget https://raw.githubusercontent.com/rootac355/SQL-injection-dorks-list/master/google%20dorks%20for%20sql%20injection.txt
wget https://raw.githubusercontent.com/blaCCkHatHacEEkr/PENTESTING-BIBLE/master/1-part-100-article/google/Shodan%20Queries.txt
wget https://raw.githubusercontent.com/unexpectedBy/SQLi-Dork-Repository/master/WordpressThemes.txt
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
git clone https://github.com/nil0x42/phpsploit.git /opt/exploitation/shell/phpsploit/ && \
git clone https://github.com/qtc-de/webshell-cli.git /opt/exploitation/shell/webshell-cli/
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
git clone https://github.com/D4Vinci/One-Lin3r.git /opt/recon/One-Lin3r/ && \
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
git clone https://github.com/tomac/yersinia.git /opt/vulns/yersinia/ && \
git clone https://github.com/OWASP/joomscan.git /opt/vulns/joomscan/ && \
git clone https://github.com/almandin/fuxploider.git /opt/vulns/fuxploider/ && \
git clone https://github.com/machine1337/fast-scan.git /opt/vulns/fast-scan/ && \
git clone https://github.com/Hypnoze57/RDPChecker.git /opt/vulns/RDPChecker/ && \
git clone https://github.com/projectdiscovery/nuclei.git /opt/vulns/nuclei/ && \
git clone https://github.com/projectdiscovery/nuclei-templates.git /opt/vulns/nuclei-templates/ && \
git clone https://github.com/Moham3dRiahi/XAttacker.git /opt/vulns/XAttacker/ && \
git clone https://github.com/s0md3v/Silver.git /opt/vulns/Silver/ && \
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
