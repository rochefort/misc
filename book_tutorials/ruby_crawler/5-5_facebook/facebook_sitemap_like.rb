#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'open-uri'
require 'rexml/document'
require 'json'

def get_xml_doc(url)
  REXML::Document.new(open(url))
end

base_url = 'http://rochefort.hatenablog.com/sitemap.xml'
sitemaps = get_xml_doc(base_url)
sitemaps.elements.each('sitemapindex/sitemap/loc') do |sitemap_elm|
  sitemap = get_xml_doc(sitemap_elm.text)
  sitemap.elements.each('urlset/url/loc/') do |element|
    response = open("http://graph.faceboo.com/#{element.text}").read
    json = JSON.parse(response)
    if json.key?('shares')
      puts json['id']
      puts "いいね: #{json['shares']}"
    end
  end
end
