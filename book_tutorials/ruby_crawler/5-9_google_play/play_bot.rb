#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'market_bot'

lb = MarketBot::Android::Leaderboard.new(:topselling_free, :game)
lb.update

lb.results.each do |result|
  app = MarketBot::Android::App.new(result[:market_id])
  app.update
  puts "#{app.title} price: #{app.price}"
end
