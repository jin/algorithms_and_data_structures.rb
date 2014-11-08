# https://www.hackerrank.com/challenges/pangrams/

str = gets.strip.downcase.split(//)
letters = ('a'..'z').to_a

str.each do |x|
  letters.delete(x)
end

puts letters.empty? ? 'pangram' : 'not pangram'
