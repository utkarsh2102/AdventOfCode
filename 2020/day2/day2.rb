#!/usr/bin/ruby

counter_part1 = 0
counter_part2 = 0

ARGF.each_line do |i|
  str = i.chomp.to_s
  low = str.partition('-')[0].to_i
  high = str.partition('-')[2].partition(' ')[0].to_i
  key = str.partition(':')[0].partition(' ')[2].to_s
  passwd = str.partition(': ')[2].to_s

  # Part 1
  count = passwd.count(key)
  counter_part1 += 1 if (count >= low) && (count <= high)

  # Part 2
  flag = 0
  flag += 1 if passwd[low - 1] == key
  flag += 1 if passwd[high - 1] == key
  counter_part2 += 1 if flag == 1
end

puts counter_part1
puts counter_part2
