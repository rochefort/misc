#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'open-uri'
require 'uri'

word = 'クラウド'
# 3年前
day = Time.now - 3 * 365 * 24 * 60 * 60
month = day.month
year = day.year

url = URI.encode("http://www.google.com/trends/fetchComponent?hl=en&q=#{word}&date=#{month}/#{year}+36m&cmpt=q&content=1&cid=TIMESERIES_GRAPH_0&export=5&w=500&h=330")

html = open(url)
raw_data_array = html.read.split("rows\":")[1].split('var htmlChart').first
split_raw = raw_data_array.split('],')
split_raw.each do |raw|
  source = raw.split('Date(')[1].split(',')
  date = source[0] + '-' + (source[1].gsub(/\s/, '').to_i + 1).to_s.gsub(/\)\}/, '')
  num = source[5]
  puts "#{date}, #{num}"
end
