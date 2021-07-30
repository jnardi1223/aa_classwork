#my_min

def my_min(arr)
    largest = nil 
    arr.each do |ele|
        arr_without_ele = arr.dup
        arr_without_ele.delete(ele)
        largest = ele if arr_without_ele.all? { |num_2| ele < num_2 }
    end 
    largest
end

n * (n + n + n * (2 + 2)) + 1 



list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

p my_min(list)

# largest == nil ||