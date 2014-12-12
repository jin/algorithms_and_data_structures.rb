# Solution for the maximum subarray problem (both contiguous and non-contiguous versions)
#
# Given a 1D integer array, find a contiguous and non-contiguous block of elements such that their sum is the maximum.

gets.to_i.times do
  n = gets.to_i
  ints = gets.split.map(&:to_i)
  max_non_contiguous_sum = 0
  max_contiguous_sum = 0 
  current_sum = 0
  smallest_negative = -10001
  ints.each do |i|
    max_non_contiguous_sum += i if i > 0
    smallest_negative = i if i > smallest_negative
    val = current_sum + i
    current_sum = val > 0 ? val : 0
    max_contiguous_sum = current_sum if current_sum > max_contiguous_sum
  end
  puts "#{max_contiguous_sum == 0 ? smallest_negative : max_contiguous_sum} #{max_non_contiguous_sum == 0 ? smallest_negative : max_non_contiguous_sum}"
end
