#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'json'
require 'uri'
require 'open-uri'

api_key = ''
custom_search_engine_id = ''
search_word = URI.encode('クローラー')
url = "https://www.googleapis.com/customsearch/v1?key=#{api_key}&cx=#{custom_search_engine_id}&q=#{search_word}"

json = JSON.load(open(url))
json['items'].each do |item|
  puts item['title']
  puts item['link']
end
