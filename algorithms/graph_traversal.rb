# Undirected graph implemented with an adjacency list
# 0 is root vertice
# Vertice key is the index itself. e.g. vertice 2 = 2

class UndirectedGraph

  attr_reader :adjacency_list

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

  def edge_count
    @adjacency_list.flatten.count / 2
  end

  # Recursive style
  def depth_first_traversal(stack = [0], visited = [], result = [])
    vertice = stack.pop

    if not visited[vertice]
      result.push(vertice) # Add current vertice to the traversal result
      visited[vertice] = true # Mark current vertice as visited
      stack.push(*neighbors(vertice).reject { |v| visited[v] }) # Push unvisited neighbors onto the stack
    end

    # Return the result if stack is empty, else recursively continue with popped element
    stack.empty? ? result : depth_first_traversal(stack, visited, result)
  end

  # Iterative style
  def breadth_first_traversal(queue = [0], visited = [], result = [])
    until queue.empty?
      vertice = queue.shift
      if not visited[vertice]
        result.push(vertice)# Add current vertice to the traversal result
        visited[vertice] = true  # Mark current vertice as visited
        queue.push(*neighbors(vertice).reject { |v| visited[v] }) # Push unvisited neighbors onto the queue
      end
    end
    result
  end

end

class DirectedGraph < UndirectedGraph

  def add_edge(v1, v2)
    @adjacency_list[v1].nil? ? @adjacency_list[v1] = [v2] : @adjacency_list[v1].push(v2)
  end

  def vertice_count 
    # TODO
  end

end

undirected_graph = UndirectedGraph.new
undirected_graph # => #<UndirectedGraph:0x007fa233052ad0 @adjacency_list=[[]]>

edges = [ [0, 8], [8, 7], [7, 6], [5, 6], [2, 5], [2, 4], [1, 4], [1, 3], [0, 1], [5, 8], [6, 1] ]
edges.each { |edge| undirected_graph.add_edge edge[0], edge[1] }

undirected_graph # => #<UndirectedGraph:0x007fa233052ad0 @adjacency_list=[[8, 1], [4, 3, 0, 6], [5, 4], [1], [2, 1], [6, 2, 8], [7, 5, 1], [8, 6], [0, 7, 5]]>
undirected_graph.vertice_count # => 9
undirected_graph.edge_count # => 11
undirected_graph.depth_first_traversal # => [0, 1, 6, 5, 8, 7, 2, 4, 3]
undirected_graph.breadth_first_traversal # => [0, 8, 1, 7, 5, 4, 3, 6, 2]

directed_graph = DirectedGraph.new
directed_graph # => #<DirectedGraph:0x007fa233050398 @adjacency_list=[[]]>
edges = [ [0, 8], [8, 7], [7, 6], [5, 6], [2, 5], [2, 4], [1, 4], [1, 3], [0, 1], [5, 8], [6, 1] ]
edges.each { |edge| directed_graph.add_edge edge[0], edge[1] }
directed_graph # => #<DirectedGraph:0x007fa233050398 @adjacency_list=[[8, 1], [4, 3], [5, 4], nil, nil, [6, 8], [1], [6], [7]]>
directed_graph.edge_count # => 6
directed_graph.vertice_count # => nil
