# my_min

def my_min_v1(arr)
    min = nil
    arr.each do |num_1|
        arr_without_ele = arr.dup
        arr_without_ele.delete(num_1)
        min = num_1 if arr_without_ele.all? { |num_2| num_1 < num_2 }
    end
    min
end

# n * (n + n + n * (2 + 2)) + 1 --> O(n^2)

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# p my_min_v1(list)

def my_min_v2(arr)
    min = arr.first # ( +2 )

    arr.each do |num| #( n )
        if num < min # ( +2 )
            min = num # ( +2 )
        end
    end

    min # ( +1 )
end

# for loops its n * number of steps for each iteration
# 2 + (n * (2 + 2)) + 1 --> O(n)

# p my_min_v2(list)

# largest contiguous sub-sum

def largest_contiguous_subsum_v1(arr)
    subs = [] # ( +2 )

    (0...arr.length).each do |idx1| #( n )
        (idx1..arr.length - 1).each do |idx2| # ( n )
            subs << arr[idx1..idx2].sum # ( n * ( 1 +  ))
        end
    end

    subs.max # ( n )
end

# 2 + (n * n * ( n * (1 + 3))) + n --> O(n^3)



# for arrays, innerstion is always O(n)
# subs = [ a, b, c,d,e ,f, g]
# sub[6] we're good
# sub[7] --> nil
# subs[7] = h



list = [5, 3, -7]
p largest_contiguous_subsum_v1(list) # => 8

def largest_contiguous_subsum_v2(list)

end

list = [2, 3, -6, 7, -6, 7]
largest_contiguous_subsum_vs(list)

# 2, 3, -6, 7, -6, 7
# 2,3
# 2,3,-6,7
# 7,-6, 7

# just like substrings
