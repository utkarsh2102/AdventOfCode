#!/usr/bin/ruby

arr = File.read("input").split("\n").map(&:to_i)
arr.sort!

arr.unshift(0)
arr << arr.last + 3

# Part 1
j1 = j3 = 0

0.upto arr.size-2 do |i|
  if arr[i+1] - arr[i] == 1
    j1 += 1
  else
    j3 += 1
  end
end

p "Part 1: #{j1 * j3}"

# Part 2
pos = Hash.new(0)
pos[0] = 1

arr.each do |i|
  3.times do |j|
    pos[i] += pos[i-j-1]
  end
end

p "Part 2: #{pos.values.max}"
