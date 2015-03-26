var http = require('http');
var url = process.argv[2];

http.get(url, function(response) {
  var contents = '';
  response.setEncoding('utf8');
  response.on('data', function(data) {
    contents += data;
  });
  response.on('error', console.error);
  response.on('end', function() {
    console.log(contents.length);
    console.log(contents);
  });
});
