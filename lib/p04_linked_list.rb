class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new(rand(9), rand(9))
    @tail = Link.new(rand(9), rand(9))
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next.nil?
  end

  def get(key)
    return nil unless self.include?(key)

    current_link = @head.next

    while true
      if current_link.key != key
        current_link = current_link.next
      else
        return current_link.val
      end
    end
  end

  def include?(key)
    return false if empty?

    current_link = @head.next

    until current_link == @tail
      if current_link.key != key
        current_link = current_link.next
      else
        return true
      end
    end

    return false
  end

  def append(key, val)
    new_link = Link.new(key, val)

    ##Make sure that every new link has pointers that look ahead and
    #behind it. Whenever adding a new link, you have to reset the pointers
    #of the older links. Hence below.

    if empty?
      @head.next = new_link
      new_link.prev = @head

      new_link.next = @tail
      @tail.prev = new_link
    else
      last.next = new_link
      new_link.prev = last

      new_link.next = @tail
      @tail.prev = new_link
    end
  end

  def update(key, val)
    return if self.empty?

    puts "it is included"
    current_link = @head.next


    while current_link.key != key
      puts "current_link's key/val is #{current_link.key}: #{current_link.val}"
      current_link = current_link.next
    end

    current_link.val = val
  end

  def remove(key)
    return unless self.include?(key)

    current_link = @head.next

    while true
      if current_link.key != key
        current_link = current_link.next
      else
        behind_current_link = current_link.prev
        after_current_link = current_link.next

        behind_current_link.next = after_current_link
        after_current_link.prev = behind_current_link

        return
      end
    end
  end

  def each
    current_link = @head.next

    until current_link == @tail

      yield(current_link)

      current_link = current_link.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
