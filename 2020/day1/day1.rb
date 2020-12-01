#!/usr/bin/ruby

list = Array.new

ARGF.each do |i|
 list << i.to_i
end

# Part 1
list.uniq.combination(2).detect { |x, y| puts x * y if x + y == 2020 }

# Part 2
list.uniq.combination(3).detect { |x, y, z| puts x * y * z if x + y + z == 2020 }
