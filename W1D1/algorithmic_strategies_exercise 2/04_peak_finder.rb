# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr)
    new_arr = []
    new_arr << arr[0] if arr[1] < arr[0]
    new_arr << arr[-1] if arr[-1] > arr[-2]

    i = 1 
    while i < arr.length - 1
        if arr[i] > arr[i - 1] && arr[i] > arr[i + 1]
            new_arr << arr[i]
        end 
        i += 1
    end 

    new_arr 

end 
p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]
