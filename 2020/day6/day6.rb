#!/usr/bin/ruby

arr = []
count = 0

ARGF.each_line do |str|
  if str.chomp == ''
    count += arr.size
    arr = []
  else
    for i in str.chomp.split("")
      if !arr.include?(i)
        arr << i
      end
    end
  end
end

puts count + arr.size
