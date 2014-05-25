WebDB+Press vol.80
CasperJSによるWebオートメーションE2Eテスト

## memo
- PhantomJSのラッパ(PhantomJSはWebkitベースのヘッドレスブラウザ)
- npmが利用できる(限定的、nodeとは異なる!!)
- 画面キャプチャのAPIもある
- viewportを複数切り替えてスクリーンショットを撮る例  
casper.each  
https://gist.github.com/nhoizey/4060568
- debug  
```js
casperjs 01_scraping_google.js --verbose --log-level=debug
```
--testing  
```js
casperjs test 07_e2e_testing.coffee
```
