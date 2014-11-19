# Week 12 Challenge #2
# https://www.hackerrank.com/contests/w12/challenges/chief-hopper/ 
#
# Given an array of numbers, choose a minimum starting value such that when iterating from left to right,
# 1) If left_val < right_val, curr_value - (right_val - left_val) must always >= 0
# 2) If left_val > right_val, curr_value += (left_val - right_val) 

gets
arr = gets.strip.split.map(&:to_i)
init = 0
found = false
until found do
  res = arr.inject(init) do |x, y|
    energy = x + (x - y)
    energy < 0 ? break : energy
  end || -1
  res >= 0 ? found = true : init += 1
end

puts init
