class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    idx = key.hash % num_buckets
    @store[idx] << key 
    @count += 1
    resize! if @count >= @store.length
  end

  def include?(key)
    idx = key.hash % num_buckets
    @store[idx].include?(key)
  end

  def remove(key)
    idx = key.hash % num_buckets
      if include?(key) 
      @store[idx].delete(key)
      @count -= 1
      end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    store2 = Array.new(num_buckets * 2) { Array.new }
      nums = @store.flatten
      @count = 0 
      nums.each do |num|
        idx = num.hash % store2.length
        store2[idx] << num 
        @count += 1
      end 
      @store = store2
  end
end
