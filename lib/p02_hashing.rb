class Array
  def hash
    new_hash = []

    self.each_with_index do |el, i|
      if el.is_a?(Fixnum)
        el = el * i
      elsif el == []
        el = i * i + 55 - 38
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

class Hash
  def hash
    new_hash = []

    self.each do |key, value|
      key = key.to_s.ord * 2
      new_hash << key

      if value.is_a?(Fixnum)
        value = value * 2
      else
        value = value.ord * 2
      end
      new_hash << value
    end

    new_hash.sort.join("").to_i.hash
  end
end

if __FILE__ == $PROGRAM_NAME

end
