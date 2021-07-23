#using the phone book example, we keep splitting the phone book down the middle. If the name is in the first half, we then split that half. If in
# the second half we split that. Until we find the right name 

#here we take in  a nums_arr and a target. We are going to split the nums_arr down the middle and go to the right side and continue to split
# until we find the target 

def bsearch(nums_arr, target)
    return nil if nums_arr.empty? #if the array is empty it means we have found the target 

    mid_idx = nums_arr.length / 2 #halfway is equal to the length divided by two. Even if odd number bc 5/2 == 2 in ruby
    
    return mid_idx if nums_arr[mid_idx] == target #return the middle index if the the middle index == target 
    
    left = nums_arr.take(mid_idx)   #.take will take everything from before the index given. [1, 2, 3, 4].take[2] == [1, 2] 
    right =  nums_arr.drop(mid_idx + 1) #.drop will drop everything from before the index. We need to do mid_idx plus one becasue we don't want the actual middle index 
    
        if nums_arr[mid_idx] > target #if the middle index is greater than target
            bsearch(left, target) #pass the left side of the array back into the method with the same target 
        else
            sub_result = bsearch(right, target)
            sub_result.nil? nil : sub_result + (mid_idx + 1)
        end

  end


def bseach(arr, target)
   return nil if arr.empty? 

   mid_idx = arr.lenght/ 2 

   return mid_idx if arr[idx] == target 

   left = arr.take(mid_idx)
   right = arr.drop(mid_idx + 1)

   if arr[mid_idx] > target 
    bseach(right, targe)
   else 
    sub_result = bseach(left, target)
    sub_result.nil? nil : sub_result + (mid_idx + 1)
   end 


end 

class Array
    def merge_sort
      return self if count < 2
  
      middle = count / 2
  
      left, right = self.take(middle), self.drop(middle)
      sorted_left, sorted_right = left.merge_sort, right.merge_sort
  
      merge(sorted_left, sorted_right)
    end
  
    def merge(left, right)
      merged_array = []
      until left.empty? || right.empty?
        merged_array << (left.first < right.first) ? left.shift : right.shift
      end
  
      merged_array + left + right
    end
  end

  class Array

    def merge_sort
        return self if count < 2 

        middle = count / 2

        left, right = self.take[middle], self.drop[middle]
        sorted_left, sorted_right = left.merge_sort, right.merge_sort

        merge(sorted_left, sorted_right)
    end 

    def merge(left, right)
        merged_arr = []
        until left.empty? || right.empty?
            merged_arr << (left.first < right.first) ? left.shift : right.shift
        end 

        merged_arr + left + right 
    end 
end 