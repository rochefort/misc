var http = require('http');
var url = require('url');

var port = process.argv[2];

function dateToJson(date) {
  return {
    "hour": date.getHours(),
    "minute": date.getMinutes(),
    "second": date.getSeconds()
  };
}

var server = http.createServer(function(req, res) {
  var urlInfo = url.parse(req.url, true);
  var iso = urlInfo.query.iso;
  var date = new Date(iso);
  var json;

  if (urlInfo.pathname === '/api/parsetime') {
    json = dateToJson(date);
  } else if (urlInfo.pathname === '/api/unixtime') {
    json = {"unixtime": date.getTime()};
  }

  if (json) {
    res.writeHead(200, {'Content-Type': 'application/json'});
    return res.end(JSON.stringify(json));
  } else {
    res.writeHead(404);
    return res.end();
  }
});
server.listen(port);
