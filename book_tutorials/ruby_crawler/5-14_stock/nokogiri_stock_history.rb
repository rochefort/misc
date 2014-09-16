#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'nokogiri'
require 'open-uri'

def get_nokogiri_doc(url)
  begin
    html = open(url)
  rescue OpenURI::HTTPError
    return
  end
  Nokogiri::HTML(html.read, nil, 'UTF-8')
end

def has_next_page?(doc)
  doc.xpath("//*[@id='main']/ul/a").any? { |element| element.text == '次へ' }
end

def get_daily_data(doc)
  doc.xpath("//table[@class='boardFin yjSt marB6']/tr").each do |element|
    if element.children[0].text != '日付' &&
       element.children[1][:class] = 'through' &&
       element.children.size > 6

       # 日付
       day = element.children[0].text
       # 始値
       open_price = element.children[1].text
       # 高値
       high_price = element.children[2].text
       # 低値
       low_price = element.children[3].text
       # 終値
       closing_price = element.children[4].text
       # 出来高
       volume = element.children[5].text.gsub(',', '')

       puts [day, open_price, high_price, low_price, closing_price, volume].join(',')
    end
  end
end

code = '4689'
day = Time.now
ey = day.year
em = day.month
ed = day.day

start_url = "http://info.finance.yahoo.co.jp/history/?sy=1900&sm=1&sd=1&ey=#{ey}&em=#{em}&ed=#{ed}&tm=d&code=#{code}"
num = 1
puts '日付,始値,高値,安値,終値,出来高'
loop do
  url = "#{start_url}&p=#{num}"
  doc = get_nokogiri_doc(url)
  get_daily_data(doc)
  break unless has_next_page?(doc)
  num += 1
end
