#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'open-uri'
require 'digest/sha1'

def crawler(url)
  hash_str = Digest::SHA1.hexdigest(url)
  path = "files/#{hash_str}"
  unless File.exist?(path)
    source = open(url).read
    open(path, 'w+b') { |f| f.write(source) }
  end
end

url = 'http://www.yahoo.co.jp/'
crawler(url)
