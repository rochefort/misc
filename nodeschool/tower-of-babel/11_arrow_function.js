var inputs = process.argv.slice(2);
var result = inputs.map(x => x[0])
  .reduce((sum, y) => sum += y);

console.log(result);
