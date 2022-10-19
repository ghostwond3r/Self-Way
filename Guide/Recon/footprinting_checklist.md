# Footprinting checklist
--------------------------------------
What ?

    - Network
        -  Domain name
        -  Subdomains
        -  Network blocks
        -  IP addresses of reachable systems
        -  IDSes running
        -  Private websites
        -  TCP & UDP services
        -  VPN points
        -  Networking protocols
        -  ACL's

    - System Information
        - User and group names
        - System banners
        - Routing tables
        - SNMP
        - System names 

    - Organization's Information
        - Employee details
        - Organization website
        - Location details
        - Security policies implemented
        - Background of the organization
        - Website Archives


How ?

    - Passive / Intelligence
        - Search engine (google, bing, Tor, DuckDuckGo, yahoo, etc)
            - Includes:
                - Company website
                - Online databases
                - Press releases
                - Annual reports
                - Trade journals
        - Social media (linkedin, Twitter, Facebook, etc)
            - Includes:
                - Name
                - Personal details
                - Geo-localisation
                - Login pages
                - Intranet portals 
    
    - Dorking (google hacking)
        - Constructing search queries
        - Using dedicated tools 
        - Using search operators (site, inurl, intext, etc)
    
    - HTML Source 
        - For:
            - Application functionality
            - Hidden fields
            - Comments
            - Variable names 
            - etc

    - Cookies
        - For:
            - Identify a user in his session
        - Where:
            - Stored in the browser
            - Passed in the URL
            - In the HTTP header
    
    - Email
        - Header
            - For:
                - Mail server
                - Original sender’s email id
                - Internal IP addressing scheme
                - Possible architecture of the target network
    
    - Whois
        - Domain ownership
        - Address
        - Location
        - Phone numbers
        - Other details about a specified domain name
    
    - DNS
        - For:
            - Domain Name
                - Identifying the domain name or owner of the records
            - Record Types
                - Specifying the type of data in the resource record
            - Record Class
                - Identifying a class of network or protocol family in use
            - Time to Live (TTL)
                - Specifying the amount of time a record can be stored in cache before discarded
            - Record Data
                - Providing the type and class dependent data to describe the resources.
            - Zone Transfer
                 - Public hosts
                 - Respective IP addresses
                 - Record type               
        - Definition:
            - A (address)
                - Maps a hostname to an IP address
            - SOA (Start of Authority)
                - Identifies the DNS server responsible for the domain information
            - CNAME (canonical name)
                - Provides additional names or aliases for the address record
            - MX (mail exchange)
                - Identifies the mail server for the domain
            - SRV (service)
                - Identifies services such as directory services
            - PTR (pointer)
                - Maps IP addresses to hostnames
            - NS (name server)
                -Identifies other name servers for the domain
            - HINFO
                - Host Information Records    

    - Social Engineering
        - Eavesdropping
            - Process of intercepting unauthorized communication to gather information
        - Shoulder surfing
            - Secretly observing the target to gather sensitive information
                - Passwords
                - Personal identification information
                - Account information
        - Dumpster Diving
            - This is a process of collecting sensitive information by looking into the trash bin. 
                - Contact information
                - Financial information
                - Tender information


