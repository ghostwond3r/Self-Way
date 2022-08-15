# How to install Mullvad VPN in Kali using command line



### Open your terminal and write this to download Mullvad

        wget --content-disposition https://mullvad.net/download/app/deb/latest


### Install Mullvad

    sudo apt install -y ./MullvadVPN-2022.1_amd64.deb


### To see all option just write this and press enter
    mullvad

### To set your account write this, and they will prompt you to enter your account number
    mullvad account set 

### Start and connect to it
    mullvad connect

### to start Mullvad and make it auto-connect
    mullvad auto-connect set on

### Generate the key for WireGuard option
    mullvad tunnel wireguard key regenerate 

### Update list of provider
    mullvad relay update   

### List the updated provider
    mullvad relay list

### Set one of them like this (but replace "se8-wireguard" by the one you choose)
    mullvad relay set hostname se8-wireguard

### Verify the status of Mullvad
    mullvad status


* You can also setup port forwarding with WireGuard on the siteweb of Mullvad. You will find instruction about this too. This will only work with WireGuard, NOT OpenVPN.
