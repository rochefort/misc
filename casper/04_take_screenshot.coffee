casper = require('casper').create()

casper.start 'https://google.com', ->
  @fill 'form[action="/search"]', q: 'web+db press', true

casper.then ->
  @capture './web+db.png'

casper.run()