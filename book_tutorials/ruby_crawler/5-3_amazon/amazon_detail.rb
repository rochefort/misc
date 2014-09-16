#!/usr/bin/env ruby -w
# -*- coding: utf-8 -*-
require 'open-uri'
require 'nokogiri'

asin = '4873111870'
url = "http://www.amazon.co.jp/dp/#{asin}"

# u = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8) AppleWebKit/536.25 (KHTML, like Gecko) Version/6.0 Safari/536.25'
# doc = Nokogiri::HTML(open(url, 'User-Agent' => u))
doc = Nokogiri::HTML(open(url))

puts doc
# 書籍名
puts doc.xpath("//span[@id='productTitle']").text
# 価格
puts doc.xpath("//span[@id='actualPriceValue']/b").text
# 画像イメージのURL
puts doc.xpath("//img[@id='prodImage']").attribute('src').text
