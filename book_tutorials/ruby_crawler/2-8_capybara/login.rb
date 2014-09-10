#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = 'https://affiliate.amazon.co.jp/'

module Crawler
  class Amazon
    include Capybara::DSL

    def login
      visit('/')
      fill_in 'username', with: ENV['username']
      fill_in 'password', with: ENV['password']
      click_button 'サインイン'
    end

    def portal
      # select('rochefort-22', from: 'idbox_store_id')
      select('昨日', from: 'preSelectedPeriod')
      first('.line-item-links').click_link('レポート全体を表示')
    end

    def report
      within(:xpath, "//*[@class='totals']") do
        # 発送済み商品
        puts '発送済商品合計' + all('td')[1].text

        # 売上
        puts '売上' + all('td')[2].text

        # 紹介料
        puts '紹介料' + all('td')[3].text
      end
    end
  end
end

Crawler::Amazon.new.tap do |crawler|
  crawler.login
  crawler.portal
  crawler.report
end
