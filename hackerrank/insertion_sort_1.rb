# Given a sorted array except for the last element, print out the steps
# taken to insert the last element into the correct position

def insertionSort(arr) 
  unsorted_value = arr.last
  (arr.length - 1).downto(1) do |i|
    if unsorted_value > arr[i - 1] 
      arr[i] = unsorted_value
      print_array(arr)
      return
    else
      arr[i] = arr[i - 1]
      print_array(arr)
    end
  end
  arr[0] = unsorted_value
  print_array(arr)
end

def print_array(arr)
  arr.each { |x| print "#{x} " }
  puts
end

count = gets.to_i
arr = gets.strip.split.map(&:to_i)
insertionSort(arr)
