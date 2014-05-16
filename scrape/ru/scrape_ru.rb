#!/usr/bin/env ruby

require 'fileutils'
require 'mechanize'

class Ru
  URL = 'http://www.ntv.co.jp/anothersky/fashion/'

  def initialize
    @agent = Mechanize.new
    FileUtils.mkdir_p('img')
    Dir.chdir('img')
  end

  def scrape(url=URL)
    puts "scraping url: #{url}"
    result = @agent.get(url)

    image_elms = result.search('.img img')
    image_elms.each do |elm|
      image_url = elm.attr('src')
      puts "  image: #{image_url}"
      @agent.get(image_url).save
    end

    next_elm = result.search('.pageNavi span a.link_next')
    return if next_elm.size.zero?
    next_url = next_elm.attr('href').value
    scrape(next_url)
  end
end


if $0 == __FILE__
  Ru.new.scrape
end
