casper = require('casper').create
  verbose: true
  logLevel: "debug"

casper.on 'remote.message', (msg) ->
  @echo msg

casper.on 'page.error', (msg) ->
  @echo 'Error:' + msg, 'ERROR'

casper.start 'https://google.com', ->
  @fill 'form[action="/search"]', q: 'web+db press', true

casper.then ->
  titles = @evaluate ->
    links = document.querySelectorAll 'h3.r a'
    Array.prototype.map.call links, (e) ->
      e.textContent

  for title in titles
    @echo title

casper.run()
