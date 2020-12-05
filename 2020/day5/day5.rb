#!/usr/bin/ruby

highest = 0
seats = []

def halfify(arr, ltr)
  if (ltr == 'F') || (ltr == 'L')
    arr[0, arr.size / 2]
  else
    arr[(arr.size + 1) / 2..arr[-1]]
  end
end

ARGF.each_line do |str|
  rarr = (0..127).to_a
  carr = (0..7).to_a
  rows = str[0..6].to_s
  coul = str[7..9].to_s

  0.upto rows.size - 1 do |i|
    ltr = rows[i]
    rarr = halfify(rarr, ltr)
  end
  row = rarr[0]

  0.upto coul.size - 1 do |j|
    ltr = coul[j]
    carr = halfify(carr, ltr)
  end
  cou = carr[0]

  sid = row * 8 + cou
  seats << sid
  highest = sid if sid >= highest
end

seats.sort!
order = (seats[0]..seats[-1]).to_a

puts highest
p order - seats
