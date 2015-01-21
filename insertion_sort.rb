#!/usr/bin/env ruby

def insertion_sort ary
  1.upto(ary.count - 1) do |j|
    elem = ary[j]
    i = j - 1

    # insertion process
    while i > 0 && ary[i] > elem
      ary[i + 1] = ary[i]
      i -= 1
    end
    ary[i + 1] = elem
  end
  ary
end

ary = (1..10).to_a.shuffle
ary # => [1, 6, 4, 3, 9, 2, 8, 10, 7, 5]
insertion_sort ary # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
