class PolyTreeNode

    attr_reader :children, :parent, :value 
    

    def initialize(value)
        @value = value 
        @parent = nil 
        @children = []
    end     

    def parent=(property)
        @parent = property
        property.children << self 
    end 



    

end