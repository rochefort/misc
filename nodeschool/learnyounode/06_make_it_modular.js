var filterFn = require('./filterd_ls_module.js');

var dir = process.argv[2];
var ext = process.argv[3];

filterFn(dir, ext, function(err, list) {
  if (err) {
    return console.error('error:', err);
  }

  list.forEach(function(file) {
    console.log(file);
  });
});
