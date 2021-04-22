#!/usr/bin/ruby

arr = File.read("tmp").split("\n").map(&:chomp)

x, y = 0, 0
face = [1, 0]  # we're facing east, initially

arr.each do |line|
  dir, val = line.match(/(\w)(\d+)/).captures
  val = val.to_i

  case dir
  when "N"
    y -= val
  when "E"
    x += val
  when "S"
    y += val
  when "W"
    x -= val
  when "L"
    face = 
  end
end

