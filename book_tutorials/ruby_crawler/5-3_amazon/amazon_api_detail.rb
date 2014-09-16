#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'amazon/ecs'

Amazon::Ecs.options = {
  associate_tag: '',
  AWS_access_key_id: '',
  AWS_secret_key: ''
}
opts = {
  response_group: 'Small, ItemAttributes, Images',
  country: 'jp'
}
res = Amazon::Ecs.item_lookup('4873111870', opts)

# 書籍名
puts res.items.first.get('ItemAttributes/Title')

# 価格
puts res.items.first.get('//FormattedPrice')

# 画像イメージのURL
puts res.items.first.get('MediumImage/URL')
