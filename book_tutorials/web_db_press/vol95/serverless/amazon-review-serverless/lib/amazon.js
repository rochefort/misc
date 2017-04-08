const cheerio = require('cheerio')
const request = require('request-promise')

exports.getProductReviews = (asin) => {
  return getProductPage(asin).then(($) => {
    return {
      productTitle: $('#productTitle').text().trim(),
      avgRating: $('#avgRating').text().trim(),
      topReviews: $('#revMHRL .a-spacing-micro').map((i, rev) => {
        return {
          reviwer: $(rev).find('.noTextDecoration').text(),
          reviewScore: $(rev).find('.a-icon-alt').text(),
          reviewTitle: $(rev).find('.a-link-normal .a-text-bold').text()
        }
      }).get()
    }
  })
}

function productUrl(asin) {
  return `https://www.amazon.co.jp/dp/${asin}/`
}

function getProductPage(asin) {
  return request({
    uri: productUrl(asin),
    transform: (body) => cheerio.load(body)
  })
}
