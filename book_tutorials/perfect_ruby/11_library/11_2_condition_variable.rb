require 'thread'

class Bucket
  def initialize(limit = 5)
    @appendable = ConditionVariable.new
    @flushable  = ConditionVariable.new
    @lock = Mutex.new
    @limit = limit
    @out = ''
  end

  def append(str)
    @lock.synchronize {
      @appendable.wait(@lock) unless appendable?
      @out << str
      @flushable.signal if flushable?
    }
  end

  def flush
    @lock.synchronize {
      @flushable.wait(@lock) unless flushable?

      puts '-' * 10
      puts @out

      @out = ''
      @appendable.signal if appendable?
    }
  end

  private

  def appendable?
    @out.lines.count < @limit
  end

  def flushable?
    !appendable?
  end
end

bucket = Bucket.new
t1 = Thread.fork {
  25.times do |t|
    sleep rand
    bucket.append "line: #{t}\n"
  end
}

t2 = Thread.fork {
  5.times do
    bucket.flush
  end
}

[t1, t2].map(&:join)