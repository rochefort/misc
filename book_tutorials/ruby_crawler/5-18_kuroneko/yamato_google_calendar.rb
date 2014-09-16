#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'nokogiri'
require 'net/http'
require 'google_calendar'

if ARGV.size == 1
  number = ARGV[0]
else
  puts 'Input slip number'
  exit 1
end

def set_google_calendar(number, status, day)
  cal = Google::Calendar.new(
    username: '',
    password: '',
    app_name: 'mycompany.com-googlecalendar-integration'
  )
  today = Time.now
  month, day_of_month = day.split('/')
  date = Time.local(today.year, month, day_of_month, 12, 0, 0)
  event = cal.create_event do |e|
    e.title = "ヤマト配送：#{number}/#{status}"
    e.start_time = date
    e.end_time = date
  end
  puts event
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
  set_google_calendar
end
