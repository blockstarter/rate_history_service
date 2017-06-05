express = require \express
app = express!
main = require \./rate.js
start-campaign-date = 1496063101
to-date = new Date!

main
    .$on \create-index-start, ({start-campaign-date})->
      console.log \create-index-start, start-campaign-date
    .$on \load-rates, ({start-campaign-date, to-date, current-url})->
      console.log \load-rates, start-campaign-date, current-url
    .$on \aggregation-start, ({start, length})->
      console.log \aggregation-start, start, length
    .$on \aggregation-stop, ({end, duration})->
      console.log \aggregation-stop, end, duration
    .$on \create-index-end, ({start-campaign-date})->
      console.log \create-index-end, start-campaign-date
      

app.get \/ , (req, res)->
  res.send "try to use /rate/:date or /status"

app.get \/rate/:date , (req, res)->
  res.send main.get-rate req.params.date
  
app.get \/status , (req, res)->
  res.send main.rate-index.running ? { server-starting: yes }
  
app.get \/all-rates , (req, res)->
  res.send res.send main.rate-index



build-rates = (cb)->
  err, btc_eth <-! main.create-rate-index {start-campaign-date, currency-pair: \BTC_ETH , to-date}
  return err if err?
  err, usdt_eth <-! main.create-rate-index {start-campaign-date, currency-pair: \USDT_ETH , to-date}
  return err if err?
  cb null, { btc_eth, usdt_eth }


app.listen 8080 

#main.rate-index <<< JSON.parse require(\fs).read-file-sync(\./cache_for_dev_only.json).to-string(\utf8)

err, rates <- build-rates

#require(\fs).write-file-sync(\./cache_for_dev_only.json , JSON.stringify(rates))
