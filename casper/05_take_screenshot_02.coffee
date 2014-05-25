casper = require('casper').create()

casper.start()
casper.userAgent 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53'

casper.open('https://google.com').viewport(640, 1136).then ->
  @fill 'form[action="/search"]', q: 'web+db press', true

casper.then ->
  @capture './web+db_mobile.png'

casper.run()