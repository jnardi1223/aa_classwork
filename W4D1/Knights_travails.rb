require_relative 'PolyTreeNode'

class KnightPathFinder
attr_reader :starting, :root
attr_accessor :considered_positions
   

    def self.valid_moves(pos)
        valid= []
       
        possible_moves=[[2,1], [1,2], [-2, 1], [-1, 2], [2, -1], [1, -2], [-2, -1], [-1, -2]]
        
        possible_moves.each do |move|
            valid << [move[0] + pos[0], move[1] + pos[1]]
        end

        return valid.select { |el| el[0] >= 0 && el[0] <=7 && el[1] >= 0 && el[1] <= 7 }
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @considered_positions = [@start_pos] 
        @start_root = PolyTreeNode.new(@start_pos)
    end

    def build_move_tree 
        nodes = [@start_root] #queue 
        current_node = nodes.shift

        until nodes.empty?
            new_move_positions(current_node.value).each do |child_value|
                child = PolyTreeNode.new(child_value)
                current_node.add_child(child)
                nodes << child
            end
        end
    end

    def new_move_positions(pos)
        new_move = KnightPathFinder.valid_moves(pos).select {|ele| !@considered_positions.include?(ele) }
        @considered_positions << new_move
        new_move
    end 

    def find_path(end_pos)
        trace_path_back(self.root.dfs(end_pos))
    end

    def trace_path_back(leaf_node) 
        path = [leaf_node]

        while path.last.parent != nil 
            path << path.last.parent
        end 
        path_value = []
        path.each do |node|
            path_value << node.value
        end 
       
        path_value.reverse 

    end 

    
    
end



kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]