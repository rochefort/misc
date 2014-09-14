#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'nokogiri'
require 'open-uri'

urls = ['http://www.yahoo.co.jp']

nokogiri_options = {
  read_timeout: 5
}

urls.each do |url|
  html = open(url, nokogiri_options)
  doc = Nokogiri::HTML(html)
  puts doc.title
  puts url
end
