# https://www.hackerrank.com/challenges/cipher/

def xor_window(window, elem)
  window.shift
  xored = window.push(elem).compact.reduce(:^)
  window[-1] = xored
  xored
end

n, k = gets.strip.split.map(&:to_i)
window = Array.new(k, nil)
gets.strip.split(//).map(&:to_i).each_with_index do |x, idx|
  break if idx >= n  
  print xor_window(window, x)
end
