'use strict'

const amazon = require('./lib/amazon')

module.exports.reviews = (event, context) => {
  amazon.getProductReviews(event.queryStringParameters.asin)
    .then((reviews) => context.succeed(reviews))
    .catch((err) => context.fail(err))
}
