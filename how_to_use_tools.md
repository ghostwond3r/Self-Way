# How to use tools

After the installation, you will find your tools under the '/opt' directory. To navigate there:
```
cd /opt
```

Now to see all folder:
```
ls
```

You can now choose a category, then choose a tool with the same 2 commands.

Once you are inside the folder of a tool, to use it the first time you will need to proceed to his installation. To know how to do so, list the file with 'ls' and you should see (most of time) a file called 'README.md'. To print this file on the screen:
```
cat README.md

# OR you can also use 'glow'

glow README.md
```

When you see a file called 'requirements.txt', enter this command:
```
pip3 install -r requirements.txt
```

If you face issues with dependencies, example:
```
crackmapexec 5.2.2 requires impacket<0.10.0,>=0.9.23, but you have impacket 0.10.0 which is incompatible.                                                             
crackmapexec 5.2.2 requires neo4j<5.0.0,>=4.1.1, but you have neo4j 1.7.0.dev0 which is incompatible.                                                                 
crackmapexec 5.2.2 requires pylnk3<0.4.0,>=0.3.0, but you have pylnk3 0.4.2 which is incompatible.                                                                    
crackmapexec 5.2.2 requires xmltodict<0.13.0,>=0.12.0, but you have xmltodict 0.13.0 which is incompatible. 
```

You can fix it like this:
```
pip3 install impacket==0.9.23
pip3 install neo4j==4.1.1
pip3 install pylnk3==0.3.0
pip3 install xmltodict==0.12.0
```

If a tool using python dont work, try to open the main script ending by '.py' and modify the first line, example:
```
nano linkfinder.py
```

Inside you will see:
```
#!/usr/bin/env python
# Python 3
# LinkFinder
# By Gerben_Javado
````

As you see the tool use 'python3'. So if the tool dont start when typing 'python3 linkfinder.py', modify the first line for:
```
#!/usr/bin/python3
```

Then save, exit and try to run it again with 'python3 linkfinder.py'.
