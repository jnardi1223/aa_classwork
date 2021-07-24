class PolyTreeNode

    attr_reader :children, :parent
    attr_accessor :value 
    

    def initialize(value)
        @value = value 
        @parent = nil 
        @children = []
    end     

    def parent=(property)
        @parent.children.delete(self) if @parent !=nil
        @parent = property
        return nil if @parent==nil
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
        return self if self.value== target_value

        self.children.each do |child|
            result= child.dfs(target_value)
            return result unless result== nil
        end
        nil

        # return nil if self.children.empty? 
        # stack = [self]
        # return self if self.value == target_value

        # stack[-1].children.each do |child|
        #     stack << child 
        #     if stack[-1].dfs(target_value) == nil 
        #         stack.pop 
        #     elsif stack[-1].dfs(target_value) == target_value
        #         return stack[-1].dfs(target_value) 
        #     end
        # end 

        #the reason the above code may not work is due to us checking the children first (or at least putting them into the stack first) before we put in children of each children. This is not depth first search.
    end 
    
    def bfs(target_value)

    end 

    

end

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")

# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2

# # this should work
# raise "Bad parent=!" unless n3.parent == n2
# raise "Bad parent=!" unless n2.children == [n3]

# # this probably doesn't
# raise "Bad parent=!" unless n1.children == []

# a= PolyTreeNode.new("A")
# b= PolyTreeNode.new("B")
# c= PolyTreeNode.new("C")
# a.parent=(b)
# c.parent=(b)
# p b.children
# c.value= "C 2"
# c.parent=(b)
# c.parent=(b)
# p b.children