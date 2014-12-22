# https://www.hackerrank.com/challenges/alternating-characters/
# Determine the number of character deletions in a string such that no two consecutive characters are the same.

gets.to_i.times do
  str = gets.chomp
  point_idx, deletions = 0, 0
  1.upto(str.length - 1) do |i|
    if str[point_idx] == str[i]
      deletions += 1
    else
      point_idx = i
    end
  end
  puts deletions
end
