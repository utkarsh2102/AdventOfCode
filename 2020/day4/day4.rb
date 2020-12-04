#!/usr/bin/ruby

arr = []
c = valid = 0

ARGF.each_line do |str|
  if str.chomp == ""
    c += 1
  else
    if arr[c].nil?
      arr << str.chomp
    else
      arr[c] << " " << str.chomp
    end
  end
end

0.upto arr.size-1 do |i|
  str = arr[i]
  keys = str.scan(/byr:|iyr:|eyr:|hgt:|hcl:|ecl:|pid:|cid:/)
  if keys.size == 8
    valid += 1
  elsif keys.size == 7 and !keys.include?("cid:")
    valid += 1
  else
    next
  end
end

puts valid
