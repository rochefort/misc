#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'open-uri'

CATEGORIES = %w(6021 6016 6022 6017 6014 6007 6006 6008 6004 6005 6001 6010 6009 6000 6015 6018 6013 6011 6020 6002 6012 6003 36)
POP_IDS = %w(27 30 38 44 47 46)
BASE_URL = 'https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTop?'
USER_AGENT = "iTunes/11.2.1 (Macintosh; OS X 10.9.2)AppleWebKit/537.74.9\r\n"
STORE = '143462-9'

def get_url(category, pop_id)
  "#{BASE_URL}genreId=#{category}&popId=#{pop_id}"
end

def get_ranks(url)
  i = 0
  open(url, 'User-Agent' => USER_AGENT, 'X-Apple-Store-Front' => STORE) do |f|
    f.each do |line|
      next if !line.match(/Buy.*salableAdamId=(\d+)/)
      i += 1
      line.match(/itemName="([^"]+)"/)
      puts "#{i}: #{$1}"
    end
  end
end

CATEGORIES.each do |category|
  POP_IDS.each do |pop_id|
    puts "category=#{category}, popId=#{pop_id}"
    url = get_url(category, pop_id)
    get_ranks(url)
  end
end
puts open(url, 'User-Agent' => user_agent).read
