casper.test.begin "web+dbでGoogle検索して技評がヒットする", 8, (test) ->
  casper.start 'https://google.com', ->
    test.comment "Googleトップページ: " + @getCurrentUrl()

    test.assertHttpStatus 200
    test.assertTitleMatch /^Google$/
    test.assertExists 'form[action="/search"]', '検索フォームがある'

    @fill 'form[action="/search"]', q: 'web+db press', true

  casper.then ->
    test.comment "検索結果: " + @getCurrentUrl()

    test.assertHttpStatus 200
    test.assertSelectorHasText 'title', 'web+db press'
    test.assertSelectorHasText 'h3.r a', '技術評論社', '技術評論社のリンクを含んでいる'

    @click 'h3.r a'

  casper.then ->
    test.comment "最上位の検索結果をクリック: " + @getCurrentUrl()

    test.assertHttpStatus 200
    test.assertUrlMatch 'http://gihyo.jp/magazine/wdpress', '技術評論社のサイトに到達'

  casper.run ->
    test.done()