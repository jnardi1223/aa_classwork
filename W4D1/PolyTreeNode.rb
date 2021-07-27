class PolyTreeNode

    attr_reader :children, :parent, :value
    

    def initialize(value)
        @value = value 
        @parent = nil 
        @children = []
    end     

    def parent=(property)
        @parent.children.delete(self) if @parent != nil
        @parent = property
        return nil if @parent == nil
        if !property.children.include?(self)
            property.children << self
        end 
    end 

    def add_child(child_node)
        child_node.parent = self 
    end 

    def remove_child(child_node)
        raise "#{child_node} is not a child" if child_node.parent == nil 
        child_node.parent = nil 
    end 

    def dfs(target_value)
        return self if self.value == target_value

        self.children.each do |child|
            result = child.dfs(target_value)
            return result unless result == nil
        end
        nil
    end 
    
    def bfs(target_value)
        queue = [self]
        until queue.empty?
            temp = queue.shift
            if temp.value == target_value
                return temp
            else
                temp.children.each { |child| queue << child }
            end
        end
        nil
    end
end