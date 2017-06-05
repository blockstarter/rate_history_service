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

Once server starts it loads calculates average rates and stores them into 
memory for faster access.

```Coffeescript
http://localhost:8080 # modify port in server.ls
```

## Usage (REST API)

### `GET /`

Returns a basic information.


### `GET /rate/:unix_ts`

```Coffeescript

# Check rate for BTC/ETH and CHF/ETH
http://localhost:8080/rate/:unix_ts

# Response example:
{ "ETH": { "BTC": "0.0917820001808675764", "CHF": "202.00443299777144779363" }}

```

### `GET /status`

```Coffeescript

# Get status of service
http://localhost:8080/status

# Possible responses
{ serverStarting: true }

# Service loads historical trading data from Poloniex...

# `true` when service is calculating average rates.
# `false` when averages calculated.
{ btc_eth: true, usdt_eth: false } 

```