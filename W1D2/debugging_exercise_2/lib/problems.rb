# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    divisors = (1..num).select { |n| n if num % n == 0 && prime?(n) }
    divisors[-1]
end 

def prime?(num)
    return false if num < 2 
    (2...num).each { |factor| return false if num % factor == 0 }
    true 
end 

def unique_chars?(str)
    str.each_char.with_index do |char1, idx1|
        str.each_char.with_index do |char2, idx2|
            if char1 == char2 && idx1 != idx2
                return false 
            end 
        end 
    end 
    true 
end

def dupe_indices(arr)
    hash = Hash.new {|h, k| h[k] = [] }
    arr.each_with_index {|ele, i| hash[ele] << i }
    hash.delete_if {|k, v| v.length < 2}
    hash

end

def ana_array(arr1, arr2)
   hash_1 = Hash.new(0)
   hash_2 = Hash.new(0)

   arr1.each {|ele| hash_1[ele] += 1}
   arr2.each {|ele| hash_2[ele] += 1}

   return false if hash_1 != hash_2
   true 
end 