def quicksort(arr)
  return arr if arr.empty?
  pivot = arr.shift
  left, right = arr.partition { |x| x < pivot }
  quicksort(left) + [pivot] + quicksort(right)
end

quicksort [6, 5, 8, 2, 5, 2, 9, 8, 1, 0, 3, -6] # => [-6, 0, 1, 2, 2, 3, 5, 5, 6, 8, 8, 9]

q = ->(a){a.empty? ? a :(p=a.shift;l,r=a.partition{|e|e<p};q.call(l)+[p]+q.call(r))}
q.call([*1..10].to_a.shuffle) # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
