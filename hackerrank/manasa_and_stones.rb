# Find all possible summations of an array with n elements and each element is one of the two given integers, a and b.

gets.to_i.times do
  stones, a, b = gets.to_i, gets.to_i, gets.to_i
  a, b = b, a if b > a
  guesses = []
  stones.times do |i|
    guesses << a * i + b * (stones - i - 1)
  end
  puts guesses.uniq.join(' ')
end
