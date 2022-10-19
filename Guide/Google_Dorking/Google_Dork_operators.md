## Popular Google Dork operators 

Google’s search engine has its own built-in query language. 

The most popular Google Dorks and what they do. 

- `cache`: this dork will show you the cached version of any website, e.g. `cache: securitytrails.com` 

- `allintext`: searches for specific text contained on any web page, e.g. `allintext: hacking tools` 

- `allintitle`: exactly the same as allintext, but will show pages that contain titles with X characters, e.g. `allintitle:"Security Companies"` 

- `allinurl`: it can be used to fetch results whose URL contains all the specified characters, e.g: allinurl client area 

- `filetype`: used to search for any kind of file extensions, for example, if you want to search for jpg files you can use: `filetype: jpg` 

- `inurl`: this is exactly the same as `allinurl`, but it is only useful for one single keyword, e.g. `inurl: admin` 

- `intitle`: used to search for various keywords inside the title, for example, `intitle:security tools` will search for titles beginning with “security” but “tools” can be somewhere else in the page. 

- `inanchor`: this is useful when you need to search for an exact anchor text used on any links, e.g. `inanchor:"cyber security"` 

- `intext`: useful to locate pages that contain certain characters or strings inside their text, e.g. `intext:"safe internet"` 

- `link`: will show the list of web pages that have links to the specified URL, e.g. `link: microsoft.com` 

- `site`: will show you the full list of all indexed URLs for the specified domain and subdomain, e.g. `site:securitytrails.com` 

- `ext`: will extract files from a given website, e.g. `site:*.gov ext:csv`.

- `*`: wildcard used to search pages that contain “anything” before your word, e.g. `how to * a website`, will return “how to…” design/create/hack, etc… “a website”. 

- `|`: this is a logical operator, e.g. `intext:security|tips` will show all the sites which contain “security” OR “tips,” or both words. 

- `+`: used to concatenate words, useful to detect pages that use more than one specific key, e.g. `security + trails` 

- `–`: minus operator is used to avoiding showing results that contain certain words, e.g. `security -trails` will show pages that use “security” in their text, but not those that have the word “trails.” 



If you’re looking for the complete set of Google operators, you can follow https://www.searchenginejournal.com/google-search-operators-commands/215331/ which covers almost every known dork available today.



### Some example 

###  log file 
Log files are the perfect example of how sensitive information can be found within any website. Error logs, access logs and other types of application logs are often discovered inside the public HTTP space of websites. This can help attackers find the PHP version you’re running, as well as the critical system path of your CMS or frameworks. 

`allintext:username filetype:log`


### Vulnerable web servers
The following Google Dork can be used to detect vulnerable or hacked servers that allow appending “/proc/self/cwd/” directly to the URL of your website. 

`inurl:/proc/self/cwd`


### Open FTP servers 
Google does not only index HTTP-based servers, it also indexes open FTP servers. 

`intitle:"index of" inurl:ftp`


### ENV files 
.env files are the ones used by popular web development frameworks to declare general variables and configurations for local and online dev environments. 

`db_password filetype:env`


### SSH private keys 
SSH private keys are used to decrypt information that is exchanged in the SSH protocol. As a general security rule, private keys must always remain on the system being used to access the remote SSH server, and shouldn’t be shared with anyone. 

`intitle:index.of id_rsa -id_rsa.pub` 

In this case, we can use a simple dork to fetch SSH usernames from PUTTY logs: 

`filetype:log username putty`