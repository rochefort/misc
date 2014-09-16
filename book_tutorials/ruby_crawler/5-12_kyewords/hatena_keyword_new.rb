#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'
require 'date'

# COOKIE = 'rk=bd27157592563b6d738f5609ca04069ed2566dfc'

def get_nokogiri_doc(url)
  begin
    html = open(url)
    # html = open(url, "Cookie" => COOKIE)
  rescue
    return
  end
  Nokogiri::HTML(html.read)
end

def has_next_page?(doc)
  doc.xpath("//*[@id='main']/div/div[2]/a").any? { |element| element.text == '次の20件>' }
end

start_url = 'http://d.hatena.ne.jp/keywordlist?s=created&r=1'
num = 0
loop do
  url = "#{start_url}&of=#{num}"
  doc = get_nokogiri_doc(url)
  doc.xpath("//div[@class='keyword-list']/ul/li").each do |element|
    created = element.xpath("div/span[@class='created']/span").text
    day = Date.parse(created)
    exit if (Date.today - day).to_i >= 1
    puts element.xpath('h3/a').text
  end
  num += 20
  break unless has_next_page?(doc)
end
