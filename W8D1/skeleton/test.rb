def my_uniq(arr)
    new_arr = []

    i = 0 
    while i < arr.length 
        if new_arr.index(arr[i]) == nil 
             new_arr << arr[i]
        end 
        i += 1
    end 

    new_arr 
end 

# arr = [1,2,2,3,3,3]
# p my_uniq(arr)

def twosum(arr2)
    new_arr = []
    arr2.each.with_index do |el1, idx1|
        arr2.each.with_index do |el2, idx2|
            if arr2[idx1] + arr2[idx2] == 0 && idx1 < idx2
                new_arr << [idx1, idx2]
            end
        end
    end
    return new_arr
end

arr2 = [1,2,-2,3,-3]
p twosum(arr2)

def twosum(arr2)
    new_arr = []
    i = 0
    j = 0
    while i < self.length
        while j < self.length
            self[i]
            j += 1
        end
        i += 1
    end

    return new_arr
end
