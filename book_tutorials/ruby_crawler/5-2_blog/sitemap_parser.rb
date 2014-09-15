#!/usr/bin/env/ruby
# -*- coding: utf-8 -*-

require 'open-uri'
require 'rexml/document'

def get_xml_doc(url)
  REXML::Document.new(open(url))
end

base_url = 'http://blog.livedoor.jp/staff/sitemap.xml'
sitemaps = get_xml_doc(base_url)
sitemaps.elements.each('sitemapindex/sitemap/loc') do |loc|
  sitemap = get_xml_doc(loc.text)
  sitemap.elements.each('urlset/url/loc/') do |element|
    if %r{/staff/archives/(\d+)\.html} =~ element.text
      puts element.text
    end
  end
end
