#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'multi_json'
require 'autopagerize'

Capybara.configure do |config|
  config.current_driver = :selenium
  config.app_host = 'http://www.amazon.co.jp/s/?url=search-alias%3Dstripbooks&field-keywords=ruby'
  config.default_wait_time = 20
end

module Crawler
  class LinkChecker
    include Capybara::DSL

    def initialize
      visit('')
      url = Capybara.app_host
      siteinfo = MultiJson.load(File.read('siteinfo.json'))
      @page = Autopagerize.new(url, siteinfo)
    end

    def get_nextlink
      page_number = 1
      @page.each do |page|
        visit(page.nextlink)
        save_screenshot("screenshot#{page_number}.png")
        page_number += 1
      end
    end
  end
end

crawler = Crawler::LinkChecker.new
crawler.get_nextlink
