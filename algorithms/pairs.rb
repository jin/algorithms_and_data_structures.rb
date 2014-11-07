#!/bin/ruby
# Head ends here
def pairs(a,k) 
  count = 0
  while a.length > 0 
    x = a.shift
    a.each do |y|
      count += 1 if (x - y).abs == k
    end
  end
  count
end
# Tail starts here
a = gets.strip.split(" ").map! {|i| i.to_i}
b_size=a[0]
k=a[1]
b = gets.strip.split(" ").map! {|i| i.to_i}
puts pairs(b,k)
