class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
    def self.random_word
      DICTIONARY.sample 
    end 

    def initialize
      @secret_word = Hangman.random_word
      @guess_word = Array.new(@secret_word.length, "_") 
      @attempted_chars = []
      @remaining_incorrect_guesses = 5
    end

    def guess_word
      @guess_word
    end 

    def attempted_chars
      @attempted_chars
    end 

    def remaining_incorrect_guesses
      @remaining_incorrect_guesses
    end 

    def already_attempted?(char)
      @attempted_chars.include?(char) ? true : false 
    end   

    def get_matching_indices(char1)
      new_arr = []
        @secret_word.each_char.with_index do |char2, i |
          new_arr << i  if char1 == char2 
        end 
        new_arr
    end 

    def fill_indices(char, arr)
        arr.each { |num| @guess_word[num] = char } 
    end 

    def try_guess(char)
        if self.already_attempted?(char)
            p 'that hash already been attempted'
            @remaining_incorrect_guesses -= 1
            return false 
        else
          attempted_chars << char 
          indices = self.get_matching_indices(char)
              if @secret_word.include?(char)  
                  self.fill_indices(char, indices)
              else 
                @remaining_incorrect_guesses -= 1
              end 
          return true 
        end 
    end 

    def ask_user_for_guess
      p "Enter a char"
      imput = gets.chomp
      try_guess(imput) 
    end

    def win?
      if @guess_word.join("") == @secret_word
        p "WIN"
        return true 
      else 
        return false 
      end 
    end 

    def lose?
      if remaining_incorrect_guesses == 0 
        p "LOSE"
        return true 
      else 
        return false 
      end 
    end 

    def game_over?
      if self.win? || self.lose?
        p @secret_word
        return true 
      else 
        return false 
      end 

    end 
      
end
