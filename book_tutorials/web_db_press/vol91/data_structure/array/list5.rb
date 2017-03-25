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
    @keys = List.new
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

list = List.new
list.unshift(4)
list.unshift(3)
list.unshift(2)
list.unshift(1)
list.push(5)

puts "each:"
list.each { |value| p value }

puts "[]:"
0.upto(4).each { |i| p list[i] }
p list[-1]
p list[5]
p List.new[0]
