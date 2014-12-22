# https://www.hackerrank.com/challenges/closest-numbers
# Given a list of numbers, find pairs of numbers with the smallest difference between them. If there are multiple pairs, print all.

gets
arr = gets.strip.split.map(&:to_i)
smallest = 2 ** 32
answer = []
arr.sort.each_cons(2) do |x, y|
  diff = (x - y).abs
  if diff < smallest
    smallest = diff
    answer = [[x, y]]
  elsif diff == smallest
    answer << [x, y]
  end
end

puts answer.flatten.join(' ')
