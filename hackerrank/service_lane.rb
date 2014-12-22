# Enter your code here. Read input from STDIN. Print output to STDOUT
# https://www.hackerrank.com/challenges/service-lane

num_test_cases = gets.strip.split.map(&:to_i).pop
width = gets.strip.split.map(&:to_i)
num_test_cases.times do
  first, last = gets.strip.split.map(&:to_i)
  puts width[first..last].min
end
