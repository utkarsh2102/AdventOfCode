#!/usr/bin/ruby

c = 0
mr1d1 = mr3d1 = mr5d1 = mr7d1 = mr1d2 = 0
hr1d1 = hr3d1 = hr5d1 = hr7d1 = hr1d2 = 0

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

  # for right 1, down 1
  r1d1 = count_hash(i, mr1d1 += 1)
  hr1d1 += 1 if r1d1 == "+"

  # for right 3, down 1
  r3d1 = count_hash(i, mr3d1 += 3)
  hr3d1 += 1 if r3d1 == "+"

  # for right 5, down 1
  r5d1 = count_hash(i, mr5d1 += 5)
  hr5d1 += 1 if r5d1 == "+"

  # for right 7, down 1
  r7d1 = count_hash(i, mr7d1 += 7)
  hr7d1 += 1 if r7d1 == "+"

  # for right 1, down 1
  if c > 2 and c.odd?
    r1d2 = count_hash(i, mr1d2 += 1)
    hr1d2 += 1 if r1d2 == "+"
  end
end

puts hr3d1
puts hr1d1 * hr3d1 * hr5d1 * hr7d1 * hr1d2
