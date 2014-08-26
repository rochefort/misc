#!/usr/bin/env ruby
require 'cgi'

def parse(page_source)
  dates = page_source.scan(%r!(\d+)年 ?(\d+)月 ?(\d+)日<br />!)
  url_titles = page_source.scan(%r!^<a href="(.+?)">(.+?)</a><br />!)
  url_titles.zip(dates).map do |(aurl, atitle), ymd|
    [CGI.unescapeHTML(aurl), CGI.unescapeHTML(atitle), Time.local(*ymd)]
  end
end

def format_text(title, url, url_title_time_ary)
  s = "Title: #{title}\nURL: #{url}\n\n"
  url_title_time_ary.each do |aurl, atitle, atime|
    s << "* (#{atime})#{atitle}\n"
    s << "  #{aurl}"
  end
end

# x = parse(open('samplepage.html', &:read))
# puts parse(`wget -q -O- http://crawler.sbcr.jp/samplepage.html`)
puts format_text(
  'WWW.SBCR.JP トピックス',
  'http://crawler.sbcr.jp/samplepage.html',
  parse(`wget -q -O- http://crawler.sbcr.jp/samplepage.html`)
)
