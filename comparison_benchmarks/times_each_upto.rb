# No obvious winner between these three methods of iteration.
require 'benchmark'

def test_upto
  1.upto 10000000 do |i|
    Object.new
  end
end

def test_each
  (1..10000000).each do |i|
    Object.new
  end
end

def test_times
  10000000.times do |i|
    Object.new
  end
end

Benchmark.bmbm(3) do |x|
  x.report('upto')  { test_upto }
  x.report('range') { test_each }
  x.report('times') { test_times }
end
# >> Rehearsal -----------------------------------------
# >> upto    2.440000   0.010000   2.450000 (  2.446668)
# >> range   2.450000   0.010000   2.460000 (  2.468661)
# >> times   2.420000   0.010000   2.430000 (  2.438168)
# >> -------------------------------- total: 7.340000sec
# >> 
# >>             user     system      total        real
# >> upto    2.480000   0.000000   2.480000 (  2.502511)
# >> range   2.440000   0.010000   2.450000 (  2.454723)
# >> times   2.480000   0.010000   2.490000 (  2.504007)
