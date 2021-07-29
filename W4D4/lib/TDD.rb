

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


# my_uniq([[1, 2, 1, 3, 3]])
# two_sum([-1, 0, 2, -2, 1])