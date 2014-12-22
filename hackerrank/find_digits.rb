# https://www.hackerrank.com/challenges/find-digits

gets.to_i.times do 
  n = gets
  digits = n.split(//).map(&:to_i)
  count = 0
  digits.each do |digit|
    next if digit == 0
    count += 1 if n.to_i % digit == 0
  end
  puts count
end
