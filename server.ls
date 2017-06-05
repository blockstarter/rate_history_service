express = require \express
app = express!
bs = require \blockstarter
start-campaign-date = 1496063101
to-date = new Date!

main.rate-history
    .$on \create-index-start, ({start-campaign-date})->
      console.log \create-index-start, start-campaign-date
    .$on \load-rates, ({start-campaign-date, to-date, current-url})->
      console.log \load-rates, start-campaign-date, current-url, start-campaign-date > to-date
    .$on \aggregation-start, ({start, length})->
      console.log \aggregation-start, start, length
    .$on \aggregation-stop, ({end, duration})->
      console.log \aggregation-stop, end, duration
    .$on \create-index-end, ({start-campaign-date})->
      console.log \create-index-end, start-campaign-date
      

app.get \/rate/:date , (req, res)->
  res.send main.rate-history.get-rate req.params.date
  
app.get \/status , (req, res)->
  res.send main.rate-history.rate-index.running

build-rates = (cb)->
  currency-pair = \BTC_ETH
  err, btc_eth <-! main.rate-history.create-rate-index {start-campaign-date, currency-pair: \BTC_ETH , to-date}
  return err if not err?
  err, usdt_eth <-! main.rate-history.create-rate-index {start-campaign-date, currency-pair: \USDT_ETH , to-date}
  return err if not err?
  memory.rates = { btc_eth, usdt_eth }
  cb null, { btc_eth, usdt_eth }




app.listen 8080 