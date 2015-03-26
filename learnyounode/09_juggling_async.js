var http = require('http');
var bl = require('bl');
var contents = [];
var count = 0;

var urls = process.argv.slice(2);

for (var i = 0; i < urls.length; i++) {
  httpGet(i);
}

function httpGet(i) {
  http.get(urls[i], function(response) {
    response.pipe(bl(function(err, data) {
      if (err) {
        console.error('err:' + err);
      }
      response.setEncoding('utf8');
      contents[i] = data.toString();
      count++;

      if (count == 3) {
        printContents();
      }
    }));
  });
}

function printContents() {
  contents.forEach(function(content) {
    console.log(content);
  });
}
