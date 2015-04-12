var fs = require('fs');

var filePath = process.argv[2];
var buf = fs.readFileSync(filePath);
var content = buf.toString();
var lines = content.split("\n").length - 1;
console.log(lines);
