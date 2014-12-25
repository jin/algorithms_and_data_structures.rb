# test_each has an overhead in creating an array prior to the iteration itself.
# test_upto and test_times has identical complexity.
require 'benchmark/bigo'

def test_upto n
  1.upto n do |i|
    Object.new
  end
end

def test_each n
  [*1..n].each do |i|
    Object.new
  end
end

def test_times n
  n.times do |i|
    Object.new
  end
end

Benchmark.bigo do |x|

  x.generate :size
  x.report('upto')  { |size, _| test_upto size }
  x.report('each') { |size, _| test_each size }
  x.report('times') { |size, _| test_times size }
  x.compare!
  x.chart! 'creating_objects.html'

end

# >> Calculating -------------------------------------
# >>             upto 100     3.453k i/100ms
# >>             upto 200     1.759k i/100ms
# >>             upto 300     1.207k i/100ms
# >>             upto 400   892.000  i/100ms
# >>             upto 500   722.000  i/100ms
# >>             upto 600   625.000  i/100ms
# >>             upto 700   516.000  i/100ms
# >>             upto 800   459.000  i/100ms
# >>             upto 900   415.000  i/100ms
# >>            upto 1000   377.000  i/100ms
# >>             each 100     2.557k i/100ms
# >>             each 200     1.389k i/100ms
# >>             each 300   938.000  i/100ms
# >>             each 400   713.000  i/100ms
# >>             each 500   587.000  i/100ms
# >>             each 600   476.000  i/100ms
# >>             each 700   424.000  i/100ms
# >>             each 800   374.000  i/100ms
# >>             each 900   325.000  i/100ms
# >>            each 1000   292.000  i/100ms
# >>            times 100     3.535k i/100ms
# >>            times 200     1.826k i/100ms
# >>            times 300     1.199k i/100ms
# >>            times 400   920.000  i/100ms
# >>            times 500   740.000  i/100ms
# >>            times 600   616.000  i/100ms
# >>            times 700   518.000  i/100ms
# >>            times 800   456.000  i/100ms
# >>            times 900   419.000  i/100ms
# >>           times 1000   370.000  i/100ms
# >> -------------------------------------------------
# >>             upto 100     36.503k (± 5.6%) i/s -    183.009k
# >>             upto 200     18.437k (± 5.6%) i/s -     93.227k
# >>             upto 300     12.421k (± 5.2%) i/s -     62.764k
# >>             upto 400      9.231k (± 5.3%) i/s -     46.384k
# >>             upto 500      7.457k (± 5.4%) i/s -     37.544k
# >>             upto 600      6.248k (± 4.3%) i/s -     31.250k
# >>             upto 700      5.344k (± 5.1%) i/s -     26.832k
# >>             upto 800      4.667k (± 5.4%) i/s -     23.409k
# >>             upto 900      4.124k (± 4.6%) i/s -     20.750k
# >>            upto 1000      3.749k (± 5.0%) i/s -     18.850k
# >>             each 100     27.189k (± 5.7%) i/s -    135.521k
# >>             each 200     14.390k (± 5.5%) i/s -     72.228k
# >>             each 300      9.667k (± 4.9%) i/s -     48.776k
# >>             each 400      7.179k (± 5.3%) i/s -     36.363k
# >>             each 500      5.948k (± 5.3%) i/s -     29.937k
# >>             each 600      4.879k (± 6.1%) i/s -     24.752k
# >>             each 700      4.205k (± 6.5%) i/s -     21.200k
# >>             each 800      3.613k (± 6.6%) i/s -     18.326k
# >>             each 900      3.257k (± 4.8%) i/s -     16.250k
# >>            each 1000      2.918k (± 5.8%) i/s -     14.600k
# >>            times 100     36.744k (± 5.4%) i/s -    183.820k
# >>            times 200     18.909k (± 4.4%) i/s -     94.952k
# >>            times 300     12.305k (± 5.1%) i/s -     62.348k
# >>            times 400      9.326k (± 4.7%) i/s -     46.920k
# >>            times 500      7.519k (± 5.7%) i/s -     37.740k
# >>            times 600      6.180k (± 5.5%) i/s -     31.416k
# >>            times 700      5.214k (± 6.6%) i/s -     26.418k
# >>            times 800      4.594k (± 6.1%) i/s -     23.256k
# >>            times 900      4.145k (± 5.7%) i/s -     20.950k
# >>           times 1000      3.713k (± 4.9%) i/s -     18.870k
