const amazon = require('./lib/amazon')

amazon.getProductReviews('B00ZTMPE6E')
  .then((result) => console.log(JSON.stringify(result)))
