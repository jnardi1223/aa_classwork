class Deck 


    NUMBERS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ,13]

    SHAPES = ["spade", "diamond", "heart", "club"]

    attr_reader :deck 

    def initialize
        deck = []
        SHAPES.each do |shape|
            NUMBERS.each do |num|
                deck << num.to_s + "-" + shape 
            end 
            
        end 
        @deck = deck
    end 

    def start_game 
        Card.new 
    end 

   
end 

class Card < Deck 

    attr_reader :card

    def initialize
        super 
        @card = @deck.shuffle.shift 
    end 

end 

c = Card.new 

p c
p c.deck







