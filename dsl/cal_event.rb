require 'date'
class CalEvent
  def initialize(title)
    @title = title
    @date = @start_time = @end_time = nil
  end

  def on(date)
    @date = Date.parse(date)
  end

  def starts(time)
    @start_time = time
  end

  def ends(time)
    @end_time = time
  end

  def show
    @every.generate.each do |date|
      puts "title #{@title}, on #{date}, starts #{@start_time}, ends #{@end_time}"
    end
  end
end

class Every
  def initialize(method)
    @method = method
    @wday = nil
  end

  def generate
    # 曜日の分だけ配列を作る
    ["2013-08-03", "2024-08-10"]
  end

  def wday(wday)
    @wday = wday
  end
end

def event(title, &block)
  cal = CalEvent.new(title)
  cal.instance_eval(&block)
  cal.show
end

def every(method, &block)
  @every = Every.new(method)
  @every.instance_eval(&block)
end

load File.expand_path(ARGV[0])
