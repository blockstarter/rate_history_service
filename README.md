### Rate History Service



Install

```Bash
npm i livescript -g
git clone https://github.com/blockstarter/rate_history_service
cd rate rate_history_service
npm i
```

Run 

```Bash
sh run
```

Check 

```Coffeescript
http://localhost:8080 #modify port in server.ls
```

Usage 

```Coffeescript
# Check rate
http://localhost:8080/rate/:unix_ts

# Status
http://localhost:8080/status

```