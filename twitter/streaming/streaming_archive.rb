#!/usr/bin/env ruby
require 'yaml'
require 'pp'

require 'mongo'
require 'twitter'

class StreamingArchive
  def initialize
    config = YAML.load_file('settings.yml')
    @client = Twitter::Streaming::Client.new(config['twitter'])

    db = Mongo::Connection.from_uri(config['mongodb']['url']).db(config['mongodb']['db'])
    @items = db.collection('tweets')
  end

  def archive
    @client.sample do |tweet|
      if tweet.is_a? Twitter::Tweet
        if tweet.lang == 'ja'
          # puts tweet.text if tweet.user.protected?
          # puts tweet.source
          # puts tweet.attrs
          @items.insert(tweet.attrs)
        end
      end
    end
  end
end

if $0 == __FILE__
  # StreamingArchive.new
  StreamingArchive.new.archive
end
