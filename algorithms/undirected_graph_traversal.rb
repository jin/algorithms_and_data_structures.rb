# Undirected graph implemented with an adjacency list
# 0 is root vertice 
# Vertice key is the index itself. e.g. vertice 2 = 2

class UndirectedGraph

  attr_accessor :adjacency_list

  def initialize
    @adjacency_list = [ [] ]
  end

  # Example: add_edge(2, 4)
  def add_edge(v1, v2)
    @adjacency_list[v1].nil? ? @adjacency_list[v1] = [v2] : @adjacency_list[v1].push(v2)
    @adjacency_list[v2].nil? ? @adjacency_list[v2] = [v1] : @adjacency_list[v2].push(v1)
  end

  def neighbors(vertice)
    @adjacency_list[vertice]
  end

  def vertice_count
    @adjacency_list.flatten.uniq.count
  end

  def depth_first_traversal(vertice = 0, stack = [], visited = [], result = [])
    unless visited[vertice]
      result.push(vertice) # Add current vertice to the traversal result
      visited[vertice] = true # Mark current vertice as visited
      stack.push(*neighbors(vertice).reject { |v| visited[v] }) # Push unvisited neighbors onto the stack
    end

    # Return the result if stack is empty, else recursively continue with popped element
    stack.empty? ? result : depth_first_traversal(stack.pop, stack, visited, result)
  end

  def breadth_first_traversal(vertice = 0, queue = [], visited = [], result = [])
    unless visited[vertice]
      result.push(vertice)# Add current vertice to the traversal result
      visited[vertice] = true  # Mark current vertice as visited
      queue.push(*neighbors(vertice).reject { |v| visited[v] }) # Push unvisited neighbors onto the queue
    end 

    # Return the result if queue is empty, else recursively continue with dequeued element
    queue.empty? ? result : breadth_first_traversal(queue.shift, queue, visited, result)
  end

end

graph = UndirectedGraph.new
graph # => #<UndirectedGraph:0x007ff9b0a2a358 @adjacency_list=[[]]>

edges = [ [0, 8], [8, 7], [7, 6], [5, 6], [2, 5], [2, 4], [1, 4], [1, 3], [0, 1] ]
edges.each { |edge| graph.add_edge edge[0], edge[1] }

graph # => #<UndirectedGraph:0x007ff9b0a2a358 @adjacency_list=[[8, 1], [4, 3, 0], [5, 4], [1], [2, 1], [6, 2], [7, 5], [8, 6], [0, 7]]>
graph.vertice_count # => 9
graph.depth_first_traversal # => [0, 1, 3, 4, 2, 5, 6, 7, 8]
graph.breadth_first_traversal # => [0, 8, 1, 7, 4, 3, 6, 2, 5]
