#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'nokogiri'
require 'open-uri'

class CompanyInfo
  def initialize(ticker_code)
    @base_url = 'http://stocks.finance.yahoo.co.jp/stocks'
    @ticker_code = ticker_code
    scrape
  end
  attr_reader :name, :ticker_code, :category, :unit,
    :recent_high_price, :recent_low_price, :high_price, :low_price, :price

  private

  def scrape
    get_company_info
    get_stock_info
  end

  def get_company_info
    url = "#{@base_url}/profile/?code=#{@ticker_code}"
    doc = get_nokogiri_doc(url)
    @name = doc.xpath("//th[@class='symbol']/h1").text
    @category = doc.xpath("//table[@class='boardFinCom marB6']/tr[6]/td").text
    @unit = doc.xpath("//table[@class='boardFinCom marB6']/tr[13]/td").text
  end

  def get_stock_info
    url = "#{@base_url}/detail/?code=#{@ticker_code}"
    doc = get_nokogiri_doc(url)
    @recent_high_price = doc.xpath("//div[11]/dl/dd[@class='ymuiEditLink mar0']/strong").text
    @recent_low_price = doc.xpath("//div[12]/dl/dd[@class='ymuiEditLink mar0']/strong").text
    @high_price = doc.xpath("//div[@class='innerDate']/div[3]/dl/dd[@class='ymuiEditLink mar0']/strong").text
    @low_price = doc.xpath("//div[@class='innerDate']/div[4]/dl/dd[@class='ymuiEditLink mar0']/strong").text
    @price = doc.xpath("//td[@class='stoksPrice']").text
  end

  def get_nokogiri_doc(url)
    begin
      html = open(url)
    rescue OpenURI::HTTPError
      return
    end
    Nokogiri::HTML(html.read, nil, 'UTF-8')
  end

  def scrape_stock_info(html, index)
    get_content(html, 'dd', 'ymuiEditLink mar0', index, '/strong').delete(',')
  end
end

company = CompanyInfo.new('4689')
puts company.name
puts company.category
puts company.unit
puts "年初来高値：#{company.recent_high_price}"
puts "年初来安値：#{company.recent_low_price}"
puts "高値：#{company.high_price}"
puts "安値：#{company.low_price}"
puts "株価：#{company.price}"
