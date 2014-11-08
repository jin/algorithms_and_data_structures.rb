# https://www.hackerrank.com/challenges/pangrams/

def isPangram(s)
  letters = ('a'..'z').to_a
  s.each do |x|
    letters.delete(x)
    return 'pangram' if letters.empty?
  end
  'not pangram'
end

str = gets.strip.downcase.split(//)
puts isPangram(str)
