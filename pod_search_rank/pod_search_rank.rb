#!/usr/bin/env ruby

require 'mechanize'

class PodSearchRank
  class Pod
    attr_accessor :name, :star_count, :fork_count, :has_github

    def initilaize
      @has_github = false
    end

    def score
      if @has_github
        @star_count + @fork_count * 5
      else
        0
      end
    end

    def to_a
      if @has_github
        [@name, score.to_s, @star_count.to_s, @fork_count.to_s]
      else
        [@name, '-', '-', '-', '-']
      end
    end
  end

  # name, score, star fork
  DEFAULT_RULED_LINE_SIZE = [40, 6, 5, 5]
  def initialize(keyword)
    @keyword = keyword
    @agent = Mechanize.new
  end

  def search
    pods = get_pods
    pods.sort!{ |x,y| [y.score, x.name.upcase] <=> [x.score, y.name.upcase] }
    render_header
    render_result(pods)
  end

  private
    def get_pods
      pods = []
      pod_search.each do |result|
        pod = Pod.new
        pod.name = result.lines[0].strip
        result.lines do |line|
          if line =~ /- Source:\s+(https?:\/\/.*)\.git/
            github_url = $1
            pod.star_count, pod.fork_count = scrape_social_score(github_url)
            pod.has_github = true
          end
        end
        pods << pod
      end
      pods
    end

    def pod_search
      pod_search_result = `pod search #{@keyword}`
      pods = pod_search_result.split(/\n{2,3}->/)
      pods.delete("")
      pods
    end

    def scrape_social_score(url)
      page = @agent.get(url)
      page.search(".social-count").map{ |elm| elm.text.strip.gsub(',', '').to_i }
    end

    def render_header
      f=DEFAULT_RULED_LINE_SIZE.dup
      fmt = "%-#{f[0]}s %#{f[1]}s %#{f[2]}s %#{f[3]}s"
      puts fmt % ['Name(Ver)', 'Score', 'Star', 'Fork']
      puts fmt % ['-'*f[0], '-'*f[1], '-'*f[2], '-'*f[3]]
    end

    def render_result(pods)
      f=DEFAULT_RULED_LINE_SIZE.dup
      fmt = "%-#{f[0]}s %#{f[1]}s %#{f[2]}s %#{f[3]}s"
      pods.each { |pod| puts fmt % pod.to_a }
    end
end

# TODO: 引数チェック
# class分割(model、render処理)
if __FILE__ == $0
  psr = PodSearchRank.new(ARGV[0])
  psr.search
end

