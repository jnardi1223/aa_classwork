require './board.rb' 
require './human_player.rb' 

class Game 
    def initialize(length, *marks)
        # @player_1 = HumanPlayer.new(player_1_mark)
        # @player_2 = HumanPlayer.new(player_2_mark)
        @players = marks.map {|mark| HumanPlayer.new(mark)}
        @board = Board.new(num)
        @current_player = @player_1
    end 

    def switch_turn
        @current_player = @players.rotate.first 
    end 

    def play 
        while @board.empty_positions?
            @board.print 
            answer = @current_player.get_position
            @board.place_mark(position, @current_player.mark_value)
            if @current_player.win?
                puts 'victory'
                puts @current_player.to_s + 'won'
            else
                self.switch_turn
            end 
        end 
        puts 'draw'
    end 
end 