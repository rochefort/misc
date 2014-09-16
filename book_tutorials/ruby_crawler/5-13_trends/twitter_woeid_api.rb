#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'twitter'

config = {
  consumer_key: '',
  consumer_secret: '',
  access_token: '',
  access_token_secret: ''
}

client = Twitter::REST::Client.new(config)
client.trends_available.each { |available| puts available.id }
