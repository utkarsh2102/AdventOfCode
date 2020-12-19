#!/usr/bin/ruby

arr = File.read("input").split("\n").map(&:to_i)

preamble = 25
new_arr = arr[0, preamble]
invalid = 0

# Part 1
(preamble-1).upto arr.size-1 do |i|
  tmp = []
  new_arr.permutation(2).each { |j| tmp << j.sum }

  if !tmp.include?(arr[i+1])
    invalid = arr[i+1]
    break
  end

  new_arr.shift
  new_arr.append(arr[i+1])
end

p "Part 1: #{invalid}"
