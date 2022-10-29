#از کجا شروع کنیم؟

| **زمان بگیرید، سریعتر است**

بنابراین اکنون احتمالاً از خود می‌پرسید که چه باید کرد؟ از کجا شروع کنیم؟ خوب اگر دستورالعمل ها را دنبال کنید و برای درک آنها وقت بگذارید (منظورم این است که واقعاً درک کنید)، آنگاه همه چیز درست می شود! اما، اگر می‌خواهید از مرحله‌ای رد شوید، آگاه باشید که ممکن است اوضاع خیلی بد پیش برود... نه تنها برای رایانه، بلکه برای زندگی واقعی‌تان.

</br>

**بخش A - ترمینال شما:** در اینجا ابتدا نحوه کار با خط فرمان را یاد خواهید گرفت.

**قسمت B - ناشناس بودن:** قبل از پرش به هر نوع حمله، باید بدانید که چگونه از خود در برابر خود محافظت کنید.

**بخش C - شروع کار: ** از کجا با اولین هدف خود شروع کنید.

> بعد از اتمام کار در اینجا، می توانید به "how_to_use_tools" بروید

</br>

# قسمت A

### پایانه

ترمینال به سادگی یک رابط مبتنی بر متن برای کامپیوتر است. در یک ترمینال، می توانید:
* دستور را تایپ کنید
* دستکاری فایل ها
* اجرای برنامه ها
* باز کردن اسناد

هنگام کار در ترمینال، پوشه را دایرکتوری کاری شما می نامند. ترمینال معمولاً در دایرکتوری سطح بالای حساب شما شروع می شود. دایرکتوری ها با علامت معکوس "/" از هم جدا می شوند. بالاترین دایرکتوری با یک بک اسلش نشان داده می شود. کل درخت دایرکتوری به دایرکتوری سطح بالا بستگی دارد.

در کالی لینوکس، مدیر بسته 'apt' است. بنابراین هر آنچه که مربوط به بسته باشد با آن کار خواهد کرد:
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

برای دیدن فایل های مهم در لینوکس، اینجا را بخوانید: `/Utilities/important_files.md`

برای مشاهده دستورات اولیه، اینجا را بخوانید: `/Utilities/term_basics.md`

اولین کاری که باید هر روز انجام دهید این است که لینوکس خود را به روز کنید: 
```
sudo apt-get update && apt-get upgrade -y
```

* نکات: '-y' مخفف «بله» است، بنابراین از شما خواسته نمی‌شود بپرسید که آیا به‌روزرسانی را می‌پذیرید یا خیر.

اکنون زمان تمرین اینجاست: `/Utilities/practice_term.md`

</br>

### ویرایشگر **NANO**

در اینجا می توانید به برگه تقلب دسترسی پیدا کنید: `/Utilities/NANO.md`

### ویرایشگر **VIM**

در اینجا می توانید به برگه تقلب دسترسی پیدا کنید: `/Utilities/VIM.md`

</br>

# قسمت B

برای راه اندازی شبکه خود، به بخش مربوطه در اینجا مراجعه کنید: 

**VPN** `/Anonymity/install_Mullvad_Kali.md`

> از هر VPN که استفاده می کنید، روند نصب بسیار مشابه خواهد بود. فقط به ارائه دهنده وب سایت برای فرآیند نصب در لینوکس نگاه کنید.

**PROXYCHAINS4** `/Anonymity/setup_proxychains4.md`

</br>


**Tor** برای مخفی کردن آدرس IP شما استفاده می شود و شما می توانید:

شروع کن:
```
service tor start
```

برای متوقف کردن:
```
service tor stop
```

شروع دوباره:
```
service tor restart
```


| توجه: اگر قبل از اتصال به VPN خود به Tor متصل شوید، VPN شما این واقعیت را پوشش می دهد که از Tor استفاده می کنید. این می تواند هنگام مرور در اینترنت مفید باشد، زیرا برخی از وب سایت ها IP پشت Tor را مسدود می کنند.

</br>

**اگر با اتصال خود مشکلی دارید**

1. مطمئن شوید که مراحل راهنمای نصب Kali را در VirtualBox دنبال کرده اید (https://github.com/NeverWonderLand/kali-inst-guide)

2. شبکه خود را مجددا راه اندازی کنید: `service NetworkManager restart`

3. دستگاه خود را راه اندازی مجدد کنید:  `reboot`

### موضوعات: ناشناس - رفتار خوب

* برای مطالعه وقت بگذارید: `/Anonymity/Masked_Man.md`

</br>

# قسمت ج

**اولین سوالاتی که باید هنگام شروع با یک هدف جدید پاسخ دهید**

1. کشف اطلاعات اولیه: هدف چیست/ کیست؟
2. محدوده شبکه را تعیین کنید: سطح حمله چیست؟
3. ماشین های فعال را مشخص کنید: چه میزبان هایی زنده هستند؟
4. باز کردن پورت ها / نقاط دسترسی: چگونه می توان به آنها دسترسی داشت؟
5. شناسایی سیستم عامل ها: چه پلتفرمی هستند؟
6. کشف خدمات در پورت ها: به چه نرم افزاری می توان حمله کرد؟
7. نقشه شبکه را به هم گره بزنید، مستندسازی کنید و یک استراتژی تشکیل دهید.

**مراحل حمله (البته می تواند بیشتر از این باشد، اما بیشتر از آن استفاده می شود)**

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



