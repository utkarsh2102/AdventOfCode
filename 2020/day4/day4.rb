#!/usr/bin/ruby

arr = []
c = valid = valid_res = 0

def part_two(str)
  byr = iyr = eyr = hgt = hcl = ecl = pid = 0

  byr_n = str.scan(/byr:\d+/)[0].split(':')[1].to_i unless str.scan(/byr:\d+/).empty?
  byr = 1 if (byr_n >= 1920) && (byr_n <= 2002)

  iyr_n = str.scan(/iyr:\d+/)[0].split(':')[1].to_i unless str.scan(/iyr:\d+/).empty?
  iyr = 1 if (iyr_n >= 2010) && (iyr_n <= 2020)

  eyr_n = str.scan(/eyr:\d+/)[0].split(':')[1].to_i unless str.scan(/eyr:\d+/).empty?
  eyr = 1 if (eyr_n >= 2020) && (eyr_n <= 2030)

  hgt_s = str.scan(/hgt:\w+/)[0].split(':')[1].scan(/[A-z]/).join('')
  hgt_n = str.scan(/hgt:\w+/)[0].split(':')[1].scan(/\d+/)[0].to_i
  if (hgt_s == 'cm') && (hgt_n >= 150) && (hgt_n <= 193)
    hgt = 1
  elsif (hgt_s == 'in') && (hgt_n >= 59) && (hgt_n <= 76)
    hgt = 1
  end

  hcl = 1 if !str.scan(/hcl:#\w+/).empty? && (str.scan(/hcl:#\w+/)[0].split(':#')[1].to_s.size == 6)

  ecl_s = str.scan(/ecl:\w+/)[0].split(':')[1].to_s unless str.scan(/ecl:\w+/).empty?
  ecl = 1 if %w[amb blu brn gry grn hzl oth].include?(ecl_s)

  pid = 1 if !str.scan(/pid:\d+/).empty? && (str.scan(/pid:\d+/)[0].split(':')[1].to_s.size == 9)

  # debugging
  # puts "byr=#{byr} iyr=#{iyr} eyr=#{eyr} hgt=#{hgt} hcl=#{hcl} elc=#{ecl} pid=#{pid}"

  # final check to see all conditions match
  return true if [byr, iyr, eyr, hgt, hcl, ecl, pid].all? { |i| i == 1 }
end

ARGF.each_line do |str|
  if str.chomp == ''
    c += 1
  else
    if arr[c].nil?
      arr << str.chomp
    else
      arr[c] << ' ' << str.chomp
    end
  end
end

0.upto arr.size - 1 do |i|
  str = arr[i]
  keys = str.scan(/byr:|iyr:|eyr:|hgt:|hcl:|ecl:|pid:|cid:/)
  if keys.size == 8
    valid += 1
    valid_res += 1 if part_two(str)
  elsif (keys.size == 7) && !keys.include?('cid:')
    valid += 1
    valid_res += 1 if part_two(str)
  else
    next
  end
end

puts valid
puts valid_res
