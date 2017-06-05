### Rate History Service



Install

```
npm i livescript -g
git clone https://github.com/blockstarter/rate_history_service
cd rate rate_history_service
npm i
```

Run 

```
sh run
```

Check 

```
http://localhost:8080 #modify port in server.ls
```

Usage 

```
# Check rate
http://localhost:8080/rate/:unix_ts

# Status
http://localhost:8080/status

```