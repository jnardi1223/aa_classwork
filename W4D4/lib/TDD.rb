def my_uniq(arr)
    arr.uniq
end

def two_sum(arr)
    indices = []
    arr.each_with_index do |num1, i1|
        arr.each_with_index do |num2, i2|
            indices << [i1, i2] if num1 + num2 == 0 && i1 < i2 
        end 
    end 
    indices
end 


#my_transpose
def my_transpose(arr)
    arr.transpose
end

# def stock_picker(daily_price)
#     max_diff = 0
#     i=0
#     while i<daily_price.length
#         curr_low = daily_price[i]
#         curr_day = i
#         if max_diff > curr_low
#             # set max_diff to 1st & 2nd day's difference
#             # check if 3rd day & 2nd day's difference > curr_low
#         end
#     end

# end

def stock_picker(daily_price)
    # stock_price = [300,200,100,260,350,320]
    max_diff = 0
    max_indices = []
    (0...daily_price.length).each do |i|
        (i+1...daily_price.length).each do |k|
            if (daily_price[k] - daily_price[i]) > max_diff
                max_diff = (daily_price[k] - daily_price[i])
                max_indices << [i,k]
                # p "max_diff @ #{[i,k]} : #{max_diff}"
                # p "max_indices @ #{[i,k]} : #{max_indices}"
            end
        end
    end
    # p "max_diff #{max_diff}"
    # p "max_indices #{max_indices}"
    return max_indices[-1]
end



# p my_uniq([1, 2, 3])
# p two_sum([-1, 0, 2, -2, 1])
# p stock_picker([300,200,100,260,350,320])

# towers of Hanoi 

# three towers that represent arrays 
# an array of discs 
# board class that initializes 3 towers 

class Towers

    ALPHABET = ("a".."z").to_a

    attr_reader :num_discs, :board, :discs, :first_stack

    def initialize(num_discs)
        @num_discs = num_discs
        @board = Array.new(3){Array.new(num_discs)}
        @discs = ALPHABET[0...num_discs]
        @first_stack = @board.sample 
    end 


    def move
        p "Which stack do you want to move from?"
        input1 = gets.chomp.to_i 
        arr1 = @board[input1]

        p "Which stack would do you want to move to?"
        input2 = gets.chomp.to_i 
        arr2 = @board[input2]

        if ALPHABET.index(arr1[0]) < ALPHABET.index(arr2[0])
            move = arr1.shift 
            arr2.unshift(move)
        end 
    end
    
    def populate
         @discs.each do |disc|
            @first_stack << disc 
        end 
    end 

    def won?
        @board.each do |stack|
            if stack.length == @num_discs && stack.object_id != @first_stack.object_id
                return true 
            else
                return false 
            end
        end 
    end 

end 


# t1 = Towers.new(5)
# p t1.board
# p t1.num_discs
# p t1.populate
# p t1.move