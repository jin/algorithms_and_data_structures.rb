def remove_dups xs
  _xs = {}
  xs.reduce([]) do |uniques, x|
    uniques << x unless _xs[x]
    _xs[x] = true
    uniques
  end
end

remove_dups(["a", "b", "b", "c", "C"]) # => ["a", "b", "c", "C"]
