def binary_search(arr, num)
  min, max = 0, arr.length - 1
  while min <= max
    mid = (min + max) / 2
    return mid if arr[mid] == num
    min, max = arr[mid] < num ? [mid + 1, max] : [min, mid - 1]
  end
  -1
end

puts binary_search [1, 2, 3, 6, 7, 8], 0
puts binary_search [1, 2, 3, 6, 7, 8], 1
puts binary_search [1, 2, 3, 6, 7, 8], 2
puts binary_search [1, 2, 3, 6, 7, 8], 3
puts binary_search [1, 2, 3, 6, 7, 8], 4
puts binary_search [1, 2, 3, 6, 7, 8], 5
puts binary_search [1, 2, 3, 6, 7, 8], 6
puts binary_search [1, 2, 3, 6, 7, 8], 7
puts binary_search [1, 2, 3, 6, 7, 8], 8
puts binary_search [1, 2, 3, 6, 7, 8], 9
