#!/usr/bin/env ruby

require 'mechanize'

class PodSearchRank
  attr_accessor :title, :star_count, :fork_count

  def initialize(keyword)
    @keyword = keyword
    @agent = Mechanize.new
  end

  def pod_search
    pod_search_result = `pod search #{@keyword}`
    pods = pod_search_result.split(/\n{2,3}->/)
    pods.delete("")
    pods.each do |pod|
      @title = pod.lines[0].strip
      pod.lines do |line|
        if line =~ /- Source:\s+(https?:\/\/.*)\.git/
          github_url = $1
          scrape_social_score(github_url)
        end
      end
      puts "#{@title} star: #{@star_count} fork: #{@fork_count}"
    end
  end

  def scrape_social_score(url)
    page = @agent.get(url)
    @star_count, @fork_count = page.search(".social-count").map(&:text).map(&:strip)
  end
end

# TODO: 引数チェック
# format
# sort
if __FILE__ == $0
  psr = PodSearchRank.new(ARGV[0])
  psr.pod_search
end

