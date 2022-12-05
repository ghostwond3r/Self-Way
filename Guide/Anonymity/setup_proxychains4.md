# Set proxychains4 in Kali Linux

1- open your terminal and switch to root:
```
sudo su
 (enter your password)
```

2- make sure you have proxychains4 install, type:
```
proxychains4 -h
```

3- if not, then install it:
```
apt install proxychains4 -y
apt update -y
```

4- open the config file of proxychains4 with an editor (here i will use 'nano'):
```
nano /etc/proxychains4.conf
```

5- now in 'nano' you need to change this:

* * to go to a line number, use 'CTRL + /' then type it and press 'ENTER'

Now change the following:
```
    - at line 10, remove the '#' before 'dynamic_chain'
    - at line 18, add '#' before 'strict_chain'
    - at line 161, make sure it does not have '#' before Tor default; socks4 127.0.0.1 9050
    - under line 161, you can add your proxy like this; 

                socks4  192.252.208.67  14287
                socks5  72.221.171.130  4145
                socks5  31.128.248.2    1080
                http    47.74.24.169    80
                http    144.172.73.50   8080
```

* * It does not have a minimum / maximum required, but the more you have the better it is. 
* * You can use: HTTP, SOCKS4 AND SOCKS5.
* * HTTPS is not supported.

- To save the file with 'nano':
```
 CTRL + O
 then press ENTER
```

- To exit with 'nano':
```    
CTRL + X
```

------------------------------------------------------

### Now that your proxychains4 is setup, you are ready to use it. 

First, start Tor:
```
service tor start
```

Verify if Tor is running:
```
service tor status
```

Now to use proxychains4 just add it before the command you want to run. Example, if you want to run nmap scan:
```
proxychains4 nmap XXX.XXX.XX.XXX                                        
```

----------------------------------------------------------

# Get some proxy 

To find your proxies, I will explain a way but be aware that it exist many other.

The important point to look:

- Check that they are valid
- Only use either ELITE OR ANONYMOUS proxy, NOT TRANSPARENT

Here is one website for this; https://checkerproxy.net/getAllProxy

As you will see when you open, it give you some archives of proxies from the 3 or 4 last day. I suggest to take the most recent. So just click on it. On the left side you can choose some options. 

- The first one is where you choose between; HTTP - HTTPS - HTTP/HTTPS - SOCKS5. Choose it for your need, or let it to; ALL ACTIVE
- The second one is already set on anonymous, so let it be.
- The Third is the speed of the proxy; 5 being the more fast - 30 being the less.
- The last one is country, so if you need access a website that only authorize IP from internal country, then select it here.

Copy the list of proxy and then in the menu, click on "MAIN". Paste your proxy in the box there, and click 'check'.

This will verify which proxies are alive, and will delete those that are not as well as those transparent.

Thats it ! now go paste your proxies in the proxychains4.conf file we edited early !

-------------------------

### Free Proxy List Websites

Proxy-Scrape 
https://proxyscrape.com/free-proxy-list

Geonode
https://geonode.com/free-proxy-list/

Spys-One
https://spys.one/en/free-proxy-list/

Free-Proxy
http://free-proxy.cz/en/proxylist/

Open-Proxy-Space
https://openproxy.space/list

PROXY-List
https://github.com/TheSpeedX/PROXY-List

Prem-Proxy
https://premproxy.com/list/

Proxy-Docker
https://www.proxydocker.com/en/


### Proxy checker

https://hidemy.name/en/proxy-checker/

https://checkerproxy.net/

https://proxy6.net/en/checker

https://proxyway.com/tools/free-online-proxy-checker
