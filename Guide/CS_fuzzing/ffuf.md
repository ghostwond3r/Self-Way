# ffuf

25 Examples of ffuf Web Fuzzer

1. Basic command used to brute force website
```
ffuf -w <path-wordlist> -u https://test-url/FUZZ
```

2. To fuzz parameters
```
ffuf -w <path-wordlist> -u https://test-url?id=FUZZ
```

3. To fuzz headers
```
ffuf -w <path-wordlist> -u https://test-url -H "X-Header: FUZZ"
```

4. To fuzz URL with POST method
```
ffuf -w <path-wordlist> -u https://test-url -X POST -d "var=FUZZ"
```

5. To fuzz vhost list
```
ffuf -w <path-vhosts> -u https://test-url -H "Host: FUZZ"
```

6. To find subdomains without DNS records
```
ffuf -w <path-wordlist> -u https://test-url/ -H "Host: FUZZ.site.com"
```

7. To filter based on status code
```
ffuf -w <path-wordlist> -u https://test-url/FUZZ -fc 404,400
```

8. To filter based on amount of words
```
ffuf -w <path-wordlist> -u https://test-url/FUZZ -fw <amount-of-words>
```

9. To filter based on amount of lines
```
ffuf -w <path-wordlist> -u https://test-url/FUZZ -fl <amount-of-lines>
```

10. To filter based on size of response
```
ffuf -w <path-wordlist> -u https://test-url/FUZZ -fs <size-of-response>
```

11. To filter based on amount of words
```
ffuf -w <path-wordlist> -u https://test-url/FUZZ -fr <regex-pattern>
```

12. To control rate of sending packets
```
ffuf -w <path-wordlist> -u https://test-url/FUZZ -rate <rate-of-sending-packets>
```

13. To run scan for specific time or less than specific time (in seconds)
```
ffuf -w <path-wordlist> -u https://test-url/FUZZ -maxtime 60
```

14. To fuzz substring
```
ffuf -w <path-wordlist> -u https://test-url/testFUZZ
```

15. To limit maximum time (in seconds) per job.
```
ffuf -w <path-wordlist> -u https://test-url/FUZZ -maxtime-job 60
```

16. File discovery with specific extensions
```
ffuf -w <path-wordlist> -u http://test-url/FUZZ -e .aspx,.php,.txt,.html
```

17. To sent POST request with fuzz data
```
ffuf -w <path-wordlist> -X POST -d “username=admin\&password=FUZZ” -u http://test-url/FUZZ
```

18. To FUZZ specific format file after directory
```
ffuf -w <path-wordlist> -u http://test-url/FUZZ/backup.zip
```

19. Recursion is used to perform the same task again
```
ffuf -u https://test-url/FUZZ -w <path-wordlist> -recursion
```

20. Scan each domain with Wordlist1
```
ffuf -u https://codingo.io/Wordlist1 -w <path-wordlist>:Wordlist1
```

21. Scan multiple domains with Wordlist1
```
ffuf -u https://Wordlist2/Wordlist1 -w <path-wordlist>:Wordlist1 <domain-list>:Wordlist2
```

22. To introduce delay (in seconds) by using -p
```
ffuf -u http://test-url/FUZZ/ -w <path-wordlist> -p 1
```

23. To speed or slow scan by using -t (default is 40)
```
ffuf -u http://test-url/FUZZ/ -w <path-wordlist> -t 1000
```

24. To save output by using -o and for format -of
```
ffuf -u https://test-url/FUZZ/ -w <path-wordlist> -o output.html -of html
```

25. To run scan in silent mode
```
ffuf -u https://test-url/FUZZ -w <path-wordlist> -s
```

