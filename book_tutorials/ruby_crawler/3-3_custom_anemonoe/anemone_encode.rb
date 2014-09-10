#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'anemone'

urls = ['http://www.amazon.co.jp/gp/bestsellers/books/466282']
urls << 'http://news.yahoo.co.jp'

Anemone.crawl(urls, depth_limit: 0) do |anemone|
  anemone.on_every_page do |page|
    # puts page
    puts page.doc.xpath('//title')
  end
end
