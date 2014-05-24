var casper = require('casper').create();

casper.start('https://google.com/', function() {
  this.echo(this.getTitle());
});

casper.run();
