#!/usr/bin/ruby

groups = File.read('input').split("\n\n")

# Another very nice way of taking inputs
# groups = File
#   .read('tmp')
#   .split("\n\n")
#   .map { |group| group.lines.map(&:chomp) }

# Part 1
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


# Part 2
p groups.sum { |group| group.split.map(&:chars).reduce(&:&).length }
