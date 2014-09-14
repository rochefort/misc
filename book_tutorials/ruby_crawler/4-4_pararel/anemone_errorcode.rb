#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'anemone'

urls = ['http://www.hatena.ne.jp/hogehogehogex']

opts = {
  obey_robots_txt: true,
  depth_limit: 1
}

Anemone.crawl(urls, opts) do |anemone|
  anemone.on_every_page do |page|
    puts page.url
    puts page.code
    raise "500 Error!: #{page.url.path}" if page.code == 500
  end
  anemone.after_crawl do |page|
    puts 'hoge'
  end
end
