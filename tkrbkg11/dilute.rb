#!/usr/bin/env ruby
data, called_count = ARGF.read.split("\t")
called_count = called_count.to_i + 1

if $stdout.tty?
  probability = (ENV['D'].to_i | 20) * called_count
  puts data.chars.map { |c| rand(100) + 1 <= probability && c !~ /\s/ ? ' ' : c }.join
else
  puts "#{data}\t#{called_count}"
end
