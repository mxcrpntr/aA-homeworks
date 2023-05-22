class GraphNode
    attr_accessor :neighbors, :value
    def initialize(value)
        @value = value
        @neighbors = []
        @visited_nodes = []
    end
    def add_neighbor(node)
        @neighbors << node
    end
    def bfs(target_value)
        queue = [self]
        until queue.empty?
            current_node = queue.shift
            if current_node.value == target_value
                @visited_nodes = []
                return current_node 
            end
            current_node.neighbors.each do |node|
                if !queue.include?(node) && !@visited_nodes.include?(node)
                    queue << node
                end
            end
            @visited_nodes << current_node
        end
        @visited_nodes = []
        return nil
    end
end