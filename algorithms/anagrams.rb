# https://www.hackerrank.com/challenges/anagram/

# Problem: break down each line of input into two, and find out the number of characters to change in one of the two strings in order to make one an anagram of the other.

gets
ARGF.each do |line|
  line.strip!
  if line.length.odd?
    puts -1
  else
    # splitting
    x, y = line[0..(line.length / 2) - 1].split(//), line[line.length / 2..-1].split(//)

    h = {}
    count = 0

    # build hash with a counter from elements of the first half
    x.each { |c| h[c] = h[c].nil? ? 1 : h[c] + 1 }

    # decrement counter accordingly with the elements of the second half
    y.each { |c| (h[c].nil? || h[c] == 0) ? count += 1 : h[c] -= 1 }
    puts count
  end
end
