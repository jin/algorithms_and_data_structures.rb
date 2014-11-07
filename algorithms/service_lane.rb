# Enter your code here. Read input from STDIN. Print output to STDOUT
# https://www.hackerrank.com/challenges/service-lane

length, num_test_cases = gets.strip.split(&:to_i)
width = gets.strip.split.map(&:to_i)
ARGF.each do |line|
  biggest = 3
  first, last = line.strip.split.map(&:to_i)
  width[first..last].each do |i|
    biggest = i if i <= biggest
  end
  puts biggest
end
