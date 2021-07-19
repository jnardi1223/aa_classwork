class Board
    def self.build_stacks(stacks)
        Array.new(stacks) {Array.new()}
    end 

    def initialize(num, max)
        @max_height = max 
        @stacks = Array.new(num) {Array.new()}
        Board.build_stacks(num)
        raise 'rows and cols must be >= 4' if num < 4 || max < 4 
    end  

    def max_height
        @max_height
    end 

    # def [](position)
    #     @stacks[position]
    # end 

    def add(token, index)
        if @stacks[index].length < @max_height
            @stacks[index].push(token) #arr.push 
            return true 
        else 
            return false 
        end 
    end 

    def vertical_winner?(token)
        @stacks.each do |stack|
            return true if stack.length == @max_height && stack.all? {|ele| ele == token}
        end 
        false 
    end 

    def horizontal_winner?(token)
        (0...@max_height).any? do |height_idx|
            (0...@stacks.length).all? do |stack_idx|
                @stacks[stack_idx][height_idx] == token 

            end 
        end

    end 

    def winner?(token)
        horizontal_winner?(token) || vertical_winner?(token)
    end     

  

        

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end


# [
#     ['y', 'y'], arr1
#     ['b'], arr2
#     ['b', 'y', 'y', 'b'], arr3
#     [], arr4
#     [], arr5
#     ['y'], arr6
#     [] arr6
# ]

# Want to check if horizontal is all same token

# arr1[same_idx]
# arr2[same_idx]
# arr3[same_idx]


