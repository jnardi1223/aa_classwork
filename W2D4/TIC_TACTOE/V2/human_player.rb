class HumanPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end 

    def get_position     
        puts 'Please enter a position with two numbers with a space in between'
         answer = gets.chomp.split(' ').map(&:to_i)
         raise 'invalid entry' if answer.length != 2 
         row = answer[0].to_i 
         col = answer[1].to_i 
         [row, col] 
    end

end 