def pivoted_binary_search(arr, num)
  # Initialization
  min, max = 0, arr.length - 1
  until min > max
    # Standard halving & checking
    mid = (min + max) / 2
    return mid if arr[mid] == num

    if arr[min] <= arr[mid] 
    # Left half is sorted
      if arr[min] <= num && num < arr[mid]
        max = mid - 1
      else
        min = mid + 1
      end 
    else
    # Right half is sorted
      if arr[mid] < num && num <= arr[max]
        min = mid + 1
      else
        max = mid - 1
      end
    end
  end
  -1
end

(-1..10).to_a.each do |num|
  p pivoted_binary_search [6, 7, 8, 9, 1, 3, 5], num
end
