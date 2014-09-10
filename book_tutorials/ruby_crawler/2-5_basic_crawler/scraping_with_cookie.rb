#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'anemone'
require 'nokogiri'
require 'kconv'

urls = []
urls.push('http://mixi.jp/home.pl?from=h_logo')

cookies = {
  _auid: '',
  emid: '',
  session: '',
  stamp: '',
  vntgsync: '1'
}

opts = {
  delay: 1,
  accept_cookies: true,
  cookies: cookies,
  depth_limit: 0
}

Anemone.crawl(urls, opts) do |anemone|
  anemone.on_every_page do |page|
    doc = Nokogiri::HTML.parse(page.body.toutf8)
    community_list = doc.xpath("//*[@id='communityList']/div[2]/table/tr/td")
    community_list.each { |community| puts community.content }
  end
end
