#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'open-uri'
require 'nokogiri'
require 'erb'

search_word = ERB::Util.u('クローラー')
url = "http://www.amazon.co.jp/s/ref=nb_sb_noss?url=search-alias%3Dstripbooks&field-keywords=#{search_word}"

doc = Nokogiri::HTML(open(url))
doc.xpath("//h3[@class='newaps']/a").each do |item|
  puts item[:href].match(%r{dp/(.+)})[1]
end
