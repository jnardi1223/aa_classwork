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


arr = [1,2,2,3,3,3]

p my_uniq(arr)