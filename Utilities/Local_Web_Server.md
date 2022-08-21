# Simple Local Web Servers

Run a basic http server, great for serving up shells.
```
python -m SimpleHTTPServer 80
```

Same but with Python3 
```
python3 -m http.server
```

Run a ruby webrick basic http server
```
ruby -rwebrick -e "WEBrick::HTTPServer.new
(:Port => 80, :DocumentRoot => Dir.pwd).start"
```

Run a basic PHP http server
```
php -S 0.0.0.0:80
```
