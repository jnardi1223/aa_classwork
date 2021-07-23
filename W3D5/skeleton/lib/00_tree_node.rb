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



    

end

a= PolyTreeNode.new("A")
b= PolyTreeNode.new("B")
c= PolyTreeNode.new("C")
a.parent=(b)
c.parent=(b)
p b.children
c.value= "C 2"
c.parent=(b)
c.parent=(b)
p b.children