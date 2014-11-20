def get_offending_index(str)
  stack = str[0..str.length / 2 - 1].split(//)
  to_check = if str.length.odd?
               str[(str.length / 2) + 1..-1].reverse
             else
               str[(str.length / 2)..-1].reverse
             end
  while !stack.empty?
    x = stack.pop
    y = to_check.pop
    next if x == y
  end
  -1
end

str = gets.strip.downcase
puts get_offending_index str
