#!/usr/bih/env ruby -w
# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'
require 'erb'

doc = Nokogiri::HTML(open("https://twitter.com/search?f=realtime&q=#{ERB::Util.u('クローラー')}&src=typd"))
doc.xpath("//li[@data-item-type='tweet']").each do |tweet|
  # Tweet時間
  puts Time.at(tweet.xpath(".//a[@class='tweet-timestamp js-permalink js-nav js-tooltip']/span").first['data-time'].to_i)

  # Tweet本文
  puts tweet.xpath(".//p[@class='js-tweet-text tweet-text']").text
end
