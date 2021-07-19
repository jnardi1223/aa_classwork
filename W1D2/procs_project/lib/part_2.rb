def reverser(str, &prc)
    prc.call(str.reverse)
end 

def word_changer(str, &prc) 
    new_sent = str.split(' ').map { |word| prc.call(word) }
    new_sent.join(' ')
end

def greater_proc_value(num, prc1, prc2)
    prc1.call(num) > prc2.call(num) ? prc1.call(num) : prc2.call(num)
end 

def and_selector(arr, prc1, prc2)
    new_arr = arr.select {|ele| prc1.call(ele) && prc2.call(ele) }
end 

def alternating_mapper(arr, prc1, prc2)
    new_arr = arr.map.with_index { |ele, i| i.even? ? prc1.call(ele) : prc2.call(ele) }
end 