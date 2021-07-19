def my_map(arr, &prc)
    new_arr = []
    arr.each {|num| new_arr << prc.call(num)}
    new_arr
end 

def my_select(arr, &prc)
    new_arr = []
    arr.each { |ele| new_arr << ele if prc.call(ele) }
    new_arr 
end 

def my_count(arr, &prc)
    count = 0
    arr.each {|ele| count += 1 if prc.call(ele) }
    count 
end

def my_any?(arr, &prc)
    arr.each do |ele|
        if prc.call(ele)
            return true 
        end 
    end 
    false 
end 

def my_all?(arr, &prc)
    arr.each do |ele|
        if !prc.call(ele)
            return false
        end 
    end 
    true
end 


def my_none?(arr, &prc)
    arr.each do |ele|
        if prc.call(ele)
            return false
        end 
    end 
    true  
end 