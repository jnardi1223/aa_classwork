class Board 
    def initialize 
        @grid = Array.new(3) {Array.new(3) {'_'}}
    end 

    def grid
        @grid
    end 

    def valid?(position)
        position.each do |pos|
            if pos < 0 || pos > 2
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
       (mark[0][0] == mark && mark[1][1] == mark && mark[2][2] == mark) || (mark[0][2] == mark && mark[1][1] == mark && mark[1][0] == mark) 
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








