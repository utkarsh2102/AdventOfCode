#!/usr/bin/ruby

c = 0
mr3d1 = 0
hr3d1 = 0

def count_hash(i, marker)
  if i[marker] == "#"
    return "+"
  else
    return "-"
  end
end

ARGF.each_line do |i|
  c += 1
  next if c == 1
  i = i.chomp.to_s * c

  # for right 3, down 1
  r3d1 = count_hash(i, mr3d1 += 3)
  hr3d1 += 1 if r3d1 == "+"
end

puts hr3d1
