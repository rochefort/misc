#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# api_keyは redmine/my/account で取得してください
require 'net/http'

class RedmineTools
  REDMINE_URI = '192.168.1.10'

  def create_ticket(api_key, file)
    data = open(file).read
    header = {
      'Content-Length' => data.length.to_s,
      'Content-Type' => 'application/xml'
    }

    client = Net::HTTP.new(REDMINE_URI, 80)
    res = client.post("/issues.xml?key=#{api_key}", data, header)
    p res.body
  end
end

if $0 == __FILE__
  abort 'Usage: redmine_tools.rb your_api_key tpl_file' unless ARGV.size == 2
  RedmineTools.new.create_ticket(ARGV[0], ARGV[1])
end
