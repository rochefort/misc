var http = require('http');
var concatStream = require('concat-stream');
var url = process.argv[2];

http.get(url, function(response) {
  response.pipe(concatStream(function(data) {
    data = data.toString();
    console.log(data.length);
    console.log(data);
  }));
});
