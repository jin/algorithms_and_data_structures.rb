def check_string(str)
  str.empty? || is_balanced?(str)
end

def is_balanced?(str, brackets_left = 0)
  case str.head
  when "[" then is_balanced?(str.tail, brackets_left + 1)
  when "]" then brackets_left == 0 ? false : is_balanced?(str.tail, brackets_left - 1)
  else brackets_left == 0
  end
end

# utility methods

class String
  def head
    self[0]
  end

  def tail
    self[1..-1]
  end
end

check_string("[]") # => true
check_string("") # => true
check_string("[[]") # => false
check_string("[][]") # => true
check_string("]]][[[") # => false
check_string("]]]") # => false
check_string("[[[]]") # => false
check_string("][][][") # => false
check_string("[[[[]]][][][[]]]") # => true
check_string("[[[]][]]]][][][[]]]") # => false
