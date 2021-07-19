class Board 

    att_reader :grid, :number 

    def initialize(number)
        @grid = Array.new(number) {Array.new(number) {'_'}}
        @number = number 
    end 


    def valid?(position)
        position.each do |pos|
            if pos < 0 || pos > @number 
                raise 'Invalid Mark'
                return false  
            end 
        end 
        true 
    end


    def empty?(position)
        if self[position] == '_'
            return false 
        else 
            raise 'Invalid Mark'
            return true 
        end 
    end

    def place_mark(position, mark)
        if self.valid?(position) && !self.empty?(position)
            self[position] = mark 
        end 
    end 

    def print
        @grid.each do |row|
           puts row.join(' ')
        end 
    end 


    def win_row?(mark) #mark is going to be an :x or an :o 
        @grid.any? { |row| row.all?(mark)}
    end 

    def win_col?(mark) #mark is going to be an :x or an :o 
        @grid.transpose.any? { |col| col.all?(mark)}
    end 

    def win_diagnol?(mark)
       
        left_to_right = (0...@number).all? do |i|
                     row = i 
                     col = i 
                     pos = [row, col]
                     self[pos] == mark
       end 

       right_to_left = (0...@number).all? do |i|
                    row = i 
                    col = -i - 1
                    pos = [row, col] 
                    self[pos] == mark
       end 

       left_to_right || right_to_left 


    end 

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagnol?(mark)
    end 

    def empty_positions?
        @grid.each do |row|
            if row.any? { |spot| spot == "_" }
                return true 
            else 
                return false 
            end 
        end 
    end 

end 