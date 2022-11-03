[English](https://github.com/NeverWonderLand/Self-Way/blob/main/README.md) | [Persian](https://github.com/NeverWonderLand/Self-Way/blob/main/Persian/README.md)

<p align="center">
   <img width="1000" height="300" src="https://user-images.githubusercontent.com/64184513/197416598-573073ff-530b-4132-acb3-d4233654173e.jpg"
</p>


* Project developed for NBP - NewBloodProject
* Built to learn ethical hacking on your own.
* Includes guides, tutorials, cheat sheets and tools.
* Each resource has been written in Markdown.
* The Guide is accessible directly from command line (thanks to Glow).

</br>

**Category of tools;**

* Anonymity
* Cracking
* Ddos
* Exploitation
* Forensics/Anti-Forensics
* Fuzzing
* Google Dorking
* Industrial Control System (ICS)
* Lateral Movement
* OSINT
* Pivot
* Post-Exploitation
* Privilege Escalation
* Recon
* Reporting
* Reversing
* Sniffing
* Social-Engineering
* System
* Vulnerability
* Web Application
* Wireless

<p align="center">
   <img width="1000" height="300" src="https://user-images.githubusercontent.com/64184513/197375113-7bc79077-fb0d-44fc-b654-5311cdc65778.jpg"
</p>


### Step 1

1. Download VirtualBox and install Kali inside. You can find the instruction to do it here : https://github.com/NeverWonderLand/kali-inst-guide

2. Open a ROOT terminal (the red one in the kali menu). It is important that you update your system before installing anything :
```
apt update && apt full-upgrade -y
apt autoremove -y
```

### Step 2

1. Clone this repo :
```
cd /root
git clone https://github.com/NeverWonderLand/Self-Way.git
```

2. Install it :
```
cd Self-Way
chmod +x install.sh
./install.sh
```

> To avoid to having to watch the screen the whole time, turn off the screen saver. To do this go in the Kali menu and search for "power management" then turn it all off.

> Make a reboot when its finish by typing `reboot` in the terminal and press `ENTER`

</br>

### Step 2

Once all is complete:

* open the folder `Guide` on the Desktop
* right click inside the folder and choose `open a terminal here`
* in the terminal, type the command `glow` 

> Now you are in the Guide book! To navigate inside, use your arrow on the keyboard and select with `ENTER`. To exit just press `q`. You can always let this terminal open and then open a new one to make your work!

> To get started learning open the file `where_to_start.md`.


### Issues

If the command 'glow' is not found, follow these steps and it should work:
```
cd /root/glow
go build
```

If you cant open the folder Guide and wallpaper, open a terminal and enter there commands:
```
chmod 777 /home/kali/Desktop/Guide
chmod 777 /home/kali/Desktop/wallpaper


# GOOD LUCK ! 

---------------------------------------------------

> This repo have been build based on many others' amazing work:

<https://github.com/ghostsec420>

<https://github.com/U53RW4R3>

<https://github.com/RoseSecurity>

<https://github.com/thehackingsage>

<https://github.com/Anon-Planet/thgtoa>


> If you see some of your works here and want your name added just message me and I will add it !

--------------------------------------

| The NewBloodProject is my way to be the change I want to see - WondR <3
