# How setup proxychains4 on kali OS
# Each step are done by command line (in your terminal)!

1- open your terminal and switch to root
    sudo su
    (your password)

2- be sure you have proxychains4 install
    proxychains4 -h

3- if not, install it
    apt install proxychains4 -y
    apt update -y

4- open configuration file of proxychains4 in editor (here i will use nano but you can use whatever you prefer)
    nano /etc/proxychains4.conf

5- now in the editor you need to change this (here Im using nano, but use whatever you want);

* * to go to a line number in nano, use ' CTRL + / ' then type a word and press ' ENTER '
    
    - at line 10, remove the ' # ' before ' dynamic_chain '
    - at line 18, add ' # ' before ' strict_chain '

* * the symbol ' # ' in bash is use to enable and disable comment line (ON / OFF)

    - at line 161, besure sure you have tor default; socks4 127.0.0.1 9050

    - under line 161, you can add your proxy like this; 
  
                ===============================
                # SOCKS5 PROXIES 
                ===============================

                socks5 192.252.208.67 14287
                socks5 72.221.171.130 4145
                socks5 31.128.248.2 1080
                etc...

                ===============================
                # HTTP PROXIES 
                ===============================

                http 47.74.24.169 80
                http 144.172.73.50 8080
                http 51.161.27.96 80
                etc..

* * It does not have a minimum / maximum required, you can also use only HTTP same as only SOCKS5.

- To save with nano;  
        CTRL + O
        then press ENTER

- To exit with nano;    
        CTRL + X

------------------------------------------------------

### Now that your proxychains4 is setup, you are ready to use it. 

- First, start Tor with this command;
        service tor start

- You can verify if Tor is running;
        service tor status

- If all is running well then use ''proxychains4'' before the command you want to run.

        Example, if you want to run nmap scan;

                `proxychains4 nmap XXX.XXX.XX.XXX`                                        

----------------------------------------------------------

### To find your proxies, I will suggest one way but know it exist many ressources to get proxies.
### The important is;

- You checked that they are valid
- You only use ANONYMOUS proxy - and NOT TRANSPARENT
- A proxy have normaly a short life, so be sure to make a checkup

The website I give is this one; https://checkerproxy.net/getAllProxy

As you will see when you open, it give you some archives of proxies from the 3 or 4 last day. I suggest to take the most recent. So just click on it. Now you see proxies, and on the side you can choose some options. 

- The first one you need to choose between; HTTP - HTTPS - HTTP/HTTPS - SOCKS5. Choose it for your need, or let it to; ALL ACTIVE
- The second one is already set on anonymous, so let it.
- Third is like the quality of the proxy; 5 being the more fast - 30 being the less
- The last one is country, so if you need access a website that only authorize IP from internal country, then select it here.

Now you have your list. Copy it and in the menu, click on "MAIN". There, paste your proxies in the box, and click to check your list.

This will verify which proxies are alive, and will delete automaticaly those are not, and those that are transparent if some.

I suggest to not check all proxies one shot because it will take a while. Personaly I paste it in editor and then I verify around 20 by times.

Thats it ! now go paste your proxies in the proxychains4.conf file we edited early !



