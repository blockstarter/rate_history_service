// Generated by LiveScript 1.5.0
(function(){
  var express, app, bs, startCampaignDate, toDate, buildRates;
  express = require('express');
  app = express();
  bs = require('blockstarter');
  startCampaignDate = 1496063101;
  toDate = new Date();
  main.rateHistory.$on('create-index-start', function(arg$){
    var startCampaignDate;
    startCampaignDate = arg$.startCampaignDate;
    return console.log('create-index-start', startCampaignDate);
  }).$on('load-rates', function(arg$){
    var startCampaignDate, toDate, currentUrl;
    startCampaignDate = arg$.startCampaignDate, toDate = arg$.toDate, currentUrl = arg$.currentUrl;
    return console.log('load-rates', startCampaignDate, currentUrl, startCampaignDate > toDate);
  }).$on('aggregation-start', function(arg$){
    var start, length;
    start = arg$.start, length = arg$.length;
    return console.log('aggregation-start', start, length);
  }).$on('aggregation-stop', function(arg$){
    var end, duration;
    end = arg$.end, duration = arg$.duration;
    return console.log('aggregation-stop', end, duration);
  }).$on('create-index-end', function(arg$){
    var startCampaignDate;
    startCampaignDate = arg$.startCampaignDate;
    return console.log('create-index-end', startCampaignDate);
  });
  app.get('/rate/:date', function(req, res){
    return res.send(main.rateHistory.getRate(req.params.date));
  });
  app.get('/status', function(req, res){
    return res.send(main.rateHistory.rateIndex.running);
  });
  buildRates = function(cb){
    var currencyPair;
    currencyPair = 'BTC_ETH';
    return main.rateHistory.createRateIndex({
      startCampaignDate: startCampaignDate,
      currencyPair: 'BTC_ETH',
      toDate: toDate
    }, function(err, btc_eth){
      if (err == null) {
        return err;
      }
      main.rateHistory.createRateIndex({
        startCampaignDate: startCampaignDate,
        currencyPair: 'USDT_ETH',
        toDate: toDate
      }, function(err, usdt_eth){
        if (err == null) {
          return err;
        }
        memory.rates = {
          btc_eth: btc_eth,
          usdt_eth: usdt_eth
        };
        cb(null, {
          btc_eth: btc_eth,
          usdt_eth: usdt_eth
        });
      });
    });
  };
  app.listen(8080);
}).call(this);
