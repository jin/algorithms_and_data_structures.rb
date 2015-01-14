#!/usr/bin/env ruby

def heapsort ary
  raise "Input must be an Array" unless ary.class == Array
  ary = heapify ary
  curr_idx = ary.length - 1

  # n iterations
  until curr_idx <= 0
    ary[0], ary[curr_idx] = ary[curr_idx], ary[0]
    curr_idx -= 1
    ary = sift_down ary, 0, curr_idx
  end

  ary
end

# Given an unsorted array, transform it into heap form
def heapify ary
  ((ary.length - 2) / 2).downto(0) { |start_idx| ary = sift_down ary, start_idx, ary.length - 1 }
  ary
end

# time complexity: O(log n)
def sift_down ary, start_idx, end_idx 
  root_idx = start_idx

  while (root_idx * 2) + 1 <= end_idx 
    child_idx = root_idx * 2 + 1

    child_idx += 1 if child_idx + 1 <= end_idx && ary[child_idx] < ary[child_idx + 1]

    if ary[root_idx] < ary[child_idx]
      ary[root_idx], ary[child_idx] = ary[child_idx], ary[root_idx]
      root_idx = child_idx
    else
      break 
    end
  end

  ary
end

ary = [7, 6, 8, 9, 3, 1, 2, 0, 5, 4]
heapsort ary # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
heapsort [] # => []
heapsort "foo" # => 
# ~> -:4:in `heapsort': Input must be an Array (RuntimeError)
# ~> 	from -:47:in `<main>'
