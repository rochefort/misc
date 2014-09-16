#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'amazon/ecs'

Amazon::Ecs.options = {
  associate_tag: 'rochefort-22',
  AWS_access_key_id: '',
  AWS_secret_key: ''
}
opts = {
  search_index: 'Books',
  country: 'jp'
}
res = Amazon::Ecs.item_search('クローラー', opts)
res.items.each { |item| puts item.get('ASIN') }
