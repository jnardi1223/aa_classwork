def proper_factors(num)
    new_arr = (1...num).select {|n| n if n < num && num % n == 0}
end

def aliquot_sum(num)
    proper_factors(num).sum
end 

def perfect_number?(num)
    aliquot_sum(num) == num 
end 

def ideal_numbers(num)
    new_arr = []
    i = 1
    while num > new_arr.length 
        new_arr << i if perfect_number?(i)
        i += 1 
    end 
    new_arr
end 