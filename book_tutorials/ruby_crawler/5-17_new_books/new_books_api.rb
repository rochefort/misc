#!/usr/bin/evn ruby
# -*- coding: utf-8 -*-

require 'amazon/ecs'

Amazon::Ecs.options = {
  associate_tag: '',
  AWS_access_key_id: '',
  AWS_secret_key: ''
}
day = Time.now
opts = {
  operation: 'ItemSearch',
  search_index: 'Books',
  sort: 'daterank',
  country: 'jp',
  power: "pubdate:during #{day.month}-#{day.year}"
}
res = Amazon::Ecs.send_request(opts)
res.items.each do |item|
  puts item.get('ASIN')
  puts item.get('ItemAttributes/Title')
end
