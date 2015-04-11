function ViewModel() {
  this.repos = ko.observable();
}

var viewModel = new ViewModel();
ko.applyBindings(viewModel);

var inputStream = Rx.Observable.fromEvent($('#query'), 'input')
  .map(function(e) {
    return e.target.value;
  });

var queryStream = inputStream
  .throttle(300)
  .filter(function(text) { return text.length > 0; })
  .distinctUntilChanged()
  .map(function(text) {
    return 'https://api.github.com/search/repositories?q=' + text;
  });

var executingStream = new Rx.Subject();
var repositoriesStream = queryStream
  .flatMap(function(query) {
    executingStream.onNext(true);
    return Rx.Observable.fromPromise($.ajax({url: query}))
      .finally(function() { executingStream.onNext(false); });
  })
  .map(function(res) {
    return res.items;
  });

executingStream.subscribe(function(executing) {
  if (executing) {
    console.log('aaa');
    $('#result').prepend('loading...');
  }
});

repositoriesStream.subscribe(function(repos) {
  // 再描画
  aaa = repos;
  viewModel.repos(repos);
});

// 並び替え
var ascSortStream = Rx.Observable.fromEvent($('#ascBtn'), 'click')
  .map(function() {
    return _.sortBy((viewModel.repos() || []), function(repo) { return repo.name; });
  });

var descSortStream = Rx.Observable.fromEvent($('#descBtn'), 'click')
  .map(function(){
    return _.sortBy((viewModel.repos() || []), function(repo) { return repo.name; }).reverse();
  });

Rx.Observable.merge([ascSortStream, descSortStream])
  .subscribe(function(repos) {
    viewModel.repos(repos);
  });
