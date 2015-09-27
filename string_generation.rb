# Generate all possible strings from a string

def generate word
  word.split("").reduce([]) do |perms, c|
    perms.concat(perms.map { |p| insert p, c }.flatten )
    perms << c
  end
end

def insert(word, c)
  word_ary = word.split("")
  new_word_ary = []
  (word_ary.count + 1).times do |i|
    new_word_ary << word_ary.dup.insert(i, c)
  end
  new_word_ary.map { |n| n.join }
end

generate("abcd") # => ["a", "ba", "ab", "b", "ca", "ac", "cba", "bca", "bac", "cab", "acb", "abc", "cb", "bc", "c", "da", "ad", "dba", "bda", "bad", "dab", "adb", "abd", "db", "bd", "dca", "cda", "cad", "dac", "adc", "acd", "dcba", "cdba", "cbda", "cbad", "dbca", "bdca", "bcda", "bcad", "dbac", "bdac", "badc", "bacd", "dcab", "cdab", "cadb", "cabd", "dacb", "adcb", "acdb", "acbd", "dabc", "adbc", "abdc", "abcd", "dcb", "cdb", "cbd", "dbc", "bdc", "bcd", "dc", "cd", "d"]
