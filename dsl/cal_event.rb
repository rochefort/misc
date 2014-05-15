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
    puts "title #{@title}, on #{@date}, starts #{@start_time}, ends #{@end_time}"
  end
end

def event(title, &block)
  cal = CalEvent.new(title)
  cal.instance_eval(&block)
  cal.show
end


load File.expand_path(ARGV[0])
