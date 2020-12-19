#!/usr/bin/ruby

arr = File.read('input').split("\n").map(&:to_i)

preamble = 25
new_arr = arr[0, preamble]
index = invalid = 0

# Part 1
(preamble - 1).upto arr.size - 1 do |i|
  tmp = []
  new_arr.permutation(2).each { |j| tmp << j.sum }

  unless tmp.include?(arr[i + 1])
    index = i + 1
    invalid = arr[i + 1]
    break
  end

  new_arr.shift
  new_arr.append(arr[i + 1])
end

p "Part 1: #{invalid}"

# Part 2
new_arr = arr[0, index].reverse

0.upto new_arr.size - 1 do |i|
  tmp = []
  diff = invalid
  i.upto new_arr.size - 1 do |j|
    tmp << new_arr[j]
    diff -= new_arr[j]
    if diff.negative?
      break
    elsif diff.zero?
      p "Part 2: #{tmp.min + tmp.max}"
      break
    else
      next
    end
  end
end
