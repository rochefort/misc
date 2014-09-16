#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'nokogiri'
require 'open-uri'
require 'uri'
require 'cgi'

def save_image(url)
  puts url
  filename = File.basename(url)
  open("files/#{filename}", 'wb') do |file|
    open(url) { |data| file.write(data.read) }
  end
end

search_word = URI.encode('cat')
doc = Nokogiri::HTML(open("https://www.flickr.com/search/?text=#{search_word}"))
doc.xpath("//a[@class='rapidnofollow photo-click']/img").each do |link|
  url = link['data-defer-src']
  save_image(url)
  big_url = url.gsub('.jpg', '_b.jpg')
  save_image(big_url)
end
