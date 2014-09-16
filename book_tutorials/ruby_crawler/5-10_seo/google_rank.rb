#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'google-search'

def find_item(uri, query)
  search = Google::Search::Web.new do |s|
    s.query = query
    s.size = :large
    s.each_response { print '.'; $stdout.flush }
  end
  puts uri
  search.find { |item| item.uri =~ uri }
end

def rank_for(domain, query)
  print '%35s ' % query
  item = find_item(/#{domain}/, query)
  if item
    puts '#%d' % (item.index + 1)
  else
    puts ' Not found'
  end
end

reqular_expression_domain = 'takuros\.net'
target_word = 'ruby クローラー'
rank_for(reqular_expression_domain, target_word)
