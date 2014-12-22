def quicksort(arr)
  return arr if arr.empty?
  pivot = arr.shift
  left, right = arr.partition { |x| x < pivot }
  quicksort(left) + [pivot] + quicksort(right)
end

p quicksort [6, 5, 8, 2, 5, 2, 9, 8, 1, 0, 3, -6]
