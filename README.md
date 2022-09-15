<p align="center">
   <img width="2500" height="100" src="https://user-images.githubusercontent.com/64184513/190313691-2f55d4a5-7a76-42c1-b51b-f7151ee84652.png"
</p>
   
<p align="center">
  NewBloodProject
</pr>

## What is it 

* Project developed for NBP - but open for everyone.
* Automated installation and configuration of an ethical hacking environment.
* Built to learn on your own.
* Includes guides, tutorials and cheat sheets in each category.
* Each ressources have been write in Markdown.
* To read Markdown from CLI, **md2term** will be add during the installation and an alias will be create: `alias md="md2term -f`
* To access guide you simply use: `md <MARKDOWN FILE>`

</br>

### Before starting

1. To be able to use this tool, you must have previously installed VirtualBox with Kali Linux on it. If you haven't already, you can find the instructions here: https://github.com/NeverWonderLand/kali-inst-guide

2. Once you have your Kali Linux started, then you can proceed to the installation. First you need to open a ROOT terminal, you can find it in menu of the left top corner, type "term" and choose the red one. It will prompt you for the password, it is the default one: kali

3. It is important that you update kali before starting the installation, for this type this command:
`apt-get update && apt-get upgrade -y`

</br>

### Installation of the tool

Type these command one by one
```
cd /
git clone https://github.com/NeverWonderLand/Self-Way
cd Self-Way
chmod +x install.sh
./install.sh
```

* Take note that the installation can take around 3 hours, so to avoid to have to watch the screen the whole time, turn off the screen saver in the same menu as you opened the terminal and search for "power management" then turn it off.

</br>

### After the installation

When the installation is completed, you will find the next instructions in the file "where_to_start.md". To read it from your terminal directly, use this command: `md /Self-Way/where_to_start.md `

---------------------------------------------------

| The NewBloodProject is my way to be the change I want to see - WondR <3
