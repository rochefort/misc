#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'nokogiri'
require 'net/http'

if ARGV.size == 1
  number = ARGV[0]
else
  puts 'Input slip number'
  exit 1
end

# Net::HTTP.version_1_2
url = 'toi.kuronekoyamato.co.jp'
html = nil
Net::HTTP.start(url, 80) do |http|
  response = http.post('/cgi-bin/tneko', "number01=#{number}")
  html = response.body
end
exit unless html

html.encode!('UTF-8', 'Shift_JIS')
doc = Nokogiri::HTML(html) if html

doc.xpath("//table[@class='ichiran']/tr[3]").each do |element|
  day = element.xpath(".//*[@class='hiduke']/font").text
  status = element.xpath(".//*[@class='ct']/font").text
  puts day
  puts status
end
