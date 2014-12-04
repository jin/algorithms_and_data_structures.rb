require 'benchmark'

# Merge sort implementations with minor differences for benchmarking.

def mergesort_append(arr)
  return arr if arr.length <= 1
  left, right = mergesort_append(arr[0..(arr.length - 1) / 2]), mergesort_append(arr[1 + ((arr.length - 1) / 2)..-1])

  # merge
  res = []
  (left.first < right.first) ? res << left.shift : res << right.shift until left.empty? || right.empty?
  res + left + right
end

def mergesort_add(arr)
  return arr if arr.length <= 1
  left, right = mergesort_add(arr[0..(arr.length - 1) / 2]), mergesort_add(arr[1 + ((arr.length - 1) / 2)..-1])

  # merge
  res = []
  (left.first < right.first) ? res + [left.shift] : res + [right.shift] until left.empty? || right.empty?
  res + left + right
end

def mergesort_add_slice(arr)
  return arr if arr.length <= 1
  split_arr = arr.each_slice(arr.length / 2).to_a
  left, right = mergesort_add(split_arr[0]), mergesort_add(split_arr[1])

  # merge
  res = []
  (left.first < right.first) ? res + [left.shift] : res + [right.shift] until left.empty? || right.empty?
  res + left + right
end

rand_array = (0..1000000).to_a.sort { rand() - 0.5 }
Benchmark.bm(10) do |x|
  x.report("+") { mergesort_add rand_array } 
  x.report("+") { mergesort_add_slice rand_array } 
  x.report("<<") { mergesort_append rand_array } # 3 times slower than mergesort_add
end
