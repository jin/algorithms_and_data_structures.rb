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

length []
length [1, 2, 3]

length_func.call([]) 
length_func.call([1, 2, 3])

map([])
map([1, 2])
map([1, 2, 3], Proc.new { |x| x.to_i * x.to_i } )
map([1, 2, "foo"], Proc.new { |x| x.to_i * x.to_i } )

add_one_func.call(2)
add_one_func.call(add_one_func.call(2))
add_two_func = compose_func.call(add_one_func, add_one_func)
add_two_func.call(2)
add_one_then_mul_two_func = compose_func.call(mul_two_func, add_one_func)
add_one_then_mul_two_func.call(5)

map_func.call([1, 2, 3], Proc.new { |x| x.to_i * x.to_i })
map_func.call([1, 2, "foo"], Proc.new { |x| x.to_i * x.to_i })
map_func.call([1, 2, 3], add_one_then_mul_two_func)

filter_func.call([], -> (x) { x } )
filter_func.call([1, 2, 3], -> (x) { x.odd? })

take_func.call([], 1)
take_func.call([1, 2, 3], 0)
take_func.call([1, 2, 3], 2)

p take_func.call(map_func.call(filter_func.call((1..3000).to_a, -> (x) { x.odd? } ), -> (x) { x * x }), 42)
