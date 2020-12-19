#!/usr/bin/ruby

arr = File.read('input')
          .split("\n")

# Part 1
acc = i = 0
visited = []

loop do
  if arr[i].nil? || (arr[i].chomp == '') || visited.include?(i)
    break
  else
    visited << i
    ins = arr[i][0..2]
    if ins == 'nop'
      i += 1
    else
      op = arr[i][4]
      val = arr[i].chomp.split(op)[1].to_i

      if ins == 'acc'
        acc += val if op == '+'
        acc -= val if op == '-'
        i += 1
      else
        i += val if op == '+'
        i -= val if op == '-'
      end
    end
  end
end

p "Part 1: #{acc}"

# Part 2
0.upto arr.size - 1 do |j|
  if arr[j][0..2] == 'acc'
    next
  else
    tmp = arr.map(&:clone)

    if tmp[j][0..2] == 'jmp'
      tmp[j].gsub!('jmp', 'nop')
    else
      tmp[j].gsub!('nop', 'jmp')
    end

    acc = i = 0
    visited = []

    loop do
      if tmp[i].nil? || (tmp[i].chomp == '') || visited.include?(i)
        break
      else
        visited << i
        ins = tmp[i][0..2]
        if ins == 'nop'
          i += 1
        else
          op = tmp[i][4]
          val = tmp[i].chomp.split(op)[1].to_i

          if ins == 'acc'
            acc += val if op == '+'
            acc -= val if op == '-'
            i += 1
          else
            i += val if op == '+'
            i -= val if op == '-'
          end
        end
      end
    end

    p "Part 2: #{acc}" if visited.include?(tmp.size - 1)
  end
end
