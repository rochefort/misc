#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'parallel'
require 'nokogiri'
require 'open-uri'

urls = [
  'http://www.amazon.co.jp/gp/bestsellers/books/466284/',
  'http://www.amazon.co.jp/gp/bestsellers/books/571582/',
  'http://www.amazon.co.jp/gp/bestsellers/books/492152/',
  'http://www.amazon.co.jp/gp/bestsellers/books/466286/',
  'http://www.amazon.co.jp/gp/bestsellers/books/466282/',
  'http://www.amazon.co.jp/gp/bestsellers/books/492054/',
  'http://www.amazon.co.jp/gp/bestsellers/books/466290/',
  'http://www.amazon.co.jp/gp/bestsellers/books/492166/',
  'http://www.amazon.co.jp/gp/bestsellers/books/466298/',
  'http://www.amazon.co.jp/gp/bestsellers/books/466294/'
]

Parallel.each(urls, in_threads: 10) do |url|
  doc = Nokogiri::HTML(open(url).read.encode('UTF-8'))
  puts doc.title
end
