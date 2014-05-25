casper = require('casper').create()

casper.start 'https://www.facebook.com', ->
  @fill 'form#login_form',
    email: casper.cli.args[0], pass: casper.cli.args[1]
    true
  # facebookはログインしてから次の画面が表示されるまでにワンクッションあるっぽい
  @wait 2000

casper.then ->
  @echo @getCurrentUrl()
  @click 'span.headerTinymanName'
  @wait 2000

casper.then ->
  @echo @getCurrentUrl()
  @capture 'facebook.png'

casper.run()