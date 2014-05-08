# coding: utf-8
require 'mechanize'

module Hatena
  module Blog
    class Stat
      def initialize(url)
        @agent = Mechanize.new
        @url = url
        @categories = nil
      end

      def show
        @categories ||= scrape_categories
        puts @url
        puts "number of categories              : %5d" % @categories.size
        puts "number of articles linked category: %5d" % @categories.values.inject(&:+)
        puts 'top 5% categories                 :'
        show_top5_percent_categories
        puts '-' * 80
        show_distribution_by_category
      end

      # カテゴリ毎の分布を表示
      def show_distribution_by_category()
        @categories ||= scrape_categories
        draw_distribution
      end

      private
        def scrape_categories
          page = @agent.get(@url)
          category_elms = page.search(".hatena-module-category ul li a")
          elm_to_hash(category_elms)
        end

        def elm_to_hash(category_elms)
          categories = {}
          category_elms.map do |c|
            if c.text.strip.match(/(.+) \((\d+)\)/)
              categories[$1] = $2.to_i
            end
          end
          categories
        end

        def draw_distribution
          max_scale = @categories.values.max / 10

          distribution = {}
          (0..max_scale).step do |n|
            distribution[n] = @categories.values.select {|x| x >= n*10 && x < (n+1)*10}.size
          end
          distribution.reverse_each do |k,v|
            output = "% 4d|" % (k.to_i * 10)
            output << '*' * v
            output << "(#{v})" if v > 0
            puts output
          end
        end

        def show_top5_percent_categories
          top5_num = (@categories.size * 0.05).floor
          top_categories = @categories.sort_by{|k,v| v}.reverse[0,top5_num]
          max_key_size = 0
          top_categories.each do |k,v|
            key_size = k.ascii_only? ? k.size : k.size * 2
            max_key_size = [max_key_size, key_size].max
          end
          top_categories.each do |k,v|
            if k.ascii_only?
              puts "  #{k.ljust(max_key_size)}: %5d" % v
            else
              spaces = ' '*(max_key_size - k.size * 2)
              puts "  #{k}#{spaces}: %5d" % v
            end
          end
        end
    end
  end
end

if $0 == __FILE__
  hb = Hatena::Blog::Stat.new('http://rochefort.hatenablog.com/')
  # hb.show_distribution_by_category
  hb.show
end
