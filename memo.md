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

1. outline意識すること(P.047)
見出しで区切る or sectionで区切る(sectionは見出しを持つことが推奨されている)

1. ブロックレベル要素とインライン要素(P.50)
HTML5でブロックレベル要素、インライン要素という分類は廃止
CSSのdisplayプロパティのあたいは要素の種類ごとに定められているのは変わらない
a要素のdisplayプロパティのデフォルト値は変わらずinline、a要素に高さをもたせたい場合は
inline-blockかblockの指定が必要。

1. コンテンツモデル(P.49)
a様相は親要素次第でdiv要素を囲むことができる
???

1. box-sizing
width/heightの指定がpadding, border を含めた値となるので、より直感的に%指定とかできる
```css
*, *::before, *::after {
  box-sizing: border-box;
}
```

1. datetime入れとくといいよ

1. line-height(P.56)
子要素にも適用されるので、数値にしておくと安心

1. overflow-y: auto(P.63)
子要素がはみ出した場合、スクロールバーが表示され横幅が変わるので
子要素のwidthは%指定にする

1. display: inline, inline-block(P.64)
htmlの改行が半角スペースとして要素間に挿入される。
解決策として、親要素にfont-size: 0;を指定。
※古いandroidでは効かないかも

その他：改行しない、タグの中で改行する、改行をコメントアウトする、
float（display: block;になる）を使う、display: table; を使う、
display: flex; を使う

1. vertical-align
インラインレベルの要素、テーブルセルの要素

1. webkit-transform
中にtextがある場合は、逆向きで相殺

1. cssカウンタ便利

1. 実体文字参照よりutf-8
© は &copy; を使用する場合が多かっったが、HTML5ではUTF-8使用時は直接の記述が推奨されている
へー

# part2
1. ボックスのリンク(P.106)
margin: -8px -8px -11px;
padding: 8px 8px 11px;


1. Masaonry 画像読み込み対策
cssで高さ設定しちゃう（推奨） or 読み込みを待つ

1. グレースフルデグラデーション（P.133）
モダンブラウザをターゲットとし、下位のブラウザでは表示のレベルを落とすこと。

1. プログレッシブエンハンスメント
レガシーブラウザや中基準のブラウザでデザイン
