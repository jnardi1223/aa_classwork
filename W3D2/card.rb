class Card 

    VALUES = ('a'..'z').to_a

    def self.shuffled_pairs(num_pairs)
        values = VALUES

        while num_pairs > values.length 
            values = values + values 
        end 

        values = values.shuffle.take(num_pairs) * 2 
        values.shuffle!
        values.map { |val| self.new(val) }
    end 

    attr_reader :value

    def initialize(value, revealed = false)
        @value = value 
        @revealed = revealed 
    end





end 