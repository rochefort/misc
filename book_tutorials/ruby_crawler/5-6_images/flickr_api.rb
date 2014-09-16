#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'flickraw'

FlickRaw.api_key = ''
FlickRaw.shared_secret = ''

tag = 'cat'
images = flickr.photos.search(tags: tag, sort: 'relevance', per_page: 20)
images.each do |image|
  url = FlickRaw.url image
  puts url
end
