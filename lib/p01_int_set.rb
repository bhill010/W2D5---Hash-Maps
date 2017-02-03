class MaxIntSet
  attr_accessor :store, :max
  def initialize(max)
    @store = Array.new(max) { false }
    @max = max
  end

  def insert(num)
    if num > @max || num < 0
      raise "Out of bounds"
    else
      @store[num] = true
    end
  end

  def remove(num)
    if num > max
      raise "Input not within array"
    else
      @store[num] = false
    end
  end

  def include?(num)
    num < max && @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
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
    @store[num % num_buckets]
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

if __FILE__ == $PROGRAM_NAME
  a = ResizingIntSet.new
end
