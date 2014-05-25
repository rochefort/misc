WebDB+Press vol.80
CasperJSによるWebオートメーションE2Eテスト

## memo
- PhantomJSのラッパ(PhantomJSはWebkitベースのヘッドレスブラウザ)
- npmが利用できる(限定的、nodeとは異なる!!)  
SpookyJSなどのNode.jsモジュールを使うと、Node.js上でCasperJSをインスタンス化できる
- 画面キャプチャのAPIもある
- イベントフック  
remote.message, page.error  
他にもresouce.received, click, back, http.status.[code] などがある  
また、emit()で独自イベントの発火が可能  
- viewportを複数切り替えてスクリーンショットを撮る例  
casper.each  
https://gist.github.com/nhoizey/4060568
- debug  
```javascript
casperjs 01_scraping_google.js --verbose --log-level=debug
```
- testing  
  - 共通処理(--pre, --post, --includes で別スクリプトに分ける)
  - execute:  
```javascript
casperjs test 07_e2e_testing.coffee
```
- documents  
http://casperjs.readthedocs.org/en/latest/modules/  
http://casperjs.readthedocs.org/en/latest/testing.html  
http://casperjs.readthedocs.org/en/latest/events-filters.html