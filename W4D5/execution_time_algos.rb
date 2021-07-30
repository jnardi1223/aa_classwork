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

list = [0, 3, 5, 4, -5, 10, 1, 90]

# p my_min_v1(list)

def my_min_v2(arr)
  min = arr.first # ( +2 )

  arr.each do |num| # ( n )
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

  (0...arr.length).each do |idx1| # ( n )
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
# p largest_contiguous_subsum_v1(list) # => 8

def largest_contiguous_subsum_v2(list)
  largest_sum = list.first
  sum = list.first # but the first element can be a negative number

  (1...list.length).each do |i|
    # a negative number + a postive number always less than pos number on its own
    sum = 0 if sum < 0 # if we add to a negative sum, then result is less than pos number on its own
    sum += list[i]
    largest_sum = sum if largest_sum < sum
  end

  largest_sum
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_v2(list)

# def largest_contiguous_subsum_faster(arr)
#     largest_sum = arr.first # 2 => ( +2 )
#     current_seq = 0 # 2 => 5 => -1 => 5 => 12 (+1)
# ​
#     arr.each do |num| #[2, 3, -6, 7, -6, 7] (n * 6)
#         current_seq = current_seq +  num # ( +3)
#         if largest_sum < current_seq # ( + 3)
#             largest_sum = current_seq # ( +1)
#         end
# ​
#         if current_seq < 0 # if we have a negative number, and we add a negative number ( +1)
#             current_seq = 0 # then we'll get a smaller "more" negative result           ( + 1)
#                             # if we have a negative current/running seq, we should result it to 0 to avoid this.
#         end
# ​
#     end
# ​
#     largest_sum # ( +1)
# end

# Building.select(occupancy).join(Resturants).where( occupancy > 4) <-- raw SQL
# Rails does SQL commands but using Ruby language
