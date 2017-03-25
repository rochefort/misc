class Element
  attr_accessor :value, :next_ref

  def initialize(value, next_ref)
    @value = value
    @next_ref = next_ref
  end
end

class List
  def initialize
    @first_element = nil
  end

  def unshift(value)
    element = Element.new(value, @first_element)
    @first_element = element
  end

  def push(value)
    element = Element.new(value, nil)
    if @first_element.nil?
      @first_element = element
    else
      current_element = @first_element
      while (! current_element.next_ref.nil?)
        current_element = current_element.next_ref
      end
      current_element.next_ref = element
    end
  end

  def [](index)
    return nil if index < 0
    return nil if @first_element.nil?
    current_element = @first_element
    current_index = 0
    while (current_index < index)
      return nil if current_element.next_ref.nil?
      current_element = current_element.next_ref
      current_index += 1
    end
    current_element.value
  end

  def each
    current_element = @first_element
    while (! current_element.nil?)
      yield current_element.value
      current_element = current_element.next_ref
    end
  end
end

class HashTable
  BIN_SIZE = 4

  def initialize
    @bins = Array.new(BIN_SIZE) { |i| List.new }
  end

  def set(key, value)
    index = key.hash % BIN_SIZE
    bin = @bins[index]
    bin.each do |pair|
      if pair[0] == key
        pair[1] = value
        return self
      end
    end
    bin.unshift([key, value])
    self
  end

  def get(key)
    index = key.hash % BIN_SIZE
    bin = @bins[index]
    bin.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def each
    @bins.each do |bin|
      bin.each do |pair|
        yield pair[0], pair[1]
      end
    end
  end
end

hash = HashTable.new
hash.set("foo", "bar")
hash.set("hoge", "fuga")
puts "get:"
p hash.get("foo")

puts "each:"
hash.each { |key, value| p "key: #{key}, value: #{value}" }
