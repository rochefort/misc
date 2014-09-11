#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp'))
title_xpath = doc.xpath('/html/head/title')
title_css = doc.css('title')
objects = doc.xpath('//a')

puts title_xpath
puts title_css
puts objects
