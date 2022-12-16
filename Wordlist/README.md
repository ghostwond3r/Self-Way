# Custom wordlists

- [Custom wordlists](#custom-wordlists)
  - [Policies](#policies)
    - [SMB](#smb)
  - [Generate list](#generate-list)
    - [Gorilla](#gorilla)
      - [Source code](#source-code)
      - [Computing passwords](#computing-passwords)
      - [From file](#from-file)
      - [Append/prepend](#appendprepend)
      - [From pattern](#from-pattern)
      - [Mutations from file](#mutations-from-file)
      - [Scraping web pages for words](#scraping-web-pages-for-words)
      - [Using common password/username formats to build wordlists](#using-common-passwordusername-formats-to-build-wordlists)
    - [hashcat](#hashcat)

## Policies

### SMB

cme smb IP_ADDRESS --pass-pol

> Length

```text
Minimum password length: X
```

> Block brute force

```text
Account Lockout threshold: None
```

## Generate list

### Gorilla

#### Source code

<https://github.com/d4rckh/gorilla>

#### Computing passwords

```sh
gorilla --from-pattern "{a-z}{a-z}{a-z}{a-z}{a-z}" -o wordlists.lst
```

#### From file

```sh
gorilla -i ./Season.lst -m "append:{0-9}"
```

#### Append/prepend

```sh
gorilla --from-pattern "administrator" \
-m "prepend:_" \
-m "append:{0-9}"
```

#### From pattern

```sh
gorilla --from-pattern "{a-z}{a-z}{a-z}{a-z}{a-z}"
```

#### Mutations from file

```sh
gorilla --mutations-file simple.yml
```

Example file:

`cat simple.yml`

```yml
name: simple

mutation_sets:
  - [ nothing ] # => word
  - [ reverse ] # => drow
  - [ remove_last_letter ] # => wor
  - [ remove_first_letter ] # => ord
  - [ uppercase_all ] # => WORD
  - [ "append:{0-9}" ] # => word1, word2, word3
  - [ "2 append:{0-9}" ] # => word11, word22, word33
  - [ "replace:o:0", "replace:a:4", "replace:e:3" ] # => w0rd, h3ll0
```

#### Scraping web pages for words

```sh
gorilla -w https://example.org/
```

#### Using common password/username formats to build wordlists

```sh
gorilla  --from-formatting basic_usernames.yml -c user.csv
```

Example file:

`cat basic_usernames.yml`

```yml
name: basic_usernames

fields:
  - [ f_name ]
  - [ l_name ]

formatting_sets:
  - [ "{f_name}_{l_name}" ]
  - [ "{l_name}{f_name}" ]
  - [ ["{f_name}", [1st_letter]], "_{l_name}" ]
  - [ ["{f_name}", [1st_letter]], "{l_name}" ]
```

`cat user.csv`

```csv
f_name,l_name
james,smith
john,snow
```

### hashcat

```sh
hashcat --force passwords -r /usr/share/hashcat/rules/best64.rule --stdout | grep -v -x '.\{0,8\}' | sort -u > wordlists.lst
```
