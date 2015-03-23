class DoublyLinkedList

  attr_accessor :root, :last

  def initialize
    @root = nil
    @last = nil
  end

  def append!(value)
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
    until node.nil?
      len += 1
      node = node.next
    end
    return len
  end

  def [] x
    node = @root
    until node.nil? || x == 0
      x -= 1
      node = node.next
    end

    if x == 0
      node.value
    else
      raise IndexError
    end
  end

  def to_s
    node = @root
    count = 0
    str = "["
    until count >= length
      str += " " if count > 0
      str += "#{node.value},"
      node = node.next
      count += 1
    end

    str[-1] = "]"
    return str
  end

  def remove_at_index! idx
    node = @root
    curr = 0
    removed = false
    until node.nil?
      if curr == idx
        node.prev.nil? ? @root = node.next : node.prev.next = node.next
        node.next.nil? ? @last = node.prev : node.next.prev = node.prev
        removed = true
        break
      end

      curr += 1
      node = node.next
    end

    raise IndexError unless removed
  end

  def reverse!
    node = @root
    until node.nil?
      node.next, node.prev = node.prev, node.next
      node = node.prev
    end

    @root, @last = @last, @root
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

dll = DoublyLinkedList.new
0.upto(10).each do |x|
  dll.append!(x)
end
dll.length # => 11
dll[10]
dll.to_s # => "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"
dll.remove_at_index! 3
dll.to_s # => "[0, 1, 2, 4, 5, 6, 7, 8, 9, 10]"
dll.reverse!
dll.to_s # => "[10, 9, 8, 7, 6, 5, 4, 2, 1, 0]"
