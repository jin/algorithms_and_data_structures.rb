# Solution for Archery problem from the Quora Haqathon
#
# Given n radii of concentric circles and m finite-length vectors, find the number of times a vector intersecting a circle exactly once.
# This solution works for 50% of the test cases. Runtime complexity is O(nm) and this doesn't work for the second 50% of the test cases.

def distance(x, y)
  x ** 2 + y ** 2
end

num_of_circles = gets.to_i
radii = gets.split.map(&:to_i)
q_count = 0

gets.to_i.times do
  x1, y1, x2, y2 = gets.split.map(&:to_i)
  p1_distance, p2_distance = [distance(x1, y1), distance(x2, y2)].sort
  radii.each do |radius| 
    radius = radius * radius
    next if radius > p2_distance
    q_count += 1 if radius >= p1_distance
  end if p1_distance < p2_distance
end
puts q_count
