class HumanPlayer

    attr_reader :mark
    def initialize(mark_val)
        @mark = mark_val
    end

    def get_position
        puts "enter a position as two numbers with a space between"
        position = gets.chomp.split(" ").map(&:to_i)
        raise "sorry, invalid entry" if position.length != 2
        row = position.first.to_i
        col = position.last.to_i
        [row, col]
    end
end