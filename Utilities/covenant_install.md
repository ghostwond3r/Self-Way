# Covenant installation on Kali

First download dotnet sdk linux (one line at time)
```
wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

sudo dpkg -i packages-microsoft-prod.deb

rm packages-microsoft-prod.deb
```

Now install it (all this at the same time)
```
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-6.0
```

Now the clone the repo
```
git clone --recurse-submodules https://github.com/cobbr/Covenant
```

Then..
```
cd Covenant/Covenant

dotnet run
```

### WAIT UNTIL YOU SEE ALL THIS MESSAGE
warn: Microsoft.EntityFrameworkCore.Model.Validation[10400]
      Sensitive data logging is enabled. Log entries and exception messages may include sensitive application data, this mode should only be enabled during development.

WARNING: Running Covenant non-elevated. You may not have permission to start Listeners on low-numbered ports. Consider running Covenant elevated.

Covenant has started! Navigate to https://127.0.0.1:7443 in a browser


### Now open a browser at https://127.0.0.1:7443
### Registry your username + password
### Now you are in the Dashboard



