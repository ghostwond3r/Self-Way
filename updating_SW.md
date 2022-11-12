## Updating Self-Way 

### Since this tool is made to be an evolutive project, here how to receive updates using GIT command.
*The following is mean to be run if you already have Self-Way installed*

</br>

**You need to be inside the directory of the Self-Way**

Set the upstream URL
```
git remote add upstream https://github.com/NeverWonderLand/Self-Way
```

To verify if it was set
```
git remote -vv
```

Pull the upstream and specify from which branche.
```
git pull upstream main
```

If you get an error about the "install.sh" conflict, you can remove the file and the pull will download it back. 

*** Important: you don't need to run the 'install.sh' script after the update, since it is already install.
```
rm install.sh
```

then merge
```
git merge upstream/main
```

*Work with any other clone repository, only 'URL' and 'BRANCHE' change*

End.
