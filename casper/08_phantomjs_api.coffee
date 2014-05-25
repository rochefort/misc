casper = require('casper').create()
fs = require 'fs'

casper.echo JSON.stringify phantom.version

casper.start 'https://google.com', ->
  fs.write 'google.html', @getPageContent(), 'w'

casper.run()