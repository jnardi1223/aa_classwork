def my_reject(arr, &prc)
    new_arr = arr.select {|ele| !prc.call(ele)}
end 

def my_one?(arr, &prc)
   arr.count {|ele| prc.call(ele) } == 1 
end 

def hash_select(hash, &prc)
    new_hash = {}
    hash.each { |k, v| new_hash[k] = v if prc.call(k, v) }
    new_hash 
end 

def xor_select(arr, prc1, prc2)
    new_arr = arr.select { |ele| ele if (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele)) }
end 

def proc_count(num, arr)
    arr.count {|prc| prc.call(num)}
end 