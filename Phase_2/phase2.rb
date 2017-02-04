class Array
  def hash
    new_hash = []

    self.each_with_index do |el, i|
      if el.is_a?(Fixnum)
        el = el * i
      else
        el = el.ord * i
      end
      new_hash << el
    end

    new_hash.join("").to_i.hash
  end
end

class String
  def hash
    new_hash = []

    self.split("").each_with_index do |el, i|
      el = el.ord * (i ** 3)
      new_hash << el
    end

    new_hash.join("").to_i.hash
  end
end
