class Board

    def self.build_stacks(num_stacks)
        Array.new(num_stacks) {Array.new}
    end

    def initialize(num_stacks, max_height)
        @max_height = max_height
        @stacks = Board.build_stacks(num_stacks)
        if num_stacks < 4 || max_height < 4 
            raise 'rows and cols must be >= 4'
        end 
    end 

    def max_height
        @max_height
    end 

    def add(token, stack_index)
        if @stacks[stack_index].length < @max_height
            @stacks[stack_index] << token 
            return true 
        else
            return false 
        end 

    end 

    def vertical_winner?(token)
        @stacks.any? do |row|
            row.length == max_height && row.all? {|spot| spot == token}
        end 
    end 

    def horizontal_winner?(token)
        (0...@stacks.length).any? do |r|
            (0...@stacks.length).all? do |c|
                    @stacks[c][r] == token 
            end 
        end
    end 

    def winner?(token)
        self.vertical_winner?(token) || self.horizontal_winner?(token)
    end 

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
