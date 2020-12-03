#!/usr/bin/ruby

c = 0
marker = 0
hash = 0

ARGF.each_line do |i|
  c += 1
  if c == 1
    next
  end
  i = i.chomp.to_s * c
  # binding.irb
  # puts i
  marker += 3
  if i[marker] == "#"
    hash += 1
  end
end

puts hash
