require 'open-uri'

# require 'mecab'
require 'natto'
require 'nokogiri'

module Asahicom
  TOP_URL = 'http://www.asahi.com/'

  class MarkovChain
    MIN_TEXT_SIZE = 80
    MAX_TEXT_SIZE = 180

    def summarize_headline
      url = scrape_headline_top_url
      text = scrape_article_body(url)
      data = generate_mecab_tagger(text)

      result = ''
      loop do
        result = summarize(data)
        text_size = result.size
        break if text_size >= MIN_TEXT_SIZE && text_size <= MAX_TEXT_SIZE
      end
      puts result.gsub(/EOS$/, '')
    end

    private

    def scrape_headline_top_url
      doc = Nokogiri::HTML.parse(open(TOP_URL))
      sleep 1
      first_url = doc.css('.HeadlineTop a')[0][:href]
      URI.join(TOP_URL, first_url).to_s
    end

    def scrape_article_body(url)
      nokogiri = Nokogiri::HTML.parse(open(url))
      nokogiri.css('.ArticleText').text.tr("\n", '').gsub(/\A　/, '')
    end

    def generate_mecab_tagger(text)
      # mecab = MeCab::Tagger.new('-Owakati')
      mecab = Natto::MeCab.new('-Owakati')
      data = []
      mecab.parse(text + 'EOS').split(' ').each_cons(3) do |a|
        data.push(head: a[0], middle: a[1], end: a[2])
      end
      data
    end

    # マルコフ連鎖で要約
    def summarize(data)
      t1 = data[0][:head]
      t2 = data[0][:middle]
      new_text = t1 + t2
      loop do
        candidates = data.select { |d| d[:head] == t1 && d[:middle] == t2 }
        break if candidates.size == 0
        num = rand(candidates.size) # 乱数で次の文節を決定する
        new_text << candidates[num][:end]
        break if candidates[num][:end] == 'EOS'
        t1 = candidates[num][:middle]
        t2 = candidates[num][:end]
      end
      new_text
    end
  end
end

if $0 == __FILE__
  Asahicom::MarkovChain.new.summarize_headline
end
