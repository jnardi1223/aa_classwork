require './board.rb' 
require './human_player.rb' 

class Game 
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new 
        @current_player = @player_1
    end 

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else 
            @current_player = player_2 
        end 
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