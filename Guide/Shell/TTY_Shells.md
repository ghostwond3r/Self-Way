## TTY Shells

- Tips / Tricks to spawn a TTY shell from a limited shell in Linux, useful for running commands like su from reverse shells.

### Python TTY Shell Trick
```
python -c 'import pty;pty.spawn("/bin/bash")'

echo os.system('/bin/bash')
```

### Spawn Interactive sh shell
```
/bin/sh -i
```

### Spawn Perl TTY Shell
```
exec "/bin/sh";
perl —e 'exec "/bin/sh";'
```

### Spawn Ruby TTY Shell
```
exec "/bin/sh"
```

### Spawn Lua TTY Shell
```
os.execute('/bin/sh')
```

### Spawn TTY Shell from Vi
- Run shell commands from vi:
```
:!bash

Spawn TTY Shell NMAP

!sh
```