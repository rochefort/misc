class Stock
  def initialize
    @status = "available"
    @mutex = Mutex.new
  end

  def available?
    @status == "available"
  end

  def sell
    @mutex.synchronize do
      return unless available?
      puts "sold!"
      @status = "sold"
    end
  end
end

# sigle thread
# stock = Stock.new
# stock.sell
# stock.sell

# multi threads
stock = Stock.new
threads = Array.new(5) do
  Thread.new do
    stock.sell
  end
end
threads.each(&:join)
