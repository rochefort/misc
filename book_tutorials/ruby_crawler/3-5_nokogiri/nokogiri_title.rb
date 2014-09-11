#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp'))

nodeset = doc.xpath('//title')
puts nodeset.text
puts nodeset.inner_text
puts nodeset.first.inner_text

nodeset.each do |element|
  puts element.content
  puts element.text
  puts element.inner_text
end
