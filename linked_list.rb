class LinkedList 

  attr_accessor :root, :last

  def initialize
    @root = nil
    @last = nil
  end

  def append(value)
    if @root.nil? 
      @root = Node.new(value)
      @last = @root
    else
      new_node = Node.new(value)
      @last.next = new_node
      new_node.prev = @last
      @last = new_node
    end
  end

  def length
    node = @root
    len = 0
    unless node.nil?
      until node.next.nil?
        len += 1
        node = node.next
      end
    end
    return len
  end

  def to_s

  end

end

class Node

  attr_accessor :prev, :next, :value

  def initialize(value)
    @prev = nil 
    @next = nil
    @value = value
  end

end

ll = LinkedList.new
0.upto(10).each do |x|
  ll.append(x)
end
# >> #<LinkedList:0x007fcc1a071938 @root=#<Node:0x007fcc1a071898 @prev=nil, @next=#<Node:0x007fcc1a071870 @prev=#<Node:0x007fcc1a071898 ...>, @next=#<Node:0x007fcc1a071848 @prev=#<Node:0x007fcc1a071870 ...>, @next=#<Node:0x007fcc1a071820 @prev=#<Node:0x007fcc1a071848 ...>, @next=#<Node:0x007fcc1a0717f8 @prev=#<Node:0x007fcc1a071820 ...>, @next=#<Node:0x007fcc1a0717d0 @prev=#<Node:0x007fcc1a0717f8 ...>, @next=#<Node:0x007fcc1a0717a8 @prev=#<Node:0x007fcc1a0717d0 ...>, @next=#<Node:0x007fcc1a071780 @prev=#<Node:0x007fcc1a0717a8 ...>, @next=#<Node:0x007fcc1a071758 @prev=#<Node:0x007fcc1a071780 ...>, @next=#<Node:0x007fcc1a071730 @prev=#<Node:0x007fcc1a071758 ...>, @next=#<Node:0x007fcc1a071708 @prev=#<Node:0x007fcc1a071730 ...>, @next=nil, @value=10>, @value=9>, @value=8>, @value=7>, @value=6>, @value=5>, @value=4>, @value=3>, @value=2>, @value=1>, @value=0>, @last=#<Node:0x007fcc1a071708 @prev=#<Node:0x007fcc1a071730 @prev=#<Node:0x007fcc1a071758 @prev=#<Node:0x007fcc1a071780 @prev=#<Node:0x007fcc1a0717a8 @prev=#<Node:0x007fcc1a0717d0 @prev=#<Node:0x007fcc1a0717f8 @prev=#<Node:0x007fcc1a071820 @prev=#<Node:0x007fcc1a071848 @prev=#<Node:0x007fcc1a071870 @prev=#<Node:0x007fcc1a071898 @prev=nil, @next=#<Node:0x007fcc1a071870 ...>, @value=0>, @next=#<Node:0x007fcc1a071848 ...>, @value=1>, @next=#<Node:0x007fcc1a071820 ...>, @value=2>, @next=#<Node:0x007fcc1a0717f8 ...>, @value=3>, @next=#<Node:0x007fcc1a0717d0 ...>, @value=4>, @next=#<Node:0x007fcc1a0717a8 ...>, @value=5>, @next=#<Node:0x007fcc1a071780 ...>, @value=6>, @next=#<Node:0x007fcc1a071758 ...>, @value=7>, @next=#<Node:0x007fcc1a071730 ...>, @value=8>, @next=#<Node:0x007fcc1a071708 ...>, @value=9>, @next=nil, @value=10>>
