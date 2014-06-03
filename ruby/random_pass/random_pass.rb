#!/usr/bin/env ruby
require 'optparse'

class RandomPass
  def self.generate(digit)
    digit = 8 if digit == 0
    numbers = [*0..9]
    capital_alpahabets = [*'A'..'Z']
    small_alphabets = [*'a'..'z']

    pass = []
    pass << numbers.sample
    pass << capital_alpahabets.sample
    pass << small_alphabets.sample
    pass += (numbers + capital_alpahabets + small_alphabets).sample(digit - 3)

    pass.shuffle.join
  end
end

if $0 == __FILE__
  opt = OptionParser.new
  opts = {}
  opt.on('-n <numbers of password>') { |v| opts[:n] = (v || 1).to_i }
  opt.on('-d <digits of password>')  { |v| opts[:d] = v.to_i }
  opt.parse!(ARGV)

  opts[:n].times do
    puts RandomPass.generate(opts[:d])
  end
end
