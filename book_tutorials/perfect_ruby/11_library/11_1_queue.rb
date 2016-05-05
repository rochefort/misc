require 'thread'

queue = Queue.new

workers = 3.times.map do |t|
  Thread.fork do
    while req = queue.deq
      puts "Worker#{t} processing.."
      req.call
    end
  end
end

10.times do |t|
  queue.enq -> {
    sleep 1
  }
end

sleep 1 until queue.empty?

p workers.map(&:status)
p

3.times do |t|
  queue.enq -> {
    sleep 1
  }
end

p workers.map(&:status)

sleep 1 until queue.empty?

