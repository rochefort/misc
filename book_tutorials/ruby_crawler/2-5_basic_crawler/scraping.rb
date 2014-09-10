#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'anemone'
require 'nokogiri'
require 'kconv'

urls = [
  'http://www.amazon.co.jp/gp/bestsellers/books/466282/ref=zg_bs_nav_b_1_b/376-3058809-8761752',
  'http://www.amazon.co.jp/gp/bestsellers/books/466298/ref=zg_bs_nav_b_1_b/376-3058809-8761752',
  'http://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/ref=zg_bs_nav_kinc_2_2275256051/378-1487165-0267040',
  'http://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/ref=zg_bs_unv_kinc_3_2292053051_1'
]

Anemone.crawl(urls, depth_limit: 0) do |anemone|
  anemone.on_every_page do |page|
    doc = Nokogiri::HTML.parse(page.body.toutf8)
    category = doc.xpath("//*[@id='zg_browseRoot']/ul/li/a").text
    sub_category = doc.xpath("//*[@id='zg_listTitle']/span").text
    puts category + '/' + sub_category
  end
end
