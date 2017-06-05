# Rate History Service

![Logo](https://avatars2.githubusercontent.com/u/28689719?v=3&s=200)

## Install

```Bash
sudo npm i livescript -g
git clone https://github.com/blockstarter/rate_history_service
cd rate_history_service
npm i
```

## Run 

```Bash
sh run
```

## Check 

```Coffeescript
http://localhost:8080 # modify port in server.ls
```

### /

```
return a basic information

```

## Usage (RESTful)

### /rate

```Coffeescript

# Check rate for BTC/ETH and CHF/ETH
http://localhost:8080/rate/:unix_ts

# Response example:
{ "ETH": { "BTC": "0.0917820001808675764", "CHF": "202.00443299777144779363" }}

```

### /status

```Coffeescript

# Get status
http://localhost:8080/status

# Possible responses
{ serverStarting: true }

# loading data 
{ btc_eth: true, usdt_eth: false } # `true` when data is building and `false` when data is ready to use

```