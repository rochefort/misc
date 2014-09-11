#!/usr/bin/env ruby

require 'anemone'

Anemone.crawl('http://www.yahoo.co.jp') do |anemone|
  anemone.skip_links_like /\/r\//
  anemone.on_every_page do |page|
    puts page.url
  end
end