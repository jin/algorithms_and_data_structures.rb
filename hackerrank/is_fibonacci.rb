def is_fib? num, fibs, first, second
  return [true, fibs, first, second] if fibs.has_key? num
  return [false, fibs, first, second] if second > num

  first, second = second, (first + second)
  fibs[second] = true
  is_fib? num, fibs, first, second
end

first, second = 0, 1
fibs = { 0 => true, 1 => true }

gets.strip.to_i.times do
  num = gets.strip.to_i
  is_fib, fibs, first, second = is_fib? num, fibs, first, second
  puts (is_fib ? "IsFibo" : "IsNotFibo")
end
