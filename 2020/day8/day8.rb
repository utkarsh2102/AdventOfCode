#!/usr/bin/ruby

arr = File.read('input')
             .split("\n")

acc = 0
i = 0
visited = []

loop do
  if arr[i].nil? or arr[i].chomp == "" or visited.include?(i)
    break
  else
    visited << i
    ins = arr[i][0..2]
    if ins == "nop"
      i += 1
    else
      op = arr[i][4]
      val = arr[i].chomp.split(op)[1].to_i

      if ins == "acc"
        if op == "+"
          acc += val
        else
          acc -= val
        end
        i += 1
      else
        if op == "+"
          i += val
        else
          i -= val
        end
      end
    end
  end
end

p acc
