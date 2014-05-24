var casper = require('casper').create();

casper.start('https://google.com', function() {
  this.fill(
    'form[action="/search"]',
    { q: 'web+db press'},
    true
  );
});

casper.then(function(){
  var titles = this.evaluate(function () {
    var links = document.querySelectorAll('h3.r a');
    return Array.prototype.map.call(links, function(e) {
      return e.textContent;
    });
  });

  titles.forEach(function(title) {
    this.echo(title);
  }.bind(this));
});

casper.run();
