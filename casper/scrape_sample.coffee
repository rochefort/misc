casper = require('casper').create()
utils = require('utils');
# fs = require('fs')

casper.start 'http://example.com', ->
  @wait 2000

casper.then ->
  links = []
  links = @evaluate ->
    items = document.querySelectorAll('#list ul li h3 a')
    Array::map.call items, (e) ->
      link = e.getAttribute('href')
      [e.text, link]

  for link in links
    if (link[1].match(/detail/))
      console.log '"' + link.join(',') + '"'

casper.run()

