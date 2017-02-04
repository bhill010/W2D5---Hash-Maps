require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count + 1 > @store.length
      resize!
    end
    self[num] << num
    @count += 1
  end

  def remove(num)
    if self.include?(num)
      @count -= 1
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(2 * @store.length) { [] }

    @store.flatten.each do |ele|
      new_store[ele % new_store.length] << ele
    end
    @store = new_store
  end
end
