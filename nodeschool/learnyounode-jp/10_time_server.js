var net = require('net');

var port = process.argv[2];

function zeroPadding(val) {
  return ('0' + val).slice(-2);
}

function now() {
  var date = new Date();
  return date.getFullYear() + '-' +
    zeroPadding(date.getMonth() + 1) + '-' +
    zeroPadding(date.getDate()) + ' ' +
    zeroPadding(date.getHours()) + ':' +
    zeroPadding(date.getMinutes());
}

var server = net.createServer(function (socket) {
  socket.end(now());
});
server.listen(port);
