def find_peak(arr)

  return arr if arr.length <= 1
  mid = arr.length / 2
  p "Current #{arr[mid]}"

  if arr[mid - 1] > arr[mid]
    find_peak(arr[0..mid-1])
  elsif arr[mid] < arr[mid + 1]
    find_peak(arr[mid + 1..-1])
  else
    arr[mid]
  end

end

arr = (1..2500000).to_a + (150000..2500001).to_a.reverse
puts find_peak(arr)
