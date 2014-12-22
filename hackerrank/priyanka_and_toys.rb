# week 12 challenge, problem 1
# https://www.hackerrank.com/contests/w12/challenges/priyanka-and-toys

gets
toys = gets.strip.split.map(&:to_i).sort
units, curr = 0, nil
toys.each { |w| curr, units = (curr.nil?) ? [w, units + 1] : (w <= curr + 4 ? [curr, units] : [w, units + 1]) }
puts units
