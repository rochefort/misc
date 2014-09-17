#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'open-uri'
require 'rexml/document'

STATISTICS_API = ''
xml = open("http://statdb.nstac.go.jp/api/1.0b/app/getStatsList?appId=#{STATISTICS_API}")
doc = REXML::Document.new(xml)

doc.elements.each('GET_STATS_LIST/DATALIST_INF/LIST_INF') do |element|
  puts "ID:#{element.attributes['id']}"
  puts "統計名：#{element.elements['STATISTICS_NAME'].text}"
  puts "タイトル:#{element.elements['TITLE']}.text"
end
