class Board
    attr_reader :grid
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, "_") }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, mark)
        row, col = pos
        @grid[row][col] = mark
    end

    def valid?(pos)
        row, col = pos
        if (row < @grid.length && col < @grid.length) && (row >= 0 && col >= 0)
            return true
        else
            return false
        end
    end

    def empty?(pos)
        row, col = pos
        if @grid[row][col] == "_"
            return true
        else
            return false
        end
    end

    def place_mark(pos, mark)
        if !valid?(pos) || !empty?(pos)
            raise "invalid position"
        else
            row, col = pos
            self[pos] = mark
        end
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_diagonal?(mark)
        left_to_right = (0...@grid.length).all? do |i|
            row = i
            col = i
            pos = [row, col]
            self[pos] == mark
        end

        right_to_left = (0..@grid.length).all do |i|
            row = i
            col = -i - 1
            pos = [row, col]
            self[pos] ==mark
        end

        left_to_right || right_to_left
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark) }
    end

    def win?(mark)
        win_diagonal?(mark) || win_col?(mark) || win_row?(mark)
    end

    def empty_positions?
        indices = (0...@grid.length).to_a
        positions = indices.product(indices)
        positions.any? { |pos| empty?(pos) }

    #     # @grid.each do |row|
    #     #     if row.any? { |ele| ele == "_" }
    #     #         return true
    #     #     else
    #     #         return false
    #     #     end
    #     # end
    end
end