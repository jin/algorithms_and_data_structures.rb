def binary_search(arr, num)
  min, max = 0, arr.length - 1
  until min > max
    mid = (min + max) / 2
    return mid if arr[mid] == num
    min, max = arr[mid] < num ? [mid + 1, max] : [min, mid - 1]
  end
  -1
end

(-1..10).to_a.each do |num|
  p binary_search [1, 2, 3, 6, 7, 8], num
end
