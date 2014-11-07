#!/usr/bin/ruby
def maxXor(l, r)
    arr = (l..r).to_a
    max_xor = 0

    while arr.length > 0
        x = arr.first
        arr.each do |y|
            xor = x ^ y
            max_xor = xor if xor > max_xor
        end
    arr.shift
    end

    max_xor
end

l = gets.to_i
r = gets.to_i
print maxXor(l, r)
