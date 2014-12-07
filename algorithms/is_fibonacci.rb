def is_fib? num
  loop do
    return true if $fibs.has_key? num
    $first, $second = $second, ($first + $second)
    $fibs[$second] = true
    return true if num == $second
    return false if $second > num
  end
end

$first, $second = 0, 1
$fibs = {0 => true, 1 => true}
gets.strip.to_i.times do 
  num = gets.strip.to_i
  is_fib?(num) ? puts("IsFibo"): puts("IsNotFibo")
end
