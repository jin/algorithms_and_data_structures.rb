#!/bin/ruby
def lonelyinteger(a)
  a.inject(:^)
end
a = gets.strip.to_i
b = gets.strip.split(" ").map! {|i| i.to_i}
print lonelyinteger(b)
