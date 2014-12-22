# Regular Ruby methods, can't pass them around like function objects

def length(xs)
  return 0 if xs.empty?
  1 + length(xs[1..-1])
end

def map(xs, process = -> (x) { x })
  return [] if xs.empty?
  [process.call(xs.first)] + map(xs[1..-1], process)
end

# Lambda objects

length_func = -> (xs) { xs.empty? ? 0 : 1 + length_func.call(xs[1..-1])}

map_func = -> (xs, process) do
  return [] if xs.empty?
  [process.call(xs.first)] + map_func.call(xs[1..-1], process)
end

filter_func = -> (xs, filter) do
  return [] if xs.empty?
  x = xs.first
  if filter.call(x)
    [x] + filter_func.call(xs[1..-1], filter)
  else
    filter_func.call(xs[1..-1], filter)
  end
end

take_func = -> (xs, num) do
  return [] if xs.empty? || num.to_i <= 0
  [xs.first] + take_func.call(xs[1..-1], num - 1)
end

compose_func = -> (f, g) do
  -> (x) { f.call(g.call(x)) }
end

add_one_func = -> (x) { x + 1 }
mul_two_func = -> (x) { x * 2 }

# Testing

length [] # => 0
length [1, 2, 3] # => 3

length_func.call([]) # => 0
length_func.call([1, 2, 3]) # => 3

map([]) # => []
map([1, 2]) # => [1, 2]
map([1, 2, 3], Proc.new { |x| x.to_i * x.to_i } ) # => [1, 4, 9]
map([1, 2, "foo"], Proc.new { |x| x.to_i * x.to_i } ) # => [1, 4, 0]

add_one_func.call(2) # => 3
add_one_func.call(add_one_func.call(2)) # => 4
add_two_func = compose_func.call(add_one_func, add_one_func)
add_two_func.call(2) # => 4
add_one_then_mul_two_func = compose_func.call(mul_two_func, add_one_func)
add_one_then_mul_two_func.call(5) # => 12

map_func.call([1, 2, 3], Proc.new { |x| x.to_i * x.to_i }) # => [1, 4, 9]
map_func.call([1, 2, "foo"], Proc.new { |x| x.to_i * x.to_i }) # => [1, 4, 0]
map_func.call([1, 2, 3], add_one_then_mul_two_func) # => [4, 6, 8]

filter_func.call([], -> (x) { x } ) # => []
filter_func.call([1, 2, 3], -> (x) { x.odd? }) # => [1, 3]

take_func.call([], 1) # => []
take_func.call([1, 2, 3], 0) # => []
take_func.call([1, 2, 3], 2) # => [1, 2]

p take_func.call(map_func.call(filter_func.call((1..3000).to_a, -> (x) { x.odd? } ), -> (x) { x * x }), 42)
# => [1,
#     9,
#     25,
#     49,
#     81,
#     121,
#     169,
#     225,
#     289,
#     361,
#     441,
#     529,
#     625,
#     729,
#     841,
#     961,
#     1089,
#     1225,
#     1369,
#     1521,
#     1681,
#     1849,
#     2025,
#     2209,
#     2401,
#     2601,
#     2809,
#     3025,
#     3249,
#     3481,
#     3721,
#     3969,
#     4225,
#     4489,
#     4761,
#     5041,
#     5329,
#     5625,
#     5929,
#     6241,
#     6561,
#     6889]
# >> [1, 9, 25, 49, 81, 121, 169, 225, 289, 361, 441, 529, 625, 729, 841, 961, 1089, 1225, 1369, 1521, 1681, 1849, 2025, 2209, 2401, 2601, 2809, 3025, 3249, 3481, 3721, 3969, 4225, 4489, 4761, 5041, 5329, 5625, 5929, 6241, 6561, 6889]
