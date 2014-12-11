# https://www.hackerrank.com/challenges/angry-children/
# Find a group of k elements in an array of n elements such that the difference between the max and min element of the group is minimized.

# Horrible, exponential runtime complexity impl of a count-change variant
def unfairness packets
  packets.max - packets.min
end

def solve candy, packets, i, k
  packets = packets.clone
  return unfairness packets if packets.length == k
  return 10 ** 9 if candy.length == i && packets.length != k
  return unfaireness packets if candy.length == i && packets.length == k
  return 10 ** 9 if packets.length > k
  return [solve(candy, packets, i + 1, k), solve(candy, packets.push(candy[i]), i + 1, k)].min if packets.length < k
end

n = gets.to_i
k = gets.to_i
candy = Array.new(n)
packets = []
n.times do |i|
  candy[i] = gets.to_i
end
ans = solve(candy, packets, 0, k)
puts ans

# Much, much better
def solve candy, k
  diff = 10 ** 9
  candy.sort!
  0.upto(candy.length - k - 1) do |i|
    x = candy[i + k - 1] - candy[i]
    diff = x if x < diff 
  end
  diff
end

n = gets.to_i
k = gets.to_i
candy = Array.new(n)
packets = []
n.times do |i|
  candy[i] = gets.to_i
end
ans = solve candy, k
puts ans
