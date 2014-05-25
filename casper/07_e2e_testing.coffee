casper.test.begin "web+dbでGoogle検索して技評がヒットする", 1, (test) ->
  casper.start 'https://google.com', ->
    test.comment "Googleトップページ: " + @getCurrentUrl()

    test.assertHttpStatus 200

  casper.run ->
    test.done()