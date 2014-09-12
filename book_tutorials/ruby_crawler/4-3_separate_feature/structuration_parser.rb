#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'nokogiri'
require 'filelutils'

def parser(file)
  doc = Nokogiri::HTML(open(file))
  puts doc.title
end

def get_file_list(target, parsed)
  puts target
  Dir.glob("#{target}/*").each do |file|
    parser(file)
    FileUtils.mv(file, parsed)
  end
end

get_file_list('files', 'parsed')
