#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'open-uri'
require 'nokogiri'

atom = open('http://www.google.co.jp/trends/hottrends/atom/hourly')
doc = Nokogiri::HTML(atom)

doc.xpath('/html/body/feed/entry/content/li/span/a').each do |element|
  puts element.text
  puts element[:href]
end
