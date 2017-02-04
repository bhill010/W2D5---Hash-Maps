require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    return false if @store.empty?
    @store.each do |bucket|
      bucket.each do |link|
        return true if link.key == key
      end
    end

    false
  end

  def set(key, val)
    if self.include?(key)
    else
      @store[key.hash % num_buckets].append(key, val)
    end
  end

  def get(key)
    return nil unless self.include?(key)
    @store[key.hash % num_buckets].select {|link| link.key == key }.val
  end

  def delete(key)
  end

  def each
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
