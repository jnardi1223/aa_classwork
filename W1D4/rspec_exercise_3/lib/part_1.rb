def is_prime?(num)
    return false  if num < 2 
    (2...num).none? {|n| num % n == 0 }    
end 
require "byebug"
def nth_prime(num)
    i = 1
    primes = []
    #debugger 
    while num > primes.length 
        if is_prime?(i)
            primes << i 
        end
        i += 1 
    end 
    primes[-1]
end 

def prime_range(min, max)
    new_arr = (min..max).select {|num| is_prime?(num)}
end 