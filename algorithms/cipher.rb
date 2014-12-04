# https://www.hackerrank.com/challenges/cipher/

n, k = gets.strip.split.map(&:to_i)
answer_arr = Array.new(n, 0)
prev_plaintext_bit, to_discard = 0, 0
gets.strip.split(//).map(&:to_i).each_with_index do |curr_cipher_bit, idx|
  break if idx >= n  
  if idx < k
    prev_plaintext_bit = curr_cipher_bit ^ prev_plaintext_bit
  else
  end
  to_discard = prev_plaintext_bit if idx == 0
  print prev_plaintext_bit
end
