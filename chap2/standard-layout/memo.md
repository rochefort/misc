# Part1

1. reset.css
1. clearfix
```css
/* 毎回要素作ってclearを指定する方法 */
.clear {
  clear: both;
}
/* でも毎回要素作るのは面倒なので擬似要素でやるやり方 */
.border::after {
  content: '';
  display: block;
  clear: both;
}
/* 擬似要素毎回書くの面倒なので擬似要素用のclassを作る */
.cleafix::after {
  content: '';
  display: block;
  clear: both;
}
```

1. rem
css3、root要素(html要素)のfont-sizeを1とした倍率を指定する
emは親要素をベースにする。
1. font-size: 62.5%;
主要なブラウザのデフォルトフォントサイズは16px
62.5% を指定して 10px 相当にする。
%にしておくことでブラウザの設定を変更した時にもある程度反映することができる

