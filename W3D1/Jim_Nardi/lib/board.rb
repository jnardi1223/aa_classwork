class Board
    def initialize(size)
        @size = size 
        @grid = Array.new(size) {Array.new(size)}
    end 

    def size 
        @size 
    end 

    def [](position)
        row, col = position
        @grid[row][col]
    end 

    def []=(position, value)
        row, col = position
        @grid[row][col] = value 
    end 

    def complete_row?(mark)
        @grid.any? {|row| row.all?(mark)}
    end 

    def complete_col?(mark)
        (0...@grid.length).any? do |r|
            (0...@grid.length).all? do |c|
                @grid[c][r] == mark 
            end 
        end 
    end 

    def complete_diag?(mark)
        left_to_right = (0...@grid.length).all? do |i|
            row = i 
            col = i 
            pos = [row, col]
            self[pos] == mark 
        end 

        right_to_left = (0...@grid.length).all? do |i|
            row = i 
            col = -i - 1 
            pos = [row, col]
            self[pos] == mark
        end 
        
        left_to_right || right_to_left

    end

    def winner?(mark)
        if self.complete_col?(mark) || self.complete_diag?(mark) || self.complete_row?(mark)
            return true 
        else 
            return false 
        end 
    end 


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
