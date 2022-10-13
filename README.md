<p align="center">
   <img width="2500" height="100" src="https://user-images.githubusercontent.com/64184513/190313691-2f55d4a5-7a76-42c1-b51b-f7151ee84652.png"
</p>
   
<p align="center">
 ☆ NewBloodProject ☆
</pr>

* A custom Kali Linux ISO
* Project developed for NBP - but is open for everyone.
* Built to learn ethical hacking on your own.
* Includes guides, tutorials, cheat sheets and tools.
* Each ressources have been write in Markdown.
* The Guide is accessible directly in command line (thanks to Glow).

</br>

### Step 1

1. You will need VirtualBox (or VMware) to use this ISO. You can find the instructions here for VirtualBox: https://github.com/NeverWonderLand/kali-inst-guide

2. Once you have your Kali ready, start it and login with user `kali` and password `kali`. 

3. First you need to open a ROOT terminal, you can find it in menu of the left top corner, type "term" and choose the red one. It will prompt you for the password, it is the default one: `kali`.

4. It is important that you update your system regularly, for this use these this command:
```
apt update && apt upgrade -y
apt dist-upgrade -y
apt full-upgrade -y

# and then cleanup 

apt auroremove -y
```

</br>

### Step 2

In the same terminal, type these command one by one
```
chmod +x install.sh
./install.sh
```

> To avoid to have to watch the screen the whole time, turn off the screen saver. To do this go in the kali menu and search for "power management" then turn it all off.

> Make a reboot when its finish by typing `reboot` in the terminal and press `ENTER`

</br>

### Step 3

Once all is complete; 
* open the folder `Guide` on the Desktop
* right click inside the folder and choose `open a terminal here`
* in the terminal, type the command `glow` 

> Now you are in the Guide book! to navigate inside, use your arrow on the keyboard and select with `ENTER`. To exit just press `q`. You can always let this terminal open and then open a new one to make your work!

> To get start learning open the file `where_to_start.md`.

# GOOD LUCK ! 

---------------------------------------------------

> As I decided to make it as an ISO instead of an automated installation, the ISO will be updated following a new version of kali.

> The older version of the ISO will still available under the Outdated folder, but I recommend to uss always the latest ISO if you are new to Linux, to avoid many issues.

--------------------------------------

| The NewBloodProject is my way to be the change I want to see - WondR <3
