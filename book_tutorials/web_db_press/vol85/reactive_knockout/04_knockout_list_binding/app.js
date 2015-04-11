function ViewModel() {
  this.videos = ko.observableArray([
    'ベイマックス',
    '映画　妖怪ウォッチ　誕生の秘密だニャン',
    '映画 ST赤と白の捜査ファイル'
  ]);
}

ko.applyBindings(new ViewModel());
