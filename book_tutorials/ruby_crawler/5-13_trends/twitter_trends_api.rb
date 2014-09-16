#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'twitter'

config = {
  consumer_key: 'W7bPtOzwyFzcpaeqQAbLgerwr',
  consumer_secret: 'Oy59Ib8JYZZkKl0dm47mjivZMUN7TRl01f6Ci3fS6yTGpv4HWH',
  access_token: '1679956926-2ujtLvyqDuZK0slLBetxLrQP1bKLzHo976whxt9',
  access_token_secret: 'u1XIygWkiIVZDzWXLB0mayYfVfumef0pykAheU2pqf59R'
}

# 日本
place_id = 23424856
client = Twitter::REST::Client.new(config)
client.trends(place_id).each do |trend|
  puts trend.name
  puts trend.url
end
