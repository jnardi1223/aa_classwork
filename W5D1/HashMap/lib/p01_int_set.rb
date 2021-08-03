class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false) 
  end

  def insert(num)
    raise "Out of bounds" if !is_valid?(num) 
    @store[num] = true 
  end

  def remove(num)
    @store[num] = false 
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    return true if num > 0 && num < @store.length 
    false 
  end

  def validate!(num)
  end
end


#buckets group by the mod%20
class IntSet
  def initialize(num_buckets = 20)
    #@store = [[],[],[],[],[],[],[],[],[],[],...]
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    idx = num % num_buckets
    self[idx] << num
  end

  def remove(num)
    idx = num % num_buckets
    self[idx].delete(num)
  end

  def include?(num)
    idx = num % num_buckets
    self[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  #n = elements
  #k = buckets
  #best case: O(1)
  #worst cast: O(n)
  #[1][1][1][1][1][1][1][1][1][1][1][1][1][1][1][1][1][1][1][1]
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    idx = num % num_buckets
    if !@store[idx].include?(num)
      @store[idx] << num
      @count += 1
    end
    resize! if num_buckets <= @count
  end

  def remove(num)
    idx = num % num_buckets
    if @store[idx].include?(num)
      self[idx].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    idx = num % num_buckets
    self[idx].include?(num)
  end

  private

  def [](num)
    @store[num]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  #@store = Array.new(num_buckets) { Array.new }
  def resize!
      store2 = Array.new(num_buckets*2) { Array.new }
      nums = @store.flatten#40
      @count = 0
      nums.each do |num|
        idx = num % store2.length 
        if !store2[idx].include?(num)
          store2[idx] << num
          @count += 1
        end
      end
      @store = store2
  end
end
