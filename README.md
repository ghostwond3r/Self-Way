* Built to learn ethical hacking on your own.
* Includes guides, tutorials, cheat sheets and tools.
* Each resource has been written in Markdown.
* The Guide is accessible directly from command line (thanks to Glow).

<p align="center">
   <img width="9000" height="200" src="https://user-images.githubusercontent.com/64184513/197416598-573073ff-530b-4132-acb3-d4233654173e.jpg"
</p>

*A complete translation is in progress to make a separate repository in Persian. Due to the actual filtering of Internet in Iran, the installation script need some adgustment. If you are in Iran and try to install this version (English), you will possibly get some issues and it is not recommended, especially if you are just starting out with Linux.*

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

</br>

## Step 1

1. Download VirtualBox and install Kali inside. You can find the instruction to do it here : https://github.com/NeverWonderLand/kali-inst-guide

2. Open the terminal and update your system:
```
sudo apt update && apt full-upgrade -y
sudo apt autoremove -y
```

</br>

## Step 2

1. Clone this repo :
```
git clone https://github.com/NeverWonderLand/Self-Way.git /home/kali/Desktop/Self-Way
```

2. Install it :
```
sudo su
cd /Desktop/Self-Way
chmod +x install.sh
./install.sh
```

> To avoid to having to watch the screen the whole time, turn off the screen saver. To do this go in the Kali menu and search for "power management" then turn it all off.

> Make a reboot when its finish by typing `reboot` in the terminal and press `ENTER`

</br>

## Step 3
Install `glow` if you want to be able to access the Guide through the command line directly. You can also check it from github directly, or open it with any editor too, it's up to you.
```
go install github.com/charmbracelet/glow@latest
git clone https://github.com/charmbracelet/glow.git
cd glow
go build
```

## Step 4
Once all is complete:

Option A - GUI:

* open the folder `Self-Way` on the Desktop and then open `Guide`
* right click inside the folder and choose `open a terminal here`
* you need to be root to use `glow`: `sudo su`
* type the command `glow` 

Option B - CLI

* open the terminal and switch to root: `sudo su`
* navigate to the directory of the `Guide`: `cd /home/kali/Desktop/Self-Way/Guide`
* type the command `glow` 


> Now you are in the Guide book! To navigate inside, use your arrow on the keyboard and select with `ENTER`. To exit just press `q`. You can always let this terminal open and then open a new one to make your work!

> To get started learning go to `where_to_start.md`

</br>


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

> This repository is still in work and will continue to be updated. For more details see the changelog.

| The NewBloodProject is my way to be the change I want to see - WondR <3
