# https://www.hackerrank.com/challenges/countingsort1/

a = Array.new(100, 0)
gets
gets.strip.split.map(&:to_i).each { |x| a[x] += 1 }
a.each { |x| print "#{x} " }
