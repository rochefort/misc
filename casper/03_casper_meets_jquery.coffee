casper = require('casper').create
  clientScripts: ['lib/jquery-2.1.0.min.js']
_ = require 'lib/underscore'

casper.start 'https://google.com', ->
  @fill 'form[action="/search"]', q: 'web+db press', true

casper.then ->
  titles = @evaluate ->
    $('h3.r a').map ->
      $(this).text()

  _.each titles, (title) => @echo title

casper.run()
