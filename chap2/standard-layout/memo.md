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


1. 隠しテキストについて(p.37)
「隠しテキスト＝ペナルティ」ではない。
不必要なキーワードを検索エンジンのためだけに見えない形で埋め込む行為がペナルティの対象
Googleガイドライン
「ランクを競っているサイトやGoogle社員に対して自分が行った対策を説明するときに、
やましい点がないかどうかが判断の目安」

1. グローバルナビゲーション
nav要素

1. letter-spacing: 1px;
タイトルやボタンなどの目立つテキストはデザインに応じてほんの少しだけ間隔を広げると、
すっきりと読みやすい印象になる場合が多い

1. css nav effect(p.44)
.global-nav .nav-item.active a,
.global-nav .nav-item a:hover {
  background-color: #d03c56;
  color: #fff;
}

transition: 0.15s;
も良い
