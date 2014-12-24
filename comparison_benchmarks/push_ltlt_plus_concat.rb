# This compares the runtime of Array#<<, Array#push and Array#+
require 'benchmark'

def test_ltlt
  ary = []
  1.upto 10000000 do
    ary << 42
  end
end

def test_push
  ary = []
  1.upto 10000000 do
    ary.push 42
  end
end

def test_plus
  ary = []
  1.upto 10000000 do
    ary + [42]
  end
end

def test_concat
  ary = []
  1.upto 10000000 do
    ary.concat [42]
  end
end

3.times do 
  Benchmark.bmbm do |x|
    x.report('<<')  { test_ltlt }
    x.report('push') { test_push }
    x.report('+') { test_plus }
    x.report('concat') { test_concat }
  end
end
# >> Rehearsal ------------------------------------------
# >> <<       1.150000   0.040000   1.190000 (  1.198840)
# >> push     1.500000   0.040000   1.540000 (  1.550682)
# >> +        2.320000   0.010000   2.330000 (  2.340114)
# >> concat   6.450000   0.090000   6.540000 (  6.590473)
# >> -------------------------------- total: 11.600000sec
# >> 
# >>              user     system      total        real
# >> <<       1.120000   0.040000   1.160000 (  1.176859)
# >> push     1.490000   0.040000   1.530000 (  1.547603)
# >> +        2.390000   0.010000   2.400000 (  2.418980)
# >> concat   6.530000   0.090000   6.620000 (  6.642548)
