#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'koala'

graph = Koala::Facebook::API.new('168663736493230|86DZmMoD-ie7BO0cqm1q-3HN4Bs')

search = graph.search('BRAVIA')
search.each do |result|
  puts result['message']
  who = graph.get_object(result['from']['id'].to_s)
  puts "性別: #{who['gender']}"
  puts "生年月日: #{who['birthday']}"
end
