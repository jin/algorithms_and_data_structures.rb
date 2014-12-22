# https://www.hackerrank.com/challenges/icecream-parlor/
# Given an array of integers, find the indexes of the pair of integers which sum up to a given number.

gets.to_i.times do
  dollars = gets.to_i
  flavours = gets.to_i
  costs = gets.strip.split.map(&:to_i)
  diffs = {}
  costs.each_with_index do |cost, index|
    diff = dollars - cost
    if diffs.has_key? diff
      puts "#{diffs[diff]} #{index + 1}"
    else
      diffs[cost] = index + 1
    end
  end
end
