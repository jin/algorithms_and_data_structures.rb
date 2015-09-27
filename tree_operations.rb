class Node

  attr_accessor :data, :parent

  def initialize(data, left = nil, right = nil)
    @data = data
    @parent = nil
    self.left, self.right = left, right
  end

  def left=(node)
    @left = node 
    @left.parent = self unless node.nil?
  end

  def right=(node)
    @right = node
    @right.parent = self unless node.nil?
  end

  def print(indent_count = 0)
    @left.print(indent_count + 1) if @left
    puts "#{" " * indent_count}#{@data}"
    @right.print(indent_count + 1) if @right
  end

end

t0 = Node.new(0)
t1 = Node.new(1)
t2 = Node.new(2, t1, t0)
t3 = Node.new(3, t2, t2)

t3.print
# >>   1
# >>  2
# >>   0
# >> 3
# >>   1
# >>  2
# >>   0
