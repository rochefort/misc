#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp'))

nodeset = doc.xpath('//a')
puts nodeset.inner_text

nodeset.each do |element|
  puts element.inner_text
end
