#!/usr/bin/env ruby

# -*- coding: UTF-8 -*-
require 'anemone'
require 'mongo'

urls = ['http://www.yahoo.co.jp']

opts = {
  storage: Anemone::Storage::MongoDB(
    Mongo::Connection.new.db('crawler'), 'documents'),
}

Anemone.crawl(urls, opts) do |anemone|
  anemone.on_every_page do |page|
    puts page.url
    puts page.doc.xpath('//title/text()').to_s if page.doc
  end
end